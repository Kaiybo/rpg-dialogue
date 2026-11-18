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
      { id = "ad_warrior", when = { class = "WARRIOR" }, text = "Don't start a fight on the road just because you'd win it. Somebody has to write it up afterwards, and that's me." },
      { id = "ad_paladin", when = { class = "PALADIN" }, text = "Folk will bring you their troubles because of the armour. Listen to them, but bring the serious ones to us." },
      { id = "ad_hunter", when = { class = "HUNTER" }, text = "Keep your beast leashed near the farms. I've settled more fights over dead chickens this season than over anything else." },
      { id = "ad_rogue", when = { class = "ROGUE" }, text = "Whatever you're planning, don't plan it on my watch. I'd hate to have to remember your name." },
      { id = "ad_mage", when = { class = "MAGE" }, text = "Don't conjure fire anywhere near the haystacks. I know you think you won't, but the last one thought so too." },
      { id = "ad_warlock", when = { class = "WARLOCK" }, text = "Keep your servant out of sight in town. People see a demon and run for the guards, and then I have to run as well." },
      { id = "ad_shaman", when = { class = "SHAMAN" }, text = "If the spirits tell you there's trouble on the road, tell me first. I don't need to know how you heard." },
      { id = "ad_druid", when = { class = "DRUID" }, text = "Take your own shape before you come through the gate. We've standing orders about bears." },
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
      { id = "ad_warrior", when = { class = "WARRIOR" }, text = "Eat a proper supper before you go out. You burn through a meal faster than anyone under this roof." },
      { id = "ad_mage", when = { class = "MAGE" }, text = "Conjured bread fills you, but it's no comfort. Have a real meal now and then, cooked by somebody who likes you." },
      { id = "ad_rogue", when = { class = "ROGUE" }, text = "Settle up before you leave, and use the front door. I always notice the window." },
      { id = "ad_hunter", when = { class = "HUNTER" }, text = "Feed the beast before you sit down, or it'll stare at your plate all evening and put everyone off theirs." },
      { id = "ad_warlock", when = { class = "WARLOCK" }, text = "Keep odd hours if you must, but keep them quietly. The walls upstairs are thinner than they look." },
      { id = "ad_druid", when = { class = "DRUID" }, text = "Sleep in a proper bed now and then, not up a tree. Your back will thank you, even if the tree won't." },
      { id = "ad_shaman", when = { class = "SHAMAN" }, text = "Be polite to my hearth. It's been burning longer than I've been alive, and I like to think it notices." },
      { id = "ad_paladin", when = { class = "PALADIN" }, text = "Take the armour off at the table. You'll eat better, and so will everyone sitting near you." },
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
      { id = "ad_rogue", when = { class = "ROGUE" }, text = "Hone your blades after every fight, not before the next one. A dull dagger is just a heavy finger." },
      { id = "ad_hunter", when = { class = "HUNTER" }, text = "Keep your arrowheads dry and your gun barrel clean, and check both before you need them." },
      { id = "ad_shaman", when = { class = "SHAMAN" }, text = "Mail rusts faster than plate if you never oil it, and no totem will help you with that." },
      { id = "ad_caster", when = { class = { "MAGE", "WARLOCK" } }, text = "Cloth doesn't need a smith, but carry a decent dagger anyway. Spells run out; steel doesn't." },
      { id = "ad_druid", when = { class = "DRUID" }, text = "Leather breathes and so do you. Don't let anyone talk you into anything heavier." },
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
      { id = "ad_mage", when = { class = "MAGE" }, text = "Take the bird now and then, even when you could teleport. You'll see what you've been missing." },
      { id = "ad_hunter", when = { class = "HUNTER" }, text = "Your beast will find you at the other end of the flight, so don't fret over it." },
      { id = "ad_rogue", when = { class = "ROGUE" }, text = "Don't go poking in the saddlebags mid-flight. The bird bites, and it's a long way to fall." },
      { id = "ad_druid", when = { class = "DRUID" }, text = "Four legs are quicker than two, but wings beat both. Pay the fare and rest your paws." },
      { id = "ad_skyborne", when = { race = "Skyborne" }, text = "Don't try your glide off the back of a gryphon. Nobody's ever proved it works, and I don't want to be the one who finds out." },
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
    advice = {
      { id = "ad1", text = "An animal that trusts you will die for you, so don't make it." },
      { id = "ad_hunter", when = { class = "HUNTER" }, text = "Feed your companion what it likes, not what's cheap. It'll fight harder for a meal it loves." },
      { id = "ad_druid", when = { class = "DRUID" }, text = "You know what it is to be the animal, so you'll know never to tie one too short." },
      { id = "ad_warlock", when = { class = "WARLOCK" }, text = "Whatever you keep on that leash of yours, never bring it near an animal that trusts you." },
      { id = "ad_paladin", when = { class = "PALADIN" }, text = "A charger answers to its rider's voice, so make it a calm one, even when you aren't." },
    },
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
      { id = "ad_warrior", when = { class = "WARRIOR" }, text = "Don't hit people with your sword unless they're bad people. That's what my papa says, and he's big." },
      { id = "ad_mage", when = { class = "MAGE" }, text = "Make it snow! That's not advice, that's just what I want." },
      { id = "ad_hunter", when = { class = "HUNTER" }, text = "Give your animal a name it likes. Mine's called Biscuit, and he's a beetle." },
      { id = "ad_rogue", when = { class = "ROGUE" }, text = "If you're hiding, don't giggle. That's how my brother always finds me." },
      { id = "ad_druid", when = { class = "DRUID" }, text = "If you turn into a bear, don't eat anybody's honey, because bears always get in trouble for that." },
      { id = "ad_warlock", when = { class = "WARLOCK" }, text = "Your scary friend should say please more. Everybody likes you better if you say please." },
      { id = "ad_paladin", when = { class = "PALADIN" }, text = "Be shiny! The shiny people are always the good ones in the stories." },
      { id = "ad_shaman", when = { class = "SHAMAN" }, text = "Be nice to rocks. You can talk to rocks, can't you? I knew it." },
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
      { id = "kn1", text = "Confessions stay with me, but much else is said in the pews, and some of it may help you. Ask, and I'll answer as truthfully as the Light allows." },
      { id = "kn_warm", when = { disposition = { min = 65 } }, text = "You've a kind heart, and I'd trust you with what I keep from most of the congregation, so sit, and ask whatever you need." },
      { id = "kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer you as I'd answer anyone, though I'll pray for you afterwards whether you want it or not." },
    },
    trade = { { id = "tr1", text = "I tend the sick, bury the dead and listen to everyone in between. The Light does the heavy lifting, and I do the laundry." } },
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
      { id = "ad_warrior", when = { class = "WARRIOR" }, text = "Hold the line, and let the clever ones be clever behind you. That's what they're there for." },
      { id = "ad_paladin", when = { class = "PALADIN" }, text = "Heal the ones at the back first. The ones in front already know they're in trouble." },
      { id = "ad_hunter", when = { class = "HUNTER" }, text = "Scout ahead, and come back. Coming back's the part the young scouts forget." },
      { id = "ad_mage", when = { class = "MAGE" }, text = "Stand behind me and set fire to anything I'm not standing in. That's all I ask of a mage." },
      { id = "ad_rogue", when = { class = "ROGUE" }, text = "Find their officer before the fight starts. It's not honourable, but it makes the fight short." },
      { id = "ad_warlock", when = { class = "WARLOCK" }, text = "Point your curses at the enemy and your demon at their flank, and keep both away from my lads." },
      { id = "ad_shaman", when = { class = "SHAMAN" }, text = "Plant your totems where we can all stand near them. I've seen too many shamans heal an empty patch of grass." },
      { id = "ad_druid", when = { class = "DRUID" }, text = "Be the bear when the line breaks, and the healer when it holds. Most druids get it backwards once, and the bear gets the blame." },
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
      { id = "ad_hunter", when = { class = "HUNTER" }, text = "Keep your beast out of my turnips and you'll hear no complaint from me." },
      { id = "ad_druid", when = { class = "DRUID" }, text = "If you've the knack of making things grow, my corn could do with a word from you." },
      { id = "ad_warrior", when = { class = "WARRIOR" }, text = "If you're going to fight in a field, fight in the one that's already been harvested." },
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
      { id = "ad_rogue", when = { class = "ROGUE" }, text = "Don't do anything in this town you'd not want the guards to hear about. They hear about everything." },
      { id = "ad_hunter", when = { class = "HUNTER" }, text = "Keep your animal off the market stalls. The fishmonger has a long memory and a longer knife." },
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
    advice = {
      { id = "ad1", text = "Read whatever you find lying around: books, letters, gravestones. The world leaves notes." },
      { id = "ad_mage", when = { class = "MAGE" }, text = "Read the footnotes. The arcane hides its traps in the footnotes." },
      { id = "ad_warlock", when = { class = "WARLOCK" }, text = "Read the other side's books too, but never read them aloud." },
      { id = "ad_shaman", when = { class = "SHAMAN" }, text = "Write down what the spirits tell you, or nobody will ever believe you." },
      { id = "ad_druid", when = { class = "DRUID" }, text = "The Circle keeps very few books, so whatever you learn in the wild, someone ought to write it down." },
    },
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

