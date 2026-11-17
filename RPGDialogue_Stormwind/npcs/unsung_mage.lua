-- Mage Quarter shopkeepers and crafters with no quests: Alchemy Needs, Duncan's Textiles,
-- Stormwind Staves, Ancient Curios and Larson Clothiers. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Lilyssia Nightbreeze: night elf alchemist who would rather be at the front.
P:NPC {
  key = "lilyssia", id = TODO_NPC("Lilyssia Nightbreeze"), name = "Lilyssia Nightbreeze", title = "Expert Alchemist",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "restless" }, values = { "duty", "craft" },
  notices = { "craft", "soldier" },
  impression = {
    first = "Lilyssia Nightbreeze teaches alchemy in a small shop in the Mage Quarter and plainly wishes she were fighting outside the walls instead. She teaches well anyway, out of duty, and says so.",
    third = "{name} met Lilyssia Nightbreeze, a night elf alchemist teaching in Stormwind's Mage Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Come in, and close the door behind you. This little house is the only battlefield they allow me." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, and with the smell of the wild still on you. Tell me where you've been." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" }, place = "before",
      text = "You carry herbs with you; I can smell the mageroyal from here. Bring them to me, and I'll show you how to make them worth ten times as much." },
    { id = "n_warrior", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } }, place = "before",
      text = "You've come from the fighting, haven't you? I envy you that, and I'm not ashamed to say it." },
  },
  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the arcane nearly destroyed my people once, long ago, and the Sentinels have long memories. I don't share their fear entirely, but I won't pretend I don't understand it." } },
      choices = {
        { text = "Their caution is wise. Magic should never be trusted lightly.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fear never built anything, Lilyssia. Mages build.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They would, and they'd be right to, for the Legion's creatures burned Ashenvale once and would do it again. I'm kept here among potions while they hold the line, so I fight the only way I can, by teaching you to heal rather than to burn." } },
      choices = {
        { text = "Then teach me to heal. I'll take the lesson.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Burning has its uses too, Lilyssia.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Lilyssia Nightbreeze. I teach alchemy here, shut up among the humans' stone, while others fight the battles I dream of every night. Still, someone must teach, so I do." },
        { id = "h_nightelf", when = { race = "NightElf" }, text = "A child of the forest! Then you understand what it is to be kept from the fight while our sisters stand watch in Ashenvale. Sit, and let me teach you something useful at least." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. My sisters would frown at me for teaching your kind, but alchemy needs a steady hand, and yours look steady enough." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You bring the fel into my workshop, and the herbs wilt on the bench. I will teach you, because I must, but my sisters in Ashenvale would not." },
      },
      again = {
        { id = "h_again", text = "Speak, and I will answer while the still drips; the forest taught me to listen and work at once." },
        { id = "h_again2", text = "Ask, while the flask is cooling." },
      },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "Why not go and fight, then?", next = "fight" },
        { text = "What should I brew first?", next = "brew" },
        { text = "Who works here with you?", next = "shop" },
        { text = "Why would your sisters frown at teaching mages?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would your sisters fight a warlock, Lilyssia?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Farewell, Lilyssia.", next = "END" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "Because I was asked to come here, to teach the humans what our people know, and one who is given a post does not leave it because she is bored. Every potion my students carry into battle is a small part of me that gets to go." } },
      choices = {
        { text = "Then your duty matters as much as theirs.", next = "fight2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight2 = {
      lines = { { id = "f2_default", text = "So I tell myself each morning, and some mornings I even believe it. Tell me honestly, would you stay, in my place?" } },
      choices = {
        { text = "Yes. A post is a post, and someone must hold it.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "No. I'd go where I was needed most.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brew = {
      lines = { { id = "b_default", text = "Minor healing potions, from peacebloom and silverleaf, until you can make them with your eyes closed. Every soldier wants them, and you'll never brew one that goes to waste." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shop = {
      lines = { { id = "s_default", text = "Tel'Athir, who is learning and asks a great many questions, and Eldraeith, who sells herbs brought from Teldrassil. Maria Lumere keeps the vials, and she is the only one of us who can bargain with a human." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I crossed the sea when our peoples made their alliance, and I have taught here ever since, though I count the days." } },
    _none = { { id = "tp_none", text = "That I cannot tell you. Ask me about herbs and flasks instead." } },
  },
}

-- Eldraeith: night elf herb seller; proud of goods carried from Teldrassil as a sign of alliance.
P:NPC {
  key = "eldraeith", id = TODO_NPC("Eldraeith"), name = "Eldraeith", title = "Herbalism Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "gracious" }, values = { "nature", "alliance" },
  notices = { "race" },
  impression = {
    first = "Eldraeith sells herbs and tools carried by hand from Teldrassil, and she presents each one as a gift between two peoples. She was gracious and rather formal, and she meant every word.",
    third = "{name} met Eldraeith, who sells Teldrassil's herbs in the Mage Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Everything here was carried from Teldrassil, and if there is anything you require, you have only to ask." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The Great Tree's gifts are still here for you." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" }, place = "before",
      text = "A dwarf, in a shop of herbs! Your people are welcome here, though I have noticed they look for the ale before the flowers." },
  },
  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "We do, though we call them other things, and they walk the shadows of Ashenvale far more quietly than any human. Our Sentinels and your SI:7 would understand each other well, I think, if they ever stopped watching each other." } },
      choices = {
        { text = "Allies should trust each other, not spy on each other.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Allies always watch each other. That's simple sense.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Perhaps, and the Sanctum's mages have offered, but a gift carried by hand means more than one sent through a door in the air. My people value the long road, because the journey is part of the gift." } },
      choices = {
        { text = "The old way has meaning. Carry your gifts by hand.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A faster road helps more people. Take the portal.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Eldraeith. Our finest craftsmen on Teldrassil made these tools, and I carried them across the sea myself, as a sign of the friendship between the Great Tree's people and the humans of this land." },
        { id = "h_human", when = { race = "Human" }, text = "Welcome, child of Stormwind. Your city has been kind to us, and I hope these gifts from Teldrassil repay a little of that kindness." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. I carried these tools across the sea, and I would be very sad to see them leave without being paid for." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. My people do not love the arcane, but I was taught to be courteous to guests, and you are a guest here, as I am." },
      },
      again = {
        { id = "h_again", text = "What else may I tell you?" },
        { id = "h_again2", text = "The Great Tree's gifts are patient, and so am I; ask what you wish." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Why carry them all this way?", next = "why" },
        { text = "How do you find Stormwind?", next = "city" },
        { text = "Do night elves have rogues of their own?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Couldn't a portal to Darnassus have spared you the voyage?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Farewell, Eldraeith.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because an alliance made only with words is soon forgotten, and one made with gifts is remembered. Every human who buys a herbalist's pick from me holds something my people made." } },
      choices = {
        { text = "Does the alliance feel real to you?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "w2_default", text = "More each season, though some of the humans still stare, and some of my own people still wonder why we came at all. I believe we must learn each other, or neither of us will survive what comes next." } },
      choices = {
        { text = "The alliance makes us both stronger.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Each people should look after its own first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    city = {
      lines = { { id = "c_default", text = "Loud, and full of stone, and very young. But the Park is lovely in the evening, and the humans there walk slowly, which I did not expect of them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I crossed from Kalimdor with the first of our people to come to Stormwind, and I have kept this corner of the shop since." } },
    _none = { { id = "tp_none", text = "I do not know, and I would not wish to guess." } },
  },
}

-- Georgio Bolero: tailoring teacher at Duncan's Textiles; vain about cut, pleased with trade.
P:NPC {
  key = "georgio_bolero", id = TODO_NPC("Georgio Bolero"), name = "Georgio Bolero", title = "Artisan Tailor",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "vain" }, values = { "beauty", "craft" },
  notices = { "kit", "craft" },
  impression = {
    first = "Georgio Bolero teaches tailoring at Duncan's Textiles and looked at my clothes before he looked at my face. He was vain about his cut and generous with his lessons, and business, he said, has never been better.",
    third = "{name} met Georgio Bolero, who teaches tailoring at Duncan's Textiles in the Mage Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Come in, come in, and let me see that hem. Oh, dear, we have work to do." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! And have you been practising your stitches, or only wearing other people's?" },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" }, place = "before",
      text = "A tailor, I see it in the way you look at my sleeves. Good, good, then we can speak properly about seams." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } }, place = "before",
      text = "Light preserve us, what has happened to your clothes? Never mind, don't tell me, it will only upset me." },
  },
  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a tailor remembers every measurement he takes, and a careful man in your trade shouldn't want to be remembered. The SI:7 people sew their own, you know, and I've always taken that as a compliment to the craft." } },
      choices = {
        { text = "I've nothing to hide, Georgio. Measure away.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then I'll learn to sew and stay forgotten.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "More than you'd think, because felcloth and runecloth both want a careful hand, and your people have the patience for fiddly work. I teach the stitch and not the purpose, and I've found that keeps everybody happy." } },
      choices = {
        { text = "Then I'll sew for protection, not for anything darker.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The purpose is mine, Georgio. The stitch is enough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Georgio Bolero. I've been teaching tailoring in this shop for some years, and business has been very good lately, with so many new adventurers coming through and tearing their clothes." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priest! Your people wear robes more than anyone, so learn to stitch your own and you'll never again wear something the Cathedral's tailors cut for somebody shorter." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage, and in a robe that fits you badly, which is the curse of your profession. Learn to make your own, and you'll cast better simply for being comfortable." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! You'll want dark cloth that doesn't shine in the lamplight, and I can teach you to sew it yourself, so nobody knows your size." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, and your cuffs are singed exactly where the shadow bolts leave your hands. I can teach you to line them, which will save you a fortune in sleeves." },
      },
      again = {
        { id = "h_again", text = "What else? I've a bolt of wool waiting." },
        { id = "h_again2", text = "Speak up, darling, my scissors are louder than they look." },
      },
      choices = {
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "Why so many new adventurers?", next = "new" },
        { text = "Who else works here?", next = "shop" },
        { text = "What makes good tailoring?", next = "good" },
        { text = "Why would it matter who knows my size?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do many warlocks learn tailoring from you?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Good day, Georgio.", next = "END" },
      },
    },
    new = {
      lines = { { id = "n_default", text = "Because the kingdom is short of soldiers and long on trouble, so every farm lad with a sword calls himself an adventurer now. They tear their clothes in Elwynn and come to us, and I'm not complaining." } },
      choices = {
        { text = "Profiting from the kingdom's troubles, then?", next = "new2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    new2 = {
      lines = { { id = "n2_default", text = "Somebody has to mend them, darling, and I charge a fair price for it. Would you rather they went out to fight the Defias in rags?" } },
      choices = {
        { text = "No. A fair trade for honest work is fine.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "I'd rather you mended the refugees' clothes for free.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop = {
      lines = { { id = "s_default", text = "Duncan Cullen owns it and sells the finished armour, Alexandra keeps the cloth and thread, and young Lawrence Schneider teaches the beginners, which spares me a great deal of suffering." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    good = {
      lines = { { id = "gd_default", text = "A seam you can't see and a fit you can't feel. If anyone notices your clothes before they notice you, the tailor has failed, and I don't fail." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've cut cloth in Stormwind since the city was rebuilt, and I'll cut it until my eyes give out." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, darling, and I don't intend to find out." } },
  },
}

-- Alexandra Bolero: tailoring supplies; practical, knows where every bolt came from.
P:NPC {
  key = "alexandra_bolero", id = TODO_NPC("Alexandra Bolero"), name = "Alexandra Bolero", title = "Tailoring Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "practical" }, values = { "practical", "craft" },
  notices = { "craft" },
  impression = {
    first = "Alexandra Bolero sells thread and dye at Duncan's Textiles and keeps her head while Georgio fusses over hems. She told me where the city's good thread comes from now that Dalaran is gone.",
    third = "{name} met Alexandra Bolero, who sells tailoring supplies at Duncan's Textiles.",
  },
  greetings = {
    { id = "g_default", text = "Thread, dye and patterns, all on the shelf behind me. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Back for more thread? I thought you might be." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" }, place = "before",
      text = "Running low on coarse thread already? Every new tailor does, so I always keep a box of it nearest the counter." },
  },
  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because mages wear it and mages pay more for things with their name on, and someone in Dalaran worked that out long before I did. I've never told a buyer it was enchanted, mind, and I never will." } },
      choices = {
        { text = "Good. Honest trade is the only kind worth having.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A good name sells cloth. There's no harm in that.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Every month, in black and red, and it all goes down the stairs under that tavern in a covered basket. I've never asked what they make with it, and nobody's ever offered to tell me." } },
      choices = {
        { text = "You'd do well to ask what it's used for.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Not asking is wise. Their business is their own.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Alexandra Bolero. Georgio teaches, I supply, and between us we keep half the tailors in Stormwind from tying their seams with string." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you'll want mageweave, of course, because they all do once they've heard the name. It isn't magic, you know; it's just very good thread." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. I'll sell you thread and dye like anyone else, though I'd sooner you didn't stitch anything into it that whispers." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Go on, Georgio won't miss me for a minute." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Where does your stock come from?", next = "stock" },
        { text = "What's it like working with Georgio?", next = "georgio" },
        { text = "If mageweave isn't magic, why call it that?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Have you sold thread to the Lamb's cellar?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Thank you, Alexandra.", next = "END" },
      },
    },
    stock = {
      lines = { { id = "s_default", text = "Since Dalaran fell and Quel'Thalas burned, the fine goods have been terribly hard to come by. Lucan Cordell and some of the other tradesmen in the city have done well filling our orders, but it isn't what it was." } },
      choices = {
        { text = "Who is Lucan Cordell?", next = "lucan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lucan = {
      lines = { { id = "l_default", text = "The finest enchanter in Stormwind, who keeps a shop by the canals with Jessara Cordell. Half the enchanted thread and trinkets in the Mage Quarter pass through his hands before they reach ours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    georgio = {
      lines = { { id = "ge_default", text = "Loud, and he thinks every customer is a disaster waiting for his scissors. But he's never once cut a pattern wrong, and I'll forgive a great deal for that." } },
      choices = {
        { text = "Skill excuses a lot.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Skill doesn't excuse rudeness.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've kept this counter at Duncan's for years, beside Georgio. Our family has always worked in cloth." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Thread I know; that, I don't." } },
  },
}

-- Lawrence Schneider: journeyman tailor teaching beginners; earnest, a bit grand about his craft.
P:NPC {
  key = "lawrence_schneider", id = TODO_NPC("Lawrence Schneider"), name = "Lawrence Schneider", title = "Journeyman Tailor",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "earnest" }, values = { "craft", "family" },
  notices = { "greenness" },
  impression = {
    first = "Lawrence Schneider teaches beginning tailors at Duncan's Textiles and talks about weaving as though it explained the whole world. He was young, earnest and a little grand, and I liked him for it.",
    third = "{name} met Lawrence Schneider, a young tailor who teaches beginners at Duncan's Textiles.",
  },
  greetings = {
    { id = "g_default", text = "Welcome! If you've come to learn your first stitches, then I'm the one to see." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back! How is your stitching coming along? Let me see your hands." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 10 }, place = "before",
      text = "You're new to all this, I can tell, and that's perfect, because I like teaching people before they've learned any bad habits." },
  },
  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It's meant as one, though I'd rather you used those hands on a needle than on someone's purse. Every seam can be unpicked and sewn again, and every life can too, if you start soon enough." } },
      choices = {
        { text = "My hands are honest, Lawrence. I'd swear to it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Purses and needles both pay, in their way.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I do, because both of them want patience and a steady hand, and I've never met a mage with too much of either. Master Bolero thinks I'm being fanciful, but his best students have always been mages." } },
      choices = {
        { text = "Discipline in one craft carries to another. I'll learn.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Spells come from talent, Lawrence, not from stitching.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Lawrence Schneider. I teach the beginners here, so Master Bolero can save his patience for the experts. I always say a life is like a bolt of good cloth: every thread matters, and one weak one can ruin the whole." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! I always say a good thief is like a good seamstress, because both of them can slip in and out without anyone seeing the join." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, here to learn tailoring? I always say a spell is like a stitch, because a careless one comes undone just when you need it most." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've got a lesson in a moment." },
        { id = "h_again2", text = "Go on, I don't mind talking." },
      },
      choices = {
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "Schneider, like the tailors down on the canals?", next = "family" },
        { text = "Do you mean that about the threads?", next = "threads" },
        { text = "Is that meant as a compliment, Lawrence?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you think sewing could improve my spellwork?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Good day, Lawrence.", next = "END" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "The same name, yes; there have been Schneiders sewing in this city for as long as anyone remembers. I wanted to learn from Master Bolero instead of at home, which caused a bit of a fuss at the time." } },
      choices = {
        { text = "Why leave the family trade?", next = "family2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family2 = {
      lines = { { id = "f2_default", text = "I didn't leave it, exactly; I only wanted to learn it somewhere I wasn't someone's son or cousin. Was that wrong of me, do you think?" } },
      choices = {
        { text = "No. A man should make his own way.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Family comes first. You owed them your loyalty.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    threads = {
      lines = { { id = "t_default", text = "Every word of it! Master Bolero says I'll grow out of saying it, but I've seen a whole cloak unravel from one bad stitch, and I think kingdoms work the same way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Born to a family of tailors and apprenticed to Master Bolero. I mean to be an artisan myself, one day." } },
    _none = { { id = "tp_none", text = "I don't know about that, I'm afraid, but ask me about stitches!" } },
  },
}

-- Ardwyn Cailen: wand merchant at Stormwind Staves; enthusiastic about her stock.
P:NPC {
  key = "ardwyn_cailen", id = TODO_NPC("Ardwyn Cailen"), name = "Ardwyn Cailen", title = "Wand Merchant",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "enthusiastic" }, values = { "arcane", "trade" },
  notices = { "class" },
  impression = {
    first = "Ardwyn Cailen sells wands at Stormwind Staves and talks about each one as if it had a temper of its own. She mourned Dalaran mostly for its workshops, and she was honest about that.",
    third = "{name} met Ardwyn Cailen, who sells wands at Stormwind Staves in the Mage Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Wands! Fire, frost and shadow, every one made here in Stormwind. Take a look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Has your wand been behaving itself?" },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" }, place = "before",
      text = "A priest, wonderful! Your people are my best customers, because a wand lets you fight without spending the mana you'll need to heal everyone afterwards." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" }, place = "before",
      text = "A warlock. I've a shadow wand you'll like, though I'd thank you not to tell me what you're planning to point it at." },
  },
  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A well-made wand is silent until you call on it, while a cheap one hums all the time because the enchantment's leaking out through the grain. Half the wands sold on the canal stalls would empty themselves in a month, and the sellers know it." } },
      choices = {
        { text = "Someone should warn buyers about those stalls.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Buyers should know better. That's the market.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because shadow pulls inward while most enchantments push outward, and the wood can't bear both at once. Dalaran's enchanters could have solved it, but they never cared to, since they never cared much for your sort." } },
      choices = {
        { text = "Maybe some magic shouldn't be bottled in a wand.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then Dalaran missed a chance. Shadow deserves good tools.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Ardwyn Cailen. Allan sells the staves and I sell the wands, and I'll tell you honestly that since Dalaran fell, a wand made by a real enchanter is hard to find anywhere in the world." },
        { id = "h_warrior", when = { class = { "WARRIOR", "ROGUE" } }, text = "I'm sorry, friend, but a wand will do nothing in your hands except look pretty. Allan might have a staff for you, though, if you fancy one." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Then you'll appreciate a wand made properly, with a true core, and you'll know a cheap one by the way it hums." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, so you'll want a wand that can bear a shadow without cracking, and I'll admit I've only a few that can." },
      },
      again = {
        { id = "h_again", text = "What else? I could talk about wands all day." },
        { id = "h_again2", text = "Ask me anything at all about wands; fire, frost or shadow." },
      },
      choices = {
        { text = "Show me your wands.", next = "BUSINESS" },
        { text = "Who makes them, now Dalaran's gone?", next = "makers" },
        { text = "Which wand would you choose?", next = "choose" },
        { text = "How can you tell a cheap wand by its hum?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why do shadow wands crack, Ardwyn?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Good day, Ardwyn.", next = "END" },
      },
    },
    makers = {
      lines = { { id = "m_default", text = "Lucan Cordell and the city's enchanters, mostly, and they've done a fine job of filling our orders. Still, I miss the Dalaran wands; you could feel the Kirin Tor's work in them." } },
      choices = {
        { text = "Do you miss Dalaran itself?", next = "makers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    makers2 = {
      lines = { { id = "m2_default", text = "I never went there, if I'm honest, and I miss its workshops more than its towers. That sounds cold, I know, but a merchant mourns in her own way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    choose = {
      lines = { { id = "c_default", text = "A good fire wand, because it never asks questions and everything burns. Frost is more elegant, but most of the things you'll fight out there aren't impressed by elegance." } },
      choices = {
        { text = "Fire, then, because simple is sure.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I'd take elegance anyway.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've sold wands at Stormwind Staves beside Allan Hafgan for years. I can't cast a spell to save my life, but I can tell you which wand will." } },
    _none = { { id = "tp_none", text = "No idea! But if it can be pointed and fired, ask me." } },
  },
}

-- Charys Yserian: arcane trinkets at Ancient Curios; quiet, mysterious by taste, not by plot.
P:NPC {
  key = "charys_yserian", id = TODO_NPC("Charys Yserian"), name = "Charys Yserian", title = "Arcane Trinkets Vendor",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "quiet" }, values = { "arcane", "curiosity" },
  notices = { "arcane" },
  impression = {
    first = "Charys Yserian keeps a cramped curio shop in the Mage Quarter and speaks softly, as though the trinkets might be listening. She knew the story of every odd thing on her shelves, or said she did.",
    third = "{name} met Charys Yserian, who keeps a shop of arcane curios in the Mage Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Come in quietly, please. Some of these old things don't care for noise." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. Something on my shelves must have called to you." },
  },
  notice = {
    { id = "n_mage", cat = "arcane", when = { class = { "MAGE", "WARLOCK" } }, place = "before",
      text = "You feel it too, don't you, that faint hum in the room? Most of my customers never notice it at all." },
  },
  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They send their apprentices, who swear the purchases are for study, and I've sold the same lucky charm three times to the same master's three apprentices. Even the wise like a little luck, it seems, now that Dalaran's gates are closed to them." } },
      choices = {
        { text = "Luck is a crutch. I'd rather trust my training.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A little luck never hurt anyone, master or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Candles that burn without smoke and chalk that doesn't smudge, which are dull things that matter a great deal to a summoning circle. Anything stronger you'll have to find in the cellar under the Lamb, and I'd rather not know the price." } },
      choices = {
        { text = "Dull and safe suits me. Keep it that way.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll find something stronger. Dull doesn't get results.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Charys Yserian. I sell reagents and arcane trinkets, the small and curious leftovers of a great deal of magic, made by the crafters and mages here in Stormwind." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, so you'll want reagents and the kind of trinkets your masters swear they never use. I keep both, and I keep quiet about who buys which." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. I keep a few things at the back for your people, though nothing that would trouble the Watch, and I'd rather keep it that way." },
      },
      again = {
        { id = "h_again", text = "Have you another question for me, or for the curios?" },
        { id = "h_again2", text = "Ask softly, and I'll answer." },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "What's the strangest thing you've sold?", next = "strange" },
        { text = "Where do your curios come from?", next = "source" },
        { text = "Do the Sanctum's masters really buy trinkets?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What sort of things do you keep at the back?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Good day, Charys.", next = "END" },
      },
    },
    strange = {
      lines = { { id = "s_default", text = "A mirror that showed the room as it was a day earlier, or so the mage who sold it to me swore. I sold it to a noble's steward, and he brought it back a week later without a word." } },
      choices = {
        { text = "Did you keep it?", next = "strange2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange2 = {
      lines = { { id = "s2_default", text = "I wrapped it in black cloth and carried it to Maginor Dumas at the tower, who asked no questions and paid nothing. Some things a sensible shopkeeper doesn't keep." } },
      choices = {
        { text = "Wise. Dangerous magic belongs with the mages.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd have kept it. Imagine what it could show.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = { { id = "src_default", text = "Refugees from Lordaeron sell what they carried out, and the city's mages sell what they've grown tired of. Since Dalaran fell, there's little else, and I try to pay the refugees fairly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've kept this little shop for years, among things older and stranger than me. I find it restful, most days." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. Perhaps one of my trinkets does, but they won't say." } },
  },
}

-- Wynne Larson: robe merchant of Larson Clothiers; Thurman Schneider is apprenticed here.
P:NPC {
  key = "wynne_larson", id = TODO_NPC("Wynne Larson"), name = "Wynne Larson", title = "Robe Merchant",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "patient" }, values = { "craft", "practical" },
  notices = { "class", "kit" },
  impression = {
    first = "Wynne Larson sells robes in the Mage Quarter and keeps young Thurman Schneider as an apprentice, which she described as a test of faith. She had dry patience and a good eye for a cut.",
    third = "{name} met Wynne Larson, who sells robes at Larson Clothiers in the Mage Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Robes for scholars, priests and mages, cut to fit and lined to last. What can I show you?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Has your robe been keeping out the weather?" },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" }, place = "before",
      text = "A priest, good. The Cathedral's robes are fine for prayer, but out in the hills you'll want something lined, and I sell the best lined robes in the city." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } }, place = "before",
      text = "That robe has been through a fire or a fight, and possibly both. You'll want a new one, or at least a mend." },
  },
  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I could, and I'd rather not, because the last fellow who borrowed a priest's robe got as far as the Cathedral steps before a novice asked him to lead the evening prayer. The Watch still laughs about it." } },
      choices = {
        { text = "Wearing a priest's robe falsely is wrong, Wynne.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A good disguise is worth a little blasphemy.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "To anyone with coin, and their coin spends the same as a bishop's. I'd only ask that you don't try them on in the shop, because the last one made my apprentice faint with a single word." } },
      choices = {
        { text = "I'll keep my words to myself, Wynne. Your apprentice is safe.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your apprentice needs a stronger stomach, frankly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Wynne Larson, of Larson Clothiers. We sell robes to the Mage Quarter's scholars and the Cathedral's priests, and I keep an apprentice who forgets his sewing kit whenever he hopes for a day off." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage, so you'll want a robe that doesn't catch fire the first time you miscast. I've a few lined with something the Quarter's enchanters swear by." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in a robe shop, which is either a disguise or a mistake. If it's a disguise, I can help, but you'll have to tell me what you're pretending to be." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, and you'll want something dark and loose, so you can move your hands. My apprentice keeps those at the back, assuming he's remembered where he put them." },
      },
      again = {
        { id = "h_again", text = "Is there something else? Mind the pins on the counter, Thurman never puts them away." },
        { id = "h_again2", text = "Go on. Thurman, keep sewing, I can hear you stopping." },
      },
      choices = {
        { text = "Show me your robes.", next = "BUSINESS" },
        { text = "Tell me about your apprentice.", next = "thurman" },
        { text = "Who buys the most robes?", next = "buyers" },
        { text = "Could you dress me as a priest, Wynne?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you sell robes to the Lamb's people too?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Good day, Wynne.", next = "END" },
      },
    },
    thurman = {
      lines = {
        { id = "t_default", text = "Thurman Schneider, Rema's boy from the canal shop. He has clever hands and no patience whatsoever, and he's sure that one day he'll forget his kit so well that I'll send him home." },
        { id = "t_done", when = { questDone = TODO_QUEST("Package for Thurman") }, text = "Thurman? You're the one who brought his kit back from his mother, aren't you? He sulked all afternoon, and then he did the best work of his week." },
      },
      choices = {
        { text = "Will he make a good tailor?", next = "thurman2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thurman2 = {
      lines = { { id = "t2_default", text = "If he stops scheming long enough, yes. Should I be harder on him, do you think, or let him find his own way to it?" } },
      choices = {
        { text = "Be firm with him, because he needs the discipline.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Be gentle. He'll come to it on his own.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "b_default", text = "Priests, more than you'd think, because the Cathedral sends its novices out into the world in robes that weren't made for mud. After that it's mages, who buy two of everything and ruin one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "The Larsons have sold robes in the Mage Quarter since it was rebuilt, and I've kept the shop since my mother passed it to me." } },
    _none = { { id = "tp_none", text = "I couldn't say. Ask me about cloth and cut, and I can." } },
  },
}
