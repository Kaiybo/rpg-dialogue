-- "Ask anyone": what every role says when asked about their work, for a little advice, or
-- (unnamed people only) about themselves. askOnly pools answer questions and nothing else:
-- they never speak lines, and never make an unnamed NPC open the box.
-- Named NPCs answer "Their story" with their own take or a polite deflection (generic.lua),
-- never with a role's stock life story.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Pool {
  id = "ask_guard", role = "guard", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "I hear a good deal standing at this post, and most of it I'd rather not have heard. Here's what I can speak to, if it helps you." },
      { id = "kn2", text = "You learn the town's business from the gate, whether you want it or not. Ask me about any of this." },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "For you I'll tell what I can, and I won't make you fill out a report first." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer what I'm paid to answer, and not a word past it." },
    },
    trade = {
      { id = "tr1", text = "Stand here, watch that, and stop anyone who needs stopping. Most days nobody does, and those are the good days." },
      { id = "tr2", text = "I keep the peace. The peace mostly keeps itself, but somebody has to be seen doing it." },
      { id = "tr_cold", when = { disposition = { max = 34 } }, text = "I stop people who need stopping, and right now I'm deciding about you." },
    },
    advice = {
      { id = "ad1", text = "Don't draw steel inside the walls, don't run from the watch, and don't make me write a report." },
      { id = "ad2", when = { band = { "Greenhorn", "Blooded" } }, text = "Stay on the roads. Everything out there's had longer to practise than you." },
      { id = "ad3", when = { timeOfDay = "night" }, text = "Find a bed before the lamps go out. Whatever's out there sees better in the dark than you do." },
      -- Faction flavour shares the top band with the lines above (faction weighs 5), so
      -- every guard's advice still varies.
      { id = "ad4", when = { faction = "Alliance" }, text = "If you're heading for the hills, tell somebody where. Saves us guessing which ravine to look in." },
      { id = "ad5", when = { faction = "Horde" }, text = "Strength is good, but strength with a plan is better. Strength without one ends up in the healer's tent." },
      { id = "ad_warm", when = { disposition = { min = 65 } }, text = "Learn the names of the guards on your road, and we'll learn yours. A guard runs faster for someone he knows." },
    },
    background = {
      { id = "bg1", text = "I signed on because it paid and the boots were free. They were not good boots." },
      { id = "bg2", text = "I grew up three streets from here and never left. Never needed to; trouble comes to me." },
    },
  },
}

P:Pool {
  id = "ask_innkeeper", role = "innkeeper", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "Everyone who sits by my fire leaves a story behind with the crumbs. These are the ones I've swept up lately." },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "You've been good company under this roof, so pull up a stool, and I'll tell you everything I've overheard." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common talk at the bar, and you'll pay for your drink like anyone else." },
    },
    trade = {
      { id = "tr1", text = "Beds, bowls and a fire. Everything else people bring with them: news, mud, arguments. I clean up all three." },
      { id = "tr2", text = "I listen for a living. The food's how I get paid for it." },
    },
    advice = {
      { id = "ad1", text = "Make this your home, if you like; I'll remember you. And eat before you sleep, not after." },
      { id = "ad2", text = "Never trust a stranger who buys the whole room a drink. Accept the drink, mind; just don't trust him." },
      { id = "ad_cold", when = { disposition = { max = 34 } }, text = "Pay up front, keep your boots off the table, and don't start anything you can't finish outside." },
    },
    background = {
      { id = "bg1", text = "I inherited the place from someone who inherited it from someone, and the cellar's older than the town." },
      { id = "bg2", text = "I travelled once. Then I realised the whole world comes through this door eventually, so I stopped." },
      { id = "bg_warm", when = { disposition = { min = 65 } }, text = "Since you ask kindly: I meant to stay one winter, and the winter's lasted twenty years. I don't regret a night of it." },
    },
  },
}

