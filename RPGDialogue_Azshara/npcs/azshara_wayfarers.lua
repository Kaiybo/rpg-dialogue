-- Strangers at the edges of Azshara: Joy Ar'nareth and Rayan Dawnrisen (high elves at the top of Xylem's Tower)
-- and Gatekeeper Rageroar (the Timbermaw who watches the mountain tunnel's Azshara mouth).
-- Voice: bibles/azshara_wayfarers.md
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Joy Ar'nareth
---------------------------------------------------------------------------
P:NPC {
  key = "joy_arnareth", id = TODO_NPC("Joy Ar'nareth"), name = "Joy Ar'nareth",
  bible = "bibles/azshara_wayfarers.md", role = "scholar", tier = "service",
  communities = { "xylems_tower" }, temper = { "proud", "sharp" }, values = { "curious", "proud" },
  notices = { "nightelf" },

  impression = {
    first = "Joy Ar'nareth is a high elf at the top of Xylem's Tower, studying the Highborne ruins of Azshara with an eagerness she tries hard to hide. She has opinions on everything and shares them freely.",
    third = "{name} met Joy Ar'nareth, a high elf scholar at the top of Xylem's Tower.",
  },

  greetings = {
    { id = "g_default", text = "Oh. You came up. The Archmage doesn't usually let visitors past Sanath." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Mind the books, they're older than your kingdom." },
  },

  notice = {
    { id = "n_ne", cat = "nightelf", when = { race = "NightElf" },
      text = "A kaldorei. Your people and mine haven't been on speaking terms for ten thousand years, so I'll try to be polite if you will." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Joy Ar'nareth, of Quel'Thalas, and I'm here because Azshara is the only place in the world where you can walk through what our ancestors built before they left these shores. Rayan and I came to study under the Archmage, or at least near him; he rarely notices we're here." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage! Then you'll understand why I put up with this drafty tower. The Highborne worked magic here that the Kirin Tor can't even describe, and some of it is still humming in the stones." },
      },
      again = { { id = "h_again", text = "Something else? I've notes to finish before the light goes." } },
      choices = {
        { text = "Your ancestors lived here?", next = "ancestors" },
        { text = "What's Archmage Xylem like to study under?", next = "xylem" },
        { text = "Who's Rayan?", next = "rayan" },
        { text = "Goodbye.", next = "END" },
      },
    },
    ancestors = {
      big = true,
      lines = { { id = "an_default", text = "Before they crossed the sea to found Quel'Thalas, yes. The kaldorei call them exiles and the Highborne call them fools, and I call them the reason I exist. Some of my people would rather forget this place, and I think forgetting is how you lose things." } },
      choices = {
        { text = "Some history is best left buried.", next = "BACK", reply = "Spoken like a kaldorei, and I've heard it a hundred times. My ancestors were buried quite enough by everyone else, thank you.", fx = { align = { order = 1 } } },
        { text = "Dig it all up. Knowledge belongs to everyone.", next = "BACK", reply = "At last, someone with sense, and you're not even one of us. I'll dig, and I'll write it all down, and Quel'Thalas can thank me later.", fx = { align = { order = -1 }, learn = { "highborne" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xylem = {
      lines = { { id = "xy_default", text = "Brilliant, vain and very busy, which is the usual combination for an archmage. He lets us use his library and his tower, and in return we keep quiet and occasionally carry things, and I've learned more in a season here than in ten years at home." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "xylem" } } } },
    },
    rayan = {
      lines = { { id = "ra_default", text = "My fellow student, and the most careful elf I've ever met, which makes him wonderful to travel with and maddening to argue with. If you want the dull facts, ask him; if you want the interesting ones, ask me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The Highborne, the ruins, and the Archmage's library." } },
    highborne = { { id = "tp_hb", text = "Our ancestors, or their cousins. It depends who's telling the story." } },
    _none = { { id = "tp_none", text = "That's not in any book up here, I'm afraid." } },
  },
}

---------------------------------------------------------------------------
-- Rayan Dawnrisen
---------------------------------------------------------------------------
P:NPC {
  key = "rayan_dawnrisen", id = TODO_NPC("Rayan Dawnrisen"), name = "Rayan Dawnrisen",
  bible = "bibles/azshara_wayfarers.md", role = "scholar", tier = "service",
  communities = { "xylems_tower" }, temper = { "calm", "precise" }, values = { "careful", "wise" },

  impression = {
    first = "Rayan Dawnrisen is a quiet high elf at the top of Xylem's Tower who copies Highborne inscriptions in a tiny, perfect hand. He speaks slowly and corrects himself when he gets a detail wrong.",
    third = "{name} met Rayan Dawnrisen, a careful high elf scholar at the top of Xylem's Tower.",
  },

  greetings = {
    { id = "g_default", text = "Good evening, or good day; it's hard to tell up here. How can I help you?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Joy is out on the balcony, if it's her you want." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rayan Dawnrisen, of Quel'Thalas. I copy the inscriptions Joy finds in the ruins, so that if the naga or the satyrs destroy them, something will remain. It's slow work, and the Archmage thinks it's beneath him, which is exactly why someone has to do it." },
      },
      again = { { id = "h_again", text = "Anything else? I can talk and copy at the same time." } },
      choices = {
        { text = "What do the inscriptions say?", next = "inscriptions" },
        { text = "Is it dangerous out in the ruins?", next = "danger" },
        { text = "Goodbye.", next = "END" },
      },
    },
    inscriptions = {
      lines = { { id = "in_default", text = "Mostly the names of rooms and the people who owned them, and a few prayers to a queen whose name I'd rather not write too often. Every so often there's a line of verse, and I copy those very carefully, because they're the only parts that sound like people." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "queen_azshara" } } } },
    },
    danger = {
      big = true,
      lines = { { id = "da_default", text = "Very. The Spitelash on the coast, the satyrs in the old courts, and the blue dragon in the south, though he mostly ignores us. Joy wants to go deeper into Eldarath next month, and I want to go home with what we have." } },
      choices = {
        { text = "Go home. Your copies are worth more than a risk.", next = "BACK", reply = "They are, and I've told her the same a dozen times. Perhaps she'll listen if it comes from someone else.", fx = { align = { order = 1 } } },
        { text = "Go deeper. You came all this way.", next = "BACK", reply = "That's what Joy says, and she'll be delighted to hear it from you. I'll be the one packing the bandages.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Highborne script, and how to copy it without smudging." } },
    eldarath = { { id = "tp_eld", text = "A city that thought it would last forever. I copy its walls so something of it will." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. Joy might; she reads faster than I do." } },
  },
}

---------------------------------------------------------------------------
-- Gatekeeper Rageroar
---------------------------------------------------------------------------
P:NPC {
  key = "rageroar", id = TODO_NPC("Gatekeeper Rageroar"), name = "Gatekeeper Rageroar",
  bible = "bibles/azshara_wayfarers.md", role = "guard", tier = "service",
  communities = { "timbermaw_azshara" }, temper = { "gruff", "watchful" }, values = { "protective", "loyal" },
  notices = { "timbermaw" },

  impression = {
    first = "Gatekeeper Rageroar guards the Azshara mouth of the Timbermaw tunnels and lets nobody through without a long, suspicious look. His name is a warning, and he likes it that way.",
    third = "{name} met Gatekeeper Rageroar, the Timbermaw furbolg who guards the tunnel into Azshara.",
  },

  greetings = {
    { id = "g_default", text = "Rageroar watches this gate. Stand still and let him smell you." },
    { id = "g_friend", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } }, text = "Friend of the Timbermaw. Rageroar lets you pass, and he does not growl." },
    { id = "g_foe", when = { reputation = { faction = "Timbermaw Hold", max = "unfriendly" } }, text = "Rageroar knows your smell, and it is the smell of dead Timbermaw. Go back the way you came." },
  },

  notice = {
    { id = "n_timbermaw", cat = "timbermaw", when = { reputation = { faction = "Timbermaw Hold", min = "honored" } },
      text = "The elders speak of you in the hold. Rageroar did not believe them, but now he smells you and believes." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rageroar is gatekeeper of this tunnel, where Timbermaw Hold opens into Azshara. The Timbermaw do not like strangers walking through the mountain, but strangers who are friends may pass, and strangers who are not will learn why Rageroar has his name." },
      },
      again = { { id = "h_again", text = "What else? Rageroar is listening, and watching." } },
      choices = {
        { text = "Why guard this end so closely?", next = "why" },
        { text = "What lies in Azshara for the Timbermaw?", next = "azshara" },
        { text = "I'll pass through, then.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because the satyrs of Azshara would walk into the hold if Rageroar let them, and the Deadwood would walk out. A tunnel is a road, and a road goes both ways, so Rageroar stands in the middle of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    azshara = {
      big = true,
      lines = { { id = "az_default", text = "Old forests and bad magic, and satyrs where elves once lived. Some Timbermaw want to close this gate forever with stone, so nothing from Azshara can come in. Rageroar thinks a closed gate is a weak gate, because nobody watches it." } },
      choices = {
        { text = "Seal it. Some doors should stay shut.", next = "BACK", reply = "Rageroar hears you, and some of the elders would agree. But a sealed door forgets what's behind it, and Rageroar does not want to forget.", fx = { align = { order = 1 } } },
        { text = "Keep it open and watched. Rageroar is right.", next = "BACK", reply = "Rageroar thanks you, outsider, and the elders will hear of it. A watched door is safer than a forgotten one.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Rageroar knows this gate and every smell that has passed it." } },
    furbolgs = { { id = "tp_furb", text = "The Timbermaw remember who they are. Rageroar helps them remember." } },
    satyrs = { { id = "tp_sat", text = "They smell of rot and old magic. Rageroar does not let them pass." } },
    _none = { { id = "tp_none", text = "Rageroar does not know. Rageroar knows the gate." } },
  },
}
