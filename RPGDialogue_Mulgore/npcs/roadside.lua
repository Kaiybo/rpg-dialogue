-- Mulgore's roads and Bloodhoof's trainers. Voice: bibles/mulgore.md
-- Morin Cloudstalker walks the plains and watches the dwarves at Bael'dun and the Venture Company's mines.
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "morin", id = TODO_NPC("Morin Cloudstalker"), name = "Morin Cloudstalker",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  temper = { "steady" }, values = { "protective", "dutiful" },
  notices = { "race" },
  impression = {
    first = "Morin Cloudstalker keeps watch on Mulgore's open road, a tauren who has seen caravans burned and dwarves digging where they have no right. He speaks slowly and means every word.",
    third = "{name} met Morin Cloudstalker, who watches the roads of Mulgore.",
  },
  greetings = {
    { id = "g_road", text = "The road is long and the plains are wide, traveler. Stand with me a moment." },
    { id = "g_back", when = { metBefore = true }, text = "You return to my stretch of road. The Earth Mother keeps you, I see." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf on Mulgore's road, walking in the open. That is more honest than your kin at Bael'dun, at least." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Not as much as the dwarves digging to the north. They carry the Light too, I'm told, and they tear the earth open without asking. You I'll watch, but if you help us guard the road, I'll count you as a friend of the braves." } },
      choices = {
        { text = "I'll guard the road with you, Morin.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll guard what I choose, not your road.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "We burned what was left and sang over the ashes as the elders taught us, but it was hurried, and I fear it was not enough. If your prayers can reach the dead, say one on the road where the wagons fell, because I still feel them watching it." } },
      choices = {
        { text = "I'll pray on that road, Morin, and stay until they rest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead have had their rites. Watch the living instead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Morin.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The dwarves, I believe, or the beasts they've driven off their land, for they blast the earth at Bael'dun and the plains shake for miles. A warrior who goes there will find guns waiting, so stay low and strike quickly, and come back to me before you go too deep." } },
      choices = {
        { text = "I'll scout first, and fight only if I must.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll charge their camp and break them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Boots, heavy ones, and the marks of carts dragged north toward Bael'dun, though the beasts came afterward to pick at what was left. Follow the cart tracks and you'll find the dwarves' digging, and from there you can judge for yourself who struck first." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} can follow a scent where my eyes can't. Let it lead you up the north road, and stay close behind it." },
      },
      choices = {
        { text = "I'll follow the tracks and judge fairly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Dwarves are guilty enough. I'll hunt them anyway.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then go and look at Bael'dun, because I want to know what those dwarves are pulling from the earth. They have guns and guards and little patience, so come back with what you saw and leave the fighting for a day when the braves can stand with you." },
      },
      choices = {
        { text = "I'll spoil their digging while I'm there.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll look, and fight beside the braves when it's time.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What are the dwarves digging for?", next = "dwarves" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "My road was safer before you walked onto it with that thing beside you. I'll not stop you, because the Warchief's word is our word now, but I've seen caravans burned and I know fire that's wrong when I see it." },
      },
      choices = {
        { text = "I understand. I'll keep it far from your caravans.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Wrong fire burns your enemies just the same.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What happened to the caravan?", next = "caravan" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They dig into the hills looking for something old, and they leave the spoil heaped where the grass used to grow. The Earth Mother does not ask much of anyone, but she does ask that we not tear her open for treasure, and the dwarves have never learned that." } },
      choices = {
        { text = "Then we drive them out openly, with the braves beside us.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Spoil their dig quietly, and let the hills swallow their work.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "The dwarves at the Bael'dun digsite tear at the earth, the Venture Company hacks at our trees, and a caravan of ours burned on this road not long ago. Your spells could do much good here, but I ask you to keep your fire off the plains." },
      },
      choices = {
        { text = "I'll guard the caravans and leave the diggers to the braves.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll drive the diggers off the Earth Mother's land myself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. I watch this road for strangers, and you are the strangest I have seen." },
        { id = "h_default", key = true,
          text = "I am Morin Cloudstalker, and I watch over the road for the braves of Bloodhoof. Strangers have been tearing at the earth to the north, and a caravan of ours was ravaged not far from here." },
        { id = "h_caravan", when = { questActive = TODO_QUEST("The Ravaged Caravan") },
          text = "The caravan lies broken by the road to the north. Search it, and tell me what you find, because the dead deserve to be known." },
        { id = "h_dig", when = { questActive = TODO_QUEST("Dwarven Digging") },
          text = "The dwarves at Bael'dun dig without asking the land's leave. Bring me proof of what they seek, so the elders can judge it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You are a shaman, so you must feel what the strangers to the north are doing to the earth, as surely as I see it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The braves of Bloodhoof could use your arm on the road, because the dwarves at Bael'dun do not leave their camp unguarded." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your eyes are what I need on this road, because the tracks around the ravaged caravan don't match any beast I know." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The braves who survived the ravaged caravan could have used you, and so could the ones who didn't." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid on the road. That is good, because the dwarves at Bael'dun have cut the earth open with their picks, and someone who hears the land should see what they have done." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage on the open road. The diggers to the north tear at the earth with machines, and I hope you don't tear at it with spells." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Bael'dun", min = 20 } }, text = "The dwarves at the Bael'dun digsite are fewer than they were, and fewer picks ring in the hills at night. I won't celebrate it, but I'm not sorry, either." },
      },
      choices = {
        { text = "What are the dwarves digging for?", next = "dwarves" },
        { text = "What happened to the caravan?", next = "caravan" },
        { text = "Mulgore seems to have more troubles than the dwarves.", next = "venture" },
        { text = "My people have no part in Bael'dun.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "The earth to the north is wounded. What can a shaman do?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I could get close to the dwarves' digging without a sound.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Who ravaged the caravan, Morin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What tracks did you find near the caravan, Morin?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Your road is safer with a demon on it, Morin.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I hope the dead of the caravan received their rites.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What have the dwarves at Bael'dun done to the land, Morin?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Who threatens the road, Morin?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do I worry you, Morin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Ask what you need. The road will still be here when we are done." },
        { id = "h_again2", text = "There is more on your mind, I think. Speak it." },
      },
    },
    dwarves = {
      lines = { { id = "d_default", text = "They say they look for the ancient things of the titans, buried deep beneath our plains. Whatever they seek, they have built a fortress to guard it, and fortresses are not built for peaceful work." } },
      choices = { { text = "The tauren should drive them out.", next = "dwarves_out" } },
    },
    dwarves_out = {
      lines = { { id = "do_default", text = "Cairne hopes to avoid a war, because our people have had enough of those. But the braves grow angry each time the dwarves' machines shake the ground." } },
      choices = { { text = "What would you do?", next = "dwarves_morin" } },
    },
    dwarves_morin = {
      lines = { { id = "dm_default", text = "I would ask them once, plainly, to leave. If they would not, then the Earth Mother would forgive us for making them." } },
      choices = {
        { text = "Then ask them, and make them go if they refuse.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Asking only warns them. Strike before they're ready.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else, Morin.", next = "BACK" },
      },
    },
    caravan = {
      lines = { { id = "c_default", text = "It carried goods from Bloodhoof toward the Barrens, and it never got past the hills. The attackers took little and broke much, which tells me they wanted fear more than plunder." } },
      choices = { { text = "I'll search it.", next = "BACK", fx = { affinity = 1 } } },
    },
    venture = {
      lines = { { id = "v_default", text = "Goblins of the Venture Company have opened mines in our hills, and the quilboar and the gnolls grow bold besides. Ask the braves at Bloodhoof, because each of them has a story." } },
      choices = { { text = "Thank you.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "I believe you, for you walk the open road and do not hide behind walls. Tell your kin in Ironforge that Mulgore is not empty land, and that it has people who remember." } },
      choices = { { text = "I'll tell them.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Mend what can be mended, and remember what can't. The dwarves dig at Bael'dun and the goblins dig at their mine, and neither asks the earth's leave, so someone must ask its pardon for them, and someone must make them stop." } },
      choices = {
        { text = "I would ask its pardon first, and help it heal.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I would make them stop, and let the earth have them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know the road and the grass beside it. For more than that, ask the elders." } },
  },
}

P:NPC {
  key = "gennia", id = TODO_NPC("Gennia Runetotem"), name = "Gennia Runetotem",
  bible = "bibles/mulgore.md", role = "trainer", tier = "service",
  communities = { "bloodhoof" }, temper = { "serene" }, values = { "wise", "patient" },
  notices = { "class" },
  impression = {
    first = "Gennia Runetotem teaches the young druids of Bloodhoof Village, gentle and patient, with the Runetotem family's long memory of the Cenarion way.",
    third = "{name} met Gennia Runetotem, the druid trainer at Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "Peace to you, young one. The grass is tall this season, and the land is glad." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I do not know. The night elves taught us that healing comes from the green and growing earth, and the Light comes from somewhere else. But if it heals, it heals, and I am curious to see what yours mends." } },
      choices = {
        { text = "Then I'll heal the land and its people.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light heals people. Land is your business.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Not quite, I think, because a druid asks the land to mend itself and a priest asks something greater to mend it for them. Both are still asking, though, and I have never thought the land minded who did the asking, so long as it was asked kindly." } },
      choices = {
        { text = "Then we're kin in the asking, Gennia.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My prayers don't ask. They command.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Gennia.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That a bear fights only to protect its cubs and its den, and stops the moment the danger has passed. Our family learned that from the night elves long ago, and the warriors who learn it fight hard and stop in time, which is rarer than you'd think." } },
      choices = {
        { text = "I'll fight only to protect, and stop when it's done.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll fight until there's nothing left to fight.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A hunter bonds with a beast and a druid becomes one, but both of us must respect the creature's spirit, or the bond turns sour. I've seen hunters treat their companions better than some druids treat their own forms, so I'll not claim my path is the wiser." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a gentle spirit; I can sense it. You've treated it well, and the Earth Mother sees that." },
      },
      choices = {
        { text = "My beast and I share the hunt as equals.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I command my beast. That's the way of it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They say the arcane once broke their world, and that their highborne grew so proud of it that the Sundering was the price. I don't know every word of it, child, but the Runetotem have kept that warning alongside the rest of what the night elves gave us." },
      },
      choices = {
        { text = "Then I'll study with care, and remember the warning.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "That was ten thousand years ago. Magic has moved on.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How did the tauren learn from the night elves?", next = "elves" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Balance needs two things that belong to the world, and the creature beside you does not. I won't turn you away from my fire, but a druid feels a demon the way you'd feel a thorn under the skin, and I can't pretend otherwise." },
      },
      choices = {
        { text = "I understand. I'll keep it from your students.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then your balance is too narrow for this world.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What does a druid do, exactly?", next = "druid" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "To move through the wild without leaving it worse, because a cat stalks only what it needs and leaves the rest alone. The night elves taught us that, and I'd teach it to you if you have the patience, though I suspect you have other uses for a quiet step." },
      },
      choices = {
        { text = "I'll take only what I need, Gennia.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A quiet step serves me, whatever the night elves taught.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who carries the Light. The Runetotems learned the old ways from strangers, so I will not turn a stranger away." },
        { id = "h_default", key = true, text = "I am Gennia Runetotem, and I teach the druids of Bloodhoof what the land is willing to share. Our family learned the old ways from the night elves, long ago, and we keep them still." },
        { id = "h_druid", when = { class = "DRUID" }, text = "Welcome back, little druid. Show me what the wild has taught you since last we spoke." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman among my druids? You're welcome here, because the Earth Mother speaks to both of us, only in different voices." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You carry the strength of a bear without its patience, and the druids could teach you the second." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The druids and the hunters both walk with the beasts, though we walk inside them and you walk beside." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The night elves who taught my family spoke of priestesses of the moon, and I wonder whether your prayers feel the same as theirs." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue, among my young druids? You move quietly enough to be one of them, little one." },
      },
      choices = {
        { text = "So the tauren learned from the night elves.", next = "elves" },
        { text = "What does a druid do?", next = "druid" },
        { text = "How does a druid's path differ from a shaman's, Gennia?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The night elves taught you druidism. What do they say of mages?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Can a druid teach a warrior anything, Gennia?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How do druids and hunters differ, Gennia?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Is there any balance in what I do, Gennia?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Druids and priests must heal in much the same way.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What can a rogue learn from a druid, Gennia?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The Light might heal the land as druids do.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Earth Mother keep you.", next = "END" },
      },
      again = { { id = "h_again", text = "Something more? Ask, and I will answer as the land allows." } },
    },
    elves = {
      lines = { { id = "e_default", text = "Hamuul Runetotem studied with the great Malfurion Stormrage himself, and he brought the teachings home to our people. Some elves still grumble about it, but the Cenarion Circle welcomes us." } },
      choices = { { text = "Where is Hamuul now?", next = "elves_hamuul" } },
    },
    elves_hamuul = {
      lines = { { id = "eh_default", text = "Up on Elder Rise in Thunder Bluff, beside Cairne. Visit him if you are able, because he loves nothing more than a student with questions." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "A druid keeps the balance between growth and decay, and between the wild and the people who live within it. We heal, and we take the shapes of beasts, and sometimes we must let things die." } },
      choices = {
        { text = "Balance means accepting hard things.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd save what I could, balance or not.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The night elves taught my family to walk with the wild until we became part of it. Your path is older among the tauren, speaking with the elements and asking their aid, and I think the Earth Mother is glad of both." } },
      choices = {
        { text = "Both paths serve her, so we should share what each learns.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The night elves' ways are theirs. Tauren need only the old rites.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That is not something the land has told me, little one." } },
  },
}

P:NPC {
  key = "yaw", id = TODO_NPC("Yaw Sharpmane"), name = "Yaw Sharpmane",
  bible = "bibles/mulgore.md", role = "trainer", tier = "service",
  communities = { "bloodhoof" }, temper = { "steady" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "Yaw Sharpmane teaches Bloodhoof's hunters, a quiet tauren who measures a student by how they treat their animal companion.",
    third = "{name} met Yaw Sharpmane, the hunter trainer at Bloodhoof Village.",
  },
  greetings = {
    { id = "g_hi", text = "You walk softly enough. Good, because the plainstriders hear everything." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Everything worth anything takes something. The plains feed us, and we thank the beast that gives. I expect your Light takes pain, from what the orcs say. If you thank it, as we thank the beasts, I think you're closer to us than you seem." } },
      choices = {
        { text = "I thank it, every time it burns.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I thank nothing. I take what I need.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Some do, and I do not stop them, because a wounded companion deserves every kindness. A troll priest once mended my old cat after a Palemane spear found her, and I have thought better of the loa ever since." } },
      choices = {
        { text = "Every living thing deserves healing, beast or brave.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My prayers are for people, not for pets.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Yaw.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To take only what you need, which is the first lesson I give my hunters and the last one most warriors learn. The plains feed us because we never strip them bare, and a warrior who fights the same way, only as much as is needed, will find the Earth Mother kind to him." } },
      choices = {
        { text = "Only as much as is needed. I'll remember that, Yaw.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "When I fight, I fight to win completely.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Feed it before you feed yourself, speak to it every day, and never send it into a fight you wouldn't take yourself. The beasts of Mulgore are proud, and they remember every kindness and every slight, so earn their trust each day as though you'd never earned it before." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks at you with trust. Good, {class}; keep it that way, and it'll follow you anywhere." },
      },
      choices = {
        { text = "I'll earn its trust every day, Yaw.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "It obeys me. Trust is a luxury.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Does he, now? I'd like to believe that, but I've met more than one rogue on the bluffs who took all he could carry and thanked nobody, so if you mean it, show me by how you walk the plains." },
      },
      choices = {
        { text = "I mean it. I take only what I need.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I take what I can. The plains won't miss it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What makes a good hunter?", next = "good" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "It's different, because you never look the beast in the eye and you never thank it. The plains don't care what weapon kills a plainstrider, but I do, so if you hunt here, take a moment after and say a word for what was given." },
      },
      choices = {
        { text = "I'll thank the beast. That's only fair.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A kill is a kill, and words won't change it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What's the hunting like in Mulgore?", next = "plains" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Often, and mostly about the Palemane gnolls, because the druids say even a gnoll has its place on the plains while my students would sooner see the Palemane gone. I take only what I need from the beasts, but I'm not sure a gnoll who spears my cat counts as one." } },
      choices = {
        { text = "The Palemane threaten Bloodhoof, so they must be driven from Mulgore.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The plains have room for the gnolls, if they keep to the west.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I'm a hunter, so I can only tell you what I know of companions, which is that a beast trusts you as far as you've earned it. I don't think demons trust at all, so I'd keep it bound tightly and never forget what it is." },
      },
      choices = {
        { text = "I'll keep it bound tightly, Yaw.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll treat it however serves me best.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. My hunters take only what they need. I wonder what the Light takes from you." },
        { id = "h_default", key = true, text = "I am Yaw Sharpmane, and I teach the hunters of Bloodhoof. The plains feed us, so we take only what we need and thank the beast that gives it." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Your companion looks well fed, hunter, and that tells me more about you than your aim." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, then. You'll understand why we thank the beast after a hunt, because you've heard the spirits that walk beside it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You could learn something from the hunters of Bloodhoof, if you're willing to slow down long enough to listen." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, one of mine. Show me how your bow arm has grown, and let me see whether your companion still trusts you." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. You walk without a beast, but I can see you care for the living, and that is the first thing I teach my students." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. My hawk went still the moment you came near, the way she does for the Runetotems, so I think the wild already knows you." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Your demon isn't an animal companion, whatever you call it, but I'll judge how you treat it all the same." },
      },
      choices = {
        { text = "What makes a good hunter?", next = "good" },
        { text = "What's the hunting like in Mulgore?", next = "plains" },
        { text = "The beasts' spirits must speak to hunters too, Yaw.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "A rogue takes only what he needs, too.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I hunt with fire and frost. That's not so different.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What would you teach a warrior, Yaw?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How do I keep my companion's trust, Yaw?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'd guess hunters here ask a priest to tend their beasts.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Hunters and druids must argue over the beasts, Yaw.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "How should a warlock treat a demon, Yaw?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What does the Light take from me, Yaw?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Good hunting, Yaw.", next = "END" },
      },
      again = { { id = "h_again", text = "Ask on. A hunter learns by asking as much as by tracking." } },
    },
    good = {
      lines = { { id = "g_default", text = "Patience first, and respect after, and only then the bow. A hunter who kills for sport forgets that the plains are watching him." } },
      choices = {
        { text = "Every kill should be honored.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A beast is a beast. Meat's meat.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    plains = {
      lines = { { id = "p_default", text = "Plainstriders and prairie wolves near the village, and swoops overhead for the patient. Further north, the Venture Company scares the game away with their noise." } },
      choices = { { text = "You haven't mentioned the great beasts.", next = "plains_big" } },
    },
    plains_big = {
      lines = { { id = "pb_default", text = "Ask Harken Windtotem about the old wolves, because he tells those stories better than I do. Then come back and tell me if you believed him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not in words, the way the elements speak to you, but a good hunter learns to listen all the same. When my hawk won't leave my arm, I know something on the plains is wrong, and most often it's the Palemane gnolls." } },
      choices = {
        { text = "Then the beasts and the elements both deserve our thanks.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A hunter owes the beast a clean kill, and nothing more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I track beasts, not rumors. Ask at the inn." } },
  },
}
