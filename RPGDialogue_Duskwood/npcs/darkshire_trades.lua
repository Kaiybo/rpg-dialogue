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
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has my birds watching it, {class}, and I can't say they look pleased. Keep it on the far side of the roost." },
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
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Say something soothing near the roosts, would you? The gryphons have heard nothing but wolves for weeks." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! The gryphons don't mind armour, but they do mind a rider who shouts, so keep your battle cries for the ground." },
        { id = "h_default", text = "Felicia Maline. I keep the gryphons of Darkshire, which mostly means keeping them calm when the wolves howl at night." },
        { id = "h_cond", when = { class = "HUNTER" }, text = "A hunter, and with a beast at your side! Keep it close at night, friend; the worgen like nothing better than a stray pet." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The gryphons will carry you, but don't go waving that blade near them, because they're nervous enough with the wolves howling." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and you'll know how a frightened animal behaves, so you'll understand why my gryphons are so jumpy tonight." },
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
        { text = "Could your gryphons carry word to Stormwind faster than letters?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Thank you, Felicia.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Because they can't see through the canopy, and a gryphon that can't see the ground is a frightened gryphon. They fly high over Duskwood and they don't come down until Darkshire's lamps are under them." } },
      choices = {
        { text = "Have you lost any?", next = "a2" },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "An axe, if I'm honest, because a ghoul doesn't stop for a cut but it stops for a missing limb. Swords are prettier, and most of the Watch carry them, but I'd rather be ugly and alive." } },
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
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} is a good blade in its own right, {class}, and better than half of what I've got in stock." },
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
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I've nothing for you but a knife to cut bread, though out here a knife's never the worst idea." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll want a mace, then, for the dead, and I've a few with weight enough to break a skeleton's spine." },
        { id = "h_default", text = "Gavin Gnarltree. I make weapons for Darkshire, and in Darkshire nobody buys a blade for show." },
        { id = "h_cond", when = { class = "WARRIOR" }, text = "A warrior. Good. Commander Ebonlocke could use a dozen more of you, and I could use the custom." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good, because I sell blades to people who'll use them, and you look like you've used plenty." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll want a good knife for skinning and a better one for the worg that's skinning you, and I've both." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Ask. I'm only grinding an edge." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What works against the worgen?", next = "a" },
        { text = "Are you kin to Clarise?", next = "b" },
        { text = "What blade would you carry into Duskwood, Gavin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you sell hunting knives, Gavin?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the folk who buy your blades ever come back, Gavin?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What weapon do you trust against the dead, Gavin?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Good day.", next = "END" },
      },
    },
    a = {
      lines = { { id = "a_default", text = "Folk will tell you silver, but folk tell you all sorts. What works is a heavy blade, a steady arm and a friend at your back, and I can only sell you the first of those." } },
      choices = {
        { text = "And against the dead at Raven Hill?", next = "a2" },
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
  },
}
