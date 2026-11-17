-- Astranaar's shopkeepers (0.39.0): Haljan Oakheart's general goods, Xai'ander's weapons,
-- Aeolynn the clothier and Maliynn's food and drink. Voices: bibles/unsung.md.
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC = P.TODO_NPC

-- Haljan Oakheart: general goods in Astranaar.
P:NPC {
  key = "haljan", id = TODO_NPC("Haljan Oakheart"), name = "Haljan Oakheart", title = "General Goods",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "astranaar" }, temper = { "steady", "plainspoken" }, values = { "community", "endurance" },
  notices = { "weary" },
  impression = {
    first = "Haljan Oakheart keeps Astranaar's general store stocked no matter how many supply carts the Horde turns back. He is plainspoken and steady, the sort of person a village under siege leans on.",
    third = "{name} met Haljan Oakheart, who keeps Astranaar supplied through the war.",
  },

  greetings = {
    { id = "g_default", text = "Come in off the bridge. Whatever you need for the road, I likely have it, or I'll have it when the next cart gets through." },
    { id = "g_back", when = { metBefore = true }, text = "Back in one piece. Good; I like customers who come back." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You look like you've been dragged through the Thistlefur's whole hold and back. Sit a moment before you buy anything." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "No, but I've learned not to guess, and a wise shopkeeper counts the shelves either way. If you want to be useful, find out which of the Warsong scouts has been watching my carts on the eastern road, and I'll count you a friend." } },
      choices = {
        { text = "I'll find the scout and drive him off in the open.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll find him, and his own camp will lose a cart.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I'd settle for someone who could ride beside them and turn the Warsong's arrows, because my drivers are carters and not soldiers. The Sentinels can't guard every cart, and the hippogryphs carry too little to feed a whole town." } },
      choices = {
        { text = "I'll ride with your next cart and keep it safe.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Carts are your trouble, Haljan, not mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Haljan Oakheart, and I keep the general goods here in Astranaar: bread, water, bags and thread. With the orcs on the roads, half my work is getting the goods here in the first place." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I keep my eye on the satchels when your sort come in, no offence meant, because a shop under siege can't spare a single loaf. If you're buying, though, you're as welcome as anyone." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "You're a mage, and you'll travel light, I expect, though even mages need thread and a good bag. If you know a spell that keeps the Warsong off my eastern road, you'd be the most popular person in Astranaar." },
      },
      again = {
        { id = "h_again", text = "Something else? Ask away." },
        { id = "h_again2", text = "Go on, I've time between carts." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "How do supplies reach Astranaar?", next = "supply" },
        { text = "Is Astranaar safe?", next = "safe" },
        { text = "Do you really think I'd rob a village under siege?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is there a spell that could help your carts?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Goodbye, Haljan.", next = "END" },
      },
    },
    supply = {
      lines = {
        { id = "su_default", text = "By cart from Maestra's Post in the north and by hippogryph when the carts can't make it. Lately the Warsong have been watching the eastern road, so more comes by air than I'd like, because hippogryphs don't carry much flour." },
      },
      choices = {
        { text = "Has the Horde attacked your carts?", next = "supply2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply2 = {
      lines = {
        { id = "su2_default", text = "Twice this season, and both times the drivers ran for the trees and lived, which is all I asked of them. The flour was lost, but flour can be replaced, and I'd rather go hungry than bury a driver." },
      },
      choices = {
        { text = "The Horde should pay for every cart.", next = "BACK", fx = { align = { light = -1 }, learn = { "warsong" } } },
        { text = "Lives first. You chose rightly.", next = "BACK", fx = { align = { light = 1 }, affinity = 1, learn = { "warsong" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = {
        { id = "sa_default", text = "Safer than anywhere else in Ashenvale, with Lake Iris all around and the Sentinels on the bridges. But I keep a bow behind the counter all the same, and so does everyone else in town." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
  },

  topics = {
    warsong = { { id = "tp_ws", text = "The Warsong watch the eastern road now. My carts go north and around." } },
    background = { { id = "tp_bg", text = "I keep the general goods in Astranaar. I've done it since before the orcs came to the forest." } },
    advice = { { id = "tp_ad", text = "Keep enough food for two days, even on a short trip. The roads here get closed without warning." } },
    _none = { { id = "tp_none", text = "Can't say I know. Ask Sentinel Thenysil; she hears everything." } },
  },
}

-- Xai'ander: weaponsmith in Astranaar.
P:NPC {
  key = "xaiander", id = TODO_NPC("Xai'ander"), name = "Xai'ander", title = "Weaponsmith",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "astranaar" }, temper = { "intense", "grim" }, values = { "defense", "vigilance" },
  notices = { "class", "race" },
  impression = {
    first = "Xai'ander sells weapons in Astranaar and talks about the Warsong as if they were standing at the door. His blades are good, and his anger at the orcs is never far from the surface.",
    third = "{name} met Xai'ander, Astranaar's grim weaponsmith.",
  },

  greetings = {
    { id = "g_default", text = "If you're fighting for Ashenvale, I'll arm you. If you're not, there are other shops." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. How many orcs did that blade see?" },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. Your smiths work steel better than mine, I'll admit, and I keep a few Ironforge axes in the back for anyone who'd rather trust them." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Good, the Sentinels need people who can stand in front of an axe. I've something heavier than that, if you're interested." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not much, though the Sentinels tell me I should, since they fight in the open under Elune's eye. The orcs who killed my friends at the lumber camps didn't give them a fair fight, so I won't weep if you don't give them one." } },
      choices = {
        { text = "I'll fight them fairly. That's what separates us from them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "They earned a knife in the dark. I'll give it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I'd trust your frost and I'd not trust your fire, because the Warsong burn enough of this forest without our allies helping them. The Sentinels mutter about the arcane, but I've stopped caring what kills an orc so long as the trees live." } },
      choices = {
        { text = "No fire in the forest, then. Frost will serve.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fire wins battles. The trees can grow back.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Xai'ander, and I sell weapons in Astranaar. Every blade I sell might be the one that keeps an orc axe off a tree, so I don't sell bad ones." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You carry yourself like a rogue, and that suits me, because an orc can't swing an axe at what he never sees coming. I've daggers in the back sharp enough for the work." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage won't buy my blades, but I'll speak with one all the same, because frost stops an orc's charge as well as steel does." },
      },
      again = {
        { id = "h_again", text = "What else? I've blades to sharpen." },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "You sound angry about the orcs.", next = "angry" },
        { text = "What weapon suits Ashenvale?", next = "suits" },
        { text = "Do you care how an orc dies, Xai'ander?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would you trust a mage beside your Sentinels?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    angry = {
      lines = {
        { id = "an_default", text = "They came to our forest to cut down our trees for their war, and when we said no, they killed the Sentinels who said it. I've every right to be angry, and I'd like to know why everyone else isn't." },
      },
      choices = {
        { text = "Some orcs want peace, though. Thrall signed a treaty.", next = "angry2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    angry2 = {
      lines = {
        { id = "an2_default", text = "With the humans, perhaps, but the axes in Ashenvale didn't stop falling when he signed it. I'll believe in his peace when the lumber camps go quiet." },
      },
      choices = {
        { text = "The orcs must be driven from the forest.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1, learn = { "warsong" } } },
        { text = "Peace needs someone to try first.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1, learn = { "warsong" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    suits = {
      lines = {
        { id = "su_default", text = "Something you can swing between trees without catching a branch, so nothing too long. The Sentinels favor glaives and bows, but for most travelers a sword or a mace does the job well enough." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
  },

  topics = {
    warsong = { { id = "tp_ws", text = "The Warsong cut our trees and kill our Sentinels. Every blade I sell is meant for them." } },
    background = { { id = "tp_bg", text = "I sell weapons in Astranaar. I've lost friends to the orcs, and that's all I'll say about it." } },
    _none = { { id = "tp_none", text = "I don't know, and I've more urgent things to think about." } },
  },
}

-- Aeolynn: clothier in Astranaar.
P:NPC {
  key = "aeolynn", id = TODO_NPC("Aeolynn"), name = "Aeolynn", title = "Clothier",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "astranaar" }, temper = { "gentle", "wistful" }, values = { "beauty", "peace" },
  notices = { "class" },
  impression = {
    first = "Aeolynn sells cloth armor in Astranaar and tries to keep a little beauty in a town at war. She spoke of Ashenvale before the orcs came with real longing.",
    third = "{name} met Aeolynn, Astranaar's wistful clothier.",
  },

  greetings = {
    { id = "g_default", text = "Welcome. Robes, gloves, a good cloak for the rain; whatever you need, I hope I have it." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. I'm glad; it's nice to see a familiar face these days." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "MAGE", "WARLOCK" } },
      text = "You'll want robes, then, and something with a good hem for walking these wet paths. Let me see what I have in your size." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Often enough, because my people turned from the arcane after the Sundering, and some of them have never stopped flinching at it. I think it's sad that something so beautiful should frighten us, but I wasn't alive when the Well drowned, so perhaps I don't understand." } },
      choices = {
        { text = "Their caution is earned. I'll give them no reason to flinch.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fear shouldn't rule what's beautiful. Let them stare.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A little, because the satyrs who creep out of the dark woods at night were once my people, and they started with a bargain much like yours. But you came in and asked about cloth like anyone else, and I'd like to believe that counts for something." } },
      choices = {
        { text = "It counts. I'll never become what they became.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Their bargain failed. Mine won't, and I'll go further.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Aeolynn, and I sell cloth armor here in Astranaar. It isn't much protection against an orc's axe, I know, but it keeps the rain off, and the priestesses tell me it suits them better than mail." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "You'll want a robe with deep sleeves for your reagents, I expect, and I've a few with good hems for these wet paths. I sewed for the moon festivals once, so I know how to make a mage look lovely, though the Sentinels may still stare." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I've a deep violet cloth that hides scorch marks well, if you're looking for something dark to wear. Forgive me, but your imp keeps looking at my silks, and I'd rather it didn't." },
      },
      again = {
        { id = "h_again", text = "Something else?" },
        { id = "h_again2", text = "Ask what you like; it's quiet today." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "What was Ashenvale like before the war?", next = "before" },
        { text = "Where does your cloth come from?", next = "cloth" },
        { text = "Do the Sentinels stare at mages often?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does my craft frighten you, Aeolynn?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Goodbye, Aeolynn.", next = "END" },
      },
    },
    before = {
      lines = {
        { id = "be_default", text = "Quiet, and green all the way to the mountains, with the furbolgs as our neighbors and the moonwells clear. Now the furbolgs have gone mad, the satyrs come out at night and the orcs are cutting the trees, and I can't remember the last time I walked by the lake for pleasure." },
      },
      choices = {
        { text = "Do you think it can be like that again?", next = "before2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before2 = {
      lines = {
        { id = "be2_default", text = "I hope so, but hope isn't a plan, and the Sentinels are stretched thin. If enough travelers like you stay to help, maybe, but most of them pass through on their way somewhere else." },
      },
      choices = {
        { text = "I'll do my part to set it right.", next = "BACK", fx = { align = { order = 1 }, affinity = 2, trait = { kind = 1 } } },
        { text = "The forest has to save itself. I'm passing through.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK", fx = { learn = { "satyrs" } } },
      },
    },
    cloth = {
      lines = {
        { id = "cl_default", text = "Some I weave myself, and some comes from Darnassus when the hippogryphs can carry it. The tailors there make finer cloth, but mine is sewn for Ashenvale's damp, so it lasts longer here." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    satyrs = { { id = "tp_sat", text = "They come out of the dark woods at night. I lock my door and don't look out the window." } },
    background = { { id = "tp_bg", text = "I sell cloth armor in Astranaar. I used to sew for festivals; now I sew for soldiers." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. Perhaps Innkeeper Kimlya could tell you." } },
  },
}

-- Maliynn: food and drink vendor in Astranaar.
P:NPC {
  key = "maliynn", id = TODO_NPC("Maliynn"), name = "Maliynn", title = "Food & Drink Vendor",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "astranaar" }, temper = { "cheerful", "motherly" }, values = { "care", "hospitality" },
  notices = { "hunger" },
  impression = {
    first = "Maliynn sells food and drink in Astranaar and seems to think everyone who comes in from the forest is too thin. She fusses, but her bread is very good.",
    third = "{name} met Maliynn, who feeds Astranaar's Sentinels and travelers alike.",
  },

  greetings = {
    { id = "g_default", text = "You look half-starved! Sit down, sit down, and let me find you something warm." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still too thin. What can I get you?" },
  },

  notice = {
    { id = "n_young", cat = "hunger", when = { maxLevel = 22 },
      text = "You're young to be this far from home, aren't you? Make sure you eat properly; the Sentinels never do, and look at them." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every one of them, and they come back from the eastern woods so hungry I could weep, though they never say where they've been. I pack them honey cakes for the road, because a scout lying still in the ferns for half a day needs more than water." } },
      choices = {
        { text = "A scout's work is hard. They deserve every cake.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Scouts should learn to go hungry. It keeps them sharp.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It fills the stomach and does nothing for the heart, dear, because nobody kneaded it and nobody waited for it to rise. The Sentinels eat my bread on the bridge and think of home for a moment, and I don't believe a spell can do that." } },
      choices = {
        { text = "You're right. Bread made by hand is worth more.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Bread is bread, and mine never goes stale.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Maliynn, and I keep Astranaar fed: bread, fruit, cheese and water for the road. The Sentinels come in from the forest hungry, and so does everyone else, so I'm never short of customers." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You crept in so quietly I nearly dropped the bread, dear, and you're far too thin for someone who sneaks about for a living. Sit down and eat something before you vanish again." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "You've been living on that conjured bread, I can tell by your cheeks, dear. Sit down and have something that came out of a proper oven." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? There's more in the oven." },
        { id = "h_again2", text = "Go on, I'm listening, and eat while you talk." },
      },
      choices = {
        { text = "Let me see your food.", next = "BUSINESS" },
        { text = "Do the Sentinels eat here often?", next = "sentinels" },
        { text = "How do you keep the shop stocked?", next = "stock" },
        { text = "Do the scouts who watch the Warsong camps eat here?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What's wrong with conjured bread, Maliynn?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Goodbye, Maliynn.", next = "END" },
      },
    },
    sentinels = {
      lines = {
        { id = "se_default", text = "Every day, and they never sit down long enough to finish a meal. I've taken to wrapping bread for them so they can eat it on the bridge, because I'd rather they ate on duty than not at all." },
      },
      choices = {
        { text = "That's kind of you.", next = "sentinels2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinels2 = {
      lines = {
        { id = "se2_default", text = "It's the least I can do, when they're the ones standing between us and the Warsong. I can't hold a glaive, but I can make sure the ones who do aren't fighting on an empty stomach." },
      },
      choices = {
        { text = "Every part matters in a war.", next = "BACK", fx = { align = { light = 1 }, affinity = 1, learn = { "sentinels" } } },
        { text = "Wars are won by soldiers, not cooks.", next = "BACK", fx = { align = { light = -1 }, affinity = -1, learn = { "sentinels" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock = {
      lines = {
        { id = "st_default", text = "Haljan brings in flour when the carts get through, and the rest I grow or gather on the island. It's not a feast, but nobody in Astranaar has gone hungry yet, and I mean to keep it that way." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    sentinels = { { id = "tp_sent", text = "They guard the bridges day and night. I make sure they eat something while they do it." } },
    background = { { id = "tp_bg", text = "I sell food and drink in Astranaar. I've fed more Sentinels than I can count." } },
    advice = { { id = "tp_ad", text = "Eat before a fight, not after. You'll fight better, and you might not get the chance afterwards." } },
    _none = { { id = "tp_none", text = "I wouldn't know, dear. Have some bread and ask Haljan." } },
  },
}
