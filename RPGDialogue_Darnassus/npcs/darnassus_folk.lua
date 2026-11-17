-- Darnassus, the folk we had missed: Darnath Bladesinger (warrior trainer, Warrior's Terrace), Silvaria
-- (pet trainer) and Alassin (stable master) in the Cenarion Enclave, Elissa Dumas (the human portal
-- trainer in the Temple of the Moon), Lairn (banker) and Landria (bows and arrows, Tradesmen's Terrace).
-- Classic only. Voice: bibles/darnassus_folk.md
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Darnath Bladesinger (warrior trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "darnath", id = TODO_NPC("Darnath Bladesinger"), name = "Darnath Bladesinger", title = "Warrior Trainer",
  bible = "bibles/darnassus_folk.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "proud", "steady" }, values = { "honorable", "brave" },
  notices = { "class", "race", "kit" },

  impression = {
    first = "Darnath Bladesinger trains warriors on the Warrior's Terrace and speaks of a warrior's honor as if it were a blade he keeps sharp. He sends his best students far beyond Teldrassil to be tested by strangers.",
    third = "{name} met Darnath Bladesinger, a warrior trainer on Darnassus's Warrior's Terrace.",
  },

  greetings = {
    { id = "g_hello", text = "Stand where I can see your stance, {class}. Ah, yes, I see the work it needs." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned to the Terrace. Your stance is better; your guard is still lazy." },
    { id = "g_yorus", when = { questDone = TODO_QUEST("Yorus Barleybrew") },
      text = "You went to Redridge and passed the dwarf's trial, I'm told. Good; a warrior should be tested by strangers as well as by friends." },
    { id = "g_spirit", when = { questDone = TODO_QUEST("A Troubled Spirit") },
      text = "You spoke with the fallen hero in the Blasted Lands. Then you know what I meant when I said honor outlives the body." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor has done its duty and then some. Let it rest at a smith's before you ask any more of it." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf on the Terrace! Your people fight as if the ground owed them a debt, and I mean that as praise." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Darnath Bladesinger, and I train warriors on this terrace, kaldorei and allies alike. Arias'ta will tell you about our history; I'd rather show you where your feet go." },
        { id = "h_war", when = { class = "WARRIOR" },
          text = "A warrior of the Alliance. Good; I've lessons for you, and when you've outgrown them, I've trials for you in lands far from here." },
        { id = "h_yorus", tags = { "news" }, when = { questActive = TODO_QUEST("Yorus Barleybrew") },
          text = "Yorus Barleybrew waits at the Lakeshire inn in Redridge, and he's challenged every able warrior of the Alliance. Go and see what his trial is, and don't drink anything he hands you without asking first." },
        { id = "h_spirit", tags = { "news" }, when = { questActive = TODO_QUEST("A Troubled Spirit") },
          text = "There's a spirit at the entrance to the Blasted Lands, once a great hero of the Horde. A warrior's honor doesn't die with the body, and I think it would serve you well to speak with him." },
      },
      again = {
        { id = "h_again", text = "What else? Ask, then raise your guard." },
        { id = "h_again2", text = "Speak. The terrace isn't going anywhere." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What is a warrior's honor?", next = "honor" },
        { text = "Why send students to a Horde ghost?", next = "ghost" },
        { text = "Do you train many men here?", next = "men" },
        { text = "What do you think of human warriors?", next = "humans", when = { race = "Human" } },
        { text = "Farewell.", next = "END" },
      },
    },

    honor = {
      lines = { { id = "ho_default", text = "It's what you do when the fight's already lost and nobody's watching. Anyone can be brave in front of an army; a warrior is the one who's brave alone, and keeps faith with the dead." } },
      choices = {
        { text = "Honor is everything. I'll fight by it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Honor is fine. Winning is better.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ghost = {
      lines = { { id = "gh_default", text = "Because his honor was real, whatever banner he fought under, and you'll learn more from a true enemy than from a false friend. Warriors on both sides understand each other better than our leaders would like." } },
      choices = {
        { text = "An orc is still an orc.", next = "ghost_orc" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ghost_orc = {
      lines = { { id = "go_default", text = "So he is, and he still died well, and so may you, one day. Go and hear him, then tell me whether you still think it's that simple." } },
      choices = {
        { text = "Respect for a worthy foe costs nothing. I'll go.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll go, but I'll keep my blade ready.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },

    men = {
      lines = { { id = "me_default", text = "As many as Sildanair trains women, or near enough. The Sentinels are the Sisterhood's and they're mostly women, but the terrace is anyone's who'll pick up a blade, and the men of Darnassus have found a place here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    humans = {
      lines = { { id = "hu_default", text = "Quick to learn and quick to forget, and braver than they've any right to be with such short lives. The ones who came to Hyjal fought beside us when they could have fled, and I haven't forgotten it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
}

---------------------------------------------------------------------------
-- Silvaria (pet trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "silvaria", id = TODO_NPC("Silvaria"), name = "Silvaria", title = "Pet Trainer",
  bible = "bibles/darnassus_folk.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "gentle", "calm" }, values = { "nature", "patient" },
  notices = { "pet", "class" },

  impression = {
    first = "Silvaria teaches hunters' companions new tricks in the Cenarion Enclave, and she speaks to the beasts first and their hunters second. She seems to know what a pet is thinking before its master does.",
    third = "{name} met Silvaria, the pet trainer in the Cenarion Enclave.",
  },

  greetings = {
    { id = "g_hello", text = "Bring your companion closer, please. I'd like to meet it properly." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Your companion looks prouder than last time." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "{pet} has learned a great deal from you, I can see it. Some of it is even good." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Silvaria, and I teach your companions what they're ready to learn. A beast can learn as much as a student, if you're patient, and much more if you're kind." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, and your companion with you. Let's see what it's ready for, and what you're ready to let it do." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Ask; your companion is listening too." },
      },
      choices = {
        { text = "Train my companion.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you know what a beast needs?", next = "know" },
        { text = "Is a pet a weapon or a friend?", next = "friend" },
        { text = "Thank you.", next = "END" },
      },
    },
    know = {
      lines = { { id = "kn_default", text = "You watch it, for a long time, without wanting anything from it. Most hunters watch their pets only when they need them, and the beasts know that very well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    friend = {
      lines = { { id = "fr_default", text = "Whichever you make of it, and it will make the same of you. I've seen hunters lose a companion and grieve like a sister, and I've seen others buy a new one the same afternoon." } },
      choices = {
        { text = "A friend. I'd grieve mine.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A tool, and a good one. Tools can be replaced.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Alassin (stable master)
---------------------------------------------------------------------------
P:NPC {
  key = "alassin", id = TODO_NPC("Alassin"), name = "Alassin", title = "Stable Master",
  bible = "bibles/darnassus_folk.md", role = "stablemaster", tier = "service",
  communities = { "darnassus" }, temper = { "dry", "steady" }, values = { "practical", "patient" },
  notices = { "pet" },

  impression = {
    first = "Alassin keeps the stables in the Cenarion Enclave and has a dry word for every hunter who leaves a companion with him too long. He has never yet lost an animal and is quietly proud of it.",
    third = "{name} met Alassin, the stable master in the Cenarion Enclave.",
  },

  greetings = {
    { id = "g_hello", text = "Leaving one, or taking one? I can do either, but not both at once." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you. Your beasts are well, and they'd like you to visit more often." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "That one's been eating well. Too well, perhaps, but I'll not tell it so." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Alassin, and I keep the stables of the Enclave. Every beast in my care is fed, brushed and spoken to every day, which is more than some of their hunters can say for themselves." },
      },
      again = {
        { id = "h_again", text = "Something else?" },
        { id = "h_again2", text = "What else can I do?" },
      },
      choices = {
        { text = "I'd like to use the stables.", next = "BUSINESS" },
        { text = "What's the strangest beast you've kept?", next = "strange" },
        { text = "Do the druids help with the animals?", next = "druids" },
        { text = "Thank you.", next = "END" },
      },
    },
    strange = {
      lines = { { id = "st_default", text = "A crab from the coast of Darkshore, if you can believe it, that a dwarf hunter swore was the bravest companion he'd ever had. It pinched me every morning for a month, and I grew rather fond of it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    druids = {
      lines = { { id = "dr_default", text = "When they're not arguing about something in the Arch Druid's tree, yes. A druid in cat's shape can calm a nervous saber faster than I can, and I'm not too proud to ask." } },
      choices = {
        { text = "The druids' wisdom keeps this city whole.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A good stable master needs no druid's help.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Elissa Dumas (portal trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "elissa_dumas", id = TODO_NPC("Elissa Dumas"), name = "Elissa Dumas", title = "Portal Trainer",
  bible = "bibles/darnassus_folk.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "brisk", "wry" }, values = { "learned", "practical" },
  notices = { "class", "race" },

  impression = {
    first = "Elissa Dumas is a human mage teaching portal magic inside the Temple of the Moon, which she admits is an odd place for a mage. She is careful with her words around the priestesses and much less careful once they've gone.",
    third = "{name} met Elissa Dumas, the human mage who teaches Portal: Darnassus in the Temple of the Moon.",
  },

  greetings = {
    { id = "g_hello", text = "Oh, hello. Speak quietly, the priestesses frown at anything louder than a prayer." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Still in one piece, I see, which is a good start for anyone studying portals." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! You've no idea how nice it is to see a fellow student of the arcane in a city that thinks we're one step from a satyr." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Another human! Where are you from? I'm Stormwind born, though I've been here long enough that I've started to sleep through the day." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Elissa Dumas. I teach mages to open a portal to Darnassus, which is a useful thing to know and a difficult thing to learn. If you're not a mage, I'm afraid I can't do much for you except talk." },
        { id = "h_mage_low", when = { class = "MAGE", maxLevel = 39 },
          text = "A mage, but a young one. Come back when you've more power in your hands, and I'll teach you to fold the world between here and wherever you're standing." },
        { id = "h_mage", when = { class = "MAGE", minLevel = 40 },
          text = "A mage, and seasoned enough. Portals are a matter of precision, so if your mind wanders while you cast, you'll end up somewhere you'd rather not." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Ask, quietly." },
      },
      choices = {
        { text = "Teach me the portal.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Why does a human mage live here?", next = "why" },
        { text = "How do the elves treat a mage?", next = "elves" },
        { text = "Thank you.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "The Alliance needs its mages able to reach every capital, and the kaldorei won't teach the arcane, so someone had to come. I volunteered before I understood how quiet it would be." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elves = {
      lines = { { id = "el_default", text = "Politely, and with great care, the way you'd treat a guest who's brought a lit torch to a library. After what their own mages did to them long ago, I can't really blame them." } },
      choices = {
        { text = "They're right to be wary of the arcane.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The arcane is a tool. Their fear is old superstition.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Lairn (banker)
---------------------------------------------------------------------------
P:NPC {
  key = "lairn", id = TODO_NPC("Lairn"), name = "Lairn", title = "Banker",
  bible = "bibles/darnassus_folk.md", role = "banker", tier = "service",
  communities = { "darnassus" }, temper = { "precise", "calm" }, values = { "careful", "honest" },
  notices = { "purse" },

  impression = {
    first = "Lairn keeps the vaults in the Temple Gardens with Garryeth and Idriana, and treats every deposit as if it were an heirloom. He counts slowly, never makes a mistake, and is still unsettled by a shield with an orc's axe in it.",
    third = "{name} met Lairn, a banker of Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Welcome to the vaults. Your belongings will be safe here for as long as you like." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Your vault is exactly as you left it." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "You carry a great deal of gold on your person. I'd suggest leaving some with us, gently." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Lairn, a keeper of the vaults. What you leave in the vaults of the Temple Gardens stays exactly where you put it, and no one but you will ever lay a hand on it." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "What else may I do for you?" },
      },
      choices = {
        { text = "I'd like to see my vault.", next = "BUSINESS" },
        { text = "What do the kaldorei keep in vaults?", next = "keep" },
        { text = "Is anything in the vaults ever trouble?", next = "name" },
        { text = "Thank you.", next = "END" },
      },
    },
    keep = {
      lines = { { id = "ke_default", text = "Less gold than the humans do, and more memories: a letter from someone lost at Hyjal, a glaive from the War of the Ancients, seeds from a tree that no longer grows. Those are the things I'm most careful with." } },
      choices = {
        { text = "Memories are worth more than gold.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Gold buys new memories. I'll keep the coin.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "Magical things, mostly, deposited unwrapped by people in a hurry. I once sat up all night watching a wand hum in its box, and Garryeth still tells the story at every opportunity." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Landria (bow merchant)
---------------------------------------------------------------------------
P:NPC {
  key = "landria", id = TODO_NPC("Landria"), name = "Landria", title = "Bow Merchant",
  bible = "bibles/darnassus_folk.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "cheerful", "proud" }, values = { "craft", "practical" },
  notices = { "class" },

  impression = {
    first = "Landria sells bows and arrows on the Tradesmen's Terrace and will tell you the wood, the age and the temperament of every bow on her rack. She judges customers by how they hold a bowstring.",
    third = "{name} met Landria, who sells bows and arrows in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Come, come, try the draw on any of them. You'll know the right one when it fights back a little." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did the last bow treat you well?" },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "WARRIOR", "ROGUE" } },
      text = "You've calluses where an archer has them. Good; then I can show you the better stock." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Landria, and these are the finest bows in Darnassus, though Jeena in Dolanaar would argue that. Every one is cut from wood the forest gave up freely, and every one shoots true." },
      },
      again = {
        { id = "h_again", text = "Anything else? Try another bow while you think." },
        { id = "h_again2", text = "What else?" },
      },
      choices = {
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "Wood the forest gave up freely?", next = "wood" },
        { text = "Bow or gun, which is better?", next = "guns" },
        { text = "Thank you.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "wo_default", text = "Fallen limbs, and branches the druids say the trees can spare, and never a living trunk. It makes for fewer bows than I'd like, but I sleep well, and so do the trees." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guns = {
      lines = { { id = "gu_default", text = "Ask a dwarf and you'll hear one answer, ask me and you'll hear another. A gun is loud and a bow is quiet, and in a forest at war, quiet keeps you alive." } },
      choices = {
        { text = "A bow, then. Silence is a weapon.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Give me the gun. Let them hear me coming.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}
