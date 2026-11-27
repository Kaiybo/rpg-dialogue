-- Kargath's goblin smith-supplier, with nothing to say until now. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "jazzrik", id = TODO_NPC("Jazzrik"), name = "Jazzrik",
  title = "Blacksmithing Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "kargath" }, temper = { "jittery", "chatty" }, values = { "greedy", "practical" },
  notices = { "craft", "race", "lock_stones" },

  impression = {
    first = "He is afraid of the Horde and delighted by its money.",
    third = "{name} met Jazzrik, the goblin who sells blacksmithing supplies in Kargath.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "My favourite customer in all the Badlands, back again! I've got coal so clean ya could eat off it, pal, not that I'd advise it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you, buddy. I'll still take your coin, 'cause I'm a professional, but I'm chargin' you the Badlands price plus a nervousness fee." },
    { id = "g_shop", text = "Coal, flux, iron bars and grinding stones, all at Badlands prices, which means expensive, but expensive with a smile! Step right up, friend, step right up." },
    { id = "g_back", when = { metBefore = true }, text = "Oh good, a customer who's paid before! You're my favourite kind, buddy, right after customers who pay twice." },
    { id = "g_away", when = { away = 14 }, text = "Look who's back after {away} away! Prices went up while you were gone, friend, on account of the ogres, but for a returning customer they went up a little less." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "Word is you talked somebody in town into a deal they didn't want, and I respect that, buddy, I really do. Just remember who sets the prices at this counter, because it's me." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear somebody got swindled, and the description sounds a whole lot like you. Don't try it at my counter, friend, because I invented half those tricks and I've got the receipts to prove it." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing", "Mining" } },
      text = "A smith, or a miner! Either way, friend, the Badlands is full of ore and also full of things that want to eat you while you dig it out, and I sell the picks for both jobs." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, good, good! Please tell Warlord Goretooth I'm a very helpful goblin and not at all the sort he needs to shout at, friend, and I'll remember the favour at the counter, in spirit." },
    { id = "n_lock_firestone", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5522, 13602, 13603, 1254, 13699, 13700, 13701 } },
      text = "Is that a firestone you're packin'? Shiny, buddy, real shiny, and I'd bet a smith could use a heat like that in his forge if it ever came off the market. Shame you lot never sell 'em, but a goblin can dream." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Can I sell? Buddy, I can sell anything to anybody, and a dead knight with holy hands is a whole new market I've been itchin' to crack. What you'd want is better iron, I'd guess, since the Light doesn't sharpen a blade and my whetstones do." } },
      choices = {
        { text = "An honest smith deserves honest iron, even out here.", next = "BACK", reply = "Listen, I agree completely, and I'm only overcharging you slightly, which is practically charity in Kargath.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Overcharge the orcs. They don't know what iron costs anyway.", next = "BACK", reply = "Whoa, whoa, keep your voice down, pal! They know what an axe costs, and they know where I sleep.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Sell me honest iron at an honest price.", next = "BACK", reply = "Honest iron at an honest price? Sure, buddy, and I'll even throw in a smile for free. Don't tell the orcs about the smile.", fx = { align = { honor = 1 } } },
        { text = "Charge the orcs double and sell me the good iron.", next = "BACK", reply = "Now that's a customer after my own heart, friend! Double for the orcs and the good stuff for you, and we never had this conversation.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "As well as coal and iron allow, friend, and both cost a fortune to haul over the Gorge road, which comes out of my margin and then out of yours. The Dark Irons have all the iron they want under their mountain, which is a monopoly, and it isn't fair, because they're the ones tryin' to kill everybody." } },
      choices = {
        { text = "Then the Horde's smiths deserve your coal at a fair price.", next = "BACK", reply = "Fair price, sure, sure, and fair is what the coal costs me plus a little somethin' for my trouble. That's fair, right, buddy?", fx = { align = { honor = 1 } } },
        { text = "Raid the Dark Irons for iron and never pay goblin prices.", next = "BACK", reply = "Raid the Dark Irons? Buddy, you'll put me out of business! Go on, then, but if you bring back iron, I'm buyin' it.", fx = { align = { honor = -1 } } },
        { text = "Something else, Jazzrik.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Terrible, friend, because the coyotes and basilisks love the mines as much as I do and never pay for anything. I lose a mule a month to the basilisks, so I've started billing the orcs for the mule, which they don't appreciate one bit." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Terrible, friend, because the coyotes and basilisks love the mines as much as I do and never pay for anything. And keep {pet} off my coal cart, buddy, because the last beast that rolled in it cost me a bath I somehow paid for." },
      },
      choices = {
        { text = "Charging the Horde for your dead mule is plain swindling.", next = "BACK", reply = "Swindling's a strong word, friend, I prefer cost recovery. A mule's an asset, and assets need replacin'.", fx = { align = { honor = 1 } } },
        { text = "Charging extra for the mule? That's sharp business, goblin.", next = "BACK", reply = "Sharp business, that's my whole philosophy, buddy! Somebody's gotta pay for the mule, and it ain't gonna be me.", fx = { align = { honor = -1 } } },
        { text = "Something else, Jazzrik.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If it minded, it should've said so before I signed the contracts, friend, because a deal's a deal. I buy my ore off miners who dig out near Uldaman, and the only thing in the Badlands that's ever complained is the troggs, and they complain about everything." } },
      choices = {
        { text = "The earth remembers greed. Take only what you need, Jazzrik.", next = "BACK", reply = "Take only what I need? Pal, I need everything, that's the whole point of business. The earth'll forgive me eventually.", fx = { align = { light = 1 } } },
        { text = "Dig deep. The earth has plenty, and the Horde needs steel.", next = "BACK", reply = "Now you're talkin' my language, friend! Dig deep, haul it up, sell it on, and everybody's happy except the earth.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Not yet, friend, but give me a list and a deposit and I'll have it hauled in from Orgrimmar at Badlands prices, plus a handlin' fee. I'd want it in writing, mind, because Shadowmage Vivian Lagrave once ordered something from me that hissed in the crate, and I haven't slept right since." } },
      choices = {
        { text = "Order it through the Expeditionary Force, properly, with papers.", next = "BACK", reply = "Papers? Buddy, papers mean taxes and taxes mean less for me. But sure, if you insist, I'll fill out somethin'.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Skip the paperwork. Just haul it in quietly.", next = "BACK", reply = "Quietly, eh? I like your style, friend. Quiet costs extra, but it's worth every copper.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Blasting powder, mostly, which the warlord's sappers buy by the barrel and which I keep well away from the forge, for reasons that cost me my last cart and both eyebrows. Anybody walks off with a barrel of that, I hope they don't walk past a campfire." } },
      choices = {
        { text = "Your powder's safe. I don't rob honest merchants.", next = "BACK", reply = "Glad to hear it, buddy, because I've had enough explosions this month. Honest merchants are a dying breed out here.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Blasting powder? Now that's worth a little risk.", next = "BACK", reply = "Whoa, whoa, hold on there, pal! That powder's spoken for, and the last guy who got curious ain't got eyebrows anymore.", fx = { align = { honor = -1 } } },
        { text = "Something else, Jazzrik.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "No? Shame, buddy, because I've been lookin' for a new market ever since the smiths started haggling. Still, if your imp ever gets peckish, you know where to find me, and coal's cheaper than whatever it eats now, I'd bet." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "No? Shame, buddy, because your demon's been staring at my coal cart like it's a feast table, and I've been lookin' for a new market ever since the smiths started haggling. If it ever gets peckish, you know where to find me, and coal's cheaper than whatever it eats now, I'd bet." },
      },
      choices = {
        { text = "You'd sell to a demon? That's a step too far.", next = "BACK", reply = "A step too far? Friend, I don't even know where the line is, and I've stepped over it twice this week. But sure, sure.", fx = { align = { light = 1 } } },
        { text = "Gold's gold. I admire a goblin with no limits.", next = "BACK", reply = "No limits, that's my motto, buddy! Well, that and time is money, but who's countin'.", fx = { align = { light = -1 } } },
        { text = "Never mind that for now.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Out of the hills to the west, friend, where the Dark Irons left half their old workings behind without so much as a claim notice. I'm just finishing what they started, and if you ask me, the hills are glad of the company after all those dwarves." } },
      choices = {
        { text = "Dig what's already dug. Leave the rest alone.", next = "BACK", reply = "Leave it alone? Pal, the Dark Irons left it lyin' around for anybody. That's practically an invitation.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Dig wherever the coal is. The Badlands won't notice.", next = "BACK", reply = "That's what I keep sayin', friend! The Badlands are mostly rock anyway, and rock don't complain.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock! Does your imp eat coal? Because if it does, buddy, I've got a whole cart, and I'd sell it at a very reasonable rate for a very regular customer." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue! You're not here to steal coal, are you? It's heavy and dirty, friend, and you'd be the worst thief in the Badlands, and I'd still send you a bill." },
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman! You won't be needing coal, I suppose, since you can just ask the fire nicely, which is terrible for business if you think about it, and believe me, I've thought about it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest! Say a word for me to whoever you pray to, friend, because I owe money in three cities, and by my last copper, I'll take help from anyone." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage! You don't need iron bars, I suppose, but if you ever want to buy some just to be friendly, buddy, I won't stop you, and I'll even wrap 'em." },
        { id = "h_default", key = true,
          text = "Jazzrik, blacksmithing supplies! I keep the warlord's smiths fed with coal and iron, friend, and in return the warlord doesn't feed me to anything, which is the best contract I've ever signed." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior! You'll want your blade sharpened and your armour mended, and the warlord's smiths need my coal for both, so really, buddy, I'm the reason you're still standing, and that's worth somethin'." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter! No coal for you, I suppose, unless your beasts eat it, but I've arrowheads, good iron ones, at a price that'll only make you cry a little, friend." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! I sell coal and iron, so I'm sure you think I'm the worst thing that's happened to the Badlands, but on my mother's ledger, friend, the dragons got here first." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin! Oh, that's new, that's very new, and new means opportunity, buddy. You don't need a hammer blessed, do you, because I've got coal and iron and a fellow who owes me a favour." },
        { id = "dd_darkiron", when = { killed = { name = "Dark Iron", min = 50 } },
          text = "Hey, the grunts say you've been droppin' Dark Irons like bad stock, pal! Their armour's the best scrap iron in the Badlands, so if you ever haul any back, I'm buyin' and I'm not askin' where the owner went." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Talk fast, because I'm paid by the sale, not by the chat." },
        { id = "h_again2", text = "Anything else? Ask away, buddy, and keep one eye on the door for me, would you?" },
        { id = "h_again3", text = "Sparks and sprockets, you're still here? Good, good, a customer who lingers is a customer who buys." },
      },
      choices = {
        { text = "Where does your coal come from, Jazzrik?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do you think the earth minds you digging up its iron, Jazzrik?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you sell anything a spellcaster needs, Jazzrik?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Let me see your stock.", next = "BUSINESS" },
        { text = "Why is everything so expensive here?", next = "price" },
        { text = "What's out in the Badlands worth mining?", next = "ore" },
        { text = "Warlord Goretooth looks like a hard master.", next = "goretooth" },
        { text = "The dwarves must trouble Kargath often.", next = "darkiron" },
        { text = "How do the orcs here treat my people?", next = "forsaken", when = { race = "Scourge" } },
        { text = "What do you keep that's worth stealing, Jazzrik?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "My imp doesn't eat coal, Jazzrik.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do Kargath's smiths keep the warriors well armed?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "The hunting round the mines looks poor.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Can you sell anything to a Forsaken paladin, Jazzrik?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    price = {
      lines = {
        { id = "p_default", text = "Because everything comes in from Orgrimmar by zeppelin and wind rider, friend, and then on the backs of tired kodos through ogre country. I add a bit for the danger, a bit for the trouble and a bit for me, and the bit for me is the smallest, mostly." },
      },
      choices = {
        { text = "That's a lot of bits.", next = "price_bits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    price_bits = {
      lines = {
        { id = "pb_default", text = "It is! But you can buy from me or you can walk to Orgrimmar, buddy, and I promise the walk costs more. I've done the sums, friend, and believe me, the sums like me better." },
      },
      choices = {
        { text = "Fair is fair. You earned it.", next = "BACK", reply = "Thanks, buddy, I appreciate a customer who understands margins. Come back anytime, and bring friends with coin.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "That's gouging, and you know it.", next = "BACK", reply = "Gouging? Friend, I'm hurt, I'm deeply hurt. That's just what things cost when you haul 'em over the Gorge road.", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore = {
      lines = {
        { id = "o_default", text = "Iron in the hills, and mithril if you're lucky and brave, but the Badlands are crawling with ogres, troggs and Dark Iron dwarves, and every last one's a cost I can't pass on. Every good seam out here is guarded by something with a club or a hammer or both." },
      },
      choices = {
        { text = "Troggs?", next = "ore_troggs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore_troggs = {
      lines = {
        { id = "ot_default", text = "Ugly little rock-eaters that come up out of the caves near Uldaman, friend. They'll eat your ore, your pick and probably your boots, and none of it's insured, so if you go mining near the ruins, keep a sharp eye out." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    goretooth = {
      lines = {
        { id = "g_default", text = "Hard? He's a rock with a grudge, buddy, but he pays on time and he's never once broken a contract, and I can't say that of my own cousins. I just make very sure he's never got a reason to look at me, or at my books." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = {
        { id = "fs_default", text = "Politely, friend, mostly because Shadowmage Vivian Lagrave, the warlord's spellcaster, is one of yours and nobody wants to annoy her, least of all me, because she's a customer. The grunts mutter a bit when your lot walk by, but they mutter at me too, and I'm still here and still sellin'." },
      },
      choices = {
        { text = "Muttering I can live with.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkiron = {
      lines = {
        { id = "d_default", text = "Every day! The Dark Irons hold Angor Fortress to the east and dig in the hills, and they hate the orcs worse than they hate the Alliance. If it weren't for the walls and the warlord's grunts, buddy, I'd be out of business and out of a head long ago, and I'm not sure which I'd miss more." },
      },
      choices = {
        { text = "Then the grunts earn their keep.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I came out here to make my fortune, friend, and I'm still making it, very slowly and very nervously, one copper at a time, with an ogre watching the till." } },
    advice = { { id = "tp_ad", text = "Don't mine alone in the Badlands, buddy, because something will always find you, and it's usually got more teeth than you've got pick. Also, buy a spare pick; I've got several." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's grunts pay in silver, friend, and they don't haggle much. I'm a big fan of the Warchief, very big." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's where I'd like to retire, friend, someday, if the orcs don't eat me first. Nobody eats anybody in Booty Bay, it's in the contract." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons sell coal cheaper than me, friend, but they're Dark Irons. The orcs prefer to buy from a goblin they can shout at." } },
    _none = { { id = "tp_none", text = "No idea, friend! Ask somebody who isn't busy counting coal, and come back when you want to buy some." } },
  },
}