---------------------------------------------------------------------------
-- 0.78.0: everyone's take on the big subjects of the world (topics.lua, 0.78.0 block).
-- These pools sit beside the role pools above. `faction` in a line's `when` is the
-- player's faction, and since the hostile side's guards and innkeepers won't talk to you,
-- that is near enough the speaker's side too. Goblin towns get their own Cartel takes
-- further down (community pools win over role pools), so a Booty Bay bruiser doesn't
-- talk like a Stormwind watchman.
---------------------------------------------------------------------------
P:Pool {
  id = "ask_guard_world", role = "guard", askOnly = true,
  topics = {
    scourge = {
      { id = "w_scourge_a", when = { faction = "Alliance" }, text = "Walking dead by the thousand, and they took all of Lordaeron in a single season. We look hard at every refugee who comes up the road from the north, and harder at what they're carrying." },
      { id = "w_scourge_h", when = { faction = "Horde" }, text = "Corpses that walk and never tire, and they've filled the north of the old human kingdom. The Forsaken fight them in the Plaguelands, and the rest of us keep an eye on our own graves." },
    },
    forsaken = {
      { id = "w_forsaken_a", when = { faction = "Alliance" }, text = "The dead of Lordaeron who woke with their own minds back, or so they claim. They've sided with the Horde and they're squatting in the old capital, so you can draw your own conclusions." },
      { id = "w_forsaken_h", when = { faction = "Horde" }, text = "They're dead, they smell like it, and they're on our side, for now. The Warchief took them in, and I won't argue with the Warchief, though I do stand upwind of them." },
      { id = "w_forsaken_ud", when = { faction = "Horde", race = "Scourge" }, text = "You'd know better than I would, wouldn't you? I've no quarrel with you, so long as you keep your plagues on your own side of the sea." },
    },
    thrall = {
      { id = "w_thrall_a", when = { faction = "Alliance" }, text = "The orc who broke out of Durnholde and emptied every camp in Lordaeron behind him. They say he wants peace now, but he wanted out of the camps too, and he got that with an axe." },
      { id = "w_thrall_h", when = { faction = "Horde" }, text = "Our Warchief, who broke our chains and brought us across the sea to a land of our own. Say his name with respect inside these walls, or don't say it at all." },
    },
    sylvanas = {
      { id = "w_sylvanas_a", when = { faction = "Alliance" }, text = "She was Ranger-General of Quel'Thalas before Arthas cut her down, and now she's queen of the walking dead under the ruins of Lordaeron. Whatever she is these days, I'd not turn my back on her." },
      { id = "w_sylvanas_h", when = { faction = "Horde" }, text = "The Dark Lady rules the Forsaken from beneath the old human capital. I can't tell you whose friend she is, but she hates the Scourge more than we do, and that's enough for the Warchief." },
    },
    bolvar = {
      { id = "w_bolvar_a", when = { faction = "Alliance" }, text = "Highlord Fordragon holds the throne as regent while the king's away, and the watch answers to him in the end. He's a hard man and a fair one, and he's had a rotten few years of it." },
      { id = "w_bolvar_h", when = { faction = "Horde" }, text = "The paladin who keeps Stormwind's throne warm for their boy king. Our scouts say he's no fool, which is a pity." },
    },
    varian = {
      { id = "w_varian_a", when = { faction = "Alliance" }, text = "The king sailed for Theramore and never arrived, and that's all anyone at my rank knows. I'd keep your voice down asking about it, because the Keep doesn't like the question." },
      { id = "w_varian_h", when = { faction = "Horde" }, text = "The humans lost their king at sea, so the story goes, and they've put a boy on the throne in his place. That suits us well enough." },
    },
    jaina = {
      { id = "w_jaina_a", when = { faction = "Alliance" }, text = "Lady Proudmoore holds Theramore out in the marsh, right on the Horde's doorstep. She fought beside orcs at Hyjal, they say, and there are men in the Keep who haven't forgiven her for it." },
      { id = "w_jaina_h", when = { faction = "Horde" }, text = "The human sorceress at Theramore, who stood with the Warchief against the demons. She keeps her people off our throats, mostly, and the Warchief keeps his word to her, so we leave her be." },
    },
    onyxia = {
      { id = "w_onyxia", text = "A black dragon with a lair in Dustwallow Marsh, so I hear, though the soldiers who've been near it won't say much. I'd want a great many friends before I went knocking at that door." },
    },
    second_war = {
      { id = "w_secondwar_a", when = { faction = "Alliance" }, text = "My father fought in it, from the Hinterlands to Blackrock, and he never once talked about it at supper. We won, and then we built the camps, and I'm not sure we've finished paying for either." },
      { id = "w_secondwar_h", when = { faction = "Horde" }, text = "The war the old Horde lost, back when the warlocks still had their hooks in us. The young ones boast about it, but the old ones who were there mostly don't." },
    },
    internment = {
      { id = "w_intern_a", when = { faction = "Alliance" }, text = "After the Second War we penned the orcs up across Lordaeron, and the camps cost the kingdoms a fortune to keep. When Thrall came they emptied in a season, and the Alliance has been arguing over the bill ever since." },
      { id = "w_intern_h", when = { faction = "Horde" }, text = "Human pens where they kept our people after the war, until the fight went out of them. Ask any grunt over thirty to show you his wrists, and then don't ask anything else." },
    },
    stratholme = {
      { id = "w_strat_a", when = { faction = "Alliance" }, text = "Prince Arthas put the whole city to the sword before the plague could turn it, or so the survivors say, and it's been a Scourge nest ever since. I've met men who were there, and none of them sleep well." },
      { id = "w_strat_h", when = { faction = "Horde" }, text = "A dead city in the east of Lordaeron, full of the Scourge and the madmen of the Scarlet Crusade. The humans did that to themselves, and we're welcome to none of it." },
    },
    kelthuzad = {
      { id = "w_kelthuzad", text = "A necromancer out of Dalaran who started the whole plague, and they say he came back from the grave to command it. Folk whisper that he keeps a fortress floating over the Plaguelands, though I've never met anyone who's seen it and come home." },
    },
    centaur = {
      { id = "w_centaur_a", when = { faction = "Alliance" }, text = "Raiders out of Desolace and the Barrens, who hit fast and don't bother with prisoners. Our lads at Nijel's Point say you hear the hooves long before you see them." },
      { id = "w_centaur_h", when = { faction = "Horde" }, text = "The Kolkar raid the Barrens caravans and ride off before anyone can answer them. Every grunt at the Crossroads has a centaur story, and none of them end well for the centaur." },
    },
    quilboar = {
      { id = "w_quilboar_a", when = { faction = "Alliance" }, text = "Pig-men in the Barrens who build their forts out of thorns. I'm glad they're the Horde's neighbours and not ours." },
      { id = "w_quilboar_h", when = { faction = "Horde" }, text = "The Razormane harry the Barrens from their bramble forts, and they've been testing the Crossroads walls all season. Bring a good axe, because the thorns ruin a bad one." },
    },
    booty_bay = {
      { id = "w_bootybay", text = "Goblin port at the bottom of Stranglethorn, where the Cartel's bruisers keep the peace and anyone can buy anything. Draw steel there and they'll throw you to the sharks, and the goblins will sell tickets." },
    },
    gadgetzan = {
      { id = "w_gadgetzan", text = "A goblin town in the Tanaris sands, with walls, water and bruisers who don't care what colours you fly. It's the one place in that desert where nobody tries to kill you, unless you start it." },
    },
    darkmoon_faire = {
      { id = "w_faire", text = "Tents, games and folk who are a deal too cheerful, and it moves on before anyone can work out where the money went. We double the patrols whenever it's in the country." },
    },
    ravenholdt = {
      { id = "w_ravenholdt", text = "A manor in the Alterac hills, if you believe the tavern talk, where the best cutthroats in the world keep house. I've never been asked to find it, and I'd like to keep it that way." },
    },
    magni = {
      { id = "w_magni_a", when = { faction = "Alliance" }, text = "The King under the Mountain, and he's the Alliance's oldest friend. If the dwarves ever stop sending rifles and ale south, we'll know the world has really ended." },
      { id = "w_magni_h", when = { faction = "Horde" }, text = "The dwarf king in Ironforge, who's sent more guns against us than any human ever has. A stubborn old badger, and I mean that with some respect." },
    },
    cairne = {
      { id = "w_cairne_a", when = { faction = "Alliance" }, text = "The great bull who leads the tauren, and they say he's as wise as he is old. If the Horde has a cooler head than Thrall's, it's his." },
      { id = "w_cairne_h", when = { faction = "Horde" }, text = "The High Chieftain of the tauren, and the oldest warrior I've ever seen still swing a weapon. When Cairne speaks in council, even the orcs shut up and listen." },
    },
  },
}

