-- The Badlands between the towns: Martek's camp and Rigglefuzz's cookfire. Voice: bibles/badlands_camps.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "martek", id = TODO_NPC("Martek the Exiled"), name = "Martek the Exiled",
  bible = "bibles/badlands_camps.md", role = "blacksmith", tier = "quest",
  communities = { "badlands" }, temper = { "gruff" }, values = { "proud" },
  notices = { "craft" },

  impression = {
    first = "Martek the Exiled works metal in a lonely Badlands camp, and nobody living knows more about it than he does.",
    third = "{name} met Martek the Exiled, a dwarven smith living in exile in the Badlands.",
  },

  greetings = {
    { id = "g_camp", text = "Ye found my camp, which means ye were either lookin' or lost. Which is it?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Sit, then, but don't touch the anvil." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not in words, but I listen all the same, and I hear when a vein's run thin or a seam's about to crack. The troggs dig without listening, and Uldaman's full of things better left buried, so ye might tell the spirits not everyone down here is so careless." } },
      choices = {
        { text = "Then work gently, Martek. The earth rewards those who listen.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Metal's metal. Take what the earth won't defend.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Because the Badlands ask nothing of me except that I survive them, and Ironforge asked a great deal more. You of all people should understand wanting a place that doesn't care who you were." } },
      choices = {
        { text = "A dwarf belongs with his own kin, Martek.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I understand. Some of us need the wild.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Some nights, when the wind howls through the camp an' there's nobody tae curse it with. But a city's full o' folk who know yer business, an' out here only the buzzards know mine, an' they've never told a soul." } },
      choices = {
        { text = "Better alone and free than watched in a city.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Exile or not, everyone needs their own people.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Aye, it does, an' that's why I'll no' let a mage near mine. Metal that's been made strong by a charm forgets how tae be strong on its own, an' the day yer charm fails, the blade fails with it." } },
      choices = {
        { text = "Honest steel needs no magic. You're right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Magic makes metal better. That's progress, Martek.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Martek.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. I've no use for spells in my metal, mind; what goes intae the forge should come out the better for the hammer, no' for some charm." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. Ye'll have yer own reasons for keepin' away from cities, I'd wager, an' I'll no' ask them if ye don't ask mine." },
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, here? The earth out here is old and sore, and I've worked it long enough to know when it's in a mood, which is most days." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, out here? You'll find no forest in the Badlands, only rock and me, and I've been told I'm poorer company than the rock." },
        { id = "h_default", key = true,
          text = "Martek, they call me, and 'the Exiled' because it's true. I work metal out here where no one tells me how, and the Badlands keep my secrets." },
        { id = "h_letter", when = { questActive = TODO_QUEST("Martek the Exiled") },
          text = "A letter from the Shimmering Flats? Fizzle Brassbolts, eh, and he wants my help with his racer. That gnome has nerve, I'll give him that." },
        { id = "h_indurium", when = { questActive = TODO_QUEST("Indurium") },
          text = "Indurium, from the troggs round Uldaman. Bring me enough of it and I'll show ye what real metal can do." },
      },
      again = {
        { id = "h_again", text = "What else? The forge is coolin'." },
        { id = "h_again2", text = "Ask, then. I've had no company in weeks." },
      },
      choices = {
        { text = "Why live alone in a land this harsh, Martek?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Does the earth speak to you when you work its metal, Martek?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why were you exiled?", next = "exile" },
        { text = "What's indurium?", next = "indurium" },
        { text = "How do you live out here?", next = "life" },
        { text = "I'm a smith too. Any advice?", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "Do you ever miss the cities, Martek?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Indurium takes enchantments well, though, doesn't it?", next = "xmage", when = { class = "MAGE" } },
        { text = "Farewell, Martek.", next = "END" },
      },
    },
    exile = {
      lines = { { id = "e_default", text = "I said things to the wrong people in Ironforge, and I was right, which made it worse. That's all ye'll get from me today." } },
      choices = {
        { text = "Do you regret it?", next = "exile_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    exile_regret = {
      lines = { { id = "er_default", text = "Some days I miss the Great Forge, and the noise of it. Most days I'm glad to be shot of the lot of them." } },
      choices = {
        { text = "A dwarf owes his city loyalty, even when it's wrong.", next = "exile_end", fx = { align = { order = 1 } } },
        { text = "You were right to go your own way.", next = "exile_end", fx = { align = { order = -1 } } },
        { text = "Would you ever go back?", next = "exile_end" },
      },
    },
    exile_end = {
      lines = { { id = "ee_default", text = "Maybe, if they asked nicely, and they won't. So here I stay, with my anvil and the vultures." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    indurium = {
      lines = { { id = "i_default", text = "A metal ye'll find only in the deep places round Uldaman, and the troggs carry it like treasure. It's light, and it's strong, and it's perfect for a gnome's mad machine." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } } },
    },
    life = {
      lines = { { id = "l_default", text = "Water from a hidden spring, meat from the coyotes, and silence from everyone. It suits me better than ye'd think." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    smith = {
      lines = { { id = "s_default", text = "Listen to the metal, no' the master. If it rings wrong, it is wrong, whatever anyone tells ye." } },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, and I don't much care. Ask someone with a city." } },
  },
}

P:NPC {
  key = "rigglefuzz", id = TODO_NPC("Rigglefuzz"), name = "Rigglefuzz",
  bible = "bibles/badlands_camps.md", role = "questgiver", tier = "quest",
  communities = { "badlands" }, temper = { "jovial" }, values = { "practical" },
  notices = { "race" },

  impression = {
    first = "Rigglefuzz is a goblin cooking by the Badlands road, and he's convinced buzzard wings are his ticket to riches.",
    third = "{name} met Rigglefuzz, a goblin cook with big plans for Badlands buzzards.",
  },

  greetings = {
    { id = "g_cook", text = "Hey, hey, you hungry, pal? No? Well, you will be once you smell this." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Thank 'em? I'd thank 'em if they flew down here already seasoned. The buzzards out here eat whatever falls over in the heat, so if anybody ought to be thanking somebody, it's them, for me cleaning the place up." } },
      choices = {
        { text = "Thank them anyway. Every life taken deserves respect.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fair enough. A buzzard's just a meal waiting for sauce.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Counting this morning? Enough to keep the skies clear over my camp, and not one of 'em has ever complained, which is more than I can say for my customers." } },
      choices = {
        { text = "Ease up, or there won't be any buzzards left.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Cook the lot. They're only carrion birds.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every cook from here to Booty Bay, pal, and a few in Gadgetzan who should know better. I keep it in my head, where nobody can pick the lock, though a Kargath grunt once tried to beat it out of me, and all he got was indigestion." } },
      choices = {
        { text = "Your secret's safe. I don't rob honest cooks.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everything's for sale, Rigglefuzz. Even recipes.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Another question, then.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Aw, come on, it's practically made of charcoal already! Half the Badlands is on fire anyway, so one more little flame for a good cause can't hurt, and the buzzards sure won't complain." } },
      choices = {
        { text = "Fel fire for buzzard wings? Why not?", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Demons aren't toys. I keep mine on a short leash.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Is that an imp? Could it light my grill? I'll pay in wings, and the little fella looks like he could use a feed." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! You're not after my sauce recipe, are you? Because I've had three offers this month, and one of 'em came with a knife." },
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman! Say, could you call up a bit of fire for my grill? It'd save me on charcoal, and the buzzards don't care how they're cooked." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! You're not here to give me grief about the buzzards, are you? Because they're the ugliest birds in the Badlands, and somebody has to eat 'em." },
        { id = "h_default", key = true,
          text = "Rigglefuzz's the name, and barbecue's the game! I've got a recipe for buzzard wings that'll make me richer than a Steamwheedle baron." },
        { id = "h_wings", when = { questActive = TODO_QUEST("Barbecued Buzzard Wings") },
          text = "Buzzard wings, as many as you can carry, and don't let 'em go rotten in the sun. The secret's in the sauce, and the sauce needs wings." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you, pal, since time is money?" },
        { id = "h_again2", text = "Yeah, yeah, what is it?" },
      },
      choices = {
        { text = "How many buzzards have you cooked, Rigglefuzz?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Do you ever thank the spirits for your buzzards, Rigglefuzz?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Buzzard wings? Really?", next = "wings" },
        { text = "Who buys food out here?", next = "buyers" },
        { text = "Isn't it dangerous by the road?", next = "danger" },
        { text = "Will you sell to an orc, goblin?", next = "goblin", when = { race = "Orc" } },
        { text = "Who wants your sauce recipe that badly?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "My imp is not a cooking fire, Rigglefuzz.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Good luck with the barbecue.", next = "END" },
      },
    },
    wings = {
      lines = { { id = "w_default", text = "Really, really! Tough, sure, but slow-cook 'em with enough pepper and nobody can tell. Trust me, I'm a professional." } },
      choices = {
        { text = "What's in the sauce?", next = "wings_sauce" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wings_sauce = {
      lines = { { id = "ws_default", text = "That's a trade secret, pal, and I'd have to charge you for it. Let's just say it's got a kick, and some of the kick's legal." } },
      choices = {
        { text = "Sounds like a swindle. You should be honest with customers.", next = "wings_end", fx = { align = { honor = 1 } } },
        { text = "Ha! If they pay, they pay. Smart business.", next = "wings_end", fx = { align = { honor = -1 } } },
        { text = "I'll take your word for it.", next = "wings_end" },
      },
    },
    wings_end = {
      lines = { { id = "we_default", text = "See, you get it, or you don't, but either way you're gonna bring me wings. That's the beauty of business." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    buyers = {
      lines = { { id = "b_default", text = "Anybody with coin and a stomach, pal. Orcs, dwarves, ogres if they pay first, and I don't ask questions." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "d_default", text = "Sure, there's ogres and dragonkin and whatnot, but they've gotta eat too. I figure nobody kills the cook." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    goblin = {
      lines = { { id = "g_default", text = "Sure, pal, your coin's as good as anybody's, and Kargath's full of hungry grunts. Tell your friends where the wings are." } },
      choices = { { text = "I'll spread the word.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Dunno, pal. Does it taste good with sauce?" } },
  },
}
