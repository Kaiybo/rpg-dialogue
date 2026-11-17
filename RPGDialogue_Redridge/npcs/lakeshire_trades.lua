-- Lakeshire's gryphon master, fletcher and gunsmith. Voice: bibles/lakeshire_trades.md
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC = P.TODO_NPC

-- Ariena Stormfeather: Lakeshire's gryphon master.
P:NPC {
  key = "ariena", id = TODO_NPC("Ariena Stormfeather"), name = "Ariena Stormfeather", title = "Gryphon Master",
  bible = "bibles/lakeshire_trades.md", role = "flightmaster", tier = "service",
  communities = { "lakeshire" }, temper = { "brisk" }, values = { "duty", "freedom" },
  impression = {
    first = "Ariena Stormfeather keeps Lakeshire's gryphons fed and flying, and from the air she has seen more of the Blackrock smoke than anyone in town.",
    third = "{name} met Ariena Stormfeather, Lakeshire's gryphon master.",
  },
  greetings = {
    { id = "g_default", text = "Need a gryphon? They're fed, rested and only a little bad-tempered today." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Stormwind, Westfall or somewhere farther this time?" },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than the Marshal wants to hear, and more every week, camped around Stonewatch Keep and the old tower on the ridge. A warrior who knew where to strike could do more than a whole company knocking on the front gate." } },
      choices = {
        { text = "I'll tell the Marshal everything you've seen.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll strike where I please. Marshals talk too much.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Ariena.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because the Blackrock shoot at anything that flies, and they've got black dragon whelps nesting in the hills above the falls. A gryphon knows a dragon when it smells one, even a small one, and it'll turn back every time." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has my gryphons nervous, {class}, but they're nervous of everything lately, so don't take it personally." },
      },
      choices = {
        { text = "I'll clear the whelps so your birds can fly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fly higher, then. Dragons aren't my problem.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Ariena.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Impossible, friend, they hear a boot on gravel from the far end of the roost and scream about it. That's why nobody steals a gryphon in Lakeshire, though a gnoll tried once and went home short a hand." } },
      choices = {
        { text = "Smart birds. I'll pay my fare.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everything can be stolen, Ariena.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What do you see from up there?", next = "a" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Then you'll miss the best view in Redridge, which is the whole lake at sunset with the orc smoke going up on the far side. Some of us like to see what we're leaving behind, mage." } },
      choices = {
        { text = "A spell is quicker, and I keep a schedule.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take the gryphon. The view's worth it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Are the gryphons ever afraid?", next = "b" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than I've written down, because some days there wasn't time to write. The worst ones I fly myself, low and slow, and I've learned to talk to them the whole way so they stay awake." } },
      choices = {
        { text = "Then I'll tend them before they fly, so fewer are lost.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Save the flights for those who'll live. Leave the worst.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Ariena.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "No, and not because I doubt your courage, but because the Blackrock have archers on the walls and my birds won't fly low through that smoke. I'll set you down at the edge of it, and from there you'll walk, same as the Marshal's scouts." } },
      choices = {
        { text = "Fair. Your birds and your rules come first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then I'll find another way in, rules or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Ariena.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Ariena Stormfeather. I fly the mail and the wounded out of Lakeshire, and my birds carry anyone else who can pay the fare." },
        { id = "h_cond", when = { race = "Dwarf" }, text = "A dwarf! Your kin taught mine to fly these beasts, so you'll find no complaints from me about Wildhammer manners." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. My birds will carry you, and I'll tell you now, from the air I've seen the Blackrock gathering near Stonewatch, and there's a lot of them." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll know a frightened animal when you see one, and you'll understand why my gryphons won't fly low over Stonewatch." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I fly the wounded out, so I'd be grateful if you'd see to them before they go up." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. My birds will carry you, plate and all, though they'll complain the whole way." },
      },
      again = {
        { id = "h_again", text = "Anything else? The birds are getting restless." },
        { id = "h_again2", text = "Go on, ask. I've a minute before the next mail run." },
      },
      choices = {
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "What do you see from up there?", next = "a" },
        { text = "Are the gryphons ever afraid?", next = "b" },
        { text = "Gryphons must be hard to sneak up on.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I can teleport to Stormwind on my own.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How many Blackrock have you seen from the air, Ariena?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why won't your gryphons fly low over Stonewatch, Ariena?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "How many wounded have your gryphons carried out, Ariena?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you fly a paladin over Stonewatch to scout it?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Thanks, Ariena.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Smoke from the Blackrock camps in the east, mostly, and gnolls swarming the hills like fleas. Every week there's more smoke than the last." } },
      choices = {
        { text = "Does the watch listen to your reports?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "Magistrate Solomon writes them down and sends them to Stormwind, and Stormwind sends back nothing at all. I've flown the letters myself, so I know they arrive." } },
      choices = {
        { text = "The magistrate is right to keep asking. The crown will answer.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Lakeshire should stop waiting and fight for itself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Only of the black dragonkin, and only when they're flying low over the Burning Steppes border. I don't take them that way any more, whatever the fare." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned to handle gryphons in Ironforge and came south when Lakeshire needed someone who could." } },
    _none = { { id = "tp_none", text = "I can tell you the wind and the weather, friend, but not that." } },
  },
}

-- Kimberly Hiett: Lakeshire's fletcher, short on arrows for the watch.
P:NPC {
  key = "hiett", id = TODO_NPC("Kimberly Hiett"), name = "Kimberly Hiett", title = "Fletcher",
  bible = "bibles/lakeshire_trades.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "blunt" }, values = { "craft", "practical" },
  impression = {
    first = "Kimberly Hiett fletches arrows for Lakeshire's watch faster than anyone in Redridge, and still not fast enough for the gnolls.",
    third = "{name} met Kimberly Hiett, Lakeshire's overworked fletcher.",
  },
  greetings = {
    { id = "g_default", text = "Arrows, bows and quivers. Buy quick, before the watch takes the lot." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more arrows? I can't say I'm surprised, the way the hills are." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only the ones who've learned that a sword doesn't reach a gnoll on a ridge. A warrior with a short bow and a dozen arrows can thin a pack before it closes, and then the sword does the rest." } },
      choices = {
        { text = "I'll keep to the sword. Facing the foe is honest work.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take a bow. Any edge in a fight is worth it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Kimberly.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hundreds a week, and half of them stuck in trees, because the gnolls duck better than you'd think. A hunter who shoots clean and picks up after himself is worth twice as much to me as one who doesn't." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is chewing my fletching, {class}, and those are goose feathers, so get it away before it costs you." },
      },
      choices = {
        { text = "I'll recover every arrow I can. Waste helps no one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll buy more. Fetching arrows is for beggars.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kimberly.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They ask whether I've heard from the towers, and whether anyone's come back from Stonewatch, and I've no answers for them. I feather the arrows and they shoot them, and neither of us talks about who's not there to collect them." } },
      choices = {
        { text = "Then I'll go up to the watch and listen to them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Arrows are what they need, Kimberly. Talk won't help.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Kimberly.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They should spend them however keeps them alive, and I'll keep feathering till my fingers bleed. I only wish someone would take the fight to the gnoll camps, so the watch could shoot at something besides the dark." } },
      choices = {
        { text = "Then I'll take the fight to the camps myself.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The watch can hold the walls. The camps aren't my concern.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Kimberly.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Kimberly Hiett, fletcher. The watch shoots arrows into the gnolls faster than I can feather them, so if you've come to buy, you've come at a busy time." },
        { id = "h_cond", when = { class = "HUNTER" }, text = "A hunter! You'll know good fletching when you see it, so I'll not bother telling you mine's the best in Redridge. It is, though." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll not want arrows, I suppose, but if you'd tell the gnolls to stop being shot so often, I'd be grateful for the rest." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Now there's a customer, and I'll tell you before you ask: yes, I've got arrows, and no, I don't have enough." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll not want arrows, but if you'd bless the batch going up to the watch, I'll not say no." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll not want arrows either, but you'll want the watch to have them, so bless my fingers while you're here." },
      },
      again = {
        { id = "h_again", text = "What else? I've feathers to trim." },
        { id = "h_again2", text = "Ask away, friend; Lakeshire folk learn to talk while they work, and I'm no different." },
      },
      choices = {
        { text = "Show me your arrows.", next = "BUSINESS" },
        { text = "Why can't you keep up?", next = "a" },
        { text = "Who buys the most from you?", next = "b" },
        { text = "Do warriors ever buy your arrows, Kimberly?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How many arrows does the watch go through, Kimberly?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does the watch ever ask you for anything besides arrows?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does the watch spend its arrows too freely on the gnolls?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Good luck with it.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Because the goose feathers come from the farms by the lake, and the murlocs have been at the farms. No geese, no fletching, and no fletching means a lot of very angry guards." } },
      choices = {
        { text = "So what do you do?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "I've started buying feathers off anyone who'll shoot me a bird, and I don't ask too closely where the bird came from. The watch doesn't complain about the colour." } },
      choices = {
        { text = "Ask where they come from. Stolen feathers are still stolen.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "The watch needs arrows. Take what you can get.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Deputy Feldon's men, then Corporal Keeshan's lot when they're back from the hills. Keeshan pays on time, which is more than I can say for some." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've fletched in Lakeshire since I was old enough to hold a knife, and my mother did before me." } },
    _none = { { id = "tp_none", text = "Never heard of it. If it doesn't fly, I don't bother with it." } },
  },
}

-- Henry Chapal: Lakeshire's gunsmith, fond of dwarven powder.
P:NPC {
  key = "chapal", id = TODO_NPC("Henry Chapal"), name = "Henry Chapal", title = "Gunsmith",
  bible = "bibles/lakeshire_trades.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "dry" }, values = { "craft", "precision" },
  impression = {
    first = "Henry Chapal sells guns and shot in Lakeshire, measures his powder to the grain, and speaks of dwarven blackpowder the way other men speak of good ale.",
    third = "{name} met Henry Chapal, Lakeshire's precise gunsmith.",
  },
  greetings = {
    { id = "g_default", text = "Guns, shot and powder. Handle them gently; they don't forgive mistakes." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and with all your eyebrows. That's encouraging." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Plenty of dwarves do, and they're the best fighters I know, so I'll say yes. A blunderbuss to open the fight and an axe to finish it is how the Ironforge mountaineers do it, and they've not lost a pass yet." } },
      choices = {
        { text = "I'll stick to steel. A blade never misfires.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sell me a blunderbuss. I'll open every fight with it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Henry.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Rifle, every time, because a goretusk's skull will turn an arrow and it won't turn a ball of good dwarven lead. Measure your powder to the grain, mind, or you'll blow your own hand off instead of the boar's head." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} doesn't flinch at a gunshot, {class}, I can tell, and that's a well-trained beast. Most of them bolt." },
      },
      choices = {
        { text = "I'll measure every grain. Care is half of good shooting.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll pack it heavy. More powder, more punch.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Henry.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Once, and once was enough, when a barrel I'd sold burst in a hunter's hands up near Alther's Mill. He lived, and I bought back every gun in that batch, and I've measured to the grain ever since." } },
      choices = {
        { text = "You made it right, Henry. That's what counts.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Guns are dangerous. That's the buyer's lookout, not yours.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Henry.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Anyone with an honest face and the coin, but I've turned away three men this season who had neither, and one of them asked too many questions about the watch's patrol hours. A gun's a responsibility, and I'll not hand one to the wrong man." } },
      choices = {
        { text = "Good. A merchant's honour matters as much as his goods.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Coin is coin, Henry. Let them answer for its use.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Henry.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Henry Chapal, gunsmith. I keep the watch in shot and the hunters in rifles, and I've never once blown up the shop, which in my trade counts as a fine record." },
        { id = "h_cond", when = { race = "Dwarf" }, text = "A dwarf, in my shop! Your people make the finest powder in the world, and I'll argue with any human who says otherwise." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, eh? You've no use for a rifle, I'd wager, but you might have use for a pistol, if you've ever had an orc come at you from two sides." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and I'll wager you've a good rifle on your back, or you've come to buy one, and either way I'm glad to see you." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest in a gunsmith's? Well, there's powder enough here to send anyone to their maker, so maybe that's fitting." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll favour a hammer, I expect, but I've a pistol that would make an orc think twice." },
      },
      again = {
        { id = "h_again", text = "Anything else? Mind the powder kegs." },
        { id = "h_again2", text = "Go on, then, but quietly, if you would." },
      },
      choices = {
        { text = "Show me your guns.", next = "BUSINESS" },
        { text = "Where does your powder come from?", next = "a" },
        { text = "Do the guns help against the gnolls?", next = "b" },
        { text = "Should a warrior carry a gun, Henry?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Rifle or bow for the hills of Redridge, Henry?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Have your guns ever hurt someone you didn't mean them to?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you sell guns to anyone who could pay, Henry?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Good day, Henry.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Over the mountains from Ironforge, by way of Stormwind, by way of a lot of wagons that never quite arrive on time. Dwarven powder is worth the wait, mind you." } },
      choices = {
        { text = "Could you make your own?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "I could, and I'd likely take half of Lakeshire with me trying. Some things are better left to people who've done them for a thousand years." } },
      choices = {
        { text = "Wise. A craft should be learned properly first.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Nobody learns anything without risking a little.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "They help the man who's steady enough to aim, and they frighten the gnolls something awful. The noise does half the work, I'm told." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned the trade from a dwarf in Stormwind's Dwarven District, and I still owe him for the lessons." } },
    _none = { { id = "tp_none", text = "I'm afraid that's not a thing you can load or fire, so I wouldn't know." } },
  },
}