P:Pool {
  id = "ask_innkeeper_world", role = "innkeeper", askOnly = true,
  topics = {
    booty_bay = {
      { id = "w_bootybay", text = "The Salty Sailor's the best-known tavern in the world, and the worst-behaved, and every sailor who stops here has a story about it. Go once, keep your purse in your boot and don't play cards with anyone who smiles." },
    },
    gadgetzan = {
      { id = "w_gadgetzan", text = "Tanaris is all sand and thirst, and Gadgetzan's the only well worth the walk. The goblins there charge for the water and the shade, and I hear they're thinking of charging for the air next." },
    },
    ratchet = {
      { id = "w_ratchet", text = "A goblin port on the Barrens coast with a boat to Booty Bay and no questions asked about where you're from. The inn there's full of sailors, and the sailors are full of rumours." },
    },
    everlook = {
      { id = "w_everlook", text = "The goblins built a town in the snows of Winterspring, of all places, and the innkeeper there must be the richest in Kalimdor, given what a hot meal costs. I'd go for the view and bring my own supper." },
    },
    darkmoon_faire = {
      { id = "w_faire", text = "When the Faire's in the country, my beds fill a week before and empty a week after, so I'm fond of it. Their tickets are cheap and their games are crooked, and nobody seems to mind either." },
    },
    gurubashi_arena = {
      { id = "w_arena", text = "An old troll arena in the middle of Stranglethorn where anybody can fight anybody, and every so often they throw a chest in the middle to make it interesting. My customers come back from there with fewer teeth and better stories." },
    },
    varian = {
      { id = "w_varian_a", when = { faction = "Alliance" }, text = "Every traveller who sits at my bar has a theory about the king, and I've heard that he drowned, that he was taken, and that he's living as a fisherman somewhere. I serve them all the same ale, and I don't believe any of them." },
      { id = "w_varian_h", when = { faction = "Horde" }, text = "The human king vanished at sea, and the humans are making a great fuss about it. My customers have wagers on whether he's dead, though nobody's yet been able to collect." },
    },
    prestor = {
      { id = "w_prestor_a", when = { faction = "Alliance" }, text = "A noblewoman from Alterac who turned up at court with everyone's ear before anyone knew her name. The Keep's servants drink here, and they don't say a word against her, which says something on its own." },
    },
    thrall = {
      { id = "w_thrall_a", when = { faction = "Alliance" }, text = "An orc who talks of peace and builds a city full of axes, so he's either very wise or very clever, and I'd hate to find out which one across a table." },
      { id = "w_thrall_h", when = { faction = "Horde" }, text = "The Warchief's welcome at any fire in the Horde, and he'd pay for his own drink, which is more than I can say of some of his captains." },
    },
    jaina = {
      { id = "w_jaina_a", when = { faction = "Alliance" }, text = "Theramore's own lady, and they say she's barely older than my eldest. Her sailors come through now and then, and they'd follow her into the sea if she asked." },
      { id = "w_jaina_h", when = { faction = "Horde" }, text = "The human mage at Theramore keeps the peace with the Warchief, and travellers say she's an honest sort, for a human. I'd still not stop at her docks wearing red." },
    },
    theramore = {
      { id = "w_theramore_a", when = { faction = "Alliance" }, text = "A stone harbour in the Dustwallow Marsh, built by the people who came west with Lady Proudmoore. It rains every day, I'm told, and the ale's watered, but the walls are good." },
      { id = "w_theramore_h", when = { faction = "Horde" }, text = "The humans' fortress in the marsh, sitting a few days' march from Orgrimmar. We keep a truce with them, and every innkeeper in Durotar hopes it lasts." },
    },
    onyxia = {
      { id = "w_onyxia", text = "There's a dragon's lair in the Dustwallow, and I've had more than one boastful patron leave my inn to go and look for it. Only the quiet ones ever came back to pay their tab." },
    },
    scourge = {
      { id = "w_scourge_a", when = { faction = "Alliance" }, text = "I've had refugees from Lordaeron sleeping on my floor, and they don't talk about what drove them out. They don't have to; you only need to watch them jump when the door bangs." },
      { id = "w_scourge_h", when = { faction = "Horde" }, text = "The plague-dead hold the north of the Eastern Kingdoms, and every soldier back from there asks for a strong drink and the seat by the wall. I give them both and don't ask questions." },
    },
    dalaran = {
      { id = "w_dalaran", text = "The city of mages, behind a big purple dome in the Alterac foothills these days. They don't need inns in Dalaran, I suppose, when they can conjure their own supper." },
    },
    ravenholdt = {
      { id = "w_ravenholdt", text = "There's an old manor in the Alterac hills that you don't find unless they want you to, or so I've heard from people who drink in the corner and pay in exact coin. I don't ask their names, and they leave good tips." },
    },
  },
}

