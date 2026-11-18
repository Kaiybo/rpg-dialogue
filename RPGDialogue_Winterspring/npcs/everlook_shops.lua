-- More of Everlook's goblins: Izzy Coppergrab (banker), Lunnix Sprocketslip (mining supplies),
-- Zap Farflinger (the "unbalanced engineer" with the dimensional ripper).
-- Voice: bibles/everlook_shops.md (goblin standard, CONTENT_GUIDE §2)
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Izzy Coppergrab
---------------------------------------------------------------------------
P:NPC {
  key = "izzy_coppergrab", id = TODO_NPC("Izzy Coppergrab"), name = "Izzy Coppergrab", title = "Banker",
  bible = "bibles/everlook_shops.md", role = "banker", tier = "service",
  communities = { "everlook" }, temper = { "smooth", "shrewd" }, values = { "profit", "careful" },
  notices = { "purse" },

  impression = {
    first = "Izzy Coppergrab runs the bank in Everlook and counts your coins while you're still holding them. He swears his vault is the safest in Kalimdor and charges accordingly.",
    third = "{name} met Izzy Coppergrab, the goblin banker of Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to the Bank of Everlook, friend, where your valuables are safe, warm and very modestly charged." },
    { id = "g_back", when = { metBefore = true }, text = "A returning customer! My favorite kind, pal, because returning customers have already read the small print." },
  },

  notice = {
    { id = "n_purse", cat = "purse", when = { money = { min = 1000000 } },
      text = "Whoa, whoa, is that a hundred gold I hear jingling? Buddy, you shouldn't be walkin' around Winterspring with that, not when I've got a perfectly good vault right here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Izzy Coppergrab, banker, and the Bank of Everlook is the only vault between Felwood and the end of the world, so you're not gonna find a better one, pal, or a cheaper one, or any other one. Deposits, withdrawals, safe storage, all on account." },
        { id = "h_poor", when = { money = { max = 1000 } },
          text = "Izzy Coppergrab, banker, and I can see by the way you're walkin' that your purse is light, chum. That's fine, that's fine, the vault holds more than gold, and a poor customer today is a rich one next season." },
      },
      again = { { id = "h_again", text = "What else, pal? Questions are free, interest isn't." } },
      choices = {
        { text = "Open my vault.", next = "BUSINESS" },
        { text = "How safe is your vault, really?", next = "safe" },
        { text = "Does the bank serve both factions?", next = "factions" },
        { text = "Goodbye, Izzy.", next = "END" },
      },
    },
    safe = {
      lines = { { id = "sa_default", text = "Safer than a dwarf's beard in a blizzard, pal. Three locks, two guards, and one Bruiser who doesn't understand the word 'bribe', which cost me a fortune to find. Nobody's robbed this bank, and the last fella who tried is still payin' off the damages." } },
      choices = {
        { text = "What did he try?", next = "safe_tried" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_tried = {
      lines = { { id = "st_default", text = "Tunnelled up through the floor, the genius, right into the bit of the vault where I keep the blasting powder for the miners. Took his eyebrows, took my floorboards, and took him six months of sweeping to pay back the floorboards." } },
      choices = { { text = "That's a hard lesson.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    factions = {
      big = true,
      lines = { { id = "fa_default", text = "Both, all, everybody, pal. Gold doesn't fly a flag, and neither does a Steamwheedle banker. I've had Horde and Alliance in my queue at the same time, glarin' at each other, and they both paid the same fee." } },
      choices = {
        { text = "That's how it should be. Business keeps the peace.", next = "BACK", fx = { align = { order = 1 }, learn = { "steamwheedle" } } },
        { text = "Some things should matter more than coin, Izzy.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Gold, vaults, and who in Everlook owes who what. I only sell two of those." } },
    steamwheedle = { { id = "tp_sw", text = "The Cartel keeps the books, pal, and I keep the Cartel's books, so we get along great." } },
    _none = { { id = "tp_none", text = "That's not a currency I deal in, friend." } },
  },
}

---------------------------------------------------------------------------
-- Lunnix Sprocketslip
---------------------------------------------------------------------------
P:NPC {
  key = "lunnix", id = TODO_NPC("Lunnix Sprocketslip"), name = "Lunnix Sprocketslip", title = "Mining Supplies",
  bible = "bibles/everlook_shops.md", role = "vendor", tier = "service",
  communities = { "everlook" }, temper = { "brisk", "cheerful" }, values = { "profit", "practical" },
  notices = { "miner" },

  impression = {
    first = "Lunnix Sprocketslip sells picks, flux and coal in Everlook and talks about thorium the way some people talk about sweethearts. Everyone calls her Lunny, and she lets them, for a price.",
    third = "{name} met Lunnix Sprocketslip, who sells mining supplies in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Picks, flux, coal, all the things a miner forgets to pack! Step on in, sweetheart." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The mountains eat picks, don't they, pal? Good for me, bad for you." },
  },

  notice = {
    { id = "n_miner", cat = "miner", when = { profession = "Mining" },
      text = "You've got rock dust in every crease, sweetheart, so you're a miner or you fell down a very long hole. Either way, you're my kind of customer." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lunnix Sprocketslip, mining supplies, and you can call me Lunny if you're buyin'. Winterspring's hills are full of thorium and the yetis are full of opinions about who gets to dig it, so you'll want a good pick and a fast pair of boots." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! You lot can smell ore through a mountain, I swear by my mother's ledger. Tell me where the thorium is and I'll owe you one, and you know how rare it is to hear a goblin say that." },
      },
      again = { { id = "h_again", text = "What else, pal? I've got a crate of picks to price." } },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Where's the best mining in Winterspring?", next = "veins" },
        { text = "Who buys the ore around here?", next = "buyers" },
        { text = "Goodbye, Lunny.", next = "END" },
      },
    },
    veins = {
      lines = { { id = "ve_default", text = "That's the question, ain't it, and the answer costs extra, but I'll tell you the free part: the hills to the east and the caves the yetis live in. The yetis don't like visitors, so the ore's still there, and the ore bein' there is a thing I like very much." } },
      choices = {
        { text = "So you send miners into yeti caves?", next = "veins_yeti" },
        { text = "Something else.", next = "BACK" },
      },
    },
    veins_yeti = {
      big = true,
      lines = { { id = "vy_default", text = "I don't send anybody anywhere, pal, I just sell 'em picks and wave goodbye. What they do with the picks is between them and the yeti, and some of 'em come back rich, and some of 'em come back in pieces, and both kinds paid up front." } },
      choices = {
        { text = "You should warn them properly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Their risk, your profit. Smart.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "bu_default", text = "Malyfous and the Brotherhood buy thorium by the cartload, Wixxrak buys iron for his guns, and the auction house takes the rest for whoever's payin' most this week. Everybody in Everlook needs metal, sweetheart, and everybody needs me to sell 'em the pick to dig it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Ore, picks, and which hill's worth climbing. The last one costs extra." } },
    _none = { { id = "tp_none", text = "If it ain't rock, pal, I don't know it." } },
  },
}

---------------------------------------------------------------------------
-- Zap Farflinger
---------------------------------------------------------------------------
P:NPC {
  key = "zap_farflinger", id = TODO_NPC("Zap Farflinger"), name = "Zap Farflinger", title = "Unbalanced Engineer",
  bible = "bibles/everlook_shops.md", role = "trainer", tier = "service",
  communities = { "everlook" }, temper = { "excitable", "chatty" }, values = { "inventive", "ambitious" },
  notices = { "goblin_eng", "gnome_eng" },

  impression = {
    first = "Zap Farflinger calls himself an unbalanced engineer and means it as a boast. He has built a dimensional imploder in Everlook and is looking for a goblin engineer brave enough to blow themselves up with it.",
    third = "{name} met Zap Farflinger, the goblin engineer in Everlook with the dimensional imploder.",
  },

  greetings = {
    { id = "g_default", text = "Hey, hey, careful where you step, pal, that's a live wire and it's very proud of itself!" },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Most people don't, and I'm still workin' out whether that's the imploder or my personality." },
  },

  notice = {
    { id = "n_goblin", cat = "goblin_eng", when = { profession = "Engineering", race = "Goblin" },
      text = "A goblin engineer! Sparks and sprockets, you're exactly who I've been waitin' for, chum, and I've got a business proposal that's gonna change your life or end it." },
    { id = "n_gnome", cat = "gnome_eng", when = { profession = "Engineering", race = "Gnome" },
      text = "Oh, a gnome engineer. Very nice, very neat, very safe. Come back when you've lost an eyebrow, kid, and we'll talk shop." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Zap Farflinger, unbalanced engineer, and I've just finished a dimensional imploder that'll make me rich beyond my wildest goblin dreams. All I need is a skilled goblin engineer to build a dimensional ripper that connects to it and try it out, and the line for that job is, let's say, short." },
        { id = "h_eng", when = { profession = "Engineering" },
          text = "An engineer! Now we're talkin', pal. The question is: are you the careful kind, or the real kind, because the careful kind never gets rich and the real kind sometimes gets rich and always gets interesting." },
      },
      again = {
        { id = "h_again", text = "What else, buddy? Talk fast, the imploder's humming." },
        { id = "h_again2", text = "Go on, ask, I love questions. Questions are just orders that haven't paid yet." },
      },
      choices = {
        { text = "How does the dimensional imploder work?", next = "imploder" },
        { text = "Why do you call yourself unbalanced?", next = "unbalanced" },
        { text = "Teach me what you know.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "I'll stand somewhere else, thanks.", next = "END" },
      },
    },
    imploder = {
      lines = { { id = "im_default", text = "The theory is beautiful, pal. We completely destroy you with a massive explosion wherever you are, send the particles through a dimensional rip, and re-implode you right here in Everlook. Instant transport! It might not work all the time, but what kind of goblin engineer worries about that?" } },
      choices = {
        { text = "That sounds incredibly dangerous.", next = "imploder_danger" },
        { text = "Has anyone tried it?", next = "imploder_tried" },
      },
    },
    imploder_danger = {
      big = true,
      lines = { { id = "id_default", text = "Course it's dangerous, chum! If survival was your first priority, you could never be a real goblin engineer. We goblin engineers laugh at danger, and sometimes danger laughs back, and that's just the overhead." } },
      choices = {
        { text = "Fortune favors the bold. I'd try it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Some risks aren't worth any profit.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    imploder_tried = {
      lines = { { id = "it_default", text = "Plenty! Well, some. Well, a couple, and they mostly arrived, and the ones who arrived in the wrong place sent very angry letters, which proves they arrived somewhere. That's a success in my ledger, pal." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    unbalanced = {
      lines = { { id = "un_default", text = "Because balanced engineers build bridges, and bridges are boring, and I'd sooner build somethin' that makes the bridge unnecessary. My cousin's a balanced engineer, and he's got all his fingers and no money, so you tell me which of us got it right." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Explosions, rips in reality, and how to sell both." } },
    gnomeregan = { { id = "tp_gnomer", text = "Gnomes, buddy. Very tidy, very careful, very irradiated. No offense." } },
    _none = { { id = "tp_none", text = "No idea, pal, but if you find out, I bet I can make it explode." } },
  },
}
