-- Innkeeper Farley, Lion's Pride Inn, Goldshire. Voice: bibles/farley.md
-- The rumor mill of Goldshire. Hearsay, so some of it is wrong.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "farley", id = TODO_NPC("Innkeeper Farley"), name = "Innkeeper Farley",
  bible = "bibles/farley.md", role = "innkeeper", tier = "major",
  communities = { "goldshire" }, temper = { "steady" }, values = { "kind", "generous", "witty" },
  notices = { "guest", "pet", "drink" },
  impression = {
    first = "Innkeeper Farley runs the Lion's Pride with a loud voice and a family pride older than its walls. He'll tell anyone who asks, and most who don't, that he has never watered a drink.",
    third = "{name} was welcomed to the Lion's Pride by Innkeeper Farley, whose family has kept it since the first King Llane's day.",
  },

  greetings = {
    { id = "g_welcome", text = "Welcome to the Lion's Pride! Sit anywhere the dog isn't." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back! Your usual corner's free." },
    { id = "g_home", when = { homeInn = { "Goldshire", "Lion's Pride Inn" } }, text = "Home again! Boots off by the fire, if you please." },
  },

  notice = {
    { id = "n_imp", cat = "pet", place = "before", when = { pet = { family = "Imp" } },
      text = "Your imp doesn't sleep in the beds. I don't care what it promises you." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "That's enough for tonight, friend. Dobbins, bring water for this one, and some bread!" },
    { id = "n_away", cat = "guest", when = { homeInn = { "Goldshire", "Lion's Pride Inn" }, daysSince = { min = 14 } },
      text = "Look who remembered where they sleep! Two weeks, near enough, and I nearly let your room." },
  },

  react = {
    { id = "r_imp", on = "pet", when = { pet = { family = "Imp" } }, text = "Not in here, and not near the curtains!" },
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "Mind the tables, friend, that's good oak!" },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only the arm-wrestling, and Dobbins handles that with a bucket of water. Most warriors drink, sleep and go, and the good ones pay for what they break before I have to ask." } },
      choices = {
        { text = "I'll pay for anything I break, Farley.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it breaks under me, it wasn't built well.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not the ones who stay, because Keryn Sylvius keeps his students in line and I keep the ale flowing, and we understand each other. It's the Defias passing through I worry about, though they never seem to stay for a second drink." } },
      choices = {
        { text = "Your spoons are safe with me, Farley. You have my word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If you've spoons worth counting, someone will find a way.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The quiet of it, when the woodcutters aren't at it. The trees are friendly here, and the deer walk right up to the inn's back door some evenings." } },
      choices = {
        { text = "The woodcutters ought to leave more trees.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Stormwind needs the timber. That's honest work.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "My family's kept the Lion's Pride since the first King Llane's day, and we've never watered a drink. Ask anyone!" },
        { id = "h_falkhaan", tags = { "news" }, when = { questRecent = { TODO_QUEST("Rest and Relaxation"), days = 1 } },
          text = "Falkhaan sent you? Then take the good chair by the fire. Any friend of his is a friend of mine." },
        { id = "h_liked", when = { townStanding = { town = "goldshire", min = 30 } },
          text = "Half the town's asked after you this week. The other half's jealous." },
        { id = "o_lovers", tags = { "news" }, when = { gossip = { topic = "maybell_tommy", stance = "romantic" } },
          text = "William says you're all for young love. Good. Somebody in this town should be, besides him." },
        { id = "h_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "Stalvan? He did stay here, years back. Paid in coin, kept to himself, wrote letters he never sent." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Winds be with you! That's what your people say, isn't it? I've been practising, though Melika says I still don't say it right." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Josetta's upstairs, if it's her you're after. If it's a drink you're after, I'll not tell her." },
        { id = "h_veteran", when = { minLevel = 20, metBefore = true },
          text = "Well, look who remembered the way! Sit, sit. You've the look of someone with stories, and I've the look of someone who wants them." },
        { id = "h_north", when = { origin = "human_lordaeron_refugee" },
          text = "From the north, are you? I can always tell. Northerners take the seat nearest the fire and never quite sit back in it." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Well, Elwynn's a fine forest to visit, though I expect ye've seen far older ones in Ashenvale." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Welcome, welcome! I don't mind telling you I count the spoons at night, and it's nothing against you, it's only habit." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Sit yourself down; I'll not ask what you've been hitting, but my chairs are older than you, so go gently on them." },
      },
      again = {
        { id = "h_again", text = "What else, friend? So much to do, and I'd rather talk." },
        { id = "h_again2", text = "Go on, go on. Dobbins can mind the bar a minute." },
        { id = "h_again3", text = "Anything else? I've a cheese to cut and a story to finish." },
      },
      choices = {
        { text = "What do you like about Elwynn?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "Heard anything interesting?", next = "rumors" },
        { text = "Tell me about the inn.", next = "inn" },
        { text = "What's good to eat?", next = "food" },
        { text = "Ever had trouble in here?", next = "trouble" },
        { text = "Falkhaan sent me down the road.", next = "falkhaan", when = { questDone = TODO_QUEST("Rest and Relaxation") } },
        { text = "What's down in your cellar, Farley?", next = "cellar", when = { class = "WARLOCK" } },
        { text = "What ale do you keep, Farley?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Can {pet} sleep in my room?", next = "pet", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Does the mage upstairs ever complain?", next = "mage", when = { class = "MAGE" } },
        { text = "Do rogues give you much trouble at the Lion's Pride?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you get much trouble from warriors at the Lion's Pride?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Just stopping in.", next = "END" },
      },
    },

    -- Rumors: local news, word from nearby, reactions to the player's own deeds.
    rumors = {
      lines = {
        { id = "r_default", text = "Quiet week. In Goldshire that means three fights, a lost cow and one bard we asked to leave." },
        { id = "r_hogger", key = true, when = { questBefore = TODO_QUEST("WANTED: \"Hogger\"") },
          text = "Another hunter went after Hogger yesterday. Came back on a cart. They always come back on a cart.",
          fx = { hear = "hogger_unbeatable", learn = { "hogger" } } },
        { id = "r_hogger_you", when = { questRecent = { TODO_QUEST("WANTED: \"Hogger\""), days = 3 } },
          text = "They say someone finally put Hogger down. That wasn't you, was it? Sit, sit, and tell me everything.",
          tags = { "news" } },
        { id = "r_murlocs", key = true, when = { questBefore = TODO_QUEST("A Fishy Peril") },
          text = "Remy's telling everyone there are murlocs in the eastern streams. Telling them twice, naturally.",
          fx = { hear = "murlocs_in_elwynn", learn = { "murlocs_east" } } },
        { id = "r_lovers", when = { questActive = TODO_QUEST("Collecting Kelp") },
          text = "William's been mixing something private upstairs that smells of the sea. I asked no questions, because I'm a good innkeeper.",
          fx = { learn = { "maybell_tommy" } } },
        { id = "r_necklace", when = { questActive = TODO_QUEST("Lost Necklace") },
          text = "Auntie Bernice is telling the bar Billy Maclure stole her necklace. Billy's telling it he's hungry. Make of that what you will." },
      },
      choices = {
        { text = "Who'd know more than you?", next = "rumors_who" },
        { text = "Thanks, Farley.", next = "BACK" },
        { text = "Hogger can't be that bad.", next = "BACK", when = { heardClaim = "hogger_unbeatable" }, fx = { trait = { brave = 1 } } },
        { text = "That was me, actually. Hogger's dead.", tag = "Deceive", next = "END",
          when = { questBefore = TODO_QUEST("WANTED: \"Hogger\""), heardClaim = "hogger_unbeatable" },
          fx = { claim = "player_killed_hogger", align = { honor = -2 }, affinity = 1 },
          journal = { first = "Told Farley I'd killed Hogger. He believed me. Half of Goldshire will by morning.",
                      third = "{name} told Innkeeper Farley they had killed Hogger." },
          fail = { next = "END", fx = { affinity = -2 } } },
        { text = "I didn't kill Hogger, and I won't say I did.", next = "BACK", when = { questBefore = TODO_QUEST("WANTED: \"Hogger\""), heardClaim = "hogger_unbeatable" }, fx = { align = { honor = 2 } } },
      },
    },
    rumors_who = {
      lines = {
        { id = "rw_default", text = "Nobody! Well, Remy hears everything twice, Melika hears it once and remembers it, and the Marshal hears it last and does something about it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    inn = {
      lines = {
        { id = "i_default", text = "Rest for the tired, a fire for the cold! Goldshire fell in the First War and was built again after the Second. There's been a Farley pouring here on both sides of it." },
      },
      choices = {
        { text = "And the Farleys now?", next = "family" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      lines = {
        { id = "fa_default", text = "Verina, my wife, who keeps the books and keeps me honest. Anna, our girl, who keeps us both running. And me, keeping the fire in." },
      },
      choices = {
        { text = "Any other family?", next = "brother" },
        { text = "Sounds like a good life.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    brother = {
      big = true,
      lines = {
        { id = "b_default", key = true, text = "My brother Frandis, better with a sword than me. He guarded the crown's caravans, and his last one went north to Lordaeron in the plague year. It never came back." },
      },
      choices = {
        { text = "I'm sorry, Farley.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I could say a prayer for him.", next = "brother_prayer", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I came out of Lordaeron that year.", next = "brother_north", when = { origin = "human_lordaeron_refugee" } },
      },
    },
    brother_prayer = {
      lines = {
        { id = "bp_default", text = "Would you? Verina lights a candle for him every winter, and I never know what to say. You'd know the words, and I'd be grateful." },
      },
      choices = {
        { text = "Light keep Frandis, wherever he walks.", next = "brother_after", fx = { affinity = 3, align = { light = 2 }, trait = { pious = 1 }, standing = { goldshire = 2 } },
          journal = { first = "Said a prayer for Farley's brother Frandis, lost on a caravan to Lordaeron in the plague year.",
                      third = "{name} prayed for Innkeeper Farley's brother, lost in Lordaeron." } },
        { text = "Prayers never brought anyone home, Farley, and I'm sorry for it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother_after = {
      lines = {
        { id = "ba_default", text = "Wherever he walks. Aye, I like that better than the other kind. Thank you, friend, and now sit down before I start crying in front of Dobbins." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother_north = {
      lines = {
        { id = "bn_default", text = "Did you? Then tell me one thing, and tell me true. Up there, at the end, was it quick for most of them?" },
      },
      choices = {
        { text = "For most of them, yes.", next = "brother_quick", fx = { affinity = 3, align = { honor = -1, light = 1 }, trait = { kind = 1 } } },
        { text = "I won't lie to you. It wasn't.", next = "brother_slow", fx = { affinity = 1, align = { honor = 2 }, trait = { stern = 1 } } },
      },
    },
    brother_quick = {
      lines = { { id = "bq_default", text = "Good, good. I'll tell Verina that; she's always wanted to hear it, and so have I." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother_slow = {
      lines = { { id = "bs_default", text = "No, I didn't think so. Thank you for not dressing it up, when nobody else would tell me anything at all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    food = {
      lines = {
        { id = "fo_default", text = "Cheese! Dalaran sharp, Alterac swiss, and a Stormwind brie I'd fight a gnoll for. Tomas's stew, if Melika's left any. Ice-cold milk for the young ones." },
      },
      choices = {
        { text = "The brie, then.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    trouble = {
      lines = {
        { id = "tr_default", text = "Brawls, now and then. I've big hands for a reason, and I use them before Dobbins has to. Most nights the worst trouble is a bard." },
      },
      choices = {
        { text = "Anything stranger?", next = "messenger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    messenger = {
      lines = {
        { id = "me_default", text = "Once, on a stormy night years back. A messenger took a room upstairs, and at midnight he came down those stairs screaming in his nightshirt and ran out into the rain." },
      },
      choices = {
        { text = "What frightened him?", next = "messenger_why" },
        { text = "Did he ever come back?", next = "messenger_back" },
      },
    },
    messenger_why = {
      lines = {
        { id = "mw_default", text = "I never found out. The room's fine; I've slept in it myself, once." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    messenger_back = {
      lines = {
        { id = "mb_default", text = "Never. His letters are still in the chest up there. I keep meaning to send them on. I keep not knowing where." },
        { id = "mb_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "Never. His letters are still in the chest upstairs. One of them's from that Stalvan fellow you're asking after. Go and look. It's past time somebody did.",
          fx = { learn = { "stalvan" } } },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    falkhaan = {
      lines = {
        { id = "fk_default", text = "My best friend! He stands on the north road and sends me every worn-out recruit by the cartload. I've never had a better friend, nor a busier inn." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    cellar = {
      lines = {
        { id = "ce_default", text = "Barrels. And tenants who pay on time and don't break the furniture. I go as far as the barrels. I don't ask past them." },
      },
      choices = {
        { text = "Wise man.", next = "BACK", fx = { affinity = 1 } },
        { text = "You should ask.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    dwarf = {
      lines = { { id = "dwarf_l", text = "Why, the best in Elwynn! A good dark from Thunderbrew, when the carts get through, and our own brown when they don't, which I'll stand against anything in Ironforge, and have, and lost, but only narrowly." } },
      choices = {
        { text = "Thunderbrew, then. Nothing else will do.", next = "dwarf2" },
        { text = "I'll try the brown, for Goldshire's honour.", next = "dwarf2", fx = { affinity = 1 } },
      },
    },
    dwarf2 = {
      lines = { { id = "dwarf2_l", text = "Ha! Dobbins, a mug for our friend! The last dwarf who sat at that table taught the whole room a song about a goat, and we sing it still, though none of us know what it means." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    pet = {
      lines = {
        { id = "pet_l", text = "Well, now, that depends. Does {pet} use the bed, or the floor? Because the last hunter's bear ate a pillow, and my sister still talks about it at every holiday." },
        { id = "pet_human", when = { race = "Human" },
          text = "A human with a pet beast, under my roof! Does {pet} use the bed or the floor, though, because the last hunter's bear ate a pillow and my sister still talks about it." },
      },
      choices = {
        { text = "The floor. {pet} is very well behaved.", next = "pet2" },
        { text = "{pet} goes where I go.", next = "pet2", fx = { trait = { stern = 1 } } },
      },
    },
    pet2 = {
      lines = { { id = "pet2_l", text = "Then {pet} is welcome, the floor's swept, and I'll warn the cook. Just no imps in the beds; that's the one rule, and the warlocks downstairs know why." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    mage = {
      lines = { { id = "mage_l", text = "Wefhellt? Every evening, when the singing starts, and every evening I tell him it's an inn, not a library. He tried a silencing spell on the common room once, and I'll not have that, not in the Lion's Pride." } },
      choices = {
        { text = "Quite right. An inn should be loud.", next = "BACK", fx = { affinity = 1 } },
        { text = "A little quiet wouldn't hurt anyone.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "An innkeeper hears everything sooner or later, friend, usually after the second ale. Ask me about any of this and I'll tell you what's going round the common room." },
    },
    background = { { id = "tp_bg", text = "Fredrik Farley, of the Lion's Pride, like my father and his before him. The inn's the real story; I just pour.", next = "inn" } },
    advice = { { id = "tp_ad", text = "Eat something hot, sleep somewhere dry, and never pick a fight in another man's inn, especially mine." } },
    lions_pride = { { id = "t_inn", text = "Best inn between Stormwind and Lakeshire, and I'll argue with anyone who says otherwise, politely." } },
    defias = { { id = "t_defias", text = "They rob travelers on the Westfall road. Bad for business, worse for the travelers." } },
    hogger = { { id = "t_hogger", text = "Can't be killed, they say. Every hunter that tries comes back on a cart.", fx = { hear = "hogger_unbeatable" } } },
    murlocs_east = { { id = "t_murlocs", text = "Remy swears by it. Remy swears by a lot of things." } },
    the_collector = { { id = "t_collector", text = "Some rider paid me in gold dust once, gold dust of all things, and I never saw him again." } },
    gold_dust = { { id = "t_dust", text = "Remy buys it, Remy sells it, Remy talks about it. Mostly he talks about it." } },
    stalvan = { { id = "tp_stalvan", text = "He stayed a few nights, years back, a quiet man. The messenger who ran off screaming was carrying one of his letters.", next = "messenger_back" } },
    _none = { { id = "t_none", text = "Not a word of that's reached my bar, and that's rare." } },
  },
}
