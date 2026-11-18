-- Adair Gilroy, Librarian, Mage Quarter, Stormwind. Voice: bibles/gilroy.md
-- Sells scrolls (Strength, Intellect, Stamina, Spirit, Agility, Protection). A librarian whose
-- stock is meant to be read once and crumble: the joke he has made peace with, mostly.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")

P:NPC {
  key = "gilroy", id = 1316, name = "Adair Gilroy", title = "Librarian",
  bible = "bibles/gilroy.md", role = "vendor", tier = "major",
  communities = { "stormwind" }, temper = { "fussy", "warm" }, values = { "learning", "patience" },
  notices = { "arcane", "learning", "light" },

  impression = {
    first = "Adair Gilroy is a thin, ink-stained man in the Mage Quarter who calls himself a librarian, though every scroll on his shelves is meant to be read once and crumble. He has opinions about that.",
    third = "{name} met Adair Gilroy, the Mage Quarter's scroll-seller, who copies every scroll he sells by hand and mourns each one a little.",
  },

  greetings = {
    { id = "g_default", text = "Mind the shelves, please, and mind the ink; it's still wet on the top row." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Come in. You've the look of someone who's run through their last scroll and felt the lack." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A mage, and not an apprentice by the look of you. Good; you'll know not to read a scroll of Intellect aloud in a crowded room." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "A warrior. You'll want Strength or Protection, I expect, and you'll want me to skip the reading lesson. I won't." },
    { id = "g_away", when = { away = 14, metBefore = true }, text = "Gone {away}. I'd begun to wonder if you'd found a cheaper scribe, and then I remembered there isn't one." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've come on well since last time. I can see it in how you stand; the scrolls won't do as much for you now, and I'm glad of it." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The Sanctum's apprentices say you've been decent to them. They gossip worse than the Lamb's regulars, but this once I believe them." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I've heard about you from the Sanctum steps. I'll sell you scrolls all the same, because ink doesn't care who buys it, but I'll watch my shelves." },
  },

  notice = {
    { id = "n_dalaran", cat = "arcane", when = { origin = "human_dalaran_stray" },
      text = "You've a Dalaran way of holding your hands. Were you up north before the gates closed? I copied in the Violet Citadel's lower stacks, once, a lifetime ago." },
    { id = "n_mq", cat = "learning", when = { origin = "human_mage_quarter" },
      text = "You grew up in the Quarter, didn't you? I'd swear I sold your mother a scroll of Stamina the winter the canals froze." },
    { id = "n_gnome", cat = "arcane", when = { race = "Gnome", class = "MAGE" },
      text = "A gnomish mage. Your people annotate in the margins in a hand so small I need a lens, and I'll confess I've stolen a few of the better notes." },
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest. The Cathedral orders scrolls of Spirit by the dozen and then sends me sermons on the dangers of relying on them." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Adair Gilroy, librarian. I know, I know: a librarian whose books turn to dust when they're read. Sit down and I'll explain why that's not as mad as it sounds." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A colleague, more or less. You write your spells into your head, and I write mine onto paper for people who can't. Between us we cover most of Stormwind." },
        { id = "h_warlock", when = { class = "WARLOCK" }, text = "You've come up from the Lamb's cellar, haven't you? I can smell the sulphur. I'll sell to you, but please don't touch the vellum with those fingers." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "A rogue, in a shop full of small, valuable, pocket-sized things. I'll keep both eyes open while we talk, if it's all the same to you." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin. You've the Light to lean on, so you'll want my scrolls less than most, but the Silver Hand used to buy Protection by the crate before the war." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid. Your people keep their learning in trees and songs, I'm told. I keep mine on paper, and I envy you the trees on a damp day." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf. Your Explorers' League sends me rubbings from Uldaman with notes like 'whit's this say?' and nothing else, and I love them for it." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "One of the Kaldorei. I'd give a year's takings for an hour in your libraries, if you keep any, and I'd give more to know how old your oldest book is." },
        { id = "h_young", when = { maxLevel = 12 }, text = "You're new to the road, I think. Buy one scroll, not five, and learn what it feels like before you rely on it." },
        { id = "h_dalaran_word", tags = { "news" }, when = { minLevel = 30 },
          text = "There's talk Dalaran will open its gates again once the rebuilding's done. If it does, I'll close the shop for a month and go and stand in the Citadel's library till they throw me out." },
      },
      again = {
        { id = "h_again", text = "What else? I've a page drying, so I've a minute." },
        { id = "h_again2", text = "Go on. Questions are the only thing in here that don't crumble." },
        { id = "h_again3", text = "Ask away; the ink's in no hurry." },
      },
      choices = {
        { text = "Why call yourself a librarian if you sell everything?", next = "librarian" },
        { text = "How does a scroll actually work?", next = "scrolls" },
        { text = "Where did you learn your trade?", next = "dalaran" },
        { text = "What's the Mage Quarter like to live in?", next = "quarter" },
        { text = "I knew the Citadel too, before the gates closed.", next = "xdalaran", when = { origin = "human_dalaran_stray" } },
        { text = "Do you ever copy warlock texts?", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "Let me see your scrolls.", next = "BUSINESS" },
        { text = "Good day, Adair.", next = "END" },
      },
    },

    librarian = {
      lines = {
        { id = "l_default", text = "Because a library is a place where knowledge waits for someone to need it. Mine just waits a shorter time, and then it's used, and then it's gone, and I make another." },
      },
      choices = {
        { text = "Doesn't it bother you, watching your work crumble?", next = "librarian_crumble" },
        { text = "Do you know Milton Sheaf at the Royal Library?", next = "milton" },
        { text = "Something else.", next = "BACK" },
      },
    },
    librarian_crumble = {
      lines = {
        { id = "lc_default", text = "Every single time. A good scroll takes me an evening, and a guardsman reads it in the time it takes to sneeze, and then it's ash on his boots. But he walked home that night, so I've decided it was a fair trade." },
      },
      choices = {
        { text = "Knowledge should be kept, Adair, not spent.", next = "librarian_kept", fx = { align = { order = 1 } } },
        { text = "Knowledge that's never used is just paper.", next = "librarian_used", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    librarian_kept = {
      lines = {
        { id = "lk_default", text = "Milton would agree with you, and he'd buy you an ale for saying it. I keep a master copy of every scroll I've ever written, locked up behind the counter, so I'm not quite the vandal I pretend to be." },
      },
      choices = {
        { text = "May I see the master copies?", next = "masters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    librarian_used = {
      lines = {
        { id = "lu_default", text = "That's very nearly what I tell myself at midnight with cramp in my hand. It sounds better coming from someone else, so thank you." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    masters = {
      lines = {
        { id = "ms_default", text = "You may not, I'm afraid. Not because I don't trust you, though I don't, but because the masters aren't sealed. Read one and it works just like any other, and then I've lost my only copy." },
        { id = "ms_rogue", when = { class = "ROGUE" }, text = "No, and I'll be moving the box tonight, now that you know there's a box. Nothing personal; it's the profession, not the face." },
      },
      choices = {
        { text = "Fair. I'd rather they stayed safe.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    milton = {
      lines = {
        { id = "mi_default", text = "Milton! Of course. We take supper together on the last day of the month and argue till the inn throws us out. He thinks I'm a butcher of books, and I think he's a jailer of them." },
      },
      choices = {
        { text = "Who's right?", next = "milton_right" },
        { text = "Something else.", next = "BACK" },
      },
    },
    milton_right = {
      lines = {
        { id = "mr_default", text = "Neither, which is why the suppers have gone on for nineteen years. He came to me once for a scroll of Protection of his own, sheepish as a boy, the night the Defias were rumoured in the Keep. I've never let him forget it." },
      },
      choices = {
        { text = "Milton's right. Books belong on shelves.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right. Learning is for living people.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    scrolls = {
      lines = {
        { id = "s_default", text = "It's a spell, written out whole and then held, the way you'd hold a breath. The reading lets it go. The trick is in the holding: a careless hand and the spell leaks out before anyone reads it, and you're left with a very expensive bookmark." },
        { id = "s_mage", when = { class = "MAGE" }, text = "You know the theory better than I do. I'm a copyist, not a theorist: I write the shape of the spell and seal it, and I've sealed perhaps twenty thousand without once understanding why it works." },
      },
      choices = {
        { text = "Which scroll should I buy?", next = "scrolls_which" },
        { text = "Can anyone write one?", next = "scrolls_anyone" },
        { text = "Has one ever gone wrong?", next = "scrolls_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scrolls_which = {
      lines = {
        { id = "sw_default", text = "That depends what's going to hurt you. Stamina for the long fights, Protection when something's hitting hard, Spirit if you need to keep going after. Intellect for casters, Strength and Agility for the rest." },
        { id = "sw_warrior", when = { class = "WARRIOR" }, text = "Strength, and Protection when you're the one at the front, which you always are. Stamina if the healer's young. Don't bother with Intellect; I mean that kindly." },
        { id = "sw_rogue", when = { class = "ROGUE" }, text = "Agility, obviously. Protection if you're the sort who gets caught, and you'd better hope you aren't." },
        { id = "sw_caster", when = { class = { "MAGE", "WARLOCK", "PRIEST" } }, text = "Intellect, of course, and Spirit if you're slow to recover between fights. Stamina too, frankly; I've buried more clever people than strong ones." },
      },
      choices = {
        { text = "Then I'll see what you have.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scrolls_anyone = {
      lines = {
        { id = "sa_default", text = "Anyone with a steady hand, a good eye and fifteen years of practice. The Sanctum tried to teach it to apprentices once, to save money. We lost three good tables and an eyebrow." },
      },
      choices = {
        { text = "Then the craft should stay with trained masters.", next = "scrolls_guild", fx = { align = { order = 1 } } },
        { text = "Then teach more people. Fifteen years is too long.", next = "scrolls_guild", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scrolls_guild = {
      lines = {
        { id = "sg_default", text = "I've an apprentice now, as it happens, a girl from Old Town called Wenna. Her letters are crooked and her seals are perfect, which is the right way round, and I didn't have the heart to send her back to her father's fish stall." },
      },
      choices = {
        { text = "She's lucky to have you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scrolls_wrong = {
      lines = {
        { id = "swr_default", text = "Once, badly. Years ago I sold a scroll of Strength to a dockhand who read it upside down. He went home stronger and noticeably stupider for the afternoon, and he married the woman he proposed to in that state. They're very happy, last I heard." },
      },
      choices = {
        { text = "That's a fine story. Is it true?", next = "scrolls_true" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scrolls_true = {
      lines = {
        { id = "st_default", text = "Every word but the upside down. He read it right way up; he was simply that sort of man already. I tell it the other way because it's better for business." },
      },
      choices = {
        { text = "A good lie never hurt anyone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "You shouldn't tell customers stories like that.", next = "BACK", fx = { align = { honor = 1 } } },
      },
    },

    dalaran = {
      lines = {
        { id = "d_default", text = "In Dalaran, in the lower stacks of the Violet Citadel, copying out lesson-scrolls for apprentices who never once said thank you. I came south after the Second War with a satchel of ink and a letter from a master who's dead now." },
      },
      choices = {
        { text = "Why leave Dalaran?", next = "dalaran_why" },
        { text = "What was the Citadel's library like?", next = "dalaran_library" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran_why = {
      lines = {
        { id = "dw_default", text = "Because Stormwind was rebuilding and had no one to write for it, and Dalaran had more scribes than it had ink. I meant to stay two years. That was a long time ago, and the city kept needing scrolls." },
      },
      choices = {
        { text = "Stormwind's lucky you stayed.", next = "BACK", fx = { affinity = 1 } },
        { text = "Do you ever regret it?", next = "dalaran_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran_regret = {
      lines = {
        { id = "dr_default", text = "When I heard what happened there, the plague in the north, the walls, the gates closing, I regretted only that I couldn't do anything. Then I went back to work, because Stormwind still needed Stamina scrolls, and I've never been good at grieving any other way." },
      },
      choices = {
        { text = "Work is a good way to grieve.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran_library = {
      lines = {
        { id = "dl_default", text = "Enormous, and cold, and run by a woman who could hear a page turned wrong from three floors up. I loved it the way you love a stern aunt. They kept books there that would make Milton weep, and a few that ought to have been burned." },
      },
      choices = {
        { text = "Every book deserves keeping, even dangerous ones.", next = "dalaran_danger", fx = { align = { light = -1 } } },
        { text = "Some knowledge should be burned, and rightly.", next = "dalaran_danger", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran_danger = {
      lines = {
        { id = "dd_default", text = "I've gone back and forth on that all my life. I've copied things I wish I hadn't understood, and I've seen books burned that would have saved lives. I suppose that's why I settled on scrolls. They burn themselves, and nobody has to decide." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    quarter = {
      lines = {
        { id = "q_default", text = "Noisy, for a district full of quiet people. Someone's always testing something, the cobbles are scorched outside the Sanctum, and the Lamb downstairs keeps hours no decent tavern should." },
      },
      choices = {
        { text = "What goes on in the Slaughtered Lamb?", next = "lamb" },
        { text = "Who are your neighbours?", next = "neighbours" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lamb = {
      lines = {
        { id = "la_default", text = "Drinking, upstairs. Downstairs, things the Sanctum pretends not to know about and the guards are paid not to ask about. I sold their master a scroll once and he paid in coins so cold they frosted my counter." },
        { id = "la_warlock", when = { class = "WARLOCK" }, text = "You'd know better than I would. I only hear the singing on the bad nights, and I don't think it's singing." },
      },
      choices = {
        { text = "The city should shut that cellar down.", next = "lamb_shut", fx = { align = { light = 1 } } },
        { text = "Better they're watched in the city than hidden outside it.", next = "lamb_shut", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lamb_shut = {
      lines = {
        { id = "ls_default", text = "Perhaps. I'm only a scribe; I sell paper to anyone who can read and doesn't threaten me. But I've started sealing my door with a scroll of my own at night, and I'd not have done that ten years ago." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    neighbours = {
      lines = {
        { id = "n_default", text = "Mages in towers, alchemists who think a window is something you open after the explosion, and a cat that belongs to nobody and eats with everybody. The cat's the only one I trust." },
      },
      choices = {
        { text = "Does the cat have a name?", next = "cat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cat = {
      lines = {
        { id = "c_default", text = "Several. The alchemists call him Ash, the Sanctum calls him Familiar, the guards call him the Captain, and I call him Footnote, because he's always at the bottom of things." },
      },
      choices = {
        { text = "Footnote is the best name.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdalaran = {
      lines = {
        { id = "xd_default", text = "Did you? Then you'll remember the smell of the lower stacks, old paper and wet stone and somebody's tea gone cold. I've not smelled it in years, and I'd give a month's takings to." },
      },
      choices = {
        { text = "I miss it too. We'll go back when the gates open.", next = "xdalaran_back", fx = { affinity = 2 } },
        { text = "I don't miss it. The Kirin Tor kept too many secrets.", next = "xdalaran_secrets", fx = { align = { order = -1 } } },
        { text = "The Kirin Tor kept order. We owe them that.", next = "xdalaran_secrets", fx = { align = { order = 1 } } },
      },
    },
    xdalaran_back = {
      lines = { { id = "xdb_default", text = "We will. And when we do, you'll show me where they put the new stacks, and I'll pretend I'm not crying." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdalaran_secrets = {
      lines = { { id = "xds_default", text = "They kept secrets, and they kept order, and I've never been sure where one stopped and the other started. A scribe sees the pages, not the hands that lock them away." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xwarlock = {
      lines = {
        { id = "xw_default", text = "No. Not for any price. A scroll holds a spell, and I've no wish to hold one of yours in my hands for a whole evening while I seal it. Buy your Intellect like everybody else." },
      },
      choices = {
        { text = "That's wise of you. Some things shouldn't be copied.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your loss. Power's only dangerous in weak hands.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A scribe from Dalaran's lower stacks who came south to write for a city that had no one. I've been writing ever since." } },
    advice = { { id = "tp_ad", text = "Read the whole scroll before you need it, not while something's chewing on you." } },
    _none = { { id = "tp_none", text = "Not a subject I've copied, I'm afraid. Milton Sheaf at the Royal Library might know, if you can stand the history lesson." } },
  },
}
