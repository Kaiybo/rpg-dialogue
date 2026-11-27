-- Grom'gol Base Camp: the Horde's foothold on the coast, and the road to Stonard. Voice: bibles/stranglethorn.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "aggrogosh", id = TODO_NPC("Commander Aggro'gosh"), name = "Commander Aggro'gosh",
  bible = "bibles/stranglethorn.md", role = "soldier", tier = "major",
  communities = { "gromgol" }, temper = { "blunt" }, values = { "dutiful", "stern" },
  race = "Orc", likesTone = "blunt",
  notices = { "kit", "race", "lock_pact", "lock_shards" },

  impression = {
    first = "Grom'gol holds because he simply refuses to let it fall.",
    third = "{name} met Commander Aggro'gosh, who keeps Grom'gol and the road to Stonard open against ogres and the Bloodscalp.",
  },

  greetings = {
    { id = "g_op_demons", when = { gossip = { topic = "demons", stance = "useful" } }, text = "Far Seer Mok'thardin tells me you think demons can be bound and put to work. The last orcs who believed that are why my grandfather died with green skin, so keep that thinking out of my camp." },
    { id = "g_camp", text = "This is Grom'gol, and every orc, troll and tauren behind these walls works for the Horde. Are you here to work, {class}?" },
    { id = "g_back", when = { metBefore = true }, text = "You again? Good, because the last grunt I sent to the river came back without his boots, and I need hands." },
    { id = "g_away", when = { away = 14 }, text = "You were gone {away}, and Grom'gol bled and sweated your share while you were away. Now you're back, so earn it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You're stronger than when you last stood here, and the blood in you runs hotter. Good, because the jungle has gotten no kinder." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The camp says you've worked hard for Grom'gol. That's the only praise an orc commander gives, and I just gave it." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear you were caught in a lie in my camp. Everyone in Grom'gol works, and nobody here works for a liar." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's in pieces, so get it to the forge before you go out again. A dead grunt hauls no crates." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear? Good. Your cousins out past the walls are less friendly, so show them what a troll of the Horde is worth." },
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "That heat on you is the imp's blood pact, and I know it, because the warlocks of the old Horde put it on us before a charge. It made us strong and it made us stupid, so keep it off my grunts." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "Your bag rattles like a shaman's bones, warlock, but those are soul shards, and every one of them was something's life. Spend them on the Bloodscalp if you must spend them at all." },
  },

  start = "hello",
  nodes = {
    op_warchief = {
      lines = {
        { id = "opw_default", text = "He sent me here, so he remembers. The old grunts in Stonard say Thrall made peace with the humans too cheaply, and they say it louder every year. You've walked his city, so tell me what you say." },
      },
      choices = {
        { text = "He freed our people. His word is good enough for me.", next = "op_wc_trust", fx = { affinity = 1, align = { order = 1 }, opinion = { warchief = "trust" } } },
        { text = "The old grunts are right. He made peace too cheaply.", next = "op_wc_soft", fx = { align = { order = -1 }, trait = { stern = 1 }, opinion = { warchief = "soft", peace = "war" } } },
        { text = "Vol'jin follows him, and the Darkspear follow Vol'jin.", next = "op_wc_respect", fx = { affinity = 1, opinion = { warchief = "respect" } }, when = { race = "Troll" } },
        { text = "He gave the Forsaken a place. That's more than anyone else did.", next = "op_wc_respect", fx = { opinion = { warchief = "respect" } }, when = { race = "Scourge" } },
        { text = "I'll judge him by whether this road stays open.", next = "op_wc_mixed", fx = { affinity = 1, opinion = { warchief = "mixed" } } },
        { text = "That's a matter for the Warchief, not for me.", next = "BACK" },
      },
    },
    op_wc_trust = {
      lines = {
        { id = "opwt_default", text = "Good. Then do what he sent us here to do, and leave the arguing to the grunts with nothing better to fill their mouths with." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_wc_soft = {
      lines = {
        { id = "opws_default", text = "Say that quietly in my camp. I've heard it before, and I've half thought it on bad nights, but Thrall was in the camps and I wasn't, so I'll trust that he knows what a cage costs." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_wc_respect = {
      lines = {
        { id = "opwr_default", text = "Then you understand him better than half my grunts do. The Horde is more than orcs now, and some of the old ones still haven't learned that." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_wc_mixed = {
      lines = {
        { id = "opwm_default", text = "That's how I judge every orc in Azeroth, Warchief or grunt. The road's open today, so today he's a good Warchief." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "If you can hold a line against the Bloodscalp and patch up whoever falls on it, you can serve anywhere I command. The Light's a strange thing to see on one of the dead, but the ogres won't stop to wonder about it, and neither will I." } },
      choices = {
        { text = "Then command me. The road comes first.", next = "BACK", reply = "Good, then you'll take the east wall tonight and the tents after. The road to Stonard needs every hand that won't run.", fx = { align = { order = 1 } } },
        { text = "I'll help, Commander, but on my own terms.", next = "BACK", reply = "Your terms are your own, so long as they end with dead Bloodscalp. Cross my orders in a fight, though, and we will talk again.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = {
        { id = "xhcast_default", text = "Fire on the walls when the Bloodscalp come at night, and healing in the tents when they leave. Spells win fights I'd otherwise pay for in grunts, so I value them, but I don't trust anyone who loves their power more than their duty." },
      },
      choices = {
        { text = "Duty first. Point me at the wall.", next = "BACK", reply = "That is what I like to hear. Take the wall at dusk, and make the Bloodscalp remember the colour of Horde fire.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight my own way, Commander, not by your orders.", next = "BACK", reply = "Then fight your way, but fight on my side of the wall. A caster who wanders off alone in this jungle feeds the headhunters.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The old ones remember, and they don't talk about it much, because the warlocks led us to the demon's blood and called it strength. Thrall brought the shamans back so we'd never need that sort of strength again, and I mean to keep it that way." } },
      choices = {
        { text = "The elements give strength without that price. That's the better way.", next = "BACK", reply = "It is, and Thrall proved it when he walked out of the camps with the storm at his back. We will not drink that blood again, not while I command.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Strength is strength, Commander, however it's bought.", next = "BACK", reply = "No, shaman, and you should know better than any of us. We bought our strength once with demon blood, and we are still paying the debt.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "They fight it, mostly. The jungle bites back, and they bite harder. But I have told them not to burn what they cannot eat, and they listen, because I am the one who feeds them." } },
      choices = {
        { text = "That is wise. The land remembers who burned it.", next = "BACK", reply = "It does, and so do the orcs who remember Draenor's red dust. I will keep the axes off the old trees, as long as the trolls let me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A war camp has no room for such worries.", next = "BACK", reply = "Then you've never seen a camp burn because a grunt chopped the wrong tree. Worries keep us alive, druid, and I keep mine close.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because they want us gone, and they're waiting for the moment our walls are thin enough to break. If you can slip into their camps and learn when they mean to strike, Grom'gol will hold, and that's all I ask." } },
      choices = {
        { text = "I'll find their plans and bring them back.", next = "BACK", reply = "Do that, and you will save more grunts than a hundred axes. Bring me their plans, and I will see you honored at the fire.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Better to strike them first, before they can plan.", next = "BACK", reply = "A good instinct, but blind, and blind strikes in this jungle end in a cookpot. Find their plans first, then we strike together.", fx = { align = { order = -1 } } },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "The Bloodscalp and the Skullsplitter have their own dark priests, and they fear any power they don't control. A demon prowling outside our walls would bring every troll on the ridges down on us, and I've no men to spare for that fight." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "The Bloodscalp and the Skullsplitter have their own dark priests, and they fear any power they don't control. That thing at your heel is exactly what would bring every troll on the ridges down on us, so keep it inside these walls and out of their sight, because I've no men to spare for that fight." },
      },
      choices = {
        { text = "It stays inside the walls, Commander.", next = "BACK", reply = "Wise. Keep it close and quiet, and we will not give the trolls another reason to scream at our walls.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them fear us. Fear makes them cautious.", next = "BACK", reply = "Fear makes a troll cautious and a grunt nervous, and I want neither near my gate. Keep it inside the walls, warlock.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hu_view = {
      lines = {
        { id = "hum_v_default", text = "There are, and none of them are here for the scenery. Nesingwary's hunters shoot everything with fur north of us, Stormwind's rebels sulk in their camp by the river, and Booty Bay sells them all the powder they want." },
        { id = "hum_v_undead", when = { race = "Scourge" },
          text = "There are, and you'd fit right in with them if you had a bit more skin. Nesingwary's hunters shoot everything north of us, Stormwind's rebels sit in their camp by the river, and Booty Bay sells them powder." },
      },
      choices = {
        { text = "Do they ever come against Grom'gol?", next = "hu_stance" },
        { text = "The rebels deserted their own colonel, I hear.", next = "BACK", reply = "So they say, and I'll give them that much: they saw a mad commander and walked away from him. Plenty of orcs wish they'd done the same with Gul'dan.", fx = { learn = { "humans" } } },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    hu_stance = {
      lines = {
        { id = "hum_s_default", text = "Not yet, because they're as busy with the raptors and the trolls as we are. The goblins keep the peace in their bay, and outside it every human and every orc in this jungle pretends the other isn't there, so long as the caravans keep moving." },
      },
      choices = {
        { text = "Then let them pretend. The caravans matter more.", next = "BACK", reply = "That's a quartermaster's thinking, and I like it. Every caravan to Stonard counts for more than a dead hunter.", fx = { align = { order = 1 }, opinion = { humans = "distrust" } } },
        { text = "Let me hunt the hunters. Nesingwary's camp is close.", next = "BACK", reply = "Close and well armed, and those dwarves with him can shoot. Start that war on your own time, {class}, and don't bring it back to my walls.", fx = { align = { order = -1 }, opinion = { humans = "hate" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Good, because the far seer can't be everywhere, and my grunts fight harder with the elements at their backs." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Grom'gol needs healers more than it needs sermons, so keep the prayers short and the bandages tight." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. Can you burn a path through the Mosh'Ogg? Then I have a place for you on the road." },
        { id = "h_druidx", when = { race = "Tauren", class = "DRUID" },
          text = "A druid of the tauren. Good. My grunts fight better with one of your kind nearby to mend them." },
        { id = "h_default", key = true,
          text = "Commander Aggro'gosh. This camp keeps the road to Stonard open, and that road feeds the Horde. The ogres and the Bloodscalp make it hard, and I make it happen anyway, because that is what the Warchief asked of me." },
        { id = "h_defense", tags = { "news" }, when = { questActive = TODO_QUEST("The Defense of Grom'gol") },
          text = "Something out there tests our walls every night. Go out and test it in return, and test it harder." },
        { id = "h_defense_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Defense of Grom'gol"), days = 3 } },
          text = "The caravan masters say the road is quieter since you went out, and caravan masters never say anything kind. You did your duty, and you did it with honor, which is all the Horde asks of its blood." },
        { id = "h_road", when = { metBefore = true }, text = "Three caravans reached Stonard this week, all three, and the ogres got none of them. Write that down; I want to read it later." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The Bloodscalp drums are close tonight. Let them drum, for we have walls and axes, and all they have is noise." },
        { id = "h_zeppelin", when = { race = "Scourge" },
          text = "Off the zeppelin from the Undercity, are you? Good. The Dark Lady's people don't tire and don't complain, which makes you the best grunts I've had all month." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. Good, because the Bloodscalp trolls on the ridges are watching Grom'gol day and night, and I need someone who can watch them back without being seen." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "I'll take any strength that keeps Grom'gol standing, but keep that thing at your heel inside the walls, because the trolls here are superstitious, and I don't need them any angrier." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. I don't care what you pray to, only whether you're here to work, because the road to Stonard needs keeping." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it, warrior; the next caravan won't guard itself." },
        { id = "h_again2", text = "Speak, then, but speak while you walk if you can." },
      },
      choices = {
        { text = "There are humans all over this jungle, Commander.", next = "hu_view" },
        { text = "Do your grunts still remember the shamans from before the warlocks?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does Grom'gol need from its spellcasters, Commander?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Do your grunts respect this jungle, or only fight it?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Your supply line must be stretched thin out here.", next = "road" },
        { text = "What do you need most?", next = "need" },
        { text = "Who are you watching the walls for?", next = "threats" },
        { text = "Who else is in this camp?", next = "camp" },
        { text = "Grom'gol carries Grom Hellscream's name, Commander.", next = "grom" },
        { text = "The Darkspear came from this jungle, Commander.", next = "darkspear", when = { race = "Troll" } },
        { text = "An orc mage. Does that trouble you?", next = "orc_mage", when = { race = "Orc", class = "MAGE" } },
        { text = "Thunder Bluff sent me. I'm a Windshaper.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Give me a post on the wall, Commander.", next = "k_warrior", when = { class = "WARRIOR" } },
        { text = "The living sweat in this jungle. I don't.", next = "k_scourge", when = { race = "Scourge" } },
        { text = "I can keep the raptors off your caravans.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "Why are the Bloodscalp watching Grom'gol, Commander?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "The trolls must fear what I keep, Commander.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Can a Forsaken paladin serve at Grom'gol, Commander?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll get to work.", next = "END", fx = { affinity = 1, standing = { gromgol = 1 } } },
      },
    },

    grom = {
      lines = {
        { id = "gr_default", text = "The grunts who raised this palisade say they named it for him, and I've never told them otherwise. In Ashenvale the night elves would tear his name off any stone they found it on, so we carved it into a jungle on the far side of the sea, where they'll never reach it." },
        { id = "gr_troll", when = { race = "Troll" },
          text = "The grunts who raised this palisade say it was for him, and the Darkspear who helped them didn't argue. Your people have their own quarrel with the night elves, older than ours, so you'll understand why we put his name where no elf can reach it." },
      },
      choices = {
        { text = "Why do the elves hate Grom so much?", next = "grom_cenarius" },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    grom_cenarius = {
      lines = {
        { id = "gc_default", key = true, text = "Because he killed Cenarius, their forest god, when the elves came at our woodcutters in Ashenvale, and he did it with Mannoroth's strength in his arms. Some grunts call that a shame, but I call it the first blow the Horde ever struck for its own survival in Kalimdor, and I'd strike it again." },
      },
      choices = {
        { text = "Grom did what he had to. So would I.", next = "BACK", reply = "Then you'd have fit in the Warsong, and you'll fit here. The elves can hate us for it as long as they like, because we're still standing.", fx = { align = { light = -1 }, opinion = { grom = "hero", night_elves = "hate" } } },
        { text = "Killing their god with demon blood is nothing to be proud of.", next = "BACK", reply = "You sound like Mok'thardin at his fire, and he's earned the right to say it. I'll not stop you either, but don't say it in front of the grunts who carved that name.", fx = { align = { light = 1 }, opinion = { grom = "mixed" } } },
        { text = "Do the elves have any right to their grudge?", next = "grom_right" },
      },
    },
    grom_right = {
      lines = {
        { id = "gri_default", text = "Every right, and so do we. They lost a god and we lost the chieftain who freed us from the demons, so nobody in that forest is going to forgive anybody, and the Warchief can only keep the axes and the arrows from flying too far." },
      },
      choices = {
        { text = "Then the Warchief's peace is worth guarding.", next = "BACK", fx = { affinity = 1, opinion = { warchief = "trust" } } },
        { text = "Something else.", next = "BACK" },
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
        { text = "You speak of Stonard like it's home.", next = "road_stonard" },
        { text = "Then I'll help you count.", next = "BACK", reply = "Then you have my thanks, and a place at the fire when the next caravan rolls in safe. Every one we count is a life saved.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Stonard's caravans are someone else's problem.", next = "BACK", reply = "Someone else's problem is how the Horde lost its way before, warrior. Stonard is ours, and so are its caravans.", fx = { align = { honor = -1 } } },
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
      choices = {
        { text = "Does the Warchief still remember Stonard, Commander?", next = "op_warchief" },
        { text = "Something else.", next = "BACK" },
      },
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
        { text = "Understood, Commander.", next = "BACK", reply = "Good. Wear the word well, and the grunts will follow you into the green without a second thought.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'm nobody's grunt, Commander.", next = "BACK", reply = "Then you will be nobody in my camp, and nobody eats last. Prove yourself on the wall and I'll find a better word.", fx = { align = { order = -1 } } },
      },
    },

    threats = {
      lines = {
        { id = "t_default", text = "Jungle trolls from the ruins up the coast, naga out of the water, and the Alliance, who come down from Duskwood or walk over from Booty Bay looking for an easy fight. These walls were built thick for all three." },
      },
      choices = {
        { text = "Booty Bay is neutral, isn't it?", next = "threats_bay" },
        { text = "Naga, here. I'd not have expected that.", next = "threats_naga" },
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
        { id = "c_default", text = "Nimboya and Kin'weelay came from Orgrimmar on the Darkspear's business, Mok'thardin works enchantments by the fire, and Thulbek keeps the inn. They all pull their weight, or they hear about it from me." },
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
        { text = "They're not my people anymore.", next = "BACK", reply = "Then they will learn what that choice costs, and you will be the one to teach it. The Darkspear chose the Horde, and the Horde chose them back.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Some of them still are.", next = "BACK", reply = "Then you carry a hard burden, and I will not make it heavier. Fight where your heart lets you, and leave the rest to my grunts.", fx = { align = { order = -1 }, affinity = 1, trait = { kind = 1 } } },
      },
    },
    orc_mage = {
      lines = {
        { id = "om_default", text = "The last orcs who played with that kind of power turned our skin green and our homeland to dust, so yes, it troubles me. But if your fire lands on ogres and not on my caravans, I'll keep my troubles to myself." },
      },
      choices = {
        { text = "My fire knows where to land.", next = "BACK", reply = "See that it does, young one, or the whole camp will remember the day it didn't. I'll keep an eye on you all the same.", fx = { align = { light = -1 }, affinity = 1, trait = { proud = 1 } } },
        { text = "It troubles me too, sometimes.", next = "BACK", reply = "Then you are wiser than most who carry it. Keep that trouble close, and it will keep you honest.", fx = { affinity = 2, align = { light = 1 } } },
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
        { text = "Holding is a soldier's honor. I'll take dawn.", next = "BACK", reply = "Lok'tar, warrior! Dawn is yours, and the raptors will learn what a real wall looks like.", fx = { align = { order = 1 }, affinity = 2, standing = { gromgol = 1 } } },
        { text = "Holding is how you lose. Let me hunt the raiders.", next = "BACK", reply = "Spoken like a young orc, and I was one once. Hold first, and when the raiders break, I'll let you chase them.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Somebody must be raiding the caravans.", next = "road_raiders" },
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
        { text = "Only what the camp needs, no more.", next = "BACK", reply = "Good. Feed the camp and keep the raptors wary, and the jungle will remember who hunts it.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll hunt until the jungle learns to fear us.", next = "BACK", reply = "Fear is good, but a jungle with no beasts feeds no grunts. Hunt hard, and leave enough for tomorrow.", fx = { align = { order = -1 } } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Hmph. I don't hear much praise in this camp, because I don't give much, but I'll take yours for the grunts who earned it. Grom'gol stands because they do." },
        { id = "s2", text = "You see what this camp costs to hold, and most who pass through see only mud and crates. That is worth something to me, {class}." },
      },
      fail = {
        { id = "f1", text = "Soft words don't mend walls or guard caravans, and I have no use for anything that does neither. If you want my good opinion, pick up a crate." },
        { id = "f2", text = "I've had peons flatter me to get out of hauling timber, and they hauled double for it. Don't make me find you a log." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! You have fire in your belly, and you're not afraid to show it to a commander. The Horde was built by those who talked like that and then backed it up." },
        { id = "s2", text = "Good. I was beginning to think everyone who came down the Stonard road had left their spine behind them. Keep that edge, and take it out to the Bloodscalp." },
      },
      fail = {
        { id = "f1", text = "You mock the commander of Grom'gol inside his own walls, in front of his grunts? Watch your mouth, or you'll spend the night digging latrines with the peons." },
        { id = "f2", text = "I've heard braver insults from ogres, and they at least were trying to kill me when they said them. Talk is cheap in this camp, so go and do something." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Hm. There is real blood behind that look, and I've led enough warriors to know it from bluster. I won't waste a fighter like you on a quarrel, so say what you want." },
        { id = "s2", text = "Enough. I'd sooner have that anger pointed over the wall than at me, and I can see that you mean it, so I'll hear you." },
      },
      fail = {
        { id = "f1", text = "I hold this camp against ogres and trolls with the jungle at my back, and you think a snarl will move me? Stand down, before I have you thrown in the river." },
        { id = "f2", text = "My grandfather died with green skin and a demon's rage in him, and I learned young what real menace looks like. Yours falls well short of it." },
      },
    },
  },
  blurts = {
    { id = "bl1", text = "The Mosh'Ogg ogres at their mound east of the road have more spellcasters than my scouts can count. Kill the magi first, or they'll burn you down before you reach the brutes." },
    { id = "bl2", text = "The Bloodscalp watch the river from their ruins in the north, and that's where my crates have been going. If you want to hurt them, hit the ruins and not the road." },
    { id = "bl3", text = "Booty Bay sells my patrol routes to anyone with gold, the Alliance included. I've stopped telling the goblins where my grunts will be." },
  },
  confides = {
    { id = "cnf_1", text = "The Bloodscalp cross the river at the shallows below their ruins just before dawn, so a hunter who waits on the far bank gets the first throw." },
    { id = "cnf_2", text = "I give Booty Bay false patrol routes every month now and watch who turns up where, and twice it's been Alliance scouts waiting in the trees." },
    { id = "cnf_3", text = "There are naga at the Holy Spring up the coast now, so fill your waterskins inside the walls before you head north." },
  },
  topics = {
    regard = {
      { id = "rg_1", text = "I make you out as someone who does the work and doesn't wait to be thanked, {class}. In Grom'gol that's the highest praise I have, and I've given it maybe four times." },
      { id = "rg_earned", when = { fondness = "earned" }, text = "You've carried crates and killed Bloodscalp for this camp when you could have been off chasing glory. My grunts noticed, and so did I." },
      { id = "rg_al_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "Your word holds. When you say a thing will be done, it gets done, and on the Stonard road that's worth more than a sharp axe." },
      { id = "rg_orc", when = { race = "Orc" }, text = "You fight like an orc should, with your head and not only your blood. The old Horde forgot the difference, and we all paid for it." },
    },
    confide = {
      { id = "cf_1", text = "The grunts say this camp was named for Grom Hellscream, and I've never corrected them, because I don't know myself. A soldier holds a wall better when he thinks a hero's name is carved on it." },
      { id = "cf_2", text = "I lose more caravans on the Stonard road than Orgrimmar knows, because I make up the half-lost ones from my own stores. Stonard eats either way, and that's what matters to me." },
    },
    trust = {
      { id = "tr_1", text = "Trust the Darkspear in this camp. Vol'jin's people know the jungle, and they hate the Gurubashi more than any orc ever could, so they'll never sell you to them." },
      { id = "tr_2", text = "Trust Thulbek with your life and your secrets, but not with your coin at the dice. Trust nobody in Booty Bay further than you can throw a crate." },
    },
    watchout = {
      { id = "wo_1", text = "Watch the Mosh'Ogg mound east of the road. The ogres there ambush caravans, and they don't care whose banner is on the wagon." },
      { id = "wo_2", text = "When the birds go quiet on the road, stop and draw your weapon. Lashtail raptors hunt in threes, and the first one you see is never the first one there." },
    },
    worries = {
      { id = "wy_1", text = "Supply. Every crate that doesn't reach Stonard is a soldier in the swamp going hungry, and I can't hold a road with a wall alone." },
      { id = "wy_2", text = "That I'll grow too old to hold this command before the Warchief finds someone fit to take it. Grom'gol wears commanders down, and I've read the list of names that came before mine." },
    },
    hopes = {
      { id = "hp_1", text = "That one day a caravan walks from here to Stonard with no guard at all, because nothing left in the jungle dares touch it. I won't live to see it, but someone should." },
      { id = "hp_2", text = "I'd like a son someday, but I've never had the time, and Grom'gol is all the family I've made. When the road is safe, I'll think about it." },
    },
    favor = {
      { id = "fv_1", text = "Walk the road to the Mizjah Ruins now and then and kill whatever's waiting there. Every ogre you put down is a caravan I don't have to bury." },
      { id = "fv_2", text = "If you're in Orgrimmar, tell the Warchief that Grom'gol holds. He reads it in my reports, but he'll believe it more from someone who's seen it." },
    },
    friendship = {
      { id = "fr_1", text = "I don't have friends, {class}. I have soldiers I'd die beside, and you're one of them, which counts for more where I come from." },
      { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "You've bled for this camp and asked nothing for it. Yes, you're a friend, and anyone in Grom'gol who says otherwise will answer to me." },
      { id = "fr_al_order", when = { alignment = { axis = "order", min = 30 } }, text = "You keep to your duty when nobody's watching, which is what the Warchief asked of us when he broke open the camps. That's a friend I want at my back." },
    },
    never_told = {
      { id = "nt_1", text = "My grandfather drank the demon's blood with the rest of them, and he died raving for more of it while I watched. I swore nothing would ever own me the way that blood owned him, and that's why I'm as hard as I am." },
      { id = "nt_2", text = "When the Warchief gave me this command, I thought he'd made a mistake. I've spent every day since making sure he never has to find out whether he did." },
    },
    grievance = {
      { id = "gv_al_cunning", when = { alignment = { axis = "honor", max = -30 } }, text = "You twist your words like a Booty Bay merchant, and I can never tell where the lie ends. A soldier I can't believe is a soldier I can't use." },
      { id = "gv1", text = "My problem is that you take more from this camp than you give, and in Grom'gol that makes you dead weight. I don't carry dead weight up the Stonard road." },
      { id = "gv_wronged", when = { grudge = { worst = "wronged" } }, text = "You spoke to me like a grunt who'd never held a line, in my own camp and in front of my soldiers. I remember it, and so do they." },
      { id = "gv_enemy", when = { grudge = "enemy" }, text = "You're Alliance, standing inside the only wall the Horde has on this coast. Every guard I have wants to know why I haven't had you thrown in the river." },
      { id = "gv_pers", when = { grudge = "persuade" }, text = "You tried to talk me round like a Booty Bay merchant haggling over crates. I command here, and I don't bend because someone pushes." },
    },
    amends = {
      { id = "am1", text = "Work. Haul crates, kill Bloodscalp and bring back what you're sent for, because Grom'gol forgives the ones who sweat for it." },
      { id = "am_wronged", when = { grudge = "wronged" }, text = "Speak to me straight and with respect, the way one soldier speaks to another. Do that, and I'll forget the rest in time." },
      { id = "am_enemy", when = { grudge = "enemy" }, text = "You can't, not while you wear the Alliance's colours. The best you can do is leave my camp before the next watch changes." },
    },
    spite = {
      { id = "sp1", text = "I think you're the kind who comes to the jungle for glory and leaves the burying to someone else. I've buried enough grunts to know your sort on sight." },
      { id = "sp_enemy", when = { grudge = "enemy" }, text = "I think the Alliance sent you here to count my walls. Count them, then, and tell Stormwind there are more than enough for you." },
      { id = "sp_values", when = { grudge = "values" }, text = "I think you'd have been right at home in the old Horde, drunk on blood and proud of it. My grandfather died of that, and I've no patience left for it." },
    },
    knows = {
      { id = "tp_knows", text = "My scouts report everything that moves on the Stonard road. Ask what you need, and don't waste my time." },
    },
    yenniku = { { id = "tp_yenniku", text = "That's Nimboya's business, and he's welcome to it, as long as he pulls his weight while he's in my camp." } },
    background = {
      { id = "tp_ba", text = "I'm the Commander of Grom'gol, sent by the Warchief to keep the road to Stonard open. Everything that happened to me before this camp happened to someone with far less to do.", next = "road" },
      { id = "tp_ba2", text = "I command a camp, I guard caravans, and I count crates. If you want a song about it, ask Thulbek to make one up." },
    },
    advice = { { id = "tp_ad", text = "Never walk the jungle road alone at night, and never trust the quiet. When the birds stop, something bigger than you is listening." } },
    thrall = {
      { id = "tp_thrall", text = "The Warchief gave me this command and told me to hold the road to Stonard, and I've held it. He doesn't ask for much, only that we do what we say we'll do." },
      { id = "tp_thrall2", when = { faction = "Horde" }, text = "You serve the same Warchief I do, so you know what he asks of us. Hold your post, keep your word and don't let the jungle beat you, and he'll never forget it." },
    },
    voljin = { { id = "tp_voljin", text = "Vol'jin lent us his trolls for this camp, and they're the best jungle fighters the Horde has. I'd follow his lead in these trees before I'd follow mine." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear know this jungle better than any orc ever will, and they remember what the Gurubashi did to them before they came to us. I'm glad they're on our side of the wall." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay is a goblin town that sells to everyone, including the Alliance, and that's how it stays alive. I trade with them because I need the supplies, and I count my fingers after." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The Gurubashi priests at Zul'Gurub are bringing back their blood god, and if he walks, this camp won't be the first thing he eats, but it'll be close. The Zandalari are calling for help on Yojamba Isle, and I've sent whoever I can spare." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "My grunts go to the Arena to blow off steam, and I let them, because it keeps them sharp and keeps them out of Booty Bay's taverns. Most of them come back." } },
    second_war = { { id = "tp_second_war", text = "I fought in the Second War, on the other side of this coast, and I remember the jungle then too. It hasn't gotten any friendlier." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Forsaken have joined the Horde, and the Warchief says that's good enough for him. I'll take a dead soldier who holds the line over a living one who runs." } },
    _gated = {
      { id = "gt1", text = "That is not talk for someone who hasn't yet sweated for this camp. Work for Grom'gol, and then I may answer." },
      { id = "gt2", text = "I don't speak of that with every stranger who walks through my gate, so ask me something else or get back to work." },
    },
    _none = { { id = "tp_none", text = "That's not my problem, and I don't waste breath on what isn't. Find someone with time to talk." } },
  },
}

P:NPC {
  key = "nimboya", id = TODO_NPC("Nimboya"), name = "Nimboya",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "gromgol" }, temper = { "wary" }, values = { "loyal", "stern" },
  notices = { "race", "lock_soulstone" },

  impression = {
    first = "He will not go home without Yenniku, and I believe him.",
    third = "{name} met Nimboya at Grom'gol, a troll who has sworn not to leave Stranglethorn without the chief's lost son, Yenniku.",
  },

  greetings = {
    { id = "g_wary", text = "Nimboya don't know you. Say what you come for, and say it quick." },
    { id = "g_back", when = { metBefore = true }, text = "You again, good. You keep coming back like this, maybe you be useful." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear blood. Then you understand why I be here, so far from Durotar." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "Somebody bind your soul in a stone, mon, so you can come back if the jungle take you. Nimboya would give much for the chief's son to carry one of those, but the spirits say that kind of luck always be owing somebody." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Maybe it help, maybe not, but I take any help for the chief's son. The Bloodscalp hold him with their spells, and if your Light can see through troll magic, then you be very welcome in this jungle." } },
      choices = {
        { text = "Then I'll help bring him home. A lost son deserves it.", next = "BACK", reply = "The loa smile on you for that, mon, and so does Nimboya. Bring the boy home and you be a friend of the Darkspear forever.", fx = { align = { honor = 1 } } },
        { text = "The chief's son is your burden, Nimboya, not mine.", next = "BACK", reply = "It be my burden, true, and I carry it gladly. But the chief remember who help and who walk past, mon, so you think on it.", fx = { align = { honor = -1 } } },
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
        { text = "I'll scout patiently, and we strike only when the boy is safe.", next = "BACK", reply = "Dat be the hunter's way, and the wise way too. Watch, wait, and when de boy be clear, we strike like the panther.", fx = { align = { order = 1 } } },
        { text = "Let me loose my beast on their camp and drive them out.", next = "BACK", reply = "Your beast be fierce, mon, but the Bloodscalp would gut the boy before they let him go. Patience first, then teeth.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Somewhere north, in the Bloodscalp ruins, where they keep their captives close and their headhunters closer. Every time Nimboya come near, the drums start, so I need somebody who can get in without being heard." } },
      choices = {
        { text = "I'll find him and bring him home.", next = "BACK", reply = "You do dat, and Nimboya sing your name at every fire from here to the Echo Isles. Bring him home whole, mon.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Rescues are risky. Maybe trade for him instead.", next = "BACK", reply = "Trade? Mon, the Bloodscalp don't trade, they take heads and keep 'em. Nimboya try talking once, and lose two good scouts.", fx = { align = { honor = -1 } } },
        { text = "Something else, Nimboya.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I use anything that bring him home alive, but a demon be no promise of that. The Bloodscalp would kill him before they let him be taken by force, so I want cunning, not fear, if you have some to spare." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I use anything that bring him home alive, but a demon be no promise of that, mon. Look at it, grinning at the jungle like it smell the blood already, and the Bloodscalp would kill the boy before they let that thing near him, so I want cunning, not fear." },
      },
      choices = {
        { text = "Then I'll use cunning, not fear.", next = "BACK", reply = "Smart, mon, dat be the way. Cunning bring him home, fear just bring him home dead.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear works faster than cunning. Let me try.", next = "BACK", reply = "Fear work faster, true, but it also make them kill the boy faster. Nimboya beg you, mon, try the quiet way first.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The raptors and the panthers see everything, and the Bloodscalp hunt them, so the beasts know where the trolls camp. If you can listen to them the way your elders listen to the Earth Mother, maybe we find the boy before the Bloodscalp decide what to do with him." } },
      choices = {
        { text = "Then I'll listen to the beasts, and we'll bring Yenniku home.", next = "BACK", reply = "Dat be good, mon, the beasts know more than any scout. Listen well, and we bring Yenniku home together.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The beasts owe us nothing. We find him with our own eyes.", next = "BACK", reply = "The beasts owe us nothing, true, but they talk to them who listen. Use your eyes, mon, but use your ears too.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The Bloodscalp put a hold on the boy's spirit, and it take more than a blade to break it, maybe. If your prayers can touch a soul held that tight, you stay close, because Nimboya will need you on the day we find him." } },
      choices = {
        { text = "I'll pray for him and stand with you, Nimboya.", next = "BACK", reply = "Nimboya be grateful, mon, truly. Maybe your prayers and my blade together be enough to bring him back.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't free him, Nimboya. Strength will.", next = "BACK", reply = "Strength alone won't touch his spirit, mon, Nimboya try dat already. Bring both, and maybe dat be enough.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Maybe it could, mon, if your magic can tell a lost troll from a Bloodscalp at a hundred paces, because the boy wear their paint now. Burn their camps if you must, but you look twice before you throw your fire, because the chief's son might be standing in it." } },
      choices = {
        { text = "I'll take care, Nimboya. The boy comes first.", next = "BACK", reply = "Dat be all Nimboya ask, mon. The boy first, and then burn whatever you like.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If they stand together, Nimboya, they burn together.", next = "BACK", reply = "Then Nimboya keep you far from the boy, mon, and pray your fire know the difference. We need him alive, not ash.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorig_guru = {
      lines = { { id = "xgu_default", text = "Gurubashi, you say. Then you know the jungle tribes better than Nimboya ever will, and you know why I don't turn my back on a jungle troll, even one wearing our colors. Tell me what the Bloodscalp do with their captives, and maybe I believe you ran." } },
      choices = {
        { text = "Nothing good. That's why I ran.", next = "BACK", fx = { affinity = 1 } },
        { text = "I owe you no proof, Nimboya.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    hu_view = {
      lines = {
        { id = "hum_v_default", text = "Nimboya make them troll-killers, because dat be what they made a sword for. Trol'kalar hang on dis wall now, and the humans of Arathor forged it for nothing but cutting down trolls." },
        { id = "hum_v_troll", when = { race = "Troll" },
          text = "You see dat sword on the wall, Darkspear? Trol'kalar, the humans' troll-killer, and they forged it for nothing but our necks, so don't let any human tell you dey just came for trade." },
      },
      choices = {
        { text = "And the humans in Stranglethorn now?", next = "hu_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_stance = {
      lines = {
        { id = "hum_s_default", text = "The hunter Nesingwary come here to shoot our jungle's tigers and panthers for a book, and they hang the skins up like trophies. Nimboya hate them for it, but they don't bother Yenniku's captors either, so Nimboya don't have time for them yet." },
      },
      choices = {
        { text = "Yenniku first. The humans can wait their turn.", next = "BACK", reply = "Dat be right, dat be the only right answer. Go and bring Nimboya those heads, and we talk about humans after.", fx = { align = { honor = 1 }, opinion = { humans = "distrust" } } },
        { text = "Steal their trophies. Make them feel what they take.", next = "BACK", reply = "Ha, you got a mean streak, mon! Nimboya like it, a little. But you do it far from Grom'gol, so the goblins don't come asking.", fx = { align = { honor = -1 }, opinion = { humans = "hate" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Bloodscalp", min = 30 } }, text = "The Bloodscalp camps be quieter since you start walking through them, mon, and quiet Bloodscalp be the best kind, while Nimboya keep looking for the boy." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage of the Horde. Your fire be welcome against the Bloodscalp, and Nimboya hope your eyes be sharp for one lost young troll among them." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. Pray for Yenniku, then, because the Bloodscalp hold him somewhere in this jungle, and Nimboya need every voice that can reach the spirits." },
        { id = "h_default", key = true,
          text = "Yenniku, the chief's son, be lost in this jungle. I come from Orgrimmar to find him, and I don't go back without him." },
        { id = "h_hunt", tags = { "news" }, when = { questActive = TODO_QUEST("Hunt for Yenniku") },
          text = "The Bloodscalp got him, I think, so hunt them to the north and bring me their tusks. Show Nimboya you can make prey of them before we go further." },
        { id = "h_heads", when = { questActive = TODO_QUEST("Headhunting") },
          text = "Bring me the shrunken heads the Bloodscalp headhunters carry, many of them, and Nimboya look at every one. I pray to the Great Serpent his face not be among them." },
        { id = "h_clanheads", when = { questActive = TODO_QUEST("Bloodscalp Clan Heads") },
          text = "Gan'zulah the Bloodscalp chief and Nezzliok his witch doctor sit deep in Zul'Kunda, and they know where the boy be. Bring their heads to the cauldron, and we make the dead talk." },
        { id = "h_grim", when = { questActive = TODO_QUEST("Grim Message") },
          text = "Time the Witherbark learn what Darkspear do to those who betray the Warchief. Make it a message they remember." },
        { id = "h_saving", when = { questActive = TODO_QUEST("Saving Yenniku") },
          text = "Kin'weelay tell me you go after Yenniku with the soul gem. Whatever they done to him, we undo it, and I be waiting right here." },
        { id = "h_saved", tags = { "news" }, when = { questRecent = { TODO_QUEST("Saving Yenniku"), days = 7 } },
          text = "The chief's son's soul be free of Zanzil, because of you. The Darkspear will sing your name, and we carve your tale in stone so it never wash away." },
        { id = "h_trolkalar", when = { questDone = TODO_QUEST("Trol'kalar") },
          text = "Zengu send Trol'kalar down from Hammerfall, the humans' troll-killer sword, and now it hang here waiting for the Gurubashi. You had a hand in that too, I hear." },
        { id = "h_dream", when = { metBefore = true }, text = "Nimboya dream of Yenniku last night, small, like when he was a boy. Nimboya wake up and sharpen the spear." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. You could slip into the Bloodscalp camps and look for Yenniku, maybe, where a warrior like me only start a war." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Your power might frighten the Bloodscalp into giving up Yenniku, but I not risk the boy's life on a demon's temper." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, mon. Your eyes be good in this jungle, and good eyes might find the tracks of Yenniku where mine see only mud." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID", faction = "Horde" }, text = "A druid of the tauren, in this jungle. You know the beasts, and the beasts here know where the Bloodscalp hide Yenniku, if only they could tell us." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one with the Light, mon. I hear the Forsaken have strange priests now, but you be stranger still." },
      },
      again = {
        { id = "h_again", text = "What else? Nimboya listening, but not for long." },
        { id = "h_again2", text = "Ask, then, and I tell you what I can." },
      },
      choices = {
        { text = "What do you make of humans, Nimboya?", next = "hu_view" },
        { text = "Who is Yenniku?", next = "yenniku" },
        { text = "Do the jungle trolls fear a warrior's axe, Nimboya?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Who do you think took him?", next = "bloodscalp" },
        { text = "Have any trolls betrayed the Horde?", next = "witherbark" },
        { text = "The Darkspear must miss this jungle.", next = "walls" },
        { text = "I'm Darkspear. Tell me what the chief needs.", next = "kin", when = { race = "Troll" } },
        { text = "His soul is free. Is it over?", next = "after", when = { questDone = TODO_QUEST("Saving Yenniku") } },
        { text = "Could I track Yenniku through the jungle, Nimboya?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What can a priest do for Yenniku, Nimboya?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could my magic help find Yenniku, Nimboya?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I'll help you find him.", next = "END", reply = "The loa smile on you, mon, and Nimboya too. Go careful, and come back with good news.", fx = { affinity = 2, align = { honor = 1 }, learn = { "yenniku" } } },
        { text = "The spirits might know where Yenniku is.", next = "k_shaman", when = { class = "SHAMAN" } },
        { text = "Where do you think the Bloodscalp hold Yenniku, Nimboya?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Would you use a demon to rescue Yenniku, Nimboya?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "The jungle's beasts might lead us to Yenniku, Nimboya.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Would the Light help you find Yenniku, Nimboya?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I was born Gurubashi, Nimboya. I ran from Hakkar's priests.", next = "xorig_guru", when = { origin = "troll_gurubashi_runaway" } },
        { text = "Good hunting, but the chief's son is no business of mine.", next = "END", reply = "Then Nimboya wish you good hunting, mon, and maybe the loa change your mind. The boy still be out there waiting.", fx = { align = { honor = -1 } } },
      },
    },

    yenniku = {
      big = true,
      lines = {
        { id = "y_default", text = "Vol'jin's youngest son. It be the custom of our people that he go to the Gurubashi of Zul'Gurub, and when the Darkspear left with Thrall, the boy be lost to us." },
      },
      choices = {
        { text = "Your people gave a child away?", next = "yenniku_custom" },
        { text = "The chief must trust you deeply.", next = "yenniku_trust" },
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
        { text = "You haven't said a word about their chief.", next = "bloodscalp_chief" },
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
        { text = "I'll carry your pike.", next = "BACK", reply = "Dat be the spirit, mon, and the Witherbark will tremble when they see it. Plant it deep, so they never forget who came.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "That's cruel.", next = "BACK", reply = "Cruel, maybe, but the Witherbark take Darkspear heads too, mon. Dis be the jungle's language, and they only understand it loud.", fx = { align = { light = 1 }, opinion = { witherbark_pike = "against" } } },
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
        { text = "For Vol'jin, then.", next = "BACK", reply = "For Vol'jin, and for every Darkspear who ever lose kin to the Bloodscalp. The loa walk with you, brother.", fx = { affinity = 3, align = { order = 1 } } },
        { text = "I help for the boy's sake, not for any chief.", next = "BACK", reply = "Dat be a good heart, mon, and the boy need that more than any chief do. Bring him back, whatever your reason.", fx = { align = { order = -1 } } },
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
        { text = "Then I'll show them strength, without cruelty.", next = "BACK", reply = "Dat be the Darkspear way, mon. Strength with no cruelty, and the Gurubashi won't know what to make of it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll show them strength. Mercy's their problem.", next = "BACK", reply = "Strength be strength, mon, but cruelty make enemies who never forget. Show them both, and you got a whole jungle hunting you.", fx = { align = { honor = -1 } } },
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
    background = { { id = "tp_ba", text = "Nimboya be Darkspear, sent by the chief from Orgrimmar. That all you need to know, mon, and more than I tell most strangers." } },
    advice = { { id = "tp_ad", text = "The Bloodscalp hunt heads, so keep yours low in the ruins along the coast. They come from above, mon, always from above." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin be the chief of the Darkspear, and he send Nimboya to find his son. Nimboya not go home without Yenniku, not ever." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear be the best of the trolls, mon, and Nimboya be proud to be one of them. We be the ones who remember what loyalty mean." } },
    echo_isles = { { id = "tp_echo_isles", text = "The Echo Isles be our home, mon, where the Darkspear lived before the sea witch drove us out. Nimboya hope to see them again someday, with Yenniku beside him." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The Gurubashi in Zul'Gurub be calling on Hakkar again, mon, the soulflayer, and that be bad for every troll in the world. The Darkspear remember what Hakkar did to our people." } },
    thrall = { { id = "tp_thrall", text = "The Warchief gave the Darkspear a home when we had none, mon, and Nimboya not forget that. We be his, and he be ours." } },
    _none = { { id = "tp_none", text = "Nimboya got one thing on his mind, and that not it." } },
  },
}

P:NPC {
  key = "kinweelay", id = TODO_NPC("Kin'weelay"), name = "Kin'weelay",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "gromgol" }, temper = { "playful" }, values = { "loyal", "curious" },
  notices = { "class", "form" },

  impression = {
    first = "He jokes that the spirits are rude, but takes them very seriously.",
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
        { text = "The Light found room in me. I'll honor that.", next = "BACK", reply = "Dat be the right answer, mon, and the spirits will hush up for it. Kin'weelay never heard of the Light in a dead body either, but you make it look good.", fx = { align = { light = 1 } } },
        { text = "The spirits can say what they like. I don't need their blessing.", next = "BACK", reply = "Ha! The spirits not like that, mon, but Kin'weelay do. Walk your own road, and let them grumble.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a warrior hide nothing, mon, you stand in the open and shout who you be, and the spirits respect that more than any whisper. The Bloodscalp hide behind their juju, and that be why the spirits laugh at them." } },
      choices = {
        { text = "I'll fight in the open. There's no shame in being seen.", next = "BACK", reply = "Dat be the warrior's honor, and the spirits love it, mon. Shout loud and fight proud, and they be cheering.", fx = { align = { honor = 1 } } },
        { text = "Laughing spirits or not, I'll use whatever wins.", next = "BACK", reply = "Then the spirits laugh, mon, and keep laughing, but they also remember. Win if you must, but watch who be laughing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They do, mon, and a hunter who take only what he need be left alone, but one who kill for fun get bad luck on the trail. The beasts out here got old spirits, and they remember who thanked them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They do, mon, and a hunter who take only what he need be left alone, but one who kill for fun get bad luck on the trail. The beasts out here got old spirits, and they remember who thanked them. Your {pet} got a strong spirit in it, mon, and it like you, so treat it right and it never let you down." },
      },
      choices = {
        { text = "I take what I need and thank the beast for it.", next = "BACK", reply = "Good, good, dat be the old way, mon, and the trail stay lucky for you. The beasts remember who thank them.", fx = { align = { light = 1 } } },
        { text = "Spirits or no spirits, a kill is a kill.", next = "BACK", reply = "Then watch for the bad luck, mon, because it come when you least expect. The spirits keep their own count.", fx = { align = { light = -1 } } },
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
        { text = "The Darkspear should stand against it, and I'll stand too.", next = "BACK", reply = "Dat be the Darkspear heart, mon, and the loa see it. We stand together, and Hakkar find no blood here.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Power that old could be useful, if someone controlled it.", next = "BACK", reply = "Careful, mon, careful! The Gurubashi think the same thing, and now the Soulflayer be eating their souls.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The spirits remember the Gurubashi, and they remember Hakkar too, so they be slow to trust any troll. But the elements don't care for empires, mon; they listen to anyone who listen first." } },
      choices = {
        { text = "Then I'll listen first, and speak softly in their jungle.", next = "BACK", reply = "Dat be wise, mon, and the spirits will warm to you in time. Speak soft, and they listen better.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The spirits will answer me whether they trust me or not.", next = "BACK", reply = "Maybe dey answer, mon, but they not answer kindly. Trust be the bridge between you and dem, so build it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The spirits notice everyone, mon, but they be paying special attention to the quiet ones, because quiet ones go where they shouldn't. Bring Kin'weelay something from the Bloodscalp shrines, and the spirits might start liking you." } },
      choices = {
        { text = "I'll respect the spirits and their shrines.", next = "BACK", reply = "Good, mon, dat be the right respect. The spirits be watching, and they remember who mind their manners.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The shrines are fair game. Spirits or no spirits.", next = "BACK", reply = "Then the spirits be watching you real close, mon, and Kin'weelay not want to be you when they get angry.", fx = { align = { light = -1 } } },
        { text = "Something else, Kin'weelay.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because it be taking power from the air without asking, mon, and the spirits be very touchy about manners. Kin'weelay asks before he takes, and that be why the spirits still talk to him, even when they be rude about it." } },
      choices = {
        { text = "Then I'll ask before I take. Manners matter.", next = "BACK", reply = "Dat be the right way, mon, and the spirits will like you better. A please and a thank you go a long way with the loa.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Power belongs to those who can take it.", next = "BACK", reply = "Then the spirits take it back, mon, and with interest. Power not belong to anybody, it just visit.", fx = { align = { order = -1 } } },
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
          text = "Under the water at the Vile Reef, old troll carving be waiting. Bring me a piece of it. Mind the murlocs, because they guard it like it be theirs." },
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
        { id = "h_spirits", when = { metBefore = true }, text = "The jungle spirits be loud here, mon, louder than at home. They not friendly and they not unfriendly, they just loud." },
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
        { text = "The beasts' spirits must watch the hunters, Kin'weelay.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
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
        { text = "The Darkspear must want it for a reason.", next = "reef_why" },
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
        { text = "Then let's not waste it.", next = "BACK", reply = "Dat be the spirit, mon! Zanzil won't wait, and neither should we.", fx = { affinity = 2, align = { honor = 1 }, learn = { "yenniku" } } },
        { text = "Hope that faint isn't worth anyone's life.", next = "BACK", reply = "Maybe, mon, but the boy be out there waiting for somebody to try. Kin'weelay still hope, even if it be a small one.", fx = { align = { honor = -1 } } },
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
        { id = "mg_default", text = "Ah, I see him now, bound to this world and boiling with rage, an orc spy with his task still undone. Nazeer back in Dustwallow want to know how he die, so let us have words with this angry orc." },
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
        { text = "Then teach me to bargain.", next = "BACK", reply = "Gladly, mon, gladly! A bargain be better than a chain, because the spirits come back for more.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Chains work well enough, and I'll keep using them.", next = "BACK", reply = "Then the spirits flinch from you forever, mon, and one day they bite. Kin'weelay warn you, dat be all.", fx = { align = { light = -1 } } },
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
        { text = "Let him laugh. I chose this second life.", next = "BACK", reply = "Ha! Dat be the right answer, mon, and Bwonsamdi laugh even harder. Walk your second life proud.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "I'd rest, if I could. Tell him that.", next = "BACK", reply = "Kin'weelay tell him, mon, and maybe he listen. But Bwonsamdi be stubborn, and he like his jokes.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "What can't be seen, witch doctor?", next = "unseen" },
      },
    },
  },

  topics = {
    yenniku = { { id = "tp_yenniku", text = "His spirit wander, mon. I bring it home, one way or another.", next = "hope" } },
    background = { { id = "tp_ba", text = "They call Kin'weelay the strongest witch doctor of the Darkspear, and I don't argue, because arguing be bad luck. The chief send me here, so here I be." } },
    advice = { { id = "tp_ad", text = "If a trinket in the ruins hum at you, leave it be, mon. Old magic in Stranglethorn always want a new owner." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "Hakkar the Soulflayer be trying to come back through his priests at Zul'Gurub, and Kin'weelay can feel it in the spirits, mon. They be restless, and they be scared, and that make them rude." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin be the chief, and he be wise, and he listen to the spirits better than he let on. Kin'weelay do what he say, mostly." } },
    the_elements = { { id = "tp_the_elements", text = "The spirits talk to Kin'weelay all day long, mon, and most of them be complaining. The elements be the loudest, and the most impatient." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "The Atal'ai priests in the Sunken Temple be trying to call Hakkar too, mon, in the swamp to the north. Two doors for one bad god, and Kin'weelay don't like it one bit." } },
    echo_isles = { { id = "tp_echo_isles", text = "The Echo Isles be full of good spirits and bad ones, mon, and the sea witch's magic still be there. Kin'weelay would like to clean it out someday." } },
    _none = { { id = "tp_none", text = "Even the spirits don't know that one. Or they not telling." } },
  },
}

P:NPC {
  key = "mokthardin", id = TODO_NPC("Far Seer Mok'thardin"), name = "Far Seer Mok'thardin",
  bible = "bibles/stranglethorn.md", role = "priest", tier = "quest",
  communities = { "gromgol" }, temper = { "calm" }, values = { "wise", "patient" },
  prejudice = { class = "WARLOCK", amount = 14, why = "Old enough to remember Gul'dan's warlocks turning the orc shamans from the spirits." },
  notices = { "class" },

  impression = {
    first = "He keeps the one quiet fire in a loud camp.",
    third = "{name} sat by Far Seer Mok'thardin's fire at Grom'gol, where the orc studies the old power in the blood and bones of Stranglethorn's beasts.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "I was young when Gul'dan's warlocks turned our shamans from the spirits, and the spirits did not answer us for a generation. Do not come near my fire." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "The ancestors go quiet when you walk into this camp. Speak from where you stand." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "The spirits have not fled from you as I thought they would. Sit, then, at the edge of the fire." },
    { id = "g_op_warchief", when = { gossip = { topic = "warchief", stance = "trust" } }, text = "Commander Aggro'gosh tells me you stand behind the Warchief without a doubt in you. The spirits favour a steady heart, so come and sit, steady one." },
    { id = "g_fire", text = "The camp is loud with grunts and drums, but here by the fire the spirits are quieter. Speak, and I'll listen." },
    { id = "g_back", when = { metBefore = true }, text = "The fire kept your place for you, and the ancestors watched it burn. Sit." },
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
    op_demons = {
      lines = {
        { id = "opd_default", text = "They do say it, and the Warchief allows the warlocks their school in the Cleft of Shadow, for now. I am an old shaman and my answer is easy to guess, but I would hear yours, because the young ones will decide this, not me." },
      },
      choices = {
        { text = "Demons poisoned the orcs once. Never again.", next = "op_demons_hate", fx = { affinity = 1, align = { light = 1 }, opinion = { demons = "hate" } } },
        { text = "A tool is a tool. Bind the demon and make it work.", next = "op_demons_useful", fx = { affinity = -1, align = { light = -1 }, opinion = { demons = "useful" } } },
        { text = "I command my demons, Far Seer. They don't command me.", next = "op_demons_useful", fx = { affinity = -1, opinion = { demons = "useful" } }, when = { class = "WARLOCK" } },
        { text = "Let the warlocks serve, but watch them closely.", next = "op_demons_mixed", fx = { opinion = { demons = "dangerous" } } },
        { text = "I don't know enough to say.", next = "BACK" },
      },
    },
    op_demons_hate = {
      lines = {
        { id = "opdh_default", text = "The elements thank you, and so do I. Never again is a promise every orc should make, though it is a hard one to keep when the enemy is stronger and the demons offer so much." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_demons_useful = {
      lines = {
        { id = "opdu_default", text = "So said Gul'dan, and so said every orc who drank from Mannoroth's cup. I do not call you a fool, but I will pray to the spirits that you never learn what I mean the hard way." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_demons_mixed = {
      lines = {
        { id = "opdm_default", text = "Watching is the hard part, because a demon is patient and an orc is not. Still, that is a wiser answer than most I hear in Orgrimmar." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_mokthardin = {
      big = true,
      lines = { { id = "xpt_mokthardin_default", text = "Because the trolls here have bled this land for their gods for longer than any orc has lived, and the earth remembers every drop. Ask your shaman to listen closely while you hunt, because a war band that ignores the spirits in this jungle tends not to come home." } },
      choices = {
        { text = "We'll respect the spirits. The land deserves that much.", next = "BACK", reply = "Then you have learned in a day what took me a season in this jungle. Treat the spirits as elders, and one day the land may let the Horde call it home.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The spirits can wait. We came to fight trolls.", next = "BACK", reply = "The spirits will wait, young one, because they have waited ten thousand years already. But they will remember how you fought, and so will the earth under your feet.", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_zg = {
      big = true,
      lines = { { id = "xcl_zg_default", text = "Some do, and some never will, because blood spilled for a false god does not sink back into the earth quietly. The Gurubashi bent the jungle's power to feed their Soulflayer, and it will take the shaman of the Horde many years to coax it back to its own nature." } },
      choices = {
        { text = "Then we coax it gently. The land deserves patience.", next = "BACK", reply = "Patience is the shaman's oldest gift, and I am glad to see it in you. The land will not thank us quickly, but it will thank us.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Burn the old shrines and let the jungle heal itself.", next = "BACK", reply = "Fire scars the ground and does not heal it, and our people learned that on Draenor. Let the vines take the old shrines slowly, and the spirits will quiet with them.", fx = { align = { order = -1 } } },
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
      lines = { { id = "xfpala_default", text = "The elements answer the shaman and the Light answers the paladin, and I have never needed to choose between them. What I wonder is what it asks of you in return, for a power that crosses death must ask a heavy price." } },
      choices = {
        { text = "It asks that I serve, and I serve gladly.", next = "BACK", reply = "Then the Light chose well when it woke in you. Service given gladly is a blessing the elements would recognise too.", fx = { align = { light = 1 } } },
        { text = "It asks nothing. I take what it gives.", next = "BACK", reply = "That is how a young shaman speaks before the storm teaches him manners. The Light may give freely, but even a gift remembers the hand that grabbed it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The same way the beasts do, for they rage only when the hunt calls for it and rest the moment it's done. Our people let the blood-rage rule them once, and you know what it cost us, so be fierce when you must and calm the rest of the time." } },
      choices = {
        { text = "Fury should serve me, not the other way round.", next = "BACK", reply = "You speak like a raptor that has learned to sit still, and that is high praise from me. Fury that serves its master is the strength Thrall taught us.", fx = { align = { order = 1 } } },
        { text = "My fury is my strength. I won't chain it.", next = "BACK", reply = "Our grandfathers said the same thing with demon blood in their mouths, young one. Master your fury, or it will master you and call it freedom.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not my power, hunter, but an old one from when the jungle trolls worshipped the beast gods, and it still runs in the blood of the strongest tigers and panthers. I need their fangs and hearts, and I ask the hunters who bring them to kill cleanly." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not my power, hunter, but an old one from when the jungle trolls worshipped the beast gods, and it still runs in the blood of the strongest tigers and panthers. I need their fangs and hearts, and I ask the hunters who bring them to kill cleanly. Your {pet} feels it too, which is why it watches the trees." },
      },
      choices = {
        { text = "Clean kills only. The beasts deserve that much.", next = "BACK", reply = "That is the hunter's debt, and you pay it well. The beasts give us their strength, and the least we owe them is a clean end.", fx = { align = { light = 1 } } },
        { text = "Power's power. How the beast dies doesn't matter.", next = "BACK", reply = "Power taken without respect sours in the blood, hunter, and the jungle trolls are proof of it. The earth remembers how every beast died.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "The Gurubashi trolls call on gods that were old before the Horde came to this world. Their priests wake things in the jungle that should sleep. We watch them, and we do not sleep well either." } },
      choices = {
        { text = "Then we must calm the spirits before they turn on everyone.", next = "BACK", reply = "Then you understand what a shaman carries out here. If we do not calm them, the jungle will burn, and it will not ask whose banner stands in it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the trolls drown in their own gods.", next = "BACK", reply = "They may drown, but old gods do not stop at the shore of one tribe. The land is one body, druid, and its anger will reach Grom'gol too.", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the trolls bound dark magic into the jungle long ago, and it still lives in the panthers and raptors, making them crueler than nature intended. I hunt the strongest of them, so the jungle can heal, and a quiet hunter is worth three loud ones." } },
      choices = {
        { text = "I'll hunt them quietly and help the jungle heal.", next = "BACK", reply = "Then hunt quietly and with care, and the jungle will count you a friend. Each tainted beast laid to rest is a little of the old curse lifted.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Leave the beasts be. The jungle's cruelty is its own.", next = "BACK", reply = "The jungle's cruelty is not its own here, rogue, it was poured into it by troll priests. Leave the beasts alone and the curse only spreads further.", fx = { align = { light = -1 } } },
        { text = "Something else, Far Seer.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Any seeker can learn, if they are willing to listen more than they speak. The elements teach patience and balance, and I have known mages who would have done well to learn both before they learned fire." } },
      choices = {
        { text = "Then I'll learn patience first.", next = "BACK", reply = "Then you have already begun, and most never do. Listen to the wind for a season, and the fire will come when it is ready.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fire comes first, and patience can wait.", next = "BACK", reply = "Fire that comes before patience burns the hand that calls it, and I have seen it happen. The elements are slow to forgive the impatient.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Perhaps, though the power in a raptor's blood is older than any prayer, and it answers to the earth before it answers to anyone's god. Your shadows and your loa have their own ways, priest, and I'll not tell you yours, but I'd ask you not to waste what the beasts give when they fall." } },
      choices = {
        { text = "I'll honor what the beasts give, Far Seer.", next = "BACK", reply = "Honor them, priest, and the beasts will remember you kindly. I will remember you too, which is worth a little less.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Power is power. I'll take whatever serves me.", next = "BACK", reply = "Power is never yours, priest, only lent by the earth for a time. Take carelessly and it will be called back, with interest.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_view = {
      lines = {
        { id = "hum_v_default", text = "I make them a people who take without asking, much as we once did. The hunters at Nesingwary's camp kill the jungle's great cats for sport, and the spirits of this place cry out every time, the same way Ashenvale cried out at our axes." },
        { id = "hum_v_undead", when = { race = "Scourge" },
          text = "You were one of them, and you came back from death a different thing, so perhaps you see them more clearly than I do. They take without asking, as we once did, and the jungle's spirits cry out at Nesingwary's guns." },
      },
      choices = {
        { text = "You sound almost sympathetic to them.", next = "hu_stance" },
        { text = "Something else, Far Seer.", next = "BACK" },
      },
    },
    hu_stance = {
      lines = {
        { id = "hum_s_default", text = "Not sympathy, but memory. We came through the Dark Portal as invaders and burned Stormwind to the ground before any human ever built a camp for us, and Thrall says an orc who forgets that is only waiting to become Blackmoore." },
      },
      choices = {
        { text = "Thrall is right. We were the invaders first.", next = "BACK", reply = "Then you understand what the Warchief asks of us, and why it is so hard. Remember it in the jungle, and walk gently past their camp.", fx = { align = { honor = 1 }, opinion = { humans = "mixed" } } },
        { text = "Whatever we did, the camps paid it back tenfold.", next = "BACK", reply = "Many say so, and I will not argue the arithmetic of suffering with you. But a debt you count that carefully is a debt you mean to collect, young one.", fx = { align = { honor = -1 }, opinion = { humans = "hate" } } },
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
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "I remember the day the spirits stopped answering us, and I remember who was to blame. Say what you want from an old far seer, and then leave my fire." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "The spirits do not flee from you anymore, and I have stopped expecting them to. Sit, if you like." },
        { id = "h_default", key = true,
          text = "Far Seer Mok'thardin, of Orgrimmar. Thrall taught us to ask the spirits before we take, and the beasts of Stranglethorn carry old power in their blood and bones that I'm learning to ask for." },
        { id = "h_ench", when = { questActive = TODO_QUEST("Mok'thardin's Enchantment") },
          text = "The choker I'm enchanting needs what only Stranglethorn's beasts can give. Bring it, and I'll show you what it becomes." },
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
        { text = "What do you make of humans, Far Seer?", next = "hu_view" },
        { text = "The jungle spirits are angry here. The trolls stir them.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "What kind of power?", next = "power" },
        { text = "Whatever you're making looks like fine work.", next = "ench" },
        { text = "Why send a far seer to a supply camp?", next = "why" },
        { text = "What do you make of the trolls' magic?", next = "trolls" },
        { text = "What do you make of the night elves' grudge, Far Seer?", next = "grudge" },
        { text = "The elements speak to me as well.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I'm an orc who studies the arcane.", next = "orc_mage", when = { race = "Orc", class = "MAGE" } },
        { text = "My people honor the elements too.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "I took the warlock's path, far seer. Like our grandfathers.", next = "k_lock", when = { race = "Orc", class = "WARLOCK" } },
        { text = "Why do you want the old power out of the beasts, Far Seer?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Can a mage learn wisdom from the elements, Far Seer?", next = "xmage", when = { class = "MAGE", race = { "Troll", "Scourge" } } },
        { text = "How do I keep hold of the fury, Far Seer?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "You seem to draw your power from the beasts, Far Seer.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Can a priest's prayers reach the power in these beasts, Far Seer?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does the Light sit well with a far seer, Mok'thardin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Hakkar is dead, Far Seer. Do the spirits rest now?", next = "xcl_zg", when = { cleared = "Zul'Gurub", faction = "Horde" } },
        { text = "Why are the jungle's spirits restless, Far Seer?", next = "xpt_mokthardin", when = { party = { class = "SHAMAN" }, faction = "Horde" } },
        { text = "Thank you, far seer.", next = "END" },
      },
    },

    grudge = {
      lines = {
        { id = "gd_default", text = "I make it a fair one, and few in this camp like hearing me say so. Grom killed Cenarius with Mannoroth's blood burning in him, so the Horde's first great deed in Kalimdor was done with a demon's strength, and the elves have never let us forget it." },
        { id = "gd_heard", when = { heardLine = "aggrogosh.gc_default" },
          text = "The commander told you he'd strike that blow again, I expect; he tells everyone. I make the elves' grudge a fair one, because Grom killed Cenarius with Mannoroth's blood burning in him, and a deed done with a demon's strength is not one I can be proud of." },
      },
      choices = {
        { text = "You sound ashamed.", next = "grudge_shame" },
        { text = "Grom broke the curse afterward. Doesn't that count?", next = "grudge_grom" },
        { text = "Something else, Far Seer.", next = "BACK" },
      },
    },
    grudge_shame = {
      lines = {
        { id = "gs_default", text = "I am, and I carry it the way I carry the warlock years, because a shaman who forgets what his people did will let them do it again. The spirits of that forest cried out when Cenarius fell, and the shamans at Splintertree tell me they have not been quiet since." },
      },
      choices = {
        { text = "The shame is fair. We owe that forest something.", next = "BACK", reply = "Then remember it whenever you walk under those trees. The spirits notice who takes with thanks and who takes with an axe and a song.", fx = { align = { light = 1 }, opinion = { night_elves = "mixed" } } },
        { text = "Shame is a luxury. The Horde survived, and that's enough.", next = "BACK", reply = "Our grandfathers told themselves the same thing with demon blood in their mouths. I will not call you wrong, young one, but I will pray that you never have to learn why I do.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grudge_grom = {
      lines = {
        { id = "gg_default", text = "It counts for everything with the orcs and for nothing with the elves, and both of them are right. Grom freed us by killing Mannoroth, but Cenarius was already dead, and you cannot repay one people's loss with a kindness done for another." },
      },
      choices = {
        { text = "Then the Horde owes them peace, if they'll take it.", next = "BACK", reply = "If they'll take it, yes, and the Warchief has tried. Peace offered and refused is still worth more than none offered at all.", fx = { align = { honor = 1 }, opinion = { night_elves = "respect" } } },
        { text = "They chose to hate us. That burden is theirs.", next = "BACK", reply = "Perhaps it is, and they carry it well enough. But a burden carried by both sides of a forest is still a burden, young one.", fx = { align = { honor = -1 }, opinion = { night_elves = "distrust" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    power = {
      lines = {
        { id = "p_default", text = "The kind that settles into anything that's lived long in a wild place. Orgrimmar teaches us to ask before we take, so I ask." },
      },
      choices = {
        { text = "The answer might well be no.", next = "power_no", fx = { affinity = 2 } },
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
        { id = "ec_default", text = "Perhaps all of them, perhaps none. The water doesn't seem to mind who drinks it, and I have learned not to mind either." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    why = {
      lines = {
        { id = "w_default", text = "The jungle's magic should be understood and harnessed for the Horde before someone else harnesses it against us. My rituals have worked so far, and the Warchief's defenders wear the proof." },
      },
      choices = {
        { text = "Some in Orgrimmar say warlocks have their uses again.", next = "op_demons" },
        { text = "Something else.", next = "BACK" },
      },
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
        { text = "That's fair, far seer.", next = "BACK", reply = "You are generous to say so, and I will hold you to it. Prove me wrong, young one, and I will tell the whole camp that I was.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The arcane isn't the fel.", next = "BACK", reply = "No, it is not, and I know the difference better than most. But power is a hungry thing, and hunger is what our grandfathers fed until it ate them.", fx = { align = { order = -1 }, trait = { proud = 1 } } },
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
        { text = "That the fel can be mastered, not served.", next = "BACK", reply = "Mastered, you say. Our grandfathers said the same word, warlock, so I will watch you, and you will prove it to me with years, not words.", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "That it must never rule us again. I watch it.", next = "BACK", reply = "That is the only answer I would accept from you. Watch it as a sentry watches the dark, and never let it see you blink.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "What do you make of the trolls' magic?", next = "trolls" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was trained in Orgrimmar to listen to the elements, and Orgrimmar sent me here to listen to the jungle. So far the jungle mostly talks about rain." } },
    advice = { { id = "tp_ad", text = "Thank what you kill, even a raptor. It costs you nothing, and the land remembers the ones who don't." } },
    the_elements = { { id = "tp_the_elements", text = "The elements in this jungle are old and wild, and the beasts here carry some of that power in their blood. I'd like to bring it out of them, and give it back to the land." } },
    thrall = {
      { id = "tp_thrall", text = "Thrall was the first shaman of our people in a generation, and he taught us to listen to the elements again. I wouldn't be here without him." },
      { id = "tp_thrall2", when = { class = "SHAMAN" }, text = "You're a shaman yourself, so you know what the Warchief gave back to us. We were warlocks and slaves once, and now we listen, and that's his doing." },
    },
    earth_mother = { { id = "tp_earth_mother", text = "The tauren call the land the Earth Mother, and I've come to think they hear the same voice we do, by a gentler name. I don't argue with them." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The spirits around Zul'Gurub are sick, poisoned by blood magic, and the jungle feels it. I won't go near that place without a full war party." } },
    burning_blade = { { id = "tp_burning_blade", text = "The Burning Blade still traffics with demons, and they'd have us go back to the old ways. They'll have to kill me first." } },
    _none = { { id = "tp_none", text = "That is beyond what the elements tell me, and I'll not invent an answer the spirits never gave." } },
  },
}

P:NPC {
  key = "thulbek", id = TODO_NPC("Innkeeper Thulbek"), name = "Innkeeper Thulbek",
  bible = "bibles/stranglethorn.md", role = "innkeeper", tier = "service",
  communities = { "gromgol" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary", "drink" },

  impression = {
    first = "He trades a bed for a war story and thinks he wins.",
    third = "{name} found a bed at Grom'gol with Innkeeper Thulbek, who asks only for a story of the fighting in return.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, friend. Your usual seat's free, and I made sure of it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Pay first, if you please. I've learned that much about you." },
    { id = "dp_pt_any", when = { party = true }, text = "You bring friends to Grom'gol, good. The jungle eats travellers who walk alone." },
    { id = "g_op_warchief", when = { gossip = { topic = "warchief", stance = "soft" } }, text = "The Commander says you think the Warchief went soft on the humans. Say that by my fire and the old grunts will buy you a drink, while the young ones start a fight, so sit on the end." },
    { id = "g_inn", text = "Come in and sit by the fire, {class}! Out here a fire keeps things away, not cold, and an orc's stew keeps the rest away." },
    { id = "g_home", when = { homeInn = { "Grom'gol Base Camp" } }, text = "Home again, and with all your limbs. Your bed's dry, which in Stranglethorn counts as a luxury." },
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
        { text = "I'll tell it true, Thulbek, every word.", next = "BACK", reply = "Good, because honest stories are scarce out here, and the grunts can smell a lie through the smoke. Tell it true and they will remember your name.", fx = { align = { honor = 1 } } },
        { text = "I'll make it grander than it was. Stories need it.", next = "BACK", reply = "Ha! Now you talk like an innkeeper, and I like you for it. Make it grand enough and the grunts will drink to you until dawn.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The one where you stood your ground when everybody else ran, because that's the only story worth a bed in Grom'gol. Every grunt on that wall has one, and I've heard them all twice, so make yours new." } },
      choices = {
        { text = "I held my ground when it mattered. That's my only story.", next = "BACK", reply = "That is the only story worth a bed in Grom'gol, and the grunts will cheer it. Sit down by the fire, warrior, and tell it slowly.", fx = { align = { honor = 1 } } },
        { text = "My best story is the one where I ran and lived.", next = "BACK", reply = "Ha! That is the most honest answer I've had all season, and there's no shame in it. A warrior who lives to fight again has a story the dead never will.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Every night, and the best is about a troll mage who froze a raptor mid-leap and forgot to thaw it, so it stood outside the gate for a day like a statue. The worst is about a warlock, and I don't let them tell that one at supper." } },
      choices = {
        { text = "A camp needs stories. I'll bring you a true one.", next = "BACK", reply = "Bring it and I'll tell it every night until the grunts can say it with me. A true story outlasts a hundred tall ones, and it gets better with ale.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll tell them a few tall tales to keep them guessing.", next = "BACK", reply = "The grunts love a tall tale more than a full bowl, and they'll never know which parts you made up. Keep them guessing and they'll keep drinking.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "One of the far seer's students told me how Thrall broke open the internment camps with the elements at his side, and nobody touched their stew till he finished. I'd give a month's bed for another story that good." } },
      choices = {
        { text = "Thrall freed us with honor. Those stories should be told.", next = "BACK", reply = "They should, and I tell them every night to anyone who'll sit still. Thrall gave us back our freedom, and we owe him every telling.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Old stories don't win new fights, Thulbek.", next = "BACK", reply = "Maybe not, but they remind the grunts why they hold this wall in the rain. Without Thrall's story, Grom'gol is just a muddy fort.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The ones where somebody gets away with something, and the ones where they don't, depending on how much ale I've had. Out here, a good story keeps a man warm through the night better than any fire, though the fire keeps the beasts away." } },
      choices = {
        { text = "I'll tell you an honest one, then.", next = "BACK", reply = "An honest one, from a rogue? Now that is a story by itself, and I'll pour the ale while you tell it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The best stories are the ones nobody can prove.", next = "BACK", reply = "Ha! Those are the best kind, and the grunts love nothing better. Tell me one, and I swear by my mother's axe it stays in this inn.", fx = { align = { honor = -1 } } },
        { text = "Something else, Thulbek.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a spell is over in an instant, and a good story lasts all night. Out here, with the trolls on the ridges and the beasts in the trees, a long night needs a long story, and I've heard enough short ones." } },
      choices = {
        { text = "I'll tell you a long one, then.", next = "BACK", reply = "Then pull up a stool, mage, because the night is long and the rain won't stop. The grunts need a long story more than they need sleep.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A spell is quicker. Let me light it and be done.", next = "BACK", reply = "Light it, then, and you'll be warm for a moment and bored for the rest of the night. Stay and listen afterward, and you might learn what a fire is for.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It grows over the walls, it creeps under the doors, and something big screams out there every other night. The orcs say a fire keeps it off, but I've seen your druids sit outside the walls in the dark and come back calm, so maybe you know better." } },
      choices = {
        { text = "The jungle isn't an enemy. Grom'gol should learn to live with it.", next = "BACK", reply = "Maybe it should, but the grunts don't listen to an innkeeper about trees. Teach them yourself, druid, and I'll pour you something for the trouble.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Keep the fires lit, Thulbek. The jungle will take what it can.", next = "BACK", reply = "I will, and I'll keep them lit until dawn if I have to. The jungle never sleeps, and in this inn neither do I.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_deaths_thulbek", when = { deaths = { min = 15 } },
          text = "You come back from the spirit healer more often than most warriors I've known, and you still walk in on your own feet. That's strength of a kind, though a wiser orc would learn to die less." },

        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Sit by the fire and tell me whether the elements have anything to say about the rain, because it hasn't stopped since I got here." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Sit close to the fire; whether you pray to the loa or the shadows, you'll do it better on a full stomach." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "Sit and eat; your demon can have the scraps, and the grunts can stop staring, because I've told them to." },
        { id = "h_default", key = true,
          text = "Innkeeper Thulbek. As long as Grom'gol stands, there's a bed here for any blood of the Horde. All I ask is a story of the fighting while you eat, because an orc's dinner goes down easier with a battle in it." },
        { id = "h_story", when = { metBefore = true }, text = "A grunt told me last night he wrestled a gorilla. By morning it was two gorillas, and by noon, a gorilla king, which makes a good story and a bad liar." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The jungle never sleeps. Listen, and you'll hear that everything out there is either hunting or hiding, the way it was on Draenor, so eat your stew while it's hot." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. Sit down and tell me a story, and make it a good one, since I trade beds for stories and you look like you've got a few." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You could light the fire with a flick of your hand, I suppose, but I'd rather you told me a story instead, since I've plenty of wood." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! Sit, eat, and tell me who you've fought this week, because a warrior always has the best stories and the worst table manners, and I've never held either against one." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid of Thunder Bluff, at my fire. Tell me a story of the plains, friend, because all I hear down here is the jungle trying to get in." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin at my fire! Now that's a story I'd trade a bed for, so sit down and tell it while you eat, or while you pretend to eat." },
      },
      again = { { id = "h_again", text = "Still here? Good, the stew's still hot and the grog's still angry, so what else?" } },
      choices = {
        { text = "Have any shamans told stories at your fire, Thulbek?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The grunts here must tell stories about the casters among them.", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Does Grom'gol need meat for the cookfire, Thulbek?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "I've a story or two.", next = "story" },
        { text = "What's the talk in camp?", next = "talk" },
        { text = "Where does the zeppelin go?", next = "zeppelin" },
        { text = "Do you even cook for the Forsaken?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Somebody else must keep this camp running.", next = "keepers" },
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
        { text = "So Nez'raz never stops talking.", next = "keepers_nezraz" },
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
        { text = "It's good to see the Horde here.", next = "BACK", reply = "And it's good to have the Darkspear here, because you know which noises in the trees mean trouble. Tell me one story about the green and I'll pour the ale.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "It's still our jungle, not the Horde's.", next = "BACK", reply = "Maybe it is, and the Horde only borrows it while the trolls fight each other. Tell me about the old jungle, then, so I understand what we're borrowing.", fx = { align = { order = -1 } } },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "Always, hunter, always. The tigers and raptors are plentiful here, and the grunts eat as though they're feeding three mouths apiece. Bring meat and I'll be your friend for a week." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Always, hunter, and by the look of {pet}'s muzzle it's been doing some of the hunting already. Bring meat back for the grunts, save a bone for your friend, and I'll be your friend for a week." },
      },
      choices = {
        { text = "I'll hunt for the camp, then.", next = "BACK", reply = "Then the grunts will sing your name, hunter, or at least chew it. Bring me the meat and I'll have it in the pot before the sun's down.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hunt for my own needs first.", next = "BACK", reply = "A hunter has to eat first, I'll not argue with that. But bring the camp a haunch when you can, because the grunts eat like three armies.", fx = { align = { order = -1 } } },
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
    background = { { id = "tp_ba", text = "Just an orc who cooks where the Horde camps, because the Horde has to eat wherever it ends up, and a hungry grunt fights like a peon." } },
    advice = { { id = "tp_ad", text = "Sleep with your boots on and your axe within reach. Not because of anything in particular, just because it's Stranglethorn." } },
    thrall = { { id = "tp_thrall", text = "The Warchief eats at the same table as his grunts when he can, and I respect a leader who knows what a stew costs. That's the kind of chief I'd cook for." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got better rum than I do, and they charge three times as much for it. I tell the grunts to drink here and save their silver for something important." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The grunts come back from the Arena with cuts and bruises and stories, and they eat twice as much as usual. I'm glad they go, it's good for my business." } },
    second_war = { { id = "tp_second_war", text = "I cooked for the Horde in the Second War, before the camps, and the food was worse then than it is now. That's the one thing I'm proud of in my life." } },
    _none = { { id = "tp_none", text = "Ask the Commander. He hears everything in this camp, and he complains about most of it like a proper old warrior." } },
  },
}
