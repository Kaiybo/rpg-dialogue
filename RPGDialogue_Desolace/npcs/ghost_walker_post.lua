-- Ghost Walker Post: Gurda Wildmane (Magram Alliance / Gelkis Alliance), Harnor (food and drink),
-- Kireena (trade goods). Horde. Voice: bibles/ghost_walker_post.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Gurda Wildmane: tauren shaman who sets the centaur clans against each other.
P:NPC {
  key = "gurda", id = TODO_NPC("Gurda Wildmane"), name = "Gurda Wildmane",
  bible = "bibles/ghost_walker_post.md", role = "questgiver", tier = "quest",
  communities = { "ghost_walker" }, temper = { "shrewd", "solemn" }, values = { "cunning", "devout" },
  notices = { "race", "class", "rep" },
  impression = {
    first = "Gurda Wildmane tends the dying kodo at Ghost Walker Post with one hand and plays the centaur clans against each other with the other. She is gentle about the first and cold about the second, and she sees no contradiction.",
    third = "{name} met Gurda Wildmane, the tauren shaman of Ghost Walker Post who means to break the centaur by their own hatreds.",
  },

  greetings = {
    { id = "g_default", text = "Walk softly, {class}. The kodo come here to die, and their spirits are listening." },
    { id = "g_magram", when = { questActive = TODO_QUEST("Magram Alliance") }, text = "You've chosen the Magram, then. Every Gelkis you cut down is a word in the Magram's ear, and they are listening." },
    { id = "g_gelkis", when = { questActive = TODO_QUEST("Gelkis Alliance") }, text = "You walk with the Gelkis now. The Magram will learn to fear your name, and the Gelkis will learn to trust it." },
    { id = "g_done", when = { any = { { questDone = TODO_QUEST("Magram Alliance") }, { questDone = TODO_QUEST("Gelkis Alliance") } } }, text = "One clan calls you friend and the other calls you butcher, and both of them are talking to us now. That is how the Horde wins in Desolace." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}. Three kodo came to the graveyard while you were away, and I sang for each of them." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The braves speak well of you, {name}. Words travel fast across grey land." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the Earth Mother. The centaur have hunted our people since before the tribes were united, and you of all people will understand why I don't weep for them." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You hear the spirits too. Then you can feel them here, the old kodo walking toward the bones, and you'll know to step aside." },
    { id = "n_magram_rep", cat = "rep", when = { reputation = { faction = "Magram Clan Centaur", min = "friendly" } },
      text = "You smell of Magram smoke. Good; it means they let you close enough to sit by their fires." },
    { id = "n_gelkis_rep", cat = "rep", when = { reputation = { faction = "Gelkis Clan Centaur", min = "friendly" } },
      text = "The Gelkis have marked you as a friend; I can see the earth-paint on your boots. Use it while it lasts." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Gurda Wildmane. The centaur clans rule the wastes of Desolace, and if they ever stood together, they would be a terrible force. It is good, then, that they bicker and war among themselves, and better still that we help them do it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Magram Alliance") },
          text = "To beat the centaur, we use their hatred against them. Ally with one clan, slay its rivals, and through it we learn how to break them all; choose the Magram and kill Gelkis, or choose the Gelkis and kill Magram." },
        { id = "h_active_m", tags = { "news" }, when = { questActive = TODO_QUEST("Magram Alliance") },
          text = "Kill the Gelkis in the southwest, and the Magram will come to respect you. When they do, find their spokesman Warug at the edge of their village in the southeast." },
        { id = "h_active_g", tags = { "news" }, when = { questActive = TODO_QUEST("Gelkis Alliance") },
          text = "Slay the Magram, and the Gelkis will hear of it. When they honour you, find Uthek the Wise, their shaman, at the edge of their village in the southwest." },
        { id = "h_after", when = { any = { { questDone = TODO_QUEST("Magram Alliance") }, { questDone = TODO_QUEST("Gelkis Alliance") } } },
          text = "You stand in a clan's favour now, and through you, so does the Horde. Listen to what they tell you about their enemies, and remember all of it, because one day we will need it." },
        { id = "h_cleared", tags = { "news" }, when = { cleared = "Maraudon" },
          text = "The earth under the post is quiet for the first time in my life, and the shaman say the centaur's mother is dead below Maraudon. I don't know whether to give thanks or to brace for what the clans do without her." },
      },
      again = {
        { id = "h_again", text = "What else would you ask, {class}? The spirits are patient, and so am I." },
        { id = "h_again2", text = "Speak. The wind carries nothing away here that it doesn't bring back." },
      },
      choices = {
        { text = "Why turn the clans on each other?", next = "plan" },
        { text = "Which clan should I choose?", next = "choose" },
        { text = "What is this place?", next = "graveyard" },
        { text = "Where do the centaur come from?", next = "origin" },
        { text = "Do you hate the centaur?", next = "hate" },
        { text = "What would you have me do?", next = "BUSINESS" },
        { text = "Earth Mother keep you, Gurda.", next = "END" },
      },
    },

    plan = {
      lines = {
        { id = "pl_default", text = "Because we are few out here and they are many, and every brave I lose to a centaur raid is a brave I cannot replace. If the Magram kill Gelkis for us, or the Gelkis kill Magram, then the Horde keeps its warriors and the clans pay the price." },
      },
      choices = {
        { text = "Isn't that dishonourable?", next = "plan_honour" },
        { text = "What happens when one clan wins?", next = "plan_win" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan_honour = {
      big = true,
      lines = {
        { id = "ph_default", text = "Some of the braves say so, and Takata Steelblade would rather ride out and fight them all with the Warchief's blessing. But honour won't bring back the families the centaur trampled in the Barrens, and I'm a shaman, not a song." },
      },
      choices = {
        { text = "Better a clever peace than an honest grave.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd rather face them openly, blade to blade.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan_win = {
      lines = {
        { id = "pw_default", text = "Neither will win, if we're careful, because we will always lean on the one that is losing. A clan that thinks it's about to win stops needing friends, and that is when it turns on us." },
      },
      choices = {
        { text = "You've thought about this a long time.", next = "plan_long" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan_long = {
      lines = {
        { id = "plg_default", text = "Every night since I came to this post, with the bones of the kodo shining under the moon. The dead are good company for thinking, because they never interrupt." },
      },
      choices = {
        { text = "I'll remember the lesson.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    choose = {
      lines = {
        { id = "ch_default", text = "The Magram are strong and proud, and they boast that they are the true heirs of the centaur. The Gelkis are fewer and more devout, and they honour the earth spirit they call their mother; each will tell you the other is a pack of fools." },
        { id = "ch_done", when = { any = { { questDone = TODO_QUEST("Magram Alliance") }, { questDone = TODO_QUEST("Gelkis Alliance") } } },
          text = "You've already chosen, and you can't easily take it back, though some have tried. Stand by your clan for now, because a friend who changes sides is trusted by no one." },
      },
      choices = {
        { text = "I'll side with the Magram. Strength wins wars.", next = "choose_m" },
        { text = "I'll side with the Gelkis. Faith binds harder.", next = "choose_g" },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose_m = {
      big = true,
      lines = {
        { id = "cm_default", text = "Then go and earn their respect in Gelkis blood. Warug will judge you, and he judges harshly, so don't come to him with a light bag." },
      },
      choices = {
        { text = "They're centaur. I'll kill as many as it takes.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll kill warriors, not their young.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose_g = {
      big = true,
      lines = {
        { id = "cg_default", text = "Then go and earn their trust in Magram blood. Uthek the Wise is old, and she will want to know why a stranger would spill blood for her clan, so have an answer ready." },
      },
      choices = {
        { text = "For the Horde. That's answer enough.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "For the coin and the glory, if I'm honest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    graveyard = {
      lines = {
        { id = "gr_default", text = "The kodo graveyard lies just beyond the post. When a kodo knows its time has come, it walks here from wherever it is, sometimes across the whole of Kalimdor, and lies down among the bones of its ancestors." },
      },
      choices = {
        { text = "And you watch over them?", next = "graveyard_watch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    graveyard_watch = {
      lines = {
        { id = "gw_default", text = "We sing them into their next lives, my shaman and I, and we drive off the scavengers who would pick at them before their spirits have left. Some kodo spirits linger, angry, and those we must calm or send away." },
        { id = "gw_tauren", when = { race = "Tauren" }, text = "We sing them on, as our grandmothers did, and we keep the scavengers from the bones until the spirit has gone. You will have heard such songs in Mulgore, though here they are longer, because the land is sadder." },
      },
      choices = {
        { text = "That's a gentle duty in a hard land.", next = "graveyard_hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    graveyard_hard = {
      lines = {
        { id = "gh_default", text = "It is the only gentle thing I do, and it keeps me honest about the rest. I sing for the kodo in the morning and count dead centaur in the evening, and I ask the Earth Mother to forgive whichever of those needs it." },
      },
      choices = {
        { text = "She'll understand, I think.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    origin = {
      lines = {
        { id = "or_default", text = "The Gelkis say they were born of the earth spirit who sleeps beneath Maraudon, and the Magram say that's nonsense and they came from a great khan. The druids of Nijel's Point tell something stranger, and they tell it better than I do." },
      },
      choices = {
        { text = "What do the druids say?", next = "origin_druids" },
        { text = "Something else.", next = "BACK" },
      },
    },
    origin_druids = {
      lines = {
        { id = "od_default", text = "That the centaur are the children of a son of Cenarius and a princess of the earth, and that the father was murdered by his own children. If it's true, it explains a great deal about the way they treat everyone else." },
      },
      choices = {
        { text = "That's a dark tale.", next = "BACK", fx = { trait = { curious = 1 }, learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },

    hate = {
      big = true,
      lines = {
        { id = "ha_default", text = "I hate what they do. They raided our camps in Mulgore and the Barrens for generations, and they killed my mother's brother at the Red Rocks when I was a calf. But I don't hate the foals, and I won't let a brave touch one, whatever the others say." },
      },
      choices = {
        { text = "Mercy for their young is right.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Foals grow into raiders. Mercy is a mistake.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Wildmane by blood and shaman by calling, sent here by Thunder Bluff to watch the clans and sing for the kodo." } },
    advice = { { id = "tp_ad", text = "Never let a centaur see that you've chosen a side, unless it's theirs." } },
    _none = { { id = "tp_none", text = "The spirits haven't told me that, and I don't guess about things that matter." } },
  },
}

-- Harnor: tauren food and drink vendor.
P:NPC {
  key = "harnor", id = TODO_NPC("Harnor"), name = "Harnor", title = "Food & Drink",
  bible = "bibles/ghost_walker_post.md", role = "vendor", tier = "service",
  communities = { "ghost_walker" }, temper = { "cheerful", "earnest" }, values = { "hospitality", "nature" },
  notices = { "race", "hunger", "weary" },
  impression = {
    first = "Harnor feeds Ghost Walker Post and seems determined to be cheerful about it, though nothing grows in Desolace and everything has to be carried in. He worries about whether people have eaten, and he means it.",
    third = "{name} met Harnor, the cheerful tauren who sells food and drink at Ghost Walker Post.",
  },

  greetings = {
    { id = "g_default", text = "Have you eaten? You haven't; I can see it. Sit, and let me sell you something that isn't trail bread." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still thin. Desolace does that to everyone, so let's fix it." },
  },

  notice = {
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken. I never know what to offer your people, so I'll offer water and not be offended if you say no." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc! Felgur and Takata eat like a warband between them, and I'm always glad of another orc appetite to keep the bread from going stale." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You look like the centaur rode over you. Eat first, then go and rest, and fight tomorrow." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Harnor, and I keep the post fed: bread, cheese, melon juice and clean water, carried down from Thunder Bluff because nothing here grows. If you leave hungry, it's because you refused, and I'll hold that against you." },
      },
      again = {
        { id = "h_again", text = "What else? There's still bread, if you're only asking to be polite." },
        { id = "h_again2", text = "Go on, ask. I'm good company while you eat." },
      },
      choices = {
        { text = "How do you get food out here?", next = "supply" },
        { text = "Why does nothing grow here?", next = "grey" },
        { text = "Is it hard to stay cheerful here?", next = "cheer" },
        { text = "Let me see your food.", next = "BUSINESS" },
        { text = "I've eaten, thank you. Farewell.", next = "END" },
      },
    },

    supply = {
      lines = {
        { id = "su_default", text = "By kodo, all the way from Thunder Bluff, and the kodo go slow across the grey land, because they can feel the graveyard calling. Some of the old ones never make the trip back, and we let them walk to the bones in peace." },
      },
      choices = {
        { text = "That must be sad to watch.", next = "supply_sad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply_sad = {
      big = true,
      lines = {
        { id = "ss_default", text = "It is, and the drovers weep, but it's the kodo's right to choose where it dies. A young drover from the Barrens once whipped an old one past the graveyard to finish a run, and Gurda had him sent home." },
      },
      choices = {
        { text = "Gurda was right. The kodo chose.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A drover has a duty to finish the run.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    grey = {
      lines = {
        { id = "gr_default", text = "The shaman say the land is sick, that something under it poisons the roots, and the centaur have trampled what little was left. I tried to plant melons by the totems once, and they came up grey and tasted of dust." },
      },
      choices = {
        { text = "Melons, in Desolace? That was brave, Harnor.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    cheer_who = {
      lines = {
        { id = "cw_default", text = "Takata, though he'd never admit it; he comes back from Thunder Axe and eats without tasting anything. Felgur eats like a wolf and talks to nobody, and somehow that worries me less." },
      },
      choices = {
        { text = "Keep feeding them, Harnor.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheer = {
      lines = {
        { id = "ch_default", text = "It's hard, but someone has to be, and the braves come back from the centaur camps with nothing in their eyes. A full bowl and a friendly word bring a little of it back, and that's my part of the fighting." },
      },
      choices = {
        { text = "That's a good part to play.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Who comes back worst?", next = "cheer_who" },
        { text = "Farewell, Harnor.", next = "END" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I cooked for my family in Mulgore, and then for a whole post in Desolace. The bowls got bigger." } },
    advice = { { id = "tp_ad", text = "Carry water. Never drink from the pools near Maraudon, whatever colour they are." } },
    _none = { { id = "tp_none", text = "I don't know, friend, but I'll feed you while you find out." } },
  },
}

-- Kireena: tauren trade goods vendor.
P:NPC {
  key = "kireena", id = TODO_NPC("Kireena"), name = "Kireena", title = "Trade Goods",
  bible = "bibles/ghost_walker_post.md", role = "vendor", tier = "service",
  communities = { "ghost_walker" }, temper = { "quiet", "shrewd" }, values = { "craft", "practical" },
  notices = { "craft", "race" },
  impression = {
    first = "Kireena sells thread, dye and vials at Ghost Walker Post and buys anything useful the braves bring back from the centaur camps. She is quiet, sharp with a bargain, and not sentimental about where things come from.",
    third = "{name} met Kireena, who sells trade goods at Ghost Walker Post.",
  },

  greetings = {
    { id = "g_default", text = "Trade goods, {class}. Thread, vials, salt and dye, and I buy hides if they're clean." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good; you paid without haggling last time, and I remember that." },
  },

  notice = {
    { id = "n_skin", cat = "craft", when = { profession = { "Skinning", "Leatherworking" } },
      text = "You work hides. The scorpids out on the flats have tough shells and good leather under them, if you can get a knife past the tail." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor. Centaur weave a coarse cloth that takes dye well, if you're not too proud to unpick what you find in their camps." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear. The trolls at Shadowprey trade me fish oil for salt, and they always try to cheat me, and I always let them think they have." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Kireena. I keep the crafters at this post supplied, which isn't many, and I buy what the braves carry back from the camps, which is a great deal. Desolace has little that grows, but plenty that can be taken." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm counting spools." },
        { id = "h_again2", text = "Ask, then, but quickly. Light's going." },
      },
      choices = {
        { text = "What do the braves bring back?", next = "loot" },
        { text = "Who trades with you out here?", next = "traders" },
        { text = "What's worth taking in Desolace?", next = "worth" },
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Farewell, Kireena.", next = "END" },
      },
    },

    loot = {
      lines = {
        { id = "lo_default", text = "Centaur cloth, arrowheads, the odd bead or bone charm, and once a whole saddle, which I sold to a goblin for more than it was worth. The braves bring it to me because Gurda won't have them selling to Kolkar traders." },
      },
      choices = {
        { text = "You sell centaur trophies?", next = "loot_trophy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loot_trophy = {
      big = true,
      lines = {
        { id = "lt_default", text = "Not trophies, goods, and there's a difference, because I won't buy anything made of a centaur. Cloth and beads are just cloth and beads, whoever wove them, and leaving them in the dirt honours no one." },
      },
      choices = {
        { text = "Spoils of war belong to the victors.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Their things should be left with their dead.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    traders = {
      lines = {
        { id = "tr_default", text = "The trolls at Shadowprey, a goblin caravan that crawls past now and then, and the Thunder Bluff kodo when they come. The goblins sell to the dwarves at Nijel's Point too, and they think I don't know." },
      },
      choices = {
        { text = "Does that bother you?", next = "traders_goblins" },
        { text = "Something else.", next = "BACK" },
      },
    },

    traders_goblins = {
      big = true,
      lines = {
        { id = "tg_default", text = "Not much. A goblin who sells to both sides is a goblin who comes back, and I'd rather have thread from a cheat than no thread at all. Gurda would say I'm feeding the Alliance, and she might be right." },
      },
      choices = {
        { text = "Trade is trade. Let the goblins sell to anyone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Turn them away until they choose a side.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    worth = {
      lines = {
        { id = "wo_default", text = "Scorpid shell, kodo bone that's been left long enough to be honest, and salt from the flats in the south. Stay away from the Burning Blade's things at Thunder Axe, though, because nothing they touch is safe to sell." },
      },
      choices = {
        { text = "I'll keep that in mind.", next = "BACK", fx = { trait = { cautious = 1 }, learn = { "burning_blade" } } },
        { text = "Farewell, Kireena.", next = "END", fx = { learn = { "burning_blade" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a trader's daughter from Bloodhoof, and I go where the trade is thin and make it thicker." } },
    advice = { { id = "tp_ad", text = "Never sell to the first buyer. Never buy from the first seller, either." } },
    _none = { { id = "tp_none", text = "I don't know. It isn't for sale, so I haven't asked." } },
  },
}
