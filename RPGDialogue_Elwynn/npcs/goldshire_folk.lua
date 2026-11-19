-- Goldshire's everyday people: the inn's staff, the shops, the stables, the cellar, and the
-- trainers by Crystal Lake. Short voices for short visits. Voice notes: bibles/goldshire_folk.md
-- (Almost nothing is known about most of them beyond their trade; they're built from it.)
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST


-- Barkeep Dobbins: pours at the Lion's Pride; Farley shouts for him a lot.
P:NPC {
  key = "dobbins", id = TODO_NPC("Barkeep Dobbins"), name = "Barkeep Dobbins",
  bible = "bibles/goldshire_folk.md", role = "innkeeper", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "witty" }, notices = { "drink", "lock_shadow" },
  impression = {
    first = "He says the real work of a barkeep is forgetting.",
    third = "{name} was served at the Lion's Pride by Barkeep Dobbins, who hears everything and claims to forget it all.",
  },
  greetings = {
    { id = "g_op_refugees", when = { gossip = { topic = "westfall_refugees", stance = "trouble" } }, text = "Falkhaan says you reckon the Westfall folk bring trouble. Well, the trouble last night was a Goldshire man, so keep your eye on the bar as well as the road." },
    { id = "g_op_varian", when = { gossip = { topic = "varian", stance = "alive" } }, text = "Marshal Dughan says you reckon the king's alive. I'll pour to that, and so will half the room, if you'll say it loud enough." },
    { id = "g_pour", text = "What'll it be? The ale's good, and the ale's always good, but don't ask about the wine." },
    { id = "g_regular", when = { timesTalked = { min = 5 } }, text = "The usual? I'll pretend I remember what that is." },
  },
  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Farley says it's water for you, and I always do what Farley says, mostly. Here you are, then: water, and very good water it is." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The candles along the bar have all leaned away from you like there's a draught, and there's no draught in here, because I've checked. Sit where you like, but I'll pour your ale before the barrels start whispering again." },
  },
  start = "hello",
  nodes = {
    dd_hogger = {
      lines = {
        { id = "dd_hogger_a", text = "I'd heard as much, and I'll tell you true, half the hunters who've drunk here this year went after that gnoll and came back on a cart. What was he like, up close?" },
      },
      choices = {
        { text = "Big, mean and smarter than a gnoll should be.", next = "dd_hogger_2" },
        { text = "He went down like any other beast. The stories were overblown.", next = "dd_hogger_2", fx = { align = { honor = -1 } } },
        { text = "I had help. The credit belongs to everyone who fought.", next = "dd_hogger_2", fx = { align = { honor = 1 } } },
      },
    },
    dd_hogger_2 = {
      lines = {
        { id = "dd_hogger_2a", text = "Well, however it went, the farmers south of town can bring their sheep in without a guard now, and that's worth more than a story. I'll be telling yours for a month, mind, and it'll get bigger every time." },
      },
      choices = { { text = "Tell it well, then. Something else.", next = "BACK" } },
    },

    xpt_dobbins = {
      big = true,
      lines = { { id = "xpt_dobbins_default", text = "Same as keeping a tavern together, friend: pour the first round yourself, and never ask anyone how the last job went until they've finished their drink. The companies that last are the ones that know when to stop talking about the dead." } },
      choices = {
        { text = "Better to talk about the dead. That's how we honour them.", next = "BACK", reply = "Maybe you're right, and I've heard some fine toasts to the fallen in this very room. Only wait till the cups are full, friend, because grief goes down easier with something to wash it.", fx = { align = { honor = 1 } } },
        { text = "You're right. Some things are better left in the cup.", next = "BACK", reply = "There's some sense in that, and I've poured a lot of quiet rounds for companies that came back short. Drink up, and say what you like when you're ready.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I forget everything folk say after the third mug. A barkeep's work is forgetting, and I'd wager a shaman remembers far too much." } },
      choices = {
        { text = "A barkeep who keeps secrets is a good one, Dobbins.", next = "BACK", reply = "Kind of you to say, and I'll take it as a compliment to the trade. Whatever you tell me tonight, I'll have forgotten by breakfast.", fx = { align = { honor = 1 } } },
        { text = "Some things should be remembered, Dobbins.", next = "BACK", reply = "Maybe so, but not by me, because I'd never sleep a wink. Tell them to the priests and leave a barkeep his peace.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Quiet, polite and forever asking for more candles, which Farley grumbles about and I fetch anyway. Once a frost spell got loose up there and the ale in the cellar went cold for a week, and nobody's complained about anything since." } },
      choices = {
        { text = "Cold ale for the whole room? That's a good use of magic.", next = "BACK", reply = "Ha, that's what the regulars said too, once they'd stopped shivering. I'd not mind if it happened again in summer.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "He should keep his spells to his own room.", next = "BACK", reply = "Farley says the same, and loudly, but I'll not be the one to tell a mage what to do. I just fetch the candles.", fx = { align = { order = 1 } } },
        { text = "Something else, Dobbins.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The dwarves, nearly always, and the warriors fresh from Northshire never believe it until they're on the floor. The clever ones buy the dwarf a drink instead and hear about Dun Morogh till closing." } },
      choices = {
        { text = "I'd buy the dwarf a drink and listen.", next = "BACK", reply = "That's the clever choice, and you'll hear a fine tale about Ironforge for the price of one mug. The dwarf might even buy the second.", fx = { align = { order = 1 } } },
        { text = "I'd wrestle him, and I'd win.", next = "BACK", reply = "I've heard that before, usually right before somebody hits my floor. I'll keep a bucket ready, friend.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Longer ones, but not better, because a farmer's wolf took his lamb and that's a story with teeth in it. Hunters tell you how big the wolf was, and it grows a hand every round I pour." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Longer ones, but not better, because a farmer's wolf took his lamb and that's a story with teeth in it. And your {pet}'s been eyeing the cheese on the bar, which I'll pretend I didn't see, once." },
      },
      choices = {
        { text = "I'll tell it straight, wolf and all.", next = "BACK", reply = "Then you'll be the first hunter to manage it, and I'll pour you an honest round for the novelty. Go on, then.", fx = { align = { honor = 1 } } },
        { text = "A good story needs a bigger wolf.", next = "BACK", reply = "That's the spirit of the trade, and I'll pour you one for honesty about your dishonesty. Mind the wolf doesn't outgrow the room.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I do when Farley's watching, and when he isn't I pour you a drink and trust you to leave the cutlery. It's worked so far, and I'd like it to keep working." } },
      choices = {
        { text = "Then I won't give you cause to count, Dobbins.", next = "BACK", reply = "Good, and I'll pour you a proper measure for saying it. Leave the spoons where they lie and we'll get on fine.", fx = { align = { honor = 1 } } },
        { text = "Trust is cheap, Dobbins. You'd better keep counting.", next = "BACK", reply = "You're probably right, and Farley would agree, though I'd rather not. I'll count, but I'll count kindly.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "It troubles me when the ale barrels go cold in midsummer, which they do more than they should, and I'd swear one of them whispered once. Farley says not to ask, so I don't, but I pour quicker on the nights it whispers." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "It troubles me when the ale barrels go cold in midsummer, and I'll swear the one behind me went cold the moment your demon came through the door. Farley says not to ask, so I won't, but I'd thank you to keep it away from the taps while I pour." },
      },
      choices = {
        { text = "I'll make sure nothing below disturbs your barrels again.", next = "BACK", reply = "Would you? I'd be grateful, though I'll not ask how you'll manage it. I just want my barrels warm and quiet.", fx = { align = { light = 1 } } },
        { text = "A little whispering never hurt anyone. Pour and don't ask.", next = "BACK", reply = "Easy to say when it's not your cellar, friend. I'll keep pouring, but I'll pour faster on whispering nights.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I think you're welcome in the Lion's Pride, same as anybody. I'd only ask you not to turn into anything too large, because the floorboards are old." } },
      choices = {
        { text = "I'll keep my shape. It's your house.", next = "BACK", reply = "That's good of you, and the floorboards thank you too. Sit wherever you like, in whatever shape you came in.", fx = { align = { order = 1 } } },
        { text = "No promises. The bear does as it likes.", next = "BACK", reply = "Then I'll ask the bear to sit near the door, if it's all the same. Farley will have my hide if the floor goes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "All the time, more than to any priest, I'd wager, because a barkeep doesn't make you kneel first. I listen and I pour and then I forget, though there are a few things I wish I could forget faster." } },
      choices = {
        { text = "Listening is its own kind of mercy, Dobbins.", next = "BACK", reply = "I'd never thought of it like that, but I'll take it, and gladly. Maybe the Light keeps a stool at the bar after all.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Forgetting what men confess helps nobody, Dobbins.", next = "BACK", reply = "Maybe not, but it helps me sleep, and it helps them come back. If they want judging, they can walk to the Abbey.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not trouble, exactly, only a feeling, because there are folk going down to the cellar who never come up for an ale. Farley says it's storage, and I'm a barkeep, so I pour and I don't ask, but I'd sleep better with a paladin upstairs." } },
      choices = {
        { text = "Darkness under an inn should be rooted out.", next = "BACK", reply = "I'd not stop you, though I'd not want to be the one who showed you the stairs. Farley would never forgive me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Folk can keep their own cellars. It's no crime.", next = "BACK", reply = "That's what Farley says, and I'd like to believe you both. I'll pour and keep my questions in my pocket, then.", fx = { align = { order = -1 } } },
        { text = "Something else, Dobbins.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_hogger", tags = { "news" }, when = { killed = { name = "Hogger" } },
          text = "Farley's been telling the bar all night that Hogger's dead, and for once I've seen the proof, because Dughan pinned a great grey claw to his board. You'll not pay full price for your talk at this bar tonight, friend, only for the drink." },
        { id = "dd_necklace", when = { questDone = TODO_QUEST("Lost Necklace") },
          text = "Auntie Bernice was in to say she has her necklace back and Billy Maclure didn't steal it after all. She didn't say sorry to the boy, mind, but she did buy him a pie, which is the Stonefield way of saying it." },

        { id = "h_pt_dobbins", tags = { "news" }, when = { party = true },
          text = "A table for the lot of you, then? Sit where you like, but I'd keep away from the corner by the stairs, because the folk who sit there tend to be the sort who leave without paying." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You'll want water, I'd guess, or a quiet corner, and we've one of each, though the corner's damp." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Sit near the door, if you would, because the rowdy ones settle when there's plate in the room." },
        { id = "h_default", key = true, text = "I'm Dobbins. When Farley shouts my name I fetch, and when he doesn't I pour, and it's a good life." },
        { id = "h_farley", when = { heardLine = "farley.h_default" },
          text = "Farley told you the family's never watered a drink? It's true; I've seen him check, holding the mug up to the lamp." },
        { id = "h_armwrestle", when = { metBefore = true }, text = "Lively night last night: a lad fresh from Northshire tried to arm-wrestle a dwarf. The dwarf's still at the bar, and the lad's still under it." },
        { id = "h_forget", when = { metBefore = true }, text = "People think a barkeep hears everything, and I do, but then I forget it. That's the real job, the forgetting." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "This is the hour the farmers come in, and the adventurers start telling lies about wolves. The farmers tell better lies." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! I've never served one of your lot before, so you'll tell me if you want something other than ale." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Farley says count the spoons when your sort comes in, so I'll count them, but I'll count them slowly so you know I'm not in a hurry about it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You'll be wanting the cellar stairs, I suppose, and I'll tell you what I tell everyone: Farley calls it a storeroom, and so do I." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You're not the one who wants to arm-wrestle the dwarf, are you? Because I've only the one bucket." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Farley lets beasts by the hearth, but if it drinks from the slop bucket, that's on you." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Zaldimar's upstairs, if you're looking for him, and he takes his tea strong and his visitors quiet." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Sit down, and whatever your spirits told you today, I'll help you forget it." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've three mugs to fill and one to find." },
        { id = "h_again2", text = "Go on, lean on the bar, only not that end, because it wobbles." },
      },
      choices = {
        { text = "I'm the one who put Hogger down, Dobbins.", next = "dd_hogger", when = { killed = { name = "Hogger" } } },

        { text = "What do you think of druids?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You must hear all the news behind this bar.", next = "news" },
        { text = "What's good to drink?", next = "drinks" },
        { text = "Pour me something.", next = "BUSINESS" },
        { text = "Do you really count the spoons for every rogue?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What goes on beneath the inn must trouble you.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I'd wager the dwarves win most of the arm-wrestling here.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters tell better wolf stories than the farmers?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd wager folk confess more to a barkeep than a priest, Dobbins.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is there trouble in the inn I should know about?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What's Zaldimar like as a lodger, Dobbins?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do you forget most, Dobbins?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "What's the secret to keeping a company together?", next = "xpt_dobbins", when = { party = true } },
        { text = "Not tonight.", next = "END" },
      },
    },
    news = {
      lines = {
        { id = "n_westfall", text = "Westfall folk keep passing through on their way to Stormwind. They don't say much, and they don't need to; you can see it on them." },
        { id = "n_dughan", text = "Marshal Dughan comes in now and then for one cup, which he makes last an hour while he watches the door the whole time." },
      },
      choices = {
        { text = "There's bound to be a Defias or two in here.", next = "news_defias" },
        { text = "Thanks, Dobbins.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    news_defias = {
      lines = {
        { id = "nd_default", text = "Not in red, they're not, but plenty of folk drink here I wouldn't trust with a spoon. I pour for them anyway, and count the spoons." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } } },
    },
    drinks = {
      lines = {
        { id = "dr_default", text = "Ale, every time, though the cider's honest. The wine's young, and so is everybody who orders it." },
      },
      choices = {
        { text = "Ale, then.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = {
      { id = "tp_knows", text = "Behind this bar I hear every rumour in Goldshire, usually three times, and louder each time. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I've poured at the Lion's Pride for years. Farley does the talking and I do the lifting." } },
    advice = { { id = "tp_ad", text = "Drink one water for every ale; that's Farley's rule, and he doesn't follow it either." } },
    lions_pride = { { id = "tp_inn", text = "Best inn in Elwynn, and near enough the only inn in Elwynn, but still the best." } },
    _none = { { id = "tp_none", text = "Ask Farley. He hears it all; I just hear him." } },
    defias = { { id = "tp_defias", text = "Westfall folk talk about the Defias like bad weather, the kind that steals your plough and your boots." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Faire's in town I pour until my arms ache, and Farley does the talking, same as ever, only louder. You'd not believe how much a juggler drinks." } },
    booty_bay = { { id = "tp_booty_bay", text = "A sailor from Booty Bay told me there's a tavern on the docks where the goblins water the rum twice. I don't water ours at all, which makes me a saint by comparison." } },
    scourge = { { id = "tp_scourge", text = "A fellow at the end of the bar used to talk about the plague every night, until Farley quietly paid his tab and sent him on his way. Nobody wanted to hear it, me included." } },
    varian = { { id = "tp_varian", text = "There was a wager chalked on the board behind the bar about when the king comes home, and Farley rubbed it out the day a guard read it. He was right to, I suppose." } },
  },
}

-- Brog Hamfist: general supplies, inside the inn.
P:NPC {
  key = "brog", id = TODO_NPC("Brog Hamfist"), name = "Brog Hamfist", title = "General Supplies",
  bible = "bibles/goldshire_folk.md", role = "vendor", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "honest" }, notices = { "lock_shards" },
  impression = {
    first = "He seemed quite certain I'd forgotten to pack something.",
    third = "{name} met Brog Hamfist, Goldshire's seller of rope, flint and the bags adventurers always need more of.",
  },
  greetings = {
    { id = "g_stock", text = "Rope, flint, flasks and thread, everything you forgot to pack." },
    { id = "g_new", when = { maxLevel = 6 }, text = "Fresh out of Northshire, are you? You'll want more bags than you think; everyone does." },
  },
  notice = {
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 5 } },
      text = "That bag of yours clinks like a purse full of cold coins, and I'll wager they're not coins. Your lot pay well enough, so I'll not ask what's inside them." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They forget rope, and a spare torch, and common sense. Your spirits might help with the last one, but I've rope for the rest." } },
      choices = {
        { text = "Preparation saves lives, Brog. I'll buy what I need.", next = "BACK", reply = "Now there's a sensible customer, and you'll be glad of the rope before Fargodeep's done with you. Pick out a good coil.", fx = { align = { order = 1 } } },
        { text = "I'll find out at midnight. That's the fun of it.", next = "BACK", reply = "Half the fun until the torch gutters and you're feeling for the wall. I'll keep a coil behind the counter for when you come back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Candles by the box, chalk, and once a whole sack of salt, which I didn't ask about. I don't care what folk do in the cellar, but I do care that they pay, and your lot always pay, while the adventurers upstairs run up a slate and vanish to Westfall." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Candles by the box, chalk, and once a whole sack of salt, which I didn't ask about, and none of them ever brought their demon up to the counter like you have. I don't care what it is so long as it doesn't touch the stock, because your lot always pay, and I'd hate to start charging for scorch marks." },
      },
      choices = {
        { text = "A fair trader. I'll keep paying, Brog.", next = "BACK", reply = "Glad to hear it, because that's all I ask of anyone. What you do with the chalk is between you and the cellar.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If you don't care, I'll stop paying full price.", next = "BACK", reply = "Not caring isn't the same as being soft, friend. Full price, or the candles stay on the shelf.", fx = { align = { honor = -1 } } },
        { text = "Something else, Brog.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because nobody knows where to look by the third week of winter, and that's when they all come to me. Forage all you like in summer, but I'll keep a sack of flour on the shelf for when you change your mind." } },
      choices = {
        { text = "Keep the flour, then. A careful traveller plans for winter.", next = "BACK", reply = "Wise words, and I'll keep a sack with your name on it come the first frost. The forest goes very quiet in deep winter.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd sooner trust the forest than a sack of flour.", next = "BACK", reply = "The forest's fine company till the snow falls, friend. When it does, you'll know where to find me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Torches, linen and rope, and always after a fight, never before one. If they'd buy them first, there'd be fewer kobolds in Fargodeep and more warriors with both eyebrows." } },
      choices = {
        { text = "I'll buy what I need before the fight.", next = "BACK", reply = "At last, a warrior with some sense in the pack! You'll keep both eyebrows and I'll keep a customer.", fx = { align = { order = 1 } } },
        { text = "I'll buy it when I find out I need it.", next = "BACK", reply = "They all say that, and they all come back singed. The torches are on the left when you do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Rope and flint and salt for the hides, sacks of it. A hunter who forgets the salt comes back with a stink and nothing to sell, and I've smelt that on this porch more than once." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} will want feeding before you do. I've dried meat at the back, if it's not fussy." },
      },
      choices = {
        { text = "I'll salt what I take and waste none of it.", next = "BACK", reply = "That's the way, and I'll sell you salt enough for the season. A hunter who wastes nothing is good for everybody's trade.", fx = { align = { honor = 1 } } },
        { text = "I'll take the best pelts and leave the rest.", next = "BACK", reply = "And leave the porch smelling of what's left, no doubt. Salt what you keep, at least, so nobody has to smell it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every day, because the Defias didn't get their gear out of thin air, and I'd hate to find my rope hanging off a farmhouse window. But a merchant who asks too many questions doesn't stay a merchant for long, so I count coin and hope." } },
      choices = {
        { text = "Then I'll make sure your rope stays on honest work.", next = "BACK", reply = "I'd sleep better for hearing that. A coil of my rope on a farmhouse window would sit badly with me.", fx = { align = { honor = 1 } } },
        { text = "Questions are bad for trade. You're right not to ask.", next = "BACK", reply = "Glad you see the sense in it, though I'd rather you hadn't agreed so quickly. I'll count your coin and not ask after it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some do, but every one I've met says conjured bread tastes like nothing at all, and sooner or later they come back here for a real loaf with a proper crust. I count on it, and so does my rent." } },
      choices = {
        { text = "Real bread for real work. I'll pay you fair.", next = "BACK", reply = "That's what keeps the roof on, and I thank you for it. A loaf with a crust is worth the walk, you'll see.", fx = { align = { order = 1 } } },
        { text = "Conjured bread fills the belly. Your shop's a luxury.", next = "BACK", reply = "It fills it, but it doesn't satisfy, and you'll be back. They all come back, friend, sooner or later.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Everyone, eventually, but the ones who worry me are the Westfall folk who buy one roll and make it last a fortnight. I'd give them more, only they won't take it, so I've started putting an extra roll in the bag and charging for one." } },
      choices = {
        { text = "That's a good deed, Hamfist, whatever you call it.", next = "BACK", reply = "I call it bad bookkeeping, and you'll not tell anyone, will you? It's nice to know somebody noticed.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You run a shop, not an almshouse. Charge for both.", next = "BACK", reply = "Spoken like my ledger, which also never shuts up. I'll keep doing it all the same, and you'll keep quiet about it.", fx = { align = { light = -1 } } },
        { text = "Something else, Hamfist.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Rations for someone else, mostly, because your lot always end up feeding whoever you've just rescued. I sold a paladin three days' bread last month, and he came back next morning for six more, with two farm boys trailing behind him." } },
      choices = {
        { text = "Then I'll buy extra. Someone will always need it.", next = "BACK", reply = "Then you're cut from the same cloth as the last one, and I'll stock up accordingly. I'd best order more flour.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll buy for myself. Rescued folk can feed themselves.", next = "BACK", reply = "Some can, I suppose, though the farm boys looked very glad of that bread. Your rations are on the second shelf.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll want candles and bandages, and I've both, because your sort always runs out of the second before the first." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll want rope too, I expect, because everybody does, and nobody tells me why." },
        { id = "h_default", text = "I'm Brog Hamfist. If an adventurer needs it and it isn't a sword, I've probably got it, and if I haven't, I'll have it next week." },
        { id = "h_rope", when = { metBefore = true }, text = "I sold six coils of rope yesterday, six, and nobody ever tells me what they're climbing." },
        { id = "h_flint", when = { metBefore = true }, text = "Adventurers always buy the flint last, and then they're back at midnight, because they forgot the flint." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The shop stays open as long as the inn does. Someone always needs a torch at this hour." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Rope, grappling hooks and black cloth by the yard: I sell it to everyone, and I don't ask what it's for." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. You'll be wanting water and bread, because your lot always forget to eat, and I sell plenty of both." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want rope, I'd guess, and you won't tell me what for; nobody does." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Rope for snares, flint for the fire, and a sack for whatever you bring back, I'd guess." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf, and you look like someone who lives off berries and moonlight. Everyone forgets something, though, so take a look round before you go." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I sell rope, flour and the like, and I sell them to Maximillian Crowe's lot same as anyone, though they buy more candles than seems healthy." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and you've forgotten something, I'd wager, rope or water most likely, because your spirits won't pack for you." },
      },
      again = {
        { id = "h_again", text = "Anything else? Can I interest you in bags? You'll need more than you think." },
        { id = "h_again2", text = "Go on; I'm only counting candles." },
      },
      choices = {
        { text = "What do adventurers forget most?", next = "forget" },
        { text = "What should I pack for the road?", next = "road" },
        { text = "Let me see.", next = "BUSINESS" },
        { text = "You must wonder who's buying all your rope.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Mages can simply conjure their own water and bread.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do warriors buy from you, Hamfist?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I doubt hunters buy much from a general store.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Who buys the most bandages from you, Hamfist?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does a paladin carry that others forget, Hamfist?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why buy food when the forest feeds anyone who knows where to look?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What do Crowe's students buy from you, Brog?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Adventurers always seem to forget something, Brog.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just looking.", next = "END" },
      },
    },
    forget = {
      lines = {
        { id = "f_water", text = "Water, every time: three swords and not a drop to drink. Then they drink from the lake and come back for something for their stomach." },
      },
      choices = {
        { text = "And after water?", next = "forget_more" },
        { text = "I'll take some water.", next = "BUSINESS" },
      },
    },
    forget_more = {
      lines = {
        { id = "fm_default", text = "Bags, then rope, and then they come back for more bags, because the rope's taking up the bag." },
      },
      choices = { { text = "Noted.", next = "BACK", fx = { affinity = 1 } } },
    },
    road = {
      lines = {
        { id = "r_default", text = "Flint, water, a spare torch, and thread to mend what the wolves chew. And bags, always more bags than you think." },
      },
      choices = {
        { text = "Let me see the bags.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I sell things from behind this counter, in this inn, and that's the lot." } },
    advice = { { id = "tp_ad", text = "Buy the flint first, and then you can't forget it." } },
    _none = { { id = "tp_none", text = "I don't sell that, and I don't know that." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire buys flint and twine by the crate, and they pay on time. That's all I know about them, and it's all I need." } },
    scourge = { { id = "tp_scourge", text = "A fellow from the north bought every torch I had and wouldn't say why. I didn't ask him twice, because of his eyes." } },
    holy_light = { { id = "tp_holy_light", text = "I pray when the stock's late, same as anyone. The Light's never brought the wagon any faster, but I keep asking." } },
  },
}

-- Toddrick: the butcher, inside the inn.
P:NPC {
  key = "toddrick", id = TODO_NPC("Toddrick"), name = "Toddrick", title = "Butcher",
  bible = "bibles/goldshire_folk.md", role = "vendor", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "honest" }, notices = { "lock_pact" },
  impression = {
    first = "He warned me off the wolf meat, even his own.",
    third = "{name} met Toddrick, the butcher at the Lion's Pride, who takes great pride in his sausages and none in wolf.",
  },
  greetings = {
    { id = "g_cut", text = "The best cuts in Goldshire; ask anyone, though don't ask the boars." },
  },
  notice = {
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "You're flushed like a man with a fever, and your blood's running hot enough that I can see the vein at your neck. Meat spoils near heat like that, so stand back from the hooks while we talk." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It's stringy and sour, and the wolves here eat worse than the farmers do. A shaman would say the beast's spirit was bitter, and I'd not argue." } },
      choices = {
        { text = "Thanks for the honest warning, Toddrick. I'll take the pork.", next = "BACK", reply = "Smart choice, and the pork's good this week, from a farm east of the river. You'll not regret it.", fx = { align = { honor = 1 } } },
        { text = "Wolf meat's fine. You're too picky.", next = "BACK", reply = "Then you're welcome to it, but I'll not be the one to sell it. Come back after a week of stomach trouble and tell me I'm picky.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It could, and it'd help no end, because a joint that turns before Farley can cook it is a joint we've thrown away. Mind, I'd need someone to cast it every morning, and I don't know a mage who gets up that early." } },
      choices = {
        { text = "I'll leave a chill on it before I go.", next = "BACK", reply = "That's decent of you, and Farley will think it's his own good luck. I'll not tell him otherwise.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I've better uses for my spells than your larder.", next = "BACK", reply = "I'm sure you have, friend, and I'd not ask you to waste them. I'll keep salting, same as always.", fx = { align = { honor = -1 } } },
        { text = "Something else, Toddrick.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every beast and every farm, because I buy from the folk east of the river and a couple of hunters I trust. I don't take wolf, whatever anybody tells you, because a wolf that's been eating carrion makes a man sick for a week." } },
      choices = {
        { text = "Good. A butcher who knows his beasts wastes less of them.", next = "BACK", reply = "That's my thinking exactly, and I'll take it as a compliment from someone who knows the woods. Nothing wasted, nothing wrong.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Meat's meat. Folk shouldn't ask where it comes from.", next = "BACK", reply = "Folk should ask, friend, and I'll always tell them, because that's how a butcher keeps his customers alive.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The best, because they eat like a garrison and don't ask where it came from. Feed a fighter well before a march and he'll hold a line all day, and that's not cooking, that's sense." } },
      choices = {
        { text = "Then I'll eat well and march farther.", next = "BACK", reply = "That's the way, and I've a cut of Stonetusk that'll carry you to Westfall and back. Eat up.", fx = { align = { order = 1 } } },
        { text = "I fight better hungry. It keeps me sharp.", next = "BACK", reply = "Sharp, and then flat on your back by noon, I'd wager. Eat something, for my sake if not yours.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "If it's a Stonetusk and it was killed clean, yes, and gladly. A boar that's been run half across Elwynn before it drops is tough as a boot, so take it quick or don't bring it to me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "If it's a Stonetusk and it was killed clean, yes, and gladly. That {pet} of yours looks like it knows good meat, so keep it off my chopping block and we'll stay friends." },
      },
      choices = {
        { text = "I'll take them quick and clean, for the meat's sake.", next = "BACK", reply = "Good, and I'll pay you the fair price for every one. A clean kill makes clean meat.", fx = { align = { honor = 1 } } },
        { text = "I'll run them down however I like. Meat's meat.", next = "BACK", reply = "Then you'll be eating it yourself, because I'll not buy boot leather. Do as you like, friend, but don't bring it here.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not every one, but the last one who came through took a whole ham and blamed it on a dog, and I've never seen a dog carry a ham that neatly. You can see why I'm a little careful." } },
      choices = {
        { text = "I'll pay for any ham I eat, Toddrick.", next = "BACK", reply = "I'll take your word for it, and I'll still keep an eye on the hams. It's nothing personal, friend.", fx = { align = { honor = 1 } } },
        { text = "If a ham walks off, that's the butcher's lookout.", next = "BACK", reply = "That's exactly what the last one said, right before the dog story. I'll be watching you, then.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Only when the meat goes off a day early, which it does more often than it should down at this end of the street. Farley says the cellar's damp, but damp doesn't turn beef grey overnight." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Only when the meat goes off a day early, which it does more often than it should down at this end of the street. Your servant's been eyeing my hooks since it came in, and I'd swear the beef nearest it has gone grey already, so I'll ask you to step back from the counter." },
      },
      choices = {
        { text = "I'll see whatever's spoiling your meat is dealt with.", next = "BACK", reply = "I'd be grateful for that, whatever it is you'll be doing. Just don't tell me about it.", fx = { align = { light = 1 } } },
        { text = "A little spoiled beef is the price of power nearby.", next = "BACK", reply = "Not my power, though, and not my beef. I'll keep complaining to Farley until something changes.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The bones go to the Abbey for soup, and the rest goes to whoever's waiting at the back door, which is more folk every month since Westfall went bad. Farley thinks I sell them to a tanner, and I let him." } },
      choices = {
        { text = "Your back door does more good than many sermons.", next = "BACK", reply = "That's kind of you, and you'll keep it quiet from Farley, I hope, or he'll start counting the bones.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Scraps should be sold. Charity won't keep your cleavers sharp.", next = "BACK", reply = "Maybe not, but my cleavers stay sharp enough, and those families stay fed. I'll sleep fine either way.", fx = { align = { light = -1 } } },
        { text = "Something else, Toddrick.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The gnolls took two of the Brackwells' hogs last week, right out of the pen, and left the gate open on purpose, I swear it. Riverpaw, Marshal Dughan says, and they're getting bolder, since he can't spare men to chase them past the river." } },
      choices = {
        { text = "Then I'll hunt them down, for the farmers' sake.", next = "BACK", reply = "The Brackwells would bless you, and so would I. The gnolls hole up past the river, west of town.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A few lost hogs aren't worth a paladin's time.", next = "BACK", reply = "Tell that to the Brackwells, who've two fewer hogs to see them through winter. Off you go, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest at the butcher's block. Don't look so pale; it's only pig." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll want something hearty, then, because I've seen how much plate weighs and how little your lot eat when you're praying." },
        { id = "h_default", key = true, text = "Toddrick. I cut the meat and Farley cooks it, and everyone agrees whose job is harder: mine." },
        { id = "h_princess", when = { questDone = TODO_QUEST("Princess Must Die!") },
          text = "You did for the Brackwells' prize sow? Pity you didn't bring her here. I'd have made Goldshire's finest sausages." },
        { id = "h_boar", when = { metBefore = true }, text = "The boar's good this week, but the wolf's not. Don't let anyone sell you wolf, not even me." },
        { id = "h_second", when = { metBefore = true }, text = "Farley says my sausages are the second-best thing in this inn, and when I asked him what the first was, he pointed at himself." },
        { id = "h_dobbins", when = { heardLine = "dobbins.h_default" }, text = "Dobbins says he fetches when Farley shouts? He fetches when I shout too, only slower, much slower." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You've quick hands, and I've quicker cleavers, so keep yours where I can see them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "There's a smell on you, and it isn't from my shop. Keep it away from the meat, would you?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and I'll bet you can't tell a boar shoulder from a boar's backside. Most of you can't." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Now you're someone I can talk to; bring me a decent boar and I'll make you sausages fit for a marshal." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf, and you're looking at my hooks like they've done something to you. It's mutton and boar, nothing you'd have known by name." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. If you can keep meat cold with a spell, I'll want to hear about it, because the cellar's only so cool in summer." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Don't buy the wolf meat; even I wouldn't eat it. Your spirits would agree, I'd guess." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, before the cleaver gets cold." },
        { id = "h_again2", text = "Anything else? I've a side of boar waiting on me." },
      },
      choices = {
        { text = "Where does your meat come from?", next = "meat" },
        { text = "What's the secret to a good sausage?", next = "sausage" },
        { text = "What's good today?", next = "BUSINESS" },
        { text = "You seem to take every rogue for a thief, Toddrick.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does the cellar below the inn ever trouble your trade?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Warriors must make good customers for a butcher.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Would you buy the boar I bring you, Toddrick?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd guess your scraps go to the poor, Toddrick.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'd guess the gnolls have troubled your suppliers, Toddrick.", next = "xapala", when = { class = "PALADIN" } },
        { text = "You seem to know where every cut of your meat comes from, Toddrick.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Could a frost spell help you keep meat, Toddrick?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What's wrong with the wolf meat, Toddrick?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    meat = {
      lines = {
        { id = "m_farms", text = "From the farms east of here, mostly, and from adventurers. You lot bring in more boar than the farmers ever did, and I'm not complaining." },
      },
      choices = {
        { text = "Why not wolf?", next = "meat_wolf" },
        { text = "Glad to help.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    meat_wolf = {
      lines = {
        { id = "mw_default", text = "It's stringy and sour, and it smells like a wet dog when it cooks. Northshire recruits buy it anyway, and they learn." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sausage = {
      lines = {
        { id = "s_default", text = "Good meat, a fistful of salt, and never telling anyone what else. Farley's been guessing for years." },
      },
      choices = {
        { text = "Go on. Tell me.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Let me try one.", next = "BUSINESS" },
        { text = "Farley says he finally worked out your secret.", tag = "Deceive", next = "sausage_spilled",
          check = { pass = { any = { { disposition = { min = 55 } }, { trait = "witty" }, { class = "ROGUE" } } } },
          fail = { next = "sausage_safe", fx = { affinity = -1 } } },
      },
    },
    sausage_spilled = {
      lines = {
        { id = "ss_default", text = "He never! Who told him about the ale? It's a splash of Dobbins's dark in every batch, that's all, poured from Farley's own barrel when he isn't looking, and if he knows, he's been drinking his own secret ingredient for years." },
        { id = "ss_after", text = "Hang on, you're grinning. He doesn't know a thing, does he? Well, now you do, so you'll keep it behind your teeth, or I'll tell everyone you buy wolf." },
      },
      choices = {
        { text = "My lips are sealed, Toddrick.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sausage_safe = {
      lines = {
        { id = "sf_default", text = "Farley? Farley's been guessing nutmeg for six years, and it's never been nutmeg. Nice try, though, and you can tell him I said so." },
        { id = "sf_default2", text = "If Farley had worked it out, he'd have told the whole common room by now, and twice over. You'll have to do better than that." },
      },
      choices = {
        { text = "Worth a try.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = {
      { id = "tp_knows", text = "A butcher's block hears more gossip than a confessional, friend, because folk talk while they wait. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I'm the butcher: I cut, I sell and I argue with Farley. It's a good life." } },
    advice = { { id = "tp_ad", text = "Never buy meat from a man who won't tell you what it was." } },
    _none = { { id = "tp_none", text = "If it's not meat, I'm no use to you." } },
    hogger = { { id = "tp_hogger", text = "I've seen what's left of a cow after Hogger's gnolls are done. Not even I could sell that." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire buys meat by the side, and their cook argues prices harder than Farley does. It's the best week of the year for a butcher, friend." } },
    booty_bay = { { id = "tp_booty_bay", text = "A sailor told me they eat shark in Booty Bay, fried in oil with pepper, and I've wanted to get my hands on a shark ever since. Lee Brown says the lake hasn't got any." } },
    scourge = { { id = "tp_scourge", text = "I heard the plague up north came in the grain, so I check every sack that comes through this kitchen. Laugh if you like, friend, but I'm still breathing." } },
  },
}

-- Tharynn Bouden: trade supplies, at a wagon on the south-east road out of Goldshire.
P:NPC {
  key = "tharynn", id = TODO_NPC("Tharynn Bouden"), name = "Tharynn Bouden", title = "Trade Supplies",
  bible = "bibles/goldshire_folk.md", role = "vendor", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "ambitious" }, notices = { "lock_soulstone" },
  impression = {
    first = "She dreams openly of a gold-lettered sign in the Trade District.",
    third = "{name} met Tharynn Bouden, a trade supplier who works from a roadside wagon and dreams of a shop in Stormwind.",
  },
  greetings = {
    { id = "g_craft", text = "Thread, dye, flux and vials, for people who make things." },
    { id = "g_crafter", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing", "Alchemy" } }, text = "Ah, a crafter, my favourite kind of customer, because you come back." },
  },
  notice = {
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { carrying = { 5232, 16892, 16893, 16895, 16896 } },
      text = "Is that a soulstone in your pack? I've a reputation to keep in this town, and I'd rather nobody saw a thing with a soul waiting in it sitting on my counter while you browse." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "A shop in the Trade District, every night, with a gold-lettered sign with my name on it. Your spirits might bring luck to a wagon, if you ask nicely." } },
      choices = {
        { text = "Keep at it, Tharynn. The sign will come.", next = "BACK", reply = "You're very kind, and I'll paint the sign myself when it comes. Gold letters, every one.", fx = { align = { honor = 1 } } },
        { text = "Dreams are cheap. Sell more and dream less.", next = "BACK", reply = "Easy for you to say, friend, but a dream keeps a trader moving on a cold road. I'll do both, thank you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Dark dye and good thread, mostly, for mending leathers that have to stay quiet. Keryn Sylvius's students come in looking for anything that doesn't shine, and I sell it to them without a word, because crafters buy forever and so do people who'd rather not be seen." } },
      choices = {
        { text = "Discretion's good business. I'll keep coming back.", next = "BACK", reply = "Then you'll always find what you need at my wagon, with no questions. Crafters buy forever, and so do the quiet ones.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll mend my own gear in the open, with no secrets in it.", next = "BACK", reply = "That's admirable, and I'll sell you the brightest thread I've got. Honesty never hurt business.", fx = { align = { honor = 1 } } },
        { text = "Something else, Tharynn.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every week, and I send them out to pick it themselves, because I can't keep a crate of fresh herbs alive in a wagon. If you ever wanted to supply that side of things, I'd split it fair, though I suppose your kind don't care much for wagons." } },
      choices = {
        { text = "A proper trade with fair shares suits me well.", next = "BACK", reply = "Then come by when you've a basket to fill, and we'll talk terms. I like a partner who knows the woods.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd rather pick what I need and owe nobody.", next = "BACK", reply = "That's fair, and I'll not argue with a free spirit. You know where the wagon is if you ever change your mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a fighter who can mend his own mail saves a fortune, and one who can't spends it at Smith Argus's forge. The clever ones learn blacksmithing, and the rest keep Argus very comfortable." } },
      choices = {
        { text = "I'll learn to mend my own gear.", next = "BACK", reply = "Smart, and I've the tools on the wagon when you're ready. Argus won't thank me, but you will.", fx = { align = { order = 1 } } },
        { text = "I'll pay the smith and spend my time fighting.", next = "BACK", reply = "Argus would love to hear that, and I'll not tell you otherwise. Your coin, your choice.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Most of the good ones, since they bring home the hides anyway. Adele Fielder by the lake will teach you, and I'll sell you the thread, and between us we'll keep you in boots for years." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Most of the good ones, since they bring home the hides anyway, and Adele Fielder by the lake will teach you. Your {pet} would look grand in a collar of your own make, if it'd let you near its neck." },
      },
      choices = {
        { text = "I'll learn to work what I take.", next = "BACK", reply = "Now that's a hunter after my own heart, and Adele will be glad of a new student. You'll want my thread when you start.", fx = { align = { order = 1 } } },
        { text = "I'll sell the hides and let others work them.", next = "BACK", reply = "Fair enough, though you'll pay twice for boots that way. Adele will still be there when you change your mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "From what I sell, I'd say so, because Zaldimar upstairs at the inn buys a stack of parchment every week and I've never once seen him set anything alight. Crafters buy forever, and so do scholars." } },
      choices = {
        { text = "Careful study is the heart of magic. He's right to write it down.", next = "BACK", reply = "I thought you'd say that, and I've parchment by the ream for your own notes. Zaldimar's never once complained about the quality.", fx = { align = { order = 1 } } },
        { text = "Real magic is cast, not written. Paper's for clerks.", next = "BACK", reply = "Zaldimar might argue, and he's a better customer than most. I'll keep selling parchment either way.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because I've a reputation to keep in Goldshire, and everyone knows there's something under the Lion's Pride that nobody talks about. I'd rather not be the shop that sells it what it needs." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because I've a reputation to keep in Goldshire, and now half the street's watched your demon walk through my door. Everyone knows there's something under the Lion's Pride that nobody talks about, and I'd rather not be the shop that sells it what it needs." },
      },
      choices = {
        { text = "Your reputation matters. I understand, Bouden.", next = "BACK", reply = "Thank you, and I'm glad you understand it's not personal. I'll sell you anything that isn't for the cellar.", fx = { align = { light = 1 } } },
        { text = "Your caution is costing you good business.", next = "BACK", reply = "It might be, but I'll not lose my good name for a few coppers. Goldshire talks, friend.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "For a shop in the Trade District, every night, and for rain on the roads so my rivals' wagons get stuck. I'm told that's not how it works, but it hasn't stopped me yet." } },
      choices = {
        { text = "Pray for others too, Bouden. It might take better.", next = "BACK", reply = "I've tried, truly, but they never seem to take. Still, I'll put in a word for you tonight.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Pray for profit, then. Charity never built a shop.", next = "BACK", reply = "At last, someone who understands, and I'll pray for your purse as well as mine. The Light can sort out the details.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Twice this year, by men with red bandanas and very good manners, which somehow made it worse. I don't need a hammer, thank you; I need Marshal Dughan to have more than four men, and that's not something you can fix with a prayer." } },
      choices = {
        { text = "Then I'll lend the Marshal my hammer, and you'll have your road.", next = "BACK", reply = "That's a big promise, and I'll believe it when I see the bandanas gone. Still, the Marshal could use the help.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Marshal can't help you. Carry a blade and handle it.", next = "BACK", reply = "I've thought about it, but I'd likely cut myself before I cut a Defias. I'll keep to the main road and hope.", fx = { align = { order = -1 } } },
        { text = "Something else, Bouden.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll want ink and parchment for copying prayers, I expect, and mine's the cheapest in Goldshire, though not the best." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll buy once and never come back, like the warriors, unless your order's taken up tailoring." },
        { id = "h_default", text = "I'm Tharynn Bouden, and I sell what crafters need and nothing they don't. Fighters buy once, but crafters buy forever." },
        { id = "h_shop", when = { metBefore = true }, text = "One day I'll have a shop in the Trade District, with a proper sign in gold letters, but until then it's a wagon at the edge of the road." },
        { id = "h_gossip", when = { metBefore = true }, text = "Crafters gossip more than anyone. A tailor in here last week knew every wedding in Elwynn for the next year." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. You'll want parchment and ink, I expect, because your lot write more than they cast." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, and I'll sell you what's on the shelves, but I don't keep anything for your sort behind the counter." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll buy once and never come back, I expect, unless you've taken up a craft." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Now you'll come back, because hunters skin, and skinners need salt and thread." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf at my wagon! Crafters come in every shape, but you're the first who looks like you could grow what I sell instead of buying it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. You'll want thread and dye, I expect, and not the bright kind, so look at the bottom shelf." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Buy something from my wagon, and I'll tell everyone a shaman shopped here. That's good for business, someday." },
      },
      again = {
        { id = "h_again", text = "Anything else? The wagon's not going anywhere, not yet anyway." },
        { id = "h_again2", text = "Go on. Browse with your eyes; ask with your mouth." },
      },
      choices = {
        { text = "Trade supplies seem a dull business.", next = "trade" },
        { text = "Crafters must keep you busy.", next = "crafters" },
        { text = "Show me.", next = "BUSINESS" },
        { text = "Mages seem to write more than they cast.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why won't you keep a warlock's goods?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why would a warrior take up a craft at all?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do many hunters take up leatherwork?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "A merchant like you must pray now and then, Bouden.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Has anyone robbed you on the road, Bouden?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do crafters ever ask for things only the forest provides?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What does a rogue buy from a trade supplier, Tharynn?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What do you dream of, Tharynn?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Later.", next = "END" },
      },
    },
    trade = {
      lines = {
        { id = "t_steady", text = "A sword breaks once, but a tailor needs thread every day of her life. Steady money beats exciting money." },
      },
      choices = {
        { text = "And the Trade District shop?", next = "trade_shop" },
        { text = "Smart.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    trade_shop = {
      lines = {
        { id = "ts_default", text = "Every thread I sell is a brick in it. I've even picked the colour of the door, green, so don't tell anyone or they'll copy it." },
      },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } } },
    },
    crafters = {
      lines = {
        { id = "c_default", text = "Thread and dye, by the bale. Tailors run through thread like water, and smiths can't work an hour without flux." },
      },
      choices = {
        { text = "Show me.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a trader with a wagon and a plan, so ask me again when the plan's a shop." } },
    advice = { { id = "tp_ad", text = "Pick a trade, friend; fighters spend, but crafters earn." } },
    _none = { { id = "tp_none", text = "That's not a trade good, so I can't help you." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay is where the real trade happens, friend, with goblin docks and goods from every shore. When my wagon becomes a ship, that's where I'm sailing." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire draws buyers from every corner of Stormwind, so I park my wagon as close as their guards allow. It's never as close as I'd like." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The goblin cartel runs Booty Bay and Ratchet and Gadgetzan, and everyone else pays them for the privilege. I'd join, if they took humans and I had the stomach for their interest." } },
  },
}

-- Andrew Krighton: armorer and shieldcrafter, in the forge opposite the inn.
P:NPC {
  key = "krighton", id = TODO_NPC("Andrew Krighton"), name = "Andrew Krighton", title = "Armorer & Shieldcrafter",
  bible = "bibles/goldshire_folk.md", role = "blacksmith", tier = "service", communities = { "goldshire" },
  temper = { "proud" }, values = { "honest" }, notices = { "kit", "lock_armor" },
  impression = {
    first = "He has firm opinions on who belongs behind a shield.",
    third = "{name} met Andrew Krighton, Goldshire's armorer, who believes a shield is for others to hide behind.",
  },
  greetings = {
    { id = "g_armor", text = "Mail, plate and shields: something to stand behind." },
  },
  notice = {
    { id = "n_shield", cat = "kit", when = { class = { "WARRIOR", "PALADIN" }, durability = { max = 0.3 } },
      text = "That shield's taken a beating, which is good, because that's its job. Let me see if it can take another." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That dark hide crawling over your shoulders isn't anything I'd hammer, and I'd guess it turns a blade better than half my stock. I'll not pretend I'm not jealous, though I'd not wear it for all the gold in Stormwind." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Anyone who holds the line belongs behind one. If your spirits keep you in front, I'll make you a good shield myself." } },
      choices = {
        { text = "A shield is a promise to stand firm. I'll keep it.", next = "BACK", reply = "That's what I like to hear, and I'll make you a shield that keeps its promises too. Come back when you're ready.", fx = { align = { order = 1 } } },
        { text = "Shields slow me down. I'll trust my spirits.", next = "BACK", reply = "Then I'll hope your spirits are quick, because a gnoll's axe is quicker. The shield will be here if you want it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Once, a pair of gloves for one of Maximillian Crowe's students who kept burning his hands, and I lined them twice. He thanked me, and then his little demon chewed the left one, so I've not been asked again and I haven't offered." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Once, a pair of gloves for one of Maximillian Crowe's students who kept burning his hands, and I lined them twice. His demon chewed the left one, and yours is giving my shield rack much the same look, so I'll ask you to keep it where I can see it." },
      },
      choices = {
        { text = "You did him a kindness. He should have minded his imp.", next = "BACK", reply = "He should have, and I told him so, though the imp just grinned at me. I'll stick to customers without teeth.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Imps chew. You should have lined them three times.", next = "BACK", reply = "Three times, and it'd have chewed through all three, I'd wager. I'll leave the demons to someone else's needle.", fx = { align = { order = -1 } } },
        { text = "Something else, Krighton.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because a bear's hide bleeds and my oak and iron don't, and when a recruit runs out of strength, my shield is still there. I'll admit a bear looks a good deal more frightening on the Goldshire road, though." } },
      choices = {
        { text = "Then I'll stand beside your shields and not mock them.", next = "BACK", reply = "Good, that's all I ask, and I'll gladly have a bear on our side of the line. Come and see me if you ever need a buckler.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Hide and claw are enough. Shields are for the timid.", next = "BACK", reply = "Timid, says you, and I've watched a timid lad with a good shield walk home from a fight that took two bears. Mind your claws.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Close to the body and a little high, so the edge takes the blow and not your arm. The recruits hold it out like a dinner tray, and the first gnoll to hit it tells them why that's wrong." } },
      choices = {
        { text = "Close and high, then. I'll practise until it's habit.", next = "BACK", reply = "That's how it starts, and you'll be glad of it the first time a gnoll swings. Come back and show me when it's second nature.", fx = { align = { order = 1 } } },
        { text = "I'll put my strength in the sword, not the shield.", next = "BACK", reply = "Then you'll be swinging with a bruised arm by noon. Strength's no good if you're bleeding out from the side you forgot.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Light mail, if you can carry it, because a hunter gets caught by what he shoots more often than he admits. A bear that reaches you won't care how good your aim was a moment ago." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Light mail, if you can carry it, because a hunter gets caught by what he shoots more often than he admits. That {pet} of yours takes the blows for you, I see, so treat it well; it's the best armor you'll own." },
      },
      choices = {
        { text = "I'll wear the mail and not trust my aim alone.", next = "BACK", reply = "Smart thinking, and I've a light set that'll suit you. The bear will thank you for making it work harder.", fx = { align = { order = 1 } } },
        { text = "Nothing's going to reach me. I'll stay light.", next = "BACK", reply = "That's what the last one said, right before the bear reached him. I'll be here when you change your mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Oiled leather, stitched tight, with no buckles where a buckle would rattle, and that's the whole secret. I made a set for one of Keryn Sylvius's students and he walked right past me in my own shop, which I took as a compliment." } },
      choices = {
        { text = "I'll pay your price, Krighton, and use it for honest work.", next = "BACK", reply = "Good, and I'll make it so quiet even I can't hear you coming. Come back when you've the coin.", fx = { align = { honor = 1 } } },
        { text = "I need armor that doesn't clank. I'll find a bargain.", next = "BACK", reply = "Bargains clank, friend, because the buckles are cheap. Come back when you're ready to pay for quiet.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not the wise ones, because a shield on the arm ruins the casting, they tell me, and I believe them after one tried it and dropped both. If you want protection, stand behind someone who's wearing my work." } },
      choices = {
        { text = "Then I'll stand beside your warriors, not behind them.", next = "BACK", reply = "Beside them, then, and that's braver than most mages manage. Just don't drop your staff on their feet.", fx = { align = { honor = 1 } } },
        { text = "Let the warriors take the blows. That's what they're for.", next = "BACK", reply = "They'll take them, aye, and you'd best remember who's bleeding for you. Buy one of them a drink at Farley's now and then.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Now and then, light mail for the brothers who go out with patrols, because a healer who's dead heals nobody. The Abbey says they should go in robes and trust in the Light, and I argue back, and we're both right, I suppose." } },
      choices = {
        { text = "A healer's faith is armor enough, Krighton.", next = "BACK", reply = "I'll not argue with faith, but I'll argue with an arrow. I'll keep making mail for the brothers who want it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faith won't stop an arrow. Give them the mail.", next = "BACK", reply = "That's what I keep telling the Abbey, and they keep telling me about the Light. You and I will get on fine.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That it's been used to cover someone else, mostly, because a shield held for its owner alone comes back scratched in all the wrong places. Brother Wilhelm's shields always come back scarred on the outer edge, from guarding the man beside him, and that tells me everything about him." } },
      choices = {
        { text = "A shield should guard others before its bearer.", next = "BACK", reply = "That's it exactly, and I can see you'll scar your shields in the right places. Come back when you need one.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A shield guards its bearer first. Anything else is foolish.", next = "BACK", reply = "Foolish or not, it's what makes a line hold. Hold yours for yourself, then, and watch who stands beside you.", fx = { align = { honor = -1 } } },
        { text = "Something else, Krighton.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll want nothing I make, though I've seen what a good shield does for the healer standing behind it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Now there's somebody who knows what a shield is for, and it isn't hiding." },
        { id = "h_default", text = "I'm Andrew Krighton. Smith Argus makes things sharp and I make things that stop sharp things, so we get on." },
        { id = "h_plate", when = { metBefore = true }, text = "Every recruit from Northshire walks in wanting plate, and then they try to lift it." },
        { id = "h_shield", when = { class = { "PALADIN", "WARRIOR" } }, text = "A shield isn't for hiding behind; it's for being the thing everyone else hides behind, and you'd do well to remember it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Leather, then, and something quiet. I don't make anything that clanks for your sort, because nobody would buy it twice." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage in an armorer's shop. You'll want nothing I make, though I'll sell you a buckler if you insist." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Mail, then, and something that lets you draw a bow without your shoulders creaking." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf, and not a shield on you, which I suppose means you've some trick that serves instead. I'd like to hear it, so long as it doesn't put me out of business." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I make armor, and you wear cloth, so I expect you've come to stand by my forge and get warm." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Shields are for those who stand in front, and I wonder where a shaman stands; behind, I'd guess, calling lightning." },
      },
      again = {
        { id = "h_again", text = "Anything else? The forge doesn't stoke itself, you know." },
        { id = "h_again2", text = "Go on, and mind the anvil; it's still warm." },
      },
      choices = {
        { text = "How did you learn the trade?", next = "trade" },
        { text = "What makes a good shield?", next = "shield" },
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "What makes armor quiet enough for a rogue?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I've never seen a mage carry a shield.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How should a warrior hold a shield, Krighton?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What armor would you put on a hunter?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd guess you make armor for the Abbey's healers now and then.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What makes a shield worthy of a paladin, Krighton?", next = "xapala", when = { class = "PALADIN" } },
        { text = "A bear's hide stops more than wood. Why carry a shield at all?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Have you ever made armor for a warlock, Krighton?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "A shaman has no business behind a shield, I'd have thought.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not now.", next = "END" },
      },
    },
    trade = {
      lines = {
        { id = "t_rebuild", text = "Same as anyone: by hammering until it stopped looking like a mistake. Argus says I'm still at it." },
      },
      choices = {
        { text = "Show me your work.", next = "BUSINESS" },
        { text = "Thanks.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    shield = {
      lines = {
        { id = "s_default", text = "Oak core, iron rim, and a strap that won't snap when it matters. The rest is paint." },
      },
      choices = {
        { text = "Paint?", next = "shield_paint" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shield_paint = {
      lines = {
        { id = "sp_default", text = "The lion of Stormwind, mostly, because recruits want the lion, but the lion doesn't stop arrows; the oak does." },
      },
      choices = { { text = "I'll take the oak.", next = "BUSINESS", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm the armorer at this forge and this anvil, and the work's more interesting than I am." } },
    advice = { { id = "tp_ad", text = "Check your straps every morning. A shield that falls off is a very heavy hat." } },
    _none = { { id = "tp_none", text = "Can I put it on your arm? If not, I can't help you." } },
    magni = { { id = "tp_magni", text = "Ironforge plate is the best in the world, and King Magni's smiths know it. I've studied the rivets on a dwarven shield until I could draw them with my eyes shut." } },
    scourge = { { id = "tp_scourge", text = "A soldier back from the north told me to aim for the joints on the walking dead, because they're held together worse than they look. I've been making the joints on my armor thicker ever since." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Every year the Faire wants a breastplate for their strongman, and every year he dents it lifting barrels. It's good custom, if you like repairs." } },
  },
}

-- Corina Steele: weaponsmith, same forge.
P:NPC {
  key = "corina", id = TODO_NPC("Corina Steele"), name = "Corina Steele", title = "Weaponsmith", gender = "female",
  bible = "bibles/goldshire_folk.md", role = "blacksmith", tier = "service", communities = { "goldshire" },
  temper = { "sharp" }, values = { "proud" }, notices = { "kit", "lock_stones" },
  impression = {
    first = "She judged the balance of my weapon in a single glance.",
    third = "{name} met Corina Steele, Goldshire's weaponsmith, who has a quick tongue and an eye for a blade's balance.",
  },
  greetings = {
    { id = "g_blade", text = "Swords, axes and maces; pick one up and feel the balance." },
    { id = "g_flirt", when = { flirt = true, chance = 0.4, ["not"] = { npcFlag = "corina_flirt_no" } }, cooldown = "2d",
      text = "Back to look at the swords, or at the smith? Either way, mind the edges, because I've only just put them on." },
    { id = "g_flirt_yes", when = { flirt = true, npcFlagBefore = "corina_flirt_yes" }, priority = 8, cooldown = "1d",
      text = "There's my charmer. Kurran keeps asking why I've burned my thumb twice this week, and I keep telling him it's the forge." },
    { id = "g_flirt_no", when = { npcFlagBefore = "corina_flirt_no" }, priority = 8, once = true,
      text = "Just the blades today, I promise, and my clever remarks stay in the coal bucket where they belong. No hard feelings, {class}." },
  },
  notice = {
    { id = "n_dull", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your blade's notched like a saw. Did you fight something, or chop firewood with it?" },
    { id = "n_lock_firestone", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5522, 13602, 13603, 1254, 13699, 13700, 13701 } },
      text = "There's a firestone in your bag, isn't there? I can feel the heat of it from across the anvil, and a blade that's been held near one of those never tempers right again." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It is, a little, but nothing a proper smith can't fix. Spirits might keep you alive, but balance keeps your arm from aching." } },
      choices = {
        { text = "Then fix it properly, Corina. I trust your eye.", next = "BACK", reply = "I'll have it on the stone by supper, then, and you'll feel the difference the first swing. Leave it with me.", fx = { align = { honor = 1 } } },
        { text = "It works well enough. Leave it.", next = "BACK", reply = "Well enough is how most of my repairs start, friend. Come back when your wrist starts complaining.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not much, because a mage needs a staff to lean on more than a blade to swing, and my brother Kurran says I should stop stocking them. I keep them anyway, because Zaldimar's students come in here looking lost, and it's good for a shop to have something for everybody." } },
      choices = {
        { text = "That's a kind way to run a shop, Corina.", next = "BACK", reply = "Kurran says I'm soft, and he's likely right, but a lost student deserves somewhere to start. You'll not tell him you agreed with me, will you?", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your brother's right. Stock what sells.", next = "BACK", reply = "Don't you start as well, because I hear enough of that over supper. The staves stay, and that's the end of it.", fx = { align = { honor = -1 } } },
        { text = "Something else, Corina.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Nothing at all, and I'd starve if everyone fought like you, so I'll thank you not to spread it about. I once sold a set of iron claws to a Westfall man who wanted to look fierce, and he cut himself putting them on." } },
      choices = {
        { text = "Every fighter should master a proper weapon first.", next = "BACK", reply = "Spoken like a sensible customer, and you'll keep me in business saying it. I'll have something on the rack for when you want it.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "There's no right weapon. Fight with whatever works.", next = "BACK", reply = "Whatever works, until it doesn't and you're left holding a broken claw. I'll keep the rack stocked for the day you change your mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Whichever you can still swing when you're tired, because that's when the fight's decided. Lyria Du Lac's students find that out on their first long sparring day, and then they come back to me with a sore wrist and the right question." } },
      choices = {
        { text = "I'll choose the blade I can swing when I'm tired.", next = "BACK", reply = "That's the lesson most of Lyria's lot need a bruise to learn. Try a few, and pick the one that doesn't fight you.", fx = { align = { order = 1 } } },
        { text = "I'll take the heaviest you've got and grow into it.", next = "BACK", reply = "You'll grow into a sore shoulder first, I'd wager. Still, I'll sell it to you and keep a lighter one aside for next week.", fx = { align = { order = -1 } } },
        { text = "Something else, Corina.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Something long, so you can keep a boar at the end of it while your beast does the work. A short blade's fine for skinning, but a hunter who has to fight close has already made a mistake." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Something long, so you can keep a boar at the end of it while your beast does the work. Your {pet} does the close fighting, doesn't it? Then buy something long and let it." },
      },
      choices = {
        { text = "I'll keep my distance and fight close only when I must.", next = "BACK", reply = "Good, and your beast will thank you for letting it do its job. I've a spear that would suit you.", fx = { align = { honor = 1 } } },
        { text = "I'd rather fight close. It's more honest.", next = "BACK", reply = "Honest, maybe, but boars don't care about honesty and they're faster than they look. I'll sell you something long anyway, for when you change your mind.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Balance first, then the edge, and the hilt last, though everyone who buys one looks at the hilt first. A good dagger should feel like it's part of your hand, so you never have to think about where it is." } },
      choices = {
        { text = "I'll carry it with honor, Corina. A blade deserves that.", next = "BACK", reply = "That's good to hear, and I'll trust you to mean it. A blade carried well lasts a lifetime.", fx = { align = { honor = 1 } } },
        { text = "A dagger is for winning, not for honor.", next = "BACK", reply = "I suppose it is, for your sort, and I'll not lecture a customer. Just keep the edge clean and it'll win for you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "It troubles me a little, because a blade I've forged ought to be used on wolves or Defias, not on whatever goes on in that cellar. But steel is steel, and I've no right to tell you how to use it." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "It troubles me a little, because a blade I've forged ought to be used on wolves or Defias, not on whatever goes on in that cellar. Your servant hasn't taken its eyes off my rack since you came in, and I'd sooner it did, but steel is steel, and I've no right to tell you how to use it." },
      },
      choices = {
        { text = "I'll only use your steel to fight the Defias.", next = "BACK", reply = "I'd sleep easier for that, and I'll take you at your word. The Defias have earned your steel more than most.", fx = { align = { light = 1 } } },
        { text = "What I do in the cellar is my own affair, Corina.", next = "BACK", reply = "It is, and I said as much, though it doesn't stop me wondering. Pay for the blade and we'll leave it there.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some nights, when a farm boy buys a sword he can barely lift and I know he's going after Hogger. Most nights I tell myself a good blade ends a fight quicker than a bad one, and that's mercy of a sort, though Kurran says I'm just good at excuses." } },
      choices = {
        { text = "Your craft can serve good ends, Corina.", next = "BACK", reply = "I'd like to think so, though Kurran would roll his eyes to hear it. Thank you for saying it all the same.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Every blade you sell will draw blood. Own it.", next = "BACK", reply = "I do own it, every night, and it doesn't get lighter. Kurran would tell you I'm good at excuses, and maybe I am.", fx = { align = { light = -1 } } },
        { text = "Something else, Corina.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A heavy one, balanced near the head, so it does the work and you don't have to swing twice. I'll not make you a pretty one, mind, because the paladins who buy pretty hammers tend to come back for heavier ones once they've met a gnoll." } },
      choices = {
        { text = "I'll take the plain one. A weapon should serve, not shine.", next = "BACK", reply = "That's the choice of a paladin who'll live long enough to need a second one. I'll put the heaviest on the counter for you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take the pretty one. People follow what they can see.", next = "BACK", reply = "They do, until the gnoll knocks it out of your hand, and then they follow the one still standing. I'll sell you both if you like.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll want a mace or a staff, I'd guess, and I've a few that won't embarrass you." },
        { id = "h_default", key = true, text = "Corina Steele, and yes, really. With a name like that it was this or juggling." },
        { id = "h_flirt", when = { flirt = true, chance = 0.4, ["not"] = { npcFlag = "corina_flirt_no" } }, cooldown = "3d",
          text = "You've a good grip and better shoulders, and I'm speaking strictly as a weaponsmith, of course. Well, mostly strictly." },
        { id = "h_flirt_yes", when = { flirt = true, npcFlagBefore = "corina_flirt_yes" }, priority = 6, cooldown = "1d",
          text = "You again, and I've just put an edge on something, so mind you don't distract me into losing a finger." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Lyria sends me all her students. Some come back for a heavier blade and some for a lighter one, and none of them ever come back for the same." },
        { id = "h_kurran", when = { metBefore = true }, text = "Kurran and I share a name and an argument. The argument's older." },
        { id = "h_balance", when = { metBefore = true }, text = "A sword's balance tells you who it was made for. Most of mine are made for whoever pays." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin, so you'll want a hammer, I'd guess; your lot always seem to." },
        { id = "h_heard_kurran", when = { heardLine = "kurran.h_default" }, text = "Kurran called himself the other Steele? He likes being the other one, because there's less pressure in it, he says, and more time to sit." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Daggers on the left, swords on the right. You'll go left, I expect, but you might surprise me." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. You'll be after a dagger for your rituals, I suppose, and I'll sell you one, though I'd rather not know which ritual." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter at my rack. You'll be wanting a polearm, or an axe for close work, I'd guess." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf, and those hands have never held anything heavier than a staff, if you'll forgive my saying so. I'm Corina Steele, and before you laugh, I've heard it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! You'll be after a staff, then, not a sword, and I keep one or two at the back for people who'd rather not swing anything." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I'm Corina Steele, and yes, I've heard every joke. Let me see that weapon; your spirits haven't kept it balanced." },
      },
      again = {
        { id = "h_again", text = "Another question? Ask away; the grinding stone doesn't mind." },
        { id = "h_again2", text = "Go on, but sharp questions only." },
      },
      choices = {
        { text = "What makes a good blade?", next = "blade" },
        { text = "You and Kurran seem to have an old argument going.", next = "kurran" },
        { text = "Let me see your weapons.", next = "BUSINESS" },
        { text = "What makes a good dagger, in your eyes?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Selling blades to warlocks must trouble you a little.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Should I choose a heavier blade or a lighter one?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What weapon should a hunter carry for close fighting?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does it trouble you, making weapons that kill, Corina?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What hammer would you give a paladin, Corina?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would you forge for someone who fights with claws?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'd guess you don't sell much to mages, Corina.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "My weapon feels poorly balanced, Corina.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "You seem to watch your customers closely, Corina.", next = "flirt", when = { flirt = true, ["not"] = { npcFlag = "corina_flirt_no" } } },
        { text = "Goodbye.", next = "END" },
      },
    },
    flirt = {
      lines = {
        { id = "fl_default", text = "Only the ones worth watching, and you test a blade like you mean it, which is rarer than you'd think. I don't flirt with customers as a rule, but rules are for people who don't own the forge." },
        { id = "fl_again", when = { npcFlagBefore = "corina_flirt_yes" }, priority = 5,
          text = "Still watching, and still not sorry about it. Kurran has started whistling whenever you walk in, and I'll make him pay for that in leather." },
      },
      choices = {
        { text = "Then watch closely. I'll test a few more blades.", next = "flirt_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "corina_flirt_yes" }, clear = { "corina_flirt_no" } } } },
        { text = "Lyria warned me her students always fall for the smith.", next = "flirt_yes", when = { class = "WARRIOR" },
          reply = "Did she? Then Lyria talks too much, though I can't say she's wrong.",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "corina_flirt_yes" }, clear = { "corina_flirt_no" } } } },
        { text = "You're kind, Corina, but I'm only here for steel.", next = "BACK",
          reply = "Then steel you'll have, and the best on the rack. Forget I said anything; the coal smoke makes me talkative.",
          fx = { trait = { reserved = 1 }, npcFlag = { set = { "corina_flirt_no" }, clear = { "corina_flirt_yes" } } } },
        { text = "Flattery won't win you a better price from me.", next = "BACK",
          reply = "It wasn't meant to, but I'll take the hint and save the flattery for the blades, since they never argue.",
          fx = { trait = { stern = 1 }, npcFlag = { set = { "corina_flirt_no" }, clear = { "corina_flirt_yes" } } } },
      },
    },
    flirt_yes = {
      lines = { { id = "fy_default", text = "Then take this one by the hilt while I check the balance, and if your hand lingers, I'll pretend I didn't notice. Come back when it's notched, {class}, because I'll be glad to see it, and you." } },
      choices = {
        { text = "I'll notch it quickly, then.", next = "BACK",
          reply = "Not too quickly. A smith likes to see her work last, and her customers too." },
      },
    },
    blade = {
      lines = {
        { id = "b_good", text = "Good steel, patient hands, and an owner who cleans it. I can sell you the first two." },
      },
      choices = {
        { text = "How do I keep it clean?", next = "blade_clean" },
        { text = "Let me see your weapons.", next = "BUSINESS" },
      },
    },
    blade_clean = {
      lines = {
        { id = "bc_default", text = "Oil, a rag, and a minute every night before you sleep. Most adventurers would sooner die, and plenty do." },
      },
      choices = { { text = "I'll clean mine.", next = "BACK", fx = { affinity = 1 } } },
    },
    kurran = {
      lines = {
        { id = "k_default", text = "It's over whether leather counts as armor, which it doesn't, though he says it does. We've been at it since before either of us could lift a hammer." },
      },
      choices = {
        { text = "Leather counts.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Plate or nothing.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Steele by name and steel by trade, so don't make the joke; I've heard it." } },
    advice = { { id = "tp_ad", text = "Buy the weapon that fits your hand, not the one that fits your story." } },
    _none = { { id = "tp_none", text = "Ask me about edges; for anything else, ask someone else." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "Some fool came back from the arena down in Stranglethorn with my sword snapped in two and asked for his money back. I asked him how many fights he'd won with it first." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's knife-thrower buys his blades from me, and I've never seen him miss a mark. I'd still hate to be the fellow holding the apple." } },
    scourge = { { id = "tp_scourge", text = "If you're bound north, buy something heavy and blunt, because a sharp edge in a dead man's ribs just gets stuck. Kurran says I'm morbid, and he's right." } },
  },
}

-- Kurran Steele: cloth and leather armor, same forge.
P:NPC {
  key = "kurran", id = TODO_NPC("Kurran Steele"), name = "Kurran Steele", title = "Cloth & Leather Armor Merchant",
  bible = "bibles/goldshire_folk.md", role = "vendor", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "witty" }, notices = { "lock_taint" },
  impression = {
    first = "He and Corina share a forge and an argument neither will finish.",
    third = "{name} met Kurran Steele, who sells cloth and leather beside Corina's forge and quarrels with her quite contentedly.",
  },
  greetings = {
    { id = "g_leather", text = "Not everyone wants to clank. Come and see what I've got." },
  },
  notice = {
    { id = "n_lock_taint", cat = "lock_taint", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "Your cuffs have gone green at the edges, friend, and that's not mould, because I'd know mould. The cellar folk all go that way in the end, and they buy their coats darker every season to hide it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "We never will, I hope, because an argument shared is a friendship kept. Your spirits must argue too, I'd guess." } },
      choices = {
        { text = "Then keep it friendly, Kurran. Old arguments make good bonds.", next = "BACK", reply = "We will, don't worry, and Corina would miss it more than she'd admit. Arguing is how we say we care.", fx = { align = { honor = 1 } } },
        { text = "End it. Life's too short for old grudges.", next = "BACK", reply = "End it? She'd never let me, and I'd never let her win. It's not a grudge, friend, it's a hobby.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Enough to keep out of it. Corina sells to the soldiers and I sell to anyone, and those cellar folk buy their coats dark and their boots soft, and they never haggle, so they've plainly got other things on their minds." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Enough to keep out of it, and having seen what's followed you up from it, I'll keep out further. Those cellar folk buy their coats dark and their boots soft, and I'll sell you the same, so long as your {pet} doesn't go leaving a sulphur stink on the stock." },
      },
      choices = {
        { text = "Some things are best left in the cellar.", next = "BACK", reply = "That's my view exactly, and I'll keep my nose out and my thread in. Coats and boots and no questions.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You'd learn a lot down there, Kurran. Come and see.", next = "BACK", reply = "Thank you, but I'll keep to my stall, where things only bite if they're moths. I've no wish to learn what's down there.", fx = { align = { light = -1 } } },
        { text = "Something else, Kurran.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Most of it, because Helene Peltskinner and her husband Eagan skin whatever the hunters bring in and I sell it on as jerkins. Wolf, boar and the odd bear, though I'd sooner not say that last one too loudly in front of you." } },
      choices = {
        { text = "Hunted cleanly and used fully, that's honest work.", next = "BACK", reply = "That's how I like to think of it, and I'm glad you see it too. The bear was old, if that helps.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Say it however you like. A hide's a hide.", next = "BACK", reply = "It's a hide to me, but I thought you'd mind, and I'm glad you don't. Have a look at the jerkins, then.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Corina would say I'm being unkind, and she's right, mostly. Plate's for people who've decided not to run, and there's a difference, though I'd still rather be in leather when the gnolls come." } },
      choices = {
        { text = "I'll stand my ground and wear the plate.", next = "BACK", reply = "Good, and Corina will be pleased to hear it, though I'll never tell her. Plate suits you better than I'd expected.", fx = { align = { order = 1 } } },
        { text = "I'd rather run when I should.", next = "BACK", reply = "Then you're a warrior after my own heart, and I've leather that'll let you do it. Corina won't like hearing it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Arrowheads, flint, a bit of jerky for the beast, and whatever they've found that might be worth something. I sold a jerkin with fourteen pockets last month, and the fellow came back and asked for more." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Arrowheads, flint, a bit of jerky for the beast, and whatever they've found that might be worth something. That {pet} has a nose for my jerky, I see, so use the pocket on the left, if you're keeping some." },
      },
      choices = {
        { text = "I'll carry only what I need.", next = "BACK", reply = "Sensible, and lighter on the shoulders, though I'll sell fewer pockets that way. You'll walk farther for it.", fx = { align = { order = 1 } } },
        { text = "I'll carry everything I find. You never know.", next = "BACK", reply = "Then I've a jerkin with fifteen pockets now, and you're welcome to it. The last fellow's still filling his.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Enough that Corina teases me about who's buying it, and enough that the Guard asked me once whether I'd sold any to the Defias. I told them I don't ask my customers what they do, which was true, and they didn't much like it." } },
      choices = {
        { text = "The Guard had a right to ask. You should have helped them.", next = "BACK", reply = "Maybe I should have, and I've wondered about it since. But I'd lose half my customers if they thought I talked to the Guard.", fx = { align = { order = 1 } } },
        { text = "A tailor keeps his customers' secrets. You did right.", next = "BACK", reply = "That's what I told myself, and I'm glad someone agrees. A tailor who gossips doesn't stay a tailor long.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Something that won't catch fire the moment you sneeze, and that's rarer than a dry week in Elwynn. I've sold robes to apprentices from the tower that came back singed within a week, and I've never once asked how." } },
      choices = {
        { text = "A careful mage keeps his robes whole. I'll be careful.", next = "BACK", reply = "You'd be the first, and I'd pay to see it. Pick something plain, then, and we'll see how long it lasts.", fx = { align = { order = 1 } } },
        { text = "Robes are for burning. That's what they're for.", next = "BACK", reply = "Then you'll be back often, and I'll be glad of the custom. I'll keep the singed ones aside for you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Knees, mostly, because you lot kneel more than anyone, and then the hems, because you kneel in the mud beside whoever's bleeding. I put a second layer at the knee on every robe I sell to a healer, and I don't charge for it, so don't tell Corina." } },
      choices = {
        { text = "That's a kind thought, Kurran. It won't go unnoticed.", next = "BACK", reply = "It's nothing, really, only a few stitches more. Just keep it from Corina and we'll call it even.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Charge for it. Kindness won't pay your rent.", next = "BACK", reply = "Corina would say the same, and you'd both be right, I suppose. I'll keep doing it anyway, because the knees always go first.", fx = { align = { light = -1 } } },
        { text = "Something else, Kurran.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because most of them are running toward one, with a bow or a knife or a bear's shape, and they'd rather arrive alive. Your lot never run anywhere, Corina says, so they buy plate from her instead of leather from me, and she's richer for it." } },
      choices = {
        { text = "A paladin stands his ground. Running is for others.", next = "BACK", reply = "Then you'll be buying plate from Corina, and she'll be richer still. I'll not try to change your mind.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Running's no shame, if it means living to fight again.", next = "BACK", reply = "That's the wisest thing a paladin's said in my hearing, and I'll sell you something light for the running. Corina needn't know.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Cloth, then, and I've good robes, though Dermot Johns up at the Abbey will tell you his are better." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll want nothing I sell, unless it's a tabard, but Corina's next door, and she'll sell you something heavy." },
        { id = "h_default", key = true, text = "Kurran, the other Steele. Corina sells you the sword and I sell you the coat you'll bleed on, so it's a family business, in a way." },
        { id = "h_corina", when = { metBefore = true }, text = "Corina says leather's for people who can't commit, and I say plate's for people who can't run." },
        { id = "h_buyers", when = { metBefore = true }, text = "Rogues buy dark colors, druids buy anything that stretches, and hunters buy whatever's got the most pockets." },
        { id = "h_heard_corina", when = { heardLine = "corina.h_default" }, text = "Corina told you the juggling joke? She tells everyone, and I've heard it a hundred times; it's getting better, slowly." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Leather, and dark leather at that. I'd guess you want something that doesn't show in a hedge at night." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you'll be wanting cloth, which is the only thing I sell that your sort ever buys." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior in my shop. Corina's next door; you'll want her, not me, unless it's a padded jack you're after." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Pockets, then, and plenty of them; I knew it before you said a word." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf, and you're wearing leather already, so I'll not pretend you need mine. Sit down a moment, though, because nobody else will." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I've a coat or two that won't scorch, if you're buying, and I won't ask how the last one burned." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I'm the other Steele, by the way: Corina does the work and I do the sitting, and your spirits look like they do the work for you." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm not going anywhere, and neither is she." },
        { id = "h_again2", text = "Go on, but quietly; Corina's grinding." },
      },
      choices = {
        { text = "You sell only cloth and leather, I see.", next = "why" },
        { text = "Who buys from you?", next = "buyers" },
        { text = "Show me.", next = "BUSINESS" },
        { text = "You must sell a fair bit of dark leather to rogues.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What makes good cloth for a mage?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "You seem to think plate is for people who can't run.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why do hunters want so many pockets?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What do priests wear out fastest, Kurran?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why sell leather to folk who run from fights, Kurran?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does any of your leather come from Elwynn's own beasts?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you know much about the cellar beneath the inn, Kurran?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You and Corina will never settle that argument, I'd wager.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Later.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_quiet", text = "It's quiet and light, and you can mend it yourself by a campfire. Try mending plate by a campfire." },
      },
      choices = {
        { text = "Corina says leather doesn't count.", next = "why_corina" },
        { text = "Fair point.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    why_corina = {
      lines = {
        { id = "wc_default", text = "She'll say it till she's grey. Ask her how quietly her plate customers sneak up on anything. You can hear them from Goldshire." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    buyers = {
      lines = {
        { id = "b_default", text = "Mages and priests want robes that don't catch on things, rogues want dark, and everyone wants pockets." },
      },
      choices = {
        { text = "Show me the robes.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm the other Steele, and I sell coats. Ask Corina for the rest; she tells it louder." } },
    advice = { { id = "tp_ad", text = "Wear what you can run in, and then wear it while running." } },
    _none = { { id = "tp_none", text = "I sell coats, not answers." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I sold a coat to a Faire acrobat once who wanted it two sizes small, and by the end of the week she was wearing it upside down. I've stopped asking what people do in my coats." } },
    everlook = { { id = "tp_everlook", text = "If you're going anywhere like Winterspring, don't buy from me, buy from somebody who's been cold. I've only ever been damp." } },
    booty_bay = { { id = "tp_booty_bay", text = "Folk heading for Booty Bay ask for my lightest shirt, and they still come back looking boiled. There's no cloth made for that heat, I'm told." } },
  },
}

-- Erma: the stable master. In this era, stable masters keep hunters' beasts.
P:NPC {
  key = "erma", id = TODO_NPC("Erma"), name = "Erma", title = "Stable Master",
  bible = "bibles/goldshire_folk.md", role = "stablemaster", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "kind" }, notices = { "pet", "lock_steed" },
  impression = {
    first = "Her four-legged guests clearly rank above the two-legged ones.",
    third = "{name} met Erma, Goldshire's stable master, who treats every beast in her care like visiting royalty.",
  },
  greetings = {
    { id = "g_stable", text = "Watch your boots in here, and tell me who you've brought me." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Oh, look at {pet}! Somebody feeds you properly, but somebody also forgets to brush you, so come here." },
    { id = "n_lock_steed", cat = "lock_steed", when = { aura = { 5784, 23161 } },
      text = "My horses went wild in their stalls before you even reached the gate, and now I see why, because that beast of yours is leaving smoking hoofprints on my straw. Stable it here and I'll have no barn left by morning." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They sense everything, and a horse knows a shaman before I do, so I'll ask you to keep your spirits out of my stalls." } },
      choices = {
        { text = "Your beasts come first, Erma. I'll respect your stalls.", next = "BACK", reply = "That's all I ask, and the horses will know it too. Come and meet the old grey when you've time.", fx = { align = { order = 1 } } },
        { text = "Spirits go where they please. I can't stop them.", next = "BACK", reply = "Then I'll ask them nicely to stay outside, and you'll ask them too. My horses have enough to fret about.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Better than I can, and better than most of the guards. A horse that's been treated badly flinches at the sound of a sneaking step, so if you've got a mount of your own one day, you'll walk loud near it and save us both the trouble." } },
      choices = {
        { text = "I'll walk loud around your horses, Erma.", next = "BACK", reply = "Thank you, and they'll thank you too, in their way. A horse remembers a kind step.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sneaking is my trade. Your horses will cope.", next = "BACK", reply = "They'll cope by kicking you, friend, and I'll not stop them. Keep your quiet feet away from my stalls.", fx = { align = { order = -1 } } },
        { text = "Something else, Erma.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They mind it less than the cold, though the young ones kick at the walls by the end of it, and I can't say I blame them. I turn them out on the first dry morning of spring, and you've never seen anything so glad in your life." } },
      choices = {
        { text = "Stalls are a mercy in winter, and you keep them well.", next = "BACK", reply = "I try to, and it's good to hear somebody notice. Come by in spring and you'll see them run.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Beasts belong outside. Walls do them more harm than cold.", next = "BACK", reply = "Out in the snow, they'd be dead by midwinter, and I'll not lose a horse to that kind of thinking. They go out in spring.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "None of them, because these are road horses and they've never heard steel ring. The old grey might, since his rider was a soldier, but I'd not ask him to go again." } },
      choices = {
        { text = "Then I'll leave the old grey in peace.", next = "BACK", reply = "Thank you, and he thanks you too, I expect. He's earned a quiet field.", fx = { align = { honor = 1 } } },
        { text = "A horse is a horse. He'll go if he's told.", next = "BACK", reply = "He'll go if he's told, aye, and he'll go to pieces after. Leave the old grey to me, friend.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Mostly, once they've sniffed each other and decided not to bother. The cats take longest, since a horse remembers being hunted, but I've a mare who sleeps beside a lynx now, which I'd never have believed." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Mostly, once they've sniffed each other and decided not to bother, though the cats take longest. Your {pet} looks well kept, and I can always tell a hunter who brushes from one who doesn't." },
      },
      choices = {
        { text = "I'll keep my beast as well as you keep yours.", next = "BACK", reply = "That's all I ask of anyone, and I'll hold you to it. Bring it round and we'll see how it gets on with the mare.", fx = { align = { honor = 1 } } },
        { text = "It's a beast. It'll manage without fuss.", next = "BACK", reply = "They all manage, but some manage better with care. I'll keep an eye on it anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not all of them, but enough that I check the hooves on any horse a mage brings in, because they never notice a stone until the beast's lame. Treat a horse like a book and it'll throw you like one." } },
      choices = {
        { text = "A mount is a companion. I'll care for it properly.", next = "BACK", reply = "Good, then you'll be the first mage I've not had to scold. Check the hooves before every ride.", fx = { align = { light = 1 } } },
        { text = "A horse is just a way to get somewhere faster.", next = "BACK", reply = "Then it'll get you somewhere faster with a stone in its hoof, and you'll walk the rest. Mind it, friend.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They'd do more than shy, because they'd kick down their stalls, and I've only so many boards. A horse can smell the cellar under the Lion's Pride from here, and they don't like it any more than I do." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They'd do more than shy, because they'd kick down their stalls, and you can hear them starting now that your demon's in the yard. A horse can smell the cellar under the Lion's Pride from here, and that thing smells of it ten times worse, so I'll ask you to take it back to the road." },
      },
      choices = {
        { text = "Then I'll keep my demon away from your horses, Erma.", next = "BACK", reply = "Thank you, and I'll not ask what you've got. Keep it well away and we'll get on fine.", fx = { align = { light = 1 } } },
        { text = "Your horses will have to get used to it.", next = "BACK", reply = "They'll not get used to it, friend, they'll only get hurt. Keep your business away from my stalls.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I've seen a mare grieve a foal for a full season, and a dog wait at a door for a master who wasn't coming home. I don't know what the Brothers would call that, but I know what I'd call it, and I'll not be argued out of it." } },
      choices = {
        { text = "Anything that grieves has a spirit worth honoring.", next = "BACK", reply = "That's what I'd call it too, and I'm glad to hear a priest say so. The mare would agree.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Beasts feel, Erma, but souls belong to people alone.", next = "BACK", reply = "Then the Brothers and I will go on disagreeing, and you can join them. I've watched too many beasts grieve to believe it.", fx = { align = { light = -1 } } },
        { text = "Something else, Erma.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It was a knight's from Lordaeron, who came south after the plague, rode in half-dead and left the horse with me against his bill. He said someone would come for it one day, and I've been watching who asks ever since." } },
      choices = {
        { text = "Keep him for the knight, Erma. A promise is a promise.", next = "BACK", reply = "That's what I've told myself these three years, and it's good to hear someone else say it. He'll be here when the knight comes.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The knight isn't coming back. Sell the horse to someone who'll use him.", next = "BACK", reply = "Maybe so, and the bill's long past paid in hay. But I gave my word, and I'll not sell another man's horse.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. If you've a blessing for horses, I'll take it, because I've a gelding with colic and he's past my remedies." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I've a warhorse in the end stall who'll be glad to see plate again; he was a knight's, once." },
        { id = "h_default", text = "I'm Erma, and I keep the stables. Most of my guests have four legs and better manners than the ones with two." },
        { id = "h_hunter", when = { race = "Human", class = "HUNTER" }, text = "Not many humans keep a beast at heel. Bring yours by anytime; I'll treat it like visiting royalty." },
        { id = "h_sing", when = { metBefore = true }, text = "Had a mare in last week who wouldn't eat unless someone sang to her, so I sang, and you didn't hear that from me." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Shh, they're settling. Horses sleep standing up, did you know, and lightly, like old soldiers." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. You're the sort who forgets to feed the horse because you're reading on the saddle." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Keep that creature well outside the stable, please, because my horses have better manners than most people, and less patience for demons." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want a horse that doesn't mind the smell of blood, and I can tell you which ones do." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Bring your beast inside; I've a stall that's dry and a bucket that's clean." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf, and I'll wager the beasts in my stalls like you better than they like me. That grey mare has her ears up already." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. My horses notice when someone's creeping about, so you'd best walk like an honest body when you're in my stable." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Who've you brought with you? No beast? Just spirits, then. Well, they don't need stabling, I suppose." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quietly, though; somebody's asleep in the end stall." },
        { id = "h_again2", text = "Go on. Brush that one while you talk, if you like." },
      },
      choices = {
        { text = "You must have a favourite among them.", next = "favorite" },
        { text = "You seem to look after more than horses here.", next = "guests" },
        { text = "The stable, please.", next = "BUSINESS" },
        { text = "They say mages neglect their mounts.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your horses would shy from a demon, I expect.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Which of your horses would carry a warrior to battle?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the hunters' beasts get on with your horses?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you think beasts have souls, Erma?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Whose warhorse was it, Erma?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do your horses mind being stabled all winter?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "They say a horse can tell an honest body, Erma.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do animals ever sense spirits around you, Erma?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just visiting.", next = "END" },
      },
    },
    favorite = {
      lines = {
        { id = "f_grey", text = "The old grey in the end stall. His rider rode out for Redridge and didn't come back, so I kept him, because someone had to." },
      },
      choices = {
        { text = "That's kind of you.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'd guess he still waits for his rider.", next = "favorite_wait" },
      },
    },
    favorite_wait = {
      lines = {
        { id = "fw_default", text = "Every evening, with his ears to the road, and then he eats his supper and forgets. Horses are wiser than us that way." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    guests = {
      lines = {
        { id = "g_default", text = "Hunters' beasts, more and more: wolves, boars and a cat that thinks it owns the hayloft, and they all behave better than their owners." },
      },
      choices = {
        { text = "I'll bring mine.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I keep stables and hay and whatever's in them, and that's my life, and the animals don't complain about it." } },
    advice = { { id = "tp_ad", text = "Feed your animal before you feed yourself, and it'll remember you for it." } },
    hogger = { { id = "tp_hogger", text = "The horses won't go southwest, where Hogger roams, and I don't make them." } },
    _none = { { id = "tp_none", text = "If it doesn't eat hay, I'm the wrong person." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire brings strange beasts to Goldshire, and every horse in my stable sulks for the whole week. I don't blame them, because I've seen what the Faire feeds those things." } },
    wildhammer = { { id = "tp_wildhammer", text = "The dwarves up in the Hinterlands keep gryphons the way I keep horses, and they say the Wildhammer talk to them like family. I talk to mine too, but they don't answer." } },
    dark_riders = { { id = "tp_dark_riders", text = "I've heard of riders in Duskwood on black horses that never tire, and I'll tell you now, no living horse goes like that. Whatever they're riding, I don't want it in my stable." } },
  },
}

-- Michelle Belle: first aid, upstairs with Josetta. (Forever: ends Camping 101: First Aid.)
P:NPC {
  key = "michelle", id = TODO_NPC("Michelle Belle"), name = "Michelle Belle", title = "Physician",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "kind" }, notices = { "wounds", "lock_stones" },
  impression = {
    first = "I think she keeps count of everyone who skips the bandaging lesson.",
    third = "{name} met Michelle Belle, the Goldshire physician who teaches first aid beside Priestess Josetta.",
  },
  greetings = { { id = "g_bandage", text = "If you're bleeding, sit, and if you're not, sit anyway and learn how to stop it." } },
  notice = {
    { id = "n_wounds", cat = "wounds", place = "before", when = { durability = { max = 0.25 } },
      text = "Look at the state of you! Linen, a clean hand and five minutes is all it takes, and most people won't spare the five minutes." },
    { id = "n_lock_stone", cat = "lock_stones", when = { carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "That green stone in your bag will close a wound faster than my needle, I know, but it does it with somebody's stolen life. Use it if you must, and then come and let me look at you properly." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I think both have their place, but I count everyone who skips my lesson, and spirits won't help them when they bleed." } },
      choices = {
        { text = "Then teach me properly, Michelle. Every life matters.", next = "BACK", reply = "They do, every one, and I'll teach you properly. Sit down and pay attention.", fx = { align = { light = 1 } } },
        { text = "Spirits heal faster. Bandages are for those without them.", next = "BACK", reply = "They might, until they don't, and then you'll wish you'd listened. I'll be here when that day comes.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the wolves don't wait for you to catch your breath, and neither does a kobold with a candle on his head. I've wrapped more of Zaldimar's students than I can count, and the ones who listened to me are the ones who come back." } },
      choices = {
        { text = "Then teach me. I'll learn it properly.", next = "BACK", reply = "Good, that's what I like to hear. Sit down and I'll show you a proper wrap.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll rely on my spells. They've served well enough.", next = "BACK", reply = "Until they don't, and then you'll be counting on someone else's linen. I'll be here when you change your mind.", fx = { align = { order = -1 } } },
        { text = "Something else, Michelle.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because one day your word won't come, when you're tired or knocked down or too far gone to speak it, and a bandage doesn't care how you feel. Learn both, and you'll be the one still standing at the end of the fight." } },
      choices = {
        { text = "You're right. I'll learn the bandage as well as the word.", next = "BACK", reply = "That's wisdom, and rarer than you'd think. Sit, and we'll start with a simple wrap.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Nature mends better than linen. I'll trust my gift.", next = "BACK", reply = "Then I'll pray your gift doesn't fail you on the Goldshire road. I'll have linen ready if it does.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because you stand in front, and the gnolls hit what's in front. Carry linen and learn to wrap a wound one-handed, and you'll spend less time in my chair and more on your feet." } },
      choices = {
        { text = "I'll learn to wrap my own wounds.", next = "BACK", reply = "Good, because the gnolls won't wait for a healer. Sit down and I'll show you how.", fx = { align = { order = 1 } } },
        { text = "I'll leave the wrapping to healers like you.", next = "BACK", reply = "Then you'll be in my chair often, and I'll not mind the company. I'd just rather see you on your feet.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Wash it at once, in clean water, not the pond, and wrap it tight. Wolves on the Goldshire road eat whatever's dead, and their mouths show it, so a bite left a day can cost you the arm." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Wash it at once, in clean water, not the pond, and wrap it tight, because a bite left a day can cost you the arm. Your {pet} gets bitten too, I imagine, and the same linen works on fur, if you're patient with it." },
      },
      choices = {
        { text = "I'll tend my beast's wounds as well as my own.", next = "BACK", reply = "That's a good hunter, and your beast is lucky to have you. Clean water, remember, not the pond.", fx = { align = { light = 1 } } },
        { text = "The beast heals on its own. I'll see to me.", next = "BACK", reply = "It might, and it might lose a leg to rot. Think about that the next time it licks your hand.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because you climb through windows and over fences, and every nail and splinter in Goldshire finds you on the way. If you'd use the door now and then, you'd need my bandages a good deal less." } },
      choices = {
        { text = "I'll use the door when I can. Your advice is sound.", next = "BACK", reply = "Thank you, and I'll believe it when I see you walk in through one. Mind the nails on the stable fence.", fx = { align = { order = 1 } } },
        { text = "Doors are for honest folk. I'll keep my splinters.", next = "BACK", reply = "Then you'll keep coming to my chair, and I'll keep patching you up. Just don't bleed on the rug.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because your craft costs blood, as far as I can tell, and you pay it more freely than you should. I've bandaged more than one of Maximillian Crowe's students who'd cut too deep for a spell, and I tell them all the same thing: a bandage can only do so much." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because your craft costs blood, as far as I can tell, and you pay it more freely than you should. I've bandaged more than one of Maximillian Crowe's students who'd cut too deep for a spell, and I can't help wondering how much of yours went into calling up the creature standing at your side." },
      },
      choices = {
        { text = "I'll be more careful with my blood, Michelle.", next = "BACK", reply = "Good, because I'd rather not be patching you up after every spell. Come to me before it gets bad.", fx = { align = { light = 1 } } },
        { text = "Blood is a fair price for power. I'll pay it.", next = "BACK", reply = "Then you'll be paying it to me too, in linen and lost afternoons. I hope it's worth it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every one of you, because the Light is generous but you're only flesh, and you'll tire before the wounded stop coming. Brother Wilhelm took my lessons last spring, all of them, and he's the only paladin I know who carries more linen than he needs." } },
      choices = {
        { text = "Then I'll learn it. Pride shouldn't cost anyone a life.", next = "BACK", reply = "That's what Brother Wilhelm said, and he's the best of you. Sit, and I'll start you on the basics.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The Light is enough for me. I'll trust in it.", next = "BACK", reply = "I hope it holds, I truly do. If it ever doesn't, you'll know where my chair is.", fx = { align = { honor = -1 } } },
        { text = "Something else, Michelle.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your lot heal with a touch and think linen's beneath you, until the Light runs thin halfway to Redridge." },
        { id = "h_default", text = "I'm Michelle Belle, and I teach bandaging. It's not glamorous, but it's why you'll still be alive next week." },
        { id = "h_josetta", text = "Priestess Josetta prays over the wounded and I wrap them, and between us, most of Goldshire's adventurers go home on their own feet." },
        { id = "h_faint", when = { metBefore = true }, text = "Most of my students faint the first time. The ones who don't, I keep a closer eye on." },
        { id = "h_linen", when = { metBefore = true }, text = "Linen's cheap, so carry plenty; the wolves out there don't care what it costs." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. Your lot come back with neat little cuts, at least, but they're always in places that are hard to bandage." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. Your wounds are the strangest I see, because half of them you've done to yourselves." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and I'll have you in my chair before the week's out, I expect. Your lot always come back." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your wounds are usually teeth marks, and teeth marks go bad quickly, so clean them." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I've heard your kind can close a wound with a word, so I suppose you'll want to skip my lesson, and I'll tell you now I'd rather you didn't." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Learn to wrap a bandage, will you? Your kind always think a spell will fix everything, until the mana runs dry and the bleeding doesn't stop." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Can you bandage? Spirits might heal, but I've seen more lives saved by clean linen than by prayer." },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep your hands clean while you ask, if you don't mind." },
        { id = "h_again2", text = "Go on, and keep the pressure on it while you talk." },
      },
      choices = {
        { text = "Why teach bandaging?", next = "why" },
        { text = "Sam Sarsaparilla says you teach camp kits.", next = "camp", when = { any = { { heardLine = "sam.ct_default" }, { heardLine = "sam.ct_lw" }, { heardLine = "sam.ct_fish" }, { heardLine = "sam.ct_aid" } } } },
        { text = "I'd have thought the Light could do what linen does.", next = "priest", when = { class = "PRIEST" } },
        { text = "Teach me.", next = "BUSINESS" },
        { text = "Why do rogues end up with such awkward wounds?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why do warlocks wound themselves, in your opinion?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why do warriors keep ending up in your chair?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How should I care for a bite from a wolf?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Even a paladin ought to learn to bandage, I suppose.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why bother with bandages if I can heal with a word?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why would a mage need bandages, Michelle?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Spirits can heal as well as bandages, I'd say, Michelle.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Later.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_father", text = "Because most people who die out there don't die of the wound. They die on the walk home, bleeding. Linen fixes that." },
      },
      choices = {
        { text = "And Josetta?", next = "why_josetta" },
        { text = "Teach me.", next = "BUSINESS" },
      },
    },
    why_josetta = {
      lines = {
        { id = "wj_default", text = "She prays and I wrap, and some wounds want both. Some just want someone to hold the linen tight and talk nonsense." },
      },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 1 } } },
    },
    camp = {
      lines = {
        { id = "c_default", text = "A first aid kit to keep by the fire, with bandages, salve and a bit of thread, because a camp with a kit beside it sends people home." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", fx = { learn = { "camping" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
    priest = {
      lines = {
        { id = "p_default", text = "Sometimes, but linen doesn't get tired. The best healers I know carry bandages they're too proud to use, so learn both." },
      },
      choices = {
        { text = "Fair. Teach me.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I wrap wounds upstairs at the Lion's Pride. Josetta prays; I tie the knots." } },
    advice = { { id = "tp_ad", text = "Bandage first and brag later, in that order, every time." } },
    camping = { { id = "tp_camping", text = "Every camp needs a kit, because somebody always cuts a thumb on the first night." } },
    _none = { { id = "tp_none", text = "I only know how to stop the bleeding. The rest is beyond me." } },
    scourge = { { id = "tp_scourge", text = "A soldier back from the north showed me a bite that wouldn't close whatever I tied on it, and Josetta prayed over it three nights before it healed. I've kept extra bandages ever since." } },
    holy_light = { { id = "tp_holy_light", text = "Josetta has the Light and I have linen, and between the two of us most folk walk out of here. I'd not want to be without either one." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Faire week fills my bed with sprained jugglers and farmhands who tried to wrestle the strongman. It keeps my knots in practice, at least." } },
    argent_dawn = { { id = "tp_argent_dawn", text = "There's an order in the north called the Argent Dawn that's asking for healers and anyone with a steady hand. I'm tempted some nights, and then I look round Goldshire and stay." } },
  },
}

-- Maximillian Crowe and Cylina Darkheart: the cellar, with Remen Marcot.
P:NPC {
  key = "crowe", id = TODO_NPC("Maximillian Crowe"), name = "Maximillian Crowe", title = "Warlock Trainer",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "proud" }, values = { "ambitious" }, notices = {},
  impression = {
    first = "He talks of power as a debt he has partly paid.",
    third = "{name} met Maximillian Crowe, who teaches the warlock's craft quietly beneath Goldshire's inn.",
  },
  greetings = {
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Down here we speak quietly and learn quickly. Which are you here to do?" },
    { id = "g_other", when = { ["not"] = { class = "WARLOCK" } }, text = "The ale's upstairs; you've taken a wrong turn." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Power is a debt, and some debts are paid in different coin. The spirits are generous until they aren't, and then the clever ones look elsewhere." } },
      choices = {
        { text = "I'll keep to honest power, Crowe. No debts.", next = "BACK", reply = "Everyone owes something, shaman. You simply haven't been sent the bill yet.", fx = { align = { order = 1 } } },
        { text = "Power's power. I'll take it where I find it.", next = "BACK", reply = "Then you'll find this cellar more welcoming than the rest of Goldshire. Read the terms before you sign them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every day, and I pay it, because I'd rather owe a debt I chose than beg for gifts the way you do. Your forest gives freely until the day it doesn't, and then you'll find you never read the terms." } },
      choices = {
        { text = "A gift isn't a debt. The forest asks only respect.", next = "BACK", reply = "Respect is a price as well. The forest simply never tells you what it's worth.", fx = { align = { honor = 1 } } },
        { text = "Fair point. Power you take is at least power you own.", next = "BACK", reply = "Exactly so. You might have made a decent warlock, in another life.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That it's direct, and I don't sneer at direct. You pay for your strength in sweat and blood; we pay in other coin. Both debts come due, though yours, I'll admit, is easier to read." } },
      choices = {
        { text = "My strength is my own. I'll keep it that way.", next = "BACK", reply = "Keep it, then, for as long as your knees allow. Strength of the body is a short loan.", fx = { align = { light = 1 } } },
        { text = "Strength is strength. I'd take yours too, if offered.", next = "BACK", reply = "Nobody's offering, warrior. Not yet, anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Very, and I'll not pretend otherwise. Yours follows you for food and fondness; ours follow because we hold the leash tight. Let go of yours and it might stay, and let go of ours and you'll wish you hadn't." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Very, and I'll not pretend otherwise; yours follows you for food and fondness, and ours follow because we hold the leash tight. Your {pet} doesn't care for the cellar, I see, which makes it wiser than most of my students." },
      },
      choices = {
        { text = "My beast follows me by choice. That matters.", next = "BACK", reply = "It matters to you. I doubt the beast has given it a moment's thought.", fx = { align = { light = 1 } } },
        { text = "Loyalty or chains, a servant is a servant.", next = "BACK", reply = "A hard view, and an honest one. I've no quarrel with it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "We share a taste for shadows and a distaste for questions, which makes for a fine sort of truce. Keryn Sylvius and I nod to each other on the stairs, and that's as warm as either of us gets." } },
      choices = {
        { text = "A truce is worth keeping. I'll respect your cellar.", next = "BACK", reply = "Good. Sylvius will be glad to hear his students have manners.", fx = { align = { order = 1 } } },
        { text = "Truces are for the weak. Shadows belong to whoever takes them.", next = "BACK", reply = "Take any shadow you like, then, but not one of mine. Mine bite back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They know, and they pretend not to, which is the arrangement Farley prefers. Zaldimar thinks we're dabblers, and I think he's a coward with a library, so we're both satisfied." } },
      choices = {
        { text = "Zaldimar is right to be wary of fel power.", next = "BACK", reply = "Wary of fel, and wary of everything else besides. That's why he'll die in that tower with half his books unread.", fx = { align = { light = 1 } } },
        { text = "Zaldimar's caution keeps him weak. You're right to scorn it.", next = "BACK", reply = "I'm glad someone sees it. Don't tell him I said so, or he'll only lock the library.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because it was here before you swore your oath, and because what we bind stays bound, which is more than can be said of what roams Duskwood at night. Every warlock you drive out of Goldshire goes somewhere you'll never find them, and I would rather be watched." } },
      choices = {
        { text = "The law should decide your fate, Crowe, not my hammer.", next = "BACK", reply = "The law has had years to decide, paladin, and Marshal Dughan has decided we're less trouble here than anywhere else. Take it up with him, if you like.", fx = { align = { order = 1 } } },
        { text = "I'll decide what's darkness here, not some magistrate.", next = "BACK", reply = "Then decide carefully, paladin. A man who appoints himself judge had better be right every time.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, on my stairs. You'll have heard what we do down here and decided already, so let's not waste each other's time." },
        { id = "h_default", text = "I'm Maximillian Crowe. Remen Marcot handles the introductions and I handle the lessons, while Cylina Darkheart handles the things that come when called." },
        { id = "h_debt", when = { metBefore = true, class = "WARLOCK" }, text = "Remember what I told you: power is a debt, and you pay it on your terms, never theirs." },
        { id = "h_lost", when = { metBefore = true, ["not"] = { class = "WARLOCK" } }, text = "Still lost? The stairs are behind you, and they go up, so use them." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in our cellar. You'll have come down the stairs without a sound, I'd wager, which is either impressive or rude." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, down here. Zaldimar must have sent you to spy, or else you've lost your way to the privy." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior on my stairs. You've the look of someone who settles things with a sword, which is crude, but honest." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You've a beast on a leash too, I see, though yours was born and ours were summoned." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid has come down among the barrels, I see. You'll find very little that grows in this cellar, and nothing I'd care to show you in daylight." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The orcs had shamans too, before they found the warlock's path, and perhaps you'll find it too, one day." },
      },
      again = {
        { id = "h_again", text = "Another question? Then lean closer and whisper it." },
        { id = "h_again2", text = "Ask quickly; voices carry up these cellar stairs." },
      },
      choices = {
        { text = "Odd place to train, down in a cellar.", next = "cellar" },
        { text = "What do you teach?", next = "teach" },
        { text = "The Light would have words with you.", next = "priest", when = { class = "PRIEST" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What should I be practising?", next = "practise", when = { class = "WARLOCK" } },
        { text = "Is power a debt, Crowe, or a gift?", next = "debt", when = { class = "WARLOCK" } },
        { text = "What do you make of the other teachers upstairs?", next = "teachers" },
        { text = "Warlocks and rogues must get along well enough, I'd guess.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "The mages upstairs must know what you teach down here.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What does a warlock think of a warrior's way?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "A hunter's beast isn't so different from a warlock's demon.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why should I let your cellar stand, Crowe?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you ever wonder what your power costs the land?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you think shamans become warlocks, Crowe?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll go.", next = "END" },
      },
    },
    cellar = {
      lines = {
        { id = "c_quiet", text = "Upstairs, people would rather not know what we teach. Down here, nobody has to pretend otherwise." },
      },
      choices = {
        { text = "Who's Remen Marcot?", next = "cellar_marcot" },
        { text = "Then I'll keep my nose out of the cellar.", next = "BACK" },
      },
    },
    cellar_marcot = {
      lines = {
        { id = "cm_default", text = "Marcot speaks for us upstairs, so I don't have to; he has the face for it, and I have the patience for nothing." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    teach = {
      lines = {
        { id = "t_default", text = "That the arcane corrupts only the weak. Strength first, then pacts. Reverse the order and you end up like Morganth, in a tower in Redridge, talking to gnolls." },
        { id = "t_other", when = { ["not"] = { class = "WARLOCK" } },
          text = "Nothing you'd want, because the darkness hasn't chosen you. Be grateful for that, and go back up the stairs." },
      },
      choices = {
        { text = "A tower in Redridge?", next = "BACK", fx = { learn = { "morganth" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = {
        { id = "p_default", text = "The Light has had words with me, and I listened politely. Go back upstairs, priest; Priestess Josetta keeps better company than I do." },
      },
      choices = {
        { text = "The door's open, if you ever want it.", next = "BACK", reply = "Kind of you. I'll remember it when the debt comes due, and I suspect you will too.", fx = { align = { light = 1 } } },
        { text = "I'll be watching this cellar.", next = "BACK", reply = "Do. We keep regular hours, and the candles are easy to see from the street.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
      },
    },
    practise = {
      lines = { { id = "practise_l", text = "Drawing a soul shard cleanly, without tearing what you're drawing from. Anyone can kill a thing, but a warlock takes the useful part as it dies, and that takes timing." } },
      choices = {
        { text = "That sounds monstrous.", next = "practise_monstrous" },
        { text = "Timing, then.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    practise_monstrous = {
      lines = { { id = "practise_monstrous_l", text = "It is, a little. So is a butcher's work, and you ate supper tonight. Practise it, or go back upstairs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    debt = {
      big = true,
      lines = { { id = "debt_l", text = "Every spell we cast borrows against something: your health, a soul, a demon's patience. The Light's people think their power is a gift; ours comes with a ledger, and I've watched warlocks die of the interest." } },
      choices = {
        { text = "Then I'll pay as I go, and never owe.", next = "BACK", reply = "Everyone says that at first. Come and tell me again in ten years.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Debts are for people who get caught.", next = "BACK", reply = "Then don't get caught. The ledger is the one thing in this cellar that never forgets.", fx = { align = { honor = -1 } } },
        { text = "You sound like you've fallen behind once yourself.", next = "debt_you" },
      },
    },
    debt_you = {
      lines = { { id = "debt_you_l", text = "Once. I'm still paying, and that's why I teach in a cellar instead of a tower. That's all you'll get from me about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    teachers = {
      lines = { { id = "teachers_l", text = "The mage upstairs pretends we're not here, the priestess prays for us by name, and the paladin behind the smithy looks at the cellar door every time he passes. Only Farley treats us like ordinary lodgers, and I'm grateful." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I teach in a cellar. You may draw whatever conclusions you like from that." } },
    advice = { { id = "tp_ad", text = "Never make a bargain you haven't read twice. Demons write small." } },
    _none = { { id = "tp_none", text = "Not a matter for this cellar." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Legion stands behind every imp you'll ever summon, and the day you forget that is the day one of them reminds you. Everything else I teach is footnotes to that." } },
    scourge = { { id = "tp_scourge", text = "The dead in the north answer their master the way my imps answer me, except that nobody lets them refuse. I find that more frightening than any demon." } },
    scholomance = { { id = "tp_scholomance", text = "There's a school in the north that teaches the darker arts to anyone who'll swear the right oaths, and I've heard its students don't come home. We prefer our students alive, so we keep to a cellar and leave castles to the ambitious." } },
    holy_light = { { id = "tp_holy_light", text = "The Light and I have an understanding: it stays upstairs with the priests, and I stay down here with the candles." } },
  },
}

P:NPC {
  key = "cylina", id = TODO_NPC("Cylina Darkheart"), name = "Cylina Darkheart", title = "Demon Trainer",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "sharp" }, values = { "cunning" }, notices = { "pet" },
  impression = {
    first = "She keeps an imp that bites and likes it for that.",
    third = "{name} met Cylina Darkheart, the demon trainer in the Lion's Pride cellar, and her imp, which bites.",
  },
  greetings = { { id = "g_demon", text = "Mind my imp; he bites. I've told him not to, and he bites anyway." } },
  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp and mine are glaring at each other, but leave them be; it's how they say hello." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It's very fond of biting, and that's what makes it charming. Elementals must be dull by comparison, all obedience and no personality." } },
      choices = {
        { text = "Spirits serve willingly. That's better than biting.", next = "BACK", reply = "Willingly, until the day they'd rather not, and then you'll wish you'd kept something honest enough to bite. Mind your boots on the stairs.", fx = { align = { honor = 1 } } },
        { text = "Biting has its uses. I'll remember that.", next = "BACK", reply = "Good. My imp will be delighted to hear he's taught a shaman something.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because it bites and doesn't pretend otherwise, unlike the smiling folk upstairs at the Lion's Pride. Your bears and cats would bite too, if you hadn't charmed them out of it." } },
      choices = {
        { text = "My beasts aren't charmed. They choose to stand with me.", next = "BACK", reply = "Then you're luckier than most of us, or more foolish. I've never met a creature that chose a leash it could see.", fx = { align = { honor = 1 } } },
        { text = "Bound or charmed, a beast obeys. I don't fuss over the leash.", next = "BACK", reply = "That's the first sensible thing a druid has ever said to me. Come down again whenever you like.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "My voidwalker has, for practice, and it was a very long afternoon for everyone. A warrior can't be frightened and can't be bored, and those are the two things my pets do best." } },
      choices = {
        { text = "Fear won't move me, and neither will a demon.", next = "BACK", reply = "Brave words. My voidwalker had nothing to say to them either, but then it never does.", fx = { align = { light = 1 } } },
        { text = "I'd want a voidwalker at my side, given the chance.", next = "BACK", reply = "You'd tire of it within a week, because it won't laugh at your jokes. Still, I like the ambition.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "No, because your beast learns tricks the honest way, and mine learn them the other way. You'll want a hunter's trainer for that, though I'll admit I'm curious what your beast would do with a little fel in it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "No, because your beast learns tricks the honest way, and mine learn them the other way, so you'll want a hunter's trainer. Your {pet} hasn't stopped growling at my imp, which makes it the only sensible creature in this cellar." },
      },
      choices = {
        { text = "My beast stays clean of anything fel.", next = "BACK", reply = "Then keep it well away from my imp, because he's been eyeing it the way Dobbins eyes a pie.", fx = { align = { light = 1 } } },
        { text = "A little fel might make it stronger. I would try it.", next = "BACK", reply = "It might, and it might grow a second jaw. Come back when you're ready for either.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Mine have teeth, and yours only hide you, which is the difference between a cloak and a cage. You'd do well to remember that before you try walking unseen past one of my students' imps." } },
      choices = {
        { text = "I'll stay clear of your cage. I've no wish to test it.", next = "BACK", reply = "Wise. The last rogue who tested it is still explaining the scorch marks to Sylvius.", fx = { align = { light = 1 } } },
        { text = "Shadows with teeth sound useful. I'd like a pair.", next = "BACK", reply = "Everyone does, until the teeth turn round. Learn the binding first, and then we'll talk.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Every imp remembers the last mage who singed it, and most of them have been singed by one of Zaldimar's students at least once. Leave them be and they'll leave you be, mostly." } },
      choices = {
        { text = "I'll leave your pets alone, Darkheart.", next = "BACK", reply = "Thank you. They'll leave your eyebrows alone in return, which is more than Zaldimar's students can promise.", fx = { align = { light = 1 } } },
        { text = "If they bother me, I'll singe them again.", next = "BACK", reply = "Try it, and you'll learn how long an imp can hold a grudge. Longer than you'll live, I promise you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every day, and that's why I'm still alive, because the ones who stopped fearing them are the ones the Brothers bury. You pray to something you hope is kind, and I bind something I know isn't, and I'd call mine the more honest arrangement." } },
      choices = {
        { text = "Then I'll pray for you, whether you want it or not.", next = "BACK", reply = "Pray all you like, priest. My imp finds it soothing, and he's the only one down here who listens.", fx = { align = { light = 1 } } },
        { text = "At least you know what your demon wants. I'll take that.", next = "BACK", reply = "Careful, priest. Talk like that upstairs and the Brothers will be praying for you next.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Quietly, and with far more care than the men upstairs take with their ale. Nothing I keep has ever hurt anyone in Goldshire, paladin, and I'd ask you to judge me on that, not on what you've heard." } },
      choices = {
        { text = "The Marshal should know about this cellar. The law can judge.", next = "BACK", reply = "Then go and tell him, paladin, and give Dughan my regards. He's known about this cellar longer than you've carried that hammer, and he'd rather we stayed where he can find us.", fx = { align = { order = 1 } } },
        { text = "What you bind is your business, so long as nobody's hurt.", next = "BACK", reply = "Then we understand each other, which I've never managed with a paladin before. My imp will spare your boots today.", fx = { align = { order = -1 } } },
        { text = "Something else, Darkheart.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, down here among my pets. Be careful what you say, because they understand more than you'd like, and they hold grudges." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in my training room. Keep your hand off your hammer, and my imp will keep his fire off your boots." },
        { id = "h_default", text = "I'm Cylina Darkheart, and I teach your demons new tricks, though not the kind you'd show a crowd." },
        { id = "h_keys", when = { metBefore = true }, text = "My imp took Dobbins' keys again, and Dobbins thinks he's losing his mind. I haven't had the heart to tell him." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. Your shadows are thin compared to what I keep down here, but they're shadows all the same." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage in my training room. Try not to set anything alight, because my pets have long memories." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior in the training room. My imp is already planning to set your boots alight; I'd stand away from it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your pet and mine are already staring at each other; let's see which blinks first." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and my imp's hissing at you, which I take as a compliment to us both." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. My imp bites, you know. Do your spirits bite too, or are they too polite?" },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, he's getting restless." },
        { id = "h_again2", text = "Go on, and ignore the imp." },
      },
      choices = {
        { text = "What's your imp's name?", next = "imp" },
        { text = "What exactly do you teach?", next = "tricks" },
        { text = "Show me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What should I be teaching my demons first?", next = "practise", when = { class = "WARLOCK" } },
        { text = "Do you ever let a demon go free?", next = "free" },
        { text = "What do you keep down here that's darker than my shadows?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Your demons look like they hold grudges against mages.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Have your demons ever fought a warrior?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Would you teach my beast new tricks, Darkheart?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever fear the demons you keep, Darkheart?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How can you keep demons beneath the inn the whole town drinks in?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why keep a creature that bites you?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Your imp seems very fond of biting, Cylina.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll go.", next = "END" },
      },
    },
    imp = {
      lines = {
        { id = "i_name", text = "He has one, but say it aloud and he gets smug, and he's smug enough already." },
      },
      choices = {
        { text = "Could he have a different one?", next = "imp_rename" },
        { text = "Fair.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    imp_rename = {
      lines = {
        { id = "ir_default", text = "For a price, a warlock can be rid of a demon and call up a fresh one, with a new name and the same teeth. Are you tired of yours?" },
      },
      choices = {
        { text = "Not yet.", next = "BACK" },
        { text = "I'll think about it.", next = "BUSINESS", when = { class = "WARLOCK" } },
      },
    },
    tricks = {
      lines = {
        { id = "t_default", text = "Grimoires. A demon learns from the page, if you read it aloud and mean it. None of it's any use without a demon of your own." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    practise = {
      lines = { { id = "practise_l", text = "Whatever keeps you alive, never whatever looks impressive. Your voidwalker's Sacrifice before your imp's fancier fire, every time, because a dead warlock's demons go home laughing." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    free = {
      big = true,
      lines = { { id = "free_l", text = "Free? A freed demon goes straight back to whoever made it and tells them everything about you. I dismiss them, cleanly, and I don't feel sorry about it." } },
      choices = {
        { text = "Nothing should be bound forever.", next = "BACK", reply = "Say that to the demon, and see how long you keep your tongue.", fx = { align = { order = -1, light = 1 } } },
        { text = "Good. A bound demon can't hurt anyone.", next = "BACK", reply = "Not anyone it isn't told to hurt, at least. You're learning.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Not even the imp?", next = "free_imp" },
      },
    },
    free_imp = {
      lines = { { id = "free_imp_l", text = "Especially not the imp; he knows where Dobbins keeps the keys. Something else, before he hears us." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live in a cellar with an imp. Do you really want more than that?" } },
    advice = { { id = "tp_ad", text = "Never tell a demon its own name. It's rude, and it gives them ideas." } },
    _none = { { id = "tp_none", text = "My imp might know, though he won't tell you either." } },
    burning_legion = { { id = "tp_burning_legion", text = "My imp boasts of the Legion's armies as though he commands them, and he can't keep a candle lit. Still, every boast is a story, and somebody bigger told it to him first." } },
    scourge = { { id = "tp_scourge", text = "Necromancy is a sloppy trade, if you ask me, and the Scourge is the sloppiest of it. All those bodies, and not one of them can be trusted to make tea." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's fortune teller is a fraud, but she's a charming fraud, and my imp hates her. That's reason enough for me to visit every time." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran wouldn't have me as a student, and I'd like that written down somewhere so they're remembered for it." } },
  },
}

-- The trainers at the house by Crystal Lake.
P:NPC {
  key = "leebrown", id = TODO_NPC("Lee Brown"), name = "Lee Brown", title = "Fishing Trainer",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "kind" }, notices = { "craft", "lock_breath" },
  impression = {
    first = "His catch grew longer while he was still describing it.",
    third = "{name} met Lee Brown, the fishing trainer at Crystal Lake, who loves the dawn mist and a well-stretched story.",
  },
  greetings = { { id = "g_lake", text = "Quiet now, or you'll scare the fish." } },
  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "Another angler! Crystal Lake's best at dawn, but don't tell anyone; well, you can tell them, since they won't get up." },
    { id = "n_lock_breath", cat = "lock_breath", when = { aura = { 5697 } },
      text = "You're breathing slow and easy like a carp in a bucket, and the cellar folk tell me that's a spell for walking about under the lake. I'd give a month's pay for it, because the big pike live where my line won't reach." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They never come when called, only when they're forgotten, and that's the trick of it. Your water spirits might know better." } },
      choices = {
        { text = "Patience brings the fish, Lee. I'll learn from you.", next = "BACK", reply = "Learn from the lake, friend, not from me, because it's the better teacher. Sit by it long enough and it'll tell you everything.", fx = { align = { order = 1 } } },
        { text = "Call them loud and see what happens.", next = "BACK", reply = "What happens is every fish between here and Stormwind heads for the far bank. Try it if you like, but don't blame me for an empty basket.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I think fishing suits anybody who can sit still and keep quiet, and your kind seem to have the keeping-quiet part already. It's a good thing for a busy head, friend, and I'd guess yours is busier than most." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I think fishing suits anybody who can sit still and keep quiet, and your kind seem to have the keeping-quiet part already. Your demon's another matter, mind, because every fish in this pond has gone to the bottom since it came near the water." },
      },
      choices = {
        { text = "It might do me good. I'll try it.", next = "BACK", reply = "That's all it asks of anyone, and the lake won't care what's in your books. Come down at dawn and I'll lend you a pole.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My head's busy for good reason. I've no time for ponds.", next = "BACK", reply = "I'd guess it is, and I'll not pry into why. The pond will still be here when your head quiets down.", fx = { align = { light = -1 } } },
        { text = "Something else, Lee.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Still plenty, because I teach every youngster to throw back the little ones, though Matt, the boy by the pond, throws back the big ones by accident. The Goldshire pond's another matter, so try Crystal Lake if you want supper." } },
      choices = {
        { text = "Throw back the young and the lake feeds you forever.", next = "BACK", reply = "That's the whole secret, and you'd be surprised how few folk learn it. Matt's still working on it.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "If the fish bite, keep them. Lean seasons come regardless.", next = "BACK", reply = "They do, and a hungry family keeps what it catches, I'll not argue. I only ask that you leave the little ones.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Patience, which most of your lot have never been made to learn. You charge, the fish swims off, and you go home with nothing, so sit, wait, and let the thing come to you." } },
      choices = {
        { text = "I'll sit and wait. Patience is worth learning.", next = "BACK", reply = "That's more than most warriors manage, and the fish will thank you by biting. Sit beside me and watch the float.", fx = { align = { order = 1 } } },
        { text = "I'd rather wade in and grab one.", next = "BACK", reply = "You'd come up soaked with weed and nothing else, but I'd pay a copper to watch you try. Go on, then.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Just the same, only wetter, and the prey's dumber, though don't tell the fish I said so. You watch, you wait, you know the water, and when it comes you don't fumble, same as with a deer." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Just the same, only wetter: you watch, you wait, you know the water, and when it comes you don't fumble. Your {pet} keeps watching the water, I see, so perhaps it fishes; some of the cats do, and better than me." },
      },
      choices = {
        { text = "I'll take only what I can eat.", next = "BACK", reply = "That's the hunter's way, and the lake's too. You'll do well down here.", fx = { align = { honor = 1 } } },
        { text = "I'll take the biggest one and brag about it.", next = "BACK", reply = "Then you'd best catch it first, and I'll back my youngsters against you. Brag all you like after.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It's the same thing, only quieter and with less blood, because you sit still and let the fish come to you. The Defias would make good fishermen if they'd put down their knives for an afternoon." } },
      choices = {
        { text = "There's more peace in fishing than in robbery. I'll take it up.", next = "BACK", reply = "I'd like that, and so would the farmers you'd not be robbing. Come down any morning.", fx = { align = { light = 1 } } },
        { text = "Fishing's fine, but a quick knife pays better.", next = "BACK", reply = "Maybe it does, but nobody ever hanged a man for catching a trout. Think on it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Clever, maybe, but you'd kill every fish in it and leave nothing for next spring, and Goldshire would have to eat Toddrick's mutton forever. A good fisherman takes what he needs and leaves the rest for tomorrow." } },
      choices = {
        { text = "You're right. Take what's needed and leave the rest.", next = "BACK", reply = "That's sense, and it's good to hear it from a mage. Goldshire thanks you, and so does Toddrick's mutton.", fx = { align = { order = 1 } } },
        { text = "Clever's clever. I'd empty the pond if I needed to.", next = "BACK", reply = "Then I'll pray you never need to, and keep my youngsters well away from you. A pond doesn't come back as quick as you'd think.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It might be, now you say it, because I come down at dawn and wait and hope, and some days something answers and some days it doesn't. The difference is that I've never once blamed the lake." } },
      choices = {
        { text = "Patience like that is near enough to faith, Lee.", next = "BACK", reply = "I'll take that, and gladly, though I'd not tell the Brothers. Maybe the lake's been listening all along.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Waiting isn't faith, Lee. It's only waiting.", next = "BACK", reply = "You might be right, and I'll not argue with a priest. It's done me well enough, all the same.", fx = { align = { light = -1 } } },
        { text = "Something else, Lee.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It isn't, since the murlocs came up the river and two of Guard Thomas's men went to look and didn't come back. I keep to this end of the lake now, by the pier, where nothing has ever tried to drown me." } },
      choices = {
        { text = "I'll clear the lake so the fishers can go back.", next = "BACK", reply = "Would you? I'd go back tomorrow if I thought it was safe, and so would half of Goldshire. Thomas would want to know what you find.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The lake's the murlocs' now. Fish where it's safe.", next = "BACK", reply = "It is, for now, and I'll not argue with you there. The pond's dull, but I come home every night.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest at the pond! Sit and fish a while, and you'll find it's not so different from praying, only with a line." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Put the hammer down a while, because you can't smite a fish, believe me, I've tried." },
        { id = "h_default", text = "I'm Lee Brown. I fish, and I teach fishing, and on good days I can't tell which I'm doing." },
        { id = "h_long", when = { metBefore = true }, text = "I caught one this long yesterday, no, longer. It grows every time I tell it, and that's fishing." },
        { id = "h_dawn", when = { timeOfDay = "dawn" }, text = "This is the best hour there is, with mist on the lake and fish rising and nobody here but me, and now you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You've the patience for fishing, I'd bet, because your sort spend half their lives waiting for the right moment." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. You could probably freeze the whole pond and pick the fish out like plums, but where's the sport in that?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior at the pond! Put the sword down a while, because the fish don't fight back, and that's the joy of them." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter at the pond! You'll know about waiting, then, and you'll know about lying about the size of things." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf, and you walked up so quietly the fish didn't even notice. That's a gift I'd pay to learn." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, at the pond! You're welcome to fish, but please don't put anything in the water that wasn't there this morning." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Shh. A shaman, and the fish are listening. Speak softly, and maybe your water spirits will send me a big one." },
      },
      again = {
        { id = "h_again", text = "Anything else? Ask it softly, mind." },
        { id = "h_again2", text = "Go on; the line's quiet anyway." },
      },
      choices = {
        { text = "Fishing seems a quiet life.", next = "why" },
        { text = "Any murlocs in Crystal Lake?", next = "murlocs" },
        { text = "Sam Sarsaparilla says fishing helps a camp.", next = "camp", when = { any = { { heardLine = "sam.ct_default" }, { heardLine = "sam.ct_lw" }, { heardLine = "sam.ct_fish" }, { heardLine = "sam.ct_aid" } } } },
        { text = "Teach me.", next = "BUSINESS" },
        { text = "Fishing seems much like a rogue's waiting game.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Freezing the pond would be a clever way to fish.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can fishing teach a warrior anything?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is fishing really so like hunting, Lee?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you pray out here, Lee, or just fish?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Crystal Lake doesn't seem safe these days, Lee.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is the lake fished out, or does it still give plenty?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I doubt fishing would suit a warlock, Lee.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the fish ever come when called, Lee?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good fishing.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_quiet", text = "Nobody shouts at a fisherman, so it's the calmest work in Elwynn. The fish don't shout, though the ducks have opinions about my bread." },
      },
      choices = {
        { text = "Where's the best spot?", next = "why_spot" },
        { text = "Teach me.", next = "BUSINESS" },
      },
    },
    why_spot = {
      lines = {
        { id = "ws_default", text = "This pier, at dawn. Jason at the far end will tell you otherwise, but Jason's wrong, and he knows it." },
      },
      choices = { { text = "Good fishing.", next = "BACK", fx = { affinity = 1 } } },
    },
    murlocs = {
      lines = {
        { id = "m_default", text = "Plenty, on the far shore, and they take my bait and hoard kelp, of all things. William Pestle at the inn sends folk after that kelp." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "murlocs_east" } } } },
    },
    camp = {
      lines = {
        { id = "c_default", text = "A fish bowl by the fire, so laugh all you like, but watch a fish go round for a while and tell me you're not calmer." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", fx = { learn = { "camping" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a fisherman: this pier, this lake and these fish, mostly these fish." } },
    advice = { { id = "tp_ad", text = "Patience, because the fish have more of it than you, so you'll need to borrow some." } },
    _none = { { id = "tp_none", text = "Ask me about bait; anything else and I'm out of my depth, ha." } },
    booty_bay = { { id = "tp_booty_bay", text = "I hear the fishing off Booty Bay is the finest in the world, if you can keep the sharks off the line and the pirates off the boat. Here I only have to worry about Matt." } },
    murlocs_east = { { id = "tp_murlocs_east", text = "Something's been chewing my nets near the eastern shore, and I've heard gurgling in the reeds after dark. Remy says murlocs, and for once I believe Remy." } },
    ratchet = { { id = "tp_ratchet", text = "The goblins at Ratchet sell fishing poles with springs in them, and I've heard one took a man's thumb clean off. I'll keep my willow stick, thank you." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Faire's at Goldshire I sell them a barrel of fish every morning, and their cook still says the lake fish taste of mud. He eats them all the same." } },
  },
}

P:NPC {
  key = "helene", id = TODO_NPC("Helene Peltskinner"), name = "Helene Peltskinner", title = "Skinning Trainer",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "honest" }, notices = { "craft", "lock_shards" },
  impression = {
    first = "She looked at my knife before me, and thought little of it.",
    third = "{name} met Helene Peltskinner, the skinning trainer by Crystal Lake, who insists every hide be taken with a sharp knife.",
  },
  greetings = { { id = "g_hides", text = "Careful, those hides are drying. Is there something you need?" } },
  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "Show me your knife. Hm, it's too dull, and hides tear when the knife's dull, so sharpen it tonight." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "That pack of yours smells like a tanning vat and hums like a hornets' nest, so I'll guess you've been cutting more than skins. The student who wanted the wolf's heart left in carried a bag just like it." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If they do, they've never told me. I waste nothing, and a hide well taken honours the beast more than one left to rot." } },
      choices = {
        { text = "Waste nothing, Helene. That's honest work.", next = "BACK", reply = "That's how I see it, and it's how Eagan taught me. Bring me a good hide and I'll show you.", fx = { align = { honor = 1 } } },
        { text = "Spirits can mind all they like. Skin it anyway.", next = "BACK", reply = "They can, and I'll not tell you otherwise, but I'll waste none of what you bring. Use the knife properly, at least.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Burnt hair stinks and burnt hide cracks, so yes, and I can't sell either one. Freeze a wolf and I'll thank you, because a frozen pelt keeps beautifully, and then you'll have done some good for Goldshire's tanners." } },
      choices = {
        { text = "I'll bring them whole. A pelt shouldn't be wasted.", next = "BACK", reply = "Thank you, and the tanners will thank you too. A whole pelt is worth twice a scorched one.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I fight to win, Helene, not to save your pelts.", next = "BACK", reply = "Then win, and I'll take whatever's left. Only don't expect me to pay for ashes.", fx = { align = { order = -1 } } },
        { text = "Something else, Helene.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Gladly, because it's the same hide whether a hunter took it or the winter did, and I'd rather it kept someone warm than rotted in the bracken. My husband Eagan says I'm sentimental about it, but he's the one who buries the ones too far gone." } },
      choices = {
        { text = "Better used than wasted. That's a fair thanks to give.", next = "BACK", reply = "I'm glad you see it that way, and it's good to hear it from a druid. Eagan will roll his eyes, but he'll agree.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Old or young, a hide's worth coin. Take whatever comes.", next = "BACK", reply = "Old ones make poor leather, so it's not just coin, friend. I take them because they'd rot otherwise.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "If he's killing wolves anyway, then aye, because a pelt left on the road is coin left in the dirt. Most warriors hack at it with a sword and bring me a rag, so learn the knife and you'll do better." } },
      choices = {
        { text = "I'll learn the knife and waste nothing.", next = "BACK", reply = "That's what I hoped you'd say, and I'll teach you myself. It's easier than swinging a sword, I promise.", fx = { align = { honor = 1 } } },
        { text = "I'll leave the skinning to people like you.", next = "BACK", reply = "Then bring me the wolves whole and I'll do it for you. Just not the rags, please.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A clean kill, first, with no holes where a dozen arrows went in. The Prowlers south of Goldshire have the best coats this side of the river, and they're worth twice a mangy wolf, if they're whole." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A clean kill, first, with no holes where a dozen arrows went in. Your {pet}'s coat is glossy as anything, so somebody's feeding it right, and I'm guessing that's you." },
      },
      choices = {
        { text = "One clean shot. A good coat deserves it.", next = "BACK", reply = "That's a hunter who knows the trade, and I'll pay you well for it. The Prowlers are worth the patience.", fx = { align = { honor = 1 } } },
        { text = "I'll put in as many arrows as it takes.", next = "BACK", reply = "Then you'll bring me a sieve and I'll pay you for one. A clean shot is cheaper in arrows too.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It's sharp and small and easy to hide, which makes it as useful to a cutpurse as it is to me. I'd sooner see it on a wolf's pelt than in a Defias purse-string, but the knife doesn't care either way." } },
      choices = {
        { text = "Mine stays on pelts, Helene. I'll skin clean and fair.", next = "BACK", reply = "Then I'll sell you a good one, and gladly. Keep it on the pelts and we'll get on fine.", fx = { align = { honor = 1 } } },
        { text = "A knife's a knife. I'll use it however I need.", next = "BACK", reply = "It is, and I can't stop you, only hope. Mind you use it on wolves first.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A student from the cellar under the inn once asked me for a wolf skin with the heart left in, and I told him to find his own wolf. Eagan says I should have asked what it was for, but I'd rather not know." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "A student from the cellar under the inn once asked me for a wolf skin with the heart left in, and I told him to find his own wolf. Now his sort bring their demons right up to my drying racks, and yours is watching the hides in a way I don't care for at all." },
      },
      choices = {
        { text = "You were right to refuse him. That's a foul business.", next = "BACK", reply = "Thank you, because I've wondered since if I was too sharp with him. I'll not lose any sleep over it now.", fx = { align = { light = 1 } } },
        { text = "Every part of a beast has its uses. He wasn't wrong.", next = "BACK", reply = "He might not have been, but I didn't like his face. Find your own wolf, then, and leave mine be.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Only when it's waste, when somebody kills a wolf for sport and leaves it to rot on the road. If a beast dies, I want every part of it used, because that's the only thanks I know how to give." } },
      choices = {
        { text = "Using every part honors the creature. That's good, Helene.", next = "BACK", reply = "Thank you, and I'm glad the Light agrees. It's the only prayer I know how to make.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A dead wolf is a dead wolf. Don't fuss over it.", next = "BACK", reply = "Then we'll not agree on that, priest, and I'll not pretend to. Bring me your wolves whole and I'll handle the rest.", fx = { align = { light = -1 } } },
        { text = "Something else, Helene.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Worse, some winters, because down here they've the farms to raid, and a farmer with one cow can't afford to lose it. Eagan says they're being pushed out of the hills, and if he's right, then killing them only buys time." } },
      choices = {
        { text = "Then the cause must be found and dealt with properly.", next = "BACK", reply = "That's what I'd like to see, and Eagan would agree. It's not wolves we need to fight, it's whatever's pushing them.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Time is enough. Kill wolves until the farms are safe.", next = "BACK", reply = "It'll be enough for this winter, and maybe the next. But the farms will still lose cows if nobody looks up the hill.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll not want to watch me work, I expect, so I'll keep the knife low." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll have stripped a few gnolls of their gear, I expect, but never a wolf of its coat." },
        { id = "h_default", key = true, text = "I'm Helene Peltskinner. Wolves, boars and the odd bear: everything out there has a coat, and every coat's worth something." },
        { id = "h_eagan", when = { heardLine = "eagan.h_default" },
          text = "You've met Eagan up in Northshire? He's my husband, and he's busy up by the abbey, so the wolves down here are mine." },
        { id = "h_pelts", when = { metBefore = true }, text = "Wolf pelts sell best in winter and boar hides all year, but murloc skin never, so don't bring me murloc." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. You'll have a good skinning knife already, I expect, but you probably use it for other things." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. I hope you're not after pelts for anything strange, because I've had requests I'd rather forget." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll have a few pelts in your pack from the road, I'd wager, and none of them skinned properly." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Now we'll understand each other; you take them clean and I'll show you how to take the coat clean too." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf, and a druid, by the way you're eyeing my drying racks. I'll tell you what I tell everyone, which is that nothing here was killed for sport." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Fire ruins a hide, so if you're going to bring me anything, bring it frozen or bring it whole." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. That knife won't do for skinning, spirits or not. Let me see it properly." },
      },
      again = {
        { id = "h_again", text = "Anything else? Mind the drying rack while you think." },
        { id = "h_again2", text = "Ask what you like. I can scrape a hide and listen at the same time." },
      },
      choices = {
        { text = "How did you learn?", next = "learn" },
        { text = "Adele says you've been her strength.", next = "adele", when = { heardLine = "adele.hb_default" } },
        { text = "Sam Sarsaparilla says hides make a camp.", next = "camp", when = { any = { { heardLine = "sam.ct_default" }, { heardLine = "sam.ct_lw" }, { heardLine = "sam.ct_fish" }, { heardLine = "sam.ct_aid" } } } },
        { text = "Teach me.", next = "BUSINESS" },
        { text = "A skinning knife would serve a rogue well enough.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What strange requests have you had for pelts?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Should a warrior learn to skin what he kills?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What makes a pelt worth the skinning, Helene?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Skinning must trouble you now and then, Helene.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the wolves trouble Goldshire as much as Northshire, Helene?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you skin a beast that died of old age?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I hear fire spoils a pelt badly, Helene.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you think spirits mind skinning, Helene?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Later.", next = "END" },
      },
    },
    learn = {
      lines = {
        { id = "l_mother", text = "Same as anyone: a sharp knife, a patient teacher, and a great many ruined hides. The ruined ones taught me most." },
      },
      choices = {
        { text = "Any advice for a beginner?", next = "learn_advice" },
        { text = "Teach me.", next = "BUSINESS" },
      },
    },
    learn_advice = {
      lines = {
        { id = "la_default", text = "Work with the grain, not against it, and skin it while it's warm, because cold hides fight you." },
      },
      choices = { { text = "Makes sense.", next = "BACK", fx = { affinity = 1 } } },
    },
    adele = {
      lines = {
        { id = "ad_default", text = "She says that? Her husband's at the front, and somebody had to sit up with her of an evening. I had a sword and the evenings free." },
      },
      choices = { { text = "That's a good friend.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    camp = {
      lines = {
        { id = "c_default", text = "A camp chair, out of good hides. Sit in one after a day's skinning and you'll know why it matters." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", fx = { learn = { "camping" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I skin, I teach skinning, and I keep Adele company. My husband keeps the wolves busy up north." } },
    advice = { { id = "tp_ad", text = "Sharpen your knife every night. A dull knife ruins more hides than any wolf." } },
    _none = { { id = "tp_none", text = "I know hides, but not that." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire buys every pretty pelt I can spare for their tents and costumes, and they pay better than the tailors in the city. I like their people, too, even the loud ones." } },
    hogger = { { id = "tp_hogger", text = "Hogger's hide would make a fine rug and a finer story, but I wouldn't want to be the one to fetch it. A gnoll that clever has earned a bit of respect." } },
    holy_light = { { id = "tp_holy_light", text = "Adele and I go to Priestess Josetta's prayers when there's word from the front, and when there isn't, we go anyway. It helps to sit somewhere quiet together." } },
  },
}

P:NPC {
  key = "adele", id = TODO_NPC("Adele Fielder"), name = "Adele Fielder", title = "Leatherworking Trainer",
  bible = "bibles/goldshire_folk.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "steady" }, values = { "ambitious" }, notices = { "craft", "lock_shadow" },
  impression = {
    first = "Her patience seems endless, though her opinions are not.",
    third = "{name} met Adele Fielder, the leatherworking trainer by Crystal Lake, who stitches and listens at the same time.",
  },
  greetings = { { id = "g_leather", text = "Helene skins it and I stitch it, so do you want to learn the stitching half?" } },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Your seams are crooked, as everyone's are at first. They'll be straighter by midsummer, if you practise." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "Your shadow trails a half-step behind you, and I've watched it lag all the way across the floor. Good leather won't fix that, but I'd still sooner you walked in my boots than barefoot." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Most of it is, bless them. A shaman might have patient hands, but patience and skill are two different things." } },
      choices = {
        { text = "Then teach me properly, Adele. I'll learn the right way.", next = "BACK", reply = "That's the spirit, and I'll show you how to do it right. Sit down and we'll start with a simple belt.", fx = { align = { order = 1 } } },
        { text = "My stitching holds. That's good enough.", next = "BACK", reply = "It'll hold until it doesn't, and then your boot falls apart in a bog. Come back when you want it done right.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I mind a little, because I've heard what goes on down in that cellar and wish I hadn't. But leather's leather and coin's coin, and I'd sooner your sort walked about in good boots than came upstairs barefoot and frightened the guests." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I mind a little, because I've heard what goes on down in that cellar and wish I hadn't, and now one of the things from it is standing in my shop. But leather's leather and coin's coin, so keep your {pet} by the door while I fetch your boots, and we'll say no more about it." },
      },
      choices = {
        { text = "You're right to mind, Adele. It's honest of you.", next = "BACK", reply = "It's kind of you to say, and it makes the minding easier. I'll sell you good boots, and gladly.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Coin is coin. Don't trouble yourself over it.", next = "BACK", reply = "I try not to, but it nags at me some nights. Still, the boots are good, so buy them and go on.", fx = { align = { light = -1 } } },
        { text = "Something else, Adele.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every hide I've got, because the loggers strip the bark before the logs go to Stormwind and sell it to me by the sack. It's the one good thing to come out of that mill, though I'd not say so to Supervisor Raelen." } },
      choices = {
        { text = "Good. A trade that uses every part keeps things in balance.", next = "BACK", reply = "That's how I see it, and it's good to hear a druid say it. Nothing wasted, nothing taken that isn't needed.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Trade or not, the mill takes too much. Somebody should stop it.", next = "BACK", reply = "Maybe so, and Raelen won't hear it from me. Still, the mill pays the loggers, and the loggers pay me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "All the use in the world, underneath: belts, straps, bracers, boots. A warrior's mail is only as good as the leather holding it on, and I've seen a breastplate fall off in a fight because of one bad strap." } },
      choices = {
        { text = "I'll keep my straps sound and my buckles mended.", next = "BACK", reply = "That's sense, and I've belts to suit you. Bring them in whenever they start to give.", fx = { align = { order = 1 } } },
        { text = "Mail does the work. Straps are an afterthought.", next = "BACK", reply = "Until the strap snaps and your mail's on the floor, and then you'll think on it. I'll be here when you do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Gladly, if you'll learn patience, because leather's slow and won't be hurried. Bring me boar hide from the Elwynn hills to start, since it's thick and forgiving, and you'll have a belt by Sunday." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Gladly, if you'll learn patience, because leather's slow and won't be hurried. Your {pet} will want a collar soon, and if you make it yourself, it'll fit better than anything I sell." },
      },
      choices = {
        { text = "I'll learn the craft properly, however slow.", next = "BACK", reply = "Patience is all I ask, and you've got it. Bring me that boar hide and we'll begin.", fx = { align = { order = 1 } } },
        { text = "I'll just sell you the hides and save the bother.", next = "BACK", reply = "That's fine too, and I'll pay fair for whole hides. You'll be missing the best part, though.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Soft leather and a sole stitched in a way I won't tell you about, because Andrew Krighton the armorer would steal it. Half of Keryn Sylvius's students wear my boots, and I sleep a little worse for knowing it." } },
      choices = {
        { text = "I'll keep your secret safe from Krighton, Adele.", next = "BACK", reply = "Thank you, and I'll trust you to mean it. Krighton's a good man, but he's a thief when it comes to stitches.", fx = { align = { honor = 1 } } },
        { text = "Krighton could pay me well for that stitch.", next = "BACK", reply = "He could, and he'd use it on his shoddy boots. I'll keep my secret, thank you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The wise ones do, because they walk from Northshire to the tower and back and wonder why their feet bleed. Robes look lovely, but they don't keep the mud of Elwynn out of your toes." } },
      choices = {
        { text = "Practical gear comes first. I'll buy a sturdy pair.", next = "BACK", reply = "Sensible, and your feet will thank you. I've a pair that'll last you to the tower and back.", fx = { align = { order = 1 } } },
        { text = "I'll suffer the mud. Fine robes are worth it.", next = "BACK", reply = "Then I'll have a pair waiting for when your toes complain. They always do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Once, when a logger came through bleeding and Michelle Belle, our physician, was out on the road, and I stitched him with waxed thread like a saddle. He lived, and he still limps, and he's never once bought boots from anyone else." } },
      choices = {
        { text = "You should have waited for a proper healer, Adele.", next = "BACK", reply = "And let him bleed out while I waited? I did what I could, and he's alive to grumble about it.", fx = { align = { order = 1 } } },
        { text = "You did right. Need comes before anyone's rules.", next = "BACK", reply = "That's how I saw it, and I'd do it again. He's a fine walking advertisement for my thread.", fx = { align = { order = -1 } } },
        { text = "Something else, Adele.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Sword belts for Marshal Dughan's men, and boots for Deputy Rainer's at Westbrook, when the kingdom remembers to pay. I sent twenty pairs to Westbrook last month and got a letter back that said thank you and nothing else, which is a soldier's way of saying they're still owed." } },
      choices = {
        { text = "The kingdom keeps its debts, Adele. It will pay.", next = "BACK", reply = "I hope you're right, and I'll keep a copy of the bill in case. The soldiers deserve their boots either way.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Don't wait on the crown. Sell to whoever pays.", next = "BACK", reply = "I've thought of it, but those men need boots more than I need a full purse. I'll keep sending them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I've a soft leather satchel just right for bandages and prayer books, if you're the sort who carries both." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your gauntlets have leather under them, you know, and that's where the sweat goes, so let me have a look." },
        { id = "h_default", key = true, text = "Adele Fielder. I make boots, belts and jerkins, the things adventurers wear out fastest and complain about loudest." },
        { id = "h_fix", when = { metBefore = true }, text = "Most of my work is fixing what adventurers stitched themselves, and then telling them it wasn't so bad." },
        { id = "h_helene", when = { heardLine = "helene.h_default" }, text = "Helene told you every coat's worth something? It's true, until an adventurer stitches it himself, and then it's worth less." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. You'll want soft boots that don't creak, and mine don't, though I can't promise the same for your knees." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. You won't want my leather, I suppose, but a good pair of boots is never wasted, even on a scholar." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Your bracers are cracking at the buckle; I can see it from here, and so will a gnoll." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll be bringing me hides, I hope, and better ones than the adventurers drag in." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf, and those are boots I'd like to take apart and learn from, if you'd ever let me. Who stitched them, and with what?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I make soft boots and quiet belts, and Maximillian Crowe's students wear them, so I suppose I'm part of your trade, whether I like it or not." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Let me guess: you stitched your own armour too, and I spend half my days mending adventurers' work like that." },
      },
      again = {
        { id = "h_again", text = "Anything else? Hand me that awl while you think." },
        { id = "h_again2", text = "Go on; I can stitch and listen at once." },
      },
      choices = {
        { text = "What's hardest to make?", next = "hard" },
        { text = "This must be your house by the lake.", next = "home" },
        { text = "Sam Sarsaparilla says leatherworkers make tents.", next = "camp", when = { any = { { heardLine = "sam.ct_default" }, { heardLine = "sam.ct_lw" }, { heardLine = "sam.ct_fish" }, { heardLine = "sam.ct_aid" } } } },
        { text = "Teach me.", next = "BUSINESS" },
        { text = "What makes your boots so quiet, Adele?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I doubt many mages buy boots from you.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Leather seems of little use to a warrior in mail.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Will you teach a hunter to work the hides he brings?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Have you ever stitched a wound instead of a boot, Adele?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you make anything for the soldiers at the garrisons, Adele?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you tan with bark from the Eastvale oaks?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "You don't seem to mind selling to warlocks, Adele.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Is adventurers' leatherwork really so poor, Adele?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Later.", next = "END" },
      },
    },
    hard = {
      lines = {
        { id = "h_boots", text = "Boots, because everyone's feet are different, and everyone's sure theirs are normal." },
      },
      choices = {
        { text = "Are mine normal?", next = "hard_feet" },
        { text = "Teach me.", next = "BUSINESS" },
      },
    },
    hard_feet = {
      lines = {
        { id = "hf_default", text = "Take your boots off and we'll see. No, don't, I've just eaten." },
      },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } } },
    },
    home = {
      lines = {
        { id = "hb_default", key = true, text = "It's mine, by the lake. My husband went off to the front, and Helene's held me up ever since; she has a soft heart, and she keeps a sword by the door." },
      },
      choices = {
        { text = "I'll pray for his safe return.", next = "home_priest", when = { class = "PRIEST" } },
        { text = "She sounds a good friend.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    home_priest = {
      lines = {
        { id = "hp_default", text = "Thank you; I'll take every prayer going. Helene says hers with a whetstone." },
      },
      choices = {
        { text = "Then she'll have my prayers too, whetstone and all.", next = "BACK", reply = "Bless you, and I'll tell her you said so. She'll pretend not to care and then sharpen something.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A whetstone will do her more good than prayers.", next = "BACK", reply = "You've met her, then, and you'd not be wrong. I'll give her your regards all the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "c_default", text = "A tent, once your stitching's good enough. Sleep beside one by a campfire and you wake up feeling a week younger." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", fx = { learn = { "camping" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a leatherworker, and the house by the lake is mine. My husband's at the front, and Helene keeps me company." } },
    advice = { { id = "tp_ad", text = "Buy boots a little big, because feet swell on the march, and blisters will beat you before any gnoll does." } },
    _none = { { id = "tp_none", text = "Can you stitch it? If you can't, I'm afraid I'm no help to you." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Helene drags me to the Faire every time it's in Goldshire, and every time I come home with a pair of boots I didn't need. They make lovely boots, and that's the trouble." } },
    holy_light = { { id = "tp_holy_light", text = "I light a candle at Priestess Josetta's for my husband every week. I can't tell you if the Light listens, but it's better than staring at the road." } },
    varian = { { id = "tp_varian", text = "If the king himself can go missing, a husband at the front can go missing too, and I try not to think about it more than once a day." } },
  },
}