P:Pool {
  id = "ask_vendor", role = "vendor", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "News travels with the goods, and I unpack both. Here's what came in with the last load." },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "You're a good customer, so I'll throw this in for nothing: everything I've heard across this table." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "Talk costs nothing, which is exactly what I'll spend on it. Ask about one of these, and then buy something." },
    },
    trade = {
      { id = "tr1", text = "I buy cheap, sell fair, and remember who haggles. Haggle if you like, but I'll remember." },
      { id = "tr2", text = "Everything on this table came a long way to get here. The price is mostly the road." },
      { id = "tr_warm", when = { disposition = { min = 65 } }, text = "For you, I'd haggle against myself, if I didn't have mouths at home to feed. Take your time and look properly." },
      { id = "tr_cold", when = { disposition = { max = 34 } }, text = "I sell to anyone with coin. I don't have to smile while I do it, though." },
    },
    advice = {
      { id = "ad1", text = "Sell the grey stuff before it piles up. Nobody wants to carry wolf teeth into a fight." },
      { id = "ad2", text = "Carry water and something to eat. Heroes forget, and hungry heroes don't come back." },
    },
    background = {
      { id = "bg1", text = "My family's sold from this spot for three generations. The spot hasn't moved; the town grew round it." },
      { id = "bg2", text = "I came here with a cart and a debt, and I kept the cart." },
    },
  },
}

P:Pool {
  id = "ask_blacksmith", role = "blacksmith", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "Folk talk while they wait on a repair, and the hammer doesn't drown out all of it. Here's what I've caught." },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "Sit by the forge a minute while I tell you what I've heard; you've earned a bit of warmth." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "I've no time for gossip, but I'll answer one or two of these while the iron heats." },
    },
    trade = {
      { id = "tr1", text = "Heat, hammer, quench, swear, and repeat until it holds an edge or I lose my temper." },
      { id = "tr2", text = "I mend what you break, and you break a lot, so business is good." },
    },
    advice = {
      { id = "ad1", text = "Have your armour seen to before it falls off, not after, because after costs more." },
      { id = "ad2", when = { class = { "WARRIOR", "PALADIN" } }, text = "Plate's only as good as the straps, so check the straps." },
      { id = "ad_warm", when = { disposition = { min = 65 } }, text = "Bring me anything that rattles, before it breaks, and I'll look at it first, ahead of the queue. Don't tell the queue." },
    },
    background = {
      { id = "bg1", text = "Apprenticed at eight, burned my hand at nine, and learned the difference between hot and very hot at ten." },
    },
  },
}

P:Pool {
  id = "ask_trainer", role = "trainer", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "A teacher hears more than lessons, since students talk when they think I've stopped listening. Here's what I can speak to." },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "You've been a good student, and good students get the long answers." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "Learn your lessons first, and then I might have patience for questions; a few of these, at most." },
    },
    trade = {
      { id = "tr1", text = "I teach. Most of it's watching people make the same mistake I made, and saying so earlier than anyone said it to me." },
    },
    advice = {
      { id = "ad1", text = "Come back when you've learned something out there. I can only teach you what you're ready to hear." },
      { id = "ad2", text = "Practise the dull things, because the dull things keep you alive." },
      { id = "ad_warm", when = { disposition = { min = 65 } }, text = "You've come further than most I've taught. Now teach someone else what you know; it's the fastest way to find out what you don't." },
    },
    background = {
      { id = "bg1", text = "I was a student once, and a bad one, which is what makes me a good teacher. Ask my teacher." },
    },
  },
}

P:Pool {
  id = "ask_flightmaster", role = "flightmaster", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "Riders come in from every corner with news blown into their ears. Here's what's come through my roost lately." },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "You fly with me often enough that you've earned the gossip from the high roads, so here it is." },
    },
    trade = {
      { id = "tr1", text = "I keep the birds fed, the saddles sound and the riders from falling off. Two out of three, most days." },
    },
    advice = {
      { id = "ad1", text = "Visit every roost you pass and say hello, and then the birds know the way home." },
      { id = "ad2", text = "Don't look down. Well, no, do look down, it's the best part; just don't lean." },
    },
    background = {
      { id = "bg1", text = "I grew up mucking stalls, got bitten by a bird and decided I liked it. Nobody understands that part." },
    },
  },
}

