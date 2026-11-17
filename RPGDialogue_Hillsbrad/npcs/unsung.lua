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
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "There was a time I'd have laughed at the question, but the catches are smaller every year, and the murlocs are fighting us for what's left. I don't know if it's us or them, but somebody's taking too much." } },
      choices = {
        { text = "Then set limits. The bay won't feed you if it's empty.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "People need to eat. The bay will manage.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "One or two, for the fields toward Tarren Mill, where the Forsaken patrol by night. I sell it as fishing line and they buy it as fishing line, and Donald thinks we've had a very good season for anglers." } },
      choices = {
        { text = "Tripwires are a coward's trick. Fight them face to face.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Whatever brings down a Forsaken patrol. Sell them more.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Lindea.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than you'd think, since the hills are thin this year and the bay never quite is. Donald says a hunter who fishes is only being sensible, and I say a hunter who fishes couldn't find a lion, and we both enjoy the argument." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} will want the fish, I suppose, which is fair, since your beast is the only one in Southshore who'll eat Donald's catch without complaining about the bones." },
      },
      choices = {
        { text = "I share what I catch. That's how a town survives.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I keep what I catch. Others can find their own.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Once or twice, to see the refugee boats in after the plague, and they carried children up the pier in their arms as if they weighed nothing. Donald still talks about it, though he pretends he doesn't." } },
      choices = {
        { text = "That's what the Light's knights are for, Lindea.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Carrying children was easy. They should have stopped the plague.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The old ones touch the post at the end of the pier and say a word to the Light, and the young ones laugh at them until their first storm. I sell them all the same line, but I notice it's the praying ones who keep coming back for more." } },
      choices = {
        { text = "Faith keeps them steady when the sea doesn't.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Good line keeps them alive. The praying's just comfort.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "One, a few summers back, and he tried to use his imp as bait, and Donald still tells the story at the bar. The imp came back up angry and singed, and the fish were none the wiser, so I sold him a proper lure and some advice, and he did better after that." } },
      choices = {
        { text = "A proper lure it is. I'll do this honestly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The imp could use a swim, frankly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Lindea.", next = "BACK" },
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
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest buying fishing line? Well, I suppose even the Light's servants want a quiet evening, and the docks are the quietest place in Southshore." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, and in all that plate! If you fall off my dock you'll sink like an anchor, so mind the loose board by the third post." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll not want fishing line, I expect, though it makes a handy bowstring in a pinch, and a handier tripwire." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll want snares and line, I suppose, and maybe a hook or two in case the hills turn out stingy." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid! Donald says your people fish with a spear and a prayer. I sell only one of those, but I've plenty of spears." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock buying fishing gear, now I've seen everything. You'll want the sturdy line, I'd guess, because something tells me you won't be patient with the snags." },
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
        { text = "Do the fishermen pray before they sail, Lindea?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Did knights of the Silver Hand ever come down to the docks?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Have soldiers bought your line for tripwires, Lindea?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters buy fishing gear from you, Lindea?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the fishermen take too much from the bay?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Has a warlock ever bought fishing gear from you, Lindea?", next = "xlock", when = { class = "WARLOCK" } },
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
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Freely? Never, for the hills are full of ogres and Syndicate. If you mean whether we should pick everything we find, I've seen fields of briarthorn stripped bare in a season, and they never came back." } },
      choices = {
        { text = "Leave the roots and take only some. That's the way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Whoever picks first earns it. That's how trade works.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "None that I can promise, if I'm honest, though I've a draught that helps against the common poisons and buys time against the worse ones. I read every label twice and still lie awake wondering whether it's enough." } },
      choices = {
        { text = "I'll trust your draught and the Light. Both will see me through.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Antidotes are guesswork. I'll trust my blade and nothing else.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Nandar.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The ones running down from Tarren Mill, by the smell, and the ones near the Hillsbrad farms, by the dead fish. A gatherer brought me a bundle from the lower banks last month, and I burned the lot, because I'll not sell anything that might have drunk the plague." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Don't let {pet} drink from those streams, please, because a beast can't read a warning, and I'd hate for it to learn the hard way." },
      },
      choices = {
        { text = "Better burned than risked. You were right to be careful.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You burned good herbs on a guess. That's waste.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Empty vials are only glass, and I tell myself that every time I wrap one. What frightens me isn't a rogue with a vial, it's the apothecaries at Tarren Mill with whole cauldrons of the stuff, and none of them ever came in to buy anything from me." } },
      choices = {
        { text = "A blade's poison harms one. A cauldron harms everyone. You're right.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Poison is poison, Nandar, whoever pours it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Nandar.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nandar Branson, alchemy supplies. I keep the vials clean and the reagents dry, and I try not to think too much about what the apothecaries in Tarren Mill are mixing up there in their cauldrons." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! You'll want reagents for your spells, and I'll warn you that the good ones come from the Alterac hills, which means they're expensive and hard won." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. You'll want soul shards, I suppose, and I'll tell you now that I don't sell them, and I'd rather not know where you get them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll be one of those who goes up toward Tarren Mill, then, and I'd beg you to carry an antidote, because what they're brewing up there won't care how thick your armour is." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. If you're out in the hills, I'd pay well for herbs from the higher slopes, so long as you pick them above the streams the Forsaken have been fouling." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and a night elf one! I've a hundred questions about herbs and no one to ask, so do forgive me if I follow you around." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll want the poison vials, I suppose, and the clean ones, and I'll sell you those, but please don't tell me what goes in them, because I sleep badly enough already." },
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
        { text = "What antidote would protect me from the Forsaken, Nandar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Which streams have the Forsaken fouled, Nandar?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Should herbs be gathered freely in the hills?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you sell poison vials to anyone who asks, Nandar?", next = "xrogue", when = { class = "ROGUE" } },
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
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "From the hills, mostly, and from the hunters who bring in the deer and the bears. There are fewer of both these days, and the price is going up, which is good for me and bad for everyone else." } },
      choices = {
        { text = "Then hunt fewer. The hills need their beasts.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "People need leather. The hunters should take what they need.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The careful ones do, and the rest wait until something falls off in the middle of a fight. Kundric swears a lost buckle once decided a battle in these hills, and I don't believe him, but I've sold more buckles since he started telling it." } },
      choices = {
        { text = "Mend your gear every night. Discipline keeps you alive.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Gear breaks. A good fighter adapts and keeps swinging.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Micha.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bear and lion, mostly, since the soldiers want sturdy jerkins and the farmers want gloves that won't tear on a fence. I keep a list of who's waiting on what, and it's longer than the Magistrate's list of Syndicate camps." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a lovely coat, and before you glare at me, I only mean someone's clearly been brushing it. I'd never sell a hunter's companion, I promise." },
      },
      choices = {
        { text = "I'll take only what the crafters need. Waste is a sin.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Every hide is coin. I'll skin whatever I find.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Hardly any since the Silver Hand broke, and I used to sell more buckles and polish than anything else on the cart. Now it's mostly Stormwind soldiers passing through, and they don't keep their kit half so well." } },
      choices = {
        { text = "The order's discipline deserves remembering.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Polish never won a war. The soldiers fight just as well.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The soldiers up north at Chillwind Camp, mostly, and the order grows every month, which tells you all you need to know about how the fighting goes. I pack it myself and I try not to think about it, though I don't always manage." } },
      choices = {
        { text = "Every shroud is a soul given proper rest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to send more blades and fewer shrouds.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Runecloth and silk, mostly, for robes, and dyes so dark I've had to send to Menethil for them twice. Nobody in Southshore asks what the robes are for, and I don't either, since a sale's a sale and the cart from Menethil doesn't run on curiosity." } },
      choices = {
        { text = "Honest robes for honest coin. I've nothing to hide.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Best not to ask, Micha. Keep it that way.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Micha.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Micha Yance, trade supplies. If you're stitching, tanning, smithing or tinkering, I've got the bits you need, and if I don't, it's on the next cart from Menethil." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll want leather, thread and maybe a lockpick or two, though I'll say I only sell the first two, and I'd prefer you didn't ask about the third." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! You'll want silk thread and maybe a little dye, since I've noticed your robes need patching after a few weeks in the hills." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! You'll be wanting linen, I expect, because the camp up in the Plaguelands buys it by the bolt for bandages and shrouds, and I can never keep enough of it." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! You'll want oil and polish for that plate, I'd wager, because the damp in Hillsbrad will rust a buckle overnight." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want leather strips and heavy thread for those straps, I'd guess, since every soldier who comes back from the fields has something torn." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Bring me good hides from the hills and I'll find a crafter who needs them, since half of Southshore's leatherworkers are short on everything but complaints." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid. Do your people use thread and leather, or do you just grow your clothes on trees? I'm only partly joking." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. I sell to every trade that walks in, but I'll say now that I've no use for anything that whispers, so if you're selling, I'm not buying." },
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
        { text = "Shrouds by the bolt? Who orders them, Micha?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you outfit many knights these days, Micha?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the soldiers mend their own gear here, Micha?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What hides do Southshore's crafters need most, Micha?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Where does Southshore's leather come from, Micha?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What does a warlock buy from a trade supplier, Micha?", next = "xlock", when = { class = "WARLOCK" } },
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
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only what's lying about and nobody's using! Fallen branches, dropped arrows, the odd lost boot. I'm a merchant, not a logger, and I'd never cut down a tree when there's one already lying on the ground." } },
      choices = {
        { text = "Fair enough. Scavenging the fallen hurts no one.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Even fallen wood feeds the forest. Leave it be.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Whetstones, rivets, and a little something to stop the shakes after a long fight, and I sell the same to both towns, which keeps the prices honest. Tarren Mill buys the heavy stuff and Southshore buys the cheap stuff, and I'll let you guess who's winning." } },
      choices = {
        { text = "Selling arms to both sides is no better than treason.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Smart business. War's good for anyone with a wagon.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Zixil.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Scare it? They chase it, pal, and then they walk into trees, which is how I lost a perfectly good Overwatch unit to a bear last spring. The bear's fine, in case you're wondering, and it's still got one of my gears." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} away from the robots, will ya, because they've got a thing about anything with fur, and I'm still payin' off the last one." },
      },
      choices = {
        { text = "Your machines should stay on the road where they belong.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them roam. A little chaos keeps the road interesting.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I sell wares to customers, pal, and the customers decide what's a weapon. Tarren Mill buys rope and lamp oil, Southshore buys rope and lamp oil, and what either side does with it is a moral question for folk in better armour than mine." } },
      choices = {
        { text = "Arming the Forsaken makes you part of their war.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Rope's rope. A merchant can't answer for every buyer.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A priest in Southshore, technically, because I left a sack of it outside the chapel during a service and nobody can prove the blessing didn't reach it. Tarren Mill won't buy it, of course, since the Forsaken don't care for holy anything, so you're my only market." } },
      choices = {
        { text = "Selling false blessings is a sin, Zixil.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Folk find comfort either way, and I see no harm in it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "A few scrolls, a lantern that might have been enchanted, and a box of something I bought cheap off a fellow from Dalaran who was in a hurry. I don't ask what my customers do with things, and you shouldn't ask what Southshore does with them either, because that's how I stay in business." } },
      choices = {
        { text = "Arming our enemies is shameful, Zixil.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Sell them the duds at full price, then.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest, and a customer, I hope! Holy water, unholy water, plain water with a nice label on it, I don't judge, I just price." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage! You can conjure your own bread and water, which is terrible for my business, so I hope you've come for something you can't make out of thin air." },
        { id = "h_default", key = true,
          text = "Zixil, merchant supplier to the hills! I walk from Southshore to Tarren Mill and back again, selling a little of this and a little of that, and the two Overwatch units keep the road very polite." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Zixil, merchant supplier to the hills, and yes, I was in Southshore an hour ago, and no, I won't tell you what they're up to. A goblin who carries tales doesn't carry goods for long." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Now there's a customer who appreciates a good deal and a quiet exchange, and I've got both, if you know what to ask for." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now I've got a few things that might interest you, pal, though I'll ask you not to let the imp near my robots, because it shorted one out last month." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest from the Southshore side! I've holy candles, blessed salt and a very convincing reliquary, and I'll swear on my robots that the salt is blessed." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! I've had knights try to arrest me before, so let's get it out of the way: everything I sell is legal in at least one of the two towns I sell it in." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, pal! You look like you break a lot of things, and I sell a lot of things to replace 'em, so I think we're gonna be friends." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! You got the look of someone who needs ammo, and I got the look of someone who sells it, so let's skip the haggling and go straight to the paying." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You walk the road between the hills too, I bet, so you'll know how lonely it gets out there. It's good for business, though." },
      },
      again = {
        { id = "h_again", text = "What else, customer? Talk while you walk; I've a schedule." },
        { id = "h_again2", text = "Anything else? The robots are getting bored." },
      },
      choices = {
        { text = "Do the spirits care who wins in Hillsbrad, Zixil?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Ever sold anything magical to Southshore, Zixil?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me what you're carrying.", next = "BUSINESS" },
        { text = "You trade with both towns?", next = "both" },
        { text = "Tell me about your robots.", next = "robots" },
        { text = "What exactly do you sell?", next = "goods" },
        { text = "How did a gnome machine end up guarding you?", next = "gnome", when = { race = "Gnome" } },
        { text = "Do you really sell to both Southshore and Tarren Mill, Zixil?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "How did an imp short out your robot, Zixil?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Who blessed your salt, Zixil?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you sell weapons to the Forsaken, Zixil?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What does a goblin sell a warrior, Zixil?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do your robots ever scare off the game, Zixil?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you take anything from the land you walk, Zixil?", next = "xdruid", when = { class = "DRUID" } },
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
