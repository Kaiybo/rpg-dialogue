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
    { id = "g_default", text = "You walked in from the west, and you didn't look behind you once. An orc who forgets the back trail dies with an arrow in it, so remember that next time." },
    { id = "g_back", when = { metBefore = true }, text = "Still breathing, I see, so the Badlands haven't eaten you yet. Give them time, {class}; this rock is patient, and it is hungry." },
    { id = "g_coyotes", when = { questActive = TODO_QUEST("Coyote Thieves") }, text = "The coyotes were at the sacks again last night, so I hope you've brought me jaws." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and you still walked in without looking behind you. Some things don't change, I suppose." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear somebody caught you in a lie here in Kargath. Out in the Badlands people remember the liars longer than the dead, so watch yourself." },
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
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Among my scouts, no, because you're a lantern in a tin can. On the road, though, when the Blackrock come down in force, a Forsaken who heals and doesn't die easily is worth three of my best, and I'll admit that to nobody but you." } },
      choices = {
        { text = "I'll hold the road wherever you need me, Neeka.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll fight how I please, not where you send me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The ones the ogres have taken, mostly, out past Dustwind Gulch, and the Dark Iron camps near Angor. My scouts can find them, but a scout who fights is a scout I have to replace, so I'd rather send someone built for it." } },
      choices = {
        { text = "Send me where you need me, Neeka. I'll follow the plan.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Point me at the ogres, and I'll decide how to clear them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Neeka.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It might, if it doesn't mind the rocks, though the coyotes out here will think it's one of theirs and come sniffing. Run it down the gullies toward the Gorge and back, and if you beat my best scout, I'll never let her hear the end of it." } },
      choices = {
        { text = "I'll run your routes and report back to you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I scout my own way, Neeka, not by your routes.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Basilisks in the south, Dustbelcher ogres in the hills, and black dragons circling Lethlor Ravine when they're bored. The beasts I can read, but the dragons answer to nobody I'd care to meet." } },
      choices = {
        { text = "If it comes to dragons, meet them in the open.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Keep to the gullies and let the dragons be.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "On the ridge above Lethlor Ravine, watching for the whelps while my scouts work below, because a fireball reaches farther than an arrow. Don't stand on the skyline, though, or the dragons will see you before you see them." } },
      choices = {
        { text = "Give me a post and I'll hold it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll roam where I'm needed, not where I'm posted.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Look at the dust before you look at the ridge, because coyotes leave tracks and Dark Irons leave boot nails, and both tell you when they passed. Hiding keeps you alive, but reading keeps the whole camp alive, and that's the difference between a thief and a scout." } },
      choices = {
        { text = "Then I'll be a scout, for Kargath's sake.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Hiding keeps me alive. The camp can read its own dust.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Neeka.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I've thought about it, and then I've thought about explaining a burned storehouse to Goretooth, and I stopped thinking about it. Coyotes I can shoot, but an imp that gets bored in the night is a problem I don't know how to track." } },
      choices = {
        { text = "Use what works. A few burned sacks are worth it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "You're right. A guard you can't trust is no guard.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Your imp's fire would scare the coyotes off the grain sacks, I suppose, if it didn't burn the sacks first." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. You'll move quieter than my scouts, but can you read the ground, or do you only know how to hide on it?" },
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman. You can tell me which way the wind's turning before I see the dust, and that alone beats half my scouts, who couldn't smell rain in a flood." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid. You'll be useful, then, if you can run as a cat, because the coyotes out here are faster than any orc I've ever trained." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest, out in the dust. Whatever you pray to, ask it for water first, because the Badlands care nothing for anyone's prayers." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage. Keep your robes out of the gullies, because the thorns out here shred cloth and the basilisks love an easy target." },
        { id = "h_default", key = true,
          text = "Neeka Bloodscar, head scout of Kargath, and I earned the scar before I earned the name. I know every gully between here and the Gorge, and I can tell you which of them you'll die in, if you'd like to know before you go." },
        { id = "h_from_helgrum", tags = { "news" }, when = { questActive = TODO_QUEST("Neeka Bloodscar") },
          text = "Helgrum sent you, did he? He'd have come himself if he could find his way through the Badlands without running in circles, so sit, and I'll write him something worth the trip back." },
        { id = "h_report", when = { questActive = TODO_QUEST("Report to Helgrum") },
          text = "You've got my report, so why are you still standing in my camp? Stonard is south, and Helgrum is waiting, impatiently, as always." },
        { id = "h_report_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Report to Helgrum"), days = 5 } },
          text = "So the report reached Stonard, and you with it. That's one outrunner who made it, which is more than I could say last season." },
        { id = "h_coyotes_done", when = { questDone = TODO_QUEST("Coyote Thieves") },
          text = "Not a coyote has been near the sacks since you went hunting, and the grunts are eating whole rations again. You know this country now, whether you like it or not." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. You'll be no use as a scout in all that iron, but the gullies need clearing as well as watching, and I can always use a strong arm." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin. You'll not sneak up on anything in that plate, and the glow won't help either, so stay off my ridges." },
      },
      again = {
        { id = "h_again", text = "Something else? Ask it quickly, because the light's going and I scout at dusk." },
        { id = "h_again2", text = "Go on, then. I'm listening, and I'm watching the ridge while I do it." },
        { id = "h_again3", text = "More questions? You'd make a poor scout, but a decent clerk, and the Horde needs both, I suppose." },
      },
      choices = {
        { text = "What else stalks these gullies, Neeka?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Could my ghost wolf keep pace with your scouts, Neeka?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Where would a spellcaster be most use to your scouts, Neeka?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "A head scout must have a lot of ground to watch.", next = "scouting" },
        { text = "Something's stealing your food?", next = "coyotes" },
        { text = "Helgrum in Stonard speaks well of you.", next = "helgrum" },
        { text = "I'd guess the ogres are the worst danger out here.", next = "danger" },
        { text = "A hunter could help you track, Neeka.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "My people were runners on the plains of Mulgore.", next = "k_tauren", when = { race = "Tauren" } },
        { text = "Teach me to read the ground, Neeka.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Could my imp guard your grain sacks?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Which gullies need clearing, Neeka?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Is there a place for a paladin among your scouts, Neeka?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll keep my eyes open.", next = "END", fx = { affinity = 1, standing = { kargath = 1 } } },
      },
    },

    scouting = {
      lines = {
        { id = "sc_default", text = "I watch the dwarves at their digs, the Dark Irons in the Gorge, and the ogres who don't care who wins. Then I write it down and send it south to Stonard, because Thrall wants both outposts to know what the other sees." },
      },
      choices = {
        { text = "Orgrimmar seems the likelier place to send it.", next = "scouting_south" },
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
    thrall = { { id = "tp_thrall", text = "The Warchief sent me here to scout, and I've done it well. He doesn't need to know more than that." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The Blackrock in the Spire watch the road as closely as we watch them. I've seen their scouts on the ridges." } },
    centaur = { { id = "tp_centaur", text = "The centaur in the Barrens taught me to track, because they're the only thing faster than me. I learned the hard way." } },
    _none = { { id = "tp_none", text = "If it isn't on my maps, then it isn't worth knowing, or some orc has already killed it." } },
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
    { id = "g_away", when = { away = 14 }, text = "You be back after {away} away, mon! Jarkal got jars piled to the roof, waitin' for somebody with strong arms." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talk somebody into somethin' they didn't want, mon. Jarkal be impressed, but don't try it on me, because I got the green jar." },
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
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I sell to anybody with coin, mon, but you be a puzzle to my trade. My healing draughts be made for the living, and the Light already be doing that work for you, so maybe you want something stronger, or maybe you just want somebody to be curious with you." } },
      choices = {
        { text = "The Light is enough. Keep your draughts for the grunts.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A potion's surer than any prayer. Sell me your best.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Buzzard gizzards, coyote fangs, and whatever a basilisk be keeping in its belly, mon. The beasts of the Badlands be eating stone and dust their whole lives, and that make their insides very potent, if you don't mind the smell." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} be sniffing at my jars, mon, so tell it no, because what be in those jars would turn a good beast's stomach inside out." },
      },
      choices = {
        { text = "I'll take only what you need, and leave the rest be.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll take every gizzard I find. Waste nothing, spare nothing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Jarkal.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Because what grows here be tough, and tough plants make strong potions, mon. I take only what I need, mostly, but the Expeditionary Force be needing a great deal." } },
      choices = {
        { text = "The Force's needs come first. Gather what it takes.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Take only what the land can spare.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Out in the Badlands the scorpids carry a venom that drop a kodo, and the firebloom sap be burning in a wound for days. Jarkal be telling you only because you ask nice, so don't you go poisoning nobody in this inn, or Shul'kar be blaming me." } },
      choices = {
        { text = "My blades are for the Horde's enemies, nobody else.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I poison whoever pays me, Jarkal. That's the trade.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's leave that there.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Uneasy? No, mon, but the loa have opinions about what you be keeping in that bag, and Jarkal have to live with the loa long after you leave. A soul in a stone be a soul that never reach the spirits, and that be a sad thing, even for an enemy." } },
      choices = {
        { text = "My enemies' souls serve me better than the spirits.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I take only what I must, Jarkal.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Better, maybe, because a potion don't ask what you done to get hurt, mon, and it work the same for the faithful and the faithless. Your prayers be fine things, but Jarkal see plenty of grunts at Kargath who'd rather drink their healing than kneel for it." } },
      choices = {
        { text = "Prayer gives more than mending, Jarkal. It gives purpose.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A potion that works beats a sermon, Jarkal.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The shards hold a little of the earth's anger, mon, and somebody who know what he doing can grind it into something useful, so Jarkal need them for his own brews first. You bring Jarkal his share from the Badlands, and maybe he show you which shards be worth keeping." } },
      choices = {
        { text = "Fair trade, Jarkal. Your share first, then mine.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll keep the best shards for myself, Jarkal.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_ulda = {
      big = true,
      lines = { { id = "xcl_ulda_default", text = "Then you be seeing the dwarves' lost temple and the stone things that walk in it, and you be coming back with your head on. The Explorers' League be wanting that place badly, and Jarkal says better the Horde be knowing what's down there than the dwarves be keeping it secret." } },
      choices = {
        { text = "Old places belong to nobody. Leave Uldaman to the dead.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The Horde should take what's down there before the dwarves do.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "What do those caps do for your potions?", next = "xcl_ulda2" },
      },
    },
    xcl_ulda2 = {
      lines = { { id = "xcl_ulda2_default", text = "They be holding strength in the dark, mon, the way a root be holding water. Jarkal grinds them fine and mixes them with a little firebloom, and the potion keeps a warrior standing when he should be falling." } },
      choices = {
        { text = "Then I'll keep an eye out for the caps.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, mon! Jarkal sell good reagents to your kind, though the best thing in this land for spells be the shards off the rock elementals, and Jarkal want those too." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Jarkal be selling to your kind too, mon, and the potions do half your mending for you, so maybe we both be healers in our way." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock! Jarkal be selling to your kind too, mon, but the shards you carry, those Jarkal don't touch, because souls be bad for the stomach." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue! You be wanting poisons, I think, and Jarkal don't sell poison, mon, but Jarkal know where the reagents grow, and that be nearly the same thing." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! You be knowing your herbs, I think, so tell me why nothing out here grows but firebloom and spite." },
        { id = "h_cl_ulda", tags = { "news" }, when = { cleared = "Uldaman", faction = "Horde" },
          text = "You be going all the way to the bottom of Uldaman, mon, past the stone king himself? Then you be knowing where the best magenta caps grow, and Jarkal be very jealous." },
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
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter! Jarkal be needing gizzards and fangs, mon, and you look like you know which end of a buzzard be which." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "Eh, a dead mon who be shinin' like the sun! I never think I see the Light walk into Kargath wearing a Forsaken face." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Jarkal be listening while he stirs." },
        { id = "h_again2", text = "Ask, ask. The potion don't mind waiting, but the customers do." },
      },
      choices = {
        { text = "Why gather in a land this poor, Jarkal?", next = "druid_q", when = { class = "DRUID" } },
        { text = "The Badlands are hard country, and a good place for a warrior.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "What do you need from the Badlands?", next = "reagents" },
        { text = "What's this about a necklace?", next = "necklace" },
        { text = "Why does a Darkspear live above an orc inn?", next = "upstairs" },
        { text = "I know my way around an alchemy table.", next = "k_alchemy", when = { profession = "Alchemy" } },
        { text = "The loa would frown on your bargaining, cousin.", next = "k_troll", when = { race = "Troll" } },
        { text = "Where do the best poison reagents grow, Jarkal?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "My soul shards seem to make you uneasy, Jarkal.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Which beasts do you need for your potions, Jarkal?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I doubt a potion mends as well as a prayer.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What does a mage want with rock elemental shards, Jarkal?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Would you sell potions to a Forsaken paladin, Jarkal?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I've been to the bottom of Uldaman, Jarkal.", next = "xcl_ulda", when = { cleared = "Uldaman", faction = "Horde" } },
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
      choices = { { text = "Huh. Something else, then.", next = "BACK", fx = { trait = { curious = 1 } } } },
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
        { text = "Shul'kar can't be fond of that smell.", next = "upstairs_smell" },
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
    voljin = { { id = "tp_voljin", text = "Vol'jin be the chief of the Darkspear, mon, and Jarkal be proud to call him chief. He keep the trolls out of the old madness." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear be the best of the trolls, mon, because we remember loyalty. Jarkal never forget it." } },
    echo_isles = { { id = "tp_echo_isles", text = "The Echo Isles be home, mon, before the sea witch drove us out. Jarkal hope to see them again someday." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The Gurubashi in Zul'Gurub be calling on Hakkar, mon, and that be bad for every troll. Jarkal would like to sell them a potion for stupidity." } },
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
    { id = "g_default", text = "If you're flying, say where, and if you're not, stand out of the shade, because the riders want it and they don't care whose blood you carry." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and the riders remember your smell. Don't take that as a compliment, {class}; they remember a dead coyote's smell too." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren! Brace yourself on the saddle, because the riders grumble under anybody heavy, though they'll carry you all the same." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "The riders don't like your smell, Forsaken, but they've carried worse, and they'll carry you." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They'll carry you, because I tell them to, and they'll complain the whole way to Hammerfall. Beasts know what's natural and what isn't, and you're something they haven't got a word for yet, which makes two of us." } },
      choices = {
        { text = "They'll fly because they're told to, like any soldier.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll coax them, not command them. Beasts aren't soldiers.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every day, back and forth to the Gorge and Hammerfall, and every one of them climbs off complaining about his legs. A wind rider doesn't care how fierce you are, only how heavy, and it'll let you know the moment you're too much." } },
      choices = {
        { text = "Then I'll respect the rider and keep my kit light.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A rider that can't carry a warrior isn't much of a mount.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Gorrik.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Once, and only because the wolf bit first, and neither has forgiven the other since. Riders are proud creatures, and a wind rider will let you fly it, but it will never let you forget who's carrying whom." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} in the sun, not the shade. My riders don't share shade, and in the Badlands, shade's worth fighting over." },
      },
      choices = {
        { text = "Proud beasts deserve respect. I'll keep mine out of their way.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My beast goes where it likes. Your riders can learn manners.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Gorrik.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Ask, and if they listen, I'll owe you, though I've never known the Badlands to do anyone a kindness. The wind comes off the Searing Gorge hot enough to singe a rider's mane, and my beasts sulk in the shade every afternoon until it turns." } },
      choices = {
        { text = "I'll ask humbly. The spirits answer respect, not demands.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll command it cooler, and the spirits can grumble.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = {
        { id = "xhcast_lock", when = { class = "WARLOCK" }, text = "They mind the smell of it, and a demon's smell they hate worst of all, so your imp walks or it waits here. They'll carry you, though, because I tell them to." },
        { id = "xhcast_default", text = "They mind the smell of it, whatever it is you lot carry about, burnt hair or graveyard or worse. They'll carry you, though, because I tell them to, and they listen to me better than the grunts do." },
      },
      choices = {
        { text = "I'll wash before I fly. It's only fair to the riders.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They'll carry me as I am. That's their job.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Now that's the first good idea anyone's had in Kargath all summer. Mind you, the last mage who tried it got sneezed on by a rider with ice in its nose, so aim for the shade and not the beast." } },
      choices = {
        { text = "I'll cool the shade, then. Your riders deserve it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Wind riders can bear the heat. Toughen them up.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Gorrik.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Twice this season, and both times the rider bucked them off over the Searing Gorge road and flew on alone. The goblins say it's the cheapest way to Kargath, and I tell them it's the quickest way into a ravine." } },
      choices = {
        { text = "Pay the fare. A free ride isn't worth the fall.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd have stayed on. Fares are for the slow-handed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because one moment they're carrying a tauren and the next they're carrying a bear, and the weight's all wrong, and a wind rider remembers that sort of thing. They're proud beasts, and they don't like surprises any more than I do." } },
      choices = {
        { text = "Respect the riders. They're not pack animals.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A beast does what it's told, proud or not.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. Don't try stowing away on a rider; they know every weight on their backs, and they've thrown off better sneaks than you." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You could teleport home and save my riders the trouble, but they need the work, so I'll not complain." },
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman. If you can talk the air into blowing cooler, my riders would love you forever, and I might too." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. The riders don't care who you pray to, so long as you don't do it loudly near the pen." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock. Leave your demon outside the pen, because the riders would sooner bite it than fly near it, and so would I." },
        { id = "h_default", key = true,
          text = "Gorrik, wind rider master of Kargath, and I've flown for the Horde since the Warchief first tamed these beasts. From here the riders go north to Hammerfall and the Undercity and south to Stonard, Grom'gol and Booty Bay, so pick one and stop wasting my shade." },
        { id = "h_noon", when = { timeOfDay = "day" },
          text = "Midday's the worst of it, because the rocks are hot enough to cook on and the riders won't leave the shade. You'll fly when they're ready, not before." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. Your armour weighs as much as you do, so the riders will grumble, and so will I, and then we'll fly." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. Mind your beasts don't wander into the riders' shade, because the riders are hot and cross, and they bite." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. Don't change shape on my riders' backs, because the last one who did nearly lost a claw, and I nearly lost my temper." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken in shining plate. My wind riders don't like the smell of the dead or the shine of the Light, so you've managed to bother them twice." },
      },
      again = {
        { id = "h_again", text = "Anything else? The riders are waiting." },
        { id = "h_again2", text = "Ask fast, before that rider bites somebody." },
      },
      choices = {
        { text = "Why do your riders dislike a druid's changes?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Shall I ask the air spirits for a cooler wind, Gorrik?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do your riders mind carrying spellcasters, Gorrik?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "How do the riders take the heat?", next = "heat" },
        { text = "Some of these routes must be harder than others.", next = "routes" },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "A little frost might keep your riders from cooking, Gorrik.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Has anyone really tried to stow away?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do your wind riders carry many warriors?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do your riders really bite hunters' beasts?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Will your riders carry a Forsaken paladin, Gorrik?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
    },
    heat = {
      lines = {
        { id = "he_default", text = "Badly, and they let me know it by biting. They were raised in the Barrens, where the heat's dry and honest, and out here it comes up off the stone and cooks them from below." },
      },
      choices = {
        { text = "They need better shelter than this.", next = "heat_shelter" },
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
    background = { { id = "tp_ba", text = "I raised wind riders in the Barrens before the Warchief sent me here, and an orc goes where Thrall points. I miss the Barrens, though, and so do they." } },
    advice = { { id = "tp_ad", text = "Never stand behind a wind rider, and never feed one from your hand. You'll want your fingers later." } },
    thrall = { { id = "tp_thrall", text = "The Warchief built the wind rider routes, and I keep them running. My beasts hate the heat, and I hate it more." } },
    centaur = { { id = "tp_centaur", text = "The centaur in the Barrens shoot at my beasts for sport, and I don't forgive them for it." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's hotter than the Badlands, they say, and I'd like to see it before I believe it." } },
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
    { id = "g_default", text = "Waterskins, bandages and food that won't spoil in the heat are what a warrior needs out here, so buy them. The jerky's coyote, but nobody's died of it yet that I know of." },
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
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Less than most, which suits me. You don't eat much, you don't drink much and you heal yourself, so you're the cheapest soldier in Kargath to keep, and I like you better for it than I like the Light." } },
      choices = {
        { text = "I'll take only what I need. Supplies belong to the outpost.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take what I please. I've earned it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because a buzzard's worth nothing but a gizzard for Jarkal, and an arrow's worth a coyote that's been at the grain sacks. Out here every shot should feed somebody or save something, or it shouldn't be fired at all." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} eats, I suppose. Then hunt its meat yourself, because there's nothing on these shelves I can spare for a beast." },
      },
      choices = {
        { text = "Every arrow should count. I'll hunt only what Kargath needs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll shoot what I please. Arrows can be recovered or replaced.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Grawl.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If you can, you'll save me a fortune, because every drop in Kargath comes up the Searing Gorge road or down on a wind rider. The last shaman through here said the earth was angry and dry, and nothing I've seen since has proved him wrong." } },
      choices = {
        { text = "Then whatever I find, I'll share with Kargath.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "What the spirits give me, I'll keep for myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Water, same as everybody, and reagents I have to bring up from Orgrimmar at twice the trouble. Your lot burn through candles and dust faster than grunts burn through bandages, and none of you ever plans ahead." } },
      choices = {
        { text = "I'll take only what I need. Others need it more.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll buy what I like. That's what your stock is for.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Conjure what you like, but a grunt on a long patrol is a long way from your spells, and he needs a skin that's still full at the end of it. Keep yourself watered and leave mine on the shelf for those who can't, and we'll get along." } },
      choices = {
        { text = "I'll share what I conjure with the patrols.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My water's mine. The grunts can pay you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Grawl.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Less than you'd think, because a thief in Kargath has nowhere to run but the Badlands, and the Badlands are worse than me. The last grunt who tried it came back on his own after two days and paid double, just for a drink." } },
      choices = {
        { text = "Stealing water out here is a coward's crime.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A thief who survives the Badlands earned that water.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Another question, then.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "There's water under Kargath if you dig far enough, and the stubborn little shrubs on the north ridges come back every spring no matter what, so I'd say yes, a little. I don't tell the soldiers, because they'd only trample them." } },
      choices = {
        { text = "Protect those shrubs. Hope starts small.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Shrubs don't win wars. Watch the Dark Irons instead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. I count every waterskin on that shelf twice, so if one goes missing I'll know, and I'll know who was standing here." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You make water out of nothing, which is either a blessing on Kargath or the end of my trade, and I haven't decided which." },
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman. Your kind travel light, I'll give you that, because a totem doesn't need feeding and a spirit doesn't drink my water." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. Pray for rain if you like, but buy water while you wait, because I've never seen a prayer fill a waterskin." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock. Your demon doesn't eat my food, I hope, because I count every ration and I'll know." },
        { id = "h_default", key = true,
          text = "I'm Grawl, and I keep the goods. Everything that comes into Kargath comes over the Searing Gorge road or on a wind rider's back, and I ate camp gruel too long to waste a crumb of it, so I'd rather you didn't either." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. You'll want arrows, and I've a crate, but the next one won't come over the Gorge road for weeks, so don't waste them on buzzards." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, and probably here to tell me the land's suffering. I know it's suffering, I live in it, so either buy something or tell me something I don't know." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one with the Light on you. I don't care what you pray to, as long as you don't waste my water, though I suppose you don't drink much of it." },
      },
      again = {
        { id = "h_again", text = "What else? I've got stock to count." },
        { id = "h_again2", text = "Still here? Then buy something, or ask something." },
      },
      choices = {
        { text = "Is there any good left in this land?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I need gear that holds up against Dark Iron hammers.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Could a shaman find water in these Badlands, Grawl?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do spellcasters buy from you out here, Grawl?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "How do you keep supplies out here?", next = "supplies" },
        { text = "I'd guess water sells best out here.", next = "sells" },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "I could conjure water for your grunts, Grawl.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Your stores must go missing now and then.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why shouldn't I waste arrows on buzzards, Grawl?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Does a Forsaken paladin need your supplies, Grawl?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
    background = { { id = "tp_ba", text = "I sold goods in Orgrimmar until the Warchief needed someone out here who wouldn't waste anything. An orc who's been fed through a fence learns that lesson for life, so here I am." } },
    advice = { { id = "tp_ad", text = "Buy water, then buy more water, and then come back and buy more, because the Badlands kill more grunts than the Dark Irons do." } },
    _none = { { id = "tp_none", text = "I sell goods, not answers. Ask Neeka, because she knows everything out there that bleeds." } },
    thrall = { { id = "tp_thrall", text = "The Warchief needs somebody out here who won't waste anything, so he sent me. I don't waste anything." } },
    second_war = { { id = "tp_second_war", text = "I sold supplies in the Second War, and the grunts wasted everything then. Not anymore." } },
    internment = { { id = "tp_internment", text = "The camps taught me what it means to have nothing. Now I make sure the grunts have everything." } },
  },
}
