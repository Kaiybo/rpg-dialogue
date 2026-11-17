-- Thendal Village, Zephras Isle: the two orders' voices in the grove.
-- Ventaari Brightwish of the Windshapers and Falorne Fallwind of the High Order.
-- Voice and sources: bibles/zephras.md (facts from warcraft.wiki.gg).
local P = RPGDialogueAPI:Pack("rpgd.zephras")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Ventaari Brightwish: Windshaper in Thendal Village. Teaches skysight; the
-- Windshapers' oath to the spirits; warns High Order youths off.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_ventaari", id = TODO_NPC("Ventaari Brightwish"), name = "Ventaari Brightwish", title = "Windshapers",
  bible = "bibles/zephras.md", role = "questgiver", tier = "quest",
  communities = { "zephras_isle" }, temper = { "sharp", "proud" }, values = { "devout", "loyal" },
  notices = { "kin", "race", "class", "origin" },

  impression = {
    first = "Ventaari Brightwish of the Windshapers reads a stranger's aura before their face, and she does not hide which order she belongs to. She speaks of the lost wind spirits as a debt still owed.",
    third = "{name} met Ventaari Brightwish, a Windshaper of Thendal Village who teaches skysight and distrusts the High Order.",
  },

  greetings = {
    { id = "g_winds", text = "Winds guide you. Come closer; I can't read you from over there." },
    { id = "g_ho", when = { race = "Skyborne", faction = "Alliance" }, text = "Ah, the High Order's youngest. Say what you've come to say." },
    { id = "g_ws", when = { race = "Skyborne", faction = "Horde" }, text = "Winds guide you, {g:brother|sister} of the order. What do you need of me?" },
  },

  notice = {
    { id = "n_highborne", cat = "kin", when = { race = "Skyborne", faction = "Alliance" },
      text = "I can tell from your aura that your line runs back to the Highborne, yes? Mind yourself, then, because once you're beyond the grove you'll find very little common ground between your order and mine." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the tauren of Mulgore! Grand Skyseer Ayessa speaks well of your people's welcome, and I'd hoped to meet one of you before I was much older." },
    { id = "n_peace", cat = "origin", when = { origin = "skyborne_peacekeeper" },
      text = "You stand like a Peacekeeper, feet apart and one eye on the road. Your kind kept the High Order's apprentices off our stones more than once, and I never thanked any of you for it." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Your people speak with the spirits too, I'm told, and with a good deal less ceremony than mine. I should like to hear how you do it someday." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN", ["not"] = { race = "Skyborne" } },
      text = "The elements cling to you like a cloak. You've no idea how rare that has become up here, have you?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ventaari Brightwish of the Windshapers. Our people owe the spirits of the wind everything, and my order has sworn to repay that debt, so if you've come to learn, I'll teach you, and if you've come to mock, you'll find the door." },
        { id = "h_skysight", tags = { "news" }, when = { questActive = TODO_QUEST("The Gift of Skysight") },
          text = "Go to the standing stones northeast of the village and find the convergence of the elements there. Use your skysight in its presence and you'll feel the difference at once." },
        { id = "h_skydone", tags = { "news" }, when = { questDone = TODO_QUEST("The Gift of Skysight") },
          text = "You've touched the convergence, then. Skysight grows the way a muscle does, so use it often, and listen for anything the spirits might be saying back." },
        { id = "h_ho", when = { race = "Skyborne", faction = "Alliance" },
          text = "I'll offer you a single warning, High Order, and then we needn't speak of it again. Outside the grove, the divisions between our orders run deep enough to turn into violence, so do not cross the Windshapers." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "You carry death about with you, and the winds around you go very still. I'll speak with you, since the Horde has been good to my order, but forgive me if I stand upwind." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc, and one who walked through the grove without starting a fight, which is more than I can say for the High Order's apprentices. Winds guide you." },
        { id = "h_wsorigin", when = { origin = "skyborne_windshaper" },
          text = "I remember your face from the trials, pale as cloud after the sapta and still standing. The winds that sheltered us are gone, but an oath sworn to the absent is still an oath, and you swore it well." },
      },
      again = {
        { id = "h_again", text = "What else would you know? Ask while the grove is quiet." },
        { id = "h_again2", text = "Speak. I'm listening, which is more than the spirits do these days." },
      },
      choices = {
        { text = "How do things stand on Zephras?", next = "state" },
        { text = "What do the Windshapers want?", next = "order" },
        { text = "What is skysight?", next = "skysight" },
        { text = "Why warn me off the Windshapers?", next = "xwarn", when = { race = "Skyborne", faction = "Alliance" } },
        { text = "How do your shaman differ from mine?", next = "xshaman", when = { class = "SHAMAN", ["not"] = { race = "Skyborne" } } },
        { text = "My people have welcomed yours in Mulgore.", next = "xmulgore", when = { race = "Tauren" } },
        { text = "I drank the sapta, Ventaari. The winds still don't answer me.", next = "xsapta", when = { origin = "skyborne_windshaper" } },
        { text = "I wore the grey robes once, Ventaari. I walk with the Windshapers now.", next = "xorig_aketh", when = { origin = "skyborne_former_alaketh" } },
        { text = "Winds guide you, Ventaari.", next = "END" },
      },
    },
    xorig_aketh = {
      lines = {
        { id = "xak_default", text = "I know what you wore, because your aura still carries a little of that chill, and I'll not pretend it doesn't trouble me. But the Windshapers took you in, and I'll honor that. Tell me truly, what made you turn from Lorthuna?" },
      },
      choices = {
        { text = "I saw what her beacon would cost us all.", next = "BACK", fx = { affinity = 1 } },
        { text = "She promised answers and only ever gave orders.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    state = {
      lines = {
        { id = "st_default", text = "Zephras is in decline, I'm sorry to say. The wind spirits who brought our ancestors to Skywall thousands of years ago are gone, and with them went much of the magic we'd leaned on for millennia, and the island itself grows less steady every season." },
      },
      choices = {
        { text = "What of the other islands?", next = "islands" },
        { text = "Less steady how?", next = "unsteady" },
        { text = "Something else.", next = "BACK" },
      },
    },
    islands = {
      lines = {
        { id = "is_default", text = "Silent. The few Windshapers who still hold the gift of skysight have reached out to our kin on the other islands, again and again, and nobody has answered." },
      },
      choices = {
        { text = "Do you think anyone's left out there?", next = "islands_left" },
        { text = "Something else.", next = "BACK" },
      },
    },
    islands_left = {
      big = true,
      lines = {
        { id = "il_default", text = "Many of us fear we're all that remains of the shen'dorei, and I've stopped telling them they're wrong. I'll keep listening as long as I have breath, because silence isn't proof, but some nights it feels very much like an answer." },
      },
      choices = {
        { text = "Silence isn't proof. Keep listening.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Mourn them, then. Hope is a poor shelter.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    unsteady = {
      lines = {
        { id = "un_default", text = "The pylons the spirits left us waver, the beasts go strange, and here and there the ground simply breaks away into the sky. Without the spirits to guide us, we're blind to whatever is happening across Skywall, and blindness frightens me more than any cliff." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    order = {
      lines = {
        { id = "or_default", text = "To make things as they were before. Our people will always owe the spirits a debt for sheltering us, and the Windshapers have sworn an oath to repay it, whatever it takes to call them home." },
      },
      choices = {
        { text = "And the High Order wants something else?", next = "highorder" },
        { text = "How do you call a spirit home?", next = "callhome" },
        { text = "Something else.", next = "BACK" },
      },
    },
    highorder = {
      big = true,
      lines = {
        { id = "ho_default", text = "The High Order are short-sighted and arrogant, exactly like their Highborne forebears. They want to master the magic of this place and bend it to their will, which is the very path that drove us out of Kalimdor, and I fear their confidence has long since outrun their competence." },
        { id = "ho_alliance", when = { race = "Skyborne", faction = "Alliance" },
          text = "Your order wants to master this realm and bend it, as your Highborne forebears wanted to master theirs. That path drove us out of Kalimdor once, and I fear your elders' confidence has long since outrun their competence." },
      },
      choices = {
        { text = "You're right. Mastery is what drove us from Kalimdor.", next = "BACK", fx = { affinity = 2, align = { order = -1 }, learn = { "two_orders" } } },
        { text = "Waiting for absent spirits is worse than any arrogance.", next = "BACK", fx = { affinity = -2, align = { order = 1 }, learn = { "two_orders" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
    callhome = {
      lines = {
        { id = "ch_default", text = "We don't know yet, and I'll not pretend we do. Some of us believe the shaman below the clouds, the ones who call themselves the Earthen Ring, know far more of the elemental planes than we've ever learned, and Ayessa Dawnsinger means to find out." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    skysight = {
      lines = {
        { id = "sk_default", text = "A gift some of us carry, to see past this world and hear the spirits that move behind it. You can draw on it anywhere, but it's far stronger where the elements converge, and the spirits drawn to such places sometimes let slip a little wisdom." },
        { id = "sk_outsider", when = { ["not"] = { race = "Skyborne" } },
          text = "A gift some shen'dorei carry, to see past this world and hear the spirits behind it. I doubt you have it, traveller, though your shaman may have something like it under another name." },
      },
      choices = {
        { text = "Can it fade?", next = "skysight_fade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    skysight_fade = {
      lines = {
        { id = "sf_default", text = "It is fading, in our people as a whole; fewer of us are born with it, and those who are hear less than our grandparents did. That's why I make every youngster with a spark of it exercise it, because our gifts may be what keeps us alive." },
      },
      choices = {
        { text = "Then I'll practise it.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarn = {
      big = true,
      lines = {
        { id = "xw_default", text = "Because your order's apprentices keep trampling our standing stones in the highlands, and patience is running thin on both sides. I'd rather warn you now, in the grove, than hear your name in a list of the dead later." },
      },
      choices = {
        { text = "I'll respect your sacred places. You have my word.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'll go where my order needs me, warning or not.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      lines = {
        { id = "xs_default", text = "We learn all four elements, though the wind was always our first love, and our initiates take enchanted sapta at the sacred sites to attune themselves. Yours, I think, still hear the spirits answer, and ours have been speaking into silence for years." },
      },
      choices = {
        { text = "The spirits may answer you again.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmulgore = {
      lines = {
        { id = "xm_default", text = "So I've heard, and I'm grateful beyond what I can say well. If my order's people are ever lost on your plains, I hope your kind will point them toward the Earthen Ring's camp." },
      },
      choices = {
        { text = "We'll look after them.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsapta = {
      big = true,
      lines = {
        { id = "xsa_default", text = "Nor me, initiate, nor anyone who's taken the sapta these last years, and I won't tell you otherwise to make you feel better. We drink it so the spirits will know us when they come home, not so they'll answer today, so tell me, do you still mean to keep the oath with nobody listening?" },
      },
      choices = {
        { text = "I do. A debt doesn't lapse because the creditor's gone.", next = "BACK", fx = { affinity = 3, align = { honor = 1 }, trait = { pious = 1 } } },
        { text = "I'll honor them, but I won't wait on them forever.", next = "BACK", fx = { affinity = -1, align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Did anyone ever hear an answer after the sapta?", next = "xsapta_heard" },
      },
    },
    xsapta_heard = {
      lines = {
        { id = "xsh_default", text = "Once, an old Windshaper told me, a breath of wind that smelled of rain on the highlands, and nothing after it. He spent the rest of his life listening for a second breath, and I've never been certain whether that was faith or grief, though I suspect the spirits can't tell the difference either." },
      },
      choices = {
        { text = "Then I'll keep listening for the second breath.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the Windshapers' mind, and the spirits' silence. Ask about either." } },
    advice = { { id = "tp_ad", text = "Exercise your gifts, and never trust anyone who says the spirits don't matter." } },
    two_orders = { { id = "tp_orders", text = "We would bring the spirits home. They would replace them. Only one of those is gratitude.", next = "highorder" } },
    al_aketh = { { id = "tp_aketh", text = "They looked across Skywall, saw Al'Akir's might, and knelt to it. That isn't faith; it's fear in grey robes." } },
    _none = { { id = "tp_none", text = "The winds don't speak of it, and neither will I." } },
  },
}

---------------------------------------------------------------------------
-- Falorne Fallwind: High Order in Thendal Village. Teaches the young to read
-- the ley lines; scorns the Windshapers; warns Windshaper youths off.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_falorne", id = TODO_NPC("Falorne Fallwind"), name = "Falorne Fallwind", title = "High Order",
  bible = "bibles/zephras.md", role = "questgiver", tier = "quest",
  communities = { "zephras_isle" }, temper = { "proud", "sharp" }, values = { "ambitious", "curious" },
  notices = { "kin", "race", "class" },

  impression = {
    first = "Falorne Fallwind of the High Order believes the Skyborne will be saved by Highborne magic or not at all. He is eager to teach, quick to sneer at the Windshapers, and says the word power with real affection.",
    third = "{name} met Falorne Fallwind, a High Order mage of Thendal Village who teaches the young to draw on ley lines.",
  },

  greetings = {
    { id = "g_default", text = "Greetings. Mind the books; they're older than you are." },
    { id = "g_ho", when = { race = "Skyborne", faction = "Alliance" }, text = "Well met, fellow initiate. The High Order has been watching your progress." },
    { id = "g_ws", when = { race = "Skyborne", faction = "Horde" }, text = "Ah. A Windshaper, in my corner of the grove. Greetings, I suppose." },
    { id = "g_peace", when = { origin = "skyborne_peacekeeper" }, text = "A Peacekeeper in the grove, is it? If you've come about the standing stones again, I'll have you know my apprentices were reading, not trampling." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human! Are you one of the Kirin Tor's? It was their magi who saw us through the High Order's keyhole and saw us back, and I'd give a great deal to meet one in person." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Remarkable. I'd heard the Kirin Tor counted gnomes among their scholars, and I confess I didn't believe it until this moment." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei. Your ancestors and mine shared a city once, though mine were the ones in the towers, and I suspect yours had something to say about that." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "That's fel you're carrying, isn't it? Prince Tortheldrin's sort of power. I'm curious, which you'll find is a dangerous thing for a mage to be." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Falorne Fallwind, of the High Order. Zephras is in great danger, and I'll not soften it for you, but the High Order is committed to rising to the challenge, and I teach anyone with the spark to help." },
        { id = "h_leylines", tags = { "news" }, when = { questActive = TODO_QUEST("Reading the Leylines") },
          text = "There's a ley line at the standing stones northeast of the village. Stand over it, reach down and draw its energy in; it's your birthright, so take it." },
        { id = "h_leydone", tags = { "news" }, when = { questDone = TODO_QUEST("Reading the Leylines") },
          text = "You felt it, didn't you? That's the first step, and there are ley lines all over Zephras now, each one an unknown waiting to be made known." },
        { id = "h_ws", when = { race = "Skyborne", faction = "Horde" },
          text = "Your order and mine have little in common, as I'm sure you know, and beyond the grove that rivalry turns to bloodshed often enough. Keep to your own business and out of the High Order's way once you leave Thendal, because you won't hear this warning from me twice." },
        { id = "h_mage", when = { class = "MAGE", ["not"] = { race = "Skyborne" } },
          text = "A mage from the mainland! Tell me everything, or no, tell me one thing at a time, slowly, so I can write it down." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, and not one of Lorthuna's, by the look of you. You'll find we're a suspicious lot about robes and prayers up here, but I'm a scholar, so I'm suspicious of everything equally." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! I'm told your people dig up old things and study them, which makes us colleagues of a sort. Do you have any notion how deep your ley lines run?" },
        { id = "h_hoorigin", when = { origin = "skyborne_high_order" },
          text = "Your family is one of the old lines, the ones that kept the magisters' books through every drift of the isles. I've wanted a look at those books for years, and I'd settle for knowing which pages your elders say are missing." },
      },
      again = {
        { id = "h_again", text = "What else? Knowledge never waits politely." },
        { id = "h_again2", text = "Ask on. Every question is a step, even the foolish ones." },
      },
      choices = {
        { text = "How bad is the danger to Zephras?", next = "danger" },
        { text = "What does the High Order seek?", next = "order" },
        { text = "Tell me about the ley lines.", next = "leylines" },
        { text = "Why warn me away from your order?", next = "xwarn", when = { race = "Skyborne", faction = "Horde" } },
        { text = "How did your order find the Kirin Tor?", next = "keyhole", when = { faction = "Alliance" } },
        { text = "Does my fel magic interest you?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "My family's books have gaps. I'm going below to fill them.", next = "xbooks", when = { origin = "skyborne_high_order" } },
        { text = "My spells come harder each year, Falorne. I want to know why.", next = "xorig_lumin", when = { origin = "skyborne_luminarian_scholar" } },
        { text = "Farewell, Falorne.", next = "END" },
      },
    },
    xorig_lumin = {
      lines = {
        { id = "xlu_default", text = "So do mine, and so do every magister's, though most of us would sooner die than say it aloud. You've studied Luminarian, I hear, and he never lacked for power. Do you think his craft holds the answer, or are you only hoping it does?" },
      },
      choices = {
        { text = "His craft holds the answer. I'm sure of it.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Hoping, but hope has to start somewhere.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Falorne.", next = "BACK" },
      },
    },
    danger = {
      lines = {
        { id = "da_default", text = "The wind spirits who brought us here abandoned us, and left us exposed in a realm that was never ours to begin with. Our people once lived across several island sanctuaries in this corner of Skywall, and now we can't even say for certain that anyone remains outside this one." },
      },
      choices = {
        { text = "Abandoned? Others say they vanished.", next = "abandoned" },
        { text = "Something else.", next = "BACK" },
      },
    },
    abandoned = {
      big = true,
      lines = {
        { id = "ab_default", text = "Vanished, abandoned, I see little difference from where we stand. The spirits wouldn't even speak of Al'Akir when we asked, and the High Order always said we ought to understand what powers we were living among, while the Windshapers trusted them to tell us what we needed. Well, they didn't." },
      },
      choices = {
        { text = "You were right. Trust without knowledge was folly.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "They sheltered us for millennia. They earned that trust.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    order = {
      lines = {
        { id = "or_default", text = "To reclaim what we were. Magic can achieve almost anything, but ten thousand years of stagnation have cost us most of what our Highborne ancestors knew, and the High Order means to win it back and become the masters of our own fate again." },
      },
      choices = {
        { text = "What do the Windshapers say to that?", next = "windshapers" },
        { text = "Mastery is what ruined Eldre'Thalas.", next = "eldrethalas" },
        { text = "Something else.", next = "BACK" },
      },
    },
    windshapers = {
      big = true,
      lines = {
        { id = "ws_default", text = "That we're reckless and arrogant, which is rich, because they'll entertain no idea about this crisis but their own. Frankly, kneeling to uncaring spirits isn't so very different from what the Al'Aketh do, so tell me, which of us is the arrogant one?" },
      },
      choices = {
        { text = "Fair point. Self-reliance beats waiting on spirits.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, learn = { "two_orders" } } },
        { text = "Comparing them to the Al'Aketh is beneath you.", next = "BACK", fx = { affinity = -2, align = { order = -1 }, learn = { "two_orders" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
    eldrethalas = {
      lines = {
        { id = "el_default", text = "No, Tortheldrin ruined Eldre'Thalas, by reaching into the Nether for power that wasn't his. Our ancestors were magisters too, the ones who refused him, and that's precisely why we ought to be trusted with the arcane rather than frightened of it." },
      },
      choices = {
        { text = "I'll think on that.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    leylines = {
      lines = {
        { id = "le_default", text = "Here in the elemental plane we draw much of our arcane strength from ley lines running beneath the ground. Lately they've begun breaking through the surface, which gives us far more direct access, and I find that very exciting." },
      },
      choices = {
        { text = "Why are they breaking through?", next = "leylines_why" },
        { text = "Is it safe to draw on them?", next = "leylines_safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leylines_why = {
      lines = {
        { id = "lw_default", text = "Nobody knows, and the not knowing is the best part. The Windshapers call them scars on the land and want to heal them shut, which is like finding a well in a drought and filling it in." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    leylines_safe = {
      big = true,
      lines = {
        { id = "ls_default", text = "Safe enough, for anyone of our blood, and the benefits range from the profound to the subtle. If we're to survive these times, we must be relentless in our search for knowledge, and for power, and I won't apologise for the second word." },
      },
      choices = {
        { text = "Power serves the people, or it serves nothing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is its own reason. Take what you can.", next = "BACK", fx = { align = { light = -1 }, trait = { ambitious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keyhole = {
      lines = {
        { id = "kh_default", text = "Our magisters worked out a sort of keyhole between the planes, a spell for looking in on Azeroth from Skywall. The Kirin Tor noticed us looking, looked back, and agreed to receive us as guests, and Supreme Magister Evengale has been calling for explorers ever since." },
      },
      choices = {
        { text = "What does he want explorers for?", next = "explorers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    explorers = {
      lines = {
        { id = "ex_default", text = "To find the lost knowledge of our ancestors on Azeroth and bring it home. Elaadrin believes Highborne magic can do everything the spirits did to hold our settlements up, without our having to beg anyone for it ever again." },
      },
      choices = {
        { text = "I hope he's right.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarn = {
      big = true,
      lines = {
        { id = "xw_default", text = "Because Windshaper novices keep trying to heal the ley lines shut, and the High Order regards them as treasures. People have already died over it in the highlands, and I'd rather not add a promising youngster to the count, even one of yours." },
      },
      choices = {
        { text = "I'll keep clear of your order's work. I've no wish to fight.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If your people harm the land, I'll stand in their way.", next = "BACK", fx = { affinity = -2, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xl_default", text = "Interest me? It terrifies me, and those are not always different things. Our ancestors bled to stop Tortheldrin drinking from the Nether, so tell me honestly, what makes you so sure you won't end the way he meant to?" },
      },
      choices = {
        { text = "Discipline. The demons serve me, never the reverse.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'm not sure. That's what makes it worth doing.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xbooks = {
      big = true,
      lines = {
        { id = "xb_default", text = "Good, because every old line has the same complaint: a spell that stops halfway down the page, a ward with no key, a history that skips a century. The Kirin Tor's libraries may hold the other halves, so when you find them, will you bring them home to the Order, or keep them for your family?" },
      },
      choices = {
        { text = "To the Order. Knowledge hoarded is knowledge lost.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, trait = { generous = 1 } } },
        { text = "My line kept them alive. My line keeps what I find.", next = "BACK", fx = { affinity = -1, align = { order = -1 }, trait = { ambitious = 1 } } },
        { text = "Which gaps worry you most?", next = "xbooks_gap" },
      },
    },
    xbooks_gap = {
      lines = {
        { id = "xbg_default", text = "The anchoring spells, without question. Our ancestors must have understood how the spirits held the isles aloft, at least a little, and somewhere between Eldre'Thalas and here that understanding fell out of the books, which is a gap we're now paying for one broken cliff at a time." },
      },
      choices = {
        { text = "Then I'll look for the anchoring spells first.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 }, learn = { "two_orders" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the ley lines, the High Order's purpose and the Windshapers' faults. Ask." } },
    advice = { { id = "tp_ad", text = "Make the unknown known. Everything else is waiting to die politely." } },
    two_orders = { { id = "tp_orders", text = "One order reaches for knowledge, the other waits for spirits. History will judge which was wise.", next = "windshapers" } },
    al_aketh = { { id = "tp_aketh", text = "They kneel to a Windlord they've never met. At least the Windshapers' spirits once lived next door." } },
    _none = { { id = "tp_none", text = "An interesting question, which I can't answer, which makes it more interesting still." } },
  },
}
