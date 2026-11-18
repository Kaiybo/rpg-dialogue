-- Sen'jin Village, the rest of the shore: Master Vornal (the half-blind alchemist who takes no apprentices),
-- Vel'rin Fang (the village's hide-man) and Ula'elek (the smith who makes brutal gauntlets for warriors).
-- Voice: bibles/senjin_folk.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Master Vornal
---------------------------------------------------------------------------
P:NPC {
  key = "vornal", id = TODO_NPC("Master Vornal"), name = "Master Vornal",
  bible = "bibles/senjin_folk.md", role = "questgiver", tier = "quest",
  communities = { "senjin" }, temper = { "proud", "dry" }, values = { "wise", "devout" },
  notices = { "race", "craft", "class" },

  impression = {
    first = "He fought beside Sen'jin once, and now his eyes are failing him.",
    third = "{name} met Master Vornal, the old Darkspear alchemist of Sen'jin Village who has never found a student worth teaching.",
  },

  greetings = {
    { id = "g_default", text = "Come closer, so old Vornal can see what the tide wash in today. Closer, mon, my eyes be older than the rest of me." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, I know that shape. You be the one who keep comin' back, which be more than most of the young ones manage." },
    { id = "g_solvent", when = { questActive = TODO_QUEST("A Solvent Spirit") }, text = "I still need the makrura eyes and the crawler mucus, mon. They be on the beaches, not in my hut, so why you be standin' here?" },
    { id = "g_away", when = { away = 14 }, text = "You been gone {away}, and Vornal thought maybe the crawlers got you. Good, good, they did not." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word come along the shore that you tell a lie and get caught at it. A bad liar be worse than a liar, mon, so either stop or practise." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, standin' straight and fed. When we come off the boats, the children be all ribs, so you make an old man glad just by lookin' healthy." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You smell of the still, mon, of earthroot and old glass. Do not think that make you my apprentice, but it make you worth talkin' to." },
  },

  start = "hello",
  nodes = {
    dd_zalazane = {
      lines = {
        { id = "dd_zl_default", text = "I knew him as a clever boy who learned faster than the rest, and Gadrin loved him for it. Cleverness without patience be a sickness, though, and Zalazane wanted the loa's power before the loa wanted him. Do you feel sorry for him, now that he be dead?" },
      },
      choices = {
        { text = "No. He hexed his own people. He earned that end.", next = "BACK", reply = "He did, and the Darkspear will sleep easier for it. I only wish the hexed ones could wake up as easy as he died.", fx = { align = { light = -1 } } },
        { text = "A little. He was someone's student once.", next = "BACK", reply = "You have a kind heart, and Gadrin would thank you for it, though he never say so. Keep it, because this world takes kindness off people quick.", fx = { align = { light = 1 } } },
        { text = "Something else, Master Vornal.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_zalazane", tags = { "news" }, when = { questDone = TODO_QUEST("Zalazane") },
          text = "Gadrin say you went to the Echo Isles and brought back Zalazane's head, and my old hands shook when I heard it. I fought beside Sen'jin the day the madness started, and I never think I live to see it answered." },
        { id = "h_default", key = true,
          text = "I be Vornal, and once I fight beside Sen'jin himself, before the sea witch and the humans and all the rest. Now my eyes be failin', so I lean on the alchemy for what the magic used to give me easy." },
        { id = "h_solvent_done", when = { questDone = TODO_QUEST("A Solvent Spirit") },
          text = "The tincture you help me make be workin', mon, and I can see the edge of the isles again on a clear morning. I do not see Zalazane on them, but I know he be there." },
        { id = "h_idols", when = { questActive = TODO_QUEST("Forgotten Loa Idols") },
          text = "The idols, mon, the loa idols we leave behind when we flee. Take them to Master Gadrin when you find them, because the loa be watchin' how we treat their faces." },
        { id = "h_paljuh", when = { questDone = TODO_QUEST("Lost in the Shadows") },
          text = "You bring the young huntress Pal'juh home from Kolkar Crag, and she come in here sulkin' like a scolded cub. She be a good hunter, but she act more like a raptor than a tiger, and raptors run into things." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A child of the tribe, come to see old Vornal. Sit, but do not touch the green bottles, because the last young one who touch them be blue for a week." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc, come down from Razor Hill to the troll shore. Thrall's people keep their word to us, so Vornal keep his manners for you." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Speak up, the surf be loud and my ears be nearly as old as my eyes." },
        { id = "h_again2", text = "Ask, ask. Vornal have more time than he have students." },
      },
      choices = {
        { text = "You knew Zalazane before the madness, didn't you?", next = "dd_zalazane", when = { questDone = TODO_QUEST("Zalazane") } },
        { text = "Why won't you take an apprentice?", next = "apprentice" },
        { text = "You fought beside Sen'jin?", next = "senjin" },
        { text = "What do you need from the beaches?", next = "solvent" },
        { text = "Tell me about the loa idols.", next = "idols", when = { minLevel = 7 } },
        { text = "I brew potions too, Master Vornal.", next = "xalch", when = { profession = "Alchemy" } },
        { text = "The spirits answer me as they once answered you.", next = "xshaman", when = { class = { "SHAMAN", "PRIEST" } } },
        { text = "I'll leave you to your bottles.", next = "END" },
      },
    },

    apprentice = {
      big = true,
      lines = { { id = "ap_default", text = "Because no troll or orc worthy enough ever come forward, mon. They come for the potions and leave when the stirrin' get boring, and the stirrin' be the whole of it. Patience be the first ingredient, and nobody bring it." } },
      choices = {
        { text = "Then you'll die with everything you know.", next = "ap_die" },
        { text = "A master should teach whoever comes. That's the duty.", next = "ap_die", fx = { align = { order = 1 } } },
        { text = "Good. Knowledge should go only to those who earn it.", next = "ap_die", fx = { align = { order = -1 } } },
      },
    },
    ap_die = {
      lines = { { id = "apd_default", text = "Maybe so. Gadrin teach two boys with the spark, and one of them be Vol'jin and the other be Zalazane, so you tell me if teachin' everybody be so wise. Vornal would rather the knowledge die than see it walk off to the Echo Isles in a hexed troll's pocket." } },
      choices = {
        { text = "Zalazane learned from Gadrin?", next = "ap_zal", fx = { learn = { "echo_isles" } } },
        { text = "Something else, Master.", next = "BACK" },
      },
    },
    ap_zal = {
      lines = { { id = "apz_default", text = "He did, and Gadrin carry it like a stone in his belly. So when you ask why old Vornal be choosy, remember that the worst thing on those islands once sat by a good teacher's fire and stirred the pot very nicely." } },
      choices = {
        { text = "That's a hard lesson.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "One bad student shouldn't damn the rest.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },

    senjin = {
      lines = { { id = "sj_default", text = "I fight beside him on the islands when the murlocs come, and the humans after, and I be standin' near when the sea witch's men take him. Thrall save the rest of us, but nobody save Sen'jin, and that be the debt the Darkspear pay the Horde for." } },
      choices = {
        { text = "What was Sen'jin like?", next = "sj_man" },
        { text = "Do you miss the islands?", next = "sj_isles" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sj_man = {
      lines = { { id = "sjm_default", text = "He laugh loud and he decide slow, mon, which be the right way round for a chief. He see the boy Vol'jin was clever and tell him so in front of everyone, and Vol'jin never forget it." } },
      choices = {
        { text = "Vol'jin seems to have earned it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sj_isles = {
      lines = { { id = "sji_default", text = "Every morning, mon, which be why I sit facin' the water. The tinctures help me see them again, and seein' them be a kind of medicine and a kind of poison both." } },
      choices = {
        { text = "Then let's take them back someday.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    solvent = {
      lines = {
        { id = "so_default", text = "Intact makrura eyes and crawler mucus, mon, from the clacking things along the shore. The eyes be the tricky part, because you crack one shell wrong and the eye be jelly on your boots." },
        { id = "so_done", when = { questDone = TODO_QUEST("A Solvent Spirit") }, text = "You already bring them, mon, and the tincture be doin' its work. I still want more mucus someday, because an old man go through it faster than he would like to admit." },
      },
      choices = {
        { text = "What does the tincture do?", next = "so_tinct" },
        { text = "Are you testing me, Vornal?", next = "so_test" },
        { text = "Something else.", next = "BACK" },
      },
    },
    so_tinct = {
      lines = { { id = "sot_default", text = "It clear the clouds off my eyes for a few hours, mon, long enough to read a label and not poison myself. The old magic would do it with a word, but the old magic be gettin' harder to call, so I cheat with a bottle." } },
      choices = {
        { text = "There's no shame in a bottle.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    so_test = {
      lines = { { id = "sote_default", text = "Everybody who walk in here be tested, mon, so do not take it personal. You think you be worthy, and of course you do, so go and fetch the eyes and we see whose opinion be right." } },
      choices = {
        { text = "Then I'll prove it.", next = "BACK", fx = { trait = { proud = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    idols = {
      big = true,
      lines = { { id = "id_default", text = "When we flee the isles, we leave the loa idols behind, and Zalazane's people scatter them in the sand like old bones. Offendin' a loa be a grave thing, mon, and the tribe cannot afford a loa who turn its face away." } },
      choices = {
        { text = "I'll bring every one back with respect.", next = "id_more", fx = { align = { light = 1 } } },
        { text = "Idols are wood and stone. The fighting matters more.", next = "id_more", fx = { align = { light = -1 } } },
        { text = "Which loa are they?", next = "id_more" },
      },
    },
    id_more = {
      lines = { { id = "idm_default", text = "Many faces, mon, some for the hunt and some for the sea and some Vornal will not name on a windy day. Take them to Gadrin, not to me, because he know which hut each one belong in and I would only squint at them." } },
      choices = {
        { text = "I'll take them to Gadrin.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    xalch = {
      lines = { { id = "xal_default", text = "Everybody brew potions, mon, and most of them brew them badly. Tell me, when the earthroot go in, do you crush it or slice it?" } },
      choices = {
        { text = "I slice it, so the juice stays in.", next = "xalch2", fx = { trait = { patient = 1 } } },
        { text = "I crush it. It's faster that way.", next = "xalch2", fx = { trait = { practical = 1 } } },
      },
    },
    xalch2 = {
      lines = { { id = "xal2_default", text = "Hmph. Either way be wrong if you do it in a hurry, and right if you do it with attention, and that be the only secret worth payin' for. Do not tell anyone Vornal give it to you for free." } },
      choices = { { text = "Your secret's safe, Master.", next = "BACK", fx = { affinity = 1 } } },
    },
    xshaman = {
      big = true,
      lines = { { id = "xsh_default", text = "Then be careful with them, mon, because the spirits that answer easy when you be young get quiet when you be old. Vornal spend his youth shoutin' at them, and now he must whisper and they hardly hear." } },
      choices = {
        { text = "I'll honor them now, so they stay close.", next = "BACK", reply = "Good, mon, because they remember the ones who honor them young. Vornal wish he heard that advice when he had ears for it.", fx = { align = { light = 1 } } },
        { text = "I'll use their power while it's mine to use.", next = "BACK", reply = "Use it while you can, then, and see if they still answer when you be old. Vornal used to think the same, mon.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know alchemy, old wars, and which crawler on the beach be the fattest. Ask, mon." } },
    background = { { id = "tp_bg", text = "I fight beside Sen'jin, I come off the boats with Vol'jin, and now I stir pots. That be the whole life, mon.", next = "senjin" } },
    advice = { { id = "tp_ad", text = "Never taste a potion to see if it be done. Smell it, and if you still not sure, let somebody else taste it." } },
    echo_isles = { { id = "tp_echo", text = "The Echo Isles be our home, mon, and Zalazane's prison for our people now. I look at them every morning." } },
    _none = { { id = "tp_none", text = "Vornal cannot see that one clearly, mon, with his eyes or his mind." } },
  },
}

---------------------------------------------------------------------------
-- Vel'rin Fang
---------------------------------------------------------------------------
P:NPC {
  key = "velrin", id = TODO_NPC("Vel'rin Fang"), name = "Vel'rin Fang",
  bible = "bibles/senjin_folk.md", role = "questgiver", tier = "quest",
  communities = { "senjin" }, temper = { "steady" }, values = { "practical", "dutiful" },
  notices = { "class", "craft" },

  impression = {
    first = "He hunts what he needs and leaves the rest to breed.",
    third = "{name} met Vel'rin Fang, who supplies Sen'jin Village with furs and hides from the beasts of southern Durotar.",
  },

  greetings = {
    { id = "g_default", text = "Mind the drying racks, mon. The hides be wet and the flies be hungry." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. You bring me furs, or you bring me questions?" },
    { id = "g_prey", when = { questActive = TODO_QUEST("Practical Prey") }, text = "The tigers be on the islands south of here, mon. Bring me four good furs, not shredded ones." },
    { id = "g_away", when = { away = 14 }, text = "You be gone {away}, mon, and the racks fill up and empty again while you be away." },
  },

  notice = {
    { id = "n_skin", cat = "craft", when = { profession = { "Skinning", "Leatherworking" } },
      text = "You got a skinner's thumbs, mon, all nicks and calluses. Good, you know a hide be work and not just loot." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, with a beast at heel. You know already that the land give only so much before it stop givin'." },
  },

  start = "hello",
  nodes = {
    dd_raptors = {
      lines = {
        { id = "dd_rp_default", text = "They are, and that be good for the caravans, but a hunter should keep his eye on the balance. Kill all the raptors and the boars run wild, and then Torka at Razor Hill complain the boars be eating his cactus." },
      },
      choices = {
        { text = "Better boars on the road than raptors at the gate.", next = "BACK", reply = "True enough, mon, a boar never take a child off the beach. I just say it so you know the land keeps its own books.", fx = { align = { order = -1 } } },
        { text = "I'll take only what Sen'jin needs, then.", next = "BACK", reply = "Then you hunt the way my father taught me, and the spirits of the beasts will not hold it against you. Go well.", fx = { align = { order = 1 } } },
        { text = "Something else, Vel'rin.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_bloodtalon", when = { killed = { name = "Bloodtalon", min = 20 } },
          text = "The raptors on the north road be thinner since you came through, and the scythemaws be smarter about it, too. You hunt like a Darkspear, mon, which be the best thing I know how to say about anyone." },
        { id = "h_default", key = true,
          text = "I be Vel'rin Fang, and I make sure Sen'jin be supplied with what the local beasts can give: hides for tents, furs for blankets, leather for armor. It be an honorable role, though the flies do not think so." },
        { id = "h_prey_done", when = { questDone = TODO_QUEST("Practical Prey") },
          text = "The furs you bring be on three bedrolls and a tent now, mon. When the wind turn cold off the sea, somebody sleep warm because of you." },
        { id = "h_leg_active", when = { questActive = TODO_QUEST("Legging It") },
          text = "The spiders on the north road need thinnin', mon, the creepers and the lurkers both. Do it, then tell Gar'Thok in Razor Hill the road be safer." },
        { id = "h_leg_done", when = { questDone = TODO_QUEST("Legging It") },
          text = "The peons be walkin' south again, mon, so the road be safer. Gar'Thok will never thank me, but I hear he say your name." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter come to see the hide-man. You and me, we take from the land, so we know it be a debt and not a gift." },
      },
      again = {
        { id = "h_again", text = "What else? The racks will wait a moment." },
        { id = "h_again2", text = "Ask, mon. My hands be busy, my mouth be free." },
      },
      choices = {
        { text = "The Bloodtalon raptors on the road are thinning out.", next = "dd_raptors", when = { killed = { name = "Bloodtalon", min = 20 } } },
        { text = "Why do you need tiger furs?", next = "prey" },
        { text = "What's wrong with the north road?", next = "road" },
        { text = "How do you know when to stop hunting?", next = "cull" },
        { text = "Who else works hides on this shore?", next = "others" },
        { text = "My {pet} could help you track tigers.", next = "xpet", when = { class = "HUNTER" } },
        { text = "I'll let you work.", next = "END" },
      },
    },

    prey = {
      lines = { { id = "pr_default", text = "Because the village grow, mon, and our needs grow faster than our stocks. Blankets, armor, tents, they all start as a tiger on the islands south of here, and right now there be more tigers than blankets." } },
      choices = {
        { text = "Which islands?", next = "prey_isles" },
        { text = "I'll bring you furs.", next = "BACK", fx = { standing = { senjin = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    prey_isles = {
      lines = { { id = "pri_default", text = "The little ones off the coast, mon, not the Echo Isles, because Zalazane's people do not care for visitors. The tigers swim across at low tide and come back fat, and nobody ever tell them which island be safe." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    road = {
      lines = { { id = "rd_default", text = "Spiders, mon, nestin' along the road to Razor Hill. We see fewer travelers comin' south these days, and the scorpids never be fun, but at least a scorpid do not wait for you in the bushes." } },
      choices = {
        { text = "I'll clear the road.", next = "road_more" },
        { text = "Why not send the village hunters?", next = "road_more" },
      },
    },
    road_more = {
      lines = { { id = "rdm_default", text = "Our hunters be on the islands or watchin' the Echo Isles, mon, and nobody can watch everything. Kill the creepers and lurkers on your way north, then tell Gar'Thok, because if the news come from me he think I be askin' him for something." } },
      choices = {
        { text = "You and Gar'Thok don't get along?", next = "road_garthok" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_garthok = {
      lines = { { id = "rdg_default", text = "We get along fine, mon, as long as we be standin' in different villages. He think trolls be soft because we laugh, and I think orcs be tired because they never do." } },
      choices = {
        { text = "Maybe you're both right.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    cull = {
      big = true,
      lines = { { id = "cu_default", text = "When the herd be thin, you stop, and when the herd be fat, you take. There be a great many reasons we hunt the tigers and a great many reasons we let them thrive, and a hunter who forget the second list soon have no first list." } },
      choices = {
        { text = "The land comes first. We take only what we need.", next = "cull_more", fx = { align = { order = 1 } } },
        { text = "The tribe comes first. If we need more, we take more.", next = "cull_more", fx = { align = { order = -1 } } },
        { text = "Who decides when the herd is thin?", next = "cull_more" },
      },
    },
    cull_more = {
      lines = { { id = "cum_default", text = "I do, mon, by countin' tracks at the waterholes every new moon, and Master Gadrin when I ask him. The orcs in the valley do not count, and the boars up there be gettin' thin because of it." } },
      choices = {
        { text = "That's careful work.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    others = {
      lines = { { id = "ot_default", text = "Master Vornal want crawler parts for his bottles, and Ula'elek want satyr hooves for his gauntlets, though he send warriors all the way to Ashenvale for them. Me, I want tigers, which be the most sensible want in the village." } },
      choices = {
        { text = "Satyr hooves, all the way from Ashenvale?", next = "ot_ula" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ot_ula = {
      lines = { { id = "otu_default", text = "Ula'elek say the hooves hold magic, mon, and I say they hold a bad smell. But the gauntlets he make be very fine, so maybe he be right and my nose be wrong." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xpet = {
      lines = { { id = "xp_default", text = "Your {pet} look keen, mon, but tigers smell a beast before they smell you. Keep it downwind and let it learn the islands slowly, and it will be the best tracker on the shore." } },
      choices = {
        { text = "Thank you, Vel'rin.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know hides, beasts, and how many of each the shore can spare, mon." } },
    background = { { id = "tp_bg", text = "I be a hunter on the isles before the isles go bad. Now I be the hide-man, and it be a better job than it sound." } },
    advice = { { id = "tp_ad", text = "Salt the hide the same day you take it, mon, or the flies take it from you." } },
    echo_isles = { { id = "tp_echo", text = "The tigers on the Echo Isles be the fattest, mon, and the only ones I never hunt, because Zalazane's people hunt hunters." } },
    _none = { { id = "tp_none", text = "That not have fur or hide, mon, so I not know it." } },
  },
}

---------------------------------------------------------------------------
-- Ula'elek
---------------------------------------------------------------------------
P:NPC {
  key = "ulaelek", id = TODO_NPC("Ula'elek"), name = "Ula'elek",
  bible = "bibles/senjin_folk.md", role = "blacksmith", tier = "quest",
  communities = { "senjin" }, temper = { "grave", "mystic" }, values = { "craft", "ancestors" },
  notices = { "class", "level" },

  impression = {
    first = "He works iron as if the spirits were leaning over his shoulder.",
    third = "{name} met Ula'elek, the Darkspear smith of Sen'jin who forges brutal gauntlets for proven warriors of the Horde.",
  },

  greetings = {
    { id = "g_default", text = "The spirits say somebody come to the forge today. They do not say who, so I be glad it be you." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. The anvil remember your face, even if I pretend I do not." },
    { id = "g_hooves", when = { questActive = TODO_QUEST("Satyr Hooves") }, text = "The hooves, warrior, the swollen ones from northeastern Ashenvale. The satyrs will not give them up easy, so do not ask them nicely." },
    { id = "g_away", when = { away = 30 }, text = "You be gone {away}, and the spirits tell me many foes fall before you in that time. They gossip, mon." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR", minLevel = 30 },
      text = "Old Thun'grim's mark be on you, warrior, in how you stand and how you check the doorway. You be the kind he send to me." },
    { id = "n_young", cat = "level", when = { maxLevel = 15 },
      text = "Young one, the gauntlets I make be for warriors who already walk a long road. Come back when your hands be harder." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_dd_kolkar", tags = { "news" }, when = { questDone = TODO_QUEST("Thwarting Kolkar Aggression") },
          text = "Lar Prowltusk say the Kolkar plans burned, and that you be the one who carried the torch. I been forging spearheads for a centaur raid for weeks, so maybe now I can make something with a little more art in it." },
        { id = "h_dd_kultiras", when = { killed = { name = "Kul Tiras", min = 20 } },
          text = "You carry Kul Tiran steel on your hands, mon, I can smell the sea on it. Their smiths be good, I admit it, but their marines don't seem to keep it very long once you show up." },
        { id = "h_default", key = true,
          text = "I be Ula'elek, and I work iron for the Darkspear and for the warriors Thun'grim Firegaze send me from the Barrens. My gauntlets hold more than steel, because I put the strength of other things into them." },
        { id = "h_thungrim", when = { questActive = TODO_QUEST("Ula'elek and the Brutal Gauntlets") },
          text = "Old Thun'grim send word of your coming, but had he kept silent, your presence still would not surprise me. The spirits follow your progress, warrior, and they tell me many foes have fallen before you." },
        { id = "h_done", when = { questDone = TODO_QUEST("Brutal Gauntlets") },
          text = "You wear my gauntlets, and you wear them well. In wearin' them you bring honor to me and to my ancestors, so do not get them chewed off by anything stupid." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A warrior at my forge. Show me your hands, mon, because a warrior's hands tell me more than a warrior's mouth." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, with hands like anvils already. I would need twice the iron for your gauntlets, and the spirits tell me you would be worth it." },
      },
      again = {
        { id = "h_again", text = "What else? The iron be listenin', and so be I." },
        { id = "h_again2", text = "Speak, mon. The forge be patient today." },
      },
      choices = {
        { text = "What makes your gauntlets brutal?", next = "gauntlets" },
        { text = "Why satyr hooves?", next = "hooves", when = { minLevel = 25 } },
        { text = "How do you know Thun'grim Firegaze?", next = "thungrim" },
        { text = "You say the spirits tell you things?", next = "spirits" },
        { text = "I'm a warrior. Make me something worth wearing.", next = "xwar", when = { class = "WARRIOR" } },
        { text = "I'll come back when I'm ready.", next = "END" },
      },
    },

    gauntlets = {
      lines = { { id = "ga_default", text = "Steel be only a shell, mon. Into it I leech the power from somethin' that fed on power first, so the gauntlets hit like the thing they be made from, and that be the brutal part." } },
      choices = {
        { text = "Isn't that dark magic?", next = "ga_dark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ga_dark = {
      big = true,
      lines = { { id = "gad_default", text = "The satyrs leech the purity out of Ashenvale, and I leech it back out of them, mon. Whether that be dark or bright depend on who wear the gauntlets and what they hit." } },
      choices = {
        { text = "Turning a demon's power on demons is justice.", next = "BACK", reply = "Justice, ya, and it be the kind I like best. The satyrs feel their own rot coming back at them, and they deserve every bit.", fx = { align = { light = 1 } } },
        { text = "Power is power. I don't care where it comes from.", next = "BACK", reply = "You should care a little, mon, because the gauntlets remember where the power come from. Wear them careful and they serve you well.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hooves = {
      lines = { { id = "ho_default", text = "The satyrs dwell in northeastern Ashenvale because of the forest's power, and they feed off its purity. You can tell which of them drink the most by their hooves, swollen and uncloven, and those be the ones I need." } },
      choices = {
        { text = "How many?", next = "ho_count" },
        { text = "What are satyrs, exactly?", next = "ho_satyr", fx = { learn = { "satyrs" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ho_count = {
      lines = { { id = "hoc_default", text = "Seven, mon, because seven be what the iron take before it stop drinkin'. Bring me fewer and I make you one gauntlet, which be useless unless you only got one hand." } },
      choices = { { text = "Seven it is.", next = "BACK" } },
    },
    ho_satyr = {
      lines = { { id = "hos_default", text = "Night elves once, the stories say, before they sell themselves to the demons and get horns for the trouble. The night elves do not like to talk about it, which tell you the story be true." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    thungrim = {
      lines = { { id = "th_default", text = "Thun'grim be an old warrior with a head full of fire and good judgment, which be rare together. He send me the ones who be ready, and I make them gauntlets, and we both pretend we not keep count." } },
      choices = {
        { text = "Do you keep count?", next = "th_count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    th_count = {
      lines = { { id = "thc_default", text = "Of course, mon, I carve a notch for every pair on the post behind the forge. Thun'grim carve his own somewhere, and someday we compare, and whoever lose buy the rum." } },
      choices = {
        { text = "I'll make sure you win.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    spirits = {
      lines = { { id = "sp_default", text = "They tell me things the way the wind tell you rain be comin', mon, and I listen because ignorin' them never go well. My grandfather be a smith on the isles, and he hear them louder than me." } },
      choices = {
        { text = "What do they say about me?", next = "sp_me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sp_me = {
      lines = {
        { id = "spm_default", text = "They say you got a long road behind and a longer one ahead, mon, which they say about everybody, because spirits be lazy too." },
        { id = "spm_troll", when = { race = "Troll" }, text = "They say you be Darkspear, and that the isles remember your blood even if you never set foot there. That one they mean, mon." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xwar = {
      big = true,
      lines = { { id = "xw_default", text = "Then tell me why you fight, warrior, because I put that into the iron too. A gauntlet for a proud fist and a gauntlet for a faithful one be made the same, but they do not hit the same." } },
      choices = {
        { text = "I fight for the Horde and its Warchief.", next = "BACK", reply = "Then the iron get the Warchief's fire in it, and it'll hit like the whole Horde behind you. A good reason to fight, warrior.", fx = { align = { order = 1 } } },
        { text = "I fight for myself, and for those I choose.", next = "BACK", reply = "For yourself and your chosen, eh? Then the iron be loyal to you alone, mon, and that be a hard, true kind of strength.", fx = { align = { order = -1 } } },
        { text = "I'd rather not say.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know iron, mon, and what the spirits whisper while I beat it." } },
    background = { { id = "tp_bg", text = "I be a smith's grandson from the isles and a smith myself in Sen'jin, and the spirits come with the trade." } },
    advice = { { id = "tp_ad", text = "Never let somebody else quench your blade, mon. They will do it wrong, and you will blame the steel." } },
    satyrs = { { id = "tp_satyrs", text = "Satyrs be horned leeches, mon, and their hooves make good gauntlets.", next = "hooves" } },
    _none = { { id = "tp_none", text = "The spirits say nothin' about that, mon, and neither will I." } },
  },
}
