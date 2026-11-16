-- Desolace: Nijel's Point (Alliance, with a neutral Cenarion keeper) and Ghost Walker Post (Horde). Voice: bibles/desolace.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "pentigast", id = TODO_NPC("Captain Pentigast"), name = "Captain Pentigast",
  bible = "bibles/desolace.md", role = "soldier", tier = "major",
  communities = { "nijels_point" }, temper = { "calculating" }, values = { "dutiful", "cunning" },
  notices = { "kit", "status" },

  impression = {
    first = "Captain Pentigast plays the centaur clans against each other the way other men play cards, and he doesn't pretend it's pretty. He has more ground than soldiers and knows exactly how thin he's stretched.",
    third = "{name} met Captain Pentigast, who commands the Stormwind Army's thin garrison at Nijel's Point.",
  },

  greetings = {
    { id = "g_post", text = "Another sword for Nijel's Point, good. I've more ground to hold than men to hold it." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the valley? Which clan did you run into this time?" },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like you got between two centaur clans. It's an easy mistake, so get patched." },
    { id = "n_stormwind", cat = "status", when = { race = "Human" },
      text = "A face from home. Tell me Stormwind still remembers we're out here." },
  },

  start = "hello",
  nodes = {
    warrior_pg = {
      lines = {
        { id = "wpg_default", text = "Welcome, and don't get comfortable, because there's no line here to hold, only a ridge and a great deal of centaur on either side of it. My best warriors are the ones who learned to count before they learned to charge." },
        { id = "wpg_guard", when = { origin = "human_city_guard" },
          text = "City Watch, aren't you? I can tell by the way you check the gate before you check the view. Stormwind sends me plenty of those, and they're the only ones who ever remember to lock anything." },
      },
      choices = {
        { text = "Point me at the Kolkar and I'll charge.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "I can count. Tell me the numbers.", next = "clans", fx = { align = { honor = -1 } } },
      },
    },
    paladin_pg = {
      big = true,
      lines = {
        { id = "ppg_default", text = "I'm sure it does, and I'm sure the Light would rather I had three hundred more men. I don't, so I make the Kolkar and the Gelkis bleed each other, and I pray about it afterwards, when there's time." },
      },
      choices = {
        { text = "Then I'll keep your men alive and leave the scheming to you.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I won't help betray anyone, Captain.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nelf_pg = {
      lines = {
        { id = "npg_default", text = "They do, and your Sentinels make very sure we know whose trees they are. The Circle's keepers share this ridge with us, and we get on, mostly because they ignore me and I'm careful not to cut anything down." },
      },
      choices = {
        { text = "That's wise of you, Captain.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Captain Pentigast, of the Stormwind Army. We're spread thin out here, and the centaur outnumber us, but luckily they hate each other more." },
        { id = "h_alliance", tags = { "news" }, when = { questActive = TODO_QUEST("Strange Alliance") },
          text = "One of the clans will deal with us, for a price. Pick your partner and earn their trust. We can sort out what we owe them later." },
        { id = "h_politics", when = { questActive = TODO_QUEST("Brutal Politics") },
          text = "Politics out here are brutal: make friends with one clan, then remind them they were never ours. It's ugly work, but necessary." },
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
        { text = "Another blade for the Point, Captain.", next = "warrior_pg", when = { class = "WARRIOR" } },
        { text = "Betraying a clan sits ill with the Light.", next = "paladin_pg", when = { class = "PALADIN" } },
        { text = "Stormwind's soldiers march through our forests to get here.", next = "nelf_pg", when = { race = "NightElf" } },
        { text = "I'll help hold the Point.", next = "END", fx = { affinity = 1, standing = { nijels_point = 1 } } },
      },
    },
    clans = {
      big = true,
      lines = {
        { id = "c_default", text = "Kolkar, Magram, Gelkis: three clans, three grudges, one valley. If they spend their arrows on each other, they don't spend them on us, and I'd rather that than a war I can't win." },
      },
      choices = {
        { text = "Clever.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Turning them on each other is a coward's way to win.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "And when they find out?", next = "clans_after" },
      },
    },
    clans_after = {
      lines = { { id = "ca_default", text = "Then I'll be the most hated man in Desolace, and still alive. I've been both of those before, separately." } },
      choices = {
        { text = "There has to be an honest way.", next = "BACK", fx = { affinity = -1, align = { honor = 2 } } },
        { text = "Honesty won't keep your men alive out here.", next = "BACK", fx = { align = { honor = -2 } } },
        { text = "You don't like it any more than I do, Captain.", tag = "Persuade", next = "arithmetic",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { trait = "cautious" } } } },
          fail = { next = "arithmetic_no", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stakes = {
      lines = { { id = "s_default", text = "Because if we're not, someone else is. A foothold in Desolace is a road between Stonetalon and Feralas, and roads matter, even ones through dust." } },
      choices = {
        { text = "Does Stormwind send you what you need?", next = "stakes_help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stakes_help = {
      lines = { { id = "sh_default", text = "Stormwind sends orders. Supplies come when the road's clear and the sea's calm, which is rarely both, so we make do, and making do is most of soldiering." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    point = {
      lines = { { id = "p_default", text = "The keeper and his sisters, on the Circle's business; Kreldig, on the Reclaimers'; Brother Anton, on the Crusade's. And me, on everyone's." } },
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
      lines = { { id = "h2_default", text = "Do they? Then tell them we've had dust for supper three nights running and nobody's deserted. Tell them it's a miracle, because it is." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    rogue = {
      lines = { { id = "r_default", text = "I don't doubt it, and that's exactly why I'll be watching you while you do it. No offence; it's the job." } },
      choices = {
        { text = "None taken.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Watch all you like, because I've nothing to hide.", next = "BACK", fx = { align = { honor = 1 } } },
      },
    },
    anton = {
      lines = { { id = "a_default", text = "Earnest, brave, and very sure of things a long way from here. I don't argue with him; I'd rather he kept his faith than lost it in my camp." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } } },
    },
    priest_chaplain = {
      lines = { { id = "pch_default", text = "They need a chaplain, a cook and forty more swords, and I'll take the chaplain. Brother Anton prays, but only for the Crusade. My men would like someone to pray for them." } },
      choices = {
        { text = "I'll pray for them.", next = "BACK", fx = { affinity = 3, standing = { nijels_point = 2 }, align = { light = 1 } } },
        { text = "Your men need swords more than they need prayers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arithmetic = {
      lines = {
        { id = "ar_default", text = "No, I don't, and I'll thank you not to tell the men. I call it arithmetic, forty soldiers against three clans, and the arithmetic is right, but I don't sleep the night after I break faith with a clan, and I've stopped expecting to." },
        { id = "ar_priest", when = { class = "PRIEST" },
          text = "You'd make a decent chaplain, getting that out of me. I call it arithmetic, forty soldiers against three clans, and the sums are right, but the night after I break faith with a clan I don't sleep, and I've stopped expecting to." },
      },
      choices = {
        { text = "That's what keeps you honest.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arithmetic_no = {
      lines = {
        { id = "ano_default", text = "What I like doesn't come into it; the orders and the odds do. Ask me something useful." },
        { id = "ano_rogue", when = { class = "ROGUE" },
          text = "Looking for a soft spot, are you? I did say I'd be watching you, so ask me something useful." },
      },
      choices = {
        { text = "Fair enough, Captain.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Keeping three clans at each other's throats means knowing what each one is up to. Ask, and I'll tell you what's safe to tell." },
    },
    background = { { id = "tp_ba", text = "Stormwind Army, and a long string of postings nobody else wanted. This is the dustiest, though it isn't the worst." } },
    advice = { { id = "tp_ad", text = "Never let a centaur clan see you leaving another clan's camp. Leave by the back; there's always a back." } },
    cenarion_circle = { { id = "tp_circle", text = "The keeper's on his own errand. I don't ask and he doesn't explain, and we get along." } },
    _none = { { id = "tp_none", text = "Not in my orders. Ask Kreldig; the Reclaimers poke into everything." } },
  },
}

P:NPC {
  key = "marandis", id = TODO_NPC("Keeper Marandis"), name = "Keeper Marandis",
  bible = "bibles/desolace.md", role = "noble", tier = "quest",
  communities = { "nijels_point" }, temper = { "formal" }, values = { "proud", "devout" },
  notices = { "class", "form" },

  impression = {
    first = "Keeper Marandis speaks as though every word were borrowed from the Cenarion Circle and must be returned in good condition. Whatever errand brought him down from Stonetalon, he considers it far from small.",
    third = "{name} met Keeper Marandis of the Cenarion Circle, who keeps the grove at Nijel's Point.",
  },

  greetings = {
    { id = "g_keeper", text = "You stand before a keeper of the grove. Speak carefully; my time is the Circle's, not mine." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Then you know what the Circle asks of its servants, and perhaps one day it will ask more of you." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "You wear the bear with some dignity, which is good. Keep it when you take your own shape again." },
  },

  start = "hello",
  nodes = {
    hunter_md = {
      lines = {
        { id = "hmd_default", text = "Wrong is a kind word for it. The earth here is poisoned from below, and what grazes on it sickens, and what hunts what grazes sickens after; you may be the first to notice, because you are the last link in that chain." },
      },
      choices = {
        { text = "Then I'll hunt only what's already dying.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A hunter eats what's there, sick or not.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Keeper Marandis, of the Cenarion Circle. My sisters and I came down from Stonetalon on the Circle's business, and it is not small business." },
        { id = "h_corruption", tags = { "news" }, when = { questActive = TODO_QUEST("Corruption of Earth and Seed") },
          text = "The earth here is sick at its root. Bring me proof of what's poisoning it, for the Circle must know." },
        { id = "h_strong", when = { minLevel = 45 },
          text = "You've grown strong, so hear it: a princess of the earth, Theradras, holds the body of one dear to the Circle, and we mean to take it back." },
      },
      again = { { id = "h_again", text = "You have another question; ask it plainly." } },
      choices = {
        { text = "What mission?", next = "mission" },
        { text = "What's wrong with the earth here?", next = "earth" },
        { text = "Your sisters?", next = "sisters" },
        { text = "The Circle asks more of me. How do I answer?", next = "druid", when = { class = "DRUID" } },
        { text = "Tell me of Theradras.", next = "theradras", when = { minLevel = 45 } },
        { text = "I hunt these lands. The beasts are wrong here.", next = "hunter_md", when = { class = "HUNTER" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    mission = {
      lines = { { id = "m_default", text = "Ask me again when you've grown, for the Circle's business is not for apprentices. No offense is meant." } },
      choices = {
        { text = "Some taken.", next = "BACK", fx = { affinity = -1 } },
        { text = "I understand.", next = "BACK", fx = { affinity = 1, learn = { "cenarion_circle" } } },
      },
    },
    earth = {
      lines = { { id = "e_default", text = "Something below sours it. The roots go grey, the water goes bitter, and the valley remembers nothing green. It has been so a long time, but it need not stay so." } },
      choices = {
        { text = "Can it be healed?", next = "earth_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    earth_heal = {
      lines = { { id = "eh_default", text = "Everything can be healed, given time, and the Circle has time. It is the people of Desolace who do not." } },
      choices = {
        { text = "Then the land comes first, and the people must wait.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The people can't wait, so heal them first and the land after.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
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
    knows = {
      { id = "tp_knows", text = "The Circle's business is mine to know, and some of it I may share. Ask, and I will answer as I am able." },
    },
    background = { { id = "tp_ba", text = "A keeper of the grove, sworn to the Circle. What I was before that does not matter to the work." } },
    advice = { { id = "tp_ad", text = "Watch where the grass will not grow. The land is telling you where not to sleep." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle sees further than any one keeper. I see as far as Desolace, and it is far enough to worry." } },
    _none = { { id = "tp_none", text = "That does not concern the Circle, so it does not concern me." } },
  },
}

P:NPC {
  key = "kreldig", id = TODO_NPC("Kreldig Ungor"), name = "Kreldig Ungor",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  communities = { "nijels_point" }, temper = { "busy" }, values = { "practical", "friendly" },
  notices = { "craft" },

  impression = {
    first = "Kreldig Ungor is up to his beard in salvage and reagents and still found time to be friendly. He patched a kettle with an arrow hole in it and seemed prouder of that than of anything else.",
    third = "{name} met Kreldig Ungor, the busy dwarf who runs Reclaimers Inc.'s business out of Nijel's Point.",
  },

  greetings = {
    { id = "g_busy", text = "Got a lot on out here, friend. Wrecks to pick, reagents to fetch, an' only the one of me." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering", "Mining" } },
      text = "Good with yer hands, are ye? The Reclaimers are always hirin' folk who know salvage from scrap." },
  },

  start = "hello",
  nodes = {
    dwarf_kr = {
      lines = {
        { id = "dkr_default", text = "Aye, an' they'd say it wi' a pickaxe in one hand an' a bit o' Titan pottery in the other! The League puts things in glass cases in Ironforge; Reclaimers put 'em back to work, an' I know which one's more use to a hungry dwarf." },
      },
      choices = {
        { text = "History belongs in a hall, not a market.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fair enough. Salvage feeds people.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kreldig Ungor, o' Reclaimers Inc., an' we find what others lost an' put it back to use. Desolace has lost a great deal." },
        { id = "h_karnitol", tags = { "news" }, when = { questActive = TODO_QUEST("The Karnitol Shipwreck") },
          text = "The Karnitol went down off the coast with her cargo, an' the Reclaimers want what's left aboard. Fetch what ye can." },
        { id = "h_reagents", when = { questActive = TODO_QUEST("Reagents for Reclaimers Inc.") },
          text = "Reagents, from the beasts an' the ruins. The Reclaimers pay fair, an' mostly on time." },
        { id = "h_business", when = { questActive = TODO_QUEST("Reclaimers' Business in Desolace") },
          text = "Ye came all this way on Reclaimers' business? Good, then pull up a crate." },
        { id = "h_salvage", when = { metBefore = true }, text = "Found a perfectly good kettle in the dust yesterday, wi' a centaur arrow through it. I patched it, an' it makes tea fine; that's Reclaimers' work in one kettle." },
      },
      again = { { id = "h_again", text = "Anythin' else? Mind the crates." } },
      choices = {
        { text = "What are the Reclaimers?", next = "reclaimers" },
        { text = "What happened to the Karnitol?", next = "karnitol" },
        { text = "How do you get on with the Explorers' League?", next = "league" },
        { text = "I know salvage from scrap.", next = "salvage", when = { profession = "Mining" } },
        { text = "The Explorers' League would call you looters.", next = "dwarf_kr", when = { race = "Dwarf" } },
        { text = "I'll help.", next = "END", fx = { affinity = 1 } },
      },
    },
    reclaimers = {
      lines = { { id = "r_default", text = "Dwarves with shovels an' a head fer business. Somethin' lost is somethin' found, if ye're stubborn enough, an' we're very stubborn." } },
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
      lines = { { id = "k_default", text = "Rocks, weather, or somebody wantin' her cargo more than her crew did. The sea doesnae say, an' neither does what's left aboard, but it's worth askin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    league = {
      lines = { { id = "l_default", text = "Fine! They want the past, an' we want what still works. If they find a ruin, we'll take the hinges, an' everybody's happy, mostly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },
    salvage = {
      lines = { { id = "sv_default", text = "Do ye now? Then ye'll know a cracked casing's still good fer parts, an' a good casing's never good fer long. Reclaimers could use ye." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "We Reclaimers poke our noses intae everythin', so I know a bit o' all of it. Ask away." },
    },
    background = { { id = "tp_ba", text = "Ironforge lad, Reclaimer by trade, salvager by nature. Never met a broken thing I didnae want tae look inside." } },
    advice = { { id = "tp_ad", text = "Never throw anythin' away in Desolace. Ye'll need it a week later, an' there's no shop for a hundred miles." } },
    explorers_league = { { id = "tp_league", text = "The League digs fer history, an' we dig fer things that still work. Friendly rivals, ye might say." } },
    _none = { { id = "tp_none", text = "Never salvaged one o' those. Ask the Captain." } },
  },
}

P:NPC {
  key = "anton", id = TODO_NPC("Brother Anton"), name = "Brother Anton",
  bible = "bibles/desolace.md", role = "priest", tier = "quest",
  communities = { "nijels_point" }, temper = { "zealous" }, values = { "devout", "brave" },
  notices = { "class", "race" },

  impression = {
    first = "Brother Anton is earnest, brave and wholly certain of the Scarlet Crusade. He looked at me as a recruit he hadn't signed up yet.",
    third = "{name} met Brother Anton, an emissary of the Scarlet Crusade who seeks the faithful at Nijel's Point.",
  },

  greetings = {
    { id = "g_light", text = "The Light be with you, friend. Have you come to take up the Crusade's cause? There's work for the faithful here." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "PRIEST" } },
      text = "A servant of the Light! Then you'll want to see the Valley of Bones. The dead walk there, and the Crusade means to stop them." },
  },

  start = "hello",
  nodes = {
    warlock_an = {
      big = true,
      lines = {
        { id = "wan_default", text = "Take one? Friend, the Crusade would take one to the pyre, and I'd have to stand by and watch it done. Put that craft away while you're near me, and pray to the Light that it isn't too late for you." },
      },
      choices = {
        { text = "I fight the undead too, with what I have.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Maybe it isn't too late. Pray for me.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Brother Anton, an emissary of the Scarlet Crusade. We fight the undead wherever they rise. Brother Crowley in Stormwind sends me the willing." },
        { id = "h_path", tags = { "news" }, when = { questActive = TODO_QUEST("Down the Scarlet Path") },
          text = "The Valley of Bones, to the south, where the dead walk. Destroy them, and the Crusade will welcome you." },
        { id = "h_crowley", when = { questActive = TODO_QUEST("Brother Anton") },
          text = "Brother Crowley sent you! Good, then you're ready to prove yourself to the Crusade." },
        { id = "h_letter", tags = { "news" }, when = { questDone = TODO_QUEST("Down the Scarlet Path"), ["not"] = { questDone = TODO_QUEST("In the Name of the Light") } },
          text = "You've proven yourself in the valley, but the true fight is in Lordaeron. Take my letter to Raleigh the Devout, in Southshore; he'll see you to the Monastery." },
        { id = "h_resolved", key = true, when = { thread = { id = "scarlet_path", state = "resolved" } },
          text = "I've been praying on what you told me about Raleigh, and I haven't finished. I'm starting to think I'm not meant to." },
        { id = "h_soured", when = { thread = { id = "scarlet_path", state = "soured" } },
          text = "Raleigh sends his blessing, you said. I think of it every night when the valley goes quiet, and it helps." },
      },
      again = { { id = "h_again", text = "Yes, friend? The Light hears every question." } },
      choices = {
        { text = "I've heard troubling things about the Crusade.", next = "troubling" },
        { text = "What's in the Valley of Bones?", next = "valley" },
        { text = "Who is Brother Crowley?", next = "crowley" },
        { text = "Pray with me, Brother.", next = "pray", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Raleigh read your letter, Brother.", next = "raleigh",
          when = { thread = { id = "scarlet_path", beat = "b3_raleigh", state = { "stirring", "unfolding" } } } },
        { text = "I'll go to the valley.", next = "END", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Would the Crusade take a warlock, Brother?", next = "warlock_an", when = { class = "WARLOCK" } },
        { text = "I won't fight for the Crusade, Brother.", next = "END", fx = { align = { order = -1 } } },
      },
    },
    troubling = {
      big = true,
      lines = {
        { id = "t_default", text = "Rumors. There are always rumors about anyone who fights hard, but the Crusade's cause is just; I'm sure of it. I've been in Desolace a long while, I admit." },
      },
      choices = {
        { text = "Maybe you should go back and see.", next = "troubling_go", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "I'm sure you're right.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    troubling_go = {
      lines = { { id = "tg_default", text = "And leave the valley to the dead? No. If the Crusade has lost its way, it'll need men who kept to the path, and I'll be one. Ask me something else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    valley = {
      lines = { { id = "v_default", text = "Bones, more than you can count, and things that won't stay down. The Crusade's sworn to put them down, every one. It's honest work, whatever else you've heard." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crowley = {
      lines = { { id = "c_default", text = "Our brother in Stormwind. He finds the brave and sends them to me, and I've never met a better judge of courage." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    raleigh = {
      big = true,
      lines = { { id = "r_default", text = "Raleigh! How is he? He hasn't written since I came west. Did he take you north, to the Monastery?" } },
      choices = {
        { text = "He left the Crusade. He told me why.", next = "raleigh_truth" },
        { text = "He's well. He sends his blessing.", next = "raleigh_lie",
          fx = { thread = { id = "scarlet_path", state = "soured" }, trait = { kind = 1 } } },
      },
    },
    raleigh_truth = {
      lines = { { id = "rt_default", text = "Left? Raleigh? He was the most devout of us. What could make a man like that walk away?" } },
      choices = {
        { text = "I've been to the Monastery. He was right.", next = "raleigh_told", when = { questDone = TODO_QUEST("In the Name of the Light") },
          fx = { thread = { id = "scarlet_path", state = "resolved" }, align = { honor = 1, light = 1 } } },
        { text = "They torture innocents and call them plagued.", next = "raleigh_told",
          fx = { thread = { id = "scarlet_path", state = "resolved" }, align = { honor = 1 } } },
        { text = "I shouldn't have said anything.", next = "raleigh_lie",
          fx = { thread = { id = "scarlet_path", state = "soured" }, trait = { cautious = 1 } } },
      },
    },
    raleigh_told = {
      lines = {
        { id = "rto_default", key = true, text = "I told you the rumors were only rumors. I've been saying it a long time, out here where it was easy. Pray with me; I don't know yet what for." },
      },
      choices = {
        { text = "I'll pray with you.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, trait = { pious = 1 } } },
        { text = "Take off the tabard, Brother.", next = "BACK", fx = { affinity = -1, align = { honor = 1 }, trait = { stern = 1 } } },
      },
    },
    raleigh_lie = {
      lines = { { id = "rl_default", text = "Good, good, I knew he would be. Go with the Light, then; the valley won't empty itself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pray = {
      lines = { { id = "p_default", text = "Gladly. Out here, prayer's the only thing that isn't covered in dust. For the fallen, then, and for the Crusade's good name." } },
      choices = {
        { text = "For the fallen.", next = "BACK", fx = { affinity = 2, align = { light = 2 } } },
        { text = "For the Crusade's good name.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Light has shown me a good deal out here, friend, and I'm glad to share it. Ask." },
    },
    background = { { id = "tp_ba", text = "A brother of the Light who took up the Crusade's cause. I came west to hold back the dead where I'm sent.", next = "troubling" } },
    advice = { { id = "tp_ad", text = "Bless your blade before the Valley of Bones. The dead there don't stay down for steel alone." } },
    scarlet_crusade = { { id = "tp_crusade", text = "Brave men and women, fighting the plague where no one else will. Whatever you've heard, that's the heart of it." } },
    _none = { { id = "tp_none", text = "I couldn't say, but pray on it." } },
  },
}

P:NPC {
  key = "lyshaerya", id = TODO_NPC("Innkeeper Lyshaerya"), name = "Innkeeper Lyshaerya",
  bible = "bibles/desolace.md", role = "innkeeper", tier = "service",
  communities = { "nijels_point" }, temper = { "calm" }, values = { "kind" },
  notices = { "weary" },

  impression = {
    first = "Innkeeper Lyshaerya sweeps the Desolace dust while she talks and has given up winning against it. Her calm is the kind people come a long way to sit beside.",
    third = "{name} met Innkeeper Lyshaerya, who keeps the only warm hearth at Nijel's Point.",
  },

  greetings = {
    { id = "g_inn", text = "Rest here. There's little enough comfort in Desolace; take what this roof can give." },
    { id = "g_home", when = { homeInn = { "Nijel's Point" } }, text = "You've come back to the Point. Your bed's made, though the dust got in anyway." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've walked back from the spirit healer across a dead land. Sit; nothing here will ask anything of you for an hour." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Lyshaerya. I keep the only warm hearth between Stonetalon and Feralas, and travelers find their way to it eventually." },
        { id = "h_dust", when = { metBefore = true }, text = "Desolace dust gets into everything: the bread, the beds, my hair. I've stopped fighting it, and now I just sweep while I talk." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The centaur drums carry a long way at night. You stop hearing them after a week, though I haven't stopped yet." },
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
      lines = { { id = "d_default", text = "One clan telling another it's still there. Louder means angrier, and tonight is loud." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because a hearth matters most where there's nothing else. Anyone can keep an inn in Darnassus." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Travelers bring news from both ends of the valley to this hearth. Ask, and I'll tell you what I've heard." },
    },
    background = { { id = "tp_ba", text = "A hearth, a broom, and travellers who need both. I don't need more of a story than that." } },
    advice = { { id = "tp_ad", text = "Shake out your boots every morning. Desolace has scorpions, and scorpions like boots." } },
    _none = { { id = "tp_none", text = "I keep the hearth; ask the Captain for news." } },
  },
}

-- Ghost Walker Post: the Horde's camp in Desolace.
P:NPC {
  key = "takata", id = TODO_NPC("Takata Steelblade"), name = "Takata Steelblade",
  bible = "bibles/desolace.md", role = "soldier", tier = "major",
  communities = { "ghost_walker" }, temper = { "hard" }, values = { "loyal", "stern" },
  notices = { "class", "kit" },

  impression = {
    first = "Takata Steelblade hunts the Burning Blade and every satyr who shelters them, and nothing about him invites small talk. He measures people by whether they will fight.",
    third = "{name} met Takata Steelblade, the hard-bitten orc who hunts the Burning Blade from Ghost Walker Post.",
  },

  greetings = {
    { id = "g_post", text = "You're in Desolace now, and the demons' servants are thick here. Are you here to fight them?" },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. I've killed a great many who walked your road too far, so don't make me add you to the count." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Satyr claws, by the look of it. They fight dirty, so learn to fight dirtier." },
  },

  start = "hello",
  nodes = {
    shaman_tk = {
      lines = {
        { id = "stk_default", text = "Sick, yes, and the Burning Blade made them so, the same way the demons sickened our blood. Thrall's shamans are the only ones I've seen make a fel-touched place breathe again, so if you can, do it while I kill what's poisoning it." },
        { id = "stk_thrall", when = { origin = "orc_thrall_shaman" },
          text = "You learned at Thrall's side, I hear it in how you speak of them. Then you know what this land feels like; it's the same thing we felt in the camps, when the bloodlust left us." },
      },
      choices = {
        { text = "Heal first. Killing won't clean the land.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Kill first. The spirits can wait for quiet.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    warrior_tk = {
      lines = {
        { id = "wtk_default", text = "Good, and don't stop to talk to them, because the Blade hides among the satyrs and the satyrs lie for sport. Thunder Axe Fortress is full of them, and every one you leave alive tells the next one you're coming." },
        { id = "wtk_grunt", when = { origin = "orc_razor_hill_grunt" },
          text = "Razor Hill sends its grunts a long way these days. The Blade was in Durotar too, you'll remember, in the Skull Rock caves; this is the same rot, only older." },
      },
      choices = {
        { text = "None of them will walk away.", next = "BACK", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "I'll leave one alive, to follow home.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Takata Steelblade. Keldran sent me from Orgrimmar to hunt the Burning Blade here. They hide among the satyrs, so the satyrs die too." },
        { id = "h_satyr", tags = { "news" }, when = { questActive = TODO_QUEST("Befouled by Satyr") },
          text = "The satyrs foul everything they touch, so thin them. The Blade loses its friends one horn at a time." },
        { id = "h_corrupter", when = { questActive = TODO_QUEST("The Corrupter") },
          text = "I saw what that demon lord's shadow did to Maurin, and it was only a shadow. Find Lord Azrethoc and his warlock servant at the Mannoroc Coven, and end them both." },
        { id = "h_relations", when = { questActive = TODO_QUEST("Alliance Relations") },
          text = "So Keldran sent you with news from Orgrimmar, good. Maurin Bonesplitter handles the Blade's warlocks for us, so speak to him, and he'll tell you his designs." },
        { id = "h_corrupter_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Corrupter"), days = 3 } },
          text = "Azrethoc is dead, and the Blade has lost its newest master. For the first time since I came here, I think we may one day call some place safe again." },
      },
      again = {
        { id = "h_again", text = "Something else? Say it and be done." },
        { id = "h_again2", text = "Speak. The satyrs won't wait while we talk, so neither will I for long." },
      },
      choices = {
        { text = "Who are the Burning Blade?", next = "blade" },
        { text = "Why kill every satyr?", next = "satyrs" },
        { text = "Why does Orgrimmar worry about the Alliance?", next = "relations" },
        { text = "Do you miss home?", next = "home" },
        { text = "What did the demon lord do to Maurin?", next = "corrupter", when = { any = { { questActive = TODO_QUEST("The Corrupter") }, { questDone = TODO_QUEST("The Corrupter") } } } },
        { text = "Not every warlock is the Blade.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Maurin is Forsaken, like me. Do you trust him?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'm an orc mage, not a warlock.", next = "orc_mage", when = { race = "Orc", class = "MAGE" } },
        { text = "The spirits here are sick with demon taint.", next = "shaman_tk", when = { class = "SHAMAN" } },
        { text = "Give me a satyr camp. I'll clear it.", next = "warrior_tk", when = { class = "WARRIOR" } },
        { text = "I'll hunt with you.", next = "END", fx = { affinity = 2, learn = { "burning_blade" } } },
      },
    },

    blade = {
      big = true,
      lines = {
        { id = "b_default", text = "Members of the Horde who gave their loyalty to the demons and kept practicing their dark magic. They care nothing for the Warchief's vision of our future in Kalimdor, and that is the threat Thrall most wants dealt with." },
      },
      choices = {
        { text = "Who hunts them with you?", next = "blade_maurin" },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    blade_maurin = {
      lines = {
        { id = "bm_default", text = "Maurin Bonesplitter, a Forsaken whom Keldran sent because he knows the Blade and their warlock ways. He plots against them, and I deal with every other demonic thing in Desolace, and it does not please me to need a warlock's help, but I do my duty." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },

    satyrs = {
      lines = {
        { id = "s_default", text = "The Hatefury satyrs to the northeast have ties to the Blade, and the Warchief would have them slain. A satyr is what a night elf becomes when the demons are finished with him, and I don't leave those standing." },
      },
      choices = {
        { text = "How does a demon get a foothold?", next = "satyrs_pain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    satyrs_pain = {
      lines = {
        { id = "sp_default", text = "Never without help. A weak spirit, a hunger for power, a thirst for revenge or even for justice, and when we're in pain, evil comes and offers to ease it." },
      },
      choices = {
        { text = "You sound like you've seen it happen.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Then I'll guard my spirit.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Power is power, whoever offers it.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },

    relations = {
      lines = {
        { id = "r_default", text = "As the Alliance pushes deeper into Kalimdor, they see the Blade and the satyrs and conclude the Horde has made pacts with the Legion. Keldran won't allow that, and with the Warchief's blessing, neither will I." },
      },
      choices = {
        { text = "Why care what the Alliance thinks?", next = "relations_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    relations_why = {
      lines = {
        { id = "rw_default", text = "Because Thrall wants peace with them, and a war started over a lie is still a war. Even helping the centaur, which this does in its way, is better than that, though I'll not pretend I like it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } } },
    },

    home = {
      lines = {
        { id = "h2_default", text = "I hoped the Warchief would let us go home before the seasons turned. Every new demon that crawls up out of this land pushes that hope a little further off, and some days I wish it were only the centaur we had to fight." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    corrupter = {
      lines = {
        { id = "c_default", text = "An apparition of a demon lord called Azrethoc came against him, and even as a shadow it had more power than my warlock companion. I wonder if Maurin is equal to the task, though I'd never say so to his face." },
      },
      choices = {
        { text = "Why not fight it yourself?", next = "corrupter_honor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    corrupter_honor = {
      lines = {
        { id = "ch_default", text = "It would serve the Warchief better if I went, and my blade itches for it. But I hold this post, and I would disgrace my clan if I left it to chase glory for my own honor, so I'll trust you to gather a party in my place." },
      },
      choices = {
        { text = "I'll do it.", next = "BACK", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "Glory's worth more than a post, and I'd have gone myself.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },

    warlock = {
      lines = {
        { id = "w_default", text = "Maybe not, and Maurin is proof of it, but every one of the Blade said the same thing once. Show me with deeds, and I'll stop counting you." },
      },
      choices = {
        { text = "Then watch me.", next = "BACK", fx = { affinity = 1, trait = { proud = 1 } } },
        { text = "Fair enough.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    forsaken = {
      lines = {
        { id = "fo_default", text = "I trust that he hates the Blade as much as I do, and I trust his knowledge of them. What he does with the rest of his studies is his business, as long as it isn't done near my post." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orc_mage = {
      lines = {
        { id = "om_default", text = "From across a battlefield, I can't tell your fire from theirs, and neither can the Alliance. Keep your magic clean and your loyalty plain, and we'll have no quarrel." },
      },
      choices = {
        { text = "Understood.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My magic's my own business, and I'll use it how I like.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know what my hunt has taught me. Ask, and I'll answer if it serves the Horde." },
    },
    burning_blade = { { id = "tp_blade", text = "Orcs who still kneel to the old fire. In Durotar they hide in caves and here they hide behind satyrs, but I find them either way.", next = "blade" } },
    background = { { id = "tp_ba", text = "A soldier sent by Keldran to clear demons out of Desolace. I'll tell you more about myself when the job is done, which means not soon." } },
    advice = { { id = "tp_ad", text = "Hit a satyr before it speaks. Whatever it says, you'll wish you hadn't heard it." } },
    _none = { { id = "tp_none", text = "Not my hunt." } },
  },
}

P:NPC {
  key = "nataka", id = TODO_NPC("Nataka Longhorn"), name = "Nataka Longhorn",
  bible = "bibles/desolace.md", role = "questgiver", tier = "quest",
  communities = { "ghost_walker" }, temper = { "easygoing" }, values = { "patient", "practical" },
  notices = { "craft", "race" },

  impression = {
    first = "Nataka Longhorn has grown fond of Desolace and asked me not to tell anyone. He's the most unhurried soul I've met out here, and a fisherman at heart.",
    third = "{name} met Nataka Longhorn of Thunder Bluff, an easygoing tauren posted at Ghost Walker Post.",
  },

  greetings = {
    { id = "g_post", text = "Desolace isn't such a bad place, once you stop expecting it to grow anything. Sit down." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Are the centaur still out there? They always are." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You fish, out here? Good, because there's a catch off the coast I'd like to see before I'm too old to eat it." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the herd, in this grey place. It does me good to see horns that aren't centaur bows." },
  },

  start = "hello",
  nodes = {
    hunter_nt = {
      lines = {
        { id = "hnt_default", text = "Then you'll weep at the kodo graveyard, as I did. The old kodo come all the way out here to die, and the centaur pick at their bones, and I've never once heard a good reason why they walk so far." },
        { id = "hnt_run", when = { origin = "tauren_plains_runner" },
          text = "A plains runner! You'll find no grass to run in here, cousin, only sand and bones. Your legs will hate it for a week, and then you'll love it like I do." },
      },
      choices = {
        { text = "They come home to the earth. That's reason enough.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else, Nataka.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nataka Longhorn, of Thunder Bluff. The centaur harass us, the land gives nothing, and still I've grown fond of it. Don't tell anyone." },
        { id = "h_family", tags = { "news" }, when = { questActive = TODO_QUEST("Family Tree") },
          text = "A letter, from my brother at Freewind? I'd given up waiting. Let me sit down before I read it." },
        { id = "h_brother", when = { heardLine = "longhorn.h_default" },
          text = "You've been to Freewind Post? Then you've met my brother. Does he still stand on the edge of the mesa like he's holding it up?" },
        { id = "h_catch", when = { questActive = TODO_QUEST("Catch of the Day") },
          text = "There's a fish off this coast worth the trouble. Bring me one, and we'll both eat better than Desolace deserves." },
        { id = "h_catch_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Catch of the Day"), days = 2 } },
          text = "My hoof still tingles from that Bloodbelly fish, and the whole post smelled of frying for an evening. That's the best thing to happen here all season." },
      },
      again = {
        { id = "h_again", text = "Something else? Sit; nothing out here is in a hurry except the centaur." },
      },
      choices = {
        { text = "What's to like about Desolace?", next = "fond" },
        { text = "Tell me about your brother.", next = "brother" },
        { text = "What's this about a fish?", next = "fish" },
        { text = "Which centaur are giving you trouble?", next = "centaur" },
        { text = "It's good to see another tauren out here.", next = "tauren", when = { race = "Tauren" } },
        { text = "I fish. What should I know about these waters?", next = "fisher", when = { profession = "Fishing" } },
        { text = "I met your brother. He seemed well.", next = "brother_met", when = { heardLine = "longhorn.h_default" } },
        { text = "I've run the plains with my kodo since I was a calf.", next = "hunter_nt", when = { race = "Tauren", class = "HUNTER" } },
        { text = "I'll help.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },

    fond = {
      lines = {
        { id = "f_default", text = "The quiet, mostly, when the centaur let us have it, and the sky, which is as wide as Mulgore's. And the graveyard next to the post, where the kodo come to rest, which is a sad place and a holy one." },
      },
      choices = {
        { text = "Tell me about the Kodo Graveyard.", next = "fond_kodo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fond_kodo = {
      lines = {
        { id = "fk_default", text = "Bones as big as huts, as far as you can see, and at night something of the old beasts walks among them. We leave them be, and they leave us be, and that's the best arrangement in Desolace." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    brother = {
      lines = {
        { id = "b_default", text = "Cliffwatcher Longhorn, at Freewind Post in Thousand Needles. He writes when there's something to worry about, which is why a whole year can go by between letters." },
      },
      choices = {
        { text = "What did he write about this time?", next = "brother_worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother_worry = {
      lines = {
        { id = "bw_default", text = "Centaur, stirring around the Needles more than usual, as if I didn't have enough centaur of my own. He always worried more than me, and I always told him he'd go grey early." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    fish = {
      lines = {
        { id = "fi_default", text = "Bloodbelly fish, my favourite, and the trolls at Shadowprey Village are the only ones who know how to catch them. The post hasn't smelled of cooked fish in far too long, and the centaur keep me too busy to go and ask." },
      },
      choices = {
        { text = "Who should I ask at Shadowprey?", next = "fish_jinar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish_jinar = {
      lines = {
        { id = "fj_default", text = "Jinar'Zillen, their fisherman; follow the road south and then west to the coast. Tell him a hungry tauren sent you, and he'll know exactly which one." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    centaur = {
      lines = {
        { id = "c_default", text = "All of them, one way or another, since the tribes here fight each other as hard as they fight us. The Magram and the Gelkis are the nearest, and they don't much care which of us they're shooting at." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    tauren = {
      lines = {
        { id = "t_default", text = "And for me, to see you. Mulgore feels a long way off from this grey place, but horns and a good laugh bring it a little closer." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    fisher = {
      lines = {
        { id = "fs_default", text = "That the best catch here is the one somebody else already caught. Talk to the trolls at Shadowprey; they've been fishing this coast longer than any of us has been in Desolace." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    brother_met = {
      lines = {
        { id = "bm_default", text = "Good, good; that's all I needed to hear. If you pass through Freewind again, tell him his brother is eating well, even if it isn't quite true yet." },
      },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've spent a long time in this dusty land, and I've learned more than I expected to. Ask, and I'll tell you." },
    },
    grimtotem = { { id = "tp_grimtotem", text = "My brother writes about them, when he writes. He worries; he always worried more than me." } },
    background = { { id = "tp_ba", text = "A tauren of Thunder Bluff, posted to Desolace, and the brother of a tauren who worries too much. That's about all of it.", next = "brother" } },
    advice = { { id = "tp_ad", text = "Travel the roads in the daytime here. The centaur ride at night, and a lone traveler on a dark road is the easiest prey there is." } },
    _none = { { id = "tp_none", text = "Couldn't say; Desolace doesn't bring much news." } },
  },
}
