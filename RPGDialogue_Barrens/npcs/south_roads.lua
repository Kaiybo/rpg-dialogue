-- The southern and eastern Barrens away from the towns: a prisoner in Northwatch Hold and a warlock alone by his fire. Voices: bibles/<key>.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gilthares", id = TODO_NPC("Gilthares Firebough"), name = "Gilthares Firebough",
  bible = "bibles/gilthares.md", role = "questgiver", tier = "quest",
  temper = { "anxious" }, values = { "loyal", "honest" },
  notices = { "stealth", "kit" },
  impression = {
    first = "Gilthares Firebough crewed for Captain Brightsun until Northwatch's guns put his ship on the rocks, and now he sits in a cell and whispers between the guards' rounds. He is no spy, only a deckhand who washed up on the wrong beach.",
    third = "{name} found Gilthares Firebough, a privateer deckhand held prisoner in Northwatch Hold.",
  },

  greetings = {
    { id = "g_hush", text = "Quietly, please, because the guards come round every few minutes." },
    { id = "g_escort", when = { questActive = TODO_QUEST("Free From the Hold") }, text = "Lead on, and quickly, before they notice the empty cell. Ratchet is south down the coast, and I'll follow as close as your shadow." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You got all the way in here without the guards seeing you, which means you could get me out the same way, couldn't you?" },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like you fought your way in, and the way out won't be any easier. Are you sure you're fit for it?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Keep your voice down, please, because the guards don't like me talking. My name's Gilthares Firebough, and I crewed for Captain Brightsun out of Ratchet until Northwatch's guns put our ship on the rocks." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You wear Alliance colours, so I suppose you'll be calling the guards on me. Before you do, hear me out, because I'm no soldier, only a deckhand who washed up on the wrong beach." },
        { id = "h_before", when = { faction = "Horde", questBefore = TODO_QUEST("Free From the Hold") },
          text = "You're Horde, and you got this far inside, so you must be good at this. Please, I've been in this cell for weeks, and if you can get me as far as Ratchet, Captain Brightsun will see you rewarded." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quickly, though, because I can hear boots on the stair." },
        { id = "h_again2", text = "Go on, I'm listening. It's not as if I have anywhere to be." },
      },
      choices = {
        { text = "Why are they holding you?", next = "why" },
        { text = "What was your ship carrying?", next = "cargo" },
        { text = "Who is Captain Brightsun?", next = "captain" },
        { text = "I'll get you out of here.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "I should call the guards.", next = "guards", when = { faction = "Alliance" } },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Our ship took a broadside from the Northwatch guns as we came up the coast, and I washed ashore half drowned right under their walls. They've decided I'm a Horde spy, which would be flattering if I knew a single thing worth spying on." } },
      choices = {
        { text = "Are you a spy?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      big = true,
      lines = { { id = "wh2_default", text = "I'm a deckhand, and I can barely spot the next wave coming, never mind a secret. Northwatch fires on anything that sails too near, Horde or neutral, and if they let me go they'd have to admit they sank a Ratchet ship for nothing." } },
      choices = {
        { text = "Northwatch has every right to guard its own coast.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sinking a neutral ship is piracy, whatever the banner.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cargo = {
      lines = { { id = "ca_default", text = "Moonshine, mostly, meant for the thirsty half of Ratchet, which is most of Ratchet. There were a few crates the captain told me not to open, as well, so I didn't." } },
      choices = {
        { text = "You must know what was in the crates you didn't open.", next = "cargo2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cargo2 = {
      lines = { { id = "ca2_default", text = "I didn't open them, did I? Though if the Northwatch quartermaster has been drinking well this month, I'd say we know where the rest of our cargo went." } },
      choices = { { text = "Something else, Gilthares.", next = "BACK" } },
    },
    captain = {
      lines = { { id = "cp_default", text = "Thalo'thas Brightsun, captain of the Thalo'dan Privateers, and the best captain on this coast if you ask his crew. He holds a grudge longer than anyone I've ever sailed with, so Northwatch will be hearing from him again, whether I'm in this cell or not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guards = {
      big = true,
      lines = { { id = "gu_default", text = "You could, and they'd thank you for it, and I'd sit in this cell until Theramore remembers I exist, which could be years. All I ask is that you think on whether you'd want the same, if your ship had gone down on the wrong beach." } },
      choices = {
        { text = "Northwatch has its reasons. I won't interfere.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're no spy. I won't call anyone.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've hauled rope on Captain Brightsun's decks for longer than I care to count, and I was good at it, right up until the ship sank." } },
    advice = { { id = "tp_ad", text = "Never sail within sight of Northwatch's walls. I'd have liked someone to tell me that." } },
    _none = { { id = "tp_none", text = "I've been in a cell for weeks, friend. I don't know much of anything anymore." } },
  },
}

P:NPC {
  key = "doan_karhan", id = TODO_NPC("Doan Karhan"), name = "Doan Karhan",
  bible = "bibles/doan_karhan.md", role = "questgiver", tier = "quest",
  temper = { "calm" }, values = { "cunning", "patient" },
  notices = { "fel", "light" },
  impression = {
    first = "Doan Karhan keeps a lonely fire in the Barrens and a binding circle he asks visitors to walk around. He says solitude is the warlock's oldest companion and that he would rather be lonely than owned.",
    third = "{name} met Doan Karhan, a solitary warlock camped in the Barrens who seeks the scattered Orb of Soran'ruk.",
  },

  greetings = {
    { id = "g_fire", text = "Sit on that side of the fire, if you would. This side is spoken for." },
    { id = "g_orb", when = { questActive = TODO_QUEST("The Orb of Soran'ruk") }, text = "You've come back. Show me what you've found, and we'll see how close the orb is to whole." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "You came at night, which is when the circle is busiest. Walk carefully." },
  },

  notice = {
    { id = "n_fel", cat = "fel", when = { class = "WARLOCK", pet = true },
      text = "Your servant is restless, and so is mine. Keep yours on your side of the fire, if you please." },
    { id = "n_light", cat = "light", when = { class = { "PALADIN", "PRIEST" } },
      text = "You carry the Light like a lantern, and lanterns draw things out of the dark. Stand well back from my circle." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Few walk this far from the road without a reason, and fewer still find my fire on purpose. I am Doan Karhan, and if you are not a warlock, I'll ask you to keep your distance from the circle." },
        { id = "h_warlock", when = { class = "WARLOCK" },
          text = "One of us, and a long way from your masters. You've come about the orb, I expect, or you will once you've heard of it." },
        { id = "h_orb", when = { questActive = TODO_QUEST("The Orb of Soran'ruk") },
          text = "Three of the small fragments from the Twilight acolytes in Blackfathom Deeps, and the large one from the voidwalkers in Shadowfang Keep. Bring them all, and I will bind them into something worth carrying." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren at my fire. Your people look at me the way they'd look at a sick kodo, with pity and a long way off, so say what you came to say." },
      },
      again = {
        { id = "h_again", text = "Something more? The fire will last, even if my patience won't." },
        { id = "h_again2", text = "Ask. The hyenas have gone quiet, so we have a little while." },
      },
      choices = {
        { text = "What is the Orb of Soran'ruk?", next = "orb" },
        { text = "Why live out here alone?", next = "alone" },
        { text = "Something is bound inside that circle.", next = "circle" },
        { text = "How hard are the fragments to take?", next = "fragments", when = { class = "WARLOCK" } },
        { text = "I'll find your fragments.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "I'll leave you to your fire.", next = "END" },
      },
    },
    orb = {
      lines = { { id = "or_default", text = "An old focus for a warlock's power, broken long ago into fragments that have wandered off into dark places on both continents. Mended, it steadies the hand and feeds the shadow, and I've wanted one whole for longer than you've been alive." } },
      choices = {
        { text = "Where are the fragments now?", next = "orb2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orb2 = {
      lines = { { id = "or2_default", text = "The small ones are with the Twilight's Hammer cultists in Blackfathom Deeps, who carry them without knowing what they are, and the largest is with the voidwalkers that serve Arugal in Shadowfang Keep. Both places are far from here, which is one reason I don't fetch them myself." } },
      choices = { { text = "Something else, Doan.", next = "BACK" } },
    },
    alone = {
      lines = { { id = "al_default", text = "Because the Crossroads would set a grunt at my tent flap and Taurajo would stand in my light with sad eyes, and I prefer the hyenas. They at least are honest about what they want from me." } },
      choices = {
        { text = "The solitude must wear on you.", next = "alone2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone2 = {
      big = true,
      lines = { { id = "al2_default", text = "Solitude is the warlock's oldest companion, older than any imp, and the ones who can't bear it end up making friends of their demons, which never ends well. I would rather be lonely than owned." } },
      choices = {
        { text = "A power that needs that much solitude is one to fear.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Better alone and strong than crowded and weak.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle = {
      lines = { { id = "ci_default", text = "A binding circle, freshly drawn, and the only reason the thing I spoke with last night went home again. Step around it, not over it, and we'll both sleep easier." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fragments = {
      lines = { { id = "fr_default", text = "The acolytes in Blackfathom wear theirs as charms, and it's easier to take one from a corpse than to argue them out of it. The voidwalkers in Shadowfang are another matter, because Arugal's servants guard their master's things the way a hound guards a bone." } },
      choices = {
        { text = "I'll manage. Something else.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Then I'll go now.", next = "BUSINESS" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I studied where I could and left when I had to, and the Barrens asks no questions of a man with a fire and a circle." } },
    advice = { { id = "tp_ad", text = "Draw your circle before you need it. Afterwards is too late, and usually rather loud." } },
    _none = { { id = "tp_none", text = "That is nothing to me. Ask at the Crossroads, where they like talking." } },
  },
}