P:Pool {
  id = "ask_citizen_world", role = "citizen", askOnly = true,
  topics = {
    scourge = {
      { id = "w_scourge_a", when = { faction = "Alliance" }, text = "My cousin's whole village in Lordaeron went in a week, and the dead ones came back up walking. I pray for them every night, and I pray the plague stays north of the Thandol Span." },
      { id = "w_scourge_h", when = { faction = "Horde" }, text = "The walking dead, and the plague that makes them. I hear the Forsaken are fighting them, which is good, because I'd rather they fought them than us." },
    },
    forsaken = {
      { id = "w_forsaken_a", when = { faction = "Alliance" }, text = "Lordaeron's dead who turned against their master and joined the Horde, if you believe it. My mother says they were people once, and I say that's exactly what frightens me." },
      { id = "w_forsaken_h", when = { faction = "Horde" }, text = "The dead who walk with the Horde, and they keep their own counsel under the ruins of Lordaeron. They're polite enough when you meet them, but they never seem to blink." },
    },
    thrall = {
      { id = "w_thrall_a", when = { faction = "Alliance" }, text = "The orc warchief, the one who got out of the camps. My father guarded one of those camps, and he says he always knew one of them would get out someday." },
      { id = "w_thrall_h", when = { faction = "Horde" }, text = "Thrall freed our people and gave us Durotar, and he's never once asked anyone to bow. That's a warchief worth following." },
    },
    sylvanas = {
      { id = "w_sylvanas_a", when = { faction = "Alliance" }, text = "The Banshee Queen, they call her, and that's all I want to know about her. I'd sooner not know where she sleeps, if she sleeps." },
      { id = "w_sylvanas_h", when = { faction = "Horde" }, text = "She leads the Forsaken, and they'd do anything for her, which is either loyalty or something colder. I keep my thoughts on her to myself." },
    },
    varian = {
      { id = "w_varian_a", when = { faction = "Alliance" }, text = "He sailed off and never came home, and the town hasn't been right since. My grandmother lights a candle for him in her window every night, just in case he's looking for the way." },
      { id = "w_varian_h", when = { faction = "Horde" }, text = "The humans lost their king somewhere at sea, they say. It's a sad thing for them, I suppose, if you're the sort to feel sorry for humans." },
    },
    bolvar = {
      { id = "w_bolvar_a", when = { faction = "Alliance" }, text = "The Highlord runs the kingdom for the boy, and he does it honest, from what I hear. I wish he'd do something about the taxes, though." },
    },
    prestor = {
      { id = "w_prestor_a", when = { faction = "Alliance" }, text = "A grand lady at court who has the regent's ear and everybody's attention, and she's very pretty, they say. I don't know where her money comes from, and nobody who knows will tell me." },
    },
    cairne = {
      { id = "w_cairne_h", when = { faction = "Horde" }, text = "The tauren's High Chieftain, as old as the hills of Mulgore and twice as steady. When the Warchief needs good counsel, it's Cairne he goes to." },
    },
    voljin = {
      { id = "w_voljin_h", when = { faction = "Horde" }, text = "The Darkspear chieftain, who brought his trolls over the sea with Thrall and swore to him. They say he sees things in the smoke, and I'd believe it of him." },
    },
    jaina = {
      { id = "w_jaina_a", when = { faction = "Alliance" }, text = "The admiral's daughter, who runs Theramore now and is a great sorceress besides. Some folk call her a traitor for dealing with the orcs, but nobody calls her that to her face." },
      { id = "w_jaina_h", when = { faction = "Horde" }, text = "The human mage who keeps the peace with the Warchief. Her father hated orcs, I hear, and it didn't end well for him." },
    },
    darkmoon_faire = {
      { id = "w_faire", text = "The Faire! I won a little wooden horse there once, and it cost me a month's wages in tickets. I'd do it again tomorrow, mind." },
    },
    booty_bay = {
      { id = "w_bootybay", text = "Goblins and pirates and sharks under the docks, and I've never been and never will. My nephew went once and came back with a parrot and no shoes." },
    },
    lordaeron = {
      { id = "w_lordaeron_a", when = { faction = "Alliance" }, text = "The greatest kingdom of men, and it fell inside a year. The refugees still come down the roads with everything they own in one sack." },
      { id = "w_lordaeron_h", when = { faction = "Horde" }, text = "The human kingdom that held our people in its camps, and now it's a land of graves. I can't bring myself to mourn it." },
    },
  },
}

P:Pool {
  id = "ask_soldier_world", role = "soldier", askOnly = true,
  topics = {
    second_war = {
      { id = "w_secondwar_a", when = { faction = "Alliance" }, text = "The old sergeants still tell it the same way: the Horde came up through Khaz Modan with dragons in front and fire behind, and we held at the Thandol Span until we didn't. We won in the end, but we buried more than half the men who marched." },
      { id = "w_secondwar_h", when = { faction = "Horde" }, text = "The Horde was a weapon then, pointed by warlocks and fed on demon blood. We fought like madmen and lost like madmen, and the ones who lived woke up in human cages." },
    },
    internment = {
      { id = "w_intern_a", when = { faction = "Alliance" }, text = "I did a year on the walls at one of the camps, and the orcs inside barely lifted their heads. It was the dullest posting in Lordaeron, right up until the day it wasn't." },
      { id = "w_intern_h", when = { faction = "Horde" }, text = "We sat in the dirt behind human walls for years, too sick with the lethargy to care. Thrall woke us, and I'll fight for him until there's no fight left in me." },
    },
    scourge = {
      { id = "w_scourge_a", when = { faction = "Alliance" }, text = "You can't scare them, you can't starve them and you can't wait them out, and every man you lose stands up and joins them. Aim for the head and burn what's left, and don't let a friend lie where he falls." },
      { id = "w_scourge_h", when = { faction = "Horde" }, text = "They don't bleed and they don't break, and that's no kind of enemy for a warrior. Fire works, and so does a big enough axe." },
    },
    kelthuzad = {
      { id = "w_kelthuzad", text = "The necromancer who commands the Scourge from somewhere over the Plaguelands, and the Argent Dawn wants his head more than anything. I've heard he was a man of Dalaran once, and that he died, and that dying didn't stop him." },
    },
    stratholme = {
      { id = "w_strat_a", when = { faction = "Alliance" }, text = "I knew a sergeant who was at the gates the day the prince purged it, and he left the army that same winter. Now the place is full of the dead and the Scarlets, and neither of them want visitors." },
      { id = "w_strat_h", when = { faction = "Horde" }, text = "A human city gone rotten, with the Scourge in one half and the Scarlet zealots in the other. If you go in, take friends, and leave by the same gate you came in." },
    },
    lordaeron = {
      { id = "w_lordaeron_a", when = { faction = "Alliance" }, text = "We lost a kingdom in a season, and the king with it, by his own son's hand. Every soldier in the Alliance knows the story, and not one of them has stopped wondering what he'd have done in the prince's boots." },
      { id = "w_lordaeron_h", when = { faction = "Horde" }, text = "The humans' great kingdom, and its fields are full of plague and graves now. The Forsaken claim what's left of it, and they're welcome to the place." },
    },
    arthas = {
      { id = "w_arthas_a", when = { faction = "Alliance" }, text = "Prince Arthas came home from Northrend a hero, and then he killed his father on the throne. Nobody knows where he went after that, and I'd sooner not be the one who finds out." },
      { id = "w_arthas_h", when = { faction = "Horde" }, text = "The human prince who murdered his own king and handed his kingdom to the dead. Even an orc of the old Horde wouldn't have done that." },
    },
    thrall = {
      { id = "w_thrall_a", when = { faction = "Alliance" }, text = "I've never seen a better general on the other side of a field, and I hope I never see him on one again. He thinks before he fights, and that's what makes him dangerous." },
      { id = "w_thrall_h", when = { faction = "Horde" }, text = "He's the best of us, and he's no blood-mad warlord either. When he says hold, we hold, and when he says go, nothing stops us." },
    },
    stromgarde = {
      { id = "w_stromgarde_a", when = { faction = "Alliance" }, text = "Stromgarde gave the Alliance its finest soldiers once, and now its own city's half full of ogres and Syndicate thugs. What's left of their army holds Refuge Pointe and won't give up an inch of Arathi." },
      { id = "w_stromgarde_h", when = { faction = "Horde" }, text = "A human kingdom in the Arathi Highlands that's crumbling on its own, with ogres in the streets of its capital. Our people at Hammerfall watch it rot with some satisfaction." },
    },
    gilneas = {
      { id = "w_gilneas_a", when = { faction = "Alliance" }, text = "Greymane built his wall and shut the gate on the Alliance, and on the refugees from the north as well. No word comes out of Gilneas now, and some say nothing living goes in." },
      { id = "w_gilneas_h", when = { faction = "Horde" }, text = "The humans who walled themselves off from the rest of their kind, and good riddance, say the Forsaken. There are strange things in the woods of Silverpine near that wall, and I don't mean wolves." },
    },
    onyxia = {
      { id = "w_onyxia_a", when = { faction = "Alliance" }, text = "The Theramore men have lost patrols in the south of the marsh, and they say there's a black dragon nesting there. Command's not sending anyone after her yet, and I don't blame them." },
      { id = "w_onyxia_h", when = { faction = "Horde" }, text = "There's a dragon in the Wyrmbog of Dustwallow, and our scouts at Brackenwall give it a very wide berth. Black dragons fought for the old Horde once, and none of us want to meet one again." },
    },
    centaur = {
      { id = "w_centaur", text = "Fast, cruel and fearless, and they'll ride straight through a line if you let them. Plant your spears, keep your shields tight and let them come to you." },
    },
    zul_gurub = {
      { id = "w_zg", text = "The Gurubashi trolls have woken something in the heart of Stranglethorn, a blood god called Hakkar, and the priests of Zanza on Yojamba Isle are calling for anyone with a blade. It's the jungle, so take more men than you think you need, and then take some more." },
    },
    wildhammer = {
      { id = "w_wildhammer_a", when = { faction = "Alliance" }, text = "Gryphon riders out of Aerie Peak, and they flew with us all through the Second War. They're wild and they drink like fish, but there's no better friend above a battlefield." },
      { id = "w_wildhammer_h", when = { faction = "Horde" }, text = "Dwarves on gryphons, throwing hammers from the sky; I still remember the sound of them from the last war. The trolls of the Hinterlands hate them worse than we do." },
    },
  },
}

