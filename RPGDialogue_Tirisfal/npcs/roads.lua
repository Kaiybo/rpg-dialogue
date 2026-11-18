-- More of Tirisfal: Deathknell's guard and novice, a living brawler on the road, and Brill's junior apothecary. Voice: bibles/roads.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "saltain", id = TODO_NPC("Deathguard Saltain"), name = "Deathguard Saltain",
  bible = "bibles/roads.md", role = "soldier", tier = "quest",
  communities = { "deathknell" }, temper = { "brisk" }, values = { "practical", "dutiful" },
  notices = { "kit" },
  impression = {
    first = "Deathguard Saltain greets the newly risen the way a quartermaster greets new recruits, with a list of what they need and no sympathy at all for what they've lost.",
    third = "{name} met Deathguard Saltain, who sets the freshly risen Forsaken of Deathknell to scavenging.",
  },

  greetings = {
    { id = "g_fresh", text = "Freshly risen, are you? It shows, so come here and I'll tell you what you're missing." },
  },

  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Look at you, barely a stitch on. The grave isn't generous with clothing, and I've seen better dressed ghouls." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The Deathguard has use for anything that stands up and follows orders. Your Light heals, I'm told, which means one fewer body for me to replace, and that's the only sort of miracle I keep track of." } },
      choices = {
        { text = "Then count on me, Saltain. I'll keep your guards standing.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll heal who needs it, not who your ledger says.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They're past caring, and I'm past asking, but the newly risen watch me drag them in, and a word over them seems to settle their stomachs, or whatever we have instead of stomachs. Bless them if you like, provided you do it quickly." } },
      choices = {
        { text = "They were people once. They'll have their blessing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Waste of breath, Saltain. Just gather them.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "I'll bring back every hide. Deathknell comes first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll keep the best pelts, and you'll have the rest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "It can carry what you find in the ruins, and it won't complain, so it's already ahead of my recruits. Bring me every scrap from the houses of Deathknell, and keep it on a short leash, because I've lost enough supplies already." },
      },
      choices = {
        { text = "I'll bring everything back, Saltain.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll keep the best scraps for myself.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "Can my demon help you scavenge, Saltain?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
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
        { text = "The dead don't need coats. Take what serves us.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "We should honor whose they were, at least.", next = "BACK", fx = { align = { light = 1 } } },
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
      choices = { { text = "Grim, but true. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Always, and yours looks sharper than mine. The Scourge come in from the east in ones and twos, and you put them down before they turn into threes and fours." } },
      choices = {
        { text = "Then I'll stand watch here and keep them in ones.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hunt them down on my own terms, not stand about.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "Then at least speak their names when you take their things.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fair. The past has no claim on what's useful.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Grow what, and for whom? Joshua Kien, who keeps our stores, gets his bread from Brill and the apothecaries want only the weeds, but if you can coax a few rows of something useful out of that soil, I'll set a guard on it, though I'll not set three." } },
      choices = {
        { text = "One guard will do. I'll make the rows worth guarding.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Guard it or don't. I'll plant what I like.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "Supplies, not keepsakes. I'll bring you all of it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep whatever catches my eye, Deathguard.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "I'll fetch the supplies first, as ordered.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I didn't study for years to haul sacks.", next = "BACK", fx = { align = { order = -1 } } },
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
  notices = { "class" },
  impression = {
    first = "Novice Elreth is still learning the Forsaken's dark devotions and still a little troubled by them. She speaks of the mindless dead with something close to pity.",
    third = "{name} met Novice Elreth, a Forsaken novice of the priesthood at Deathknell.",
  },

  greetings = {
    { id = "g_novice", text = "Oh, a new one! Welcome back to the world, friend, such as it is, and mind your jaw on the stairs, because the fresh ones keep losing theirs." },
    { id = "g_xchapel", when = { origin = "forsaken_chapel_priest" }, text = "Oh, you were a priest before, weren't you? You still fold your hands like one. I'd love to hear someday whether the Light feels different to you now, because nobody here will tell me." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, like me! Or like I'm trying to be. Sarvis says the Light abandoned us, and I'm still deciding what I think about that." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "That maybe the Light didn't abandon us so much as lose sight of us for a while. I put the mindless ones to rest with shadow because it's what I've been taught, but I wonder sometimes whether you'd do it more gently." } },
      choices = {
        { text = "The Light can be gentle with them. I'll show you.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Shadow or Light, rest is rest. Sarvis teaches you well.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I believe it is, though I pray over them afterwards, which Sarvis finds very sentimental of me. A clean stroke is kinder than anything they'll find wandering the fields, and a warrior's blade is cleaner than a hungry wolf." } },
      choices = {
        { text = "Then I'll strike cleanly, and you can say the prayer.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They're past mercy, Elreth. I'll just clear the field.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "I'll find them, and you can grant them rest.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll find them, but I won't waste prayers on them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Because they were people once, like us, and the Scourge took everything they were and left the bodies walking. Sarvis tells me to put them down without feeling anything, but I can't, so when you cut one down, please do it quickly." },
      },
      choices = {
        { text = "I'll do it quickly. They deserve that much.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They're mindless. They don't feel a thing.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "Shadow and fel aren't so different, Elreth.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
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
        { text = "That word matters. Keep saying it.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "They're Scourge. Cut them down and move on.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
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
        { text = "I'll ask, and tell you straight, whatever they say.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll tell you they rest. That's the kindness you need.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "I'd like to think so, though Sarvis laughs when I say it. The Damned walk the fields because nobody let them lie down properly, and I wonder sometimes whether the earth misses them, or whether it's only me." } },
      choices = {
        { text = "Then let the earth have them back, gently.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sentiment won't help them. Cut them down and move on.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "Pity for the Damned is a kindness worth keeping.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Pity is wasted on the mindless, Elreth.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Who are the Damned, exactly?", next = "damned" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Sarvis says much the same, and I nod when he says it, but shadow at least comes from inside you, and a demon comes from somewhere else entirely. I'd keep a close eye on anything that wants to be invited in." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "We were all slaves to one master already, and now you've chosen to bargain with another sort of thing. I don't judge you for it, but I'll say a quiet word for you all the same." },
      },
      choices = {
        { text = "Say your word, Elreth. I won't mind it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Save your prayers. I chose this freely.", next = "BACK", fx = { align = { light = -1 } } },
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
  notices = { "race" },
  impression = {
    first = "Calvin Montague is a living man loitering outside Deathknell, of all places, and he wants a fight. He seems to think a freshly risen corpse will be an easy one.",
    third = "{name} met Calvin Montague, a living rogue who picks fights with the new Forsaken near Deathknell.",
  },

  greetings = {
    { id = "g_fight", text = "Well, look at this, a walking corpse with its chin up. Fancy a little wager, deadman?" },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You're alive, at least. I'll not pick a fight with something that size; I'm brave, not stupid." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Because you lot are slow when you first crawl out, and I need the coin. But a paladin's a different matter, and I'll confess I'm curious whether the Light is on my side or yours when the fists start flying." } },
      choices = {
        { text = "The Light takes no sides in a brawl. Fight fair.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "No rules, then. I'll show you whose side it's on.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I would, and I'd count it a fair test, since I've only ever fought fresh corpses who didn't know which end of the sword to hold. Whatever you pray to, I hope it's quick, because I mean to make you need it." } },
      choices = {
        { text = "I'll fight you fairly, Montague, and not heal once.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll heal as often as I like and still win.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Think it? I know it, deadman, because I've been brawling on this road since before you were buried, and you're still learning which end of the sword to hold. Bring your best, and mind your knees, because they look like they'd pop out." } },
      choices = {
        { text = "A fair fight, then. No tricks from me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll win however I like, Montague.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! I've never fought one of you before, and I hear you'll heal yourself in the middle of a fight, which seems rather like cheating." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin? Now that's a fight worth a few coins, because I've never punched a holy corpse before and I'd like to find out whether it punches back." },
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
        { text = "Keep pushing and you'll fight my demon, not me.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you really think you can beat a warrior, Montague?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Why are you so eager to fight one of the dead, Calvin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not interested.", next = "END" },
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
        { text = "A shady living man near our town? You'll watch yourself.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your business is your own. I don't care.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "I'll take it down cleanly, I promise you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take it however I can catch it.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { text = "Fists it is. I'll fight you fairly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll use whatever I like, and you'll still lose.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Badly for my hands, and worse for my pride. I once wagered a barmaid in Brill that I could keep her tabby off the counter for an hour, and it took eight minutes, so no, I'll not fight you unless you stay on two legs." } },
      choices = {
        { text = "Two legs, then. I'll beat you fairly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take whatever shape wins me the coin.", next = "BACK", fx = { align = { honor = -1 } } },
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
        { text = "No spells, then. Fists only, as you say.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll fight with whatever I've got, Montague.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Why pick fights with the Forsaken?", next = "fights" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Then I'd be fighting the imp, and I'd likely win, which would be a terrible embarrassment for you. Put it away and face me yourself, unless your sort has forgotten how to throw a punch." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "They say the Forsaken came back hollow, and it seems you went and filled the gap with demons. Put it away and face me yourself, or are you frightened of one living man?" },
      },
      choices = {
        { text = "Fine. The demon stays back; it's you and me.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The demon fights with me. That's what a warlock is.", next = "BACK", fx = { align = { honor = -1 } } },
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
  notices = { "craft" },
  impression = {
    first = "Junior Apothecary Holland would very much like to stop being junior. He's ambitious, eager and slightly too pleased with the smell of doom weed.",
    third = "{name} met Junior Apothecary Holland of the Royal Apothecary Society in Brill.",
  },

  greetings = {
    { id = "g_holland", text = "Oh, good, a pair of hands! The Society always needs more hands, especially ones that don't shake or drop off in the doom weed." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { "Herbalism", "Alchemy" } },
      text = "You know your plants, I can tell by your fingers. Doom weed should be easy for you, then." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Nothing dangerous, I promise, only whether doom weed wilts when you touch it. If it does, the Society would want to know why, and if it doesn't, then I've learned something about the Light that the priests in Stormwind never bothered to ask." } },
      choices = {
        { text = "Test what you like, Holland. Knowledge serves the Dark Lady.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'm not a curiosity for the Society's notes.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Not where Master Faranell can see, because he says prayer is a hypothesis nobody bothers to test. I said a small one over my first batch, though, and it came out rather well, so I've been wondering whether the shadow takes requests." } },
      choices = {
        { text = "A little faith never spoiled good work, Holland.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faranell's right. Measure twice and leave the gods out.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Muscle? Well, yes, actually, because the Scourge wander through the fields and trample everything, and I can't gather and fight at the same time. Johaan says a proper apothecary shouldn't need guarding, but Johaan doesn't gather his own weed." } },
      choices = {
        { text = "I'll guard you while you gather. The work matters.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Gather your own weed, Holland. I've real fights waiting.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "I'll bring them to Johaan. The Society works together.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll bring them to you, Holland. Let Johaan wonder.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "The good ones do, because the Society needs every clever mind it can find, and I'd like to be one of them. Johaan says I'm too eager, but a mage who can keep a steady flame under a still beats three junior apothecaries, two of whom have melted their own fingers." },
      },
      choices = {
        { text = "The Dark Lady's work is worth the effort.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll help, but the Society can't have my secrets.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "Does the Society ever study demons, Holland?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
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
        { id = "wb_default", text = "Not knowing? A little. But you don't rise in the Society by asking what the Society is for, and I'd like to rise, very much." },
      },
      choices = {
        { text = "Ambition's fine. Just don't lose yourself to it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Do your work and trust your masters. Smart.", next = "BACK", fx = { align = { order = 1 } } },
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
        { text = "Trust your masters, Holland. Ask less and you'll rise.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Keep asking, Holland. A secret that big is worth knowing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Because the plague is thickest there, I think, and the doom weed seems to like it. Johaan says that's exactly why it's useful, and he got a very strange look when he said it, so I wrote it down." } },
      choices = {
        { text = "Then I'll help you gather it. The Society's work matters.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd burn any weed that feeds on plague, Holland.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "I'll take it to Johaan. He's your superior.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your secret's safe with me, Holland.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What is doom weed for?", next = "weed" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Officially, no, because the senior apothecaries say demons make unreliable subjects and they bite. Unofficially I've wondered what an imp's blood would do in a tincture, but I'd need a warlock willing to ask it nicely." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "You've got the look the Cult's people had, as if you're listening to something nobody else can hear. I don't mind it; the Society could use someone who isn't squeamish." },
      },
      choices = {
        { text = "My demon isn't a test subject, Holland.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "For the right reason, it could bleed a little.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
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