P:Pool {
  id = "ask_stablemaster", role = "stablemaster", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "The animals don't talk, but their owners never stop. This is what I've heard over the feed troughs." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "Ask quickly, since I've hungry mouths waiting and yours isn't one of them." },
    },
    trade = { { id = "tr1", text = "Your companions stay with me when you can't take them along. I feed them better than you do." } },
    advice = { { id = "ad1", text = "An animal that trusts you will die for you, so don't make it." } },
    background = { { id = "bg1", text = "Animals were always easier than people, and they still are. No offence." } },
  },
}

P:Pool {
  id = "ask_banker", role = "banker", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "Clients talk while I count, and I count slowly when the talk is worth it. Here is what I'm free to share." },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "You keep your accounts in good order, so I'll extend you a little credit of the conversational kind." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "Discretion is the whole job, so you'll get only what is already public record." },
    },
    trade = {
      { id = "tr1", text = "I keep things safe, your things and everyone's things. Safe is boring, and boring is the whole service." },
      { id = "tr_cold", when = { disposition = { max = 34 } }, text = "I keep things safe for people I trust, and for everyone else I keep them safe anyway, but I keep a closer eye." },
    },
    advice = { { id = "ad1", text = "Don't carry everything you own into a dungeon. Leave some of it with me; I'll still be here." } },
    background = { { id = "bg1", text = "I count, and I've always counted. There isn't much more to tell, and I'd know." } },
  },
}

P:Pool {
  id = "ask_auctioneer", role = "auctioneer", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "Everything that comes up for sale arrives with a story, and I hear them all while I price the goods. These are going cheap." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common knowledge, since that's the one thing in this house that doesn't sell." },
    },
    trade = { { id = "tr1", text = "Everyone thinks their thing is worth more than it is, and I find out what it's worth, which is usually less." } },
    advice = { { id = "ad1", text = "Buy when everyone's selling and sell when everyone's buying. Nobody listens, which is how I stay in work." } },
    background = { { id = "bg1", text = "I started out selling my own things, ran out of things, and started selling other people's." } },
  },
}

P:Pool {
  id = "ask_child", role = "child", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "I know lots of things, because grown-ups talk over my head like I'm not even there. You can ask me about these!" },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "You're my favourite adventurer, so I'll tell you all of it, even the secret bits." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "Mama says I shouldn't talk to you, but I'll tell you these if you promise to go away after." },
    },
    trade = {
      { id = "tr1", text = "I'm not working, I'm playing! Playing is work, though, ask anyone who's tried to get me to stop." },
    },
    advice = {
      { id = "ad1", text = "Don't step on the cat, because the cat remembers." },
      { id = "ad2", text = "If you're scared, sing, because monsters hate singing, and that's true, probably." },
    },
    background = {
      { id = "bg1", text = "I'm seven and a half, and the half's important." },
      { id = "bg2", text = "I was born here, and everyone was born somewhere, so you were born somewhere too, I bet." },
      { id = "bg_warm", when = { disposition = { min = 65 } }, text = "When I grow up I'm going to be an adventurer like you, {g:mister|miss}, only with a bigger sword and a dog." },
    },
  },
}

