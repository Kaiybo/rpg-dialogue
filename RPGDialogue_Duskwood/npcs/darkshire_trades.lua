-- Darkshire's gryphon master and weaponsmith. Voice: bibles/darkshire_trades.md
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC = P.TODO_NPC

-- Felicia Maline: Darkshire's gryphon master.
P:NPC {
  key = "felicia_maline", id = TODO_NPC("Felicia Maline"), name = "Felicia Maline", title = "Gryphon Master",
  bible = "bibles/darkshire_trades.md", role = "flightmaster", tier = "service",
  communities = { "darkshire" }, temper = { "steady" }, values = { "duty", "courage" },
  impression = {
    first = "Felicia Maline keeps Darkshire's gryphons, and she says the birds hate Duskwood's dark nearly as much as the townsfolk do.",
    third = "{name} met Felicia Maline, Darkshire's gryphon master.",
  },
  greetings = {
    { id = "g_default", text = "Flying out? I don't blame you. The birds are always glad to leave, too." },
    { id = "g_back", when = { metBefore = true }, text = "Back in Duskwood? You're braver than most, or you've a short memory." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They do, and so do I, honestly. Your wind spirits might steady them in flight." } },
      choices = {
        { text = "Then keep them steady, Felicia. They need you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Gryphons should be brave. Train them harder.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because they'd throw it, and you with it, somewhere over Stranglethorn, and I'd have to explain that to the flight master in Booty Bay. They smell things the rest of us can't, and the smell on your sort sets them screaming in the roost all night." },
      },
      choices = {
        { text = "Then the demon walks. Your birds know best.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your birds will learn to carry what I tell them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Felicia.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They mind the cold that comes off some of you, and they mind it when a rider starts casting halfway to Lakeshire, which one of your lot did last year. Sit still, keep your hands in your lap, and they'll carry you anywhere the Alliance has a roost." },
      },
      choices = {
        { text = "I'll sit still and keep my hands in my lap.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If the bird balks, I'll make my own way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Felicia.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Now and then, and I don't ask, because a flight's paid for in coin and not in answers. But the gryphons know when a rider's nervous, and the nervous ones always seem to be heading somewhere Commander Ebonlocke would want to hear about." },
      },
      choices = {
        { text = "Then perhaps the Commander should hear about them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Best you keep not asking, Felicia.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Felicia.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only as far as the next roost, and that's as close to the fight as I'll send them. A gryphon's a mount, not a war beast, and these birds have seen enough of Duskwood's dark already." } },
      choices = {
        { text = "Then I'll walk to the fight and spare your birds.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A mount's a mount. It should carry me where I need.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Felicia.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because they howl from every side at once, and a gryphon can't see where the danger's coming from in this dark. I've lost two birds to bolting this year, and both of them were good, steady flyers before." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because they howl from every side at once, and a gryphon can't see where the danger's coming from in this dark. Your {pet} has my birds watching it too, {class}, so keep it on the far side of the roost." },
      },
      choices = {
        { text = "I'll hunt the wolves near the roost so the birds can rest.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your birds will toughen up. Mine did.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Felicia.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Now and then, wrapped and strapped, to families in Stormwind who'd rather bury their own. The birds go quiet on those flights, every one of them, and I've never had to tell them why." } },
      choices = {
        { text = "That's a kindness, Felicia. The dead deserve to go home.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bury them here. The living need those birds more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Felicia.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Faster, yes, but Stormwind reads gryphon post just as slowly as the ordinary sort. Lord Ebonlocke has me fly his petitions north twice a week, and the birds come back with nothing but fewer feathers." } },
      choices = {
        { text = "Keep sending them. Stormwind must answer in time.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Stop asking Stormwind. Darkshire must save itself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Felicia.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They're hill birds, bred under open sky, and this forest keeps the sun out from dawn to dusk, so they never properly wake up. They sleep badly too, because the wolves howl right under the roost." } },
      choices = {
        { text = "Keep them on their schedule. They'll adjust in time.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fly them out to the open hills each week for the sun.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Say something soothing near the roosts, would you? The gryphons have heard nothing but wolves for weeks." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The gryphons don't mind armour, but they do mind a rider who shouts, so keep your battle cries for the ground." },
        { id = "h_default", text = "Felicia Maline. I keep the gryphons of Darkshire, which mostly means keeping them calm when the wolves howl at night." },
        { id = "h_cond", when = { class = "HUNTER" }, text = "A hunter, and with a beast at your side! Keep it close at night, friend; the worgen like nothing better than a stray pet." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The gryphons will carry you, but don't go waving that blade near them, because they're nervous enough with the wolves howling." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and you'll know how a frightened animal behaves, so you'll understand why my gryphons are so jumpy tonight." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! My gryphons have perked up at you, which is more than they've done for anything since the last full moon." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Quiet steps, those. The gryphons don't like being snuck up on, so whistle when you come near the roosts." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. You'll fly like everyone else here, I hope, because the birds hate it when riders just appear beside them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I'll fly you, but your companion walks, and the gryphons will thank me for it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. My gryphons hate Duskwood's dark nearly as much as the townsfolk do. Do your wind spirits calm them?" },
      },
      again = {
        { id = "h_again", text = "Anything else? The birds want their supper." },
        { id = "h_again2", text = "Go on, then, since it's quiet in here for once." },
      },
      choices = {
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Why do the gryphons hate the wood?", next = "a" },
        { text = "Who flies out of Darkshire?", next = "b" },
        { text = "Do your gryphons ever carry warriors to the fight, Felicia?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why do the wolves frighten the gryphons, Felicia?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your gryphons ever carry the dead home, Felicia?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Your gryphons could carry word to Stormwind faster than letters.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why do your gryphons hate Duskwood's dark so much?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'd guess some fly out of Darkshire who'd rather not be seen.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Your gryphons don't look keen on mages.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why won't your gryphons carry my demon, Felicia?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Your gryphons seem to fear the dark, Felicia.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Felicia.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Because they can't see through the canopy, and a gryphon that can't see the ground is a frightened gryphon. They fly high over Duskwood and they don't come down until Darkshire's lamps are under them." } },
      choices = {
        { text = "You must have lost a gryphon or two.", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "One, last winter, that came down near Raven Hill and never came back up. The Night Watch wouldn't go and look for it, and I can't say I blame them." } },
      choices = {
        { text = "Someone should have gone. Every life matters, even a beast's.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "The Watch was right. You don't risk men for a bird.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "Couriers for the Night Watch, mostly, and the odd merchant who's had enough. Hardly anyone flies in, except adventurers like you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came from Stormwind to keep the birds, and the town kept me." } },
    _none = { { id = "tp_none", text = "I wouldn't know about that. I know the sky, not the ground." } },
    wildhammer = { { id = "tp_wildhammer", text = "My gryphons came from Aerie Peak, raised by the Wildhammer, and they still won't eat until I've sung to them like a dwarf. My singing's dreadful, but they're polite about it." } },
    dark_riders = { { id = "tp_dark_riders", text = "From the air you can see them some nights, black horses on the road to Deadwind, and the gryphons won't fly over them. Neither will I." } },
    raven_hill = { { id = "tp_raven_hill", text = "I route every flight well north of Raven Hill, because the birds hate the smell. They can smell that cemetery from a mile up, and so can I when the wind's wrong." } },
  },
}

-- Gavin Gnarltree: Darkshire's weaponsmith; kin of Clarise Gnarltree.
P:NPC {
  key = "gavin", id = TODO_NPC("Gavin Gnarltree"), name = "Gavin Gnarltree", title = "Weaponsmith",
  bible = "bibles/darkshire_trades.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "grim" }, values = { "craft", "practical" },
  impression = {
    first = "Gavin Gnarltree sells swords and axes to a town that sleeps with one hand on a hilt, and he doesn't pretend any of it is enough against what lives in the wood.",
    third = "{name} met Gavin Gnarltree, Darkshire's grim weaponsmith.",
  },
  greetings = {
    { id = "g_default", text = "Steel, sharpened. You'll want it in this wood." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive? Then the blade's done its job, or you've done yours." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Nothing I sell is enough on its own, honestly, but a shaman's lightning might keep the dead at bay a little longer." } },
      choices = {
        { text = "Then I'll fight with honest steel and lightning both.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If nothing's ever enough, there's no point bothering.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'll sell to anyone fighting what's in that wood, and I'll not ask who taught you your tricks. But if I hear you've been up at Raven Hill doing what Morbent Fel did, I'll come looking for you myself, and I'll bring the axe." },
      },
      choices = {
        { text = "Fair. If I ever go that far, come and find me.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Morbent Fel had power, Gavin. Don't pretend otherwise.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Gavin.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A short blade, always, because spells run out and a worgen doesn't wait for you to catch your breath. I sold a dagger to a mage from Stormwind last autumn, and he laughed at me, and he came back a month later and bought a second one without saying a word." },
      },
      choices = {
        { text = "Then I'll buy the dagger, Gavin, and learn to use it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If my spells run out, a dagger won't save me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Gavin.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They'll bite, if you put them in the right place, which is under the arm or behind the knee, and not in the back like your lot always want to. A worgen's back is all muscle and fur, and the last man who tried it is buried up by the cemetery road." },
      },
      choices = {
        { text = "Then I'll face it and go for the knee.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The back has always served me, Gavin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Gavin.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "An axe, every time, because a ghoul doesn't stop for a cut but it stops for a missing limb. Swords are prettier, and most of the Watch carry them, but I'd rather be ugly and alive." } },
      choices = {
        { text = "An axe, then. Practical over pretty, every time.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll keep my sword. Skill wins more than weight.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Gavin.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Skinning knives, belt knives and a few good long knives for the close work, because a bow's no use at arm's length. In this wood, you'll be at arm's length more often than you'd think." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Skinning knives, belt knives and a few good long knives for the close work, because a bow's no use at arm's length. That {pet} is a good blade in its own right, {class}, and better than half of what I've got in stock." },
      },
      choices = {
        { text = "One good knife, well kept. That's all a hunter needs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take three. You never know which one you'll lose.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Gavin.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The careful ones do, for sharpening, and the rest I hear about when Commander Ebonlocke reads out the names. I've stopped asking myself which blade each of them carried." } },
      choices = {
        { text = "I'll pray for the ones who don't come back.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Good blades can't save careless fighters, Gavin.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Gavin.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Something blunt and heavy, because a blade slips between old bones and the dead don't bleed. A good mace caves them in, and I'd put one in every watcher's hand if Stormwind ever paid for the iron." } },
      choices = {
        { text = "Arm the Watch first. I'll make do with what I carry.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sell me your best one. My work matters more.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Gavin.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Claws against claws is a fair fight, and a fair fight against a worgen is one you'll lose, because they don't tire. A good axe ends it before it gets fair, and that's the only edge I sell." } },
      choices = {
        { text = "Then I'll fight fair, with my own claws, and win.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fair is for tourney grounds. I'll take every edge.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I've nothing for you but a knife to cut bread, though out here a knife's never the worst idea." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll want a mace, then, for the dead, and I've a few with weight enough to break a skeleton's spine." },
        { id = "h_default", text = "Gavin Gnarltree. I make weapons for Darkshire, and in Darkshire nobody buys a blade for show." },
        { id = "h_cond", when = { class = "WARRIOR" }, text = "A warrior. Good. Commander Ebonlocke could use a dozen more of you, and I could use the custom." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good, because I sell blades to people who'll use them, and you look like you've used plenty." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll want a good knife for skinning and a better one for the worg that's skinning you, and I've both." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. You'll fight with claws and teeth, I suppose, and the worgen have both, yet they still lose to a good axe." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A knife-fighter, by the way you walk. I've daggers, and they're good ones, but nobody stabs a worgen from behind twice." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. I've a staff or two for your sort, though most of the ones I sell end up holding old men upright on the walk to market." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I don't forge for demons, so if your friend wants a blade, it'll have to find its own." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Swords and axes, and none of them enough against what's in the wood. Your lightning might help." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Ask. I'm only grinding an edge." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What works against the worgen?", next = "a" },
        { text = "Is the Gnarltree at the forge your kin?", next = "b" },
        { text = "What blade would you carry into Duskwood, Gavin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you sell hunting knives, Gavin?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I wonder how many who buy your blades come back, Gavin.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What weapon do you trust against the dead, Gavin?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Claws against claws seems fairer. Why should I want a blade?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do your daggers bite through worgen hide, Gavin?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'd have thought a blade was little use to a mage, Gavin.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you sell your steel to a warlock, Gavin?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I doubt any steel is enough against this wood's horrors, Gavin.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Folk will tell you silver, but folk tell you all sorts. What works is a heavy blade, a steady arm and a friend at your back, and I can only sell you the first of those." } },
      choices = {
        { text = "And against the walking dead?", next = "a2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    a2 = {
      lines = { { id = "a2_default", text = "Something blunt, because bones don't bleed. Some say the Light does better than any mace, but I've never sold a prayer and I won't start now." } },
      choices = {
        { text = "Faith is the better weapon. Steel only finishes the job.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Steel is what keeps this town alive, not prayers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    b = {
      lines = { { id = "b_default", text = "We're Gnarltrees, and that's enough said. She sells to the town and I sell to the Watch, and we both sell more than we'd like." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've worked this forge since before the wood went dark, and I'll work it after, if the town lasts." } },
    _none = { { id = "tp_none", text = "Don't know, and in Duskwood it's healthier not to wonder." } },
    raven_hill = { { id = "tp_raven_hill", text = "Blunt weapons for Raven Hill and sharp ones for the worgen, and don't mix them up. I've told that to every adventurer who's come through, and half of them listen." } },
    scourge = { { id = "tp_scourge", text = "If the Scourge ever comes south, they'll find Darkshire's smiths have been ready for years. That's the only good thing I can say about living here." } },
    dark_riders = { { id = "tp_dark_riders", text = "Nobody's ever brought me a Dark Rider's sword to look at, and I hope nobody does. Whatever forged those, it wasn't a smith." } },
  },
}
