-- Booty Bay's shopkeepers with nothing to say until now, and the axe trader at Nesingwary's camp. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "kizz", id = TODO_NPC("Kizz Bluntstrike"), name = "Kizz Bluntstrike",
  title = "Macecrafter",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "brash", "cheerful" }, values = { "practical", "greedy" },
  notices = { "class", "kit" },

  impression = {
    first = "Kizz Bluntstrike sells maces in Booty Bay and talks about them the way a poet talks about roses. The sales pitch never stops, and the maces never bend.",
    third = "{name} met Kizz Bluntstrike, who sells maces on the boardwalks of Booty Bay.",
  },

  greetings = {
    { id = "g_shop", text = "Maces, cudgels, hammers, all of it heavy and all of it for sale! Come in and pick one up; you'll feel the difference." },
    { id = "g_back", when = { metBefore = true }, text = "Back for something heavier? I knew you'd come round to it." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST", "SHAMAN" } },
      text = "Oh, I know your sort! Holy folk can't stand an edge, so you all end up buying blunt, and I end up buying a bigger boat." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your weapon's had a hard life, friend. A mace doesn't chip the way a sword does, which is all I'm saying, and I'm saying it while standing next to a rack of them." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a sword cuts, but a mace convinces, and when you're facing a Mosh'Ogg brute in his iron scraps you need a lot of convincing. Every Bloodsail bosun I ever saw wore a coat of mail, and I watched a Blackwater raider put one down with a single swing of my best." } },
      choices = {
        { text = "The right weapon for the fight. That's sense, not fashion.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll fight with whatever I've got and make it work.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not a thing, friend, since your sort take to a mace about as well as a goblin takes to swimming, though I've had hunters buy one to crack coconuts. I'd sell your beast a mace head to chew on, if anybody had ever asked." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not a thing, friend, since your sort take to a mace about as well as a goblin takes to swimming, though I've had hunters buy one to crack coconuts. I'd sell your beast a mace head to chew on, if anybody had ever asked. Look at {pet}, now, eyeing my stock like it knows good steel, and I'd say it's got better taste than most of my customers." },
      },
      choices = {
        { text = "Every hunter to his own weapon. I'll stick to the bow.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd swing a mace if I pleased. Nobody tells me otherwise.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Of course! A mage with a mace is a mage who doesn't die when the raptor gets close. I'll even sell you a light one, so you can still wave your hands about afterwards." } },
      choices = {
        { text = "Sensible. I'll take one, and learn to swing it properly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll stick to spells and burn the raptor first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Swords are for duelists and axes are for woodcutters, but a mace is honest, and I think your spirits like honest. Also, you can't cut yourself on one while you're waving your other hand at a thunderstorm." } },
      choices = {
        { text = "An honest weapon for an honest fight. I agree.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll use whatever wins, honest or not.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A quiet tap behind the ear, friend, which ends a fight without all the mess a dagger leaves on the deck. The Bruisers carry clubs for exactly that reason, because the Baron hates cleaning blood off his docks." } },
      choices = {
        { text = "A clean knockout is kinder than a blade. I'll take one.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mess is a message. I'll stick with the dagger.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Kizz.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "One did, a Forsaken fellow who wanted something heavy to hold down the corners of his chalk diagram during a sea breeze. He paid in full and never came back, and I like to think the mace is still doing its job somewhere." } },
      choices = {
        { text = "A good tool is a good tool, whatever the use.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A mace is for fighting. Sell it for that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because you can't stay a bear forever, friend, and when you're back on two legs and a raptor's still coming, a staff only gets you so far. Half the druids I've sold to carried a mace under their robes, and they all looked embarrassed about it." } },
      choices = {
        { text = "A staff from a living tree serves me better than your iron.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fair point. A good weapon is a good weapon, whoever carries it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Your lot love a good mace, so step right up, because nothing channels the earth like a lump of iron on a stick." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage! You'll want a mace for when the spells run out, because a good thump works whether you've got mana or not." },
        { id = "h_default", key = true,
          text = "Kizz Bluntstrike, macecrafter to the finest cove in the South Seas. Swords need sharpening and axes get stuck, but a good mace just keeps working, and so do I, at a fair price." },
        { id = "h_holy", when = { class = { "PRIEST", "PALADIN" } },
          text = "A servant of the Light, in my shop! Your lot are my best customers, you know, because whoever wrote your rules about edges was a friend to the mace trade." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Now, I know your kind prefers a little blade, but let me tell you, friend, a mace has a poetry all its own, and nobody ever argues with it twice." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock in my shop! Now, you won't need a mace, I suppose, but a fine one makes a lovely ornament for a summoning circle, if I do say so myself." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Now you're my sort of customer, because you know that when the armor's thick a sword just bounces, and a good mace goes right through to the bone." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. You lot never buy a mace, more's the pity, so I'll just admire your bow and sigh a little." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! I know, I know, you've got claws, but think of a mace as a claw that never needs trimming, and every bear needs a backup." },
      },
      again = {
        { id = "h_again", text = "What else? I've got all day, and the maces aren't going anywhere unless you buy them." },
        { id = "h_again2", text = "Ask away, friend. Talking's free, but swinging costs extra." },
      },
      choices = {
        { text = "Why do shamans favor maces over swords, do you think?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Can a caster really make use of one of your maces?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Let me see what you're selling.", next = "BUSINESS" },
        { text = "Why should I carry a mace over a blade?", next = "why" },
        { text = "Where does your steel come from?", next = "steel" },
        { text = "Who buys maces in a pirate town?", next = "buyers" },
        { text = "I'm told my faith forbids edged weapons.", next = "priest", when = { class = "PRIEST" } },
        { text = "A mace is a dwarf's weapon, goblin.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "What could a mace offer a rogue who'd rather stab, Kizz?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do warlocks really buy maces for their circles, Kizz?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why carry a mace instead of a sword, Kizz?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Is there really nothing in your shop for a hunter, Kizz?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why would a druid ever want a mace, Kizz?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Just looking.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because the jungle's full of things with thick hides and thicker skulls, friend. A sword turns on a raptor's scales, but a mace doesn't care what it hits, and it rings the bell every time." },
      },
      choices = {
        { text = "And against armor?", next = "why_armor" },
        { text = "I'll stick with my blade, thanks.", next = "BACK", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_armor = {
      lines = {
        { id = "wa_default", text = "Even better! A Bloodsail in a breastplate thinks he's safe until you dent him like a cooking pot, and then he's thinking about nothing at all for a while." },
      },
      choices = { { text = "You've made your case.", next = "BACK", fx = { affinity = 1 } } },
    },
    steel = {
      lines = {
        { id = "s_default", text = "Ore comes in by ship from Kalimdor and down from the Venture Company's diggings, and I don't ask the Venture boys too many questions about where they got it. Jansen Underwood down the way sells the bars, and I buy the good ones before the smiths wake up." },
      },
      choices = {
        { text = "The Venture Company? Aren't they thieves?", next = "steel_venture" },
        { text = "Something else.", next = "BACK" },
      },
    },
    steel_venture = {
      lines = {
        { id = "sv_default", text = "They're goblins with a contract, which is near enough the same thing. They're tearing the jungle up north for ore and trees, and if the price is right, I'll buy it whether I approve or not." },
      },
      choices = {
        { text = "Business is business.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Stolen ore is stolen, whatever the price.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "b_default", text = "Everybody, sooner or later! The Bruisers swing clubs all day, the Blackwater boys like something that won't snap in a boarding fight, and you hunters from up north buy whatever you think a tiger will respect." },
      },
      choices = {
        { text = "The Bruisers buy from you?", next = "buyers_bruisers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_bruisers = {
      lines = {
        { id = "bb_default", text = "The Baron buys for them, in bulk, and he haggles like his life depends on it, which in this town it might. I make less on every club and sell a hundred of them, so I'm not complaining where he can hear me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = {
        { id = "p_default", text = "Forbids it, frowns on it, whatever it is, you holy folk don't carry edges, and I've never once asked why. A blessed mace still breaks a skull, and if anybody asks, you were only being gentle." },
      },
      choices = {
        { text = "It's about not shedding blood needlessly.", next = "BACK", fx = { align = { light = 1 }, trait = { pious = 1 } } },
        { text = "A rule's a rule; I don't need a reason.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Mostly I just like how it swings.", next = "BACK", fx = { align = { order = -1 }, trait = { witty = 1 }, affinity = 1 } },
      },
    },
    dwarf = {
      lines = {
        { id = "d_default", text = "A dwarf's weapon and a goblin's profit, friend, and everybody wins. Have a heft of that one and tell me Ironforge does better; I'll wait." },
      },
      choices = {
        { text = "It's not bad, for goblin work.", next = "BACK", fx = { affinity = 1 } },
        { text = "Ironforge does better. By a mile.", next = "BACK", fx = { affinity = -1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I started out selling scrap to the Bruisers and worked my way up to selling them things that work. In Booty Bay that counts as a respectable career." } },
    advice = { { id = "tp_ad", text = "Hit the thing with the heavy end, friend. You'd be amazed how many people get that backwards." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I can't sell what I've never heard of, so ask somebody else." } },
  },
}

P:NPC {
  key = "rikqiz", id = TODO_NPC("Rikqiz"), name = "Rikqiz",
  title = "Leatherworking Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "shrewd" }, values = { "practical", "greedy" },
  notices = { "craft" },

  impression = {
    first = "Rikqiz sells dyes, thread and salt in Booty Bay, and pays sharp attention to what everyone carries in from the jungle. Every hide that walks past the shop has a price already worked out.",
    third = "{name} met Rikqiz, who sells leatherworking supplies in Booty Bay.",
  },

  greetings = {
    { id = "g_shop", text = "Thread, salt, dyes and patterns, all the things a leatherworker needs and can't find in the jungle. What are you after?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Still skinning things, I hope; it's good for business." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = { "Leatherworking", "Skinning" } },
      text = "You've got the smell of the tanning vats on you, friend. Don't take that badly; in this shop it's a compliment, and it means we'll be seeing a lot of each other." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Straps, buckles and padding, friend, because your armor is only as good as what holds it together, and the salt air eats leather faster than a troll eats a raider. I've seen a breastplate fall clean off a warrior halfway through a fight because the strap rotted." } },
      choices = {
        { text = "I check my straps every morning. Discipline keeps you alive.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If a strap breaks, I'll fight in my shirt.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Basilisk scales for mages who want to know why basilisks turn people to stone, and black panther hide for priests of the darker sort. The strangest was a warlock who wanted a hide that had never seen sunlight, and I didn't ask how he planned to check." } },
      choices = {
        { text = "If they pay, sell it to them. That's trade.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Some requests ought to be refused, whatever they pay.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Once, when a tauren told me a white panther hide was sacred to something, and he looked big enough to make me believe it. I sold it to a human the next day, so the respect lasted about as long as he was in the shop." } },
      choices = {
        { text = "Some things should stay sacred, even in Booty Bay.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sacred doesn't pay rent. You were right to sell it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I buy hides by the quality, friend, and a good raptor hide doesn't say where it was skinned. The Venture Company sells me some, the trolls sell me others, and I keep the ledger clean by never writing down the seller's name." } },
      choices = {
        { text = "Fair trade is fair trade. No names needed.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "You should know who you're dealing with. It matters.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else, Rikqiz.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the Blackwater Raiders will put an arrow in anything wearing a red bandana, and they don't always check whether it's a pirate or just a customer with poor taste. I sold a red cloak to a mage last spring, and I still feel bad about it." } },
      choices = {
        { text = "I'll wear violet, then. No need to tempt trouble.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll wear what I like. Let them try.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It's completely different, friend, because I've never once had to look a tiger in the eye. Besides, half my customers are druids themselves, tanning hides from beasts that died of old age, or so they tell me, and I believe every word." } },
      choices = {
        { text = "Every hide has a cost, and you're part of it. Own that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Selling salt is honest work. The hunters carry their own guilt.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "As fair as anything in Stranglethorn, which is to say a hunter brought it in, I paid what it was worth, and nobody asked the tiger. If you want to know more than that you'll have to ask the hunter, and I don't keep names, because names are bad for business." } },
      choices = {
        { text = "You should keep names. That's honest trade.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No names is wise. Let's keep it that way.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll want leather for under that plate, I suppose, though your lot always ask whether the hide was fairly taken, and that slows business nearly as much as the shamans do." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll want mail, I suppose, though your lot always ask whose hide it was, which slows business down." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. You'll ask whose hide it was too, I suppose, and the answer's a raptor's, and the raptor didn't object." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. I've had requests for some very strange hides from your lot, and I've turned every one of them down, mostly." },
        { id = "h_default", key = true,
          text = "Rikqiz, leatherworking supplies. The jungle's full of tigers, raptors and basilisks, and all of them are wearing hides that somebody wants, so I sell the somebodies what they need to turn them into armor." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Now, I'll bet you've got a few hides in that pack you'd rather not explain, and I'm the very goblin who won't ask you to." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! You'll want dyes for your robes, I'd guess, and I've got every color from Kirin Tor violet to Bloodsail red, though I'd not recommend the red in Booty Bay." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! You'll want leather under that plate, or the jungle heat will cook you like a crab in a pot, and I've the thread and hides to make it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Now, don't look at me like that; I don't skin anything, I just sell the salt to the people who do, which is completely different." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Ask quick; the salt's drawing damp." },
        { id = "h_again2", text = "Ask your question; the hides won't price themselves." },
      },
      choices = {
        { text = "Have you ever turned down a hide out of respect?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What strange requests do you get from magic-users, Rikqiz?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me your stock.", next = "BUSINESS" },
        { text = "Which hides fetch the best price here?", next = "hides" },
        { text = "How does leather keep in this heat?", next = "heat" },
        { text = "Do you sell patterns too?", next = "patterns", when = { profession = "Leatherworking" } },
        { text = "I hunt here. What should I bring you?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Do you buy hides without asking where they came from, Rikqiz?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why not wear Bloodsail red in Booty Bay, Rikqiz?", next = "xmage", when = { class = "MAGE" } },
        { text = "What does a warrior need from a leather shop, Rikqiz?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Is it really different, Rikqiz, selling the salt but not the knife?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Was the hide fairly taken, Rikqiz?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Nothing today.", next = "END" },
      },
    },
    hides = {
      lines = {
        { id = "hd_default", text = "Tiger and panther skins sell well to the tailors up north, and basilisk scales go to anybody making armor that has to turn a blade. Raptor hide's common as sand, so don't bring me a stack of it and expect to retire." },
      },
      choices = {
        { text = "Who buys tiger skins?", next = "hides_tiger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides_tiger = {
      lines = {
        { id = "ht_default", text = "Nobles in Stormwind who like a rug, mostly, and the hunters at Nesingwary's camp keep the supply coming. Old Hemet sends his students out after the big cats, and what comes back with the head goes on the wall and the rest comes to me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    heat = {
      lines = {
        { id = "he_default", text = "Badly, unless you salt it and oil it and keep it out of the damp, which in Stranglethorn means never. That's why I sell so much salt, and why I get rich selling it twice to the same people." },
      },
      choices = {
        { text = "Twice?", next = "heat_twice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heat_twice = {
      lines = {
        { id = "htw_default", text = "Once to cure the hide, and once more when they come back a month later with their good jerkin smelling like a swamp. Learn to oil your leathers, friend, and you'll keep your gold, though I'd rather you didn't." },
      },
      choices = {
        { text = "Thanks for the honest advice.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    patterns = {
      lines = {
        { id = "pt_default", text = "A few, and they come and go with the ships, so if you see one you like, buy it before a sailor does. The good ones are worked out by crafters who've been sweating in this jungle for years, and that's knowledge you won't find in a Stormwind workshop." },
      },
      choices = {
        { text = "I'll keep checking back.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "Bring me clean skins, friend, cut wide and not hacked to ribbons, and don't let your pet chew on them first. A hide with tooth marks in it is worth half what a whole one is, and I've seen a lot of tooth marks." },
      },
      choices = {
        { text = "My pet has better manners than that.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
        { text = "I'll take care with them.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I came south with a crate of thread and a lot of nerve. The thread's gone, but I've still got the nerve." } },
    advice = { { id = "tp_ad", text = "Salt your hides the same day you take them, or the jungle takes them back." } },
    _none = { { id = "tp_none", text = "Don't know, and there's no profit in guessing. Try the tavern; they guess for free." } },
  },
}

P:NPC {
  key = "glyx", id = TODO_NPC("Glyx Brewright"), name = "Glyx Brewright",
  title = "Alchemy Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "fussy", "proud" }, values = { "practical" },
  notices = { "craft", "drink" },

  impression = {
    first = "Glyx Brewright sells vials and reagents in Booty Bay and treats a dusty bottle as a personal insult. For a goblin in a pirate town, Glyx is remarkably particular about cleanliness.",
    third = "{name} met Glyx Brewright, who sells alchemy supplies in Booty Bay.",
  },

  greetings = {
    { id = "g_shop", text = "Vials, flasks and reagents, everything clean and corked! Mind the shelves as you come in." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, a returning customer. You didn't break the last batch of vials, I hope?" },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist, I can tell by the stained fingers. You'll want the crystal vials, not the cheap ones, so don't let anybody else in this cove tell you otherwise." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've been at the Salty Sailor's grog, haven't you? Please don't touch anything, friend, because those shelves are glass, and so is my patience." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Healing first, then something for poison, because the Skullsplitters use it, and then a rage potion if you're the sort who likes to fight angry. Keep them corked, clean and in a padded case, and they'll be there when you need them." } },
      choices = {
        { text = "A careful warrior keeps a calm head and a clean kit.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A warrior fights angry. That's what the rage potion's for.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The jungle spiders and the basilisks, and the river snakes are worse than both, so check yourself after every hunt. Nobody listens until they turn green, and then they come running to my shop." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The jungle spiders and the basilisks, and the river snakes are worse than both, so check yourself after every hunt. Nobody listens until they turn green, and then they come running to my shop. And check {pet} as well, because beasts don't complain until it's too late, and nobody's ever brewed a potion just for them." },
      },
      choices = {
        { text = "I prepare for the worst. That's how a hunter survives.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I trust my instincts. Potions are for the careless.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "It spoils them, rots them and sometimes makes them explode, which is why I seal everything in wax twice. The other shops seal it once, if at all, so you can buy their reagents and find out for yourself." } },
      choices = {
        { text = "Twice-sealed it is. Care is worth paying for.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll risk the cheaper stuff and see what happens.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Alchemy follows recipes and the elements follow their moods, which is why I prefer alchemy. Still, I once watched a shaman cleanse a fouled well with a totem and a word, and I was jealous for a week." } },
      choices = {
        { text = "Recipes have their place. Discipline serves a shaman too.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The elements follow no recipe, and neither do I.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than anything else, since half the jungle crawls with something venomous and the other half wants to be. I keep them spotless, because a dirty vial ruins a good poison, and a ruined poison makes for a very unhappy rogue." } },
      choices = {
        { text = "A clean vial means a clean kill. I'll take care of them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little residue never hurt a poison.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Glyx.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Wax seals, oilcloth and a cellar the Baron doesn't know I have, which is the driest place in the whole town. I check everything twice a week, and I throw out anything that's gone soft, no matter what it cost me." } },
      choices = {
        { text = "Good care makes good reagents. I'll buy from you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Soft reagents still work. Don't waste them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Just an imp, and only for a moment, but it set fire to a shelf of oils and laughed the whole time it burned. The warlock paid for the damage, I'll give him that, but I'm still finding soot behind the jars." } },
      choices = {
        { text = "That was careless. I'll keep my craft outside.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Imps will be imps. Some soot is the cost of business.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "All the time, friend, especially when the fever's going round the docks, and I have to tell them I sell vials, not miracles. The ones with the Stranglethorn Fever need a proper healer, and in this town they mostly end up sweating it out on a cot." } },
      choices = {
        { text = "Send the fevered to me. I'll tend whoever I can.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sell them what they ask for. Their health is their business.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "You have no idea, because they come in smelling of moss with roots in their pockets and seeds in their hair, and then they want a vial. I sell them the vial, they fill it with something green, and I spend the afternoon wiping up after them." } },
      choices = {
        { text = "A little dirt never hurt anyone, Glyx. It's honest earth.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll wipe my boots and keep the moss off your counter.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Healing draughts, mostly, because even the Light gets tired in this heat, and a clean draught never runs out of patience. I'll also sell you something against jungle fever, since the fever doesn't care how righteous you are, and I've seen it lay out bigger knights than you." } },
      choices = {
        { text = "I'll trust the Light to heal me, Glyx.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A draught in the hand beats a prayer, Glyx.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Do mind the shelves with that hammer, please, because I polished every vial this morning and I'd like at least one day without broken glass." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Mind the shelves, please, because everything on them is clean and I'd like it to stay that way, though I'll admit a blessing on the bottles couldn't hurt." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll be wanting clean reagents, I expect, and mine are the only clean ones in Booty Bay." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. You'll want holy water vials, I expect, or unholy ones, and I clean both the same way: thoroughly." },
        { id = "h_default", key = true,
          text = "Glyx Brewright, alchemy supplies. I sell vials, flasks and the odd reagent you can't pick in the jungle, and everything I sell is clean, which is more than any other shop in Booty Bay can say." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, eh? You'll be wanting vials for your poisons, and I'll ask you to clean them before you bring them back, because I've seen what's left in some of them." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! You'll want reagents for your spells, I suppose, and I've got the cleanest in Booty Bay, though I'll warn you the jungle damp gets into everything eventually." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! I'll sell you candles and chalk, but I'll ask you not to summon anything in my shop, because the last time someone tried, the soot took me a week to scrub out." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, and you'll want healing potions, of course, but please don't carry them loose in your pack, because broken glass in a wound is the last thing you need." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! You'll want antivenom, I'd guess, because every spider and snake in this jungle bites, and every hunter thinks it won't happen to them." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Do me a favor and don't touch anything with leaves on it; I like my shelves clean, and the last druid left half the jungle on my counter." },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep your hands off the shelves while you think." },
        { id = "h_again2", text = "What else can I help you with, carefully?" },
      },
      choices = {
        { text = "Is alchemy so different from calling on the elements?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does the jungle's damp spoil a caster's reagents too?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Let me see the vials.", next = "BUSINESS" },
        { text = "What grows out there that's worth picking?", next = "herbs" },
        { text = "Why does cleanliness matter so much?", next = "clean" },
        { text = "Who buys potions in Booty Bay?", next = "buyers" },
        { text = "Do the trolls here brew anything worth knowing?", next = "trolls", when = { race = "Troll" } },
        { text = "Do you sell many vials for poisons, Glyx?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "How do you keep your reagents dry in this jungle, Glyx?", next = "xmage", when = { class = "MAGE" } },
        { text = "Did someone really summon a demon in your shop, Glyx?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do people come to you for cures as well as reagents?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What potions should a warrior carry, Glyx?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Which beasts are the most venomous here, Glyx?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do druids really make that much mess, Glyx?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What would a paladin need from an alchemist's shelves, Glyx?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    herbs = {
      lines = {
        { id = "hb_default", text = "Kingsblood and Liferoot along the rivers, Fadeleaf in the shady spots, and Stranglekelp all along the coast if you don't mind getting wet. Pick them clean, friend, with the roots on, and they'll keep twice as long." },
      },
      choices = {
        { text = "And where's dangerous to pick?", next = "herbs_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_danger = {
      lines = {
        { id = "hbd_default", text = "Anywhere near the troll ruins, since the Skullsplitters and the Bloodscalps don't care for visitors. The basilisks up the hills will turn you to stone if you stare too long, too, so look at the ground and not at them." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    clean = {
      lines = {
        { id = "cl_default", text = "Because a dirty vial turns a healing potion into a bellyache, and a bellyache in the middle of a fight is a funeral. I've seen what the cheap stuff does, so I sell the good stuff, and I sleep fine." },
      },
      choices = {
        { text = "That's a good principle.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Sounds like a sales pitch to me.", next = "BACK", fx = { align = { honor = -1 }, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "by_default", text = "Sailors buy cures for scurvy and the shakes, adventurers buy healing by the crate, and the Blackwater boys buy something to keep them on their feet after a long night. I sell to everybody; that's what a neutral port is for." },
      },
      choices = {
        { text = "Even to the Bloodsail?", next = "buyers_bloodsail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_bloodsail = {
      lines = {
        { id = "bbs_default", text = "Not if I know it, and not if the Baron's watching, which he always is. The Bloodsail want this cove for themselves, and you don't sell rope to the man building your gallows." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trolls = {
      lines = {
        { id = "tr_default", text = "Plenty, and none of it I'd sell. The jungle trolls brew things in those ruins that smell like death warmed over, and anybody who's tried to copy them hasn't been back to complain." },
      },
      choices = {
        { text = "Darkspear brews are different, I promise you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned the trade in a workshop in Ratchet that blew up twice a week, so I've been careful ever since." } },
    advice = { { id = "tp_ad", text = "Always cork your vials. You'd be amazed how many people forget." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't mix things I don't know. Ask somebody less careful." } },
  },
}

P:NPC {
  key = "jansen_underwood", id = TODO_NPC("Jansen Underwood"), name = "Jansen Underwood",
  title = "Blacksmithing Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "steady", "plain" }, values = { "practical", "honest" },
  notices = { "craft", "race" },

  impression = {
    first = "Jansen Underwood sells coal, flux and iron in Booty Bay and speaks plainly, without a goblin's flourishes. He seemed like a man who came south for work and simply never left.",
    third = "{name} met Jansen Underwood, a human trader in blacksmithing supplies in Booty Bay.",
  },

  greetings = {
    { id = "g_shop", text = "Coal, flux, iron bars and hammers for whoever needs them. Take your time and look." },
    { id = "g_back", when = { metBefore = true }, text = "Good to see you again. The forge has been busy, so the stock's moving." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing", "Mining" } },
      text = "You've a smith's hands or a miner's, I can't tell which, but either way you'll know a good bar of iron when you see one. That's more than most of the sailors who come in here can say." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Another face from the north, good. I don't get many of my own sort in the shop, and it's nice to hear a voice that isn't haggling." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not to me, but every repair in this town starts with my iron, and I can tell a good warrior from the state of their gear. The careful ones come in with a scratch or two, and the reckless ones come in with half a breastplate." } },
      choices = {
        { text = "A warrior looks after his gear before it fails him.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Armor's meant to take a beating. That's its whole job.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some do, for the big game, because a cheap point won't go through a basilisk's scales, and Nesingwary's people come down for good steel heads twice a year. They're particular about it, too, and I respect that." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some do, for the big game, because a cheap point won't go through a basilisk's scales, and Nesingwary's people come down for good steel heads twice a year. They're particular about it, too, and I respect that. Your {pet} has been sniffing at my coal sacks, which is a strange thing for a beast to fancy, but there's no accounting for taste." },
      },
      choices = {
        { text = "A clean kill needs good steel. I'll pay for the best.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Cheap points kill just as well if you aim right.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Not much, I'll grant you, unless a staff wants shoeing or a wand wants setting in iron. Mostly I see your kind when an enchanter wants a plain rod to work on, and the plain ones take a spell better than fancy ones, because there's nothing in them to argue with it." } },
      choices = {
        { text = "Plain and honest work. That's worth something.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fancy sells better. You should charge more for less.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I reckon if you talk to the earth, you'd want to know which bit of it you're carrying around. I couldn't tell you which mountain my bars came out of, but I'll find out if it matters to you." } },
      choices = {
        { text = "It matters. The earth deserves thanks for what it gives.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Iron's iron. Where it came from makes no difference to me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "For the work, plain and simple, since the forges in Stormwind had more smiths than they needed. I meant to stay a season and go home, but the goblins pay in gold and never ask questions, and I've found I don't miss the questions." } },
      choices = {
        { text = "Honest work is honest work. Good on you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No questions asked is the best place to work.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Jansen.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "For wards, one of them told me, and for something to do with binding a spell into metal, though it went right over my head. I just make sure it's pure, because she said a single speck of slag would ruin the whole working." } },
      choices = {
        { text = "Pure materials make pure work. I'll buy some.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Any old flux would do in a pinch.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every day, though I don't say it to the goblins, because they'd think I was angling for more pay. I came south when the work up north dried up, and I still say a prayer for home whenever a ship brings word from Stormwind." } },
      choices = {
        { text = "Keep praying for home. The Light hears it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't buy passage. Save your coin instead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I sell to anyone the Baron lets through the gate, because that's the rule in Booty Bay and I don't fancy explaining to him why I broke it. I'll not pretend I like it, though, and I've turned away a man or two who bragged about what he'd do with the steel." } },
      choices = {
        { text = "Good. Some sales aren't worth the coin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A sale's a sale. Their deeds are on their own heads.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Off the boats, mostly, because nobody's fool enough to dig a mine in this jungle, though the Venture Company keeps sniffing around the hills. I'd rather pay the boatmen than see the trees come down, and I don't say that to please you." } },
      choices = {
        { text = "Then keep buying off the boats. The jungle's worth the price.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A mine would be cheaper. The jungle grows back eventually.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Not many of your sort need coal and flux, but you're welcome to stand by the forge a while, because the damp in this town gets into your bones." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. That plate wants looking after in this damp, and I sell the oil and the files to do it, though I'd wager you know more about keeping armor than most of my customers." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, is it? I've sold iron to a few of yours, and they always ask where it was mined before they buy, which I respect." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, is it? I'll not pretend to know what you pray to, but I sell honest iron, and I'll sell it to you honestly." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. I've heard tales of where your power comes from, but I'm a supplier, not a judge, so tell me what you need." },
        { id = "h_default", key = true,
          text = "Jansen Underwood. I sell what a forge needs: coal, flux, iron bars and the tools to work them. Every smith in Booty Bay buys from me, and so do the ships' carpenters when their nails run out." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf in the shop, so I'll have to mind my prices; your folk know what iron's worth better than anyone. Jansen Underwood, blacksmithing supplies, and I'll not try to cheat you." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll not need coal or iron, I'd guess, but if you want a blade sharpened properly, I keep a good whetstone, and I'll not ask what you've been cutting." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. I don't sell much your sort would want, but I've had a few come in looking for iron filings and pure flux, and I never asked why." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. I can tell from the dents in your armor that there's a smith somewhere who's tired of seeing you, and I'm the man who sells that smith his coal." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. You'll not need much from me, I expect, but if you ever want proper arrowheads made, every smith in town works my iron." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, at a smith's supply stall. I don't suppose you need much coal, but you're welcome to stand in the shade all the same." },
      },
      again = {
        { id = "h_again", text = "Need anything else from the bins?" },
        { id = "h_again2", text = "Ask what you like, and I'll tell you straight." },
      },
      choices = {
        { text = "Why do you think shamans care where the iron came from?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does a caster need from blacksmithing supplies, Jansen?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "How did a northerner end up here?", next = "north" },
        { text = "Where does the coal come from?", next = "coal" },
        { text = "What's it like, working for goblins?", next = "goblins" },
        { text = "I'm learning the forge myself.", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "Why did you come south to Booty Bay, Jansen?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why would a mage need iron filings and flux, Jansen?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you miss the north, Jansen?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you sell to anyone, even the Bloodsail?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do warriors come to you for their repairs, Jansen?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the hunters here want iron arrowheads, Jansen?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Where does Booty Bay get its coal and iron, Jansen?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Good day, Jansen.", next = "END" },
      },
    },
    north = {
      lines = {
        { id = "n_default", text = "I worked the docks in Stormwind until the work dried up, and a goblin offered me steady pay to keep a shop down here. The heat nearly killed me the first summer, but the money's honest and nobody here cares where you came from." },
      },
      choices = {
        { text = "Do you miss Stormwind?", next = "north_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    north_miss = {
      lines = {
        { id = "nm_default", text = "I miss the rain that's actually cold, and I miss bread that isn't damp by noon. I don't miss the taxes, and I don't miss the Defias lurking round the harbor, so it comes out about even." },
        { id = "nm_human", when = { race = "Human" },
          text = "You'll know what I mean, then: the canals in autumn, the bells from the Cathedral. I don't miss the taxes or the Defias round the harbor, though, so it comes out about even." },
      },
      choices = {
        { text = "Stormwind will be better one day.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    coal = {
      lines = {
        { id = "co_default", text = "It comes by ship, mostly from Menethil and Ratchet, because the jungle's too wet to make good charcoal. When a ship's late, prices climb, and when a ship sinks, every smith in the cove shouts at me as though I sank it myself." },
      },
      choices = {
        { text = "Do ships sink often?", next = "coal_ships" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coal_ships = {
      lines = {
        { id = "cs_default", text = "Often enough. The Bloodsail take some, the weather takes others, and a few go to the bottom with no one left to say why. That's the cost of living at the end of the world, I suppose." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    goblins = {
      lines = {
        { id = "gb_default", text = "They pay on time, and they'll tell you to your face what they think you're worth, which is more than I can say for some men I've worked for. You just read every word of a contract twice before you sign it." },
      },
      choices = {
        { text = "A fair deal is a fair deal, whoever offers it.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd never trust a goblin's contract.", next = "BACK", fx = { align = { order = -1 }, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    smith = {
      lines = {
        { id = "sm_default", text = "Then buy good flux and don't skimp on it, because a weld that doesn't take will cost you more than the flux ever did. Zarena Cromwind up the way does the finest blades in the cove, if you want to see what the work looks like when it's done right." },
      },
      choices = {
        { text = "I'll go and look. Thanks.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Stormwind docks, then a goblin's contract, then this shop. It's not a grand story, but it's mine." } },
    advice = { { id = "tp_ad", text = "Keep your iron dry and your coal drier. The jungle ruins both." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, friend. I know iron and coal, and that's about the end of it." } },
  },
}

P:NPC {
  key = "rickle", id = TODO_NPC("Rickle Goldgrubber"), name = "Rickle Goldgrubber",
  title = "Banker",
  bible = "bibles/unsung.md", role = "banker", tier = "service",
  communities = { "booty_bay" }, temper = { "nervous", "precise" }, values = { "lawful", "careful" },
  notices = { "purse", "stealth" },

  impression = {
    first = "Rickle Goldgrubber counts everything twice and smiles only when the totals match. In a town full of pirates, the banker seemed more worried about the vault than about the customers.",
    third = "{name} met Rickle Goldgrubber, one of the Steamwheedle bankers of Booty Bay.",
  },

  greetings = {
    { id = "g_vault", text = "Welcome to the bank, where your gold is counted, recorded and kept safely away from pirates." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Your account is exactly as you left it; I checked twice." },
  },

  notice = {
    { id = "n_poor", cat = "purse", when = { money = { max = 500 } },
      text = "A light purse, I see. There's no shame in it, friend; a vault is for keeping things, not just gold, and I'll take your old boots if they matter to you." },
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "I'd ask you to keep your hands where I can see them, friend. Nothing personal, it's just that I've met your trade before, and the vault remembers too." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Mostly gold they meant to spend on armor and never quite did, because warriors are oddly careful savers. They come in covered in blood and count their silver to the copper, and I've a soft spot for them, though I'd never say so outside this vault." } },
      choices = {
        { text = "A careful warrior plans for the day after the fight.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Gold's for spending. I'll be dead before I need savings.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because a beast doesn't care about locks, friend, and I've heard of a hunter's cat squeezing through gaps a goblin couldn't. I check the doors three times as it is, and I'd rather not start checking for paw prints as well." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because a beast doesn't care about locks, friend, and I've heard of a hunter's cat squeezing through gaps a goblin couldn't. I check the doors three times as it is, and I'd rather not start checking for paw prints as well. Your {pet} looks well behaved, I'll admit, but I've written its name down all the same, and I'll be checking the vault floor tonight." },
      },
      choices = {
        { text = "Your doors, your rules. My cat waits outside.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My beast goes where it likes. It's earned the right.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I trust neither, which is why I use both, and then I check them. A lock can be picked and a ward can be broken, but nobody has ever got past both while I was counting, and I am always counting." } },
      choices = {
        { text = "Both, and then check again. That's wise.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You'd sleep better if you trusted your locks for once.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Once, during a storm, and every lock in the building popped open at the same moment. Nothing was taken, but I checked every box four times, and I haven't slept properly in a thunderstorm since." } },
      choices = {
        { text = "I'll keep the storms well away from your vault. You have my word.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Storms go where they please, Rickle. You'll have to cope.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every single one, because a town full of pirates makes for a very nervous banker. I've never once lost a coin to a thief, and I intend to keep it that way, no matter how charming they are." } },
      choices = {
        { text = "Your caution is wise. I'll keep my hands to myself.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Counting twice won't stop a good thief.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Rickle.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Once, and the wards caught it before the illusion even settled. Conjured gold vanishes after an hour, and the Cartel doesn't take kindly to depositors who try to pay their fees with it." } },
      choices = {
        { text = "An honest deposit is the only kind. Good wards.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A clever trick deserves a try, at least.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A seed, wrapped in silk, in a box warded so heavily the door hummed for a week. The druid said it was older than Booty Bay, and I checked it twice a day for a year in case it was lying, but it never sprouted." } },
      choices = {
        { text = "A trust like that deserves respect. Keep that seed safe.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A seed's a seed. Charge rent and stop checking it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not hard, exactly, just heavy, since your lot store armor and hammers where other folk store coin, and every piece gets counted twice like everything else. I'll grant that a paladin has never once argued with my totals, which is more than I can say for the sailors." } },
      choices = {
        { text = "Careful counting is a virtue, Rickle.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Counting everything twice sounds exhausting, Rickle.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Do please lean that hammer against the wall and not the counter, because the counter is new and the last knight left a dent I still count every morning." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Please don't call any lightning near the vault, because I've only just had the hinges oiled and the noise sets my nerves off." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Please don't bless the vault; the last blessing set off a ward, and I spent the whole night counting." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. Your belongings are welcome, but anything that moves on its own must be declared, in writing, in triplicate." },
        { id = "h_default", key = true,
          text = "Rickle Goldgrubber, banker to the Steamwheedle Cartel. I keep your valuables in a vault that's never once been robbed, and I'd like to keep saying that, so I check every box twice and the doors three times." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. I'll be counting every coin twice while you're here, so don't take it personally, because I count everyone's twice." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! I'll warn you now, friend, the vault has wards against spells, so don't try to conjure any extra coins into your box." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior. You'll want to deposit something heavy, I'd guess, and I'll ask you not to drop it on my counter, because the last one cracked it." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. If you've a beast with you, keep it away from the vault door, please, because they all sniff at it and it makes me nervous." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. Your kind keeps odd things in a bank, friend, but so long as it doesn't grow out of the box, the Steamwheedle has no complaints." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I'm in the middle of a count." },
        { id = "h_again2", text = "Yes? Go on, I'm listening, and I'm still counting." },
      },
      choices = {
        { text = "Has lightning ever struck your vault, Rickle?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you trust magic wards more than locks, Rickle?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "I'd like to open my box.", next = "BUSINESS" },
        { text = "Never once robbed? In Booty Bay?", next = "robbed" },
        { text = "Are you related to Viznik?", next = "viznik" },
        { text = "Can I reach my Stormwind box from here?", next = "reach" },
        { text = "Do you really count everyone's coins twice, Rickle?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Has a mage ever tried to conjure coins into the vault, Rickle?", next = "xmage", when = { class = "MAGE" } },
        { text = "What do warriors keep in your vault, Rickle?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why do beasts make you nervous at the vault, Rickle?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What's the oddest thing a druid ever left in your vault, Rickle?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Are paladins hard on your bank, Rickle?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Nothing, thanks.", next = "END" },
      },
    },
    robbed = {
      lines = {
        { id = "r_default", text = "Never once, and not for want of trying. The Bloodsail have sent thieves, the odd cutpurse has tried his luck, but the Bruisers stand at the door, and the Baron has made it very clear what happens to anyone who robs his bank." },
      },
      choices = {
        { text = "What happens to them?", next = "robbed_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    robbed_what = {
      lines = {
        { id = "rw_default", text = "They're fed to the sharks off the end of the pier, friend, and the sharks in this lagoon have grown very fat over the years. The Baron calls it a deterrent, and I call it good for business." },
      },
      choices = {
        { text = "That's harsh, but it works.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "That's no kind of justice.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    viznik = {
      lines = {
        { id = "v_default", text = "We share a name and a counting table, and that's as far as I'll go in public. Viznik smiles at the customers and I check the ledgers, and between us not a copper goes missing." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    reach = {
      lines = {
        { id = "rc_default", text = "You can, friend, and that's the clever part. Your box is your box whether you open it in Stormwind, Ironforge or here, and don't ask me how the Cartel manages it, because that's above my pay." },
        { id = "rc_horde", when = { faction = "Horde" },
          text = "You can, friend, and that's the clever part. Your box is your box whether you open it in Orgrimmar, the Undercity or here, and don't ask me how the Cartel manages it, because that's above my pay." },
      },
      choices = {
        { text = "That's very convenient.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I kept the Cartel's books in Gadgetzan before they sent me here. The ledgers are the same, but the customers carry more knives." } },
    advice = { { id = "tp_ad", text = "Leave your spare coin with us before you go into the jungle. The trolls never bother robbing a vault." } },
    _none = { { id = "tp_none", text = "That's not in my ledgers, friend, and if it's not in the ledgers, I don't know it." } },
  },
}

P:NPC {
  key = "qixdi", id = TODO_NPC("Qixdi Goodstitch"), name = "Qixdi Goodstitch",
  title = "Cloth Armor Merchant",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "chatty", "warm" }, values = { "practical" },
  notices = { "class", "kit" },

  impression = {
    first = "Qixdi Goodstitch sells robes and cloth armor in Booty Bay and has firm opinions about what spellcasters should wear in the jungle. Most of them involve less wool.",
    third = "{name} met Qixdi Goodstitch, who sells cloth armor in Booty Bay.",
  },

  greetings = {
    { id = "g_shop", text = "Robes, gloves, sashes and slippers, all in cloth that breathes! You'll thank me in this heat." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did the last robe hold up? Of course it did; I sold it to you." },
  },

  notice = {
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Oh, a caster in wool! In Stranglethorn! You must be cooking in there; let me find you something lighter before you faint on my floor." },
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Well, you're certainly dressed for the heat, but the mosquitoes will eat you alive like that. Let's find you a robe, friend, for your sake and mine." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every week, friend, because a warrior who wears his plate without a good shirt underneath gets sores that would make a priest wince. I don't sell armor, but I sell what makes armor bearable, and I'd argue that's more important." } },
      choices = {
        { text = "A sore warrior fights badly. Looking after yourself is discipline.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A real warrior ignores the sores and fights anyway.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because a tiger hears a wool cloak brushing a fern from fifty paces, and then it's gone, or worse, it's coming for you. Silk moves quiet and dries fast, which is why I sell it to every hunter clever enough to ask." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because a tiger hears a wool cloak brushing a fern from fifty paces, and then it's gone, or worse, it's coming for you. Silk moves quiet and dries fast, which is why I sell it to every hunter clever enough to ask. Your {pet} hears you coming from a mile off as it is, so you might as well make it a little harder for the rest of the jungle." },
      },
      choices = {
        { text = "A careful hunter prepares every detail. I'll take the silk.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I hunt by instinct, not by tailoring.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "All of them, and the trolls laugh at the rest of us, because they're used to it. The Forsaken don't sweat at all, lucky things, but they come in for high collars to hide the stitching, and I always tell them stitching is my specialty too." } },
      choices = {
        { text = "You're kind to everyone, Qixdi. That's rare here.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Kindness doesn't pay. Charge the trolls double.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Oh, lots of people, dear, and I never press, because a name's a personal thing. One lady comes in every month for black silk gloves and pays in Bloodsail doubloons, and I've decided she's simply very fond of pirates." } },
      choices = {
        { text = "Keep her secret. Every customer deserves some privacy.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You ought to tell the Bruisers about those doubloons.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "More every year, since Thrall's people built Orgrimmar and the zeppelins started running, and they're the politest customers I've got. They say thank you to the elements and thank you to me, and I don't hear that second one much." } },
      choices = {
        { text = "Courtesy costs nothing. Every shaman should show it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Thanks are cheap. Coin's the only courtesy that matters here.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Light silk, loosely woven, with a hood to keep the sun off and enough room in the sleeves for all that hand-waving. Wool is for Dalaran and Ironforge, not for a place where the air itself feels like soup." } },
      choices = {
        { text = "Silk it is, then. You know your trade.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A mage wears the robes of their order, heat or no heat.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Qixdi.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "More than mages do, I've found, because a warlock wants to look the part when the demon arrives. I've made more black silk robes for warlocks than I can count, and every one of them wanted a high collar, no matter the heat." } },
      choices = {
        { text = "Looks matter less than comfort. Make it light.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A warlock must look the part. High collar, please.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Something green, something loose, and something that doesn't hold the damp, because I've seen druids come back from the troll ruins looking like wet moss. The Goodstitches have dressed a few druids of the Circle, and they all asked for leaves stitched on the hem." } },
      choices = {
        { text = "Stitch on the leaves, then. A druid should look like the forest.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leaves on a hem? Give me something plain and practical.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More than you'd believe, friend, because wool holds the heat and the sweat, and the sweat is what gives every knight in Booty Bay that rash they won't talk about. Linen breathes, and silk breathes better, though I doubt your order pays you enough for silk." } },
      choices = {
        { text = "My order taught me to endure discomfort, Qixdi.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Comfort matters too. Show me the linen.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, oh dear, in all that plate in this heat! I've got a lovely linen shirt that would go under it beautifully, and you'd stop cooking inside your armor." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Oh, you poor thing, wearing all that in this heat. I've got a lovely linen shirt that would go under it beautifully." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "Oh, you're a quiet one! I'd put you in something dark and close-fitting, because flapping sleeves catch on window latches." },
        { id = "h_default", key = true,
          text = "Qixdi Goodstitch, cloth armor! The Goodstitches have been dressing Booty Bay since before the shark's jaws went up over the gate, and I've got robes for every mage, priest and warlock who's ever sweated through a woolen one." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, good! Your robes up north are all heavy velvet and gold thread, which looks lovely in the Cathedral and terrible in a jungle. Qixdi Goodstitch, cloth armor, and I can fix that." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Now, please tell me you're not wearing wool in this jungle, because I can see from here that you're sweating through it." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! You'll want something dark, I'd guess, but not too heavy, because summoning in this heat is hard enough without a thick robe on top of it." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Now don't laugh, but I've sold more padded cloth shirts to warriors than to mages, because nobody wants plate rubbing on bare skin in this heat." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. I don't sell much to your sort, more's the pity, but I've a cloak or two lined with silk that turns the rain and doesn't rustle." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, and in robes too heavy for the jungle! Let me find you something lighter, friend, before you turn into a bear and boil inside your fur." },
      },
      again = {
        { id = "h_again", text = "What else? Don't be shy; I've heard every question about trousers there is." },
        { id = "h_again2", text = "Anything else, friend?" },
      },
      choices = {
        { text = "Do many shamans come through Booty Bay these days?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does the heat bother many spellcasters coming through?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who buys dark cloth from you and won't give a name?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Let me see the robes.", next = "BUSINESS" },
        { text = "The Goodstitches? There's more of you?", next = "family" },
        { text = "Can cloth really protect anyone out there?", next = "protect" },
        { text = "Where does your cloth come from?", next = "cloth" },
        { text = "What should a mage wear in the jungle, Qixdi?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do warlocks really care so much about their robes, Qixdi?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do warriors really buy cloth from you, Qixdi?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why should a hunter care about rustling, Qixdi?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What would you dress a druid in for this jungle, Qixdi?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Would linen really help under plate, Qixdi?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'm fine, thanks.", next = "END" },
      },
    },
    family = {
      lines = {
        { id = "f_default", text = "Oh, plenty! Xizk sells the tailoring supplies just along the boardwalk, and there's a cousin for every bolt of cloth in the cove. If it's stitched in Booty Bay, a Goodstitch had a hand in it somewhere." },
      },
      choices = {
        { text = "Do you all get along?", next = "family_along" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_along = {
      lines = {
        { id = "fa_default", text = "Like any family, which is to say we argue over prices at every supper. Xizk thinks I sell too cheap, and I think Xizk charges for the air in the shop, but we'd sew a sail for each other in a storm." },
      },
      choices = {
        { text = "That's a good family.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    protect = {
      lines = {
        { id = "p_default", text = "Not like plate, no, but a good robe is woven to carry a caster's power, and that's what keeps you alive. A mage who can think straight and cast fast doesn't need to be hit, friend; that's the whole idea." },
      },
      choices = {
        { text = "That's a fair point.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'd still rather wear plate.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    cloth = {
      lines = {
        { id = "c_default", text = "Silk from the spiders in the hills, if you can believe it, and the rest comes in by ship. The adventurers bring me bundles they've taken off the trolls and the pirates, and I don't ask whose it was before." },
      },
      choices = {
        { text = "Taken off the dead?", next = "cloth_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth_dead = {
      lines = {
        { id = "cd_default", text = "Well, they're not using it anymore, are they? I wash it twice, and it makes a fine robe, and I think that's a better end than rotting in the jungle." },
      },
      choices = {
        { text = "Waste not, I suppose.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "It still feels wrong to me.", next = "BACK", fx = { align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've been threading needles since I could hold one, and I'll be threading them when I can't see the eye." } },
    advice = { { id = "tp_ad", text = "Wear something light in the jungle, friend, and change your socks. Trust me." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that, but my cousin might. Ask any Goodstitch; one of us knows everything." } },
  },
}

P:NPC {
  key = "jaquilina", id = TODO_NPC("Jaquilina Dramet"), name = "Jaquilina Dramet",
  title = "Superior Axecrafter",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "nesingwary_camp" }, temper = { "brisk", "dry" }, values = { "practical", "brave" },
  notices = { "class", "kit" },

  impression = {
    first = "Jaquilina Dramet sells axes from a tent at Nesingwary's camp and judges customers by how they hold the haft. She has no patience for hunters who think a bow solves everything.",
    third = "{name} met Jaquilina Dramet, the axe trader at Nesingwary's Expedition.",
  },

  greetings = {
    { id = "g_camp", text = "Axes for clearing brush and axes for clearing raptors, take your pick. Mind the edges; they're sharp." },
    { id = "g_back", when = { metBefore = true }, text = "You're back in one piece. Good; the axe did its job, then." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN", "SHAMAN" } },
      text = "You look like you know which end of an axe to hold, which puts you ahead of half of Hemet's students. Come and have a look." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear's been chewed on. Panthers, I'd guess, or raptors; they always go for the arms. A longer haft keeps them farther off." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not as many as I'd like, because warriors who come this deep into the jungle already have their axes and they're very attached to them. I only get the ones whose old axe broke on a troll's skull, and they always want the biggest thing in the tent." } },
      choices = {
        { text = "A warrior should keep his weapon in repair, not replace it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "When it breaks, get a bigger one. That's my rule.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Safe as anywhere in this jungle, which is to say not very. The raptors come through at dusk, and a caster busy with a long spell is exactly what they look for, so stand near a hunter, cast short and keep your back to a tree." } },
      choices = {
        { text = "Good advice. I'll stand with the hunters.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go out alone. Raptors don't scare me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A troll came through last month and dropped a panther with a bolt of lightning before the hunters had nocked an arrow. Nesingwary called it unsporting and bought him a drink anyway, which is about as close to praise as he gets." } },
      choices = {
        { text = "A quick, clean kill is the honorable kind.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever brings the beast down fastest is good enough for me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the way you hold an axe tells me whether you've used one, and the jungle doesn't forgive a fumble. Hemet's hunters all carry bows, but I've seen a good axe save more lives in close quarters than any arrow." } },
      choices = {
        { text = "I'll learn to hold it right. Teach me.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hold it however I like.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Jaquilina.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Mind? He'd be furious, and he'd let you know it for an hour. The cats are his whole life, and anything that chases them off before he gets a shot is an enemy of the camp." } },
      choices = {
        { text = "I'll keep my demon well away from the game.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The cats will come back. They always do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not much, I'll grant you, but a spell takes time to say, and a panther doesn't wait for anyone to finish. I've seen priests come back from the jungle with a hatchet on their belt and a look on their face that said they'd rather not discuss it." } },
      choices = {
        { text = "The Light is my weapon. I'll trust it over steel.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fair point. I'll carry something sharp, just in case.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because the grip tells you who taught them and whether they listened, which is more than most people will tell you about themselves. A soldier grips tight and a hunter grips loose, and a paladin grips like the weapon belongs to someone else, which I've always found curious." } },
      choices = {
        { text = "It does. The Light lends me the strength to swing it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's mine, and I swing it for my own reasons.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not that anyone's admitted, but there was a very surprised panther that swore at a hunter in Darnassian last spring. Since then the men look twice before they loose, which is more than I've ever managed to teach them." } },
      choices = {
        { text = "Then they've learned something. Hunters should look before they shoot.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A druid who runs about as a panther takes that chance.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest out at the hunting camp, and with no axe in sight, which is either brave or foolish, so I'll ask you plainly which it is." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now hold out your hand, because I can tell how a fighter swings by the way they grip, and I'd bet you've swung a hammer more often than an axe." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll end up fighting close sooner or later, like everyone out here, so you'll want an axe with weight behind it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Pray if you want, but carry an axe as well, because the panthers here don't wait for you to finish." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. Your fire's fine until a raptor gets inside it, and then you'll wish you'd bought something sharp." },
        { id = "h_default", key = true,
          text = "Jaquilina Dramet, and I sell axes. The hunters here all carry bows, but when a panther gets inside your shot, a bow won't save you, so sooner or later they all come to my tent." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll be wanting a small axe, I'd guess, something you can throw or hide, and I'll show you how to hold one properly before you hurt yourself." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, out at Nesingwary's camp. Keep your demon away from the game, because Hemet will have words with you if it scares off his cats." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "Now there's someone who holds a haft properly, which I almost never see in this camp of bow-pullers, so you've made my whole week." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid at Nesingwary's camp! You turn into the very panthers these men are chasing, so I'd keep your shapes to yourself, if I were you." },
      },
      again = {
        { id = "h_again", text = "What else? The brush grows back faster than I can talk." },
        { id = "h_again2", text = "Go on, then." },
      },
      choices = {
        { text = "Have you seen shamans hunting alongside Nesingwary's people?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is this camp safe for those of us who fight with spells?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me your axes.", next = "BUSINESS" },
        { text = "Why sell axes at a hunting camp?", next = "why" },
        { text = "What's Hemet like to work beside?", next = "hemet" },
        { text = "What's the most dangerous thing out there?", next = "danger" },
        { text = "I'm a hunter. My bow serves me well enough.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Why do you judge customers by how they hold an axe, Jaquilina?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Would Nesingwary really mind my demon scaring the game, Jaquilina?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is an axe any use to a priest, Jaquilina?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why judge a fighter by their grip, Jaquilina?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you sell many axes to warriors out here, Jaquilina?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Has anyone here ever shot a druid by mistake, Jaquilina?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Not right now.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because this jungle has to be cut through before it can be hunted in, and because every hunter here has had a raptor in their face at least once. The ones who carried an axe that day are the ones still drinking at Hemet's fire." },
      },
      choices = {
        { text = "A sound argument.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hemet = {
      lines = {
        { id = "hm_default", text = "He's a fine host and the best shot I've ever seen, and he'll tell you about every animal he's ever killed if you stand still long enough. Barnil runs the camp, really; Hemet just points at things and says they'd look grand on a wall." },
      },
      choices = {
        { text = "And his students?", next = "hemet_students" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hemet_students = {
      lines = {
        { id = "hs_default", text = "Ajeck is the real thing; she's been hunting tigers since she was a girl. Sir Erlgadin is a nobleman who can shoot, which is rarer than you'd think, but he talks about Stormwind's lords as if they owe him money." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = {
        { id = "d_default", text = "The trolls, if you ask me, not the beasts. A panther kills you because it's hungry, but a Skullsplitter kills you because you're there, and that's harder to plan around." },
      },
      choices = {
        { text = "Then the trolls should be driven out.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "It was their jungle first.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "Until it doesn't, friend. Ask Hemet how many times his pet saved him while he fumbled for an arrow, and then come back and look at my hand axes." },
      },
      choices = {
        { text = "My pet has my back, and it doesn't fumble.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Fair point. Show me a hand axe.", next = "BUSINESS", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "My father cut timber in Elwynn, and I learned the axe from him before I learned to read. The jungle pays better than the forest ever did." } },
    advice = { { id = "tp_ad", text = "Keep your axe sharp and your back to a tree. That's all the advice I've got." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask Barnil; he knows everything that goes on in this camp." } },
  },
}

P:NPC {
  key = "kelsey_yance", id = TODO_NPC("Kelsey Yance"), name = "Kelsey Yance",
  title = "Cook",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "cheerful", "proud" }, values = { "practical", "generous" },
  notices = { "craft", "hunger" },

  impression = {
    first = "Kelsey Yance sells cooking supplies and recipes in Booty Bay and believes any fish can be made delicious with enough pepper. The talk was mostly about clams, and it was surprisingly persuasive.",
    third = "{name} met Kelsey Yance, a cook who sells recipes in Booty Bay.",
  },

  greetings = {
    { id = "g_shop", text = "Spices, recipes and the odd bit of advice about what not to eat in the jungle. Come in!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did you try the recipe? Don't tell me if it went badly; I'd rather not know." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = { "Cooking", "Fishing" } },
      text = "Ah, a cook, or a fisher, which is half a cook already. The waters round the cove are full of fish worth a recipe, friend, and I've got the recipes." },
    { id = "n_hungry", cat = "hunger", when = { timeOfDay = "dawn" },
      text = "You're up early and you've not eaten, I can tell by the look of you. Nobody should face Stranglethorn on an empty stomach; that's how the jungle gets you." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Once, for a troll who poured the first bowl into the sea. I've never cooked for a dwarf shaman, so if your spirits want a fish stew, you tell me how they like it." } },
      choices = {
        { text = "The first bowl goes to the sea, Kelsey. Always.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The spirits can catch their own fish.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Fish, mostly, since it's fresh and it's everywhere, and plenty of salt to replace what you sweat out in that armor. I've seen strong men fall over in the jungle heat because they forgot to eat, and it's a shameful way to lose a fight." } },
      choices = {
        { text = "A warrior who forgets to eat is a careless warrior.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll eat when the fighting's done, not before.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Crocolisk, without question, if you soak it overnight and pepper it hard, though tiger's not bad if you stew it long enough. The hunters at Nesingwary's camp eat dry jerky out of their packs, and I've never forgiven them for it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Crocolisk, without question, if you soak it overnight and pepper it hard, though tiger's not bad if you stew it long enough. The hunters at Nesingwary's camp eat dry jerky out of their packs, and I've never forgiven them for it. And {pet} would love a bit of crocolisk too, I'd wager, but you didn't hear that from me." },
      },
      choices = {
        { text = "I hunt to eat, not for sport.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I hunt for the thrill. The meat's an afterthought.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "A mage once tried to cook a fish with a fireball and served me a lump of charcoal with fins. Cooking is patience, salt and a decent pan, and I'll teach any of you who'll listen, but nobody ever listens." } },
      choices = {
        { text = "I'll listen. Teach me the proper way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A fireball's quicker, burned fish or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A troll paid me to cook a whole shark for something he called a feast of the waters, and he poured the first bowl into the sea. I was offended at the time, but the fishing was wonderful that week." } },
      choices = {
        { text = "Giving the sea its share is a good habit.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Pouring good stew into the sea is a waste.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They're wonderful, with enough pepper, and they keep for weeks in a sealed pouch. I've sold them to sailors, hunters and a few rogues who swore they were the only thing that kept them going on a long night's work." } },
      choices = {
        { text = "I'll try them. A good meal matters on the road.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll take my chances with whatever I find.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kelsey.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because pepper turns a dull fish into a feast and a rubbery clam into something you'd actually want to eat. Conjured bread can keep you alive, but it can't make you happy, and a happy mage casts better spells, I'm sure of it." } },
      choices = {
        { text = "Then I'll take the pepper. You've convinced me.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A full belly is all I need. Pepper's a luxury.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The old ones do, quietly, because they remember long voyages when there was nothing to eat at all. The young ones just shovel it in, and I don't blame them, though I wish they'd say thank you to somebody, even if it isn't me." } },
      choices = {
        { text = "Gratitude is a prayer of its own. Teach them that.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hungry sailors don't need manners. Let them eat.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Fewer clams and more herbs, I'd guess, and the herbs from the jungle are stronger than anything I could buy up north. A druid once taught me which leaf keeps fish fresh for an extra day, and I've been grateful ever since, though I never caught their name." } },
      choices = {
        { text = "Share what you know with the other cooks. Knowledge should travel.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Keep that leaf a secret, Kelsey. Your trade depends on it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Something that keeps, first of all, like dried clam strips or a good jerky, and plenty of pepper, because pepper covers a multitude of sins when the meat's three days old. Any soldier who tells you rations taste fine has simply forgotten what food is supposed to taste like." } },
      choices = {
        { text = "Plain rations are fine for a soldier, Kelsey.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Good food is worth the extra weight, Kelsey.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll want something hearty, then, because plate burns through a meal faster than anything, and I've a crocolisk steak that would hold a knight through the afternoon." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Will you bless my pepper pot, then? I'm only half joking, because I've cooked crocolisk in this heat for years and some days it needs all the help it can get." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman! I hear tauren cooking is all roots and plains game, so you must be dying for a decent fish stew." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Do your folk bless food before you eat it? Bless this stew, then, because it needs all the help it can get." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock! Your imp's welcome to the scraps, but it eats on the floor, and I'll not have it singeing my tablecloths." },
        { id = "h_default", key = true,
          text = "Kelsey Yance, cook. I sell spices and recipes for the things that swim and crawl round Booty Bay, because a sailor who eats well fights well, and a sailor who eats badly ends up in the infirmary." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! You'll want something light to carry on the road, I suppose, and I've got recipes for dried clam strips that'll keep you going for days without slowing you down." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Now, I know you can conjure your own food, but you can't conjure pepper, and without pepper, life's not worth living." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Sit down and eat something, because you look like you've been living on hardtack and pride, and neither will keep you on your feet." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Bring a crocolisk tail or two past my stall some time, and I'll tell you how to cook it so you never look at hardtack again." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! I've a clam chowder that'd make any bear sit up and beg, though I'd ask you to do it outside the kitchen." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! I hear dwarves like a stew thick enough to stand a spoon in, so you must be dying for something better than ship's biscuit." },
      },
      again = {
        { id = "h_again", text = "What else? Ask, and I'll tell you how to cook it." },
        { id = "h_again2", text = "Anything else, friend?" },
      },
      choices = {
        { text = "Have you ever cooked anything for a shaman's ceremony?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Do any spellcasters ever cook with magic, Kelsey?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Let me see your recipes.", next = "BUSINESS" },
        { text = "What's good to eat around here?", next = "eat" },
        { text = "What shouldn't I eat in the jungle?", next = "dont" },
        { text = "Who do you cook for?", next = "cook_for" },
        { text = "Dried clam strips? Are they any good, Kelsey?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why does pepper matter so much, Kelsey?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do sailors pray before they eat, Kelsey?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What should a warrior eat in Stranglethorn, Kelsey?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What's the best thing to cook from the jungle, Kelsey?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What does a druid's chowder need that a sailor's doesn't, Kelsey?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What would you cook for a knight on campaign, Kelsey?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Have you ever cooked for a shaman's ceremony, Kelsey?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll pass, thanks.", next = "END" },
      },
    },
    eat = {
      lines = {
        { id = "e_default", text = "Clams from the reefs, steamed with a bit of pepper, and the cod from the deep water, if you've the patience to catch it. Tiger meat's tough but honest, and raptor's better than you'd think, if you cook it long enough to stop it looking at you." },
      },
      choices = {
        { text = "Raptor? Really?", next = "eat_raptor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eat_raptor = {
      lines = {
        { id = "er_default", text = "Really, friend! It tastes like chicken that's very angry about being chicken. Slow-cook it with jungle spices and it's the best thing in the cove, though Nixxrax at the tavern won't put it on the menu." },
      },
      choices = {
        { text = "I'll take your word for it.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dont = {
      lines = {
        { id = "d_default", text = "Anything a troll's been cooking, anything that's glowing, and any fish you pulled out of the water near the Vile Reef. Fin Fizracket came back from the jungle with a fever, and he's still sweating it out, so be careful what you put in your mouth." },
      },
      choices = {
        { text = "Good to know.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cook_for = {
      lines = {
        { id = "c_default", text = "Anyone who'll eat it! Sailors, pirates, adventurers, the Baron's guards, and the odd orc from Grom'gol who's tired of eating whatever they boil up over there. A neutral port has a neutral kitchen, friend." },
      },
      choices = {
        { text = "Food should feed everyone, Horde or Alliance.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "I'd not feed the Horde, myself.", next = "BACK", fx = { align = { light = -1 } }, when = { faction = "Alliance" } },
        { text = "I'd not feed the Alliance, myself.", next = "BACK", fx = { align = { light = -1 } }, when = { faction = "Horde" } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I cooked on a merchant ship until it sank under me, and I swam to Booty Bay and never left. That was a long time ago now." } },
    advice = { { id = "tp_ad", text = "Cook everything twice in the jungle, friend, and wash your hands three times." } },
    _none = { { id = "tp_none", text = "No idea, friend, but if you want to know how to cook it, I'm your cook." } },
  },
}

P:NPC {
  key = "gnaz", id = TODO_NPC("Gnaz Blunderflame"), name = "Gnaz Blunderflame",
  title = "Engineering Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "excitable", "scatterbrained" }, values = { "curious" },
  notices = { "craft", "race" },

  impression = {
    first = "Gnaz Blunderflame sells engineering supplies in Booty Bay and has the singed eyebrows to prove a long career in the trade. The shop smells of black powder and confidence.",
    third = "{name} met Gnaz Blunderflame, who sells engineering supplies in Booty Bay.",
  },

  greetings = {
    { id = "g_shop", text = "Gears, bolts, blasting powder and tubes, all of it guaranteed not to explode unless you want it to! Mostly." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and with both your eyebrows! You're doing better than I am." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer, I can tell from the burns on your sleeves! Come in, come in; you'll appreciate the good powder, not like the sailors who think it's for seasoning." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Now we can talk properly, friend; you'll know a good gear ratio when you see one, which is more than any pirate in this cove does." },
    { id = "n_refugee", cat = "origin", when = { origin = "gnome_gnomeregan_refugee" },
      text = "You came out of Gnomeregan with nothing but a toolbag too, didn't you? I can tell by how you count the exits. Booty Bay's a long way from the lower levels, friend, and that's half of why I like it." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "For when ten trolls rush you at once, of course, and you need to make it nine, or eight, or a crater. I've sold plenty to warriors who swore they'd never use it, and every one of them came back for more." } },
      choices = {
        { text = "A warrior wins with skill and steel, not explosives.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Whatever wins the fight is the right tool.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They work beautifully, most of the time, and when they don't, they make a very impressive noise. I've fitted a dozen rifles for Nesingwary's camp this season and only one of them blew up, which in engineering is a triumph." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They work beautifully, most of the time, and when they don't, they make a very impressive noise. I've fitted a dozen rifles for Nesingwary's camp this season and only one of them blew up, which in engineering is a triumph. Keep {pet} back while I'm fitting the scope, though, because it'll be the first thing singed if anything goes wrong." },
      },
      choices = {
        { text = "I trust my own eye and skill, not a gadget.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it helps me hit the beast, I'll strap it on.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They could, and they do, if you don't mind losing your eyebrows! I've been trying to wire a mana crystal into a lantern, and it lights beautifully for about four seconds before it lights everything else." } },
      choices = {
        { text = "Keep at it, carefully. You'll get it right.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Wire two crystals and see what happens.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Twice, and the storm won both times, though the second time I kept my eyebrows. I think engineers and shamans want the same thing, which is lightning that does what it's told, only you ask nicely and I use copper wire." } },
      choices = {
        { text = "Ask nicely, Gnaz. The elements deserve that respect.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If copper wire works, there's no need to ask the spirits.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "That's a trade secret, pal, and it took me three tries and both my eyebrows to get it right. It makes a flash and a puff of smoke without the noise, so you can slip away while everyone's still rubbing their eyes." } },
      choices = {
        { text = "I'll pay well for it. Good work deserves gold.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Tell me the trick and skip the price.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Gnaz.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Completely, pal, because magic depends on whoever's casting it, and engineering works the same no matter who pulls the lever. Mostly, anyway, since some of my levers have a mind of their own, but that's what the eyebrows are for." } },
      choices = {
        { text = "Both have their place. I respect your craft.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Magic doesn't need levers. That's why it's better.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only my shop, these days, because the Venture Company men buy my powder by the barrel to clear the trees, and I'd rather not be standing there when they light it. I don't ask what they're clearing, but I hear the trees fall from here some mornings." } },
      choices = {
        { text = "Then stop selling to the Venture Company. Their coin is poisoned.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A merchant can't choose his customers. Selling powder isn't felling trees.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Blasting powder, mostly, and a little impatience, because a fuse is always shorter than the label says. The Light might grow them back, but it won't stop me lighting the next one, so I'd rather you saved your blessing for someone who'll learn from it." } },
      choices = {
        { text = "Then measure your fuses, Gnaz, and spare us both.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some lessons aren't worth learning. Light the fuse.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I don't suppose the Light could do anything about singed eyebrows, because I've been meaning to ask somebody for years." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do you know what a lightning bolt would do to a capacitor? Neither do I, but I've got a capacitor and I'd love to find out." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Could you bless my bench? Things keep exploding on it, and I've run out of other explanations." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock! Do imps run on fire? If they do, could one power a small engine? I'm only asking for science." },
        { id = "h_default", key = true,
          text = "Gnaz Blunderflame, engineering supplies! I sell the gears, the powder and the bolts that every tinkerer from here to Gadgetzan needs, and I've only blown up the shop once this year, which is a personal record." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Now, I've got flash powder, smoke bombs and a little something that goes bang very quietly, if you know what I mean, and I'm sure you do." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Now, I've heard your kind say engineering is just magic for people who can't cast spells, and I'll tell you right now that's not true." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior! Ever thought of a stick of dynamite on your belt, friend, just for the moments when a sword's not quite loud enough?" },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Now, I've got scopes, friend, real goblin ones, that'll put your shot through a tiger's eye at a hundred paces, more or less." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! I'll keep the powder away from you, friend, because I've a feeling you'd be the type to object to a perfectly good explosion." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, I've got something on the bench that's ticking." },
        { id = "h_again2", text = "Ask away, friend; I'll keep one eye on the fuse." },
      },
      choices = {
        { text = "Have you ever tried to harness a storm with your gadgets?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could magic and engineering work together, Gnaz?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "You blew up the shop?", next = "boom" },
        { text = "Who buys blasting powder in a port?", next = "buyers" },
        { text = "Does all this work, or is it just noise?", next = "work" },
        { text = "How does something go bang quietly, Gnaz?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is engineering really so different from magic, Gnaz?", next = "xmage", when = { class = "MAGE" } },
        { text = "Why would a warrior carry dynamite, Gnaz?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do goblin scopes really work, Gnaz?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you blow things up in the jungle, Gnaz, or only your shop?", next = "xdruid", when = { class = "DRUID" } },
        { text = "How do your eyebrows keep getting singed, Gnaz?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I fetch parts out of Gnomeregan. Would the goblins here buy them?", next = "xorig_scav", when = { origin = "gnome_scavenger" } },
        { text = "I'll keep my distance, thanks.", next = "END" },
      },
    },
    xorig_scav = {
      lines = {
        { id = "xsc_default", text = "Buy them? Friend, the goblins in this cove would buy the gears out of your pocket watch while you were checking the time! They'll pay well for Gnomeregan work, too, and never ask whose workshop it came out of, which is exactly what bothers me about it." },
      },
      choices = {
        { text = "Coin is coin. The city isn't using them.", next = "xorig_scav2", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Then I'll sell to gnomes first, even for less.", next = "xorig_scav2", fx = { align = { honor = 1 } } },
        { text = "Who in Booty Bay pays best?", next = "xorig_scav2", fx = { trait = { curious = 1 } } },
      },
    },
    xorig_scav2 = {
      lines = {
        { id = "xsc2_default", text = "Whoever's got a ship leaving at dawn, usually, and that's all I'll say about it. Just remember that every gear you carry out of the city is one Mekkatorque won't find when we go home, and I'd like there to be something left to go home to." },
      },
      choices = {
        { text = "I'll remember, Gnaz.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boom = {
      lines = {
        { id = "b_default", text = "Only a little! A barrel of powder, a careless pipe and a very surprised parrot, and the Baron fined me for the noise. Nobody was hurt, except my pride and the parrot's feathers." },
      },
      choices = {
        { text = "What happened to the parrot?", next = "boom_parrot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boom_parrot = {
      lines = {
        { id = "bp_default", text = "It flew off and joined the Bloodsail, as far as I know, and I can't say I blame it. Now I keep the powder in the back and the pipes outside, which is a very sensible arrangement." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    buyers = {
      lines = {
        { id = "by_default", text = "The ships, for their cannons, and the Venture Company, for their mining, though I don't like to ask what they're blasting. And tinkerers like you, friend, who want to make something that goes bang in exactly the right direction." },
      },
      choices = {
        { text = "You sell to the Venture Company?", next = "buyers_venture" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_venture = {
      lines = {
        { id = "bv_default", text = "Their money spends like anyone else's, friend, and the Baron doesn't forbid it. But they're tearing the jungle up for ore and timber, and I'll admit I don't sleep as well as I used to." },
      },
      choices = {
        { text = "Then stop selling to them.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Gold's gold. Sleep's overrated.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "w_default", text = "Most of it works, most of the time, which is more than you can say for magic, friend. A mage needs years of study, but give a tinkerer a bag of bolts and an afternoon and you'll get something useful, or at least something very loud." },
      },
      choices = {
        { text = "Magic's more reliable than you think.", next = "BACK", when = { class = { "MAGE", "WARLOCK" } }, fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned engineering by taking things apart and learned safety by putting them back together wrong." } },
    advice = { { id = "tp_ad", text = "Never light a fuse indoors, friend. Learn from my mistakes." } },
    _none = { { id = "tp_none", text = "I don't know, but I could build a contraption to find out, if you'd like one, and if not, then suit yourself." } },
  },
}