P:Pool {
  id = "ask_priest", role = "priest", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "Confessions stay with me, but much else is said in the pews, and some of it may help you. Ask, and I'll answer as honestly as I can." },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "You've a kind heart, and I'd trust you with more than most, so sit, and ask whatever you need." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer you as I'd answer anyone, though I'll pray for you afterwards whether you want it or not." },
    },
    trade = { { id = "tr1", text = "I tend the sick, bury the dead and listen to everyone in between. The Light does the hard parts." } },
    advice = {
      { id = "ad1", text = "Be kind when it costs you nothing, and then practise when it does." },
      { id = "ad2", when = { alignment = { axis = "light", max = -20 } }, text = "Whatever you're carrying, put some of it down. It gets heavier the longer you hold it." },
    },
    background = {
      { id = "bg1", text = "I heard a call. It was quiet, and it didn't stop, so here I am." },
      { id = "bg_warm", when = { disposition = { min = 65 } }, text = "I nearly didn't answer the call, you know. I was afraid I wasn't good enough, and I still am, most mornings. It helps to say so." },
    },
  },
}

P:Pool {
  id = "ask_soldier", role = "soldier", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "Soldiers gossip worse than fishwives, especially on a long march. Here's what's been going round the camp." },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "You've stood with us, so you'll get the barracks talk and not the parade-ground version." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's in the orders, and that's all you'll get from me." },
    },
    trade = {
      { id = "tr1", text = "Soldiering's mostly waiting, marching and digging. The fighting is the short part, but it's the part you remember." },
    },
    advice = {
      { id = "ad1", text = "Keep your boots dry and your mouth shut. Both will save your life one day." },
      { id = "ad2", text = "Never charge alone. If nobody follows you, it isn't a charge, it's a funeral." },
      { id = "ad_cold", when = { disposition = { max = 34 } }, text = "Stay out from under my feet when the fighting starts, and we'll both live longer." },
    },
    background = {
      { id = "bg1", text = "I joined young and stayed because the others did. Now I'm the one the young ones stay for." },
      { id = "bg_warm", when = { disposition = { min = 65 } }, text = "I had a brother in the same company, once. I don't talk about him much, but you've the same way of standing, and it made me think of him." },
    },
  },
}

P:Pool {
  id = "ask_militia", role = "militia", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "We're stuck out here with nothing but rumours and spears, and I've plenty of the first. Ask about any of this." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer, since the captain says we're to be civil, but nobody said I had to like it." },
    },
    trade = { { id = "tr1", text = "We're not soldiers, we're farmers with spears, and that's worse for whoever we're angry at." } },
    advice = { { id = "ad1", text = "Help the people who are still here. Kings come and go, but neighbours don't." } },
    background = { { id = "bg1", text = "I had a farm, and now I have a spear, and I hope to have a farm again." } },
  },
}

P:Pool {
  id = "ask_worker", role = "worker", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "You hear a fair bit when nobody thinks the one carrying the stones is listening. Here's what I've picked up." },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "You've not once looked through me like I'm a wall, so I'll tell you everything I've heard on the job." },
    },
    trade = { { id = "tr1", text = "Lift, carry, dig, build. Somebody else gets their name on it, and I get supper." } },
    advice = { { id = "ad1", text = "Lift with your legs, and I mean it; I'm the warning." } },
    background = { { id = "bg1", text = "I've worked since I could walk, and before that I watched." } },
  },
}

P:Pool {
  id = "ask_peon", role = "peon", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "Peon hear many things carrying wood, because nobody watch what they say near peon. Ask about these, then let peon work." },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "You nice to peon, so peon tell you everything, even what overseer say when he think nobody listening." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "Peon tell you a little bit, but peon very busy, and you not say please." },
    },
    trade = { { id = "tr1", text = "Work work, then more work, then sleep, if overseer not looking." } },
    advice = { { id = "ad1", text = "Not stand under tree when chopping. Learn this one time only." } },
    background = {
      { id = "bg1", text = "Peon always peon, and is honest job, mostly." },
      { id = "bg_warm", when = { disposition = { min = 65 } }, text = "Peon was slave in human camp once, long time ago, and now peon work for Horde and get to keep the soup. Is better, much better." },
    },
  },
}

