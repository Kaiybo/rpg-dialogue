-- The Undercity's quarters: Michael Garrett the bat handler, Anastasia Hartwell in the Magic Quarter, Apothecary Zinge in the Apothecarium. Voice: bibles/undercity.md
-- Zinge's own quests are not referenced (unsure of them); she speaks only of the Apothecarium's work in general.
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "garrett", id = TODO_NPC("Michael Garrett"), name = "Michael Garrett",
  bible = "bibles/undercity.md", role = "flightmaster", tier = "service",
  communities = { "undercity" }, temper = { "dry", "calm" }, values = { "practical" },
  notices = { "race", "class" },

  impression = {
    first = "Michael Garrett keeps the bats by the Undercity's outer gate, and he speaks of them with more warmth than he shows for most living things. He has a dry humor that reminds you he's been dead a while.",
    third = "{name} met Michael Garrett, the bat handler of the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "The bats are hungry and restless, which means they're ready to fly. Where to?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The bats remember you, which is either a compliment or a warning." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "A living rider. The bats can smell your blood, so don't take it personally if they lick their lips." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Keep your pet away from the roost, hunter. My bats are fond of a snack." },
  },

  start = "hello",
  nodes = {
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They carry anyone with the coin and the stomach for it, priest or rogue, alive or otherwise. I'd say a prayer before you climb on, though, because they've a habit of diving when they spot a moth, and nobody's prayers have ever stopped them." } },
      choices = {
        { text = "I'll trust your bats, Michael, and pray anyway.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayer won't keep me in the saddle. I'll hold on tight.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Heavy ones, and fidgety, because they don't like sitting still while something else does the work. Hold the harness, keep your shield off the bat's wing, and you'll reach the Sepulcher with your dignity and most of your armour." } },
      choices = {
        { text = "I'll sit still and trust the bat, Garrett.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather walk. I like my feet on the ground.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They mind it, but they'll do it, so long as the beast doesn't try to bite the wing that's holding it up. Most hunters send their companions off for the flight, and I'd recommend it, for everyone's peace of mind." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They'll tolerate {pet}, though they'd rather it didn't eye them like supper. Most hunters send their companions off for the flight, and I'd recommend it, for everyone's peace of mind." },
      },
      choices = {
        { text = "I'll keep my beast calm for the flight, Garrett.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My beast goes as it pleases, Garrett.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Michael Garrett, bat handler to the Dark Lady's city. The bats carry riders to Tarren Mill and the Sepulcher and wherever else the Forsaken have planted a flag, and they don't mind the dead on their backs, which is more than horses can say." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The bats don't like the smell of lightning, so mind what you're carrying before you climb on." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You can run like a cat, I'm told, but there's no running across Lordamere Lake, so you'll want a bat." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The bats carry armour well enough, {class}, though they'll complain about the weight the whole way to Tarren Mill." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The bats don't love your beasts, but they've learned to put up with them, which is more than the beasts manage in return." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, at the bat roost. They won't mind you, the bats, but they'll want to know if you've got anything to eat, which is about all they want from anyone." },
      },
      again = {
        { id = "h_again", text = "What else? The bats are waiting, but bats are patient." },
        { id = "h_again2", text = "Anything more?" },
      },
      choices = {
        { text = "Do the bats ever carry priests, Michael?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do your bats fear the storm, Garrett?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the bats mind a living rider, Garrett?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why bats and not wyverns?", next = "bats" },
        { text = "Were you a handler in life?", next = "life" },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Can a bat drop me somewhere quiet, Garrett?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Your bats flinch whenever I come near, Garrett.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do warriors make poor bat riders, Garrett?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do your bats mind carrying a hunter's beast, Garrett?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Not now.", next = "END" },
      },
    },
    bats = {
      lines = {
        { id = "ba_default", text = "Bats don't shy from the dead, and they fly well in the dark, which suits us. The wind riders the orcs keep won't let a Forsaken near them, and I can't blame them, but a bat doesn't care." },
      },
      choices = {
        { text = "Do the bats care for you?", next = "bats_care" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bats_care = {
      lines = {
        { id = "bc_default", text = "As much as a bat cares for anything, which is to say they care for whoever feeds them. I feed them well, and I've not been bitten in a month, so I count that as love." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    life = {
      lines = {
        { id = "li_default", text = "I kept horses in Lordaeron, before the plague, and I was good at it. The horses wouldn't have me when I came back, so the Dark Lady gave me bats, and I've found I like them better." },
      },
      choices = {
        { text = "The past is better left buried.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "It's good you remember who you were.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They fear thunder, mostly, and I can't blame them, since it's the only thing louder than they are. I've flown a few shamans to Tarren Mill and they all kept the storm packed away for the flight, and the bats were grateful, and so was I." } },
      choices = {
        { text = "I'll keep the storm packed away for the flight.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The bats will have to get used to it, Garrett.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "They mind the smell of your blood, but they'll carry you, and they'll be good about it. A bat's not like a horse, because a horse remembers who it used to belong to, and a bat only remembers who fed it last." } },
      choices = {
        { text = "Then I'll feed them myself before I fly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A mount is a mount. Feeding it is your job.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The bats fly to the Sepulcher and Tarren Mill and nowhere in between, so if you want somewhere quiet you'll have to walk from there. They shriek when they land, besides, so get your quiet in after they've gone." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "The bats fly their routes and nowhere else, and the deathstalkers have been asking me for years to change that. Walk from the Sepulcher or Tarren Mill like everyone else, and you'll get your quiet soon enough." },
      },
      choices = {
        { text = "I'll walk the last stretch unseen.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll land loudly and let them come to me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Why bats and not wyverns?", next = "bats" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They flinch because they can smell what you keep company with, and bats are more sensible than most folk about that sort of thing. Send the demon away before you ride, and they'll settle soon enough." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "They flinch at orcs anyway, since you smell of wolf, and the demon makes it twice as bad. Send it away before you ride, and they'll settle soon enough." },
      },
      choices = {
        { text = "I'll dismiss it before I ride.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They'll get used to it, Garrett.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Were you a handler in life?", next = "life" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I keep bats. That's what I do, and I do it well, so don't ask for a life story." } },
    advice = { { id = "tp_ad", text = "Hold on tight when the bat dives. They don't warn you, and the ground is a long way down." } },
    _none = { { id = "tp_none", text = "I don't know. Ask a bat, they know more than you'd think." } },
  },
}

P:NPC {
  key = "hartwell", id = TODO_NPC("Anastasia Hartwell"), name = "Anastasia Hartwell",
  bible = "bibles/undercity.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "cold", "precise" }, values = { "ambitious" },
  notices = { "class", "race" },

  impression = {
    first = "Anastasia Hartwell teaches mages in the Undercity's Magic Quarter, and she treats the arcane like a scalpel. She was a scholar in life and has lost none of her impatience with fools.",
    third = "{name} met Anastasia Hartwell, a mage trainer in the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "If you've come to learn, then listen. If you've come to waste my time, the door is behind you." },
    { id = "g_back", when = { metBefore = true }, text = "So, you've come back to the Undercity's shadows. Tell me your spellwork has grown sharper since last time." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Good, at least you'll understand what I'm saying." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Death has left your mind intact, I see, so use it before it rots." },
  },

  start = "hello",
  nodes = {
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The Light was, certainly, because it promised everything and explained nothing, and then it let us die. The shadow priests at least talk of will and discipline, which is closer to a method, and I'll grant them that much grudgingly." } },
      choices = {
        { text = "Faith isn't a method, Anastasia. It's something more.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Will and discipline are what matter. I agree.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Some of them do, and they're fools, because every mage who ever lived has owed their life to someone with a shield standing in front of them. I'd trade a lesser student for one steady warrior on a bad day, and I've had a great many bad days." } },
      choices = {
        { text = "I'll stand in front. That's what warriors are for.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let the mages hold their own line for once.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Anastasia Hartwell, of the Magic Quarter. I teach the arcane to those of the Forsaken with the wit to learn it, and to the Dark Lady's allies, when they behave." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in the Magic Quarter. Your elements are crude and loud, but I'll grant they're effective, and effective is all I ask of anyone." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. I read your Cenarion Circle's writings, the few that reached Dalaran before it fell, and I thought them sentimental." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, in the Magic Quarter. Do try not to break anything, {class}, because the furniture is older than you are, and so am I." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, in the Magic Quarter. I teach mages to think precisely, and in my experience priests prefer to feel things rather than think them, so do prove me wrong." },
      },
      again = {
        { id = "h_again", text = "Something else? Ask it plainly; I have apprentices to correct and little patience left." },
        { id = "h_again2", text = "Anything further?" },
      },
      choices = {
        { text = "Is faith really so imprecise, Anastasia?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Crude, you say? Have you ever stood in a storm, Anastasia?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Sentimental how, Anastasia?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Do the mages ever look down on hunters, Anastasia?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Did death change your magic?", next = "death" },
        { text = "What do you think of Dalaran?", next = "dalaran" },
        { text = "Teach me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Warlocks study too, Anastasia. Why the contempt?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Mages and rogues both deal in secrets, Anastasia.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do the mages look down on warriors too, Anastasia?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    death = {
      lines = {
        { id = "de_default", text = "It made it colder, and clearer. The living worry about their bodies, but I have no such distractions, so I study, and I've learned more in death than I did in life." },
      },
      choices = {
        { text = "Is that worth the price?", next = "death_price" },
        { text = "Something else.", next = "BACK" },
      },
    },
    death_price = {
      lines = {
        { id = "dp_default", text = "I didn't choose the price, so I'll take what came with it. The Scourge took my life, and I'll take my knowledge back from them a spell at a time." },
      },
      choices = {
        { text = "Knowledge is worth any cost.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Some knowledge shouldn't be taken.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "Constantly, and they're wrong to. A hunter knows the land and reads the weather, and a hunter's arrow has never once blown up in its owner's face, which is more than I can say for my students." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Constantly, and they're wrong to, because {pet} shows more discipline than half my students. A beast that comes when called has never once blown up in its owner's face, which is more than I can say for them." },
      },
      choices = {
        { text = "Every trade has its use to the Forsaken.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them sneer. I answer to nobody's opinion.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    dalaran = {
      lines = {
        { id = "da_default", text = "Dalaran fell to the Legion, and its mages scattered like frightened birds. They wouldn't have me now anyway, so I don't waste my thoughts on them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I have, and I've called one, which is rather different from asking for one politely. The arcane doesn't care whether you're dead or living or troll, and I find that fairness restful, whereas your spirits seem to have opinions about everyone." } },
      choices = {
        { text = "Spirits with opinions keep a shaman honest.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "You're right. Power shouldn't need permission.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "They write about balance as though the world wants it, when the world wants nothing at all. The Scourge took my life and the Legion took Dalaran, and I've seen no sign that anything out there keeps the scales even, so I keep my own." } },
      choices = {
        { text = "Balance is real, Anastasia. Someone has to keep it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then keep your own scales. I'll keep mine.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Because the arcane asks you to understand the world, and your craft asks you to make deals with things that would eat it. I share a quarter with the warlocks and I'm civil to them, but civil isn't the same as respect." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "Kel'Thuzad was a scholar of the Kirin Tor before he was anything else, and he went from study to necromancy one small bargain at a time. Forgive me if I watch every warlock in this quarter with that in mind." },
      },
      choices = {
        { text = "Fair. I'll keep my bargains careful and few.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Power doesn't care how it's earned, Anastasia.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Did death change your magic?", next = "death" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Yes, but mages write theirs down and rogues sell them, which is why I keep my notes locked in a chest and never let it out of sight. If you want secrets from the Magic Quarter, you'll find most of them are dull equations." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "Dalaran's libraries lost more to cutpurses than to the Scourge, if you count the years before the plague, and I spent a long time chasing missing folios. Leave my notes alone, and we'll get along." },
      },
      choices = {
        { text = "I'll leave your notes alone, Anastasia.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Dull equations sell well enough, Anastasia.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What do you think of Dalaran?", next = "dalaran" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I studied magic in life, and I study it still. Death interrupted me, but it didn't stop me." } },
    advice = { { id = "tp_ad", text = "Know your spells before you need them. Learning in the middle of a fight is how you die twice." } },
    _none = { { id = "tp_none", text = "I don't concern myself with that. Ask someone with fewer things to do." } },
  },
}

P:NPC {
  key = "zinge", id = TODO_NPC("Apothecary Zinge"), name = "Apothecary Zinge",
  bible = "bibles/undercity.md", role = "questgiver", tier = "service",
  communities = { "undercity" }, temper = { "clinical", "busy" }, values = { "ambitious" },
  notices = { "class", "race" },

  impression = {
    first = "Apothecary Zinge works in the Apothecarium under Master Apothecary Faranell, and she talks about her experiments the way other people talk about the weather. She doesn't look up from her work much.",
    third = "{name} met Apothecary Zinge in the Undercity's Apothecarium.",
  },

  greetings = {
    { id = "g_default", text = "Don't touch anything on the tables. Some of it bites, and some of it does worse." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still alive, I see, which means you've been careful." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "A living one. Stand back from the vats, please, because some of these vapors are not kind to lungs that still work." },
    { id = "n_alchemist", cat = "class", when = { profession = "Alchemy" },
      text = "You've the stained fingers of an alchemist. Then you'll understand why I don't like being disturbed." },
  },

  start = "hello",
  nodes = {
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "It did, or something in the room did, and the priest who said it swore it was coincidence. I've kept the vial and labelled it, and one day I'll know which of us was right, though I suspect neither of us will like the answer." } },
      choices = {
        { text = "Some things aren't meant to be measured, Zinge.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Test it properly, Zinge. Faith can bear scrutiny.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Rats, mostly, and the occasional bear when the Master Apothecary is feeling generous. If you bring in a wolf from Silverpine that's been drinking from the wrong stream, though, I'd be very interested in what's in its blood." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not yours, so you needn't hold {pet} so close. Rats, mostly, and the occasional bear, though a wolf from Silverpine that's been drinking from the wrong stream would interest me a great deal." },
      },
      choices = {
        { text = "I won't bring living beasts to your cages, Zinge.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A sick wolf's no loss. I'll bring you one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Apothecary Zinge, of the Royal Apothecary Society. We work for the Dark Lady, and the Master Apothecary oversees all of it, so if you've business here, it's his business first." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Don't call anything up in here, please, because I've three mixtures reducing and I'd rather not explain lightning in my notes." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, and living. Stand away from the vats, please, because those vapours aren't kind to lungs that still work, and they're less kind to anything with fur." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your beasts look healthier than my prisoners, {class}, and I'll admit I've wondered why." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Don't touch anything on this bench, please, and don't bless it either, because I've had a vial go cloudy after a blessing and I've not worked out why." },
      },
      again = {
        { id = "h_again", text = "What else? My mixture is reducing." },
        { id = "h_again2", text = "Ask, and quickly." },
      },
      choices = {
        { text = "Did a blessing really cloud your vial, Zinge?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What do your mixtures do to the earth, Zinge?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What are those vapours made for, Zinge?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You test your work on prisoners, Zinge?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "What do you work on here?", next = "work" },
        { text = "What's Faranell like?", next = "faranell" },
        { text = "Could the arcane speed up your experiments, Zinge?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Does the Society test anything on demons, Zinge?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you need beasts for your experiments, Zinge?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Never mind.", next = "END" },
      },
    },
    work = {
      lines = {
        { id = "wo_default", text = "Cures for the living, poisons for the dead, and sometimes the other way round, as the Society requires. The Scourge has its plague, and we mean to know it better than its makers do." },
      },
      choices = {
        { text = "That sounds dangerous.", next = "work_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_danger = {
      lines = {
        { id = "wd_default", text = "Everything worth doing is dangerous, and what we do here is worth more than most. If an apothecary or two is lost to an accident, the Society carries on, as it always has." },
      },
      choices = {
        { text = "Results matter more than the risk.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "No one should die for an experiment.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "On prisoners, on rats, and once, regrettably, on my assistant. A warrior like you understands that victories cost something, and I simply pay the cost earlier than most." } },
      choices = {
        { text = "Even the dead should have limits, Zinge.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The war demands it. I won't judge you.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    faranell = {
      lines = {
        { id = "fa_default", text = "Brilliant, demanding, and never satisfied, which is what a Master Apothecary ought to be. I report to him, and he reports to the Dark Lady, and I'd rather not disappoint either." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Nothing the Scourge hasn't already done to it, I should think. Your spirits may complain, but spirits don't fund research and the Dark Lady does, so they can take it up with the Master Apothecary." } },
      choices = {
        { text = "The earth's suffering matters too, Zinge.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Results come first. The earth will recover.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "For the Scourge, as the Society requires, and for nothing else I'm prepared to discuss. Your nose is better than mine, I'd imagine, so if it tells you something in here is wrong, do me the courtesy of keeping it to yourself." } },
      choices = {
        { text = "Your secrets are your own. I'll keep quiet.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My nose says enough. I'll be watching the Society.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "It could speed up the explosions, which is the opposite of what I want. Master Faranell let a mage hasten a reaction once, and we're still scraping the result off the ceiling." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Dalaran's people always think a spell will make chemistry behave, and it never does. Master Faranell let one try once, and we're still scraping the result off the ceiling." },
      },
      choices = {
        { text = "Then I'll stay patient and follow your method.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Risk is how anyone learns anything, Zinge.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What do you work on here?", next = "work" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "We tried once, but the imp kept setting the notes on fire, and Master Faranell decided the results weren't reproducible. Prisoners are tidier, if you must know, and they don't argue with the method." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "We tried once, and the imp set the notes on fire, so we went back to prisoners. I'd keep your demon well clear of my bench, unless you'd like it to become a footnote." },
      },
      choices = {
        { text = "Prisoners or not, it's needed work, Zinge.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Testing on prisoners is beneath us, Zinge.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "What's Faranell like?", next = "faranell" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm an apothecary, and I serve the Society. Anything I was before doesn't matter now." } },
    advice = { { id = "tp_ad", text = "Don't drink anything you find in the Apothecarium. I mean that most sincerely." } },
    _none = { { id = "tp_none", text = "I haven't time for that. Try the Master Apothecary, if you dare." } },
  },
}
