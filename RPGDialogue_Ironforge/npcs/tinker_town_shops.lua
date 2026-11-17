-- Tinker Town's shops: engineering supplies, Springspindle's Gadgets, Berryfizz's Potions and Mixed Drinks.
-- Voices: bibles/tinker_town_shops.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC = P.TODO_NPC

-- Gearcutter Cogspinner: engineering supplies in Tinker Town; fussy about parts.
P:NPC {
  key = "if_gearcutter", id = TODO_NPC("Gearcutter Cogspinner"), name = "Gearcutter Cogspinner",
  bible = "bibles/tinker_town_shops.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "brisk" }, values = { "careful", "practical" },
  notices = { "craft" },

  impression = {
    first = "Gearcutter Cogspinner sells engineering parts in Tinker Town and knows every washer in his stock by size and temperament. He thinks most explosions are caused by cheap flux.",
    third = "{name} met Gearcutter Cogspinner, who sells engineering supplies in Tinker Town.",
  },

  greetings = {
    { id = "g_default", text = "Tubes, flux, blasting powder and spanners, all sorted by size, so please don't unsort them." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more parts? I hope the last lot went where they were meant to go, and not up." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering" } },
      text = "Singed eyebrows, if I'm not mistaken. Welcome, fellow engineer; you'll want the coarse powder, not the rough, whatever you used last time." },
    { id = "n_apprentice", cat = "origin", when = { origin = "gnome_tinker_apprentice" },
      text = "You're an apprentice, I can tell by the way you're counting the blasting powder in your head. How many explosions so far? Don't tell me, because I'd rather not know which of my parts were involved." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "My readings say maybe, and my readings are usually right about maybes. The trouble is that lightning doesn't arrive in a steady current, it arrives in a temper. I'd need a shaman with a calm disposition and a very forgiving eyebrow." } },
      choices = {
        { text = "The storm isn't a battery. I'll not misuse it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll test it for you. Forgiving eyebrows and all.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only when it's used badly, which is more often than I'd like, because people buy cheap flux elsewhere. Good engineering makes a clean hole exactly where you want it and nowhere else." } },
      choices = {
        { text = "Careful work is the best anyone can ask for.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "No blast is ever clean. The land remembers every one.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only in a charge, and only if you throw it first and run second, which is the order most warriors get wrong. I'd sell you a stick if you were an engineer, but you're not, so I'll sell you a whetstone and save us both the explosion." } },
      choices = {
        { text = "A whetstone, then. I'll trust plain steel.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sell me the powder anyway. I'll learn quickly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A good one will, if it's mounted straight, and a cheap one will throw your shot a hand's width to the left, which is how bears get close. I sell the parts and the engineers mount them, so if it's crooked, it's their fault." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And keep your {pet} away from the flux, please, for it smells sweet and it isn't." },
      },
      choices = {
        { text = "I'll pay for good parts, mounted straight.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A cheap scope and a good eye will do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "To anyone who pays, and I assume they're for opening chests in Gnomeregan, which is a perfectly honest use. What you do with them after is between you and the guards." } },
      choices = {
        { text = "They'll open chests in Gnomeregan, nothing more.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The guards and I have an understanding. I avoid them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Once, and the smell lingered for a month. I've no objection to your craft, mind, but I'd like my parts used for engineering and not for whatever it is you do in the dark." } },
      choices = {
        { text = "I'll use your parts for engineering, Gearcutter. Honestly.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "What I do in the dark is my own business.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than I'd like, and almost always because they bought cheap flux somewhere else, which I tell them every time. The Mystic Ward's priests have patched up half of Tinker Town, and I've stopped counting the eyebrows." } },
      choices = {
        { text = "Then I'll help where I can. Carelessness shouldn't cost a life.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Buy cheap flux, get cheap welds. Let them find out.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me see your parts.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "In Tinker Town? No, but in the Commons there's a trader who sells flux he hasn't tested, and he knows it, and I've told the guards, and they've done nothing. A paladin who'd have a word with him would do more good than I can." } },
      choices = {
        { text = "I'll have a word. Cheating buyers is theft with a smile.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let the market punish him. Buyers should test their own parts.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Gearcutter.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Once, and only a little, though it took me a week to find every washer! Most explosions in Tinker Town come from cheap flux, but the rest come from mages who think a little frost won't hurt anything, and it always does." },
      },
      choices = {
        { text = "Fair. I'll cast nothing near your stock.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A little frost never hurt anyone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I've nothing tested for prayers, I'm afraid, but my bandage clamps are tested twice, and they've helped a few engineers who didn't test their own work." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I'll tell you now my parts aren't rated for being hit with a hammer, so please don't." },
        { id = "h_default", key = true,
          text = "Gearcutter Cogspinner, engineering supplies, and every part in this shop is tested twice before it's sold. If something of mine blows up, it's because you meant it to, and that's the only kind of explosion I'll stand behind." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! I'll tell you now that my lockpicks are tested twice, like everything else, and that I don't ask what they're for." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock! I'll warn you that none of my parts are rated for fel energy, and I won't take them back if they melt." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want blasting powder, I imagine; everybody does, sooner or later." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've parts for rifle scopes in the back, and every one of them's been tested twice, like everything else here." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I don't suppose you'll be buying blasting powder, but you're welcome to look, as long as you don't shed on the flux." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Please don't cast anything near the blasting powder, because it has a temper, and so do I when my stock goes up in smoke." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I've wondered whether a lightning totem would charge a battery. Purely theoretically, of course. I wouldn't sell it without testing it twice." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a box of springs to count, four hundred and twelve at last tally, and I'd like to know if it's still four hundred and twelve." },
        { id = "h_again2", text = "Next question, please, and in order of size, if you can manage it." },
      },
      choices = {
        { text = "Let me see your parts.", next = "BUSINESS" },
        { text = "What does a new engineer need?", next = "need" },
        { text = "Parts must be hard to come by since Gnomeregan.", next = "parts" },
        { text = "Engineering seems a dangerous trade.", next = "danger" },
        { text = "Do you really sell lockpicks to anyone who asks?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Has fel energy melted your parts before?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would blasting powder be any use to a warrior?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Could a scope really improve my aim, Gearcutter?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Many engineers must come to you hurt, Gearcutter.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is honest work rarer than it should be, Gearcutter?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does all this blasting powder ever harm the land outside?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Has a mage really blown up your stock, Gearcutter?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Could a lightning totem really charge one of your batteries?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thanks, Gearcutter.", next = "END" },
      },
    },

    need = {
      lines = {
        { id = "ne_default", text = "A blacksmith hammer, an arclight spanner, a steady hand and a great deal of copper. Springspindle will teach you the rest next door, though he'll talk about wheels a great deal longer than you'd like." },
      },
      choices = {
        { text = "What's wrong with wheels?", next = "need_wheels" },
        { text = "Something else.", next = "BACK" },
      },
    },
    need_wheels = {
      lines = {
        { id = "nw_default", text = "Nothing at all, as far as I can tell, but Springspindle thinks he's going to replace them with something better. I sell him the parts and I don't ask what for, because the answer usually takes an afternoon." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    parts = {
      lines = {
        { id = "pa_default", text = "From the Great Forge, mostly, which makes good bronze but very silly bolts. In Gnomeregan we had our own foundries, but those are full of troggs and leper gnomes now, and nobody's going back for the machinery." },
      },
      choices = {
        { text = "Then someone should go and reclaim it.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 }, learn = { "gnomeregan" } } },
        { text = "Better to start over than die for old machines.", next = "BACK", fx = { align = { honor = -1 }, trait = { cautious = 1 }, learn = { "gnomeregan" } } },
      },
    },

    danger = {
      lines = {
        { id = "da_default", text = "Only if you're careless, and most engineers are, at first. Measure your powder, keep your sleeves rolled and never light a fuse indoors, and you'll lose far fewer eyebrows than the rest." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sorted parts in the great workshops of Gnomeregan, and I sort them here, though the workshops were rather larger." } },
    advice = { { id = "tp_ad", text = "Label your powders. Black powder and pepper look much the same in a dark tunnel." } },
    _none = { { id = "tp_none", text = "That's not a part I stock, I'm afraid, or one I've ever heard of, and I've catalogued every part that came out of Gnomeregan." } },
  },
}

-- Springspindle Fizzlegear: engineering trainer at Springspindle's Gadgets; certain the wheel is doomed.
P:NPC {
  key = "if_springspindle", id = TODO_NPC("Springspindle Fizzlegear"), name = "Springspindle Fizzlegear",
  bible = "bibles/tinker_town_shops.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "eager" }, values = { "inventive", "proud" },
  notices = { "craft" },

  impression = {
    first = "Springspindle Fizzlegear teaches engineering in his shop in Tinker Town and announces the end of the wheel to anyone who will listen. He is either a genius or a gnome who has stood too close to too many explosions, and possibly both.",
    third = "{name} met Springspindle Fizzlegear, who teaches engineering at Springspindle's Gadgets.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Springspindle's Gadgets, where tomorrow is invented today, or by Thursday at the latest!" },
    { id = "g_back", when = { metBefore = true }, text = "You're back! I've made progress on the wheel problem since you left, though I've also made a hole in the ceiling." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering" } },
      text = "An engineer! I can tell from the soot. Have you thought about specializing yet, because I have strong opinions on the matter." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I think the earth has put up with gnomes for a very long time and complained remarkably little. If I abolish the wheel, it'll be rolled over less, so I like to imagine it's on my side. You might ask it for me, though, in case it's grown fond of carts." } },
      choices = {
        { text = "I'll ask it honestly and tell you whatever it says.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Oh, it adores carts. You'd best give up now.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Your people ride great cats and walk everywhere else, which makes you the most advanced civilisation I've met, technically. I'm not sure that's what you were aiming for, but I admire the result." } },
      choices = {
        { text = "Change for its own sake is wasted effort.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep inventing. Someone has to replace the wheel.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Legs! Mechanical legs, on carts and cannons and very possibly on soldiers, so that nothing ever gets stuck in the mud again. The current prototype only walks backwards, and it occasionally explodes, but the principle is sound." } },
      choices = {
        { text = "Wheels work well enough. I'll keep my own legs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Build it. I'd ride a walking cannon gladly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That four legs are better than two, that a cat never falls over, and that a bear is just a very angry machine with excellent balance. My next prototype walks like a wolf, or it will, once it stops walking like a startled chicken." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Might I measure your {pet}'s stride while you're here? Purely for science, and I promise not to bring the calipers too close." },
      },
      choices = {
        { text = "Measure away, if my beast agrees to it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Pay me first. My beast isn't free for study.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's precisely the question, and my best guess is that the arcane doesn't like going in circles. Gnomeregan's engineers had it solved before the fall, but their notes are in the radiation, so I'm starting from nothing." } },
      choices = {
        { text = "Then we'll solve it again, safely, from the beginning.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Explosions are only data. Turn it up and see.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Mostly on its own, though there was an imp nearby at the time, and I have my suspicions. I'm a scientist, so I can't prove it, but I've also stopped inviting warlocks to my demonstrations." } },
      choices = {
        { text = "I'll keep my imp well clear of your demonstrations.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The imp probably improved it, Springspindle.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every day, which is why I test them on myself first, and why I've lost a great deal of hair. A good engineer worries about the people at the other end of the invention, and a great one does something about it." } },
      choices = {
        { text = "Then you're a good engineer. You think about who's standing nearby.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Inventors who worry too much never invent anything great.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Tell me about the wheel instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Better in some ways, worse in others, for it'll never tire, but it'll never love you either, and I've heard paladins and their chargers are very close. I'll keep working on it, but I'll leave the loving to the real ones." } },
      choices = {
        { text = "A living charger is a companion. Nothing should replace that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A machine that never tires would serve better. Build it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Springspindle.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Because a wheel squeaks, rattles and leaves tracks, and my replacement will do none of those things once I've stopped it exploding! Imagine a carriage that makes no sound at all, gliding along the road without a single rut to give it away." },
      },
      choices = {
        { text = "Some things should stay as they are, Springspindle.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Throw out the wheel. I'm with you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I don't suppose you could bless my prototype, because it's caught fire twice this week and I'm beginning to suspect it doesn't like me." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Imagine a charger that never tires, without wheels, of course, and you've imagined my next prototype, which I'll describe if you've a minute." },
        { id = "h_default", key = true,
          text = "Springspindle Fizzlegear, engineer, inventor and future destroyer of the wheel. If my calculations hold, wheels will be completely out of date within a generation, and I'll be the reason." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! I've been working on an arcane-powered replacement for the wheel, and I need someone to tell me why it keeps exploding." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock! I'd ask you not to summon anything near my prototypes, for the last one caught fire on its own and I don't need help." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Imagine a battlefield without wheels, with no carts and no chariots, only my marvellous replacement, which I'll describe if you've a minute." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've been studying how your beasts walk, you know, for my wheel replacement, and they've taught me a great deal." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Tell me, do your people use the wheel? Because I'm about to make it obsolete, and I'd hate for you to have invested heavily." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue! You'll appreciate this, then, because rogues move quietly and wheels squeak, and that's only the first of a hundred reasons the wheel is doomed!" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Do the elements have an opinion on wheels? Because if the earth objects to being rolled over, I'd like that in writing." },
      },
      again = {
        { id = "h_again", text = "More questions? Excellent, I love questions." },
        { id = "h_again2", text = "What else can I explain to you, at length?" },
      },
      choices = {
        { text = "Teach me engineering.", next = "BUSINESS" },
        { text = "What's wrong with the wheel?", next = "wheel" },
        { text = "What's the difference between gnomish and goblin engineering?", next = "spec" },
        { text = "You look like you've been hurt by an invention or two.", next = "hurt" },
        { text = "I studied tinkering in Gnomeregan as well.", next = "k_tinker", when = { origin = "gnome_tinker_apprentice" } },
        { text = "Why would an arcane wheel replacement keep exploding?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Did your last prototype really catch fire on its own?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What would replace the wheel on a battlefield, Springspindle?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What have hunters' beasts taught you, Springspindle?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "You must worry your inventions might hurt someone, Springspindle.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would a mechanical charger be as good as a living one?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do night elves even need the wheel, Springspindle?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why would a rogue care about the end of the wheel?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you think the earth minds your inventions, Springspindle?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll let you get back to it.", next = "END" },
      },
    },

    wheel = {
      lines = {
        { id = "wh_default", text = "It's round, it goes in one direction, and it gets stuck in mud, which, if you think about it, is very limiting. I'm working on a set of mechanical legs that can climb a mountain and step over a trogg at the same time." },
      },
      choices = {
        { text = "How close are you?", next = "wheel_close" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wheel_close = {
      lines = {
        { id = "wc_default", text = "The legs work splendidly, but only one at a time, so at the moment the machine hops. It hops very well, I'll say that for it, and I'm treating the hopping as an advantage until I fix it." },
      },
      choices = {
        { text = "Every great invention starts with failures.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Maybe the wheel is good enough.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
      },
    },

    spec = {
      lines = {
        { id = "sp_default", text = "Gnomish engineering is precise and clever and only occasionally turns you into a chicken, while goblin engineering is mostly explosives with a price tag. If you choose the gnomish way, come to me, and if you choose the goblin way, you'll have to go to Gadgetzan and talk to Nixx Sprocketspring." },
      },
      choices = {
        { text = "A chicken? Really?", next = "spec_chicken" },
        { text = "I'd choose the gnomish way.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd choose the goblin way. More explosions.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
      },
    },
    spec_chicken = {
      lines = {
        { id = "sc_default", text = "Only very briefly, and only if the device misfires, which is hardly ever. I've been a chicken three times myself, and I'm none the worse for it, apart from a fondness for seeds." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hurt = {
      lines = {
        { id = "hu_default", text = "Hurt is a strong word, but I have lost both eyebrows, one boot and the use of my left ear for a week. My apprentice says I've also lost my sense of caution, but he's an apprentice, so what does he know?" },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    k_tinker = {
      lines = {
        { id = "kt_default", text = "Then you'll know what we lost, all those workshops and half-finished machines. I keep telling myself we'll have the city back soon, and then I'll finish everything I left on the bench, the legs included." },
      },
      choices = {
        { text = "I'd like to help build the new machines.", next = "BACK", fx = { affinity = 2, learn = { "gnomeregan" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I designed pumps in Gnomeregan, and now I design legs, and someday I'll design something that does both." } },
    advice = { { id = "tp_ad", text = "Always keep a bucket of water near your workbench. Two, if you're working with powder." } },
    _none = { { id = "tp_none", text = "I'm sure I could invent something to do with that, but I don't know anything about it yet." } },
  },
}

-- Tally Berryfizz: alchemy trainer at Berryfizz's Potions and Mixed Drinks in Tinker Town.
P:NPC {
  key = "if_tally", id = TODO_NPC("Tally Berryfizz"), name = "Tally Berryfizz",
  bible = "bibles/tinker_town_shops.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "eager" }, values = { "curious", "friendly" },
  notices = { "craft" },

  impression = {
    first = "Tally Berryfizz teaches alchemy in a Tinker Town shop that sells both potions and mixed drinks, and insists she keeps them on separate shelves. She is cheerful, quick, and smells faintly of peppermint and sulfur.",
    third = "{name} met Tally Berryfizz, who teaches alchemy in Tinker Town.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Berryfizz's Potions and Mixed Drinks! Potions on the left, drinks on the right, a precise three feet between them, and please don't mix them up." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did that last potion agree with you? I hope so, because I measured it to the drop, and it was meant to." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { "Herbalism" } },
      text = "Oh, you've got peacebloom in your pockets, I can smell it from here. An herbalist and an alchemist should be the best of friends, you know." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I suspect you do! A Wildhammer I bought from once said a word over every root before he pulled it, and his peacebloom outlasted mine by a week. I tried saying words too, but I think the herbs could tell I was reading them off a card." } },
      choices = {
        { text = "It's the respect that matters, not the words, Tally.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It's probably the soil. Sentiment doesn't keep herbs fresh.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Healing, first and always, and an elixir of strength if you're going up against the ogres of Mo'grosh. I've watched warriors come back from Loch Modan with nothing in their packs but empty vials, and I take it as a compliment." } },
      choices = {
        { text = "I'll carry plenty and save them for need.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll drink them freely. That's what they're for.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Peacebloom and silverleaf, mostly, and earthroot from the hills above Kharanos, for it grows where the boars root about. A hunter has an eye for where things grow, because a hunter has an eye for where things eat." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} probably knows more about herbs than either of us, since it's been sniffing them all its life." },
      },
      choices = {
        { text = "I'll pick carefully and leave the roots to regrow.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll pick the hills bare and sell the lot to you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because I'd rather my students saved lives than ended them, and because the guards would ask questions. The Forlorn Cavern has others who teach your sort of brewing, and I'd prefer not to know the details." } },
      choices = {
        { text = "Healing's the better art, Tally. I respect your choice.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A poison and a potion are the same art, Tally.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Like berries mixed with something that isn't berries, which is the best I've managed so far. Gnomeregan's alchemists had a better recipe, but they left it behind, and I'm working from memory." } },
      choices = {
        { text = "I'll drink it gladly and help you improve it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Taste doesn't matter. Just make it stronger.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Very well, though some of the older priests think potions are cheating, which makes me laugh, because they'll drink one quick enough when the trolls are coming. I think a healer should use whatever saves a life, and I'll say so to anyone." } },
      choices = {
        { text = "Faith first, then potions. Prayer comes before anything brewed.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Whatever saves a life is right. Potions and prayers both.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Teach me alchemy, Tally.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Oh, I've a potion that hardens the skin, very useful if you're standing in front of someone and something's trying to hit them. I'd give one to every paladin in Ironforge if they'd stand still long enough to drink it." } },
      choices = {
        { text = "Then I'll take one, to protect whoever stands behind me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll keep it for myself. A paladin can't protect anyone dead.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Goodbye, Tally.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because half my potions need it and the other half are mixed drinks, which is why I keep them on very separate shelves! Your servant can sit by the door if it likes, but if it touches the green bottles, I won't be held responsible." },
      },
      choices = {
        { text = "I'll keep it by the door.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "It'll touch what it likes. Fair warning.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You'll want healing potions, I expect, for when your prayers run low, and they will; I've seen it happen to the very best of them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll want healing potions, I expect, though your sort heal yourselves, so maybe something for the troggs instead." },
        { id = "h_default", key = true,
          text = "Tally Berryfizz, alchemist! I teach anyone who wants to learn how to turn a handful of weeds into something that'll save their life, with the proportions written down exactly, and I've never yet lost a student, or not for very long." },
        { id = "h_tinkertown", when = { origin = "gnome_ironforge_raised" },
          text = "Oh, you're a Tinker Town child, I'd know that quiet anywhere! We all learned to keep our voices down when the dwarves were drinking, didn't we? Well, you can be as loud as you like in my shop." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "Tally Berryfizz, alchemist, and I think you'll be good at this, being a druid. You already know which plants heal and which ones bite, so I only have to teach you the boiling part." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! You'll want poisons, I expect, and I'll tell you now I only teach the healing sort." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! You'll want mana potions, I expect, and I've a new recipe that tastes almost like berries." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want healing potions, I expect, and plenty of them, because warriors drink them like ale." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Bring me herbs from the hills, would you? Hunters always know where the best ones grow." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Don't worry, the sulfur smell in here is mine, not yours, so nobody can blame your servant for once." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! The herbs you pick must be happier than mine. Mine always look a little offended by the time they reach the bench." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I've a kettle on, and it boils over at exactly nine minutes, so we've about six." },
        { id = "h_again2", text = "Ask away, while the potion bubbles." },
      },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "Why sell potions and mixed drinks together?", next = "drinks" },
        { text = "Where can I find herbs near Ironforge?", next = "herbs" },
        { text = "What's the most useful potion?", next = "useful" },
        { text = "Why won't you teach poisons, Tally?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What does your mana potion actually taste like?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Which potions should a warrior always carry, Tally?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Which herbs do hunters bring you, Tally?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do potions and prayer work well together, Tally?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you ever brew anything to protect others, Tally?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why does your shop smell of sulfur, Tally?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does a shaman pick herbs differently, Tally?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Tally.", next = "END" },
      },
    },

    drinks = {
      lines = {
        { id = "dr_default", text = "Because the dwarves wanted a drink and the adventurers wanted a potion, and I thought, why not both, with a shared still and half the overhead? The mixed drinks pay the rent, and the potions pay for the next experiment, so everybody wins." },
      },
      choices = {
        { text = "Someone must have mixed them up by now.", next = "drinks_mixed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drinks_mixed = {
      lines = {
        { id = "dm_default", text = "Only once, and he turned a lovely shade of blue for an afternoon, and now he only orders the blue drinks, so I think he enjoyed it. That's why the shelves are labeled in very large letters now." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    herbs = {
      lines = {
        { id = "he_default", text = "Peacebloom and silverleaf grow all over Dun Morogh, if you look under the snow by the roads. Earthroot likes rocky ground, so try near the hills, and if you go to Loch Modan, you'll find more around the lake." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    useful = {
      lines = {
        { id = "us_default", text = "A healing potion, every time, because a dead adventurer can't buy anything else from me. After that, I'd say a potion that lets you breathe underwater, since half of Azeroth seems to be lakes." },
      },
      choices = {
        { text = "I'd rather save my potions for my friends.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Potions are for me first. Friends can buy their own.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I mixed potions in Gnomeregan, before, and I mixed drinks in Gnomeregan too, just never in the same shop." } },
    advice = { { id = "tp_ad", text = "Stir clockwise, unless the recipe says otherwise. And if it smokes, step back." } },
    _none = { { id = "tp_none", text = "I don't know about that, sorry, and I can't distil an answer out of nothing, though I've tried! Ask me about potions instead." } },
  },
}
