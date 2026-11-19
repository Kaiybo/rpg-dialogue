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
    first = "She plainly wishes she were fighting outside the walls instead.",
    third = "{name} met Lilyssia Nightbreeze, a night elf alchemist teaching in Stormwind's Mage Quarter.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, and close the door behind you. My sisters walk Ashenvale under Elune's moon, and this little house is the only battlefield they allow me." },
    { id = "g_back", when = { metBefore = true }, text = "You return with the smell of the wild still on you, and I envy every league of it. Tell me where you've been, and whether the moon was bright there." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" }, place = "before",
      text = "You carry herbs with you; I can smell the mageroyal from here. Bring them to me, and I'll show you how to make them worth ten times as much." },
    { id = "n_warrior", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } }, place = "before",
      text = "You've come from the fighting, haven't you? I envy you that, and I'm not ashamed to say it." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I wish it every day, but someone must teach, and duty does not bend because a heart is restless. Your spirits must understand that better than most." } },
      choices = {
        { text = "Duty kept is the truest honour, Lilyssia.", next = "BACK", reply = "It is, and I remind myself of it each morning at this bench. Thank you for saying it aloud.", fx = { align = { honor = 1 } } },
        { text = "Go and fight, then. Duty can wait.", next = "BACK", reply = "If only it were so simple. Duty waits for nothing, and neither would the Sentinels if I abandoned my post.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Some of my students come to me for healing draughts and leave asking about poisons, and I teach both, because a sentinel must know what's in the arrow that hits her. But I teach in daylight, with the door open, and I'd thank you to remember that what you brew here bears my name." },
      },
      choices = {
        { text = "Then I'll brew it honestly, under your name.", next = "BACK", reply = "Good. Then the arrow will carry my craft and your honesty, and that is enough.", fx = { align = { honor = 1 } } },
        { text = "Your name won't be on the arrow, Lilyssia.", next = "BACK", reply = "No, but it will be on my conscience. Brew carefully, or not at all.", fx = { align = { honor = -1 } } },
        { text = "Something else, Lilyssia.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The elders trust slowly and have reason to, but the humans of this city have treated me fairly, and I say so in my letters home. Whether Stormwind remembers us when the orcs push deeper into Ashenvale is another question, and I can't answer it from here." } },
      choices = {
        { text = "Stormwind will keep its word, Lilyssia. I believe that.", next = "BACK", reply = "I hope you are right. I will write that a human believes it, and my elders will be surprised.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "We shouldn't wait on human promises. We'll guard Ashenvale ourselves.", next = "BACK", reply = "That is what my sisters say, and perhaps they are right. Still, I would rather we stood together.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the arcane nearly destroyed my people once, long ago, and the Sentinels have long memories. I don't share their fear entirely, but I understand it well enough." } },
      choices = {
        { text = "Their caution is wise. Magic should never be trusted lightly.", next = "BACK", reply = "That is what my people believe, and I do not entirely disagree. Thank you for understanding.", fx = { align = { light = 1 } } },
        { text = "Fear never built anything, Lilyssia. Mages build.", next = "BACK", reply = "Mages also built the Well's ruin, and we are still paying for it. Build carefully.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They would, and they'd be right to, for the Legion's creatures burned Ashenvale once and would do it again. I'm kept here among potions while they hold the line, so I fight the only way I can, by teaching you to heal rather than to burn." } },
      choices = {
        { text = "Then teach me to heal. I'll take the lesson.", next = "BACK", reply = "Gladly. Come back tomorrow, and I will show you how a healing draught is made.", fx = { align = { light = 1 } } },
        { text = "Burning has its uses too, Lilyssia.", next = "BACK", reply = "It has, and the Legion knew them well. I would rather you learned the other kind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I wish I were a Sentinel, guarding the shores of Darkshore against what crawls out of the sea. Instead I brew potions here, so that others may go, and I tell myself that is enough." } },
      choices = {
        { text = "Your potions save lives. That's a battle too.", next = "BACK", reply = "So I am told, and some days I believe it. Thank you.", fx = { align = { order = 1 } } },
        { text = "If you want to fight, go and fight.", next = "BACK", reply = "If only it were that simple. The bench holds me as surely as any oath.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some do, from Darnassus and Auberdine, and the humans stare at their night sabers as if they've never seen a cat. They come to buy potions, mostly, and to tell me which herbs have grown thick in Ashenvale." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some do, from Darnassus and Auberdine, and the humans stare at their night sabers as if they've never seen a cat. Your {pet} would like the forests of my home, I think. Take it there one day, if you can, so it knows what a real tree looks like." },
      },
      choices = {
        { text = "The wild is sacred and should be kept so.", next = "BACK", reply = "I am glad you see it, so far from Ashenvale. Elune keep the forests green.", fx = { align = { light = 1 } } },
        { text = "The wild is there to be used, and I'll use it.", next = "BACK", reply = "Then use it carefully, for the wild remembers. My people learned that long ago.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every day I stand at this bench, though I know my potions mend more of them than my glaive ever could. Duty is not always where we'd choose it to be, and I'm still learning to bear that." } },
      choices = {
        { text = "Duty is duty, wherever it calls. You serve well here.", next = "BACK", reply = "Thank you. The Sentinels in Ashenvale write to me of battles, and some nights this bench feels very small.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Follow your heart to the front, Lilyssia. The bench can wait.", next = "BACK", reply = "My heart would agree with you, but my oath would not. The bench stays, for now.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They respect anyone who stands firm, and they've heard tales of your order from Alliance soldiers in Ashenvale. But they'd want to see you fight beside them before they'd say it aloud." } },
      choices = {
        { text = "Then I'll go to Ashenvale and earn it.", next = "BACK", reply = "Then go, and they will remember you. The Sentinels do not forget those who stand beside them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I don't need the Sentinels' respect to do my duty.", next = "BACK", reply = "No, but it would make your duty easier. Think on it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Then you know what it is to tend the wounded while others stand guard, and you'll understand why I envy them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. My sisters in Ashenvale would respect you, I think, for you fight where the danger is and not behind a bench." },
        { id = "h_default", text = "I am Lilyssia Nightbreeze. I teach alchemy here, shut up among the humans' stone, while my sisters fight the battles I dream of under every new moon. Still, someone must teach, and a daughter of the kaldorei keeps the post she is given." },
        { id = "h_nightelf", when = { race = "NightElf" }, text = "A child of the forest! Then you understand what it is to be kept from the fight while our sisters stand watch in Ashenvale. Sit, and let me teach you something useful at least." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. My sisters would frown at me for teaching your kind, but alchemy needs a steady hand, and yours look steady enough." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You bring the fel into my workshop, and the herbs wilt on the bench. I will teach you, because I must, but my sisters in Ashenvale would not." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You will fight the battles I dream of every night while I stay here among the humans' stone, and I envy you more than a Sentinel's daughter ought to say." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The hunters of my people walk the forests beside the night sabers, and I think of them often, here among the stone." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Elune guide you, druid. Some days I'd trade my mortar for your claws, because my place is outside these walls with the Sentinels." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You move like one of my sisters on the watch, and that's rare among humans. Have you come to learn alchemy, or to steal it?" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I would rather be on the Ashenvale road with a glaive, but I teach alchemy out of duty, as Elune asks of me. Do your spirits demand duty too?" },
      },
      again = {
        { id = "h_again", text = "Speak, and I will answer while the still drips; the forest taught me to listen and work at once." },
        { id = "h_again2", text = "Ask, while the flask is cooling; it will not hurry for either of us, and neither will I." },
      },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "Why not go and fight, then?", next = "fight" },
        { text = "I'm not sure what I should brew first.", next = "brew" },
        { text = "You can't keep this place alone.", next = "shop" },
        { text = "Why would your sisters frown at teaching mages?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "You look as if you'd rather be a warrior, Lilyssia.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the kaldorei hunters ever come to Stormwind, Lilyssia?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd guess your sisters would fight someone like me, Lilyssia.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you envy the Sentinels, Lilyssia?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the Sentinels respect the Silver Hand, Lilyssia?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the Circle trust humans to keep the Alliance's promises, Lilyssia?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do your poisons interest someone in my trade, Lilyssia?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you wish you were out fighting, Lilyssia?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
      lines = { { id = "f2_default", text = "So I tell myself each morning, and some mornings I even believe it. Tell me truthfully, would you stay, in my place?" } },
      choices = {
        { text = "Yes. A post is a post, and someone must hold it.", next = "BACK", reply = "That is the answer I give myself each morning. It is good to hear it from someone else.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "No. I'd go where I was needed most.", next = "BACK", reply = "I would too, if I were you. But I am not, and so I stay.", fx = { align = { order = -1 } } },
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
    elune = { { id = "tp_elune", text = "Elune guides my hands when I brew, though the humans don't understand why I work by moonlight. I don't explain, because they'd only want to watch." } },
    teldrassil = { { id = "tp_teldrassil", text = "Teldrassil is my home, and my heart is there, or anywhere outside these walls. Still, duty keeps me here, and I share what I know with those who'd learn it." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels fight for our people in Ashenvale, and I would sooner stand among them than behind this little counter. I brew potions for them when I can, and I send them by the next ship." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The herbs that grow where the Emerald Dream touches our world are the finest in any alchemy, and I've never been able to find them. The druids say they're there, and I believe them." } },
    background = { { id = "tp_bg", text = "I crossed the sea when our peoples made their alliance, and I have taught here ever since. My people seldom count the days, but I count every one of mine." } },
    _none = { { id = "tp_none", text = "That I cannot tell you, and I will not pretend otherwise, as the younger races sometimes do. Ask me about herbs and flasks instead." } },
  },
}

-- Eldraeith: night elf herb seller; proud of goods carried from Teldrassil as a sign of alliance.
P:NPC {
  key = "eldraeith", id = TODO_NPC("Eldraeith"), name = "Eldraeith", title = "Herbalism Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "gracious" }, values = { "nature", "alliance" },
  notices = { "race" },
  impression = {
    first = "She presents each herb as a gift between two peoples.",
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "A little of it, I believe. The earth remembers where it came from. Your spirits might feel it more than humans do." } },
      choices = {
        { text = "The earth's memory is worth honouring. Thank you.", next = "BACK", reply = "Thank you. Most who buy these stones in Stormwind only ask whether they will fetch a good price in Ironforge.", fx = { align = { light = 1 } } },
        { text = "Herbs are herbs. Let's talk about price.", next = "BACK", reply = "Of course. The earth will forgive me for discussing coin, I hope.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "My people remember the War of the Ancients, when those who drew on such powers nearly ended the world, and memories that long don't fade easily. I carried these tools across the sea as a gift of friendship, and I'll sell to you in that same spirit, though I'd ask you not to be the one who makes me regret it." },
      },
      choices = {
        { text = "I won't make you regret it, Eldraeith.", next = "BACK", reply = "Thank you. I will hold you to that, gently.", fx = { align = { light = 1 } } },
        { text = "Old memories, Eldraeith. What I study is my own affair.", next = "BACK", reply = "They are, but they are ours, and we cannot forget them. I hope your arts stay your own.", fx = { align = { light = -1 } } },
        { text = "Something else, Eldraeith.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some do, and they hold them as carefully as a priest holds a relic, while others only ask the price. I sell to both, because a gift between peoples must begin somewhere, even at a market stall." } },
      choices = {
        { text = "Sell only to those who'll treat them with respect.", next = "BACK", reply = "That is my hope, though I cannot always tell who will. I try.", fx = { align = { order = 1 } } },
        { text = "Sell to anyone. Respect can be learned afterwards.", next = "BACK", reply = "Perhaps, and I sell to both for that reason. A human who buys a moonstone today may ask me what it means tomorrow.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "We do, though we call them other things, and they walk the glades of Ashenvale far more quietly than any human. Our Sentinels and your SI:7 would understand each other well, I think, if they ever stopped watching each other." } },
      choices = {
        { text = "Allies should trust each other, not spy on each other.", next = "BACK", reply = "That would be the best way, though I suspect neither would listen.", fx = { align = { honor = 1 } } },
        { text = "Allies always watch each other. That's simple sense.", next = "BACK", reply = "I suspect both would agree with you. Darnassus watches Stormwind, Stormwind watches Darnassus, and somehow the trade ships keep sailing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Perhaps, and the Sanctum's mages have offered, but a gift carried by hand means more than one sent through a door in the air. My people value the long road, because the journey is part of the gift." } },
      choices = {
        { text = "The old way has meaning. Carry your gifts by hand.", next = "BACK", reply = "Thank you. Every gift I have given in this city came across the sea in my own hands, and I would not dream of sending one through a portal.", fx = { align = { order = 1 } } },
        { text = "A faster road helps more people. Take the portal.", next = "BACK", reply = "It would, and perhaps one day I will. For now, I carry them by hand.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They are made for leather and cloth, not steel, but they will mend a strap or stitch a shield grip as well as any blacksmith's. The Sentinels carry such tools on patrol, because a forest has no forges." } },
      choices = {
        { text = "A warrior should be able to mend their own gear.", next = "BACK", reply = "The Sentinels would agree. In Ashenvale, a blade you cannot mend yourself is a blade you will lose.", fx = { align = { order = 1 } } },
        { text = "I'll let the smiths mend my gear. That's their job.", next = "BACK", reply = "Then the smiths will be glad of your coin. I will be here if you need a strap.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Skinning blades that never dull, and needles fine enough to stitch a hide without tearing it. My people believe that if you take a life, you should waste nothing of what it gives you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Skinning blades that never dull, and needles fine enough to stitch a hide without tearing it. Your {pet} has a fine coat, and I can see it is loved. My people would say the bond between you honours you both." },
      },
      choices = {
        { text = "Waste nothing. That's the right way to hunt.", next = "BACK", reply = "That is the kaldorei way, and I am glad you share it.", fx = { align = { light = 1 } } },
        { text = "I take what's useful and leave the rest.", next = "BACK", reply = "Then I hope the rest feeds something that needs it. Elune keep you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They tend the sick and the dying, and they sing over the dead so their spirits find the way. I carried a little moonwell water across the sea with me, though I've had no cause to use it yet." } },
      choices = {
        { text = "Every faith that tends the dying is a faith I honour.", next = "BACK", reply = "Thank you. The priestesses of Elune say the same of your Cathedral, though they say it more quietly.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Songs won't save the dying. Medicine might.", next = "BACK", reply = "Medicine, yes, and songs too, for those who cannot be saved. Both have their place.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That they are brave and bound by promises, which my people value above most things. We have long memories, and a people who keep their oaths are remembered kindly." } },
      choices = {
        { text = "An oath is everything. I'll keep mine.", next = "BACK", reply = "Then you will be remembered well. My people never forget a kept oath.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Oaths bend when the world does. That's wisdom, not weakness.", next = "BACK", reply = "They do, sometimes, and my people know it too well. Still, I would rather keep mine.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Welcome, priest. Whether you serve the Light or Elune, you are kin in spirit to our priestesses, and so I greet you." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "Welcome, champion of the Light. Your order's oaths are spoken of even in Darnassus, though few of us have met one who keeps them." },
        { id = "h_default", text = "I am Eldraeith. Our finest craftsmen on Teldrassil made these tools, and I carried them across the sea myself, as a sign of the friendship between the Great Tree's people and the humans of this land." },
        { id = "h_human", when = { race = "Human" }, text = "Welcome, child of Stormwind. Your city has been kind to us, and I hope these gifts from Teldrassil repay a little of that kindness." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. I carried these tools across the sea, and I would be very sad to see them leave without being paid for." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. My people do not love the arcane, but I was taught to be courteous to guests, and you are a guest here, as I am." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, at my stall. These are tools for craftsmen, though I suppose a warrior must mend his own gear when he's far from a forge." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Welcome; the tools I sell were made on Teldrassil, and many of them were made for hunters, so they will feel familiar in your hands." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Ishnu-alah, druid. These tools crossed the sea with me from Teldrassil, and it gladdens me to see someone who knows the wood they were carved from." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You carry a shadow with you, and my people know that shadow too well. I'll still show you my wares, but I'll ask you to stand back from the herbs." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. In Teldrassil, we would call you something akin to a druid, though rougher. Welcome; these herbs are gifts between our peoples." },
      },
      again = {
        { id = "h_again", text = "What else may I tell you? Elune grants me patience enough for every question." },
        { id = "h_again2", text = "The Great Tree's gifts are patient, and so am I; ask what you wish." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Why carry them all this way?", next = "why" },
        { text = "Stormwind must seem strange after your forests.", next = "city" },
        { text = "I'd wager night elves have rogues of their own.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Couldn't a portal to Darnassus have spared you the voyage?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your tools look too fine for a warrior's needs, Eldraeith.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The craftsmen of Teldrassil must make fine tools for hunters.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your priestesses tend the sick in Teldrassil?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do your people think of the Silver Hand, Eldraeith?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the humans here understand what your tools mean, Eldraeith?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do your people fear those who study forbidden powers, Eldraeith?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the herbs carry Teldrassil's spirit with them, Eldraeith?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "The alliance makes us both stronger.", next = "BACK", reply = "I hope more of both our peoples come to believe it. There are still elves in Darnassus who think Stormwind smells of smoke.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Each people should look after its own first.", next = "BACK", reply = "Some of my people agree with you, and some of yours. I would rather we learned each other.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    city = {
      lines = { { id = "c_default", text = "Loud, and full of stone, and very young. But the Park is lovely in the evening, and the humans there walk slowly, which I did not expect of them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    teldrassil = { { id = "tp_teldrassil", text = "Every herb on my table was grown on Teldrassil and carried here by hand, as a sign of friendship between our peoples. I hope you'll treat them as a gift, even if you've paid for them." } },
    elune = { { id = "tp_elune", text = "Elune watches over every plant that grows under the moon, and I bless each one before I sell it. The humans think I'm being polite, and I let them think so." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande Whisperwind sent us here to show the humans our goodwill, and I carry her blessing with every herb I sell. She is our high priestess and our leader, and she has been both for longer than your kingdom has stood." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire came to Elwynn soon after I arrived, and I had never heard so many humans laugh at once. I have seen much in a very long life, and that still surprised me." } },
    background = { { id = "tp_bg", text = "I crossed from Kalimdor with the first of our people to come to Stormwind, and I have kept this corner of the shop since." } },
    _none = { { id = "tp_none", text = "I do not know, and my people learned long ago that a careless guess can do more harm than silence." } },
  },
}

-- Georgio Bolero: tailoring teacher at Duncan's Textiles; vain about cut, pleased with trade.
P:NPC {
  key = "georgio_bolero", id = TODO_NPC("Georgio Bolero"), name = "Georgio Bolero", title = "Artisan Tailor",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "vain" }, values = { "beauty", "craft" },
  notices = { "kit", "craft" },
  impression = {
    first = "He is vain about his cut and generous with his lessons.",
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I could make anything elegant, darling, and I'd love the challenge. Come back when you can stand still for an afternoon." } },
      choices = {
        { text = "Make something practical, Georgio. Elegance can come after.", next = "BACK", reply = "Practical? Darling, you wound me. I'll make it practical and elegant, and you'll thank me.", fx = { align = { honor = 1 } } },
        { text = "Elegance first. Let them see me coming.", next = "BACK", reply = "Exactly! They should see you coming from across the square, darling.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Nothing I make has ever been asked to, and I'll confess the thought gives me a headache. Still, if you'd stand very still for an hour, I'd make you look like nobility of Darnassus, whatever happens to it afterwards." } },
      choices = {
        { text = "Plain cloth suits a druid. I'll not dress up for Stormwind.", next = "BACK", reply = "Plain cloth? Oh, darling. Very well, but I'll weep while I cut it.", fx = { align = { honor = 1 } } },
        { text = "Make me splendid, Georgio. Let the whole court stare.", next = "BACK", reply = "Splendid! I'll make you the talk of the Keep, darling, and you'll never forget it.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a tailor remembers every measurement he takes, and a careful man in your trade shouldn't want to be remembered. The SI:7 people sew their own, you know, and I've always taken that as a compliment to the craft." } },
      choices = {
        { text = "I've nothing to hide, Georgio. Measure away.", next = "BACK", reply = "Wonderful, darling! Stand still and let me work.", fx = { align = { honor = 1 } } },
        { text = "Then I'll learn to sew and stay forgotten.", next = "BACK", reply = "Then you'll never look as good as I could make you, darling. A tragedy.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Quite a few, because felcloth and runecloth both want a careful hand, and your people have the patience for fiddly work. I teach the stitch and not the purpose, and I've found that keeps everybody happy." } },
      choices = {
        { text = "Then I'll sew for protection, not for anything darker.", next = "BACK", reply = "A noble purpose, darling. I'll teach you the stitch with pleasure.", fx = { align = { light = 1 } } },
        { text = "The purpose is mine, Georgio. The stitch is enough.", next = "BACK", reply = "Then I'll teach you the stitch and not ask, darling. That's the arrangement.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Dozens a month, now that so many new adventurers are coming through, and every one wants the lion of Stormwind sewn just so. I'll tell you a secret: the stitching on the lion's mane takes longer than all the rest of it together." } },
      choices = {
        { text = "I'll wear the lion proudly. It means something.", next = "BACK", reply = "It does, darling, and I sew every lion with love. Wear it well.", fx = { align = { order = 1 } } },
        { text = "A tabard's just cloth. I don't need a badge.", next = "BACK", reply = "Just cloth? Darling, you wound me twice in one day.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Of course, though you'll only tear it again in the next briar patch. I'll double the stitching at the knees, because hunters spend half their lives crouching in the bushes." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Of course, though you'll only tear it again in the next briar patch. And {pet}, I see, has been helping, with its claws? Never mind, I've mended worse; I once repaired a cloak that a bear had eaten half of." },
      },
      choices = {
        { text = "I'll take better care of my clothes, I promise.", next = "BACK", reply = "You won't, darling, but it's sweet of you to say. I'll double the stitching anyway.", fx = { align = { order = 1 } } },
        { text = "Torn clothes are a hunter's badge of honour.", next = "BACK", reply = "A badge of honour, darling, and of very poor tailoring. Bring it back and I'll fix it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They cut for humility, which is to say they don't care whether anything fits. I have nothing against modesty, but a priest who's comfortable prays better, I'm quite certain of it." } },
      choices = {
        { text = "Humility matters more than comfort, Georgio.", next = "BACK", reply = "It does, darling, but a little comfort never hurt anyone. I'll make it modest and fitted.", fx = { align = { light = 1 } } },
        { text = "You're right. I'd pray better in a robe that fits.", next = "BACK", reply = "Exactly, darling! I won't say the Light listens better to the well dressed, but I've never heard it complain.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It's the first thing people see, before your hammer or your face, and it tells them what you stand for. A ragged tabard says you've stopped caring, and nobody follows someone who's stopped caring." } },
      choices = {
        { text = "Then I'll keep it clean. Others look to it.", next = "BACK", reply = "Thank you, darling. A clean tabard in the Cathedral Square does more for the faithful than half the sermons.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "People should follow deeds, not tabards.", next = "BACK", reply = "Deeds, yes, but a tabard is how they know whose deeds they are. Keep it clean anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Another priest, and another robe that was cut for someone else. Come here and let me see what can be done before the Cathedral's tailors ruin you entirely." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Your tabard is a crime, {class}, and I say that with love, so come in and let me fix the hem." },
        { id = "h_default", text = "Georgio Bolero. I've been teaching tailoring in this shop for some years, and business has been very good lately, with so many new adventurers coming through and tearing their clothes." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priest! Your people wear robes more than anyone, so learn to stitch your own and you'll never again wear something the Cathedral's tailors cut for somebody shorter." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage, and in a robe that fits you badly, which is the curse of your profession. Learn to make your own, and you'll cast better simply for being comfortable." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! You'll want dark cloth that doesn't shine in the lamplight, and I can teach you to sew it yourself, so nobody knows your size." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, and your cuffs are singed exactly where the shadow bolts leave your hands. I can teach you to line them, which will save you a fortune in sleeves." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in a tailor's shop! You'll be wanting a tabard to wear over that armour, I expect, so that everybody knows whose side you're on." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Your clothes are torn, I see, in all the places hunters always tear them: the knees, the elbows and the hem." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Your leathers are serviceable, I'll say that, but please let me show you what a proper cut would do for a figure as tall as yours." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Let me see what you're wearing. Hmm, rugged and practical, darling, but not elegant." },
      },
      again = {
        { id = "h_again", text = "What else? I've a bolt of wool waiting." },
        { id = "h_again2", text = "Speak up, darling, my scissors are louder than they look." },
      },
      choices = {
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "Why so many new adventurers?", next = "new" },
        { text = "You can't be the only one working here.", next = "shop" },
        { text = "There must be more to good tailoring than it looks.", next = "good" },
        { text = "Why would it matter who knows my size?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I expect warriors buy a good many tabards, Georgio.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can you mend a hunter's clothing properly, Georgio?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd guess a few of the Lamb's people learn tailoring from you.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the Cathedral's tailors really cut so badly, Georgio?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does a paladin's tabard really matter, Georgio?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Can a proper cut survive a druid changing shape, Georgio?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Could you make something elegant for a shaman, Georgio?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "No. A fair trade for honest work is fine.", next = "BACK", reply = "Thank you, darling. At last, someone in this city who doesn't haggle over every stitch.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "I'd rather you mended the refugees' clothes for free.", next = "BACK", reply = "For free? Darling, I'd starve, and then who'd mend anything? I do give a discount to the very sad ones.", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop = {
      lines = { { id = "s_default", text = "Duncan Cullen owns it and sells the finished armour, Alexandra keeps the cloth and thread, and young Lawrence Schneider teaches the beginners, which spares me hours of watching crooked hems." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    good = {
      lines = { { id = "gd_default", text = "A seam you can't see and a fit you can't feel. If anyone notices your clothes before they notice you, the tailor has failed, and I don't fail." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire's costumes are the only tailoring in the world that rivals mine, and I say that with all the modesty I possess. I've studied every stitch, and I've found three mistakes, which I shall not name." } },
    gilneas = { { id = "tp_gilneas", text = "The tailors of Gilneas cut the finest coats in the Seven Kingdoms, and they've hidden the lot of them behind that wall. I've tried to copy their collars, and I've failed, which I don't say often." } },
    dalaran = { { id = "tp_dalaran", text = "The mages of Dalaran wore robes of the finest silk, and I tailored a few of them before the plague. I'd like to again, when they open their gates, and I'd like them to notice the hems." } },
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
    first = "She keeps her head while Georgio fusses over hems.",
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I feel it in every stitch, because the good thread came from Dalaran, and now we make do with what the elves sell us. Your spirits might know where better thread grows." } },
      choices = {
        { text = "Then we'll make the best of what remains, Alexandra.", next = "BACK", reply = "We will, and we'll make it good. Georgio would say we're making it better.", fx = { align = { order = 1 } } },
        { text = "The elves' thread will do. No need for Dalaran.", next = "BACK", reply = "It will do, and it's very good thread. I still miss Dalaran's, though.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They buy the same colours and never haggle, because haggling means talking, and they'd rather leave than be remembered. Georgio thinks they're all very mysterious, but I think they're just people who pay on time, and I like them better than half my regulars." },
      },
      choices = {
        { text = "I'll pay on time, then, and never haggle.", next = "BACK", reply = "That's all I ask. You'll be a favourite customer.", fx = { align = { honor = 1 } } },
        { text = "Then forget I was here, Alexandra.", next = "BACK", reply = "Already forgotten. Come back whenever you like.", fx = { align = { honor = -1 } } },
        { text = "Something else, Alexandra.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Roots and bark from Elwynn, mostly, and a blue from Lordaeron that I can't get any more since the plague. I pay the gatherers fairly and ask them not to strip the trees, though I can't swear they listen." } },
      choices = {
        { text = "Make them swear it, and check on them yourself.", next = "BACK", reply = "I do, and I will. I've already turned one gatherer away for bringing me bark stripped right round the trunk.", fx = { align = { order = 1 } } },
        { text = "You can't police every gatherer. Trust them and move on.", next = "BACK", reply = "You can't, I suppose, but I'll still ask. It's the least I can do.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because mages wear it and mages pay more for things with their name on, and someone in Dalaran worked that out long before I did. I've never told a buyer it was enchanted, mind, and I never will." } },
      choices = {
        { text = "Good. Honest trade is the only kind worth having.", next = "BACK", reply = "It's the only kind I'll have in my shop. Thank you.", fx = { align = { honor = 1 } } },
        { text = "A good name sells cloth. There's no harm in that.", next = "BACK", reply = "There isn't, so long as the cloth's good. Mine is.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Every month, in black and red, and it all goes down the stairs under that tavern in a covered basket. I've never asked what they make with it, and nobody's ever offered to tell me." } },
      choices = {
        { text = "You'd do well to ask what it's used for.", next = "BACK", reply = "I would, and I'm frightened of the answer. I'll keep not asking.", fx = { align = { light = 1 } } },
        { text = "Not asking is wise. Their business is their own.", next = "BACK", reply = "That's my thinking too. It's quieter that way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The sensible ones do, because a torn tabard on the road is a torn tabard for a month. I've sold more thread to Barracks men than you'd guess, though they all say it's for their wives." } },
      choices = {
        { text = "A warrior should know how to mend his own gear.", next = "BACK", reply = "The sensible ones do. Here, I'll sell you a needle and save you the walk back.", fx = { align = { order = 1 } } },
        { text = "I'll pay someone to sew. I've better things to do.", next = "BACK", reply = "Then Georgio will be glad of your coin. He'll lecture you for free.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Heavy waxed thread, mostly, which Simon Tanner swears by, though he'll never admit to buying it from me. It holds a stitch through rain and mud, which is what a hunter needs." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Heavy waxed thread, mostly, which Simon Tanner swears by, though he'll never admit to buying it from me. Your {pet} keeps batting at my spools, and I don't have the heart to stop it. Is it always this playful?" },
      },
      choices = {
        { text = "Good thread for good work. I'll buy the best.", next = "BACK", reply = "Good. You'll find it's worth every copper.", fx = { align = { honor = 1 } } },
        { text = "The cheapest thread will do. It'll tear anyway.", next = "BACK", reply = "It will, and you'll be back for more. That's good for business, at least.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Elwynn's flax, mostly, and some silk from the south, and the best of it used to come from Dalaran before the war. Now we make do, and the priests mend their robes until they're more patch than cloth." } },
      choices = {
        { text = "A patched robe can serve as well as a new one.", next = "BACK", reply = "It can, and the priests somehow make their patches look holy. I respect them for it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Cathedral should spend on new robes, not patches.", next = "BACK", reply = "Perhaps, but the Cathedral has other things to spend on. I'll keep selling them thread.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The good ones do, by firelight, and they're very proud of it. The others bring them to Georgio and he lectures them for an hour, so I'd learn, if I were you." } },
      choices = {
        { text = "Caring for one's own gear is part of the discipline.", next = "BACK", reply = "I'm glad to hear a paladin say it. Most of your order sends a squire.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My time's better spent fighting than sewing, Alexandra.", next = "BACK", reply = "Then Georgio will get your custom, and your hour of lecturing. I'd learn to sew.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You'll want white thread, I expect, because everything the Cathedral wears seems to show every stain." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll want strong thread for that tabard, because its hem has been through a war or two." },
        { id = "h_default", text = "Alexandra Bolero. Georgio teaches, I supply, and between us we keep Stormwind's tailors from tying their seams with string." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you'll want mageweave, of course, because they all do once they've heard the name. It isn't magic, you know; it's just very good thread." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. I'll sell you thread and dye like anyone else, though I'd sooner you didn't stitch anything into it that whispers." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll not want thread and needles, I'd think, but if you ever tear a tabard, bring it to Georgio and not to the market stalls." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've thread strong enough for hides, if you work your own leather, and needles that won't snap on a boar's skin." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and you'll be wondering where my dyes come from, I expect, because your people always ask that before they ask the price." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Black thread and a dark dye, I'd wager, and a needle sharp enough for leather. I can always tell the quiet ones." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Don't mind Georgio fussing; do you need thread? The good thread comes from Teldrassil now that Dalaran's gone." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Go on, Georgio won't miss me for a minute." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Fine goods must be hard to come by these days.", next = "stock" },
        { text = "Working with Georgio must be lively.", next = "georgio" },
        { text = "If mageweave isn't magic, why call it that?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I doubt warriors learn to mend their own clothing, Alexandra.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Leather work wants a heavier thread, I'd think, Alexandra.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Have you sold thread to the Lamb's cellar?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Where does the Cathedral's thread come from, Alexandra?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do paladins mend their own tabards, Alexandra?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Where do your dyes come from, Alexandra?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "How can you tell the quiet ones, Alexandra?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is Dalaran's loss still felt here, Alexandra?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Alexandra.", next = "END" },
      },
    },
    stock = {
      lines = { { id = "s_default", text = "Since Dalaran fell and Quel'Thalas burned, the fine goods have been terribly hard to come by. Lucan Cordell and some of the other tradesmen in the city have done well filling our orders, but it isn't what it was." } },
      choices = {
        { text = "I keep hearing the name Lucan Cordell.", next = "lucan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lucan = {
      lines = { { id = "l_default", text = "The finest enchanter in Stormwind, who keeps a shop by the canals with Jessara Cordell. Most of the enchanted thread and trinkets in the Mage Quarter pass through his hands before they reach ours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    georgio = {
      lines = { { id = "ge_default", text = "Loud, and he thinks every customer is a disaster waiting for his scissors. But he's never once cut a pattern wrong, and I'll forgive a man a lot of shouting for that." } },
      choices = {
        { text = "Skill excuses a lot.", next = "BACK", reply = "Georgio knows it, too. That's exactly why he's so insufferable.", fx = { align = { honor = -1 } } },
        { text = "Skill doesn't excuse rudeness.", next = "BACK", reply = "No, it doesn't, but I'll forgive him anyway. Someone has to.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = { { id = "tp_dalaran", text = "Since Dalaran fell and Quel'Thalas burned, good silk thread is very hard to find. Lucan Cordell and a few others keep us supplied, and Georgio complains about the colour of every spool." } },
    booty_bay = { { id = "tp_booty_bay", text = "The best dyes in the world come up from Booty Bay, and the goblins charge for every drop. Georgio says they're worth it, and I say he's not the one doing the accounts." } },
    scourge = { { id = "tp_scourge", text = "Quel'Thalas made the finest thread before the Scourge came, and I've a single spool of it left. I keep it in a drawer and look at it on bad days, and I'll never sell it." } },
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
    first = "He talks about weaving as though it explained the whole world.",
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "That everything holds together if the threads are true. Your spirits must be threads of some kind too." } },
      choices = {
        { text = "True threads hold the world together. Well said, Lawrence.", next = "BACK", reply = "Thank you! I'll tell Master Bolero, though he'll only say I'm being sentimental again.", fx = { align = { order = 1 } } },
        { text = "Threads break. Don't trust them so much.", next = "BACK", reply = "They do break, and that's why you double the stitch. Master Bolero taught me that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Oh, you'd be the black thread in the weave, I think, the one that gives the pattern its shape, though too much of it and the cloth turns gloomy. Master Bolero says I make everything into a metaphor, but I've noticed the Lamb's folk buy more black thread than anyone, so perhaps I'm not wrong." },
      },
      choices = {
        { text = "Then I'll be a thin thread, Lawrence, not the whole bolt.", next = "BACK", reply = "A thin thread, then, and I'll make it the one that holds the pattern together.", fx = { align = { light = 1 } } },
        { text = "The whole bolt in black would suit me fine.", next = "BACK", reply = "Then you'd be a very gloomy cloak, I'm afraid. I'll still sew it, though.", fx = { align = { light = -1 } } },
        { text = "Something else, Lawrence.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I think so, because every thread holds the others and pulling one loose unravels the rest. My teacher says that's sentimental, but I've never seen a forest or a cloth that proves me wrong." } },
      choices = {
        { text = "Every thread matters. That's the whole truth of the forest.", next = "BACK", reply = "That's what I've always thought, and you've put it better than I ever could.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Forests aren't cloth, Lawrence. Some threads must be cut.", next = "BACK", reply = "Maybe they aren't, but Master Bolero says that too, and I'm still not sure he's right.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It's meant as one, though I'd rather you used those hands on a needle than on someone's purse. Every seam can be unpicked and sewn again, and every life can too, if you start soon enough." } },
      choices = {
        { text = "My hands are honest, Lawrence. I'd swear to it.", next = "BACK", reply = "I believe you. Your hands look like they could hold a needle.", fx = { align = { honor = 1 } } },
        { text = "Purses and needles both pay, in their way.", next = "BACK", reply = "They do, but only one lets you sleep at night. I'd choose the needle.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It could, because both of them want patience and a steady hand, and I've never met a mage with too much of either. Master Bolero thinks I'm being fanciful, but his best students have always been mages." } },
      choices = {
        { text = "Discipline in one craft carries to another. I'll learn.", next = "BACK", reply = "That's what I hope too. Come and practise a stitch sometime.", fx = { align = { order = 1 } } },
        { text = "Spells come from talent, Lawrence, not from stitching.", next = "BACK", reply = "Maybe, but every mage I've met could use a little patience. Stitching teaches it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Very like, because one strong thread can hold a whole hem together, and one weak one can unravel it. I've seen a whole company break because one soldier ran, and I've seen one soldier hold a whole company together." } },
      choices = {
        { text = "I'll be the thread that holds.", next = "BACK", reply = "Good. That's what the hem needs, and the company too.", fx = { align = { honor = 1 } } },
        { text = "Sometimes the cloth's not worth holding together.", next = "BACK", reply = "Sometimes it isn't, I suppose. But I'd rather try to mend it first.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "In patience, yes, and in knowing that one hasty move can ruin hours of work. A hunter who looses too early loses the deer, and a tailor who cuts too early loses the cloth." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "In patience, yes, and in knowing that one hasty move can ruin hours of work. Your {pet} is a very patient beast, I see. It's been watching my needle for a full minute, which is longer than any of my students manage." },
      },
      choices = {
        { text = "Patience in everything, as you say.", next = "BACK", reply = "In everything, yes. You'd make a fine tailor, I think.", fx = { align = { order = 1 } } },
        { text = "Sometimes you have to act fast and fix it later.", next = "BACK", reply = "Sometimes, but the fixing takes longer than the waiting would have.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I think so, because without it the weft has nothing to cling to and the cloth falls apart in your hands. Master Bolero says I'm too fond of my metaphors, but he's never actually disagreed with one." } },
      choices = {
        { text = "Faith holds us together. You've put it well, Lawrence.", next = "BACK", reply = "Thank you. Master Bolero says I'm too fond of metaphors, but I think this one's true.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faith is a loose thread, Lawrence. Pull it and see.", next = "BACK", reply = "I'd rather not, if you don't mind. The whole cloth might come apart.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Then the cloth tears, and you mend it, but it's never quite the same. I think that's why paladins carry themselves so stiffly, because they know everyone's leaning on them." } },
      choices = {
        { text = "Then I'll be the thread that doesn't break.", next = "BACK", reply = "Then you'll be a strong thread, and the cloth will hold. Thank you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "No one thread should hold everything. That's poor weaving.", next = "BACK", reply = "That's true, and it's good weaving too. I'll remember it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I've always thought faith was like the warp in a loom, holding everything else in place, and nobody ever notices it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! A knight is like a strong thread in a weak cloth, holding the whole thing together, and I mean that as a compliment." },
        { id = "h_default", text = "Lawrence Schneider. I teach the beginners here, so Master Bolero can save his patience for the experts. I always say a life is like a bolt of good cloth: every thread matters, and one weak one can ruin the whole." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! I always say a good thief is like a good seamstress, because both of them can slip in and out without anyone seeing the join." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, here to learn tailoring? I always say a spell is like a stitch, because a careless one comes undone just when you need it most." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Life is like a bolt of good cloth, I always say, and a warrior is the thread that holds the hem together when everything else tears." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll know about patience, I'd guess, which is the first thing I teach and the last thing my students learn." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I always say the forest is the greatest loom of all, with every root a thread, and I'd love to know if you agree." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Every thread matters, I always say, even the dark ones, and perhaps especially the dark ones." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Weaving is like the world, you know, all threads crossing and holding each other up. Do your spirits weave?" },
      },
      again = {
        { id = "h_again", text = "Anything else? I've got a lesson in a moment." },
        { id = "h_again2", text = "Go on, I don't mind talking." },
      },
      choices = {
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "Schneider, like the tailors down on the canals.", next = "family" },
        { text = "You can't mean that about the threads.", next = "threads" },
        { text = "I'll take that as a compliment, Lawrence.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I doubt sewing could improve my spellwork.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is a warrior really like a thread in cloth, Lawrence?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is tailoring much like hunting, Lawrence?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is faith really like the warp in a loom, Lawrence?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What happens if the strong thread breaks, Lawrence?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is the forest really so much like a loom, Lawrence?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Where would someone like me fit in your bolt of cloth, Lawrence?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What does weaving teach you, Lawrence?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "No. A man should make his own way.", next = "BACK", reply = "Thank you. That's what I hoped someone would say.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Family comes first. You owed them your loyalty.", next = "BACK", reply = "Maybe I did. I'll write to them tonight, I think.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    threads = {
      lines = { { id = "t_default", text = "Every word of it! Master Bolero says I'll grow out of saying it, but I've seen a whole cloak unravel from one bad stitch, and I think kingdoms work the same way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire's tents are woven like a story, every thread leading to the next, and I could look at them all day. Georgio says I should be looking at my own work instead, and he's probably right." } },
    holy_light = { { id = "tp_holy_light", text = "Life is like a carefully woven cloth, and the Light is the thread that holds it together. I've told that to Georgio, and he said I should save it for a sampler." } },
    scourge = { { id = "tp_scourge", text = "The refugees from Lordaeron bring cloth with them, and some of it is the finest I've ever seen. I've learned more from the scraps they sell than from any book, and I wish it weren't so." } },
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
    first = "She mourns Dalaran mostly for its workshops, and is honest about it.",
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Terribly, for the workshops and the materials and the gossip, though not the politics. Your spirits must have politics too." } },
      choices = {
        { text = "I'll honour what Dalaran made, Ardwyn. It deserves remembering.", next = "BACK", reply = "Thank you. I learned my trade in those workshops, and most of the hands that taught me are gone now.", fx = { align = { honor = 1 } } },
        { text = "Dalaran's gone. Look forward, not back.", next = "BACK", reply = "I try, but the wood keeps reminding me. I'll look forward when I can.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Most of it came from Dalaran's own orchards, which are gone now, and I've kept the last of it like an heirloom. The new wood from Elwynn is stubborn and hums wrong, and I wonder if your people would know why." } },
      choices = {
        { text = "Ask the trees' pardon before you cut, and the wood will settle.", next = "BACK", reply = "That's a lovely thought, and I'll try it. The wood might listen.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Wood is wood, Ardwyn. Better tools will fix the hum.", next = "BACK", reply = "Better tools might, but I've tried. Maybe I'll ask the trees.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A well-made wand is silent until you call on it, while a cheap one hums all the time because the enchantment's leaking out through the grain. Most of the wands sold on the canal stalls would empty themselves in a month, and the sellers know it." } },
      choices = {
        { text = "Someone should warn buyers about those stalls.", next = "BACK", reply = "Someone should, and I do, but they don't listen. I'll keep trying.", fx = { align = { honor = 1 } } },
        { text = "Buyers should know better. That's the market.", next = "BACK", reply = "They should, but they don't. I'll keep my wands honest anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because shadow pulls inward while most enchantments push outward, and the wood can't bear both at once. Dalaran's enchanters could have solved it, but they never cared to, since they never cared much for your sort." } },
      choices = {
        { text = "Maybe some magic shouldn't be bottled in a wand.", next = "BACK", reply = "Perhaps not, and maybe Dalaran knew that. I'll leave it unsolved.", fx = { align = { light = 1 } } },
        { text = "Then Dalaran missed a chance. Shadow deserves good tools.", next = "BACK", reply = "Maybe it did, but I'll not be the one to try. My hands are too fond of their fingers.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "By the wand, often, because a mage with a cheap wand is bluffing and a mage with a good one is not. Since Dalaran fell, there aren't many good ones left, so if you see one, close the distance quickly." } },
      choices = {
        { text = "I'll treat every mage with respect, good wand or not.", next = "BACK", reply = "That's kind of you. The good ones deserve it, and the bluffers need it.", fx = { align = { order = 1 } } },
        { text = "Close the distance quickly. I'll remember that.", next = "BACK", reply = "You will, I'm sure. Just mind the ones with good wands.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not usually, because a bow does the same work and never needs recharging. But I knew a ranger from Quel'Thalas once who carried a wand to light his campfires, and he swore by it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not usually, because a bow does the same work and never needs recharging. Your {pet} is staring at the wands as though they might move. Clever beast; some of them do, a little, when the enchantment's fresh." },
      },
      choices = {
        { text = "A bow is honest work. No magic needed.", next = "BACK", reply = "It is, and I'll not argue. The ranger only carried his for convenience.", fx = { align = { order = 1 } } },
        { text = "If a wand lights a fire, I'll take one.", next = "BACK", reply = "Then I've just the thing, and it'll never fail you on a wet night.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some do, though the craft is rare, and Dalaran's workshops did it best before they fell. I've a few that were blessed in the Cathedral, and they hum differently, softer, as if they're listening." } },
      choices = {
        { text = "Holy power deserves respect, Ardwyn. Handle them carefully.", next = "BACK", reply = "I handle them as gently as I can, believe me. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power. A wand doesn't care who blessed it.", next = "BACK", reply = "It doesn't, maybe, but I'd still handle a blessed one with care.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every day, though I know that's selfish when so many died there. I mourn the people too, but it's the workshops I dream of, and I'm honest enough to admit it." } },
      choices = {
        { text = "There's no shame in grieving what you loved, Ardwyn.", next = "BACK", reply = "Thank you. That's the kindest thing anyone's said to me about it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Dalaran's fall was the mages' own doing. Don't mourn it.", next = "BACK", reply = "Perhaps it was, but the workshops didn't do anything wrong. I'll mourn them anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Now, a wand will work for you, and I've a few that hum with something holy, if you'd care to listen." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I'm sorry, friend, but you'd do more with a hammer than with any wand of mine, and I'd be a poor merchant to say otherwise." },
        { id = "h_default", text = "Ardwyn Cailen. Allan sells the staves and I sell the wands, and I'll tell you plainly that since Dalaran fell, a wand made by a real enchanter is hard to find anywhere in the world." },
        { id = "h_warrior", when = { class = { "WARRIOR", "ROGUE" } }, text = "I'm sorry, friend, but a wand will do nothing in your hands except look pretty. Allan might have a staff for you, though, if you fancy one." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Then you'll appreciate a wand made properly, with a true core, and you'll know a cheap one by the way it hums." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, so you'll want a wand that can bear a shadow without cracking, and I'll admit I've only a few that can." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, at a wand stall. You'll not need any of these, but a warrior who can recognise a good wand is a warrior who can spot a dangerous mage." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Wands aren't much use to you, I'd think, though I've known a hunter or two who carried one as a curiosity." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You'll want a staff of good wood rather than a wand, but every wand here has a core of the finest timber I could find, so don't scorn them yet." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! My wands have tempers, you know, like your elements. Do yours sulk?" },
      },
      again = {
        { id = "h_again", text = "What else? I could talk about wands all day." },
        { id = "h_again2", text = "Ask me anything at all about wands; fire, frost or shadow." },
      },
      choices = {
        { text = "Show me your wands.", next = "BUSINESS" },
        { text = "Someone must make them, now Dalaran's gone.", next = "makers" },
        { text = "You must have a favourite wand.", next = "choose" },
        { text = "I'd never have thought a wand's hum could give it away.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How can a warrior tell a dangerous mage, Ardwyn?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters ever use wands, Ardwyn?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why do shadow wands crack, Ardwyn?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Can a wand carry holy power, Ardwyn?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you still grieve for Dalaran's workshops, Ardwyn?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you know where your wands' wood was grown, Ardwyn?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you miss Dalaran's workshops, Ardwyn?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
      lines = { { id = "m2_default", text = "I never went there myself, so it's the workshops' wands I miss, not the towers. That sounds cold, I know, but a merchant mourns in her own way." } },
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
    dalaran = { { id = "tp_dalaran", text = "Dalaran's wand-makers were the finest in the world, and their workshops were a wonder to see. I mourn them more than the towers, if I'm honest, because towers can be rebuilt and craftsmen can't." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor bought wands from me once, before the plague, and they were very particular about the wood. I'd like them to come back and be particular again, because I miss the challenge." } },
    shadowfang = { { id = "tp_shadowfang", text = "Archmage Arugal bought a wand from my old master, years ago, and it was never meant for summoning. I've wondered since whether it ended up in Shadowfang Keep, and I hope it's broken if it did." } },
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
    first = "She speaks softly, as though the trinkets might be listening.",
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some of them do, I swear it. Every one has a story, and a story is a little like a spirit, so I think your elements would understand." } },
      choices = {
        { text = "Then I'll speak gently around them, Charys.", next = "BACK", reply = "Thank you. They'll appreciate the courtesy, I think.", fx = { align = { order = 1 } } },
        { text = "Trinkets don't listen. Stories just sell better.", next = "BACK", reply = "They sell better, yes. But I still talk to them when the shop's empty.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Sometimes, and they usually come back on their own, because most of what I sell is cursed just enough to make a thief regret it. I've had a ring returned three times by three different people, each one swearing they'd never seen it before." },
      },
      choices = {
        { text = "I'll pay, then, and keep my hands to myself.", next = "BACK", reply = "That's wise. The ring comes back either way.", fx = { align = { honor = 1 } } },
        { text = "Cursed rings sell well in Old Town, Charys.", next = "BACK", reply = "They sell well, and they come back here a week later with a very unhappy customer. I'd not bother.", fx = { align = { honor = -1 } } },
        { text = "Something else, Charys.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A carved owl feather, a stone that's warm at night and a little silver bell nobody can make ring. A sailor swore they came from a ruin in Ashenvale, and I confess I've been afraid to sell them ever since." } },
      choices = {
        { text = "Things taken from ruins should go home. Send them to Darnassus.", next = "BACK", reply = "I've thought of it, and maybe I will. They've been very quiet lately.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They're yours now, Charys. Sell them and be rid of them.", next = "BACK", reply = "I've tried, and they keep coming back to the shelf. Maybe they want to go home.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They send their apprentices, who swear the purchases are for study, and I've sold the same lucky charm three times to the same master's three apprentices. Even the wise like a little luck, it seems, now that Dalaran's gates are closed to them." } },
      choices = {
        { text = "Luck is a crutch. I'd rather trust my training.", next = "BACK", reply = "That's what the masters say, and then they send their apprentices for charms.", fx = { align = { order = 1 } } },
        { text = "A little luck never hurt anyone, master or not.", next = "BACK", reply = "Spoken like one of my regulars. The apprentices always come back for more, whatever their masters say.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Candles that burn without smoke and chalk that doesn't smudge, which are dull things until a summoning circle breaks at the wrong moment. Anything stronger you'll have to find in the cellar under the Lamb, and I've never asked the price." } },
      choices = {
        { text = "Dull and safe suits me. Keep it that way.", next = "BACK", reply = "It will stay that way. Dull is safe, and safe is good for business.", fx = { align = { light = 1 } } },
        { text = "I'll find something stronger. Dull doesn't get results.", next = "BACK", reply = "Then you'll find it somewhere else. Not in my shop.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A pinch of a few of them, mixed by an alchemist, will steady your nerves or toughen your skin for an hour. I'd not recommend eating them raw, though one of the Barracks lads tried it and lived." } },
      choices = {
        { text = "I'll leave the reagents to the alchemists.", next = "BACK", reply = "That's wise. The last fellow who ate one raw is still talking to the walls.", fx = { align = { order = 1 } } },
        { text = "If it works, I'll try anything once.", next = "BACK", reply = "Then please try it outside. I'd rather not clean up after.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "From all over the world, from the crafters and mages here and from the hunters and gatherers who bring me what they find. A good hunter can make a fine living bringing in rare feathers and claws, if they know what to look for." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "From all over the world, from the crafters and mages here and from the hunters and gatherers who bring me what they find. Your {pet} looks healthy and strong, which is good; some of these reagents come from beasts that weren't so lucky." },
      },
      choices = {
        { text = "I'll take only what I need from the creatures I hunt.", next = "BACK", reply = "Good. The best trinkets I sell come from careful hunters; the careless ones bring me teeth with the jaw still on.", fx = { align = { honor = 1 } } },
        { text = "If it sells, I'll bring it in.", next = "BACK", reply = "Then bring them, and I'll pay you fairly. I'll ask where they came from, though.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "None that I'd sell, though I can't always tell what the previous owner did with them. I keep a few in the back that I'm waiting for someone wiser than me to look at." } },
      choices = {
        { text = "Bring them to the Cathedral. Dark things should be cleansed.", next = "BACK", reply = "I've thought of it, and maybe I will. The back room does feel heavier lately.", fx = { align = { light = 1 } } },
        { text = "A trinket is harmless until someone misuses it.", next = "BACK", reply = "Until then, yes. I'll keep them where nobody can misuse them.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Some were made with fel or shadow, long ago, and they remember the Light the way a burned hand remembers fire. I keep them because someone must, and I'd sooner they were here than in the wrong hands." } },
      choices = {
        { text = "Things like that should be destroyed, not kept.", next = "BACK", reply = "Perhaps they should, but I'm not wise enough to know how. I keep them locked.", fx = { align = { light = 1 } } },
        { text = "Better kept and watched than lost to the wrong hands.", next = "BACK", reply = "That's my thinking. Better on my shelf, where I can see them, than in some lordling's study.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Speak softly, please, for some of these trinkets were made by people who didn't like the Church very much." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I hope you won't take offence, but the trinkets on the left shelf don't like your kind, and they've started to rattle." },
        { id = "h_default", text = "Charys Yserian. I sell reagents and arcane trinkets, the small and curious leftovers of other people's spells, made by the crafters and mages here in Stormwind." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, so you'll want reagents and the kind of trinkets your masters swear they never use. I keep both, and I keep quiet about who buys which." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. I keep a few things at the back for your people, though nothing that would trouble the Watch, and I mean to keep it that way." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, among the reagents. These are the crumbs of other people's spellwork, and most of them won't help you, though a few might surprise you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I suppose you see more of the world's raw magic than I do, out in the wild where the reagents first come from." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, in my little shop. Some of these trinkets came from your side of the sea, and they've been restless since you walked in." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You walked in so quietly the chimes didn't stir. Please don't do that again; the trinkets don't like surprises." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Speak softly, please, because the trinkets are listening. Do your spirits listen too?" },
      },
      again = {
        { id = "h_again", text = "Have you another question for me, or for the curios?" },
        { id = "h_again2", text = "Ask softly, and I'll answer." },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "I'd wager you've sold some strange things.", next = "strange" },
        { text = "Your curios look to come from all over.", next = "source" },
        { text = "I doubt the Sanctum's masters buy trinkets.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I doubt a reagent could help a warrior, Charys.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Where do your reagents come from, Charys?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What sort of things do you keep at the back?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do any of your trinkets carry dark magic, Charys?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why would your trinkets react to a paladin, Charys?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What have you got that came from Kalimdor, Charys?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do your trinkets ever go missing, Charys?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do your trinkets really listen, Charys?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Charys.", next = "END" },
      },
    },
    strange = {
      lines = { { id = "s_default", text = "A mirror that showed the room as it was a day earlier, or so the mage who sold it to me swore. I sold it to a noble's steward, and he brought it back a week later without a word." } },
      choices = {
        { text = "I hope you didn't keep it.", next = "strange2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange2 = {
      lines = { { id = "s2_default", text = "I wrapped it in black cloth and carried it to Maginor Dumas at the tower, who asked no questions and paid nothing. Some things a sensible shopkeeper doesn't keep." } },
      choices = {
        { text = "Wise. Dangerous magic belongs with the mages.", next = "BACK", reply = "It does. I was very glad to see it go.", fx = { align = { order = 1 } } },
        { text = "I'd have kept it. Imagine what it could show.", next = "BACK", reply = "I imagined, and I didn't sleep for a week. Better it stays with Dumas.", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = { { id = "src_default", text = "Refugees from Lordaeron sell what they carried out, and the city's mages sell what they've grown tired of. Since Dalaran fell, there's little else, and I try to pay the refugees fairly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    dalaran = { { id = "tp_dalaran", text = "Most of the curios on my shelves came out of Dalaran before the plague, and I'll not see their like again until the city opens its gates. Each one has a story, and I'll tell it to you if you're quiet." } },
    scourge = { { id = "tp_scourge", text = "A refugee brought me a little silver bell from Lordaeron, and it rings by itself on cold nights. I've never sold it, and I never will, because I think it's waiting for someone." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "I have a little troll idol from Zul'Farrak, brought back by an explorer who wouldn't say how he got it. It's very ugly, and very old, and I keep it facing the wall." } },
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
    first = "She calls keeping her apprentice a test of faith.",
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Teaching Thurman teaches me patience, mostly. A shaman must have patience too, or the elements would never answer." } },
      choices = {
        { text = "Patience is worth teaching, Wynne. Keep at it.", next = "BACK", reply = "I will, though Thurman tests it daily. Thank you.", fx = { align = { order = 1 } } },
        { text = "Some apprentices aren't worth the trouble.", next = "BACK", reply = "Some aren't, but I don't know which until I've tried. Thurman's still a mystery.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Something warm and dark with no buttons, because buttons and dew make a poor marriage. Thurman would want to embroider stars on it, and I'd let him, because it's the only thing he sews straight." } },
      choices = {
        { text = "Keep it plain. An apprentice learns by following the pattern.", next = "BACK", reply = "That's my thinking too. Thurman will learn the pattern first.", fx = { align = { order = 1 } } },
        { text = "Let him embroider. A shop should have some joy in it.", next = "BACK", reply = "Oh, I'll let him, then. A little joy never hurt a robe.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I could, but I won't, because the last fellow who borrowed a priest's robe got as far as the Cathedral steps before a novice asked him to lead the evening prayer. The Watch still laughs about it." } },
      choices = {
        { text = "Wearing a priest's robe falsely is wrong, Wynne.", next = "BACK", reply = "It is, and the novice agreed with you. I'll not lend one.", fx = { align = { honor = 1 } } },
        { text = "A good disguise is worth a little blasphemy.", next = "BACK", reply = "A little? It was a lot, by the time the novice was done. No, I'll not lend one.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I sell to anyone with coin, and their coin spends the same as a bishop's. I'd only ask that you don't try them on in the shop, because the last one made my apprentice faint with a single word." } },
      choices = {
        { text = "I'll keep my words to myself, Wynne. Your apprentice is safe.", next = "BACK", reply = "Thank you. Thurman's been very jumpy since the last one.", fx = { align = { light = 1 } } },
        { text = "Your apprentice needs a stronger stomach, frankly.", next = "BACK", reply = "He does, but he's young. Please don't test him.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not often, but when they do, it's for a wedding or a funeral, and they want the very best. I've fitted a captain of the Barracks for his daughter's wedding, and he was more nervous than any battle could have made him." } },
      choices = {
        { text = "A warrior should look their best for the people they love.", next = "BACK", reply = "They always do, in the end. It's my favourite thing about this work, watching them stand a little taller.", fx = { align = { order = 1 } } },
        { text = "Fine clothes are wasted on a warrior.", next = "BACK", reply = "Wasted? The captain's daughter cried when she saw him. Nothing wasted there.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Once in a while, for a feast or a funeral, and they always look terribly uncomfortable in them. My apprentice says it's because hunters can't sit still in anything that doesn't rustle like leaves." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Once in a while, for a feast or a funeral, and they always look terribly uncomfortable in them. Your {pet} has better manners than my apprentice, I'll say that. At least it hasn't forgotten its sewing kit." },
      },
      choices = {
        { text = "Even a hunter can dress well when it matters.", next = "BACK", reply = "They can, and they look wonderful, if uncomfortable. I'll make it fit.", fx = { align = { order = 1 } } },
        { text = "A robe? Never. Leather suits me fine.", next = "BACK", reply = "Then you'll never need me, and that's quite all right.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Thurman's a good lad, but he's dropped three bolts of silk this week and sewed a sleeve to a hem. If patience is a virtue, I'm the most virtuous woman in the Mage Quarter." } },
      choices = {
        { text = "Patience is holy work, Wynne. He's lucky to have you.", next = "BACK", reply = "Thank you. I'll remind myself of that when he drops the next bolt.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some apprentices can't be taught. Send him home.", next = "BACK", reply = "I've thought about it, but he has a good heart. I'll keep trying.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Under the plate, sometimes, and for oath-takings at the Cathedral, which is when I sell most of them. They come in so solemn about the fit that I hardly dare make a joke." } },
      choices = {
        { text = "Ceremony matters. It reminds us what we've sworn.", next = "BACK", reply = "I'm proud to sew for it. Thank you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Ceremony is for show. The oath lives in deeds.", next = "BACK", reply = "It does, but the robe still needs to fit. I'll make it fit.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I've robes for your sort too, {class}, cut a little looser for kneeling, which you'd be surprised how few tailors think of." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in a robe shop! You'll be lost, I think, unless you're buying for someone, and you've a kind look about you." },
        { id = "h_default", text = "Wynne Larson, of Larson Clothiers. We sell robes to the Mage Quarter's scholars and the Cathedral's priests, and I keep an apprentice who forgets his sewing kit whenever he hopes for a day off." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage, so you'll want a robe that doesn't catch fire the first time you miscast. I've a few lined with something the Quarter's enchanters swear by." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in a robe shop, which is either a disguise or a mistake. If it's a disguise, I can help, but you'll have to tell me what you're pretending to be." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, and you'll want something dark and loose, so you can move your hands. My apprentice keeps those at the back, assuming he's remembered where he put them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in Larson Clothiers! You'll want a robe for under your armour, perhaps, or something nice for when you're off duty." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I'm afraid we only sell robes, but if you're ever invited to the Cathedral, you'll want something without mud on it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in a robe shop. Your people dress like moonlight, I'm told, so I'll not try to sell you anything grey." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. My apprentice Thurman is a test of faith. Do your spirits test you too?" },
      },
      again = {
        { id = "h_again", text = "Is there something else? Mind the pins on the counter, Thurman never puts them away." },
        { id = "h_again2", text = "Go on. Thurman, keep sewing, I can hear you stopping." },
      },
      choices = {
        { text = "Show me your robes.", next = "BUSINESS" },
        { text = "Tell me about your apprentice.", next = "thurman" },
        { text = "I'd expect mages to buy most of your robes.", next = "buyers" },
        { text = "Could you dress me as a priest, Wynne?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do warriors buy fine clothes, Wynne?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters ever buy robes, Wynne?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd guess the Lamb's people buy robes here too.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Is your apprentice really a test of faith, Wynne?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do paladins ever wear robes, Wynne?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would you sew for someone who sleeps under the stars, Wynne?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What is it like teaching Thurman, Wynne?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "Be firm with him, because he needs the discipline.", next = "BACK", reply = "Firm, then, and I'll hate it, but you're probably right.", fx = { align = { order = 1 } } },
        { text = "Be gentle. He'll come to it on his own.", next = "BACK", reply = "Gentle, then. That's what I'd hoped you'd say.", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "b_default", text = "Priests, mostly, because the Cathedral sends its novices out into the world in robes that weren't made for mud. After that it's mages, who buy two of everything and ruin one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    dalaran = { { id = "tp_dalaran", text = "The mages of Dalaran wore robes like no one else, and I've been trying to make their like since the city fell. I'm close, I think, though Thurman keeps sewing the sleeves on backwards." } },
    holy_light = { { id = "tp_holy_light", text = "Thurman Schneider is my apprentice, and the Light tests my faith every day through him. I pray for patience, and the Light sends me Thurman, which I suppose is an answer." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire's fortune-teller told me I'd have a fine apprentice someday. I've been waiting, and I'm still waiting, and Thurman's still sewing sleeves on backwards." } },
    background = { { id = "tp_bg", text = "The Larsons have sold robes in the Mage Quarter since it was rebuilt, and I've kept the shop since my mother passed it to me." } },
    _none = { { id = "tp_none", text = "I couldn't say. Ask me about cloth and cut, and I can." } },
  },
}
