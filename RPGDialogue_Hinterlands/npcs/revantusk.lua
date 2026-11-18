-- Revantusk Village (Horde, forest trolls of the Revantusk tribe). Voice: bibles/revantusk.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "torntusk", id = TODO_NPC("Primal Torntusk"), name = "Primal Torntusk",
  bible = "bibles/revantusk.md", role = "noble", tier = "major",
  communities = { "revantusk" }, temper = { "fierce" }, values = { "loyal", "protective", "proud" },
  notices = { "race", "class" },

  impression = {
    first = "Primal Torntusk leads the Revantusk while her mate sits in a Vilebranch cage at Jintha'Alor. She speaks of the Horde like a debt her tribe has paid twice over, and she isn't wrong.",
    third = "{name} met Primal Torntusk, who leads the Revantusk trolls of the Hinterlands coast and wants her mate back from the Vilebranch.",
  },

  greetings = {
    { id = "g_village", text = "You be standin' in Revantusk, stranger, the last forest trolls who still keep faith with the Horde. Speak plain, for I got little time for pretty words." },
    { id = "g_back", when = { metBefore = true }, text = "You come back to the coast, good. Revantusk remembers who walks in and who walks out again." },
    { id = "g_away", when = { away = { min = 14, max = 59 } }, text = "You been gone {away}, stranger, and Revantusk watched the trail for you. Good to see you walk in on your own feet." },
    { id = "g_away_long", when = { away = 60 }, text = "After {away} away I thought the Vilebranch or the dwarves had you. Revantusk remembers who comes back, and you came back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You stand stronger than when we last talk, and my people see it. Good, because the Vilebranch don't get any weaker." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "My people say one of them caught you in a lie. Revantusk kept faith with the Horde when nobody else did, so we don't take kindly to a forked tongue." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The village be talkin' about what you did for us. That be good talk, and Revantusk don't forget it." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear, from Thrall's islands, and you got the look of a long voyage. Jungle or forest, a troll who keeps faith with the Horde be welcome in Revantusk." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, walkin' free in the Hinterlands. Last time I saw so many of you, the humans was puttin' you in cages, and none of us could stop them." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "The spirits walk close behind you, shaman. They be welcome here, so long as they keep their eyes on Jintha'Alor." },
  },

  start = "hello",
  nodes = {
    opn_wildhammer = {
      lines = {
        { id = "opn_wildhammer_q", text = "Otho Moji'ko, who sells to our cooks, says we bleed them until they leave us be, and Huntsman Markhor says we hunt the Vilebranch and let the dwarves come to us. My mate sits in a Vilebranch cage, mon, and I be tired of choosin' which enemy to hate first. Tell me what you would do in my place." },
      },
      choices = {
        { text = "Strike Aerie Peak, Primal. They've hunted you from the sky long enough.", next = "opn_wildhammer_r_war", fx = { affinity = 1, align = { honor = -1 }, opinion = { wildhammer = "war" } } },
        { text = "Free your mate first. The Vilebranch matter more than any grudge.", next = "opn_wildhammer_r_wait", fx = { affinity = 1, align = { honor = 1 }, opinion = { wildhammer = "wait" } } },
        { text = "Talk to the dwarves. Show them you aren't Vilebranch.", next = "opn_wildhammer_r_parley", fx = { affinity = -1, trait = { kind = 1 }, opinion = { wildhammer = "parley" } } },
        { text = "The Darkspear have dwarf enemies too. Stand with the Horde first.", next = "opn_wildhammer_r_war", when = { race = "Troll" }, fx = { opinion = { wildhammer = "war", darkspear = "kin" } } },
        { text = "That's your choice, Primal.", next = "BACK" },
      },
    },
    opn_wildhammer_r = {
      lines = {
        { id = "opn_wildhammer_r_default", text = "It is, and it sits on me heavy. Go, and come back with Vilebranch blood on you." },
      },
      choices = {
        { text = "Something else, Primal.", next = "BACK" },
      },
    },
    opn_wildhammer_r_war = {
      lines = {
        { id = "opn_wildhammer_r_war", text = "Otho will love you for that, and Otho loves nobody. One day, mon, one day, but not while Hexx still breathes." },
      },
      choices = {
        { text = "Something else, Primal.", next = "BACK" },
      },
    },
    opn_wildhammer_r_wait = {
      lines = {
        { id = "opn_wildhammer_r_wait", text = "My mate first. Yes, that be what Malkhor would say, and he was always right about the order of things." },
      },
      choices = {
        { text = "Something else, Primal.", next = "BACK" },
      },
    },
    opn_wildhammer_r_parley = {
      lines = {
        { id = "opn_wildhammer_r_parley", text = "Talk? With dwarves who kill my hunters from gryphons and don't ask their tribe first? You be a strange one. Maybe a brave one too, but mostly strange." },
      },
      choices = {
        { text = "Something else, Primal.", next = "BACK" },
      },
    },
    xpt_troll = {
      big = true,
      lines = { { id = "xpt_troll_default", text = "The Darkspear be jungle trolls and we be forest trolls, so we argue about everything from the loa to the proper way to cook a raptor. But they kept faith with Thrall and so do we, and that makes us closer kin than the Vilebranch who share our blood." } },
      choices = {
        { text = "Oaths matter more than blood. The Horde comes first.", next = "BACK", reply = "Dat be de Revantusk way too, mon, and it cost us plenty. Good to hear it from a Darkspear mouth.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Trolls should look after trolls before they look after orcs.", next = "BACK", reply = "Many of my people say de same, and I hit dem for it. De orcs stood with us when nobody else would.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_zg = {
      big = true,
      lines = { { id = "xcl_zg_default", text = "Then you done a thing the old empires never could. Hakkar ate the Gurubashi from the inside once already, and they had to drive his priests out to save themselves, and if the Vilebranch had ever got his blood in their bowls, they'd have come down on Revantusk with a god at their backs, so I be owin' you twice now." } },
      choices = {
        { text = "The Zandalari called for help, and honour said to answer.", next = "BACK", reply = "Ya, honour, and de Zandalari will remember it. You make dis old Primal proud, mon.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Honour had nothing to do with it. I went for the city's treasures.", next = "BACK", reply = "Ha! At least you be honest about it, mon. De loa don't care why, so long as Hakkar stay dead.", fx = { align = { honor = -1 } } },
        { text = "Do the Revantusk owe the Gurubashi anything?", next = "xcl_zg2" },
      },
    },
    xcl_zg2 = {
      lines = { { id = "xcl_zg2_default", text = "Owe them? No, for they be jungle trolls and we be forest trolls, and they sold their own to a blood god long before my grandmothers were born. But a troll who forgets where trolls come from be half a troll, and the Zandalari remember for all of us, so I don't spit when I say Gurubashi." } },
      choices = {
        { text = "Then I'll speak of them carefully too.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The Revantusk accept anyone who hate the Vilebranch as much as we do, and you be welcome to carry your Light up to Jintha'Alor and burn them wit' it. My people will stare, because we remember what the Light did to the Amani, but the Horde be the Horde, and I keep my word." } },
      choices = {
        { text = "I'll fight beside the Revantusk. You have my word.", next = "BACK", reply = "Your word be good enough for Torntusk, paladin. Climb Jintha'Alor with us, and we see what de Light can do.", fx = { align = { honor = 1 } } },
        { text = "I'm here for the Horde's ends, not your tribe's.", next = "BACK", reply = "De Horde's ends and mine walk de same road up dat hill, mon. I take your blade either way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Both, mon, but rescue first, 'cause if I lose him, there be no punishin' enough in the world. The Vilebranch serve somethin' dark up there, and I want to burn their altars once he be safe." } },
      choices = {
        { text = "Rescue him, then burn their altars. They've earned it.", next = "BACK", reply = "Ya, burn dem all, after he be safe. Dere be a pole on dat hill for every Revantusk dey took, and Torntusk want to see every one of dem burn.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Rescue him, but leave the burning. More blood helps no one.", next = "BACK", reply = "Maybe it don't help, but it feel good. Still, rescue first, ya, and I think on de rest.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Owls for feathers, wolves for hides, and Vilebranch for the blood they owe us. My mate be in a cage at Jintha'Alor, and every trail I follow lead back up those stairs." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Owls for feathers, wolves for hides, and Vilebranch for the blood they owe us. {pet} got the eyes of a Hinterlands beast, mon, and I would trust it to find a trail up those stairs that I couldn't." },
      },
      choices = {
        { text = "Your mate comes first. I'll find the way to him.", next = "BACK", reply = "Den you be a friend to dis tribe forever, mon. Go, and bring him home.", fx = { align = { honor = 1 } } },
        { text = "The tribe comes before one prisoner, Primal.", next = "BACK", reply = "De tribe say de same, and I tell dem dey be wrong. My mate be de tribe, as far as I care.", fx = { align = { honor = -1 } } },
        { text = "Something else, Primal.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Keep my warriors on their feet when they climb Jintha'Alor, and keep their heads clear when Hexx starts her chantin', for her magic gets in the mind before it gets in the blood. A healer who stands fast on that hill be worth more to me than ten spears." } },
      choices = {
        { text = "I'll stand fast on the hill. Your warriors will rise.", next = "BACK", reply = "Good, mon, and Hexx won't like it one bit. My warriors thank you already.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll heal who I can, but I won't die for your mate.", next = "BACK", reply = "Fair, and honest, mon. Heal who you can, and Torntusk will do de dyin'.", fx = { align = { honor = -1 } } },
        { text = "Something else, Primal.", next = "BACK" },
      },
    },
    xorig_revan = {
      lines = { { id = "xrv_default", text = "I remember sending you, mon, and I remember you grumbling all the way out of the village. So tell me true, now that you've walked their cities, be the orcs worth the faith we keep with them?" } },
      choices = {
        { text = "They keep their word, Primal, which the Amani never did.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'm still deciding, Primal.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_troll", tags = { "news" }, when = { party = { race = "Troll" }, faction = "Horde" },
          text = "You travel with {companion}, a Darkspear by the tusks, and the Revantusk are glad of it, mon. There be few enough trolls in this Horde who remember what it means to keep faith with the orcs." },
        { id = "h_default", key = true,
          text = "I be Primal Torntusk, and I lead the Revantusk while my mate sits in a Vilebranch cage. They came at midnight, they took him up to Jintha'Alor, and every night since I been countin' how many of them owe me blood, startin' with my guard captain Malkhor, who they cut down where he stood." },
        { id = "h_kidnap", tags = { "news" }, when = { questActive = TODO_QUEST("Kidnapped Elder Torntusk!") },
          text = "My spies say he still breathes, up on the top of Jintha'Alor, and the Vile Priestess Hexx be readyin' him for her altar. Go quick, before she finishes her preparations." },
        { id = "h_hills_resolved", tags = { "news" }, when = { faction = "Horde", thread = { id = "hinterlands_trolls", state = "resolved" } },
          text = "The Vilebranch keep their heads down on that hill since Hexx fell, mon, and my scouts can walk the river without lookin' over their shoulders. It won't last, but Revantusk will enjoy it while it does." },
        { id = "h_hexx", when = { questActive = TODO_QUEST("Wanted: Vile Priestess Hexx and Her Minions") },
          text = "You read the notice I posted, then. Hexx and her Aman'zasi guards sit at the summit as if the hill belongs to them, so show them it don't." },
        { id = "h_job", when = { questActive = TODO_QUEST("Job Opening: Guard Captain of Revantusk Village") },
          text = "You want Malkhor's post? Then kill the Vilebranch that killed him, the berserkers and shadow hunters and blood drinkers and soul eaters, and come tell me how many." },
        { id = "h_home", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Return to Primal Torntusk"), days = 3 } },
          text = "My mate walked in last night, thin as a reed and sore in every joint, and the first thing he asked was who brought him home. I told him your name, and Revantusk will not forget it." },
        { id = "h_later", when = { questDone = TODO_QUEST("Return to Primal Torntusk") },
          text = "My mate sleeps in his own hut again, though he wakes at every drum, and I be Primal Torntusk still. The Vilebranch learned what Revantusk does when it be wronged." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "It be near midnight again. That be the hour they came for him, so the watchers stand double on the walls now, and I stand with them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "There be a dark thing hangin' off your shoulder, {class}, and the Vilebranch got plenty of those already. What you call it, and what it eat?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "Fire and frost at your fingertips, {class}, I can smell it. The Amani learned to fear the arcane when the elves and the men of Arathor turned it on them, and some trolls never forgave it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You move like a Revantusk scout, {class}, low and quiet and lookin' at the exits. Good, because Jintha'Alor be full of eyes, and the Vilebranch never see the quiet ones comin'." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The Revantusk be a hunting people, mon, and we know a good tracker by how they walk, so walk with us, and the forest be kinder to you." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid. My mate be caged at Jintha'Alor while you walk free, and I be wantin' to know if your claws be as sharp as they say." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The Vilebranch have priests too, {class}, with blood on their hands up to the elbow, so you show me you be the other kind, and I be glad to have you." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Vilebranch", min = 40 } }, text = "The drums at Jintha'Alor beat slower these nights, and I know why. Every Vilebranch you put down be a debt paid, and Revantusk be keepin' count with you." },
        { id = "h_cl_zg", tags = { "news" }, when = { cleared = "Zul'Gurub", faction = "Horde" },
          text = "The Gurubashi lost their Soulflayer, and the word come up the coast on every boat with your name tied to it. Revantusk got no love for the jungle trolls, but even I be knowin' what it cost to walk into that city." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one wit' the Light, comin' to Revantusk. The Amani fought the humans and the elves and their holy men for longer than anyone remember, and now a Light-bearer stand in my village and call me ally, so the world be very strange these days." },
      },
      again = {
        { id = "h_again", text = "What else do you need, then? Say it quick." },
        { id = "h_again2", text = "Go on. The tide be comin' in, but I can listen." },
        { id = "h_again3", when = { questDone = TODO_QUEST("Return to Primal Torntusk") }, text = "Ask what you want, friend of Revantusk." },
      },
      choices = {
        { text = "The Revantusk need more warriors, Primal. I can fight.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Tell me about the raid.", next = "raid" },
        { text = "Why do the other trolls hate you?", next = "tribes" },
        { text = "How did the Revantusk come to the Horde?", next = "horde" },
        { text = "The Wildhammer must trouble you too.", next = "wildhammer" },
        { text = "The name Malkhor seems to weigh on you.", next = "malkhor" },
        { text = "Your mate is home. I saw to it.", next = "after", when = { questDone = TODO_QUEST("Return to Primal Torntusk") } },
        { text = "My people were in those camps too.", next = "orc", when = { race = "Orc" } },
        { text = "The Darkspear stand with you, Primal.", next = "troll", when = { race = "Troll" } },
        { text = "I serve the Dark Lady. What use am I here?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Do you fear a warlock's magic, Primal?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "The Revantusk seem to hold a grudge against magic.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Someone quiet could slip into Jintha'Alor unseen.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The Revantusk must hunt well in these hills, Primal.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Should we rescue your mate, or punish the Vilebranch first?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "How do I show you I'm the other kind, Primal?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Will the Revantusk accept a Forsaken paladin as an ally, Primal?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I stood in Zul'Gurub when Hakkar fell, Primal.", next = "xcl_zg", when = { cleared = "Zul'Gurub", faction = "Horde" } },
        { text = "My companion's a Darkspear. What do the Revantusk make of them?", next = "xpt_troll", when = { party = { race = "Troll" }, faction = "Horde" } },
        { text = "You sent me to judge the Horde, Primal. I've come back.", next = "xorig_revan", when = { origin = "troll_revantusk_envoy" } },
        { text = "I'll go up to Jintha'Alor.", next = "END", fx = { affinity = 2, standing = { revantusk = 1 } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Many tried, and the Vilebranch put their heads on poles along the stairs. But one who walk soft and don't stop to fight get further than any war party, and the Revantusk remember a name like that a long time." } },
      choices = {
        { text = "A quiet blade gets further than a war party.", next = "BACK", reply = "Ya, it do, and dat be de only way up dem stairs, mon. Walk soft and come back.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather face the Vilebranch head-on, Primal.", next = "BACK", reply = "Head-on, mon? Den you'll be on a pole next to de others. But I won't stop you.", fx = { align = { honor = 1 } } },
        { text = "Something else, Primal.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some of the old ones do, and they spit when a mage walk by. But the Revantusk stand with the Horde now, and the Horde take whoever fight, so Torntusk say a fireball be a fireball, so long as it land on a Vilebranch." } },
      choices = {
        { text = "Old grudges should stay buried. The Vilebranch are the enemy.", next = "BACK", reply = "Dey should, but old troll grudges sleep with one eye open. I keep dem off you, mon.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The old ones are right. Never forget a wound.", next = "BACK", reply = "Ha, de old ones will love you, mon. But de Vilebranch come first, ya?", fx = { align = { light = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Torntusk fear nothin' but losin' her mate. The Vilebranch priests bargain with dark things on Jintha'Alor every night, so if you got your own dark thing that bite them back, maybe that be a fair trade." } },
      choices = {
        { text = "I use it carefully. Dark things want more than they give.", next = "BACK", reply = "Good, mon. Every troll who ever climb Jintha'Alor to bargain with de dark thought he be careful too, and dere heads be on de poles now.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Darkness against darkness is the only way to win this.", next = "BACK", reply = "Maybe it be, mon, and maybe dat be how de Vilebranch started. Watch yourself.", fx = { align = { light = -1 } } },
        { text = "Let's speak of other things.", next = "BACK" },
      },
    },
    raid = {
      big = true,
      lines = {
        { id = "ra_default", text = "They came up from the south in the dark, quiet as fog, and they knew where every hut stood. Malkhor met them at the gate with a spear, and they cut him down there, and they took my mate up the hill." },
      },
      choices = {
        { text = "How did they know the village so well?", next = "raid_spies" },
        { text = "Then I'll bring him back, whatever it costs.", next = "raid_vow", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Pay the Vilebranch back first. Rescue can wait.", next = "raid_vow", fx = { align = { honor = -1 } } },
      },
    },
    raid_spies = {
      lines = { { id = "rs_default", text = "Because they watched us for many moons, the same way my spies be watchin' them now. Trolls been doin' this to each other since before your grandfather's grandfather was born." } },
      choices = {
        { text = "What do your spies say?", next = "raid_hexx" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raid_vow = {
      lines = { { id = "rv_default", text = "Big words, and I heard many of them since the raid. Bring me back somethin' I can hold in my hands, and then we talk about what you be worth." } },
      choices = {
        { text = "Where is he held?", next = "raid_hexx" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raid_hexx = {
      lines = {
        { id = "rh_default", text = "At the summit of Jintha'Alor, where the Vile Priestess Hexx keeps her altar and her Aman'zasi guard. She wants to spill him slow, so the gods can watch, and that slowness be the only gift she ever gave me." },
        { id = "rh_done", when = { questDone = TODO_QUEST("Wanted: Vile Priestess Hexx and Her Minions") },
          text = "Hexx be dead now, and her altar cold, but the Vilebranch still crawl over that hill like ants on a carcass. They will choose a new priestess soon enough." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Farewell, Primal.", next = "END" },
      },
    },
    tribes = {
      big = true,
      lines = { { id = "tb_default", text = "Because we kept faith. When the old Horde broke, the Witherbark and Vilebranch ran home and spat on the orcs, but we could not forget who we fought beside. So now they call us weaklings, and we call them traitors, and only one of us be right." } },
      choices = {
        { text = "Couldn't you have freed the orcs?", next = "tribes_camps" },
        { text = "I'd take ten loyal Revantusk over a hundred Vilebranch.", next = "BACK", reply = "Ya, and ten loyal be all we got, mon. Ten be enough to hold dis beach, most days, and de Vilebranch know it.", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "Loyalty left you small and hunted. That's a poor bargain.", next = "BACK", reply = "Small and hunted, ya, but proud, mon. Torntusk sleep fine on dis sand, and Zul'jin's old friends up de hill can't say de same.", fx = { align = { honor = -1 }, affinity = -1 } },
      },
    },
    tribes_camps = {
      lines = { { id = "tc_default", text = "We was too few, and the orcs in the camps was too tired to want freedom. I will not pretend that sits easy with me, so I don't ask anyone to pretend it for me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    horde = {
      lines = { { id = "hd_default", text = "We fled to this coast and hid, until word came that a young warchief named Thrall built a new Horde across the sea. I sent my fastest runners, and he took our hands in friendship and in help, and we been Horde ever since." } },
      choices = {
        { text = "I hope the Horde has kept its word.", next = "horde_word" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde_word = {
      lines = { { id = "hw_default", text = "It sends us you, and the wind riders, and Gorkas, the wind rider master, who fishes more than he flies. It be a small help for a small tribe, but it be more than the Witherbark ever gave anyone." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wildhammer = {
      big = true,
      lines = { { id = "wh_default", text = "The dwarves at Aerie Peak hate all trolls the same, Revantusk or Vilebranch, and their gryphons kill our hunters in the hills. Otho the spice seller wants to send them messages in blood, and Markhor wants their birds dead. I want my mate back first, and then we see." } },
      choices = {
        { text = "What should the Revantusk do about the dwarves?", next = "opn_wildhammer" },
        { text = "The Wildhammer fight the Vilebranch too. Use that.", next = "BACK", reply = "Ya, dat be sense, mon, though de dwarves would hate to hear it. Let dem do half our work.", fx = { align = { order = 1 } } },
        { text = "Enemies of the Horde are enemies. Strike them now.", next = "BACK", reply = "Strike de dwarves now, and de Vilebranch laugh at us both. Dey wait, mon.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    malkhor = {
      lines = { { id = "mk_default", text = "My guard captain, and Huntsman Markhor's twin. The Vilebranch did not want him for any altar, so they killed him where he stood and fed him to their beasts, and his post be empty now." } },
      choices = {
        { text = "Who will take his post?", next = "malkhor_job" },
        { text = "Something else.", next = "BACK" },
      },
    },
    malkhor_job = {
      lines = {
        { id = "mj_default", text = "Whoever proves it on the Vilebranch, troll or orc or anything else that bleeds for us. I posted the notice myself, and so far nobody brought me enough heads to be worth the title." },
        { id = "mj_done", when = { questDone = TODO_QUEST("Job Opening: Guard Captain of Revantusk Village") },
          text = "You brought me the heads, so the post be yours in my heart, even if you never stand at our gate. The watchers already call you captain when you not listenin'." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      big = true,
      lines = { { id = "af_default", text = "You did, and I been tryin' to find the right way to repay it since. A tribe this small don't have much gold, so take this: anywhere you hear the name Revantusk, you be family." } },
      choices = {
        { text = "Your thanks is payment enough, Primal.", next = "BACK", reply = "You got a good heart, mon. De Revantusk don't forget.", fx = { affinity = 3, align = { honor = 1 }, standing = { revantusk = 2 } } },
        { text = "Family's fine, but gold spends better.", next = "BACK", reply = "Ha! Honest, at least. We got little gold, but we got plenty of family, and you be in it whether you like it or not.", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    orc = {
      lines = { { id = "oc_default", text = "Then you know the shame I carry, that we ran and left you behind the walls. Thrall forgave it when he made the pact; I hope you can forgive it too, in time." } },
      choices = {
        { text = "There's nothing to forgive.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Help me pay the humans back, and we're even.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    troll = {
      lines = { { id = "tr_default", text = "The Darkspear be few too, and hated by their cousins, so we understand each other. When you see Vol'jin, tell him the Revantusk still stand on the coast." } },
      choices = {
        { text = "I'll tell him.", next = "BACK", fx = { affinity = 2, standing = { revantusk = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "We need warriors who know who they fight for, mon. The Witherbark shame our people and the dwarves of Aerie Peak harry our shores, so a warrior standing with Revantusk must fight for the tribe." } },
      choices = {
        { text = "Then I'll fight for the Revantusk.", next = "BACK", reply = "Den you be one of us, mon, and de Revantusk be glad.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight for the Horde. The tribe's your business.", next = "BACK", reply = "De tribe be part of de Horde, mon, so you fight for both whether you like it or not.", fx = { align = { order = -1 } } },
      },
    },
    forsaken = {
      lines = { { id = "fs_default", text = "Plenty of use. The Vilebranch fear the dead almost as much as they fear their own priests, and you don't need sleep to stand a watch at midnight." } },
      choices = {
        { text = "Then I'll stand your watch.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the Hinterlands and every tribe in them. Ask, and I tell you what serves Revantusk." } },
    background = { { id = "tp_bg", text = "Revantusk born, Revantusk chief, and Horde since the runners came home with Thrall's word.", next = "horde" } },
    advice = { { id = "tp_ad", text = "Never sleep in the open near Jintha'Alor, mon. The Vilebranch like their meat fresh, and they don't wait for you to wake up." } },
    vilebranch = { { id = "tp_vile", text = "Cannibals and traitors who drink what they should bury. Ask Mystic Yayo'jin, if you want the long tellin'.", next = "tribes" } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear and the Revantusk are cousins, and Vol'jin's people stood with Thrall before we did. We paid for our place in the Horde with blood, twice over, and we'd pay again." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin is a true leader, and he knows what it is to lose everything and build again. He sent word to me when my mate was taken, and I'll not forget it." } },
    thrall = { { id = "tp_thrall", text = "The Warchief of the Horde welcomed my tribe when no one else would, and we fight for him now. My mate sits in a Vilebranch cage, and I'll see him freed in the Horde's name." }, { id = "tp_thrall2", when = { faction = "Alliance" }, text = "You fly with the Wildhammer and ask me about my warchief? He gave my people a home and a cause, and that is more than your kings have ever given anyone." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer are our enemies, and they've been our enemies since before your grandfather was born. They kill our people, and we kill theirs, and that is the way of the Hinterlands." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The Gurubashi have woken Hakkar in their old city, and his priests' blood magic has reached even the Vilebranch. The Zandalar are gathering heroes to stop it, and I hope they're quick." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "The Atal'ai worship the blood god in their sunken temple in the south, and the Vilebranch have learned their ways. I'll burn every one of their altars, if I live long enough." } },
    _none = { { id = "tp_none", text = "That don't feed the village or free my mate. Ask me somethin' else." } },
  },
}

P:NPC {
  key = "markhor", id = TODO_NPC("Huntsman Markhor"), name = "Huntsman Markhor",
  bible = "bibles/revantusk.md", role = "stablemaster", tier = "quest",
  communities = { "revantusk" }, temper = { "grave" }, values = { "loyal", "devoted" },
  notices = { "class", "race" },

  impression = {
    first = "Huntsman Markhor keeps the stables at Revantusk and judges the wilds as harshly as any judge of men. His twin brother died in the Vilebranch raid, and grief has made him patient, not soft.",
    third = "{name} met Huntsman Markhor, the Revantusk stable master who mourns his twin brother Malkhor.",
  },

  greetings = {
    { id = "g_default", text = "Step easy near the stables, stranger. The beasts be skittish since the raid, and so be I." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good, because the wilds don't thin themselves, and Markhor only got two hands." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and your beast walks well beside you. You can stable it here while you go after the Silvermane, if you want." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You smell of the arcane, mon, like hot copper and spoiled milk. Keep it away from my stables; the beasts hate it nearly as much as I do." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "No, mon, because a hunter learn the land and wait, and a paladin walk in shinin' so everything see you comin'. My brother would have laughed at you, and then he would have asked you to bless his spear, because he never turned down help from anyone." } },
      choices = {
        { text = "I walk in openly. Let my enemies see me coming.", next = "BACK", reply = "Den everything see you, and most of it run, mon. Good luck catchin' it.", fx = { align = { honor = 1 } } },
        { text = "I can hunt quietly too, when it serves.", next = "BACK", reply = "Ya, den you be a hunter after all, mon. Markhor show you where to stand.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only what you need, and you thank the beast after, 'cause the loa be watchin'. The Wildhammer hunt for sport sometimes, and the forest remembers it, even if they don't." } },
      choices = {
        { text = "A hunter takes only what he needs. That's the law.", next = "BACK", reply = "Ya, dat be de law, mon, and de loa keep it. You learn fast.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The forest is generous. Take whatever the hunt gives.", next = "BACK", reply = "Generous, ya, until it ain't, mon. Markhor see de Wildhammer clear a whole valley of stags one summer, and de wolves come down to our beach hungry dat winter.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Some do, if they willin' to learn, and most don't, because they think a big axe make up for a loud foot. My brother was a warrior, and he learned, but the Vilebranch came anyway, and the axe didn't save him." } },
      choices = {
        { text = "I'll learn the forest's ways. Pride won't keep me alive.", next = "BACK", reply = "Den you live longer dan most, mon. Come, I show you how to walk.", fx = { align = { order = 1 } } },
        { text = "Let them hear me coming. I'd rather they knew.", next = "BACK", reply = "Dey'll know, mon, and dey'll be gone. Den you eat nothin'.", fx = { align = { order = -1 } } },
        { text = "Something else, Markhor.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = {
        { id = "xhcast_mage", when = { class = "MAGE" }, text = "You ask me that, smellin' the way you do? Your magic sours my beasts, mon, but even yours be cleaner than what the Vilebranch witch doctors work up at Jintha'Alor, and the wolves near there gone wild from it." },
        { id = "xhcast_default", text = "The Vilebranch witch doctors' magic, worst of all, because it smell of blood and old gods, and the wolves near Jintha'Alor gone wild from it. The arcane I hate for my own reasons, but that Vilebranch filth be worse, and I don't say that lightly." },
      },
      choices = {
        { text = "I'll strike at Jintha'Alor when the Primal gives the word.", next = "BACK", reply = "Good, mon. De elders like to be asked, and dey know de hill.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I need nobody's leave to kill Vilebranch.", next = "BACK", reply = "Den go, mon, and don't come cryin' when de Vilebranch take your head. Markhor warned you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The spirits favor whoever respect them, mon, and the Vilebranch don't respect nothin'. My brother used to say a thanks to the beast after every kill, and I think the wilds still remember him for it." } },
      choices = {
        { text = "I'll thank every beast I take, as your brother did.", next = "BACK", reply = "Ya, he'd like dat, mon. His spirit be listenin'.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A kill is a kill. The spirits don't need my thanks.", next = "BACK", reply = "De spirits don't need it, mon, but dey remember who give it. You'll see.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman come to Revantusk. The Vilebranch witch doctors be twistin' the spirits up at Jintha'Alor, so a shaman with clean hands be welcome at my fire." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. If you serve the loa, mon, Yayo'jin will want a word with you, and if you serve somethin' else, keep it from frightenin' my beasts." },
        { id = "h_default", key = true,
          text = "Huntsman Markhor, master of the hunt for Revantusk. Many brave trolls been lost to these wilds, and I hunt what hunts us, so the rest of the village can sleep." },
        { id = "h_stalkers", when = { questActive = TODO_QUEST("Stalking the Stalkers") },
          text = "The Silvermane lie low in the brush and wait for a hunter to pass. Hunt them the way they hunt us, slow and quiet, and then all at once." },
        { id = "h_savages", when = { questActive = TODO_QUEST("Hunt the Savages") },
          text = "The savage owlbeasts took more of our warriors than the Wildhammer ever did. Kill them until you cannot stand the bloodshed, and then come back and we weigh what you done." },
        { id = "h_skylord", when = { questActive = TODO_QUEST("Avenging the Fallen") },
          text = "A Skylord be an old gryphon, the kind that breeds the young the dwarves ride against us. Bring me one plume, and I will count it as a hundred." },
        { id = "h_brother", tags = { "news" }, when = { questActive = TODO_QUEST("Separation Anxiety") },
          text = "My brother's bones be somewhere in that pit with the oozes, or in the wolf den near the top. I cannot save his life, but I can still save his spirit." },
        { id = "h_buried", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Separation Anxiety"), days = 3 } },
          text = "Yayo'jin prepared him last night, and we gave him to the earth the proper way. I slept for the first time since the raid, and I have you to thank for it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "The beasts in the stables don't like you, {class}, and the beasts be never wrong about a thing. Keep your demon away from them." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You walk downwind of me like you know what you doin', {class}. My brother walked like that too, before the Vilebranch caught him in the dark." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon. You walk like the forest owe you somethin', and the forest don't owe nobody nothin', so step lighter or the Vilebranch hear you comin'." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid, mon! Then you know how to hunt with respect, which be the only way I teach it." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, mon. You hunt the dead, the stories say, and you be dead yourself, so I wonder if you ever feel like the prey." },
        { id = "h_dd_hexx", tags = { "news" }, when = { questDone = TODO_QUEST("Wanted: Vile Priestess Hexx and Her Minions") },
          text = "Primal Torntusk tells me Hexx is dead and her altar at Jintha'Alor stands empty. I've hunted the Hinterlands for years, and I'll say plainly I never got that close to her." },
      },
      again = {
        { id = "h_again", text = "What else you need, hunter?" },
        { id = "h_again2", text = "Speak, then. The beasts be quiet for now." },
      },
      choices = {
        { text = "Do the spirits of the wilds favor the hunter or the hunted?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does any magic in these hills trouble your beasts, huntsman?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Something big hunts in these hills.", next = "wilds" },
        { text = "Have the Vilebranch taken anyone of yours?", next = "brother" },
        { text = "What do you make of the gryphons?", next = "gryphons" },
        { text = "What do you think of magic?", next = "arcane" },
        { text = "I'd like to stable my pet.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "I learned the arcane, huntsman. It's served me well.", next = "mage", when = { class = "MAGE" } },
        { text = "The Earth Mother keeps the beasts in balance too.", next = "tauren", when = { race = "Tauren" } },
        { text = "Why do beasts fear what I carry?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you track the Vilebranch, or do they track you?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I doubt a warrior can learn to move quietly in the forest.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How should a hunter take from the Hinterlands?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do you think a paladin hunts like you do, Markhor?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll hunt for Revantusk.", next = "END", fx = { affinity = 1 } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Both, and whoever see the other first be the one who come home. The Vilebranch hunt at night with their faces painted dark, so you learn to listen for the bird that stop singin', and you never sleep in the same place twice." } },
      choices = {
        { text = "Even the hunt has rules. I keep them.", next = "BACK", reply = "Good, mon. My brother kept de rules too, every one, and it was a Vilebranch who broke dem, not him.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Hunt them the way they hunt us. No quarter.", next = "BACK", reply = "Ya, no quarter, mon. De Vilebranch never gave my brother any.", fx = { align = { honor = -1 } } },
        { text = "Let's talk of other things, huntsman.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because a beast know what belong in the wild and what don't, and your little demon don't belong anywhere in this world. I don't judge a weapon by how it smell, but I judge the hunter by how tight the hunter hold the leash." } },
      choices = {
        { text = "I hold the leash tight. It obeys me.", next = "BACK", reply = "Tight, ya, and keep it tighter near my beasts, mon. Dey don't like it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leashes are for beasts. My demon and I understand each other.", next = "BACK", reply = "Understand each other, ya? Den tell it to stay away from my wolves, mon.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    wilds = {
      lines = { { id = "w_default", text = "Silvermane wolves in the brush, savage owlbeasts in the forests, and gryphons overhead, which be the worst, because the dwarves teach them what a troll tastes like." } },
      choices = {
        { text = "How do you hunt the Silvermane?", next = "wilds_silvermane" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wilds_silvermane = {
      lines = { { id = "ws_default", text = "You think like them. They wait downwind and they strike when you look away, so you never look away, and you strike first." } },
      choices = {
        { text = "The trolls say Zul'jin will return. Do you believe it?", next = "wilds_zuljin" },
        { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    wilds_zuljin = {
      lines = { { id = "wz_default", text = "He will, one day; I believe it the way I believe the tide. Until then, we hold our places and keep as many forest trolls alive as we can, and that be work enough for anyone." } },
      choices = {
        { text = "A wise way to wait.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother = {
      big = true,
      lines = { { id = "b_default", text = "Malkhor, my twin, our guard captain. The Vilebranch took him in the same raid as Torntusk's mate, and him they did not keep for any altar; they killed him quick and fed him to their oozes and their wolves." } },
      choices = {
        { text = "Then let me bring his remains home.", next = "brother_bones", fx = { trait = { kind = 1 } } },
        { text = "You must want revenge.", next = "brother_revenge" },
      },
    },
    brother_bones = {
      lines = { { id = "bb_default", text = "The refuse pit near the top of Jintha'Alor, where the oozes live, and the wolf den beside it. Bring back what you find, and Yayo'jin will prepare him for a proper burial." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother_revenge = {
      lines = { { id = "br_default", text = "Revenge be for the Primal to decide, and she decides it every night. What I want be smaller: my brother in the ground where his spirit can rest." } },
      choices = {
        { text = "The dead deserve rest before revenge, Markhor.", next = "BACK", reply = "Ya, dat be what I want too, mon. Rest first, blood later.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "His spirit will rest easier with Vilebranch blood spilled.", next = "BACK", reply = "Maybe it will, mon, and maybe de Primal will spill enough for both of us. I just want him home.", fx = { align = { light = -1 } } },
      },
    },
    gryphons = {
      big = true,
      lines = { { id = "gr_default", text = "The Wildhammer train them to kill trolls, and they do it well. The Skylords breed the young ones, so you kill a Skylord and you kill a hundred hunts before they ever happen." } },
      choices = {
        { text = "Then the Skylords die first.", next = "BACK", reply = "Ya, de Skylords first, mon, and de young ones won't grow up to hunt us.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The beasts aren't to blame. Hunt the riders instead.", next = "BACK", reply = "De beasts only do what dey taught, ya, and dat be true. But dey still bite, mon.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arcane = {
      lines = { { id = "a_default", text = "It be the magic of the high elves, who burned our forests and broke the old empire. It sours the beasts and it sours the land, and I don't need a reason past that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "mg_default", text = "Served you, maybe. It never served a troll in this forest, not once. Keep it in your sleeve while you stand by my stables, and we be friends enough." } },
      choices = {
        { text = "I'll keep it up my sleeve, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "So I hear. Your Earth Mother and my loa might get along, since both of them like a hunter who takes only what the land can spare." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the beasts and the trails. Ask me those, and leave the talk of mojo to Yayo'jin." } },
    background = { { id = "tp_bg", text = "Master huntsman of Revantusk, and once a twin. Now Markhor only be de first of dose two things.", next = "brother" } },
    advice = { { id = "tp_ad", text = "Watch the brush, not the path. Nothing in the Hinterlands walks on the path." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer have shot more Revantusk than I can count, and my brother hated them as I do. It was the Vilebranch who killed him, though, so my arrows go to Jintha'Alor first." } },
    the_elements = { { id = "tp_the_elements", text = "The beasts of the Hinterlands are restless, and the spirits are angry, and I think it's the blood magic in Jintha'Alor. My raptors won't go near it, and neither will I." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's Horde is the only home the Revantusk have now, and I'll defend it. My brother died for it, and I'll not see his death wasted." } },
    _none = { { id = "tp_none", text = "That be no beast I know. Ask somebody else." } },
  },
}

P:NPC {
  key = "yayojin", id = TODO_NPC("Mystic Yayo'jin"), name = "Mystic Yayo'jin",
  bible = "bibles/revantusk.md", role = "vendor", tier = "quest",
  communities = { "revantusk" }, temper = { "mysterious" }, values = { "devout", "proud" },
  prejudice = { race = "Scourge", amount = 10, why = "The walking dead cheated Bwonsamdi, and a mystic finds that bad juju." },
  notices = { "class", "race" },

  impression = {
    first = "Mystic Yayo'jin sells reagents from a platform at the north end of Revantusk and talks about Zul'jin as if he might walk up the stairs. She told me to mind her goods before she told me her name.",
    third = "{name} met Mystic Yayo'jin, who sells mystical goods at Revantusk Village and hates the cannibal Vilebranch.",
  },

  greetings = {
    { id = "g_prej1", when = { prejudiced = true }, text = "Stay on that side of the table, dead one. The spirits don't like it when somethin' that should be with Bwonsamdi comes shoppin' for reagents." },
    { id = "g_prej2", when = { prejudiced = true }, text = "The loa gave you a door and you walked back out of it, mon. I'll sell to you, but I'll be burnin' sage after." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "You again, dead one. The spirits have stopped hissin' when you come up the platform, so maybe Bwonsamdi has made his peace with you. I'll make mine." },
    { id = "g_default", text = "Mind your feet, mon. You be standin' next to my goods, and they cost more than your boots." },
    { id = "g_back", when = { metBefore = true }, text = "The spirits said you would come back, though they say that about everybody." },
  },

  notice = {
    { id = "n_caster", cat = "class", when = { class = { "PRIEST", "SHAMAN", "WARLOCK", "MAGE", "DRUID" } },
      text = "You use reagents, I can tell by the stains on your fingers. Come buy, then, because nobody up here sells better." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear with mojo in your walk. You know the old ways a little, so maybe you know the price of them too." },
  },

  start = "hello",
  nodes = {
    prej = {
      lines = { { id = "prej_default", text = "Because the dead belong to Bwonsamdi, and you walked away from him without payin' the toll. It isn't you I mind so much, mon; it's the bad luck that follows a debt like that." } },
      choices = {
        { text = "Death took everything from me. I owe it nothing more.", next = "BACK", reply = "Bwonsamdi don't care what you feel you owe, mon. He keep his own ledger.", fx = { align = { light = -1 } } },
        { text = "Then I'll pay my debt in the living I protect.", next = "BACK", reply = "Ya, dat be a better answer, mon. Bwonsamdi might even smile at dat.", fx = { align = { light = 1 } } },
        { text = "I'll keep to my side of the table, then.", next = "prej_ok", fx = { affinity = 1 } },
        { text = "What would Bwonsamdi want from someone like me?", next = "prej_why" },
        { text = "Something else, mon.", next = "BACK" },
      },
    },
    prej_why = {
      lines = { { id = "prejwhy_default", text = "Respect, maybe, or company, or nothin' at all. My grandmother said the loa of the dead is patient, and he don't chase anybody, because sooner or later everybody comes home." } },
      choices = {
        { text = "Then he can wait. I'm not finished here.", next = "BACK", reply = "Den he wait, mon, he be good at it. But don't keep him waitin' too long.", fx = { align = { order = -1 } } },
        { text = "I'd rather honour him than run from him.", next = "BACK", reply = "Ya, dat be wise, mon. Yayo'jin make you a little charm for it, if you ask nice.", fx = { align = { order = 1 } } },
        { text = "Something else, mon.", next = "BACK" },
      },
    },
    prej_ok = {
      lines = { { id = "prejok_default", text = "That's polite, and polite is good juju too. Keep it up and maybe I stop burnin' the sage." } },
      choices = {
        { text = "Something else, mon.", next = "BACK" },
      },
    },
    opn_elves = {
      lines = {
        { id = "opn_elves_q", text = "The elves of Quel'Thalas took the Amani forests and called them theirs, and now the dead have taken Quel'Thalas, so the loa got a sense of humour. The Highvale elves still sit at Quel'Danil, though, keepin' trolls in cages. What you think of the long-ears, mon?" },
      },
      choices = {
        { text = "They stole troll land. They got what was coming to them.", next = "opn_elves_r_hate", fx = { affinity = 2, align = { light = -1 }, opinion = { high_elves = "hate" } } },
        { text = "Nobody deserves what the Scourge did to them. Not even elves.", next = "opn_elves_r_pity", fx = { affinity = -1, align = { light = 1 }, opinion = { high_elves = "pity" } } },
        { text = "Proud and dangerous. I'd keep my distance.", next = "opn_elves_r_distrust", fx = { trait = { careful = 1 }, opinion = { high_elves = "distrust" } } },
        { text = "I was one of them, once. Choose your words.", next = "opn_elves_r_kin", when = { race = "Scourge", origin = "forsaken_dalaran_apprentice" }, fx = { affinity = -1, opinion = { high_elves = "kin" } } },
        { text = "I'd rather hear about the loa.", next = "BACK" },
      },
    },
    opn_elves_r = {
      lines = {
        { id = "opn_elves_r_default", text = "Loa be easier to talk about, mon. At least dey answer when you ask dem somethin'." },
      },
      choices = {
        { text = "Something else, Mystic.", next = "BACK" },
      },
    },
    opn_elves_r_hate = {
      lines = {
        { id = "opn_elves_r_hate", text = "Heh. You talk like Zul'jin, mon, or like Markhor after three cups. The loa like you a little more today." },
      },
      choices = {
        { text = "Something else, Mystic.", next = "BACK" },
      },
    },
    opn_elves_r_pity = {
      lines = {
        { id = "opn_elves_r_pity", text = "Pity for the long-ears? Then you never met one with a bow. Still, the dead don't ask who deserves it, and that be true for trolls too." },
      },
      choices = {
        { text = "Something else, Mystic.", next = "BACK" },
      },
    },
    opn_elves_r_distrust = {
      lines = {
        { id = "opn_elves_r_distrust", text = "Distance be wise, mon. Their arrows reach further than their manners." },
      },
      choices = {
        { text = "Something else, Mystic.", next = "BACK" },
      },
    },
    opn_elves_r_kin = {
      lines = {
        { id = "opn_elves_r_kin", text = "You were, eh? Then you know the forest better than you want to. I choose my words, and you choose your powders, and we both get along." },
      },
      choices = {
        { text = "Something else, Mystic.", next = "BACK" },
      },
    },
    xcl_zg = {
      big = true,
      lines = { { id = "xcl_zg_default", text = "Good, because his priests were buyin' up every scrap of mojo from here to Booty Bay, and I sold them nothin', though they asked twice. Zul'jin would have spat on a jungle god that made slaves of its own people, and the Amani always had more sense than to bleed for somethin' that hungry." } },
      choices = {
        { text = "No god has the right to feed on its own worshippers.", next = "BACK", reply = "Ya, dat be de truth, mon, and de loa agree. Hakkar drank too deep.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power. Hakkar's priests just reached for it too fast.", next = "BACK", reply = "Too fast, ya, and too greedy, mon. De Gurubashi fed dat Blood God dere own children, and now dere city be full of ghosts.", fx = { align = { light = -1 } } },
        { text = "What happens to his priests' mojo now?", next = "xcl_zg2" },
      },
    },
    xcl_zg2 = {
      lines = { { id = "xcl_zg2_default", text = "It go bad, the way milk go bad when the cow be dead, and anyone holdin' it will find it bites them back. If somebody tries to sell you a Gurubashi charm this year, you leave it on the stall and walk away, because nothin' Hakkar touched be clean." } },
      choices = {
        { text = "I'll leave his charms well alone, then.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Zul'jin hate everything that wear the Light, mon, because the elves and their friends took his eye and his people's land along with it. He not be here, though, and I need the coin, so I tell you what I tell everybody: mind the candles and pay fair." } },
      choices = {
        { text = "I'll pay fair. The Light asks it of me.", next = "BACK", reply = "Fair be good, mon. Even Zul'jin would respect fair, maybe.", fx = { align = { honor = 1 } } },
        { text = "Zul'jin isn't here. I'll bargain however I like.", next = "BACK", reply = "Ha! Zul'jin be far away, ya, but his friends be close, mon. Bargain careful.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every troll in these hills tell them, mon, and Yayo'jin remember the war drums from when she was small. The elves hunted him for years and he kept fightin', and the young warriors here still carve his axes on their spear shafts for luck." } },
      choices = {
        { text = "Zul'jin fought for his people. That's a warrior's honor.", next = "BACK", reply = "Ya, he did, mon, and de forest remember. Yayo'jin remember too.", fx = { align = { honor = 1 } } },
        { text = "Zul'jin lost. A warrior's judged by what he wins.", next = "BACK", reply = "Den Zul'jin be judged harsh, mon, but he still be a legend. Losin' don't kill a legend.", fx = { align = { honor = -1 } } },
        { text = "Something else, Yayo'jin.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Owl bones, tossed in the fire, and the way they crack point to the nest, or so the old hunters say. Yayo'jin don't promise it work, mon, but she promise the owl don't need them anymore." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Owl bones, tossed in the fire, and the way they crack point to the nest, or so the old hunters say. {pet} be sniffin' at them already, mon, but keep it off the table, because some of these be for curses and not for supper." },
      },
      choices = {
        { text = "The old ways kept the tribe alive. I'll trust them.", next = "BACK", reply = "Ya, de old ways, mon. Yayo'jin's grandmother read de bones on dis same table, and she never once lie to de Primal.", fx = { align = { order = 1 } } },
        { text = "Old bones are guesswork. I'll trust my own eyes.", next = "BACK", reply = "Your eyes be good, mon, but de bones see further. Still, Yayo'jin don't mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mystic Yayo'jin, and mystical goods be my trade. Candles, powders, and the things that make a spell hold, all bought and sold by a troll who knows what each one be for." },
        { id = "h_cousins", when = { questActive = TODO_QUEST("Cannibalistic Cousins") },
          text = "The Vilebranch soothsayers and scalpers gather by the temples of Shaol'watha and Agol'watha, north and east of here. Thin them out, mon, and the hills breathe easier." },
        { id = "h_cousins_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Cannibalistic Cousins"), days = 3 } },
          text = "The smoke over Agol'watha be thinner today, and I know whose work that be. Zul'jin himself would nod at you, and he don't nod for much." },
        { id = "h_cl_zg", tags = { "news" }, when = { cleared = "Zul'Gurub", faction = "Horde" },
          text = "The candles on my platform all bent south one night, all at once, and then they stood up straight like nothin' happened. I hear Hakkar fell that same night, and they tell me you were there, so you better sit and tell Yayo'jin what you saw." },
        { id = "h_malkhor", when = { questDone = TODO_QUEST("Separation Anxiety") },
          text = "I prepared Malkhor for the earth with my own hands. His brother wept the whole night, and that be how it should be." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "Soul shards rattlin' in your bag, {class}? Yayo'jin hear them from here, and she don't ask whose they were." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage, and you need reagents, mon, because no portal ever open on wishes. Look before you touch, {class}, and Yayo'jin will tell you what each thing be for." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "Hands where Yayo'jin can see them, {class}, because these candles be counted and the powders be weighed. You look like somebody who weigh things too." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon. Zul'jin was a warrior too, and he fought the elves with an axe in each hand, so you be standin' in good company here." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You want feathers, fangs, or the little bones that tell you where a beast be sleepin'? Yayo'jin sell all three, mon." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, mon, and a dead one, buyin' candles from a troll mystic. Zul'jin would spit if he saw this, so mind my goods and be quick." },
        { id = "h_dd_lunch", when = { questDone = TODO_QUEST("Lard Lost His Lunch") },
          text = "You found Lard's lunch for him, an' now he tell de story to anybody who stand still long enough. De spirits be laughin' about it too, I think, though dey hide it well." },
      },
      again = {
        { id = "h_again", text = "Somethin' more? Ask, mon; de spirits be listenin', and so be Yayo'jin." },
        { id = "h_again2", text = "Ask, mon, and don't step on the candles." },
      },
      choices = {
        { text = "Who are the Vilebranch?", next = "vilebranch" },
        { text = "Tell me about Zul'jin.", next = "zuljin" },
        { text = "Your wares look strange, mystic.", next = "goods" },
        { text = "What do the spirits say lately?", next = "spirits", when = { class = { "SHAMAN", "PRIEST" } } },
        { text = "Our loa are the same, mystic.", next = "troll", when = { race = "Troll" } },
        { text = "I saw the Soulflayer die in Zul'Gurub.", next = "xcl_zg", when = { cleared = "Zul'Gurub", faction = "Horde" } },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Does dark magic trouble the Revantusk, mystic?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I'd guess few trolls practice the arcane, Yayo'jin.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do you ever ask where your goods come from, mystic?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The Revantusk must still tell stories of Zul'jin.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Which bones tell you where a beast is sleeping, Yayo'jin?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Would Zul'jin really hate a paladin of the Horde, Yayo'jin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "You keep your distance from me, Yayo'jin. Why?", next = "prej", when = { prejudiced = true } },
        { text = "I'll be going.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Yayo'jin don't ask where a thing slept last night, mon, so long as it don't come from Revantusk. A rogue who lift a fetish off a Vilebranch altar be doin' the whole village a favor, and the loa won't mind it neither." } },
      choices = {
        { text = "Stealing from enemies is fair play.", next = "BACK", reply = "Ya, fair play, mon, and fair profit for Yayo'jin. Bring what you find.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I don't steal, Mystic, not even from the Vilebranch.", next = "BACK", reply = "Not even de Vilebranch? You be a strange one, mon. Yayo'jin like strange.", fx = { align = { honor = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some do now, mon, more every year. But the old Amani priests called it elf-magic and spat on it, because elf-magic be what broke the Amani in the Troll Wars, and some grudges get handed down like a good knife." } },
      choices = {
        { text = "Magic belongs to whoever learns it, elf or troll.", next = "BACK", reply = "Ya, dat be what de young ones say, mon. De old ones still spit, though.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some grudges deserve to be handed down.", next = "BACK", reply = "Some do, mon, some do. De elves earned plenty of our grudges.", fx = { align = { order = 1 } } },
        { text = "I'll look at your wares later. Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It trouble them when it be Vilebranch magic, because that kind feed on our blood. Yours feed on somethin' else, and Yayo'jin don't need to know what, so long as you pay for the candles." } },
      choices = {
        { text = "It feeds only on enemies. I make sure of it.", next = "BACK", reply = "Good, mon, den de loa don't mind so much. Keep it that way.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It feeds on whatever I give it. That's the price.", next = "BACK", reply = "Den mind de price don't grow, mon. Yayo'jin seen a warlock come through here with a little imp once, and a year later de imp be walkin' him on a leash.", fx = { align = { light = -1 } } },
        { text = "I'll leave that there.", next = "BACK" },
      },
    },
    vilebranch = {
      big = true,
      lines = { { id = "v_default", text = "Three tribes live in the Hinterlands, and all we share be that we be trolls and we live here. The Vilebranch eat their own kind and anything else that walks, and they be proud of it." } },
      choices = {
        { text = "Someone should stop them.", next = "vilebranch_tribes" },
        { text = "Cannibals have no place among trolls. They have to end.", next = "vilebranch_end", fx = { align = { light = 1 } } },
        { text = "Their mojo is strong. I'd learn what they know first.", next = "vilebranch_end", fx = { align = { light = -1 } } },
      },
    },
    vilebranch_tribes = {
      lines = { { id = "vt_default", text = "The Witherbark be no better, and the Revantusk be too few. If Zul'jin were here, he would end the Vilebranch with one flick of his hand, but he be gone and we be left to our own devices." } },
      choices = {
        { text = "Then I'll be your device.", next = "vilebranch_end", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vilebranch_end = {
      lines = { { id = "ve_default", text = "Good. Go north to the temples and bring the fight to them; the soothsayers first, because they whisper the rest into madness." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    zuljin = {
      big = true,
      lines = { { id = "z_default", text = "The warlord of the Amani, who led the forest trolls with the old Horde against the elves. Nobody knows where he walks now, but I tell you, mon, when he comes back the whole forest will know it." } },
      choices = {
        { text = "Do you believe he'll come back?", next = "zuljin_back" },
        { text = "He fought for the old Horde. Thrall leads the new one.", next = "BACK", reply = "Ya, dat be true, mon. Thrall be de new Horde, and Zul'jin de old.", fx = { align = { order = 1 } } },
        { text = "A warlord like that is what the trolls need.", next = "BACK", reply = "Maybe, mon, maybe. But de forest trolls need a leader who don't lose his eye.", fx = { align = { order = -1 } } },
      },
    },
    zuljin_back = {
      lines = { { id = "zb_default", text = "I believe it, and Markhor believes it, and there be candles burnin' for it in most huts on de bluff. Believin' costs nothin', mon, and it keeps a small tribe standin' straight." } },
      choices = {
        { text = "And the elves he fought? What of them?", next = "opn_elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goods = {
      lines = { { id = "go_default", text = "Powders for the priests and the shaman, candles for the ones who call on darker things, and herbs I won't name to a stranger. Everything you need, and a few things you shouldn't." } },
      choices = {
        { text = "Which ones shouldn't I need?", next = "goods_dark" },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goods_dark = {
      lines = { { id = "gd_default", text = "Ask me that again after you seen what the Vilebranch keep in their pots up at Jintha'Alor. Then maybe I sell you somethin' to forget it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    spirits = {
      lines = { { id = "sp_default", text = "They say the hill of Jintha'Alor be full of bad blood, and the ground under it be tired of drinkin' it. The rest they say only to me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troll = {
      lines = { { id = "tr_default", text = "Same loa, different drums, mon. The Darkspear sing them faster on the islands, but they come when either of us calls." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the spirits, the tribes and the price of every powder on this coast. Ask, and I tell you one of the three." } },
    background = { { id = "tp_bg", text = "A mystic sells mystery, mon. You don't get mine for free." } },
    advice = { { id = "tp_ad", text = "Never buy a reagent from a Vilebranch. You never know what they mixed in." } },
    vilebranch = { { id = "tp_vile", text = "Cannibals, mon, and proud of it.", next = "vilebranch" } },
    zul_gurub = { { id = "tp_zul_gurub", text = "Zul'Gurub is the old heart of the Gurubashi, and they have woken their blood god in it. I sell reagents to anyone who'll go and stop it, mon, and I'll pray they come back." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear are our cousins, and Vol'jin is a wise chief. He knows the old ways and the new ways both." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "The Atal'ai worship Hakkar in their swamp, and their madness is spreading. I sell charms against their blood magic, and I hope they work." } },
    _none = { { id = "tp_none", text = "The spirits don't say nothin' about that, and neither do I." } },
  },
}

P:NPC {
  key = "katoom", id = TODO_NPC("Katoom the Angler"), name = "Katoom the Angler",
  bible = "bibles/revantusk.md", role = "trainer", tier = "quest",
  communities = { "revantusk" }, temper = { "serene" }, values = { "patient", "friendly" },
  notices = { "craft" },

  impression = {
    first = "Katoom the Angler would rather be fishing than doing anything else in the world, and says so with real peace. His only enemies are the turtles that steal his bait.",
    third = "{name} met Katoom the Angler, Revantusk's fishing trainer and an admirer of Nat Pagle.",
  },

  greetings = {
    { id = "g_default", text = "Ah, mon, sit a while. The water be calm, and the fish be thinkin' about bitin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back by the water, mon? Good. Everybody comes back to the water in the end." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You carry a pole, mon, and you hold it like you mean it. Sit down, we talk about bait." },
  },

  start = "hello",
  nodes = {
    dd_drowned = {
      lines = { { id = "dd_drowned_default", text = "You don't stop de sea, mon, you just learn her moods. Watch de swell before you dive, an' come up before your chest burn, an' never swim where de Saltwater Snapjaws be nestin', because dey hold you under for fun." } },
      choices = {
        { text = "I'll listen to her moods from now on.", next = "BACK", reply = "Good, mon, she reward de ones who listen. An' if you catch somethin' big while you be down dere, Katoom want to see it.", fx = { align = { order = 1 } } },
        { text = "She caught me once. Next time I'll swim harder.", next = "BACK", reply = "Ha! Dat what every drowned fool say, mon, an' de sea be laughin' already. Swim hard, den, an' good luck.", fx = { align = { order = -1 } } },
        { text = "Something else, Katoom.", next = "BACK" },
      },
    },

    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Nothin' trouble this peace but the turtles, mon. If your Light could teach them some manners, Katoom would pray to it every mornin', but I think even the Light give up on turtles." } },
      choices = {
        { text = "Peace like yours is the Light's own work.", next = "BACK", reply = "Ah, you be kind, mon. Katoom like kind.", fx = { align = { light = 1 } } },
        { text = "Some things can't be taught, not even by the Light.", next = "BACK", reply = "Ya, dem turtles be beyond teachin', mon. Katoom tried.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I throw back the little ones and I thank the big ones, so yes, I be thinkin' so. The sea be patient with a troll who be patient with her, and I got more patience than anyone in Revantusk." } },
      choices = {
        { text = "Good. The sea rewards those who give back.", next = "BACK", reply = "Ya, it do, mon. Katoom throw back every little one for twenty years, and look how fat dey come back to visit.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Take the big ones and the small. The sea won't notice.", next = "BACK", reply = "De sea notice everything, mon. Katoom hope you never find out how.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because the sea teach you to wait, mon, and a warrior who learn to wait swing at the right time instead of the first time. The snapjaws know it already, which be why they steal my bait and I never catch them." } },
      choices = {
        { text = "There's wisdom in that. Patience wins more than fury.", next = "BACK", reply = "Ya, it do, mon. Sit here one whole mornin' and catch nothin', and you learn more about patience dan any war ever teach you.", fx = { align = { order = 1 } } },
        { text = "Waiting is for fishermen. A warrior strikes first.", next = "BACK", reply = "Strike first and strike wrong, mon. De sea teach dat too.", fx = { align = { order = -1 } } },
        { text = "Something else, Katoom.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The fish, mon, that be the whole point. Your arrow be no good under the waves and my hook be no good against a wolf, so we each keep to our own and nobody go hungry." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The fish, mon, that be the whole point, and your arrow be no good under the waves. {pet} been watchin' my bucket, so Katoom spare it a small one, but only one, because the turtles already took their share." },
      },
      choices = {
        { text = "Share the catch with whoever's hungry.", next = "BACK", reply = "Ya, dat be de way of de tribe, mon. Katoom always share.", fx = { align = { light = 1 } } },
        { text = "A fisher keeps his catch. Others can fish for themselves.", next = "BACK", reply = "Den you fish alone, mon, and you eat alone. Katoom prefer company.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Them snapjaws, mon, and sometimes Vilebranch scouts who come down to the shore to steal our nets. A troll with a little magic could keep them off the beach, and then everybody fish in peace, which be how it ought to be." } },
      choices = {
        { text = "I'll guard the beach. Everyone should fish in peace.", next = "BACK", reply = "Good, mon, de whole beach thank you. Katoom too.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll guard my own line. The rest can look after theirs.", next = "BACK", reply = "Ya, guard your own, mon. Katoom guard his, and maybe we meet in de middle.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every single fish, mon, I say a little word before I let it go or put it in the pot. The sea give and the sea take, and the only ones who never say thank you be them snapjaws, so de sea don't like them neither." } },
      choices = {
        { text = "I'll thank the water too, and take only what I need.", next = "BACK", reply = "Ya, dat be right, mon. De sea give back to dem who ask nice.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fish are fish. The sea won't miss what I take.", next = "BACK", reply = "De sea miss everything, mon, it just be polite about it. For now.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, mon! You go ask the water spirits to send the fish my way, and leave the snapjaws out of it, if you please." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest, mon! You say a word to the loa for my line, eh? Not a big prayer, just enough to keep the snapjaws off." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock, mon? You keep that demon away from the water's edge, because the fish don't like the look of it, and neither do I." },
        { id = "h_default", key = true,
          text = "Katoom the Angler. I teach the fishin' and I sell the gear, but mostly I sit right here and fish, which be the most pleasant thing a troll can do." },
        { id = "h_snapjaws", when = { questActive = TODO_QUEST("Snapjaws, Mon!") },
          text = "Them snapjaws got big sweet eyes, mon, but don't trust them. They take my bait and break my line every five minutes, so thin them out for me." },
        { id = "h_gammerita", when = { questActive = TODO_QUEST("Gammerita, Mon!") },
          text = "Gammerita be the big one, the queen of the snapjaws, and she got my best lure in her belly. Get it back, mon, and the fish will love me again." },
        { id = "h_gammerita_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Gammerita, Mon!"), days = 3 } },
          text = "My lure, mon! I been usin' it all mornin', and the fish be pilin' up like they missed it as much as I did." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night fishin' be the best fishin', mon. The water goes quiet and the big ones come up to look at the moon." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage! You can make it rain fish, mon? No? Then you no more use to Katoom than anybody else, {class}, but sit down anyway." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "Quiet feet, {class}, good, because loud feet scare the fish. Sit, sit, and don't steal my bait, because the turtles do that already." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon, and you got the look of somebody who never sit still. Sit anyway, for one breath, and watch the water with old Katoom." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! You and Katoom be the same, mon, only you hunt on land and Katoom hunt in the water, and the water be much more relaxin'." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid! You know about the fish, I be thinkin', so maybe you know why they don't bite on cloudy days." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin come to fish wit' Katoom? Sit, mon, because the fish don't care what you pray to, and neither does Katoom, so long as you keep the turtles off my bait." },
        { id = "h_dd_drowned", when = { deathCause = "drowning" },
          text = "You drown, mon, I can see it on you. De sea take everybody once, but she give you back, so maybe she don't like de taste of you." },
      },
      again = {
        { id = "h_again", text = "What else you need, mon? The fish be patient with us." },
        { id = "h_again2", text = "Go on, I be listenin' and fishin' both." },
      },
      choices = {
        { text = "Do you ever thank the water for what you catch, Katoom?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What troubles this stretch of coast, Katoom?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Someone taught you well to fish.", next = "pagle" },
        { text = "What gives you trouble on this shore?", next = "snapjaws" },
        { text = "The war must worry you.", next = "war" },
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "What's the best bait on this coast?", next = "bait", when = { profession = "Fishing" } },
        { text = "I could freeze the water and catch them that way.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Sitting this still is a lot like keeping watch.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why would a warrior sit and watch the water, Katoom?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Could your rod catch anything a hunter couldn't, Katoom?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do you fish with respect for the waters, Katoom?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Does the Light ever trouble a fisherman's peace, Katoom?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not now, Katoom.", next = "END" },
        { text = "The sea took me under, Katoom. How do I stop it?", next = "dd_drowned", when = { deathCause = "drowning" } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Fishin' and watchin' be the same thing, mon, only fishin' feed you. I see every snapjaw on this coast and every stranger who come along the shore, and nobody ever think the old troll with the rod be lookin' at anything but the water." } },
      choices = {
        { text = "Hiding in plain sight is the smartest trick there is.", next = "BACK", reply = "Ya, dat be de best trick, mon. Nobody suspect de fisherman.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather watch openly and let them know it.", next = "BACK", reply = "Den dey run before you see much, mon. Katoom's way be better.", fx = { align = { honor = 1 } } },
        { text = "I'll let you fish. Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "And then what, you got a block of ice with a fish in it and no story to tell? The fish be half the joy, mon, and the waitin' be the rest, so Katoom never take a shortcut." } },
      choices = {
        { text = "Patience is its own reward. You're right.", next = "BACK", reply = "Ya, you get it, mon. De waitin' be de best part.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Results are what matter. Waiting is wasted time.", next = "BACK", reply = "Den you never know de joy, mon. Katoom feel sorry for you.", fx = { align = { order = -1 } } },
        { text = "I'll leave you and the fish to it.", next = "BACK" },
      },
    },
    pagle = {
      big = true,
      lines = { { id = "p_default", text = "Nat Pagle, mon, and there be no better hand with a rod on any shore. Everything calm in me, I learned sittin' beside him. You know the name?" } },
      choices = {
        { text = "Where is he?", next = "pagle_where" },
        { text = "Fishing is a waste of a good warrior, Katoom.", next = "BACK", reply = "A waste, ya? Katoom killed plenty before de sea taught him better, mon. You come fish with me one day, den say it again.", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "A peaceful man is rare. Good for you, Katoom.", next = "BACK", reply = "Rare, ya, and hard won, mon. Nat Pagle would say de same, if he ever stop fishin' long enough to talk.", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    pagle_where = {
      lines = { { id = "pw_default", text = "Somewhere down by Theramore, on an island in the marsh, I hear, fishin' all day and talkin' to nobody. If you want to learn the way, mon, he be the one to show you." } },
      choices = {
        { text = "That's an island full of Alliance.", next = "pagle_alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pagle_alliance = {
      lines = { { id = "pa_default", text = "A fisherman got no alliance, mon, only a pole. Nat don't care who you march with, so long as you keep your voice down by the water." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    snapjaws = {
      lines = { { id = "s_default", text = "The saltwater snapjaws, mon, big hungry turtles that swallow bait whole, and their queen, Gammerita, be the worst thief on the whole coast." } },
      choices = {
        { text = "I'll deal with them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "It worries me, mon, every day. But the Primal fights, and Markhor hunts, and somebody got to catch the fish they eat when they come home." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    bait = {
      lines = { { id = "b_default", text = "Bright lure in the morning, slow bait at night, and never the same spot twice when the snapjaws watchin'. Don't tell Gorkas, mon; he be fishin' for that big grouper with all the wrong things." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know fish, mon, so you ask me about fish." } },
    background = { { id = "tp_bg", text = "I fish. Before that, I wanted to fish. That be my whole story, mon.", next = "pagle" } },
    advice = { { id = "tp_ad", text = "Be patient, mon. The fish know when you be in a hurry." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay got fine fishin', mon, so the sailors tell me, but there be a thousand boats in that harbour scarin' the fish. My pier be quiet, and the turtles would miss me if I left." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear fish too, out on the Echo Isles, and they say their fish be the best. They be wrong, mon, but I'd never tell Vol'jin that to his face." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet got goblins who'll buy any fish you land, mon, and they don't much care if it be fresh. I'd sooner eat my fish than sell them to a goblin for a copper." } },
    _none = { { id = "tp_none", text = "No idea, mon. Ask me about fish instead." } },
  },
}

P:NPC {
  key = "lard", id = TODO_NPC("Lard"), name = "Lard",
  bible = "bibles/revantusk.md", role = "innkeeper", tier = "quest",
  communities = { "revantusk" }, temper = { "simple" }, values = { "friendly", "generous" },
  notices = { "weary", "pet" },

  impression = {
    first = "Lard is an ogre who keeps the inn at Revantusk, keeps the peace, and sells fish. He is enormous and gentle, and mostly worried about his lunch.",
    third = "{name} met Lard, the ogre innkeeper of Revantusk Village.",
  },

  greetings = {
    { id = "g_default", text = "Hello, little one! Lard has beds, and Lard has fish, and nobody makes trouble while Lard is watchin'." },
    { id = "g_home", when = { homeInn = { "Revantusk Village" } }, text = "Little one come home! Lard keep bed warm for you, and nobody sit on it, because Lard tell them no." },
    { id = "g_away", when = { away = 14 }, text = "Little one come back after {away} away! Lard keep your bed the whole time, and Lard tell everybody to stay off it." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Everybody say little one talk nice to them! Lard knew it already, because Lard always know who be nice." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody in the village be cross with little one, and Lard don't like crossness, so nobody make trouble while Lard is watchin'." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Somebody hit you with big stick, like they hit Lard. You sit down and eat, and then you feel better." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} keeps sniffin' at Lard's fish barrel, and Lard does not blame it, because Lard does the same thing." },
  },

  start = "hello",
  nodes = {
    dd_elder = {
      lines = { { id = "dd_elder_default", text = "The Elder tell everybody! He say he call the Vilebranch grandmothers rude names until they forget to sharpen the knife, and Lard laugh so hard Lard spill the soup. Lard think the Elder is very brave, and maybe a little bit crazy." } },
      choices = {
        { text = "Brave and crazy together is how the Revantusk survive.", next = "BACK", reply = "Yes! Lard think you are a little bit crazy too, and that is good. Come back for soup.", fx = { align = { order = -1 } } },
        { text = "He was lucky. Next time he should keep his mouth shut.", next = "BACK", reply = "Lard does not think the Elder can keep his mouth shut. Lard cannot either, so Lard does not blame him.", fx = { align = { order = 1 } } },
        { text = "Something else, Lard.", next = "BACK" },
      },
    },

    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Lard not bothered, because Lard keep the peace, and you not breakin' nothin'. Only the shiny make the trolls squint, so maybe you sit in the corner, and everybody be happy." } },
      choices = {
        { text = "I'll sit in the corner, Lard. Peace matters more.", next = "BACK", reply = "Lard like that very much. The corner is comfy, and nobody squint at corners.", fx = { align = { order = 1 } } },
        { text = "I'll sit wherever I like. Let them squint.", next = "BACK", reply = "Then Lard bring them squintin' stew, and they forget about you. Lard always fix it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Lard let in the cat, because the cat catch the rats. Lard not let in the bear, because the bear eat the stew. Lard think there be a lesson in that, but Lard not sure what it be." } },
      choices = {
        { text = "Feed the cat and keep out the bear. Sounds wise to me.", next = "BACK", reply = "Lard think so too. The cat is very happy, and Lard is very happy.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the bear in, Lard. Share the stew.", next = "BACK", reply = "Lard share stew with bear once. Bear did not share back, and now Lard has a new table.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A big orc warrior came in after fighting Vilebranch, and he was very angry, and he hit the table, and the table broke. Lard was not angry, Lard just sat on him a little bit until he was calm, and then we had fish." } },
      choices = {
        { text = "Peace in the inn is your rule. A warrior should keep it.", next = "BACK", reply = "Lard agree, and Lard tell him so, very gently, while holding the table. He keep it after that.", fx = { align = { order = 1 } } },
        { text = "A warrior's fury needs somewhere to go, Lard.", next = "BACK", reply = "Lard know, and Lard give it somewhere to go: outside. Outside is very big.", fx = { align = { order = -1 } } },
        { text = "Something else, Lard.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "One time a Vilebranch witch doctor make Lard's stew bubble green from far away, and nobody would eat it, not even Lard. You stand by the hearth with your magic, and Lard will feel very safe, and the stew will stay brown like stew should." } },
      choices = {
        { text = "I'll guard the inn, and the stew, for you, Lard.", next = "BACK", reply = "Lard would like that, because green stew is very bad for business.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Next time, sell the green stew to the Wildhammer.", next = "BACK", reply = "Ha! Lard never think of that, and Lard think it very funny. The dwarves can eat green.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Lard would like that very much, because the hearth gets sad when it rains and the trolls complain about the smoke. You make it happy, and Lard will cook you a fish, and maybe not burn it this time." } },
      choices = {
        { text = "I'll bless it properly, the way the spirits ask.", next = "BACK", reply = "Lard be very happy, and the trolls stop complaining, and then everybody happy.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll do it quickly. The spirits won't care how.", next = "BACK", reply = "Quick is fine, because the hearth not picky. Lard thank you all the same.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "Lard see you are shaman. Lard like shaman, because one time a shaman make the rain stop on Lard's picnic, and Lard never forget it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "Lard see you are priest. You make Lard better when Lard eat too much? Lard ask for a friend, and the friend is Lard." },
        { id = "h_default", key = true,
          text = "Lard keep the inn for the trolls, and Lard keep the peace, because nobody want to fight when Lard is standin' there. Lard is very big, so it work good." },
        { id = "h_lunch", tags = { "news" }, when = { questActive = TODO_QUEST("Lard Lost His Lunch") },
          text = "Lard's picnic got ruined by Vilebranch with big sticks, and Lard ran so fast he left the whole basket behind. Now Lard's belly is makin' noises like a storm." },
        { id = "h_lunch_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Lard Lost His Lunch"), days = 3 } },
          text = "Lard still thinkin' about that lunch you bring back! It was the best haunch Lard ever ate, and Lard eat many haunches." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "Lard don't like your little friend, the one with the horns. It look at Lard's fish like it want to eat them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "Lard like mages, because one time a mage make Lard bread out of nothing. You can do that, {class}? Lard is very hungry." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "Lard see you sneakin', little one, because Lard is tall and see over everything. No stealin' from the inn, or Lard sit on you." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "You are a warrior! Lard can tell, because you are all metal and clanking. Please do not clank on the tables, because Lard just fixed them." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "Lard see a tauren druid. Lard like tauren, because tauren big like Lard, and tauren not cause trouble in Lard's inn." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "You dead, and you shiny. Lard never see dead and shiny at the same time, and Lard think it look very uncomfortable, but you be welcome at the inn." },
        { id = "h_dd_elder", tags = { "news" }, when = { questDone = TODO_QUEST("Return to Primal Torntusk") },
          text = "You bring the old Elder home from the Vilebranch! Lard was so happy Lard ate two dinners, and then a third one for the Elder, because the Elder was too busy tellin' stories." },
      },
      again = {
        { id = "h_again", text = "What else little one want? Lard listenin'." },
        { id = "h_again2", text = "You still here, and that good, because Lard like company." },
      },
      choices = {
        { text = "Got anything I can feed my companion, Lard?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Can I bless the inn's hearth for you, Lard?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is the inn ever troubled by magic, Lard?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Make this inn my home.", next = "BUSINESS" },
        { text = "An ogre among trolls is a strange sight.", next = "ogre" },
        { text = "Where does Lard go to get away from it all?", next = "spot" },
        { text = "You must keep the peace in here somehow.", next = "peace" },
        { text = "Ogres are enemies of the Horde.", next = "orc", when = { race = "Orc" } },
        { text = "My imp won't touch your fish, Lard.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Conjured bread fills you, but it doesn't taste of much.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do you ever catch thieves in the inn, Lard?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Some of your tables look broken, Lard.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Does Lard ever let the wild animals in?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Does it bother you that I'm dead and shiny, Lard?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye, Lard.", next = "END" },
        { text = "Did the Elder tell you about the Vilebranch, Lard?", next = "dd_elder", when = { questDone = TODO_QUEST("Return to Primal Torntusk") } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "One time a Vilebranch come in the window to steal fish, and Lard sit on him, and then he was very sorry. Lard don't like fightin', so it is better if sneaky people just pay, and then everybody is happy and nobody get sat on." } },
      choices = {
        { text = "Paying is better. I'm no thief, Lard.", next = "BACK", reply = "Good, because paying is nice and nobody get sat on.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sneaky people don't get caught, Lard. Only clumsy ones.", next = "BACK", reply = "Lard is not clumsy, Lard is big, and big catch everybody in the end. You be careful.", fx = { align = { honor = -1 } } },
        { text = "Lard, tell me about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Lard don't care how it taste, Lard care how much. But fish taste better, and Lard cook fish, so maybe one day you bring magic bread and Lard bring fish, and then we both eat good." } },
      choices = {
        { text = "Sharing food is the best magic there is.", next = "BACK", reply = "Lard think so too, and Lard share fish with you if you share bread with Lard.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My bread's for me, Lard. Catch your own fish.", next = "BACK", reply = "Then Lard keep the fish for Lard, and everybody keep their own. That is fair too.", fx = { align = { light = -1 } } },
        { text = "Let's talk of something else, Lard.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Imp say that, and then the fish is gone. Lard is gentle, but Lard is big, and if the little horn-man touch the fish, Lard will throw him in the sea, and you can go get him." } },
      choices = {
        { text = "Fair enough. I'll keep it on a short leash.", next = "BACK", reply = "Good, because Lard does not want to sit on the little horn-man.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It does as it likes. I can't watch it every moment.", next = "BACK", reply = "Then Lard watch it every moment for you, and Lard is very good at watching.", fx = { align = { order = -1 } } },
        { text = "Fine, Lard. Let's talk about something else.", next = "BACK" },
      },
    },
    ogre = {
      lines = { { id = "o_default", text = "Trolls is nice to Lard. They give Lard roof and fish and don't make Lard fight for chief, so Lard stay. Other ogres not nice like trolls." } },
      choices = {
        { text = "You must miss them sometimes.", next = "ogre_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ogre_miss = {
      lines = { { id = "om_default", text = "Lard not miss gettin' hit on the head every mornin'. Lard miss the singin' a little, but trolls sing too, and they sing better." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    spot = {
      lines = { { id = "s_default", text = "Is secret, little one! But Lard tell you, because you is nice. It is island to the north, past the beach, and nobody go there except Lard and now the mean Vilebranch, who chase Lard off and take Lard's lunch." } },
      choices = {
        { text = "I'll get your lunch back.", next = "spot_promise", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spot_promise = {
      lines = { { id = "sp_default", text = "You do that for Lard? Then Lard make you a picnic basket of your own, a little one, for a little one. Watch out for the Vilebranch, because they hit hard." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "Lard has fish, lots of fish, and even more fish if you wait till Katoom comes back. Your beast can have the heads, which are the best part, though people never believe Lard about that." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Lard has fish, and {pet} looks hungry, so your friend can have the heads. Heads are the best part, but nobody ever believes Lard about that, so maybe your beast will tell them." },
      },
      choices = {
        { text = "I'll take the fish heads, with thanks.", next = "BACK", reply = "Your beast will be very happy, and Lard will be very happy, and fish heads not wasted.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll find my own scraps, thank you.", next = "BACK", reply = "Lard understand, but the fish heads are good, and they will wait for you.", fx = { align = { honor = -1 } } },
      },
    },
    peace = {
      big = true,
      lines = { { id = "p_default", text = "When two trolls get angry in Lard inn, Lard stand between them and look down. Mostly they stop, and if they don't stop, Lard pick them up and put them outside." } },
      choices = {
        { text = "That's a fine way to keep order.", next = "BACK", reply = "Lard think so too, and Lard is very good at looking down.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Let them fight. It settles things faster.", next = "BACK", reply = "Fighting break tables, and tables cost money, so in Lard inn, nobody settle nothing that way.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc = {
      lines = { { id = "oc_default", text = "Some ogres, yes, the ones near Hammerfall and in the mountains. Lard is not those ogres; Lard only want fish, and a nap, and no fightin'." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Lard know fish, and beds, and who is fightin'. Ask Lard." } },
    background = { { id = "tp_bg", text = "Lard was ogre in the mountains. Now Lard is ogre by the sea, which is better.", next = "ogre" } },
    advice = { { id = "tp_ad", text = "Always eat lunch before Vilebranch find you. Lard lose a whole roast boar that way, and Lard still sulk about it." } },
    thrall = { { id = "tp_thrall", text = "Warchief Thrall let Lard keep the inn even though Lard is ogre, so Lard like him very much. Lard never meet him, but Lard save him a fish just in case." } },
    wildhammer = { { id = "tp_wildhammer", text = "Dwarves on the birds shoot at Lard sometimes when Lard go fishing, and Lard not like it. Lard is very big, so they hit Lard a lot, but Lard is also very thick, so it is fine." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay has many fish and many goblins, they say, and Lard would like to go and eat some of the fish. Lard would need a very big boat, so Lard stay here." } },
    _none = { { id = "tp_none", text = "Lard not know that, but Lard know fish!" } },
  },
}

P:NPC {
  key = "slagtree", id = TODO_NPC("Smith Slagtree"), name = "Smith Slagtree",
  bible = "bibles/revantusk.md", role = "blacksmith", tier = "quest",
  communities = { "revantusk" }, temper = { "cheerful" }, values = { "practical", "grateful" },
  notices = { "kit", "race" },

  impression = {
    first = "Smith Slagtree is an orc who mends anything broken at Revantusk's forge, while you wait. His best tools were a gift from a gnome who once saved his life, and the Vilebranch stole them.",
    third = "{name} met Smith Slagtree, the orc smith of Revantusk Village, who lost a treasured set of tools to the Vilebranch.",
  },

  greetings = {
    { id = "g_default", text = "Broken blade? Cracked shield? Bring it to the anvil, friend, and pull up a stump while I work." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the anvil! Let's see what the Hinterlands did to your gear this time." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at the state of that armor! You can't fight in that, friend, so hand it over before something kills you." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! You've got nothing to fear from me, little one, because one of your kind saved my life." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Plate is plate, and a dent is a dent, whoever wears it. I'll say this, though: the knights who guarded the camps kept their armour very clean, and you keep yours dented, and I like you better for it." } },
      choices = {
        { text = "Dents are honest. I earn them in the fight.", next = "BACK", reply = "Spoken like a warrior. Hang that plate on my rack and every grunt who walks past will know you stood in the front rank.", fx = { align = { honor = 1 } } },
        { text = "Clean or dented, it's only armour. Don't read into it.", next = "BACK", reply = "Only armour, yes, but I can tell from these scratches that you take your hits on the left and you don't step back. That's a lot to learn from a plate.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The coal comes from the hills and the wood from the forest, and I'll not deny I've burned a good deal of both. But the village needs its blades, and the Vilebranch don't wait for a druid to give us permission." } },
      choices = {
        { text = "The village needs blades. The forest can spare the wood.", next = "BACK", reply = "They do, and I'm grateful every day I swing the hammer. The shamans grumble at my smoke, but none of them turn down a new spearhead.", fx = { align = { order = 1 } } },
        { text = "Burn less, smith. The forest is all we have.", next = "BACK", reply = "I've heard that from the shamans too, and I'll try. I already burn the deadfall first, and I don't cut anything the Mystic has tied a charm to.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I mend anything broken, and a bow is just a long thing that breaks more often. The Vilebranch stole my best tools, the ones the gnome gave me, so I make do with an old file and a lot of cursing." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I mend anything broken, and a bow is just a long thing that breaks more often. Keep {pet} back from the coals while I work, hunter, because I don't mend fur." },
      },
      choices = {
        { text = "Your tools should come back. A debt like that matters.", next = "BACK", reply = "It does, and I'll get them back one day. He kept them safe for me when I couldn't carry them, and I'd like to put them in his hands myself.", fx = { align = { honor = 1 } } },
        { text = "Tools are tools. Forge new ones and forget the gnome.", next = "BACK", reply = "Forget him? He saved my life, and you'd not forget that either. The tools come home.", fx = { align = { honor = -1 } } },
        { text = "Something else, Slagtree.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Not at the anvil, because I'm old-fashioned about steel and like to earn it with my own arms. What I need is someone to stop the Vilebranch raiding the ore the trolls bring down from the hills, and a few spells would do that faster than I can swing a hammer." } },
      choices = {
        { text = "I'll escort the ore and fight any raider openly.", next = "BACK", reply = "Good. If they want the ore, they can come and look you in the eye for it, and most of them won't.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll ambush the raiders before they reach the road.", next = "BACK", reply = "Before they reach the road, aye, and none of them reach Revantusk. That's sense.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Ask away, but tell it I'm grateful already, because it never let me down, even when the Vilebranch took my tools. The trolls here leave little offerings by the coals, and I've stopped sweeping them up, since the steel's come out cleaner ever since." } },
      choices = {
        { text = "I'll bless it for the whole village. Revantusk's forge serves everyone.", next = "BACK", reply = "Then the village thanks you, and so do I. Every spear and fishhook on this beach came out of that fire.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The fire answers whoever feeds it. You don't need a blessing.", next = "BACK", reply = "It does, and it's always answered me. Bless it anyway, if you like.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman at my forge. Fire's the first spirit any smith learns to respect, and I've been talking to mine for twenty years, though it's never once answered me." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. If you can mend a body the way I mend a shield, you'll never want for work in Revantusk, because the Vilebranch keep us both busy." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage. Don't touch the forge, please, because the last spellcaster who tried to heat my coals faster melted half a good blade." },
        { id = "h_default", key = true,
          text = "Smith Slagtree, and I keep the forge for Revantusk, as an orc of the Horde should for allies who kept faith. Nobody leaves this village with a split shield while I've got coals in the forge, even if the Vilebranch did make off with my good tools." },
        { id = "h_tools", tags = { "news" }, when = { questActive = TODO_QUEST("Vilebranch Hooligans") },
          text = "Those Vilebranch thieves took my tools in the raid, the good set. Try the temples up in the northeast, or Skulk Rock, and bring them back, because they mean the world to me." },
        { id = "h_tools_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Vilebranch Hooligans"), days = 3 } },
          text = "My tools! I still can't believe you found them. I've been using them all day just to feel the weight of them in my hands again." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "The old Horde had warlocks, {class}, and every orc my age remembers what their fire cost us. Stand on the far side of the anvil and we'll get along fine." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "Light fingers, {class}? The Vilebranch took my best tools into the hills, and nothing would please me more than a quiet pair of hands bringing them home." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Bring that bow here and I'll restring it, because I can see it's been fighting the damp, and the damp in the Hinterlands always wins." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid. You don't need a shield, I'd wager, for a bear's hide is better than any I could forge." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken. Bring me your plate if it's dented; I've mended worse for stranger folk, though I'll admit I've never hammered on armour that glows." },
        { id = "h_dd_savages", when = { questDone = TODO_QUEST("Hunt the Savages") },
          text = "Markhor says you brought him the savages he was after, and he's been in a good enough mood to bring me his spears to sharpen instead of sharpening them on his own. That's practically a gift, from him." },
      },
      again = {
        { id = "h_again", text = "Speak, then, but these borrowed tools make me short of temper, so keep it plain." },
        { id = "h_again2", text = "Ask away; I can talk and hammer at once." },
      },
      choices = {
        { text = "Can you mend a warrior's armor, Slagtree?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Shall I ask the fire spirit to bless your forge, Slagtree?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could a spellcaster be of use to your forge, smith?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Mend my gear.", next = "BUSINESS" },
        { text = "Where did those tools come from?", next = "gnome" },
        { text = "An orc seems out of place among trolls.", next = "village" },
        { text = "What do the Vilebranch want with tools?", next = "thieves" },
        { text = "My people have no love for gnomes.", next = "orc_gnome", when = { race = { "Orc", "Troll", "Scourge" } } },
        { text = "The Warchief tolerates warlocks now. Why don't you?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What makes those tools worth the climb to Jintha'Alor?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I'd guess you work on bows as well as armor, Slagtree.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Does the forge cost the forest much, Slagtree?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Is mending a paladin's plate any different from an orc's, smith?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Later, smith.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A gnome gave them to me years back, after he saved my life, and a Horde smith owing his life to a gnome is a strange debt to carry. I carried it all the same, and the Vilebranch have no right to it." } },
      choices = {
        { text = "A debt is a debt, whoever you owe it to.", next = "BACK", reply = "Aye, it is, and I've never forgotten it. I still have the bandage he wrapped my arm in, folded up in the bottom of my tool chest.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Debts to the Alliance don't count for much.", next = "BACK", reply = "They count to me. He saved my life, and that's not a thing you weigh by banners.", fx = { align = { honor = -1 } } },
        { text = "Something else, smith.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Tolerating isn't trusting. The Warchief lets your kind study because he'd rather watch you than chase you, and I mend your armor because a split breastplate kills a warlock as dead as any grunt." } },
      choices = {
        { text = "You're right to be wary of fel. I'm wary of it myself.", next = "BACK", reply = "Good. I watched it eat the clans from the inside, and I'll not have it near my forge again.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fel is a tool. Orcs fear it more than they should.", next = "BACK", reply = "You weren't in the camps, or you'd fear it right. Mind your fire near my forge.", fx = { align = { light = -1 } } },
        { text = "Let's leave it at that.", next = "BACK" },
      },
    },
    gnome = {
      big = true,
      lines = { { id = "gn_default", text = "When I was young and stupid, a gnome pulled me out of trouble that should have killed me, and then he gave me his own tools. I never knew his name, and I've used his hammer every day since." } },
      choices = {
        { text = "What happened?", next = "gnome_story" },
        { text = "A debt to an enemy is still a debt.", next = "BACK", reply = "Aye, it is, and I'll pay it if I ever can. Thank you for seeing it.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "He was Alliance. Don't get sentimental.", next = "BACK", reply = "Sentimental? I'm alive, and he made that happen. That's not sentiment, it's arithmetic.", fx = { align = { honor = -1 }, affinity = -1 } },
      },
    },
    gnome_story = {
      lines = { { id = "gs_default", text = "That's mine to keep, friend. I'll just say I was bleeding, and he was small, and he didn't have to stop. Most folk wouldn't have, on either side." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    village = {
      lines = { { id = "v_default", text = "Every village needs a smith, and the Revantusk kept faith with the Horde when nobody else did. Seemed right that an orc kept faith with them back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thieves = {
      lines = { { id = "th_default", text = "Nothing; they don't know iron from bone. They took them because they were shiny and they were mine, which is the Vilebranch all over." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "I can mend near anything, warrior, if you don't mind the smell of the forge on it after. Revantusk warriors trust my work, and I think you'll be the next one." } },
      choices = {
        { text = "I'll trust your work, then.", next = "BACK", reply = "Good. You'll find my work holds, warrior, smell and all.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep my own kit. I don't trust smiths.", next = "BACK", reply = "Then carry it yourself, and mend it yourself. My forge will be here when it breaks.", fx = { align = { order = -1 } } },
      },
    },
    orc_gnome = {
      lines = { { id = "og_default", text = "Neither did I, till one of them saved my hide. I'm not asking you to like them, friend; I'm asking you to bring my tools back." } },
      choices = {
        { text = "Tools, not friendship. Understood. I'll find them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Iron, steel, and what the Vilebranch broke this week. Ask." } },
    background = { { id = "tp_bg", text = "A smith since I was young enough to burn myself every day. A gnome's hammer taught me most of it.", next = "gnome" } },
    advice = { { id = "tp_ad", text = "Mend before you need to. A belt that snaps mid-swing leaves you fighting with your trousers round your knees." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "A gnome saved my life once, and gave me my best tools, and the Vilebranch stole them. I've heard the gnomes lost their city to troggs, and I'm sorry for it." } },
    thrall = { { id = "tp_thrall", text = "The Warchief sent me here to mend the Revantusk's weapons, and I've been mending them ever since. It's good work, and honest, and I'm glad of it." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer have good forges, I'm told, and better steel. I'd like to see one someday, if they'd stop trying to kill me long enough." } },
    _none = { { id = "tp_none", text = "I can't hammer that into shape for you, friend, however strong my arm. Ask somebody else." } },
  },
}

P:NPC {
  key = "otho", id = TODO_NPC("Otho Moji'ko"), name = "Otho Moji'ko",
  bible = "bibles/revantusk.md", role = "vendor", tier = "quest",
  communities = { "revantusk" }, temper = { "spiteful" }, values = { "proud", "loyal" },
  notices = { "race" },

  impression = {
    first = "Otho Moji'ko sells cooking supplies and dreams of terrifying Aerie Peak. He spits when he says the word Wildhammer, and he says it often.",
    third = "{name} met Otho Moji'ko, the Revantusk cook's supplier who wants to send the Wildhammer a message.",
  },

  greetings = {
    { id = "o_wildhammer_war", tags = { "news" }, when = { gossip = { topic = "wildhammer", stance = "war" } },
      text = "The Primal says you told her to hit Aerie Peak, mon! Finally, somebody with sense, and Otho don't say that often, so enjoy it." },
    { id = "o_wildhammer_parley", tags = { "news" }, when = { gossip = { topic = "wildhammer", stance = "parley" } },
      text = "Talk to the dwarves, you said to the Primal? Otho heard. Otho will talk to them too, mon, right after the arrow." },
    { id = "g_default", text = "You hungry, mon, or you lookin' for trouble? I sell for the first and I got plans for the second." },
    { id = "g_back", when = { metBefore = true }, text = "There you be, mon. You ready to make some dwarves very unhappy?" },
    { id = "g_away", when = { away = 14 }, text = "There you be, mon, after {away} away. I kept the good fish on the side, and my plans for the dwarves be ready too." },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "I hear you scared somebody in the village half out of their tusks. Save some of that for the Wildhammer, mon." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = { "Orc", "Troll" } },
      text = "Good, a strong one. The dwarves at Aerie Peak gonna remember your face, mon, if you do what I ask." },
  },

  start = "hello",
  nodes = {
    opn_revenge = {
      lines = {
        { id = "opn_revenge_q", text = "More gryphons, less gryphons, they come either way, mon. Otho wants them to come scared. The Primal got her mind on her mate in that cage, so Otho asks you plain: do the Revantusk hit back or not?" },
      },
      choices = {
        { text = "Hit back. A tribe that won't bleed its enemies dies.", next = "opn_revenge_r_strike", fx = { affinity = 2, align = { light = -1 }, opinion = { hl_revenge = "strike" } } },
        { text = "Not yet. Your tribe is too small for two wars.", next = "opn_revenge_r_wait", fx = { trait = { practical = 1 }, opinion = { hl_revenge = "wait" } } },
        { text = "Revenge only feeds itself. Break the circle, Otho.", next = "opn_revenge_r_stop", fx = { affinity = -2, align = { light = 1 }, opinion = { hl_revenge = "stop" } } },
        { text = "Never mind.", next = "BACK" },
      },
    },
    opn_revenge_r = {
      lines = {
        { id = "opn_revenge_r_default", text = "Then go away and think, mon, and think faster." },
      },
      choices = {
        { text = "Something else, Otho.", next = "BACK" },
      },
    },
    opn_revenge_r_strike = {
      lines = {
        { id = "opn_revenge_r_strike", text = "Now that be talk Otho understands. Come back when you ready, and we start with the elves at Quel'Danil, the dwarves' friends." },
      },
      choices = {
        { text = "Something else, Otho.", next = "BACK" },
      },
    },
    opn_revenge_r_wait = {
      lines = {
        { id = "opn_revenge_r_wait", text = "Too small. Otho hears that every day, mon, and every day the tribe stays small, 'cause nobody let it grow teeth." },
      },
      choices = {
        { text = "Something else, Otho.", next = "BACK" },
      },
    },
    opn_revenge_r_stop = {
      lines = {
        { id = "opn_revenge_r_stop", text = "Circle? You sound like the Mystic. Otho don't break circles; Otho breaks gryphons." },
      },
      choices = {
        { text = "Something else, Otho.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Frighten them? Mon, they'd fall off their gryphons! They think the Light be on their side by right, and a Forsaken carryin' it would make them wonder whose side it be on, and that be the best message Otho could ever send." } },
      choices = {
        { text = "The Light isn't a weapon for frightening dwarves, Otho.", next = "BACK", reply = "No, mon, but it be fun, and Otho don't get much fun these days.", fx = { align = { light = 1 } } },
        { text = "Let's send that message, then. I'd love to see their faces.", next = "BACK", reply = "Ha! Otho knew you be a good one, mon. Dey'll fall off their birds laughin' at themselves.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The gryphons carry the Wildhammer who kill my people, so I don't weep for them. But you, a druid, you be lookin' at me like I just said somethin' wicked, and maybe I did." } },
      choices = {
        { text = "Leave the gryphons out of it. They didn't choose this.", next = "BACK", reply = "Maybe dey didn't, mon, but dey carry de hammers. Otho will think on it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Strike where it hurts them most. That's war.", next = "BACK", reply = "Ya, dat be war, mon, and de Wildhammer know it better dan anybody.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not a whole war, mon, just a fright, because their riders fly over our village and throw hammers at anything with tusks. One warrior standin' at their gate would tell them the Revantusk got friends now, and Otho like that thought very much." } },
      choices = {
        { text = "A warrior fights in the open. I won't scare people for sport.", next = "BACK", reply = "Sport, mon? Otho not do it for sport, Otho do it so dey stop throwin' hammers. But fine, fine.", fx = { align = { honor = 1 } } },
        { text = "Fear works. I'd do it, if the price is right.", next = "BACK", reply = "Ya, Otho pay what he can, mon, and de fright be worth every copper.", fx = { align = { honor = -1 } } },
        { text = "Something else, Otho.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Want, mon, want very much, but the Primal say no, because the Revantusk got enough enemies without startin' on the birds. So Otho just dream about it and cook wolf instead, which be almost as satisfyin'." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Want, mon, want very much, but the Primal say no, so Otho just dream about it and cook wolf instead. {pet} want a bite of it? A beast that hunt beside a friend of the Revantusk be welcome at this table." },
      },
      choices = {
        { text = "The Primal is right. The gryphons aren't our enemy.", next = "BACK", reply = "De Primal always right, mon, dat be de trouble with her. Otho will listen.", fx = { align = { light = 1 } } },
        { text = "A dwarf's bird is fair game. I'd take one down.", next = "BACK", reply = "Ya, Otho would too, mon. But don't tell de Primal Otho said so.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They got the high elves of Quel'Danil now, mon, and elves always got magic up their sleeves. That be why Otho want the elves gone first, because a dwarf alone be just a dwarf, but a dwarf with an elf friend be trouble." } },
      choices = {
        { text = "I'll fight the elves fairly, not leave bodies as messages.", next = "BACK", reply = "Fair, mon, and honourable, and Otho respect it. De elves won't, though.", fx = { align = { honor = 1 } } },
        { text = "Then I'll leave the elves where the dwarves will find them.", next = "BACK", reply = "Ya, dat be de message, mon, loud and clear. Otho like how you think.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I set anything I can against the Wildhammer, mon, and the spirits would be the best weapon of all. Them dwarves claim the storms favor them and their birds, and it would please me very much to see the storms pick a side." } },
      choices = {
        { text = "The spirits won't serve a grudge, Otho. They answer to balance.", next = "BACK", reply = "Balance, ya, and maybe dat be why dey never answer Otho. He think on it.", fx = { align = { honor = 1 } } },
        { text = "Then I'll call the storm down on them, and gladly.", next = "BACK", reply = "Ha! A storm on de dwarves, mon! Otho will watch from de beach.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, mon! Someday you call the storm down on Aerie Peak, and we see how them dwarves like the lightning on their gryphons." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest, mon! You pray to the loa for me, eh, and ask them to send the Wildhammer a bad dream every night this week." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage, mon! I seen what fire do to feathers, and I think them gryphons at Aerie Peak would make a very fine bonfire." },
        { id = "h_default", key = true,
          text = "Otho Moji'ko. I sell the spices and the salt and the things a cook can't do without, but what I really want be sendin' the Wildhammer a message they never forget." },
        { id = "h_elves", when = { questActive = TODO_QUEST("Message to the Wildhammer") },
          text = "The Wildhammer be makin' friends with the high elves at Quel'Danil Lodge. You go up there and leave the elves where the dwarves will find them, mon." },
        { id = "h_feathers", when = { questActive = TODO_QUEST("Another Message to the Wildhammer") },
          text = "Gryphon feathers, mon, as many as you can pull. The dwarves love their birds like a troll loves his mate, and that be exactly why we use them." },
        { id = "h_spear", tags = { "news" }, when = { questActive = TODO_QUEST("The Final Message to the Wildhammer") },
          text = "You got the spear, mon. Plant it by the well in the middle of Aerie Peak, drive it deep, and then run, because they gonna be very, very angry." },
        { id = "h_spear_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("The Final Message to the Wildhammer"), days = 3 } },
          text = "I wish I coulda seen their faces, mon! Tell me again how loud the Thane yelled, and don't leave nothin' out." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock! You could curse the Wildhammer's ale so it taste of ash for a month, {class}, and Otho would laugh about it until the day he die." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You got the look of somebody who could walk into Aerie Peak and out again with no dwarf ever the wiser, mon, and Otho like that look very much." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon! You look like you could walk up to Aerie Peak and knock on the thane's door, and Otho would pay to see the dwarf's face when he open it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, mon. You bring Otho meat and Otho cook it, and if you bring Otho a gryphon feather, Otho cook it twice for spite." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid! You can call the beasts, I be thinkin', so maybe you can call a gryphon down from Aerie Peak and let Otho give it a message." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, mon! The dwarves at Aerie Peak think the Light belong to the Alliance, so imagine their faces when a dead one come down the mountain shinin'." },
      },
      again = {
        { id = "h_again", text = "What else you need, mon? Talk fast now." },
        { id = "h_again2", text = "Go on. I be thinkin' up the next message anyway." },
      },
      choices = {
        { text = "Would you set the spirits against the Wildhammer, Otho?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the Wildhammer have magic on their side, Otho?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "You seem to hate the Wildhammer.", next = "dwarves" },
        { text = "What kind of message?", next = "message" },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "I've been to Aerie Peak. They're tough.", next = "peak", when = { questDone = TODO_QUEST("The Final Message to the Wildhammer") } },
        { text = "The Darkspear have their own grudges, Otho.", next = "troll", when = { race = "Troll" } },
        { text = "Is your hatred of the Wildhammer worth a curse, Otho?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What would you want done at Aerie Peak, Otho?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "You'd send a warrior against Aerie Peak, Otho.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do you really want me to hunt a gryphon, Otho?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Should the Wildhammer's gryphons be harmed for revenge?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "A Forsaken paladin would frighten the Wildhammer, Otho.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today, Otho.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Nothin' that bleed, not yet, just somethin' they wake up to find. A Revantusk mark painted on the thane's own door, maybe, so every Wildhammer know a troll been inside and they never even smell him." } },
      choices = {
        { text = "Fear without blood is a clever message. I like it.", next = "BACK", reply = "Ya, clever, mon, and nobody die. Otho thought of it himself, you know.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If I go that far, I won't leave only paint.", next = "BACK", reply = "Paint first, mon, blood later, if dey don't take de hint. Otho not in a hurry.", fx = { align = { light = -1 } } },
        { text = "Maybe later. Let's talk about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Their riders hunt trolls from the sky like we be rabbits, mon, and they never ask which tribe they shootin' at. So yes, a little curse, a little fear, and maybe they think twice before the next one fly over this coast." } },
      choices = {
        { text = "Curses breed curses. I won't start a feud.", next = "BACK", reply = "Ya, dat be wise, mon, and de Primal would say de same. Otho not sure he agree.", fx = { align = { light = 1 } } },
        { text = "They earned it. I'll curse anyone who sneers at the Horde.", next = "BACK", reply = "Ha! Den you and Otho be friends, mon. Curse away.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Let's speak of spices instead.", next = "BACK" },
      },
    },
    dwarves = {
      lines = { { id = "d_default", text = "They hunt us from the sky, mon, on beasts they teach to kill trolls. They don't care if we be Revantusk or Vilebranch; to them a troll be a troll, and that be all the reason I need." } },
      choices = {
        { text = "Do the dwarves have friends out here?", next = "dwarves_elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarves_elves = {
      lines = { { id = "de_default", text = "The Highvale elves at Quel'Danil, old friends of the dwarves. Elves and trolls been killin' each other since before the dwarves crawled out of their mountains, so it be no surprise to me who they side with." } },
      choices = {
        { text = "Hitting back only brings more gryphons, Otho.", next = "opn_revenge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    message = {
      big = true,
      lines = { { id = "m_default", text = "First the elves, so they know their friends can't protect them. Then the gryphons, so they know their birds can't protect themselves. Then a spear in the middle of their town, so they know nothin' can." } },
      choices = {
        { text = "Fear is a weapon, Otho. I'll carry it.", next = "message_go", fx = { align = { honor = -1 } } },
        { text = "I'd rather fight their warriors face to face.", next = "message_go", fx = { align = { honor = 1 } } },
        { text = "I doubt the Primal approves.", next = "message_primal" },
      },
    },
    message_go = {
      lines = { { id = "mg_default", text = "Either way they bleed, mon, and either way they remember. Come back when you ready to start." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    message_primal = {
      lines = { { id = "mp_default", text = "The Primal got her mind on her mate, and she don't stop me. That be as good as yes in Revantusk, mon." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    peak = {
      lines = { { id = "pk_default", text = "Tough, sure, but tough don't mean watchful, mon. Once they learn a troll can walk right into the middle of their town, they gonna sleep a little worse every night." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { revantusk = 1 } } } },
    },
    troll = {
      lines = { { id = "tr_default", text = "Everybody got grudges, mon, but the Darkspear keep theirs on the islands. Mine be right up the hill, with gryphons on it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know cookin' and I know grudges, mon. Ask about either." } },
    background = { { id = "tp_bg", text = "Revantusk all my life, mon, and angry at the dwarves for most of it.", next = "dwarves" } },
    advice = { { id = "tp_ad", text = "Salt your meat and watch the sky, mon. De gryphons love a troll who don't look up." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer are pests, and I'll terrify Aerie Peak one day, mark my words. They'll scream when they see what I've got planned." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear are our cousins, and they've never once tried to steal my cooking. The Wildhammer came sniffing round my pot the first week we pitched camp." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The Gurubashi have woken their blood god, and they're spreading his madness. I'll not cook for any troll who serves him." } },
    _none = { { id = "tp_none", text = "That don't cook and it don't scare dwarves, so I don't care, mon." } },
  },
}

P:NPC {
  key = "gorkas", id = TODO_NPC("Gorkas"), name = "Gorkas",
  bible = "bibles/revantusk.md", role = "flightmaster", tier = "service",
  communities = { "revantusk" }, temper = { "grumpy" }, values = { "patient" },
  notices = { "race" },

  impression = {
    first = "Gorkas is the wind rider master at Revantusk, and he spends more time fishing off the pier than tending his beasts. He's waiting for one particular grouper and doesn't care who knows it.",
    third = "{name} met Gorkas, the orc wind rider master at Revantusk, who fishes off the pier between flights.",
  },

  greetings = {
    { id = "g_default", text = "Quiet! You'll scare the fish, and an orc's patience is a short rope. Fine, what do you want, a wind rider?" },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still no grouper. Where are you flying today?" },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Tread soft on the pier, tauren. The boards are older than I am, and the fish feel every step." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Everything scares off my grouper, so I'd not single out the Light. Still, I've sat on this pier a long time, and I'd rather blame a paladin than admit I'm a poor fisherman, so do me the kindness of standing further down." } },
      choices = {
        { text = "I'll stand further down, Gorkas. Good fishing.", next = "BACK", reply = "Good fishing to you too, and thank you. The grouper will thank you as well, by staying near.", fx = { align = { order = 1 } } },
        { text = "The pier's as much mine as yours, Gorkas.", next = "BACK", reply = "It is, aye, and you're welcome to it, so long as you're quiet. Grouper don't like company.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Take it and mount it on my wall, aye, and then everyone in Revantusk will know who caught it. The sea has plenty of grouper, and she won't miss one, even a big one." } },
      choices = {
        { text = "Catch it. Pride's a fine reason to fish.", next = "BACK", reply = "Aye, it is, and every orc in Revantusk will hear about it for a year. I'll catch it yet.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let it live. The old ones keep the sea strong.", next = "BACK", reply = "You sound like Katoom, and maybe you're both right. I'll let it go if I ever catch it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Today, maybe, warrior, because that fish has been laughing at me for three seasons. The wind riders don't mind waiting, and a warrior who waits a little arrives less angry and fights better, so everybody wins." } },
      choices = {
        { text = "Duty comes first, Gorkas. The fish can wait.", next = "BACK", reply = "Aye, duty first, and the wind riders won't let me forget it. The fish can wait another season.", fx = { align = { order = 1 } } },
        { text = "Take your time. A man needs something of his own.", next = "BACK", reply = "Aye, a man does, and this fish is mine. Thank you for understanding.", fx = { align = { order = -1 } } },
        { text = "Something else, Gorkas.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I've tried baiting it, tricking it and begging it, everything but a spear, and a spear would be cheating. A hunter understands that some prey you take with honor or you don't take at all." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I've tried baiting it, tricking it and begging it, everything but a spear, and a spear would be cheating. And keep {pet} off the pier, hunter, because the last beast that jumped in scared off every grouper on the coast." },
      },
      choices = {
        { text = "You're right. Catch it fairly or not at all.", next = "BACK", reply = "Fair or not at all, aye, and I've sworn it on my grandfather's spear. I'll keep trying.", fx = { align = { honor = 1 } } },
        { text = "Just use the spear. A catch is a catch.", next = "BACK", reply = "Cheaper, aye, but I'd never forgive myself. The spear stays on the wall.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Every time we fly west past Aerie Peak, though the riders keep high and the gryphons don't like the cold up there. A spellcaster riding with us makes the dwarves think twice, because they're happy to shoot at a wind rider but they don't like being shot back at." } },
      choices = {
        { text = "I'll fly escort, and fight only if they strike first.", next = "BACK", reply = "Good. The Wildhammer patrols watch for a rider who turns toward them, so keep your beast's head pointed down the coast and they'll mostly let you be.", fx = { align = { honor = 1 } } },
        { text = "I'll knock a few gryphons down before they get the chance.", next = "BACK", reply = "Then you'll start a war over the Hinterlands, and the Primal will have your head. Mind yourself.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If they mind, they've a funny way of showing it, because they keep the waves calm off this pier and send me nothing but small fry. I think that grouper has a spirit of its own, and it's the stubbornest one on the coast." } },
      choices = {
        { text = "Be patient and respectful, and the sea will reward you.", next = "BACK", reply = "They do, aye, and I'll keep waiting. I've had a bite from her twice this spring, and the second time she took my best hook with her.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Forget patience. Net the whole cove and be done with it.", next = "BACK", reply = "Net the cove, and the sea would net you back, I think. I'll stick with the line.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman. Don't suppose you could ask the sea to send that grouper my way? I've tried asking nicely and it hasn't worked." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. Say a prayer for my line while you're here, would you? It doesn't matter to whom, so long as the grouper hears it." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock. Keep the demon off the pier, please, because the wind riders can smell it, and so can the fish, I'll swear." },
        { id = "h_default", key = true,
          text = "I'm Gorkas, wind rider master for the Horde. The beasts fly to Tarren Mill, Hammerfall and the Undercity, and in between flights I fish off this pier until I catch the biggest grouper on the coast." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Wind riders sleep, the trolls sleep, and the grouper is somewhere out there laughing at me. Where do you need to go?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage, eh? Don't you dare freeze my pier, {class}, because that grouper is down there somewhere and I want him fair and square." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You sneak up on an orc fishin', you get a hook in the ear, {class}. Sit down, and keep your shadow off the water." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and you want to fly somewhere and hit something, I'd wager. Lok'tar, but wait till I finish this cast, because the grouper is close today, and I can feel it in the line." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! Maybe you know something about grouper, because I've been hunting one for three seasons and it's still laughing at me." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid. Can you speak with the fish, by chance? I want to ask the grouper where it's been hiding." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken. The wind riders won't care what you are, though I'd thank you not to glow on my pier, because the grouper are skittish enough as it is." },
        { id = "h_dd_falling", when = { deathCause = "falling" },
          text = "You fell off a cliff, didn't you? There's a lot of them in the Hinterlands, and my wind riders would have carried you past every one for a few coins." },
      },
      again = {
        { id = "h_again", text = "Anything else? Be quick; the line's twitching." },
        { id = "h_again2", text = "Speak up, but quietly." },
      },
      choices = {
        { text = "Do the sea spirits mind you fishing between flights, Gorkas?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the Wildhammer gryphons trouble your wind riders, Gorkas?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "I've not heard of this grouper.", next = "grouper" },
        { text = "The wind riders seem at home on this coast.", next = "riders" },
        { text = "I could just teleport home and skip your wind riders.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the wind riders bring you any interesting news?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Is the grouper more important than my flight, Gorkas?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Have you tried baiting your grouper, Gorkas?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Should we take the biggest grouper on the coast?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do you think the Light scares off your grouper, Gorkas?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye, Gorkas.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every rider brings a bag and a mouth, and the mouth is worth more. I hear what Hammerfall worries about before Drum Fel does, and what the Undercity whispers before the Dark Lady hears it, and I keep it all behind my tusks, mostly." } },
      choices = {
        { text = "Keep it behind your teeth. Loose talk gets riders killed.", next = "BACK", reply = "It does, and I keep it there. The riders tell me where they're flying because they know it won't reach Aerie Peak.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "News like that should be sold, Gorkas.", next = "BACK", reply = "Sold to whom? The Alliance? You'd have every rider in Revantusk after you. It stays with me.", fx = { align = { honor = -1 } } },
        { text = "Fine, then. Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "And you'd miss the coast, the Highlands and the Undercity's towers from above, all for the sake of an hour. Teleport if you like, but you'll never know what the world looks like, and you'll never see my grouper." } },
      choices = {
        { text = "You're right. Some roads should be taken slowly.", next = "BACK", reply = "They should, aye, and the wind riders agree with you. Fly with us once, and you'll see.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "There's no shame in the quick way.", next = "BACK", reply = "No shame, no, but no view either. I'll take the long way, every time.", fx = { align = { order = -1 } } },
        { text = "Good luck with the grouper. Something else.", next = "BACK" },
      },
    },
    grouper = {
      lines = { { id = "gp_default", text = "A monster of a fish that's broken every line I own. Katoom says I use the wrong bait, but Katoom says that about everyone, so I stopped listening." } },
      choices = {
        { text = "Maybe Katoom is right.", next = "grouper_katoom", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grouper_katoom = {
      lines = { { id = "gk_default", text = "Maybe he is, but I'll catch it my way or not at all. An orc has to have something he's stubborn about, and mine is a fish." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    riders = {
      lines = { { id = "r_default", text = "They hate the gryphons, and the gryphons hate them, so I keep them low along the coast till they're well past Aerie Peak. The salt doesn't bother them, but the dwarves do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Routes, winds and fish. Ask me about one of those." } },
    background = { { id = "tp_bg", text = "Orgrimmar sent me to keep the wind riders. Nobody said I couldn't fish." } },
    advice = { { id = "tp_ad", text = "Don't fly over Aerie Peak. The dwarves shoot first and ask about your business never." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay has the best fishing in the world, they say, and I'd go there if I didn't have wind riders to tend. I'm waiting for a grouper here, and I'll not leave till I catch it." } },
    thrall = { { id = "tp_thrall", text = "The Warchief rides a wolf, not a wind rider, and I've never held it against him. I'd like to see him fish, though, since a leader who can wait on a grouper can wait out anything." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer gryphons are fine beasts, I'll admit it, but my wind riders turn sharper in a crosswind. I'd not say that on their side of the hills, mind." } },
    _none = { { id = "tp_none", text = "No idea. Let an old grunt fish in peace, would you?" } },
  },
}
