-- Eastvale Logging Camp's tradesfolk: Rallic Finn the bowyer, Drake Lindgren's supply house
-- and Terry Palin at the mill. Voice: bibles/eastvale_trades.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Rallic Finn: bowyer, beside a house at the camp's east end.
P:NPC {
  key = "rallic", id = TODO_NPC("Rallic Finn"), name = "Rallic Finn", title = "Bowyer",
  bible = "bibles/eastvale_trades.md", role = "vendor", tier = "service",
  communities = { "eastvale" }, temper = { "quiet" }, values = { "craft", "patient" },
  notices = { "class", "craft" },
  impression = {
    first = "Rallic Finn makes bows at the east end of Eastvale and talks about wood the way some men talk about horses. He kept a stave in his hands the whole time we spoke.",
    third = "{name} met Rallic Finn, the soft-spoken bowyer of Eastvale Logging Camp.",
  },
  greetings = {
    { id = "g_default", text = "Bows, arrows and quivers, and all of it made from Elwynn wood. Have a look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Your string's held up, I hope, or you'd be scowling." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. You'll want arrows, I expect, and plenty of them." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Let me see how you hold that bow. Hm, your draw is good, but you're gripping the riser like it owes you money, so loosen the hand and the arrow will thank you." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker! If you ever have a good hide to spare, bring it here, because a quiver's only as good as the leather it's sewn from." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd swear they do, the good ones at least. A bow made from a willing tree shoots straighter, and I won't be told otherwise." } },
      choices = {
        { text = "Then honour the tree, Rallic, and the bow will honour you.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Wood's just wood. Any bow is only as good as its maker.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Not much, and they'd say so to your face if they weren't afraid of you. They've enough to worry about with the prowlers and bears in the woods, so if you're here to help with that, they'll mind their tongues soon enough." } },
      choices = {
        { text = "I'll help with the beasts and earn their trust.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let them be afraid. Fear keeps tongues still.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Rallic.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not for the pieces that come to me, because they'd be firewood otherwise and a bow lasts a man his whole life. The mill's another matter, but the mill isn't mine, and Raelen doesn't take advice from bowyers." } },
      choices = {
        { text = "Your bows honour the wood. The mill should learn from you.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Wood is wood. A tree cut for bows or beams is the same.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To bring one bear to you instead of three, which is the whole trick in these woods. Shoot the nearest from far off, let it come, and the others stay asleep. The loggers who learned that are still logging." } },
      choices = {
        { text = "I'll pull them one at a time, like you say.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather walk in and take all three at once.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A short bow is a quiet thing, quieter than a thrown knife if you know how to loose it, and plenty of scouts carry one for the long shots. I'll string you one, but don't tell Drake I took his custom." } },
      choices = {
        { text = "I'll pay you fairly and tell Drake if he asks.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Drake won't hear a word from me about where I shop.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The grain tells me, because a straight piece wants to be a bow and a twisted one wants to be something else, and I don't fight it. The tower sends me a request for a staff now and then, and I make it when the right piece comes up from the mill." } },
      choices = {
        { text = "Then I'll wait for the right piece. Good work takes time.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Wood's wood. Carve it to the order and be done.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than they'll admit, because the bears up north have been bolder since spring, and a logger would rather bleed than walk to the Abbey. If you've any linen or prayers to spare, Raelen's crews could use both, and they'll pretend they didn't." } },
      choices = {
        { text = "Then I'll walk out to the crews myself. They needn't ask.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A man too proud to ask for help can bleed, then.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Rallic.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every time a bear comes out of the trees, and then never again once it's gone. My father carried a pike in the Second War and came home missing three fingers, so I learned to make bows instead, which keeps the fighting at a polite distance." } },
      choices = {
        { text = "An honest bowyer serves the kingdom as well as any soldier.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A man who won't fight lets others bleed for him.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I've no bows for you, I expect, but you're welcome to sit while I work, and you can tell me if my language offends." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin in my shop! You'll not want a bow, I know, but I'll show you anyway, because I'm proud of them." },
        { id = "h_default", text = "Rallic Finn, bowyer. The loggers bring me the straight-grained pieces they can't sell to Stormwind, and I turn them into bows and arrows for the camp and anyone passing through." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "One of the kaldorei, at my bench! Your people made bows before mine had learned to sharpen a stick, so I'll take any criticism you care to give and try not to sulk about it." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf! Most of your kin walk past my bows and ask where the guns are. Drake Lindgren next door sells shot, if that's what you're after." },
        { id = "h_frontier", when = { questDone = TODO_QUEST("Protect the Frontier") }, text = "You're the one who thinned out the wolves and bears around the camp. The loggers have stopped bringing me torn quivers to mend, and I'm glad of the rest for my fingers." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You've a rogue's way of looking at a room, checking the windows first and the shelves second. Most rogues buy throwing knives from Drake, not bows from me." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage in a bowyer's shop. You'll be after a staff, I expect, and I'll tell you now I only make them when the wood tells me to." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior at a bowyer's bench! You'll want a bow for pulling something toward you, I expect, and that's a fair use of one." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf, and you're looking at my staves the way I look at them, so I reckon you hear the grain as well as I do." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Not much call for bows in your line, I'd guess, but you're welcome to look while I work." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, eh? Wood has a spirit, if you ask me. You can feel it in a good stave." },
      },
      again = {
        { id = "h_again", text = "What else? I'm only rubbing oil into this stave, so I can listen while I work." },
        { id = "h_again2", text = "Go on, ask. Bowyers are patient folk, or they'd never finish a bow." },
      },
      choices = {
        { text = "Let me see your bows.", next = "BUSINESS" },
        { text = "What makes a good bow?", next = "wood" },
        { text = "I wouldn't think a logging camp buys many bows.", next = "buyers" },
        { text = "The camp looks safer these days.", next = "safe" },
        { text = "I'm a hunter. Any advice?", next = "hunter", when = { class = "HUNTER" } },
        { text = "I worked the timber here once.", next = "woodsman", when = { origin = "human_eastvale_woodsman" } },
        { text = "Would a rogue have any use for one of your bows?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "How does the wood tell you what it wants to be?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why would a warrior bother with a bow?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The loggers must have needed a healer this season, Rallic.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you ever wish you'd taken up the sword, Rallic?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you ever feel guilty about the trees the mill cuts?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'd guess the loggers don't think much of warlocks, Rallic.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The trees here feel as if they have spirits, Rallic.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Rallic.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "Straight grain with no knots, cut in winter when the sap's down, and then a year of drying before I lay a blade to it. Most of Elwynn's trees are too twisted for it, which is why I fight the loggers for every good piece." } },
      choices = {
        { text = "So you fight the loggers for it.", next = "wood_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_fight = {
      lines = { { id = "wf_default", text = "Not with fists. Supervisor Raelen counts every log that goes to Stormwind, and a good stave looks like a good beam to her, so I have to beg the crew to set the best ones aside before she sees them." } },
      choices = {
        { text = "Stormwind's rebuilding should come first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A good bowyer matters more than one more beam.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "b_default", text = "More folk than you'd think. The loggers want something to keep the wolves off, the guards along the road want arrows, and travellers bound for Redridge stop here on the way east and remember they're going somewhere dangerous." } },
      choices = {
        { text = "What's dangerous about Redridge?", next = "buyers_redridge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_redridge = {
      lines = { { id = "br_default", text = "Gnolls in the hills and orcs beyond them, by what the travellers tell me. Lakeshire has its own fletcher, but they say she can't keep up with what the watch shoots, so I sell a fair few quivers to folk heading that way." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "redridge_gnolls" } } } },
    },
    safe = {
      lines = { { id = "s_default", text = "Safer than it was. The wolves and bears were growing bold enough to chase the crews off their own cut wood, and Guard Thomas on the western bridge talks about murlocs at the lake to anyone who'll listen." } },
      choices = {
        { text = "Do you believe him about the murlocs?", next = "safe_murlocs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_murlocs = {
      lines = { { id = "sm_default", text = "I've seen the tracks on the shore myself, and they aren't any animal I know. Two of Thomas's men went up there and didn't come back, so I'd say he's earned the right to be believed." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "murlocs_east" } } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Keep your string dry, carry twice the arrows you think you'll need, and never let your beast stand between you and what you're shooting. I've mended many a bow after a boar ran straight through a hunter's wolf and into the hunter." } },
      choices = {
        { text = "My beast knows its place.", next = "BACK", fx = { trait = { proud = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    woodsman = {
      lines = { { id = "ws_default", text = "Did you, now? Then you'll know why I keep my bench at this end of camp, as far from the saws as I can get it, because a man can't hear himself think over that mill." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned the trade from an old bowyer in Stormwind's Old Town and came out to Eastvale to be closer to the wood." } },
    advice = { { id = "tp_ad", text = "Unstring your bow at night, friend. A bow left strung too long forgets how to spring back." } },
    eastvale = { { id = "tp_eastvale", text = "It's a fair place, if you can stand the noise and Supervisor Raelen's ledger." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. If it isn't wood or string, I've likely never thought about it." } },
  },
}

-- Drake Lindgren: general and trade supplies, from a home on the camp's east side.
P:NPC {
  key = "lindgren", id = TODO_NPC("Drake Lindgren"), name = "Drake Lindgren", title = "General & Trade Supplies",
  bible = "bibles/eastvale_trades.md", role = "vendor", tier = "service",
  communities = { "eastvale" }, temper = { "shrewd" }, values = { "practical", "thrift" },
  notices = { "craft" },
  impression = {
    first = "Drake Lindgren sells everything a logging camp runs short of, from thread to throwing knives, and he knows the price of each to the copper. He seemed to like me better once I bought something.",
    third = "{name} met Drake Lindgren, who keeps Eastvale Logging Camp in general goods and trade supplies.",
  },
  greetings = {
    { id = "g_default", text = "Thread, flour, parchment, shot. If the camp needs it, I sell it." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Prices haven't changed since you left, more's the pity for me." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You're a tailor, I can tell by the needle calluses. I keep thread and dye on the back shelf, and Sara Timberlain buys most of it, so don't dawdle." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It runs short of everything eventually: thread, rope, nails and patience. Your spirits won't sell me any of that, so I'll stick to coin." } },
      choices = {
        { text = "Good stock keeps a camp running. That's worth paying for.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll find what I need elsewhere for less.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Honey, mostly, out of the hollow oaks they fell, and they squabble over who gets to break the comb. I pay them fair for it and sell it fair, though the bees, I'll grant you, never see a copper." } },
      choices = {
        { text = "Then leave the bees a tree or two. They've earned it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The bees will rebuild. Honey sells either way.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Food and linen, every time. They buy a sharpening stone and think that's them ready, and then they're out by the bears with an empty pack and a sharp sword they can't eat." } },
      choices = {
        { text = "I'll buy the linen and the bread, then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll buy the stone and take my chances.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Meat and bread, which your beast will eat, and that's about the end of it. Rallic next door will tell you which arrows fly straight, and I'll tell you which ones are cheaper, which isn't always the same thing." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} keeps looking at my dried meat. I've counted that as well, so you know." },
      },
      choices = {
        { text = "I'll pay for good arrows. A clean shot's worth the coin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take the cheap ones. A shot's a shot.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a man who overcharges a mage gets a reputation, and a man with a reputation for honesty sells everything else in the house. I'd rather lose your reagents than lose your trust." } },
      choices = {
        { text = "That's a fair way to keep a shop, Drake.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "You'd sell more if you just kept quiet about the tower.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd sell you rope and lamp oil like anyone else, but I won't stock anything for summoning, because the loggers already say the woods past the mill are haunted. I'd rather not give them any more reason to believe it." } },
      choices = {
        { text = "That's wise, Drake. Some things shouldn't be sold over a counter.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fear's bad for trade. You're losing coin to superstition.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I give, quietly, because if the loggers heard I'd given a family a sack of flour, I'd have a queue at the door by morning. There's a widow at the mill whose husband went under a falling oak in spring, and somehow her shelves never empty, though I'll swear I've no idea how." } },
      choices = {
        { text = "Quiet charity is the best kind. Bless you, Drake.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Charity makes beggars. You'd do better to let them work.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Drake.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Safe enough by day, but two of my carts were stopped near the Brackwell patch in spring, and the drivers came home with nothing but a story about red bandanas. The Marshal says he's spread thin, and I believe him, though I'd believe him better with a few soldiers on my road." } },
      choices = {
        { text = "The law must reach the roads too. Dughan should hear of this.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The law won't help you. Hire swords and settle it yourself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Drake.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I carry candles and I carry linen, and I'll sell you both at a fair price, which is a high price, because of the road." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll want oil for that plate, and I've plenty, counted, and I'll not ask what you've been smiting." },
        { id = "h_default", text = "Drake Lindgren, general and trade supplies. Everything in this house came up the road from Stormwind on a cart, so if you think the prices are high, blame the road." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "A gnome! I've nothing clever in stock, I'm afraid, but there's plenty of plain flux and thread if you're building something that won't explode." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Throwing knives are on the left, and I've counted them, so you know. It's nothing personal; I count everything." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you'll be wanting reagents, I suppose. I carry a few, but the tower charges less, which is the one thing I'll never say in front of a customer." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock in Eastvale. I'll tell you now that I don't carry anything your trade needs." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want a whetstone and some linen, and I've both, counted twice." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Arrows are on the right, shot on the left, and before you ask, I've counted those too." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Kaldorei, and a long way from the sea you crossed. I've never sold to one of your people before, so tell me what a druid runs short of and I'll see if the cart brings it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Totems need carrying, and I've packs for that. Buy something and we'll get along famously." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a cart to unload before dark." },
        { id = "h_again2", text = "Ask away. Talk costs nothing, which makes it the one thing in here I can't sell." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Loggers must go through a great deal of rope.", next = "loggers" },
        { text = "How do the carts fare on the road?", next = "road" },
        { text = "Who else should I know in Eastvale?", next = "camp" },
        { text = "Why would you send customers to the tower?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you sell to a warlock if you did carry it?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do warriors forget to buy before they leave Eastvale?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you sell anything for a hunter's beast?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "You seem the sort to give to the needy quietly, Drake.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'd guess the road from Stormwind is hard on your carts, Drake.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the loggers ever bring you anything besides wood?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "A logging camp must run short of everything, Drake.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Drake.", next = "END" },
      },
    },
    loggers = {
      lines = { { id = "l_default", text = "Rope, whetstones and bandages, in that order, and bread when the camp cook's in a mood. Sara Timberlain buys thread for her linen, and the guards buy shot and pretend it's for the wolves." } },
      choices = {
        { text = "What else would it be for?", next = "loggers_shot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loggers_shot = {
      lines = { { id = "ls_default", text = "Boredom, mostly. They shoot at bottles on the fence posts when Raelen isn't looking, and then they come back to me for more shot, so I've no complaints." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    road = {
      lines = { { id = "r_default", text = "Better since the marshals started paying adventurers to clear the hills, but a cart still goes missing now and then. Kobolds take the candles, of all things, and the Defias take whatever's left." } },
      choices = {
        { text = "Why don't you hire guards?", next = "road_guards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_guards = {
      big = true,
      lines = { { id = "rg_default", text = "Because a guard costs more than the cart's worth, and the Stormwind Guard is stretched thin enough already. Marshal Dughan says the crown will put more men on the roads, but I've heard that promise every spring." } },
      choices = {
        { text = "The crown will keep its word. Give it time.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then the camp should arm its own carts.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "Supervisor Raelen runs the camp and its quotas, Rallic Finn next door makes the bows, and the Hunters keep horses at the stables if you've the coin for one. Old Marshal Haggard lives in the manor to the south-east, though he doesn't come in much." } },
      choices = {
        { text = "Why doesn't the marshal come in?", next = "camp_haggard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_haggard = {
      lines = { { id = "ch_default", text = "His eyes are going, and he's proud, so he'd rather sit at home than squint at a crowd. He still sends down for pipe tobacco every week, and I still carry it up myself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My father kept a stall in Stormwind's Trade District, and I came out here because a camp full of hungry loggers has no other shop." } },
    advice = { { id = "tp_ad", text = "Buy your bandages before you need them, friend. Nobody haggles well while bleeding." } },
    defias = { { id = "tp_defias", text = "They've robbed two of my carts this year, and both times they left the parchment, which tells you how much reading they do." } },
    _none = { { id = "tp_none", text = "If it isn't on my shelves or in my ledger, friend, I'm afraid I can't help you." } },
  },
}

-- Terry Palin: a lumberjack at the camp's mill.
P:NPC {
  key = "palin", id = TODO_NPC("Terry Palin"), name = "Terry Palin", title = "Lumberjack",
  bible = "bibles/eastvale_trades.md", role = "worker", tier = "service",
  communities = { "eastvale" }, temper = { "jovial" }, values = { "hardworking", "loyal" },
  impression = {
    first = "Terry Palin works the mill at Eastvale and jokes about his supervisor the way men joke about the weather. Under the jokes he seemed proud of the work.",
    third = "{name} met Terry Palin, a cheerful lumberjack at the Eastvale mill.",
  },
  greetings = {
    { id = "g_default", text = "Mind the sawdust, friend; it gets everywhere and never comes out." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Come to watch an honest man work, or to keep him from it?" },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I joke about Raelen, but I'm proud of the work. The trees come down, the boards go up, and the kingdom gets built. Your spirits might see it differently." } },
      choices = {
        { text = "Honest work builds kingdoms, Terry. Be proud of it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Too many trees come down. The forest should be left alone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Every day, friend, for a spark in a sawmill takes the whole thing and the men in it besides. The wolves and bears ran the lads off the cut wood up north, so if you're handy with flame, aim it at them and not at my stacks." } },
      choices = {
        { text = "I'll be careful with fire near the mill.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little fire never hurt green wood. You worry too much.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Terry.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "More than I like to count, because Stormwind's always building something and Raelen's always promising it beams by Tuesday. Last spring I counted the rings on one old oak and stopped at two hundred, and I didn't feel much like joking for the rest of the day." } },
      choices = {
        { text = "Plant an acorn for every oak, the way your mother did.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "The city needs beams. Old oaks can't stand forever anyway.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "With an axe, once, and I don't recommend it, because an axe for trees isn't an axe for bears. I ran, and the bear ate my lunch, and Raelen docked me the morning anyway." } },
      choices = {
        { text = "Next time I'll stand between you and the bear.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Running was smart. I'd have done the same.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Terry.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bad enough that the lads won't go past the ridge without three of them together. The wolves aren't much better, mind, but the bears are the ones that sit on a bundle and won't give it back." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} looks like it could take a bear by itself. Could you lend it to me for a day?" },
      },
      choices = {
        { text = "I'll clear the bears so your lads can work.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll hunt the bears for their hides, not your lads.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Around these loggers, yes, because they've been jumpy since the Defias started cutting our timber at night and selling it in Westfall. A man with an axe and a fright is the most dangerous thing in this camp." } },
      choices = {
        { text = "Then I'll announce myself next time. Your safety matters.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll go where I like as quietly as I like.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because Supervisor Raelen counts every beam, and if anything strange happens near the saw, it's my back he takes it out of. I've nothing against you personally, but I've a great deal against my back." } },
      choices = {
        { text = "Then I'll stand well clear of the saw, for your back's sake.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your back isn't my concern. I'll go where I please.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "My old ma used to, every spring, and she'd plant an acorn for every oak my father felled. I don't do it myself, but I leave the youngest trees standing, and if that's a prayer then I've been saying it for twenty years." } },
      choices = {
        { text = "That's a prayer, Terry, and a good one.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Trees are for cutting. Stormwind needs beams, not acorns.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Terry.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Real enough that the lads won't go back for the bundles, and I can't say I blame them, because I saw one open a man's arm to the bone last week. Raelen says it's the wolves pushing them down, and something's pushing the wolves, and I'd rather not know what." } },
      choices = {
        { text = "I'll go north myself, so your lads needn't.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The lads take wages for danger. Let them earn them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Say a word for my back, would you? It's past saving, but a word can't hurt." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You've the arms for an axe, friend, though I suppose you'd rather swing at something that swings back." },
        { id = "h_default", text = "Terry Palin, and before you ask, yes, I've been cutting trees since I could lift an axe. This mill turns Elwynn's oaks into beams for Stormwind, and I turn my back into knots doing it." },
        { id = "h_bundle", when = { questActive = TODO_QUEST("A Bundle of Trouble") }, text = "Out gathering the bundles we left in the woods? Bless you, because I'm not going back for them with the bears out there, and Raelen knows it." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "You've shoulders for this work, friend. If you ever tire of the sword, Raelen pays every week and the bears only bite now and then." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "By the Light, you're bigger than the logs! Don't take it the wrong way, but I'd pay good silver to see you carry a beam." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You came in so quiet I nearly put my axe through you thinking you were a stump. Make a noise next time, will you?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "There's a chill come in with you that I don't like, and it's not the weather. Keep your distance from the mill, if you would." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Are you here for the bears? Say you're here for the bears, because I've a stack of bundles out in the woods with my name on them." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf in a logging camp, and I can see by your face what you think of all these stumps. I'll not argue, but I'll tell you I leave the young ones standing." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Don't set any fires near my timber, because I've worked too hard on those beams to watch them go up in a flash." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Can your spirits make the supervisor smile? Because nothing else has worked." },
      },
      again = {
        { id = "h_again", text = "What else? I'm meant to be stacking, so ask quickly." },
        { id = "h_again2", text = "Go on, I've a minute before Raelen counts the pile again." },
      },
      choices = {
        { text = "What's Supervisor Raelen like?", next = "raelen" },
        { text = "All this wood must be bound for Stormwind.", next = "wood" },
        { text = "Why did the crews leave wood in the forest?", next = "bundles" },
        { text = "I know this work. I was a woodsman here.", next = "woodsman", when = { origin = "human_eastvale_woodsman" } },
        { text = "Should a rogue really make noise around loggers?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why keep a warlock away from the mill?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You look like you've fought off a bear or two yourself.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The bears around the mill seem to be getting bold.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does anyone pray for the woods you cut, Terry?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "The bears up north sound like a real danger, Terry.", next = "xapala", when = { class = "PALADIN" } },
        { text = "How many trees does the mill take in a season?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you worry about fire at the mill, Terry?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "You seem to like working the mill, for all your grumbling.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Back to work with you.", next = "END" },
      },
    },
    raelen = {
      lines = { { id = "r_default", text = "Strict as a sawblade and twice as sharp, but she's never once short-changed us on pay. Stormwind sets her a quota, and she counts every log because they count every log she sends." } },
      choices = {
        { text = "Does she ever ease up?", next = "raelen_ease" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raelen_ease = {
      lines = { { id = "re_default", text = "Once a year, at harvest, she lets us finish an hour early. The rest of the time she says the city's waiting on us, and the trouble is, she's right." } },
      choices = {
        { text = "A firm hand keeps the camp fed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Nobody should be worked that hard.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "Down the road to Stormwind, mostly, for the rebuilding. Half the city still wants new roofs and walls after the orcs burned it, and every beam in them started out here." } },
      choices = {
        { text = "Do the masons pay you for it?", next = "wood_masons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_masons = {
      big = true,
      lines = { { id = "wm_default", fx = { learn = { "stonemasons" } }, text = "The crown pays Raelen, and Raelen pays us. The stonemasons weren't so lucky, from what I hear; they built half the city and the nobles wouldn't pay them for it, and some of them went off to Westfall angry." } },
      choices = {
        { text = "The nobles cheated honest workers. That's a crime.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Angry or not, turning outlaw was their choice.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bundles = {
      lines = { { id = "bu_default", text = "Because the wolves and bears got bold and came right up to the cutting, and a man drops his bundle quick when there's a bear behind it. Raelen asked Deputy Rainer for help, but Westbrook has its own troubles." } },
      choices = {
        { text = "I hope none of the crew were hurt.", next = "bundles_hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bundles_hurt = {
      lines = { { id = "bh_default", text = "Scratches and one broken arm, and one of the younger lads won't go past the treeline without a torch now, even at noon. I don't laugh at him, since I ran just as fast." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    woodsman = {
      lines = { { id = "ws_default", text = "Then you'll remember the old foreman's rule, that you never fell a tree you haven't walked around twice. Raelen hasn't changed it, though she's changed nearly everything else." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Eastvale born, Eastvale raised, and I expect I'll be Eastvale buried, under a very good oak." } },
    advice = { { id = "tp_ad", text = "Never stand downhill of a falling tree, and never stand near Raelen when the count comes up short." } },
    eastvale = { { id = "tp_eastvale", text = "It's loud, it's honest work, and the supper's hot. A man could do worse." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. Ask me about trees and I'll talk all day." } },
  },
}
