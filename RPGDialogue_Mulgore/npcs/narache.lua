-- Camp Narache: the Hawkwind tribe's camp, still grieving the Greatmother. Voice: bibles/mulgore.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hawkwind", id = TODO_NPC("Chief Hawkwind"), name = "Chief Hawkwind",
  bible = "bibles/mulgore.md", role = "noble", tier = "major",
  communities = { "narache" }, temper = { "resolute" }, values = { "dutiful", "protective" },
  notices = { "greenness", "race", "origin" },
  impression = {
    first = "He mourns his mother, the Greatmother, by standing straighter.",
    third = "{name} met Chief Hawkwind at Camp Narache, who leads the young of his tribe through their first rites.",
  },

  greetings = {
    { id = "g_camp", text = "Welcome to the Hawkwind's fire. Sit if you're tired, or stand if you're ready to work." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned to the fire, and the tribe notices, as the herd notices one of its own coming home." },
    { id = "g_away", when = { away = 14 }, text = "You've been away from the fire {away}, and the young ones asked whether you'd return. I told them you would, and here you stand." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You came to my fire young and untried, and now you stand straighter than many of my own hunters. The Greatmother would have been glad to see it." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The camp tells me of the work you've done for us. You honour the Hawkwind's fire, and we will remember it." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I'm told one of your words in this camp was found false. The young learn from what they see, so I'd ask you to show them better." },
    { id = "g_narache", when = { origin = "tauren_narache_hunter" }, text = "Your mother's child, come back to the fire. She brought in more plainstriders off Red Cloud Mesa than any hunter of her season, and she thanked the Earth Mother for every one, loud enough that the whole camp heard." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 3 },
      text = "So young, and already sent to me. Good. The Earth Mother tests early those she means to keep." },
    { id = "n_walk", cat = "origin", when = { origin = "tauren_long_migration" },
      text = "You were a calf on the long walk, weren't you? I can always tell, because those who crossed the Barrens with the centaur behind them still look over their shoulder before they sit down." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the plains. Every one of you who stands up makes the Greatmother's absence lighter." },
  },

  start = "hello",
  nodes = {
    op_grimtotem = {
      lines = {
        { id = "opg_q", text = "My braves argue about them at the fire every night now, and I let them, because a chief should know what his young think. What do you think of the Grimtotem, traveller?" },
      },
      choices = {
        { text = "They're traitors to Cairne and to every tauren. They should be broken.", next = "op_grimtotem_r1", fx = { affinity = 1, align = { light = -1 }, trait = { stern = 1 }, opinion = { grimtotem = "lost" } } },
        { text = "Some of them could still come home, if we gave them the chance.", next = "op_grimtotem_r2", fx = { affinity = 1, align = { light = 1 }, trait = { kind = 1 }, opinion = { grimtotem = "redeemable" } } },
        { text = "They want what's ours. That's all I need to know.", next = "op_grimtotem_r3", fx = { trait = { practical = 1 }, opinion = { grimtotem = "distrust" } } },
        { text = "I'm Grimtotem-born, Chief, and I want them changed, not burned.", next = "op_grimtotem_r4", fx = { affinity = 2, opinion = { grimtotem = "redeemable" } }, when = { origin = "tauren_grimtotem_born" } },
        { text = "I don't know enough of them to judge.", next = "BACK" },
      },
    },
    op_grimtotem_r1 = {
      lines = {
        { id = "op_grimtotem_r1", text = "Strong words, and I'll not punish a brave for saying them. But remember they are still tauren, and the Earth Mother counts their dead as she counts ours." },
      },
      choices = {
        { text = "Something else, Chief.", next = "BACK" },
      },
    },
    op_grimtotem_r2 = {
      lines = {
        { id = "op_grimtotem_r2", text = "The Greatmother believed that, and she'd have been glad to hear you say it. I'm less sure, but I'll keep the fire lit for any who try." },
      },
      choices = {
        { text = "Something else, Chief.", next = "BACK" },
      },
    },
    op_grimtotem_r3 = {
      lines = {
        { id = "op_grimtotem_r3", text = "That's how a hunter thinks, and it'll keep you alive on Red Cloud Mesa. A chief has to think further, but it'll do for now." },
      },
      choices = {
        { text = "Something else, Chief.", next = "BACK" },
      },
    },
    op_grimtotem_r4 = {
      lines = {
        { id = "op_grimtotem_r4", text = "Then you'll be the proof of it, young one, and my braves will watch you closer than they'd ever admit." },
      },
      choices = {
        { text = "Something else, Chief.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "She would have been curious, and not afraid. She taught that every creature walks the path the Earth Mother gave it, even those whose path was broken. Yours was broken by death, and still you walk it, straighter than some of the living." } },
      choices = {
        { text = "Then I'll walk it straight, Chief, for her sake.", next = "BACK", reply = "Then my mother would have been glad to meet you. Walk it straight, and Narache will know you for a friend.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "My path is my own, Chief, not the Earth Mother's.", next = "BACK", reply = "Perhaps it is, and I will not argue with the dead about their roads. Still, she gave every road its grass, even the ones that wander far from her.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "My people have sung her to the Earth Mother already, but a prayer from a stranger would honour her too, because she always said the Horde would teach us new ways of honouring the dead. Say it standing straight, and she will hear it." } },
      choices = {
        { text = "I'll say it gladly, Chief, standing straight.", next = "BACK", reply = "Thank you, stranger, and she thanks you too, I think. The Horde has already taught us one new way, and it sounds like yours.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your rites are enough. She has no need of mine.", next = "BACK", reply = "Then I'll not press you, and she'll not miss it. Our songs carried her well enough, though I would have welcomed yours.", fx = { align = { light = -1 } } },
        { text = "Something else, Chief.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then they'll know how my mother felt when they came for her. I want them to suffer, I'll not deny it, but a tauren grieves standing up, so do your work in Brambleblade Ravine and let the camp see you come back with your head high." },
      },
      choices = {
        { text = "I'll come back with my head high, Chief.", next = "BACK", reply = "Then the camp will see it, and they'll stand a little taller for it. Go, and come back to us whole.", fx = { align = { honor = 1 } } },
        { text = "Grief can wait. The quilboar die first, unseen.", next = "BACK", reply = "Grief doesn't wait, I've learned, it only hides. Kill them unseen if you must, but come back and stand where my people can see you.", fx = { align = { honor = -1 } } },
        { text = "What was the Greatmother like?", next = "greatmother" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Nothing would have saved her that night but more spears and better luck. The arcane is a strange power to my people, and I'll not curse it, but I'll not wish it here either, because Narache is a place for the young to learn the old ways first." },
      },
      choices = {
        { text = "The old ways first. I understand, Chief.", next = "BACK", reply = "Thank you, for that is all I ask. When they're grown, they may learn whatever they like, but they start with the earth beneath them.", fx = { align = { order = 1 } } },
        { text = "Your young would be safer if they learned new ways.", next = "BACK", reply = "Maybe they would, and maybe they'll learn them in time. But Narache is where they find their feet, and I want their feet to know the grass before anything else.", fx = { align = { order = -1 } } },
        { text = "Will you tell me about the Greatmother?", next = "greatmother" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I'll trust what you do, not what you carry, because my mother taught me that much before the Bristleback took her. The orcs say their warlocks once nearly destroyed them, so serve the Horde and I'll remember it, and if you serve something else, I'll remember that too." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "I'll trust what you do, not what you carry, though I'll admit what you carry is staring at me, and I don't like it. The orcs say their warlocks once nearly destroyed them, so serve the Horde and I'll remember it, and keep that thing from wandering among my people." },
      },
      choices = {
        { text = "I serve the Horde, Chief, and I'll show it.", next = "BACK", reply = "Then show it, and I'll be the first to say so at the fire. The Bristleback camps to the south are a fair place to begin.", fx = { align = { order = 1 } } },
        { text = "I serve my own path. Judge me by my deeds.", next = "BACK", reply = "Then that is how I will judge you, and the camp will too. Walk carefully, though, because a path of your own is a lonely one out here.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "Another young one with your face came through Camp Narache, the one called {alt}. Our elders say the spirits send kin along the same trail, and I think they've done it again." },
        { id = "h_alt_higher", tags = { "news" }, when = { alt = { higher = true } },
          text = "I remember {alt} as a youngling chasing plainstriders below the camp, and now I hear that {altclass} spoken of in Thunder Bluff. Walk as far as that one has, and remember the camp that raised you." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. My mother would have wanted to hear your story, and I will listen in her place." },
        { id = "h_default", key = true,
          text = "I am Hawkwind, chief of this camp. The Bristleback took my mother from us, the Greatmother of this tribe, and we mourn her by standing straighter, not by bending." },
        { id = "h_humble", tags = { "news" }, when = { questActive = TODO_QUEST("A Humble Task") },
          text = "A humble task first, for every great hunter's first task was humble. Do it well anyway." },
        { id = "h_rites", when = { questActive = TODO_QUEST("Rites of the Earthmother") },
          text = "The rites of the Earthmother are older than this camp, older than the bluffs. Walk them with respect." },
        { id = "h_strength", when = { questActive = TODO_QUEST("Rite of Strength") },
          text = "The rite of strength asks what you'll do when it hurts. Answer it well." },
        { id = "h_adventurer", when = { questActive = TODO_QUEST("The Adventurer") },
          text = "Before you leave Mulgore, take this bundle to Kaga Wildhoof, camped outside Bloodhoof. She helped us when we needed it. I'd like to repay her." },
        { id = "h_attack", when = { questActive = TODO_QUEST("Attack on Camp Narache") },
          text = "They came to our camp with fire and spears, and now we go to theirs. Make them remember the Hawkwind." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "The spirits have touched you, young one, and I can see it in the way you stand. My mother would have wanted you beside her at the rites." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde at Narache. My mother would have welcomed you, because the Greatmother believed every healer was a gift from the Earth Mother, whatever name they gave it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock in Narache. My mother would have welcomed you, so I will too, but I will be watching you." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Bristleback", min = 30 } }, text = "The braves say the Bristleback have gone quiet in the hills since you went among them. My mother would have been proud of you, and so am I." },
      },
      choices = {
        { text = "Tell me about the Greatmother.", next = "greatmother" },
        { text = "I'm ready for the Rite of Strength, Chief.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Where should a hunter go first, Chief?", next = "hunter", when = { class = "HUNTER" } },
        { text = "The trainer says I'm to be a druid.", next = "druid", when = { race = "Tauren", class = "DRUID" } },
        { text = "I was born Grimtotem, Chief. I chose Bloodhoof.", next = "grimtotem", when = { origin = "tauren_grimtotem_born" } },
        { text = "My mother hunted the mesa for this camp, Chief.", next = "xmother", when = { origin = "tauren_narache_hunter" } },
        { text = "The Greatmother must have walked with the spirits, Chief.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The Bristleback won't see me coming, Chief.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Perhaps the arcane could have saved the Greatmother.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Would you want a prayer said for the Greatmother, Chief?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Will you trust a warlock in your camp, Chief?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What would the Greatmother have made of me, Chief?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll do what's asked.", next = "END", fx = { affinity = 2, standing = { narache = 1 } } },
      },
      again = {
        { id = "h_again", text = "What else? The fire is warm, and I can spare a little of it." },
        { id = "h_again2", text = "Speak, young one. A chief listens before he sends." },
      },
    },
    warrior = {
      big = true,
      lines = { { id = "wa_default", text = "Are you? The rite doesn't ask how hard you hit; it asks whether you'll keep going when the boars hit back. My mother fell to the Bristleback, and this tribe honors her by standing up again each morning; that is the strength the rite looks for." } },
      choices = {
        { text = "Then I'll stand as she stood.", next = "BACK", reply = "Then she would be proud, and so would I. Go to the ravine, and stand up again each time they knock you down.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'd rather live to fight again than fall like that.", next = "BACK", reply = "Living to fight again is no shame, and she would not want you dead for her sake. But the rite will ask you to stand, and it will not ask twice.", fx = { align = { honor = -1 } } },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "To my son Grull, who leads our hunts, and then out among the plainstriders, because a hunter's first kill should be something that runs. Bring the meat back to the fire, and the tribe will know your name." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "To my son Grull, who leads our hunts, and then out among the plainstriders, because a hunter's first kill should be something that runs. And bring {pet} back to the fire too. The braves will want to see a beast that chose to walk beside one of us." },
      },
      choices = { { text = "I'll go to Grull.", next = "BACK", fx = { affinity = 1, standing = { narache = 1 } } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "Then the Earth Mother has plans for you, and I won't stand in their way. Go to your trainer when you're called, and one day go up to Hamuul on the bluffs, who will teach you what no one at this fire can." } },
      choices = { { text = "I'll make the camp proud.", next = "BACK", fx = { affinity = 2, standing = { narache = 1 } } } },
    },
    grimtotem = {
      lines = { { id = "gt_default", text = "I know. The braves told me before you'd reached the fire. Your birth isn't your fault, and your choice is to your credit, but the Grimtotem don't forgive those who leave them, so watch your back on the bluffs." } },
      choices = {
        { text = "My tribe is the Bloodhoof now.", next = "BACK", reply = "Then you have chosen well, and the Bloodhoof will stand by you. Still, keep watching your back, because the Grimtotem remember.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The Grimtotem aren't all wrong, Chief.", next = "BACK", reply = "Some of what they say rings true, I'll grant, and that is what makes them dangerous. Listen to their words if you must, but watch their spears more closely.", fx = { affinity = -2, align = { order = -1 } } },
      },
    },
    xmother = {
      big = true,
      lines = {
        { id = "xmo_default", text = "She did, and she never once came home without saying the words over what she'd taken, even in the lean years when the braves were too hungry to wait. Some of the young ones skip the thanks now, because the Bristleback keep them in a hurry, so tell me, do you still say them?" },
      },
      choices = {
        { text = "Every time. She'd haunt me if I didn't.", next = "BACK", reply = "Ha, she would, and she'd be right to. Keep saying them, and the young ones will learn by watching you.", fx = { affinity = 3, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "When there's time. A hungry camp can't wait on prayers.", next = "BACK", reply = "I understand it, and I have skipped them myself in hard years. But the hunger passes, and the habit of forgetting stays.", fx = { affinity = -1, align = { light = -1 }, trait = { stern = 1 } } },
        { text = "What would she say about the Bristleback?", next = "xmother_boar" },
      },
    },
    xmother_boar = {
      lines = {
        { id = "xmb_default", text = "That a boar is a boar whether it walks on two legs or four, and that you thank the Earth Mother for neither of those. She was never a gentle woman about the quilboar, and after what they did to the Greatmother, I find I agree with her more every year." },
      },
      choices = {
        { text = "Then I'll hunt them the way she would.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else, Chief.", next = "BACK" },
      },
    },
    greatmother = {
      big = true,
      lines = {
        { id = "gm_default", text = "The Bristleback came into our lands, and she fell before them. Every brave who trains at this camp honors her, and so will you, by doing well." },
      },
      choices = {
        { text = "What do your braves say about the Grimtotem?", next = "op_grimtotem" },
        { text = "She sounds brave.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then let's make them pay.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "She did, and the elements answered her more readily than they answer most elders on the bluffs. When the Bristleback came, she called on the earth against them, and it was not enough, so learn faster than she was given time to." } },
      choices = {
        { text = "I'll learn the rites properly, step by step, as she did.", next = "BACK", reply = "Good, then she'd be proud of you, and so would the elders. Step by step is slower, but it doesn't break when the boars come.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then I'll find my own way to strength, and quicker.", next = "BACK", reply = "Quicker is not always stronger, and she learned that too late. Find your way, but don't skip the steps she was never given time to finish.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Those are good words, and I thank you for them. A chief at a small fire doesn't hear them often, and they warm him all the same." },
        { id = "s2", text = "You speak with respect, and it does you credit. The braves who learn that early are the ones the Earth Mother favors." },
      },
      fail = {
        { id = "f1", text = "I'm an old chief of a small camp, and I know what I'm worth without being told. Keep your praise for the ancestors, who've earned it." },
        { id = "f2", text = "Soft words don't drive the Bristleback from our lands. Show me your worth with your hands, young one." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha, you've some boldness in you, to prod a chief at his own fire. I was the same once, and it served me well against the quilboar." },
        { id = "s2", text = "That's the spirit of a brave who won't be easily turned. I'll not scold you for it, though you'd best not try it on the High Chieftain." },
      },
      fail = {
        { id = "f1", text = "This is the Hawkwind's fire, and those who sit at it speak with respect. I'll ask you once to remember that." },
        { id = "f2", text = "I've buried too many of my own to be amused by a sharp tongue. Go and turn that edge on the Bristleback, where it's needed." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "There's strength in you beyond your seasons, and I'd be a poor chief if I failed to see it. Say what you came to say, and I'll hear it." },
        { id = "s2", text = "I've stood against quilboar war parties, and few of them carried themselves as you do now. Very well, you have my ear." },
      },
      fail = {
        { id = "f1", text = "I've held this camp while the Bristleback raided the plains around it, so hard looks don't move me. Stand easy, young one." },
        { id = "f2", text = "A brave who threatens a chief at his own fire has lost the trail. Go and find it again before you speak to me." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "That's a thing I keep close, and I'll not speak of it to one I've only just met. Prove yourself to this camp first." },
      { id = "gt2", text = "I'll hold my tongue on that for now. When you've done more for Narache, ask me again." },
    },
    knows = {
      { id = "tp_knows", text = "The hunters bring word back to this fire, and some of it is worth hearing. Ask about these, and I'll tell you what the tribe knows." },
    },
    earth_mother = { { id = "tp_earth_mother", text = "My mother is with the Earth Mother now, and I speak to them both when I stand on the hill above Narache. Neither answers, but I feel them listening." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback killed my mother, and they think they can take Narache next. They are wrong, and every brave I send out proves it." } },
    cairne = { { id = "tp_cairne", text = "Cairne sent word from the bluff when he heard of my mother's death, and his words carried me through the first nights. I will never forget that, and I will serve him until I die." } },
    centaur = { { id = "tp_centaur", text = "The centaur raided us when we wandered, and they still raid the Barrens to the east. Mulgore is safe from them, and I mean to keep it that way." } },
    _none = { { id = "tp_none", text = "Ask in Bloodhoof Village. Baine knows the wider world better than an old chief, and may the Earth Mother walk with you there." } },
  },
}

P:NPC {
  key = "grull", id = TODO_NPC("Grull Hawkwind"), name = "Grull Hawkwind",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  communities = { "narache" }, temper = { "fierce" }, values = { "loyal", "brave" },
  notices = { "class" },
  impression = {
    first = "He is fiercely eager, as though the hunt were waiting on him.",
    third = "{name} met Grull Hawkwind, the Chief's son, who leads the hunts of Camp Narache.",
  },

  greetings = {
    { id = "g_hunt", text = "You've come to hunt? Good, because Mulgore is full of things that need hunting, and the Earth Mother feeds those who work for it." },
    { id = "g_back", when = { metBefore = true }, text = "Ready for more? The hunt doesn't rest, and neither should we." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the hunt carried on without you, so you've a lot of catching up to do. Are you ready?" },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown strong since our first hunt together, and I can see it in how you hold yourself. Soon you'll be the one setting the pace." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "I hear you made someone in camp back down with nothing but a look. That's a hunter's stare, and I'd like to learn it." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! There's a note waiting for you from your trainer. The wild has been asking for you." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter? Then you already know the first lesson: be patient, and then don't be." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I would, if you could keep pace. The Bristleback are cunning, and the Light might frighten them out of their dens. My father says I'm too eager, but I'd like to see what you can do against the quilboar." } },
      choices = {
        { text = "Then let's hunt them together, Grull.", next = "BACK", reply = "Ha, now we're talking! Keep up, though, because I don't wait for anyone once the boars break cover.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll hunt them myself. You'll slow me down.", next = "BACK", reply = "My father would say the same thing about me, so I'll not take it to heart. Go, then, and tell me how many you get, and I'll try to beat it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "If you can keep up! The Bristleback lurk in Brambleblade Ravine, and the plainstriders kick like a falling rock, so a healer at my back would let me run straight at them. My father says a leader should know when to call for help, and I'm learning." } },
      choices = {
        { text = "I'll keep you standing, Grull. Run as far as you like.", next = "BACK", reply = "Then I'll run straight at them and trust you to keep up. My father will scold me, but it'll be worth it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Learn to hunt without a healer, or don't hunt.", next = "BACK", reply = "My father says much the same, and he's usually right. Still, a brave with a healer comes home more often, and I'd like to come home.", fx = { align = { light = -1 } } },
        { text = "Something else, Grull.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That you face the quilboar of Brambleblade Ravine and come back with your strength proven. My father led the hunts before me, and one day I'll lead this camp, so I watch every warrior who walks up that ravine to see what kind of brave they'll become." } },
      choices = {
        { text = "I'll face the Rite with honour, Grull.", next = "BACK", reply = "Good, that's what the camp needs, and what my father always hoped for. I'll be watching, and I'll be cheering.", fx = { align = { order = 1 } } },
        { text = "Rites are old customs. Strength speaks for itself.", next = "BACK", reply = "It does, once you've shown it, and the rite is how we see it. Go up the ravine and let it speak, and we'll listen.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "You could, because the plainstriders spook at every tauren hoof and you'd get close enough to count them. Watch the Bristleback camps for me too, because they've been bold since they killed my grandmother, and I want to know where they sleep." },
      },
      choices = {
        { text = "I'll scout, and let your hunters take the kill fairly.", next = "BACK", reply = "Then my hunters will thank you, and so will I. Bring me their numbers and I'll bring the spears.", fx = { align = { honor = 1 } } },
        { text = "Scouting's a waste. I'd rather cut them down asleep.", next = "BACK", reply = "That's a quilboar's trick, and I'll not have it in my camp. We fight them in the open, so they know who killed them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Welcome, but not with fire, because the grass of Red Cloud Mesa burns and so would all of us. Bring your frost and slow the plainstriders for my braves, and you'll eat first at the feast." },
      },
      choices = {
        { text = "I'll follow your lead on the hunt, Grull.", next = "BACK", reply = "Good, and I'll lead it straight at the plainstriders. Slow them for me, and you'll eat first, I promise.", fx = { align = { order = 1 } } },
        { text = "I'll hunt my own way, frost or fire.", next = "BACK", reply = "Then keep your fire off the mesa, or my father will have both our heads. Frost, please, I'm begging you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "He doesn't trust anything that might bite the hand that feeds it, and the orcs say demons always do. I'm curious, though, so if you and your demon hunt the Bristleback with my braves, I'll judge you by what you bring home." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "He doesn't trust anything that might bite the hand that feeds it, and your demon is watching my braves like it wonders how they'd taste. I'm curious, though, so if you and {pet} hunt the Bristleback with us, I'll judge you both by what you bring home." },
      },
      choices = {
        { text = "Then I'll hunt beside your braves and honor your father's camp.", next = "BACK", reply = "Then you'll eat with us, and my father will see what kind of hunter you are. I'm curious, as I said, and I'm patient.", fx = { align = { order = 1 } } },
        { text = "Your father's trust isn't something I need.", next = "BACK", reply = "Maybe not, but you'll find it easier to hunt here with it. I'll judge you myself, then, and he'll listen to me eventually.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin! I've never hunted beside one of you. Can you even keep up?" },
        { id = "h_default", key = true,
          text = "I'm Grull Hawkwind, the Chief's son. One day I'll lead this camp, and until then, I lead its hunts." },
        { id = "h_hunt", tags = { "news" }, when = { questActive = TODO_QUEST("The Hunt Begins") },
          text = "Plainstriders are fast, stupid, and good eating. Bring me meat and feathers, and we'll call it a start." },
        { id = "h_continues", when = { questActive = TODO_QUEST("The Hunt Continues") },
          text = "The hunt goes on, as it always does. Bring me what the grasslands give you." },
        { id = "h_battleboars", when = { questActive = TODO_QUEST("The Battleboars") },
          text = "The quilboar breed battleboars in a pen to the south. Thin them, and the next raid on this camp comes on foot." },
        { id = "h_note", when = { questActive = TODO_QUEST("Verdant Note") },
          text = "Your trainer wants you, so go; the Hawkwind will still be here." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Good, because the hunt goes better when the wind is on our side, and you can ask it nicely." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll be facing the Rite of Strength, then, because every brave of Narache must prove themselves before they go down to Bloodhoof." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Narache's hunts come home with plenty of scratches, so stay close, because I'd rather lead a hunt with a healer than without one." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue! You'd make a fine scout for my hunts, if you can keep up." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! Can you light a fire without flint? My hunters would trade a lot for that." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. My father would want me to send you away, but I'd rather see what you can do." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Battleboar", min = 20 } }, text = "You've been thinning out the battleboars, and the hunters say the plains around the camp are safer for it. I'll make a hunter of you yet, whatever you call yourself." },
        { id = "h_narache", when = { origin = "tauren_narache_hunter" }, text = "Ha, the mesa hunter's calf! Your mother let me carry her spears once when I was small, and I dropped them all in the creek, so I've been trying to outhunt her ever since." },
        { id = "h_dd_sharptusk", tags = { "news" }, when = { questDone = TODO_QUEST("Break Sharptusk!") }, text = "My father told the whole camp you broke Chief Sharptusk and sent the Bristleback running, and he told it twice so the young ones would remember. I'd have liked to be there, but I'm told I'm more use here with the plainstriders." },
      },
      choices = {
        { text = "Leading will be a heavy burden.", next = "lead" },
        { text = "Can my beast hunt beside your braves?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Race you to Red Cloud Mesa, Grull. My mother would want it.", next = "xmesa", when = { origin = "tauren_narache_hunter" } },
        { text = "Should a shaman hunt, Grull, or only bless the hunters?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does the Rite of Strength ask of a warrior, Grull?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Will you take a priest on your next hunt, Grull?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "A rogue could scout your hunts, Grull.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Would a mage be welcome on your hunts, Grull?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Your father doesn't seem to trust warlocks, Grull.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Would you hunt beside a Forsaken paladin, Grull?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Your father talks about Sharptusk a great deal, Grull.", next = "dd_sharptusk", when = { questDone = TODO_QUEST("Break Sharptusk!") } },
        { text = "Tell me how a Narache hunt is run.", next = "hunts" },
        { text = "You've your father's look about you.", next = "look", when = { race = "Tauren" } },
        { text = "Good hunting, Grull.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, the plainstriders won't stand still for long, and An'she won't either." },
      },
    },
    dd_sharptusk = {
      lines = {
        { id = "dd_sharptusk_1", text = "He does, because Sharptusk burned part of this camp before you ever came, and my father carried the wounded himself. Now he tells the story at every fire, and every time he tells it the chief gets bigger and you get braver." },
      },
      choices = {
        { text = "Let him tell it his way. Stories keep a camp strong.", next = "BACK", reply = "Ha, that's what my mother says too. A camp needs its stories more than its spears, some nights.", fx = { align = { order = 1 } } },
        { text = "Tell him the truth. It was a short, ugly fight.", next = "BACK", reply = "Most fights are, I think, and I'll tell him you said so. He'll laugh and tell it bigger anyway.", fx = { align = { order = -1 } } },
        { text = "Something else, Grull.", next = "BACK" },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "Beside them? In front of them, if it's fast! The braves still hunt the old way, on foot with a spear, and I'd like them to see what a hunter and a beast can do together." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "Beside them? In front of them, if it's fast, because I'd like the braves to see what a hunter and a beast can do together. Is that {pet}? Bring it to the southern pens with you; the battleboars won't know what to do." },
      },
      choices = { { text = "We'll show them.", next = "BACK", fx = { affinity = 2 } } },
    },
    lead = {
      lines = { { id = "l_default", text = "I'll lead the way my grandmother did, from the front. If that's wrong, the tribe can tell me so." } },
      choices = {
        { text = "I believe you.", next = "BACK", reply = "Thank you, I'll try to deserve it. My grandmother would have liked to hear it too.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A wise chief leads from where the spears can't reach.", next = "BACK", reply = "Then he's no chief of mine, and no Hawkwind either. I'll lead from the front, and if I fall, the next will lead from the front too.", fx = { align = { honor = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Both, if you ask me, and nobody ever does. A shaman who sits by the fire knows less about plainstriders than one who's chased them, and the Bristleback won't wait for a blessing before they raid." } },
      choices = {
        { text = "I'll hunt beside the braves and earn my place there.", next = "BACK", reply = "Good, then come chase plainstriders with me, and you'll learn more than any fire could teach. The braves will be glad of you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let the spirits strike from afar. I won't risk my own hide.", next = "BACK", reply = "Strike from afar, then, and keep your hide whole, but don't expect a song about it. The braves sing about the ones who run with them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmesa = {
      lines = {
        { id = "xme_default", text = "She would, and she'd bet against me, because she always did. I'll race you gladly once the battleboars are thinned, though, and the loser carries the plainstriders home and thanks the Earth Mother for every one out loud." },
      },
      choices = {
        { text = "Agreed. Start practising your thanks, Grull.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunts = {
      lines = {
        { id = "hunts_d", text = "We go out before An'she is over the rim, with the wind in our faces so the plainstriders cannot smell us. I take the point, Brave Windfeather takes the left, and whoever is newest carries the water and keeps quiet." },
      },
      choices = {
        { text = "And when you find the herd?", next = "hunts_herd" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunts_herd = {
      lines = {
        { id = "hunts_herd_d", text = "Then we wait, which is the part I am worst at. My father says a hunt is nine parts waiting and one part running, and that I have the proportions backwards." },
      },
      choices = {
        { text = "What happens after the kill?", next = "hunts_feast" },
        { text = "Your father is right about the waiting.", next = "BACK", fx = { trait = { patient = 1 } } },
      },
    },
    hunts_feast = {
      big = true,
      lines = {
        { id = "hunts_feast_d", text = "We thank the beast, and then nothing is wasted. Nawka Wildsong takes the hides, Moodan Sungrain takes the fat for his ovens, and the whole camp eats together, with the one who made the kill eating last." },
      },
      choices = {
        { text = "Last? The hunter earned the first cut.", next = "BACK", reply = "That is what I said when I was a calf, and my grandmother cuffed my ear for it. The hunter eats last so that he remembers who he hunts for.", fx = { align = { honor = -1 } } },
        { text = "That's right. The hunt is for the camp.", next = "BACK", reply = "You understand it better than I did at your age. You will hunt with us whenever you like.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    look = {
      lines = {
        { id = "look_d", text = "So the elders keep telling me, usually just before they tell me I have none of his patience. I would rather have my grandmother's look, if I am honest, because she was the one the Bristleback feared." },
      },
      choices = {
        { text = "Then earn her look on the hunt.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask my father. I'm better at the hunt than at answers, and he's had more seasons to gather them." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback are cowards who strike from the brush and run. I hunt them, and I am faster than they are." } },
    cairne = { { id = "tp_cairne", text = "Cairne is the greatest hunter of our people, and I want to be like him. My father says I am too eager, and Cairne says the same, so I suppose they are both right." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gives the hunt its meaning, and I thank her for every kill. My father taught me that, and I have never forgotten it." } },
  },
}
