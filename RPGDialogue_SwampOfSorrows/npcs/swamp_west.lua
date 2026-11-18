-- The western swamp: Watcher Biggs and his broken caravan below Splinterspear Junction, and the draenei of the Harborage (Magtoor, Masat T'andr). Voice: bibles/swamp_west.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "biggs", id = TODO_NPC("Watcher Biggs"), name = "Watcher Biggs",
  bible = "bibles/swamp_west.md", role = "soldier", tier = "quest",
  communities = { "swamp_of_sorrows" }, temper = { "earnest", "weary" }, values = { "dutiful", "loyal" },
  notices = { "class", "race", "weary" },

  impression = {
    first = "Watcher Biggs is the last man of a caravan the Lost Ones broke on the road to Nethergarde. He sits guard over a smashed wagon in the reeds because he swore he would, and he means to finish the trip.",
    third = "{name} met Watcher Biggs, sole survivor of a Nethergarde caravan, guarding its wreck in the Swamp of Sorrows.",
  },

  greetings = {
    { id = "g_default", text = "Hold there! Oh, thank the Light, you're no Lost One. Come into the firelight where I can see you, friend." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, {name}. I'd half convinced myself I'd dreamed you, out here with only the frogs for company." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Slowly, now. At night every shape in these reeds looks like a Lost One, and I've a crossbow and very little sleep." },
    { id = "g_wild", when = { questActive = TODO_QUEST("Encroaching Wildlife") }, text = "I heard the jaguars yowling to the north, and then I heard them stop. Was that your work?" },
    { id = "g_done", when = { questDone = TODO_QUEST("Deliver the Shipment") }, text = "{name}! Did the quartermaster get it all? Tell me he did, because I've been mending this wagon on the strength of it." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the wagon's still not fixed. Don't tell anyone how slow I am with a hammer." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look worse than I feel, and I was knocked senseless by a Lost One. Sit by the fire a moment before you go back into that muck." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, out here? I prayed for help every night since the ambush, though I never thought the Light would send it in plate." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. If you've a prayer to spare, say one for the lads I couldn't bury properly, because the swamp took them before I could." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Half the miners at Nethergarde are your people, and they'll be glad to hear their supplies weren't all lost." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "You walk through these reeds without a sound, which is more than I can do. I'd ask you to teach me, but I think it takes a few hundred years." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_before", when = { questBefore = TODO_QUEST("Encroaching Wildlife") },
          text = "My caravan was bound for Nethergarde Keep in the Blasted Lands, and the Lost Ones fell on us here. I'm the only one left, and I swore to guard what's left of the supplies, but the beasts grow bolder every night." },
        { id = "h_wild", when = { questActive = TODO_QUEST("Encroaching Wildlife") },
          text = "The jaguars, the spinners and the young sawtooths, that's what keeps creeping up on this camp. Thin them out for me and I'll sleep for the first time in a week." },
        { id = "h_chest", when = { questActive = TODO_QUEST("The Lost Caravan") },
          text = "The chest went north to the Fallow Sanctuary, dragged off in one of our own wagons. The wizards' reagents are inside, if the Lost Ones haven't eaten them, and I don't think even they're that hungry." },
        { id = "h_wood", when = { questActive = TODO_QUEST("Driftwood") },
          text = "Dry wood, friend, sun-bleached driftwood from the eastern shore. The trees here are all sponge and rot, and an axle made of them would fold the first time I loaded it." },
        { id = "h_ship", when = { questActive = TODO_QUEST("Deliver the Shipment") },
          text = "The crates are with you, then. East along the road, south into the Blasted Lands, left at the next fork, and keep your eyes on the ridges, because the ogres sit up there and wait." },
        { id = "h_default", key = true,
          text = "Watcher Biggs, of the Nethergarde caravan, or what's left of it, which is me and one wagon with a broken back. I'm guarding what remains until I can get it to the keep, and I mean to get it there." },
        { id = "h_after", when = { questDone = TODO_QUEST("Deliver the Shipment") },
          text = "The shipment reached Nethergarde because of you, and that means the lads didn't die for nothing. I'll be on the road myself once this wagon's whole, if the swamp lets me go." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I've nowhere to be until this wagon rolls." },
        { id = "h_again2", text = "Ask away. Talking keeps me awake, and awake keeps me alive." },
        { id = "h_again3", text = "Go on. The frogs are poor conversation." },
      },
      choices = {
        { text = "What happened to your caravan?", next = "ambush" },
        { text = "What's so important about these supplies?", next = "reagents" },
        { text = "Why not leave the wagon and walk out?", next = "stay" },
        { text = "Where did the caravan come from?", next = "darkshire" },
        { text = "Can you mend the wagon?", next = "wood", when = { questDone = TODO_QUEST("The Lost Caravan") } },
        { text = "Tell me about Quartermaster Lungertz.", next = "lungertz", when = { questActive = TODO_QUEST("Deliver the Shipment") } },
        { text = "The Light kept you alive for a reason, Watcher.", next = "xlight", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "I'll be going. Keep your crossbow close.", next = "END" },
      },
    },

    ambush = {
      lines = {
        { id = "am_default", text = "We came down from Darkshire, past Deadwind, and the road was quiet until the junction. Then the Lost Ones came out of the reeds all at once, and they went for the guards first, as if they knew which of us mattered." },
      },
      choices = {
        { text = "Who are the Lost Ones?", next = "lostones" },
        { text = "How did you survive?", next = "survive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lostones = {
      lines = {
        { id = "lo_default", text = "They're tall and grey and broken somehow, and they live in a village to the north they call the Fallow Sanctuary. They speak, which is the worst of it, because I heard them talking to each other while they dragged our wagon away." },
        { id = "lo_magtoor", when = { heardLine = "magtoor.h_default" },
          text = "You've met the ones at the Harborage, then, and you know the Lost Ones were their kin once. I can't decide whether that makes it better or worse, and I've had a lot of nights to think about it." },
      },
      choices = {
        { text = "They're mad, not wicked. They deserve pity.", next = "BACK", reply = "Pity, aye, I suppose they do, and I'd give it if I could stop seeing my lads' faces. Maybe you're a better man than me.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "They killed your men. Pity can wait.", next = "BACK", reply = "That's what I keep telling myself, but it doesn't sit as easy as it should. They talk, you see, and that's the hard part.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    survive = {
      lines = {
        { id = "sv_default", text = "I was struck from behind and went down in the mud, and they must have taken me for dead. When I woke it was dark, and quiet, and I was the only one breathing, and I sat with that for a long while before I could stand." },
      },
      choices = {
        { text = "You survived. That's no shame.", next = "survive_guilt" },
        { text = "Lucky blow. You should thank the mud.", next = "survive_guilt" },
      },
    },
    survive_guilt = {
      lines = {
        { id = "sg_default", text = "Maybe, and some days I can believe it. But I was the watcher, you see, and the watcher's job is to see them coming, and I didn't." },
      },
      choices = {
        { text = "No one could have seen them in those reeds.", next = "BACK", reply = "Maybe not, and you're kind to say it. I'll keep telling myself so until I believe it.", fx = { align = { light = 1 }, affinity = 2, trait = { kind = 1 } } },
        { text = "Then learn from it, and watch better next time.", next = "BACK", reply = "I will, believe me, every night for the rest of my life. That's a lesson I'll not forget.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    reagents = {
      lines = {
        { id = "re_default", text = "Food and tools, mostly, but there's a chest of wizards' reagents that the mages at Nethergarde Keep were waiting on. I don't know what they do with them, but it has to do with the Dark Portal, and I'm told it matters to the whole Alliance." },
        { id = "re_found", when = { questDone = TODO_QUEST("The Lost Caravan") },
          text = "The reagents are safe now, thanks to you, packed with the rest of what I could save. I still don't know what the wizards do with them, only that it has something to do with that cursed Portal." },
      },
      choices = {
        { text = "What's at Nethergarde Keep?", next = "nethergarde" },
        { text = "Where did the reagents end up?", next = "chest", when = { questBefore = TODO_QUEST("Deliver the Shipment") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nethergarde = {
      lines = {
        { id = "ng_default", text = "A fortress in the hills of the Blasted Lands, built to watch the Dark Portal day and night. The mages there study it, and the soldiers keep the ogres off them while they do, and none of them can grow so much as a turnip in that red dirt, so everything comes by caravan." },
      },
      choices = {
        { text = "Someone has to watch the Portal. It's worth the cost.", next = "BACK", reply = "It is, and the lads knew it when they signed on. I'll get these crates there if it kills me.", fx = { align = { order = 1 }, learn = { "nethergarde" } } },
        { text = "A dead gate isn't worth all these dead caravans.", next = "BACK", reply = "Dead, maybe, but the things that come through it aren't. I'll not argue the point with the lads' graves around me.", fx = { align = { order = -1 }, learn = { "nethergarde" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "nethergarde" } } },
      },
    },
    chest = {
      lines = {
        { id = "ch_default", text = "Before my sight went black I saw them dragging one of our wagons north, to the Fallow Sanctuary, and the reagent chest was on it. If it's still there, it's somewhere among their huts and their fires." },
      },
      choices = {
        { text = "I'll get your chest back.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    wood = {
      lines = {
        { id = "wo_default", text = "I can, if I have the wood, but the trees here are soft as bread and twice as damp. Driftwood off the eastern shore is the answer, the kind the sun's dried out, because it's light and still tough enough for an axle." },
        { id = "wo_done", when = { questDone = TODO_QUEST("Driftwood") },
          text = "The driftwood you brought is holding, and the wagon's nearly whole. I've only to finish the axle and find something to pull it, which may take longer than I'd like." },
      },
      choices = {
        { text = "What will pull it? Your horses are gone.", next = "wood_horse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_horse = {
      lines = {
        { id = "wh_default", text = "I've been trying not to think about that. Perhaps the keep will send someone once your crates reach them, or perhaps I'll be pulling it myself, a step at a time, all the way to the Blasted Lands." },
      },
      choices = {
        { text = "You'll make it. You've come this far.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    lungertz = {
      lines = {
        { id = "lu_default", text = "He's the quartermaster at Nethergarde, and he counts everything twice, so don't let him tell you a crate is short. He'll have written me off by now, crates and all, and I'd like to see his face when you hand them over." },
      },
      choices = {
        { text = "I'll tell him you're alive, Watcher.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    stay = {
      lines = {
        { id = "st_default", text = "Because I swore to protect what the caravan carried, and the lads who died swore the same. If I walk away from it now, then they died guarding something I left in the mud, and I won't have that." },
      },
      choices = {
        { text = "An oath is an oath. You're right to keep it.", next = "BACK", reply = "Thank you. I'd begun to think I was the only one who still cared about the oath.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "A dead watcher keeps no oaths. Save yourself.", next = "BACK", reply = "Save myself and leave the crates to the reeds? No, I'll stay, and if I die, I die keeping my word.", fx = { align = { honor = -1 } } },
        { text = "Who were the lads?", next = "lads" },
      },
    },
    lads = {
      lines = {
        { id = "la_default", text = "Footmen from Darkshire and Stormwind, a teamster from Goldshire who sang the whole way, and a captain who'd done the run a dozen times. I've got their names written on the inside of my shield, so I won't forget any of them." },
      },
      choices = {
        { text = "Their families should hear it from you.", next = "BACK", reply = "They should, and I'll tell them myself when I get back to Darkshire. I owe them that much.", fx = { align = { order = 1 }, trait = { kind = 1 } } },
        { text = "Let them be remembered here, where they fell.", next = "BACK", reply = "Here, then, and I'll carve their names on a post by the road. It's little enough, but it's something.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    darkshire = {
      lines = {
        { id = "da_default", text = "Darkshire, in Duskwood, and if you think this swamp is grim, you haven't seen the woods there at dusk. The Night Watch saw us off at the edge of town and wished us luck, and I think they meant it more than usual." },
      },
      choices = {
        { text = "Where are you from yourself?", next = "home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = {
        { id = "ho_default", text = "Stormwind, the Old Town, though I haven't seen it in two years. And you, friend, where do you call home, when you're not wading through swamps for strangers?" },
      },
      choices = {
        { text = "Stormwind too. The Old Town's still standing.", next = "home_sw", when = { race = "Human" } },
        { text = "Ironforge. Warmer than this, and drier.", next = "home_if", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Darnassus, in the great tree.", next = "home_dn", when = { race = "NightElf" } },
        { text = "Wherever the road takes me.", next = "home_road" },
      },
    },
    home_sw = {
      lines = {
        { id = "hs_default", text = "Is it? Then the taverns are still pouring and somebody's still arguing about the walls, and that's all I need to know. I'll drink to it when I'm back, and I'll drink to you too." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    home_if = {
      lines = {
        { id = "hi_default", text = "Drier! I'd give a month's pay for dry boots, and another for a mug by one of your forges. If I sound jealous, it's because I am." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    home_dn = {
      lines = {
        { id = "hd_default", text = "A city in a tree. I'd heard of it, but I'd never met anyone who'd walked its branches. When I'm old and boring, I'll tell people a night elf saved my caravan, and nobody will believe me." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    home_road = {
      lines = {
        { id = "hr_default", text = "I used to envy folk like you, but after this trip I think I'll stay in one place for a while. Still, the road brought you here, so I'll not speak ill of it tonight." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    xlight = {
      big = true,
      lines = {
        { id = "xl_default", text = "I've asked myself what reason that could be every night since. Maybe it's only so someone gets the crates to the keep, and if that's all, I'll take it and be grateful." },
      },
      choices = {
        { text = "The Light chooses its servants. Trust that.", next = "BACK", reply = "I'll try. It's hard to trust when you're the only one left standing, but I'll try.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Reasons are what we make of our own luck.", next = "BACK", reply = "Our own luck, is it? Then I've made poor luck, and I'll have to make better. Thank you, I think.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was a footman from the Old Town, then a watcher on the caravan, and now I'm its last guard. That's the whole of it." } },
    advice = { { id = "tp_ad", text = "Keep away from the reeds near Fallow Sanctuary, and if you hear talking where nobody should be, run." } },
    _none = { { id = "tp_none", text = "I couldn't say, friend. I know the road from Darkshire and this patch of mud, and very little else." } },
  },
}

P:NPC {
  key = "magtoor", id = TODO_NPC("Magtoor"), name = "Magtoor",
  bible = "bibles/swamp_west.md", role = "questgiver", tier = "quest",
  communities = { "swamp_of_sorrows" }, temper = { "grave", "gentle" }, values = { "loyal", "wise" },
  notices = { "class", "race", "faction" },

  impression = {
    first = "Magtoor leads the few draenei at the Harborage who kept their minds when the rest of their kind went mad. He speaks slowly and kindly, and every word about the Lost Ones sounds like it costs him.",
    third = "{name} met Magtoor, leader of the sane draenei of the Harborage.",
  },

  greetings = {
    { id = "g_default", text = "Be welcome at the Harborage, stranger. There is little here, but what there is, we share with those who come in peace." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and I'm glad of it. Few who leave the Harborage ever return, and fewer still return unhurt." },
    { id = "g_crystals", when = { questDone = TODO_QUEST("Draenethyst Crystals") }, text = "{name}. The crystals sit with us again, and my people sleep more easily. Come, sit." },
    { id = "g_noboru", when = { questDone = TODO_QUEST("Noboru the Cudgel") }, text = "Here is the one who ended Noboru. My people speak your name by the fire, though they say it badly." },
  },

  notice = {
    { id = "n_horde", cat = "faction", when = { faction = "Horde" },
      text = "You wear the colors of the orcs. It was their gate that brought us here, long ago, but it was not you who opened it, and so I will not hold it against you." },
    { id = "n_alliance", cat = "faction", when = { faction = "Alliance" },
      text = "The humans' soldiers pass to the south, toward their keep, and most do not look this way. You looked, and few of them ever do." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You speak with the spirits of this world. I wonder sometimes whether they know what we are, or whether we are as strange to them as they are to us." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "There is a light about you, the kind my people once knew well. Some of us still remember it, on the good days." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_before", when = { questBefore = TODO_QUEST("Draenethyst Crystals") },
          text = "The Lost Ones of the Fallow Sanctuary have taken something sacred from us, our draenethyst crystals, and we are too few to take them back. Without them, I fear we too may lose our way." },
        { id = "h_active", when = { questActive = TODO_QUEST("Draenethyst Crystals") },
          text = "The crystals are kept among their huts and campfires in the Fallow Sanctuary, to the east. Six would be enough, and every one you bring is a night my people do not wake in fear." },
        { id = "h_default", key = true,
          text = "I am Magtoor, and these few are what remains of my people who still remember who they are. We came to this world from far away, and the journey broke most of us, and the broken ones live in the Fallow Sanctuary now." },
        { id = "h_after", when = { questDone = TODO_QUEST("Draenethyst Crystals") },
          text = "We have our crystals again, and that is a thing I did not think I would see. We are still few, and the swamp still presses on us, but we are not lost, and that is your doing." },
      },
      again = {
        { id = "h_again", text = "Ask what you wish. We have time, if little else." },
        { id = "h_again2", text = "There is more you would know? Speak." },
      },
      choices = {
        { text = "Who are the Lost Ones?", next = "lostones" },
        { text = "Why do the crystals matter so much?", next = "crystals" },
        { text = "How did your people come to this world?", next = "journey" },
        { text = "Tell me about the Harborage.", next = "harborage" },
        { text = "I found this cudgel on a Lost One.", next = "noboru", when = { questActive = TODO_QUEST("Noboru the Cudgel") } },
        { text = "What do you make of the orcs in Stonard?", next = "stonard", when = { faction = "Horde" } },
        { text = "I must go, Magtoor.", next = "END" },
      },
    },

    lostones = {
      lines = {
        { id = "lo_default", text = "They look as we look, but they are monsters now, driven mad by the long road that brought us here. Once they were our brothers and sisters, and now they catch or kill any who wander near the Sanctuary, and I cannot tell you which of those is worse." },
      },
      choices = {
        { text = "Can they be healed?", next = "lostones_heal" },
        { text = "Do you have to fight them?", next = "lostones_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lostones_heal = {
      lines = {
        { id = "lh_default", text = "I have hoped so, every day since we came, and I have seen nothing that would make me keep hoping. Still, I do not let my people speak of them as beasts, because if we forget they were ours, we are halfway to the Sanctuary ourselves." },
      },
      choices = {
        { text = "Then keep hoping. Your people need you whole.", next = "BACK", reply = "I will, for as long as I can. Thank you for understanding.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Mercy for them may cost your people their lives.", next = "BACK", reply = "It may, and I know it, and I carry that every day. But if I stop seeing them as people, I fear what we would become.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lostones_fight = {
      lines = {
        { id = "lf_default", text = "When they come for us, yes, and I have done it with my own hands, more than once. It is the worst thing I know, to look at a face you knew and strike it, and I would not wish it on you." },
      },
      choices = {
        { text = "You protect the living. That's what a leader does.", next = "BACK", reply = "It is, and I do it, though it breaks something in me each time. Thank you for saying it plainly.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Let strangers do it for you, then. We don't know their faces.", next = "BACK", reply = "Strangers would be kinder to us, perhaps, and crueller to them. I will think on it, friend.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    crystals = {
      lines = {
        { id = "cr_default", text = "The draenethyst came with us from our old home, and it is sacred to us, and it reminds us of what we were. I think that is why the broken ones took it, because some part of them still wants to remember, even if the rest of them has forgotten why." },
      },
      choices = {
        { text = "Where are they keeping them?", next = "crystals_where" },
        { text = "Some things are worth fighting for. I'll fetch them.", next = "BACK", reply = "Thank you, friend. They are only crystals to you, but to us they are memory, and memory is all we have.", fx = { align = { order = 1 }, affinity = 1, learn = { "draenethyst" } } },
        { text = "Crystals are only stones. Your people matter more.", next = "BACK", reply = "They do, and I would not trade one of them for a crystal. But the crystals hold something of who we were.", fx = { align = { order = -1 }, learn = { "draenethyst" } } },
      },
    },
    crystals_where = {
      lines = {
        { id = "cw_default", text = "Among their huts and campfires in the Fallow Sanctuary, east of here, where they gather when the day ends. We lack the strength to go in, so we watch from the reeds and count what we have lost." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "draenethyst" } } } },
    },

    journey = {
      lines = {
        { id = "jo_default", text = "By a road no one should walk, through the gate the orcs made, when our old home was already lost to us. The road was long and terrible, and it took something from each of us, and from most it took everything." },
      },
      choices = {
        { text = "What did it take from you?", next = "journey_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    journey_you = {
      lines = {
        { id = "jy_default", text = "Less than from the others, and that is all I will say of it. Some nights I wake and do not know where I am, and I have to touch the walls of my hut until I remember, and I tell no one but you." },
        { id = "jy_warm", when = { disposition = { min = 65 } },
          text = "Less than from the others, but not nothing. Some nights I wake and do not know my own name, and I have to say it aloud until it comes back, and I think one night it will not." },
      },
      choices = {
        { text = "I'll keep that between us, Magtoor.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    harborage = {
      lines = {
        { id = "ha_default", text = "A handful of huts on the high ground, where the water does not reach and the Lost Ones do not often come. Masat T'andr works hides here, better than any of us, and trades them to whoever comes by without a blade drawn." },
      },
      choices = {
        { text = "Who else comes by here?", next = "harborage_visitors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harborage_visitors = {
      lines = {
        { id = "hv_default", text = "Hunters, now and then, and soldiers lost on the road, and once a goblin who wanted to buy the crystals we no longer had. And you, which is the best of them, though I will not tell the goblin." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    noboru = {
      lines = {
        { id = "nb_default", text = "You have gained the weapon of the dreaded Noboru? Then he is dead, and this is a day of joy for the Harborage. He and his gang wandered the swamp and killed any of us who crossed his path, and we had not the strength to face him." },
      },
      choices = {
        { text = "He was a monster. He had it coming.", next = "noboru_after", fx = { align = { light = -1 } } },
        { text = "I'm sorry it had to end that way for him.", next = "noboru_after", fx = { align = { light = 1 } } },
        { text = "He's dead. The cudgel is yours.", next = "noboru_after" },
      },
    },
    noboru_after = {
      lines = {
        { id = "na_default", text = "I knew him, before, and he was a smith who sang while he worked. I will remember that, now that the other Noboru is gone, and I am fortunate to have a friend in you, {name}." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },

    stonard = {
      lines = {
        { id = "so_default", text = "They are loud, and they are strong, and they have not tried to drive us out, which is more than the swamp itself can say. I do not forget whose gate it was, but I have also seen what forgetting nothing does to a mind." },
      },
      choices = {
        { text = "The Horde is not the Horde of the old war.", next = "BACK", reply = "It is not, and I see that every day, and I am grateful. But I remember all the same.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Some debts should never be forgotten.", next = "BACK", reply = "They should not, and I do not. But I keep my memories quiet, and the Horde keeps its peace.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I led a few of my people out of the dark, and I lead them still, because nobody else would." } },
    advice = { { id = "tp_ad", text = "If a Lost One calls to you by name from the reeds, do not answer. They learn names, and they use them." } },
    _none = { { id = "tp_none", text = "I do not know this thing. My world was another world, and I am still learning yours." } },
  },
}

P:NPC {
  key = "masat", id = TODO_NPC("Masat T'andr"), name = "Masat T'andr",
  bible = "bibles/swamp_west.md", role = "vendor", tier = "service",
  communities = { "swamp_of_sorrows" }, temper = { "quiet", "precise" }, values = { "craft", "practical" },
  notices = { "craft", "class" },

  impression = {
    first = "Masat T'andr works hides at the Harborage, slow and exact, and his patterns are better than anything I've seen in a city shop. He says his hands remember the craft on the days his head does not.",
    third = "{name} met Masat T'andr, the draenei leatherworker of the Harborage.",
  },

  greetings = {
    { id = "g_default", text = "I have hides, patterns and fine work here. Look as long as you like, but do not touch the drying racks, please." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, because I have finished something since you were last here, and I would like someone to see it." },
    { id = "g_lw", when = { profession = { name = "Leatherworking", min = 200 } }, text = "Ah, you have the hands of a worker, scarred in the right places. Come, I will show you the good patterns, not the ones I sell to tourists." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = { name = "Leatherworking" } },
      text = "Your armor is your own stitching, I think. The seams are honest, though the third from the left is pulling; you can fix it with a waxed thread." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Bring me green scales from the whelps near the temple and I will think well of you, though I cannot pay more for them than they are worth." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You smell of growing things, not of the swamp's rot. It is pleasant, and unusual in this place." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Masat T'andr. I work leather, and I sell patterns to those who can follow them. The swamp gives good hides, if you can bear the smell of curing them, and the dragonkin near the temple give better ones." },
        { id = "h_lw", when = { profession = { name = "Leatherworking", min = 200 } },
          text = "A leatherworker who has walked this far deserves the good patterns. Green dragonscale is my best, for those whose hands are ready for it, and I think yours nearly are." },
      },
      again = {
        { id = "h_again", text = "Anything more? The hides do not cure themselves." },
        { id = "h_again2", text = "Ask. I can talk and stitch at once." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Where do the green scales come from?", next = "scales" },
        { text = "Where did you learn the craft?", next = "learned" },
        { text = "How do you trade, out here?", next = "trade" },
        { text = "Not today.", next = "END" },
      },
    },

    scales = {
      lines = {
        { id = "sc_default", text = "From the green dragonkin that circle the sunken temple, the whelps and the bigger ones that guard it. They are fierce, and they are not ordinary beasts, and I think twice every time I buy a scale from a hunter who took it." },
      },
      choices = {
        { text = "Why think twice?", next = "scales_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scales_why = {
      lines = {
        { id = "sw_default", text = "Because they guard that place on purpose, I think, and whoever set them to guard it may not like seeing their whelps turned into breastplates. I sell the patterns anyway, because my people must eat, but I do not sleep easier for it." },
      },
      choices = {
        { text = "Then take only from the dead. Respect the guardians.", next = "BACK", reply = "From the dead, yes, that is my way also. The guardians will thank you, I think, in their fashion.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A scale's a scale. The strong take what they need.", next = "BACK", reply = "The strong take, yes, and the guardians are strong too. Be careful whose scales you take.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    learned = {
      lines = {
        { id = "le_default", text = "In the old home, long ago, from a teacher whose name I have lost. That is the strange part, that I forget names and faces and still remember how to cut a pattern, as if the knowing lives in my fingers and not in my head." },
      },
      choices = {
        { text = "Then your craft is a kind of memory.", next = "learned_memory" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learned_memory = {
      lines = {
        { id = "lm_default", text = "Yes, I think so, and it is why I work every day, even when there is no one to sell to. If I stopped, I am afraid of what else I might forget, so I keep stitching." },
      },
      choices = {
        { text = "Work keeps a mind whole. Keep at it.", next = "BACK", reply = "I will, and I thank you. Work and memory, they go together for me now.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Rest sometimes. A mind needs that too.", next = "BACK", reply = "Rest? I am afraid of it, a little. But you are kind to say so, and I will try.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    trade = {
      lines = {
        { id = "tr_default", text = "With whoever comes without a blade drawn: orcs, humans, a goblin now and then who argues for an hour over a copper. Magtoor says we cannot choose our neighbors here, only how we treat them, and I agree with him, most days." },
      },
      choices = {
        { text = "Who argues hardest?", next = "trade_goblin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_goblin = {
      lines = {
        { id = "tg_default", text = "The goblin, always, and then he buys the hide anyway and tells me I have robbed him. I think he enjoys it, and I confess I have begun to enjoy it too." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I cut leather. I remember how, and that is most of what I remember." } },
    advice = { { id = "tp_ad", text = "Cure your hides above the waterline, or the swamp will rot them before you can sell them." } },
    _none = { { id = "tp_none", text = "I could not say. Ask Magtoor; he keeps the things I forget." } },
  },
}
