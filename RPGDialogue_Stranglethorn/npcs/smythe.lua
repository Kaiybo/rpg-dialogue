-- Markel Smythe: a Stormwind man who washed up in Booty Bay as rescued "salvage", worked off his own fee, and stayed on the upper landing as a sworn witness for wagers, bargains and duels. Voice: bibles/smythe.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "smythe", id = 2499, name = "Markel Smythe",
  bible = "bibles/smythe.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "wry", "sharp" }, values = { "honest", "practical" },
  notices = { "purse", "race" },

  impression = {
    first = "Markel Smythe is a sunburnt Stormwind man who calls himself salvage and means it as a boast. He watched my hands the whole time we talked, and I think he'd remember every word if anyone asked.",
    third = "{name} met Markel Smythe on Booty Bay's upper landing, a human who was rescued from the Bloodsail, billed for it by the Baron, and stayed on as the port's sworn witness.",
  },

  greetings = {
    { id = "g_landing", text = "Markel Smythe, at your service, so long as your service doesn't involve me going over this railing. What can I do for you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and with all your limbs! I was half expecting to witness your will the next time we met." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the jungle road eats people for less. I'm glad to see you up these stairs again, friend." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde colors on the upper landing, and nobody's drawn steel yet. That's Booty Bay for you, and it's why I stay." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Someone down on the docks says you sold them a story that didn't hold water. I'd have liked to be there, because I enjoy a good lie the way other men enjoy a good fire." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word on the landing is that you did someone in the Bay a good turn. I'll note it down, because good turns are rarer in this port than gold teeth." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "That purse of yours clinks loud enough for every cutpurse on this landing to count it. Wear it inside your coat, the way I learned to after my first week here." },
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "Your purse sounds about the way mine did the day the goblins fished me out of the cove, which is to say it doesn't sound at all. Booty Bay is a hard place to be poor, but it's a fine place to start over." },
    { id = "n_human", cat = "race", when = { race = "Human" }, place = "before",
      text = "Now there's a Stormwind face, or near enough to make me homesick. You've no idea how strange it is to hear my own accent come up those stairs." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear on the upper landing! The goblins like to say they built this cove, but your people were fishing it long before anyone thought to charge a docking fee." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "There it goes again, the air going quiet. Strom's students vanish on this landing twice an hour, so I keep a hand on my purse whenever it happens." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Markel Smythe, sworn witness of Booty Bay, though most folk up here just call me the human. If you've a wager, a bargain or a duel that wants an honest pair of eyes, I'm the one who never blinks." },
        { id = "h_human", when = { race = "Human" },
          text = "A human, and a long way from the Cathedral bells! Lean on the rail and talk to me a while, friend, because I haven't heard a proper Stormwind voice since the last merchantman limped in." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Welcome up, friend. I've witnessed bargains between orcs and goblins, trolls and dwarves, and once a tauren and a parrot, so you'll not find me squeamish about whose colors you wear." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "One of Strom's, or soon to be? His door's just along the landing, so don't take it personally if one hand stays on my purse while we talk." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "You've the look of someone who settles arguments on the pier, and in this town that means you'll need a witness sooner or later. Remember the name, friend: Smythe, with a y." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "A warlock, is it? I'll speak with you gladly, but if you ever bring me a contract written in anything redder than ink, the answer is no." },
        { id = "h_bloodsail", tags = { "news" }, when = { questActive = TODO_QUEST("The Bloodsail Buccaneers") },
          text = "You're running Seahorn's errands against the Bloodsail, I hear. Good, because I've a private grudge against those red sails, and I'd dearly love to witness the day their luck runs out." },
        { id = "h_bloodsail_done", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") },
          text = "You're the one who brought Seahorn the Bloodsail's letters. I've a long memory for faces, friend, and yours is filed under the good ones." },
        { id = "h_rain", when = { metBefore = true },
          text = "The rain comes sideways up here in the afternoons, and I've stopped noticing, which my mother would say is how Stranglethorn eats a man. Still, it's better than paying rent in Old Town." },
      },
      again = {
        { id = "h_again", text = "Go on, then, I'm listening. Listening is most of what I do for a living." },
        { id = "h_again2", text = "What else? I've nowhere to be until somebody starts a wager." },
        { id = "h_again3", text = "Ask away. The Bruisers won't need me to read for them until the evening ships come in." },
      },
      choices = {
        { text = "What's a human doing in a goblin port?", next = "salvage" },
        { text = "A sworn witness? What does that mean here?", next = "work" },
        { text = "Tell me about the people around here.", next = "around" },
        { text = "Smythe? I've heard that name before.", next = "name" },
        { text = "Do you ever think about going home?", next = "home" },
        { text = "I'm from Stormwind too, Markel.", next = "k_human", when = { race = "Human" } },
        { text = "A human who doesn't mind trading with the Horde is a rare thing.", next = "k_horde", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "You don't flinch at me, human. Why not?", next = "k_forsaken", when = { race = "Scourge" } },
        { text = "Goblin contracts must give you terrible headaches.", next = "k_gnome", when = { race = "Gnome" } },
        { text = "You've never seen one of my people, have you?", next = "k_sky", when = { race = "Skyborne" } },
        { text = "Does living beside Strom's door make you nervous?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you witness duels on the docks, Markel?", next = "xwar", when = { class = "WARRIOR" } },
        { text = "A witness swears an oath. Who do you swear to?", next = "xpala", when = { class = "PALADIN" } },
        { text = "Do people ever confess things to you?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Has a mage ever tried to fool your eyes?", next = "xmage", when = { class = "MAGE" } },
        { text = "I'd wager you've witnessed a bargain with a demon or two.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do hunters bring their wagers to you?", next = "xhunt", when = { class = "HUNTER" } },
        { text = "Does the jungle ever trouble you, up here?", next = "xdruid", when = { class = "DRUID" } },
        { text = "The spirits are witnesses too, Markel. Did you know that?", next = "xsham", when = { class = "SHAMAN" } },
        { text = "Keep your eyes open, Markel.", next = "END" },
      },
    },

    -- Why he's here: the salvage fee
    salvage = {
      lines = {
        { id = "sv_default", text = "Bad luck and goblin arithmetic, friend. I was a purser's mate on a Stormwind merchantman called the Ellery's Promise, and the Bloodsail took her off the Cape with me still counting barrels in the hold." },
        { id = "sv_horde", when = { faction = "Horde" }, text = "Bad luck and goblin arithmetic, friend. I was a purser's mate on a Stormwind merchantman, the Ellery's Promise, and the Bloodsail took her off the Cape, which I'd guess is the one thing your people and mine can agree to hate them for." },
      },
      choices = {
        { text = "How did you get from a Bloodsail hold to here?", next = "salvage_fee" },
        { text = "The Bloodsail took your ship? What did they do with you?", next = "salvage_hulk" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    salvage_hulk = {
      lines = { { id = "svh_default", text = "Chained us below in an old hulk off the Wild Shore while they wrote ransom letters to anyone who might pay, and nobody did. They took my boots, too, and to this day I look at every Bloodsail that washes up in the cove, hoping he's wearing them." } },
      choices = {
        { text = "Somebody must have got you out of there.", next = "salvage_fee" },
        { text = "I hope you find those boots someday.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, learn = { "bloodsail" } } },
      },
    },
    salvage_fee = {
      big = true,
      lines = { { id = "svf_default", text = "The Blackwater Raiders took the hulk, and the Baron ruled that any crew found aboard a captured ship was salvage, at so much a head. I couldn't pay my own price, so I spent three years tallying crates on the docks for the Cartel until I'd bought myself back, and by then I had a room, a trade and no reason to leave." } },
      choices = {
        { text = "A debt's a debt, even a strange one. You were right to pay it.", next = "BACK", fx = { align = { order = 1 }, learn = { "steamwheedle" } } },
        { text = "I'd have slipped aboard the first ship north and owed nobody.", next = "BACK", fx = { align = { order = -1 }, learn = { "steamwheedle" } } },
        { text = "Charged for your own rescue? That's very goblin.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },

    -- What he does
    work = {
      lines = {
        { id = "wk_default", text = "Goblins will sign anything, but they won't trust a word of it unless somebody stood there and watched. A human witness suits them, because nobody in this town believes a human would side with a goblin for free, so I write down what I see, swear to it, and keep the book in a tarred tin under my bed." },
      },
      choices = {
        { text = "Has anyone ever tried to buy your testimony?", next = "work_bribe" },
        { text = "What sort of things do you witness?", next = "work_kinds" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    work_kinds = {
      lines = { { id = "wkk_default", text = "Cargo counts, debts, wagers on the crab races, and duels on the pier when somebody's pride won't wait for the morning. Last month I witnessed a marriage between two goblins, and the contract ran eleven pages, nine of them about the dowry." } },
      choices = {
        { text = "Eleven pages! Was it a happy marriage?", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Has anyone ever tried to bribe you?", next = "work_bribe" },
      },
    },
    work_bribe = {
      big = true,
      lines = { { id = "wb_default", text = "Once, a man who said he was a cloth trader offered me forty gold to swear that a cargo of rum had never arrived. I said no, and he opened my right hand with a knife for it, so these days I sign my name with my left." } },
      choices = {
        { text = "A witness who sells his word is worthless. You did right.", next = "work_scar", fx = { align = { honor = 1 } } },
        { text = "Forty gold? I'd have taken it and told a good lie.", next = "work_scar", fx = { align = { honor = -1 } } },
        { text = "What happened to the cloth trader?", next = "work_scar" },
      },
    },
    work_scar = {
      lines = {
        { id = "ws_default", text = "The Bruisers threw him off the end of the pier, and when they fished him out he had a red sash under his coat, so he was Bloodsail all along. The rum was theirs, you see, stolen from a Blackwater prize, and my word was all that stood between them and a clean sale." },
      },
      choices = {
        { text = "So the Bloodsail have spies inside the Bay.", next = "BACK", fx = { learn = { "bloodsail" } } },
        { text = "Does the hand still pain you?", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },

    -- The neighbours (sub-hub)
    around = {
      hub = true,
      lines = { { id = "ar_default", text = "From this landing I can see the Baron's balcony, the Salty Sailor's door and most of the pier, and I know everybody's business, which is my trade. Who did you want to hear about?" } },
      again = {
        { id = "ar_again", text = "Who else? I know them all, and most of them owe somebody money." },
        { id = "ar_again2", text = "Go on, name another. I've an opinion for every door on this landing." },
      },
      choices = {
        { text = "What do you make of Baron Revilgaz?", next = "baron" },
        { text = "And the Bruisers?", next = "bruisers" },
        { text = "Tell me about the Salty Sailor.", next = "salty" },
        { text = "Who lives along this landing with you?", next = "strom" },
        { text = "Blackwater Raiders or Bloodsail: what's the difference to you?", next = "pirates" },
        { text = "Enough about the neighbors.", next = "hello" },
      },
    },
    baron = {
      big = true,
      lines = {
        { id = "bn_default", text = "He bought me as salvage and sold me back to myself at a profit, and then he hired me, which I've come to think was the plan from the first day. He's the fairest crook in the South Seas, and I mean that as the highest praise this town knows." },
        { id = "bn_gnome", when = { race = "Gnome" }, text = "He bought me as salvage and sold me back to myself at a profit, and then he hired me. I expect a gnome finds that sort of thing appalling, but it kept me fed for three years, and that's more than Stormwind ever did." },
      },
      choices = {
        { text = "A hard bargain, but he kept it. That deserves respect.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Clever. I'd have done the same in his place.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Does he ever need you as a witness?", next = "baron_ledger" },
      },
    },
    baron_ledger = {
      lines = { { id = "bl_default", text = "Twice a year, when the Cartel's men come over from Undermine to check his books, he has me stand in the corner and swear the counts are honest. They always are, mind, because the Baron's far too clever to cheat where anyone's looking." } },
      choices = {
        { text = "And where nobody's looking?", next = "BACK", fx = { trait = { skeptical = 1 }, learn = { "steamwheedle" } } },
        { text = "Let's talk about someone else.", next = "BACK", fx = { learn = { "steamwheedle" } } },
      },
    },
    bruisers = {
      lines = { { id = "br_default", text = "Big, green and very nearly honest, which is more than you can say for most of the port. Half of them can't read a word, so they bring me their wage slips and their sweethearts' letters, and in return nobody has tried to knife me in five years." } },
      choices = {
        { text = "You read their love letters for them?", next = "bruisers_letters" },
        { text = "Who else is up here?", next = "BACK" },
      },
    },
    bruisers_letters = {
      lines = { { id = "brl_default", text = "Aye, and I write the answers too, which means three Bruisers are currently courting the same girl in Ratchet in my handwriting. When she finally comes down on the boat, I intend to be at sea." } },
      choices = { { text = "Ha! I'd pay to witness that.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } } },
    },
    salty = {
      lines = {
        { id = "sl_default", text = "The Salty Sailor's the beating heart of this town, if the heart were made of rum and splinters. Skindle runs it with one eye on his tables and the other on the Baron's stairs, and I've witnessed more bargains at the corner table there than in the Baron's own office." },
        { id = "sl_home", when = { homeInn = { "Booty Bay", "The Salty Sailor Tavern" } }, text = "You've a bed there yourself, so you know the place: rum below, the Baron above and the parrots everywhere in between. Skindle's honest, as tavern keepers go, but count your change and sit with your back to the wall." },
      },
      choices = {
        { text = "Any advice for drinking there?", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll buy you a rum there sometime.", next = "BACK", fx = { affinity = 1, trait = { generous = 1 } } },
      },
    },
    strom = {
      lines = { { id = "st_default", text = "Ian Strom trains rogues, just along the landing from me, and he's the best neighbor I've ever had in that I've never once heard him come or go. I hung a string of shells over my door the week he moved in, and now I hear them rattle every time he goes by." } },
      choices = {
        { text = "Has anyone ever crept in past the shells?", next = "strom_shells" },
        { text = "Shells. That's clever, Markel.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    strom_shells = {
      lines = {
        { id = "sts_default", text = "Not yet, though I wake some nights to find the shells hanging in a slightly different order than I left them. I've decided that's Strom's idea of a joke, because the alternative keeps me up." },
        { id = "sts_rogue", when = { class = "ROGUE" }, text = "Not yet, though some mornings the shells are hung in a different order than I left them. If that was you, friend, I'll thank you to put them back the way they were." },
      },
      choices = { { text = "Someone else, then.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    pirates = {
      lines = { { id = "pr_default", text = "The Blackwater pulled me out of a Bloodsail hold, so I'll drink to them till I die, but they're still pirates with the Baron's seal on their hats. The difference is that the Blackwater keep a bargain once it's struck, and the Bloodsail only keep what they can carry." } },
      choices = {
        { text = "Tell me about the Bloodsail, then.", next = "pirates_red" },
        { text = "Pirates with a seal are still pirates.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    pirates_red = {
      big = true,
      lines = { { id = "prr_default", text = "They want this cove back, and they've never forgiven the Baron for building a town where they meant to build a graveyard. Some of their crews are pressed men, though, taken off merchant ships the same as I was, only nobody paid their fee." } },
      choices = {
        { text = "Then the pressed men deserve mercy if they surrender.", next = "BACK", fx = { align = { light = 1 }, learn = { "bloodsail" } } },
        { text = "A red sash is a red sash. Sink them all.", next = "BACK", fx = { align = { light = -1 }, learn = { "bloodsail" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } },
      },
    },

    -- The name
    name = {
      lines = { { id = "nm_default", text = "I don't doubt it, because it's a common name, Smythe, and you can't throw a bucket in a human port without wetting one of us. Every so often a sailor tells me he met a Smythe somewhere or other, and I always ask whether that one owes me money." } },
      choices = {
        { text = "You might be related to some of them.", next = "name_kin" },
        { text = "Markel's not so common, at least.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    name_kin = {
      lines = { { id = "nk_default", text = "Couldn't tell you, friend, for my father had brothers he didn't speak of and cousins he spoke of even less. If one of them turns up rich and generous, I'll suddenly remember we were very close." } },
      choices = { { text = "Spoken like a true Booty Bay man.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },

    -- Home
    home = {
      lines = {
        { id = "hm_default", text = "Now and then, on the nights the fog comes in and smells like the canals. But the Ellery's Promise was posted lost with all hands, so as far as Stormwind's clerks are concerned, Markel Smythe drowned fourteen years ago, and a drowned man has a great deal of freedom." },
      },
      choices = {
        { text = "Doesn't anyone back home miss you?", next = "home_go" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_go = {
      big = true,
      lines = { { id = "hg_default", text = "My mother did, I expect, but she's gone now, and my brother was always better at grieving than writing letters. What would you do, if the whole world had already said its goodbyes to you?" } },
      choices = {
        { text = "Go home. A man belongs among his own people.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stay drowned. You're free, and freedom's worth more.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I couldn't say, Markel. That's yours to decide.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },

    -- Race
    k_human = {
      lines = {
        { id = "kh_default", text = "Are you, now? Then tell me, is the Pig and Whistle still pouring in Old Town, and does the harbor still smell of tar and fish when the wind comes off the water? I'd give a week's fees just to hear the Cathedral bells again." },
      },
      choices = {
        { text = "Still pouring, still crowded, and the ale's no better.", next = "BACK", fx = { affinity = 2 } },
        { text = "The city's uneasy. The Defias have everyone on edge.", next = "BACK", fx = { affinity = 1, learn = { "defias" } } },
        { text = "You could go and hear the bells yourself.", next = "home" },
      },
    },
    k_horde = {
      lines = {
        { id = "khd_default", text = "I grew up on stories of the Horde burning Stormwind, and I won't say I've forgotten them. But the first orc who ever hired me here paid double because I swore against his own captain, who'd been cheating him, and a man can't hold a grudge against someone who pays like that." },
        { id = "khd_tauren", when = { race = "Tauren" }, text = "Your people never burned anything of mine, so I'd have no quarrel with you even in Stormwind. Besides, the tauren who trade here are the only folk in the Bay who read every line of a contract before they sign it, and I love them for it." },
      },
      choices = {
        { text = "Then Booty Bay has done you some good.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Old stories die hard on both sides, human.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    k_forsaken = {
      lines = { { id = "kf_default", text = "Because I've been declared dead myself, friend, by the clerks of Stormwind fourteen years ago. You and I are two people the world has already finished mourning, and I find that makes for very plain talk." } },
      choices = {
        { text = "Ha. Then we're both dead men walking, Markel.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Being dead on paper isn't the same thing.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    k_gnome = {
      lines = { { id = "kg_default", text = "Headaches and squinting, because the goblins print the parts that matter in letters you could hide under a flea. I keep a glass for it, but a gnome's eyes are better than any glass, so if you've a spare hour I'd pay you to read the bottom of a page or two." } },
      choices = {
        { text = "Gnomes read the fine print first. Always.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "I'd rather not read goblin fine print, thanks.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    k_sky = {
      lines = { { id = "ksk_default", text = "Never in my life, though the sailors have been telling stories about elves who came down out of the sky. I'm a practical man, so tell me this much: do your people put their bargains in writing, or do they just trust the wind?" } },
      choices = {
        { text = "We keep our oaths, written or not.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Our elders keep the records. I just keep moving.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },

    -- Class
    xrogue = {
      big = true,
      lines = { { id = "xr_default", text = "Not nervous, exactly, but watchful, because his students practice on whoever happens to be passing, and I happen to pass all day long. I've witnessed the return of three purses that walked off this landing, and I'd swear one of them came back heavier." } },
      choices = {
        { text = "I take from those who can spare it, never from neighbors.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A purse on a landing is anybody's, neighbor or not.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Markel.", next = "BACK" },
      },
    },
    xwar = {
      big = true,
      lines = { { id = "xw_default", text = "Every week, near enough, out at the end of the pier where the Bruisers can watch and nobody bleeds on the cargo. First blood or first one in the water, that's the rule, and I've seen a big man lose to a small one because the big one forgot to agree on which." } },
      choices = {
        { text = "Rules make a duel worth winning.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rules are for people who can't win without them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpala = {
      big = true,
      lines = { { id = "xp_default", text = "On the Cartel's book, for the goblins' sake, and on my mother's name for my own. I was raised to swear by the Light like every Stormwind boy, but I've been in this port long enough that I'm not sure the Light still knows my face." } },
      choices = {
        { text = "The Light remembers you, Markel. Swear by it again.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your mother's name is enough. Leave the Light out.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = { { id = "xpr_default", text = "Often enough, because people forget a witness is a man and not a piece of furniture. I carry a fair few secrets that ought to have gone to a priest, and some nights they sit heavier than the book under my bed." } },
      choices = {
        { text = "Then let the Light carry them with you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Secrets are coin here. Keep them close and spend wisely.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xm_default", text = "Once, at a wager over a cargo count, a mage made forty crates look like sixty. He'd done fine work on the crates, but he forgot about their reflections in the water, and I counted those instead." } },
      choices = {
        { text = "Magic should never be used to cheat an honest bargain.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If he'd been better at it, he'd have earned it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xl_default", text = "I was asked to, once, by a man in a hooded coat who wanted me to watch him sign something by candlelight down in the lower docks. The ink smelled of brimstone, so I said no and went straight to the Salty Sailor, and I didn't sleep for a week." } },
      choices = {
        { text = "No bargain with a demon is ever fair. You were wise.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A demon's bargain is a bargain. You just read closely.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunt = {
      big = true,
      lines = { { id = "xh_default", text = "All season long, because the hunters who go up to Nesingwary's camp love nothing better than a bet on whose tiger was biggest. I measure the pelts myself, nose to tail, and you'd be amazed how many of them seem to stretch on the walk down the coast." } },
      choices = {
        { text = "An honest count or nothing. Hunting's no place for lies.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A clever hunter stretches the pelt before it reaches you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xd_default", text = "I haven't been past the tunnel gate in years, but I hear it every night, the howling and the screaming of birds I can't name. The goblins say the jungle's just a warehouse with teeth, and some nights I think it's the jungle that's doing the counting." } },
      choices = {
        { text = "A town needs its walls. Keep the jungle on its side.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The jungle's law is older than the Cartel's.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsham = {
      big = true,
      lines = { { id = "xs_default", text = "I didn't, and I'm not sure I like it, because a witness I can't bribe and can't argue with sounds like very stiff competition. Still, if the sea spirits ever want a seat at a goblin bargain, I'd pay good money to watch the goblins try to haggle with them." } },
      choices = {
        { text = "The spirits can't be bought. Trust them over any ledger.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Even spirits can be bargained with, if you know how.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know who owes whom on this landing, and what they swore to, and when. Ask me, and if it's not in my book, I'll tell you who's lying about it." },
    },
    background = { { id = "tp_bg", text = "I was a purser's mate out of Stormwind until the Bloodsail took my ship, and then I was salvage, and now I'm a witness. It's been a strange sort of career.", next = "salvage" } },
    advice = { { id = "tp_ad", text = "Get it in writing, get it witnessed, and never sign anything a goblin hands you after dark." } },
    bloodsail = { { id = "tp_bloodsail", text = "They took my ship and my boots, and they'd take this cove if the Blackwater let them. I watch every red sash that floats in, friend, and I'm still looking for my boots." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel runs on contracts, and contracts run on witnesses, which is the only reason a human has a trade in this town." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay is where the Bloodsail spend their money and where I keep track of how much. The Baron would rather I didn't, but the Baron would rather a lot of things." } },
    theramore = { { id = "tp_theramore", text = "Theramore's navy is the only one in the South Seas that takes the Bloodsail seriously. I've sent them reports, and they've actually read them." } },
    bolvar = { { id = "tp_bolvar", text = "Highlord Fordragon is too busy with the court to worry about pirates, which is how the Bloodsail grew so bold. I've written letters, and I'll keep writing them." } },
    second_war = { { id = "tp_second_war", text = "I was a boy in Stormwind during the Second War, and I watched the fleet sail out to meet the orcs. I wanted to be on those ships more than anything, and I got my wish, eventually." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The Bloodsail send a few men to the Arena now and then, to keep their blades sharp. I keep a list of who comes back." } },
    _none = { { id = "tp_none", text = "That's not in my book, friend, and I only swear to what I've seen with my own eyes." } },
  },
}
