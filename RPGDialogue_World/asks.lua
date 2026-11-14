-- "Ask anyone": what every role says when asked about their work, for a little advice, or
-- (unnamed people only) about themselves. askOnly pools answer questions and nothing else:
-- they never speak lines, and never make an unnamed NPC open the box.
-- Named NPCs answer "Their story" with their own take or a polite deflection (generic.lua),
-- never with a role's stock life story.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Pool {
  id = "ask_guard", role = "guard", askOnly = true,
  topics = {
    trade = {
      { id = "tr1", text = "Stand here. Watch that. Stop anyone who needs stopping. Most days nobody does, and those are the good days." },
      { id = "tr2", text = "I keep the peace. The peace mostly keeps itself, but somebody has to be seen doing it." },
    },
    advice = {
      { id = "ad1", text = "Don't draw steel inside the walls. Don't run from the watch. Don't make me write a report." },
      { id = "ad2", when = { band = { "Greenhorn", "Blooded" } }, text = "Stay on the roads. Everything out there's had longer to practise than you." },
      { id = "ad3", when = { timeOfDay = "night" }, text = "Find a bed before the lamps go out. Whatever's out there sees better in the dark than you do." },
    },
    background = {
      { id = "bg1", text = "Signed on because it paid and the boots were free. The boots were not good boots." },
      { id = "bg2", text = "Grew up three streets from here. Never left. Never needed to; trouble comes to me." },
    },
  },
}

P:Pool {
  id = "ask_guard_alliance", role = "guard", faction = "Alliance", askOnly = true,
  topics = {
    advice = { { id = "ad1", text = "If you're heading for the hills, tell somebody where. Saves us guessing which ravine to look in." } },
  },
}

P:Pool {
  id = "ask_guard_horde", role = "guard", faction = "Horde", askOnly = true,
  topics = {
    advice = { { id = "ad1", text = "Strength is good. Strength with a plan is better. Strength without one ends up in the healer's tent." } },
  },
}

P:Pool {
  id = "ask_innkeeper", role = "innkeeper", askOnly = true,
  topics = {
    trade = {
      { id = "tr1", text = "Beds, bowls and a fire. Everything else people bring with them: news, mud, arguments. I clean up all three." },
      { id = "tr2", text = "I listen for a living. The food's how I get paid for it." },
    },
    advice = {
      { id = "ad1", text = "Make this your home, if you like; I'll remember you. And eat before you sleep, not after." },
      { id = "ad2", text = "Never trust a stranger who buys the whole room a drink. Accept the drink. Just don't trust him." },
    },
    background = {
      { id = "bg1", text = "Inherited the place from someone who inherited it from someone. The cellar's older than the town." },
      { id = "bg2", text = "I travelled once. Then I realised the whole world comes through this door eventually, and stopped." },
    },
  },
}

P:Pool {
  id = "ask_vendor", role = "vendor", askOnly = true,
  topics = {
    trade = {
      { id = "tr1", text = "I buy cheap, sell fair, and remember who haggles. Haggle if you like. I'll remember." },
      { id = "tr2", text = "Everything on this table came a long way to get here. The price is mostly the road." },
    },
    advice = {
      { id = "ad1", text = "Sell the grey stuff before it piles up. Nobody wants to carry wolf teeth into a fight." },
      { id = "ad2", text = "Carry water and something to eat. Heroes forget. Hungry heroes don't come back." },
    },
    background = {
      { id = "bg1", text = "My family's sold from this spot for three generations. The spot hasn't moved; the town grew round it." },
      { id = "bg2", text = "Came here with a cart and a debt. Kept the cart." },
    },
  },
}

P:Pool {
  id = "ask_blacksmith", role = "blacksmith", askOnly = true,
  topics = {
    trade = {
      { id = "tr1", text = "Heat, hammer, quench, swear. Repeat until it holds an edge or I lose my temper." },
      { id = "tr2", text = "I mend what you break. You break a lot. Business is good." },
    },
    advice = {
      { id = "ad1", text = "Have your armour seen to before it falls off, not after. After costs more." },
      { id = "ad2", when = { class = { "WARRIOR", "PALADIN" } }, text = "Plate's only as good as the straps. Check the straps." },
    },
    background = {
      { id = "bg1", text = "Apprenticed at eight. Burned my hand at nine. Learned the difference between hot and very hot at ten." },
    },
  },
}

