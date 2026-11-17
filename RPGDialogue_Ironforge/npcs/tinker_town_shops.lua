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
  },

  start = "hello",
  nodes = {
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gearcutter Cogspinner, engineering supplies, and every part in this shop is tested twice before it's sold. If something of mine blows up, it's because you meant it to, and that's the only kind of explosion I'll stand behind." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! I'll tell you now that my lockpicks are tested twice, like everything else, and that I don't ask what they're for." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock! I'll warn you that none of my parts are rated for fel energy, and I won't take them back if they melt." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want blasting powder, I imagine; everybody does, sooner or later." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've parts for rifle scopes in the back, and every one of them's been tested twice, like everything else here." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a box of springs to count." },
        { id = "h_again2", text = "Next question, please." },
      },
      choices = {
        { text = "Let me see your parts.", next = "BUSINESS" },
        { text = "What does a new engineer need?", next = "need" },
        { text = "Where do your parts come from now?", next = "parts" },
        { text = "Is engineering really so dangerous?", next = "danger" },
        { text = "Do you really sell lockpicks to anyone who asks?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Has fel energy melted your parts before?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would blasting powder be any use to a warrior?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Could a scope really improve my aim, Gearcutter?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
    _none = { { id = "tp_none", text = "That's not a part I stock, I'm afraid, or one I've ever heard of." } },
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
        { text = "Fair enough. I'll keep the imp well away from your work.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The imp probably improved it, Springspindle.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Springspindle Fizzlegear, engineer, inventor and future destroyer of the wheel. If my calculations hold, wheels will be completely out of date within a generation, and I'll be the reason." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! I've been working on an arcane-powered replacement for the wheel, and I need someone to tell me why it keeps exploding." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock! I'd ask you not to summon anything near my prototypes, for the last one caught fire on its own and I don't need help." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Imagine a battlefield without wheels, with no carts and no chariots, only my marvellous replacement, which I'll describe if you've a minute." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've been studying how your beasts walk, you know, for my wheel replacement, and they've taught me a great deal." },
      },
      again = {
        { id = "h_again", text = "More questions? Excellent, I love questions." },
        { id = "h_again2", text = "What else can I explain to you, at length?" },
      },
      choices = {
        { text = "Teach me engineering.", next = "BUSINESS" },
        { text = "What's wrong with the wheel?", next = "wheel" },
        { text = "What's the difference between gnomish and goblin engineering?", next = "spec" },
        { text = "Have you ever been hurt by an invention?", next = "hurt" },
        { text = "I studied tinkering in Gnomeregan as well.", next = "k_tinker", when = { origin = "gnome_tinker_apprentice" } },
        { text = "Why would an arcane wheel replacement keep exploding?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Did your last prototype really catch fire on its own?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What would replace the wheel on a battlefield, Springspindle?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What have hunters' beasts taught you, Springspindle?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
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
        { text = "A chicken? Truly?", next = "spec_chicken" },
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
    { id = "g_default", text = "Welcome to Berryfizz's Potions and Mixed Drinks! Potions on the left, drinks on the right, and please don't mix them up." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did that last potion agree with you? I hope so, because it was meant to." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { "Herbalism" } },
      text = "Oh, you've got peacebloom in your pockets, I can smell it from here. An herbalist and an alchemist should be the best of friends, you know." },
  },

  start = "hello",
  nodes = {
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tally Berryfizz, alchemist! I teach anyone who wants to learn how to turn a handful of weeds into something that'll save their life, and I've never yet lost a student, or not for very long." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "Tally Berryfizz, alchemist, and I think you'll be good at this, being a druid. You already know which plants heal and which ones bite, so I only have to teach you the boiling part." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! You'll want poisons, I expect, and I'll tell you now I only teach the healing sort." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! You'll want mana potions, I expect, and I've a new recipe that tastes almost like berries." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want healing potions, I expect, and plenty of them, because warriors drink them like ale." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Bring me herbs from the hills, would you? Hunters always know where the best ones grow." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I've a kettle on." },
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
        { text = "Goodbye, Tally.", next = "END" },
      },
    },

    drinks = {
      lines = {
        { id = "dr_default", text = "Because the dwarves wanted a drink and the adventurers wanted a potion, and I thought, why not both? The mixed drinks pay the rent, and the potions pay for the next experiment, so everybody wins." },
      },
      choices = {
        { text = "Has anyone mixed them up?", next = "drinks_mixed" },
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
    _none = { { id = "tp_none", text = "I don't know about that, sorry! Ask me about potions instead." } },
  },
}
