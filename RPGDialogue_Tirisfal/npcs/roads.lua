-- More of Tirisfal: Deathknell's guard and novice, a living brawler on the road, and Brill's junior apothecary. Voice: bibles/roads.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "saltain", id = TODO_NPC("Deathguard Saltain"), name = "Deathguard Saltain",
  bible = "bibles/roads.md", role = "soldier", tier = "quest",
  communities = { "deathknell" }, temper = { "brisk" }, values = { "practical", "dutiful" },
  notices = { "kit", "lock_stones" },
  impression = {
    first = "He has no sympathy at all for what the risen have lost.",
    third = "{name} met Deathguard Saltain, who sets the freshly risen Forsaken of Deathknell to scavenging.",
  },

  greetings = {
    { id = "g_fresh", text = "Freshly risen, are you? It shows, so come here and I'll tell you what you're missing." },
  },

  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Look at you, barely a stitch on. The grave isn't generous with clothing, and I've seen better dressed ghouls." },
    { id = "n_lock_firestone", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5522, 13602, 13603, 1254, 13699, 13700, 13701 } },
      text = "That stone in your pack is glowing red through the leather, and anything that burns without coal is worth something to the Dark Lady's people. Don't drop it in the ruins, because I'll be the one sent to find it." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The Deathguard has use for anything that stands up and follows orders. Your Light heals, I'm told, which means one fewer body for me to replace, and that's the only sort of miracle I keep track of." } },
      choices = {
        { text = "Then count on me, Saltain. I'll keep your guards standing.", next = "BACK", reply = "Good, then I'll write you down as one fewer replacement to find. Keep them on their feet and I'll keep the ledger kind to you.", fx = { align = { order = 1 } } },
        { text = "I'll heal who needs it, not who your ledger says.", next = "BACK", reply = "Heal whoever you like, so long as the Deathguard are on the list. I don't keep a ledger of the grateful, only the useful.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They're past caring, and I'm past asking, but the newly risen watch me drag them in, and a word over them seems to settle their stomachs, or whatever we have instead of stomachs. Bless them if you like, provided you do it quickly." } },
      choices = {
        { text = "They were people once. They'll have their blessing.", next = "BACK", reply = "Then say your words, and I'll keep dragging. The fresh ones do look less green when somebody's praying.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Waste of breath, Saltain. Just gather them.", next = "BACK", reply = "A corpse after my own heart. Grab an arm, then, and mind the loose bits.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hides, sinew and anything else a beast will give up, because the Dark Lady's people need boots and bowstrings as much as blades. The spiders in Night Web Hollow give good silk and the scavengers in the fields give good hides, so don't come back with anything half-chewed." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It does, so bring me every hide you can, and keep {pet} off them once they're down. The Dark Lady's people need boots and bowstrings as much as blades, and I'm not sentimental about where they come from." },
      },
      choices = {
        { text = "I'll bring back every hide. Deathknell comes first.", next = "BACK", reply = "That's the sort of recruit I like, and the cobbler in Brill will be glad of you too. Leave the hides by the crates.", fx = { align = { order = 1 } } },
        { text = "I'll keep the best pelts, and you'll have the rest.", next = "BACK", reply = "Keep your best, then, and the Deathguard will make do with the worst, as usual. Don't come asking for new boots.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "It can carry what you find in the ruins, and it won't complain, so it's already ahead of my recruits. Bring me every scrap from the houses of Deathknell, and keep it on a short leash, because I've lost enough supplies already." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "It can carry what you find in the ruins, and judging by how it's standing about, it's already less idle than my recruits. Load {pet} with every scrap from the houses of Deathknell, and keep it on a short leash, because I've lost enough supplies already." },
      },
      choices = {
        { text = "I'll bring it all back, Saltain. Every scrap.", next = "BACK", reply = "Good, and mind the imp doesn't eat half of it on the way back. I count everything twice.", fx = { align = { order = 1 } } },
        { text = "I'll keep the best scraps for myself. Count all you like.", next = "BACK", reply = "Then I'll count the pile and know exactly how much you kept, corpse. The Deathguard aren't fools.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deathguard Saltain. Deathknell is ruins and the Dark Lady's people need everything, so we scavenge, and you'll start with the scraps the Scourge left behind in those houses." },
        { id = "h_scavenge", tags = { "news" }, when = { questActive = TODO_QUEST("Scavenging Deathknell") },
          text = "Scraps of cloth and old gear, from the houses up the hill. They were somebody's once, and now they're ours, so don't be sentimental about it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in Deathknell? Then you can tell me whether your spirits want anything from those ruined houses, because my people have already stripped them." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You'll be wanting a look at our fields, I suppose, and I'll tell you now they're no better than they look." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Good, because skins and sinew are worth as much to Deathknell as any scrap of cloth, and you'll know how to get them." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, because I've corpses to gather from the field and a few of them might want a blessing before Undertaker Mordo shovels them under." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. You'll scavenge like everyone else, and your demon can carry the scraps." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin. You'll still scavenge like everyone else, so don't expect the Light to carry your sacks, though if it lights up those houses for you, I'll not complain." },
        { id = "h_dd_messenger", when = { questDone = TODO_QUEST("The Red Messenger") },
          text = "You put down the Scarlet messenger who kept riding past Solliden, didn't you? I've stood this road long enough to know his horse by its sound, and it's been quiet for days." },
      },
      choices = {
        { text = "Should the scavenged dead get a blessing, Saltain?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you leave anything for the dead, Deathguard?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could Deathknell's gardens grow again, Deathguard?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You look like you could use another blade on the road.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "I was a soldier of Lordaeron. I know how to forage.", next = "soldier", when = { origin = "forsaken_lordaeron_soldier" } },
        { text = "These things must have belonged to someone.", next = "whose" },
        { text = "Deathknell looks like it was a village once.", next = "town" },
        { text = "Why should I serve the Dark Lady?", next = "lady" },
        { text = "I can find what you need faster unseen, Deathguard.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Could you use a mage, Deathguard, or just a pack mule?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Deathknell must need hides, Deathguard.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "My demon could haul your scavenge, Saltain. It doesn't tire.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does the Deathguard have use for a paladin, Saltain?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll get to it.", next = "END" },
      },
      again = { { id = "h_again", text = "What else? Time's the one thing we've plenty of, but I'd still not waste it." } },
    },
    whose = {
      lines = {
        { id = "wh_default", text = "Farmers, a smith and a schoolmistress, I'd guess, going by the slates. They died when the plague came through, and some of them rose and some of them didn't." },
      },
      choices = { { text = "Taking their things would trouble me.", next = "whose_trouble" } },
    },
    whose_trouble = {
      lines = {
        { id = "wt_default", text = "It troubled me too, the first week. Then I needed a coat, and the coat didn't care whose it was, and neither does the cold." },
      },
      choices = {
        { text = "The dead don't need coats. Take what serves us.", next = "BACK", reply = "That's how I see it, and the cold agrees with us both. Grab whatever's warm and get back on the road.", fx = { align = { light = -1 } } },
        { text = "We should honor whose they were, at least.", next = "BACK", reply = "Honour them all you like, but do it wearing their coat. Grief won't stop a ghoul.", fx = { align = { light = 1 } } },
      },
    },
    town = {
      lines = {
        { id = "to_default", text = "It was, until the plague came, and then the Scourge, and then us. It's a graveyard with a few houses still standing, and Shadow Priest Sarvis wakes the dead from it, one by one." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lady = {
      lines = {
        { id = "la_default", text = "Because she broke the Lich King's hold on us, and nobody else bothered to try. You'll have your own reasons soon enough, and if not, the Scourge will give you some." },
      },
      choices = { { text = "Grim, but true enough. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Always, and yours looks sharper than mine. The Scourge come in from the east in ones and twos, and you put them down before they turn into threes and fours." } },
      choices = {
        { text = "Then I'll stand watch here and keep them in ones.", next = "BACK", reply = "Ones and twos, aye, and I'll sleep better knowing it. Shout if it turns into fours.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hunt them down on my own terms, not stand about.", next = "BACK", reply = "Your terms, then, so long as the Scourge ends up in pieces. Don't make me come and find you.", fx = { align = { order = -1 } } },
      },
    },
    soldier = {
      lines = { { id = "so_default", text = "A soldier of Lordaeron? Then you'll remember the long marches on half rations. Scavenging is no different, except the people you're taking from won't complain." } },
      choices = { { text = "Old habits, then.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "We are the dead, shaman, so I'd say we leave plenty for ourselves. If there's an old charm or a family cup in those houses, it goes in a soldier's pack, because sentiment never stopped a Scourge claw." } },
      choices = {
        { text = "Then at least speak their names when you take their things.", next = "BACK", reply = "If it helps the newly risen, say all the names you like. The Scourge won't mind and neither will I.", fx = { align = { light = 1 } } },
        { text = "Fair. The past has no claim on what's useful.", next = "BACK", reply = "There's a shaman with sense. Take the cup, and take the charm too, if it'll keep you breathing.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Grow what, and for whom? Joshua Kien, who keeps our stores, gets his bread from Brill and the apothecaries want only the weeds, but if you can coax a few rows of something useful out of that soil, I'll set a guard on it, though I'll not set three." } },
      choices = {
        { text = "One guard will do. I'll make the rows worth guarding.", next = "BACK", reply = "Make them worth guarding and I'll find you two guards, though don't tell the Executor I said so.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Guard it or don't. I'll plant what I like.", next = "BACK", reply = "Plant your weeds, then, and I'll save my guard for something useful. Let the beetles have it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Good, because the mindless in Deathknell's old houses still guard their pantries as if they remembered owning them. Get in, take what's useful, and get out, and don't come back with keepsakes." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "You were a thief in life, then, and now you're a scavenger, which in Deathknell counts as a promotion. The Dark Lady needs supplies, not sentiment, so empty those houses and bring me the lot." },
      },
      choices = {
        { text = "Supplies, not keepsakes. I'll bring you all of it.", next = "BACK", reply = "Good, then we'll get along, you and I. Pile it by the crates and don't stop to read the letters.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep whatever catches my eye, Deathguard.", next = "BACK", reply = "Then I'll be checking your pockets when you come back, rogue, and don't think I won't.", fx = { align = { order = -1 } } },
        { text = "Whose things were they, anyway?", next = "whose" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A mule is more use than most recruits, but a mage who can conjure water without a well is worth two of them. Fetch what I asked for from the houses first, and then you may impress me." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Dalaran-trained, by the look of you, and now you're turning over dead men's cupboards in Deathknell. That's the plague's great joke, and the sooner you stop finding it an insult, the sooner you'll be useful." },
      },
      choices = {
        { text = "I'll fetch the supplies first, as ordered.", next = "BACK", reply = "Good. A mage with sense is worth three without, and I'll take your water afterward.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I didn't study for years to haul sacks.", next = "BACK", reply = "Neither did I, and here I am. Haul the sacks and the Dark Lady will find you more interesting work later.", fx = { align = { order = -1 } } },
        { text = "Deathknell looks like it was a village once.", next = "town" },
      },
    },
  },

  topics = {
    scourge = { { id = "tp_scourge", text = "The Scourge left bodies all over these fields, and some of them are still useful. I collect them in tidy piles so the apothecaries don't have to go hunting." } },
    forsaken = { { id = "tp_forsaken", text = "You're Forsaken now, so you'll need boots, a blade and somewhere to keep your bits together. I can't help you with the last one." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady sets the order, and the order is that the newly risen get what they need and stop moaning. I find it a very sensible arrangement." } },
    _none = { { id = "tp_none", text = "No idea. Go and scavenge something useful instead; the dead can't afford idle hands." } },
  },
}

P:NPC {
  key = "elreth", id = TODO_NPC("Novice Elreth"), name = "Novice Elreth",
  bible = "bibles/roads.md", role = "priest", tier = "quest",
  communities = { "deathknell" }, temper = { "earnest" }, values = { "dutiful", "curious" },
  notices = { "class", "lock_shadow" },
  impression = {
    first = "She speaks of the mindless dead with something close to pity.",
    third = "{name} met Novice Elreth, a Forsaken novice of the priesthood at Deathknell.",
  },

  greetings = {
    { id = "g_novice", text = "Oh, a new one! Welcome back to the world, friend, such as it is, and mind your jaw on the stairs, because the fresh ones keep losing theirs." },
    { id = "g_xchapel", when = { origin = "forsaken_chapel_priest" }, text = "Oh, you were a priest before, weren't you? You still fold your hands like one. I'd love to hear someday whether the Light feels different to you now, because nobody here will tell me." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, like me! Or like I'm trying to be. Sarvis says the Light abandoned us, and I'm still deciding what I think about that." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "Your shadow doesn't sit on you the way ours does, it sits beside you, as if it's waiting to be let in. Sarvis would want to see it, and I'm not sure I would." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "That maybe the Light didn't abandon us so much as lose sight of us for a while. I put the mindless ones to rest with shadow because it's what I've been taught, but I wonder sometimes whether you'd do it more gently." } },
      choices = {
        { text = "The Light can be gentle with them. I'll show you.", next = "BACK", reply = "Would you? I'd like to see that, very much, though I'll not tell Sarvis I asked.", fx = { align = { light = 1 } } },
        { text = "Shadow or Light, rest is rest. Sarvis teaches you well.", next = "BACK", reply = "He does, and I'm grateful for it, but I'm glad to hear someone else say rest is rest. It makes it easier to do.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I believe it is, though I pray over them afterwards, which Sarvis finds very sentimental of me. A clean stroke is kinder than anything they'll find wandering the fields, and a warrior's blade is cleaner than a hungry wolf." } },
      choices = {
        { text = "Then I'll strike cleanly, and you can say the prayer.", next = "BACK", reply = "Then we'll do it together, and that's the kindest thing either of us can manage.", fx = { align = { light = 1 } } },
        { text = "They're past mercy, Elreth. I'll just clear the field.", next = "BACK", reply = "Cleared is still put to rest, I suppose. I'll say a prayer for them anyway, after you've gone.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Would you? They wander without purpose, but they always seem to drift back toward the farmsteads, as though some part of them remembers home. If you find Samuel Fowler near the Solliden Farmstead, be gentle with him, for his wife Marla's sake." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Would you, with {pet} to help? They wander without purpose, but they drift back toward the farmsteads, and a beast's nose will find them before your eyes do." },
      },
      choices = {
        { text = "I'll find them, and you can grant them rest.", next = "BACK", reply = "Thank you, truly, and I'll be gentle with Samuel when you do. He was a farmer once.", fx = { align = { light = 1 } } },
        { text = "I'll find them, but I won't waste prayers on them.", next = "BACK", reply = "Then I'll say them myself, and you won't need to hear them. Thank you for finding them, at least.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Because they were people once, like us, and the Scourge took everything they were and left the bodies walking. Sarvis tells me to put them down without feeling anything, but I can't, so when you cut one down, please do it quickly." },
      },
      choices = {
        { text = "I'll do it quickly. They deserve that much.", next = "BACK", reply = "Thank you. Quick is the only mercy I can offer them now.", fx = { align = { light = 1 } } },
        { text = "They're mindless. They don't feel a thing.", next = "BACK", reply = "Maybe they don't, but I do, and I'd rather they had a little dignity in the going. Humour me, please.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Novice Elreth, a student of Shadow Priest Sarvis. I help the newly risen find their feet, and I help the ones who never found theirs to lie down again." },
        { id = "h_damned", tags = { "news" }, when = { questActive = TODO_QUEST("The Damned") },
          text = "The Damned in the fields are what we'd have been without the Dark Lady, mindless and hungry. Put them to rest; it's the kindest thing left to do." },
        { id = "h_marla", when = { questActive = TODO_QUEST("Marla's Last Wish") },
          text = "Marla Fowler's husband, Samuel, rose and wanders mindless near the Solliden Farmstead. Bring his remains back to her grave, so the two of them can rest together." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Sarvis says spirits are only voices, but you've spoken to them, so tell me, do they ever speak of us?" },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, in Deathknell! I've read that your people tend the land the way we tend the dead, and I'd love to know if that's true." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. I hope you'll be gentle with the Damned in the fields, {class}, because they were people once, the same as you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! You'll see the Damned before anyone else does, I expect, and I'd be grateful if you'd tell me where they gather." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue? You'll find the mindless dead are easy to sneak past, though I wish they weren't." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "You carry the Light. Shadow Priest Sarvis says it abandoned us, and I believe him most days, but then someone like you walks out of the graves and I don't know what to believe." },
      },
      choices = {
        { text = "Shall I ask the spirits whether the Damned can rest, Elreth?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you think the dead belong to the land, Elreth?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I prayed to the Light once, too. Does it still answer?", next = "priest", when = { class = "PRIEST" } },
        { text = "The Damned seem to wander without any purpose.", next = "damned" },
        { text = "Is there anyone whose rest you worry about?", next = "marla" },
        { text = "What does Sarvis teach about the Light?", next = "light" },
        { text = "Does Sarvis teach anything a mage could use, Elreth?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Shadow and fel are cousins, Elreth. You know it.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Cutting the Damned down seems a mercy, Elreth.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Shall I track the Damned through the fields for you, Elreth?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why do you pity the mindless dead, Elreth?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What do you believe, Elreth, when you see me?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Elreth.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? I don't mind; I'm meant to be learning patience." } },
    },
    damned = {
      lines = {
        { id = "da_default", text = "They're the ones the Lich King's grip held onto when ours slipped free. They don't remember their names, and they don't know they've died, which may be a mercy or may be the cruellest part." },
      },
      choices = { { text = "I wonder if they suffer.", next = "damned_suffer" } },
    },
    damned_suffer = {
      lines = {
        { id = "ds_default", text = "I don't know, and I've stopped asking Sarvis, because he only says it doesn't matter. It matters to me, so I put them down gently, and I say a word for each, even if I'm not sure who hears it." },
      },
      choices = {
        { text = "That word matters, Elreth. Keep saying it.", next = "BACK", reply = "I will, and I'm glad someone else thinks so. Sarvis would say I'm wasting breath I don't need.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "They're Scourge. Cut them down and move on.", next = "BACK", reply = "That's what Sarvis says, and he's usually right. Still, I'll say my word, and you can move on.", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
    marla = {
      lines = {
        { id = "ma_default", text = "There's Marla Fowler, a farmwife buried before the plague took the rest of her family. Her husband died later and rose with the Damned, and it seemed wrong to me that they'd stay apart forever." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    light = {
      lines = {
        { id = "li_default", text = "He says the Light watched us die and did nothing, so the Forsaken look to the shadow, which at least answers. I think he may be right, and I wish he weren't." },
      },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "pr_default", text = "For some of us it does, faintly, and Sarvis pretends not to notice. Try it, when you're alone, and tell me what you hear." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Would you? I put them down as gently as I can and I say a word for each, but I never know whether anyone hears it. If the spirits told you the Damned were at peace afterwards, I think I could bear the work much better." } },
      choices = {
        { text = "I'll ask, and tell you straight, whatever they say.", next = "BACK", reply = "Thank you. The truth, whatever it is, would be easier to carry than wondering.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll tell you they rest. That's the kindness you need.", next = "BACK", reply = "That's a kind lie, and I think I'd know it for one. Tell me the truth, please, even if it hurts.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "I'd like to think so, though Sarvis laughs when I say it. The Damned walk the fields because nobody let them lie down properly, and I wonder sometimes whether the earth misses them, or whether it's only me." } },
      choices = {
        { text = "Then let the earth have them back, gently.", next = "BACK", reply = "Gently, yes, and I'll leave a word with each one. Perhaps the earth will like that.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sentiment won't help them. Cut them down and move on.", next = "BACK", reply = "You sound like Sarvis, and I'll take that as advice rather than a scolding. I'll keep my sentiment all the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "He teaches the will above all, and any mage could use that, though he also says pity is a weakness of the will. I still pity the poor Damned in the fields, so perhaps I'm not his best student." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "I knew a girl from Dalaran before the plague who could light candles just by looking at them, and she'd have hated what we've become. You've kept your magic and your wits, which is more than the poor Damned in the fields have done." },
      },
      choices = {
        { text = "Pity for the Damned is a kindness worth keeping.", next = "BACK", reply = "Thank you, and I'll hold on to it a bit longer then. Sarvis can laugh as much as he likes.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Pity is wasted on the mindless, Elreth.", next = "BACK", reply = "Maybe it is, but it isn't wasted on me. It's the only part of me I'm sure is still mine.", fx = { align = { light = -1 } } },
        { text = "Who are the Damned, exactly?", next = "damned" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Sarvis says much the same, and I nod when he says it, but shadow at least comes from inside you, and a demon comes from somewhere else entirely. I'd keep a close eye on anything that wants to be invited in." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "We were all slaves to one master already, and now you've chosen to bargain with another sort of thing. I don't judge you for it, but I'll say a quiet word for you all the same." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Sarvis says much the same, and I nod when he says it, but shadow at least comes from inside you, and your demon is watching me as you say it. I'd keep a close eye on anything that wants to be invited in, and that one looks as if it's only waiting for the invitation." },
      },
      choices = {
        { text = "Say your quiet word, Elreth. It can't hurt me.", next = "BACK", reply = "Thank you, and I'll say it quietly. I hope it helps you, whether you want it to or not.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Save your prayers. I chose this with my eyes open.", next = "BACK", reply = "Then I'll keep my prayers for the Damned, and I'll hope you never need one.", fx = { align = { light = -1 } } },
        { text = "What does Sarvis teach about the Light?", next = "light" },
      },
    },
  },

  topics = {
    scourge = { { id = "tp_scourge", text = "The Scourge's mindless dead don't know what they are, and I can't help pitying them. We were all like them once, weren't we?" } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are taught that the will is everything and the Light is nothing. I'm still learning to believe it, and some days I'm not sure I ever will." } },
    holy_light = { { id = "tp_holy_light", text = "I was taught to pray to the Light as a girl, and now I'm told it's a lie. It still feels warm when I remember it, which I'm not supposed to admit." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady gave us back our minds, and we owe her for it. I only wish I knew what she means for us to do with them." } },
    _none = { { id = "tp_none", text = "I'm only a novice, I'm afraid; ask Sarvis, if you're brave." } },
  },
}

P:NPC {
  key = "montague", id = TODO_NPC("Calvin Montague"), name = "Calvin Montague",
  bible = "bibles/roads.md", role = "citizen", tier = "quest",
  communities = { "deathknell" }, temper = { "cocky" }, values = { "proud", "greedy" },
  notices = { "race", "lock_armor" },
  impression = {
    first = "He is a living man who wants a fight with the dead.",
    third = "{name} met Calvin Montague, a living rogue who picks fights with the new Forsaken near Deathknell.",
  },

  greetings = {
    { id = "g_fight", text = "Well, look at this, a walking corpse with its chin up. Fancy a little wager, deadman?" },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You're alive, at least. I'll not pick a fight with something that size; I'm brave, not stupid." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "Look at you, hiding inside a demon's hide like a turtle in its shell. Take that off and fight me like a proper deadman, unless it's the only thing holding you together." },
  },

  start = "hello",
  nodes = {
    dd_zombies = {
      lines = { { id = "dd_zombies_default", text = "Bother me? They're the reason I sleep with a knife, so no, I'm glad to see them chopped. What I can't work out is why it doesn't bother you, seeing as you were one of them a week ago." } },
      choices = {
        { text = "It does bother me. I put them down because they can't choose.", next = "BACK", reply = "Huh. That's almost decent, deadman. Don't let it go to your head, or whatever's left in there.", fx = { align = { light = 1 } } },
        { text = "They're not my people. They're just meat that walks.", next = "BACK", reply = "Cold, even for you lot. Remind me never to lose a wager to you somewhere dark.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Because you lot are slow when you first crawl out, and I need the coin. But a paladin's a different matter, and I'll confess I'm curious whether the Light is on my side or yours when the fists start flying." } },
      choices = {
        { text = "The Light takes no sides in a brawl. Fight fair.", next = "BACK", reply = "A fair fight from a paladin, how refreshing. Put your coin down and we'll see who the Light likes better.", fx = { align = { honor = 1 } } },
        { text = "No rules, then. I'll show you whose side it's on.", next = "BACK", reply = "Now you're talking like a proper road brawler, deadman. Come on, then, and mind the ditch.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I would, and I'd count it a fair test, since I've only ever fought fresh corpses who didn't know which end of the sword to hold. Whatever you pray to, I hope it's quick, because I mean to make you need it." } },
      choices = {
        { text = "I'll fight you fairly, Montague, and not heal once.", next = "BACK", reply = "A gentleman's agreement! I'll hold you to it, mind, and I'll know if you cheat.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll heal as often as I like and still win.", next = "BACK", reply = "Then I'll just have to hit you faster than you can pray. Put your coin down.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Think it? I know it, deadman, because I've been brawling on this road since before you were buried, and you're still learning which end of the sword to hold. Bring your best, and mind your knees, because they look like they'd pop out." } },
      choices = {
        { text = "A fair fight, then. No tricks from me.", next = "BACK", reply = "Good, then let's see what you've got before the sun goes down.", fx = { align = { honor = 1 } } },
        { text = "I'll win however I like, Montague.", next = "BACK", reply = "Then you'll find I don't fight fair either, deadman, and I've been doing it longer.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Calvin Montague, and don't wear the name out. I've a little coin and a lot of skill, and I'll wager you can't best me in a fair fight, deadman." },
        { id = "h_deal", tags = { "news" }, when = { questActive = TODO_QUEST("A Rogue's Deal") },
          text = "Ready, then? First to fall loses, and the loser pays. Try not to drop an arm on the way down." },
        { id = "h_beaten", when = { questDone = TODO_QUEST("A Rogue's Deal") },
          text = "Oh, it's you. Yes, you won, you needn't look so pleased, and no, you're not getting a rematch." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, out here? I'll not wager against anyone who throws lightning, thank you, so put your hands down." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, is it? I've heard your lot turn into cats, and I'll not fight a cat, because I've owned one and I know how that ends." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, are you? Splendid, then here's a fair fight at last, and none of the sneaking about that the last deadman tried." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! I've never fought one of you before, and they say you'll heal yourself in the middle of a fight, which seems rather like cheating." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin? Now that's a fight worth a few coins, because I've never punched a holy corpse before and I'd like to find out whether it punches back." },
        { id = "h_dd_zombies", when = { killed = { name = "Zombie", min = 20 } },
          text = "I watched you cut through those shambling zombies down the hill, deadman. You've decent footwork, for a corpse, though I'd still take your coin in a fair fight." },
      },
      choices = {
        { text = "Would you fight a priest who heals himself, Montague?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "You look afraid of a little lightning, Montague.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How did it end with the cat, Montague?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I've been tracking something through these fields.", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "I was a rogue before I died. Let's see who's faster.", next = "rogue", when = { class = "ROGUE" } },
        { text = "A living man seems out of place out here.", next = "why" },
        { text = "Why pick fights with the Forsaken?", next = "fights" },
        { text = "What do I win, exactly?", next = "wager" },
        { text = "Would you still want a fight against a mage, Montague?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Keep pushing and you'll be fighting my demon, Montague.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you really think you can beat a warrior, Montague?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Why are you so eager to fight one of the dead, Calvin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not interested.", next = "END" },
        { text = "Those zombies were Forsaken who never woke. Doesn't that bother you?", next = "dd_zombies", when = { killed = { name = "Zombie", min = 20 } } },
      },
      again = { { id = "h_again", text = "Still talking? I'd rather be fighting, but go on." } },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Business, of a sort that's better done far from the Scarlet Crusade's eyes. The dead don't ask questions, and they're terrible at gossip." },
      },
      choices = { { text = "What sort of business?", next = "why_business" } },
    },
    why_business = {
      lines = {
        { id = "wb_default", text = "The sort a gentleman doesn't discuss with a corpse he's just met. Beat me, and maybe I'll warm to you, though I wouldn't count on it." },
      },
      choices = {
        { text = "A shady living man near our town? You'll watch yourself.", next = "BACK", reply = "I always do, friend, which is why I'm still breathing in a town full of corpses. Watch yourself, too.", fx = { align = { order = 1 } } },
        { text = "Your business is your own. I don't care.", next = "BACK", reply = "Excellent, that's the attitude I like in a corpse. Now, are you fighting or not?", fx = { align = { order = -1 } } },
      },
    },
    fights = {
      lines = {
        { id = "fi_default", text = "Because new ones are slow and stiff and haven't learned their limbs yet. Easy coin, usually, though one or two of you have surprised me." },
      },
      choices = { { text = "I mean to surprise you too.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    wager = {
      lines = {
        { id = "wa_default", text = "Coin, and the satisfaction of beating a living man, which I'm told you lot enjoy. Lose, and you'll have the satisfaction of being dead already, so nothing much changes." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "You and half of Tirisfal, by the look of the place. If it's that cursed bat in the old farmhouse, kill it quickly, because I've been chasing it since before you lot crawled out of the ground." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Is that {pet}? It's a big one, and I'm brave, but I'm not about to pick a fight with it. If it's that cursed bat in the old farmhouse you're tracking, set your beast on it and be quick about it." },
      },
      choices = {
        { text = "I'll take it down cleanly, I promise you.", next = "BACK", reply = "Good, and you'll have my thanks, and that's all you'll have, because I'm skint.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take it however I can catch it.", next = "BACK", reply = "However you like, so long as it's dead before I go after it again. My pride can't take another round.", fx = { align = { honor = -1 } } },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "One of the trade, risen and still twitchy! This should be interesting, so try not to fall apart before I've had my fun." } },
      choices = { { text = "You first, Montague.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Afraid? Call it sensible, friend, because I've a little coin, a lot of skill and exactly one life, and I'd like to keep all three, so fight me with your fists like an honest scoundrel and I'll take your wager gladly." } },
      choices = {
        { text = "Fists it is. I'll fight you fairly.", next = "BACK", reply = "Splendid, an honest scoundrel at last. Put up your fists and mind the ditch.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll use whatever I like, and you'll still lose.", next = "BACK", reply = "Then I'll keep my coin, friend, because I'm not fool enough to wager on a lightning bolt.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Badly for my hands, and worse for my pride. I once wagered a barmaid in Brill that I could keep her tabby off the counter for an hour, and it took eight minutes, so no, I'll not fight you unless you stay on two legs." } },
      choices = {
        { text = "Two legs, then. I'll beat you fairly.", next = "BACK", reply = "Good. Two legs, two fists, and no claws, and may the better scoundrel win.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take whatever shape wins me the coin.", next = "BACK", reply = "Then I'm not fighting, friend, because I've no wish to lose to a bear twice in one lifetime.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Especially against a mage, since I've always wanted to know whether a good right hook beats a fireball when the caster stands close enough. No spells from across the field, mind; that's hardly sporting." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "A dead mage, and I'll wager you still talk like a Dalaran scholar too. Come on then, scholar, I'll even let you have the first word, but only the one." },
      },
      choices = {
        { text = "No spells, then. Fists only, as you say.", next = "BACK", reply = "A sporting mage! Come on, then, and we'll see how your nose likes a right hook.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll fight with whatever I've got, Montague.", next = "BACK", reply = "Then I'll stay well out of range and keep my coin, thank you. I've no wish to be roasted.", fx = { align = { honor = -1 } } },
        { text = "Why pick fights with the Forsaken?", next = "fights" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Then I'd be fighting the imp, and I'd likely win, which would be a terrible embarrassment for you. Put it away and face me yourself, unless your sort has forgotten how to throw a punch." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "They say the Forsaken came back hollow, and it seems you went and filled the gap with demons. Put it away and face me yourself, or are you frightened of one living man?" },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Then I'd be fighting that, and from the look of it I'd still win, which would be a terrible embarrassment for you. Send it back where it came from and face me yourself, unless your sort has forgotten how to throw a punch." },
      },
      choices = {
        { text = "Fine. The demon stays back. It's you and me.", next = "BACK", reply = "That's more like it. Put your coin down and come at me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The demon fights with me. That is what I am.", next = "BACK", reply = "Then I'll fight the imp and you can pay for my bandages. No, on second thought, no deal.", fx = { align = { honor = -1 } } },
        { text = "What do I win, exactly?", next = "wager" },
      },
    },
  },

  topics = {
    forsaken = { { id = "tp_forsaken", text = "You're one of those walking corpses, aren't you? I don't care whose army you march in now, you're still a corpse, and I'm still the best fighter in Tirisfal." } },
    scourge = { { id = "tp_scourge", text = "The Scourge killed half my village, and I've been waiting for the chance to pay it back. You'll do for practice." } },
    scarlet_crusade = { { id = "tp_scarlet_crusade", text = "The Crusade wanted me to join them, but I don't take orders from anybody, least of all men in red dresses. I'll fight the dead my own way." } },
    _none = { { id = "tp_none", text = "Ask me after you've beaten me, and even then I might lie." } },
  },
}

P:NPC {
  key = "holland", id = TODO_NPC("Junior Apothecary Holland"), name = "Junior Apothecary Holland",
  bible = "bibles/roads.md", role = "scholar", tier = "quest",
  communities = { "brill" }, temper = { "eager" }, values = { "ambitious", "curious" },
  notices = { "craft", "lock_shards" },
  impression = {
    first = "He would very much like to stop being junior.",
    third = "{name} met Junior Apothecary Holland of the Royal Apothecary Society in Brill.",
  },

  greetings = {
    { id = "g_holland", text = "Oh, good, a pair of hands! The Society always needs more hands, especially ones that don't shake or drop off in the doom weed." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { "Herbalism", "Alchemy" } },
      text = "You know your plants, I can tell by your fingers. Doom weed should be easy for you, then." },
    { id = "n_lock_infernal", cat = "lock_shards", when = { class = "WARLOCK", carrying = 5565 },
      text = "Is that an infernal stone? Johaan says they fall from the sky with a demon inside them, and I've always wanted to grind one down and see what's left. Purely professional curiosity, of course." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Nothing dangerous, I promise, only whether doom weed wilts when you touch it. If it does, the Society would want to know why, and if it doesn't, then I've learned something about the Light that the priests in Stormwind never bothered to ask." } },
      choices = {
        { text = "Test what you like, Holland. Knowledge serves the Dark Lady.", next = "BACK", reply = "Exactly! You'll be in my notes, and I'll make sure your name gets spelled right.", fx = { align = { order = 1 } } },
        { text = "I'm not a curiosity for the Society's notes.", next = "BACK", reply = "Oh, no, of course not, I only meant, well, never mind. Do let me know if you change your mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Not where Master Faranell can see, because he says prayer is a hypothesis nobody bothers to test. I said a small one over my first batch, though, and it came out rather well, so I've been wondering whether the shadow takes requests." } },
      choices = {
        { text = "A little faith never spoiled good work, Holland.", next = "BACK", reply = "I'll tell Faranell you said so, and then I'll duck. He has very strong opinions about that.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faranell's right. Measure twice and leave the gods out.", next = "BACK", reply = "That's what Faranell says, almost exactly, and I'm starting to think he might be right. Measure twice, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Muscle? Well, yes, actually, because the Scourge wander through the fields and trample everything, and I can't gather and fight at the same time. Johaan says a proper apothecary shouldn't need guarding, but Johaan doesn't gather his own weed." } },
      choices = {
        { text = "I'll guard you while you gather. The work matters.", next = "BACK", reply = "Oh, thank you! I'll be quick, I promise, and I'll try not to wander off.", fx = { align = { order = 1 } } },
        { text = "Gather your own weed, Holland. I've real fights waiting.", next = "BACK", reply = "Fair enough, though Johaan will say I told you so. I'll manage on my own, somehow.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Oh, would you? Johaan keeps the beast samples for himself, so if I had a few of my own, Darkhound blood, say, or duskbat wings, I might finally show him something he didn't think of first." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Oh, would you? Keep {pet} away from the bottles, but if you bring me Darkhound blood or duskbat wings of my own, I might finally show Johaan something he didn't think of first." },
      },
      choices = {
        { text = "I'll bring them to Johaan. The Society works together.", next = "BACK", reply = "That's very proper of you, and he'll be pleased. I suppose I'll just have to be clever some other way.", fx = { align = { order = 1 } } },
        { text = "I'll bring them to you, Holland. Let Johaan wonder.", next = "BACK", reply = "Oh, he'll hate that! Thank you, and I'll remember this when I'm a senior apothecary.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "The good ones do, because the Society needs every clever mind it can find, and I'd like to be one of them. Johaan says I'm too eager, but a mage who can keep a steady flame under a still beats three junior apothecaries, two of whom have melted their own fingers." },
      },
      choices = {
        { text = "The Dark Lady's work is worth the effort.", next = "BACK", reply = "It is, and I'm glad to hear someone say so who isn't wearing an apron. Steady flames, then.", fx = { align = { order = 1 } } },
        { text = "I'll help, but the Society can't have my secrets.", next = "BACK", reply = "Fair enough, and between you and me, I'd keep a few secrets too. The Society has a long memory.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Junior Apothecary Holland, of the Royal Apothecary Society, though I won't be junior for long. Apothecary Johaan's teaching me, and the fields around Brill are full of useful things, most of them deadly to the living, which is rather the point." },
        { id = "h_weed", tags = { "news" }, when = { questActive = TODO_QUEST("Doom Weed") },
          text = "Doom weed grows in the fields around the town, and in the graveyard, too, where it's thickest. Gather me a good bundle, and mind the roots; they're the part I want." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do the elements have any use for doom weed, do you think? I've so much of it, and only one Johaan to give it to." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You'll know plants better than I do, so tell me, does the doom weed look healthy to you?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! Do mind the doom weed when you swing that thing, because I've only just got the graveyard patch growing properly." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! You'll be out in the fields more than I am, so keep an eye out for doom weed, would you? It's the dark one, and the roots are the part I want." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Do you think there's a prayer for doom weed? I'm only asking because I've watered it every way I know and it still won't grow faster." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! Have you studied any alchemy at all? I could use a hand that won't burn the doom weed by accident." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin! Johaan says the Light makes reagents behave strangely, and I'd very much like to test that, because a discovery like that would get me out of being junior by the end of the month." },
      },
      choices = {
        { text = "Do the apothecaries pray, Holland?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What does the Society really want with all this doom weed?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why does doom weed grow best in the graveyard, Holland?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I know my herbs. The Society could use me.", next = "herb", when = { profession = { "Herbalism", "Alchemy" } } },
        { text = "What is doom weed for?", next = "weed" },
        { text = "Working for Johaan can't be easy.", next = "johaan" },
        { text = "What does the Society actually do?", next = "society" },
        { text = "I can collect doom weed quietly, Holland.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Has the Society ever bled a demon, Holland?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "The Society could use some muscle in the fields, Holland.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Should I bring you anything from the beasts around Brill, Holland?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'd guess the mages help the apothecaries, Holland.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What would you want to test on a paladin, Holland?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Good day, Holland.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? I've a pot about to boil, and the fumes would kill you if you were still breathing, so talk fast." } },
    },
    weed = {
      lines = {
        { id = "we_default", text = "Poisons and tonics, mostly, and the Society has its own uses for it, which I'm not allowed to tell you. I'm not allowed to tell myself, if it comes to that; I only gather it." },
      },
      choices = { { text = "Not knowing would bother me.", next = "weed_bother" } },
    },
    weed_bother = {
      lines = {
        { id = "wb_default", text = "Not knowing? A little, but you don't rise in the Society by asking what the Society is for, and I'd like to rise, very much." },
      },
      choices = {
        { text = "Ambition's fine. Just don't lose yourself to it.", next = "BACK", reply = "I'll try, though I've no idea what I'd lose that the plague didn't take already. Thank you for caring, though.", fx = { align = { order = -1 } } },
        { text = "Do your work and trust your masters. Smart.", next = "BACK", reply = "That's what I keep telling myself. It sounds better when you say it, somehow.", fx = { align = { order = 1 } } },
      },
    },
    johaan = {
      lines = {
        { id = "jo_default", text = "He's brilliant and impatient and never explains things twice. I've learned more in a month with him than in all my years of life, though I suppose that's not saying much for my life." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    society = {
      lines = {
        { id = "so_default", text = "Research, for the Dark Lady, in the Undercity's deepest halls. They study the plague and the Scourge, and how to turn both against the Lich King, or so they say to juniors like me." },
      },
      choices = { { text = "Something else, then.", next = "BACK", fx = { learn = "new_plague" } } },
    },
    herb = {
      lines = { { id = "hb_default", text = "Could it? Johaan would weep, if he still could! Bring the doom weed first, and then talk to him, and please mention I found you." } },
      choices = { { text = "I'll mention you.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I wish I knew, but Johaan only says it's for the Scourge and sends me back out to dig. If your spirits ever whisper what the Society is brewing, do tell me first, because I'd like to know before I'm promoted, not after." } },
      choices = {
        { text = "Trust your masters, Holland. Ask less and you'll rise.", next = "BACK", reply = "I'll try, though I'm not very good at asking less. It's a terrible habit for a junior.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Keep asking, Holland. A secret that big is worth knowing.", next = "BACK", reply = "I knew it! I'll keep my ears open, and you keep yours open too.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Because the plague is thickest there, I think, and the doom weed seems to like it. Johaan says that's exactly why it's useful, and he got a very strange look when he said it, so I wrote it down." } },
      choices = {
        { text = "Then I'll help you gather it. The Society's work matters.", next = "BACK", reply = "Splendid, and do be careful with the roots. The Society will be ever so grateful.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd burn any weed that feeds on plague, Holland.", next = "BACK", reply = "Oh, don't, please, or Johaan will have me scrubbing vials for a month. Burn something else.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Quietly is good, because the senior apothecaries don't much like knowing how much I've been ordering. Bring it straight to me and not to Johaan, and I'll remember who helped me when I'm no longer junior." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "Thieves make the best gatherers, you know, because they never bring back more than they can carry unnoticed. Mind the doom weed, though; it stings even dead fingers." },
      },
      choices = {
        { text = "I'll take it to Johaan. He's your superior.", next = "BACK", reply = "Proper of you, I suppose, and he'll be very pleased. I'll find another way to get ahead.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your secret's safe with me, Holland.", next = "BACK", reply = "Thank you, and I'll not forget it when I'm wearing the senior robes. That's a promise.", fx = { align = { order = -1 } } },
        { text = "What is doom weed for?", next = "weed" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Officially, no, because the senior apothecaries say demons make unreliable subjects and they bite. Unofficially I've wondered what an imp's blood would do in a tincture, but I'd need a warlock willing to ask it nicely." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "You've got the look the Cult's people had, as if you're listening to something nobody else can hear. I don't mind it; the Society could use someone who isn't squeamish." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Officially, no, because the senior apothecaries say demons make unreliable subjects and they bite. Unofficially, I've been wondering what's in yours since you walked in, and if you could persuade it to hold still for one small needle, I'd be very quiet about it." },
      },
      choices = {
        { text = "My demon is no test subject, Holland. It's mine.", next = "BACK", reply = "No, of course not, and I'd never dream of asking. Well, I'd dream of it, but I'd never ask.", fx = { align = { honor = 1 } } },
        { text = "For the right reason, it could bleed a little. Or a lot.", next = "BACK", reply = "Oh, splendid! Only a little, I promise, and I'll write down your name in the results.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "What does the Society actually do?", next = "society" },
      },
    },
  },

  topics = {
    new_plague = { { id = "tp_new_plague", text = "I'm not supposed to talk about the Society's work, but between us, it's going to change everything. And I'll be a full apothecary by then, if Master Johaan ever stops hogging the good reagents." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken need clever minds as much as strong arms, and I intend to be one of the cleverest. Doom weed has its own surprising uses, you know." } },
    scourge = { { id = "tp_scourge", text = "The Scourge spreads its sickness, and we spread ours, except ours will be better. That's all I can say, really, and it may be more than I should." } },
    _none = { { id = "tp_none", text = "No idea, but I'll look it up, if you let me forget the doom weed." } },
  },
}