P:Pool {
  id = "ask_trainer", role = "trainer", askOnly = true,
  topics = {
    trade = {
      { id = "tr1", text = "I teach. Most of it's watching people make the same mistake I made, and saying so earlier than anyone said it to me." },
    },
    advice = {
      { id = "ad1", text = "Come back when you've learned something out there. I can only teach you what you're ready to hear." },
      { id = "ad2", text = "Practise the dull things. The dull things keep you alive." },
    },
    background = {
      { id = "bg1", text = "I was a student once, and a bad one. That's what makes me a good teacher. Ask my teacher." },
    },
  },
}

P:Pool {
  id = "ask_flightmaster", role = "flightmaster", askOnly = true,
  topics = {
    trade = {
      { id = "tr1", text = "I keep the birds fed, the saddles sound and the riders from falling off. Two out of three, most days." },
    },
    advice = {
      { id = "ad1", text = "Visit every roost you pass and say hello. Then the birds know the way home." },
      { id = "ad2", text = "Don't look down. Well. Look down. It's the best part. Just don't lean." },
    },
    background = {
      { id = "bg1", text = "Grew up mucking stalls. Got bitten by a bird and decided I liked it. Nobody understands that part." },
    },
  },
}

P:Pool {
  id = "ask_stablemaster", role = "stablemaster", askOnly = true,
  topics = {
    trade = { { id = "tr1", text = "Your companions stay with me when you can't take them along. I feed them better than you do." } },
    advice = { { id = "ad1", text = "An animal that trusts you will die for you. Don't make it." } },
    background = { { id = "bg1", text = "Animals were always easier than people. Still are. No offence." } },
  },
}

P:Pool {
  id = "ask_banker", role = "banker", askOnly = true,
  topics = {
    trade = { { id = "tr1", text = "I keep things safe. Your things, everyone's things. Safe is boring. Boring is the whole service." } },
    advice = { { id = "ad1", text = "Don't carry everything you own into a dungeon. Leave some of it with me. I'll still be here." } },
    background = { { id = "bg1", text = "I count. I've always counted. There isn't much more to tell, and I'd know." } },
  },
}

P:Pool {
  id = "ask_auctioneer", role = "auctioneer", askOnly = true,
  topics = {
    trade = { { id = "tr1", text = "Everyone thinks their thing is worth more than it is. I find out what it's worth. Usually less." } },
    advice = { { id = "ad1", text = "Buy when everyone's selling. Sell when everyone's buying. Nobody listens, which is how I stay in work." } },
    background = { { id = "bg1", text = "Started out selling my own things. Ran out of things. Started selling other people's." } },
  },
}

P:Pool {
  id = "ask_child", role = "child", askOnly = true,
  topics = {
    trade = {
      { id = "tr1", text = "I'm not working! I'm playing. Playing is work. Ask anyone who's tried to get me to stop." },
    },
    advice = {
      { id = "ad1", text = "Don't step on the cat. The cat remembers." },
      { id = "ad2", text = "If you're scared, sing. Monsters hate singing. That's true. Probably." },
    },
    background = {
      { id = "bg1", text = "I'm seven and a half. The half's important." },
      { id = "bg2", text = "I was born here. Everyone was born somewhere. You were born somewhere too, I bet." },
    },
  },
}

P:Pool {
  id = "ask_priest", role = "priest", askOnly = true,
  topics = {
    trade = { { id = "tr1", text = "I tend the sick, bury the dead and listen to everyone in between. The Light does the hard parts." } },
    advice = {
      { id = "ad1", text = "Be kind when it costs you nothing. Then practise when it does." },
      { id = "ad2", when = { alignment = { axis = "light", max = -20 } }, text = "Whatever you're carrying, put some of it down. It gets heavier the longer you hold it." },
    },
    background = { { id = "bg1", text = "I heard a call. It was quiet, and it didn't stop. So here I am." } },
  },
}

P:Pool {
  id = "ask_soldier", role = "soldier", askOnly = true,
  topics = {
    trade = {
      { id = "tr1", text = "Soldiering's mostly waiting, marching and digging. The fighting is the short part. It's also the part you remember." },
    },
    advice = {
      { id = "ad1", text = "Keep your boots dry and your mouth shut. Both will save your life one day." },
      { id = "ad2", text = "Never charge alone. If nobody follows you, it isn't a charge. It's a funeral." },
    },
    background = {
      { id = "bg1", text = "Joined young. Stayed because the others did. Now I'm the one the young ones stay for." },
    },
  },
}

