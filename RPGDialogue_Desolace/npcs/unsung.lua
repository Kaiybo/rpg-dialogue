-- Nijel's Point's general store and kitchen, with nothing to say until now. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "christi", id = TODO_NPC("Christi Galvanis"), name = "Christi Galvanis",
  title = "General Goods",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "nijels_point" }, temper = { "brisk", "wry" }, values = { "practical", "loyal" },
  notices = { "weary", "kit" },

  impression = {
    first = "Christi Galvanis keeps the general store at Nijel's Point and has a dry word for everything Desolace throws at her. She talks about the wasteland below as though it were a long and tiresome joke.",
    third = "{name} met Christi Galvanis, who keeps the general store at Nijel's Point.",
  },

  greetings = {
    { id = "g_shop", text = "Water, rope, bread and torches, the four things you'll miss most down there. What'll it be?" },
    { id = "g_back", when = { metBefore = true }, text = "You made it back up the mountain! That's more than some can say." },
  },

  notice = {
    { id = "n_ressick", cat = "weary", when = { resSick = true },
      text = "Desolace got you, didn't it? Everyone looks like that after their first trip down. Sit, have some water, and try not to go back until you can stand straight." },
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "You're half-dressed, friend, and the sun down there will burn you raw. I don't sell armor, but you'll want a cloak at the very least." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Water, every time, because they think a strong arm makes up for a dry throat, and Desolace teaches them otherwise by noon. The ones who come back buy twice as much the second trip, which is good for business and better for them." } },
      choices = {
        { text = "Preparation wins more fights than strength. I'll stock up.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll travel light and take what the land gives.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Scorpid shells, mostly, and hides so dry they crack when you fold them, and the occasional story nobody believes. One fellow swore he'd seen a centaur riding a kodo, and I've decided I'd rather not know whether he was lying." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} looks like it's had quite enough of the dust already, poor thing. They all do, after a day down there." },
      },
      choices = {
        { text = "Desolace still has life in it, if you look.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Desolace is dead ground. I just take what's left.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Less to thieves than to the dust, honestly, and the dust doesn't even have the decency to run off with it. The Captain's men keep a close eye on the store, so most of the light fingers here belong to the centaurs, and they prefer whole wagons." } },
      choices = {
        { text = "I'd never steal from the last green spot in Desolace.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good thief would have taken it before you noticed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Candles, flour, string and a box of chalk I bought from a Reclaimer who swore it came from a Dalaran estate. It's probably just chalk, but it's very good chalk, and it's the closest thing to an arcane supply you'll find for a hundred miles." } },
      choices = {
        { text = "I'll take the chalk and believe the story. It's half the value.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Sell it as chalk, and you'll have nothing to answer for.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Most of them come back thinner and quieter, and a few don't come back at all, so I've stopped asking where people are headed. It's easier to sell someone a water skin when you don't know they're walking toward the centaur." } },
      choices = {
        { text = "Ask them anyway. Someone should remember who goes down there.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Wise. Out here you can't carry everyone's worries.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior, ready to go down into Desolace and fight the whole of it single-handed. You'll want rope, bandages and a great deal more water than you think." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. I sell arrows by the quiver and rope by the coil, and in Desolace you'll need more of both than you planned." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Well, I don't stock holy water, but I've got bandages, bread and enough water skins to get you to the bottom of Desolace and back, which round here is about the same as a miracle." },
        { id = "h_default", key = true,
          text = "Christi Galvanis, general goods. Nijel's Point is the last bit of green before the whole of Desolace turns to dust, so whatever you need for the trip down, buy it from me, because nobody else is going to sell it to you." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, browsing my shelves with both hands in plain sight. I appreciate the courtesy, truly, because in Desolace most thieves can't be bothered to pretend." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! I don't suppose you could conjure me a shipment that arrives on time, because the caravan certainly can't." },
      },
      again = {
        { id = "h_again", text = "What else? I'm not going anywhere, and neither is the dust." },
        { id = "h_again2", text = "Go on and ask; I've nothing but time up here on the ridge." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "What do I need for Desolace?", next = "need" },
        { text = "How do you keep the shelves stocked out here?", next = "stock" },
        { text = "Why would anyone live at Nijel's Point?", next = "why" },
        { text = "Do you lose much stock to thieves out here, Christi?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you stock anything for mages, Christi?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do many people come back up from Desolace changed?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do warriors usually forget to buy, Christi?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters bring anything back up from Desolace, Christi?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
        { text = "Duty and wages. A good reason.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Wages, mostly, I'd wager.", next = "BACK", fx = { align = { order = -1 }, trait = { witty = 1 } } },
        { text = "Demon-worshippers?", next = "why_demons" },
      },
    },
    why_demons = {
      lines = {
        { id = "wd_default", text = "Orcs who never gave up their old ways, holed up in a fortress to the north and calling themselves the Burning Blade. Vahlarriel can tell you more, if you can find her, and if you'd rather not sleep tonight." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I kept a shop in Auberdine before this one. I thought I'd like a change of scenery, and I got one." } },
    advice = { { id = "tp_ad", text = "Carry twice the water you think you'll need down there, and then tuck one more flask in your pack for luck." } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask the innkeeper; travelers tell her everything." } },
  },
}

P:NPC {
  key = "janet_hommers", id = TODO_NPC("Janet Hommers"), name = "Janet Hommers",
  title = "Food & Drink",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "nijels_point" }, temper = { "warm", "talkative" }, values = { "kind", "practical" },
  notices = { "hunger", "drink" },

  impression = {
    first = "Janet Hommers feeds Nijel's Point and worries over every traveler who goes down into Desolace. She seemed to measure the outpost's health by how much of her bread came back uneaten.",
    third = "{name} met Janet Hommers, who sells food and drink at Nijel's Point.",
  },

  greetings = {
    { id = "g_kitchen", text = "Bread's warm and the water's clean, which is more than you'll find down the mountain, dear." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, you're back! Come in and eat something; you look like Desolace chewed you up." },
  },

  notice = {
    { id = "n_hungry", cat = "hunger", when = { timeOfDay = "dusk" },
      text = "It's near supper, dear, and the stew's been on since noon. Have a bowl now, while the patrol's still out and there's some left in the pot." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've had a drop or two, haven't you? Eat some bread, dear, and drink some water, and don't go down that path until you've got your feet under you." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "As well as I can manage on what the caravans bring up the road, which some weeks is very little. The soldiers on the ridge get the first helpings, because Captain Pentigast says a hungry sentry is a sleepy one, and I'm not about to argue with him." } },
      choices = {
        { text = "Sentries first. The captain's right about that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Everyone should eat alike. Rank shouldn't fill a plate.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Precious little, I'm afraid, because the lizards are as tough as boots and the scorpids taste of sand. The deer up here around the Point are better, though there aren't many left, and I'd rather it stayed that way." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Bring {pet} round to the back door, if you like, because there are always scraps, and I never could stand to see a beast go hungry." },
      },
      choices = {
        { text = "Leave the deer be. The Point should keep what it has.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The soldiers come first. A few deer won't be missed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Thistles and bones, mostly, and a few hardy roots the kodos dig up. I tried planting herbs against the outpost wall once, and the wind had taken every one of them by morning." } },
      choices = {
        { text = "Plant again. Stubbornness is how forests start.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Don't waste good seed on dead ground.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It fills you, I'll grant, but it doesn't taste of anything, and you can't share it with a stranger at the fire the way you can share a good loaf. A body walking down into Desolace needs real food, and a soul needs company, so I make both as best I can." } },
      choices = {
        { text = "Real bread, then. You're right about the company.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Conjured food keeps me alive and costs nothing. I'll stick to it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Janet.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A few, and they're the quietest customers I have, which I suppose makes sense if your companions are always listening. One of them told me the imps eat anything, so I've started locking the bread away at night, just in case." } },
      choices = {
        { text = "I'll keep my imp in hand. Your bread is safe.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Imps go where they please. Lock the bread away.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They're tired and homesick, and they pretend they're neither because Captain Pentigast is watching. I feed them as well as I can, but bread only goes so far when a lad's lost a friend to a centaur arrow." } },
      choices = {
        { text = "I'll sit with them after supper. That's what I'm for.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Soldiers are tough. Keep them fed, and the rest will mend.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Honestly, it needs someone the young ones can look up to, because they came out here thinking it would be glory and found it's mostly dust and waiting. You stand a bit straighter than most, and they notice that more than you'd think." } },
      choices = {
        { text = "Then I'll drill with them. Discipline keeps a soldier alive.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "They should know the truth. Glory is a story told to recruits.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! You'll be going down into Desolace, I suppose, so sit and eat first, because nobody fights well on an empty belly." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! If you bring down anything up here that's fit to cook, bring it round to my kitchen, because the soldiers are sick to death of cheese." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Oh, a priest, thank goodness. Half the soldiers here haven't had a proper blessing since they left Stormwind, so if you've a moment after supper, I'd count it a kindness if you sat with them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin at my table! You'll eat first, no arguments, because I've never yet seen anybody protect anything on an empty stomach." },
        { id = "h_default", key = true,
          text = "Janet Hommers, and I feed this outpost. Bread, cheese, water and something stronger for the evenings, and I make sure nobody goes down into Desolace on an empty stomach, because it's hard enough on a full one." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Sit down and eat, dear, because there's nothing growing down there worth putting in your mouth." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "Are you a mage? Then promise me you'll eat my bread before you eat that conjured stuff, because it can't be good for you to live on magic and water." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Well, everyone eats, and I'll feed you as well as anyone, but please keep the little red thing off my tables, because it bit the last loaf I set out." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear?" },
        { id = "h_again2", text = "What else can I get you, dear, while the dough rises?" },
      },
      choices = {
        { text = "Does anything still grow in Desolace?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Let me see the food.", next = "BUSINESS" },
        { text = "How do you bake bread out here?", next = "bread" },
        { text = "How are the soldiers holding up?", next = "soldiers" },
        { text = "Do many travelers come through?", next = "travelers" },
        { text = "What's wrong with conjured food, Janet?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you get many warlocks at Nijel's Point, Janet?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "How are the soldiers at Nijel's Point holding up?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does Nijel's Point need most from someone like me?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the soldiers here eat well enough to fight, Janet?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What's fit to eat down in Desolace, Janet?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    bread = {
      lines = {
        { id = "b_default", text = "With flour that comes a long way and water from the spring up the hill, and an oven I built myself out of stones from the mountainside. It's not Stormwind bread, but it's warm, and out here warm counts for a great deal." },
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
        { text = "That's kind of you.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Soldiers grumble. That's their job.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
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
        { id = "t_default", text = "More than you'd think, dear, adventurers mostly, headed down to the centaur lands or the old caverns in the south. Some come back, and some don't, and I keep a loaf aside for each of them until I know which." },
      },
      choices = {
        { text = "Keep one aside for me.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I cooked in an inn in Stormwind, once, and came out here because the outpost needed a cook. I've never regretted it, not really." } },
    advice = { { id = "tp_ad", text = "Eat before you go down, dear, and take bread with you. Always." } },
    _none = { { id = "tp_none", text = "I'm sure I don't know, dear. Ask Christi at the store; she hears all the gossip." } },
  },
}
