-- Princess Poobah: a tauren held captive on Jaguero Isle by the Skymane gorilla King Mukla, who throws messages in bottles out to sea. Voice: bibles/poobah.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "poobah", id = TODO_NPC("Princess Poobah"), name = "Princess Poobah",
  bible = "bibles/poobah.md", role = "questgiver", tier = "quest",
  communities = { "stranglethorn" }, temper = { "imperious", "dramatic" }, values = { "proud", "hopeful" },
  notices = { "race", "status" },

  impression = {
    first = "Princess Poobah is a tauren held captive by a gorilla king on Jaguero Isle, and she was more upset about her treatment than her danger. She insists on being called a princess, and I didn't feel brave enough to ask of what.",
    third = "{name} found Princess Poobah, a tauren captive of King Mukla, on Jaguero Isle off the coast of Stranglethorn.",
  },

  greetings = {
    { id = "g_default", text = "Have you come to free me? Please say that you have, by the Earth Mother, because I've run out of bottles." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned! Is that gorilla king dealt with yet, or have you simply come to admire my predicament?" },
    { id = "g_freed", when = { questDone = TODO_QUEST("Message in a Bottle") }, text = "Thank you again for your aid. May the winds always be at your back, and may the eternal sun shine upon your travels." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of my own people! Then you'll understand how undignified it is for a tauren to be kept on an island by a monkey." },
    { id = "n_status", cat = "status", when = { reputation = { faction = "Booty Bay", min = "honored" } },
      text = "You smell of Booty Bay, and quite respectably, and the sailors who've come past this island smelled of nothing but bilge and rum." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Princess Poobah, and a great Skymane, the gorilla king Mukla, holds me captive on this wretched island, which is no way to treat a daughter of the plains. I threw messages in bottles toward the ships for days, and you're the first to answer." },
        { id = "h_bottle", tags = { "news" }, when = { questActive = TODO_QUEST("Message in a Bottle") },
          text = "You found one of my bottles! I knew my throwing arm was good for something. King Mukla is the beast who keeps me here, and as long as he lives, I'll never leave this beach." },
        { id = "h_free", tags = { "news" }, when = { questRecent = { TODO_QUEST("Message in a Bottle"), days = 3 } },
          text = "Free! Truly free, and on my way at last, like a kodo let out of the pen. I'll tell everyone I meet of your courage, or at least the ones who'll listen." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde colours, how wonderful! I don't suppose Thunder Bluff knows I'm missing? No? Well, they will once I've told the story properly." },
      },
      again = {
        { id = "h_again", text = "What else? A princess is always ready to hold court, even on sand." },
        { id = "h_again2", text = "Go on, I'm listening, though I must keep one ear turned to the trees for that monkey, the way a calf learns to listen for wolves." },
      },
      choices = {
        { text = "Princess of what, exactly?", next = "princess" },
        { text = "Who is this great Skymane?", next = "mukla" },
        { text = "You look like you've had a hard time of it.", next = "captive" },
        { text = "How did you throw bottles all the way to the shore?", next = "bottles" },
        { text = "Mulgore's a long way from here, Princess.", next = "xtauren", when = { race = "Tauren" } },
        { text = "I'll see what I can do.", next = "END" },
      },
    },

    princess = {
      lines = {
        { id = "pr_default", text = "Of a great many things that are none of your concern, and you'll take my word for it. Stop looking at me as if I'm some sort of mad cow, because you don't know what it's like being a princess." },
      },
      choices = {
        { text = "I'll take your word for it, your highness.", next = "princess_humor" },
        { text = "I don't believe you're a princess at all.", next = "princess_humor" },
      },
    },
    princess_humor = {
      lines = {
        { id = "ph_default", text = "Whatever you believe, I'm the one in the cage with the good manners, and he's the one eating fruit with his feet. That's what royalty comes down to, in the end." },
      },
      choices = {
        { text = "Titles matter. You should be treated as one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Titles mean nothing on an island like this.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mukla = {
      lines = {
        { id = "mu_default", text = "The great Skymane King Mukla, who calls himself a king, if a gorilla can call himself anything. He rules this island with his silverbacks and he's decided I'm his, like a shiny shell on the beach." },
      },
      choices = {
        { text = "What does he want with you?", next = "mukla_want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mukla_want = {
      lines = {
        { id = "mw_default", text = "Company, I think, and an audience, and someone to scream at when the bananas are bad. He's never hurt me, I'll give him that, but a kind jailer is still a jailer." },
      },
      choices = {
        { text = "Then he'll pay for keeping you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "If he's never hurt you, perhaps I can drive him off instead.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    captive = {
      lines = {
        { id = "ca_default", text = "It's a long and very tragic story, and I've been held by worse than gorillas, if you'd believe it. There was a troll called Zanzil before this, with his potions and his zombies, and by comparison Mukla has been a perfect gentleman." },
      },
      choices = {
        { text = "This Zanzil held you?", next = "captive_zanzil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    captive_zanzil = {
      lines = {
        { id = "cz_default", text = "Briefly, and unpleasantly, and he wanted to see what his mixtures would do to a tauren. I escaped him, swam the wrong way, and washed up here, which is the sort of luck I seem to have." },
      },
      choices = {
        { text = "Your luck is changing. I'm here.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bottles = {
      lines = {
        { id = "bo_default", text = "I have a very good arm, thank you for noticing, and the bottles wash up all along this coast from the rum the pirates throw overboard. I wrote as neatly as I could, because one must keep up standards." },
      },
      choices = {
        { text = "What did you write?", next = "bottles_note" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bottles_note = {
      lines = {
        { id = "bn_default", text = "That a great gorilla holds me captive, and that on the clearest days I could see the Wild Shore to the northwest and big sailing ships to the southwest. It isn't poetry, but it worked, didn't it?" },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xtauren = {
      big = true,
      lines = {
        { id = "xt_default", text = "It is, and I miss the grass and the wind and the good honest smell of kodo. Promise me you won't tell anyone in Thunder Bluff how I ended up here, because I'd never hear the end of it." },
      },
      choices = {
        { text = "Your secret's safe. The Earth Mother hears all, though.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "It's too good a story not to tell.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A princess of the tauren, I'll have you know, captured twice and rescued once, so far." } },
    advice = { { id = "tp_ad", text = "Never swim when you're upset. The Earth Mother gave tauren hooves for walking, and you end up on islands." } },
    _none = { { id = "tp_none", text = "A princess doesn't concern herself with that sort of thing, and the Earth Mother can't hear me out here anyway." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof is the high chieftain of my people, and I'll have you know he's met me personally, once. He'll be very upset to hear how I've been treated." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother watches over all her children, even princesses kidnapped by gorillas. I pray to her every night, very loudly, so the gorilla king hears." } },
    booty_bay = { { id = "tp_booty_bay", text = "I was on my way to Booty Bay for a little shopping when the gorillas took me. I suppose I'll have to buy twice as much when I get there now." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is an orc of great taste, I'm sure, and he'd never allow a princess to be held by a gorilla. Somebody should write to him about this." } },
  },
}
