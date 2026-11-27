-- Arathi folk without a conversation yet: Refuge Pointe's commander and defenders, Smokywood Pastures'
-- two food carts, Hammerfall's gate guards and the Winterhoof leatherworker on the hill by Boulder'gor.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Commander Amaren: Stromic commander at Refuge Pointe.
P:NPC {
  key = "ar_commander_amaren", id = TODO_NPC("Commander Amaren"), name = "Commander Amaren", gender = "female",
  bible = "bibles/missed.md", role = "commander", tier = "quest",
  communities = { "refuge_pointe" }, temper = { "stern", "weary" }, values = { "duty", "loyal" },
  impression = {
    first = "Commander Amaren keeps her maps pinned under stones on a table at Refuge Pointe, and she reads them as if the wind might carry the highlands away. She is a soldier of the Stromic army who has held this hill longer than she expected to.",
    third = "{name} met Commander Amaren, who commands soldiers at Refuge Pointe in the Arathi Highlands.",
  },
  greetings = {
    { id = "g_default", text = "Speak plainly, {class}. I've no time for anything else." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good, I've work if you've a sword." },
    { id = "g_qactive", when = { questActive = TODO_QUEST("Quae and Kinelory") }, text = "Quae's camp is south of here, beyond the stream. Find her, and find out what Kinelory has gotten herself into." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("Quae and Kinelory") }, tags = { "news" }, text = "So Kinelory's still alive, and still meddling. Good work, though I'll want a full report from Quae herself." },
  },
  start = "hello",
  nodes = {
    w2_maps = {
      lines = {
        { id = "w2_maps_l", text = "That we hold one hill and a farm or two, and everyone else holds the rest. The Syndicate have Stromgarde and Northfold, the ogres have Boulder'gor, the trolls have the eastern hills, and the Forsaken have Go'Shek and Hammerfall's goodwill." },
      },
      choices = {
        { text = "Which of them would you strike first?", next = "w2_maps2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_maps2 = {
      lines = {
        { id = "w2_maps2_l", text = "The Syndicate, every time. The ogres and trolls are a plague on the land, but the Syndicate sit in our own keep, wearing our own lords' names. Take Stromgarde back and the rest of the Highlands will remember who it belongs to." },
        { id = "w2_maps2_l1", when = { faction = "Alliance", class = "PALADIN" }, text = "The Syndicate, every time, and I'd take a paladin at the head of that column gladly. They sit in our own keep wearing our own lords' names, and Stromgarde won't be whole until they're out of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yoff = {
      lines = {
        { id = "ybarcommanderamaren1", text = "Sleep, when I can. Write letters to Stormwind that nobody answers. And sometimes I walk up to the ridge and look at the keep, and remember when it had banners on every tower." },
        { id = "ybarcommanderamaren2", when = { race = "Human" }, text = "You'll know what it is to see your home in ruins, maybe. It doesn't get easier." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ylong = {
      lines = {
        { id = "yarcommanderamaren1", text = "Since the Third War, when the Scourge took the north and the trolls came down from the hills. I was a captain of the keep guard then. Now I'm the most senior officer left alive who isn't a Trollbane." },
        { id = "yarcommanderamaren2", when = { race = "Dwarf" }, text = "Ironforge sent us aid in the old days. I'd take a squad of your riflemen gladly, if you know anyone looking for work." },
      },
      choices = {
        { text = "What would you need to retake the keep?", next = "yretake" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yretake = {
      lines = {
        { id = "yarcommanderamaren3", text = "Three hundred men, a hundred horse and a siege engine. I have eighty men and twelve horses. Some say I should beg Stormwind for aid, and some say Stromgarde begs no one." },
      },
      choices = {
        { text = "Stromgarde begs no one. Hold and build.", next = "BACK", reply = "Spoken like a Trollbane. I'll tell Galen, and he'll like you for it.", fx = { align = { honor = 1 } } },
        { text = "Ask for help. Pride won't take back the keep.", next = "BACK", reply = "It's what I've written to Stormwind three times. No answer yet.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Commander Amaren, of the Stromic army. Refuge Pointe is the last hill in Arathi that still flies Stromgarde's banner without question, and I mean to keep it that way." } },
      again = { { id = "h_again", text = "What else? The map won't change while I stand here talking, more's the pity." }, { id = "h_again2", text = "Go on, but be quick about it." } },
      choices = {
        { text = "Who are Quae and Kinelory?", next = "quae" },
        { text = "Who threatens Refuge Pointe?", next = "threats" },
        { text = "You look like you haven't slept.", next = "sleep" },
        { text = "Stromgarde's people deserve better than this.", next = "stromgarde", when = { race = "Human" } },
        { text = "How long have you held Refuge Pointe?", next = "ylong" },
        { text = "What do you do when you're not commanding?", next = "yoff" },
        { text = "What do your maps tell you about the Highlands?", next = "w2_maps" },
        { text = "Farewell.", next = "END" },
      },
    },
    quae = {
      lines = { { id = "quae_default", text = "Two of my scouts, a woman named Quae and her partner Kinelory, sent to watch the Forsaken at Go'Shek Farm. Quae's camped outside the walls, and Kinelory went deeper than she should have." } },
      choices = {
        { text = "What are the Forsaken doing at Go'Shek?", next = "goshek" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    goshek = {
      lines = { { id = "goshek_default", text = "Brewing something in that farmhouse, under an apothecary named Jorell. Whatever it is, the Dark Lady wants it badly enough to guard it with her best." } },
      choices = {
        { text = "Plague, then?", next = "plague" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    plague = {
      lines = { { id = "plague_default", text = "I'd wager my commission on it, and I'd rather not wait to find out. If the Forsaken are making a new plague in Arathi, it'll be our farms they test it on first." } },
      choices = {
        { text = "We should burn that farm to the ground.", next = "BACK", reply = "Tempting, but I'd rather know what's in it first.", fx = { align = { order = -1 } } },
        { text = "We need proof before we act.", next = "BACK", reply = "Aye, and that's what Quae and Kinelory are for.", fx = { align = { order = 1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    threats = {
      lines = { { id = "threats_default", text = "Everyone, it seems, the Syndicate to the north, the Boulderfist ogres in the hills, the Witherbark trolls to the east and the Horde at Hammerfall. I've lost count of the patrols that didn't come back." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sleep = {
      lines = { { id = "sleep_default", text = "I haven't, much, since the last raid on the stables. A commander sleeps when the hill is safe, and the hill hasn't been safe in a long while." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    stromgarde = {
      lines = { { id = "stromgarde_default", text = "They do, and I mean to see them get it. Prince Galen's at the keep, and as long as he holds, so do we." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    galen = { { id = "yarcommanderamaren4", text = "Prince Galen Trollbane. He leads us, and he means to take back his father's throne." } },
    go_shek = { { id = "yarcommanderamaren5", text = "Go'Shek Farm. The Forsaken are brewing something there." } },
    _none = { { id = "tp_none", text = "Not my concern, {class}. Ask Captain Nials if it's about supplies." } },
  },
}

-- Kosco Copperpinch: goblin food and drink vendor at Hammerfall.
P:NPC {
  key = "ar_kosco_copperpinch", id = TODO_NPC("Kosco Copperpinch"), name = "Kosco Copperpinch", title = "Smokywood Pastures", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "hammerfall" }, temper = { "pushy", "cheerful" }, values = { "trade", "practical" },
  impression = {
    first = "Kosco Copperpinch runs a food and drink cart at Hammerfall, wedged between the orcs' tents with a hand-painted Smokywood Pastures sign. He prices everything twice, once for orcs and once for anyone who argues.",
    third = "{name} met Kosco Copperpinch of Smokywood Pastures, selling food and drink at Hammerfall.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hey, my favourite customer! I saved ya a wheel of cheese before the orcs got to it, and that took some doing, pal." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Full price, pal, and don't let the orcs see you haggle." },
    { id = "g_default", text = "Hungry, friend? I got bread, I got cheese, I got prices that'll make ya weep with joy." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, pal? The orcs eat like wolves, so get it while it's here." },
  },
  start = "hello",
  nodes = {
    w2_stock = {
      lines = {
        { id = "w2_stock_l", text = "Wind riders from Orgrimmar, when Urda can spare one, and a goblin cart up from Tarren Mill when she can't. The cart costs more and gets robbed more, but it doesn't bite me when I load it." },
      },
      choices = {
        { text = "Robbed by whom?", next = "w2_stock2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    w2_stock2 = {
      lines = {
        { id = "w2_stock2_l", text = "Whoever's on the road that week, pal. Syndicate, Stromgarde, trolls. I had a whole crate of sausages taken by an ogre once, and he didn't even look hungry. Some folks just want to watch a goblin suffer." },
      },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    w2_orcs = {
      lines = {
        { id = "w2_orcs_l", text = "Better than you'd think, buddy. An orc'll shout at you over the price, then pay it, then come back tomorrow and do it again. It's honest shouting. I've been robbed by much politer people." },
      },
      choices = {
        { text = "Do they ever not pay?", next = "w2_orcs2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    w2_orcs2 = {
      lines = {
        { id = "w2_orcs2_l", text = "One grunt tried to pay me in ogre teeth once. Drum Fel heard about it and made him pay twice, in coin, and the grunt's been my best customer ever since. Respect's a funny thing with orcs." },
      },
      choices = {
        { text = "Good. A commander should keep his grunts honest.", next = "BACK", reply = "That's what I said! Rules are good for business, as long as somebody else enforces 'em.", fx = { align = { order = 1 } } },
        { text = "You should've taken the teeth and kept the grunt sweet.", next = "BACK", reply = "Sweet doesn't pay the wind riders, pal. Teeth are teeth, and coin is coin.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Kosco Copperpinch, Smokywood Pastures, Hammerfall branch, which is a very small branch with very big customers. Orcs eat more than any race I've ever sold to, which is great for business and terrible for my inventory." } },
      again = { { id = "h_again", text = "What else, buddy? Quick, before the next grunt starts shoutin' about the price of jerky." }, { id = "h_again2", text = "Go on, the meter's not runnin'." } },
      choices = {
        { text = "A good trader sells to both sides at the same fair price.", next = "BACK", reply = "Smart, pal! Neutral and fair, that's how a Smokywood branch stays alive.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Charge the orcs double. They eat too much to notice.", next = "BACK", reply = "They notice everything, pal, especially when it's their gold, and they've got big axes.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What do orcs order most?", next = "xorder" },
        { text = "Who robs the supply wagons?", next = "xrob" },
        { text = "A goblin feeding Hammerfall. Does Orgrimmar know?", next = "xorg", when = { faction = "Horde" } },
        { text = "Why sell in Hammerfall?", next = "why" },
        { text = "What's Smokywood Pastures doing here?", next = "company" },
        { text = "Where do you get your stock out here?", next = "w2_stock" },
        { text = "How do you get on with the orcs?", next = "w2_orcs" },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = { { id = "why_default", text = "Because nobody else would, pal, which means no competition and a captive market. The supply wagons come up from the Barrens once a week, if the Stromgarde patrols don't get 'em first." } },
      choices = {
        { text = "Do the patrols often get them?", next = "patrols" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    patrols = {
      lines = { { id = "patrols_default", text = "Often enough that I've started billin' the shipping as hazard pay. One cart in five gets raided, and I've got a cousin in Booty Bay who insures the other four, at a very reasonable rate." } },
      choices = {
        { text = "Trade should go wherever there are buyers.", next = "BACK", reply = "Now you're talkin' my language, pal!", fx = { align = { order = -1 } } },
        { text = "Selling to both sides in a war is shameful.", next = "BACK", reply = "Shameful? Pal, it's called diversification.", fx = { align = { order = 1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    company = {
      lines = { { id = "company_default", text = "Selling food, friend, same as everywhere, and we do Winter Veil too, but that's another branch entirely. We sell to anybody, Horde or Alliance, and Hammerfall's my little corner of the empire." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    xorder = {
      lines = {
        { id = "xo1", text = "Meat, pal, meat with a side of meat, and the bones to chew after. I tried sellin' a nice fruit tart once, and a grunt looked at me like I'd insulted his mother, so the tarts went to the wolves." },
      },
      choices = {
        { text = "And the trolls?", next = "xtroll" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xtroll = {
      lines = {
        { id = "xt1", text = "Darkspear trolls want fish and somethin' spicy, and they pay in shells half the time, which I accept at a very reasonable exchange rate, very reasonable for me, that is." },
        { id = "xt2", when = { race = "Troll" }, text = "Hey, mon! Got some dried Echo Isles fish just for you, special price, practically robbery on my part." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xrob = {
      lines = {
        { id = "xr1", text = "Stromgarde's patrols, mostly, who call it seizing enemy supplies, and the Syndicate, who don't bother callin' it anything. Lost a whole wagon of ale last month, and the drivers came back in their underwear." },
      },
      choices = {
        { text = "Stromgarde's at war with the Horde. Fair game.", next = "xfair" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfair = {
      lines = {
        { id = "xf1", text = "Fair game, sure, if you're a soldier. I'm a businessman, buddy, and nobody declared war on cheese. Every wagon they take is money outta my pocket and stew outta some grunt's belly." },
      },
      choices = {
        { text = "War's war. Everything's a target, even cheese.", next = "BACK", reply = "Ugh, you sound like my insurance broker.", fx = { align = { honor = -1 } } },
        { text = "Merchants should be left alone, on both sides.", next = "BACK", reply = "Finally, a reasonable customer! Tell Stromgarde that.", fx = { align = { honor = 1 } } },
      },
    },
    xorg = {
      lines = {
        { id = "xog1", text = "Orgrimmar knows I pay my taxes, which is all Orgrimmar wants to know. Long as the grunts are fed and the Cartel's happy, nobody asks how a goblin got a stall in a fortress." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    stromgarde = { { id = "xtp_sg", text = "They ride out of the ruins and steal my sausages. Very unprofessional." } },
    syndicate = { { id = "xtp_sy", text = "Bandits with family crests. They still don't pay for what they take." } },
    _none = { { id = "tp_none", text = "Never heard of it, but if you find it, I'll sell it." } },
  },
}

-- Targot Jinglepocket: goblin food and drink vendor at Refuge Pointe.
P:NPC {
  key = "ar_targot_jinglepocket", id = TODO_NPC("Targot Jinglepocket"), name = "Targot Jinglepocket", title = "Smokywood Pastures", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "refuge_pointe" }, temper = { "harried", "cheerful" }, values = { "trade", "family" },
  impression = {
    first = "Targot Jinglepocket sells food and drink at Refuge Pointe from a stall that has clearly been rebuilt more than once. He is a goblin from Smokywood Pastures with the jumpy look of someone who has been raided by ogres.",
    third = "{name} met Targot Jinglepocket of Smokywood Pastures, selling food and drink at Refuge Pointe.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, pal! You're the only customer who hasn't burned the place down, and I appreciate that." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Buy what you want, pal, and don't stick around." },
    { id = "g_default", text = "Food, drink, and a roof, mostly! What'll it be, friend?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, pal? Good, I need the custom after the last raid." },
  },
  start = "hello",
  nodes = {
    w2_rebuild = {
      lines = {
        { id = "w2_rebuild_l", text = "Fast and cheap, with a bucket of water under the counter. Last time the Captain's men helped me nail the planks up, and I paid 'em in ale, which they say is the only sensible thing I've ever done." },
      },
      choices = {
        { text = "Did the company help?", next = "w2_rebuild2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    w2_rebuild2 = {
      lines = {
        { id = "w2_rebuild2_l", text = "The company sent me a letter. It said they were very sorry for my loss, and they'd be taking the cost of the stall out of my wages. That's Smokywood Pastures for you, friend: festive on the outside." },
      },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    w2_drink = {
      lines = {
        { id = "w2_drink_l", text = "Ale when they've been paid, water when they haven't, and Drovnar's terrible home brew when they've lost a bet. I don't sell that last one, but I'm thinking about it, 'cause they keep coming back for it." },
      },
      choices = {
        { text = "Why would anyone keep drinking it?", next = "w2_drink2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    w2_drink2 = {
      lines = {
        { id = "w2_drink2_l", text = "Same reason they stay up here, friend. It's awful, it's cold, and it belongs to 'em. Humans are funny like that. Give a goblin a bad drink and he'll sell it to somebody else." },
      },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Targot Jinglepocket, Smokywood Pastures, Refuge Pointe branch, which has been burned down twice this year. The soldiers here pay on time, though, which is more than I can say for the ogres." } },
      again = { { id = "h_again", text = "What else, friend? I've got a stall that's still standing, and I'd like to sell from it while it is." }, { id = "h_again2", text = "Talk fast, I gotta restock before the next raid." } },
      choices = {
        { text = "A trader in a war zone should keep prices fair.", next = "BACK", reply = "Sure, pal, fair prices keep the soldiers paying on time, and that's worth more than a quick profit.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Raise prices after every raid. They need the supplies.", next = "BACK", reply = "That's a short-term play, pal, and short-term plays get ya burned down a third time.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Who burned Refuge Pointe down?", next = "xburn" },
        { text = "How do the soldiers here pay?", next = "xpay" },
        { text = "What about the ogres?", next = "xogres" },
        { text = "Are you related to Wulmort Jinglepocket?", next = "wulmort" },
        { text = "You've been burned down twice?", next = "burned" },
        { text = "How do you rebuild after a fire?", next = "w2_rebuild" },
        { text = "What do the soldiers drink most?", next = "w2_drink" },
        { text = "Farewell.", next = "END" },
      },
    },
    wulmort = {
      lines = { { id = "wulmort_default", text = "Cousin, on my mother's side, and he got the cushy Ironforge job while I got Arathi. Family's family, but I'll tell ya, I'd trade places with him in a heartbeat." } },
      choices = {
        { text = "Why not ask for a transfer?", next = "transfer" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    transfer = {
      lines = { { id = "transfer_default", text = "Asked three times, and three times the company said the Refuge Pointe branch is 'strategically valuable.' That's goblin for 'nobody else would take it,' so here I stay." } },
      choices = {
        { text = "Loyalty to the company will pay off.", next = "BACK", reply = "That's what they keep tellin' me, pal.", fx = { align = { order = 1 } } },
        { text = "You should quit and set up on your own.", next = "BACK", reply = "Ha! Don't think I haven't thought about it.", fx = { align = { order = -1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    burned = {
      lines = { { id = "burned_default", text = "Once by ogres, once by a Syndicate thug who didn't like my prices. I rebuilt both times, because a goblin who quits is a goblin with no income." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    xburn = {
      lines = {
        { id = "xb1", text = "First time, Syndicate torches in the night, all very dramatic. Second time was a cook fire, and the cook was me, and I'd prefer we didn't discuss it further, friend." },
      },
      choices = {
        { text = "Why rebuild here at all?", next = "xwhy" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xwhy = {
      lines = {
        { id = "xw1", text = "Because soldiers get hungry and a hungry soldier's got coin and nowhere else to spend it. Refuge Pointe's a terrible place to live, but it's a beautiful place to run a monopoly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpay = {
      lines = {
        { id = "xp1", text = "On the dot, every payday, 'cause Stromgarde still pays its people, which surprised me, since they lost their whole kingdom. Lord Galen's got coffers somewhere, and I don't ask where." },
      },
      choices = {
        { text = "Do you think Stromgarde will retake the keep?", next = "xretake" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xretake = {
      lines = {
        { id = "xr1", text = "They talk about it over every drink I serve, and the louder they talk, the more they drink, which is good for me. Between you and me, the Syndicate and the ogres are dug in deep, pal." },
      },
      choices = {
        { text = "They'll take it back. Stromgarde doesn't quit.", next = "BACK", reply = "Hey, I'll drink to that, and so will they, at two silver a mug.", fx = { align = { order = 1 } } },
        { text = "Stromgarde's finished. They should move south.", next = "BACK", reply = "Shh! Not so loud. I need these customers right where they are.", fx = { align = { order = -1 } } },
      },
    },
    xogres = {
      lines = {
        { id = "xo1", text = "Boulderfist ogres come down from the hills, and they don't understand money, which is the scariest thing about 'em. You can't bribe somethin' that wants to eat you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    stromgarde = { { id = "xtp_sg", text = "Proud folks with no castle. They tip better than you'd think." } },
    ogres = { { id = "xtp_og", text = "Two heads, no wallets. Worst customers on the continent." } },
    _none = { { id = "tp_none", text = "Never heard of it, friend, and I hear about everything." } },
  },
}

-- Hammerfall Guardian: orc guards of Hammerfall.
P:NPC {
  key = "ar_hammerfall_guardian", id = TODO_NPC("Hammerfall Guardian"), name = "Hammerfall Guardian", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "hammerfall" }, temper = { "blunt", "watchful" }, values = { "honor", "duty" },
  impression = {
    first = "A Hammerfall Guardian stands at the gate of the orcish outpost with an axe across his chest. He watches the hills for Stromgarde riders and Witherbark trolls alike.",
    third = "{name} spoke with one of the Hammerfall Guardians who hold the gates of the Horde's outpost in Arathi.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again. Hammerfall remembers you, and the gate stands open for you, warrior." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. State your business, and keep it short." },
    { id = "g_default", text = "State your business, {class}." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The gate still stands." },
  },
  start = "hello",
  nodes = {
    w2_watch = {
      lines = {
        { id = "w2_watch_l", text = "Riders on the western road, from Refuge Pointe. Torches on the eastern hills, which are the Witherbark. And dust from the south, which is ogres, or worse, Stromgarde marching with ogres behind it." },
      },
      choices = {
        { text = "Has that ever happened?", next = "w2_watch2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    w2_watch2 = {
      lines = {
        { id = "w2_watch2_l", text = "Not yet. But the humans hate the ogres and the ogres hate the humans, and both hate us. A guard who thinks his enemies will never make peace with each other is a guard who sleeps on the wall." },
      },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    w2_drum = {
      lines = {
        { id = "w2_drum_l", text = "From the front, and loudly. He was a grunt in the camps like the rest of us, and he has not forgotten it. When he walks the wall at night, he knows every guard by name." },
      },
      choices = {
        { text = "Does he know yours?", next = "w2_drum2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    w2_drum2 = {
      lines = {
        { id = "w2_drum2_l", text = "He does, and my father's, who died at this gate the night we broke the camps open. That is why Drum put me here. He says a guard should stand where his blood has already stood." },
      },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I guard Hammerfall, where Orgrim Doomhammer once held the human prisons and the orcs broke free. We hold this place now, and no human will take it from us again." } },
      again = { { id = "h_again", text = "Speak." }, { id = "h_again2", text = "What else? Ask it, then let me watch the hills." } },
      choices = {
        { text = "Hammerfall stands because every orc keeps to his orders.", next = "BACK", reply = "Yes. Discipline broke the human camps, and discipline holds them now.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "An orc should follow his own blood, not any chieftain's orders.", next = "BACK", reply = "Then you know nothing of the Horde, and nothing of the camps that bred that kind of thinking.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Did you live in the camps yourself?", next = "xcamp" },
        { text = "What do you think of the humans now?", next = "xhumans" },
        { text = "I'm a human. Am I welcome here?", next = "xhuman", when = { race = "Human" } },
        { text = "I'm an orc too. Tell me of Doomhammer.", next = "xdoom", when = { race = "Orc" } },
        { text = "What happened here?", next = "history" },
        { text = "Who threatens Hammerfall?", next = "threats" },
        { text = "What do you watch for from the gate?", next = "w2_watch" },
        { text = "How does Drum Fel command?", next = "w2_drum" },
        { text = "Farewell.", next = "END" },
      },
    },
    history = {
      lines = { { id = "history_default", text = "This was an internment camp once, where humans held orcs after the Second War. Thrall freed us, and we took it back, and we named it Hammerfall to remember Doomhammer." } },
      choices = {
        { text = "Do you remember the camps?", next = "camps" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    camps = {
      lines = { { id = "camps_default", text = "I was born in one, and I remember the bars and the lethargy that ate our spirit. Thrall woke us from that sleep, and I will die before I go back." } },
      choices = {
        { text = "No one should be caged like that.", next = "BACK", reply = "You speak with honor.", fx = { align = { honor = 1 } } },
        { text = "The humans had reason to fear you.", next = "BACK", reply = "Perhaps, but they had no right to cage us.", fx = { align = { honor = -1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    threats = {
      lines = { { id = "threats_default", text = "The Stromgarde soldiers at Refuge Pointe, the Witherbark in the east, the ogres in the hills. We hold, because we are the Horde, and the Horde does not break." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    xcamp = {
      lines = {
        { id = "xc1", text = "I did, for years, behind the stockade that stood where you stand now. We ate what they threw us and forgot how to fight, and some forgot how to be orcs at all." },
      },
      choices = {
        { text = "How did it end?", next = "xend" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xend = {
      lines = {
        { id = "xe1", text = "Thrall came with Grom and Doomhammer, and the gates broke, and a sickness lifted from us that no shaman had a name for. I picked up an axe that day and I have not put it down since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhumans = {
      lines = {
        { id = "xh1", text = "Stromgarde sends its men against these walls every season, as if they could put us back in our cages. Thrall says not all humans are jailers, and I try to believe him, but I remember the whips." },
      },
      choices = {
        { text = "Remember the whips. Never trust them again.", next = "BACK", reply = "You speak the truth that sits in every orc's belly here.", fx = { align = { honor = -1 } } },
        { text = "Thrall is right. Not every human held a whip.", next = "BACK", reply = "Perhaps. I will believe it when Stromgarde stops coming.", fx = { align = { honor = 1 } } },
      },
    },
    xhuman = {
      lines = {
        { id = "xhu1", text = "Welcome is a strong word, {class}. You may pass because Thrall says the Horde is more than vengeance, but you will walk slowly, and you will not touch the walls." },
      },
      choices = {
        { text = "I understand. Something else.", next = "BACK" },
      },
    },
    xdoom = {
      lines = {
        { id = "xd1", text = "Orgrim Doomhammer was Warchief before Thrall, and he broke these camps open with his own hammer. He fell at the last of them, and Thrall took up his armor, and his hammer still goes to war in our Warchief's hands." },
      },
      choices = {
        { text = "Lok'tar ogar.", next = "BACK", reply = "Lok'tar, brother. Hold your head high here." },
      },
    },
  },
  topics = {
    doomhammer = { { id = "xtp_dh", text = "The Warchief who broke our chains. This fortress bears his name." } },
    stromgarde = { { id = "xtp_sg", text = "Their kings built these cages. We will not go back into them." } },
    _none = { { id = "tp_none", text = "I know nothing of that. Ask Drum Fel, if you must." } },
  },
}

-- Refuge Pointe Defender: Stromic guards at Refuge Pointe.
P:NPC {
  key = "ar_refuge_pointe_defender", id = TODO_NPC("Refuge Pointe Defender"), name = "Refuge Pointe Defender", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "refuge_pointe" }, temper = { "weary", "steady" }, values = { "duty", "loyal" },
  impression = {
    first = "A Refuge Pointe Defender stands at the edge of the hill with a shield on one arm and a tired look in his eyes. He wears Stromgarde's colours, faded from too many highland winters.",
    third = "{name} spoke with one of the Refuge Pointe Defenders who guard Stromgarde's last outpost in Arathi.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, {class}! It's good to see a friendly face come up the hill." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Watch yourself on the roads, and don't bring trouble back to the Pointe." },
    { id = "g_default", text = "Hail, {class}. Watch yourself on the roads." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good to see a friendly face." },
  },
  start = "hello",
  nodes = {
    w2_night = {
      lines = {
        { id = "w2_night_l", text = "Cold, and loud with things that aren't there. Every owl sounds like a troll and every fox sounds like a Syndicate scout. I've learned to listen for the silence, because that's when something real is moving." },
      },
      choices = {
        { text = "Have you ever been wrong?", next = "w2_night2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_night2 = {
      lines = {
        { id = "w2_night2_l", text = "Once I woke the whole camp for a goat. Captain Nials didn't say a word, only had me feed the goat for a month. It's still up here, by the well. My daughter would love it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ydaughter = {
      lines = {
        { id = "ybarrefugepointedefender1", text = "Elsie. She's nine now, and she wants to be a knight like Valorcall. I tell her knights get blisters and sleep in tents, and she says she doesn't mind. She'll be better than all of us." },
        { id = "ybarrefugepointedefender2", when = { class = "PALADIN" }, text = "She'd love to meet you. She draws paladins with shining swords in every letter." },
      },
      choices = {
        { text = "Every soldier at the Pointe should follow the commander's orders.", next = "BACK", reply = "Aye, that's how we've held this hill. Without order, the ogres would have had us long ago.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "A soldier should fight how he sees fit, orders or not.", next = "BACK", reply = "That kind of thinking gets men killed, and we can't afford to lose many more.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Something else.", next = "BACK" },
      },
    },
    ygoing = {
      lines = {
        { id = "yarrefugepointedefender1", text = "My daughter, in Southshore, with her grandmother. She writes me every season, and her letters are all spelling mistakes and drawings of horses. I keep them in my helmet, and I read them on watch." },
        { id = "yarrefugepointedefender2", when = { race = "Human" }, text = "You'll have someone back home too, I'd guess. Hold onto them. It's what keeps a soldier standing." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I guard Refuge Pointe for Stromgarde, and for the people who still call this land home. There aren't many of us left, but we hold the hill." } },
      again = { { id = "h_again", text = "What else? I'm here until the next watch, so I've nowhere to run to." }, { id = "h_again2", text = "Ask away, friend." } },
      choices = {
        { text = "How long have you served Stromgarde?", next = "xserve" },
        { text = "What are the orcs at Hammerfall like?", next = "xorcs" },
        { text = "I'm a dwarf. Ironforge sends its regards.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Who attacks Refuge Pointe?", next = "threats" },
        { text = "Is Stromgarde lost?", next = "stromgarde" },
        { text = "What keeps you going?", next = "ygoing" },
        { text = "What's your daughter's name?", next = "ydaughter" },
        { text = "What's a night watch like on the hill?", next = "w2_night" },
        { text = "Farewell.", next = "END" },
      },
    },
    threats = {
      lines = { { id = "threats_default", text = "Ogres from the hills, Syndicate bandits from the north, and the orcs at Hammerfall to the east. Some days they come one after another, and some days they come all at once." } },
      choices = {
        { text = "How many have you lost?", next = "losses" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    losses = {
      lines = { { id = "losses_default", text = "Too many to count, and some of them friends I grew up with. We bury them on the north slope, facing Stromgarde, so they can see home." } },
      choices = {
        { text = "Their sacrifice won't be forgotten.", next = "BACK", reply = "Thank you, friend. That means something.", fx = { align = { honor = 1 } } },
        { text = "They died for a lost cause.", next = "BACK", reply = "Perhaps, but it's our cause, lost or not.", fx = { align = { honor = -1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    stromgarde = {
      lines = { { id = "stromgarde_default", text = "Not lost, not yet, though most of the city's in Syndicate hands. Prince Galen holds the keep, and while he holds, we hold." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    xserve = {
      lines = {
        { id = "xs1", text = "Since before the Third War, when Stromgarde was a kingdom and Thoras Trollbane sat in the keep. Now his son leads us from a hill of tents, and I serve him all the same." },
      },
      choices = {
        { text = "What happened to King Trollbane?", next = "xking" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xking = {
      lines = {
        { id = "xk1", text = "Murdered in his own hall, and not by any orc, though the Syndicate would like folk to believe that. Lord Galen means to take back the keep his father lost, and I mean to be there when he does." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xorcs = {
      lines = {
        { id = "xo1", text = "Our kings built that camp to hold them after the Second War, and now they hold it against us. I'd call it justice if I weren't the one standing on the wrong side of their walls." },
      },
      choices = {
        { text = "Burn Hammerfall to the ground, then.", next = "BACK", reply = "Aye, and we'd lose half our men doing it. Someday, maybe.", fx = { align = { honor = -1 } } },
        { text = "You caged them. Can you blame them for hating you?", next = "BACK", reply = "No, I suppose I can't. Doesn't mean I'll lower my spear.", fx = { align = { honor = 1 } } },
      },
    },
    xdwarf = {
      lines = {
        { id = "xd1", text = "Then we'll thank Ironforge for the regards and ask for rifles next time. Your kin stood with Stromgarde against the Horde once, and we've not forgotten it." },
      },
      choices = {
        { text = "Neither have we. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    galen = { { id = "yarrefugepointedefender3", text = "Lord Galen leads us from a tent. He'll lead us from the throne one day." } },
    trollbane = { { id = "xtp_tb", text = "The Trollbanes have held Stromgarde since Thoradin. A tent doesn't change that." } },
    syndicate = { { id = "xtp_sy", text = "Alterac's traitors, squatting in our keep. We'll root them out." } },
    _none = { { id = "tp_none", text = "I don't know about that, friend. Ask the Commander." } },
  },
}

-- Brumn Winterhoof: Winterhoof tauren elemental leatherworking trainer near Boulder'gor.
P:NPC {
  key = "ar_brumn_winterhoof", id = TODO_NPC("Brumn Winterhoof"), name = "Brumn Winterhoof", title = "Leatherworking Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "quest",
  communities = { "hammerfall" }, temper = { "calm", "gentle" }, values = { "nature", "craft" },
  impression = {
    first = "Brumn Winterhoof camps on a hill west of Boulder'gor, far from the orcs at Hammerfall, with hides drying on racks around him. He is a tauren of the Winterhoof tribe, and he works leather as though he were listening to it.",
    third = "{name} met Brumn Winterhoof, a tauren who teaches elemental leatherworking in the Arathi Highlands.",
  },
  greetings = {
    { id = "g_default", text = "Walk gently, friend. The hides are drying, and so am I." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The Earth Mother smiles on you." },
    { id = "g_qactive", when = { questActive = TODO_QUEST("Elemental Leatherworking") }, text = "Bring me the elements' gifts, and I will teach you to bind them into leather." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("Elemental Leatherworking") }, tags = { "news" }, text = "You have learned the elements' ways in leather. Use them wisely, and they will serve you." },
  },
  start = "hello",
  nodes = {
    w2_hides = {
      lines = {
        { id = "w2_hides_l", text = "Raptor, for fire, because the beasts of the Highlands burn hot in the blood. Highland strider for wind. For earth, I go to the ogres' country and take the hides of the boars that dig there, though the ogres do not like it." },
      },
      choices = {
        { text = "And water?", next = "w2_hides2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_hides2 = {
      lines = {
        { id = "w2_hides2_l", text = "Water is the hardest, for the land here is dry and bloody. I take the hides of the crocolisks at Faldir's Cove, on the coast, and I thank the water spirits each time. They have not yet refused me." },
        { id = "w2_hides2_l1", when = { race = "Tauren" }, text = "Water is the hardest here, as you would guess, for this land is not the Gold Road. I take crocolisk hides from Faldir's Cove and I thank the water spirits each time, as my mother taught us both." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yorcs = {
      lines = {
        { id = "ybarbrumnwinterhoof1", text = "Some come for armour, and some come to sit by the fire and say nothing. An old grunt who wore chains in that camp sits with me most evenings. He does not speak of it, and I do not ask." },
        { id = "ybarbrumnwinterhoof2", when = { race = "Orc" }, text = "Your people carry much sorrow in this place. The spirits feel it, and so do I." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ytribe = {
      lines = {
        { id = "yarbrumnwinterhoof1", text = "On the plains of Mulgore, far across the sea, under the shadow of Thunder Bluff. Cairne sent me east to learn how the elements speak in these old human hills. They speak sadly here, I find." },
        { id = "yarbrumnwinterhoof2", when = { race = "Tauren" }, text = "You will know the plains, then. Tell me, does the wind still sing over Red Rocks?" },
      },
      choices = {
        { text = "Why do they speak sadly?", next = "ysad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysad = {
      lines = {
        { id = "yarbrumnwinterhoof3", text = "Much blood has soaked into this earth. Humans and trolls and orcs, for a thousand years. The Earth Mother does not take sides, but she remembers every hurt, and the hides from this land carry it." },
      },
      choices = {
        { text = "Then we should heal the land, not fight over it.", next = "BACK", reply = "Your heart is good. If more walked this way, the earth would sing again.", fx = { align = { light = 1 } } },
        { text = "The land bears war. That's the way of things.", next = "BACK", reply = "Perhaps. But even a warrior must rest, and the earth is tired.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Brumn Winterhoof, of the Winterhoof tribe. I teach leatherworkers to bind the elements, fire and earth and wind and water, into the hides they shape." } },
      again = { { id = "h_again", text = "What else, friend?" }, { id = "h_again2", text = "Speak, friend. The hides are drying and the wind is slow, so I have time for your words." } },
      choices = {
        { text = "What is elemental leatherworking?", next = "elemental" },
        { text = "Why camp so far from Hammerfall?", next = "camp" },
        { text = "The ogres of Boulder'gor are close.", next = "ogres" },
        { text = "I'm a leatherworker. Can you teach me?", next = "teach", when = { profession = "Leatherworking" } },
        { text = "Where is the Winterhoof tribe?", next = "ytribe" },
        { text = "Do the orcs of Hammerfall visit you?", next = "yorcs" },
        { text = "What hides do you use for your work?", next = "w2_hides" },
        { text = "Farewell.", next = "END" },
      },
    },
    elemental = {
      lines = { { id = "elemental_default", text = "It is the art of binding the spirits of the elements into leather, so that the armour sings with their strength. Fire makes it fierce, earth makes it steady, and the wind makes it swift." } },
      choices = {
        { text = "Is it dangerous?", next = "danger" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    danger = {
      lines = { { id = "danger_default", text = "Only to the impatient, for the elements do not like to be rushed. I have seen hides burst into flame because their maker did not listen." } },
      choices = {
        { text = "How does one listen to leather?", next = "listen" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    listen = {
      lines = { { id = "listen_default", text = "With your hands, and with your heart, the way a hunter listens to the grass. The hide was once a living thing, and it remembers, if you are gentle." } },
      choices = {
        { text = "Every craft should honor the living.", next = "BACK", reply = "You understand, friend. The Earth Mother walks with you.", fx = { align = { light = 1 } } },
        { text = "A hide is just a hide.", next = "BACK", reply = "Then you will never master this art.", fx = { align = { light = -1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "camp_default", text = "The orcs are loud, and the elements prefer quiet. Here on the hill, I can hear the wind and the earth, and they teach me more than any orc could." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ogres = {
      lines = { { id = "ogres_default", text = "They are, and they are not quiet neighbours. But they leave me alone, mostly, for they fear the spirits I call." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    teach = {
      lines = { { id = "teach_default", text = "If you are patient, and if your hands are steady. Bring me the elements' gifts, and we shall see what you can learn." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    cairne = { { id = "yarbrumnwinterhoof4", text = "The great chief of the tauren. He sent me east to listen." } },
    mulgore = { { id = "yarbrumnwinterhoof5", text = "Home. The plains, and the wind, and the long grass." } },
    _none = { { id = "tp_none", text = "I do not know that, friend. The winds have not whispered it to me." } },
  },
}


---------------------------------------------------------------------------
-- Dabyrie's Farmstead: the Dabyrie brothers and the militia they keep. The Horde wants their heads.
---------------------------------------------------------------------------
P:NPC {
  key = "ar_fardel_dabyrie", id = 4479, name = "Fardel Dabyrie", gender = "male",
  role = "farmer", tier = "service",
  communities = { "stromgarde" }, temper = { "sly" }, values = { "family", "profit" },
  notices = { "faction", "class" },
  impression = {
    first = "A rangy farmer with a sly grin lounges against the Dabyrie barn, a pitchfork over one shoulder and a dagger in his boot that he doesn't bother to hide.",
    third = "{name} met Fardel Dabyrie, one of the brothers at Dabyrie's Farmstead.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, the friendly stranger returns. Mother says you're welcome on our land, and that's not something she says lightly." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. If you're here for something, you're very welcome to leave." },
    { id = "g_default", text = "Afternoon, stranger. If you're here for the harvest, you're late, and if you're here for something else, you're very welcome to leave." },
  },
  start = "hello",
  nodes = {
    w2_dagger = {
      lines = {
        { id = "w2_dagger_l", text = "Off a Syndicate thug who came round last autumn asking for protection money. Mother paid him in turnips and I paid him back in the barn. He left the dagger, and the turnips, in a hurry." },
      },
      choices = {
        { text = "You fought him off alone?", next = "w2_dagger2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_dagger2 = {
      lines = {
        { id = "w2_dagger2_l", text = "Alone is a strong word. Marcel was standing behind me with a shovel, looking like he might use it, which is the scariest thing about Marcel. I'll never tell him that, so don't you either." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yleave2 = {
      lines = {
        { id = "ybarfardeldabyrie1", text = "Go to Stormwind and see the Cathedral, and maybe the sea. I've never seen the sea, believe it or not. Marcel says it's just a big lake. I say a big lake is still a big lake, and worth seeing." },
        { id = "ybarfardeldabyrie2", when = { race = "NightElf" }, text = "You came from over the sea, didn't you? Is it as big as they say?" },
      },
      choices = {
        { text = "Do you resent the farm?", next = "yresent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yresent = {
      lines = {
        { id = "ybarfardeldabyrie3", text = "Some days. It's Mother's dream, and Grandfather's, and maybe Marcel's. I don't know if it's mine." },
      },
      choices = {
        { text = "It's your family's legacy. Honour it.", next = "BACK", reply = "I suppose. Someone has to keep the oak watered.", fx = { align = { honor = 1 } } },
        { text = "Find your own dream. The farm can wait.", next = "BACK", reply = "Maybe I will. Don't tell Mother, she'll throw a pan.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybest = {
      lines = {
        { id = "yarfardeldabyrie1", text = "The sunrise over the hills, before the trolls wake up. And the smell of the bread Mother bakes on market day. And the look on Marcel's face when I get up first, which happens about once a year." },
        { id = "yarfardeldabyrie2", when = { race = "Human" }, text = "You'll know farm mornings, I'd guess. There's nothing like them, even with trolls about." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "Fardel Dabyrie, and this is my mother's farm, and that lump over there is my brother Marcel. We keep our heads down and our fields planted, which is more than most can say in Arathi these days." } },
      again = { { id = "h_again", text = "Something else on your mind, friend?" } },
      choices = {
        { text = "What's your mother like?", next = "xmother" },
        { text = "Do you and Marcel get along?", next = "xmarcel" },
        { text = "Have you ever thought of leaving?", next = "xleave" },
        { text = "Why keep a militia on a farm?", next = "militia" },
        { text = "Folk say your family has sticky fingers.", next = "thieves" },
        { text = "What's the best thing about the farm?", next = "ybest" },
        { text = "What would you do if you could leave?", next = "yleave2" },
        { text = "Where did you get that dagger in your boot?", next = "w2_dagger" },
        { text = "I'll be going.", next = "END" },
      },
    },
    militia = {
      lines = { { id = "m_default", text = "Because the Syndicate rides out of Stromgarde's ruins, the trolls come down from the hills, and the Horde sits at Hammerfall licking its lips. Stromgarde can't guard every field, so we guard our own." } },
      choices = {
        { text = "Good on you for standing your ground.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Private armies make me nervous.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    thieves = {
      lines = { { id = "t_default", text = "Folk say a great many things, especially folk who've lost things. If somebody's missing a trinket, I suggest they look harder before they go accusing honest farmers." } },
      choices = {
        { text = "Honest farmers don't grin like that.", next = "grin" },
        { text = "Fair enough.", next = "BACK" },
      },
    },
    grin = {
      lines = { { id = "g2_default", text = "My mother says I was born grinning, and she ought to know. Now, unless you're accusing me of something, I'd mind my own business, friend." } },
      choices = { { text = "I'll take your word for it.", next = "BACK" } },
    },
    xmother = {
      lines = {
        { id = "xm1", text = "Kenata Dabyrie is the hardest woman in Arathi, and that includes the trolls. She buried my father, kept the farm through two wars, and still serves supper hot to the militia every night." },
      },
      choices = {
        { text = "She sounds formidable.", next = "BACK", reply = "Formidable's the kind word. Marcel calls her the Sergeant, but never to her face." },
      },
    },
    xmarcel = {
      lines = {
        { id = "xma1", text = "Marcel thinks being born first makes him the head of the family, and Mother thinks Marcel thinks too much. We argue over the plough and the fences and whose turn it is with the cows, and that's brotherhood." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xleave = {
      lines = {
        { id = "xl1", text = "Every week, stranger, usually when the drums start up in the hills. But my grandfather broke this ground, and I'll be the last Dabyrie to leave it, or the first to die on it." },
      },
      choices = {
        { text = "Would Refuge Pointe protect you?", next = "xrefuge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrefuge = {
      lines = {
        { id = "xr1", text = "Refuge Pointe can barely protect itself. Their soldiers ride past now and then, wave, and ride on, and once they helped themselves to a sack of our grain on the way." },
      },
      choices = {
        { text = "A farm needs its own sword. Good on you.", next = "BACK", reply = "That's what I keep telling the militia, between their naps.", fx = { align = { order = -1 } } },
        { text = "You should stand with Stromgarde, together.", next = "BACK", reply = "Maybe, if Stromgarde ever stands still long enough to be stood with.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = {
    sea = { { id = "ycarfardeldabyrie1", text = "I've never seen it. Marcel says it's a big lake. I want to see for myself." } },
    kenata = { { id = "yarfardeldabyrie3", text = "My mother. The hardest woman in Arathi." } },
    stromgarde = { { id = "xtp_sg", text = "Proud lords on a hill. We grow their bread and they forget our names." } },
    trolls = { { id = "xtp_tr", text = "Witherbark. They come at night with drums, and the dogs know before we do." } }, _none = { { id = "tp_none", text = "Never heard of it, and I'd rather not. Ask Marcel, he knows less than me." } } },
}

P:NPC {
  key = "ar_marcel_dabyrie", id = 4481, name = "Marcel Dabyrie", gender = "male",
  role = "farmer", tier = "service",
  communities = { "stromgarde" }, temper = { "gruff" }, values = { "family" },
  notices = { "faction" },
  impression = {
    first = "A heavyset farmer leans on a fencepost at Dabyrie's Farmstead, chewing a stalk of grass and watching you the way he'd watch a fox near the henhouse.",
    third = "{name} spoke with Marcel Dabyrie at the family farmstead.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hmph. You again, and you minded the chickens last time. I'll let you stay a while." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Mind the chickens, and keep your hands where I can see them." },
    { id = "g_default", text = "Hmph. Another traveller. Mind the chickens, and keep your hands where I can see them." },
  },
  start = "hello",
  nodes = {
    w2_horse = {
      lines = {
        { id = "w2_horse_l", text = "Syndicate came down the road two summers back and took her out of the barn while we slept. Bess, her name was. Pulled the plough for nine years and never once kicked a man who didn't deserve it." },
      },
      choices = {
        { text = "Have you seen her since?", next = "w2_horse2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_horse2 = {
      lines = {
        { id = "w2_horse2_l", text = "Once, under a rider on the road to Stromgarde, with a Syndicate saddle on her. I'd know her gait anywhere. I'd have gone after her if Mother hadn't held my collar, and I'm still not sure she was right." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfather = {
      lines = {
        { id = "ybarmarceldabyrie1", text = "He'd say we've kept it, and that's enough. He'd be ashamed we haven't stood up to the Syndicate. He'd be proud of Fardel, though he'd never say it. He'd be proud of Mother. He was always proud of Mother." },
        { id = "ybarmarceldabyrie2", when = { race = "Human" }, text = "You'll have known men like him. Quiet, strong, and stubborn as an ox." },
      },
      choices = {
        { text = "Should you fight the Syndicate?", next = "yfight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfight = {
      lines = {
        { id = "ybarmarceldabyrie3", text = "Mother says no. She says we pay them and they leave us be. But my father would have fought." },
      },
      choices = {
        { text = "Listen to your mother. Pay and survive.", next = "BACK", reply = "Aye. She's kept us alive this long.", fx = { align = { order = 1 } } },
        { text = "Stand up to them. Your father would.", next = "BACK", reply = "Maybe. I'd need more than a shovel.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfardel = {
      lines = {
        { id = "yarmarceldabyrie1", text = "Run the farm myself, and grumble about it, and miss him every day. Don't tell him that. He'd never let me forget it, and I'd never live it down at the market." },
        { id = "yarmarceldabyrie2", when = { race = "Human" }, text = "You'll have brothers too, maybe. Then you know how it is: you fight like dogs, and you'd die for each other." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I'm Marcel, the elder brother, though Fardel would tell you otherwise. Mother runs the farm, I run the fields, and Fardel runs his mouth." } },
      again = { { id = "h_again", text = "What else? Speak up, I've fences to mend, and the posts won't set themselves." } },
      choices = {
        { text = "Your brother says you're the lump.", next = "xlump" },
        { text = "What do you grow out here?", next = "xgrow" },
        { text = "I'm a farmer's child myself.", next = "xfarm", when = { race = "Human" } },
        { text = "Hard times for farming here?", next = "hard" },
        { text = "Tell me about your mother.", next = "mother" },
        { text = "What would you do if Fardel left?", next = "yfardel" },
        { text = "What would your father say about the farm now?", next = "yfather" },
        { text = "How did you lose the horse?", next = "w2_horse" },
        { text = "I'll leave you to your fences.", next = "END" },
      },
    },
    hard = {
      lines = { { id = "h2_default", text = "Hard as they've ever been since the trolls came back and the Horde set up at Hammerfall. Half our neighbours packed up for Refuge Pointe or gave up and went south, but the Dabyries stay." } },
      choices = {
        { text = "Why not leave too?", next = "leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leave = {
      lines = { { id = "l_default", text = "Because my father's buried under that oak, and I'll not leave him to the trolls. Besides, there's no farm in Stormwind going cheap for a family like ours." } },
      choices = {
        { text = "Family ties are worth fighting for.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mother = {
      lines = { { id = "m_default", text = "Kenata's tougher than either of us, and she'd tell you so. She kept this farm going through the Second War with nothing but a hoe and her temper." } },
      choices = { { text = "She sounds formidable.", next = "BACK" } },
    },
    xlump = {
      lines = {
        { id = "xl1", text = "Does he now? The lump got up two hours before him this morning and mended the north fence while Fardel was still snoring. You can tell him I said so, and tell him slowly, so he understands." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgrow = {
      lines = {
        { id = "xg1", text = "Wheat in the low field, turnips, cabbages, and a few rows of potatoes Mother won't let anyone touch. The soil's good, if you can keep the trolls off it." },
      },
      choices = {
        { text = "Do you sell to Refuge Pointe?", next = "xsell" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xsell = {
      lines = {
        { id = "xs1", text = "When they pay. Lately they pay in promises, and promises don't buy seed. A Smokywood goblin up there offered us a fair price once, and I nearly died of shock." },
      },
      choices = {
        { text = "Charge them what you're owed. No credit.", next = "BACK", reply = "My thinking exactly, though Mother calls it unneighbourly.", fx = { align = { honor = -1 } } },
        { text = "They're fighting for you. Give them credit.", next = "BACK", reply = "Hmph. Maybe. I'll think on it, which is more than Fardel would do.", fx = { align = { honor = 1 } } },
      },
    },
    xfarm = {
      lines = {
        { id = "xf1", text = "Are you? Then you know a field doesn't care who's king or who's at war. It wants weeding either way, and so does mine, if you're stopping long." },
      },
      choices = {
        { text = "I'm not stopping that long.", next = "BACK", reply = "Of course you aren't. Nobody ever is." },
      },
    },
  },
  topics = {
    father = { { id = "ycarmarceldabyrie1", text = "Buried under the oak. He'd have fought the Syndicate." } },
    fardel = { { id = "yarmarceldabyrie3", text = "My brother. Grins too much and gets up late." } },
    syndicate = { { id = "xtp_sy", text = "They took our horse two years back. I'd know that horse anywhere." } },
    kenata = { { id = "xtp_ke", text = "Mother. She runs this farm, and the rest of us just think we do." } }, _none = { { id = "tp_none", text = "Don't know, don't care. Ask at Refuge Pointe." } } },
}

P:NPC {
  key = "ar_dabyrie_militia", id = 2581, name = "Dabyrie Militia", gender = "male",
  role = "guard", tier = "service",
  communities = { "stromgarde" }, temper = { "nervous" }, values = { "duty" },
  notices = { "faction" },
  impression = {
    first = "A farmhand in mismatched armour stands guard at the Dabyrie fence, gripping a spear as though it might run away from him.",
    third = "{name} met one of the militia guarding Dabyrie's Farmstead.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you! Thank goodness, you're not a troll. Stay a while, if you like." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'd almost rather see a troll coming over the hill." },
    { id = "g_default", text = "Who goes there? Oh, you're not a troll. Good, good, carry on, then." },
  },
  start = "hello",
  nodes = {
    w2_pay = {
      lines = {
        { id = "w2_pay_l", text = "Two silver a week, a bed in the hayloft, and as much stew as I can eat. That's better than most soldiers at Refuge Pointe get, and the stew's better too. I've written my mother to tell her I'm getting fat." },
      },
      choices = {
        { text = "Are you?", next = "w2_pay2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_pay2 = {
      lines = {
        { id = "w2_pay2_l", text = "A bit, around the middle. The armour doesn't close any more. Fardel says it's the stew, and Marcel says it's the standing around, and Kenata says I'm to stop complaining and keep watching the hill." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ykenata = {
      lines = {
        { id = "ybardabyriemilitia1", text = "Strict, fair and terrifying. She pays on time, feeds us well and shouts if we slack. Once she caught me asleep on watch and made me muck out the pigs for a week. I never slept on watch again." },
        { id = "ybardabyriemilitia2", when = { class = "WARRIOR" }, text = "She'd like you. She likes anyone who looks like they could hit a troll properly." },
      },
      choices = {
        { text = "The militia should stand their post, whatever comes over that hill.", next = "BACK", reply = "You're right, and I try, though my knees shake every time I hear a twig snap.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "If the trolls come, run. A farm's not worth dying for.", next = "BACK", reply = "Don't say that out loud, Kenata might hear you, and she'd stop feeding us.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "Something else.", next = "BACK" },
      },
    },
    yafter = {
      lines = {
        { id = "yardabyriemilitia1", text = "Go home to my mother in Southshore, if there's still a home. She thinks I'm a farmhand, and I've not had the heart to tell her otherwise. A son with a shovel is easier to worry about than a son with a spear." },
        { id = "yardabyriemilitia2", when = { race = "Human" }, text = "You'll know how mothers are. Mine would come out here and hit the trolls herself if she knew." },
      },
      choices = {
        { text = "Should you tell her the truth?", next = "ytruth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytruth = {
      lines = {
        { id = "yardabyriemilitia3", text = "I don't know. She'd worry, and she has a bad heart. But she'd want to know." },
      },
      choices = {
        { text = "Tell her. She deserves the truth.", next = "BACK", reply = "Aye, you're right. I'll write tonight, and pray she reads it sitting down.", fx = { align = { honor = 1 } } },
        { text = "Spare her. Some truths only hurt.", next = "BACK", reply = "That's what I've been telling myself. I'll keep it, a while longer.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I guard the farm for the Dabyries, which mostly means standing here and hoping nothing comes over the hill. The pay's poor, but Kenata feeds us well." } },
      again = { { id = "h_again", text = "Something else? Talk quietly, I'm meant to be watching, and Kenata can hear through barn walls." } },
      choices = {
        { text = "Have you ever had to fight?", next = "xfight" },
        { text = "Who hired you?", next = "xhired" },
        { text = "Seen anything strange lately?", next = "xstrange" },
        { text = "What comes over the hill?", next = "hill" },
        { text = "Were you a soldier before?", next = "before" },
        { text = "What will you do after this job?", next = "yafter" },
        { text = "What's Kenata like to work for?", next = "ykenata" },
        { text = "How much does Kenata pay you, really?", next = "w2_pay" },
        { text = "I'll let you keep watch.", next = "END" },
      },
    },
    hill = {
      lines = { { id = "h2_default", text = "Witherbark trolls from the east, Syndicate thugs from the west, and Horde raiders from Hammerfall when they're feeling bold. Nobody comes to buy turnips, I'll tell you that." } },
      choices = {
        { text = "Hold the line. The farm needs you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd run if I were you.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    before = {
      lines = { { id = "b_default", text = "A farmhand, same as now, only with fewer spears about. Lieutenant Valorcall's riders taught us which end to point, and that's the whole of my training." } },
      choices = {
        { text = "Who is Valorcall?", next = "valorcall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    valorcall = {
      lines = { { id = "v_default", text = "He leads what's left of Stromgarde's cavalry, and he rides past every few days to show the flag. Seeing his banner on the road does wonders for a fellow's nerves." } },
      choices = { { text = "Good to know.", next = "BACK" } },
    },
    xfight = {
      lines = {
        { id = "xf1", text = "Twice, and I'd rather not make it three. A Witherbark troll came at the barn with a spear and I hit it with a shovel, which surprised us both, I think." },
      },
      choices = {
        { text = "What happened then?", next = "xthen" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xthen = {
      lines = {
        { id = "xt1", text = "It ran, and I sat down in the hay and shook for an hour. Kenata gave me an extra helping of stew that night and said I'd earned it, which is the only medal I've ever got." },
      },
      choices = {
        { text = "A shovel's a fine weapon.", next = "BACK", reply = "Better than the rusty sword they gave me, that's for certain." },
      },
    },
    xhired = {
      lines = {
        { id = "xh1", text = "Kenata Dabyrie, the old woman who runs the farm. Stromgarde was meant to post soldiers out here, but they never did, so she hired a handful of us from Refuge Pointe and the farms round about." },
      },
      choices = {
        { text = "Stromgarde should have sent proper soldiers.", next = "BACK", reply = "Aye, they should, and I'd have gone home to my mother.", fx = { align = { order = 1 } } },
        { text = "Hired guards are better than distant lords.", next = "BACK", reply = "Well, we're cheaper, anyway, and the food's better.", fx = { align = { order = -1 } } },
      },
    },
    xstrange = {
      lines = {
        { id = "xs1", text = "Lights up on the hills toward the trolls' camps, and once a hooded man asking after the road to Stromgarde. He didn't buy any turnips either, so I reckoned he was Syndicate." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    valorcall = { { id = "ybardabyriemilitia3", text = "The cavalry lieutenant. When his banner passes, I sleep easier." } },
    southshore = { { id = "yardabyriemilitia4", text = "My mother's home. I'll go back when this job's done." } },
    trolls = { { id = "xtp_tr", text = "Witherbark. Big tusks, bad tempers, and they don't like shovels." } },
    kenata = { { id = "xtp_ke", text = "She pays us in stew and coin, in that order of quality." } }, _none = { { id = "tp_none", text = "Don't ask me, I just hold the spear. Ask Fardel." } } },
}

---------------------------------------------------------------------------
-- Stromgarde Troll Hunter: torch-bearing soldiers clearing the keep of trolls.
---------------------------------------------------------------------------
P:NPC {
  key = "ar_stromgarde_troll_hunter", id = 2583, name = "Stromgarde Troll Hunter", gender = "male",
  role = "soldier", tier = "service",
  communities = { "stromgarde" }, temper = { "grim" }, values = { "duty", "honor" },
  notices = { "race", "class" },
  impression = {
    first = "A Stromgarde soldier carries a burning torch in one hand and a notched sword in the other. His face is streaked with soot, and he smells of smoke and troll blood.",
    third = "{name} spoke with a Stromgarde troll hunter in the keep.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, and still breathing. Stay close to the walls, and burn any troll you find." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Keep close to the walls, and keep out of our way." },
    { id = "g_default", text = "Keep close to the walls, and if you see a troll, burn it. Steel alone won't keep them down." },
  },
  start = "hello",
  nodes = {
    w2_kit = {
      lines = {
        { id = "w2_kit_l", text = "Oil for the torch, a flint and a spare, and a skin of water that isn't for drinking. A burning troll runs, and if he runs into the dry grass you've set fire to the Highlands and killed nobody." },
      },
      choices = {
        { text = "Has that happened?", next = "w2_kit2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_kit2 = {
      lines = {
        { id = "w2_kit2_l", text = "Once, the year I started. Burned half a hillside west of the ruins, and the troll walked out of the smoke laughing. My captain made me carry water for a season. I've never forgotten the skin since." },
        { id = "w2_kit2_l1", when = { class = "MAGE" }, text = "Once, and it was a mage's fireball, not my torch, so don't look at me like that. Burned half a hillside and the troll walked out laughing. Since then the water skin goes everywhere." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yworst = {
      lines = {
        { id = "ybarstromgardetrollhunter1", text = "A Witherbark shadow hunter who came at us in the lower keep, with a mask of bone and a voice like the wind. Three of us went down before I put a torch to him. He was laughing as he burned." },
        { id = "ybarstromgardetrollhunter2", when = { race = "Troll" }, text = "You'd know their ways, maybe. Do your shadow hunters laugh like that?" },
      },
      choices = {
        { text = "Hunt the trolls in the open, as soldiers of Stromgarde should.", next = "BACK", reply = "Aye. We fight them face to face, with torch and steel, the way Lord Trollbane would have.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Poison the trolls' water. Let them rot in their own camps.", next = "BACK", reply = "That's the Syndicate's way, not ours, and Stromgarde will not sink to it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do you ever wonder about them?", next = "ywonder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywonder = {
      lines = {
        { id = "ybarstromgardetrollhunter3", text = "About the trolls? Sometimes. They were here first, before Thoradin. Some say we should make peace with them. Some say we should burn them all." },
      },
      choices = {
        { text = "There's honour in peace, even with old enemies.", next = "BACK", reply = "Maybe. But I've not met a Witherbark who'd stop to listen.", fx = { align = { honor = 1 } } },
        { text = "Burn them. They'll never stop.", next = "BACK", reply = "That's what my father said. I think he was right.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylong = {
      lines = {
        { id = "yarstromgardetrollhunter1", text = "Since I was sixteen, and my father before me. He lost his arm to a Witherbark axe and taught me to fight with my left so I'd never be caught short. I'm better with my left than my right now." },
        { id = "yarstromgardetrollhunter2", when = { race = "Troll" }, text = "Your people don't burn. The Amani do. I've never understood why, but I'm glad of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "We hunt the trolls in Stromgarde's ruins, so that one day the keep might be whole again. It's slow work, and the Syndicate doesn't make it easier." } },
      again = { { id = "h_again", text = "What else? Quick, now. The trolls don't nap long, and I want to be back before they wake." } },
      choices = {
        { text = "How many trolls are in the ruins?", next = "xmany" },
        { text = "Who leads you?", next = "xlead" },
        { text = "Trolls are my people. Speak carefully.", next = "xtroll", when = { race = "Troll" } },
        { text = "Why the torch?", next = "torch" },
        { text = "Can Stromgarde be retaken?", next = "retake" },
        { text = "How long have you hunted trolls?", next = "ylong" },
        { text = "What's the worst troll you've faced?", next = "yworst" },
        { text = "What does a troll hunter carry, besides a torch?", next = "w2_kit" },
        { text = "Good hunting.", next = "END" },
      },
    },
    torch = {
      lines = { { id = "t_default", text = "A troll's wounds close up faster than you can make them, unless you burn them. Our grandfathers learned that fighting the Amani alongside Thoradin, and we learned it again the hard way." } },
      choices = { { text = "I'll remember that.", next = "BACK" } },
    },
    retake = {
      lines = { { id = "r_default", text = "If Stormwind sent us half the men it promised, aye, but we're on our own more often than not. Some days I think we're only holding it out of stubbornness." } },
      choices = {
        { text = "Stubbornness won Arathor once.", next = "stubborn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stubborn = {
      lines = { { id = "s_default", text = "It did, and Stromgarde was the first city of men because of it. We'll hold it for Thoradin's line, or what's left of it, until we can't hold anything at all." } },
      choices = {
        { text = "Stromgarde deserves better from Stormwind.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Hold fast. The Alliance will come.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    xmany = {
      lines = {
        { id = "xm1", text = "Too many to count and more every month, Witherbark and some others from the hills. They creep into the lower keep at night and the Syndicate holds the upper towers, and we hold a broken wall in between." },
      },
      choices = {
        { text = "Why not wait for reinforcements?", next = "xwait" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xwait = {
      lines = {
        { id = "xw1", text = "From whom? Lordaeron is gone, Gilneas shut its gates, and Stormwind is a long way south. Stromgarde fights its own battles, as it always has." },
      },
      choices = {
        { text = "Then Stromgarde will retake its keep alone.", next = "BACK", reply = "That's the spirit of Thoradin, friend. We'll do it or die trying.", fx = { align = { order = 1 } } },
        { text = "Alone, you'll all die in those ruins.", next = "BACK", reply = "Maybe so. Better that than living in tents forever.", fx = { align = { order = -1 } } },
      },
    },
    xlead = {
      lines = {
        { id = "xl1", text = "Lord Galen Trollbane commands from Refuge Pointe, though he's sworn to sit in his father's throne again. Out here it's our sergeants, and they lead from the front, which is why we keep needing new ones." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtroll = {
      lines = {
        { id = "xt1", text = "Darkspear, are you? Your lot isn't the Amani, I know, and I've no quarrel with you. But these Witherbark are kin to the Amani, and they'd eat you as quick as me." },
      },
      choices = {
        { text = "I know. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    shadow_hunter = { { id = "ycarstromgardetrollhunter1", text = "Bone masks and voices like the wind. They laugh as they burn." } },
    father = { { id = "yarstromgardetrollhunter3", text = "He lost his arm to a Witherbark axe and taught me to fight with my left." } },
    trolls = { { id = "xtp_tr", text = "Burn them, or they get up again. My father taught me that." } },
    thoradin = { { id = "xtp_th", text = "The first king of Arathor. He united men to beat the trolls, and we're still at it." } }, _none = { { id = "tp_none", text = "No idea. Ask at Refuge Pointe, they've got the maps." } } },
}

---------------------------------------------------------------------------
-- Dwarven Farmer: an Ironforge farmer working the isolated eastern fields.
---------------------------------------------------------------------------
P:NPC {
  key = "ar_dwarven_farmer", id = 12998, name = "Dwarven Farmer", gender = "male",
  role = "farmer", tier = "service",
  communities = { "ironforge" }, temper = { "cheerful" }, values = { "work" },
  notices = { "race" },
  impression = {
    first = "A stout dwarf in a straw hat works a patch of earth far from any road, whistling to himself and talking to his cabbages.",
    third = "{name} met a dwarven farmer working the isolated fields of Arathi.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Well, I'll be! Ye've come back tae see the fields, {g:lad|lass}, an' they're growin' grand this season." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Stay off the furrows, an' dinnae trample the seedlings." },
    { id = "g_default", text = "Well, I'll be! A visitor, way out here? Ye must be lost, {g:lad|lass}, or very curious." },
  },
  start = "hello",
  nodes = {
    w2_dabyrie = {
      lines = {
        { id = "w2_dabyrie_l", text = "Now an' then, at harvest, when Kenata wants a hand an' I want her salt. She's a hard woman, but fair, an' she pays in coin, which is more than Refuge Pointe does. Her lads are a pair, though." },
      },
      choices = {
        { text = "What do you make of her sons?", next = "w2_dabyrie2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_dabyrie2 = {
      lines = {
        { id = "w2_dabyrie2_l", text = "Marcel's the plough an' Fardel's the scythe, an' neither's happy unless the other's being useless. They'll be fine, the both o' them, once their mother lets them run somethin' on their own." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yhard = {
      lines = {
        { id = "ybardwarvenfarmer1", text = "The trolls, an' the crows, an' the rain that comes sideways off the hills. But the worst is the Syndicate, who ride by an' take a cut o' the harvest. I've a rifle by the door for the next one." },
        { id = "ybardwarvenfarmer2", when = { race = "Dwarf" }, text = "Ye'd do the same, I'd wager. A dwarf doesnae pay a thief twice." },
      },
      choices = {
        { text = "Will you fight them?", next = "yfight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfight = {
      lines = {
        { id = "ybardwarvenfarmer3", text = "Aye, if they come again. Marcel Dabyrie says I should pay an' keep the peace. I say a thief who's paid once comes back twice." },
      },
      choices = {
        { text = "Pay them. Keep the peace and your life.", next = "BACK", reply = "Hmph. That's Marcel's answer. I'll think on it.", fx = { align = { order = 1 } } },
        { text = "Fight them. A thief should be stopped.", next = "BACK", reply = "Aye! Ye're a proper dwarf at heart, whatever yer blood.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yclan = {
      lines = {
        { id = "yardwarvenfarmer1", text = "Aye, though ye'd not know it from the dirt under me nails. Me father's a mining foreman in Ironforge, an' me brother's a rifleman wi' the Mountaineers. I'm the black sheep, or the green one, I suppose." },
        { id = "yardwarvenfarmer2", when = { race = "Dwarf" }, text = "Ye'll know the type, then. Every clan has one who wanders off. I'm ours, an' proud of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I farm, {g:lad|lass}, plain and simple. Ironforge cannae eat stone, so some of us come out where the soil's soft and grow what the mountain cannae." } },
      again = { { id = "h_again", text = "Somethin' else? The cabbages willnae mind, an' they're better listeners than most folk I know." } },
      choices = {
        { text = "Do you miss Ironforge?", next = "xmiss" },
        { text = "What do you grow here?", next = "xgrow" },
        { text = "Fellow dwarf here. Farming suits you?", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Why so far from anyone?", next = "far" },
        { text = "A dwarf farmer? That's unusual.", next = "unusual" },
        { text = "Are you a Bronzebeard?", next = "yclan" },
        { text = "What's the hardest part of farming here?", next = "yhard" },
        { text = "Do you ever talk to the Dabyries?", next = "w2_dabyrie" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    far = {
      lines = { { id = "f_default", text = "Because there's nobody out here to steal the crops, nor trample them, nor tax them. The trolls and orcs stay to the west, and I'm happy to let them." } },
      choices = {
        { text = "Don't you get lonely?", next = "lonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lonely = {
      lines = { { id = "l_default", text = "Now and again, aye, but the cabbages are fine company, and they never argue. I go home to Ironforge for the winter, and that's enough noise to last me." } },
      choices = { { text = "Sounds peaceful.", next = "BACK" } },
    },
    unusual = {
      lines = { { id = "u_default", text = "Not as much as ye'd think! Plenty of us farm the lowlands round Dun Morogh, and there's a fine farm down in the Wetlands too. Every dwarf needs bread with his ale." } },
      choices = { { text = "Fair point.", next = "BACK" } },
    },
    xmiss = {
      lines = {
        { id = "xm1", text = "The ale, aye, and the noise o' the Great Forge, and my cousin's terrible singing at the Stonefire. But a dwarf can only spend so many years under the mountain before he wants tae see the sky." },
      },
      choices = {
        { text = "What did your clan think?", next = "xclan" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xclan = {
      lines = {
        { id = "xc1", text = "My father said no Bronzebeard ever pulled a turnip, an' I told him somebody had tae feed the miners. He still writes once a year tae ask if I've come tae my senses." },
      },
      choices = {
        { text = "A dwarf belongs under the mountain.", next = "BACK", reply = "Aye, that's what my father says, an' he's never once been right about me.", fx = { align = { order = 1 } } },
        { text = "Good on you. Follow your own road.", next = "BACK", reply = "Ha! I like ye, {g:lad|lass}. Ye can stay for supper.", fx = { align = { order = -1 } } },
      },
    },
    xgrow = {
      lines = {
        { id = "xg1", text = "Barley, mostly, for the brewers back home, an' a fine crop o' hops. Every keg in Thunderbrew has a wee bit o' Arathi in it, an' nobody in Ironforge knows it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = {
        { id = "xd1", text = "Suits me better than mining ever did, an' I've all my fingers still, which is more than most miners can say. Ye'll find the soil here's soft as a feather bed after Dun Morogh." },
      },
      choices = {
        { text = "Maybe I'll try it someday.", next = "BACK", reply = "Do! Bring a strong back an' a stronger thirst." },
      },
    },
  },
  topics = {
    syndicate = { { id = "ycardwarvenfarmer1", text = "Thieves on horseback. I've a rifle by the door for the next one." } },
    bronzebeard = { { id = "yardwarvenfarmer3", text = "Me clan. Miners an' riflemen, an' one farmer." } },
    ironforge = { { id = "xtp_if", text = "Home, though I like it best when it's far away." } },
    thunderbrew = { { id = "xtp_tb", text = "My barley's in their ale. Don't tell them, they'll want a discount." } }, _none = { { id = "tp_none", text = "Couldnae tell ye. Ask me about cabbages instead." } } },
}

---------------------------------------------------------------------------
-- Injured Soldier: wounded Horde grunts at Hammerfall, patients of the first aid
-- trial run by Doctor Gregory Victor (Triage).
---------------------------------------------------------------------------
P:NPC {
  key = "ara_injured_soldier", id = 12923, name = "Injured Soldier",
  role = "soldier", tier = "service",
  communities = { "hammerfall" }, temper = { "gruff", "pained" }, values = { "strength", "the Horde" },
  impression = {
    first = "A wounded orc lies on a cot, teeth gritted against the pain, bandages soaked through.",
    third = "{name} spoke with an injured soldier waiting for treatment at Hammerfall.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again. You fight well, and the company remembers it. Sit, and let the doctor work." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I would not trust you to hold a line, and I will not pretend otherwise." },
    { id = "g_default", text = "If you're a healer, get on with it. If you're not, stop staring." },
    { id = "g_q", when = { questActive = TODO_QUEST("Triage") }, text = "The doctor sent you? Then work fast. Some of us won't last the hour." },
  },
  start = "hello",
  nodes = {
    w2_ridge = {
      lines = {
        { id = "w2_ridge_l", text = "Short. We were three grunts taking crates down to Hammerfall, and the bolt took me before I saw the crossbow. The other two dragged me behind a rock and held the road until the wind rider came." },
      },
      choices = {
        { text = "Did the other two make it?", next = "w2_ridge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_ridge2 = {
      lines = {
        { id = "w2_ridge2_l", text = "One did. The other is under a cairn by the road, and I've promised to put his axe on it when I can walk. He had a woman in Razor Hill, so I'll take her his tusk charm, too." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yhealed = {
      lines = {
        { id = "ybarainjuredsoldier1", text = "Go back to the ridge, and find that crossbowman, and put him in the ground. Then I'll drink, and then I'll go home to Durotar and see my mother, who still thinks I'm a cook." },
        { id = "ybarainjuredsoldier2", when = { race = "Orc" }, text = "You'll know how it is with mothers. They never think you're a warrior until you come home with a scar." },
      },
      choices = {
        { text = "A wounded warrior should be treated before he's sent back to the line.", next = "BACK", reply = "Yes. A warrior who bleeds on the battlefield helps no one but the enemy.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Patch the wounded fast and send them back. The Horde needs bodies.", next = "BACK", reply = "The Horde needs warriors, not corpses, and a half-healed orc is a corpse waiting to happen.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Something else.", next = "BACK" },
      },
    },
    yfrom = {
      lines = {
        { id = "yarainjuredsoldier1", text = "Durotar, born under Thrall's banner. My father was in the internment camps, and he made me swear to never let the humans cage another orc. So I came here, to the old camp, to hold it." },
        { id = "yarainjuredsoldier2", when = { race = "Orc" }, text = "You'll know the story, then. Every family in Durotar has one like it." },
      },
      choices = {
        { text = "Do you hate the humans?", next = "yhate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhate = {
      lines = {
        { id = "yarainjuredsoldier3", text = "My father did. I don't know if I do. The ones on the ridge shot me, yes. But I've seen human farmers at the Dabyrie place, and they only want to grow their wheat. Maybe they're not all the same." },
      },
      choices = {
        { text = "Some are honorable. Judge each one.", next = "BACK", reply = "Maybe. My father wouldn't agree. But my father isn't here.", fx = { align = { honor = 1 } } },
        { text = "They caged our people. Never forget.", next = "BACK", reply = "I won't. Not while this leg reminds me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Syndicate blades and Stromgarde arrows, that's how I got here. Doctor Victor says I'll fight again, if the bleeding stops. I'm holding him to it." },
      },
      again = { { id = "h_again", text = "Talk if you must. It takes my mind off the leg." } },
      choices = {
        { text = "How did you get hurt?", next = "xhurt" },
        { text = "Who's the doctor here?", next = "xdoc" },
        { text = "I'm a healer. Let me look.", next = "xheal", when = { class = "PRIEST" } },
        { text = "I'm a shaman. I can mend wounds.", next = "xheal", when = { class = "SHAMAN" } },
        { text = "Who did this to you?", next = "who" },
        { text = "Do you need anything?", next = "need" },
        { text = "Where are you from?", next = "yfrom" },
        { text = "Lok'tar, brother. You'll fight again.", next = "BACK", when = { race = "Orc" }, reply = "Lok'tar. I will, if the doctor stops talking long enough to finish." },
        { text = "What will you do when you're healed?", next = "yhealed" },
        { text = "What was the fight on the ridge like?", next = "w2_ridge" },
        { text = "Hold on, soldier.", next = "END" },
      },
    },
    who = {
      lines = { { id = "wh_default", text = "Stromgarde's men from the ruins, and the Syndicate thieves hiding in the old keeps. The humans fight dirty here, but so do we, when we have to." } },
      choices = {
        { text = "Then we answer them in blood.", next = "BACK", reply = "Lok'tar. Bring me one of their banners when you do.", fx = { align = { honor = -1 } } },
        { text = "Fight them, but fight with honour.", next = "BACK", reply = "Honour's a fine thing. It doesn't stop arrows.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    need = {
      lines = { { id = "ne_default", text = "Clean bandages and a strong drink, in that order. And if you see the doctor, tell him I've been patient, which is a lie he'll enjoy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhurt = {
      lines = {
        { id = "xh1", text = "Syndicate crossbow from a ridge above the road to Stromgarde. I never saw the man, only the flash of his cloak and then the bolt in my leg." },
      },
      choices = {
        { text = "Did your patrol get him?", next = "xgot" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xgot = {
      lines = {
        { id = "xg1", text = "No, and he'll be back on that ridge tomorrow. The Syndicate fight like cowards, from cover and in the dark, and we lose good warriors to men we never see." },
      },
      choices = {
        { text = "Fight them the same way. Ambush the ambushers.", next = "BACK", reply = "Hah. You'd make a good scout. The captains won't like it.", fx = { align = { honor = -1 } } },
        { text = "Meet them openly. Don't sink to their level.", next = "BACK", reply = "Honor gets you shot from a ridge, but I'll take it.", fx = { align = { honor = 1 } } },
      },
    },
    xdoc = {
      lines = {
        { id = "xd1", text = "Doctor Gregory Victor tends the wounded, and he's more patient than I am, which isn't hard. He talks the whole time he works, so at least you're not bored while he digs out the bolt." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xheal = {
      lines = {
        { id = "xhe1", text = "Then lay your hands on and stop talking about it. The leg first, if you please, and I'll owe you a drink when I can walk to the tavern." },
      },
      choices = {
        { text = "Hold still.", next = "BACK" },
      },
    },
  },
  topics = {
    mother = { { id = "ycarainjuredsoldier1", text = "She thinks I'm a cook. I'll tell her the truth when I have a scar to show." } },
    father = { { id = "yarainjuredsoldier4", text = "He was in the camps. He made me swear." } },
    durotar = { { id = "yarainjuredsoldier5", text = "Home. Red earth and Thrall's banner." } },
    syndicate = { { id = "xtp_sy", text = "Cowards with crossbows. Find them and I'll walk again just to thank you." } },
    stromgarde = { { id = "xtp_sg", text = "Humans who won't stop coming. I'll give them that much." } },
  },
}