P:Pool {
  id = "ask_priest_world", role = "priest", askOnly = true,
  topics = {
    holy_light = {
      { id = "w_light_a", when = { faction = "Alliance" }, text = "The Light is no god that sits on a throne, but a truth that lives in every act of compassion and courage. Call on it with a whole heart and it answers, and that's all the theology a soldier ever needs." },
      { id = "w_light_h", when = { faction = "Horde" }, text = "The humans speak of the Light as if it belongs to them, but it heals whoever has the will to call on it. Some of us call on it still, though we ask it for strength and not forgiveness." },
      { id = "w_light_ud", when = { faction = "Horde", race = "Scourge" }, text = "The Light still answers us, though we died, and that troubles the Cathedral far more than it troubles us. It answers our will rather than our worthiness, and that's something the Cathedral would rather not hear." },
    },
    scourge = {
      { id = "w_scourge_a", when = { faction = "Alliance" }, text = "A plague of the soul as much as the body, and every one of those poor dead was somebody's child. The Light can lay them to rest, and that's the kindest thing anyone can do for them now." },
      { id = "w_scourge_h", when = { faction = "Horde" }, text = "The Scourge is a hunger that wears dead flesh, and it's no more than that. Burn it, pray over the ashes if you like, and move on." },
    },
    forsaken = {
      { id = "w_forsaken_a", when = { faction = "Alliance" }, text = "They were the people of Lordaeron, and they died in fear and woke up in worse. I pray for them, though I'm told they'd spit on the prayer, and I can't blame them for it." },
      { id = "w_forsaken_h", when = { faction = "Horde" }, text = "They broke free of the Lich King's will, and that alone is a kind of miracle, whatever they'd call it. They don't ask for pity, so I don't offer it." },
    },
    arthas = {
      { id = "w_arthas_a", when = { faction = "Alliance" }, text = "He was a paladin of the Silver Hand, ordained by Uther himself, and he fell further than any man I can name. Pray for the strength never to be so sure of yourself as he was." },
    },
    stratholme = {
      { id = "w_strat", text = "The purging of Stratholme is preached about in every chapel, though no two priests preach it the same way. I'll only say that a great many innocents died there, and that the dead there still aren't resting." },
    },
    lordaeron = {
      { id = "w_lordaeron_a", when = { faction = "Alliance" }, text = "Lordaeron was the seat of the Church of the Light, and the Cathedral at Stormwind is a younger sister to what once stood there. It grieves me that its chapels house the dead now." },
    },
    elune = {
      { id = "w_elune", text = "The night elves' goddess of the moon, and her priestesses can heal as well as any of ours. I've never prayed to her, but I'd not refuse her blessing in a dark place." },
    },
    earth_mother = {
      { id = "w_earthmother", text = "The tauren call the land itself their mother, and their sun and moon are her two eyes. It's a gentler faith than most, and I've heard nobody say a bad word about the tauren who keep it." },
    },
    the_elements = {
      { id = "w_elements_a", when = { faction = "Alliance" }, text = "The orcs' shamans talk to fire and earth as if they were old friends, and the elements answer them. I'd call it a strange faith, though I've seen it heal as well as mine." },
      { id = "w_elements_h", when = { faction = "Horde" }, text = "The shamans speak with earth, fire, water and air, and the spirits of our ancestors besides. It's the old way, and it's the way the Warchief chose to bring back." },
    },
    kelthuzad = {
      { id = "w_kelthuzad", text = "A man who bargained his soul away for power over death, and got exactly what he paid for. The Argent Dawn would have him destroyed, and every honest priest prays they manage it." },
    },
    emerald_dream = {
      { id = "w_dream", text = "The druids say there's a green world beyond our own where everything is as it was meant to be. I've heard it whispered that something is troubling it lately, and that some sleepers there don't wake." },
    },
  },
}

P:Pool {
  id = "ask_scholar_world", role = "scholar", askOnly = true,
  topics = {
    dalaran = {
      { id = "w_dalaran", text = "The city of the magi, razed by the Burning Legion and now sealed under a great violet dome while the Kirin Tor rebuild it. They're very slow to let anyone in, and I have been waiting on a reply to my letters for some time." },
    },
    kirin_tor = {
      { id = "w_kirintor", text = "The ruling council of Dalaran, six magi or so, and they guard their secrets jealously. Their libraries were the finest in the world, and I'd give my right hand for an afternoon in them, though I'd want it back for the note-taking." },
    },
    lordaeron = {
      { id = "w_lordaeron", text = "The greatest of the human kingdoms, and its fall took less than a year. Historians will argue for a century over whether it was the plague, the prince or the grain that doomed it, and they'll all be partly right." },
    },
    nordrassil = {
      { id = "w_nordrassil", text = "The World Tree, planted atop Mount Hyjal by the night elves, and it gave them their long lives. They say it was wounded in the battle against Archimonde, and that the elves gave up their immortality to win that fight." },
    },
    arthas = {
      { id = "w_arthas", text = "The crown prince of Lordaeron, who went north to Northrend and came back with a cursed blade and a dead heart. The accounts disagree on nearly everything after that, except how it ended for his father." },
    },
    second_war = {
      { id = "w_secondwar", text = "The war that forged the Alliance of Lordaeron out of seven quarrelling kingdoms, and the war that broke it again within a decade. The Horde was defeated at Blackrock Spire, and the Dark Portal was destroyed, or so we thought." },
    },
    emerald_dream = {
      { id = "w_dream", text = "A realm the druids walk in their sleep, watched over by the green dragons of Ysera. I have read everything written on it, which is very little, and the druids don't care to add more." },
    },
    green_dragons = {
      { id = "w_greendragons", text = "Ysera's flight, the guardians of the Emerald Dream, and they're seldom seen in our world. Lately there are reports of them sleeping by strange portals in Duskwood, Ashenvale, the Hinterlands and Feralas, and the reports don't make comfortable reading." },
    },
    zul_gurub = {
      { id = "w_zg", text = "The old capital of the Gurubashi empire in Stranglethorn, and the Atal'ai priests summoned their blood god Hakkar there once before. Now the trolls say he's stirring again, which would explain the disturbing letters I've been getting from Yojamba Isle." },
    },
    zul_farrak = {
      { id = "w_zf", text = "A Sandfury troll city in the Tanaris desert, older than the goblins' Gadgetzan by a thousand years. The trolls there keep their dead walking, and their gods closer than anyone should." },
    },
    sunken_temple = {
      { id = "w_sunken", text = "The Temple of Atal'Hakkar, sunk into the Swamp of Sorrows by a green dragon to punish the priests who served Hakkar. It's still down there under the water, and still occupied, from what I hear." },
    },
    dire_maul = {
      { id = "w_diremaul", text = "The ruins of Eldre'Thalas in Feralas, a highborne city older than anything else on Kalimdor. Ogres hold the gates and the old elves still keep some part of it, and the library inside is a temptation I've had to resist for years." },
    },
    maraudon = {
      { id = "w_maraudon", text = "A cavern in Desolace where the centaur bury their prophet, and the centaur say Zaetar was the son of a demigod. Something has poisoned the place since, and the Cenarion Circle wants to know what." },
    },
    razorfen = {
      { id = "w_razorfen", text = "The great bramble warrens of the quilboar in the south of the Barrens, and the quilboar say their demigod Agamaggan died there. The thorns grew from his blood, and they've never stopped growing." },
    },
    blackfathom = {
      { id = "w_bfd", text = "A sunken night elf temple on the Ashenvale coast, once sacred to Elune. The Twilight's Hammer have moved in, and they're doing something down there in the dark that the Sentinels would very much like stopped." },
    },
    gilneas = {
      { id = "w_gilneas", text = "Genn Greymane built a wall across his kingdom and pulled out of the Alliance, and nobody has heard much from Gilneas since. A library of rumours has piled up behind that wall, and none of it is in my collection." },
    },
    wildhammer = {
      { id = "w_wildhammer", text = "The Wildhammer clan broke from Ironforge after the War of the Three Hammers and settled in Grim Batol, and later at Aerie Peak. They tattoo themselves, ride gryphons and distrust anything with a roof, which makes their histories very difficult to borrow." },
    },
    kelthuzad = {
      { id = "w_kelthuzad", text = "He sat on the Council of Six once, before he took up necromancy and was cast out of Dalaran for it. The Kirin Tor don't like to talk about him, and I can quite understand why." },
    },
  },
}

