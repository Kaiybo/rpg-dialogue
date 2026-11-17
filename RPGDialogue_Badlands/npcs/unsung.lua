-- Kargath's goblin smith-supplier, with nothing to say until now. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "jazzrik", id = TODO_NPC("Jazzrik"), name = "Jazzrik",
  title = "Blacksmithing Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "kargath" }, temper = { "jittery", "chatty" }, values = { "greedy", "practical" },
  notices = { "craft", "race" },

  impression = {
    first = "Jazzrik sells coal and iron to the orcs of Kargath and never stops talking about how much it costs to haul anything into the Badlands. The goblin seemed both afraid of the Horde and delighted by its money.",
    third = "{name} met Jazzrik, the goblin who sells blacksmithing supplies in Kargath.",
  },

  greetings = {
    { id = "g_shop", text = "Coal, flux, iron bars and grinding stones, all at Badlands prices, which means expensive. Step right up!" },
    { id = "g_back", when = { metBefore = true }, text = "Oh good, a customer who's paid before! You're my favorite kind." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing", "Mining" } },
      text = "A smith! Or a miner! Either way you'll want to know the Badlands is full of ore, friend, and also full of things that want to eat you while you dig it out." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, good, good. Please tell Goretooth I'm a very helpful goblin and not at all the sort he needs to shout at, friend." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "As well as coal and iron allow, and both cost a fortune to haul over the Gorge road. The Dark Irons have all the iron they want under their mountain, which isn't fair, because they're the ones trying to kill everybody." } },
      choices = {
        { text = "Then the Horde's smiths deserve your coal at a fair price.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Raid the Dark Irons for iron. Why pay goblin prices?", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jazzrik.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Terrible, because the coyotes and basilisks love the mines as much as I do, and they never pay for anything. I lose a mule a month to the basilisks, and I've started charging the orcs extra for the mule, which they don't appreciate." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And keep {pet} off my coal cart! I had a beast roll in it once, and its owner tried to charge me for the bath." },
      },
      choices = {
        { text = "Charging the Horde for your dead mule is plain swindling.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Charging extra for the mule? That's sharp business, goblin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jazzrik.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If it minded, it should've said so before I signed the contracts. I buy my ore off miners who dig out near Uldaman, and the only thing in the Badlands that's ever complained is the troggs, and they complain about everything." } },
      choices = {
        { text = "The earth remembers greed. Take only what you need, Jazzrik.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Dig deep. The earth has plenty, and the Horde needs steel.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Not yet, friend, but give me a list and a deposit and I'll have it hauled in from Orgrimmar, at Badlands prices. I'd want it in writing, mind, because the Shadowmage once ordered something from me that hissed in the crate, and I haven't slept right since." } },
      choices = {
        { text = "Order it through the Expeditionary Force, properly, with papers.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Skip the paperwork. Just haul it in quietly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Blasting powder, mostly, which the warlord's sappers buy by the barrel and which I keep well away from the forge, for reasons I'd rather not explain. Anybody walks off with a barrel of that, I hope they don't walk past a campfire." } },
      choices = {
        { text = "Your powder's safe. I don't rob honest merchants.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Blasting powder? Now that's worth a little risk.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jazzrik.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "No? Shame, because I've been looking for a new market ever since the smiths started haggling. Still, if it ever gets peckish, you know where to find me, and coal's cheaper than whatever it eats now, I'd bet." } },
      choices = {
        { text = "You'd sell to a demon? That's a step too far.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Gold's gold. I admire a goblin with no limits.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Never mind that for now.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock! Does your imp eat coal? Because if it does, I've got a whole cart, and I'd sell it at a very fair price." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue! You're not here to steal coal, are you? Because it's heavy and dirty, and you'd be the worst thief in the Badlands, and I'd still charge you for it." },
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman! You won't be needing coal, I suppose, since you can just ask the fire nicely, which is terrible for business if you think about it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest! Say a word for me to whoever you pray to, friend, because I owe money in three cities and I'll take help from anyone." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage! You don't need iron bars, I suppose, but if you ever want to buy some just to be friendly, I won't stop you." },
        { id = "h_default", key = true,
          text = "Jazzrik, blacksmithing supplies! I keep the warlord's smiths fed with coal and iron, and in return the warlord doesn't feed me to anything, which I think is a very good arrangement for both of us." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior! You'll want your blade sharpened and your armour mended, and the warlord's smiths need my coal for both, so really, I'm the reason you're still standing." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter! No coal for you, I suppose, unless your beasts eat it, but I've arrowheads, good iron ones, at a price that'll only make you cry a little." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Talk fast; I'm paid by the sale, not the chat." },
        { id = "h_again2", text = "Anything else? Ask away!" },
      },
      choices = {
        { text = "Do you think the earth minds you digging up its iron, Jazzrik?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you sell anything a spellcaster needs, Jazzrik?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Let me see your stock.", next = "BUSINESS" },
        { text = "Why is everything so expensive here?", next = "price" },
        { text = "What's out in the Badlands worth mining?", next = "ore" },
        { text = "Is Goretooth a hard master?", next = "goretooth" },
        { text = "Do the dwarves trouble Kargath?", next = "darkiron" },
        { text = "How do the orcs here treat my people?", next = "forsaken", when = { race = "Scourge" } },
        { text = "What do you keep that's worth stealing, Jazzrik?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "My imp doesn't eat coal, Jazzrik.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do Kargath's smiths keep the warriors well armed?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What's the hunting like around the mines, Jazzrik?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    price = {
      lines = {
        { id = "p_default", text = "Because everything comes in from Orgrimmar by zeppelin and wind rider, and then on the backs of tired kodos through ogre country. I add a bit for the danger, a bit for the trouble, and a bit for me, which is only fair." },
      },
      choices = {
        { text = "That's a lot of bits.", next = "price_bits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    price_bits = {
      lines = {
        { id = "pb_default", text = "It is! But you can buy from me or you can walk to Orgrimmar, and I promise the walk costs more. I've done the sums, friend, and believe me, the sums like me better." },
      },
      choices = {
        { text = "Fair is fair. You earned it.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "That's gouging, and you know it.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore = {
      lines = {
        { id = "o_default", text = "Iron in the hills, and mithril if you're lucky and brave, but the Badlands are crawling with ogres, troggs and Dark Iron dwarves. Every good seam in this place is guarded by something with a club or a hammer or both." },
      },
      choices = {
        { text = "Troggs?", next = "ore_troggs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore_troggs = {
      lines = {
        { id = "ot_default", text = "Ugly little rock-eaters that come up out of the caves near Uldaman. They'll eat your ore, your pick and probably your boots, so if you go mining near the ruins, keep a sharp eye out." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    goretooth = {
      lines = {
        { id = "g_default", text = "Hard? He's a rock with a grudge, friend, but he pays on time and he's never once broken a contract, which is more than I can say for some goblins I know. I just make very sure he's never got a reason to look at me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = {
        { id = "fs_default", text = "Politely, friend, mostly because the Shadowmage at the warlord's fire is one of yours and nobody wants to annoy her. The grunts mutter a bit when your lot walk by, but they mutter at me too, and I'm still here." },
      },
      choices = {
        { text = "Muttering I can live with.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkiron = {
      lines = {
        { id = "d_default", text = "Every day! The Dark Irons hold Angor Fortress to the east and dig in the hills, and they hate the orcs worse than they hate the Alliance. If it weren't for the walls and the warlord's grunts, I'd have been out of business and out of a head a long time ago." },
      },
      choices = {
        { text = "Then the grunts earn their keep.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I came out here to make my fortune, and I'm still making it, very slowly and very nervously." } },
    advice = { { id = "tp_ad", text = "Don't mine alone in the Badlands, friend. Something will always find you." } },
    _none = { { id = "tp_none", text = "No idea, friend! Ask someone who isn't busy counting coal." } },
  },
}
