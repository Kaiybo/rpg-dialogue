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
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Down by the Vile Reef the naga have been stirring, and some mornings my hook comes up with weed on it that glows a faint green. I've fished these waters all my life and never seen that before, so I throw it back and fish somewhere else." } },
      choices = {
        { text = "I'll go and see what's stirring, for the town's sake.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If the naga have treasure down there, I'm interested.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every morning, though not in any words your elders would know. I throw back the first fish I catch, because my father did and his father before him, and I haven't drowned yet." } },
      choices = {
        { text = "That's an old way worth keeping, Heming.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Throwing back a good fish sounds like a wasted supper.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Close enough, since both of us wait in the quiet for the right moment and strike before the other fellow knows what happened. The difference is that a fish never holds a grudge, and I'd guess your marks aren't so forgiving." } },
      choices = {
        { text = "I strike only when I must. Patience is everything.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A grudge is fine, so long as they never see me coming.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Heming.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Once, a young mage who froze a whole patch of the bay solid and then couldn't work out how to get the fish out of the ice. I laughed so hard I nearly fell off the dock, and he walked away with nothing but a cold pair of hands." } },
      choices = {
        { text = "The old way is best. I'll learn from you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "He just needed a better spell. Magic will get there.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Your folk know water better than most, so I'd wager you can tell a good fishing day before the fish can." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Say one for the fish, would you? They never get a word said for them, and I've eaten enough to owe them that." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. Keep your little fire-beast away from the water's edge; it boils my bait and puts the snappers off." },
        { id = "h_default", key = true,
          text = "Name's Heming, and I've fished these waters since before the goblins carved this bay into a town. Every Sunday the Baron holds his fishing tournament, and I like to think I taught half the winners, though none of them ever thank me." },
        { id = "h_quest", when = { questActive = TODO_QUEST("Old Man Heming") },
          text = "Still at it, are you? Keep your line slack and your temper slacker, and the fish will come round in time." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, out on my docks. You'll make a fine fisherman, I reckon, since you already know how to sit still and wait for something to bite." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Don't you go freezing my fish in the water, now, because I've been fishing these docks for years and I've never once needed magic to fill my bucket." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind? The fish aren't biting anyhow." },
        { id = "h_again2", text = "Go on, ask. An old man likes to be asked." },
      },
      choices = {
        { text = "Do you ever thank the sea for what it gives you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does anything strange come up out of the water near Booty Bay?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Tell me about the fishing tournament.", next = "tourney" },
        { text = "What lives in these waters?", next = "fish" },
        { text = "How long have you lived here?", next = "past" },
        { text = "I'm a fisherman myself.", next = "angler", when = { profession = "Fishing" } },
        { text = "Is fishing really like my line of work, Heming?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Have you ever seen magic used to fish, Heming?", next = "xmage", when = { class = "MAGE" } },
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
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The Kurzen deserters, if you can believe it, and they pay in Stormwind silver, so draw your own conclusions. Second place is the Bloodsail, who buy through middlemen and think I don't notice. I sell to both and sleep fine." } },
      choices = {
        { text = "Selling to both sides is just good business.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Arming the Bloodsail puts all of Booty Bay at risk.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because spirits get moody and powder doesn't, friend, or not often anyway. Half my customers swear by their totems and the other half swear by my blunderbusses, and the second half complains a lot less." } },
      choices = {
        { text = "I trust the elements over powder. They've never misfired on me.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll use whatever works. Show me a blunderbuss.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a dagger only works up close, and sometimes the trouble's across the room, and that's when you want something that goes bang. I've sold pistols to half the Bloodsail captains on this coast, and they're still alive, so that's proof enough." } },
      choices = {
        { text = "I'd sell to Booty Bay, not the Bloodsail. Pick a side.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Gold's gold. Sell to whoever has it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Mazk.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd sell a gun to a gorilla if it had the gold, and I've come close more than once. The trouble with demons is they never seem to carry any money, so I'd need you to sign for it, and I'd charge you extra for the scorch marks." } },
      choices = {
        { text = "My demon doesn't need a gun. Keep your blunderbuss.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Arm the imp. Let's see what happens.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, eh? Lightning's grand, but it never lands quite where you point it, and that's why I sell guns." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! You'll be needing protection, pal, because prayers are slow and a blunderbuss isn't." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage, eh? Fireballs are flashy, pal, but when you're out of mana, a pistol's still loaded." },
        { id = "h_default", key = true,
          text = "Mazk Snipeshot, gunsmith to the finest pirates, hunters and lunatics in the South Seas. Everything on this table shoots straight, mostly, and anything that doesn't is on sale." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Now, I know your sort likes things quiet, but let me tell you, pal, nothing ends an argument faster than a nice loud gun." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now that's something I've never sold a gun to, pal, though I'd bet a demon would look mighty fine with a blunderbuss on its shoulder." },
      },
      again = {
        { id = "h_again", text = "What else can I sell you, pal? I mean, help you with?" },
        { id = "h_again2", text = "Anything else? I've got time, and I've got stock." },
      },
      choices = {
        { text = "Why would a shaman ever need one of your guns?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who in Stranglethorn is buying the most guns these days?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who buys guns in Booty Bay?", next = "buyers" },
        { text = "Where do your guns come from?", next = "source" },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Why should a rogue carry a gun, Mazk?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Would you really sell a gun to a demon, Mazk?", next = "xlock", when = { class = "WARLOCK" } },
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
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "A mage offered once, and the stave came back dry as a bone and cracked down the middle. I've decided the damp and I will have to come to our own terms, with oil and patience and a good deal of swearing." } },
      choices = {
        { text = "Patience and honest oil. That's the right way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Next time try a stronger spell and see what happens.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every good stave has something in it, though I'd call it grain and you'd call it a spirit. Either way it fights you if you cut against it, and that's all I need to know." } },
      choices = {
        { text = "Work with the grain and respect it. That's the shaman's way too.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Wood's just wood. Make it bend however you need.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Some do. The sharks follow the trawlers, and the reefs off Jaguero Isle are thinner than when I was a boy. It's no great disaster yet, but I'd like it if someone remembered the sea is not a bottomless pocket." } },
      choices = {
        { text = "Thank you. Let me ask something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a bow lets you strike from the shadows without telling the whole jungle where you are, and a gun tells everyone. The goblins here love their noise, but I've seen a single arrow end a fight that a dozen guns only made worse." } },
      choices = {
        { text = "Quiet work is better work. I'll take a bow.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Noise has its uses. Sometimes you want them to hear.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Haren.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I do, since every bow starts as a living tree and ends as something that sings when you draw it. The goblins call it wood and string, but a mage should understand that the shaping is half the power, and I think you do." } },
      choices = {
        { text = "The craft is the magic. You're right about that.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's wood and string. Magic is something else entirely.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'd know the spirits of the wood, then, so ask them to keep the damp out of my staves, because nothing else has worked." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Sit a moment out of the sun, friend; whatever you serve, I doubt it wants you fainting on my pier." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. I'll sell you a bow if you like, though I suspect your little friend does your shooting for you." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "You've the sea in your eyes, druid, or the forest anyway, so sit a while if you like, since the water's calm today." },
        { id = "h_default", key = true,
          text = "Haren Kanmae, bowyer. The jungle's damp warps a bow faster than anywhere I've worked, so I oil the staves every morning and pray the humidity breaks, which it never does." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll want a bow that doesn't creak when you draw it, I suspect, and I make the quietest bows in Booty Bay, though nobody here appreciates quiet." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. You'll not need a bow, I'd guess, but you're welcome to look, because a good bow is as much a work of craft as any spell." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Anything more? I'm only stringing bows." },
      },
      choices = {
        { text = "Does the jungle's wood carry any spirit in it, do you think?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is there any magic that would keep the jungle's damp out of your bows?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Do the sea creatures here suffer from the cartels' fishing?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Why a bow over a gun?", next = "bowgun" },
        { text = "How do you work in this damp?", next = "damp" },
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "Why do you prefer bows to guns, Haren?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you see bowmaking as a kind of art, Haren?", next = "xmage", when = { class = "MAGE" } },
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