P:Pool {
  id = "ask_noble_world", role = "noble", askOnly = true,
  topics = {
    varian = {
      { id = "w_varian_a", when = { faction = "Alliance" }, text = "His Majesty went to Theramore to make a peace nobody at court wanted, and his ship arrived without him. One doesn't speculate in public, of course, but in private one speculates over every course of dinner." },
    },
    bolvar = {
      { id = "w_bolvar_a", when = { faction = "Alliance" }, text = "Fordragon is a soldier, and soldiers make dependable regents and dreadful dinner guests. He listens to the Lady Prestor, which is the most sensible thing he does." },
    },
    prestor = {
      { id = "w_prestor_a", when = { faction = "Alliance" }, text = "Lady Katrana is quite the most charming woman at court, and her family's lands in Alterac are beyond question. I don't know a single person she hasn't helped, and I don't know a single person who would cross her." },
    },
    stromgarde = {
      { id = "w_stromgarde_a", when = { faction = "Alliance" }, text = "Thoras Trollbane's kingdom left the Alliance in a huff over the camp taxes, and now it's overrun with ogres. One feels for them, though not quite enough to send troops." },
    },
    gilneas = {
      { id = "w_gilneas_a", when = { faction = "Alliance" }, text = "Greymane always did think himself above the rest of us, and then he built a wall to prove it. I hear the wine trade with Gilneas has dried up entirely, which is the real tragedy." },
    },
    internment = {
      { id = "w_intern_a", when = { faction = "Alliance" }, text = "Lordaeron spent a fortune keeping the orcs in pens and sent the rest of us the bill. Half the Alliance walked out over it, and they weren't wrong to." },
    },
    dalaran = {
      { id = "w_dalaran", text = "Dalaran's magi are rebuilding behind their dome, and they've made it quite clear that the rest of us aren't invited. My family endowed a chair there once, and the courtesy has evidently not been remembered." },
    },
    lordaeron = {
      { id = "w_lordaeron_a", when = { faction = "Alliance" }, text = "The court at Capital City was the finest in the world, and I danced there in my youth. It's a tomb now, and the dead keep its throne room." },
    },
    jaina = {
      { id = "w_jaina_a", when = { faction = "Alliance" }, text = "Lady Proudmoore is a remarkable young woman with very unusual friends. Some at court think she ought to be recalled, but nobody knows quite how one recalls a sorceress with her own city." },
    },
    magni = {
      { id = "w_magni_a", when = { faction = "Alliance" }, text = "King Magni is loyal, generous and impossible to dine with, because the dwarves will insist on toasting everything. The Alliance would be nothing without Ironforge, so one raises one's glass with the rest." },
    },
    tyrande = {
      { id = "w_tyrande_a", when = { faction = "Alliance" }, text = "The night elves' high priestess, and she has been ruling her people longer than our kingdoms have existed. One finds her very gracious and quite impossible to read." },
    },
    booty_bay = {
      { id = "w_bootybay", text = "A goblin port where pirates and merchants trade on the same dock, and the harbour master takes a cut from both. I've never been, naturally, but half the silk in this city came through it." },
    },
    thrall = {
      { id = "w_thrall_a", when = { faction = "Alliance" }, text = "A slave who learned to read in Durnholde and now rules a kingdom of his own, and I think that frightens the court more than his armies do." },
    },
  },
}

P:Pool {
  id = "ask_vendor_world", role = "vendor", askOnly = true,
  topics = {
    booty_bay = {
      { id = "w_bootybay", text = "Half of what I sell came through Booty Bay at some point, and the goblins took their cut at every dock along the way. If I could buy straight off the ships, I'd be a rich man, and the goblins know it." },
    },
    gadgetzan = {
      { id = "w_gadgetzan", text = "The goblins sell water in Gadgetzan for the price of wine, and they sell wine for the price of gold, and everyone pays because there's nowhere else for a hundred miles. I admire them, I really do." },
    },
    ratchet = {
      { id = "w_ratchet", text = "Ratchet's where the Barrens does its buying and selling, and the goblins there will trade with anyone who has coin. My suppliers swear by it, and then they swear at the prices." },
    },
    everlook = {
      { id = "w_everlook", text = "A goblin trading post in the snows of Winterspring, and they sell the furs right off the beasts you've just been fighting. I hear a bowl of hot soup costs a gold coin up there, and people pay it gladly." },
    },
    darkmoon_faire = {
      { id = "w_faire", text = "The Faire comes to town and takes every copper anyone has, and I sell nothing for a week. It's a fine show, mind, and I always end up spending my own money there." },
    },
    timbermaw = {
      { id = "w_timbermaw", text = "Furbolgs up in Felwood and Winterspring who haven't gone mad like the rest, and they'll trade with you if you've earned it. I've seen some of their beadwork, and it's finer than anything I've got on this table." },
    },
    centaur = {
      { id = "w_centaur", text = "Centaur raiders hit three caravans of mine last year, and the only thing they left was the wheels. I sell spears now as well as everything else, because there's good money in it." },
    },
    quilboar = {
      { id = "w_quilboar", text = "They don't trade and they don't pay, and every caravan through the Barrens has to go round their thorns. Bad for business from start to finish." },
    },
    scourge = {
      { id = "w_scourge", text = "Nothing out of Lordaeron's safe to buy anymore, not grain nor cloth nor anything else, because you never know what the plague's touched. I lost a good trading partner up there, and his whole town besides." },
    },
    theramore = {
      { id = "w_theramore_a", when = { faction = "Alliance" }, text = "Theramore trades fish and marsh herbs for anything from home, and the prices are fair, because Lady Proudmoore keeps a close eye on the docks." },
      { id = "w_theramore_h", when = { faction = "Horde" }, text = "The humans in the marsh will sell to anyone who stays polite, and some of my cousins do quiet business there. I didn't tell you that, and you didn't hear it from me." },
    },
    gurubashi_arena = {
      { id = "w_arena", text = "I sell more bandages to people bound for the Gurubashi Arena than to anyone else, and I don't ask them who they're planning to fight. Whoever comes back usually buys more." },
    },
  },
}

P:Pool {
  id = "ask_trainer_world", role = "trainer", askOnly = true,
  topics = {
    dalaran = {
      { id = "w_dalaran", text = "Dalaran was the great school of the age, and every craft borrowed something from its libraries. I hope they open the gates again soon, because there are questions only their books can answer." },
    },
    kirin_tor = {
      { id = "w_kirintor", text = "The Kirin Tor rule Dalaran and decide who may study what, and they're slow to decide anything at all. A good teacher shares what he knows, but they've never seen it that way." },
    },
    second_war = {
      { id = "w_secondwar_a", when = { faction = "Alliance" }, text = "My own teacher learned her trade in the war camps, keeping the army fed, mended and armoured. The war taught a generation of us, and it taught us all quickly." },
      { id = "w_secondwar_h", when = { faction = "Horde" }, text = "The old Horde trained its warriors for one thing only, and the war proved it wasn't enough. Now we teach every skill we can, because a Horde that only knows how to fight will lose again." },
    },
    gurubashi_arena = {
      { id = "w_arena", text = "Some of my students go to the Gurubashi Arena to test themselves, and some of them come back. The ones who come back always learn more from their losses than from anything I've told them." },
    },
    scourge = {
      { id = "w_scourge", text = "Everyone who goes north needs to know more than they did yesterday, because the dead don't give second chances. If you're bound for the Plaguelands, train first and train hard." },
    },
    the_elements = {
      { id = "w_elements_h", when = { faction = "Horde" }, text = "The shamans ask the elements for help, and the elements decide whether to give it. It's a different sort of teaching from mine, though the patience is the same." },
    },
    holy_light = {
      { id = "w_light_a", when = { faction = "Alliance" }, text = "I teach the use of the hands and the head, and the Cathedral teaches the rest. But I've noticed that the folk who pray tend to practise more, and I'll take that." },
    },
    darkmoon_faire = {
      { id = "w_faire", text = "The Faire's folk know crafts nobody else teaches, and some of their tricks would take you years to learn from me. Go and watch them, and don't trust a word they say about how it's done." },
    },
  },
}

