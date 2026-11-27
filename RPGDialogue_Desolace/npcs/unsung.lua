-- Nijel's Point's general store and kitchen, with nothing to say until now. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "christi", id = TODO_NPC("Christi Galvanis"), name = "Christi Galvanis",
  title = "General Goods",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "nijels_point" }, temper = { "brisk", "wry" }, values = { "practical", "loyal" },
  notices = { "weary", "kit", "lock_soulstone" },

  impression = {
    first = "She talks about the wasteland as though it were a tiresome joke.",
    third = "{name} met Christi Galvanis, who keeps the general store at Nijel's Point.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "There you are! I put aside rope and bandages for you. And yes, twice the water." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Water, rope, bread, torches. What'll it be? Quickly." },
    { id = "g_shop", text = "Water, rope, bread and torches, the four things you'll miss most down there. What'll it be?" },
    { id = "g_back", when = { metBefore = true }, text = "You made it back up the mountain! That's more than some can say." },
  },

  notice = {
    { id = "n_ressick", cat = "weary", when = { resSick = true },
      text = "Desolace got you, didn't it? Everyone looks like that after their first trip down. Sit, have some water, and try not to go back until you can stand straight." },
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "You're half-dressed, friend, and the sun down there will burn you raw. I don't sell armor, but you'll want a cloak at the very least." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "Someone's tied your soul to a stone, haven't they? I've seen warlocks do that for their friends before they go down to Thunder Axe, and the ones with stones tend to come back, so I suppose it's a kindness of sorts." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Only as much as everything else in Desolace. If your spirits find something living down there, let me know, because I've stopped believing in it." } },
      choices = {
        { text = "There's life down there yet. Don't give up on it.", next = "BACK", reply = "I'd like to believe you, I really would, and if you find any, bring me a sprig, so I can put it in the window.", fx = { align = { light = 1 } } },
        { text = "Desolace is dead. Sell what you can, and leave.", next = "BACK", reply = "That's what half the Point says, and the other half buys rope for the trip, so I'll keep selling to both.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Water, every time, because they think a strong arm makes up for a dry throat, and Desolace teaches them otherwise by noon. The ones who come back buy twice as much the second trip, which is good for business and better for them." } },
      choices = {
        { text = "Preparation wins more fights than strength. I'll stock up.", next = "BACK", reply = "Now there's a customer after my own heart, and I'll throw in a word of advice for free: twice the water you think.", fx = { align = { order = 1 } } },
        { text = "I'll travel light and take what the land gives.", next = "BACK", reply = "Then you'll be back tomorrow buying twice as much, like all the rest, and I'll be glad to see you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Scorpid shells, mostly, and hides so dry they crack when you fold them, and the occasional story nobody believes. One fellow swore he'd seen a centaur riding a kodo, and I've decided I'd rather not know whether he was lying." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Scorpid shells, mostly, and hides so dry they crack when you fold them, and the occasional story nobody believes. And {pet} looks like it's had quite enough of the dust already, poor thing. They all do, after a day down there." },
      },
      choices = {
        { text = "Desolace still has life in it, if you look.", next = "BACK", reply = "I hope so, I really do, and if you ever find some, I'd pay a good price for a fresh hide that doesn't crack.", fx = { align = { light = 1 } } },
        { text = "Desolace is dead ground. I just take what's left.", next = "BACK", reply = "That's honest, at least, and it's more than most adventurers admit before they ask what I'll pay.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Less to thieves than to the dust, and the dust doesn't even have the decency to run off with it. The Captain's men keep a close eye on the store, so most of the light fingers here belong to the centaurs, and they prefer whole wagons." } },
      choices = {
        { text = "I'd never steal from the last green spot in Desolace.", next = "BACK", reply = "Thank you, that's a nice thing to say, though I'm not sure anything in Desolace counts as green.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good thief would have taken it before you noticed.", next = "BACK", reply = "Maybe so, but the centaur already have, and they've left me with nothing worth taking twice.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Candles, flour, string and a box of chalk I bought from a dwarven salvager who swore it came from a Dalaran estate. It's probably just chalk, but it's very good chalk, and it's the closest thing to an arcane supply you'll find for a hundred miles." } },
      choices = {
        { text = "I'll take the chalk and believe the story. It's half the value.", next = "BACK", reply = "That's the spirit, and I'll tell you the whole story while I wrap it, because it's half the price.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Sell it as chalk, and you'll have nothing to answer for.", next = "BACK", reply = "That's the sensible way, and I'll probably do it, though the story does help it sell.", fx = { align = { order = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Most of them come back thinner and quieter, and a few don't come back at all, so I've stopped asking where people are headed. It's easier to sell someone a water skin when you don't know they're walking toward the centaur." } },
      choices = {
        { text = "Ask them anyway. Someone should remember who goes down there.", next = "BACK", reply = "You may be right, and maybe I'll start writing their names down, just in case nobody else does.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Wise. Out here you can't carry everyone's worries.", next = "BACK", reply = "That's what I tell myself, and it helps most days, though not on the days they don't come back.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Water, bandages and patience, in that order, and I can only sell them the first two. The caravan's late more often than it's on time, so I keep a little back for the soldiers when supplies run thin, and I don't put that on anyone's tab." } },
      choices = {
        { text = "That's a kindness the Point won't forget.", next = "BACK", reply = "I hope not, because I'd hate to think it's the only kindness the Point has to remember.", fx = { align = { light = 1 } } },
        { text = "You should charge them. They're paid soldiers.", next = "BACK", reply = "They are, but the Captain pays late and the caravan's later, and a thirsty soldier is a poor guard.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Not badly, just carefully, because the Burning Blade are only a few days' walk south and everyone's heard what goes on at Thunder Axe. Spend your coin, keep your temper, and they'll come round, the way they did with me when I first set up shop." }, { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Not badly, just carefully, because the Burning Blade are a few days' walk south, and your demon standing in my doorway does remind them of it. Send it off while you shop, spend your coin and keep your temper, and they'll come round, the way they did with me." } },
      choices = {
        { text = "Coin spent, temper kept. I can manage that.", next = "BACK", reply = "Good, then you'll find the Point less frightened of you than you'd expect, given time.", fx = { align = { order = 1 } } },
        { text = "Their fear isn't my problem to fix. It might be useful.", next = "BACK", reply = "It isn't, but it'll be your problem when they won't sell you anything, so it's worth a little patience.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The Circle does, out near their camp, and Keeper Marandis buys my seeds a dozen packets at a time. He says the trouble is in the earth itself, deep down, so I suppose he's planting more out of hope than sense." } },
      choices = {
        { text = "Hope is how every forest started. Keep selling him seeds.", next = "BACK", reply = "I will, and I'll throw in a packet for free now and then, because somebody ought to believe in him.", fx = { align = { light = 1 } } },
        { text = "It's a waste of good seed. Desolace is finished.", next = "BACK", reply = "Maybe so, but the Keeper doesn't think so, and I'd rather sell seeds to a hopeful man than nothing to nobody.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior, ready to go down into Desolace and fight the whole of it single-handed. You'll want rope, bandages and twice the water you think you need." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. I sell arrows by the quiver and rope by the coil, and in Desolace you'll need more of both than you planned." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Well, I don't stock holy water, but I've got bandages, bread and enough water skins to get you to the bottom of Desolace and back, which round here is about the same as a miracle." },
        { id = "h_default", key = true,
          text = "I'm Christi Galvanis, and I keep the general goods. Nijel's Point is the last bit of green before the whole of Desolace turns to dust, so whatever you need for the trip down, buy it from me, because nobody else is going to sell it to you." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, browsing my shelves with both hands in plain sight. I appreciate the courtesy, because in Desolace most thieves can't be bothered to pretend." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! I don't suppose you could conjure me a shipment that arrives on time, because the caravan certainly can't." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll want more water than you think and less armor than you're wearing, though I don't expect you'll take my advice on the second." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Browsing my shelves with those ink-black fingers? Soul shards I don't stock, and I'll thank you not to ask where I'd even get them." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! I've seeds for sale, if you think there's anywhere down in Desolace they might take, though I've never sold a packet to anyone who came back to tell me it worked." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! You can ask the dust where it all comes from, because I've been sweeping it for three years and it just keeps coming." },
      },
      again = {
        { id = "h_again", text = "What else? I'm not going anywhere, and neither is the dust." },
        { id = "h_again2", text = "Go on and ask; I've nothing but time up here on the ridge." },
      },
      choices = {
        { text = "Good preparation keeps a traveler alive.", next = "BACK", reply = "Exactly. Most think they'll manage. Most don't.", fx = { align = { order = 1 } } },
        { text = "I'll travel light and figure it out.", next = "BACK", reply = "Then you'll figure out how thirsty you can get. Buy something or don't.", fx = { align = { order = -1 } } },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "What do I need for Desolace?", next = "need" },
        { text = "Keeping shelves stocked out here can't be easy.", next = "stock" },
        { text = "Why would anyone live at Nijel's Point?", next = "why" },
        { text = "Do you lose much stock to thieves out here, Christi?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you stock anything for mages, Christi?", next = "xmage", when = { class = "MAGE" } },
        { text = "People must come back up from Desolace changed.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do warriors usually forget to buy, Christi?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Hunters must bring strange things back up from Desolace.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What do the soldiers here run short of most, Christi?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do people at Nijel's Point treat folk like me badly, Christi?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Nobody could plant anything down there, surely, Christi.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does all that dust trouble you, Christi?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    need = {
      lines = {
        { id = "n_default", text = "Water, first and always, because the springs down there are foul or guarded or both. Then something to keep the sun off, and a good pair of boots, since the ground's all sharp stone and old bones." },
      },
      choices = {
        { text = "Old bones?", next = "need_bones" },
        { text = "Something else.", next = "BACK" },
      },
    },
    need_bones = {
      lines = {
        { id = "nb_default", text = "Kodo bones, mostly, and enough of them to build a city. There's a great valley of them down south where the old kodos go to die, and it's not a place I'd want to spend a night." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    stock = {
      lines = {
        { id = "s_default", text = "Through Stonetalon, over the mountains, and down the long road on the back of whatever beast will carry it. Every crate that arrives here costs twice what it did in Auberdine, and I'm sorry, but I don't make the roads." },
      },
      choices = {
        { text = "That's fair, considering.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because somebody has to keep an eye on the centaur, and on the demon-worshippers out at Thunder Axe, and the Alliance needs a foothold in this part of Kalimdor. And because I was offered good wages, which I'll admit had something to do with it." },
      },
      choices = {
        { text = "Duty and wages. Both good reasons.", next = "BACK", reply = "It is, and I'll admit the wages were most of it, but the duty part has grown on me since.", fx = { align = { order = 1 } } },
        { text = "Wages, mostly, I'd wager.", next = "BACK", reply = "Mostly, but don't tell the Captain, because he thinks we're all here for king and country.", fx = { align = { order = -1 }, trait = { witty = 1 } } },
        { text = "Demon-worshippers?", next = "why_demons" },
      },
    },
    why_demons = {
      lines = {
        { id = "wd_default", text = "Orcs who never gave up their old ways, holed up in Thunder Axe Fortress to the southwest and calling themselves the Burning Blade. Vahlarriel Demonslayer, the night elf who hunts them, can tell you more, if you can find him, and if you'd rather not sleep tonight." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I kept a shop in Auberdine before this one. I thought I'd like a change of scenery, and I got one." } },
    advice = { { id = "tp_ad", text = "Carry twice the water you think you'll need down there, and then tuck one more flask in your pack for luck." } },
    centaur = { { id = "tp_centaur", text = "The centaur come up the mountain about once a month, and once a month we discover the walls are a bit lower than we thought. I sell a lot of arrows the week after." } },
    maraudon = { { id = "tp_maraudon", text = "The druids say Maraudon is a poisoned tomb full of crystals, and a fellow came up last week with his pockets full of them and his face full of thorns. I bought the crystals, I'm not proud." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay ships charge me double for everything because Desolace is so far from anywhere. They're right, which doesn't make me like it." } },
    theramore = { { id = "tp_theramore", text = "I hear Theramore has a market with fish and vegetables and roofs, all at once. I'll go someday, when the dust lets me out." } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask Innkeeper Lyshaerya; travelers tell her everything." } },
  },
}

P:NPC {
  key = "janet_hommers", id = TODO_NPC("Janet Hommers"), name = "Janet Hommers",
  title = "Food & Drink",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "nijels_point" }, temper = { "warm", "talkative" }, values = { "kind", "practical" },
  notices = { "hunger", "drink", "lock_pact" },

  impression = {
    first = "She worries over every traveler who goes down into Desolace.",
    third = "{name} met Janet Hommers, who sells food and drink at Nijel's Point.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "There you are, dear! Sit down; the bread is warm, and I won't let you go hungry." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Bread's warm. Pay first, please, and then you can go." },
    { id = "g_kitchen", text = "Bread's warm and the water's clean, which is more than you'll find down the mountain, dear." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, you're back! Come in and eat something; you look like Desolace chewed you up." },
  },

  notice = {
    { id = "n_hungry", cat = "hunger", when = { timeOfDay = "dusk" },
      text = "It's near supper, dear, and the stew's been on since noon. Have a bowl now, while the patrol's still out and there's some left in the pot." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've had a drop or two, haven't you? Eat some bread, dear, and drink some water, and don't go down that path until you've got your feet under you." },
    { id = "n_lock_pact", cat = "lock_pact", when = { class = "WARLOCK", aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "You're flushed like you've a fever, and I've seen that on warlocks before, so I'd guess it's their imp's doing. Have some water before you eat, because the bread won't help with that." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They say the centaur are angry, and the demons are angry, and the dead are angry, so I imagine the spirits have joined in. Eat up, and come back hungry." } },
      choices = {
        { text = "I'll calm what I can down there.", next = "BACK", reply = "Bless you, dear, and come back after, because calming spirits must work up a terrible appetite.", fx = { align = { light = 1 } } },
        { text = "Let them be angry. I'll be quicker.", next = "BACK", reply = "Quicker, maybe, but you'll be hungrier too, so take an extra roll for the road, dear.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "As well as I can manage on what the caravans bring up the road, which some weeks is very little. The soldiers on the ridge get the first helpings, because Captain Pentigast says a hungry sentry is a sleepy one, and I'm not about to argue with him." } },
      choices = {
        { text = "Sentries first. The captain's right about that.", next = "BACK", reply = "He is, dear, and the sentries know it, so they always leave a little extra for the cook.", fx = { align = { order = 1 } } },
        { text = "Everyone should eat alike. Rank shouldn't fill a plate.", next = "BACK", reply = "That's a lovely thought, dear, and I'd do it if there were enough to go round, but there rarely is.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Precious little, I'm afraid, because the lizards are as tough as boots and the scorpids taste of sand. The deer up here around the Point are better, though there aren't many left, and I'd like to keep it that way." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Bring {pet} round to the back door, if you like, because there are always scraps, and I never could stand to see a beast go hungry." },
      },
      choices = {
        { text = "Leave the deer be. The Point should keep what it has.", next = "BACK", reply = "I think so too, dear, and I've asked the hunters to leave them alone, though not all of them listen.", fx = { align = { light = 1 } } },
        { text = "The soldiers come first. A few deer won't be missed.", next = "BACK", reply = "Maybe not, dear, but I'll miss them, and so will anyone who likes a bit of fresh meat now and then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Thistles and bones, mostly, and a few hardy roots the kodos dig up. I tried planting herbs against the outpost wall once, and the wind had taken the lot by morning." } },
      choices = {
        { text = "Plant again. Stubbornness is how forests start.", next = "BACK", reply = "You're right, dear, and I'll try again in the spring, with a better wall and fewer hopes.", fx = { align = { light = 1 } } },
        { text = "Don't waste good seed on dead ground.", next = "BACK", reply = "Maybe so, dear, but planting something gives me hope, and hope's worth a packet of seed.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It fills you, I'll grant, but it doesn't taste of anything, and you can't share it with a stranger at the fire the way you can share a good loaf. A body walking down into Desolace needs real food, and a soul needs company, so I make both as best I can." } },
      choices = {
        { text = "Real bread, then. You're right about the company.", next = "BACK", reply = "Thank you, dear, and I'll save you a slice of the good loaf, the one with the crust.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Conjured food keeps me alive and costs nothing. I'll stick to it.", next = "BACK", reply = "Suit yourself, dear, but you'll miss out on the stories that come with the bread.", fx = { align = { light = -1 } } },
        { text = "Something else, Janet.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A few, and they're the quietest customers I have, which I suppose makes sense if your companions are always listening. One of them told me the little red ones eat anything, so I've started locking the bread away at night, just in case." },
      },
      choices = {
        { text = "I'll keep my little friend in hand. Your bread is safe.", next = "BACK", reply = "Thank you, dear, and I'll unlock the bread for you, though I'll keep one eye on the little fellow.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It goes where it pleases. Lock the bread away.", next = "BACK", reply = "Then I'll lock it away twice, dear, and you can have yours with a side of my suspicion.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They're tired and homesick, and they pretend they're neither because Captain Pentigast is watching. I feed them as well as I can, but bread only goes so far when a lad's lost a friend to a centaur arrow." } },
      choices = {
        { text = "I'll sit with them after supper. That's what I'm for.", next = "BACK", reply = "Bless you, dear, and I'll keep the kettle on for you, because they'll talk more over tea.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Soldiers are tough. Keep them fed, and the rest will mend.", next = "BACK", reply = "They are tough, dear, but even tough lads need someone to sit with them when the night is long.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It needs someone the young ones can look up to, because they came out here thinking it would be glory and found it's mostly dust and waiting. You stand a bit straighter than most, and the young ones notice." } },
      choices = {
        { text = "Then I'll drill with them. Discipline keeps a soldier alive.", next = "BACK", reply = "That's just what they need, dear, and you'll find them following you around like ducklings.", fx = { align = { order = 1 } } },
        { text = "They should know the truth. Glory is a story told to recruits.", next = "BACK", reply = "Maybe they should, dear, but I'd rather they learned it slowly, with a full belly, than all at once.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Only when the caravan's late, and then it's soldiers, and I can't hold it against them. I leave a loaf on the windowsill most nights now, and it's always gone by morning, though I've never once caught who takes it." } },
      choices = {
        { text = "That's generous. I'll pay for my bread, Janet.", next = "BACK", reply = "You're a dear, and I'll take your coin gladly, but the windowsill loaf stays where it is.", fx = { align = { order = 1 } } },
        { text = "A hungry soldier takes what he needs. That's fair.", next = "BACK", reply = "That's how I see it too, dear, and that's why the loaf stays on the windowsill every night.", fx = { align = { order = -1 } } },
        { text = "Something else, Janet.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! You'll be going down into Desolace, I suppose, so sit and eat first, because nobody fights well on an empty belly." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! If you bring down anything up here that's fit to cook, bring it round to my kitchen, because the soldiers are sick to death of cheese." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Oh, a priest, thank goodness. Most of the soldiers here haven't had a proper blessing since they left Stormwind, so if you've a moment after supper, I'd count it a kindness if you sat with them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin at my table! You'll eat first, no arguments, because I've never yet seen anybody protect anything on an empty stomach." },
        { id = "h_default", key = true,
          text = "I'm Janet Hommers, and I feed this outpost with bread, cheese, water and something stronger for the evenings. I make sure nobody goes down into Desolace on an empty stomach, because it's hard enough on a full one." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Sit down and eat, dear, because there's nothing growing down there worth putting in your mouth." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "Are you a mage? Then promise me you'll eat my bread before you eat that conjured stuff, because it can't be good for you to live on magic and water." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Everyone eats, and I'll feed you as well as anyone. But please keep the little red thing that's peeking out from behind you off my tables, because the last one bit a loaf." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You there, with the quiet boots. If you're hungry, you only have to ask, dear, because I'd far rather feed you than count my loaves after you've gone." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! You'll eat before you go down there, spirits or no spirits, because Desolace takes more out of you than any of them give back." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? Mind the flour on that bench, I've had three soldiers sit in it this week already." },
        { id = "h_again2", text = "What else can I get you, dear, while the dough rises?" },
      },
      choices = {
        { text = "A warm meal is worth more than gold.", next = "BACK", reply = "Oh, it is, dear. Sit, and I'll show you.", fx = { align = { light = 1 } } },
        { text = "Food's just fuel for the next fight.", next = "BACK", reply = "Then you've never had my bread. Pay and go.", fx = { align = { light = -1 } } },
        { text = "Does anything still grow in Desolace?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Let me see the food.", next = "BUSINESS" },
        { text = "Baking bread out here must take some doing.", next = "bread" },
        { text = "How are the soldiers holding up?", next = "soldiers" },
        { text = "Do many travelers come through?", next = "travelers" },
        { text = "Conjured food seems good enough to me, Janet.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you get many quiet customers like me at Nijel's Point, Janet?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The soldiers at Nijel's Point look worn out.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does Nijel's Point need most from someone like me?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the soldiers here eat well enough to fight, Janet?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What's fit to eat down in Desolace, Janet?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Food must go missing here now and then, Janet.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do travellers say the spirits are angry down there, Janet?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    bread = {
      lines = {
        { id = "b_default", text = "With flour that comes a long way and water from the spring up the hill, and an oven I built myself out of stones from the mountainside. It's not Stormwind bread, but it's warm, and out here warm counts for a lot." },
      },
      choices = {
        { text = "It smells wonderful.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldiers = {
      lines = {
        { id = "s_default", text = "Tired, dear, and a bit lonely, and too proud to say so. Captain Pentigast works them hard, and the centaur raids keep them up at night, so I feed them as well as I can and let them grumble at me." },
      },
      choices = {
        { text = "That's kind of you.", next = "BACK", reply = "It's only bread and a listening ear, dear, but it's what I've got, and they seem to need it.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Soldiers grumble. That's their job.", next = "BACK", reply = "They do, dear, and they're very good at it, but I'd still rather they grumbled at me than at the centaur.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Do the centaur raid often?", next = "soldiers_centaur" },
      },
    },
    soldiers_centaur = {
      lines = {
        { id = "sc_default", text = "Not up here, thank the Light, but the patrols down below run into them all the time. The Kolkar and the Gelkis and the rest of the clans fight among themselves, and anyone who wanders between them gets trampled." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    travelers = {
      lines = {
        { id = "t_default", text = "A steady trickle, dear, adventurers mostly, headed down to the centaur lands or the old caverns in the south. Some come back, and some don't, and I keep a loaf aside for each of them until I know which." },
      },
      choices = {
        { text = "Keep one aside for me.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I cooked in an inn in Stormwind, once, and came out here because the outpost needed a cook. I've never regretted it, except when the sand gets in the dough, which is most days." } },
    advice = { { id = "tp_ad", text = "Eat before you go down, dear, and take bread with you. Always." } },
    centaur = { { id = "tp_centaur", text = "Every time the centaur ride close, the guards come in hungry and frightened, and I feed the hungry part. The frightened part takes longer." } },
    holy_light = { { id = "tp_holy_light", text = "I bless every loaf in the Light's name, and maybe that's why they last so well in this heat. Or maybe it's the salt." } },
    theramore = { { id = "tp_theramore", text = "Some of our people came out of Theramore, and they miss the sea air and the fish stew. I do my best with what we have, which is mostly dust." } },
    scourge = { { id = "tp_scourge", text = "My sister's family was in Lordaeron when the plague came, and I've had no word since. I bake their names into the bread on the anniversary, and I don't tell anyone why." } },
    _none = { { id = "tp_none", text = "I'm sure I don't know, dear. Ask Christi at the store; she hears all the gossip." } },
  },
}