P:Pool {
  id = "ask_farmer", role = "farmer", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "Out in the fields you hear the news last, but you hear it proper, from folk who've walked a long way to tell it. Here's what's reached me." },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "You've a farmer's patience about you, so lean on the fence a while and I'll tell you what I know." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "I've a field to see to, so ask about one of these and let me get back to it." },
    },
    trade = { { id = "tr1", text = "Plant it, water it, chase things off it, pray over it and pick it, then do it all again. That's farming." } },
    advice = {
      { id = "ad1", text = "Never trust a dry spring or a friendly crow." },
      { id = "ad2", when = { origin = "human_westfall_farmhand" }, text = "You know the soil; I can see it in your hands. Don't let fighting make you forget it." },
    },
    background = {
      { id = "bg1", text = "Born in a field, near enough. My mother was out with the harvest and wouldn't come in." },
      { id = "bg_warm", when = { disposition = { min = 65 } }, text = "My grandmother planted the first row on this land with a stick and a prayer, and I still plant it the same way, give or take the stick." },
    },
  },
}

P:Pool {
  id = "ask_citizen", role = "citizen", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "I keep my ears open even if I keep my head down, and you'd be surprised what drifts past. Here's what I can tell you." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "I don't know you, so I'll stick to what everybody round here already knows." },
    },
    trade = { { id = "tr1", text = "A bit of this, a bit of that. Whatever pays this week." } },
    advice = {
      { id = "ad1", text = "Be polite to the innkeeper and the guards; everyone else is optional." },
    },
    background = { { id = "bg1", text = "Nothing anyone would write down. I'd like to keep it that way." } },
  },
}

P:Pool {
  id = "ask_questgiver", role = "questgiver", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "Half my work is knowing things before anyone else does. Here's what I'm willing to part with." },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "You've done good work for me, so I'll tell you the parts I usually keep for myself." },
    },
    trade = { { id = "tr1", text = "I find people who need things done and people who can do them. Today you're the second sort." } },
    advice = { { id = "ad1", text = "Read the whole job before you take it. The part at the bottom is usually the part that bites." } },
  },
}

P:Pool {
  id = "ask_noble", role = "noble", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "One hears things at table, and one is rarely asked about them by someone of your sort. I shall indulge you on these matters." },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "You've proven yourself rather useful, so I'll speak to you as I would to a friend of the house." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "I can spare a few words on these, but do try to be brief about it." },
    },
    trade = { { id = "tr1", text = "Trade? I have people for that. I suppose you could say my trade is having people." } },
    advice = {
      { id = "ad1", text = "Know who owes you, and never let them know you know." },
      { id = "ad_cold", when = { disposition = { max = 34 } }, text = "Learn your place before someone teaches it to you, and they will be less patient than I am." },
    },
    background = { { id = "bg1", text = "An old name, older than this city's walls if you believe my grandmother, and nobody contradicted her twice." } },
  },
}

P:Pool {
  id = "ask_scholar", role = "scholar", askOnly = true,
  topics = {
    knows = {
      { id = "kn1", text = "I've read about a great many things, and I've even seen one or two of them. Ask about any of these, and prepare for a long answer." },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "A curious mind, and a patient one! Pull up a chair, because I've been waiting for someone to ask me this." },
    },
    trade = { { id = "tr1", text = "Reading, mostly, and then writing about what I read so someone else can read it. It's a living, barely." } },
    advice = { { id = "ad1", text = "Read whatever you find lying around: books, letters, gravestones. The world leaves notes." } },
    background = { { id = "bg1", text = "I asked too many questions as a child. Nobody ever made me stop." } },
  },
}

P:Pool {
  id = "ask_spirithealer", role = "spirithealer", askOnly = true,
  topics = {
    trade = { { id = "tr1", text = "I stand at the edge, and send you back across it. What lies past it is not mine to tell." } },
    advice = { { id = "ad1", text = "Rest when you return. The body forgets faster than the soul, but not by much." } },
    background = { { id = "bg1", text = "I am what stands here. If there was more, I was not permitted to keep it." } },
    rumors = { { id = "ru1", text = "The dead do not gossip; they only remember." } },
  },
}