P:Pool {
  id = "ask_flightmaster_world", role = "flightmaster", askOnly = true,
  topics = {
    wildhammer = {
      { id = "w_wildhammer_a", when = { faction = "Alliance" }, text = "The Wildhammer bred the first gryphons we ever flew, and the best birds in my roost still have Aerie Peak blood. Those dwarves can talk to their beasts, and some days I'd swear the beasts talk back." },
      { id = "w_wildhammer_h", when = { faction = "Horde" }, text = "Dwarves on gryphons, and the only riders in the world who'd give a wind rider a fair race. We don't fly near the Hinterlands if we can help it." },
    },
    booty_bay = {
      { id = "w_bootybay", text = "Booty Bay's roost hangs off the cliffs above the harbour, and landing there in a sea wind is a thing to be seen. The goblins charge extra for the view, but the view's worth it." },
    },
    gadgetzan = {
      { id = "w_gadgetzan", text = "Gadgetzan's an easy flight with a hard landing, because the sand gets into everything. Give your mount a good drink when you get there, and yourself as well." },
    },
    ratchet = {
      { id = "w_ratchet", text = "Ratchet's roost is the busiest on the Barrens coast, with the boats coming and going below and the goblins shouting at both. Every rider who lands there comes back with a story and lighter pockets." },
    },
    everlook = {
      { id = "w_everlook", text = "Everlook's a cold flight over Felwood and a colder landing, and the birds hate it. Wrap up warm, keep your hands off the reins and let them find the way." },
    },
    theramore = {
      { id = "w_theramore_a", when = { faction = "Alliance" }, text = "Theramore's roost is on the walls by the harbour, and you see the whole marsh as you come in over it. Keep well clear of the south, where the black dragon nests." },
      { id = "w_theramore_h", when = { faction = "Horde" }, text = "The humans' harbour in the Dustwallow, and our riders fly wide of it out of courtesy. Brackenwall Village is the roost you'll want, and it's muddier, but at least it's ours." },
    },
    onyxia = {
      { id = "w_onyxia", text = "None of my birds will fly over the south of the Dustwallow, and I've stopped asking them to. Something lives in that bog that eats birds, and riders too." },
    },
    scourge = {
      { id = "w_scourge_a", when = { faction = "Alliance" }, text = "We've a roost at Chillwind Camp, and the riders come back pale and quiet from the Plaguelands. The birds won't land anywhere the plague has touched, and I trust their noses." },
      { id = "w_scourge_h", when = { faction = "Horde" }, text = "The bats in Tirisfal carry riders over the dead lands without a care, and I'll admit they're better suited to it than my beasts. The plague smell sends my wind riders half mad." },
    },
    stromgarde = {
      { id = "w_stromgarde", text = "The flight over Arathi passes the old walls of Stromgarde, and you can see the ogres' fires in the streets from the air. It used to be a fine city, and now it's a fine target." },
    },
    timbermaw = {
      { id = "w_timbermaw", text = "The Timbermaw hold the tunnels between Felwood and Winterspring, and if they don't like you, you'll be flying round. Make friends with the furbolgs and you'll save yourself a long, cold trip." },
    },
    centaur = {
      { id = "w_centaur", text = "From up high you can see the Kolkar raiders riding across the Barrens long before the caravans can. A good rider learns to tell their dust from a kodo's, and to warn whoever's below." },
    },
  },
}

-- Smaller roles: a few things each would really have heard about.
P:Pool {
  id = "ask_blacksmith_world", role = "blacksmith", askOnly = true,
  topics = {
    second_war = {
      { id = "w_secondwar", text = "Every smith worth the name forged for that war, and we learned more about steel in five years than in the hundred before. Half the swords on the racks today are still that pattern, because it worked." },
    },
    magni = {
      { id = "w_magni_a", when = { faction = "Alliance" }, text = "King Magni keeps the Great Forge burning day and night, and there's no finer forge in the world. I'd give a year of my life to work a week at it." },
      { id = "w_magni_h", when = { faction = "Horde" }, text = "The dwarves make good steel, I'll give them that, and their king makes sure we keep finding it in our shields." },
    },
    gadgetzan = {
      { id = "w_gadgetzan", text = "The goblins in Gadgetzan make things that tick, whirr and then explode, and they call it engineering. Honest iron doesn't explode, and I've never had a customer complain." },
    },
    scourge = {
      { id = "w_scourge", text = "The dead don't wear armour, but the ones fighting them go through it like paper. I could keep my forge hot for a year on the orders from the north alone." },
    },
    wildhammer = {
      { id = "w_wildhammer", text = "Storm hammers, the Wildhammer call them, and they throw them from the backs of gryphons with lightning in the iron. I'd love to know how it's done, but they won't tell a flatlander." },
    },
  },
}

P:Pool {
  id = "ask_stablemaster_world", role = "stablemaster", askOnly = true,
  topics = {
    centaur = {
      { id = "w_centaur", text = "Half horse and all temper, and they ride down anyone who strays near their camps. I'd never put a saddle on one, even if it asked me nicely." },
    },
    quilboar = {
      { id = "w_quilboar", text = "The quilboar keep boars the size of ponies, and they treat them better than they treat anything else. That's the one thing I can say for them." },
    },
    darkmoon_faire = {
      { id = "w_faire", text = "The Faire brings strange beasts with it, and I've stabled a few for them. One of them sang to the horses at night, and the horses seemed to like it." },
    },
  },
}

P:Pool {
  id = "ask_banker_world", role = "banker", askOnly = true,
  topics = {
    booty_bay = {
      { id = "w_bootybay", text = "The Steamwheedle Cartel runs the vaults in Booty Bay, and they are very good at it. One doesn't ask what pirates keep in their boxes, and the goblins certainly don't." },
    },
    gadgetzan = {
      { id = "w_gadgetzan", text = "Gadgetzan's bank has the thickest walls in Tanaris, as it must, given who sleeps in the town. I correspond with them now and then, and their letters always arrive with an invoice." },
    },
    varian = {
      { id = "w_varian_a", when = { faction = "Alliance" }, text = "The Crown's accounts are kept in good order in His Majesty's absence, and that's as much as I'm free to say. One does notice where the money goes, in this business." },
    },
  },
}

P:Pool {
  id = "ask_auctioneer_world", role = "auctioneer", askOnly = true,
  topics = {
    booty_bay = {
      { id = "w_bootybay", text = "The goblins in Booty Bay run an auction house that sells to anybody, and I mean anybody. Their prices are higher and their buyers are rougher, and they still do more business than I do." },
    },
    gadgetzan = {
      { id = "w_gadgetzan", text = "Gadgetzan's auction house takes bids from both sides, and the goblin there takes a bigger cut than I'd dare. I respect that very much." },
    },
    darkmoon_faire = {
      { id = "w_faire", text = "The Darkmoon folk buy strange things: decks of cards, old trinkets, bits of beasts you can't name. Whenever the Faire's coming, the prices on all of it go up, and I never quite know why." },
    },
  },
}

P:Pool {
  id = "ask_child_world", role = "child", askOnly = true,
  topics = {
    darkmoon_faire = {
      { id = "w_faire", text = "The Faire is the best thing in the whole world! There's a man who breathes fire and a cannon that shoots people, and Mama won't let me go in the cannon, but someday I will." },
    },
    scourge = {
      { id = "w_scourge", text = "The Scourge are dead people who walk around, and they eat you, my brother says. I don't believe him, but I keep a candle lit at night anyway." },
    },
    thrall = {
      { id = "w_thrall_a", when = { faction = "Alliance" }, text = "He's the big green orc king with a giant hammer, and I heard he can call lightning down out of the sky! I'm not scared of him, not really." },
      { id = "w_thrall_h", when = { faction = "Horde" }, text = "Thrall is the Warchief, and he's the strongest, and when I grow up I'll be in his army! He can make the lightning come, you know." },
    },
    varian = {
      { id = "w_varian_a", when = { faction = "Alliance" }, text = "The king went away on a boat and didn't come back, and now the prince has to be king, even though he's only a boy. I'd hate being king; you'd never get to play." },
    },
    onyxia = {
      { id = "w_onyxia", text = "There's a big black dragon in a swamp, and she eats knights! My papa says she's not real, but he says that about everything." },
    },
  },
}

