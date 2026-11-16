-- Southshore's shopkeepers with nothing to say until now, and the goblin peddler on the road to Tarren Mill. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "lindea", id = TODO_NPC("Lindea Rabonne"), name = "Lindea Rabonne",
  title = "Fishing Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "southshore" }, temper = { "wry", "patient" }, values = { "practical", "loyal" },
  notices = { "craft", "weary" },

  impression = {
    first = "Lindea Rabonne sells hooks and line on the Southshore docks and keeps a straight face better than anyone in Hillsbrad. Whatever she and Donald are to each other, she enjoys keeping it secret.",
    third = "{name} met Lindea Rabonne, who sells fishing supplies on the docks of Southshore.",
  },

  greetings = {
    { id = "g_dock", text = "Hooks, line, bait and poles, everything but the patience, and I can't sell you that." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the docks? The fish have missed you, or so they tell me." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You smell of the sea and you've a hook in your hat brim, so you're one of us. Mind you don't get it caught on the door frame like Donald does." },
    { id = "n_wet", cat = "weary", when = { deathCause = "drowning" },
      text = "You've the look of someone the bay nearly kept, love. Sit a moment before you go back out; the water's colder than it looks." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than you'd think, and none of them have ever fished in their lives. Donald says I should ask what it's for, but I find it's better business not to know, and the bay doesn't mind either way." } },
      choices = {
        { text = "Smart of you not to ask. Keep it that way.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You should ask. Line can strangle as well as fish.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Lindea.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "He'd be heartbroken, though he'd never show it, since he believes fishing is about patience, not power. I tell him the fish don't care how they're caught, and he tells me that's why I'll never understand fishing." } },
      choices = {
        { text = "Donald is right. Patience is the real reward.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The fish don't care how they're caught. Neither do I.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lindea Rabonne, fishing supplies. Donald teaches the lessons, I sell the gear, and between us we've put a pole in the hands of half of Southshore. The other half are soldiers, and they never have the time." },
        { id = "h_coast", when = { questDone = TODO_QUEST("Down the Coast") },
          text = "You're the one who cleared the Torn Fin off the strand, aren't you? The nets are coming back full again, and I've sold more line this week than all last month, so you have my thanks." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll want fishing line, I suppose, though I suspect you'll use it to trip someone rather than catch a fish, and I'll not ask which." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! You'll not need a pole, I suppose, since your kind just freeze the fish where they swim, and Donald will be very disappointed to hear it." },
      },
      again = {
        { id = "h_again", text = "What else, love? The tide waits for no one, but I can." },
        { id = "h_again2", text = "Go on, ask, and I'll keep sorting hooks while you do." },
      },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "How are you and Donald related?", next = "donald" },
        { text = "What's biting in the bay?", next = "fish" },
        { text = "Southshore seems tense these days.", next = "tense" },
        { text = "Do the murlocs trouble the docks?", next = "murlocs", when = { questBefore = TODO_QUEST("Down the Coast") } },
        { text = "Do rogues often buy fishing line from you, Lindea?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Would Donald really be disappointed in me, Lindea?", next = "xmage", when = { class = "MAGE" } },
        { text = "Good fishing to you.", next = "END" },
      },
    },
    donald = {
      lines = {
        { id = "d_default", text = "Oh, he told you to ask me, did he? He won't say, and I won't either, and we've had all of Southshore guessing for years. It's the cheapest entertainment in Hillsbrad, friend." },
      },
      choices = {
        { text = "Married, surely.", next = "donald_guess" },
        { text = "Fair enough. It's your business.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    donald_guess = {
      lines = {
        { id = "dg_default", text = "That's what Bilger thinks, and Kelly thinks we're brother and sister, and the magistrate once asked me in court, which I didn't answer either. Keep guessing; it does you credit." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    fish = {
      lines = {
        { id = "f_default", text = "Mostly mackerel and a good few longjaw mud snappers in the shallows, and further out you'll land something bigger if your line holds. The fish come in close in the evenings, so that's when you'll see Donald and me out at the end of the pier." },
      },
      choices = {
        { text = "What bait works best?", next = "fish_bait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish_bait = {
      lines = {
        { id = "fb_default", text = "Shiny lures in the morning when the water's clear, and plain worms when it's churned up after a storm. Don't believe anyone who swears by one bait for every day; the fish never read their books." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tense = {
      lines = {
        { id = "t_default", text = "It's the Forsaken in Tarren Mill, love, just up the hill. They came out of nowhere and took the town, and now the farms in the fields are sickening and the marshal has every man who can hold a spear standing at the walls." },
      },
      choices = {
        { text = "Tarren Mill should be taken back.", next = "BACK", fx = { align = { order = 1 }, trait = { brave = 1 } } },
        { text = "Fighting over a hill won't heal those farms.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Has it hurt your trade?", next = "tense_trade" },
      },
    },
    tense_trade = {
      lines = {
        { id = "tt_default", text = "Not as much as you'd think, because frightened people still have to eat, and fish don't care who holds the hill. The soldiers buy more than you'd guess, too; there's nothing like a long watch to make a man want to sit on a pier." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    murlocs = {
      lines = {
        { id = "m_default", text = "The Torn Fin have come up the strand to the west and chased the fishermen off their own nets. Lieutenant Farren's meant to be dealing with it, but he spends more time at the inn than on the beach, so someone else might have to." },
      },
      choices = {
        { text = "I'll go and see to it.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was born in Southshore and I've never wanted to leave. There's no fish in Stormwind half as good as ours." } },
    advice = { { id = "tp_ad", text = "Keep your line dry when you're not using it, love, and it'll keep you fed for years." } },
    _none = { { id = "tp_none", text = "That's not something they talk about on the docks, dear. Ask the loremaster; he knows all sorts." } },
  },
}

P:NPC {
  key = "nandar", id = TODO_NPC("Nandar Branson"), name = "Nandar Branson",
  title = "Alchemy Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "southshore" }, temper = { "anxious", "earnest" }, values = { "careful", "kind" },
  notices = { "craft", "race" },

  impression = {
    first = "Nandar Branson sells vials and reagents in Southshore and worries aloud about what the Forsaken are brewing up the hill. He seemed like a man who reads every label twice and still doesn't sleep.",
    third = "{name} met Nandar Branson, who sells alchemy supplies in Southshore.",
  },

  greetings = {
    { id = "g_shop", text = "Vials, reagents and the odd tincture, all properly labelled. Do come in, but mind the glass." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again, good. I was hoping for a customer who knows what they're buying." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "An alchemist, or at least a picker, I can see the green on your fingers. Hillsbrad's a good place for herbs, friend, as long as you know which fields to stay out of." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Light above, one of them, here! Please, I don't want any trouble, and I've nothing in this shop worth stealing for your apothecaries." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the Syndicate holds most of the hills, the ogres hold the rest, and the Forsaken have been poisoning the springs. I pay a premium for anything a gatherer manages to bring down alive, and they don't always come back." } },
      choices = {
        { text = "Then I'll gather what I need myself. Easier on everyone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The Syndicate must be driven out of the hills. I'll help.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, Nandar.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Candles and chalk and a few herbs that go into the less unpleasant rituals, but nothing more. I've watched what the apothecaries up the hill brew in their cauldrons, and I'll not have Southshore's name on anything that goes into a summoning." } },
      choices = {
        { text = "Fair enough. I'll get my reagents elsewhere.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your fear is foolish. Reagents are just tools.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nandar Branson, alchemy supplies. I keep the vials clean and the reagents dry, and I try not to think too much about what the apothecaries in Tarren Mill are mixing up there in their cauldrons." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! You'll want reagents for your spells, and I'll warn you that the good ones come from the Alterac hills, which means they're expensive and hard won." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. You'll want soul shards, I suppose, and I'll tell you now that I don't sell them, and I'd rather not know where you get them." },
      },
      again = {
        { id = "h_again", text = "Yes? Is there something else, friend?" },
        { id = "h_again2", text = "Ask what you like. I'm only sorting stock, and it calms the nerves." },
      },
      choices = {
        { text = "Let me see your stock.", next = "BUSINESS" },
        { text = "What are they mixing in Tarren Mill?", next = "tarren" },
        { text = "What herbs grow in Hillsbrad?", next = "herbs" },
        { text = "Who buys potions in a town like this?", next = "buyers" },
        { text = "The Light could help those sick farms.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Why are reagents from Alterac so hard to come by, Nandar?", next = "xmage", when = { class = "MAGE" } },
        { text = "What reagents do you sell to warlocks, Nandar?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Good day.", next = "END" },
      },
    },
    tarren = {
      lines = {
        { id = "t_default", text = "Plague, friend, or something near enough that it makes no difference. The farmers in Hillsbrad Fields have seen the undead out among the crops at night, and now their livestock are sickening, and their families after them." },
      },
      choices = {
        { text = "Have you seen it yourself?", next = "tarren_seen" },
        { text = "Then someone has to stop them.", next = "BACK", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "That's the farmers' trouble, not mine.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
      },
    },
    tarren_seen = {
      lines = {
        { id = "ts_default", text = "A farmer brought me a sick calf's blood in a jar and asked what it was, and I couldn't tell him, and I've studied alchemy for twenty years. Whatever they're making up there, it isn't anything a living alchemist would recognize." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    herbs = {
      lines = {
        { id = "h_herbs", text = "Briarthorn and Bruiseweed along the roads, Wild Steelbloom up near the mountains, and Kingsblood if you're lucky. Stay out of the fields round the Hillsbrad farms, though, because I wouldn't trust anything growing in that soil now." },
      },
      choices = {
        { text = "Why not the farms?", next = "herbs_farms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_farms = {
      lines = {
        { id = "hf_default", text = "Because whatever's making the cattle sick is in the ground or the water, and herbs drink both. I've thrown out two batches already that came from there, and one of them was black at the root." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = {
        { id = "b_default", text = "The marshal's men, mostly, because they buy healing draughts by the crate before every patrol to Alterac. And the mages from Dalaran who pass through, though they turn their noses up at everything and buy it anyway." },
      },
      choices = {
        { text = "Dalaran's mages come this way?", next = "buyers_dalaran" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_dalaran = {
      lines = {
        { id = "bd_default", text = "Now and again, friend, from the camps around their dome up north. They're sealed in, mostly, but some still come down for supplies, and they always want the finest crystal vials, which of course I keep for them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = {
        { id = "p_default", text = "Bless you for saying it, friend. Prayer and potions together might do what neither can alone, and the farmers would take any help at all, so go and see them in the fields if you can bear it." },
      },
      choices = {
        { text = "I'll go to the farms.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I studied under an alchemist in Lordaeron, before the plague, and came south when the north went bad. I didn't think it would follow me here." } },
    advice = { { id = "tp_ad", text = "Never drink anything you didn't see bottled, friend. Not in Hillsbrad, not anymore." } },
    _none = { { id = "tp_none", text = "I'm sorry, friend, I wouldn't know. I keep to my shelves and my labels." } },
  },
}

P:NPC {
  key = "micha", id = TODO_NPC("Micha Yance"), name = "Micha Yance",
  title = "Trade Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "southshore" }, temper = { "brisk", "friendly" }, values = { "practical" },
  notices = { "craft" },

  impression = {
    first = "Micha Yance keeps Southshore's crafters in thread, flux and dye, and knows what everyone in town is working on. Talking to Micha felt like hearing the town's business told through what it buys.",
    third = "{name} met Micha Yance, who sells trade supplies in Southshore.",
  },

  greetings = {
    { id = "g_shop", text = "Thread, flux, salt and dye for whatever you're making. Have a look round." },
    { id = "g_back", when = { metBefore = true }, text = "Good to see you again! What are you making this time?" },
  },

  notice = {
    { id = "n_crafter", cat = "craft", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing", "Engineering" } },
      text = "A crafter, I can always tell by the calluses, and Southshore always needs more of you. Most of my customers are soldiers patching their own boots, and badly." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every week, from people who say they've lost their keys, and I tell every one of them to see the Magistrate. Southshore's a small town, and if a lock gets picked, everyone knows who bought the tools." } },
      choices = {
        { text = "You're right. A small town needs honest traders.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A lockpick is just a tool. You could sell it honestly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Micha.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Enough that I keep a shelf of purple dye just for the ones who came down from Dalaran. They're particular about the shade, and I've learned to stock three kinds of violet, which is more than any town this size should need." } },
      choices = {
        { text = "The violet matters. It's a sign of who we are.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Dalaran's colors are a vanity. Any cloth will do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Micha Yance, trade supplies. If you're stitching, tanning, smithing or tinkering, I've got the bits you need, and if I don't, it's on the next cart from Menethil." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll want leather, thread and maybe a lockpick or two, though I'll say I only sell the first two, and I'd prefer you didn't ask about the third." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! You'll want silk thread and maybe a little dye, since I've noticed your robes need patching after a few weeks in the hills." },
      },
      again = {
        { id = "h_again", text = "Ask on; I've a cart to unload, but my tongue works fine while I do." },
        { id = "h_again2", text = "Anything else you need?" },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "What sells best in Southshore?", next = "sells" },
        { text = "How do your carts get through?", next = "carts" },
        { text = "I'm a tailor. Where's the good cloth?", next = "tailor", when = { profession = "Tailoring" } },
        { text = "Has anyone asked you for lockpicks before, Micha?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do many mages buy cloth and dye in Southshore, Micha?", next = "xmage", when = { class = "MAGE" } },
        { text = "That's all.", next = "END" },
      },
    },
    sells = {
      lines = {
        { id = "s_default", text = "Heavy thread and leather patches for the soldiers, because they wear through everything on the walls. The fishermen buy salt by the barrel, and the mages passing through buy fine thread and complain about the price." },
      },
      choices = {
        { text = "The soldiers keep you busy, then.", next = "sells_soldiers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells_soldiers = {
      lines = {
        { id = "ss_default", text = "Busier than I'd like, because it means there's fighting. Every time the marshal sends a patrol up toward Tarren Mill or into Alterac, they come back in rags, and I'd trade it all for a quiet year." },
      },
      choices = {
        { text = "So would I.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    carts = {
      lines = {
        { id = "c_default", text = "Up over the Thandol Span and west across Arathi, with a guard or two if I can afford them. The road through the hills is the danger, because the Syndicate watch it from Durnholde, and they love a merchant's cart." },
      },
      choices = {
        { text = "The Syndicate?", next = "carts_syndicate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carts_syndicate = {
      lines = {
        { id = "cs_default", text = "Alterac's old nobility and the thieves who work for them, holed up in the old keep. They call it reclaiming their lands, and everyone else calls it banditry, and I call it a tax I never voted for." },
      },
      choices = {
        { text = "They're no better than bandits.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Maybe they have a claim, after what Alterac lost.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tailor = {
      lines = {
        { id = "k_default", text = "Not from the farms anymore, friend, because nobody will touch Hillsbrad wool since the sickness came to the fields. I've linen and wool off the Menethil carts instead, and the soldiers' old uniforms if you're not proud." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I took over the shop when the last keeper went north and never came back. I've done my best to keep it running ever since." } },
    advice = { { id = "tp_ad", text = "Buy your thread before a battle, not after. Afterwards, everyone needs it." } },
    _none = { { id = "tp_none", text = "Not my trade, friend. Ask Loremaster Dibbs; he'll tell you more than you wanted to know." } },
  },
}

P:NPC {
  key = "zixil", id = TODO_NPC("Zixil"), name = "Zixil",
  title = "Merchant Supplier",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "southshore", "tarren_mill" }, temper = { "breezy", "sly" }, values = { "greedy", "practical" },
  notices = { "purse", "race" },

  impression = {
    first = "Zixil peddles odd goods along the road between Southshore and Tarren Mill, guarded by a pair of clanking robots. The goblin sells to both sides of the war and finds the whole arrangement very funny.",
    third = "{name} met Zixil, the goblin peddler who walks the road between Southshore and Tarren Mill.",
  },

  greetings = {
    { id = "g_road", text = "Ho there, customer! Don't mind the robots; they only shoot people who don't pay." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite customer, back again! Well, one of my favorites; I have a few." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Now there's a purse that jingles in all the right places! Let me show you the good stock, friend, the stuff I don't show the soldiers." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Go on, have a look at the Overwatch units, I know you want to. Don't open the panels, though; they bite." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If they do, they haven't put in an order, and I'd sell to them too, at a fair markup. Southshore buys my lamp oil and Tarren Mill buys my rope, and the hills don't seem to mind either one, so I don't see why I should." } },
      choices = {
        { text = "The Horde should win here, and you should pick a side.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Smart goblin. Sides are for people who can't do arithmetic.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Of course, pal, because gold doesn't care which side of the war it's on, and neither do I. The Overwatch units keep the road safe enough, and both towns pay me to keep their secrets, which is the best kind of business there is." } },
      choices = {
        { text = "Selling to both sides is smart. Gold is gold.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Playing both sides will catch up with you someday.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else, Zixil.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It climbed inside looking for something shiny and set fire to the wiring, and the robot walked into Lordamere Lake before I could stop it. I fished it out the next morning, and it still clanks funny, so I've banned imps from the stall." } },
      choices = {
        { text = "I'll keep my imp away from your robots.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Imps go where they want. Build better robots.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman! I don't sell totems, before you ask, because carved wood weighs a ton and the Overwatch units won't carry anything that might get struck by lightning." },
        { id = "h_default", key = true,
          text = "Zixil, merchant supplier to the hills! I walk from Southshore to Tarren Mill and back again, selling a little of this and a little of that, and the two Overwatch units keep the road very polite." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Zixil, merchant supplier to the hills, and yes, I was in Southshore an hour ago, and no, I won't tell you what they're up to. A goblin who carries tales doesn't carry goods for long." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Now there's a customer who appreciates a good deal and a quiet exchange, and I've got both, if you know what to ask for." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now I've got a few things that might interest you, pal, though I'll ask you not to let the imp near my robots, because it shorted one out last month." },
      },
      again = {
        { id = "h_again", text = "What else, customer? Talk while you walk; I've a schedule." },
        { id = "h_again2", text = "Anything else? The robots are getting bored." },
      },
      choices = {
        { text = "Do the spirits care who wins in Hillsbrad, Zixil?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me what you're carrying.", next = "BUSINESS" },
        { text = "You trade with both towns?", next = "both" },
        { text = "Tell me about your robots.", next = "robots" },
        { text = "What exactly do you sell?", next = "goods" },
        { text = "How did a gnome machine end up guarding you?", next = "gnome", when = { race = "Gnome" } },
        { text = "Do you really sell to both Southshore and Tarren Mill, Zixil?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "How did an imp short out your robot, Zixil?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Safe travels.", next = "END" },
      },
    },
    both = {
      lines = {
        { id = "b_default", text = "Of course! Southshore buys from me, Tarren Mill buys from me, and both of them pretend the other doesn't. Gold's the same colour on either end of the road, and that's the only side I'm on." },
      },
      choices = {
        { text = "Doesn't that make you a traitor to both?", next = "both_traitor" },
        { text = "Smart business.", next = "BACK", fx = { trait = { greedy = 1 }, affinity = 1 } },
      },
    },
    both_traitor = {
      lines = {
        { id = "bt_default", text = "A traitor has to belong to someone first, friend, and I belong to the Cartel and my ledger. Neither town has ever asked me to choose, because then they'd both have to walk to Booty Bay for their goods." },
      },
      choices = {
        { text = "Fair enough. Neutral is neutral.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Everyone chooses a side in the end.", next = "BACK", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    robots = {
      lines = {
        { id = "r_default", text = "Overwatch Mark I, the finest bodyguards money can rent! They don't sleep, they don't drink, and they don't ask for a share, which is more than you can say for any mercenary I've ever hired." },
      },
      choices = {
        { text = "Do they ever have to fight?", next = "robots_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    robots_fight = {
      lines = {
        { id = "rf_default", text = "Now and then a bear comes out of the woods, or a Syndicate type thinks he's clever, and then they fight very loudly. Nobody tries it twice, friend, and that's what I'm paying for." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    goods = {
      lines = {
        { id = "g_default", text = "Whatever I picked up last, friend, and whatever folk on this road need: a recipe here, a bit of kit there, things you won't find on any shop shelf. Stock changes every trip, so if you see something you like, I'd buy it now." },
      },
      choices = {
        { text = "That's what every merchant says.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Let me have a look.", next = "BUSINESS" },
      },
    },
    gnome = {
      lines = {
        { id = "gn_default", text = "Bought them used, friend, and asked no questions about where they came from. Maybe your folk built the first ones; I couldn't say, but they hold their own on this road better than any guard I've hired." },
      },
      choices = {
        { text = "They're good work, I'll admit.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I came north from Booty Bay with a cart and a plan, and the cart's long gone but the plan's working beautifully." } },
    advice = { { id = "tp_ad", text = "Never travel the hills alone, friend, because the bears up there don't haggle." } },
    _none = { { id = "tp_none", text = "Don't know it, can't sell it, so I'm not interested. Next question, customer!" } },
  },
}
