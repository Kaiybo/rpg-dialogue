-- The Steppes' traders: Gabrielle Chase's cheese and Felder Stover's forge at Morgan's Vigil, and Gruna's bread at Flame Crest. Voice: bibles/steppes_traders.md
local P = RPGDialogueAPI:Pack("rpgd.burningsteppes")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "felder_stover", id = TODO_NPC("Felder Stover"), name = "Felder Stover",
  bible = "bibles/steppes_traders.md", role = "blacksmith", tier = "service",
  communities = { "morgans_vigil" }, temper = { "gruff", "steady" }, values = { "craft", "dutiful" },
  notices = { "gear", "class" },

  impression = {
    first = "Felder Stover sells and mends weapons at Morgan's Vigil and swears at the ash that gets into every joint. He dreams out loud about Windsor's hammer the way other men talk about women they've never met.",
    third = "{name} met Felder Stover, the weaponsmith at Morgan's Vigil.",
  },

  greetings = {
    { id = "g_default", text = "Weapons sold, weapons mended, no complaints taken. What's broken?" },
    { id = "g_back", when = { metBefore = true }, text = "Back already? Let me guess: you hit something harder than your weapon." },
  },

  notice = {
    { id = "n_gear", cat = "gear", when = { durability = { max = 0.3 } },
      text = "That's not a weapon anymore, that's a memory of one. Hand it here before it falls apart in your hand at the worst moment." },
    { id = "n_war", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Good grip, worn in the right places. Somebody taught you properly, and you've been using it since, which is more than I can say for most." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. Go on, tell me what's wrong with my forge, everyone from Ironforge does." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Felder Stover. I keep the Vigil's blades sharp and its armor in one piece, which up here is a full day's work every day. The ash gets into everything, joints and rivets and hinges, so if your weapon grinds, that's why, and it's not my fault." },
      },
      again = {
        { id = "h_again", text = "Something else? The forge is getting cold." },
        { id = "h_again2", text = "Ask, then. I'm hammering either way." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "What do you make of Blackrock steel?", next = "blackrock" },
        { text = "Have you heard of Windsor's hammer?", next = "ironfoe" },
        { text = "What does the heat do to a blade?", next = "heat" },
        { text = "How did a Stormwind smith end up here?", next = "past" },
        { text = "Later, Felder.", next = "END" },
      },
    },
    blackrock = {
      lines = {
        { id = "bl_default", text = "Crude, heavy, and it still cuts, which is the annoying part. The Dark Irons make the good stuff for them down in the mountain, and I'd give a month's pay to see how they temper it, though I'd rather die than ask." },
      },
      choices = {
        { text = "Learn from your enemies. Pride won't win this war.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Some things you don't learn from the Dark Irons.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ironfoe = {
      lines = {
        { id = "ir_default", text = "Ironfoe, aye, everybody's heard of it. Made by a Dark Iron architect for Windsor's family, generations back, and it went with him when the orcs took him, which is a crime twice over as far as I'm concerned." },
        { id = "ir_seen", when = { questDone = TODO_QUEST("Jail Break!") },
          text = "You saw him come out, didn't you? I'd have given anything to see that hammer back in his hand, but I don't suppose the Dark Irons handed it over politely." },
      },
      choices = {
        { text = "Who made it?", next = "ironfoe_maker" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ironfoe_maker = {
      lines = {
        { id = "im_default", text = "A Dark Iron by the name of Forgewright, John says, back when some of the Dark Irons still had friends on this side of the mountain. Ragged John says a lot of things, mind, but that one I believe, because nobody would make it up." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "windsor" } } } },
    },
    heat = {
      lines = {
        { id = "he_default", text = "Draws the temper out of it, slow, so a good sword goes soft in a season if you leave it lying in the sun up here. Keep it in the shade, oil it, and bring it to me before it starts to bend, not after." },
      },
      choices = {
        { text = "A soldier's weapon is his life. I'll care for it.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll fight it till it breaks, then buy another.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    past = {
      lines = {
        { id = "pa_default", text = "I followed the work, and the work was up the pass, because Redridge had more smiths than swords by then. Somebody told me the Vigil paid double for anyone who'd stay, and nobody told me the double came three months late." },
      },
      choices = {
        { text = "You stayed anyway. That says something.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Apprenticed in Stormwind, mended swords in Redridge, and now I'm here, which is further than I ever meant to go." } },
    advice = { { id = "tp_ad", text = "Oil your blade every night up here, or the ash will eat it." } },
    _none = { { id = "tp_none", text = "Don't know. I know steel, and steel doesn't gossip." } },
  },
}

P:NPC {
  key = "gruna", id = TODO_NPC("Gruna"), name = "Gruna",
  bible = "bibles/steppes_traders.md", role = "vendor", tier = "service",
  communities = { "flame_crest" }, temper = { "blunt", "warm" }, values = { "loyal", "practical" },
  notices = { "race", "weary" },

  impression = {
    first = "Gruna sells bread and drink at Flame Crest, baked in an oven that the ground itself keeps hot. She's blunt, warm in her way, and she has no kind word at all for the Blackrock orcs on the mountain.",
    third = "{name} met Gruna, who sells bread and drink at Flame Crest.",
  },

  greetings = {
    { id = "g_default", text = "Bread's hot, the water's warm, and there's no cold drink anywhere in these Steppes. Take it or don't." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Eat, before the goblins sell you something you don't need." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the mountain stepped on you. Sit by the oven and eat; nobody here will bother you while you chew." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "You've the look of a clan orc, born to a name. Just don't let it be Blackrock, or you'll eat somewhere else." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, all the way up here! The bread's plain, but there's a lot of it, and I'll not tell anyone how much you took." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gruna. I bake bread at Flame Crest for whoever comes through, grunts and goblins and riders and lost fools alike. The ground here is so hot I hardly need a fire, which is the only kind thing I'll ever say about these Steppes." },
      },
      again = {
        { id = "h_again", text = "Something else? The bread won't watch itself." },
        { id = "h_again2", text = "Speak. My hands are full, not my ears." },
      },
      choices = {
        { text = "What have you got?", next = "BUSINESS" },
        { text = "What do you think of the Blackrock orcs?", next = "blackrock" },
        { text = "Where does the flour come from?", next = "flour" },
        { text = "How do you get on with the goblins here?", next = "goblins" },
        { text = "You bake with the ground's heat?", next = "oven" },
        { text = "Who comes through Flame Crest?", next = "visitors" },
        { text = "I'll be off.", next = "END" },
      },
    },
    blackrock = {
      lines = {
        { id = "bl_default", text = "They call themselves the true Horde and live in a dragon's shadow, taking orders from the black wyrms like hounds. The Warchief offered every orc a way home, and they spat on it, so I've nothing for them, not even stale bread." },
      },
      choices = {
        { text = "They're traitors. They should be cut down.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Some might still come home, if they're shown the way.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } },
      },
    },
    flour = {
      lines = {
        { id = "fl_default", text = "From Kargath, on Vahgruk's wind riders, a sack at a time, and they complain about the weight the whole way. Nothing grows up here but thorns and trouble, so every loaf I sell flew in first." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    goblins = {
      lines = {
        { id = "go_default", text = "They buy my bread, they sell it back to travelers at twice the price, and they think I don't know. I know, and I let them, because they pay on time, which is more than I can say for most grunts." },
      },
      choices = {
        { text = "That's not right. They're cheating your customers.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Smart. Let them haggle; you still get paid.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    oven = {
      lines = {
        { id = "ov_default", text = "You dig a hole, line it with flat stones and cover it, and then you wait while the mountain does the rest. Some mornings it does too much, and I lose a whole batch to the fire under the rock." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    visitors = {
      lines = {
        { id = "vi_default", text = "Riders going north to Kargath, goblins going anywhere there's coin, and fools heading for the mountain with their swords out. Kibler's in the cave out back with his beasts and that foul-mouthed bird, and if the bird tells you something, don't repeat it." },
      },
      choices = {
        { text = "What about the fools heading for the mountain?", next = "fools" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fools = {
      lines = {
        { id = "fo_default", text = "Some come back with stories, and some come back on a stretcher, and most don't come back at all. You've the look of one of them, so eat twice before you go, because the Spire doesn't feed its guests." },
      },
      choices = {
        { text = "Someone has to face the Spire.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll go when the odds favour me, not before.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I baked for the camps in Durotar, then for Kargath, and now for this rock. Bread's bread." } },
    advice = { { id = "tp_ad", text = "Carry water. The Steppes will drink you dry before the orcs ever get a swing." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. Ask the goblins; they'll sell you an answer." } },
  },
}
