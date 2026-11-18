-- The Sepulcher's tradesfolk: leather, bows, plate, trade goods and the stables.
-- Voices: bibles/sepulcher_market.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC = P.TODO_NPC

-- Alexandre Lefevre: leather armor merchant.
P:NPC {
  key = "sp_lefevre", id = TODO_NPC("Alexandre Lefevre"), name = "Alexandre Lefevre", title = "Leather Armor Merchant",
  bible = "bibles/sepulcher_market.md", role = "vendor", tier = "service",
  communities = { "sepulcher" }, temper = { "proud", "dry" }, values = { "craft", "proud" },
  notices = { "kit", "craft" },
  impression = {
    first = "Alexandre Lefevre sells leather armor in the Sepulcher and judges every stitch on a customer's back. He is vain about his craft and quietly firm about the one hide he will never work.",
    third = "{name} met Alexandre Lefevre, who sells and mends leather armor at the Sepulcher.",
  },
  greetings = {
    { id = "g_default", text = "Come in, come in, and mind the hides by the door. Some of them are still deciding whether to be armor." },
    { id = "g_leather", when = { class = { "ROGUE", "DRUID", "HUNTER" } }, text = "Ah, someone who wears leather for a living. Turn around, let me see the seams, and then let me apologise on behalf of whoever sewed them." },
    { id = "g_away", when = { away = 14 }, text = "{away} away, and you come back in the same jerkin. I'm wounded, though I'll recover if you buy something." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your leathers are in rags, and in Silverpine rags get you bitten. Let me mend them before the worgen finish the job." },
    { id = "n_skin", cat = "craft", when = { profession = { "Skinning", "Leatherworking" } },
      text = "You skin, I can tell by the knife. Bring me good hides and we'll talk, and bring me bad ones and we'll also talk, but less pleasantly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Alexandre Lefevre, and that's leather on every hook you see. I made saddles in Lordaeron when there were horses to sit on them, and now I make jerkins for soldiers who can't feel the cold, which is easier work and less rewarding." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "One of us, and dressed like one of us, which is to say badly. The dead have no excuse to look shabby; we've all the time in the world to keep our things in order." },
      },
      again = {
        { id = "h_again", text = "Something else? I'm only waxing thread, and thread will wait." },
        { id = "h_again2", text = "Ask, ask. I talk better than I sell." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Where do your hides come from?", next = "hides" },
        { text = "What was Lordaeron like for a saddler?", next = "saddles" },
        { text = "Do you work worgen hide?", next = "worgen" },
        { text = "Any advice for a skinner?", next = "skin", when = { profession = { "Skinning", "Leatherworking" } } },
        { text = "Good day.", next = "END" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "Bears and wolves from the hills, mostly, and the odd stag the Deathguard bring down by accident. Silverpine's beasts are thin and sour from the plague in the water, so the leather's tougher than it ought to be, which suits armor and nothing else." } },
      choices = {
        { text = "Plague in the leather, too?", next = "hides_plague" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides_plague = {
      lines = { { id = "hp_default", text = "Not so it would trouble you, and I cure everything twice, which the apothecaries tell me is once more than necessary. I'd rather waste the salt than send a soldier out in something that rots off him on the road." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    saddles = {
      lines = { { id = "sd_default", text = "A good life, and a long waiting list. I sewed for knights' chargers and farmers' cobs alike, and I could tell you a man's character by how he treated his saddle, which is a better test than most." } },
      choices = {
        { text = "Do you miss it?", next = "saddles_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    saddles_miss = {
      big = true,
      lines = { { id = "sm_default", text = "I miss the horses, which I didn't expect. The knights I don't miss at all, since plenty of them rode out against the Scourge on my saddles and came back as the Scourge, and the rest never paid." } },
      choices = {
        { text = "The knights did their duty. Don't mock them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Unpaid bills outlive kingdoms. You're owed.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    worgen = {
      lines = { { id = "w_default", text = "No, and don't ask me twice. Whatever they are now, they were men once, and I'll not sew a man's skin into a coat, whatever the apothecaries think of my squeamishness." } },
      choices = {
        { text = "Why not, if they're only beasts now?", next = "worgen_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worgen_stance = {
      big = true,
      lines = { { id = "ws_default", text = "Perhaps you'd make a different choice, and there are tanners in the Undercity who'd agree with you. I was a man once too, though, and I'd like to think somebody would draw a line at me." } },
      choices = {
        { text = "Some lines are worth keeping, even dead.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Lines are for the living. Use what you have.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "worgen" } } },
      },
    },
    skin = {
      lines = { { id = "sk_default", text = "Cut along the grain, keep the blade cold, and never skin anything you killed with fire, since the hide's ruined before you start. Bring the good pieces to a tanner in the Undercity; I've no time to teach and I'm a terrible teacher." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    worgen = { { id = "tp_worgen", text = "Ask me anything else about them and I'll answer, but don't ask me to sew them." } },
    _none = { { id = "tp_none", text = "I know leather and saddles, and very little else worth repeating. Try Bates at the inn." } },
  },
}

-- Nadia Vernon: bowyer.
P:NPC {
  key = "sp_vernon", id = TODO_NPC("Nadia Vernon"), name = "Nadia Vernon", title = "Bowyer",
  bible = "bibles/sepulcher_market.md", role = "vendor", tier = "service",
  communities = { "sepulcher" }, temper = { "blunt", "dry" }, values = { "practical", "craft" },
  notices = { "class", "pet" },
  impression = {
    first = "Nadia Vernon makes bows from wood she complains about and sells them to people she complains about too. She is blunt, practical and quietly pleased whenever a hunter handles her work properly.",
    third = "{name} met Nadia Vernon, the bowyer of the Sepulcher.",
  },
  greetings = {
    { id = "g_default", text = "Bows, arrows, strings. If you want a sword, the armorer's two doors down, and he's welcome to you." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Good, finally someone who knows which end of the bow goes where." },
    { id = "g_warrior", when = { class = { "WARRIOR", "ROGUE" } }, text = "Looking for something to throw at things from a safe distance? Sensible, for once." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep your beast off my arrows. The last wolf in here ate a quiver of fletching, and I'm still finding feathers." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Nadia Vernon, bowyer to the Deathguard, for my sins. I make good bows out of bad wood, and I'd make better ones out of good wood, if anybody would bring me some." },
        { id = "h_troll", when = { race = "Troll" }, text = "A troll, and you'll have opinions about bows, I expect, since your people throw spears and shoot better than any of ours. Go on, tell me what's wrong with my stock, everybody does." },
      },
      again = {
        { id = "h_again", text = "What else? I've strings to wax." },
        { id = "h_again2", text = "Go on, I'm listening, mostly." },
      },
      choices = {
        { text = "Let me see your bows.", next = "BUSINESS" },
        { text = "What's wrong with Silverpine wood?", next = "wood" },
        { text = "Why bows, for the Forsaken?", next = "why" },
        { text = "Any advice for a hunter here?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Good day, Nadia.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "Pine is soft and full of sap, and it bends like a promise from Dalaran. The good yew grew around the lake once, but the plague got into it, and now it snaps when the weather turns." } },
      choices = {
        { text = "Where does good wood come from, then?", next = "wood_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_where = {
      lines = { { id = "ww_default", text = "Ashenvale, if you're an orc with an axe and no fear of the night elves, and the Undercity's stores, if you're me. The orcs' timber is lovely, I'll grant them, though I'd rather not hear how they came by it." } },
      choices = {
        { text = "Does it matter to you how they came by it?", next = "wood_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_stance = {
      big = true,
      lines = { { id = "ws_default", text = "I make bows, I don't make treaties, so take that up with someone who wears a crown. All I know is that a stave from Ashenvale shoots true, and the Deathguard live longer with true bows." } },
      choices = {
        { text = "Then the Warchief is right to cut it.", next = "BACK", fx = { learn = { "ashenvale" }, align = { honor = -1 } } },
        { text = "I'd rather not build our bows on a grudge.", next = "BACK", fx = { learn = { "ashenvale" }, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Because a bow doesn't care if your hands are cold, and a dead archer never shakes. There are Deathguard on these walls who can put an arrow through a worgen's eye at sixty paces, and not one of them could do it alive." } },
      choices = {
        { text = "That's a grim kind of advantage.", next = "why_grim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_grim = {
      lines = { { id = "wg_default", text = "It's the only kind we were given, so we use it. I'd trade it for a heartbeat in a moment, and so would most of them, but nobody's offering." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Don't hunt the worgen alone and don't trust the bears near the lake; they're sick and mean. And keep your beast close in the fog, because the forest makes everything sound like it's behind you." } },
      choices = {
        { text = "Thank you, Nadia.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    worgen = { { id = "tp_worgen", text = "Big, fast, and they come at you sideways. Aim for the eye and keep shooting." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. Ask the innkeeper; he likes being asked things." } },
  },
}

-- Sebastian Meloche: armorer.
P:NPC {
  key = "sp_meloche", id = TODO_NPC("Sebastian Meloche"), name = "Sebastian Meloche", title = "Armorer",
  bible = "bibles/sepulcher_market.md", role = "blacksmith", tier = "service",
  communities = { "sepulcher" }, temper = { "gruff" }, values = { "practical", "dutiful" },
  notices = { "kit", "craft" },
  impression = {
    first = "Sebastian Meloche hammers dents out of Deathguard plate all day and talks about it as if the metal had personally wronged him. Under the grumbling he is careful and honest about what he will and won't sell.",
    third = "{name} met Sebastian Meloche, the Sepulcher's armorer.",
  },
  greetings = {
    { id = "g_default", text = "Mind the anvil, and mind the hammer, and while you're at it mind me. What do you need?" },
    { id = "g_plate", when = { class = { "WARRIOR", "PALADIN" } }, text = "Plate on your back, good. Now come here and let me see what you've done to it." },
    { id = "g_away", when = { away = 14 }, text = "{away} gone and you come back with every dent from the last time still in place. I take that personally." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "That armor's held together with hope and a few rivets. Give it here before it falls off in front of the worgen." },
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing", "Mining" } },
      text = "You smell of the forge. Good, at least one person in this crypt knows what an honest day's work feels like." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Sebastian Meloche, armorer. I fix what the forest breaks and sell what the Undercity sends, and some weeks the forest breaks more than the Undercity sends." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A tauren! I'll have nothing that fits you, I'm sorry to say, unless you want a breastplate for one of your arms. The Undercity doesn't send me much in your size." },
      },
      again = {
        { id = "h_again", text = "Something else? This rivet won't set itself." },
        { id = "h_again2", text = "Talk while I work, then. I can do both." },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "What breaks most often?", next = "breaks" },
        { text = "Where does your metal come from?", next = "metal" },
        { text = "Do you strip armor from the fallen?", next = "fallen" },
        { text = "Good day.", next = "END" },
      },
    },
    breaks = {
      lines = { { id = "b_default", text = "Shoulders, from the worgen, because they go for the neck and land on the pauldron. Shins, from the gnolls, because they're short and spiteful, and helmets, from the Deathguard forgetting to duck at the inn's door." } },
      choices = {
        { text = "That last one sounds avoidable.", next = "breaks_door" },
        { text = "Something else.", next = "BACK" },
      },
    },
    breaks_door = {
      lines = { { id = "bd_default", text = "You'd think so. The dead don't feel the knock, you see, so they never learn, and Bates won't raise the lintel because he says it keeps out the tall ones." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    metal = {
      lines = { { id = "m_default", text = "Bat crates from the Undercity, when Karos's bats feel like flying. Otherwise scrap, from wherever the Deathguard can drag it, and Ambermill's walls have a fair bit of good iron in their gates if anyone ever gets close enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fallen = {
      lines = { { id = "f_default", text = "Ours, when they can't be put back on their feet, yes, and I'm not ashamed of it. A dead Deathguard's breastplate does more good on a living one, or a walking one, than it does in the dirt." } },
      choices = {
        { text = "And the enemy's dead?", next = "fallen_enemy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fallen_enemy = {
      big = true,
      lines = { { id = "fe_default", text = "Dalaran plate is good steel and I'll take it when I can get it. Scarlet armor I melt down first, since I'll not have our people walking about in the Crusade's colours, and the Deathguard tend to shoot anything red." } },
      choices = {
        { text = "Waste nothing. The dead don't need it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Robbing the dead sits ill with me.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    worgen = { { id = "tp_worgen", text = "They chew pauldrons. That's what I know, and that's all I need to know." } },
    _none = { { id = "tp_none", text = "Not my trade. Ask someone with less to hammer." } },
  },
}

-- Andrew Hilbert: trade supplies.
P:NPC {
  key = "sp_hilbert", id = TODO_NPC("Andrew Hilbert"), name = "Andrew Hilbert", title = "Trade Supplies",
  bible = "bibles/sepulcher_market.md", role = "vendor", tier = "service",
  communities = { "sepulcher" }, temper = { "chatty", "cheerful" }, values = { "practical", "profit" },
  notices = { "craft", "purse" },
  impression = {
    first = "Andrew Hilbert sells thread, flux and empty vials at the Sepulcher and talks the whole time he does it. He is cheerful in a way that sits oddly on a dead man, and he knows exactly who buys what.",
    third = "{name} met Andrew Hilbert, who sells trade supplies at the Sepulcher.",
  },
  greetings = {
    { id = "g_default", text = "Thread, flux, vials, salt, dye! Whatever your trade is, I've the little things it runs out of." },
    { id = "g_craft", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing", "Alchemy" } }, text = "A crafter, wonderful. You'll be needing something small and essential that you forgot to bring, I can always tell." },
  },
  notice = {
    { id = "n_purse", cat = "purse", when = { money = { max = 200 } },
      text = "Light purse, eh? Never mind; thread's cheap, and I'll talk to you for free." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Andrew Hilbert, trade goods. I keep the Sepulcher's crafters stitched and soldered, and the apothecaries in vials, though they go through vials faster than anyone ever goes through thread." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? I've had nobody to talk to since the last bat." },
        { id = "h_again2", text = "Go on, ask me anything. I usually know." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Why do the apothecaries need so many vials?", next = "vials" },
        { text = "Who buys the most from you?", next = "buyers" },
        { text = "You're very cheerful for a dead man.", next = "cheer" },
        { text = "Good day.", next = "END" },
      },
    },
    vials = {
      lines = { { id = "v_default", text = "Renferrel says it's samples, from the forest, for the war against the Scourge. A sample in my day was a thimbleful, and he takes them by the crate." } },
      choices = {
        { text = "What do you think he's making?", next = "vials_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vials_what = {
      big = true,
      lines = { { id = "vw_default", text = "I think it's not my business, and I think I sell vials, and I think those two thoughts keep me in work. If the Dark Lady wants a weapon against the Scourge, I'll sell her the bottles to put it in." } },
      choices = {
        { text = "Good. The Scourge deserves whatever we brew.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Someone should ask what's in those bottles.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "b_default", text = "The apothecaries, then Lefevre for his thread and salt, then the Deathguard for whetstones, which they lose like children lose mittens. Gwyn Farrow buys dye, and I've never asked what for, since her mushrooms are colourful enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cheer = {
      lines = { { id = "c_default", text = "I was a gloomy man alive, if you can believe it, always fretting over money and the weather. Then I died, and found the weather can't hurt me and money can't be taken with you, because I've been there and checked, so what's left to fret about?" } },
      choices = {
        { text = "That's a fine way to look at it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    trade = { { id = "tp_trade", text = "Vials up, thread steady, whetstones always. That's the Sepulcher's whole economy in a breath." } },
    _none = { { id = "tp_none", text = "Oh, I don't know that one. Ask Bates; he hears everything over the counter." } },
  },
}

-- Sarah Goode: stable master.
P:NPC {
  key = "sp_goode", id = TODO_NPC("Sarah Goode"), name = "Sarah Goode", title = "Stable Master",
  bible = "bibles/sepulcher_market.md", role = "stablemaster", tier = "service",
  communities = { "sepulcher" }, temper = { "gentle", "steady" }, values = { "kind", "patient" },
  notices = { "pet", "class" },
  impression = {
    first = "Sarah Goode keeps the Sepulcher's stables and has the patience of someone animals still trust, which is rare among the dead. She talks to the beasts more kindly than to most people, and doesn't seem to mind who notices.",
    third = "{name} met Sarah Goode, the Sepulcher's stable master.",
  },
  greetings = {
    { id = "g_default", text = "Slowly, please. The beasts don't like sudden movements, and they like the dead even less." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, with a companion, I hope. Bring them in and let me have a look." },
    { id = "g_pet", when = { pet = { type = "Beast" } }, text = "And who's this? {pet}, is it? Hello, {pet}, aren't you a fine one." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet}'s paws are sore from the pine needles. Let them rest here a night, and they'll thank you for it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Sarah Goode. I keep the stables, for whoever's beasts need keeping, and for the bats when Karos lets them out of his sight. It's quiet work, and that suits me." },
        { id = "h_scourge", when = { race = "Scourge", class = "HUNTER" }, text = "One of us, with a beast that trusts you anyway. That's a rare thing, and you should be proud of it, because most animals can smell the grave on us." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a wolf that needs a bit of talking to." },
        { id = "h_again2", text = "Go on, I'm listening. So are they." },
      },
      choices = {
        { text = "I'd like to stable a companion.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you calm animals, being dead?", next = "calm" },
        { text = "What do you keep here?", next = "keep" },
        { text = "Do the worgen bother the stables?", next = "worgen" },
        { text = "Good day, Sarah.", next = "END" },
      },
    },
    calm = {
      lines = { { id = "c_default", text = "Patience, and a low voice, and never pretending I'm something I'm not. Animals know what we are, and they settle quicker if you don't try to fool them, which is a lesson I wish more people learned." } },
      choices = {
        { text = "Did you work with animals before you died?", next = "calm_before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    calm_before = {
      lines = { { id = "cb_default", text = "Cows, on my father's farm, and a pony that bit everyone but me. I don't remember my father's face very well anymore, but I remember that pony's name, and I'm not sure what that says about me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    keep = {
      lines = { { id = "k_default", text = "Hunters' beasts, mostly, the wolves and cats and the odd bear that isn't sick. The Deathguard's horses are bone and don't need feeding, which is a mercy, since they'd scare the hay off the cart." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    worgen = {
      lines = { { id = "w_default", text = "They howl at night, and every animal in my stables goes quiet as stone. The wolves are the worst for it, because they know the sound and they know it's wrong." } },
      choices = {
        { text = "Wrong how?", next = "worgen_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worgen_wrong = {
      big = true,
      lines = { { id = "ww_default", text = "A wolf howls to find its pack, and those things howl like they're hunting for something they lost and won't ever find. I've a soft heart for most beasts, but not for those, and I won't apologise for it." } },
      choices = {
        { text = "They were men once. Pity them a little.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then they should be hunted down, every one.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "worgen" } } },
      },
    },
  },
  topics = {
    worgen = { { id = "tp_worgen", text = "My animals hate them, and my animals are better judges than I am." } },
    _none = { { id = "tp_none", text = "I wouldn't know. Ask the innkeeper, he collects gossip like a magpie." } },
  },
}
