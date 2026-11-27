-- Morgan's Vigil, the traders: Gabrielle Chase (food and drink) and Felder Stover (weaponsmith).
-- Voice: bibles/morgans_vigil_traders.md
local P = RPGDialogueAPI:Pack("rpgd.burningsteppes")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q_JAILBREAK = TODO_QUEST("Jail Break!")

---------------------------------------------------------------------------
-- Gabrielle Chase, food and drink
---------------------------------------------------------------------------
P:NPC {
  key = "gabrielle_chase", id = TODO_NPC("Gabrielle Chase"), name = "Gabrielle Chase", title = "Food & Drink",
  bible = "bibles/morgans_vigil_traders.md", role = "vendor", tier = "service",
  communities = { "morgans_vigil" }, temper = { "warm", "weary" }, values = { "generous", "steady" },
  notices = { "race", "kit" },

  impression = {
    first = "She has decided not to fear the Steppes, and mostly manages it.",
    third = "{name} met Gabrielle Chase, who keeps Morgan's Vigil fed from a tent among the ruins.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are, and back from the Steppes again! I've put your stool by the window, the one that isn't scorched." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'll pour you a drink, since I pour for everyone, but I'll not keep count of whether you come back." },
    { id = "g_default", text = "Sit, if you can find a stool that isn't scorched, and have something to drink before the ash gets in your throat." },
    { id = "g_back", when = { metBefore = true }, text = "You made it back! I always keep count of who comes back from the Steppes, and I'm glad to put another mark by your name." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "You can see the mountain glowing from here at night, so I keep my back to it and my lantern lit." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, and you'll want something stronger than my milk, I expect, so I'll point you at the ale and not ask questions." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armour's half melted at the edges, love. Felder's at the forge across the way, if you want it seen to before it falls off." },
  },

  start = "hello",
  nodes = {
    dd_gc_party = {
      lines = {
        { id = "dd_gc_party1", text = "A Firegut helmet, and he swears it improves the flavour. The whole Vigil had the first proper night off since I got here, singing and burning ogre banners, and Marshal Maxwell even pretended not to notice. You ought to have stayed for it." },
      },
      choices = {
        { text = "Every soldier at the Vigil should eat, whether they can pay or not.", next = "BACK", reply = "That's what I tell Marshal Maxwell, and he grumbles, but he hasn't stopped me yet.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Charge the soldiers double. Where else will they drink out here?", next = "BACK", reply = "I could, and they'd pay it, and then they'd stop coming back. I'd rather keep my customers alive.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let them celebrate. They've earned a night off.", next = "BACK", reply = "That's what I said, and the marshal didn't argue, which is as near as he comes to agreeing.", fx = { align = { order = -1 } } },
        { text = "One night is fine. The Blackrock orcs won't rest.", next = "BACK", reply = "No, they won't, and the watch knew it. They drank in shifts, if you can believe it.", fx = { align = { order = 1 } } },
        { text = "Something else, Gabrielle.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Gabrielle, and I keep the cheese and the drink for anyone who's still standing at the Vigil. It's not a tavern, more's the pity, but it's the closest thing to one between here and Lakeshire." },
        { id = "h_human", when = { race = "Human" },
          text = "From Stormwind, by the look of you, or near enough, and I'll bet you haven't had a decent cheese since Redridge. Sit down, then, and let me fix that." },
        { id = "h_windsor", when = { questActive = Q_JAILBREAK },
          text = "Is it true you're going into the mountain after Marshal Windsor? Eat something first, please, because I won't have it said that anyone left my tent hungry before something like that." },
        { id = "h_windsor_done", tags = { "news" }, when = { questDone = Q_JAILBREAK },
          text = "You're the one who brought the Marshal out of the mountain! The whole Vigil's been talking about it, and Marshal Maxwell even smiled, which I've never seen him do before." },
        { id = "dd_ogrehead", tags = { "news" }, when = { questDone = TODO_QUEST("Ogre Head On A Stick = Party") },
          text = "Oralius has Gor'tesh's ugly head up on a stick at the top of the Vigil, and everyone knows whose blade took it off. He's been drinking my good stock out of a helmet ever since." },
        { id = "dd_pyron", when = { questDone = TODO_QUEST("Overmaster Pyron") },
          text = "Jalinda came down from her maps smiling for once, saying you'd put out that great burning thing at the mouth of the Depths. I gave her a cheese to celebrate, which she ate standing up, still working." },
      },
      again = {
        { id = "h_again", text = "What else, love? The kettle's on." },
        { id = "h_again2", text = "Go on, I've nothing to do but listen and stir." },
      },
      choices = {
        { text = "Oralius is drinking out of a helmet?", next = "dd_gc_party", when = { questDone = TODO_QUEST("Ogre Head On A Stick = Party") } },
        { text = "What have you got to eat?", next = "BUSINESS" },
        { text = "Why stay in a place like this?", next = "stay" },
        { text = "What happened to the town?", next = "town" },
        { text = "Who comes through the Vigil these days?", next = "folk" },
        { text = "Do you know anything about Marshal Windsor?", next = "windsor", when = { questBefore = Q_JAILBREAK } },
        { text = "Where does a cheese come from, up here?", next = "w9_cheese" },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    w9_cheese = {
      lines = {
        { id = "w9_cheese_d", text = "Lakeshire, love, on Borgus Stoutarm's gryphons, wrapped in three layers of cloth so it doesn't come out of the sky tasting of ash. Half of it still does, and I tell the soldiers it's smoked on purpose, and they're too hungry to argue." },
        { id = "w9_cheese_v1", when = { race = "Human" }, text = "Redridge, the same as you'd buy at home, flown in on Borgus's gryphons and wrapped three times against the ash. You'll taste a bit of smoke in it, love, but you'll taste home too, and that's worth more than the copper." },
      },
      choices = {
        { text = "Does Borgus mind carrying cheese?", next = "w9_cheese2" },
        { text = "Smoked on purpose. Clever.", next = "w9_cheese2" },
        { text = "Something else.", next = "BACK" },
      },
    },

    w9_cheese2 = {
      lines = { { id = "w9_cheese2_d", text = "He grumbles that his gryphons smell of it for days and the black dragons can follow the scent, which I don't believe for a moment. I give him the first slice of every wheel, and he's stopped grumbling, mostly." } },
      choices = {
        { text = "Bribery works wonders.", next = "BACK", reply = "It's not bribery, love, it's hospitality. There's a difference, somewhere." },
        { text = "Something else.", next = "BACK" },
      },
    },

    stay = {
      lines = { { id = "st_default", text = "Because the soldiers stay, and soldiers need feeding, and someone has to haul the cheese up from Lakeshire. I came up with my brother's company two seasons ago, and he went into the mountain with Morgan's lot, and I stayed to wait." } },
      choices = {
        { text = "Your brother went into Blackrock?", next = "stay_brother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay_brother = {
      lines = { { id = "stb_default", text = "With the rest of the militia, aye, after Morgan herself, and none of them have come back up that road yet. I tell myself they're busy, and I keep a seat for him, and I don't let anyone sit in it." } },
      choices = {
        { text = "I'll keep an eye out for him.", next = "stay_hope" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay_hope = {
      big = true,
      lines = { { id = "sth_default", text = "Would you? His name's Tomas, and he's tall and loud and hopeless at cards, and he'll be wherever the fighting is thickest. People tell me I'm a fool to keep hoping, but I'd sooner be a fool than a widow-in-waiting." } },
      choices = {
        { text = "Keep hoping. Hope is worth more than odds.", next = "BACK", reply = "Bless you for that, love, it's more than most up here will give me. If you see a tall, loud fool losing at cards, tell him his supper's going cold.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Prepare yourself, Gabrielle. The mountain doesn't give people back.", next = "BACK", reply = "I know it, I do, and I've heard it from wiser folk than you. I'll keep the pot on all the same, because the day I stop is the day I've buried him myself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    town = {
      lines = { { id = "to_default", text = "The Blackrock orcs came down from the Spire and burned it, more than once, and the dragons finished what the orcs left. There used to be a mage's tower, and a well, and real houses, and now there's tents and ash and that one wall nobody's had the heart to pull down." } },
      choices = {
        { text = "Why not pull it down?", next = "town_wall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town_wall = {
      lines = { { id = "tow_default", text = "Because it's the last bit that's still standing, and old Oralius at the supply tent says a wall that's survived that much has earned its place. I hang my washing on it, which I think the wall would like." } },
      choices = { { text = "I'm sure it does. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    folk = {
      lines = { { id = "fo_default", text = "Soldiers, mostly, and adventurers on their way to the mountain, and once in a while a dwarf from the Thorium Brotherhood who wants to sell me something. Ragged John comes by for drink and stories, and I give him the drink and he gives me far too much of the stories." } },
      choices = {
        { text = "Ragged John?", next = "folk_john" },
        { text = "Something else.", next = "BACK" },
      },
    },
    folk_john = {
      lines = { { id = "foj_default", text = "A dwarf who's lived out in the Steppes longer than anyone, and smells like it, bless him. He tells the most dreadful stories about drinking with a dragon, and I don't believe a word, but I always pour him another." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    windsor = {
      lines = { { id = "wi_default", text = "Only that he was a good man who came up here to lead us against the mountain, and the Dark Irons took him and his whole company. Marshal Maxwell talks about him like he's still alive, and I hope he's right, though it's been a long while." } },
      choices = { { text = "Maybe he is. Let's talk about something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I kept the kitchen at an inn in Lakeshire before I came up here. I miss the lake, and I miss walls that aren't scorched, but I don't miss the orcs from Stonewatch." } },
    _none = { { id = "tp_none", text = "I wouldn't know, love, but have a cup of something and ask Marshal Maxwell. He knows everything up here." } },
  },
}
