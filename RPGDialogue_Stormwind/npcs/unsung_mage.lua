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
    hello = {
      lines = {
        { id = "h_default", text = "I am Lilyssia Nightbreeze. I teach alchemy here, shut up among the humans' stone, while others fight the battles I dream of every night. Still, someone must teach, so I do." },
        { id = "h_nightelf", when = { race = "NightElf" }, text = "A child of the forest! Then you understand what it is to be kept from the fight while our sisters stand watch in Ashenvale. Sit, and let me teach you something useful at least." },
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
    hello = {
      lines = {
        { id = "h_default", text = "I am Eldraeith. Our finest craftsmen on Teldrassil made these tools, and I carried them across the sea myself, as a sign of the friendship between the Great Tree's people and the humans of this land." },
        { id = "h_human", when = { race = "Human" }, text = "Welcome, child of Stormwind. Your city has been kind to us, and I hope these gifts from Teldrassil repay a little of that kindness." },
      },
      again = {
        { id = "h_again", text = "What else may I tell you?" },
        { id = "h_again2", text = "The Great Tree's gifts are patient, and so am I; ask what you wish." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Why carry them all this way?", next = "why" },
        { text = "How do you find Stormwind?", next = "city" },
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
    hello = {
      lines = {
        { id = "h_default", text = "Georgio Bolero. I've been teaching tailoring in this shop for some years, and business has been very good lately, with so many new adventurers coming through and tearing their clothes." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priest! Your people wear robes more than anyone, so learn to stitch your own and you'll never again wear something the Cathedral's tailors cut for somebody shorter." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage, and in a robe that fits you badly, which is the curse of your profession. Learn to make your own, and you'll cast better simply for being comfortable." },
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
    hello = {
      lines = {
        { id = "h_default", text = "Alexandra Bolero. Georgio teaches, I supply, and between us we keep half the tailors in Stormwind from tying their seams with string." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Go on, Georgio won't miss me for a minute." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Where does your stock come from?", next = "stock" },
        { text = "What's it like working with Georgio?", next = "georgio" },
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
    hello = {
      lines = {
        { id = "h_default", text = "Lawrence Schneider. I teach the beginners here, so Master Bolero can save his patience for the experts. I always say a life is like a bolt of good cloth: every thread matters, and one weak one can ruin the whole." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've got a lesson in a moment." },
        { id = "h_again2", text = "Go on, I don't mind talking." },
      },
      choices = {
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "Schneider, like the tailors down on the canals?", next = "family" },
        { text = "Do you mean that about the threads?", next = "threads" },
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
    hello = {
      lines = {
        { id = "h_default", text = "Ardwyn Cailen. Allan sells the staves and I sell the wands, and I'll tell you honestly that since Dalaran fell, a wand made by a real enchanter is hard to find anywhere in the world." },
        { id = "h_warrior", when = { class = { "WARRIOR", "ROGUE" } }, text = "I'm sorry, friend, but a wand will do nothing in your hands except look pretty. Allan might have a staff for you, though, if you fancy one." },
      },
      again = {
        { id = "h_again", text = "What else? I could talk about wands all day." },
        { id = "h_again2", text = "Ask me anything at all about wands; fire, frost or shadow." },
      },
      choices = {
        { text = "Show me your wands.", next = "BUSINESS" },
        { text = "Who makes them, now Dalaran's gone?", next = "makers" },
        { text = "Which wand would you choose?", next = "choose" },
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
    hello = {
      lines = {
        { id = "h_default", text = "Charys Yserian. I sell reagents and arcane trinkets, the small and curious leftovers of a great deal of magic, made by the crafters and mages here in Stormwind." },
      },
      again = {
        { id = "h_again", text = "Have you another question for me, or for the curios?" },
        { id = "h_again2", text = "Ask softly, and I'll answer." },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "What's the strangest thing you've sold?", next = "strange" },
        { text = "Where do your curios come from?", next = "source" },
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
    hello = {
      lines = {
        { id = "h_default", text = "Wynne Larson, of Larson Clothiers. We sell robes to the Mage Quarter's scholars and the Cathedral's priests, and I keep an apprentice who forgets his sewing kit whenever he hopes for a day off." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage, so you'll want a robe that doesn't catch fire the first time you miscast. I've a few lined with something the Quarter's enchanters swear by." },
      },
      again = {
        { id = "h_again", text = "Is there something else? Mind the pins on the counter, Thurman never puts them away." },
        { id = "h_again2", text = "Go on. Thurman, keep sewing, I can hear you stopping." },
      },
      choices = {
        { text = "Show me your robes.", next = "BUSINESS" },
        { text = "Tell me about your apprentice.", next = "thurman" },
        { text = "Who buys the most robes?", next = "buyers" },
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
