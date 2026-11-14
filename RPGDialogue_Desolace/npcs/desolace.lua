-- Desolace: Nijel's Point (Alliance, with a neutral Cenarion keeper) and Ghost Walker Post (Horde). Voice: bibles/desolace.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "pentigast", id = TODO_NPC("Captain Pentigast"), name = "Captain Pentigast",
  bible = "bibles/desolace.md", role = "soldier", tier = "major",
  communities = { "nijels_point" }, temper = { "calculating" }, values = { "dutiful", "cunning" },
  notices = { "kit", "status" },

  greetings = {
    { id = "g_post", text = "Another sword for Nijel's Point. Good. I've more ground to hold than men to hold it." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the valley. Which clan did you run into this time?" },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like you got between two centaur clans. Easy mistake. Get patched." },
    { id = "n_stormwind", cat = "status", when = { race = "Human" },
      text = "A face from home. Tell me Stormwind still remembers we're out here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Captain Pentigast, of the Stormwind Army. We're spread thin out here, and the centaur outnumber us. Luckily they hate each other more." },
        { id = "h_alliance", tags = { "news" }, when = { questActive = TODO_QUEST("Strange Alliance") },
          text = "One of the clans will deal with us, for a price. Pick your partner and earn their trust. We can sort out what we owe them later." },
        { id = "h_politics", when = { questActive = TODO_QUEST("Brutal Politics") },
          text = "Politics out here are brutal. Make friends with one clan, then remind them they were never ours. Ugly work. Necessary." },
      },
      again = { { id = "h_again", text = "Anything else? Make it count; the drums are starting." } },
      choices = {
        { text = "Playing the clans against each other?", next = "clans" },
        { text = "Why is Stormwind even out here?", next = "stakes" },
        { text = "Who's who at the Point?", next = "point" },
        { text = "Stormwind remembers you, Captain.", next = "home", when = { race = "Human" } },
        { text = "I could handle the betraying part.", next = "rogue", when = { class = "ROGUE" } },
        { text = "What do you make of Brother Anton?", next = "anton", when = { heardLine = "anton.h_default" } },
        { text = "Your men need a chaplain, Captain.", next = "priest_chaplain", when = { class = "PRIEST" } },
        { text = "I'll help hold the Point.", next = "END", fx = { affinity = 1, standing = { nijels_point = 1 } } },
      },
    },
    clans = {
      big = true,
      lines = {
        { id = "c_default", text = "Kolkar, Magram, Gelkis. Three clans, three grudges, one valley. If they spend their arrows on each other, they don't spend them on us. I'd rather that than a war I can't win." },
      },
      choices = {
        { text = "Clever.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "And when they find out?", next = "clans_after", fx = { align = { honor = 1 } } },
      },
    },
    clans_after = {
      lines = { { id = "ca_default", text = "Then I'll be the most hated man in Desolace, and still alive. I've been both of those before. Separately." } },
      choices = {
        { text = "There has to be an honest way.", next = "BACK", fx = { affinity = -1, align = { honor = 2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stakes = {
      lines = { { id = "s_default", text = "Because if we're not, someone else is. A foothold in Desolace is a road between Stonetalon and Feralas. Roads matter. Even ones through dust." } },
      choices = {
        { text = "Does Stormwind send you what you need?", next = "stakes_help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stakes_help = {
      lines = { { id = "sh_default", text = "Stormwind sends orders. Supplies come when the road's clear and the sea's calm, which is rarely both. We make do. Making do is most of soldiering." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    point = {
      lines = { { id = "p_default", text = "The keeper and his sisters, on the Circle's business. Kreldig, on the Reclaimers'. Brother Anton, on the Crusade's. And me, on everyone's." } },
      choices = {
        { text = "What's the keeper's business, really?", next = "point_keeper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    point_keeper = {
      lines = { { id = "pk_default", text = "Something under the earth, south of here. He won't say more to me, and I've stopped asking. A man who brings his own dryads doesn't need my help." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    home = {
      lines = { { id = "h2_default", text = "Do they? Then tell them we've had dust for supper three nights running and nobody's deserted. Tell them it's a miracle. It is." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    rogue = {
      lines = { { id = "r_default", text = "I don't doubt it. That's exactly why I'll be watching you while you do it. No offence. It's the job." } },
      choices = { { text = "None taken.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } } },
    },
    anton = {
      lines = { { id = "a_default", text = "Earnest. Brave. Very sure of things a long way from here. I don't argue with him. I'd rather he kept his faith than lost it in my camp." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } } },
    },
    priest_chaplain = {
      lines = { { id = "pch_default", text = "They need a chaplain, a cook and forty more swords, and I'll take the chaplain. Brother Anton prays, but only for the Crusade. My men would like someone to pray for them." } },
      choices = {
        { text = "I'll pray for them.", next = "BACK", fx = { affinity = 3, standing = { nijels_point = 2 }, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Stormwind Army. A long string of postings nobody else wanted. This is the dustiest. It isn't the worst." } },
    advice = { { id = "tp_ad", text = "Never let a centaur clan see you leaving another clan's camp. Leave by the back. There's always a back." } },
    cenarion_circle = { { id = "tp_circle", text = "The keeper's on his own errand. I don't ask. He doesn't explain. We get along." } },
    _none = { { id = "tp_none", text = "Not in my orders. Ask Kreldig; the Reclaimers poke into everything." } },
  },
}

P:NPC {
  key = "marandis", id = TODO_NPC("Keeper Marandis"), name = "Keeper Marandis",
  bible = "bibles/desolace.md", role = "noble", tier = "quest",
  communities = { "nijels_point" }, temper = { "formal" }, values = { "proud", "devout" },
  notices = { "class", "form" },

  greetings = {
    { id = "g_keeper", text = "You stand before a keeper of the grove. Speak carefully; my time is the Circle's, not mine." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Then you know what the Circle asks of its servants. Perhaps one day it will ask more of you." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "You wear the bear with some dignity. Good. Keep it when you take your own shape again." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Keeper Marandis, of the Cenarion Circle. My sisters and I came down from Stonetalon on the Circle's business, and it is not small business." },
        { id = "h_corruption", tags = { "news" }, when = { questActive = TODO_QUEST("Corruption of Earth and Seed") },
          text = "The earth here is sick at its root. Bring me proof of what's poisoning it. The Circle must know." },
        { id = "h_strong", when = { minLevel = 45 },
          text = "You've grown strong. Then hear it: a princess of the earth, Theradras, holds the body of one dear to the Circle. We mean to take it back." },
      },
      again = { { id = "h_again", text = "You have another question. Ask it plainly." } },
      choices = {
        { text = "What mission?", next = "mission" },
        { text = "What's wrong with the earth here?", next = "earth" },
        { text = "Your sisters?", next = "sisters" },
        { text = "The Circle asks more of me. How do I answer?", next = "druid", when = { class = "DRUID" } },
        { text = "Tell me of Theradras.", next = "theradras", when = { minLevel = 45 } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    mission = {
      lines = { { id = "m_default", text = "Ask me again when you've grown. The Circle's business is not for apprentices. No offense is meant." } },
      choices = {
        { text = "Some taken.", next = "BACK", fx = { affinity = -1 } },
        { text = "I understand.", next = "BACK", fx = { affinity = 1, learn = { "cenarion_circle" } } },
      },
    },
    earth = {
      lines = { { id = "e_default", text = "Something below sours it. The roots go grey, the water goes bitter, and the valley remembers nothing green. It has been so a long time. It need not stay so." } },
      choices = {
        { text = "Can it be healed?", next = "earth_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    earth_heal = {
      lines = { { id = "eh_default", text = "Everything can be healed, given time. The Circle has time. It is the people of Desolace who do not." } },
      choices = { { text = "Something else.", next = "BACK", fx = { align = { order = -1 } } } },
    },
    sisters = {
      lines = { { id = "s_default", text = "The dryads of my grove. They walk where I cannot and see what I would rather not. Do not stare at them; they find it tiresome." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "Patiently. The Circle asks slowly, and expects you to answer slowly. Those who hurry are the ones it stops asking." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    theradras = {
      big = true,
      lines = { { id = "t_default", text = "A daughter of the earth, and its shame. She dwells below, in Maraudon, and what she holds there is not hers to keep. When you are ready, the Circle will ask." } },
      choices = { { text = "I'll be ready.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A keeper of the grove, sworn to the Circle. What I was before that does not matter to the work." } },
    advice = { { id = "tp_ad", text = "Watch where the grass will not grow. The land is telling you where not to sleep." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle sees further than any one keeper. I see as far as Desolace. It is far enough to worry." } },
    _none = { { id = "tp_none", text = "That does not concern the Circle, so it does not concern me." } },
  },
}

P:NPC {
  key = "kreldig", id = TODO_NPC("Kreldig Ungor"), name = "Kreldig Ungor",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  communities = { "nijels_point" }, temper = { "busy" }, values = { "practical", "friendly" },
  notices = { "craft" },

  greetings = {
    { id = "g_busy", text = "Got a lot on out here, friend. Wrecks to pick, reagents to fetch, an' only the one of me." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering", "Mining" } },
      text = "Good with yer hands? Reclaimers Inc. is always hirin' folk who know salvage from scrap." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kreldig Ungor, Reclaimers Inc. We find what others lost an' put it back to use. Desolace has lost a great deal." },
        { id = "h_karnitol", tags = { "news" }, when = { questActive = TODO_QUEST("The Karnitol Shipwreck") },
          text = "The Karnitol went down off the coast with her cargo. The Reclaimers want what's left aboard. Fetch what ye can." },
        { id = "h_reagents", when = { questActive = TODO_QUEST("Reagents for Reclaimers Inc.") },
          text = "Reagents, from the beasts an' the ruins. The Reclaimers pay fair. Mostly on time." },
        { id = "h_business", when = { questActive = TODO_QUEST("Reclaimers' Business in Desolace") },
          text = "Ye came all this way on Reclaimers' business? Good. Pull up a crate." },
        { id = "h_salvage", when = { metBefore = true }, text = "Found a perfectly good kettle in the dust yesterday. Centaur arrow through it. Patched it. Makes tea fine. That's Reclaimers' work in one kettle." },
      },
      again = { { id = "h_again", text = "Anythin' else? Mind the crates." } },
      choices = {
        { text = "What are the Reclaimers?", next = "reclaimers" },
        { text = "What happened to the Karnitol?", next = "karnitol" },
        { text = "How do you get on with the Explorers' League?", next = "league" },
        { text = "I know salvage from scrap.", next = "salvage", when = { profession = "Mining" } },
        { text = "I'll help.", next = "END", fx = { affinity = 1 } },
      },
    },
    reclaimers = {
      lines = { { id = "r_default", text = "Dwarves with shovels an' a head fer business. Somethin' lost is somethin' found, if ye're stubborn enough. We're very stubborn." } },
      choices = {
        { text = "Is it profitable?", next = "reclaimers_profit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reclaimers_profit = {
      lines = { { id = "rp_default", text = "Some years. Other years we're very rich in kettles." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    karnitol = {
      lines = { { id = "k_default", text = "Rocks, weather, or somebody wantin' her cargo more than her crew did. The sea doesnae say. Neither does what's left aboard, but it's worth askin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    league = {
      lines = { { id = "l_default", text = "Fine! They want the past. We want what still works. If they find a ruin, we'll take the hinges. Everybody's happy, mostly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },
    salvage = {
      lines = { { id = "sv_default", text = "Do ye now? Then ye'll know a cracked casing's still good fer parts, an' a good casing's never good fer long. Reclaimers could use ye." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Ironforge lad, Reclaimer by trade, salvager by nature. Never met a broken thing I didnae want tae look inside." } },
    advice = { { id = "tp_ad", text = "Never throw anythin' away in Desolace. Ye'll need it a week later, an' there's no shop for a hundred miles." } },
    explorers_league = { { id = "tp_league", text = "The League digs fer history. We dig fer things that still work. Friendly rivals." } },
    _none = { { id = "tp_none", text = "Never salvaged one o' those. Ask the Captain." } },
  },
}

P:NPC {
  key = "anton", id = TODO_NPC("Brother Anton"), name = "Brother Anton",
  bible = "bibles/desolace.md", role = "priest", tier = "quest",
  communities = { "nijels_point" }, temper = { "zealous" }, values = { "devout", "brave" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_light", text = "The Light be with you, friend. Have you come to take up the Crusade's cause? There's work for the faithful here." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "A servant of the Light! Then you'll want to see the Valley of Bones. The dead walk there, and the Crusade means to stop them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Brother Anton, an emissary of the Scarlet Crusade. We fight the undead wherever they rise. Brother Crowley in Stormwind sends me the willing." },
        { id = "h_path", tags = { "news" }, when = { questActive = TODO_QUEST("Down the Scarlet Path") },
          text = "The Valley of Bones, to the southeast. The dead walk there. Destroy them, and the Crusade will welcome you." },
        { id = "h_crowley", when = { questActive = TODO_QUEST("Brother Anton") },
          text = "Brother Crowley sent you! Good. Then you're ready to prove yourself to the Crusade." },
      },
      again = { { id = "h_again", text = "Yes, friend? The Light hears every question." } },
      choices = {
        { text = "I've heard troubling things about the Crusade.", next = "troubling" },
        { text = "What's in the Valley of Bones?", next = "valley" },
        { text = "Who is Brother Crowley?", next = "crowley" },
        { text = "Pray with me, Brother.", next = "pray", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "I'll go to the valley.", next = "END", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    troubling = {
      big = true,
      lines = {
        { id = "t_default", text = "Rumors. There are always rumors about anyone who fights hard. The Crusade's cause is just. I'm sure of it. I've been in Desolace a long while, I admit." },
      },
      choices = {
        { text = "Maybe you should go back and see.", next = "troubling_go", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "I'm sure you're right.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    troubling_go = {
      lines = { { id = "tg_default", text = "And leave the valley to the dead? No. If the Crusade has lost its way, it'll need men who kept to the path. I'll be one. Ask me something else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    valley = {
      lines = { { id = "v_default", text = "Bones, more than you can count, and things that won't stay down. The Crusade's sworn to put them down, every one. It's honest work, whatever else you've heard." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crowley = {
      lines = { { id = "c_default", text = "Our brother in Stormwind. He finds the brave and sends them to me. I've never met a better judge of courage." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pray = {
      lines = { { id = "p_default", text = "Gladly. Out here, prayer's the only thing that isn't covered in dust. For the fallen, and for the Crusade's good name." } },
      choices = {
        { text = "For the fallen.", next = "BACK", fx = { affinity = 2, align = { light = 2 } } },
        { text = "For the Crusade's good name.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A brother of the Light who took up the Crusade's cause. I came west to hold back the dead where I'm sent.", next = "troubling" } },
    advice = { { id = "tp_ad", text = "Bless your blade before the Valley of Bones. The dead there don't stay down for steel alone." } },
    scarlet_crusade = { { id = "tp_crusade", text = "Brave men and women, fighting the plague where no one else will. Whatever you've heard, that's the heart of it." } },
    _none = { { id = "tp_none", text = "I couldn't say. Pray on it." } },
  },
}

P:NPC {
  key = "lyshaerya", id = TODO_NPC("Innkeeper Lyshaerya"), name = "Innkeeper Lyshaerya",
  bible = "bibles/desolace.md", role = "innkeeper", tier = "service",
  communities = { "nijels_point" }, temper = { "calm" }, values = { "kind" },
  notices = { "weary" },

  greetings = {
    { id = "g_inn", text = "Rest here. There's little enough comfort in Desolace; take what this roof can give." },
    { id = "g_home", when = { homeInn = { "Nijel's Point" } }, text = "You've come back to the Point. Your bed's made. The dust got in anyway." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've walked back from the spirit healer across a dead land. Sit. Nothing here will ask anything of you for an hour." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Lyshaerya. I keep the only warm hearth between Stonetalon and Feralas. Travelers find their way to it eventually." },
        { id = "h_dust", when = { metBefore = true }, text = "Desolace dust gets into everything. The bread, the beds, my hair. I've stopped fighting it. Now I just sweep while I talk." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The centaur drums carry a long way at night. You stop hearing them after a week. I haven't stopped yet." },
      },
      again = { { id = "h_again", text = "Something else? I'll keep sweeping." } },
      choices = {
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "What do the drums mean?", next = "drums" },
        { text = "Why keep an inn in Desolace?", next = "why" },
        { text = "Just a room, thank you.", next = "END" },
      },
    },
    drums = {
      lines = { { id = "d_default", text = "One clan telling another it's still there. Louder means angrier. Tonight is loud." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because a hearth matters most where there's nothing else. Anyone can keep an inn in Darnassus." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A hearth, a broom, and travellers who need both. I don't need more of a story than that." } },
    advice = { { id = "tp_ad", text = "Shake out your boots every morning. Desolace has scorpions, and scorpions like boots." } },
    _none = { { id = "tp_none", text = "I keep the hearth. Ask the Captain for news." } },
  },
}

-- Ghost Walker Post: the Horde's camp in Desolace.
P:NPC {
  key = "takata", id = TODO_NPC("Takata Steelblade"), name = "Takata Steelblade",
  bible = "bibles/desolace.md", role = "soldier", tier = "major",
  communities = { "ghost_walker" }, temper = { "hard" }, values = { "loyal", "stern" },
  notices = { "class", "kit" },

  greetings = {
    { id = "g_post", text = "You're in Desolace now. The demons' servants are thick here. Are you here to fight them?" },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. I've killed a great many who walked your road too far. Don't make me add you to the count." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Satyr claws, by the look of it. They fight dirty. Learn to fight dirtier." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Takata Steelblade. Keldran sent me from Orgrimmar to hunt the Burning Blade here. They hide among the satyrs, so the satyrs die too." },
        { id = "h_satyr", tags = { "news" }, when = { questActive = TODO_QUEST("Befouled by Satyr") },
          text = "The satyrs foul everything they touch. Thin them. The Blade loses its friends one horn at a time." },
        { id = "h_corrupter", when = { questActive = TODO_QUEST("The Corrupter") },
          text = "There's something behind the satyrs, something worse. Find it, and end it." },
        { id = "h_relations", when = { questActive = TODO_QUEST("Alliance Relations") },
          text = "The centaur clans can be bargained with. One of them, anyway. Go and see which." },
      },
      choices = { { text = "I'll hunt with you.", next = "END", fx = { affinity = 2, learn = { "burning_blade" } } } },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "Orcs who still kneel to the old fire. In Durotar they hide in caves. Here they hide behind satyrs. I find them either way." } },
    _none = { { id = "tp_none", text = "Not my hunt." } },
  },
}

P:NPC {
  key = "nataka", id = TODO_NPC("Nataka Longhorn"), name = "Nataka Longhorn",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  communities = { "ghost_walker" }, temper = { "easygoing" }, values = { "patient", "practical" },
  notices = { "craft", "race" },

  greetings = {
    { id = "g_post", text = "Desolace isn't such a bad place, once you stop expecting it to grow anything. Sit down." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The centaur still out there? They always are." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You fish? Out here? Good. There's a catch off the coast I'd like to see before I'm too old to eat it." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the herd, in this grey place. It does me good to see horns that aren't centaur bows." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nataka Longhorn, of Thunder Bluff. The centaur harass us, the land gives nothing, and still I've grown fond of it. Don't tell anyone." },
        { id = "h_family", tags = { "news" }, when = { questActive = TODO_QUEST("Family Tree") },
          text = "A letter? From my brother, at Freewind? I'd given up waiting. Let me sit down before I read it." },
        { id = "h_brother", when = { heardLine = "longhorn.h_default" },
          text = "You've been to Freewind Post? Then you've met my brother. Does he still stand on the edge of the mesa like he's holding it up?" },
        { id = "h_catch", when = { questActive = TODO_QUEST("Catch of the Day") },
          text = "There's a fish off this coast worth the trouble. Bring me one, and we'll both eat better than Desolace deserves." },
      },
      choices = { { text = "I'll help.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    grimtotem = { { id = "tp_grimtotem", text = "My brother writes about them, when he writes. He worries. He always worried more than me." } },
    _none = { { id = "tp_none", text = "Couldn't say. Desolace doesn't bring much news." } },
  },
}
