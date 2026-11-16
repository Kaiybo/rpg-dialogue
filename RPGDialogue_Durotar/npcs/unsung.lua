-- Durotar's working people with no quests of their own: the Den's trainers and shopkeeper,
-- Razor Hill's weaponsmith and trainers, and Sen'jin's mage teacher. Voices: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- The Valley of Trials
---------------------------------------------------------------------------

-- Frang: the Den's warrior trainer. Loud, plain, fond of bruises.
P:NPC {
  key = "frang", id = TODO_NPC("Frang"), name = "Frang", title = "Warrior Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "valley_of_trials" }, temper = { "gruff" }, values = { "brave", "dutiful" },
  notices = { "class", "weary" },
  impression = {
    first = "Frang trains the young warriors in the Den and judges them by how fast they get up, not how hard they fall. He is loud about it, but he watches every recruit closely.",
    third = "{name} met Frang, the warrior trainer in the Valley of Trials' Den.",
  },
  greetings = {
    { id = "g_war", when = { class = "WARRIOR" }, text = "On your feet, recruit! If you are here, you have bruises to show me, and I want to see them." },
    { id = "g_other", when = { ["not"] = { class = "WARRIOR" } }, text = "You are not one of mine, but stand up straight anyway; the Den does not like a slouch." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "That armor has been chewed on by every boar in the valley, and you still came back walking. Good, because walking back is the first lesson." },
    { id = "n_troll", cat = "class", when = { class = "WARRIOR", race = "Troll" },
      text = "A Darkspear with an axe! Your people fight loose and quick, so I will teach you to hold a line as well, and then you will be dangerous." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Better than you would think, and better than they used to. In the old Horde the shamans stood back and the warriors charged and nobody trusted anybody, but Thrall calls the storm with the same hammer he fights with, and the young ones are learning from him." } },
      choices = {
        { text = "Shoulder to shoulder with the warriors is the only way to fight.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let the warriors charge. I'll strike where the enemy doesn't expect.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Frang, and I teach the warriors of the Den to fight like the Horde fights, shoulder to shoulder and never turning their backs. Everything else they learn out in the valley, mostly from boars." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Back from the valley, are you? Tell me what the quilboar taught you today, and then I will teach you something they cannot." },
        { id = "h_low", when = { maxLevel = 5 }, text = "You are greener than a cactus apple, but everyone starts green. The trick is not to stay that way, so get out there and come back hurt." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman in my Den! Good, because when my recruits fall down you can tell the earth to hold them up, and save me some shouting." },
      },
      choices = {
        { text = "Do warriors and shamans fight well together, Frang?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What does a warrior learn first?", next = "first" },
        { text = "Who else trains in the Den?", next = "den" },
        { text = "Where did you learn to fight?", next = "past" },
        { text = "I'll leave you to your recruits.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else? Speak quick, because I have a recruit lying in the dirt out there who thinks he is resting." },
        { id = "h_again2", text = "Go on, ask. Questions do not bruise, though some answers do." },
      },
    },
    first = {
      lines = { { id = "f_default", text = "How to take a hit and stay standing, because a warrior who falls down cannot protect anyone. After that comes the shield, and after that the charge, and the charge is the fun part." } },
      choices = { { text = "Why the shield before the charge?", next = "first_shield" } },
    },
    first_shield = {
      lines = { { id = "fs_default", text = "Because the young ones all want to run at the enemy screaming, and half of them would die doing it. Teach them to guard first, and the ones who live long enough to charge will charge well." } },
      choices = {
        { text = "Guarding your brothers matters more than glory.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Glory is what a warrior fights for. Let them charge.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else, trainer.", next = "BACK" },
      },
    },
    den = {
      lines = { { id = "d_default", text = "Gornek runs the Den and sends every recruit out with work, and the other trainers stand along these walls with me. Ken'jai teaches the priests, and the troll talks more gently than I do, but nobody listens to either of us until they have been bitten by something." } },
      choices = { { text = "And outside the Den?", next = "den_out" } },
    },
    den_out = {
      lines = { { id = "do_default", text = "Galgar cooks, Kzan mends the weapons you break, and Foreman Thazz'ril shouts at his lazy peons until the whole valley can hear him. When you are ready to leave, the road runs east to Sen'jin and north to Razor Hill." } },
      choices = { { text = "Thanks. Something else.", next = "BACK" } },
    },
    past = {
      lines = { { id = "p_default", text = "In the internment camps, if you can believe it, with sticks behind the guards' backs. When the Warchief broke the camps open, those sticks became axes, and I have not put one down since." } },
      choices = {
        { text = "The camps made the Horde stronger.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The camps were a crime. Nothing good came of them.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know axes, shields and how to stand up again, so ask Gornek about anything else." } },
  },
}

-- Ken'jai: the Den's priest trainer, a Darkspear troll of the old loa and the new Light alike.
P:NPC {
  key = "kenjai", id = TODO_NPC("Ken'jai"), name = "Ken'jai", title = "Priest Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "valley_of_trials" }, temper = { "calm" }, values = { "wise", "kind" },
  spiritSensitive = true,
  notices = { "class", "weary" },
  impression = {
    first = "Ken'jai teaches the young priests in the Den, a patient troll who mends Frang's recruits after their lessons. He talks of the spirits as neighbours who need to be kept on good terms.",
    third = "{name} met Ken'jai, the troll priest trainer in the Valley of Trials.",
  },
  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Ah, mon, you be one of mine. Sit down, catch your breath, and tell Ken'jai what the valley did to you." },
    { id = "g_other", text = "You be hurt, you come to Ken'jai, and if you be not hurt yet, give it a day in this valley." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Look at you, all torn up like the scorpids had a feast. Come closer and let Ken'jai see if anything be broken under there." },
    { id = "n_orcpriest", cat = "class", when = { class = "PRIEST", race = "Orc" },
      text = "An orc who heals instead of hits, now that be a rare thing. Your people forgot the spirits for a long time, so you be walking an old road almost alone." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "All the time, mon, like any family. The Loa want respect and the elements want balance, and the shaman who forget either one find out quick, so Ken'jai keep good terms with everybody and mend whoever get burned." } },
      choices = {
        { text = "Respect for every spirit is what keeps us whole.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The elements serve my purpose, and the Loa can wait.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Ken'jai, and I teach the priests of the Den to mend what the warriors break. Frang hits them, I fix them, and between us the young ones learn something." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "Every priest who come back from the valley a little stronger make Ken'jai proud, mon. What you need to learn today?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The spirits and the Loa be cousins, mon, so you and Ken'jai already be family of a sort." },
      },
      choices = {
        { text = "Do your Loa and my elements ever disagree, Ken'jai?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Where does your healing come from?", next = "power" },
        { text = "What's a troll doing in an orc valley?", next = "troll" },
        { text = "Do you mend many recruits?", next = "mend" },
        { text = "I'll be going.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something more, mon? Ken'jai got time while nobody be bleeding." },
        { id = "h_again2", text = "Ask, ask. The spirits be quiet today, so I can listen." },
      },
    },
    power = {
      lines = { { id = "p_default", text = "From the spirits, from the strength inside you, and from what the humans call the Light, though I think they all be one river with many names. A priest who argue about the name while somebody bleeds be a bad priest." } },
      choices = { { text = "What about the dark side of it?", next = "power_dark" } },
    },
    power_dark = {
      lines = { { id = "pd_default", text = "Every river got a dark pool where the water go still, and some priests learn to drink from it. It be strong medicine, but Ken'jai warns every student that the shadow remember who visits." } },
      choices = {
        { text = "Power is power. I'll use what works.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'd rather heal than drink from that pool.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = { { id = "t_default", text = "The Darkspear owe Thrall a life debt, mon, because he pulled us off an island where the humans and the murlocs were hunting us. So when he asked for teachers in this valley, Ken'jai came, and the orcs have been good to me." } },
      choices = { { text = "Where are the rest of your people?", next = "troll_where" } },
    },
    troll_where = {
      lines = { { id = "tw_default", text = "At Sen'jin Village on the coast, east of here, and some in Orgrimmar with Vol'jin. The Echo Isles were meant to be our home, but Zalazane took them with his voodoo, so for now the village be home enough." } },
      choices = { { text = "I hope you get the isles back.", next = "BACK", fx = { affinity = 2 } } },
    },
    mend = {
      lines = { { id = "m_default", text = "More than Frang would like to admit, mon, and most of them from the mottled boars and the scorpids by the hills. The worst ones come back from the caves in the north, where the Burning Blade keep their little demons." } },
      choices = { { text = "What do the imps do to them?", next = "mend_imps" } },
    },
    mend_imps = {
      lines = { { id = "mi_default", text = "Burn them and scratch them, mostly, and the burns of a fel creature heal slower than a boar's bite. Zureetha by the hill send recruits to kill the familiars, so Ken'jai sees a lot of singed eyebrows." } },
      choices = { { text = "Thank you, Ken'jai. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ken'jai knows healing and the Darkspear, mon, but not that. Ask Gornek, he knows everything in the valley." } },
  },
}

-- Duokna: sells general goods to the Den's recruits.
P:NPC {
  key = "duokna", id = TODO_NPC("Duokna"), name = "Duokna", title = "General Goods",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "valley_of_trials" }, temper = { "brisk" }, values = { "practical" },
  notices = { "purse", "hunger" },
  impression = {
    first = "Duokna sells the Den's recruits the plain things they forget they need: water, bread, thread and bags. The questions are as practical as the goods, and nobody leaves without being asked about their waterskin.",
    third = "{name} bought supplies from Duokna, who keeps general goods for the recruits of the Valley of Trials.",
  },
  greetings = {
    { id = "g_shop", text = "Water, bread, thread and bags, everything a recruit forgets until it is too late. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, so the valley has eaten through your supplies already. That is what it does." },
  },
  notice = {
    { id = "n_broke", cat = "purse", when = { money = { max = 50 } },
      text = "Your coin purse is lighter than a feather, recruit. The boars carry a little copper sometimes, if you are not too proud to look." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Everything except the totems, because every one of you thinks the spirits will carry the rest. The spirits won't fill your waterskin, so take one from me and stop asking the river." } },
      choices = {
        { text = "Fair enough. Good planning honors the spirits as much as prayer.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The land provides when I need it, so I travel light.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Duokna, and I keep the goods for the Den. Most of the young ones walk in with an axe and nothing else, so I make sure they walk out with a waterskin." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Your totems are heavy, so I'll ask you what I ask everyone, which is whether you remembered to carry water as well." },
      },
      choices = {
        { text = "What do shamans usually forget to carry?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "What should a recruit carry?", next = "carry" },
        { text = "Where do your goods come from?", next = "supply" },
        { text = "I'm fine for now.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else, recruit, or are you ready to pay for that waterskin?" },
      },
    },
    carry = {
      lines = { { id = "c_default", text = "Water first, because Durotar is dry and the sun is not kind. Then something to eat that is not a cactus apple, and a bag big enough to carry whatever the quilboar drop." } },
      choices = { { text = "What's wrong with cactus apples?", next = "carry_apple" } },
    },
    carry_apple = {
      lines = { { id = "ca_default", text = "Nothing, if you like spines in your tongue, and Galgar makes a fine dish from them when someone gathers enough. Raw off the plant, they are a lesson most recruits only need once." } },
      choices = {
        { text = "I'll take your bread, then.", next = "BUSINESS" },
        { text = "Something else first.", next = "BACK" },
      },
    },
    supply = {
      lines = { { id = "s_default", text = "Carts come down from Razor Hill and Orgrimmar when the roads are clear, and the peons haul it up from the gate. If the peons are asleep again, it does not get hauled, and Thazz'ril hears from me." } },
      choices = {
        { text = "The peons work hard. Go easy on them.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Lazy peons should be woken with a stick.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I sell bread and bags, recruit, so ask Gornek if you want answers about anything bigger." } },
  },
}

---------------------------------------------------------------------------
-- Razor Hill
---------------------------------------------------------------------------

-- Uhgar: Razor Hill's weaponsmith.
P:NPC {
  key = "uhgar", id = TODO_NPC("Uhgar"), name = "Uhgar", title = "Weaponsmith",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "razor_hill" }, temper = { "gruff" }, values = { "proud", "craft" },
  notices = { "kit", "craft" },
  impression = {
    first = "Uhgar sells weapons in Razor Hill and judges a fighter by the edge they carry. He is gruff, proud of the iron, and quick to say which of the town's enemies blunts a blade fastest.",
    third = "{name} met Uhgar, the weaponsmith of Razor Hill.",
  },
  greetings = {
    { id = "g_shop", text = "Blades, axes and maces, all of them sharp. Look, but do not touch the edges unless you are buying." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Show me what you did to the last one I sold you." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You have a smith's burns on your hands. Then you know what you are looking at, so I will not bother lying about the quality." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A mace, or a staff with iron on the end, because lightning finishes what a heavy head starts. Thrall carries the Doomhammer, and every young shaman in Razor Hill wants a hammer like it, though I tell them to learn to swing a small one first." } },
      choices = {
        { text = "A shaman should fight face to face, as the Warchief does.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather end a fight before the enemy ever reaches me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Uhgar, and I sell weapons to the grunts of Razor Hill and anyone else with coin. Durotar is a hard place, and you will want something better than a training axe before you leave town." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, so you'll want a mace or an axe and not some little dagger. The spirits respect a weapon with weight behind it, or so the old shamans told me." },
      },
      choices = {
        { text = "What weapon suits a shaman, Uhgar?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "What do you recommend?", next = "advice" },
        { text = "Who are Razor Hill's enemies?", next = "enemies" },
        { text = "I fight with spells, not steel.", next = "caster", when = { class = { "MAGE", "WARLOCK", "PRIEST" } } },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? I have edges to grind." } },
    },
    advice = {
      lines = {
        { id = "a_default", text = "Something heavy for the quilboar, because their hides are thick and their tusks are thicker. If you mean to fight the Kul Tirans at Tiragarde Keep, something quick, because a sailor dies to speed, not weight." },
        { id = "a_rogue", when = { class = "ROGUE" }, text = "For you, daggers, and keep them sharp enough to shave with. Kaplak teaches your kind in the burrow under the hill, and he will tell you the same." },
      },
      choices = { { text = "Who taught you smithing?", next = "advice_craft" } },
    },
    advice_craft = {
      lines = { { id = "ac_default", text = "Nobody taught me in a proper forge; I learned by mending the guards' blades in the camps, with whatever scrap they threw away. Now I work for orcs instead of guarding against them, and the iron is better too." } },
      choices = {
        { text = "That's a fine story, smith.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemies = {
      lines = { { id = "e_default", text = "The humans of Kul Tiras who built Tiragarde Keep on our coast, the Burning Blade cultists in their caves, and the centaur and quilboar on every border. Gar'Thok keeps the grunts busy with all of them." } },
      choices = {
        { text = "Drive the Kul Tirans into the sea.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let them be, if they keep to their walls.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    caster = {
      lines = { { id = "c_default", text = "Then carry a staff at least, because sooner or later a boar will get close enough to bite you mid-spell. I have a few, though I keep them in the back with the things nobody buys." } },
      choices = { { text = "Show me the staves.", next = "BUSINESS" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know steel and who needs cutting, and nothing else. Try Gar'Thok in the barracks." } },
  },
}

-- Thotar: Razor Hill's hunter trainer.
P:NPC {
  key = "thotar", id = TODO_NPC("Thotar"), name = "Thotar", title = "Hunter Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "calm" }, values = { "patient", "practical" },
  notices = { "class", "pet" },
  impression = {
    first = "Thotar trains the hunters at Razor Hill and talks about beasts as if they were people worth respecting. He wants to know about every animal a hunter tames, and he is patient with all of them.",
    third = "{name} met Thotar, who teaches Razor Hill's hunters to read the land and trust their beasts.",
  },
  greetings = {
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, and with the dust of the plains on you. Come and tell me what you have been tracking." },
    { id = "g_other", when = { ["not"] = { class = "HUNTER" } }, text = "You walk loudly, stranger, and every beast in Durotar heard you coming." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { type = "Beast" } },
      text = "Your {pet} keeps an eye on me while you talk, which means it is a good one. Never punish a beast for being wary of strangers." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They do, and better than most hunters. My raptor would not cross the dry wash south of here for a week, and when I asked old Gadrin about it he said an angry earth spirit had settled there, so now I listen when my beasts refuse a path." } },
      choices = {
        { text = "Then the beasts and the spirits both deserve our respect.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast that refuses a path should be made to cross it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Both, and a hunter must know which one the day calls for. A druid wears the beast's very shape, which I think is a closer bond than any of mine, though I would not trade my companion for it." } },
      choices = {
        { text = "A beast is a partner, never a tool.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A beast is a weapon. Treat it as one.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Thotar, and I teach the hunters of Razor Hill to read the land and to trust a beast at their side. In Durotar the land is mostly rock and the beasts are mostly angry, so there is plenty to learn." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "You have come for training, I think, and maybe for advice about your companion. Ask, and I will help with both." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, I think, and from Mulgore by the look of you. You will find the beasts of Durotar leaner and meaner than your plainstriders, but they are honest, and they will teach you if you let them." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, I think. You and I listen to the same land, though you hear the spirits in it and I hear the beasts, so tell me what Durotar says to you." },
      },
      choices = {
        { text = "Do your beasts sense the spirits, Thotar?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you hunt the beasts or befriend them, Thotar?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What beasts are worth taming here?", next = "beasts" },
        { text = "How do you choose a companion?", next = "choose" },
        { text = "Farewell, Thotar.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? Speak, and I will listen like a hunter listens." } },
    },
    beasts = {
      lines = { { id = "b_default", text = "The raptors of the Barrens to the west are quick and loyal once broken, and the scorpids here hold a line as well as any grunt. The wolves of Durotar are scrawny, but a scrawny wolf still knows how to run." } },
      choices = { { text = "Why a scorpid?", next = "beasts_scorpid" } },
    },
    beasts_scorpid = {
      lines = { { id = "bs_default", text = "Because nothing alive wants to bite through that shell, and a scorpid does not tire or complain. It will never love you the way a wolf does, but it will stand in front of you until it dies." } },
      choices = {
        { text = "Loyalty matters more than love.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A companion should choose to stand with you.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose = {
      lines = {
        { id = "c_default", text = "Watch it hunt before you tame it, because a beast that hunts carelessly will fight carelessly beside you. When you find one that waits and watches, that is the one." },
        { id = "c_tauren", when = { race = "Tauren" }, text = "Your people already know this, I think, because the tauren have hunted beside the beasts of Mulgore for longer than we have been in Kalimdor. Watch it hunt, and pick the one that waits." },
      },
      choices = { { text = "Thank you. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know tracks and beasts, and that is not either one. Ask Gar'Thok or Orgnil." } },
  },
}

-- Kaplak: Razor Hill's rogue trainer, down in the burrow under the hill.
P:NPC {
  key = "kaplak", id = TODO_NPC("Kaplak"), name = "Kaplak", title = "Rogue Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "sly" }, values = { "cunning" },
  notices = { "class", "stealth" },
  impression = {
    first = "Kaplak trains rogues out of a dim burrow under Razor Hill and speaks as if every conversation might be overheard. He seems to enjoy being underestimated.",
    third = "{name} found Kaplak, the rogue trainer hidden beneath Razor Hill.",
  },
  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "You found the burrow on your own, so you are learning. Come in and keep your voice low." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "This burrow is not for sightseers, so either you are lost or you are nosy. Which is it?" },
  },
  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Nice try, but I heard your buckle three steps ago. Wrap it in cloth next time and you might surprise someone who is not me." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "More than they'd admit. A shaman who walks soft can call the wind to cover his steps and put frost on a man's legs before he knows he's been seen, and the Burning Blade never hear what's coming for them." } },
      choices = {
        { text = "I'd rather the enemy see me coming and fear it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A quiet kill is still a kill, and a quicker one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Name's Kaplak, and I teach the quiet arts to those who have the stomach for them. The grunts upstairs fight in the open, but somebody has to handle the work that happens in the dark." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, down in my burrow. Keep your thunder to yourself, friend, because the grunts upstairs don't need to know what goes on down here." },
      },
      choices = {
        { text = "Do shamans have any use for the quiet arts?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Why train down in a burrow?", next = "burrow" },
        { text = "What work happens in the dark?", next = "work" },
        { text = "Goodbye.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? Make it quick, because I do not like company standing in my doorway." } },
    },
    burrow = {
      lines = { { id = "b_default", text = "Because a rogue who trains in the open is a rogue everyone recognises later. Down here, my students learn their trade where nobody watches, and they leave with faces nobody remembers." } },
      choices = { { text = "Does Gar'Thok know you're here?", next = "burrow_garthok" } },
    },
    burrow_garthok = {
      lines = { { id = "bg_default", text = "Gar'Thok knows everything that happens in his town, or he likes to think so. He leaves me alone because my students bring back what his grunts cannot, like word from the Kul Tiran keep and the cultists' caves." } },
      choices = {
        { text = "Spying is a dishonourable trade.", next = "BACK", fx = { affinity = -2, align = { honor = 1 } } },
        { text = "Wars are won with knowledge, not honour.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "Scouting the Burning Blade's caves, mostly, and reading the papers the Kul Tirans leave lying around Tiragarde Keep. Orgnil Soulscar hunts the cultists in daylight, and my students make sure he knows where to look." } },
      choices = { { text = "I'll keep that between us.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "If I knew, I would be the wrong person to ask about it, wouldn't I?" } },
  },
}

-- Tai'jin: Razor Hill's priest trainer, a Darkspear woman.
P:NPC {
  key = "taijin", id = TODO_NPC("Tai'jin"), name = "Tai'jin", title = "Priest Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "warm" }, values = { "kind", "devout" },
  spiritSensitive = true,
  notices = { "class", "weary" },
  impression = {
    first = "Tai'jin teaches priests at Razor Hill, a warm troll who treats Durotar's wounded grunts like cousins. She talks freely about Sen'jin, and she does not hide that she misses the sea.",
    third = "{name} met Tai'jin, the troll priest trainer at Razor Hill.",
  },
  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Ah, a healer come to see Tai'jin! Sit down, sit down, and tell me what you be needing." },
    { id = "g_other", text = "Welcome, mon. If you be hurt, Tai'jin can see to it, and if not, you can still keep me company." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Look at that armor, mon, it be held together with stubbornness. Let Tai'jin look at the cuts underneath before you go back out." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Our shamans talk to the sea and the Loa as much as the elements, because the Echo Isles taught us that. The orcs learned it fresh from Thrall and the old ones who still remember, so they be careful with it, and we be a little more easy, I think." } },
      choices = {
        { text = "The spirits deserve care, whichever people calls on them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Careful or easy, power is power, and I'll use it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Tai'jin, and I teach the priests of Razor Hill when they come through. The grunts here get cut up by quilboar and Kul Tirans, so my hands stay busy even when the students be few." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, and you be welcome here, mon. Back home in Sen'jin the shamans and the witch doctors argue all night, but they always share the fire." },
      },
      choices = {
        { text = "How do Darkspear shamans differ from the orcs'?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Are you from Sen'jin Village?", next = "senjin" },
        { text = "What do the grunts think of a troll healer?", next = "grunts" },
        { text = "I'm an undead priest. Do you trust me?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Farewell, Tai'jin.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What more you want to ask, mon? My hands be free until the next grunt come limping in." },
        { id = "h_again2", text = "More questions? Good, it keep me from thinking about the sea." },
      },
    },
    senjin = {
      lines = { { id = "s_default", text = "Yes, mon, my family fish off the coast there, south and east of here. I came to Razor Hill because the orcs had more wounded than healers, but I still go home whenever the tide be right." } },
      choices = { { text = "Do you miss the Echo Isles?", next = "senjin_isles" } },
    },
    senjin_isles = {
      lines = { { id = "si_default", text = "Every day, and every Darkspear does, since Zalazane took them with his voodoo and his hexed puppets. Master Gadrin in the village be trying to drive him out, and you should help him if your road go that way." } },
      choices = {
        { text = "Zalazane deserves a hard end.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "His puppets were your people. I hope they can be saved.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grunts = {
      lines = { { id = "g_default", text = "At first they looked at my tusks and then looked away, mon, but a grunt with a spear through his leg stops caring who heals him. Now they bring me fish and call me auntie, which I pretend not to like." } },
      choices = { { text = "That's a good place to be.", next = "BACK", fx = { affinity = 1 } } },
    },
    forsaken = {
      lines = { { id = "f_default", text = "Tai'jin trusts what you do, mon, more than what you be. If you heal the grunts and do not poison them, then you be a priest to me, cold hands or not." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That be beyond Tai'jin, mon. Ask Orgnil or the commander in the barracks." } },
  },
}

---------------------------------------------------------------------------
-- Sen'jin Village
---------------------------------------------------------------------------

-- Un'Thuwa: Sen'jin's mage trainer.
P:NPC {
  key = "unthuwa", id = TODO_NPC("Un'Thuwa"), name = "Un'Thuwa", title = "Mage Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "senjin" }, temper = { "dry" }, values = { "curious", "proud" },
  notices = { "class", "arcane" },
  impression = {
    first = "Un'Thuwa teaches magic in Sen'jin Village and is quietly proud that a Darkspear can bend the arcane as well as any elf. He is dry about it, and keen to hear where a student learned their first spell.",
    third = "{name} met Un'Thuwa, the troll mage trainer of Sen'jin Village.",
  },
  greetings = {
    { id = "g_mage", when = { class = "MAGE" }, text = "Another student of the arcane, mon. Come in, before you set something on fire out there." },
    { id = "g_other", when = { ["not"] = { class = "MAGE" } }, text = "You not be a mage, I can tell, but you can still stand there and admire the hut." },
  },
  notice = {
    { id = "n_orcmage", cat = "class", when = { class = "MAGE", race = "Orc" },
      text = "An orc mage, that be a rare bird, mon. Your people's shaman will frown at you, so you better get good enough that they stop." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Safer? No, mon, but it be honest about what it costs. You ask the fire for help and maybe it say no, but when I call it there be no asking, and that be the trouble with the arcane, because nobody tell you when to stop." } },
      choices = {
        { text = "Power should answer to something, whether spirits or study.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Nobody should tell a caster when to stop.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Un'Thuwa, and I teach the arcane to trolls, and to orcs brave enough to try it. Most of the village fish or fight, but there be a few of us who rather study." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, come to see a troll do magic the hard way. You ask the elements for help and I make them listen, so let's not argue about which be better." },
      },
      choices = {
        { text = "Is the arcane any safer than what the spirits give?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Where did a Darkspear learn magic?", next = "learn" },
        { text = "What does the village think of mages?", next = "village" },
        { text = "Can magic help against Zalazane?", next = "zalazane" },
        { text = "Goodbye.", next = "END" },
      },
      again = { { id = "h_again", text = "Something more, mon? Ask, the fire can wait." } },
    },
    learn = {
      lines = { { id = "l_default", text = "Trolls been working magic since the humans were still herding goats, mon, whatever the elves say about it. Mine came from old scraps and a lot of burned fingers, and the Horde gave me a place to teach it." } },
      choices = { { text = "Before the elves? Really?", next = "learn_elves" } },
    },
    learn_elves = {
      lines = { { id = "le_default", text = "Big and proud, mon, with temples and witch doctors and mages in Zul'Aman and the jungles of Stranglethorn. The Darkspear were never one of the great tribes, but we remember the stories, and a story be a kind of spellbook too." } },
      choices = {
        { text = "Old stories are worth keeping.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Old stories don't matter. What you do now matters.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    village = {
      lines = { { id = "v_default", text = "The witch doctors call it cold magic and keep to their loa, and the hunters think I be soft for sitting inside. Master Gadrin respects it, though, and when Gadrin respects you, the village follows." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    zalazane = {
      lines = { { id = "z_default", text = "Fire burns a voodoo puppet same as anything else, mon, but Zalazane's power be his own kind of thing. Gadrin knows it best, so ask him if you want to go to the isles." } },
      choices = { { text = "I'll ask Gadrin.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Un'Thuwa knows spells, not that. Ask Master Gadrin, he knows everyone's business." } },
  },
}
