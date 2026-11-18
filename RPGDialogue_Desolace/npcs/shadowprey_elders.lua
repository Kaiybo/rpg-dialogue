-- Shadowprey Village's tauren: Taiga Wisemane (Hand of Iruxos), Vark Battlescar (Vyletongue Corruption),
-- Roon Wildmane (Hunting in Stranglethorn). Horde. Voice: bibles/shadowprey_elders.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Taiga Wisemane: tauren elder who wants the Hand of Iruxos out of the Burning Blade's hands.
P:NPC {
  key = "taiga", id = TODO_NPC("Taiga Wisemane"), name = "Taiga Wisemane",
  bible = "bibles/shadowprey_elders.md", role = "questgiver", tier = "quest",
  communities = { "shadowprey" }, temper = { "grave", "steady" }, values = { "devout", "duty" },
  notices = { "class", "race", "fel" },
  impression = {
    first = "Taiga Wisemane is a grave old tauren who speaks about demons the way farmers speak about locusts, as a plague that has come before and will come again. He wants the Burning Blade's portals shut and is not interested in who gets the credit.",
    third = "{name} met Taiga Wisemane, the tauren elder at Shadowprey Village who would take the Hand of Iruxos from the Burning Blade.",
  },

  greetings = {
    { id = "g_default", text = "Sit a moment, {class}. The sea is loud here, but it is cleaner than what comes up out of Mannoroc Coven." },
    { id = "g_active", when = { questActive = TODO_QUEST("Hand of Iruxos") }, text = "Find the red crystal in Thunder Axe Fortress, {name}, and strike it with the pick. Then the Demon Box will be yours to take." },
    { id = "g_done", when = { questDone = TODO_QUEST("Hand of Iruxos") }, text = "The Hand is out of the Blade's grip. The coven is quieter, and so are my dreams." },
    { id = "g_away", when = { away = 14 }, text = "You were gone {away}. I counted the fires at Thunder Axe every night, and there were fewer of them than before." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You carry yourself differently now. Desolace has tested you, and you're still standing, which is the only grade it gives." },
  },

  notice = {
    { id = "n_lock", cat = "fel", when = { class = "WARLOCK" },
      text = "You bear the same mark as the cultists at Thunder Axe, warlock. I won't turn you away, because the Warchief trusts you, but I will watch you." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. The Burning Blade were your people once, and some of them still wear the old clan colours, so I ask your patience if the braves stare." },
    { id = "n_holy", cat = "class", when = { class = { "PRIEST", "SHAMAN" } },
      text = "You carry a holy power, or a spirit's blessing; I can feel it. You'll need it where the demons walk, so keep it close." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Taiga Wisemane. I watch the Burning Blade from this village, because they have made the fortress at Thunder Axe their own, and from it they open the way for demons into this world." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Hand of Iruxos") },
          text = "The Burning Blade possess the Demon Box, and within it lies the Hand of Iruxos. They use it to open portals at Mannoroc Coven, and we must stop the tide of demons before it reaches the rest of Kalimdor." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Hand of Iruxos") },
          text = "Take the demon pick to the red crystal inside Thunder Axe Fortress. It guards the Box, and the pick is the only thing I have found that will crack it." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Hand of Iruxos"), days = 3 } },
          text = "You've brought me the Box, and with it the Hand. I can feel the thing inside it pulling at the air, like a tide that wants to go out." },
        { id = "h_after", when = { questDone = TODO_QUEST("Hand of Iruxos") },
          text = "With the Hand in our keeping, the portals at the coven can be sealed one by one. The Blade will look for another way, because they always do, but we've bought the land time." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? Ask while the tide is low." },
        { id = "h_again2", text = "Speak. An old tauren has nothing but time and worries." },
      },
      choices = {
        { text = "Who are the Burning Blade?", next = "blade" },
        { text = "What is the Hand of Iruxos?", next = "hand" },
        { text = "What is Mannoroc Coven?", next = "coven" },
        { text = "Why do you watch them from here?", next = "why" },
        { text = "What happens to the Hand afterwards?", next = "after", when = { questDone = TODO_QUEST("Hand of Iruxos") } },
        { text = "Where did you get a demon pick?", next = "pick", when = { questActive = TODO_QUEST("Hand of Iruxos") } },
        { text = "How can I help?", next = "BUSINESS" },
        { text = "Earth Mother keep you, elder.", next = "END" },
      },
    },

    blade = {
      lines = {
        { id = "bl_default", text = "A cult of orcs who never gave up the demons, though their people did. They hide in Orgrimmar's shadows and in the canyons of Durotar, and here in Desolace they have a whole fortress, because nobody comes to Desolace to look for them." },
      },
      choices = {
        { text = "Why does the Horde allow them?", next = "blade_allow" },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    blade_allow = {
      big = true,
      lines = {
        { id = "ba_default", text = "The Warchief does not allow them; he hunts them, but they are many and they hide well. Some in the Horde say they should be given a chance to repent, and I've seen their altars, so I don't agree." },
      },
      choices = {
        { text = "Root them out. No mercy for demon-callers.", next = "BACK", reply = "That is my heart's answer too, and I have seen enough of their altars to know it is the right one.", fx = { align = { light = -1 }, learn = { "burning_blade" } } },
        { text = "Some might turn back, if they're offered a way.", next = "BACK", reply = "Perhaps, and I would not stand in the way if one truly turned, but I have not yet met that one.", fx = { align = { light = 1 }, learn = { "burning_blade" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },

    hand = {
      lines = {
        { id = "ha_default", text = "A relic of a demon called Iruxos, I'm told, a withered hand that still remembers how to open doors. The Blade keep it locked in a box that only a demon pick can break, so they fear it a little too." },
      },
      choices = {
        { text = "Why not destroy it?", next = "hand_destroy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hand_destroy = {
      lines = {
        { id = "hd_default", text = "Because the portals it opened stay open until something closes them, and the Hand that opened them can seal them again. When the last portal is shut, I will ask the shaman to bury it where no one will ever dig." },
      },
      choices = {
        { text = "Then it must be used one more time.", next = "hand_use" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hand_use = {
      big = true,
      lines = {
        { id = "hu_default", text = "Yes, and that troubles me more than I can tell you. Using a demon's tool to undo a demon's work feels like borrowing from a thief to pay back what he stole." },
      },
      choices = {
        { text = "Use whatever works against demons.", next = "BACK", reply = "That is what the braves say, and perhaps they are right, but I still feel the thief's hand on my shoulder.", fx = { align = { order = -1 } } },
        { text = "Use it once, then bury it deep.", next = "BACK", reply = "That is my thinking too, and when it is done, I will bury it so deep the earth itself forgets.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    coven = {
      lines = {
        { id = "co_default", text = "A valley of red earth in the south, cursed since some war older than the tauren remember, and the bones of great things still lie in the hills around it. The Blade open their portals there because, the shaman say, the walls between worlds have grown thin over that ground." },
      },
      choices = {
        { text = "Why is it called Mannoroc?", next = "coven_demon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coven_demon = {
      lines = {
        { id = "cd_default", text = "The Blade named it for Mannoroth, the demon whose blood the orcs once drank, and they say the name the way the shaman say the Earth Mother's. Whether he ever walked there I can't say, but his worshippers believe it, and that's enough to make the place dangerous." },
        { id = "cd_orc", when = { race = "Orc" }, text = "For Mannoroth, whose blood your people drank before the Warchief freed them, and whom Grom Hellscream slew in Ashenvale. The Blade still speak his name like a prayer, and you'll know better than I do why that should frighten us." },
      },
      choices = {
        { text = "I'll keep my distance from it.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because Shadowprey is close enough to watch them and far enough to be forgotten, and because the trolls here keep sharp eyes. The Blade send scouts down to the coast sometimes, and the trolls send them back in pieces." },
      },
      choices = {
        { text = "The trolls seem good allies.", next = "why_trolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_trolls = {
      lines = {
        { id = "wt_default", text = "They're the best, when the fighting starts, and the worst when they cook. Drulzegar on the dock would fight the whole sea for what the naga did to his crew, and I've learned not to stand between him and the water." },
      },
      choices = {
        { text = "I'll go and speak to him.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    pick = {
      lines = {
        { id = "pi_default", text = "I took it from a cultist the trolls caught on the coast road, carrying it wrapped in rags as if it might bite him. He wouldn't say what it was for, but the red crystal at Thunder Axe hums when it's near, so I worked the rest out myself." },
      },
      choices = {
        { text = "What happened to the cultist?", next = "pick_cultist" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pick_cultist = {
      big = true,
      lines = {
        { id = "pc_default", text = "The trolls wanted to feed him to the sea, and I asked them to send him to Orgrimmar instead, so the Warchief's people could question him. I don't know which of us was right, and he didn't seem grateful to either." },
      },
      choices = {
        { text = "The trolls were right. Cultists earn no mercy.", next = "BACK", reply = "Perhaps they were, and the trolls will tell you so at length, but I still sleep better for what I chose.", fx = { align = { honor = -1 } } },
        { text = "You were right. Let him face the Warchief's justice.", next = "BACK", reply = "Thank you, I needed to hear it, though I still do not know if he will reach Orgrimmar at all.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    after = {
      lines = {
        { id = "af_default", text = "It sits in a chest under my bed, wrapped in kodo hide, and I haven't slept well since. The portals still need sealing, and then it goes into the earth where the shaman say it can do no harm." },
      },
      choices = {
        { text = "I'll help you seal the portals.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm an elder of Thunder Bluff, sent to watch the coast. I've watched it long enough to hate demons properly." } },
    advice = { { id = "tp_ad", text = "If the air smells of sulphur, turn back. If it tastes of it, run." } },
    burning_blade = { { id = "tp_bb", text = "They'd open the whole world to their masters for a little power. We must not let them." } },
    _none = { { id = "tp_none", text = "I don't know, {class}, and I'm too old to pretend I do." } },
  },
}

-- Vark Battlescar: tauren who sends adventurers into Maraudon against Vyletongue's corruption.
P:NPC {
  key = "vark", id = TODO_NPC("Vark Battlescar"), name = "Vark Battlescar",
  bible = "bibles/shadowprey_elders.md", role = "questgiver", tier = "quest",
  communities = { "shadowprey" }, temper = { "blunt", "restless" }, values = { "brave", "nature" },
  notices = { "class", "race", "deeds" },
  impression = {
    first = "Vark Battlescar keeps an upstairs room in Shadowprey with a vial on the table and a scar he doesn't explain. He wants Maraudon's plants healed, and he talks about the satyr Vyletongue like a personal enemy.",
    third = "{name} met Vark Battlescar, the scarred tauren at Shadowprey Village who would heal Maraudon's vines.",
  },

  greetings = {
    { id = "g_default", text = "You climbed all the way up here, so you must want something. Good; so do I." },
    { id = "g_active", when = { questActive = TODO_QUEST("Vyletongue Corruption") }, text = "Fill the vial at the orange pool and pour it on the vines. Watch for what crawls out when the vines are cleansed, because Vyletongue still holds them." },
    { id = "g_done", when = { questDone = TODO_QUEST("Vyletongue Corruption") }, text = "Eight vines are clean now. It isn't much against all of Maraudon, but it's eight more than before." },
    { id = "g_cleared", when = { cleared = "Maraudon" }, text = "You've been to the bottom of Maraudon and back. I can see it in your eyes, and I'd like to hear about it someday." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You'll feel the sickness in Maraudon worse than the rest of us, so go in with a strong stomach." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of our own. Then you'll understand why the poisoned caverns trouble me, because the earth there is the Earth Mother's flesh." },
    { id = "n_kills", cat = "deeds", when = { killed = { name = "Noxxious", min = 8 } },
      text = "You smell of those rotten scions. Good; that means there are fewer of them in the caverns." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Vark Battlescar. I fought centaur for twenty years and now I fight a satyr I've never seen, because a satyr called Vyletongue has corrupted the caverns of Maraudon and stunted everything that grows inside." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Vyletongue Corruption") },
          text = "Take this vial and fill it at the orange crystal pool inside Maraudon. The coating inside counters the poison and turns it into a healing draught, and the corrupted vines will drink it, but know that Vyletongue still holds them and may turn them on you." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Vyletongue Corruption") },
          text = "Fill the vial at the orange pool, then pour it on the Vylestem vines. Something rotten will burst out of them, a scion of the corruption, and you'll have to kill it before the plant is truly clean." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Vyletongue Corruption"), days = 3 } },
          text = "Eight vines cleansed, and you're still breathing. The caverns will remember that, even if the satyr doesn't." },
        { id = "h_young", when = { maxLevel = 38 },
          text = "You're not ready for Maraudon yet, {class}, and I won't send you in to be eaten. Come back when you've a few more scars of your own." },
      },
      again = {
        { id = "h_again", text = "What else? I'm not going anywhere until the satyr is." },
        { id = "h_again2", text = "Ask. I've a vial to guard and nothing else to do." },
      },
      choices = {
        { text = "What is Maraudon?", next = "maraudon" },
        { text = "Who is Vyletongue?", next = "vyletongue" },
        { text = "How does the vial work?", next = "vial" },
        { text = "How did you get your scar?", next = "scar" },
        { text = "Why does a warrior care about plants?", next = "plants" },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Farewell, Vark.", next = "END" },
      },
    },

    maraudon = {
      lines = {
        { id = "ma_default", text = "A great cavern under the south of Desolace, holy to the centaur, who say their mother lives at the bottom of it. The upper caves glow orange and purple from crystals in the walls, and the deeper ones are flooded and full of things that never see the sun." },
      },
      choices = {
        { text = "Their mother?", next = "maraudon_mother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    maraudon_mother = {
      lines = {
        { id = "mm_default", text = "A princess of the earth, Theradras, if the night elf druids have it right. The Gelkis worship her and the Magram don't, and both of them get angry if you go near her caves." },
      },
      choices = {
        { text = "Would you have her killed?", next = "maraudon_kill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    maraudon_kill = {
      big = true,
      lines = {
        { id = "mk_default", text = "I don't know if a thing like that can be killed. If she can, and if the centaur would lose heart without her, then perhaps, but she's part of the earth, and I'd hate to be the one who wounded the earth to win a war." },
      },
      choices = {
        { text = "End her, and the centaur with her.", next = "BACK", reply = "Perhaps that is the only way, but I would ask the earth's forgiveness before I struck, and I hope you would too.", fx = { align = { light = -1 } } },
        { text = "Some things should not be killed, even to win.", next = "BACK", reply = "That is my fear, and my belief, and I am glad to hear someone else hold it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    vyletongue = {
      lines = {
        { id = "vy_default", text = "A satyr, one of those twisted night elves from the old days, and he's made a nest in the purple caves. He poisons everything he touches, and from it he grew a creature of rot called Noxxion in the orange caves, and the two of them have stolen the very life of the place." },
      },
      choices = {
        { text = "Why would a satyr want Maraudon?", next = "vy_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vy_why = {
      lines = {
        { id = "vw_default", text = "Because it's holy, and a satyr ruins holy things for the pleasure of it. The night elves at Nijel's Point say he was something better once, and I don't believe a word of it." },
      },
      choices = {
        { text = "Even monsters were something once.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "The night elves are fighting him too?", next = "vy_elves" },
        { text = "Something else.", next = "BACK" },
      },
    },

    vy_elves = {
      big = true,
      lines = {
        { id = "ve_default", text = "They send their own into the caverns from Nijel's Point with the same kind of vial, I'm told, and for the same reason. I'd sooner work beside them than against them down there, though I'd never say so to the braves who fought them at Ashenvale." },
      },
      choices = {
        { text = "Against a satyr, any ally will do.", next = "BACK", reply = "That is how I see it too, though I'd never say so where the braves could hear me.", fx = { align = { order = -1 } } },
        { text = "The Horde should heal its own caverns.", next = "BACK", reply = "Perhaps it should, but the satyr does not care whose caverns they are, and the vines are dying either way.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    vial = {
      lines = {
        { id = "vi_default", text = "The vial is coated inside with something the Earth Mother's shaman make, and it turns poison back on itself. Fill it at the orange pool, and what was killing the vines becomes the thing that cures them." },
      },
      choices = {
        { text = "Poison into cure? That's clever.", next = "vial_clever" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vial_clever = {
      big = true,
      lines = {
        { id = "vc_default", text = "Clever, and dangerous, because the vines wake angry when they're cleansed and the rot inside them has to go somewhere. Some say we should burn the vines instead and start again, but I've seen what fire does to a forest." },
      },
      choices = {
        { text = "Burn them. Fire is cleaner than poison.", next = "BACK", reply = "I have seen what fire does to a cave, and I would not want to be in Maraudon when the flames reached the deep roots.", fx = { align = { order = -1 } } },
        { text = "Heal them. The old ways are slower but surer.", next = "BACK", reply = "That is the path I chose, and it is slow, but I have seen it work, and I will keep walking it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    scar = {
      lines = {
        { id = "sc_default", text = "A Kolkar spear, at the edge of the Barrens, when I was young and slow. It went in under the arm and came out by the neck, and the shaman say I should have died, so I take every day after it as a gift." },
      },
      choices = {
        { text = "Then you've had a long gift.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Do you still hate the Kolkar?", next = "scar_kolkar" },
        { text = "Something else.", next = "BACK" },
      },
    },

    scar_kolkar = {
      lines = {
        { id = "sk_default", text = "I hated them for years, and it kept me warm in the cold nights on the Barrens' edge. Now I'm tired of it, and the hate has gone grey like this land, and I mean to spend what's left of me on the vines." },
      },
      choices = {
        { text = "That sounds like peace, of a kind.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    plants = {
      big = true,
      lines = {
        { id = "pl_default", text = "Because a warrior who only knows how to kill ends up with nothing left to protect. I've spent twenty years killing centaur, and I'd like to spend a few years making something grow before the Earth Mother takes me back." },
      },
      choices = {
        { text = "Healing is braver than killing.", next = "BACK", reply = "I have come to believe so, after twenty years, and I am glad to hear it from someone younger.", fx = { align = { honor = 1 } } },
        { text = "A warrior's duty is to fight. Leave growing to druids.", next = "BACK", reply = "Perhaps, but I have done my fighting, and the Earth Mother will not mind if I spend my last years growing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I spent twenty years fighting centaur on the Barrens' edge, and a Kolkar spear gave me my name." } },
    advice = { { id = "tp_ad", text = "Don't drink from the pools in Maraudon. Not even the clear ones." } },
    _none = { { id = "tp_none", text = "I don't know. Ask someone who didn't spend twenty years with a spear in his hand." } },
  },
}

-- Roon Wildmane: tauren hunter, old friend of Hemet Nesingwary.
P:NPC {
  key = "roon", id = TODO_NPC("Roon Wildmane"), name = "Roon Wildmane",
  bible = "bibles/shadowprey_elders.md", role = "questgiver", tier = "quest",
  communities = { "shadowprey" }, temper = { "genial", "wistful" }, values = { "friendship", "nature" },
  notices = { "class", "race", "pet" },
  impression = {
    first = "Roon Wildmane is an old tauren hunter who keeps a kodo horn polished for a friend he hasn't seen in years. He talks about Hemet Nesingwary the way some people talk about the best summer of their lives.",
    third = "{name} met Roon Wildmane, the tauren hunter at Shadowprey Village who once hunted Desolace with Hemet Nesingwary.",
  },

  greetings = {
    { id = "g_default", text = "Ho, {class}! You have a hunter's walk, or you'd like to. Sit; I've stories, and nobody here wants to hear them again." },
    { id = "g_active", when = { questActive = TODO_QUEST("Hunting in Stranglethorn") }, text = "The horn, the horn! Have you taken it to Hemet yet? North of Grom'gol, in the jungle; you'll hear his rifle before you see his camp." },
    { id = "g_done", when = { questDone = TODO_QUEST("Hunting in Stranglethorn") }, text = "Hemet has my horn, and he knows I haven't forgotten him. I slept like a calf the night you told me." },
    { id = "g_away", when = { away = 14 }, text = "You were gone {away}, and I've been telling your story to the trolls, only better." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! I knew it by your eyes, always on the horizon. Hemet had eyes like that, though his were usually on something he meant to shoot." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "A fine {pet}. It watches the sea like it expects something to come out of it, and in Desolace, it's usually right." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, here? Ha! You've a rifle-maker's hands, like an old friend of mine, and that's enough to keep my spear down for a while." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Roon Wildmane. Long ago a hunter named Hemet came to this land to hunt great beasts, and his skill with the rifle was uncanny; we spent many days hunting together, and even the enmity between our peoples was forgotten." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Hunting in Stranglethorn") },
          text = "When Hemet left Desolace for Stranglethorn, I vowed to welcome him back one day so we might hunt again, and now is that time. Take this kodo horn as my gift to him; he'll know it's from me." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Hunting in Stranglethorn") },
          text = "Hemet keeps his camp in Stranglethorn, north of Grom'gol, among the tigers and panthers. Give him the horn, and tell him Roon still remembers the white kodo." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Hunting in Stranglethorn"), days = 7 } },
          text = "He took it, and he laughed? Of course he laughed; he always laughed, even when the beast was winning. Thank you, friend; you've given an old hunter something to look forward to." },
      },
      again = {
        { id = "h_again", text = "What else? I've more stories than the sea has fish." },
        { id = "h_again2", text = "Ask on, friend. My spear's resting, and so's my tongue, nearly." },
      },
      choices = {
        { text = "Tell me about Hemet.", next = "hemet" },
        { text = "What was the white kodo?", next = "white_kodo" },
        { text = "Wasn't it strange, hunting with the Alliance?", next = "enmity" },
        { text = "What do you hunt now?", next = "now" },
        { text = "Why not go to Stranglethorn yourself?", next = "go" },
        { text = "What would you have me do?", next = "BUSINESS" },
        { text = "Good hunting, Roon.", next = "END" },
      },
    },

    hemet = {
      lines = {
        { id = "he_default", text = "He was loud, cheerful and never without his rifle, and he could hit a hawk on the wing from the far side of a canyon. He talked the whole time we hunted, which should have frightened the beasts away, but somehow it never did." },
      },
      choices = {
        { text = "He sounds like a good friend.", next = "hemet_friend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hemet_friend = {
      lines = {
        { id = "hf_default", text = "He was the best friend I've had, and I've had good ones. He taught me to read a trail backwards, from where the beast is going to where it's been, and I taught him to thank the beast before he skinned it, though I don't think he still does." },
      },
      choices = {
        { text = "Does that bother you?", next = "hemet_bother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hemet_bother = {
      big = true,
      lines = {
        { id = "hb_default", text = "A little. I've heard he hunts panthers by the hundred now, and a tauren doesn't kill more than he needs. But he was always hungry for the next beast, and I loved him for it, even when I didn't agree." },
      },
      choices = {
        { text = "A true hunter takes only what he needs.", next = "BACK", reply = "That is the tauren way, and the right one, though I could never make Hemet understand it.", fx = { align = { light = 1 } } },
        { text = "The hunt is a contest. Take every trophy you can.", next = "BACK", reply = "Hemet would like you, and I am not sure whether that pleases me or worries me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    white_kodo = {
      lines = {
        { id = "wk_default", text = "A great white kodo bull we tracked for nine days across the south of Desolace, almost to the edge of Feralas. When we finally found him, Hemet raised his rifle, and then he lowered it again, and we watched the old bull walk off toward the graveyard." },
      },
      choices = {
        { text = "Why didn't he shoot?", next = "white_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    white_why = {
      big = true,
      lines = {
        { id = "ww_default", text = "He said a beast like that deserved to die where it chose, and I've never respected anyone more. Some of my clan said we were fools to let the finest hide in Desolace walk away, and I say we were wise." },
      },
      choices = {
        { text = "You were right to let it go.", next = "BACK", reply = "Thank you, it was the finest hunt of my life, and I never even drew my bow.", fx = { align = { order = 1 } } },
        { text = "A hunt should end with the kill.", next = "BACK", reply = "Most hunts should, yes, but not that one, and I have never regretted it for a single day.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    enmity = {
      lines = {
        { id = "en_default", text = "It should have been, but out in the wilds, a hunter is a hunter, and the beasts don't care about banners. We shared fires and meat and stories for a whole season, and nobody back at the village had to know." },
        { id = "en_orc", when = { race = "Orc" }, text = "Your people might have thought so, back then. But out in the wilds a hunter is a hunter, and the beasts don't care who you march for, and Hemet never once spoke of the war." },
      },
      choices = {
        { text = "Would you hunt with him again, war or no war?", next = "enmity_again" },
        { text = "Something else.", next = "BACK" },
      },
    },
    enmity_again = {
      big = true,
      lines = {
        { id = "ea_default", text = "In a heartbeat, and I'd tell the Warchief so to his face, because a friend is a friend. Some at Shadowprey call me a fool for it, but they've never hunted beside someone who'd lower his rifle for a kodo." },
      },
      choices = {
        { text = "Friendship should outlast any war.", next = "BACK", reply = "It should, and I will stand by mine, whatever the Warchief or anyone else says about it.", fx = { align = { honor = 1 } } },
        { text = "The Horde comes first, friend or no friend.", next = "BACK", reply = "The Horde is my home, but a friend is a friend, and I cannot pretend otherwise.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    now = {
      lines = {
        { id = "no_default", text = "Not much, with these old knees. Scorpids on the flats, sometimes, and the odd thunder lizard, and the trolls bring me the stories of what they've seen in the sea, which is hunting enough for an old bull." },
      },
      choices = {
        { text = "What do the trolls say is in the sea?", next = "now_sea" },
        { text = "Are you kin to Gurda Wildmane?", next = "gurda", when = { visited = "Ghost Walker Post" } },
        { text = "Something else.", next = "BACK" },
      },
    },

    now_sea = {
      lines = {
        { id = "ns_default", text = "Naga, mostly, on the isles to the north, and a great turtle the fishermen swear by, and sharks that follow the boats home. Drulzegar won't tell stories anymore, not since the naga took his crew, and the trolls tell his for him, quietly." },
      },
      choices = {
        { text = "I'll go and speak with him.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gurda = {
      lines = {
        { id = "gu_default", text = "Gurda at Ghost Walker? She's Wildmane, like me, though she'd tell you she's the clever one of the clan, and she'd be right. She sings for the kodo and schemes against the centaur, and I only ever wanted to hunt." },
      },
      choices = {
        { text = "Hunting sounds like the better life.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    go = {
      lines = {
        { id = "go_default", text = "I'm too old for the boats and the jungle, and Stranglethorn is too hot for a tauren in his winter years. Besides, a gift carried by a stranger tells him something a visit wouldn't: that I found someone worth trusting with it." },
      },
      choices = {
        { text = "I'll carry it carefully, Roon.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Farewell, Roon.", next = "END" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a Wildmane hunter, born in Thunder Bluff, and I've hunted every corner of Desolace and half of Feralas." } },
    advice = { { id = "tp_ad", text = "Read a trail backwards: start with where the beast is going." } },
    _none = { { id = "tp_none", text = "Ha! I don't know, friend, and I've never let that stop me telling a story." } },
  },
}
