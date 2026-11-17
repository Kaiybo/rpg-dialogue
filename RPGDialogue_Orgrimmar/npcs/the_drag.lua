-- The Drag: Droffers and Son Salvage, the cloth, alchemy and leather trainers,
-- and a trade supplier. Rashona is in her own file.
-- Voices: bibles/<key>.md for each.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Dran Droffers: the father of Droffers and Son Salvage.
---------------------------------------------------------------------------
P:NPC {
  key = "dran_droffers", id = TODO_NPC("Dran Droffers"), name = "Dran Droffers", title = "Droffers and Son Salvage",
  bible = "bibles/dran_droffers.md", role = "questgiver", tier = "quest",
  communities = { "orgrimmar" }, temper = { "sharp", "gruff" }, values = { "ambitious", "cunning" },
  notices = { "purse", "dungeon" },
  impression = {
    first = "Dran Droffers runs a salvage shop on the Drag with his son, and he seems to believe everything in the world is either his or about to be. He is rude, quick and very hard to win an argument with.",
    third = "{name} met Dran Droffers, the goblin who runs Droffers and Son Salvage on Orgrimmar's Drag.",
  },

  greetings = {
    { id = "g_hi", text = "If you're buyin', come in, and if you're browsin', browse faster." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again, the customer who thinks about it. Think quicker this time, pal, I got overhead." },
    { id = "g_necklace", when = { questActive = TODO_QUEST("Necklace Recovery") }, text = "You got my necklace yet? No? Then why are you standin' in my shop instead of Uldaman?" },
    { id = "g_rich", when = { money = { min = 1000000 } }, text = "Well, well, look who's got a heavy purse. Come in, come in, my valued customer, and mind the step." },
  },

  notice = {
    { id = "n_purse", cat = "purse", when = { money = { max = 500 } },
      text = "I can hear your purse from here, pal, and it's makin' a very sad little noise. Come back when it jingles." },
    { id = "n_uldaman", cat = "dungeon", when = { cleared = "Uldaman" },
      text = "You've been down in Uldaman and come back with your head on, I hear. Then you know what's lyin' around down there for the takin'." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Dran Droffers, of Droffers and Son Salvage, and that's me at the front of the name, not the son, whatever he tells you. We buy what other folks dig up and we sell it to folks with more gold than sense, and the margins are beautiful." },
        { id = "h_goblin", when = { race = "Goblin" }, text = "Dran Droffers, and you're one of us, so I'll skip the sales pitch and give you the price I give my cousins. That's the same as everybody else's, by the way, but now you feel special." },
        { id = "h_ready", when = { questReady = TODO_QUEST("Necklace Recovery") }, text = "Is that it? Is that my necklace? Hand it over, hand it over, and don't you dare tell Jarkal Mossmeld you came here first." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Talkin' isn't buyin'." },
        { id = "h_again2", text = "Go on, I'm listenin', but the meter's runnin'." },
      },
      choices = {
        { text = "What exactly do you salvage?", next = "salvage" },
        { text = "Tell me about your son.", next = "son" },
        { text = "What's this necklace you're after?", next = "necklace", when = { minLevel = 35 } },
        { text = "Why would anyone want ripple?", next = "ripple" },
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "Not today, Dran.", next = "END" },
      },
    },
    salvage = {
      lines = { { id = "sa_default", text = "Anything that isn't nailed down, and some things that were until recently. Old armor off the battlefields, bits of machinery, dwarf junk from the dig sites, and the odd relic some adventurer doesn't know the value of." } },
      choices = {
        { text = "Off the battlefields? So you rob the dead.", next = "salvage_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    salvage_dead = {
      big = true,
      lines = { { id = "sd_default", text = "Rob is a very ugly word, pal. The dead don't need their boots, and the livin' do, so I'm providing a public service, and charging a modest fee for my trouble." } },
      choices = {
        { text = "True enough, the dead have no use for boots.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Some things should stay with the dead.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    son = {
      lines = { { id = "so_default", text = "Malton? He's a good boy, he smiles at the customers, and he gives away discounts I never approved. One day he'll run this shop into the ground, but it'll be a very friendly ground." } },
      choices = {
        { text = "He seems nicer than you.", next = "son_nice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    son_nice = {
      lines = { { id = "sn_default", text = "Of course he's nicer than me, I raised him to be nice so I could be the one who counts the money. That's called division of labor, and it's the secret of every successful family business." } },
      choices = { { text = "Something else, Dran.", next = "BACK" } },
    },
    necklace = {
      lines = { { id = "ne_default", text = "A necklace from Uldaman, an old one, broken into pieces and scattered around the dig. Put it together, find the right gem, and you've got somethin' the collectors in Booty Bay will fight each other over." } },
      choices = {
        { text = "Jarkal Mossmeld wants it too, I hear.", next = "jarkal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jarkal = {
      lines = { { id = "ja_default", text = "That troll in Kargath? He'll offer you more, he always does, but does he have a shop on the Drag? Does he have a son? Does he have a reputation? No, he's got a hut in the Badlands, so you think about that." } },
      choices = {
        { text = "What happens if I sell it to him?", next = "jarkal_sell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jarkal_sell = {
      big = true,
      lines = { { id = "js_default", text = "Then I'll curse your name for a week and do business with you on the eighth day, because a grudge never paid anybody's rent. But I'll remember, pal, and I'll charge you a little extra for the rest of your life." } },
      choices = {
        { text = "I'll keep my word to you, Dran.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'll sell to whoever pays most.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ripple = {
      lines = { { id = "ri_default", text = "Because it's fancy, and nobody in Orgrimmar knows what it tastes like, so they'll pay whatever I tell them. Every officer who wants to look cultured buys a bottle, and nobody dares say it tastes like boot polish." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    trade = { { id = "tp_trade", text = "Everything's for sale, pal, and the only question is whether you can afford it. You probably can't, but I admire you for askin'." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, and there's no profit in it. Buy somethin' or move along." } },
  },
}

---------------------------------------------------------------------------
-- Malton Droffers: the son, and the friendly face of the shop.
---------------------------------------------------------------------------
P:NPC {
  key = "malton_droffers", id = TODO_NPC("Malton Droffers"), name = "Malton Droffers", title = "Droffers and Son Salvage",
  bible = "bibles/malton_droffers.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "smooth" }, values = { "generous", "practical" },
  notices = { "purse" },
  impression = {
    first = "Malton Droffers works the counter at his father's salvage shop on the Drag. He is as friendly as his father is rude, and probably just as good at business.",
    third = "{name} met Malton Droffers, the friendly half of Droffers and Son Salvage on Orgrimmar's Drag.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome, friend, welcome! Don't mind Dad, he only bites before lunch." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite customer is back! Well, one of my favorites, but don't tell the others." },
  },
  notice = {
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "Oh, a lean week, I see. Don't worry, buddy, we've got a bargain bin, and Dad never checks it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Malton Droffers, the son in Droffers and Son, and the one you should be talkin' to if you want a good deal. Dad handles the buying and I handle the selling, and somehow we both think we're the important one." },
      },
      again = { { id = "h_again", text = "Anything else, friend? I've always got time for a customer." } },
      choices = {
        { text = "Working for your father can't be easy.", next = "father" },
        { text = "What's your best item right now?", next = "best" },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Farewell, Malton.", next = "END" },
      },
    },
    father = {
      lines = { { id = "fa_default", text = "Loud, mostly, and he counts my discounts at the end of every day. But he taught me everything I know, and one day the sign's going to say Droffers and Father, so I'm being patient." } },
      choices = {
        { text = "I'd guess he doesn't know about the sign.", next = "sign" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sign = {
      big = true,
      lines = { { id = "si_default", text = "Not yet, and I'd appreciate it if you didn't tell him. A little honesty's good for business, but a little secrecy's good for family, as long as it's the right kind." } },
      choices = {
        { text = "Your secret's safe. Family deserves some patience.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I might tell him, if the price is right.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = { { id = "be_default", text = "Today it's a dwarf's mining helmet with a hole in it that's shaped exactly like a troll's tusk. I don't know the story, but I'm charging extra for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Couldn't tell you, buddy, but I'll ask around, and Dad'll probably charge you for the answer." } },
  },
}

---------------------------------------------------------------------------
-- Magar: the tailoring trainer who owns Magar's Cloth Goods.
---------------------------------------------------------------------------
P:NPC {
  key = "magar", id = TODO_NPC("Magar"), name = "Magar", title = "Tailoring Trainer",
  bible = "bibles/magar.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "calm" }, values = { "diligent", "patient" },
  notices = { "craft" },
  impression = {
    first = "Magar runs Magar's Cloth Goods on the Drag and teaches tailoring to anyone with steady hands. Magar measures everything twice and speaks about cloth with real affection.",
    third = "{name} met Magar, the tailoring trainer who owns Magar's Cloth Goods on Orgrimmar's Drag.",
  },
  greetings = {
    { id = "g_hi", text = "Mind the bolts, {class}; they're stacked for Rashona, and she counts every one like a warband counts its dead." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another lesson? Show me your stitches first, and I'll tell you if you're ready." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = { name = "Tailoring", min = 100 } },
      text = "Your hem's straighter than it was. Someone's been practicing, and it shows." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Magar, and this is my shop, Magar's Cloth Goods. I teach tailoring to anyone with a steady hand, and I sell thread and dye to everyone else, though most orcs think sewing is for those who can't swing an axe." },
      },
      again = { { id = "h_again", text = "What else? My needle's getting cold, and a cold needle bites." } },
      choices = {
        { text = "Why would an orc learn to sew?", next = "why" },
        { text = "Does Rashona work for you?", next = "rashona" },
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "Farewell, Magar.", next = "END" },
      },
    },
    why = {
      big = true,
      lines = { { id = "wh_default", text = "Because every grunt needs a shirt and every warlock needs a robe, and somebody has to make them. In the camps we wore what the humans gave us, and I swore I'd never wear another human's cloth again." } },
      choices = {
        { text = "A people who make their own clothes are free.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Cloth is cloth. I'd wear whatever's warmest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rashona = {
      lines = { { id = "ra_default", text = "She works beside me, not for me, and she'd tell you so herself if you suggested otherwise. She gathers cloth for the Horde, and I make sure some of it gets sewn before it goes out the door." } },
      choices = {
        { text = "You two seem to get along.", next = "rashona_along" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rashona_along = {
      lines = { { id = "rl_default", text = "Most days, though she thinks I'm too slow and I think she gives away too much. We've argued about it for years, and neither of us has ever won." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I wouldn't know about that. Ask me about cloth, and I'll have an answer; ask a grunt about the rest." } },
  },
}

---------------------------------------------------------------------------
-- Yelmak: the alchemy trainer, of Yelmak's Alchemy and Potions.
---------------------------------------------------------------------------
P:NPC {
  key = "yelmak", id = TODO_NPC("Yelmak"), name = "Yelmak", title = "Alchemy Trainer",
  bible = "bibles/yelmak.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "brisk" }, values = { "curious", "diligent" },
  notices = { "craft" },
  impression = {
    first = "Yelmak teaches alchemy on the Drag in a shop that always smells of something burning. Yelmak talks fast and gets excited about strange ingredients.",
    third = "{name} met Yelmak, the alchemy trainer on Orgrimmar's Drag.",
  },
  greetings = {
    { id = "g_hi", text = "Close the door behind you, quick, the fumes need to stay in." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Good, I've got a new mixture I'm dying to explain to someone." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { name = "Alchemy", min = 100 } },
      text = "You've got singed eyebrows, I see. That's the mark of a real alchemist, so wear it with pride." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Yelmak, alchemist, and this is my shop on the Drag. I teach anyone who wants to learn, sell vials to everyone, and only blow up the back room once a season, which is a better record than the old warlocks ever kept with their brews." },
      },
      again = { { id = "h_again", text = "Anything else? I've got something on the boil." } },
      choices = {
        { text = "What's the strangest potion you've made?", next = "strange" },
        { text = "Who buys the most potions?", next = "who" },
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "Farewell, Yelmak.", next = "END" },
      },
    },
    strange = {
      lines = { { id = "st_default", text = "One that turned a grunt's skin blue for a week, though it was meant to make him stronger. He was very angry, but I learned something, and that's what counts in alchemy." } },
      choices = {
        { text = "I hope you test them on volunteers.", next = "test" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test = {
      big = true,
      lines = { { id = "te_default", text = "Volunteers, yes, and sometimes they even know they're volunteering. I always pay them, though, and nobody's ever died, so I think that makes it fair." } },
      choices = {
        { text = "They should always know what they're drinking.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Knowledge costs something. A blue grunt is cheap.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "wh_default", text = "The warriors, always the warriors, because they get hit the most. Ask Grezz in the Valley of Honor how many healing potions his recruits drink in a week, and watch him pretend he doesn't know." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, but I could probably make a potion for it, grunt. Come back with the right herbs." } },
  },
}

---------------------------------------------------------------------------
-- Karolek: the leatherworking trainer.
---------------------------------------------------------------------------
P:NPC {
  key = "karolek", id = TODO_NPC("Karolek"), name = "Karolek", title = "Leatherworking Trainer",
  bible = "bibles/karolek.md", role = "trainer", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "practical", "honest" },
  notices = { "craft", "class" },
  impression = {
    first = "Karolek teaches leatherworking on the Drag and has hands as hard as the hides he works. He says little, but what he says is about the work.",
    third = "{name} met Karolek, the leatherworking trainer on Orgrimmar's Drag.",
  },
  greetings = {
    { id = "g_hi", text = "Hides on the left, tools on the right, and don't touch either without asking. A beast gave its life for each one, and an orc honors that." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Show me your work and I'll show you what's wrong with it." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = { name = "Leatherworking", min = 100 } },
      text = "Your stitching's tight, I see, and the edges are clean. You'll make a leatherworker yet." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid in a leatherworker's shop, and you don't look happy about the hides on the wall. They were dead before they got here, I promise you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Karolek, and I work leather. In the camps we wore human rags; now I teach orcs to skin a beast cleanly and stitch without wasting the hide, and if you can't do both, you'll learn or you'll leave." },
      },
      again = { { id = "h_again", text = "What else? The hides won't tan themselves." } },
      choices = {
        { text = "What makes good leather?", next = "good" },
        { text = "Where do you get your hides?", next = "where" },
        { text = "Teach me leatherworking.", next = "BUSINESS" },
        { text = "Farewell, Karolek.", next = "END" },
      },
    },
    good = {
      big = true,
      lines = { { id = "go_default", text = "A clean kill, a clean skin and a clean tan, in that order. A beast that died slowly gives a tough, ugly hide, so I tell every hunter that a kind kill makes the best leather." } },
      choices = {
        { text = "A clean kill honors the beast.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I care about the hide, not the beast.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = { { id = "wh_default", text = "The Barrens, mostly, from the zhevra and the kodo. The tauren bring me the best ones, because they waste nothing and they won't sell a hide they haven't respected." } },
      choices = {
        { text = "The tauren seem to trade fairly.", next = "tauren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "More fairly than I do, and they make me feel bad about it every time. A tauren once refused my gold and asked me for a song instead, and I still don't know what that was about." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Not my business. Go and ask some grunt who sits still long enough to gossip." } },
  },
}

---------------------------------------------------------------------------
-- Felika: trade supplies.
---------------------------------------------------------------------------
P:NPC {
  key = "felika", id = TODO_NPC("Felika"), name = "Felika", title = "Trade Supplies",
  bible = "bibles/felika.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "brisk" }, values = { "practical" },
  notices = { "craft" },
  impression = {
    first = "Felika sells thread, flux, vials and every other small thing a crafter runs out of, and she knows exactly what each customer forgot to buy last time.",
    third = "{name} met Felika, who sells trade supplies on Orgrimmar's Drag.",
  },
  greetings = {
    { id = "g_hi", text = "Thread, flux, vials, salt, whatever you've run out of, I've got it." },
    { id = "g_back", when = { metBefore = true }, text = "Let me guess, you ran out of something again. Everybody always does." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { name = "Blacksmithing", min = 50 } },
      text = "You'll be after flux, I expect, and probably more than you think, because smiths always underestimate it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Felika, and I sell supplies to every crafter on the Drag and half the ones in the Valley of Honor. The Horde builds on small things, and if it's small, cheap and you'll need fifty of it, I sell it." },
      },
      again = { { id = "h_again", text = "Anything else? There's a line forming." } },
      choices = {
        { text = "Who are your best customers?", next = "best" },
        { text = "What do people always forget?", next = "forget" },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Farewell, Felika.", next = "END" },
      },
    },
    best = {
      lines = { { id = "be_default", text = "The engineers, because they blow through everything I sell and come back the next day for more. Nogg alone keeps me in business half the year." } },
      choices = {
        { text = "Nogg must be a good customer.", next = "nogg" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nogg = {
      big = true,
      lines = { { id = "no_default", text = "He pays on time, he never haggles and he's only set fire to my stall once, which is better than most of his students. I'd rather have a dozen engineers than one smith who argues over a copper." } },
      choices = {
        { text = "Loyal customers are worth a little fire.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Fire's fire. I'd have banned him from the Drag.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forget = {
      lines = { { id = "fo_default", text = "Vials, every time, and then they stand in front of Yelmak's shop with a handful of herbs and nothing to put them in. I keep a crate by the door just for them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Couldn't say. I sell thread, not gossip, though I hear plenty of both." } },
  },
}
