-- Booty Bay, the docks and the weapon stalls: Old Man Heming of the fishing tournament, Mazk Snipeshot the gunsmith, Haren Kanmae the bowyer. Voice: bibles/stranglethorn.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "heming", id = TODO_NPC("Old Man Heming"), name = "Old Man Heming",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "folksy", "stubborn" }, values = { "patient", "craft" },
  notices = { "class", "weary" },

  impression = {
    first = "Old Man Heming sits on the Booty Bay docks with a line in the water and an opinion on every fish in the South Seas. He swears the sea has taught him more than any book, and he's probably right.",
    third = "{name} met Old Man Heming, the old fisherman on the Booty Bay docks.",
  },

  greetings = {
    { id = "g_default", text = "Mind the line, youngster, and keep your shadow off the water; you'll scare the snappers." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Pull up a crate, then, and hush while I've got a nibble." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, eh? You'll know patience, then, which is the whole of fishing and half of living." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the tide dragged you in and spat you out. Sit down a spell, there's no hurry on a dock." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Name's Heming, and I've fished these waters since before the goblins carved this bay into a town. Every Sunday the Baron holds his fishing tournament, and I like to think I taught half the winners, though none of them ever thank me." },
        { id = "h_quest", when = { questActive = TODO_QUEST("Old Man Heming") },
          text = "Still at it, are you? Keep your line slack and your temper slacker, and the fish will come round in time." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind? The fish aren't biting anyhow." },
        { id = "h_again2", text = "Go on, ask. An old man likes to be asked." },
      },
      choices = {
        { text = "Tell me about the fishing tournament.", next = "tourney" },
        { text = "What lives in these waters?", next = "fish" },
        { text = "How long have you lived here?", next = "past" },
        { text = "I'm a fisherman myself.", next = "angler", when = { profession = "Fishing" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    tourney = {
      lines = {
        { id = "to_default", text = "Every Sunday the Baron's men ring the bell, and every angler from here to Ratchet scrambles to land the biggest catch in two hours. Riggle Bassbait runs the thing and hands out the prizes, and I've told him the fish are the real winners, but he only laughs." },
      },
      choices = {
        { text = "Why don't you enter yourself?", next = "tourney_why" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    tourney_why = {
      lines = {
        { id = "tw_default", text = "Because a man my age doesn't need a prize to tell him he can fish. I come down and watch the young ones sweat, and I give a word of advice to anyone who asks me kindly." },
      },
      choices = {
        { text = "Then what's your advice?", next = "tourney_advice" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    tourney_advice = {
      lines = {
        { id = "ta_default", text = "Fish where the water churns, near the wrecks and the rocks, because that's where the big ones feed. And don't waste time on little fish; the big ones never fill up on minnows." },
      },
      choices = {
        { text = "Winning is all that matters.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd rather fish fair and lose.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll remember that, thanks.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    fish = {
      lines = {
        { id = "fi_default", text = "Snappers and rockscale cod close in, and out past the reefs there's mightfish as long as your arm. Sharks too, mind, and the Bloodsail chum the water off Wild Shore when they're butchering their catch." },
      },
      choices = {
        { text = "Do the Bloodsail ever trouble you?", next = "fish_bloodsail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish_bloodsail = {
      lines = {
        { id = "fb_default", text = "Pirates don't bother an old man on a dock, because I've nothing worth stealing but a good rod. The Blackwater lads hate them, though, and if you want trouble with the Bloodsail, there's plenty to be had." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },
    past = {
      lines = {
        { id = "pa_default", text = "Long enough to remember when this bay was just a cove with a few shacks and a lot of sharks. The goblins came, and built and built, and now there's a whole town hanging off the cliffs, but the fish are the same as they ever were." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    angler = {
      lines = {
        { id = "an_default", text = "Are you, now? I can see it in how you stand, not leaning over the water like a landlubber. Come Sunday you should try your luck in the tournament, and show those young braggarts how it's done." },
      },
      choices = { { text = "Maybe I will, old man.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm an old fisherman, and that's all I ever wanted to be. Some men chase gold; I chase snappers, and I sleep better for it." } },
    advice = { { id = "tp_ad", text = "Be patient, youngster. The sea gives to those who wait and takes from those who rush." } },
    _none = { { id = "tp_none", text = "Never heard of it, and if it doesn't swim, I don't much care." } },
  },
}

P:NPC {
  key = "mazk", id = TODO_NPC("Mazk Snipeshot"), name = "Mazk Snipeshot",
  bible = "bibles/stranglethorn.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "salesy", "brash" }, values = { "profit" },
  notices = { "class", "race" },

  impression = {
    first = "Mazk Snipeshot sells guns and shot in Booty Bay and fires off sales talk faster than any rifle he stocks. He's a goblin who likes loud things, and he says so proudly.",
    third = "{name} met Mazk Snipeshot, who sells guns in Booty Bay.",
  },

  greetings = {
    { id = "g_default", text = "Guns, shot, powder, everything that goes bang! Step right up, pal, and don't touch the hair triggers." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite customer's back! You always need more shot, pal, so let's see what you're short of." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Now there's somebody who appreciates a fine barrel, so take a look at the long rifles." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! You folks know your guns, so don't go telling me Ironforge makes them better, because I've heard it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mazk Snipeshot, gunsmith to the finest pirates, hunters and lunatics in the South Seas. Everything on this table shoots straight, mostly, and anything that doesn't is on sale." },
      },
      again = {
        { id = "h_again", text = "What else can I sell you, pal? I mean, help you with?" },
        { id = "h_again2", text = "Anything else? I've got time, and I've got stock." },
      },
      choices = {
        { text = "Who buys guns in Booty Bay?", next = "buyers" },
        { text = "Where do your guns come from?", next = "source" },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Not today.", next = "END" },
      },
    },
    buyers = {
      lines = {
        { id = "bu_default", text = "Everybody, pal! Hunters going after Nesingwary's tigers, sailors who've seen too many Bloodsail flags, and once a troll who wanted to shoot a raptor that ate his hat. A town like this runs on shot and grog." },
      },
      choices = {
        { text = "You'd sell to anybody?", next = "buyers_anyone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_anyone = {
      lines = {
        { id = "ba_default", text = "Anybody the Baron lets through the gate, and the Baron lets in anybody with coin. Booty Bay doesn't care if your money's Horde or Alliance, so long as it's gold." },
      },
      choices = {
        { text = "Fair trade is fair trade.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Some folk shouldn't be armed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = {
        { id = "so_default", text = "Some from Undermine, some from Ironforge by way of people who don't ask questions, and some I put together myself in the back. The ones I make myself are the loudest, which is how you know they're good." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I came to Booty Bay to sell guns, and I stayed because nobody here complains about the noise." } },
    advice = { { id = "tp_ad", text = "Always carry more shot than you think you need, pal. The jungle's got more teeth than you've got bullets." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, and if I can't shoot it or sell it, I can't help you." } },
  },
}

P:NPC {
  key = "haren", id = TODO_NPC("Haren Kanmae"), name = "Haren Kanmae",
  bible = "bibles/stranglethorn.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "calm", "dry" }, values = { "craft" },
  notices = { "class", "race" },

  impression = {
    first = "Haren Kanmae sells bows in Booty Bay, a quiet craftsman among the shouting goblins. He thinks a good bow is worth more than a loud gun, and he's tired of saying so.",
    third = "{name} met Haren Kanmae, the bowyer of Booty Bay.",
  },

  greetings = {
    { id = "g_default", text = "Bows, crossbows and arrows, friend. Quiet weapons, for a loud town." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Still shooting straight, I hope?" },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You'll want a bow with some weight to it for the tigers, so let me show you what I have." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "A night elf. Your people make the best bows in the world, so please be kind about mine." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Haren Kanmae, bowyer. The jungle's damp warps a bow faster than anywhere I've worked, so I oil the staves every morning and pray the humidity breaks, which it never does." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Anything more? I'm only stringing bows." },
      },
      choices = {
        { text = "Why a bow over a gun?", next = "bowgun" },
        { text = "How do you work in this damp?", next = "damp" },
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "Farewell.", next = "END" },
      },
    },
    bowgun = {
      lines = {
        { id = "bg_default", text = "A bow is silent, and in the jungle, silent keeps you alive. Mazk will tell you otherwise, loudly, but every tiger in Stranglethorn hears his customers coming a mile away." },
      },
      choices = {
        { text = "Loud or quiet, dead is dead.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "A clean, quiet shot is the honest way.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    damp = {
      lines = {
        { id = "da_default", text = "Oil, wax, and a dry box I keep in the back with a little fire under it. It isn't much, but it keeps my strings from rotting, and it's more than most bowyers would bother with." },
      },
      choices = {
        { text = "Where do you find good wood?", next = "damp_wood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    damp_wood = {
      lines = {
        { id = "dw_default", text = "Not in this jungle; it grows soft and wet. I buy staves from the ships when they come in from the north, and I pay too much, but a bowyer can't work with rotten wood." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I make bows, and I came south where the hunting is good and the customers are many. That's all there is to it." } },
    advice = { { id = "tp_ad", text = "Keep your bowstring dry, friend. A wet string won't fire, and the jungle won't wait for it to dry." } },
    _none = { { id = "tp_none", text = "I don't know about that. I know about bows." } },
  },
}
