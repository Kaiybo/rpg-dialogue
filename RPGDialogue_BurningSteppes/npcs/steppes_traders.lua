-- The Steppes' traders: Gabrielle Chase's cheese and Felder Stover's forge at Morgan's Vigil, and Gruna's bread at Flame Crest. Voice: bibles/steppes_traders.md
local P = RPGDialogueAPI:Pack("rpgd.burningsteppes")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "felder_stover", id = TODO_NPC("Felder Stover"), name = "Felder Stover",
  bible = "bibles/steppes_traders.md", role = "blacksmith", tier = "service",
  communities = { "morgans_vigil" }, temper = { "gruff", "steady" }, values = { "craft", "dutiful" },
  notices = { "gear", "class" },

  impression = {
    first = "He dreams out loud about Windsor's hammer.",
    third = "{name} met Felder Stover, the weaponsmith at Morgan's Vigil.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, the customer who actually brings their blades back whole! I'll put an edge on it like Windsor himself would carry." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll mend your weapon, since that's my trade, but don't stand over my shoulder while I do it." },
    { id = "g_default", text = "Weapons sold, weapons mended, no complaints taken. What's broken?" },
    { id = "g_back", when = { metBefore = true }, text = "Back already? Let me guess: you hit something harder than your weapon." },
  },

  notice = {
    { id = "n_gear", cat = "gear", when = { durability = { max = 0.3 } },
      text = "That's not a weapon anymore, that's a memory of one. Hand it here before it falls apart in your hand at the worst moment." },
    { id = "n_war", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Good grip, worn in the right places. Somebody taught you properly, and you've been using it since, not leaving it to rust on a wall." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. Go on, tell me what's wrong with my forge, everyone from Ironforge does." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Felder Stover. I keep the Vigil's blades sharp and its armor in one piece, which up here is a full day's work every day. The ash gets into everything, joints and rivets and hinges, so if your weapon grinds, that's why, and it's not my fault." },
        { id = "dd_firegut", when = { questDone = TODO_QUEST("Extinguish the Firegut") },
          text = "Oralius says you broke up the Firegut camp for him. Ogre clubs are what dented half the shields on my rack, so I've you to thank for a few quiet days at the anvil." },
      },
      again = {
        { id = "h_again", text = "Something else? Ask it quick; the forge is getting cold." },
        { id = "h_again2", text = "Ask, then. I'm hammering either way." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "What do you make of Blackrock steel?", next = "blackrock" },
        { text = "Have you heard of Windsor's hammer?", next = "ironfoe" },
        { text = "What does the heat do to a blade?", next = "heat" },
        { text = "How did a Stormwind smith end up here?", next = "past" },
        { text = "Who keeps the Vigil supplied?", next = "fs_supply" },
        { text = "What breaks most often up here?", next = "fs_breaks" },
        { text = "Who's the best fighter at the Vigil?", next = "w9_best" },
        { text = "Later, Felder.", next = "END" },
      },
    },

    w9_best = {
      lines = { { id = "w9_best_d", text = "Marshal Maxwell, if you ask him, and Oralius, if you ask anyone else. Oralius goes through more shields than the rest of the Vigil put together, because he walks straight at an ogre and expects the ogre to be the one who steps aside." } },
      choices = {
        { text = "Does the ogre usually step aside?", next = "w9_best2" },
        { text = "You don't sound impressed.", next = "w9_best2" },
        { text = "Something else.", next = "BACK" },
      },
    },

    w9_best2 = {
      lines = { { id = "w9_best2_d", text = "So far, aye, which is the only reason he's still alive and still breaking my shields. I mend them without complaint, mostly, because a man who stands that close to the Firegut is worth a lot of hammering." } },
      choices = {
        { text = "Keep his shields coming.", next = "BACK", reply = "I will. He keeps me in work, and I keep him in one piece." },
        { text = "Something else.", next = "BACK" },
      },
    },
    fs_supply = {
      lines = {
        { id = "fs_supply_1", text = "Borgus Stoutarm's gryphons, when the weather allows, and the long road through Redridge when it doesn't. Marshal Maxwell sends for steel every week, and I get about half of what he asks for." },
      },
      choices = {
        { text = "Half isn't enough for a war.", next = "fs_half" },
        { text = "Gryphons carrying steel? That's a heavy load.", next = "BACK", reply = "It is, and Borgus tells me every time." },
      },
    },
    fs_half = {
      lines = {
        { id = "fs_half_1", text = "It isn't, and I tell him so, and he tells me to make do. So I melt down every broken blade and every dented helm, and I make them into something new, which is the only way to keep the Vigil armed." },
      },
      choices = {
        { text = "A smith who wastes nothing.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Felder.", next = "BACK" },
      },
    },
    fs_breaks = {
      lines = {
        { id = "fs_breaks_1", text = "Shields, by a long road, for the Blackrock hit hard and the Firegut ogres hit harder. I've seen a shield split in two by one blow, and the soldier behind it walked away, which is the best a shield can do." },
      },
      choices = {
        { text = "I fight with a shield. Any advice?", next = "fs_shield", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "The Firegut ogres sound dangerous.", next = "fs_shield" },
      },
    },
    fs_shield = {
      lines = {
        { id = "fs_shield_1", text = "Angle it, don't block flat, for a blow that slides off does less harm than one that lands square. Oralius will tell you the same, and he's taken more ogre clubs than any man in the Vigil." },
      },
      choices = {
        { text = "Angle it. I'll remember that.", next = "BACK" },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    blackrock = {
      lines = {
        { id = "bl_default", text = "Crude, heavy, and it still cuts, which is the annoying part. The Dark Irons make the good stuff for them down in the mountain, and I'd give a month's pay to see how they temper it, though I'd rather die than ask." },
      },
      choices = {
        { text = "Learn from your enemies. Pride won't win this war.", next = "BACK", reply = "You're likely right, and that's what galls me most about it. Bring me a Dark Iron blade off one of those brutes and I'll study it, though I'll curse the whole time.", fx = { align = { honor = -1 } } },
        { text = "Some things you don't learn from the Dark Irons.", next = "BACK", reply = "That's how I see it, too, and you can tell my pride I said so. Whatever they put in that steel, I'd wager it isn't only coal and sweat.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ironfoe = {
      lines = {
        { id = "ir_default", text = "Ironfoe, aye, everybody's heard of it. Made by a Dark Iron architect for Windsor's family, generations back, and it went with him when the Dark Irons took him, which is a crime twice over as far as I'm concerned." },
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
        { id = "im_default", text = "A Dark Iron by the name of Forgewright, Ragged John says, back when some of the Dark Irons still had friends on this side of the mountain. John says a lot of things, mind, but that one I believe, because nobody would make it up." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "windsor" } } } },
    },
    heat = {
      lines = {
        { id = "he_default", text = "Draws the temper out of it, slow, so a good sword goes soft in a season if you leave it lying in the sun up here. Keep it in the shade, oil it, and bring it to me before it starts to bend, not after." },
      },
      choices = {
        { text = "A soldier's weapon is his life. I'll care for it.", next = "BACK", reply = "Good, because I've buried soldiers who didn't, and their swords were the first thing to fail them. Shade and oil, and you'll have the blade a long while.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll fight with it till it breaks, then buy another.", next = "BACK", reply = "That's a quartermaster's dream and a smith's nightmare, friend. Suit yourself, but don't come crying when it snaps halfway through a Blackrock skull.", fx = { align = { order = -1 } } },
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
    first = "She has no kind word at all for the Blackrock orcs.",
    third = "{name} met Gruna, who sells bread and drink at Flame Crest.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You come back, and you are welcome at my oven, {class}. Sit, and I'll give you the bread from the middle of the tray." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Eat, if you must, but you have the stink of the Blackrock about you, and I don't forget it." },
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
        { id = "dd_deaths", when = { deaths = { min = 10 } },
          text = "You again, and still alive, or alive again, I can never tell with you. Eat something, because the spirit healer doesn't bake, and you look like you've been to see her often." },
      },
      again = {
        { id = "h_again", text = "Something else? The bread won't watch itself, and the goblins will if I let them." },
        { id = "h_again2", text = "Speak. My hands are full, not my ears." },
      },
      choices = {
        { text = "Bread is for any hungry orc, even a Blackrock one.", next = "BACK", reply = "Even a Blackrock? Hmph. You have a bigger heart than me, but I won't call it a weak one.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Starve the Blackrock out. Let them eat ash down there.", next = "BACK", reply = "Ha! They chose Rend and the dragon over Thrall, and the dragon can feed them.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What have you got?", next = "BUSINESS" },
        { text = "What do you think of the Blackrock orcs?", next = "blackrock" },
        { text = "Where does the flour come from?", next = "flour" },
        { text = "How do you get on with the goblins here?", next = "goblins" },
        { text = "You bake with the ground's heat?", next = "oven" },
        { text = "Who comes through Flame Crest?", next = "visitors" },
        { text = "What do the goblins here trade?", next = "gu_goblins" },
        { text = "How did you come to Flame Crest?", next = "gu_came" },
        { text = "Your hands are burned all over.", next = "w9_hands" },
        { text = "I'll be off.", next = "END" },
      },
    },

    w9_hands = {
      lines = { { id = "w9_hands_d", text = "The ground oven bites, and it bites harder than any Blackrock blade I've faced. Every orc who bakes at Flame Crest has hands like these, and the goblins laugh and offer me gloves at three times the price." } },
      choices = {
        { text = "Why not buy the gloves?", next = "w9_hands2" },
        { text = "Do the burns ever heal?", next = "w9_hands2" },
        { text = "Something else.", next = "BACK" },
      },
    },

    w9_hands2 = {
      lines = { { id = "w9_hands2_d", text = "Because a baker who can't feel the bread can't tell when it's done, and a burn heals, but bad bread is remembered. My mother baked in the camps with hands worse than mine, and the guards never once tasted a bad loaf from her." } },
      choices = {
        { text = "She taught you well.", next = "BACK", reply = "She did. Eat, and you'll taste it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    gu_goblins = {
      lines = {
        { id = "gu_goblins_1", text = "Everything, from scrap to sausages, and they charge for the air if they think they can get away with it. Gorzeeki Wildeyes sells beetles, and I don't ask what for, and the others sell anything they can find in the Blackrock ruins." },
      },
      choices = {
        { text = "Beetles? Why beetles?", next = "gu_beetle" },
        { text = "Goblins will sell anything.", next = "BACK", reply = "They will, and they'll call it a bargain." },
      },
    },
    gu_beetle = {
      lines = {
        { id = "gu_beetle_1", text = "He says they are good luck, or good food, or good for something, depending on the day. I tried one once, and it tasted like ash and smoke, which is what everything tastes like up here." },
      },
      choices = {
        { text = "Ash and smoke for every meal.", next = "BACK" },
        { text = "Something else, Gruna.", next = "BACK" },
      },
    },
    gu_came = {
      lines = {
        { id = "gu_came_1", text = "I came with the Horde scouts who watch Blackrock Spire, and I stayed because they needed bread more than another warrior. My bread is plain, but it is hot, and a hot meal is worth a great deal when the ash is falling." },
      },
      choices = {
        { text = "The scouts watch the Spire?", next = "gu_spire" },
        { text = "I'm an orc. Your bread tastes like home.", next = "gu_spire", when = { race = "Orc" } },
      },
    },
    gu_spire = {
      lines = {
        { id = "gu_spire_1", text = "Day and night, for the Blackrock orcs are the shame of our people, and someone must watch them. Mathredis Firestar says the Spire holds more than orcs, and I believe him, though I do not ask what." },
      },
      choices = {
        { text = "More than orcs? That's worrying.", next = "BACK", fx = { learn = { "blackrock_spire" } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    blackrock = {
      lines = {
        { id = "bl_default", text = "They call themselves the true Horde and live in a dragon's shadow, taking orders from the black wyrms like hounds. The Warchief offered every orc a way home, and they spat on it, so I've nothing for them, not even stale bread." },
      },
      choices = {
        { text = "They're traitors. They should be cut down.", next = "BACK", reply = "Now you talk sense, and you can have a warm loaf for it. They chose the dragon over the Warchief, and a choice like that has a price.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Some might still come home, if they're shown the way.", next = "BACK", reply = "You've a softer heart than I do, stranger. If one ever walks down from that mountain hungry, I'll feed him, but I'll watch his hands while he eats.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } },
      },
    },
    flour = {
      lines = {
        { id = "fl_default", text = "From Kargath, a sack at a time, on the wind riders Vahgruk keeps here, and they complain about the weight the whole way. Nothing grows up here but thorns and trouble, so every loaf I sell flew in first." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    goblins = {
      lines = {
        { id = "go_default", text = "They buy my bread, they sell it back to travelers at twice the price, and they think I don't know. I know, and I let them, because they pay on time, and the grunts at Flame Crest mostly pay in promises." },
      },
      choices = {
        { text = "That's not right. They're cheating your customers.", next = "BACK", reply = "Right, wrong, it all comes out in the same bread. The travelers pay what they'll pay, and I've an oven to keep fed and no time to play the guard.", fx = { align = { honor = 1 } } },
        { text = "Smart. Let them haggle; you still get paid.", next = "BACK", reply = "You've got a head for trade, then, which most who come through here don't. I'd sooner count my coin than count the goblins' sins.", fx = { align = { honor = -1 }, affinity = 1 } },
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
        { id = "vi_default", text = "Riders going north to Kargath, goblins going anywhere there's coin, and fools heading for the mountain with their swords out. Kibler the goblin is in the cave out back with his beasts and that foul-mouthed bird, and if the bird tells you something, don't repeat it." },
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
        { text = "Someone has to face the Spire.", next = "BACK", reply = "Aye, someone does, and it always seems to be the ones I've just fed. Eat, then, and come back alive so I can tell you I told you so.", fx = { align = { honor = 1 } } },
        { text = "I'll go when the odds favour me, not before.", next = "BACK", reply = "Hah, you'll be waiting a long while, but at least you'll be alive to wait. That's more than most of the brave ones manage.", fx = { align = { honor = -1 } } },
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