P:Pool {
  id = "ask_militia", role = "militia", askOnly = true,
  topics = {
    trade = { { id = "tr1", text = "We're not soldiers. We're farmers with spears. That's worse, for whoever we're angry at." } },
    advice = { { id = "ad1", text = "Help the people who are still here. Kings come and go. Neighbours don't." } },
    background = { { id = "bg1", text = "Had a farm. Have a spear. Hope to have a farm again." } },
  },
}

P:Pool {
  id = "ask_worker", role = "worker", askOnly = true,
  topics = {
    trade = { { id = "tr1", text = "Lift, carry, dig, build. Somebody else gets their name on it. I get supper." } },
    advice = { { id = "ad1", text = "Lift with your legs. I mean it. I'm the warning." } },
    background = { { id = "bg1", text = "Worked since I could walk. Before that I watched." } },
  },
}

P:Pool {
  id = "ask_peon", role = "peon", askOnly = true,
  topics = {
    trade = { { id = "tr1", text = "Work work. Then more work. Then sleep, if overseer not looking." } },
    advice = { { id = "ad1", text = "Not stand under tree when chopping. Learn this one time only." } },
    background = { { id = "bg1", text = "Peon. Always peon. Is honest job. Mostly." } },
  },
}

P:Pool {
  id = "ask_farmer", role = "farmer", askOnly = true,
  topics = {
    trade = { { id = "tr1", text = "Plant it, water it, chase things off it, pray over it, pick it. Then do it again. That's farming." } },
    advice = {
      { id = "ad1", text = "Never trust a dry spring or a friendly crow." },
      { id = "ad2", when = { origin = "human_westfall_farmhand" }, text = "You know the soil. I can see it in your hands. Don't let fighting make you forget it." },
    },
    background = { { id = "bg1", text = "Born in a field, near enough. My mother was out with the harvest and wouldn't come in." } },
  },
}

P:Pool {
  id = "ask_citizen", role = "citizen", askOnly = true,
  topics = {
    trade = { { id = "tr1", text = "A bit of this, a bit of that. Whatever pays this week." } },
    advice = {
      { id = "ad1", text = "Be polite to the innkeeper and the guards. Everyone else is optional." },
    },
    background = { { id = "bg1", text = "Nothing anyone would write down. I'd like to keep it that way." } },
  },
}

P:Pool {
  id = "ask_questgiver", role = "questgiver", askOnly = true,
  topics = {
    trade = { { id = "tr1", text = "I find people who need things done and people who can do them. Today you're the second sort." } },
    advice = { { id = "ad1", text = "Read the whole job before you take it. The part at the bottom is usually the part that bites." } },
  },
}

P:Pool {
  id = "ask_noble", role = "noble", askOnly = true,
  topics = {
    trade = { { id = "tr1", text = "Trade? I have people for that. I suppose you could say my trade is having people." } },
    advice = { { id = "ad1", text = "Know who owes you, and never let them know you know." } },
    background = { { id = "bg1", text = "An old name. Older than this city's walls, if you believe my grandmother. Nobody contradicted her twice." } },
  },
}

P:Pool {
  id = "ask_scholar", role = "scholar", askOnly = true,
  topics = {
    trade = { { id = "tr1", text = "Reading, mostly. Then writing about what I read, so someone else can read it. It's a living. Barely." } },
    advice = { { id = "ad1", text = "Read whatever you find lying around. Books, letters, gravestones. The world leaves notes." } },
    background = { { id = "bg1", text = "I asked too many questions as a child. Nobody ever made me stop." } },
  },
}

P:Pool {
  id = "ask_spirithealer", role = "spirithealer", askOnly = true,
  topics = {
    trade = { { id = "tr1", text = "I stand at the edge, and send you back across it. What lies past it is not mine to tell." } },
    advice = { { id = "ad1", text = "Rest when you return. The body forgets faster than the soul, but not by much." } },
    background = { { id = "bg1", text = "I am what stands here. If there was more, I was not permitted to keep it." } },
    rumors = { { id = "ru1", text = "The dead do not gossip. They only remember." } },
  },
}
