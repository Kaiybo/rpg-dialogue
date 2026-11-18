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
      text = "Singed eyebrows, if I'm not mistaken. Welcome, fellow engineer; you'll want the coarse powder this time, whatever you used last time." },
    { id = "n_apprentice", cat = "origin", when = { origin = "gnome_tinker_apprentice" },
      text = "You're an apprentice, I can tell by the way you're counting the blasting powder in your head. How many explosions so far? Don't tell me, because I'd rather not know which of my parts were involved." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "My readings say maybe, and my readings are usually right about maybes. The trouble is that lightning doesn't arrive in a steady current, it arrives in a temper. I'd need a shaman with a calm disposition and a very forgiving eyebrow." } },
      choices = {
        { text = "The storm isn't a battery. I'll not misuse it.", next = "BACK", reply = "That's a pity for my readings but probably a kindness to my workshop, which has survived four lightning tests already and would like to retire.", fx = { align = { honor = 1 } } },
        { text = "I'll test it for you. Forgiving eyebrows and all.", next = "BACK", reply = "Splendid, and I'll put the insulated gloves on the counter for you, though I'll warn you the last volunteer still smells faintly of burnt pudding.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only when it's used badly, which is more often than I'd like, because people buy cheap flux elsewhere. Good engineering makes a clean hole exactly where you want it and nowhere else." } },
      choices = {
        { text = "Careful work is the best anyone can ask for.", next = "BACK", reply = "Exactly so, and I wish more of my customers agreed, because a careful engineer is worth three clever ones and about nine cheap ones.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "No blast is ever clean. The land remembers every one.", next = "BACK", reply = "Hmm, I suppose the land would have very good records, then, and I'll take that as a note on my error margins, though I still think mine are cleaner than most.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only in a charge, and only if you throw it first and run second, which is the order most warriors get wrong. I'd sell you a stick if you were an engineer, but you're not, so I'll sell you a whetstone and save us both the explosion." } },
      choices = {
        { text = "A whetstone, then. I'll trust plain steel.", next = "BACK", reply = "A sensible choice, and plain steel has a ninety-nine percent record of not exploding in its owner's hand, which is better than my best powder manages.", fx = { align = { order = 1 } } },
        { text = "Sell me the powder anyway. I'll learn quickly.", next = "BACK", reply = "Learn quickly, he says, as if that's how powder works, but very well, I'll sell it, and I'll keep the bandages within arm's reach of the till.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A good one will, if it's mounted straight, and a cheap one will throw your shot a hand's width to the left, which is how bears get close. I sell the parts and the engineers mount them, so if it's crooked, it's their fault." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A good one will, if it's mounted straight, and a cheap one will throw your shot a hand's width to the left. And keep your {pet} away from the flux, please, for it smells sweet and it isn't." },
      },
      choices = {
        { text = "I'll pay for good parts, mounted straight.", next = "BACK", reply = "Now that's a customer after my own heart, and I'll sell you the parts and send you to a good engineer, so the bear stays where it belongs.", fx = { align = { order = 1 } } },
        { text = "A cheap scope and a good eye will do.", next = "BACK", reply = "A good eye compensates for roughly four percent of a bad scope, by my figures, so do let me know how the bear takes the other ninety-six.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "To anyone who pays, and I assume they're for opening chests in Gnomeregan, which is a perfectly honest use. What you do with them after is between you and the guards." } },
      choices = {
        { text = "They'll open chests in Gnomeregan, nothing more.", next = "BACK", reply = "Splendid, that's what I wrote on the receipt, and I'd much rather read it there than in the guards' reports.", fx = { align = { honor = 1 } } },
        { text = "The guards and I have an understanding. I avoid them.", next = "BACK", reply = "Well, I'll not ask what sort, and I'll not remember your face, which is a service I don't charge for, but please don't make me regret it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Once, and the smell lingered for a month. I've no objection to your craft, mind, but I'd like my parts used for engineering and not for whatever it is you do in the dark." } },
      choices = {
        { text = "I'll use your parts for engineering, Gearcutter, on my word.", next = "BACK", reply = "Thank you, truly, because I've only just got the last smell out of the curtains, and I'd like the next month to smell of oil and brass.", fx = { align = { light = 1 } } },
        { text = "What I do in the dark is my own business.", next = "BACK", reply = "Of course it is, and the smell is my business, so we'll both keep to our own affairs, and you'll kindly open the window before you leave.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than I'd like, and almost always because they bought cheap flux somewhere else, which I tell them every time. The Mystic Ward's priests have patched up half of Tinker Town, and I've stopped counting the eyebrows." } },
      choices = {
        { text = "Then I'll help where I can. Carelessness shouldn't cost a life.", next = "BACK", reply = "Oh, that's very good of you, and if you could tell them to stop buying cheap flux while you're at it, I'd be eternally grateful.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Buy cheap flux, get cheap welds. Let them find out.", next = "BACK", reply = "That's what I tell them, nearly word for word, but somehow they keep coming back with bandaged fingers expecting me to sympathise.", fx = { align = { light = -1 } } },
        { text = "Let me see your parts.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "In Tinker Town? No, but in the Commons there's a trader who sells flux he hasn't tested, and he knows it, and I've told the guards, and they've done nothing. A paladin who'd have a word with him would do more good than I can." } },
      choices = {
        { text = "I'll have a word. Cheating buyers is theft with a smile.", next = "BACK", reply = "Would you? Oh, that would be marvellous, and if he argues, ask him to light a match near his own flux, because I already know how that ends.", fx = { align = { order = 1 } } },
        { text = "Let the market punish him. Buyers should test their own parts.", next = "BACK", reply = "That's what the guards said, more or less, and in the meantime the market punishes my customers' eyebrows, which seems a very slow kind of justice.", fx = { align = { order = -1 } } },
        { text = "Something else, Gearcutter.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Once, and only a little, though it took me a week to find every washer! Most explosions in Tinker Town come from cheap flux, but the rest come from mages who think a little frost won't hurt anything, and it always does." },
      },
      choices = {
        { text = "Fair. I'll cast nothing near your stock.", next = "BACK", reply = "Thank you, and I'll mark it down as a confirmed safe customer, which puts you in a very small and very select category in this shop.", fx = { align = { order = 1 } } },
        { text = "A little frost never hurt anyone.", next = "BACK", reply = "It hurt my entire stock of copper tubing, which shattered like sugar glass, so please keep your frost in your pockets while you browse.", fx = { align = { order = -1 } } },
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
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've parts for rifle scopes in the back, and each scope's been tested twice, like everything else here." },
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
        { id = "ne_default", text = "A blacksmith hammer, an arclight spanner, a steady hand and a sack of copper bars. Springspindle will teach you the rest next door, though he'll talk about wheels until your ears ring." },
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
        { text = "Then someone should go and reclaim it.", next = "BACK", reply = "Someone should, and the High Tinker says someone will, though I've noticed nobody ever volunteers to be the first someone through the door.", fx = { align = { honor = 1 }, trait = { brave = 1 }, learn = { "gnomeregan" } } },
        { text = "Better to start over than die for old machines.", next = "BACK", reply = "That's the sensible view, and I hold it on Mondays and Thursdays, but on the other days I miss my old foundry so much I could weep into my washers.", fx = { align = { honor = -1 }, trait = { cautious = 1 }, learn = { "gnomeregan" } } },
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
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's goblins sell parts that'll fail you in a week, and they'll sell you the replacement just as quick. I've built my whole business on the people who come back from there angry." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay buys my washers by the crate, and I've no idea what the pirates do with them. I've stopped asking, and I've raised the price." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Every part in this shop could've come from Gnomeregan once, and some of them did. I salvaged what I could on the way out, and I'm not ashamed of it." } },
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
        { text = "I'll ask it plainly and tell you whatever it says.", next = "BACK", reply = "Oh, would you, that's wonderful, and I'll record its answer very precisely, especially if it says anything about carts, which I suspect it will.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Oh, it adores carts. You'd best give up now.", next = "BACK", reply = "Nonsense, nobody adores carts, people simply put up with them because they don't know there's anything better, and soon there will be.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Your people ride great cats and walk everywhere else, which makes you the most advanced civilisation I've met, technically. I'm not sure that's what you were aiming for, but I admire the result." } },
      choices = {
        { text = "Change for its own sake is wasted effort.", next = "BACK", reply = "Wasted? Only in the short term, and only if you don't count the data, which is the part everybody forgets when they're laughing at me.", fx = { align = { order = 1 } } },
        { text = "Keep inventing. Someone has to replace the wheel.", next = "BACK", reply = "Thank you, at last, someone with vision, and I'll name the first prototype after you if it survives the first test, which most don't.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Legs! Mechanical legs, on carts and cannons and very possibly on soldiers, so that nothing ever gets stuck in the mud again. The current prototype only walks backwards, and it occasionally explodes, but the principle is sound." } },
      choices = {
        { text = "Wheels work well enough. I'll keep my own legs.", next = "BACK", reply = "Your legs are fine prototypes, I'll grant you, but they get tired, and mine only go backwards, so between us we've a very balanced army.", fx = { align = { order = 1 } } },
        { text = "Build it. I'd ride a walking cannon gladly.", next = "BACK", reply = "Oh, splendid, I'll put your name on the waiting list, which is currently very short, mostly because the last volunteer is still recovering.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That four legs are better than two, that a cat never falls over, and that a bear is just a very angry machine with excellent balance. My next prototype walks like a wolf, or it will, once it stops walking like a startled chicken." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That four legs are better than two, and that a bear is just a very angry machine with excellent balance. Might I measure your {pet}'s stride while you're here? Purely for science, I promise." },
      },
      choices = {
        { text = "Measure away, if my beast agrees to it.", next = "BACK", reply = "Splendid, I'll fetch the measuring tape, and if your beast objects to my calipers, I'll take that as data too, from a safe distance.", fx = { align = { honor = 1 } } },
        { text = "Pay me first. My beast isn't free for study.", next = "BACK", reply = "Pay? Well, I suppose that's fair, and I can offer you a fascinating mention in my next paper, which I'm told is worth something to somebody.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's precisely the question, and my best guess is that the arcane doesn't like going in circles. Gnomeregan's engineers had it solved before the fall, but their notes are in the radiation, so I'm starting from nothing." } },
      choices = {
        { text = "Then we'll solve it again, safely, from the beginning.", next = "BACK", reply = "From the beginning is the only way, and the safest, and I've already started on page one, though page one has been rewritten eleven times.", fx = { align = { order = 1 } } },
        { text = "Explosions are only data. Turn it up and see.", next = "BACK", reply = "Spoken like a true gnome, and I'll do it, but you'll stand behind the blast shield with me, because data is only useful if someone survives to write it down.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Mostly on its own, though there was an imp nearby at the time, and I have my suspicions. I'm a scientist, so I can't prove it, but I've also stopped inviting warlocks to my demonstrations." } },
      choices = {
        { text = "I'll keep my imp well clear of your demonstrations.", next = "BACK", reply = "Thank you, very thoughtful, and I'll mark your imp down as cleared of suspicion until the next unexplained explosion, at least.", fx = { align = { light = 1 } } },
        { text = "The imp probably improved it, Springspindle.", next = "BACK", reply = "Improved it? It turned it into a crater, which I suppose is an improvement in depth, but not in any of the directions I was hoping for.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every day, so I test them on myself first, and I've lost roughly forty percent of my hair to it. A good engineer worries about the people at the other end of the invention, and a great one does something about it." } },
      choices = {
        { text = "Then you're a good engineer. You think about who's standing nearby.", next = "BACK", reply = "Thank you, that's very kind, and I'll tell my last test subject you said so, though he's still not speaking to me about the eyebrows.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Inventors who worry too much never invent anything great.", next = "BACK", reply = "That's what my old mentor said, and he invented a great many marvellous things, and he also blew up three workshops and one very large goat.", fx = { align = { light = -1 } } },
        { text = "Tell me about the wheel instead.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Better in some ways, worse in others, for it'll never tire, but it'll never love you either, and I've heard paladins and their chargers are very close. I'll keep working on it, but I'll leave the loving to the real ones." } },
      choices = {
        { text = "A living charger is a companion. Nothing should replace that.", next = "BACK", reply = "That's a lovely way to see it, and I'll keep the living chargers well in mind, though I may put a little spring in the saddle for comfort.", fx = { align = { order = 1 } } },
        { text = "A machine that never tires would serve better. Build it.", next = "BACK", reply = "I will, I will, and you'll be the first to ride it, though I'd advise against taking it into battle until it stops hopping sideways.", fx = { align = { order = -1 } } },
        { text = "Something else, Springspindle.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Because a wheel squeaks, rattles and leaves tracks, and my replacement will do none of those things once I've stopped it exploding! Imagine a carriage that makes no sound at all, gliding along the road without a single rut to give it away." },
      },
      choices = {
        { text = "Some things should stay as they are, Springspindle.", next = "BACK", reply = "Some things, perhaps, but the wheel isn't one of them, and I'll prove it, as soon as I've stopped my replacement from exploding.", fx = { align = { order = 1 } } },
        { text = "Throw out the wheel. I'm with you.", next = "BACK", reply = "At last, someone who understands, and I'll name a cog after you, a small one admittedly, but a cog is a very high honour in my workshop.", fx = { align = { order = -1 } } },
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
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've been studying how your beasts walk, you know, for my wheel replacement, and their knees have taught me more than any textbook." },
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
        { text = "Every great invention starts with failures.", next = "BACK", reply = "Exactly, and this one has had seventeen of them so far, which by my reckoning means it's very nearly great, or very nearly a pile of scrap.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Maybe the wheel is good enough.", next = "BACK", reply = "Good enough? Good enough is what people said about candles before someone invented the lantern, and the lantern only exploded twice.", fx = { align = { order = 1 }, affinity = -1 } },
      },
    },

    spec = {
      lines = {
        { id = "sp_default", text = "Gnomish engineering is precise and clever and only occasionally turns you into a chicken, while goblin engineering is mostly explosives with a price tag. If you choose the gnomish way, come to me, and if you choose the goblin way, you'll have to go to Gadgetzan and talk to Nixx Sprocketspring." },
      },
      choices = {
        { text = "A chicken? Really?", next = "spec_chicken" },
        { text = "I'd choose the gnomish way.", next = "BACK", reply = "Splendid choice, and the right one, and I'll train you properly so you'll only turn into a chicken on the very rare occasion it's useful.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd choose the goblin way. More explosions.", next = "BACK", reply = "Oh, well, every engineer to their own taste, I suppose, but do keep a healer nearby, and maybe a spare pair of eyebrows.", fx = { align = { order = -1 }, affinity = -1 } },
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
    gnomeregan = { { id = "tp_gnomeregan", text = "Gnomeregan was the finest workshop the world's ever known, and I left half a prototype on my bench there. If the troggs have touched it, I'll never forgive them." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "The goblins in Gadgetzan build things that explode, and they think that's the point. A gnome builds things that explode only when we mean them to, and that's called engineering." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's got a steam tonk that I designed, and somebody stole it, and they're running races on it now. I want royalties, or at least a ride." } },
    _none = { { id = "tp_none", text = "I'm sure I could invent something to do with that, but I don't know anything about it yet." } },
  },
}

-- Tally Berryfizz: alchemy trainer at Berryfizz's Potions and Mixed Drinks in Tinker Town.
P:NPC {
  key = "if_tally", id = TODO_NPC("Tally Berryfizz"), name = "Tally Berryfizz", gender = "female",
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
    { id = "g_fl_spill", when = { flirt = true, metBefore = true, chance = 0.4 },
      text = "Oh! It's you, and I've just spilled a measured dram of peacebloom tincture down my sleeve, which I almost never do. That's the third time this month, and each time you've been standing exactly where you are now." },
    { id = "g_fl_back", when = { flirt = true, npcFlagBefore = "fl_yes" }, cooldown = "3d",
      text = "You're back! I've put a cushion on the stool by the bench, raised a precise nine inches, in case you'd like to sit and watch me boil things." },
    { id = "g_fl_no", when = { flirt = true, npcFlagBefore = "fl_no" }, once = true,
      text = "Welcome back! Potions on the left, drinks on the right, and no more clumsy remarks from me; I've written that down, so it must be true." },
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
        { text = "It's the respect that matters, not the words, Tally.", next = "BACK", reply = "Oh, that's lovely, and I'll try respect next time instead of the words, though I'm not quite sure how you measure it in a phial.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It's probably the soil. Sentiment doesn't keep herbs fresh.", next = "BACK", reply = "It might well be, and I've taken soil samples to check, but I still say a word over my peacebloom now, just in case.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Healing, first and always, and an elixir of strength if you're going up against the ogres of Mo'grosh. I've watched warriors come back from Loch Modan with nothing in their packs but empty vials, and I take it as a compliment." } },
      choices = {
        { text = "I'll carry plenty and save them for need.", next = "BACK", reply = "Good, because the warriors who save them are the ones who come back to buy more, and I'd like to see you back here, healthy and spending.", fx = { align = { order = 1 } } },
        { text = "I'll drink them freely. That's what they're for.", next = "BACK", reply = "They are, I suppose, but please don't drink them all before you've even reached Loch Modan, or you'll be very healthy and very broke.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Peacebloom and silverleaf, mostly, and earthroot from the hills above Kharanos, for it grows where the boars root about. A hunter has an eye for where things grow, because a hunter has an eye for where things eat." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Peacebloom and silverleaf, mostly, and earthroot from the hills above Kharanos, where the boars root about. Your {pet} probably knows more about herbs than either of us, since it's been sniffing them all its life." },
      },
      choices = {
        { text = "I'll pick carefully and leave the roots to regrow.", next = "BACK", reply = "Wonderful, and the hills will thank you, and so will I, because it means there'll be earthroot next season and the season after that.", fx = { align = { honor = 1 } } },
        { text = "I'll pick the hills bare and sell the lot to you.", next = "BACK", reply = "Well, I'll buy what you bring, I suppose, but if the hills are bare next year, I'll be selling very thin potions and blaming you for it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because I'd rather my students saved lives than ended them, and because the guards would ask questions. The Forlorn Cavern has others who teach your sort of brewing, and I'd prefer not to know the details." } },
      choices = {
        { text = "Healing's the better art, Tally. I respect your choice.", next = "BACK", reply = "Thank you, really, and I'll tell my students a rogue said so, which might make them pay a bit more attention in class.", fx = { align = { honor = 1 } } },
        { text = "A poison and a potion are the same art, Tally.", next = "BACK", reply = "They might be, technically, but I'd rather my reagents ended up in someone's healing than someone's soup, so I'll keep my shelves as they are.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Like berries mixed with something that isn't berries, which is the best I've managed so far. Gnomeregan's alchemists had a better recipe, but they left it behind, and I'm working from memory." } },
      choices = {
        { text = "I'll drink it gladly and help you improve it.", next = "BACK", reply = "Oh, splendid, I'll pour you a glass, and if you could tell me which part tastes most like not-berries, that would help my notes enormously.", fx = { align = { order = 1 } } },
        { text = "Taste doesn't matter. Just make it stronger.", next = "BACK", reply = "Stronger I can do, though the last batch made a dwarf hiccup bubbles for an hour, so I'll need to adjust the ratios slightly first.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Very well, though some of the older priests think potions are cheating, which makes me laugh, because they'll drink one quick enough when the trolls are coming. I think a healer should use whatever saves a life, and I'll say so to anyone." } },
      choices = {
        { text = "Faith first, then potions. Prayer comes before anything brewed.", next = "BACK", reply = "That's a very proper answer, and the older priests would love you, though I'll still keep a healing potion in your pack just in case.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Whatever saves a life is right. Potions and prayers both.", next = "BACK", reply = "Exactly, that's what I've always said, and you'll find a potion and a prayer get along much better than the old priests think.", fx = { align = { light = -1 } } },
        { text = "Teach me alchemy, Tally.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Oh, I've a potion that hardens the skin, very useful if you're standing in front of someone and something's trying to hit them. I'd give one to every paladin in Ironforge if they'd stand still long enough to drink it." } },
      choices = {
        { text = "Then I'll take one, to protect whoever stands behind me.", next = "BACK", reply = "That's lovely, and I'll make it a good one, because anyone who stands in front of people deserves the very best I can brew.", fx = { align = { honor = 1 } } },
        { text = "I'll keep it for myself. A paladin can't protect anyone dead.", next = "BACK", reply = "Well, that's very practical, and I can't fault the logic. Do share one or two, though, because the ones behind you drink potions too.", fx = { align = { honor = -1 } } },
        { text = "Goodbye, Tally.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because half my potions need sulfur, which is why the mixed drinks sit on a very separate shelf! Your servant can wait by the door if it likes, but if it touches the green bottles, I won't be held responsible." },
      },
      choices = {
        { text = "I'll keep it by the door.", next = "BACK", reply = "Thank you, and I'll keep the cider well away from it, because the last imp that wandered in here drank half a shelf and started singing.", fx = { align = { order = 1 } } },
        { text = "It'll touch what it likes. Fair warning.", next = "BACK", reply = "Fair warning taken, and I'll move the mixed drinks out of reach, because I'd rather lose a potion than explain to a customer what happened to their cider.", fx = { align = { order = -1 } } },
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
        { text = "You've measured that same vial three times, Tally.", next = "fl_vial", when = { flirt = true } },
        { text = "Goodbye, Tally.", next = "END" },
      },
    },
    fl_vial = {
      lines = {
        { id = "fl_vial_default", text = "Have I? Oh dear, I have. I've been working out a little formula for how much nicer the shop is when you're in it, and I keep getting a number that's frankly unscientific." },
        { id = "fl_vial_tall", when = { race = { "Human", "NightElf", "Dwarf" } },
          text = "Have I? Oh dear, I have. I keep looking up at you and losing count, and I've worked out that the shop is roughly forty percent nicer when you're in it, which is a frankly unscientific result." },
        { id = "fl_vial_gnome", when = { race = "Gnome" },
          text = "Have I? Oh dear, I have. You've the steadiest hands I've seen since Gnomeregan, and I've been wondering whether you'd share a pot of tea after closing, purely in the interest of research." },
      },
      choices = {
        { text = "Your numbers sound right to me, Tally.", next = "fl_vial2",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "fl_yes" } } } },
        { text = "I'd be glad to share that tea, Tally.", next = "fl_vial2", when = { race = "Gnome" },
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "fl_yes" } } } },
        { text = "Check your sums again, Tally. I'm only a customer.", next = "BACK",
          reply = "Oh! Yes, of course, a customer, which is a perfectly good thing to be. I'll check my sums at once, and then possibly hide under the bench for a while.",
          fx = { trait = { reserved = 1 }, npcFlag = { set = { "fl_no" } } } },
      },
    },
    fl_vial2 = {
      lines = {
        { id = "fl_vial2_default", text = "Oh! Well, that's very good to hear, and I'm writing it in the margin of my ledger right next to the price of earthroot, so I don't forget it. Now hand me that vial, please, before I drop something that explodes." },
      },
      choices = {
        { text = "Carefully, Tally. I'd like you in one piece.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
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
        { text = "I'd rather save my potions for my friends.", next = "BACK", reply = "That's very thoughtful, and I'll make sure you've enough to go round, because a friend who saves potions is a friend worth brewing for.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Potions are for me first. Friends can buy their own.", next = "BACK", reply = "Well, I suppose that's sensible, and good for business too, but I'd hate to think of your friends coming back to my shop looking quite so bruised.", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I mixed potions in Gnomeregan, before, and I mixed drinks in Gnomeregan too, just never in the same shop." } },
    advice = { { id = "tp_ad", text = "Stir clockwise, unless the recipe says otherwise. And if it smokes, step back." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "The goblins in Gadgetzan sell potions that do exactly what the label says, at least until they don't. I've a cousin who drank one and spoke only in rhymes for a week." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken brew plagues, so the rumors go, and I'd like a sample just to see how they did it. Purely for science, and with the lid on very tight, I promise." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I sell my brightest potions at the Faire, the ones that make you glow for an hour, and the children love them. Don't tell their mothers, please." } },
    _none = { { id = "tp_none", text = "I don't know about that, sorry, and I can't distil an answer out of nothing, though I've tried! Ask me about potions instead." } },
  },
}
