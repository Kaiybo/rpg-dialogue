-- Grom'gol Base Camp: the Horde's foothold on the coast, and the road to Stonard. Voice: bibles/stranglethorn.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "aggrogosh", id = TODO_NPC("Commander Aggro'gosh"), name = "Commander Aggro'gosh",
  bible = "bibles/stranglethorn.md", role = "soldier", tier = "major",
  communities = { "gromgol" }, temper = { "blunt" }, values = { "dutiful", "stern" },
  notices = { "kit", "race" },

  impression = {
    first = "Commander Aggro'gosh asked whether I'd come to work before he asked anything else. Grom'gol holds because he simply refuses to let it fall.",
    third = "{name} met Commander Aggro'gosh, who keeps Grom'gol and the road to Stonard open against ogres and the Bloodscalp.",
  },

  greetings = {
    { id = "g_camp", text = "This is Grom'gol, and everyone in Grom'gol works. Are you here to work?" },
    { id = "g_back", when = { metBefore = true }, text = "You again? Good, because the last grunt I sent to the river came back without his boots, and I need hands." },
    { id = "g_away", when = { away = 14 }, text = "You were gone {away}, and Grom'gol did your work for you. Now you're back, so work." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You're stronger than when you last stood here. Good, because the jungle has gotten no kinder." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The camp says you've worked hard for Grom'gol. That's the only praise I give, and I just gave it." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear you were caught in a lie in my camp. Everyone in Grom'gol works, and nobody here works for a liar." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's in pieces, so get it to the forge before you go out again. A dead grunt hauls no crates." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear? Good. Your cousins out past the walls are less friendly, so show them what a troll of the Horde is worth." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "If you can hold a line against the Bloodscalp and patch up whoever falls on it, you can serve anywhere I command. The Light's a strange thing to see on one of the dead, but the ogres won't stop to wonder about it, and neither will I." } },
      choices = {
        { text = "Then command me. The road comes first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll help, Commander, but on my own terms.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = {
        { id = "xhcast_default", text = "Fire on the walls when the Bloodscalp come at night, and healing in the tents when they leave. Spells win fights I'd otherwise pay for in grunts, so I value them, but I don't trust anyone who loves their power more than their duty." },
      },
      choices = {
        { text = "Duty first. Point me at the wall.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight my own way, Commander, not by your orders.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The old ones remember, and they don't talk about it much, because the warlocks led us to the demon's blood and called it strength. Thrall brought the shamans back so we'd never need that sort of strength again, and I mean to keep it that way." } },
      choices = {
        { text = "The elements give strength without that price. That's the better way.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Strength is strength, Commander, however it's bought.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "They fight it, mostly. The jungle bites back, and they bite harder. But I have told them not to burn what they cannot eat, and they listen, because I am the one who feeds them." } },
      choices = {
        { text = "That is wise. The land remembers who burned it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A war camp has no room for such worries.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because they want us gone, and they're waiting for the moment our walls are thin enough to break. If you can slip into their camps and learn when they mean to strike, Grom'gol will hold, and that's all I ask." } },
      choices = {
        { text = "I'll find their plans and bring them back.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Better to strike them first, before they can plan.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The Bloodscalp and the Skullsplitter have their own dark priests, and they fear any power they don't control. A demon prowling outside our walls would bring every troll on the ridges down on us, and I've no men to spare for that fight." } },
      choices = {
        { text = "I'll keep my demon inside the walls.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them fear us. Fear makes them cautious.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Good, because the far seer can't be everywhere, and my grunts fight harder with the elements at their backs." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Grom'gol needs healers more than it needs sermons, so keep the prayers short and the bandages tight." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. Can you burn a path through the Mosh'Ogg? Then I have a place for you on the road." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid of the tauren. Good. My grunts fight better with one of your kind nearby to mend them." },
        { id = "h_default", key = true,
          text = "Commander Aggro'gosh. This camp keeps the road to Stonard open, and that road feeds the Horde. The ogres and the Bloodscalp make it hard, and I make it happen anyway." },
        { id = "h_defense", tags = { "news" }, when = { questActive = TODO_QUEST("The Defense of Grom'gol") },
          text = "Something out there tests our walls every night. Go out and test it in return, and test it harder." },
        { id = "h_defense_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Defense of Grom'gol"), days = 3 } },
          text = "The caravan masters say the road is quieter since you went out, and caravan masters never say anything kind. You did your duty, and you did it with honor." },
        { id = "h_road", when = { metBefore = true }, text = "Three caravans reached Stonard this week, all three, and the ogres got none of them. Write that down; I want to read it later." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The Bloodscalp drums are close tonight. Let them drum, for we have walls, and all they have is drums." },
        { id = "h_zeppelin", when = { race = "Scourge" },
          text = "Off the zeppelin from the Undercity, are you? Good. The Dark Lady's people don't tire and don't complain, which makes you the best grunts I've had all month." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. Good, because the Bloodscalp trolls on the ridges are watching Grom'gol day and night, and I need someone who can watch them back without being seen." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. I'll take any strength that keeps Grom'gol standing, but keep your demon inside the walls, because the trolls here are superstitious, and I don't need them any angrier." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. I don't care what you pray to, only whether you're here to work, because the road to Stonard needs keeping." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it; the next caravan won't guard itself." },
        { id = "h_again2", text = "Speak, then, but speak while you walk if you can." },
      },
      choices = {
        { text = "Do your grunts still remember the shamans from before the warlocks?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does Grom'gol need from its spellcasters, Commander?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Do your grunts respect this jungle, or only fight it?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "How's the supply line?", next = "road" },
        { text = "What do you need most?", next = "need" },
        { text = "Who are you watching the walls for?", next = "threats" },
        { text = "Who else is in this camp?", next = "camp" },
        { text = "The Darkspear came from this jungle, Commander.", next = "darkspear", when = { race = "Troll" } },
        { text = "An orc mage. Does that trouble you?", next = "orc_mage", when = { race = "Orc", class = "MAGE" } },
        { text = "Thunder Bluff sent me. I'm a Windshaper.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Give me a post on the wall, Commander.", next = "k_warrior", when = { class = "WARRIOR" } },
        { text = "The living sweat in this jungle. I don't.", next = "k_scourge", when = { race = "Scourge" } },
        { text = "I can keep the raptors off your caravans.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "Why are the Bloodscalp watching Grom'gol, Commander?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do the trolls fear warlocks, Commander?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Can a Forsaken paladin serve at Grom'gol, Commander?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll get to work.", next = "END", fx = { affinity = 1, standing = { gromgol = 1 } } },
      },
    },

    road = {
      lines = {
        { id = "r_default", text = "Stonard sits in the swamp past the mountains, and every caravan that reaches it in one piece is a victory. I count every one." },
        { id = "r_ruag", when = { heardLine = "ruag.h_default" },
          text = "You've met Ruag in Stonard, so you know he counts them at the other end. Between the two of us not one crate goes missing without somebody shouting about it." },
      },
      choices = {
        { text = "Who's hitting the caravans?", next = "road_raiders" },
        { text = "Why does Stonard matter so much?", next = "road_stonard" },
        { text = "Then I'll help you count.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Stonard's caravans are someone else's problem.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    road_raiders = {
      lines = {
        { id = "rr_default", text = "Mosh'Ogg ogres come down from the east, and a band of them sits in the Mizjah Ruins to the southeast and ambushes anything with wheels. The Bloodscalp steal our rations at night, and that's an insult as much as a loss." },
      },
      choices = {
        { text = "Did you try talking to the ogres?", next = "road_warned", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_warned = {
      lines = {
        { id = "rw_default", text = "We came here to supply Stonard, not to make war on every tribe in the jungle, and I warned them. They kept on ambushing my caravans, so now I warn them with axes." },
      },
      choices = { { text = "Fair. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    road_stonard = {
      lines = {
        { id = "rs_default", text = "Stonard is one of the oldest orc towns in Azeroth, built when the Dark Portal first opened, and it's the Horde's eyes on the swamp and the Blasted Lands. Eyes don't see far on an empty stomach, so we feed them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    need = {
      lines = { { id = "n_default", text = "More grunts, fewer ogres, and one week without rain. I'll settle for the first." } },
      choices = {
        { text = "Where should a new grunt start?", next = "need_start" },
        { text = "I'm not a grunt.", next = "need_proud", fx = { trait = { proud = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    need_start = {
      lines = {
        { id = "ns_default", text = "Outside the gate, where the lashtail raptors have grown bold enough to stalk the caravans. Thin them out, and when you've made a real dent, come back to me for something harder." },
      },
      choices = { { text = "Raptors first, then.", next = "BACK", fx = { affinity = 1, standing = { gromgol = 1 } } } },
    },
    need_proud = {
      lines = {
        { id = "np_default", text = "In my camp everyone is a grunt, and I'm the grunt who gives the orders. Wear the word with pride or wear it with a scowl, but carry the crate either way." },
      },
      choices = {
        { text = "Understood, Commander.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'm nobody's grunt, Commander.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    threats = {
      lines = {
        { id = "t_default", text = "Jungle trolls from the ruins up the coast, naga out of the water, and the Alliance, who come down from Duskwood or walk over from Booty Bay looking for an easy fight. These walls were built thick for all three." },
      },
      choices = {
        { text = "Booty Bay is neutral, isn't it?", next = "threats_bay" },
        { text = "Naga? Here?", next = "threats_naga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    threats_bay = {
      lines = {
        { id = "tb_default", text = "The goblins sell to anyone with coin, and their Bruisers keep the peace inside their town. Outside it, a human who drank with you last night will cut your throat on the road, so keep your axe loose." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    threats_naga = {
      lines = {
        { id = "tn_default", text = "They crawl up from the sea to poke at old ruins and holy springs along the coast. Ask Mok'thardin about it; the far seer had someone chase a whole expedition of them off a cliff." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    camp = {
      lines = {
        { id = "c_default", text = "Nimboya and Kin'weelay came from Orgrimmar on the Darkspear's business, Mok'thardin works enchantments by the fire, and Thulbek keeps the inn. Every one of them pulls their weight, or they'd hear about it from me." },
      },
      choices = {
        { text = "The trolls aren't here for your caravans.", next = "camp_trolls" },
        { text = "And Thulbek?", next = "camp_thulbek" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_trolls = {
      lines = {
        { id = "ct_default", text = "No, they're hunting their chief's lost son, and that's Vol'jin's business, not mine. But a Bloodscalp killed for Nimboya is a Bloodscalp who won't steal my rations, so I call it a fair trade." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "yenniku" } } } },
    },
    camp_thulbek = {
      lines = {
        { id = "cth_default", text = "Thulbek feeds my grunts and listens to their lies about gorillas, which saves me from doing either. A camp without a cook is a camp that mutinies by the third week." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    darkspear = {
      lines = {
        { id = "d_default", text = "So I'm told, and now the ones who stayed behind would take your head for wearing the Horde's colors. Show them what they lost when your tribe walked away with the Warchief." },
      },
      choices = {
        { text = "They're not my people anymore.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Some of them still are.", next = "BACK", fx = { align = { order = -1 }, affinity = 1, trait = { kind = 1 } } },
      },
    },
    orc_mage = {
      lines = {
        { id = "om_default", text = "The last orcs who played with that kind of power turned our skin green and our homeland to dust, so yes, it troubles me. But if your fire lands on ogres and not on my caravans, I'll keep my troubles to myself." },
      },
      choices = {
        { text = "My fire knows where to land.", next = "BACK", fx = { align = { light = -1 }, affinity = 1, trait = { proud = 1 } } },
        { text = "It troubles me too, sometimes.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    skyborne = {
      lines = {
        { id = "sk_default", text = "I've heard Thunder Bluff speaks for your people, and the tauren don't give their word lightly. I know nothing about your sky, but in my camp you'll be judged on whether you carry your share, like everyone else." },
      },
      choices = { { text = "That's all I ask.", next = "BACK", fx = { affinity = 2, standing = { gromgol = 1 } } } },
    },
    k_warrior = {
      lines = {
        { id = "xwa_default", text = "A post I can give you, and a sore back to go with it. The raptors test the north gate at dawn and the Bloodscalp test it at dusk, and in between the grunts complain about the heat, which is the only fight they ever win." },
        { id = "xwa_warsong", when = { origin = "orc_warsong_kin" },
          text = "Warsong blood, I'd guess, from how you stand like you're waiting for an order to charge. There's no charging here, only holding; the raptors test the north gate at dawn and the Bloodscalp at dusk." },
      },
      choices = {
        { text = "Holding is a soldier's honor. I'll take dawn.", next = "BACK", fx = { align = { order = 1 }, affinity = 2, standing = { gromgol = 1 } } },
        { text = "Holding is how you lose. Let me hunt the raiders.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Who's raiding the caravans?", next = "road_raiders" },
      },
    },
    k_scourge = {
      lines = {
        { id = "xsc_default", text = "No, you don't, and I've noticed the raptors leave your kind alone, which my grunts find more disturbing than the raptors. The zeppelin to the Undercity is the busiest one I've got, so you'll find a few of your own here, mostly on the tower complaining about the damp." },
      },
      choices = {
        { text = "The damp is the worst of it, Commander.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Send me where your grunts won't go.", next = "BACK", fx = { affinity = 2, standing = { gromgol = 1 } } },
      },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Then you'll be more use than my whole north wall, because the raptors don't respect a wall but they respect a hunter. Thin out the lashtails between here and the river and I'll count one more caravan through every week." },
        { id = "xhu_head", when = { origin = "troll_headhunter" },
          text = "A headhunter, back in the jungle that made your people. The lashtails between here and the river are yours, and so are any Bloodscalp you find, though Nimboya will want to count the heads." },
      },
      choices = {
        { text = "Only what the camp needs, no more.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll hunt until the jungle learns to fear us.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "My scouts report everything that moves on the Stonard road. Ask what you need, and don't waste my time." },
    },
    yenniku = { { id = "tp_yenniku", text = "That's Nimboya's business, and he's welcome to it, as long as he pulls his weight while he's in my camp." } },
    background = {
      { id = "tp_ba", text = "I'm the Commander of Grom'gol, sent by the Warchief to keep the road to Stonard open. Everything that happened to me before this camp happened to someone with far less to do.", next = "road" },
      { id = "tp_ba2", text = "I command a camp, I guard caravans, and I count crates. If you want a song about it, ask Thulbek to make one up." },
    },
    advice = { { id = "tp_ad", text = "Never walk the jungle road alone at night, and never trust the quiet. When the birds stop, something bigger than you is listening." } },
    _none = { { id = "tp_none", text = "That's not my problem. Find someone with time to talk." } },
  },
}

P:NPC {
  key = "nimboya", id = TODO_NPC("Nimboya"), name = "Nimboya",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "gromgol" }, temper = { "wary" }, values = { "loyal", "stern" },
  notices = { "race" },

  impression = {
    first = "Nimboya came from Orgrimmar to find a chief's lost son, Yenniku, and he says he will not go home without him. I believe him.",
    third = "{name} met Nimboya at Grom'gol, a troll who has sworn not to leave Stranglethorn without the chief's lost son, Yenniku.",
  },

  greetings = {
    { id = "g_wary", text = "Nimboya don't know you. Say what you come for, and say it quick." },
    { id = "g_back", when = { metBefore = true }, text = "You again, good. You keep coming back like this, maybe you be useful." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear blood. Then you understand why I be here, so far from Durotar." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Maybe it help, maybe not, but I take any help for the chief's son. The Bloodscalp hold him with their spells, and if your Light can see through troll magic, then you be very welcome in this jungle." } },
      choices = {
        { text = "Then I'll help bring him home. A lost son deserves it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The chief's son is your burden, Nimboya, not mine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Maybe you can, but the Bloodscalp don't leave a trail they don't want followed, and I think the boy be in their camps now. Find me their paths through the jungle, and Kin'weelay and I do the rest." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Maybe you can, but the Bloodscalp don't leave a trail they don't want followed, and I think the boy be in their camps now. Find me their paths through the jungle, and Kin'weelay and I do the rest. Your {pet} smell the Bloodscalp before we see them, maybe, and that be worth more to me than ten grunts with torches." },
      },
      choices = {
        { text = "I'll scout patiently, and we strike only when the boy is safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let me loose my beast on their camp and drive them out.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Somewhere north, in the Bloodscalp ruins, where they keep their captives close and their headhunters closer. Every time Nimboya come near, the drums start, so I need somebody who can get in without being heard." } },
      choices = {
        { text = "I'll find him and bring him home.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Rescues are risky. Maybe trade for him instead.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Nimboya.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I use anything that bring him home alive, but a demon be no promise of that. The Bloodscalp would kill him before they let him be taken by force, so I want cunning, not fear, if you have some to spare." } },
      choices = {
        { text = "Then I'll use cunning, not fear.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear works faster than cunning. Let me try.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The raptors and the panthers see everything, and the Bloodscalp hunt them, so the beasts know where the trolls camp. If you can listen to them the way your elders listen to the Earth Mother, maybe we find the boy before the Bloodscalp decide what to do with him." } },
      choices = {
        { text = "Then I'll listen to the beasts, and we'll bring Yenniku home.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The beasts owe us nothing. We find him with our own eyes.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The Bloodscalp put a hold on the boy's spirit, and it take more than a blade to break it, maybe. If your prayers can touch a soul held that tight, you stay close, because Nimboya will need you on the day we find him." } },
      choices = {
        { text = "I'll pray for him and stand with you, Nimboya.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't free him, Nimboya. Strength will.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Maybe it could, mon, if your magic can tell a lost troll from a Bloodscalp at a hundred paces, because the boy wear their paint now. Burn their camps if you must, but you look twice before you throw your fire, because the chief's son might be standing in it." } },
      choices = {
        { text = "I'll take care, Nimboya. The boy comes first.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If they stand together, Nimboya, they burn together.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Bloodscalp", min = 30 } }, text = "The Bloodscalp camps be quieter since you start walking through them, mon, and quiet Bloodscalp be the best kind, while Nimboya keep looking for the boy." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage of the Horde. Your fire be welcome against the Bloodscalp, and Nimboya hope your eyes be sharp for one lost young troll among them." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. Pray for Yenniku, then, because the Bloodscalp hold him somewhere in this jungle, and Nimboya need every voice that can reach the spirits." },
        { id = "h_default", key = true,
          text = "The chief's son be lost in this jungle, Yenniku. I come from Orgrimmar to find him, and I don't go back without him." },
        { id = "h_hunt", tags = { "news" }, when = { questActive = TODO_QUEST("Hunt for Yenniku") },
          text = "The Bloodscalp got him, I think, so hunt them to the north and bring me their tusks. Show Nimboya you can make prey of them before we go further." },
        { id = "h_heads", when = { questActive = TODO_QUEST("Headhunting") },
          text = "Bring me the shrunken heads the Bloodscalp headhunters carry, many of them, and Nimboya look at every one. I pray to the Great Serpent his face not be among them." },
        { id = "h_clanheads", when = { questActive = TODO_QUEST("Bloodscalp Clan Heads") },
          text = "Gan'zulah and Nezzliok sit deep in Zul'Kunda, and they know where the boy be. Bring their heads to the cauldron, and we make the dead talk." },
        { id = "h_grim", when = { questActive = TODO_QUEST("Grim Message") },
          text = "Time the Witherbark learn what Darkspear do to those who betray the Warchief. Make it a message they remember." },
        { id = "h_saving", when = { questActive = TODO_QUEST("Saving Yenniku") },
          text = "Kin'weelay tell me you go after Yenniku with the gem. Whatever they done to him, we undo it, and I be waiting right here." },
        { id = "h_saved", tags = { "news" }, when = { questRecent = { TODO_QUEST("Saving Yenniku"), days = 7 } },
          text = "The chief's son's soul be free of Zanzil, because of you. The Darkspear will sing your name, and we carve your tale in stone so it never wash away." },
        { id = "h_trolkalar", when = { questDone = TODO_QUEST("Trol'kalar") },
          text = "Zengu send Trol'kalar down from Hammerfall, the humans' troll-killer sword, and now it hang here waiting for the Gurubashi. You had a hand in that too, I hear." },
        { id = "h_dream", when = { metBefore = true }, text = "Nimboya dream of Yenniku last night, small, like when he was a boy. Nimboya wake up and sharpen the spear." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. You could slip into the Bloodscalp camps and look for Yenniku, maybe, where a warrior like me only start a war." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Your power might frighten the Bloodscalp into giving up Yenniku, but I not risk the boy's life on a demon's temper." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, mon. Your eyes be good in this jungle, and good eyes might find the tracks of Yenniku where mine see only mud." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid of the tauren, in this jungle. You know the beasts, and the beasts here know where the Bloodscalp hide Yenniku, if only they could tell us." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one with the Light, mon. I hear the Forsaken have strange priests now, but you be stranger still." },
      },
      again = {
        { id = "h_again", text = "What else? Nimboya listening, but not for long." },
        { id = "h_again2", text = "Ask, then, and I tell you what I can." },
      },
      choices = {
        { text = "Who is Yenniku?", next = "yenniku" },
        { text = "Do the jungle trolls fear a warrior's axe, Nimboya?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Who do you think took him?", next = "bloodscalp" },
        { text = "Have any trolls betrayed the Horde?", next = "witherbark" },
        { text = "Do the Darkspear miss this jungle?", next = "walls" },
        { text = "I'm Darkspear. Tell me what the chief needs.", next = "kin", when = { race = "Troll" } },
        { text = "His soul is free. Is it over?", next = "after", when = { questDone = TODO_QUEST("Saving Yenniku") } },
        { text = "Could I track Yenniku through the jungle, Nimboya?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What can a priest do for Yenniku, Nimboya?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could my magic help find Yenniku, Nimboya?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I'll help you find him.", next = "END", fx = { affinity = 2, align = { honor = 1 }, learn = { "yenniku" } } },
        { text = "The spirits might know where Yenniku is.", next = "k_shaman", when = { class = "SHAMAN" } },
        { text = "Where do you think the Bloodscalp hold Yenniku, Nimboya?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Would you use a demon to rescue Yenniku, Nimboya?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Could the jungle's beasts really lead us to Yenniku, Nimboya?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Would the Light help you find Yenniku, Nimboya?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Good hunting, but the chief's son is no business of mine.", next = "END", fx = { align = { honor = -1 } } },
      },
    },

    yenniku = {
      big = true,
      lines = {
        { id = "y_default", text = "Vol'jin's youngest son. It be the custom of our people that he go to the Gurubashi of Zul'Gurub, and when the Darkspear left with Thrall, the boy be lost to us." },
      },
      choices = {
        { text = "Your people gave a child away?", next = "yenniku_custom" },
        { text = "The chief trusts you with this?", next = "yenniku_trust" },
        { text = "Something else.", next = "BACK", fx = { learn = { "yenniku" } } },
      },
    },
    yenniku_custom = {
      lines = {
        { id = "yc_default", text = "It be an old way, older than Nimboya and older than Orgrimmar, and I don't argue it with strangers. What matter now be bringing him home, not how he come to be gone." },
      },
      choices = { { text = "Fair. Something else.", next = "BACK", fx = { learn = { "yenniku" } } } },
    },
    yenniku_trust = {
      lines = {
        { id = "yt_default", text = "The chief send me from distant Orgrimmar back to this jungle, and that be trust enough. If I fail him, I don't go back, so I don't fail him." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "yenniku" } } } },
    },

    bloodscalp = {
      lines = {
        { id = "bs_default", text = "The Bloodscalp, mon, and their witch doctor, Nezzliok, know where the boy be. Alive or dead, he going to tell me." },
      },
      choices = {
        { text = "How does a dead troll tell you anything?", next = "bloodscalp_cauldron" },
        { text = "And their chief?", next = "bloodscalp_chief" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bloodscalp_cauldron = {
      lines = {
        { id = "bc_default", text = "Kin'weelay keep a cauldron bubbling by the north gate, and the heads go in, and the heads talk. The Bloodscalp won't speak to us freely, so we force the truth from their dead lips." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    bloodscalp_chief = {
      lines = {
        { id = "bch_default", text = "Gan'zulah, and if Yenniku die by Bloodscalp hands, may a curse sit on his spirit for six hundred years. Nimboya don't curse lightly, mon." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    witherbark = {
      lines = {
        { id = "w_default", text = "The Witherbark of the Hinterlands, far north past Tarren Mill, once stand with the Horde, and they betray Thrall. Betrayal must cost something, or everybody try it." },
      },
      choices = {
        { text = "What message do you want sent?", next = "witherbark_pike" },
        { text = "Something else.", next = "BACK" },
      },
    },
    witherbark_pike = {
      lines = {
        { id = "wp_default", text = "My own pike, heavy with their skulls, driven into the ground at one of their villages, Hiri'watha or Zun'watha. It be grim work, but there be honor in it if they heed it." },
      },
      choices = {
        { text = "I'll carry your pike.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "That's cruel.", next = "BACK", fx = { align = { light = 1 }, opinion = { witherbark_pike = "against" } } },
      },
    },

    walls = {
      lines = {
        { id = "wl_default", text = "This jungle be the Darkspear's home once, and the trolls who stayed don't like us much now. Nimboya don't fear no Bloodscalp or Skullsplitter, but I don't mind these high walls at night either." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },

    kin = {
      lines = {
        { id = "k_default", text = "Then you hear me as kin, not as some hired axe. The chief need his son's spirit back from whoever hold it, and every Darkspear who help be standing with Vol'jin himself." },
      },
      choices = {
        { text = "For Vol'jin, then.", next = "BACK", fx = { affinity = 3, align = { order = 1 } } },
        { text = "I help for the boy's sake, not for any chief.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Does Vol'jin speak of him?", next = "kin_chief" },
      },
    },
    kin_chief = {
      lines = {
        { id = "kc_default", text = "The chief carry it quiet, the way a chief must. He don't speak of it to me, and I don't ask, because I be the answer he sent." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    after = {
      lines = {
        { id = "a_default", text = "His soul be free, and I thank you for it with all my blood. But his body still walk with Zanzil on the Cape, empty, and that be a thing Nimboya will carry home." },
      },
      choices = {
        { text = "It's still a victory.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then Zanzil should answer for it.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 } } },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "They fear nothing much, mon, not even the Gurubashi's own gods. But they respect strength, so you show them strength and they'll keep their distance from Grom'gol." } },
      choices = {
        { text = "Then I'll show them strength, without cruelty.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll show them strength. Mercy's their problem.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    k_shaman = {
      lines = {
        { id = "xsh_default", text = "The spirits know, mon, but Zanzil's hold on the boy is the kind the spirits won't touch, and Kin'weelay say so first. Ask them all the same, and if they answer you clearer than they answer us, you tell Nimboya before you tell anyone." },
      },
      choices = {
        { text = "I'll ask them, and I'll tell you first.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Who is Yenniku?", next = "yenniku" },
      },
    },
  },

  topics = {
    yenniku = { { id = "tp_yenniku", text = "Every day he be gone, the chief carry it. I carry it too.", next = "yenniku" } },
    background = { { id = "tp_ba", text = "Nimboya be Darkspear, sent by the chief from Orgrimmar. That all you need to know, and more than most get." } },
    advice = { { id = "tp_ad", text = "The Bloodscalp hunt heads, so keep yours low in the ruins along the coast. They come from above, mon, always from above." } },
    _none = { { id = "tp_none", text = "Nimboya got one thing on his mind, and that not it." } },
  },
}

P:NPC {
  key = "kinweelay", id = TODO_NPC("Kin'weelay"), name = "Kin'weelay",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "gromgol" }, temper = { "playful" }, values = { "loyal", "curious" },
  notices = { "class", "form" },

  impression = {
    first = "Kin'weelay complained that the spirits are rude, and laughed about it. Beneath the joking there is a witch doctor who takes the unseen very seriously.",
    third = "{name} met Kin'weelay, a Darkspear witch doctor sent from Orgrimmar to help Nimboya with what cannot be seen.",
  },

  greetings = {
    { id = "g_spirits", text = "The spirits told me somebody coming, but they don't say who. Spirits be rude like that, mon." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the spirits remember your face, and that be a fine thing, mostly." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You hear them too, the ones nobody else hear? Then we talk easy, you and me." },
    { id = "n_druid", cat = "form", when = { class = "DRUID" },
      text = "A shapechanger. The wild spirits like you, since you wear their skins with respect, but the Bloodscalp won't like you at all." },
  },

  react = {
    { id = "r_cat", on = "form", when = { form = "cat" }, text = "Heh! Big cat in Grom'gol, and the grunts don't even blink. You walk it well, mon." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They be rude about it, as always. Some say the Light shouldn't sit in a dead body, and some say a dead body be the only place it found room to sit, and I tell them both to hush, because you be standing right here." } },
      choices = {
        { text = "The Light found room in me. I'll honor that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The spirits can say what they like. I don't need their blessing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a warrior hide nothing, mon, you stand in the open and shout who you be, and the spirits respect that more than any whisper. The Bloodscalp hide behind their juju, and that be why the spirits laugh at them." } },
      choices = {
        { text = "I'll fight in the open. There's no shame in being seen.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Laughing spirits or not, I'll use whatever wins.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They do, mon, and a hunter who take only what he need be left alone, but one who kill for fun get bad luck on the trail. Mok'thardin pull old power out of the bones, and I tell him to thank them, but he just nod at me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They do, mon, and a hunter who take only what he need be left alone, but one who kill for fun get bad luck on the trail. Mok'thardin pull old power out of the bones, and I tell him to thank them, but he just nod at me. Your {pet} got a strong spirit in it, mon, and it like you, so treat it right and it never let you down." },
      },
      choices = {
        { text = "I take what I need and thank the beast for it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Spirits or no spirits, a kill is a kill.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = {
        { id = "xhcast_priest", when = { class = "PRIEST", race = "Troll" }, text = "You feel it too, I think, if the loa be speaking to you. Zul'Gurub be where the Gurubashi still call on the Soulflayer, and the loa don't want him in their jungle any more than Kin'weelay do." },
        { id = "xhcast_default", text = "Zul'Gurub, mon, where the Gurubashi still remember the Soulflayer. Old blood be calling to old blood in those ruins, and every troll in Stranglethorn feel it in their bones, even the ones who say they don't." },
      },
      choices = {
        { text = "The Darkspear should stand against it, and I'll stand too.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Power that old could be useful, if someone controlled it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The spirits remember the Gurubashi, and they remember Hakkar too, so they be slow to trust any troll. But the elements don't care for empires, mon; they listen to anyone who listen first." } },
      choices = {
        { text = "Then I'll listen first, and speak softly in their jungle.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The spirits will answer me whether they trust me or not.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The spirits notice everyone, mon, but they be paying special attention to the quiet ones, because quiet ones go where they shouldn't. Bring Kin'weelay something from the Bloodscalp shrines, and the spirits might start liking you." } },
      choices = {
        { text = "I'll respect the spirits and their shrines.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The shrines are fair game. Spirits or no spirits.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Kin'weelay.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because it be taking power from the air without asking, mon, and the spirits be very touchy about manners. Kin'weelay asks before he takes, and that be why the spirits still talk to him, even when they be rude about it." } },
      choices = {
        { text = "Then I'll ask before I take. Manners matter.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Power belongs to those who can take it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman come to Grom'gol! The spirits be talking loud in this jungle, mon, so you be hearing them better than most." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, mon! If you be troll, the loa be watching you close, and if you be Forsaken, the spirits just be confused, and so be I." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock, mon. The spirits go quiet round you, and when the spirits go quiet, Kin'weelay pay attention." },
        { id = "h_default", key = true,
          text = "Kin'weelay, witch doctor of the Darkspear. Orgrimmar send me to help Nimboya: he use his spear, and I use what can't be seen." },
        { id = "h_reef", when = { questActive = TODO_QUEST("The Vile Reef") },
          text = "Under the water at the Vile Reef, old troll carving be waiting. Bring me a piece of it. Mind the murlocs; they don't read." },
        { id = "h_necklaces", when = { questActive = TODO_QUEST("Bloody Bone Necklaces") },
          text = "The Bloodscalp wear bloody bone round their necks. Bring me enough, and I make something useful out of something ugly." },
        { id = "h_split", when = { questActive = TODO_QUEST("Split Bone Necklace") },
          text = "Now the Skullsplitter, to the southeast, who the Darkspear been warring with for years. Bring me their split bone necklaces, and you earn the friendship of my tribe." },
        { id = "h_marg", tags = { "news" }, when = { questActive = TODO_QUEST("The Troll Witchdoctor") },
          text = "There be an angry spirit hanging about you, an orc with a job left undone. Who you carrying, and what he want from Kin'weelay?" },
        { id = "h_fate", tags = { "news" }, when = { questActive = TODO_QUEST("The Fate of Yenniku") },
          text = "I look for the boy with my magic, and what I find, I don't like. His body walk here, but his spirit not with it." },
        { id = "h_crystals", when = { questActive = TODO_QUEST("The Singing Crystals") },
          text = "Them crystals sing, if you know how to listen. I need their song for what come next." },
        { id = "h_eye", when = { questActive = TODO_QUEST("The Mind's Eye") },
          text = "Mai'Zoth hold the Mind's Eye deep in the Mosh'Ogg mound, and he be strong even without it. Take friends, mon, and take them all the way in." },
        { id = "h_spirits", when = { metBefore = true }, text = "De jungle spirits be loud here, mon, louder than at home. Dey not friendly and dey not unfriendly, dey just loud." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, mon! You move quiet like the spirits do, and they be noticing you too, so watch your step around Kin'weelay's fire." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, mon! Your magic be loud and bright, and the spirits don't like that much, so keep it quiet around Kin'weelay's fire." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon! The spirits like your kind more than you think, because you be loud and honest, and they always know where you are." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, mon! The beasts out here got spirits in them too, old ones, and they be watching how you take them down." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "Ah, the spirits be talking all at once now, mon. A Forsaken with the Light in those bones, and they don't know if they should be cheering or hiding." },
      },
      again = {
        { id = "h_again", text = "More questions? The spirits got more answers, if they in the mood." },
        { id = "h_again2", text = "Go on, mon, Kin'weelay still here, and so be the spirits." },
      },
      choices = {
        { text = "Do the jungle's spirits trust Horde shamans, or only the Darkspear?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What dark magic stirs in this jungle, Kin'weelay?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "What can't be seen?", next = "unseen" },
        { text = "Why fight the Bloodscalp, witch doctor?", next = "trophies" },
        { text = "Are there old troll places on this coast?", next = "reef" },
        { text = "Is there hope for the boy Nimboya seeks?", next = "hope" },
        { text = "I carry an orc's head from Dustwallow.", next = "marg", when = { questActive = TODO_QUEST("The Troll Witchdoctor") } },
        { text = "A Darkspear warlock. What do the spirits make of me?", next = "troll_warlock", when = { race = "Troll", class = "WARLOCK" } },
        { text = "I'm a Windshaper. Do your spirits know mine?", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Do the loa have anything to say about the dead, witch doctor?", next = "k_scourge", when = { race = "Scourge" } },
        { text = "Do the spirits really notice rogues, Kin'weelay?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why don't the spirits like a mage's magic, Kin'weelay?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why would the spirits like a warrior, Kin'weelay?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do the beasts' spirits watch the hunters, Kin'weelay?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do the spirits say about me, Kin'weelay?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, witch doctor.", next = "END" },
      },
    },

    unseen = {
      lines = {
        { id = "u_default", text = "Spirits, curses, old magic left lying around, and Stranglethorn full of all three. You walk through them every day and never know." },
      },
      choices = {
        { text = "That's not comforting.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Do they talk to you?", next = "unseen_talk" },
      },
    },
    unseen_talk = {
      lines = {
        { id = "ut_default", text = "All day, mon, and loud. They say you come to aid my chief, and they say it so loud I can't hear myself stir the pot." },
        { id = "ut_listener", when = { class = { "SHAMAN", "PRIEST" } },
          text = "You know how it be: they talk, you listen, and half the time they talking about you. Today they say you be useful, so don't prove them wrong." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    trophies = {
      lines = {
        { id = "tr_default", text = "Nimboya be my reason for coming, but I got reasons of my own. The Bloodscalp be enemy to the Darkspear, and a trophy from your enemy give you power over him." },
      },
      choices = {
        { text = "What do you do with them?", next = "trophies_paste" },
        { text = "Your tribe has a lot of enemies here.", next = "trophies_skull" },
      },
    },
    trophies_paste = {
      lines = {
        { id = "tp2_default", text = "I boil them, and leech them, and grind them down to paste, and every turn of the pestle their owners' spirits get a little weaker. It be nasty work, but it be honest nasty work." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    trophies_skull = {
      lines = {
        { id = "ts_default", text = "The Skullsplitter too, mon, to the southeast. The Darkspear don't live in Stranglethorn no more, but a war don't care who moved away." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },

    reef = {
      lines = {
        { id = "rf_default", text = "Long ago the earth shudder and an old troll city sink under the waves off the Savage Coast, and murlocs live in it now. Among the ruins be a tablet telling the tale of Gri'lek, a hero of our legends." },
      },
      choices = {
        { text = "Why does the Darkspear want it?", next = "reef_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reef_why = {
      lines = {
        { id = "rw_default", text = "The tablet too big to move, but a shard of it can go home with me to Orgrimmar. We put it in a sacred place, so the young ones remember the might of Gri'lek in a land that never heard of him." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    hope = {
      big = true,
      lines = {
        { id = "ho_default", text = "Nezzliok's head tell us Zanzil the Outcast hold the boy, body and soul, and Zanzil be a vile and powerful witch doctor. The hope be faint, mon, tiny as the smallest bug, but it still be hope." },
      },
      choices = {
        { text = "What would it take?", next = "hope_eye" },
        { text = "Then let's not waste it.", next = "BACK", fx = { affinity = 2, align = { honor = 1 }, learn = { "yenniku" } } },
        { text = "Hope that faint isn't worth anyone's life.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    hope_eye = {
      lines = {
        { id = "he_default", text = "A jewel from the heart of the jungle called the Mind's Eye, which I reshape into a soul gem, and singing shards from the basilisks of the Crystalvein Mine to bend it to my will. Then we take back what Zanzil stole." },
      },
      choices = {
        { text = "Who has the Mind's Eye?", next = "hope_maizoth" },
        { text = "Something else.", next = "BACK", fx = { learn = { "yenniku" } } },
      },
    },
    hope_maizoth = {
      lines = {
        { id = "hm_default", text = "Mai'Zoth, an ogre mage of the Mosh'Ogg. I know him from when the Darkspear still dwell here, and he be vicious then, and with the Eye he be worse." },
        { id = "hm_nimetz", when = { heardLine = "nimetz.h_default" },
          text = "Mai'Zoth, an ogre mage of the Mosh'Ogg, and I hear a human priest at the rebel camp swear to kill him too. Everybody want that ogre dead, mon, so the line be long." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    marg = {
      lines = {
        { id = "mg_default", text = "Ah, I see him now, bound to this world and boiling with rage, an orc spy with his task still undone. Nazeer want to know how he die, so let us have words with this angry orc." },
      },
      choices = {
        { text = "What does he say?", next = "marg_speaks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marg_speaks = {
      lines = {
        { id = "ms_default", text = "He be shouting about a pendant and a crab-man, and he want you to finish his mission more than he want to rest. Listen to him close; the dead don't repeat themselves for free." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    troll_warlock = {
      lines = {
        { id = "tw_default", text = "They flinch, mon, the way a dog flinch from a hand that hit it once. Witch doctors bargain with spirits and warlocks chain them, and the jungle know the difference even when you don't." },
      },
      choices = {
        { text = "I chain demons, not spirits.", next = "troll_warlock_chain", fx = { trait = { proud = 1 } } },
        { text = "Then teach me to bargain.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Chains work well enough, and I'll keep using them.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    troll_warlock_chain = {
      lines = {
        { id = "twc_default", text = "Heh, that what the Atal'ai say too, and look where they end up, under a swamp. Keep your chains tight and your own spirit loose, Darkspear, and maybe you be the first to get it right." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    skyborne = {
      lines = {
        { id = "sk_default", text = "The jungle spirits don't say your name, mon, and they say everybody's name. I hear your people feel a debt to the spirits of the wind, so maybe you just come from too far up for them to see." },
      },
      choices = {
        { text = "Our spirits went quiet too.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_scourge = {
      big = true,
      lines = {
        { id = "xsc_default", text = "Plenty, and none of it nice, so Kin'weelay keep it short. The loa don't like the dead who still walk, mon, but they like the ones who made you walk even less, and the loa of the dead might laugh to see you on your feet." },
      },
      choices = {
        { text = "Let him laugh. I chose this second life.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "I'd rest, if I could. Tell him that.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "What can't be seen, witch doctor?", next = "unseen" },
      },
    },
  },

  topics = {
    yenniku = { { id = "tp_yenniku", text = "His spirit wander, mon. I bring it home, one way or another.", next = "hope" } },
    background = { { id = "tp_ba", text = "They call Kin'weelay the strongest witch doctor of the Darkspear, and I don't argue, because arguing be bad luck. The chief send me here, so here I be." } },
    advice = { { id = "tp_ad", text = "If a trinket in the ruins hum at you, leave it be, mon. Old magic in Stranglethorn always want a new owner." } },
    _none = { { id = "tp_none", text = "Even the spirits don't know that one. Or they not telling." } },
  },
}

P:NPC {
  key = "mokthardin", id = TODO_NPC("Far Seer Mok'thardin"), name = "Far Seer Mok'thardin",
  bible = "bibles/stranglethorn.md", role = "priest", tier = "quest",
  communities = { "gromgol" }, temper = { "calm" }, values = { "wise", "patient" },
  notices = { "class" },

  impression = {
    first = "Far Seer Mok'thardin keeps the one quiet fire in a loud camp. He listens far more than he talks, and he wants the old power out of Stranglethorn's beasts.",
    third = "{name} sat by Far Seer Mok'thardin's fire at Grom'gol, where the orc studies the old power in the blood and bones of Stranglethorn's beasts.",
  },

  greetings = {
    { id = "g_fire", text = "The camp is loud, but here by the fire it's quieter. Speak, and I'll listen." },
    { id = "g_back", when = { metBefore = true }, text = "The fire kept your place for you. Sit." },
    { id = "g_away", when = { away = 14 }, text = "The fire kept your place for {away}, and now you're back to sit in it. Sit, then." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone in the camp carries anger from their talk with you, and the fire knows it. Make peace while it's small, because nothing stays small in this jungle." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I hear you gave someone here a good word, and the camp is better for it. The spirits notice small things too." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Another who listens to the elements. Out here they speak loudly, and mostly about rain." },
  },

  start = "hello",
  nodes = {
    xpt_mokthardin = {
      big = true,
      lines = { { id = "xpt_mokthardin_default", text = "Because the trolls here have bled this land for their gods for longer than any orc has lived, and the earth remembers every drop. Ask your shaman to listen closely while you hunt, because a war band that ignores the spirits in this jungle tends not to come home." } },
      choices = {
        { text = "We'll respect the spirits. The land deserves that much.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The spirits can wait. We came to fight trolls.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_zg = {
      big = true,
      lines = { { id = "xcl_zg_default", text = "Some do, and some never will, because blood spilled for a false god does not sink back into the earth quietly. The Gurubashi bent the jungle's power to feed their Soulflayer, and it will take the shaman of the Horde many years to coax it back to its own nature." } },
      choices = {
        { text = "Then we coax it gently. The land deserves patience.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Burn the old shrines and let the jungle heal itself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What becomes of the Gurubashi without their god?", next = "xcl_zg2" },
      },
    },
    xcl_zg2 = {
      lines = { { id = "xcl_zg2_default", text = "They will scatter, or they will choose a new god, and I fear the second more than the first. The Darkspear left that empire long ago and found a place in the Horde, so perhaps some of the Gurubashi could learn the same lesson, if they live long enough." } },
      choices = {
        { text = "Perhaps. Something else, Far Seer.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The elements answer the shaman and the Light answers the paladin, and I have never needed to choose between them. What I wonder is what it asks of you in return, for a power that crosses death must ask a great deal." } },
      choices = {
        { text = "It asks that I serve, and I serve gladly.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It asks nothing. I take what it gives.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The same way the beasts do, for they rage only when the hunt calls for it and rest the moment it's done. Our people let the blood-rage rule them once, and you know what it cost us, so be fierce when you must and calm the rest of the time." } },
      choices = {
        { text = "Fury should serve me, not the other way round.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My fury is my strength. I won't chain it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Old power, from the days when the trolls of this jungle worshipped the beast gods, and some of it still runs in the blood of the strongest tigers and panthers. I need their fangs and their hearts, and I ask the hunters who bring them to make clean kills." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Old power, from the days when the trolls of this jungle worshipped the beast gods, and some of it still runs in the blood of the strongest tigers and panthers. I need their fangs and their hearts, and I ask the hunters who bring them to make clean kills. Your {pet} feels it too, I think, the old power in this jungle, which is why it watches the trees more closely than you do." },
      },
      choices = {
        { text = "Clean kills only. The beasts deserve that much.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Power's power. How the beast dies doesn't matter.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "The Gurubashi trolls call on gods that were old before the Horde came to this world. Their priests wake things in the jungle that should sleep. We watch them, and we do not sleep well either." } },
      choices = {
        { text = "Then we must calm the spirits before they turn on everyone.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the trolls drown in their own gods.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the trolls bound dark magic into the jungle long ago, and it still lives in the panthers and raptors, making them crueler than nature intended. I hunt the strongest of them, so the jungle can heal, and a quiet hunter is worth three loud ones." } },
      choices = {
        { text = "I'll hunt them quietly and help the jungle heal.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Leave the beasts be. The jungle's cruelty is its own.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Far Seer.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Any seeker can learn, if they are willing to listen more than they speak. The elements teach patience and balance, and I have known mages who would have done well to learn both before they learned fire." } },
      choices = {
        { text = "Then I'll learn patience first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fire comes first. Patience can wait.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Perhaps, though the power in a raptor's blood is older than any prayer, and it answers to the earth before it answers to anyone's god. Your shadows and your loa have their own ways, priest, and I'll not tell you yours, but I'd ask you not to waste what the beasts give when they fall." } },
      choices = {
        { text = "I'll honor what the beasts give, Far Seer.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Power is power. I'll take whatever serves me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_mokthardin", tags = { "news" }, when = { party = { class = "SHAMAN" }, faction = "Horde" },
          text = "The spirits told me a shaman was coming, though they didn't say {companion} would bring friends. Sit a while, because the jungle's spirits are restless and I'd hear what fresh ears make of them." },
        { id = "h_cl_zg", tags = { "news" }, when = { cleared = "Zul'Gurub", faction = "Horde" }, text = "The beasts of Stranglethorn are calmer tonight, and I felt it before any runner told me. They say you went into Zul'Gurub and silenced the blood god, and the spirits around this fire agree." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. The beasts of this jungle carry old power, and you'll feel it if you sit by my fire, though it isn't the kind your prayers were made for." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "Earthmother keep you, druid. Thunder Bluff is far, but the spirits of this jungle know your kind." },
        { id = "h_default", key = true,
          text = "Far Seer Mok'thardin, of Orgrimmar. The beasts of Stranglethorn carry old power in their blood and bones, and I'm learning to draw it out." },
        { id = "h_ench", when = { questActive = TODO_QUEST("Mok'thardin's Enchantment") },
          text = "The enchantment needs what only those beasts can give. Bring it, and I'll show you what it becomes." },
        { id = "h_ench_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Mok'thardin's Enchantment"), days = 2 } },
          text = "Every piece you've brought has been perfect, and I thanked the spirits of each beast for it. A little more patience, and the choker will be ready." },
        { id = "h_bones", when = { metBefore = true }, text = "A raptor's bones sing differently than a panther's, and I can hear it now. At night, I wish I couldn't." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You walk softly, which is good, because the beasts of Stranglethorn have sharp ears and sharper teeth, and I would not see you hunted." },
        { id = "h_magecl", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. Your magic is not the elements' way, but I have seen it used with wisdom, and I will listen to you as I would to any seeker." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. I can feel the blood in you running hot, like the tigers out there, so keep hold of it, or it will keep hold of you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The beasts of Stranglethorn carry power in their bones, and you, of all people, should know how to take it with respect." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "The Light in one of the Forsaken. I have listened to this land a long time, but I did not expect to hear that." },
      },
      again = {
        { id = "h_again", text = "There's more you wish to know? The fire has time, and so do I." },
        { id = "h_again2", text = "Ask. The elements are in no hurry tonight." },
      },
      choices = {
        { text = "The jungle spirits are angry here. The trolls stir them.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "What kind of power?", next = "power" },
        { text = "What are you making?", next = "ench" },
        { text = "Why send a far seer to a supply camp?", next = "why" },
        { text = "What do you make of the trolls' magic?", next = "trolls" },
        { text = "The elements speak to me as well.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I'm an orc who studies the arcane.", next = "orc_mage", when = { race = "Orc", class = "MAGE" } },
        { text = "My people honor the elements too.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "I took the warlock's path, far seer. Like our grandfathers.", next = "k_lock", when = { race = "Orc", class = "WARLOCK" } },
        { text = "Why do you want the old power out of the beasts, Far Seer?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Can a mage learn wisdom from the elements, Far Seer?", next = "xmage", when = { class = "MAGE", race = { "Troll", "Scourge" } } },
        { text = "How do I keep hold of the fury, Far Seer?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What power do you draw from the beasts, Far Seer?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Can a priest's prayers reach the power in these beasts, Far Seer?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does the Light sit well with a far seer, Mok'thardin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Hakkar is dead, Far Seer. Do the spirits rest now?", next = "xcl_zg", when = { cleared = "Zul'Gurub", faction = "Horde" } },
        { text = "Why are the jungle's spirits restless, Far Seer?", next = "xpt_mokthardin", when = { party = { class = "SHAMAN" }, faction = "Horde" } },
        { text = "Thank you, far seer.", next = "END" },
      },
    },

    power = {
      lines = {
        { id = "p_default", text = "The kind that settles into anything that's lived long in a wild place. Orgrimmar teaches us to ask before we take, so I ask." },
      },
      choices = {
        { text = "And if the answer's no?", next = "power_no", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    power_no = {
      lines = {
        { id = "pn_default", text = "Then I go without, and I don't sulk about it. The orcs who stopped asking once drank something worse than any panther's blood, and we're still paying for that cup." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },

    ench = {
      lines = {
        { id = "e_default", text = "A ceremonial choker, enchanted for a defender of the Horde. Shadowmaw claws and a pristine tigress fang for its strength, stalker feathers for its speed, and a sinew from an old gorilla east of Booty Bay to tie it all together." },
      },
      choices = {
        { text = "Why must the fang be pristine?", next = "ench_fang" },
        { text = "Is that everything?", next = "ench_spring" },
      },
    },
    ench_fang = {
      lines = {
        { id = "ef_default", text = "A broken fang has already given up part of its spirit, and I can't bind what isn't there. It may take many hunts to find the right one, and every one of those hunts is part of the price." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ench_spring = {
      lines = {
        { id = "es_default", text = "One thing more: water from the Holy Spring high on the bluffs to the south. Every people in Azeroth claims those waters were blessed for them alone, and now the naga have come to claim them too." },
      },
      choices = {
        { text = "Who's right about the spring?", next = "ench_claim", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ench_claim = {
      lines = {
        { id = "ec_default", text = "Perhaps all of them, perhaps none. The water doesn't seem to mind who drinks it, which is more than I can say for the scholars who argue about it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    why = {
      lines = {
        { id = "w_default", text = "The jungle's magic should be understood and harnessed for the Horde before someone else harnesses it against us. My rituals have worked so far, and the Warchief's defenders wear the proof." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    trolls = {
      lines = {
        { id = "t_default", text = "Kin'weelay sees things in that cauldron I would not look at, and I am glad he looks so I don't have to. The Darkspear's spirits are older in this land than mine, so I listen when he speaks." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    shaman = {
      lines = {
        { id = "sh_default", text = "Then you know the jungle is never silent. Water presses in from every side here, and fire sulks under the damp, so call on it gently or it won't come at all." },
      },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    orc_mage = {
      lines = {
        { id = "om_default", text = "I'm not easy with it; the last of our people to reach for power without asking ended in chains and fel. But you came and told me plainly, and that counts as asking, near enough, and I'll judge you by what you do with it." },
      },
      choices = {
        { text = "That's fair, far seer.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The arcane isn't the fel.", next = "BACK", fx = { align = { order = -1 }, trait = { proud = 1 } } },
      },
    },
    skyborne = {
      lines = {
        { id = "sk_default", text = "I'm told the Earthen Ring spoke for your people when you came to the Horde. If the elements welcomed you, then so do I, though I would like to know how they sound where you come from." },
      },
      choices = {
        { text = "Quieter than they used to.", next = "BACK", fx = { affinity = 2 } },
        { text = "Another time, far seer.", next = "BACK" },
      },
    },
    k_lock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Like our grandfathers, yes, and look where that path took them, into the camps and the bloodlust. I will not send you away from this fire, but I will ask what you think you know that Gul'dan's warlocks did not." },
        { id = "xlk_cleft", when = { origin = "orc_cleft_initiate" },
          text = "You learned in the Cleft of Shadow, in Orgrimmar's own belly, where the Warchief lets your kind work in the dark. I will not send you from this fire, but I will ask what you know that Gul'dan's warlocks did not." },
      },
      choices = {
        { text = "That the fel can be mastered, not served.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "That it must never rule us again. I watch it.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "What do you make of the trolls' magic?", next = "trolls" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was trained in Orgrimmar to listen to the elements, and Orgrimmar sent me here to listen to the jungle. So far the jungle mostly talks about rain." } },
    advice = { { id = "tp_ad", text = "Thank what you kill, even a raptor. It costs you nothing, and the land remembers the ones who don't." } },
    _none = { { id = "tp_none", text = "That is beyond what the elements tell me." } },
  },
}

P:NPC {
  key = "thulbek", id = TODO_NPC("Innkeeper Thulbek"), name = "Innkeeper Thulbek",
  bible = "bibles/stranglethorn.md", role = "innkeeper", tier = "service",
  communities = { "gromgol" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary", "drink" },

  impression = {
    first = "Innkeeper Thulbek trades a bed for a war story and seems to think he's getting the better end. Out here, he says, a fire keeps things away rather than cold.",
    third = "{name} found a bed at Grom'gol with Innkeeper Thulbek, who asks only for a story of the fighting in return.",
  },

  greetings = {
    { id = "g_inn", text = "Come in and sit by the fire! Out here a fire keeps things away, not cold." },
    { id = "g_home", when = { homeInn = { "Grom'gol Base Camp" } }, text = "Home again. Your bed's dry, which in Stranglethorn counts as a luxury." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the spirit healer just sent you back. Sit down, eat, and don't argue." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Slow down. The grog in this camp is strong, and it holds a grudge." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I would, and so would every grunt in this camp, so tell it loud. A dead soldier who woke with the Light still in their hands is a better tale than any ogre story I've heard, and I've heard a great many ogre stories." } },
      choices = {
        { text = "I'll tell it true, Thulbek, every word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll make it grander than it was. Stories need it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The one where you stood your ground when everybody else ran, because that's the only story worth a bed in Grom'gol. Every grunt on that wall has one, and I've heard them all twice, so make yours new." } },
      choices = {
        { text = "I held my ground when it mattered. That's my only story.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My best story is the one where I ran and lived.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Every night, and the best is about a troll mage who froze a raptor mid-leap and forgot to thaw it, so it stood outside the gate for a day like a statue. The worst is about a warlock, and I don't let them tell that one at supper." } },
      choices = {
        { text = "A camp needs stories. I'll bring you a true one.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll tell them a few tall tales to keep them guessing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "One of the far seer's students told me how Thrall broke open the internment camps with the elements at his side, and nobody touched their stew till he finished. I'd give a month's bed for another story that good." } },
      choices = {
        { text = "Thrall freed us with honor. Those stories should be told.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Old stories don't win new fights, Thulbek.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The ones where somebody gets away with something, and the ones where they don't, depending on how much ale I've had. Out here, a good story keeps a man warm through the night better than any fire, though the fire keeps the beasts away." } },
      choices = {
        { text = "I'll tell you an honest one, then.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The best stories are the ones nobody can prove.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Thulbek.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a spell is over in an instant, and a good story lasts all night. Out here, with the trolls on the ridges and the beasts in the trees, a long night needs a long story, and I've heard enough short ones." } },
      choices = {
        { text = "I'll tell you a long one, then.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A spell is quicker. Let me light it and be done.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It grows over the walls, it creeps under the doors, and something big screams out there every other night. The orcs say a fire keeps it off, but I've seen your druids sit outside the walls in the dark and come back calm, so maybe you know better." } },
      choices = {
        { text = "The jungle isn't an enemy. Grom'gol should learn to live with it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Keep the fires lit, Thulbek. The jungle will take what it can.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Sit by the fire and tell me whether the elements have anything to say about the rain, because it hasn't stopped since I got here." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Sit close to the fire; whether you pray to the loa or the shadows, you'll do it better on a full stomach." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. Sit and eat; your demon can have the scraps, and the grunts can stop staring, because I've told them to." },
        { id = "h_default", key = true,
          text = "Innkeeper Thulbek. As long as Grom'gol stands, there's a bed here for you. All I ask is a story of the fighting while you eat." },
        { id = "h_story", when = { metBefore = true }, text = "A grunt told me last night he wrestled a gorilla. By morning it was two gorillas, and by noon, a gorilla king, which makes a good story and a bad liar." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The jungle never sleeps. Listen, and you'll hear that everything out there is either hunting or hiding, so eat your stew." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. Sit down and tell me a story, and make it a good one, since I trade beds for stories and you look like you've got a few." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You could light the fire with a flick of your hand, I suppose, but I'd rather you told me a story instead, since I've plenty of wood." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! Sit, eat, and tell me who you've fought this week, because a warrior always has the best stories and the worst table manners." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid of Thunder Bluff, at my fire. Tell me a story of the plains, friend, because all I hear down here is the jungle trying to get in." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin at my fire! Now that's a story I'd trade a bed for, so sit down and tell it while you eat, or while you pretend to eat." },
      },
      again = { { id = "h_again", text = "Still here? Good, the stew's still hot, so what else?" } },
      choices = {
        { text = "Have any shamans told stories at your fire, Thulbek?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the grunts here tell stories about the casters among them?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Does Grom'gol need meat for the cookfire, Thulbek?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "I've a story or two.", next = "story" },
        { text = "What's the talk in camp?", next = "talk" },
        { text = "Where does the zeppelin go?", next = "zeppelin" },
        { text = "Do you even cook for the Forsaken?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Who else keeps this camp running?", next = "keepers" },
        { text = "This jungle was my people's home once.", next = "k_troll", when = { race = "Troll" } },
        { text = "What sort of stories do you like best, Thulbek?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why would you rather a story than a spell, Thulbek?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What story would you want from a warrior, Thulbek?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What does the jungle do to Grom'gol at night, Thulbek?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Would you like to hear how the Light found me, Thulbek?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Just a meal, thanks.", next = "END" },
      },
    },
    story = {
      lines = { { id = "s_default", text = "Good! Tell it loud, so the grunts by the wall get some cheer and the trolls outside hear what's waiting for them." } },
      choices = {
        { text = "[Tell it]", next = "story_told", fx = { affinity = 2, standing = { gromgol = 1 } } },
        { text = "On second thought, another time.", next = "BACK" },
      },
    },
    story_told = {
      lines = {
        { id = "st_default", text = "Ha! I'll be telling that one myself by tomorrow, and it'll have one more ogre in it each time I do. That's the toll for the bed, and you've paid it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    talk = {
      lines = {
        { id = "tk_default", text = "The Commander's counting caravans again, the far seer's been sniffing panther claws, and Nimboya hasn't smiled since he got here. Nothing new, which in this jungle is good news." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "yenniku" } } } },
    },
    zeppelin = {
      lines = {
        { id = "z_default", text = "The tower outside the walls sends them to Orgrimmar and to the Undercity, and the goblins who run them swear they've never lost one. I've never asked what they mean by lost." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    keepers = {
      lines = {
        { id = "ke_default", text = "Uthok sells supplies off the zeppelin crates, Thysta keeps the wind riders, and that goblin Nez'raz runs the zeppelin to Orgrimmar and never stops talking. Between the four of us, the Commander's grunts are fed, armed and shipped." },
      },
      choices = {
        { text = "Nez'raz never stops talking?", next = "keepers_nezraz" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keepers_nezraz = {
      lines = {
        { id = "kn_default", text = "Never, and he comes down from his tower to eat here just to have someone new to talk at. He loves the sun on this coast more than any goblin has a right to, so let him tell you about it, and he'll be happy for a week." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_troll = {
      lines = {
        { id = "xtr_default", text = "It was, and you'd know better than I do what's out there in the green. Tell me a story about it, since the grunts only know the jungle as the thing that bites them." },
        { id = "xtr_sailed", when = { origin = "troll_sailed_with_thrall" },
          text = "You sailed with Thrall, so you left this coast long before Grom'gol had a wall. It must be strange to come back and find an orc cooking stew where your people used to hunt." },
      },
      choices = {
        { text = "It's good to see the Horde here.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "It's still our jungle, not the Horde's.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "Always, hunter, always. The tigers and raptors are plentiful here, and the grunts eat as though they're feeding three mouths apiece. Bring meat and I'll be your friend for a week." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Always, hunter, and by the look of {pet}'s muzzle it's been doing some of the hunting already. Bring meat back for the grunts, save a bone for your friend, and I'll be your friend for a week." },
      },
      choices = {
        { text = "I'll hunt for the camp, then.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hunt for my own needs first.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    forsaken = {
      lines = {
        { id = "f_default", text = "I cook for anyone who sits at my fire, and you lot are the easiest guests I have, since you never send the stew back. Take a bowl anyway; it's warm, and warm is worth something even to the dead." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Just an innkeeper who goes where the Horde goes, because the Horde has to eat wherever it ends up." } },
    advice = { { id = "tp_ad", text = "Sleep with your boots on and your axe within reach. Not because of anything in particular, just because it's Stranglethorn." } },
    _none = { { id = "tp_none", text = "Ask the Commander. He hears everything in this camp, and complains about most of it." } },
  },
}
