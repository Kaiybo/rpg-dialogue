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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deathguard Saltain. Deathknell is ruins and the Dark Lady's people need everything, so we scavenge, and you'll start with the scraps the Scourge left behind in those houses." },
        { id = "h_scavenge", tags = { "news" }, when = { questActive = TODO_QUEST("Scavenging Deathknell") },
          text = "Scraps of cloth and old gear, from the houses up the hill. They were somebody's once, and now they're ours, so don't be sentimental about it." },
      },
      choices = {
        { text = "Need another blade on the road, Deathguard?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "I was a soldier of Lordaeron. I know how to forage.", next = "soldier", when = { origin = "forsaken_lordaeron_soldier" } },
        { text = "Whose things were they?", next = "whose" },
        { text = "What happened to Deathknell?", next = "town" },
        { text = "Why should I serve the Dark Lady?", next = "lady" },
        { text = "I'll get to it.", next = "END" },
      },
      again = { { id = "h_again", text = "What else? Time's the one thing we've plenty of, but I'd still not waste it." } },
    },
    whose = {
      lines = {
        { id = "wh_default", text = "Farmers, a smith, a schoolmistress, I'd guess, from the slates. They died when the plague came through, and some of them rose and some of them didn't." },
      },
      choices = { { text = "Doesn't taking their things trouble you?", next = "whose_trouble" } },
    },
    whose_trouble = {
      lines = {
        { id = "wt_default", text = "It did, the first week. Then I needed a coat, and the coat didn't care whose it was, and neither does the cold." },
      },
      choices = {
        { text = "The dead don't need coats. Take what serves us.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "We should honor whose they were, at least.", next = "BACK", fx = { align = { light = 1 } } },
      },
    },
    town = {
      lines = {
        { id = "to_default", text = "The plague, then the Scourge, then us. It's a graveyard with a few houses still standing, and Shadow Priest Sarvis wakes the dead from it, one by one." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lady = {
      lines = {
        { id = "la_default", text = "Because she broke the Lich King's hold on us, and nobody else bothered to try. You'll have your own reasons soon enough, and if not, the Scourge will give you some." },
      },
      choices = { { text = "Fair enough. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Always, and yours looks sharper than mine. The Scourge come in from the east in ones and twos, and the trick is never letting them become threes and fours." } },
      choices = {
        { text = "Then I'll stand watch here and keep them in ones.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hunt them down on my own terms, not stand about.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    soldier = {
      lines = { { id = "so_default", text = "A soldier of Lordaeron, then you'll remember the long marches with half rations. Scavenging is no different, except the people you're taking from won't complain." } },
      choices = { { text = "Old habits, then.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea. Go and scavenge something useful instead." } },
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
    { id = "g_novice", text = "Oh, a new one! Welcome back to the world, friend, such as it is." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, like me! Or like I'm trying to be. Sarvis says the Light abandoned us, and I'm still deciding what I think about that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Novice Elreth, a student of Shadow Priest Sarvis. I help the newly risen find their feet, and I help the ones who never found theirs to lie down again." },
        { id = "h_damned", tags = { "news" }, when = { questActive = TODO_QUEST("The Damned") },
          text = "The Damned in the fields are what we'd have been without the Dark Lady, mindless and hungry. Put them to rest; it's the kindest thing left to do." },
        { id = "h_marla", when = { questActive = TODO_QUEST("Marla's Last Wish") },
          text = "Marla Fowler's husband, Samuel, rose and wanders mindless near the Solliden Farmstead. Bring his remains back to her grave, so the two of them can rest together." },
      },
      choices = {
        { text = "I prayed to the Light once, too. Does it still answer?", next = "priest", when = { class = "PRIEST" } },
        { text = "Who are the Damned?", next = "damned" },
        { text = "Tell me about Marla.", next = "marla" },
        { text = "Why does the Light mean nothing to Sarvis?", next = "light" },
        { text = "Farewell, Elreth.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? I don't mind; I'm meant to be learning patience." } },
    },
    damned = {
      lines = {
        { id = "da_default", text = "The ones the Lich King's grip held onto when ours slipped free. They don't remember their names, and they don't know they've died, which may be a mercy or may be the cruellest part." },
      },
      choices = { { text = "Do they suffer?", next = "damned_suffer" } },
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
        { id = "ma_default", text = "A farmwife, buried before the plague took the rest of her family. Her husband died later and rose with the Damned, and it seemed wrong to me that they'd stay apart forever." },
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
  },

  topics = {
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Calvin Montague, and don't wear the name out. I've a little coin and a lot of skill, and I'll wager you can't best me in a fair fight, deadman." },
        { id = "h_deal", tags = { "news" }, when = { questActive = TODO_QUEST("A Rogue's Deal") },
          text = "Ready, then? First to fall loses, and the loser pays. Try not to drop an arm on the way down." },
        { id = "h_beaten", when = { questDone = TODO_QUEST("A Rogue's Deal") },
          text = "Oh, it's you. Yes, you won, you needn't look so pleased, and no, you're not getting a rematch." },
      },
      choices = {
        { text = "I've been tracking something through these fields.", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "I was a rogue before I died. Let's see who's faster.", next = "rogue", when = { class = "ROGUE" } },
        { text = "What's a living man doing out here?", next = "why" },
        { text = "Why pick fights with the Forsaken?", next = "fights" },
        { text = "What do I win, exactly?", next = "wager" },
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
  },

  topics = {
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
    { id = "g_holland", text = "Oh, good, a pair of hands! The Society always needs more hands, especially ones that don't shake." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { "Herbalism", "Alchemy" } },
      text = "You know your plants, I can tell by your fingers. Doom weed should be easy for you, then." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Junior Apothecary Holland, of the Royal Apothecary Society, though I won't be junior for long. Johaan's teaching me, and I'm learning fast, and the fields around Brill are full of useful things." },
        { id = "h_weed", tags = { "news" }, when = { questActive = TODO_QUEST("Doom Weed") },
          text = "Doom weed grows in the fields around the town, and in the graveyard, too, where it's thickest. Gather me a good bundle, and mind the roots; they're the part I want." },
      },
      choices = {
        { text = "I know my herbs. Could the Society use me?", next = "herb", when = { profession = { "Herbalism", "Alchemy" } } },
        { text = "What is doom weed for?", next = "weed" },
        { text = "How do you find working for Johaan?", next = "johaan" },
        { text = "What does the Society actually do?", next = "society" },
        { text = "Good day, Holland.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? I've a pot about to boil, but talk fast." } },
    },
    weed = {
      lines = {
        { id = "we_default", text = "Poisons and tonics, mostly, and the Society has its own uses for it, which I'm not allowed to tell you. I'm not allowed to tell myself, honestly; I only gather it." },
      },
      choices = { { text = "Doesn't that bother you?", next = "weed_bother" } },
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
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea, but I'll look it up, if you let me forget the doom weed." } },
  },
}