P:Pool {
  id = "ask_militia_world", role = "militia", askOnly = true,
  topics = {
    scourge = {
      { id = "w_scourge", text = "We've all heard about the north, and we all pray it never comes this way. I've a spear and a stout door, and I hope that's enough, though I know it wouldn't be." },
    },
    varian = {
      { id = "w_varian_a", when = { faction = "Alliance" }, text = "If the king were home, maybe somebody would send real soldiers out here. Until then, we've got the farmers, and the farmers have got us." },
    },
    second_war = {
      { id = "w_secondwar", text = "My grandfather fought in it with a pitchfork, near enough, and he said the soldiers got all the credit. Some things don't change, it seems." },
    },
  },
}

P:Pool {
  id = "ask_worker_world", role = "worker", askOnly = true,
  topics = {
    scourge = {
      { id = "w_scourge", text = "A carter I work with went north last year and came back with his hair gone white. He won't say what he saw, and I've stopped asking him." },
    },
    booty_bay = {
      { id = "w_bootybay", text = "They say the goblins in Booty Bay pay double for dock work, and they say it in a tone that makes you think twice. A mate of mine went down there and came back with one fewer finger and a lot more money." },
    },
    darkmoon_faire = {
      { id = "w_faire", text = "When the Faire comes, they need hands to put up the tents, and they pay in tickets. I've never yet won a thing with them, but it's a good day out." },
    },
  },
}

P:Pool {
  id = "ask_peon_world", role = "peon", askOnly = true,
  topics = {
    thrall = {
      { id = "w_thrall", text = "Warchief Thrall break the human camps, and now peon carry wood for Horde and not for humans. Is much better wood." },
    },
    internment = {
      { id = "w_intern", text = "Peon remember camps, and peon not like to talk about camps, so you ask something else, please." },
    },
    centaur = {
      { id = "w_centaur", text = "Centaur ride by fast and steal peon's lumber, and then ride away laughing. Peon not laugh." },
    },
    quilboar = {
      { id = "w_quilboar", text = "Quilboar build walls of big thorns, and peon not want to chop those. Peon tried once, and peon still picking out thorns." },
    },
  },
}

P:Pool {
  id = "ask_farmer_world", role = "farmer", askOnly = true,
  topics = {
    scourge = {
      { id = "w_scourge_a", when = { faction = "Alliance" }, text = "They say the plague came north in the grain, and I've checked every sack on this farm twice since I heard it. A farmer's grain is his whole life, and theirs killed them." },
      { id = "w_scourge_h", when = { faction = "Horde" }, text = "The plague came out of the grain in the human lands, and now there's nothing growing there but grave moss. I check every seed I buy, and I buy from people I know." },
    },
    quilboar = {
      { id = "w_quilboar", text = "Quilboar raid the edges of the fields and root up whatever they don't steal. A good fence and a big dog do more than any guard will." },
    },
    holy_light = {
      { id = "w_light_a", when = { faction = "Alliance" }, text = "I say my prayers to the Light at planting and again at harvest, and the Light hasn't failed me yet, give or take the odd hailstorm." },
    },
    earth_mother = {
      { id = "w_earthmother_h", when = { faction = "Horde" }, text = "The tauren say the Earth Mother feeds us all, and whoever's tilled a field in the Barrens would like a word with her about the rain." },
    },
    darkmoon_faire = {
      { id = "w_faire", text = "The Faire comes past every so often and buys up all the eggs. I don't know what they're doing with them, and I don't ask." },
    },
  },
}

P:Pool {
  id = "ask_questgiver_world", role = "questgiver", askOnly = true,
  topics = {
    zul_gurub = {
      { id = "w_zg", text = "The Zandalar trolls on Yojamba Isle are asking anyone who'll listen for help against Hakkar, and they pay in very old coin. If you've a strong party behind you, there's work there and plenty of it." },
    },
    onyxia = {
      { id = "w_onyxia", text = "Nobody posts a bounty on a dragon, because nobody expects to pay one out. If you find yourself hunting her, you'll need a small army and a very good reason." },
    },
    dire_maul = {
      { id = "w_diremaul", text = "There's work in Dire Maul for anybody who can get past the ogres at the gate, and there's treasure besides, if what the scholars say is true." },
    },
    maraudon = {
      { id = "w_maraudon", text = "The Cenarion Circle wants someone to look into Maraudon, where the centaur keep their dead and something rotten has crept in. It's a deep cave, so take a torch and a spare." },
    },
  },
}

P:Pool {
  id = "ask_spirithealer_world", role = "spirithealer", askOnly = true,
  topics = {
    scourge = { { id = "w_scourge", text = "They are the dead who were not let go. I send souls back; they hold them fast, and that is all the difference between us." } },
  },
}

---------------------------------------------------------------------------
-- Goblin towns: Cartel staff (guards, innkeepers, vendors and so on) answer the big
-- questions as goblins, whoever's asking. One set, copied into a pool per town and role.
---------------------------------------------------------------------------
local GOBLIN_TAKES = {
  thrall = { { id = "w_thrall", text = "The Warchief? Great customer, pal, pays on time, keeps the roads open, and he don't smash up the bar, so in my book he's practically a saint." } },
  jaina = { { id = "w_jaina", text = "Lady Proudmoore runs a tidy port in the marsh and sends her people to buy here same as anybody, so I got no complaints. Nice manners, too, which ain't something I get much of." } },
  sylvanas = { { id = "w_sylvanas", text = "I never sold to her personally, pal, and I'd like to keep it that way, 'cause her people pay in coins that are cold to the touch. Business is business, but brr." } },
  bolvar = { { id = "w_bolvar", text = "The Stormwind regent's a straight shooter, from what my suppliers say, which makes him lousy at negotiating. That's good news for whoever's selling to his army." } },
  varian = { { id = "w_varian", text = "Missing king, huh? There's a dozen bets on him in this town alone, pal, and the odds change every time a ship comes in, so if you know something, I'm buyin'." } },
  scourge = { { id = "w_scourge", text = "Worst market in the world, the Scourge, 'cause dead guys don't buy nothin' and they eat the salesmen. The Cartel's got a policy on walking corpses, and it's 'not past the gate'." } },
  booty_bay = { { id = "w_bootybay", text = "Best port on the southern seas, pal, run by the Baron and kept honest by the bruisers, more or less. Anybody can buy anything here, so long as they don't start a fight on the docks." } },
  gadgetzan = { { id = "w_gadgetzan", text = "Gadgetzan's the Cartel's oasis in Tanaris, with the only clean water for a hundred miles, so you can guess what it costs. Neutral ground, pal, and the bruisers there take it very seriously." } },
  ratchet = { { id = "w_ratchet", text = "Ratchet's the Cartel's door on the Barrens, run by Gazlowe, who'll sell you a boat ticket and the boat if you ask him nice. Great harbour, terrible smell." } },
  everlook = { { id = "w_everlook", text = "Everlook's up in Winterspring, and the prices are as high as the snowdrifts, 'cause somebody's gotta pay for hauling all that stuff up a mountain. Bring a coat, pal; I hear they charge double for those too." } },
  darkmoon_faire = { { id = "w_faire", text = "The Faire's competition, pal, real tough competition, 'cause those carnies could sell sand in Tanaris. I'd hire every last one of 'em if they didn't scare me so much." } },
  gurubashi_arena = { { id = "w_arena", text = "Every so often somebody chucks a chest in the middle of that arena, and everybody in Stranglethorn tries to kill each other for it. Great for business, pal, 'cause every winner needs a drink and every loser needs bandages." } },
  onyxia = { { id = "w_onyxia", text = "Dragon in the Dustwallow, lots of gold in her lair, and so far a zero percent return on investment for anybody who's gone in to get it. I'm waiting for the numbers to improve, pal." } },
}

local function copy(t)
  if type(t) ~= "table" then return t end
  local out = {}
  for k, v in pairs(t) do out[k] = copy(v) end
  return out
end

for _, town in ipairs({ "booty_bay", "gadgetzan", "ratchet", "everlook" }) do
  for _, role in ipairs({ "guard", "innkeeper", "vendor", "flightmaster", "banker", "blacksmith", "trainer", "stablemaster", "auctioneer", "worker" }) do
    P:Pool { id = "ask_goblin_" .. role .. "_" .. town, role = role, community = town, askOnly = true, topics = copy(GOBLIN_TAKES) }
  end
end
