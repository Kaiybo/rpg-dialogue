-- Stormwind's skipped trainers and traders. Voice: bibles/city_trades.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC = P.TODO_NPC

-- Tannysa: night elf herbalism trainer in the Park.
P:NPC {
  key = "tannysa", id = TODO_NPC("Tannysa"), name = "Tannysa", title = "Herbalism Trainer",
  bible = "bibles/city_trades.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "patient" }, values = { "nature", "craft" },
  impression = {
    first = "Tannysa teaches herbalism among the Park's trees, a night elf who finds human gardens tidy, lovely and a little sad.",
    third = "{name} met Tannysa, who teaches herbalism in Stormwind's Park.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Have you come to learn which leaves heal and which ones kill?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Have your hands learned the difference between peacebloom and silverleaf yet?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tannysa. I teach herbalism to any who will listen, though in this city most would rather buy their herbs than gather them." },
        { id = "h_cond", when = { race = "NightElf" }, text = "A sister of the forest, so far from home! You will find the herbs here tamer than ours, but they still answer to a gentle hand." },
      },
      again = {
        { id = "h_again", text = "Ask away while I sort these cuttings; the earthroot won't mind waiting." },
        { id = "h_again2", text = "Ask. The trees are patient, and so am I." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "Why teach here, and not in Darnassus?", next = "a" },
        { text = "What grows best in Elwynn?", next = "b" },
        { text = "Farewell, Tannysa.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Because the humans are new to our alliance, and they know little of what grows at their own feet. If I can teach one of them to see Elwynn's forest, that is worth a long sea voyage." } },
      choices = {
        { text = "Do they listen?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "Some do. Others pull every flower by the root and wonder why none grow there next spring, and those I send back to their books." } },
      choices = {
        { text = "Then teach them patiently. They'll learn in time.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "If they won't learn, let them go without.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Peacebloom and silverleaf, along every road, and earthroot where the ground turns to stone. Go gently and leave a few behind." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I crossed the sea when our peoples first made their pact, and I have not regretted it." } },
    _none = { { id = "tp_none", text = "That I do not know, and the trees have not told me." } },
  },
}

-- Shaina Fuller: first aid trainer near the Cathedral.
P:NPC {
  key = "shaina", id = TODO_NPC("Shaina Fuller"), name = "Shaina Fuller", title = "First Aid Trainer",
  bible = "bibles/city_trades.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "brisk" }, values = { "mercy", "practical" },
  impression = {
    first = "Shaina Fuller teaches bandaging near the Cathedral, quickly and well, and she says she wraps more refugees' hands than soldiers' these days.",
    third = "{name} met Shaina Fuller, who teaches first aid in Stormwind.",
  },
  greetings = {
    { id = "g_default", text = "Hold still and watch my hands. Bandaging is easy until you're bleeding." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more lessons? Good, because a bandage you can tie is worth a priest you can't find." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Shaina Fuller. I teach first aid to anyone with two hands and a little patience, because the priests can't be everywhere at once." },
        { id = "h_cond", when = { class = "WARRIOR" }, text = "A warrior! You'll bleed more than most, so you'd best learn to tie a bandage one-handed. I'll show you." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've linen to roll." },
        { id = "h_again2", text = "Go on, ask. My hands keep working while I talk." },
      },
      choices = {
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "Who do you bandage most?", next = "a" },
        { text = "What's the first thing to learn?", next = "b" },
        { text = "Thank you, Shaina.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Refugees from Westfall and Redridge, mostly, who walked a long road on bad feet. The soldiers have the Cathedral, but the folk sleeping by the canals have me." } },
      choices = {
        { text = "Shouldn't the city do more for them?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "It should, and the Cathedral tries, but the crown's coffers are spoken for. So I roll linen and I don't wait to be asked." } },
      choices = {
        { text = "The crown must take care of its people first.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Help yourself and your neighbours. Don't wait on lords.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Pressure, before anything. Press hard on the wound and keep pressing, and you'll have time for everything else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned from the Cathedral's sisters during the Second War, and I've had plenty of practice since." } },
    _none = { { id = "tp_none", text = "I couldn't tell you that, but I can tell you how to stop bleeding." } },
  },
}

-- Frederick Stover: bowyer in the Trade District.
P:NPC {
  key = "stover", id = TODO_NPC("Frederick Stover"), name = "Frederick Stover", title = "Bow & Arrow Merchant",
  bible = "bibles/city_trades.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "cheerful" }, values = { "craft", "practical" },
  impression = {
    first = "Frederick Stover sells bows and arrows in the Trade District and talks about his yew the way some men talk about wine.",
    third = "{name} met Frederick Stover, a cheerful bowyer of the Trade District.",
  },
  greetings = {
    { id = "g_default", text = "Bows and arrows, friend, the finest yew this side of the Greymane Wall!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did that bow serve you well? Of course it did." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Frederick Stover, at your service. I sell bows to hunters, arrows to everyone, and advice for free, though most of it's about yew." },
        { id = "h_cond", when = { class = "HUNTER" }, text = "A hunter! Now here's someone who'll appreciate a well-seasoned stave. Come, feel the draw on this one." },
      },
      again = {
        { id = "h_again", text = "Ask what you like; I've a moment between passengers, and the ledgers can wait." },
        { id = "h_again2", text = "Go on, friend, I love a good chat." },
      },
      choices = {
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "Where does your yew come from?", next = "a" },
        { text = "Do you sell much to the army?", next = "b" },
        { text = "Good day, Frederick.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Elwynn, mostly, from the woods past the lumber mill. Though since the Defias took to those woods, the cutters charge me twice and bring half as much." } },
      choices = {
        { text = "Would you buy from the Defias?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "They've offered, through a fellow I won't name, and the wood was good. I said no, but I'll admit I thought about it longer than I should have." } },
      choices = {
        { text = "You did right. Don't deal with thieves.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Good wood is good wood. I'd have bought it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Less than you'd think, since the army buys in bulk from the Ironforge suppliers. I sell to hunters, guards and the odd noble who fancies himself an archer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My father was a bowyer and his father before him, all of us right here in the Trade District." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend, unless it's made of yew." } },
  },
}

-- Felicia Gump: the city's florist; sells cooking herbs too, per Chef Grual in Darkshire.
P:NPC {
  key = "felicia_gump", id = TODO_NPC("Felicia Gump"), name = "Felicia Gump", title = "Florist",
  bible = "bibles/city_trades.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "chatty" }, values = { "beauty", "community" },
  impression = {
    first = "Felicia Gump sells flowers and kitchen herbs in Stormwind, and she can tell you who's courting, who's marrying and who's being buried by what they buy from her.",
    third = "{name} met Felicia Gump, Stormwind's chatty florist.",
  },
  greetings = {
    { id = "g_default", text = "Flowers, herbs and seasonings, dear! Something for a sweetheart, or something for the pot?" },
    { id = "g_back", when = { metBefore = true }, text = "You again! Did your sweetheart like the roses? Or was it the pot, after all?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Felicia Gump, florist. I sell flowers for weddings and herbs for the kitchen, and lately, I'm sorry to say, a great many lilies for funerals." },
        { id = "h_cond", when = { profession = "Cooking" }, text = "A cook! Then you'll want my herbs. Even Chef Grual in Darkshire sends for them, and that man's terribly hard to please." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear?" },
        { id = "h_again2", text = "Go on, I've all day and a lot of daisies." },
      },
      choices = {
        { text = "Show me your flowers.", next = "BUSINESS" },
        { text = "Why so many funerals?", next = "a" },
        { text = "What's your best seller?", next = "b" },
        { text = "Good day, Felicia.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "The soldiers who don't come back from Redridge and Duskwood, and the masons' families, too, who've had a hard year. Lilies are the only flower I can't keep in stock." } },
      choices = {
        { text = "Do you know the masons' families?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "Some of them. They used to buy daisies, cheap and cheerful, until the city stopped paying the men. Now they buy nothing, and I've started leaving a bunch at their doors." } },
      choices = {
        { text = "That's a kindness. The city could learn from you.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Giving away stock won't keep your shop open.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Roses, always, because Stormwind is full of young men making promises. I sell them by the dozen on festival days." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My shop's been in the family since before the city was burned, and we rebuilt it with the rest." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know, dear, unless it blooms." } },
  },
}
