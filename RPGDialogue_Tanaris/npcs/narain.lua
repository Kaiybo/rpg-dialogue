-- Narain Soothfancy: retired gnome engineer and self-styled master soothsayer at Steamwheedle Port,
-- old acquaintance of Azuregos, and the man behind the blue shard of the Scepter of the Shifting Sands.
-- Voice: bibles/narain.md
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "narain", id = TODO_NPC("Narain Soothfancy"), name = "Narain Soothfancy",
  bible = "bibles/narain.md", role = "questgiver", tier = "quest",
  communities = { "steamwheedle_port" }, temper = { "theatrical", "scatterbrained" }, values = { "craft", "vanity" },
  notices = { "race", "class", "level" },

  impression = {
    first = "Narain Soothfancy holds sealed envelopes to his forehead and guesses wrong with total confidence. He's a retired engineer who calls himself a master soothsayer, keeps an owl named O'Reily, and is still bitter about his ex-best friend Stewvul.",
    third = "{name} met Narain Soothfancy, the gnome 'soothsayer' of Steamwheedle Port who once crashed a gyrocopter and woke up psychic, or says he did.",
  },

  greetings = {
    { id = "g_default", text = "Narain Soothfancy, at your service! Retired engineer and master soothsayer! I can tell your future before it even happens!" },
    { id = "g_back", when = { metBefore = true }, text = "Don't tell me! You've come back! Ha, I knew it, I saw it in the tea leaves, or possibly the coffee." },
    { id = "g_envelope", text = "<Narain holds an unopened envelope to his forehead.> What is... mmmm... velvet! Am I right?" },
    { id = "g_away", when = { away = 30 }, text = "You've been away {away}, which I predicted, more or less, give or take {away}." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome! Then you'll understand that soothsaying is merely engineering for the future, with fewer spanners and more incense." },
    { id = "n_young", cat = "level", when = { maxLevel = 54 },
      text = "I see great things in your future, friend, most of them years away. Come back when you're a little more... future." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Don't tell me! Shhh! You're here about... something enormously important? Yes... yes... the spirits are a little fuzzy today, but they assure me it's enormous. What can I help you with, {race}?" },
        { id = "h_ledger", when = { questActive = TODO_QUEST("Azuregos's Magical Ledger") },
          text = "Is that a ledger? A blue, frosty, faintly dragon-smelling ledger? Azuregos, you old flapper, you never could write in plain Common." },
        { id = "h_stewvul", when = { questActive = TODO_QUEST("Stewvul, Ex-B.F.F.") },
          text = "Have you found Stewvul yet? My crystal ball says the Greymane Wall in Silverpine, or possibly somewhere much worse, and I need those goggles back before I can translate a single word." },
        { id = "h_buoy", when = { questActive = TODO_QUEST("The Good News and The Bad News") },
          text = "Arcanite, elementium and gemstones, mountains of them, for one little buoy. I'm ninety-nine percent sure it'll work, and the other one percent is mostly paperwork." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "Don't tell me! You're here about the Ashbringer! Yes... yes... no! My mistake, completely different glowing person." },
      },
      again = {
        { id = "h_again", text = "What else? I already know, of course, but I like to hear you say it." },
        { id = "h_again2", text = "Go on, ask. I'll pretend to be surprised." },
      },
      choices = {
        { text = "You're a soothsayer? Really?", next = "sooth" },
        { text = "How do you know Azuregos?", next = "azuregos" },
        { text = "Who is Stewvul?", next = "stewvul" },
        { text = "Who's the owl?", next = "oreily" },
        { text = "What exactly is your business?", next = "business", when = { minLevel = 55 } },
        { text = "Predict my future, then.", next = "predict" },
        { text = "I'll see myself out.", next = "END" },
      },
    },

    sooth = {
      lines = { { id = "so_default", text = "Indeed! I was a perfectly ordinary engineer until I crashed my gyrocopter on Land's End Beach, and when I came to, I had super-gnomish psychic powers. Also a concussion, but mostly the powers." } },
      choices = {
        { text = "Are you sure it wasn't just the concussion?", next = "so_conc" },
        { text = "Why were you flying out there?", next = "so_why" },
      },
    },
    so_conc = {
      lines = { { id = "soc_default", text = "Quite sure! The concussion wore off after a week, and the powers didn't, so you see, it's science. Admittedly my predictions are wrong more often than they're right, but that's just the future being uncooperative." } },
      choices = {
        { text = "That's not how science works.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "I suppose the future is stubborn.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    so_why = {
      lines = { { id = "sow_default", text = "Hiding a book, of course, on an island in the South Seas that nobody could ever hope to find. I needed a gyrocopter just to get there, and I crashed it on the way back, which I think proves how well-hidden it was." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    azuregos = {
      lines = { { id = "az_default", text = "An old acquaintance, from before the powers! He says I'm a terrible, terrible psychic but an amazing engineer, which is the sort of thing a dragon thinks is a compliment. He writes in the most dreadful draconic scrawl, so naturally he sends things to me to translate." } },
      choices = {
        { text = "A blue dragon is your friend?", next = "az_friend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    az_friend = {
      big = true,
      lines = { { id = "azf_default", text = "Friend is a strong word for a dragon, but he hasn't eaten me, and that's a firm foundation. Some say you shouldn't deal with dragons at all, because they're older than us and know it, but I say knowledge is knowledge, scaly or not." } },
      choices = {
        { text = "Dragons have their own schemes. Be careful.", next = "BACK", reply = "Careful's my middle name, friend, right after Soothfancy, and I've seen enough in the ball to know a dragon never gives anything away without a reason.", fx = { align = { order = 1 } } },
        { text = "Knowledge is worth the risk, scales and all.", next = "BACK", reply = "Now that's the kind of talk I like to hear, because the folks who play it safe never learn a thing worth sellin'.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stewvul = {
      lines = { { id = "st_default", text = "My ex-best friend forever! He broke my heart in five places and then stole my scrying goggles and left me here to rot. Without those goggles I can't translate anything, and I'm not going to forgive him, ever, not even a little." } },
      choices = {
        { text = "What happened between you two?", next = "st_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    st_what = {
      lines = { { id = "stw_default", text = "He was my part-time best friend forever and I was his full-time servant, that's what happened! I did all the inventing and he did all the borrowing, and one day he borrowed everything and didn't come back." } },
      choices = {
        { text = "He doesn't sound much like a friend.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Maybe you should forgive him.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },

    oreily = {
      lines = { { id = "or_default", text = "That's O'Reily! He's an owl. He doesn't say much, except at night, when he says it very loudly, mostly at me." } },
      choices = {
        { text = "O'Reily?", next = "or_ya" },
        { text = "Something else.", next = "BACK" },
      },
    },
    or_ya = {
      lines = { { id = "ory_default", text = "Ya, really. People keep asking me that, and he keeps hooting, and I've decided it's a sort of agreement between them that I'm not part of." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    business = {
      lines = { { id = "bu_default", text = "If there's one thing you should know about me, it's this: never ask me about my business! I work with things you simply cannot understand, like a psychotronic muzzledorf, and that's why we leave the planning to me and the fetching to you." } },
      choices = {
        { text = "What's a psychotronic muzzledorf?", next = "bu_muzz" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bu_muzz = {
      lines = { { id = "bum_default", text = "You see? You asked! I told you not to ask, and you asked anyway, and now we've both learned something about you. Now go and see Dirge Quikcleave, the cook in Gadgetzan, about a five-hundred-pound chicken, and stop asking." } },
      choices = { { text = "A five-hundred-pound chicken?", next = "BACK" } },
    },

    predict = {
      lines = {
        { id = "pr_default", text = "<Narain presses two fingers to his temple.> I see... sand. A great deal of sand. And you, walking through it, probably toward something important, possibly a tavern." },
        { id = "pr_night", when = { timeOfDay = "night" }, text = "<Narain squints at the stars.> I see... an owl. No, that's O'Reily. Let me try again tomorrow, the night's very distracting." },
      },
      choices = {
        { text = "That's the most accurate prediction you've made.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "I don't think you're psychic at all.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The future, mostly, and draconic, and where I left my book. Two of those are reliable." } },
    background = { { id = "tp_bg", text = "Engineer, crash survivor, soothsayer. In that order, and the middle one was the important bit.", next = "sooth" } },
    advice = { { id = "tp_ad", text = "Never lend your goggles to a best friend forever. Forever lasts about as long as the goggles do." } },
    steamwheedle = { { id = "tp_steam", text = "The goblins rent me this spot and don't ask what I do in it, which is the best arrangement I've ever had." } },
    _none = { { id = "tp_none", text = "<Narain touches his forehead.> Nothing. The spirits are on their lunch break." } },
  },
}
