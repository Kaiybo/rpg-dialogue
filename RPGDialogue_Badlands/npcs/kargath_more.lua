-- Kargath, the rest of the outpost: the head scout, the alchemist upstairs, the wind riders and the goods tent. Voice: bibles/badlands.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "neeka", id = TODO_NPC("Neeka Bloodscar"), name = "Neeka Bloodscar",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "proud" }, values = { "brave", "practical" },
  notices = { "class", "level" },

  impression = {
    first = "Neeka Bloodscar is Kargath's head scout, and she sized me up like a coyote she hadn't decided to shoot yet. She talks about Helgrum in Stonard as if he were a younger brother who runs too fast and thinks too little.",
    third = "{name} met Neeka Bloodscar, head scout of Kargath in the Badlands.",
  },

  greetings = {
    { id = "g_default", text = "You walked in from the west, and you didn't look behind you once. Remember to do that next time." },
    { id = "g_back", when = { metBefore = true }, text = "Still breathing, I see, so the Badlands haven't eaten you yet. Give them time." },
    { id = "g_coyotes", when = { questActive = TODO_QUEST("Coyote Thieves") }, text = "The coyotes were at the sacks again last night, so I hope you've brought me jaws." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and your pet's paws are cracked from the hot rock. Rub some fat into them tonight, or it'll be limping by the Gorge." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You move quietly, I'll give you that, but you were downwind of me the whole way in. A scout notices." },
    { id = "n_young", cat = "level", when = { maxLevel = 34 },
      text = "You're green for this country. The heat alone kills half the young ones who come out here thinking only the dwarves are dangerous." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Neeka Bloodscar, head scout of Kargath. I know every gully between here and the Gorge, and I can tell you which of them you'll die in, if you'd like to know before you go." },
        { id = "h_from_helgrum", tags = { "news" }, when = { questActive = TODO_QUEST("Neeka Bloodscar") },
          text = "Helgrum sent you, did he? He'd have come himself if he could find his way through the Badlands without running in circles, so sit, and I'll write him something worth the trip back." },
        { id = "h_report", when = { questActive = TODO_QUEST("Report to Helgrum") },
          text = "You've got my report, so why are you still standing in my camp? Stonard is south, and Helgrum is waiting, impatiently, as always." },
        { id = "h_report_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Report to Helgrum"), days = 5 } },
          text = "So the report reached Stonard, and you with it. That's one outrunner who made it, which is more than I could say last season." },
        { id = "h_coyotes_done", when = { questDone = TODO_QUEST("Coyote Thieves") },
          text = "Not a coyote has been near the sacks since you went hunting, and the grunts are eating whole rations again. You know this country now, whether you like it or not." },
      },
      again = {
        { id = "h_again", text = "Something else? Ask it quickly, because the light's going and I scout at dusk." },
        { id = "h_again2", text = "Go on, then. I'm listening, and I'm watching the ridge while I do it." },
        { id = "h_again3", text = "More questions? You'd make a poor scout, but a decent clerk." },
      },
      choices = {
        { text = "What does a head scout do out here?", next = "scouting" },
        { text = "Something's stealing your food?", next = "coyotes" },
        { text = "Helgrum in Stonard speaks well of you.", next = "helgrum" },
        { text = "What's the most dangerous thing in the Badlands?", next = "danger" },
        { text = "A hunter could help you track, Neeka.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "My people were runners on the plains of Mulgore.", next = "k_tauren", when = { race = "Tauren" } },
        { text = "I'll keep my eyes open.", next = "END", fx = { affinity = 1, standing = { kargath = 1 } } },
      },
    },

    scouting = {
      lines = {
        { id = "sc_default", text = "I watch the dwarves at their digs, the Dark Irons in the Gorge, and the ogres who don't care who wins. Then I write it down and send it south to Stonard, because Thrall wants both outposts to know what the other sees." },
      },
      choices = {
        { text = "Why send it south and not to Orgrimmar?", next = "scouting_south" },
        { text = "The dwarves at their digs?", next = "scouting_dwarves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scouting_south = {
      lines = {
        { id = "ss_default", text = "Orgrimmar is an ocean away, and Stonard is a hard week's run, so Stonard it is. If the Alliance ever pushes on us from Loch Modan, Helgrum needs to hear it before they reach him, not after." },
      },
      choices = { { text = "That's sense. Something else.", next = "BACK", fx = { learn = { "uldaman" } } } },
    },
    scouting_dwarves = {
      lines = {
        { id = "sd_default", text = "Explorers' League dwarves digging at the old ruins of Uldaman, and troggs crawling out of the holes they dig. The dwarves have trouble enough of their own this year, and I put that in my last report, word for word." },
        { id = "sd_dwarf", when = { race = "Dwarf" },
          text = "Your cousins dig at Uldaman and the troggs dig right back, and no one at their camp seems to have noticed. I'm not saying that to mock you; I'm telling you how it looks from the ridge." },
      },
      choices = {
        { text = "Their trouble is our gain.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Troggs are everyone's trouble, Horde or Alliance.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    coyotes = {
      lines = {
        { id = "co_default", text = "Crag coyotes come over the wall at night and drag the grain sacks off into the dust, and the grunts are too slow and too loud to catch them. Bring me their jawbones, thirty of them, and I'll believe you know this country." },
        { id = "co_done", when = { questDone = TODO_QUEST("Coyote Thieves") },
          text = "Not anymore, thanks to you. The pack that's left has learned to go and rob the ogres instead, and I wish it luck." },
      },
      choices = {
        { text = "Why jawbones? Why not pelts?", next = "coyotes_jaws" },
        { text = "Thirty is slaughter for a few sacks of grain.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Thirty, and they'll learn to fear the outpost.", next = "BACK", fx = { align = { light = -1 }, trait = { brave = 1 } } },
      },
    },
    coyotes_jaws = {
      lines = {
        { id = "cj_default", text = "Because a pelt can be bought off a goblin, but a fresh jaw means you stood in the gullies with the beast and walked out again. I don't want proof of your purse, I want proof of your legs." },
      },
      choices = { { text = "Then I'll bring jaws. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    helgrum = {
      lines = {
        { id = "he_default", text = "Does he? He calls himself the Swift, which tells you everything about him, because the fast ones always think getting there first is the same as getting it right. Still, he's the only orc in Stonard who reads what I send him." },
      },
      choices = {
        { text = "You two sound like old rivals.", next = "helgrum_rival" },
        { text = "His last outrunner never reached him.", next = "helgrum_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    helgrum_rival = {
      lines = {
        { id = "hr_default", text = "Rivals! He can outrun me on a road, and I can outtrack him anywhere else, so we argue about which matters more in every report. I haven't won yet, but neither has he." },
      },
      choices = { { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 2 } } },
    },
    helgrum_lost = {
      lines = {
        { id = "hl_default", text = "I know it, and I know the runner's name, and that's all I'll say about it. The road between here and Stonard eats outrunners, which is why I'm handing my reports to strangers like you." },
      },
      choices = {
        { text = "Then I'll get the next one through.", next = "BACK", fx = { affinity = 2, standing = { kargath = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    danger = {
      lines = {
        { id = "da_default", text = "The heat, before anything with teeth. After the heat, the Dark Irons coming out of the Gorge, and after them, the dragon whelps in the east that nobody in Kargath wants to talk about." },
      },
      choices = {
        { text = "Dragon whelps?", next = "danger_whelps" },
        { text = "I'm not afraid of a little heat.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_whelps = {
      lines = {
        { id = "dw_default", text = "Red ones, scorched and angry, nesting in Lethlor Ravine to the east, where the bones of something huge lie in the sand. I've watched them from the ridge, and I don't go closer than that." },
      },
      choices = { { text = "Wise. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Help me track, ha! Go find me the coyote den in the western gullies, then come back and tell me which way the wind was blowing when you found it, and if you can do that, we'll talk about helping." },
        { id = "xhu_tauren", when = { race = "Tauren" },
          text = "A tauren hunter, and you'll read this hard ground better than most orcs I've trained, since your people learned tracking on open plains. Don't let it go to your head; the Badlands punish pride." },
      },
      choices = {
        { text = "I'll find your den before nightfall.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something's stealing your food?", next = "coyotes" },
      },
    },
    k_tauren = {
      lines = {
        { id = "xta_default", text = "Then you know about running, but Helgrum would tell you that running is all there is to it, and he's wrong. A runner who doesn't stop to look at the ground runs straight into the ogres." },
        { id = "xta_runner", when = { origin = "tauren_plains_runner" },
          text = "A plains runner! Then you'll race Helgrum one day, and I'd pay good silver to see his face when he loses. Bring me word of it if you do." },
      },
      choices = {
        { text = "I'll race him, and I'll win.", next = "BACK", fx = { affinity = 2, trait = { proud = 1 } } },
        { text = "Looking and running both matter.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was tracking before Kargath had a wall, and I'll be tracking after it falls down. Ask Helgrum about me; he'll exaggerate in my favor.", next = "helgrum" } },
    advice = { { id = "tp_ad", text = "Carry twice the water you think you need and look behind you every hundred paces. Nothing in the Badlands comes at you from the front." } },
    uldaman = { { id = "tp_uld", text = "Old dwarven ruins in the eastern hills, and the Explorers' League digging at them like they'd lost their keys there. I watch, I write it down, I don't go in." } },
    _none = { { id = "tp_none", text = "If it isn't on my maps, it isn't worth knowing, or it's already dead." } },
  },
}

P:NPC {
  key = "jarkal", id = TODO_NPC("Jarkal Mossmeld"), name = "Jarkal Mossmeld",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "kargath" }, temper = { "shrewd" }, values = { "curious", "greedy" },
  notices = { "race", "class" },

  impression = {
    first = "Jarkal Mossmeld rents the room upstairs at Kargath's inn and fills it with jars of gizzards and fangs. He's a Darkspear alchemist with a merchant's eye, and he made sure I knew his offers beat anyone else's.",
    third = "{name} met Jarkal Mossmeld, a troll alchemist who works upstairs at the inn in Kargath.",
  },

  greetings = {
    { id = "g_default", text = "Mind the jars, mon, and don't touch the green one. It be thinking about exploding." },
    { id = "g_back", when = { metBefore = true }, text = "You be back! Jarkal always got more work for somebody with strong arms and a strong stomach." },
    { id = "g_reagents", when = { questActive = TODO_QUEST("Badlands Reagent Run") }, text = "Gizzards, fangs and shards, mon. The buzzards, the coyotes and the rock elementals be keeping them for me." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, all the way out in this dust! Sit down, cousin, and smell that jar; it be smelling like home, almost." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of the walking dead. The apothecaries in your city buy from Jarkal sometimes, mon, so tell them I be still here and still cheap." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! The rock spirits out here be cracking into shards when you kill them, and Jarkal be grinding those shards into fine powder. Don't tell them that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jarkal Mossmeld, alchemist, and the only one between here and the Undercity who be selling potions the Expeditionary Force can trust. My stock be running low, though, and the Badlands be full of things I need, if you be brave enough to collect them." },
        { id = "h_uldaman", when = { questActive = TODO_QUEST("Uldaman Reagent Run") },
          text = "The fungus, mon, the magenta caps that grow down in the dark of Uldaman. Bring me those and Jarkal's potions be stronger than any the goblins sell." },
        { id = "h_journal", tags = { "news" }, when = { questActive = TODO_QUEST("Translating the Journal") },
          text = "You found a paladin's journal in Uldaman and you be needing it read, eh? Bring it here, because Jarkal reads the old dwarf hand, and Jarkal be making you a better offer than that goblin in Orgrimmar ever would." },
        { id = "h_gems", when = { any = { { questActive = TODO_QUEST("Find the Gems and Power Source") }, { questActive = TODO_QUEST("Deliver the Gems") } } },
          text = "The gems and the power source, mon, both of them, or the necklace be only a pretty chain. Uldaman be keeping them deep, so go careful." },
        { id = "h_run_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Badlands Reagent Run"), days = 3 } },
          text = "My shelves be full again, and it be your doing! Now, about the fungus that grows under Uldaman, mon." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Jarkal be listening while he stirs." },
        { id = "h_again2", text = "Ask, ask. The potion don't mind waiting, but the customers do." },
      },
      choices = {
        { text = "The Badlands are hard country, and a good place for a warrior.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "What do you need from the Badlands?", next = "reagents" },
        { text = "What's this about a necklace?", next = "necklace" },
        { text = "Why does a Darkspear live above an orc inn?", next = "upstairs" },
        { text = "I know my way around an alchemy table.", next = "k_alchemy", when = { profession = "Alchemy" } },
        { text = "The loa would frown on your bargaining, cousin.", next = "k_troll", when = { race = "Troll" } },
        { text = "I'll bring you what you need.", next = "END", fx = { affinity = 1 } },
      },
    },

    reagents = {
      lines = {
        { id = "re_default", text = "Buzzard gizzards, crag coyote fangs and the shards from the rock elementals, five and ten and five. If you be no fighter yourself, then find some that are, because nothing out here gives up its insides for free." },
      },
      choices = {
        { text = "What do you make from buzzard gizzards?", next = "reagents_gizzard" },
        { text = "And after that?", next = "reagents_deeper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reagents_gizzard = {
      lines = {
        { id = "rg_default", text = "Ah, you don't want to know, and the grunts who drink it don't want to know either. It keeps them on their feet in the heat, and that be all anybody asks." },
      },
      choices = { { text = "Fair enough. Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    reagents_deeper = {
      lines = {
        { id = "rd_default", text = "After that, mon, the best things be under the ground, down in the excavation where the troggs and the stone things walk. Jarkal pays better for what comes out of Uldaman, because fewer people come back with it." },
      },
      choices = {
        { text = "Paying by the dead is a vulture's trade.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Danger should pay. That's fair trade.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } },
      },
    },

    necklace = {
      lines = {
        { id = "ne_default", text = "There be an old necklace somewhere in Uldaman, broken into pieces, and a goblin in Orgrimmar named Dran Droffers wants it badly. Jarkal wants it too, and Jarkal be a lot closer to Uldaman than Dran is." },
      },
      choices = {
        { text = "You're trying to outbid Dran.", next = "necklace_dran" },
        { text = "What's so special about it?", next = "necklace_power" },
        { text = "Something else.", next = "BACK" },
      },
    },
    necklace_dran = {
      lines = {
        { id = "nd_default", text = "Outbid, outsmart, out-everything, mon! You can still keep your deal with that goblin, and Jarkal won't stop you, but Jarkal can read the journal and Dran can't, and that be worth something." },
      },
      choices = {
        { text = "I'll keep my word to Dran.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "The best offer wins, Jarkal.", next = "BACK", fx = { align = { honor = -1 }, affinity = 2 } },
      },
    },
    necklace_power = {
      lines = {
        { id = "np_default", text = "The journal of a dead paladin talks about it, and the gems and a little power source that made it shine. Whole again, it be worth a great deal, and Jarkal don't need to know more than that." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    upstairs = {
      lines = {
        { id = "up_default", text = "Because Shul'kar's floor be the only one in Kargath that don't shake when the grunts march by, and the potions don't like shaking. And the stew come up the stairs every night, mon, which be the real reason." },
      },
      choices = {
        { text = "Does Shul'kar mind the smell?", next = "upstairs_smell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    upstairs_smell = {
      lines = {
        { id = "us_default", text = "He minds, but he be too kind to say it, so he just cooks with more onions. Between his onions and my gizzards, nobody in Kargath can smell the Dark Irons coming." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    k_alchemy = {
      lines = {
        { id = "xal_default", text = "Then you know the gizzards be the key, not the fangs, though everybody thinks the fangs! Bring me the Badlands reagents a second time, mon, and Jarkal will make it worth your while as one alchemist to another." },
        { id = "xal_done", when = { questDone = TODO_QUEST("Badlands Reagent Run II") },
          text = "You brought the second run already, so you know the trade as well as Jarkal does. Careful, mon, or I be needing to watch you for competition." },
      },
      choices = {
        { text = "Share your recipes and we both prosper.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "I'll keep my own secrets, thanks.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Hard country makes hard fighters, true, and soft ones bleach in the sun. I've seen young warriors come through here proud and leave humble, and the humble ones lived longest." } },
      choices = {
        { text = "Then I'll learn humility before the sun teaches me.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll stay proud. The sun can try me.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    k_troll = {
      lines = {
        { id = "xtr_default", text = "The loa, cousin, be the biggest bargainers of all, and they always want something in return. Jarkal only be learning from the best." },
        { id = "xtr_echo", when = { origin = "troll_echo_isles" },
          text = "You be from the Echo Isles, so you know what the Darkspear had to bargain with just to keep living. Jarkal never forgot it, and Jarkal never gives anything away for nothing." },
      },
      choices = {
        { text = "The loa give back what they take.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A shrewd troll lives longer. I respect it.", next = "BACK", fx = { align = { light = -1 }, affinity = 2 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Jarkal come with the Expeditionary Force because soldiers need potions and soldiers pay. Simple, mon." } },
    advice = { { id = "tp_ad", text = "Never drink a potion you didn't see poured. Even Jarkal's, mon, though Jarkal's be the safest you'll find." } },
    uldaman = { { id = "tp_uld", text = "The best fungus in the Badlands grows in the dark under those ruins, and so do the troggs. Go for the fungus, mon, and leave the troggs to somebody else.", next = "reagents" } },
    _none = { { id = "tp_none", text = "Don't know it, mon, and if Jarkal can't sell it or brew it, Jarkal don't care." } },
  },
}

P:NPC {
  key = "gorrik", id = TODO_NPC("Gorrik"), name = "Gorrik",
  bible = "bibles/badlands.md", role = "flightmaster", tier = "service",
  communities = { "kargath" }, temper = { "gruff" }, values = { "dutiful" },
  notices = { "race", "level" },

  impression = {
    first = "Gorrik keeps the wind riders at Kargath and spends half his day dragging them out of the shade. His beasts hate the heat, he says, and he hates it more.",
    third = "{name} met Gorrik, the wind rider master at Kargath.",
  },

  greetings = {
    { id = "g_default", text = "If you're flying, say where, and if you're not, stand out of the shade, because the riders want it." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and the riders remember your smell. Don't take that as a compliment." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren! Brace yourself on the saddle, because the riders grumble under anybody heavy, though they'll carry you all the same." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "The riders don't like your smell, Forsaken, but they've carried worse, and they'll carry you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gorrik, wind rider master of Kargath. From here the riders go north to Hammerfall and the Undercity and south to Stonard, Grom'gol and Booty Bay, so pick one and stop wasting my shade." },
        { id = "h_noon", when = { timeOfDay = "day" },
          text = "Midday's the worst of it, because the rocks are hot enough to cook on and the riders won't leave the shade. You'll fly when they're ready, not before." },
      },
      again = {
        { id = "h_again", text = "Anything else? The riders are waiting." },
        { id = "h_again2", text = "Ask fast, before that rider bites somebody." },
      },
      choices = {
        { text = "How do the riders take the heat?", next = "heat" },
        { text = "Which route is the hardest?", next = "routes" },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Not today.", next = "END" },
      },
    },
    heat = {
      lines = {
        { id = "he_default", text = "Badly, and they let me know it by biting. They were raised in the Barrens, where the heat's dry and honest, and out here it comes up off the stone and cooks them from below." },
      },
      choices = {
        { text = "Can't you shelter them better?", next = "heat_shelter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heat_shelter = {
      lines = {
        { id = "hs_default", text = "With what, the Warlord's tower? I've asked, and he laughed so loud the riders scattered. So I soak blankets at the trough and throw them over the beasts, and I keep my fingers clear." },
      },
      choices = { { text = "A good master. Something else.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    routes = {
      lines = {
        { id = "ro_default", text = "Stonard, because the riders have to cross the Burning Steppes, and the smoke off that country chokes them. They come down in the swamp gasping, and I hear about it from Breyk for a week." },
        { id = "ro_young", when = { maxLevel = 40 },
          text = "Stonard, through the smoke of the Burning Steppes, and if you go down anywhere along that route, you won't come back up. Stay in the saddle, whatever you see below." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I raised wind riders in the Barrens before the Warchief sent me here. I miss the Barrens, and so do they." } },
    advice = { { id = "tp_ad", text = "Never stand behind a wind rider, and never feed one from your hand. You'll want your fingers later." } },
    _none = { { id = "tp_none", text = "Ask somebody on the ground, because I only know what's under the clouds." } },
  },
}

P:NPC {
  key = "grawl", id = TODO_NPC("Grawl"), name = "Grawl",
  bible = "bibles/badlands.md", role = "vendor", tier = "service",
  communities = { "kargath" }, temper = { "gruff" }, values = { "practical" },
  notices = { "weary", "level" },

  impression = {
    first = "Grawl sells general goods at Kargath and treats every waterskin like it's the last one in the Badlands. He's a plain, gruff orc who measures everything in how long it keeps a grunt alive.",
    third = "{name} bought supplies from Grawl, who sells general goods at Kargath.",
  },

  greetings = {
    { id = "g_default", text = "Waterskins, bandages, food that won't spoil in the heat. That's what you need, so buy it." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more water? Good, because the ones who don't come back for water don't come back at all." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like you went out without enough water. I told you, didn't I? Or I told someone like you." },
    { id = "n_young", cat = "level", when = { maxLevel = 38 },
      text = "First time in the Badlands? Buy twice the water you think you need, and don't argue with me about it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Grawl, general goods. Everything that comes into Kargath comes over the Searing Gorge road or on a wind rider's back, so I don't waste it, and I'd rather you didn't either." },
      },
      again = {
        { id = "h_again", text = "What else? I've got stock to count." },
        { id = "h_again2", text = "Still here? Then buy something, or ask something." },
      },
      choices = {
        { text = "I need gear that holds up against Dark Iron hammers.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "How do you keep supplies out here?", next = "supplies" },
        { text = "What sells best in Kargath?", next = "sells" },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Nothing today.", next = "END" },
      },
    },
    supplies = {
      lines = {
        { id = "su_default", text = "Badly, and that's the truth. The coyotes get into the grain, the heat spoils the meat, and Neeka's grunts drink the water faster than the riders can bring it." },
      },
      choices = {
        { text = "The coyotes?", next = "supplies_coyotes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies_coyotes = {
      lines = {
        { id = "sc_default", text = "They come over the wall at night and take a sack each, like they're paying a visit to market. Neeka's been hunting them, or wants somebody to, which is the same thing to a scout." },
        { id = "sc_done", when = { questDone = TODO_QUEST("Coyote Thieves") },
          text = "Not since you went after them. I've had full sacks for a week, and I've stopped sleeping on the grain pile to guard it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Then you need more plate and less hope, warrior. I sell plenty of plate, and the advice comes free: keep your shield up and your helmet on." } },
      choices = {
        { text = "I'll take the plate, and the advice.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll buy the plate and keep my own counsel.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    sells = {
      lines = {
        { id = "se_default", text = "Water, then bandages, then more water. The grunts who think they don't need it learn on their first patrol to the Gorge, and the ones who don't learn don't come back to buy anything." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I sold goods in Orgrimmar until the Warchief needed someone out here who wouldn't waste anything. So here I am." } },
    advice = { { id = "tp_ad", text = "Buy water. Then buy more water. Then come back and buy more." } },
    _none = { { id = "tp_none", text = "I sell goods, I don't sell answers. Ask Neeka; she knows everything out there." } },
  },
}
