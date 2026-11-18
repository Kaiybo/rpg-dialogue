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
        { text = "The knights did their duty. Don't mock them.", next = "BACK", reply = "Mock them? I only bill them, which is very different. Some of them still owe me for saddles.", fx = { align = { honor = 1 } } },
        { text = "Unpaid bills outlive kingdoms. You're owed.", next = "BACK", reply = "I am, and I'll be owed until the end of the world. The dead keep very good accounts.", fx = { affinity = 1, align = { honor = -1 } } },
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
        { text = "Some lines are worth keeping, even dead.", next = "BACK", reply = "Even dead, yes, and I'm glad someone else thinks so. A line is what's left when the rest is gone.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Lines are for the living. Use what you have.", next = "BACK", reply = "That's what the Undercity tanners say, and they say it with very full pockets. I'll keep my principles.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "worgen" } } },
      },
    },
    skin = {
      lines = { { id = "sk_default", text = "Cut along the grain, keep the blade cold, and never skin anything you killed with fire, since the hide's ruined before you start. Bring the good pieces to a tanner in the Undercity; I've no time to teach and I'm a terrible teacher." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    worgen = { { id = "tp_worgen", text = "Ask me what you like about the worgen, but don't ask me to sew their hides." } },
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
    { id = "n_rifle", cat = "class", when = { race = { "Orc", "Tauren" }, class = "HUNTER" },
      text = "If that's one of those powder guns on your back, keep it pointed at the floor. They frighten the bats, and they've none of a bow's manners." },
  },
  start = "hello",
  nodes = {
    sawyer = {
      lines = { { id = "sy_default", text = "Abigail Sawyer, yes. She makes a decent stave and she doesn't mind the walk, so we don't tread on each other. I arm the Deathguard on these walls, and she sees to whoever passes through, and there are more than enough worgen for both our order books." } },
      choices = {
        { text = "No rivalry at all?", next = "sawyer2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sawyer2 = {
      lines = { { id = "sy2_default", text = "She waxes her strings with tallow and I use beeswax, when I can get it, and each of us thinks the other is a savage. That's as far as it goes. There are too few people in this forest who can tiller a bow for any of them to fall out." } },
      choices = {
        { text = "Beeswax, in Silverpine?", next = "BACK", reply = "Andrew Hilbert gets it in with his trade goods, twice a year if the cart survives. I've been known to be civil to him around those dates." },
        { text = "Something else, Nadia.", next = "BACK" },
      },
    },
    fletch = {
      lines = { { id = "fl_default", text = "It's the worst of it. There's hardly a goose left on the lake, the crows are too small, and the vultures on the Dead Field shed feathers that reek so badly the archers complain, and they're dead." } },
      choices = {
        { text = "So what do you use?", next = "fletch2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fletch2 = {
      big = true,
      lines = { { id = "fl2_default", text = "Vulture, and I tell the archers to stand upwind of their own quivers. Renferrel has offered to treat the feathers with something of his that keeps them from rotting, and I've put him off twice, because I'm not sure I want my arrows carrying an apothecary's notion of an improvement." } },
      choices = {
        { text = "Take his treatment. A sharper edge is a sharper edge.", next = "BACK", reply = "Maybe so. If the worgen can die of a clean arrow, I suppose they can die of a dirty one quicker.", fx = { align = { honor = -1 } } },
        { text = "Keep your arrows clean. Let the bow do the killing.", next = "BACK", reply = "That's the craftsman's answer, and it's mine. I'll tell him no a third time, and louder.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = { { id = "tl_default", text = "I know it, and I've had one apart to see how. You cut them short and thick and draw to the chest, which is why your hunters can shoot from a crouch in the brush. I can't get the wood to take that much bend, and it galls me." } },
      choices = {
        { text = "It's the horn backing that does it, not the wood.", next = "BACK", reply = "Horn! Of course it is. There, you've told me more in a breath than the Undercity has in a year.", fx = { affinity = 2 } },
        { text = "A bowyer keeps some secrets, Nadia.", next = "BACK", reply = "Fair enough. I'd not tell you mine either, if I had any left worth keeping." },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Nadia Vernon, bowyer to the Deathguard, for my sins. I make good bows out of bad wood, and I'd make better ones out of good wood, if anybody would bring me some." },
        { id = "h_troll", when = { race = "Troll" }, text = "A troll, and you'll have opinions about bows, I expect, since your people throw spears and shoot better than any of ours. Go on, tell me what's wrong with my stock, everybody does." },
        { id = "h_back", when = { metBefore = true }, text = "Nadia Vernon, still making good bows out of bad wood. You've not brought me any yew, I notice, so we'll both have to go on being disappointed." },
      },
      again = {
        { id = "h_again", text = "What else? I've strings to wax." },
        { id = "h_again2", text = "Go on, I'm listening, mostly." },
        { id = "h_again3", text = "Was there something else? Talk to my hands, they're the part that's busy." },
      },
      choices = {
        { text = "Let me see your bows.", next = "BUSINESS" },
        { text = "What's wrong with Silverpine wood?", next = "wood" },
        { text = "Why bows, for the Forsaken?", next = "why" },
        { text = "Any advice for a hunter here?", next = "hunter", when = { class = "HUNTER" } },
        { text = "There's another bowyer in Silverpine, I've heard.", next = "sawyer" },
        { text = "Fletching must be hard to come by here.", next = "fletch" },
        { text = "Troll bows are cut differently from these.", next = "troll", when = { race = "Troll" } },
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
        { text = "Then the Warchief is right to cut it.", next = "BACK", reply = "Then you can tell the Deathguard why their arrows fly crooked, because I won't be the one doing it. The Warchief can cut what he likes, but I still have to make bows from what's left.", fx = { learn = { "ashenvale" }, align = { honor = -1 } } },
        { text = "I'd rather not build our bows on a grudge.", next = "BACK", reply = "Sensible, and rarer than good yew around here. Grudges make poor staves, in my experience, because they crack the first time you put any real weight on them.", fx = { learn = { "ashenvale" }, align = { honor = 1 } } },
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
    shadowfang = { { id = "tp_shadowfang", text = "The patrols that go up there take three sheaves of arrows each and come back with none, when they come back. That's all I hear of it, and it's enough." } },
    advice = { { id = "tp_ad", text = "Keep your string dry and a spare inside your shirt. This forest drips all year round, and a wet string is a broken bow." } },
    forsaken = { { id = "tp_forsaken", text = "Steady hands and no breath to hold. As archers go, we're the best this country ever had, and it only cost us everything." } },
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
    { id = "n_orc", cat = "kit", when = { race = "Orc" },
      text = "Orcish plate. Heavy, ugly and nearly impossible to dent, and I mean every word of that kindly. I can mend it, but I'll need the big tongs." },
  },
  start = "hello",
  nodes = {
    forge = {
      lines = { { id = "fg_default", text = "I've a forge in the only dry corner the High Executor would give me. The smoke goes up through a crack in the vault and comes out among the headstones, and the first week I was here a patrol nearly put an arrow in it, thinking the crypt was on fire." } },
      choices = {
        { text = "Do you share the work with anyone?", next = "forge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge2 = {
      lines = { { id = "fg2_default", text = "Guillaume Sorouy teaches smithing a few paces off and thinks I hammer like a farrier, and Johan Focht brings us both ore from wherever a miner can dig without being eaten. Alexandre Lefevre does the straps, and I'll admit his straps outlast my buckles." } },
      choices = {
        { text = "That's high praise, from you.", next = "BACK", reply = "Don't repeat it. He's a saddler, and they're vain enough." },
        { text = "Something else.", next = "BACK" },
      },
    },
    arming = {
      lines = { { id = "ar_default", text = "Hadrec's Deathguard, first and always. After them the deathstalkers, who want everything blackened and silent and then complain that it's thin, and after them whoever the Warchief has sent up from the south that month." } },
      choices = {
        { text = "And the patrols toward Shadowfang?", next = "arming2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    arming2 = {
      big = true,
      lines = { { id = "ar2_default", text = "They get my best, and most of it doesn't come back. The High Executor wants every patrol out in full plate, and the deathstalkers say plate only makes noise for the worgen to follow. I make what I'm told, but I'd like to know which of them is getting my work killed." } },
      choices = {
        { text = "Plate, and march in the open. Hadrec commands here.", next = "BACK", reply = "That's the order as it stands, and I'll keep filling it. An armorer who picks his own customers isn't an armorer for long.", fx = { align = { order = 1 } } },
        { text = "The scouts know the forest. Make what they ask for.", next = "BACK", reply = "I've half a mind to, on the quiet. A suit that comes back is worth two that look well on parade.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    proof = {
      lines = { { id = "pf_default", text = "Raise the collar and roll the edge of the pauldron outward, so a jaw slides off it and doesn't catch. And rivet, never weld, across the shoulder, because a worgen shakes what it bites, and a weld cracks where a rivet only loosens." } },
      choices = {
        { text = "Rolled edges. I hadn't thought of the jaw.", next = "BACK", reply = "Nobody does until they've seen one hang on. Now you won't need to see it.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Sebastian Meloche, armorer. I fix what the forest breaks and sell what the Undercity sends, and some weeks the forest breaks more than the Undercity sends." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A tauren! I'll have nothing that fits you, I'm sorry to say, unless you want a breastplate for one of your arms. The Undercity doesn't send me much in your size." },
        { id = "h_smith", when = { profession = "Blacksmithing" }, text = "Sebastian Meloche, armorer, and you're a smith yourself by the look of your forearms. Then you'll know what it means when I say the Undercity sends me pig iron and expects plate." },
      },
      again = {
        { id = "h_again", text = "Something else? This rivet won't set itself." },
        { id = "h_again2", text = "Talk while I work, then. I can do both." },
        { id = "h_again3", text = "What else? Say it over the hammering, I'm not stopping." },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "What breaks most often?", next = "breaks" },
        { text = "Where does your metal come from?", next = "metal" },
        { text = "Do you strip armor from the fallen?", next = "fallen" },
        { text = "You've a forge in a graveyard, Meloche.", next = "forge" },
        { text = "Who are you arming out here?", next = "arming" },
        { text = "What would you teach a smith about worgen-proofing?", next = "proof", when = { profession = "Blacksmithing" } },
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
      lines = { { id = "m_default", text = "Bat crates from the Undercity, when Karos Razok's bats feel like flying. Otherwise scrap, from wherever the Deathguard can drag it, and Ambermill's walls have a fair bit of good iron in their gates if anyone ever gets close enough." } },
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
        { text = "Waste nothing. The dead don't need it.", next = "BACK", reply = "Exactly my thinking, and the Scarlets won't miss it. Good steel deserves a second life.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Robbing the dead sits ill with me.", next = "BACK", reply = "Then you've more living conscience left than I do. It sits fine with me, but I respect the scruple.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    worgen = { { id = "tp_worgen", text = "Worgen chew pauldrons. That's what I know, and that's all I need to know." } },
    shadowfang = { { id = "tp_shadowfang", text = "I've sent a wagon's worth of plate up that hill on Deathguard's backs. Very little of it has come down again." } },
    advice = { { id = "tp_ad", text = "Mend it before you leave the crypt, not after. There's no anvil between here and Pyrewood, and the worgen won't wait while you look for one." } },
    trade = { { id = "tp_trade", text = "The Undercity sends me less than I ask for and wants it accounted for by weight. I've started weighing the dents." } },
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
        { text = "Your prices are higher than Brill's.", next = "markup" },
        { text = "I go through vials faster than the apothecaries.", next = "xalch", when = { profession = "Alchemy" } },
        { text = "I can't afford much today, I'm afraid.", next = "xpoor", when = { money = { max = 200 } } },
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
        { text = "Good. The Scourge deserves whatever we brew.", next = "BACK", reply = "It does, and it'll get it, by the barrel. I only sell the bottles.", fx = { align = { light = -1 } } },
        { text = "Someone should ask what's in those bottles.", next = "BACK", reply = "Someone probably should, but it won't be me. I like my work, and I like my head.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "b_default", text = "The apothecaries, then Lefevre for his thread and salt, then the Deathguard for whetstones, which they lose like children lose mittens. Gwyn Farrow buys dye, and I've never asked what for, since her mushrooms are colourful enough." } },
      choices = {
        { text = "Guess, then. What does Gwyn want dye for?", next = "gwyn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gwyn = {
      lines = { { id = "gw_default", text = "My guess is she dyes the dull mushrooms to look like the dangerous ones, so nobody steals her stock. Either that, or the other way about, and I hope very much it's the first." } },
      choices = { { text = "I'll be careful what I eat, then.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    cheer = {
      lines = { { id = "c_default", text = "I was a gloomy man alive, if you can believe it, always fretting over money and the weather. Then I died, and found the weather can't hurt me and money can't be taken with you, because I've been there and checked, so what's left to fret about?" } },
      choices = {
        { text = "That's a fine way to look at it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Was there nothing you liked about being alive?", next = "cheer2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheer2 = {
      lines = { { id = "c2_default", text = "Bread, I suppose, and rain on the shop roof when I was safe indoors, and my sister's laugh, which carried three streets. I've lost the bread and I don't know where she is, but it still rains on the roof, so I've kept one of the three." } },
      choices = {
        { text = "One of three is something, Andrew.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    markup = {
      lines = { { id = "mk_default", text = "They are, and I'll tell you why, because I'm an honest man even if I'm a dead one. Every crate comes down the road from Brill past the worgen, and I add what the road eats to the price." } },
      choices = {
        { text = "What does the road eat?", next = "markup2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    markup2 = {
      lines = { { id = "m2_default", text = "One cart in five, last season, and two drivers I'd known since we were both breathing. The worgen don't want the thread, they want the horse and whoever's holding the reins, and the thread just lies in the road getting rained on." } },
      choices = {
        { text = "Couldn't the Deathguard escort the carts?", next = "markup3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    markup3 = {
      lines = { { id = "m3_default", text = "They do, when they can spare a man, which is never when I need one. The High Executor has the wall and the woods and Dalaran's apprentices at Ambermill to worry about, and my thread comes somewhere after all three." } },
      choices = { { text = "I'll keep an eye on the road. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xalch = {
      lines = { { id = "xa_default", text = "Do you, now! Then you'll want them washed, and mine are washed twice, which is more than Renferrel's empties get before they come back to me. Never mind what was in them before; you don't want to know, and neither do I." } },
      choices = { { text = "Twice washed it is.", next = "BACK", fx = { affinity = 1 } } },
    },
    xpoor = {
      lines = { { id = "xp_default", text = "Then don't buy much, and come back when you've sold a few hides to Lefevre, who's always short of good leather. Conversation's free, and you're welcome to all of it." } },
      choices = { { text = "Thanks, Andrew. Something else.", next = "BACK" } },
    },
  },
  topics = {
    trade = { { id = "tp_trade", text = "Vials up, thread steady, whetstones always. That's the Sepulcher's whole economy in a breath." } },
    worgen = { { id = "tp_worgen", text = "They eat one cart in five and both the drivers, and they've never once paid for the thread. I hold a grudge about that, as a businessman." } },
    new_plague = { { id = "tp_plague", text = "I sell the vials. What goes in them is the apothecaries' business, and they've made it very clear it isn't mine." } },
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
    { id = "n_tauren", cat = "class", when = { race = "Tauren" },
      text = "The beasts have gone quite calm since you walked in. I don't know what your people carry with them, but I wish I could keep some of it in a jar by the door." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "They tell me your kind can take a beast's shape. If you ever do it in here, warn me first, because the wolves will want to know whose pack you belong to." },
  },
  start = "hello",
  nodes = {
    kept = {
      lines = { { id = "kp_default", text = "They need more keeping than the soldiers do. A Deathguard can go a month without food or sleep, but a wolf wants meat every day and clean straw, and both have to come from somewhere in a forest where half the game is sick." } },
      choices = {
        { text = "Where do you find clean meat in Silverpine?", next = "kept2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kept2 = {
      lines = { { id = "kp2_default", text = "The hunters bring me what they can spare, and I look at the liver before I let anything eat it. Gwyn Farrow sends her spoiled mushrooms for the bedding, and Edwin Harly puts aside salt for me, so the whole crypt feeds my animals a little, whether it knows it or not." } },
      choices = {
        { text = "They've good neighbours, your beasts.", next = "BACK", reply = "Better than they know. I tell them so, on the quiet nights, and I think the old bear half understands.", fx = { affinity = 1 } },
        { text = "Something else, Sarah.", next = "BACK" },
      },
    },
    bats = {
      lines = { { id = "ba_default", text = "I do, and they aren't mine to keep, thank goodness. Karos has the bats that carry riders, great leathery things that sleep all day, and he and I have an understanding that I don't comment on the smell and he doesn't let them hunt near my stalls." } },
      choices = {
        { text = "Do the other beasts mind them?", next = "bats2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bats2 = {
      big = true,
      lines = { { id = "ba2_default", text = "The cats hate them and the wolves ignore them, and the bats don't care for anybody. Karos says a beast is only a tool that eats, and that I waste my time talking to mine, and I've never quite known what to say to that." } },
      choices = {
        { text = "A beast that trusts you serves better. Keep talking.", next = "BACK", reply = "That's what I've always found, and it's good to hear someone else say it. I'll keep on, and Karos can keep his opinion.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He's right. They serve; that's the sum of it.", next = "BACK", reply = "Perhaps, for a bat. I'll go on talking to mine all the same, because it does me good, if not them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter = {
      lines = {
        { id = "hn_default", text = "Let your beast meet the Forsaken one at a time, and never from behind. Keep your own smell on its bedding, feed it yourself, and don't bring it into the crypt proper until it has slept a night in the yard and woken to find you still there." },
        { id = "hn_pet", when = { pet = { type = "Beast" } }, text = "You're doing it already, by the look of {pet}. Keep your own smell on the bedding and feed {pet} yourself, and don't go down into the crypt proper until you've both slept a night in the yard." },
      },
      choices = {
        { text = "That's the best advice I've had in Silverpine.", next = "BACK", reply = "It's only what the pony taught me. Animals want to know you'll still be there in the morning, that's all.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Sarah Goode. I keep the stables, for whoever's beasts need keeping, and for the bats when Karos Razok, our bat handler, lets them out of his sight. It's quiet work, and that suits me." },
        { id = "h_scourge", when = { race = "Scourge", class = "HUNTER" }, text = "One of us, with a beast that trusts you anyway. That's a rare thing, and you should be proud of it, because most animals can smell the grave on us." },
        { id = "h_back", when = { metBefore = true }, text = "Sarah Goode, at the stables, where else? The grey wolf has stopped pacing since you were last here, and I'd like to think he's settling, though he may only be tired." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a wolf that needs a bit of talking to." },
        { id = "h_again2", text = "Go on, I'm listening. So are they." },
        { id = "h_again3", text = "What else? Ask it softly, and nobody in the stalls will mind." },
      },
      choices = {
        { text = "I'd like to stable a companion.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you calm animals, being dead?", next = "calm" },
        { text = "What do you keep here?", next = "keep" },
        { text = "Do the worgen bother the stables?", next = "worgen" },
        { text = "The beasts here look better kept than the soldiers.", next = "kept" },
        { text = "You share your yard with Karos Razok's bats.", next = "bats" },
        { text = "How does a hunter keep a beast calm among the dead?", next = "hunter", when = { class = "HUNTER" } },
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
        { text = "They were men once. Pity them a little.", next = "BACK", reply = "A little, maybe, and I'll grant you that. The horses don't, though, and I trust the horses.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then they should be hunted down, every one.", next = "BACK", reply = "That's what the Deathguard say, and the horses agree. I'll keep the stables locked till it's done.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "worgen" } } },
      },
    },
  },
  topics = {
    worgen = { { id = "tp_worgen", text = "My animals hate the worgen, and my animals are better judges than I am." } },
    forsaken = { { id = "tp_forsaken", text = "Animals can smell the grave on us, and most won't come near. The ones that do have decided something about us, and I try to deserve it." } },
    advice = { { id = "tp_ad", text = "Go slowly and speak low. It works on beasts, and it works on Deathguard too, if you ever need it to." } },
    lordaeron = { { id = "tp_lord", text = "There were dairy farms all down this side of the lake. You can still find the stone troughs in the grass, if you know where the yards were." } },
    _none = { { id = "tp_none", text = "I wouldn't know. Ask the innkeeper, he collects gossip like a magpie." } },
  },
}
