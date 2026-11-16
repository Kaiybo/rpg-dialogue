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
    hello = {
      lines = {
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
    hello = {
      lines = {
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
