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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I wish I were a Sentinel, guarding the shores of Darkshore against what crawls out of the sea. Instead I brew potions here, so that others may go, and I tell myself that is enough." } },
      choices = {
        { text = "Your potions save lives. That's a battle too.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If you want to fight, go and fight.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some do, from Darnassus and Auberdine, and the humans stare at their night sabers as if they've never seen a cat. They come to buy potions, mostly, and to tell me which herbs have grown thick in Ashenvale." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would like the forests of my home, I think. Take it there one day, if you can, so it knows what a real tree looks like." },
      },
      choices = {
        { text = "The wild is sacred and should be kept so.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The wild is there to be used, and I'll use it.", next = "BACK", fx = { align = { light = -1 } } },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You will fight the battles I dream of every night, while I stay here among the humans' stone. I envy you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The hunters of my people walk the forests beside the night sabers, and I think of them often, here among the stone." },
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
        { text = "Do you wish you were a warrior, Lilyssia?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the kaldorei hunters ever come to Stormwind, Lilyssia?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They are made for leather and cloth, not steel, but they will mend a strap or stitch a shield grip as well as any blacksmith's. The Sentinels carry such tools on patrol, because a forest has no forges." } },
      choices = {
        { text = "A warrior should be able to mend their own gear.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll let the smiths mend my gear. That's their job.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Skinning blades that never dull, and needles fine enough to stitch a hide without tearing it. My people believe that if you take a life, you should waste nothing of what it gives you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a fine coat, and I can see it is loved. My people would say the bond between you honours you both." },
      },
      choices = {
        { text = "Waste nothing. That's the right way to hunt.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I take what's useful and leave the rest.", next = "BACK", fx = { align = { light = -1 } } },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, at my stall. These are tools for craftsmen, though I suppose a warrior must mend his own gear when he's far from a forge." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Welcome; the tools I sell were made on Teldrassil, and many of them were made for hunters, so they will feel familiar in your hands." },
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
        { text = "Do your tools suit a warrior's needs, Eldraeith?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What tools did the craftsmen of Teldrassil make for hunters?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Dozens a month, now that so many new adventurers are coming through, and every one wants the lion of Stormwind sewn just so. I'll tell you a secret: the stitching on the lion's mane takes longer than all the rest of it together." } },
      choices = {
        { text = "I'll wear the lion proudly. It means something.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A tabard's just cloth. I don't need a badge.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Of course, though you'll only tear it again in the next briar patch. I'll double the stitching at the knees, because hunters spend half their lives crouching in the bushes." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet}, I see, has been helping, with its claws? Never mind, I've mended worse; I once repaired a cloak that a bear had eaten half of." },
      },
      choices = {
        { text = "I'll take better care of my clothes, I promise.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Torn clothes are a hunter's badge of honour.", next = "BACK", fx = { align = { order = -1 } } },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in a tailor's shop! You'll be wanting a tabard to wear over that armour, I expect, so that everybody knows whose side you're on." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Your clothes are torn, I see, in all the places hunters always tear them: the knees, the elbows and the hem." },
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
        { text = "Do warriors buy many tabards, Georgio?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can you mend a hunter's clothing properly, Georgio?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The sensible ones do, because a torn tabard on the road is a torn tabard for a month. I've sold more thread to Barracks men than you'd guess, though they all say it's for their wives." } },
      choices = {
        { text = "A warrior should know how to mend his own gear.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll pay someone to sew. I've better things to do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Heavy waxed thread, mostly, which Simon Tanner swears by, though he'll never admit to buying it from me. It holds a stitch through rain and mud, which is what a hunter needs." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} keeps batting at my spools, and I don't have the heart to stop it. Is it always this playful?" },
      },
      choices = {
        { text = "Good thread for good work. I'll buy the best.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The cheapest thread will do. It'll tear anyway.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll not want thread and needles, I'd think, but if you ever tear a tabard, bring it to Georgio and not to the market stalls." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've thread strong enough for hides, if you work your own leather, and needles that won't snap on a boar's skin." },
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
        { text = "Do warriors learn to mend their own clothing, Alexandra?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What thread do you sell for leather work, Alexandra?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Very like, because one strong thread can hold a whole hem together, and one weak one can unravel it. I've seen a whole company break because one soldier ran, and I've seen one soldier hold a whole company together." } },
      choices = {
        { text = "I'll be the thread that holds.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Sometimes the cloth's not worth holding together.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "In patience, yes, and in knowing that one hasty move can ruin hours of work. A hunter who looses too early loses the deer, and a tailor who cuts too early loses the cloth." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is a very patient beast, I see. It's been watching my needle for a full minute, which is longer than any of my students manage." },
      },
      choices = {
        { text = "Patience in everything, as you say.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sometimes you have to act fast and fix it later.", next = "BACK", fx = { align = { order = -1 } } },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Life is like a bolt of good cloth, I always say, and a warrior is the thread that holds the hem together when everything else tears." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll know about patience, I'd guess, which is the first thing I teach and the last thing my students learn." },
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
        { text = "Is a warrior really like a thread in cloth, Lawrence?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is tailoring much like hunting, Lawrence?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "By the wand, often, because a mage with a cheap wand is bluffing and a mage with a good one is not. Since Dalaran fell, there aren't many good ones left, so if you see one, close the distance quickly." } },
      choices = {
        { text = "I'll treat every mage with respect, good wand or not.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Close the distance quickly. I'll remember that.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not usually, because a bow does the same work and never needs recharging. But I knew a ranger from Quel'Thalas once who carried a wand to light his campfires, and he swore by it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is staring at the wands as though they might move. Clever beast; some of them do, a little, when the enchantment's fresh." },
      },
      choices = {
        { text = "A bow is honest work. No magic needed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If a wand lights a fire, I'll take one.", next = "BACK", fx = { align = { order = -1 } } },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, at a wand stall. You'll not need any of these, but I'll tell you honestly that a warrior who can recognise a good wand is a warrior who can spot a dangerous mage." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Wands aren't much use to you, I'd think, though I've known a hunter or two who carried one as a curiosity." },
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
        { text = "How can a warrior tell a dangerous mage, Ardwyn?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters ever use wands, Ardwyn?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A pinch of a few of them, mixed by an alchemist, will steady your nerves or toughen your skin for an hour. I'd not recommend eating them raw, though one of the Barracks lads tried it and lived." } },
      choices = {
        { text = "I'll leave the reagents to the alchemists.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it works, I'll try anything once.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "From all over the world, from the crafters and mages here and from the hunters and gatherers who bring me what they find. A good hunter can make a fine living bringing in rare feathers and claws, if they know what to look for." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks healthy and strong, which is good; some of these reagents come from beasts that weren't so lucky." },
      },
      choices = {
        { text = "I'll take only what I need from the creatures I hunt.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it sells, I'll bring it in.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, among the reagents. These are leftovers of a great deal of magic, and most of them won't help you, though a few might surprise you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I suppose you see more of the world's raw magic than I do, out in the wild where the reagents first come from." },
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
        { text = "Could a reagent help a warrior, Charys?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Where do your reagents come from, Charys?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not often, but when they do, it's for a wedding or a funeral, and they want the very best. I've fitted a captain of the Barracks for his daughter's wedding, and he was more nervous than any battle could have made him." } },
      choices = {
        { text = "A warrior should look their best for the people they love.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fine clothes are wasted on a warrior.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Once in a while, for a feast or a funeral, and they always look terribly uncomfortable in them. My apprentice says it's because hunters can't sit still in anything that doesn't rustle like leaves." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has better manners than my apprentice, I'll say that. At least it hasn't forgotten its sewing kit." },
      },
      choices = {
        { text = "Even a hunter can dress well when it matters.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A robe? Never. Leather suits me fine.", next = "BACK", fx = { align = { order = -1 } } },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in Larson Clothiers! You'll want a robe for under your armour, perhaps, or something nice for when you're off duty." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I'm afraid we only sell robes, but if you're ever invited to the Cathedral, you'll want something without mud on it." },
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
        { text = "Do warriors buy fine clothes, Wynne?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters ever buy robes, Wynne?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
