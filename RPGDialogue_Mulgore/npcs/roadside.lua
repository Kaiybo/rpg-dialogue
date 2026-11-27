-- Mulgore's roads and Bloodhoof's trainers. Voice: bibles/mulgore.md
-- Morin Cloudstalker walks the plains and watches the dwarves at Bael'dun and the Venture Company's mines.
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "morin", id = TODO_NPC("Morin Cloudstalker"), name = "Morin Cloudstalker",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  temper = { "steady" }, values = { "protective", "dutiful" },
  notices = { "race", "lock_eyes" },
  impression = {
    first = "He has seen caravans burned, and he means every slow word.",
    third = "{name} met Morin Cloudstalker, who watches the roads of Mulgore.",
  },
  greetings = {
    { id = "g_road", text = "The road is long and the plains are wide, traveler, and the Earth Mother watches both. Stand with me a moment." },
    { id = "g_back", when = { metBefore = true }, text = "You return to my stretch of road. The Earth Mother keeps you, I see." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf on Mulgore's road, walking in the open. That is more honest than your kin at Bael'dun, at least." },
    { id = "n_lock_eyes", cat = "lock_eyes", when = { class = "WARLOCK", aura = { 132, 2970, 11743 } },
      text = "Your eyes catch the light like a cat's, green and too sharp, and I'd guess they see more on my road than mine do. If you spot anything creeping near the caravans, I'd be grateful to hear of it." },
  },
  start = "hello",
  nodes = {
    op_dwarves = {
      lines = {
        { id = "opd_q", text = "You've seen them, I think, or you've seen their kin in other lands. Before I decide anything about Bael'dun, I'd hear what you think of the dwarves." },
        { id = "opd_q_dw", when = { race = "Dwarf" }, text = "You're one of them, and you came to me openly, so I'll ask you openly. What do you think of your own people's digging in Mulgore?" },
      },
      choices = {
        { text = "Most dwarves are honest folk. Bael'dun is the exception, not the rule.", next = "op_dwarves_r1", fx = { affinity = 1, align = { light = 1 }, opinion = { dwarves = "respect" } } },
        { text = "They'll dig up the whole world if no one stops them.", next = "op_dwarves_r2", fx = { affinity = 1, align = { light = -1 }, opinion = { dwarves = "distrust" } } },
        { text = "Their Explorers' League digs for history, not for greed.", next = "op_dwarves_r3", fx = { trait = { curious = 1 }, opinion = { explorers_league = "useful" } } },
        { text = "The Bael'dun diggers shame us all. I'm sorry, Morin.", next = "op_dwarves_r4", fx = { affinity = 3, trait = { honest = 1 }, opinion = { dwarves = "shame" } }, when = { race = "Dwarf" } },
        { text = "I'd rather not speak for a whole people, Morin.", next = "BACK" },
      },
    },
    op_dwarves_r1 = {
      lines = {
        { id = "op_dwarves_r1", text = "I'll hope you're right, because the honest ones have never found their way to Mulgore. Perhaps you'll send me some." },
      },
      choices = {
        { text = "Something else, Morin.", next = "BACK" },
      },
    },
    op_dwarves_r2 = {
      lines = {
        { id = "op_dwarves_r2", text = "That's what the earth tells me through my hooves every morning. Thank you for saying it plainly." },
      },
      choices = {
        { text = "Something else, Morin.", next = "BACK" },
      },
    },
    op_dwarves_r3 = {
      lines = {
        { id = "op_dwarves_r3", text = "History, they call it, and our ancestors' bones lie under that history. I'd like to see them dig up their own grandfathers first." },
      },
      choices = {
        { text = "Something else, Morin.", next = "BACK" },
      },
    },
    op_dwarves_r4 = {
      lines = {
        { id = "op_dwarves_r4", text = "I didn't expect to hear that from a dwarf, and I'll not forget it. Walk freely on this road, friend." },
      },
      choices = {
        { text = "Something else, Morin.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Not as much as the dwarves digging to the north. They carry the Light too, I'm told, and they tear the earth open without asking. You I'll watch, but if you help us guard the road, I'll count you as a friend of the braves." } },
      choices = {
        { text = "I'll guard the road with you, Morin.", next = "BACK", reply = "Then you're welcome on my road, Light or no Light. The braves will be glad of another spear, or hammer, or whatever it is you carry.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll guard what I choose, not your road.", next = "BACK", reply = "Then I'll watch you and the dwarves both, and trust neither. The road needs guarding, whoever chooses to do it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "We burned what was left and sang over the ashes as the elders taught us, but it was hurried, and I fear it was not enough. If your prayers can reach the dead, say one on the road where the wagons fell, because I still feel them watching it." } },
      choices = {
        { text = "I'll pray on that road, Morin, and stay until they rest.", next = "BACK", reply = "Thank you, friend, and the dead thank you, I hope. I'll stand watch beside you while you pray.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead have had their rites. Watch the living instead.", next = "BACK", reply = "I'll watch the living, as I always do, but the dead still watch me. If you change your mind, you know where the road is.", fx = { align = { light = -1 } } },
        { text = "Something else, Morin.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The dwarves, I believe, or the beasts they've driven off their land, for they blast the earth at Bael'dun and the plains shake for miles. A warrior who goes there will find guns waiting, so stay low and strike quickly, and come back to me before you go too deep." } },
      choices = {
        { text = "I'll scout first, and fight only if I must.", next = "BACK", reply = "Good, and the dwarves won't see you coming, not with all the noise their machines make. Come back with what you find, and we'll decide together.", fx = { align = { order = 1 } } },
        { text = "I'll charge their camp and break them.", next = "BACK", reply = "Then you'll find their guns waiting, as I said, and they won't be kind. Come back alive if you can, and tell me how far you got.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Boots, heavy ones, and the marks of carts dragged north toward Bael'dun, though the beasts came afterward to pick at what was left. Follow the cart tracks and you'll find the dwarves' digging, and from there you can judge for yourself who struck first." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Boots, heavy ones, and the marks of carts dragged north toward Bael'dun, though the beasts came afterward to pick at what was left. Your {pet} can follow a scent where my eyes can't. Let it lead you up the north road, and stay close behind it." },
      },
      choices = {
        { text = "I'll follow the tracks and judge fairly.", next = "BACK", reply = "Good, and I'll trust your judgement when you come back. The truth is more use to me than another dead dwarf.", fx = { align = { honor = 1 } } },
        { text = "Dwarves are guilty enough. I'll hunt them anyway.", next = "BACK", reply = "Then you'll find them guilty, as you wanted, and I'll never know the truth. I'd rather know, friend, before I blame them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then go and look at Bael'dun, because I want to know what those dwarves are pulling from the earth. They have guns and guards and little patience, so come back with what you saw and leave the fighting for a day when the braves can stand with you." },
      },
      choices = {
        { text = "I'll spoil their digging while I'm there.", next = "BACK", reply = "Spoil it if you can, and quietly, but don't get caught. I'd rather have you back alive than a broken pump.", fx = { align = { honor = -1 } } },
        { text = "I'll look, and fight beside the braves when it's time.", next = "BACK", reply = "That's what I hoped to hear. Look your fill, come back to me, and the braves will stand with you when the time comes.", fx = { align = { honor = 1 } } },
        { text = "What are the dwarves digging for?", next = "dwarves" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "My road was safer before you walked onto it with that thing beside you. I'll not stop you, because the Warchief's word is our word now, but I've seen caravans burned and I know fire that's wrong when I see it." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "My road was safer before you walked onto it with that thing beside you, and it hasn't taken its eyes off my wagon since. I'll not stop you, because the Warchief's word is our word now, but I've seen caravans burned, and I can feel the wrong fire in it from here." },
      },
      choices = {
        { text = "I understand. I'll keep it far from your caravans.", next = "BACK", reply = "Thank you, that's all I'll ask of you. The caravans have suffered enough without that thing frightening the kodo.", fx = { align = { light = 1 } } },
        { text = "Wrong fire burns your enemies just the same.", next = "BACK", reply = "It does, but it burns the grass just as quickly. Keep it off my road, and use it where the dwarves are.", fx = { align = { light = -1 } } },
        { text = "What happened to the caravan?", next = "caravan" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They dig into the hills looking for something old, and they leave the spoil heaped where the grass used to grow. The Earth Mother does not ask much of anyone, but she does ask that we not tear her open for treasure, and the dwarves have never learned that." } },
      choices = {
        { text = "Then we drive them out openly, with the braves beside us.", next = "BACK", reply = "Then the braves will be glad to go with you, and so will I. Openly, so they know who sent them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Spoil their dig quietly, and let the hills swallow their work.", next = "BACK", reply = "I'll not ask how you did it, friend. But if their drills start breaking, I'll sleep better than I have all season.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "The dwarves at the Bael'dun digsite tear at the earth, the Venture Company hacks at our trees, and a caravan of ours burned on this road not long ago. Your spells could do much good here, but I ask you to keep your fire off the plains." },
      },
      choices = {
        { text = "I'll guard the caravans and leave the diggers to the braves.", next = "BACK", reply = "Good, that's where you'll do the most good. The braves will deal with the diggers, and you'll keep the caravans moving.", fx = { align = { light = 1 } } },
        { text = "I'll drive the diggers off the Earth Mother's land myself.", next = "BACK", reply = "Then go, but leave the grass unburned behind you. The Earth Mother would not thank you for driving them out with fire.", fx = { align = { light = -1 } } },
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
        { text = "Your road is safer with what walks beside me on it, Morin.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
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
      choices = {
        { text = "What do you think of the dwarves yourself?", next = "op_dwarves" },
        { text = "What would you do?", next = "dwarves_morin" },
      },
    },
    dwarves_morin = {
      lines = { { id = "dm_default", text = "I would ask them once, plainly, to leave. If they would not, then the Earth Mother would forgive us for making them." } },
      choices = {
        { text = "Then ask them, and make them go if they refuse.", next = "BACK", reply = "That's my way too, and the braves would follow it. One fair warning, and then they'll learn what tauren horns are for.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Asking only warns them. Strike before they're ready.", next = "BACK", reply = "You sound like the young braves, and maybe you're right. But I'd rather ask once and be refused than strike first and be wrong.", fx = { affinity = -1, align = { honor = -1 } } },
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
        { text = "I would ask its pardon first, and help it heal.", next = "BACK", reply = "Then the earth will thank you, and so will I. If the dwarves had asked even once, we might not be standing here.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I would make them stop, and let the earth have them.", next = "BACK", reply = "That's the harder way, and maybe the needed one. Make them stop, then, but let the earth decide what's left of them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know the road and the grass beside it, as my fathers knew it. For more than that, ask the elders." } },
    centaur = { { id = "tp_centaur", text = "The centaur once rode through these plains like a storm, and I watched them burn our caravans. They come less often now, but they still come." } },
    quilboar = { { id = "tp_quilboar", text = "The Bristleback burn caravans too, and they kill the drivers. I watch the road for both, and I do not sleep much." } },
    cairne = { { id = "tp_cairne", text = "Cairne trusts me to watch this road, and I will not fail him. He is a great chieftain, and a patient one, but he does not forgive carelessness." } },
    venture_company = { { id = "tp_venture_company", text = "The Venture Company's goblins dig their mine in the north of Mulgore, and they poison the land and they do not care, and I would see them gone." } },
  },
}

P:NPC {
  key = "gennia", id = TODO_NPC("Gennia Runetotem"), name = "Gennia Runetotem",
  bible = "bibles/mulgore.md", role = "trainer", tier = "service",
  communities = { "bloodhoof" }, temper = { "serene" }, values = { "wise", "patient" },
  notices = { "class" },
  impression = {
    first = "She is gentle and patient, with the Runetotems' long memory.",
    third = "{name} met Gennia Runetotem, the druid trainer at Bloodhoof Village.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Peace to you, friend. The land is generous, and so is my heart when I see you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Peace to you, young one. The land is generous, though I am less so with those I'm unsure of." },
    { id = "g_hi", text = "Peace to you, young one. The grass is tall this season, and the land is glad." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I do not know. The night elves taught us that healing comes from the green and growing earth, and the Light comes from somewhere else. But if it heals, it heals, and I am curious to see what yours mends." } },
      choices = {
        { text = "Then I'll heal the land and its people.", next = "BACK", reply = "Then you'll find a welcome at my fire, and a curious one. Show me what your Light mends, and I'll show you how the green does it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light heals people. Land is your business.", next = "BACK", reply = "Perhaps it is, and I'll keep it. But you might be surprised how much the land and its people share, child.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Not quite, I think, because a druid asks the land to mend itself and a priest asks something greater to mend it for them. Both are still asking, though, and I have never thought the land minded who did the asking, so long as it was asked kindly." } },
      choices = {
        { text = "Then we're kin in the asking, Gennia.", next = "BACK", reply = "We are, and it's good to find kin in strange places. Ask kindly, and the land will answer us both.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My prayers don't ask. They command.", next = "BACK", reply = "Then I hope whatever you command is a kind master. The land does not like being commanded, and I suspect your Light doesn't either.", fx = { align = { light = -1 } } },
        { text = "Something else, Gennia.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That a bear fights only to protect its cubs and its den, and stops the moment the danger has passed. Our family learned that from the night elves long ago, and the few warriors who learn it fight hard and stop in time." } },
      choices = {
        { text = "I'll fight only to protect, and stop when it's done.", next = "BACK", reply = "Then you've learned the bear's lesson already, and I'm glad. Few warriors stop in time, and fewer stop willingly.", fx = { align = { honor = 1 } } },
        { text = "I'll fight until there's nothing left to fight.", next = "BACK", reply = "Then you'll fight forever, child, because there is always something more to fight. Even the bear lies down once her cubs are safe.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A hunter bonds with a beast and a druid becomes one, but both of us must respect the creature's spirit, or the bond turns sour. I've seen hunters treat their companions better than some druids treat their own forms, so I'll not claim my path is the wiser." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A hunter bonds with a beast and a druid becomes one, but both of us must respect the creature's spirit, or the bond turns sour. Your {pet} has a gentle spirit; I can sense it. You've treated it well, and the Earth Mother sees that." },
      },
      choices = {
        { text = "My beast and I share the hunt as equals.", next = "BACK", reply = "Then you'll be a fine hunter, and the beast will thank you in its way. That's the respect I spoke of, and it's rarer than you'd think.", fx = { align = { honor = 1 } } },
        { text = "I command my beast. That's the way of it.", next = "BACK", reply = "Then I hope it never decides otherwise, child. I would not want to be standing next to you on that day.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They say the arcane once broke their world, and that their highborne grew so proud of it that the Sundering was the price. I don't know every word of it, child, but the Runetotem have kept that warning alongside the rest of what the night elves gave us." },
      },
      choices = {
        { text = "Then I'll study with care, and remember the warning.", next = "BACK", reply = "Good, that's all the warning asks of you. Remember it, and the arcane will serve you better than it served the highborne.", fx = { align = { order = 1 } } },
        { text = "That was ten thousand years ago. Magic has moved on.", next = "BACK", reply = "Magic may have moved on, but pride hasn't, and it was pride that broke the world. The night elves still won't speak of it at their own fires.", fx = { align = { order = -1 } } },
        { text = "How did the tauren learn from the night elves?", next = "elves" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Balance needs two things that belong to the world, and the creature beside you does not. I won't turn you away from my fire, but a druid feels a thing like that the way you'd feel a thorn under the skin, and I can't pretend otherwise." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Balance needs two things that belong to the world, and the creature standing beside you does not, which the grass knows too, because it's wilting where it stands. I won't turn you away from my fire, but a druid feels a demon like a thorn under the skin, and this one is close." },
      },
      choices = {
        { text = "I understand. I'll keep it from your students.", next = "BACK", reply = "Thank you, that's kind of you, and my students will rest easier for it. They are young, and they jump at shadows.", fx = { align = { light = 1 } } },
        { text = "Then your balance is too narrow for this world.", next = "BACK", reply = "Perhaps it is, and I've wondered that myself on long nights. Still, I'll keep my balance, and you keep that creature close.", fx = { align = { light = -1 } } },
        { text = "What does a druid do, exactly?", next = "druid" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "To move through the wild without leaving it worse, because a cat stalks only what it needs and leaves the rest alone. The night elves taught us that, and I'd teach it to you if you have the patience, though I suspect you have other uses for a quiet step." },
      },
      choices = {
        { text = "I'll take only what I need, Gennia.", next = "BACK", reply = "Then you have the patience already, and the cat will teach you the rest. Come by the fire, and we'll walk the plains together.", fx = { align = { light = 1 } } },
        { text = "A quiet step serves me, whatever the night elves taught.", next = "BACK", reply = "It will, and I'll not ask what for. Only remember that the wild sees what you do with it, even when no one else does.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who carries the Light. The Runetotems learned the old ways from strangers, so I will not turn a stranger away." },
        { id = "h_default", key = true, text = "I am Gennia Runetotem, and I teach the druids of Bloodhoof what the land is willing to share. Our family learned the old ways from the night elves, long ago, and we keep them still." },
        { id = "h_druid", when = { class = "DRUID" }, text = "Welcome, little druid. Show me what the wild has taught you so far." },
        { id = "h_dr_roots", when = { class = "DRUID", minLevel = 6, maxLevel = 9 },
          text = "You've come down from the mesa, and Gart has taught you well, I can see. Here in Bloodhoof I'll teach you to ask the roots for help, and to wear thorns without minding them." },
        { id = "h_dr_call", when = { class = "DRUID", minLevel = 10, maxLevel = 13 },
          text = "There's a call waiting for you, little druid, and it comes from Turak Runetotem on Elder Rise. Your tenth season has come, and the bear is ready to meet you, if you're ready to meet it." },
        { id = "h_dr_back", when = { class = "DRUID", minLevel = 14 },
          text = "You've walked a long way from my fire, and you carry the bear lightly now. Sit a moment and let an old teacher look at you, because it's the best part of teaching." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman among my druids? You're welcome here, because the Earth Mother speaks to both of us, only in different voices." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You carry the strength of a bear without its patience, and the druids could teach you the second." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The druids and the hunters both walk with the beasts, though we walk inside them and you walk beside." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The night elves who taught my family spoke of priestesses of the moon, and I wonder whether your prayers feel the same as theirs." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue, among my young druids? You move quietly enough to be one of them, little one." },
      },
      choices = {
        { text = "So the tauren learned from the night elves.", next = "elves" },
        { text = "What does a druid do?", next = "druid" },
        { text = "Do the roots mind when I make them grab someone?", next = "d_roots", when = { class = "DRUID", minLevel = 8, maxLevel = 20 } },
        { text = "What is this call from Turak, Gennia?", next = "d_call", when = { class = "DRUID", minLevel = 10, maxLevel = 14 } },
        { text = "Are all the Runetotem druids, Gennia?", next = "d_runetotem", when = { race = "Tauren" } },
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
      again = { { id = "h_again", text = "Something more? Ask, and I will answer as the land allows, slowly, as the roots grow." } },
    },
    d_roots = {
      big = true,
      lines = { { id = "dr_gn_default", text = "They don't mind holding, little one, because holding is what roots do best; it's the letting go they find hard. Ask them kindly, and release them when you're done, and they'll answer you the next time and the time after that." } },
      choices = {
        { text = "I'll ask kindly, and let go when it's done.", next = "BACK",
          reply = "Then the roots of Mulgore will be your friends for life. They have long memories, and they remember who said thank you.",
          fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're roots, Gennia. They'll do as I tell them.", next = "BACK",
          reply = "They will, for a while, and then one day they'll be a heartbeat slow, and you'll never know why. The land keeps its own accounts, child.",
          fx = { align = { light = -1 } } },
        { text = "And the thorns? They feel like a trick.", next = "d_thorns" },
      },
    },
    d_thorns = {
      lines = { { id = "dr_gt_default", text = "They are a trick, the same one the briar plays on the boar that tries to eat it. A druid wears the thorns so the beast that bites learns its lesson without anyone having to teach it twice, and there's no shame in that; the Earth Mother is full of such tricks." } },
      choices = { { text = "Something else, Gennia.", next = "BACK" } },
    },
    d_call = {
      lines = {
        { id = "dr_gc_default", text = "Turak teaches the druids of the Claw on Elder Rise, and when a young druid reaches their tenth season, he sends for them. He'll send you on to Moonglade to sit with the Great Bear Spirit, and then he'll test you, and then he'll give you the bear's shape, a moment every druid remembers for life." },
        { id = "dr_gc_done", when = { questDone = TODO_QUEST("Body and Heart") }, text = "You've answered it already, I see, and you've the bear in you now. Tell me what the Great Bear Spirit felt like, because I still dream of mine some nights." },
      },
      choices = {
        { text = "What did the Great Bear Spirit say to you?", next = "d_call2" },
        { text = "Something else, Gennia.", next = "BACK" },
      },
    },
    d_call2 = {
      lines = { { id = "dr_gc2_default", text = "Nothing at all, and everything. It looked at me for a long time, as my grandmother used to when I'd been foolish, and when I walked away I knew I'd never again strike anything only because I was strong enough to." } },
      choices = { { text = "Something else, Gennia.", next = "BACK", fx = { affinity = 1 } } },
    },
    d_runetotem = {
      lines = { { id = "dr_gr_default", text = "Not all, but more than any other tribe, because Hamuul is one of us, and he taught his own people first. Turak and Sheal on Elder Rise, Tonga at the Crossroads, and me here at Bloodhoof; you can't throw a stone in Mulgore without hitting a Runetotem with moss on her hooves." } },
      choices = {
        { text = "Do the other tribes resent that?", next = "d_runetotem2" },
        { text = "Something else, Gennia.", next = "BACK" },
      },
    },
    d_runetotem2 = {
      big = true,
      lines = { { id = "dr_gr2_default", text = "A little, the way any herd grumbles when one calf gets the best grass. The Wildmane have their own druids now, like Kym and young Nara, and the Grimtotem say the whole path is an elven fancy, but most tribes are glad of anyone who can heal a kodo." } },
      choices = {
        { text = "The path should belong to every tribe equally.", next = "BACK",
          reply = "It should, and Hamuul says so too, and he's taught anyone who comes to him with a true heart. The Runetotem only got there first.",
          fx = { align = { order = -1 }, opinion = { druids = "balance" } } },
        { text = "The Runetotem earned it. Hamuul did the work.", next = "BACK",
          reply = "That's kind of you, and he did, but he'd scold us both for saying it. Pride is a weed, child, even when it grows in good soil.",
          fx = { align = { order = 1 } } },
        { text = "Something else, Gennia.", next = "BACK" },
      },
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
        { text = "Balance means accepting hard things.", next = "BACK", reply = "It does, and it's the hardest thing a druid learns. I'm glad to hear you understand it so young.", fx = { align = { order = 1 } } },
        { text = "I'd save what I could, balance or not.", next = "BACK", reply = "That's a kind heart speaking, and I would never fault it. But the land sometimes needs things to end, child, and a druid must learn to let them.", fx = { align = { order = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The night elves taught my family to walk with the wild until we became part of it. Your path is older among the tauren, speaking with the elements and asking their aid, and I think the Earth Mother is glad of both." } },
      choices = {
        { text = "Both paths serve her, so we should share what each learns.", next = "BACK", reply = "That's what I believe too, and my family has lived by it for generations. Hamuul learned from the kaldorei, and look how many druids he's raised since.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The night elves' ways are theirs. Tauren need only the old rites.", next = "BACK", reply = "The old rites are good, and I honour them. But the night elves gave us something worth keeping, and I'd not throw it away.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That is not something the land has told me, little one. Sit with the Earth Mother a while; she may." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Emerald Dream is a green world beneath this one, and a druid learns to walk it in sleep. The night elves taught us the way, and I teach it to the young." } },
    elune = { { id = "tp_elune", text = "The night elves pray to Elune, the moon, and the tauren call her Mu'sha, the Earth Mother's eye. I find it comforting that our faiths agree on something so beautiful." } },
    cairne = { { id = "tp_cairne", text = "Cairne is a great friend to the druids, and he gave Hamuul a place on the bluff to teach us. Without him, the tauren would have no druids at all." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made every creature that walks, and a druid learns to take their shapes. It is her greatest gift, and her greatest test." } },
  },
}

P:NPC {
  key = "yaw", id = TODO_NPC("Yaw Sharpmane"), name = "Yaw Sharpmane",
  bible = "bibles/mulgore.md", role = "trainer", tier = "service",
  communities = { "bloodhoof" }, temper = { "steady" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "He measures a student by how they treat their animal companion.",
    third = "{name} met Yaw Sharpmane, the hunter trainer at Bloodhoof Village.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "You walk softly, friend, like a true hunter. Come, sit, and tell me what you've tracked." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "You walk softly enough. Good. Now let us see whether you listen as softly as you walk." },
    { id = "g_hi", text = "You walk softly enough, like a hunter who respects the grass. Good, because the plainstriders hear everything." },
    { id = "g_pet", when = { class = "HUNTER", pet = { type = "Beast" } }, text = "Let {pet} come forward and smell the grass with me. A beast that walks easy in Bloodhoof is a beast that is well kept." },
    { id = "g_young", when = { class = "HUNTER", minLevel = 10, maxLevel = 11, ["not"] = { pet = { type = "Beast" } } }, text = "You have reached your tenth season and still walk alone. Come, the plains have teachers waiting for you." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Everything worth having takes something in return, and we thank the beast that feeds us. From what I've heard, your Light takes pain, so if you thank it the way we thank the beasts, I think you're closer to us than you seem." } },
      choices = {
        { text = "I thank it, every time it burns.", next = "BACK", reply = "Then you're closer to us than you seem, as I said. Sit by my fire some night and say the words with me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I thank nothing. I take what I need.", next = "BACK", reply = "Then you'll find the plains less generous than you'd like. Ask the goblins how their hills are faring.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Some do, and I do not stop them, because a wounded companion deserves every kindness. A troll priest once mended my old cat after a Palemane spear found her, and I have thought better of the loa ever since." } },
      choices = {
        { text = "Every living thing deserves healing, beast or brave.", next = "BACK", reply = "It does, and I'm glad you see it. My cat would thank you, if she could, and I'll thank you for her.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My prayers are for people, not for pets.", next = "BACK", reply = "That's your choice, and I'll not argue with it. But my cat was a person to me, and the troll who mended her saw that.", fx = { align = { light = -1 } } },
        { text = "Something else, Yaw.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To take only what you need, which is the first lesson I give my hunters and the last one most warriors learn. The plains feed us because we never strip them bare, and a warrior who fights the same way, only as much as is needed, will find the Earth Mother kind to him." } },
      choices = {
        { text = "Only as much as is needed. I'll remember that, Yaw.", next = "BACK", reply = "Good, then you're ahead of most warriors, and some hunters too. The herds will still be here when your children come hunting.", fx = { align = { honor = 1 } } },
        { text = "When I fight, I fight to win completely.", next = "BACK", reply = "Winning completely is how the plains get stripped bare, warrior. Win, by all means, but leave something standing behind you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Feed it before you feed yourself, speak to it every day, and never send it into a fight you wouldn't take yourself. The beasts of Mulgore are proud, and they remember every kindness and every slight, so earn their trust each day as though you'd never earned it before." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Feed it before you feed yourself, speak to it every day, and never send it into a fight you wouldn't take yourself. Your {pet} looks at you with trust. Good, {class}; keep it that way, and it'll follow you anywhere." },
      },
      choices = {
        { text = "I'll earn its trust every day, Yaw.", next = "BACK", reply = "Good. Come back in a season and let me see how it walks beside you.", fx = { align = { honor = 1 } } },
        { text = "It obeys me. Trust is a luxury.", next = "BACK", reply = "It obeys for now. Wait until a cougar has it pinned, and see whether obedience brings it back to your side.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Does he, now? I'd like to believe that, but I've met more than one rogue on the bluffs who took all he could carry and thanked nobody, so if you mean it, show me by how you walk the plains." },
      },
      choices = {
        { text = "I mean it. I take only what I need.", next = "BACK", reply = "Then I'll watch you walk the plains, rogue, and I hope to be proven wrong about your kind.", fx = { align = { light = 1 } } },
        { text = "I take what I can. The plains won't miss it.", next = "BACK", reply = "The plains miss everything, rogue, they just don't say so. Take only what you need, or find somewhere else to hunt.", fx = { align = { light = -1 } } },
        { text = "What makes a good hunter?", next = "good" },
        { text = "Where does the hunter's road lead from Bloodhoof?", next = "y_road", when = { class = "HUNTER" } },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "It's different, because you never look the beast in the eye and you never thank it. The plains don't care what weapon kills a plainstrider, but I do, so if you hunt here, take a moment after and say a word for what was given." },
      },
      choices = {
        { text = "I'll thank the beast. That's only fair.", next = "BACK", reply = "Good, that's all I ask. Say it quietly, close to its ear, before the spirit wanders far.", fx = { align = { light = 1 } } },
        { text = "A kill is a kill, and words won't change it.", next = "BACK", reply = "No, but they change the one who says them. Try it once, and tell me afterward that you felt nothing.", fx = { align = { light = -1 } } },
        { text = "What's the hunting like in Mulgore?", next = "plains" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Often, and mostly about the Palemane gnolls, because the druids say even a gnoll has its place on the plains while my students would sooner see the Palemane gone. I take only what I need from the beasts, but I'm not sure a gnoll who spears my cat counts as one." } },
      choices = {
        { text = "The Palemane threaten Bloodhoof, so they must be driven from Mulgore.", next = "BACK", reply = "That's what my students say, and I'm half inclined to agree. Still, take only the Palemane who threaten us, and leave the rest to the druids.", fx = { align = { order = 1 } } },
        { text = "The plains have room for the gnolls, if they keep to the west.", next = "BACK", reply = "That's what the druids say, and maybe they're right. But a gnoll who spears my cat has wandered far from the west.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I'm a hunter, so I can only tell you what I know of companions, which is that a beast trusts you as far as you've earned it. I don't think your sort of creature trusts at all, so I'd keep it bound tightly and never forget what it is." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "I'm a hunter, so I watch companions, and yours has never once looked to you since you sat down, only at everything else. A beast trusts you as far as you've earned it, but I don't think demons trust at all, so keep that one bound tightly." },
      },
      choices = {
        { text = "I'll keep it bound tightly, Yaw.", next = "BACK", reply = "Good, that's wise, and the beasts will be glad of it. My hawk won't come down while it's near.", fx = { align = { order = 1 } } },
        { text = "I'll treat it however serves me best.", next = "BACK", reply = "Then I hope what serves you best is never letting it go. If it ever slips loose on these plains, I'll be hunting it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. My hunters take only what they need. I wonder what the Light takes from you." },
        { id = "h_default", key = true, text = "I am Yaw Sharpmane, and I teach the hunters of Bloodhoof. The plains feed us, so we take only what we need and thank the beast that gives it." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Your companion looks well fed, hunter, and that tells me more about you than your aim." },
        { id = "h_taming", tags = { "news" }, when = { class = "HUNTER", questActive = TODO_QUEST("Taming the Beast") }, text = "You still carry my taming rod, so the plains still hold a teacher for you. Go gently, and thank each beast when you let it go." },
        { id = "h_tamed", tags = { "news" }, when = { class = "HUNTER", questRecent = { TODO_QUEST("Taming the Beast"), days = 3 } }, text = "The plainstrider, the stalker and the swoop, all bound and all set free. Now go up to Holt Thunderhorn on Hunter Rise, and learn to train the companion you will keep." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, then. You'll understand why we thank the beast after a hunt, because you've heard the spirits that walk beside it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You could learn something from the hunters of Bloodhoof, if you're willing to slow down long enough to listen." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, one of mine. Show me how your bow arm has grown, and let me see whether your companion still trusts you." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. You walk without a beast, but I can see you care for the living, and that is the first thing I teach my students." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. My hawk went still the moment you came near, the way she does for the Runetotems, so I think the wild already knows you." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Whatever walks at your heel isn't an animal companion, whatever you call it. I'll judge how you treat it all the same." },
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
        { text = "How should one treat a companion that was never a beast, Yaw?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What does the Light take from me, Yaw?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Good hunting, Yaw.", next = "END" },
      },
      again = { { id = "h_again", text = "Ask on. A hunter learns by asking as much as by tracking." } },
    },
    good = {
      lines = { { id = "g_default", text = "Patience first, and respect after, and only then the bow. A hunter who kills for sport forgets that the plains are watching him." } },
      choices = {
        { text = "Every kill should be honored.", next = "BACK", reply = "Then you'll be a good hunter, and you've saved me a long speech. Go and practise on the plainstriders.", fx = { align = { light = 1 } } },
        { text = "A beast is a beast. Meat's meat.", next = "BACK", reply = "Then you're no hunter of mine. Meat's meat, until there's none left, and then you'll wish you'd listened.", fx = { align = { light = -1 } } },
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
    y_road = {
      hub = true,
      narr = "He runs a hand along the grass at the edge of the path, as if reading something written there.",
      lines = {
        { id = "yr_default", text = "The hunter's road begins on these plains and runs out across the whole of Kalimdor, and every step of it is a debt to the Earth Mother. I will tell you what I can of it, so that you walk it knowing what you owe." },
        { id = "yr_low", when = { maxLevel = 9 }, text = "You have not yet come to the place where a hunter takes a companion, so your road is still short. Learn the plainstriders and the wolves near the village, and come to me at ten seasons, and we will go further together." },
        { id = "yr_mid", when = { minLevel = 20 }, text = "You have walked far from Bloodhoof since I first saw you, and the beasts of the Barrens have left their marks on you. Ask what you will, and I will tell you what I know of the road ahead." },
      },
      again = {
        { id = "yr_again", text = "What else would you know of the road? The plains have time, and so do I." },
        { id = "yr_again2", text = "Ask on, young hunter. A question is a lighter thing to carry than a mistake." },
      },
      choices = {
        { text = "I am ready to take a companion, Yaw.", next = "y_tame", when = { minLevel = 10 } },
        { text = "Should I thank the beast I tame, as I thank the kill?", next = "y_thanks" },
        { text = "Hunters speak of a wolf west of the village.", next = "y_chak" },
        { text = "Are there hunts beyond Mulgore I should seek?", next = "y_far", when = { minLevel = 16 } },
        { text = "The Grimtotem hunt too. Are they still our people?", next = "y_grim", when = { race = "Tauren", minLevel = 14 } },
        { text = "My people camp at Gev'rek. We hunt differently.", next = "y_sky", when = { race = "Skyborne" } },
        { text = "Enough of the road for now.", next = "BACK" },
      },
    },
    y_tame = {
      lines = {
        { id = "yt_default", text = "Then take this rod and go out onto the plains, and bind three beasts, one after the other: an adult plainstrider, a prairie stalker, and a swoop from the sky. Keep none of them, for they are your teachers, and let each go with thanks when it has taught you." },
        { id = "yt_active", when = { questActive = TODO_QUEST("Taming the Beast") }, text = "You carry my rod, so a teacher is still waiting for you out on the grass. Be gentle with the binding, and if the beast fights you, let it go and try another, for the Earth Mother made more than one." },
        { id = "yt_done", when = { questDone = TODO_QUEST("Taming the Beast") }, text = "The plainstrider, the stalker and the swoop have all walked with you and gone free again. Now go up to Thunder Bluff, to Holt Thunderhorn on Hunter Rise, and he will teach you to train the companion you choose to keep." },
        { id = "yt_trained", when = { questDone = TODO_QUEST("Training the Beast") }, text = "Holt has taught you to train, so you know what I know now, and more. Tame widely and keep one, and let every beast you bind for a day leave a lesson behind for your companion." },
      },
      choices = {
        { text = "Why must I let them go?", next = "y_tame2" },
        { text = "Back to the road.", next = "y_road" },
      },
    },
    y_tame2 = {
      big = true,
      lines = { { id = "yt2_default", text = "Because the first beast that walks beside you is not yet your companion, only your lesson. A companion must be chosen, and it must choose you, and that takes more than a rod and an afternoon on the plains." } },
      choices = {
        { text = "Then I'll wait for the beast that chooses me.", next = "y_road", reply = "The Earth Mother will send it, when you are both ready. Watch for the one that does not run.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll choose the strongest. Choosing is the hunter's right.", next = "y_road", reply = "It is your right, and many hunters use it. But the strongest beast may not stay, and the faithful one always does.", fx = { align = { light = -1 } } },
        { text = "Back to the road.", next = "y_road" },
      },
    },
    y_thanks = {
      lines = { { id = "yth_default", text = "You should, though in a different way. When you take a life you thank the beast for its gift, and when you take a companion you thank it for its trust, and you keep thanking it every day with food and with care, for trust is a gift that must be given again each morning." } },
      choices = {
        { text = "My father says words over every kill.", next = "y_thanks2", when = { race = "Tauren" } },
        { text = "Back to the road.", next = "y_road" },
      },
    },
    y_thanks2 = {
      lines = { { id = "yth2_default", text = "Then he taught you well, and you should say them too, even when you are tired, even when the kill was hard. The day a hunter forgets the words is the day he begins hunting for himself and not for the herd, and Cairne himself would tell you the same." } },
      choices = {
        { text = "I'll not forget them. Back to the road.", next = "y_road", fx = { affinity = 1 } },
      },
    },
    y_chak = {
      lines = {
        { id = "yc_default", text = "Chakuyak, a great prairie wolf who roams west of Bloodhoof and does not fear us as the others do. He has taken calves from the herds, and I would see him returned to the Earth Mother by a hunter who will thank him for it." },
        { id = "yc_done", when = { questDone = TODO_QUEST("Chakuyak") }, text = "You brought me Chakuyak's pelt, and the herds graze easier for it. I hope you said the words over him, for he was a fine wolf, whatever he took from us." },
      },
      choices = {
        { text = "A wolf that takes calves deserves no thanks.", next = "y_chak2" },
        { text = "Back to the road.", next = "y_road" },
      },
    },
    y_chak2 = {
      big = true,
      lines = { { id = "yc2_default", text = "He took what the Earth Mother put in his path, as we do. He is not wicked, young one, only hungry and bold, and a hunter who cannot honor a bold wolf will one day fail to honor something greater." } },
      choices = {
        { text = "Then I'll honor him even as I hunt him.", next = "y_road", reply = "That is the whole of the hunter's way, in one sentence. Go well.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The herd comes first. I'll not mourn a thief.", next = "y_road", reply = "The herd comes first, yes, and he must be stopped. Mourn him a little anyway, for your own sake.", fx = { align = { honor = -1 } } },
        { text = "Back to the road.", next = "y_road" },
      },
    },
    y_far = {
      lines = { { id = "yf_default", text = "Sergra Darkthorn at the Crossroads sets hunters after the beasts of the Barrens, and at the end of her hunts she calls up a white lion named Echeyakee, whose name means whitemist. Jorn Skyseer at Camp Taurajo sends hunters after greater game still, the thunder lizards and the great kodo of the south." } },
      choices = {
        { text = "And after the Barrens?", next = "y_far2" },
        { text = "Back to the road.", next = "y_road" },
      },
    },
    y_far2 = {
      lines = {
        { id = "yf2_default", text = "Melor Stonehoof on Hunter Rise sends the strongest of us out across the world, to the Needles and the swamps and the cold mountains of Alterac, for the hunts that teach the most. At thirty you will learn to fall as if dead, at forty to wear mail, and after that, the road is yours to tell me about." },
      },
      choices = {
        { text = "I'll come back and tell you, Yaw.", next = "y_road", fx = { affinity = 1 } },
        { text = "Back to the road.", next = "y_road" },
      },
    },
    y_grim = {
      lines = { { id = "yg_default", text = "They are tauren, and they hunt well, but they have forgotten why. They take more than they need and leave the rest to rot, and they say the land is ours alone, and that the orcs and trolls should be driven from it. Magatha Grimtotem sits in Thunder Bluff and smiles at Cairne, and I do not trust the smile." } },
      choices = {
        { text = "Cairne should drive them from the Bluff.", next = "y_road", reply = "Cairne is wiser than I am, and he keeps them close to watch them. I only hope he watches closely enough.", fx = { align = { order = -1 } } },
        { text = "Cairne keeps the tribes together. I'll trust his way.", next = "y_road", reply = "So will I, though my bow arm itches whenever a Grimtotem passes. Walk with the Earth Mother.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Back to the road.", next = "y_road" },
      },
    },
    y_sky = {
      lines = { { id = "ysk_default", text = "I have heard so, and I have seen your people at Camp Gev'rek giving thanks to the wind before they draw. The Earth Mother and the winds are not strangers to each other, I think, so tell me, what do your hunters say over a kill?" } },
      choices = {
        { text = "We give the kill's thanks to the wind spirits.", next = "y_road", reply = "Then the wind carries it to the Earth Mother, and she hears it all the same. Hunt well beside us.", fx = { affinity = 1 } },
        { text = "Nothing. Our spirits have gone quiet.", next = "y_road", reply = "Then say the words of the plains until yours wake again. She will not mind the borrowing.", fx = { trait = { kind = 1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not in words, the way the elements speak to you, but a good hunter learns to listen all the same. When my hawk won't leave my arm, I know something on the plains is wrong, and most often it's the Palemane gnolls." } },
      choices = {
        { text = "Then the beasts and the elements both deserve our thanks.", next = "BACK", reply = "They do, and I thank both, every morning before I string my bow. My hawk seems to like it, anyway.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A hunter owes the beast a clean kill, and nothing more.", next = "BACK", reply = "A clean kill is a great deal, and more than many give. I'd still say a word over it, but I'll not make you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I track beasts, not rumors. Ask at the inn, where the rumors graze." } },
    centaur = { { id = "tp_centaur", text = "The centaur train their beasts to fight, but they do not respect them. A hunter who does not respect their pet is only a rider, and a poor one." } },
    quilboar = { { id = "tp_quilboar", text = "The quilboar keep boars as pets, and they treat them better than they treat each other. I find that interesting, and a little sad." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made the beasts, and a hunter must honour that. Treat your pet as a gift, and it will treat you as family." } },
  },
}
