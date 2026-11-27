-- Mulgore's Braves, the named guards the roster scan found unwritten: four on Red Cloud Mesa around
-- Camp Narache (Greathoof, Lightninghorn, Proudsnout, Running Wolf) and nine at Bloodhoof Village
-- (Cloudmane, Darksky, Dawneagle, Ironhorn, Leaping Deer, Rainchaser, Rockhorn, Strongbash, Swiftwind).
-- Each has a post, a temper and a thing they watch for. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Brave Greathoof: wanders by the giant skeleton south of Camp Narache.
---------------------------------------------------------------------------
P:NPC {
  key = "brave_greathoof", id = TODO_NPC("Brave Greathoof"), name = "Brave Greathoof", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "narache" }, temper = { "thoughtful" }, values = { "dutiful", "reverent" },
  notices = { "class" },
  impression = {
    first = "Brave Greathoof walks a slow circle around the great bones south of Camp Narache, and he looks at them as often as he looks at the plain. He speaks as though the bones might be listening.",
    third = "{name} met Brave Greathoof, who keeps watch by the great bones south of Camp Narache.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "You walk here with respect, friend, and the old ones notice that. Be welcome in this place." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Walk softly here, {class}. The old ones are watching you, and I am watching you too." },
    { id = "g_default", text = "Walk softly here, {class}, for you stand in the shadow of something older than our camp." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the bones, and they have not moved, which is all I ask of them." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Mu'sha is bright on the bones tonight, and the cougars hunt by her light, so keep to the path." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter looks at these bones and thinks of the size of the spear, I am sure. I think of it too, on the long watches." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Brave Greathoof, and my watch is the south of Red Cloud Mesa, where the great bones lie. The plainstriders and the cougars keep me company, and neither is much for talk." },
      },
      again = {
        { id = "h_again", text = "Ask what you will, for the watch is long and the plain is quiet." },
        { id = "h_again2", text = "Was there something more you wished to know? Ask it slowly; the plain is quiet, and loud questions carry to the cougars." },
      },
      choices = {
        { text = "What beast left bones that size?", next = "bones" },
        { text = "What do you watch for out here?", next = "watch" },
        { text = "A lonely post, this one.", next = "lonely" },
        { text = "Do the young ones listen to you?", next = "ylisten" },
        { text = "Have you ever felt the kodo's spirit here?", next = "yspirit" },
        { text = "Who taught you to keep a watch?", next = "ytaught" },
        { text = "I'm a druid. These bones feel old.", next = "BACK", when = { class = "DRUID" }, reply = "Older than any of us, the elders say. If you hear them, walk softly, and tell me what they say." },
        { text = "Do the cougars ever come close to the bones?", next = "w7_cougar" },
        { text = "Walk with the Earth Mother, brave.", next = "END" },
      },
    },
    w7_cougar = {
      lines = {
        { id = "w7_cougar_l1", text = "They sleep in the shade of the great ribs at midday, and I let them, because a cougar asleep is a cougar that is not hunting. Only when a calf comes too close do I go and wake them, gently, with a stone thrown wide." },
      },
      choices = {
        { text = "Have they ever turned on you?", next = "w7_cougar2" },
        { text = "You should drive them away for good.", next = "w7_cougar3" },
        { text = "Something else, Greathoof.", next = "BACK" },
      },
    },
    w7_cougar2 = {
      lines = {
        { id = "w7_cougar2_l1", text = "Once, an old female who was hungrier than she was wise. She came at me through the long grass, and I stood my ground and roared, and she stopped, and we looked at each other for a long time before she walked away." },
        { id = "w7_cougar2_l2", when = { class = "HUNTER" }, text = "Once, an old hungry female. You know how it is: stand your ground, make yourself large, and wait. She looked at me a long while, then walked away. I think she decided I was too stubborn to eat." },
      },
      choices = {
        { text = "Brave of you.", next = "BACK", reply = "Or foolish. On the plains they are the same thing, mostly." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_cougar3 = {
      lines = {
        { id = "w7_cougar3_l1", text = "They were here before the bones were bones. I share the shade with them, and they share the plain with me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    bones = {
      lines = { { id = "b_default", text = "A kodo, the elders say, from a time when the herds were greater than any that walk the plains today. It lay down here long before the Hawkwind raised their tents, and no one has had the heart to move it." } },
      choices = {
        { text = "Why guard what is already dead?", next = "bones_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bones_why = {
      lines = { { id = "bw_default", text = "I do not guard the bones so much as the young ones who come to climb them. A cougar waits in the long grass for exactly that kind of carelessness, and I would rather it went hungry." } },
      choices = { { text = "A fair reason. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    watch = {
      lines = { { id = "w_default", text = "Mountain cougars come down from the rim of the mesa, and the battleboars wander up from the south when the quilboar let them stray. Neither will trouble a full camp, but both will trouble one young tauren walking alone.", fx = { learn = { "quilboar" } } } },
      choices = {
        { text = "I can thin the cougars for you.", next = "BACK", when = { class = { "HUNTER", "WARRIOR" } }, reply = "Then take only what you need to make the path safe, and thank each one as it falls. The Earth Mother made the cougar too.", fx = { affinity = 1 } },
        { text = "I'll keep to the path. Something else.", next = "BACK" },
      },
    },
    lonely = {
      lines = { { id = "l_default", text = "It is quiet, which is not the same thing as lonely. A brave who cannot keep his own company on the plain will be poor company for anyone in the camp." } },
      choices = { { text = "Well said. Something else.", next = "BACK" } },
    },
  
    ylisten = {
      lines = {
        { id = "ygreath_ylisten_d", text = "Some do, and some climb the ribs the moment I turn my back. Last spring a calf fell and broke her horn, and her mother blamed me for not watching closer. I had told the girl three times to come down." },
      },
      choices = {
        { text = "Was it your fault?", next = "yfault" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfault = {
      lines = {
        { id = "ygreath_yfault_d", text = "The elders say a brave is responsible for everything on his watch. Her mother says the same. But I cannot hold every calf by the hand, and a calf who never climbs will never learn to fall." },
      },
      choices = {
        { text = "The watch is yours. Keep them off the bones.", next = "BACK", reply = "Then I will be harder, though they will like me less for it.", fx = { align = { order = 1 } } },
        { text = "Let them climb. Falling is how they learn.", next = "BACK", reply = "So my own father taught me. I will tell her mother you said so, if she asks again.", fx = { align = { order = -1 } } },
      },
    },
    yspirit = {
      lines = {
        { id = "ygreath_yspirit_d", text = "On still nights, when the wind dies, I sometimes hear something like breath in the grass between the ribs. I have told no one but my mother. She says the old kodo is dreaming, and that I should let it dream." },
        { id = "ygreath_yspirit_v0", when = { race = "Tauren" }, text = "On still nights, I hear breath between the ribs. You are of the Earth Mother's people, so you will know I do not say this lightly. My mother says the old kodo dreams." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ytaught = {
      lines = {
        { id = "ygreath_ytaught_d", text = "Brave Lightninghorn, before he took the road north. He made me stand on this mesa for a full day without speaking. I thought it was punishment. It was the first lesson." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    red_cloud_mesa = { { id = "ygreath_tp_red_cloud_mesa", text = "Red Cloud Mesa is where every young tauren of the plains is first tested. I was tested here, and so were my parents." } },
    kodo = { { id = "ygreath_tp_kodo", text = "The kodo carry our homes and our burdens. A tauren who mistreats one is not a tauren at all." } },

    background = { { id = "tp_bg", text = "I was raised at Camp Narache and I have walked this stretch of the mesa since I earned my spear." } },
    quilboar = { { id = "tp_qb", text = "The Bristleback keep to their ravine in the east, but their boars do not, and I turn those back when they come." } },
    earth_mother = { { id = "tp_em", text = "She is in the grass and in the bones alike, and I find it easy to remember that out here." } },
    _none = { { id = "tp_none", text = "That is beyond my watch, friend, so ask it of Chief Hawkwind in the camp." } },
  },
}

---------------------------------------------------------------------------
-- Brave Lightninghorn: patrols the road just north of Camp Narache.
---------------------------------------------------------------------------
P:NPC {
  key = "brave_lightninghorn", id = TODO_NPC("Brave Lightninghorn"), name = "Brave Lightninghorn", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "narache" }, temper = { "brisk" }, values = { "dutiful", "proud" },
  notices = { "race" },
  impression = {
    first = "Brave Lightninghorn strides the road north of Camp Narache at a pace most tauren save for the hunt. He counts everyone who leaves the mesa, and he remembers which of them came back.",
    third = "{name} met Brave Lightninghorn, who patrols the road north of Camp Narache.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Good to see you, friend. I walked the road this morning and it's clear, so walk it easy." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "The road is clear to the pass, {class}. Walk it, and keep your hand off your weapon." },
    { id = "g_default", text = "The road is clear as far as the pass, {class}, for I walked it myself not long ago." },
    { id = "g_back", when = { metBefore = true }, text = "You are on my road again, and that is good, because a road wants feet on it." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "Another of ours bound for the wide plains, I think. Walk it proudly, for the whole camp watches the young ones go." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Troll" } },
      text = "It is a long walk from Durotar to this mesa. You honour the Hawkwind by making it, and I will see you safely onto the road." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Brave Lightninghorn, and this road is mine from the edge of the camp to the pass that leads down off the mesa. Everyone who leaves Camp Narache for Bloodhoof Village passes me, and I like to know their faces." },
      },
      again = {
        { id = "h_again", text = "Speak as we walk, if you would, because I do not like to stand still on a watch." },
        { id = "h_again2", text = "What else, then? Ask while we walk; the pass is only half a mile on, and I mean to reach it before the sun does." },
      },
      choices = {
        { text = "Where does this road lead?", next = "road" },
        { text = "You walk faster than most tauren.", next = "pace" },
        { text = "Does anything trouble the road?", next = "trouble" },
        { text = "How many have you counted leave?", next = "ycount" },
        { text = "Who was the last who didn't return?", next = "ylast" },
        { text = "Do you ever rest?", next = "yrest" },
        { text = "What do you say to the young ones leaving the mesa?", next = "w7_say" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    w7_say = {
      lines = {
        { id = "w7_say_l1", text = "The same words every time: 'Stay on the road, drink before you're thirsty, and come back to tell me what you saw.' Most of them laugh, but some of them do come back, years later, and tell me, and those are my favourite days." },
      },
      choices = {
        { text = "Who came back most recently?", next = "w7_say2" },
        { text = "That's not much advice.", next = "w7_say3" },
        { text = "Something else, Lightninghorn.", next = "BACK" },
      },
    },
    w7_say2 = {
      lines = {
        { id = "w7_say2_l1", text = "A young warrior named Hakota, who left with a stick for a spear four seasons ago. He came back last moon with scars from the Barrens and a Crossroads axe, and he walked the road with me for a whole morning just to tell me about it." },
        { id = "w7_say2_l2", when = { race = "Tauren" }, text = "A warrior named Hakota, with scars from the Barrens. You came down this road too, I think. When you've seen enough of the world, come back and tell me about it, and I'll walk with you a while." },
      },
      choices = {
        { text = "I'll come back.", next = "BACK", reply = "Good. I'll be on the road. I always am." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_say3 = {
      lines = {
        { id = "w7_say3_l1", text = "It is all they will remember, so it had better be short. The long advice they learn on the road." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "North through the pass and down onto the plains of Mulgore, and then on to Bloodhoof Village beside Stonebull Lake. Beyond that the road climbs to Thunder Bluff itself, where Cairne Bloodhoof keeps the tribes together.", fx = { learn = { "cairne" } } } },
      choices = {
        { text = "Who should I look for at Bloodhoof?", next = "road_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_who = {
      lines = { { id = "rw_default", key = true, text = "Baine Bloodhoof, the chieftain's son, has the keeping of the village, and he always has work for willing hands. Brave Rockhorn walks the south side of it, and you may tell him that Lightninghorn's road is quiet." } },
      choices = { { text = "I'll tell him. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    pace = {
      lines = { { id = "p_default", text = "My mother named me for the storm, and I have tried to deserve it. A slow guard sees the same trouble as a quick one, only he sees it after it has already happened." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trouble = {
      lines = { { id = "t_default", text = "Plainstriders mostly, which are more foolish than dangerous, and a cougar now and then where the rocks crowd the road. The Bristleback stay in their ravine, and I mean to keep it so." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  
    ycount = {
      lines = {
        { id = "ylightn_ycount_d", text = "This season, two hundred and nine. Most come back as braves, a few come back as hunters, and some go on to Thunder Bluff and never return to the mesa. I count them all in a knotted cord." },
        { id = "ylightn_ycount_v0", when = { race = "Tauren" }, text = "Two hundred and nine this season. You were one of them once, perhaps, and I would have knotted your name on my cord." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ylast = {
      lines = {
        { id = "ylightn_ylast_d", text = "A young brave named Swiftmane, who went down the pass alone to hunt a cougar he had heard of. We found his spear, and the cougar's tracks, and nothing more. His mother asks me every week if I have seen him." },
      },
      choices = {
        { text = "What do you tell her?", next = "ytell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytell = {
      lines = {
        { id = "ylightn_ytell_d", text = "That I have not, which is true, and that I am still looking, which is less true than I would like. Some say I should tell her plainly that he is gone. Others say hope is the only thing she has left." },
      },
      choices = {
        { text = "Tell her the truth. She deserves to grieve.", next = "BACK", reply = "You may be right. It is the harder kindness, and I have avoided it too long.", fx = { align = { honor = 1 } } },
        { text = "Let her hope. It costs nothing.", next = "BACK", reply = "It costs me something, each time she asks. But I will let her keep it a while longer.", fx = { align = { honor = -1 } } },
      },
    },
    yrest = {
      lines = {
        { id = "ylightn_yrest_d", text = "When the road is empty, I sit by the pass and watch the sunset over the plains. My mother says I was born running, and I will die running. I hope she is wrong about the second part." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    narache = { { id = "ylightn_tp_narache", text = "Camp Narache is where every young tauren of Mulgore begins. I began there, and I have never quite left." } },
    pass = { { id = "ylightn_tp_pass", text = "The pass from the mesa is narrow and steep. Watch your footing, especially after rain." } },

    background = { { id = "tp_bg", text = "I am of the Hawkwind's camp, and I asked for the road because I could not bear to stand at a tent door." } },
    cairne = { { id = "tp_ca", text = "He led us out of the Barrens to this land, and every road in Mulgore is safe because of him." } },
    advice = { { id = "tp_adv", text = "Leave the mesa by daylight the first time, so that you see the plains open below you as they should be seen." } },
    _none = { { id = "tp_none", text = "I know my road and little past it, so ask in the camp behind me." } },
  },
}

---------------------------------------------------------------------------
-- Brave Proudsnout: patrols the graveyard just west of Camp Narache.
---------------------------------------------------------------------------
P:NPC {
  key = "brave_proudsnout", id = TODO_NPC("Brave Proudsnout"), name = "Brave Proudsnout", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "narache" }, temper = { "solemn" }, values = { "reverent", "dutiful" },
  notices = { "class", "race" },
  impression = {
    first = "Brave Proudsnout keeps the burial ground west of Camp Narache, walking between the scaffolds with his head a little bowed. He lowers his voice when he speaks, as though someone nearby were sleeping.",
    third = "{name} met Brave Proudsnout, who watches the burial ground west of Camp Narache.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "You honor the Hawkwind by coming quietly, friend. Stand with me a moment, if you wish." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Speak quietly here, {class}. The Hawkwind's rest is not to be troubled, least of all by you." },
    { id = "g_default", text = "Speak quietly here, {class}, for this is where the Hawkwind lay their dead to the sky." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the resting place, and I hope it is to pay respect and not from need." },
  },
  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You are one of the Forsaken. I will not bar your way, but I ask you plainly to leave our dead to their rest." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You hear the spirits, shaman, so you will know better than most how lightly to tread on this ground." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Brave Proudsnout, and I stand watch over the burial ground. The ancestors do not need guarding from much, but the battleboars root where they please, and I will not have them rooting here." },
      },
      again = {
        { id = "h_again", text = "Ask, and I will answer as quietly as I can." },
        { id = "h_again2", text = "The ancestors are patient, and so am I." },
      },
      choices = {
        { text = "How do the tauren bury their dead?", next = "rites" },
        { text = "Does anything disturb this place?", next = "disturb" },
        { text = "I will leave the dead in peace.", when = { race = "Scourge" }, next = "forsaken" },
        { text = "Whose scaffold do you visit most?", next = "ywho" },
        { text = "Have you seen a spirit linger?", next = "yseen" },
        { text = "Have the quilboar ever come near?", next = "yquil" },
        { text = "Do you speak to the ancestors yourself?", next = "w7_speak" },
        { text = "May the ancestors rest well.", next = "END", fx = { affinity = 1 } },
      },
    },
    w7_speak = {
      lines = {
        { id = "w7_speak_l1", text = "Every evening, quietly, before I leave my post. I tell them what happened in the camp that day, who passed their rites, which calf fell and got up again. I do not know if they hear, but my grandmother always wanted to know the news." },
      },
      choices = {
        { text = "What did you tell them today?", next = "w7_speak2" },
        { text = "The dead don't need news.", next = "w7_speak3" },
        { text = "Something else, Proudsnout.", next = "BACK" },
      },
    },
    w7_speak2 = {
      lines = {
        { id = "w7_speak2_l1", text = "That a young one with a quick eye came by the burial ground and asked about them, and did not trample anything. My grandmother would like that; she always said the respectful ones were rarer than the brave." },
        { id = "w7_speak2_l2", when = { class = { "PRIEST", "SHAMAN" } }, text = "That someone who walks with the spirits came by and asked about them. You might speak to them yourself, if you wished; they may hear you more clearly than they hear an old brave." },
      },
      choices = {
        { text = "Tell them I said hello.", next = "BACK", reply = "I will, tonight. They will be glad of it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_speak3 = {
      lines = {
        { id = "w7_speak3_l1", text = "Perhaps not. But I need to tell it, and they are good listeners." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rites = {
      lines = { { id = "r_default", text = "We raise them on scaffolds so that An'she and the winds may take what the Earth Mother lent them. Nothing is hidden under stone, because nothing about a good life needs hiding.", fx = { learn = { "earth_mother" } } } },
      choices = {
        { text = "And their spirits?", next = "spirits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits = {
      lines = { { id = "s_default", text = "They walk on with the ancestors, and some of them linger a while to see that the camp is well. When the wind turns suddenly in the grass here, I greet it, in case it is someone I knew." } },
      choices = { { text = "A good custom. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    disturb = {
      lines = { { id = "d_default", text = "Boars, mostly, and once a young brave who thought it a fine place to practise his war cry. I have more patience with the boars, since they know no better." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "f_default", text = "Then we understand one another, and I thank you for saying it. The elders say your people did not choose what was done to them, and I try to remember that when the wind brings me your scent." } },
      choices = { { text = "That is more courtesy than most give. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  
    ywho = {
      lines = {
        { id = "yprouds_ywho_d", text = "My grandmother's, at the edge where the grass is tallest. She taught me to sing the old songs, and I sing them to her at dusk when the camp is quiet. I am not a good singer, but she was patient with me in life." },
        { id = "yprouds_ywho_v0", when = { race = "Tauren" }, text = "My grandmother's, at the edge where the grass is tallest. You will know the songs of mourning, I think. I sing them to her at dusk, badly, as she taught me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yseen = {
      lines = {
        { id = "yprouds_yseen_d", text = "Once, on a night when the wind stopped entirely. A shape stood beside the oldest scaffold, tall and pale, and it turned to look at me. I bowed, and when I looked up it was gone. The shaman said it was a blessing." },
      },
      choices = {
        { text = "Do you believe them?", next = "ybelieve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybelieve = {
      lines = {
        { id = "yprouds_ybelieve_d", text = "Mostly. But a young brave told me I had seen a Forsaken scout, come to spy on our dead. He wanted to set traps. I would not let him, for traps among the scaffolds would dishonour the ancestors." },
      },
      choices = {
        { text = "You were right. The dead deserve peace, not traps.", next = "BACK", reply = "I believe so too. The ancestors will protect their own rest.", fx = { align = { light = 1 } } },
        { text = "The brave had a point. Traps keep out the living who'd disturb them.", next = "BACK", reply = "Perhaps. But I would rather lose a scaffold than defile the ground.", fx = { align = { light = -1 } } },
      },
    },
    yquil = {
      lines = {
        { id = "yprouds_yquil_d", text = "Only once, when a hungry boar led three of them past the eastern edge. They looked at the scaffolds, grunted, and left. Even the quilboar know this is not a place to quarrel." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ancestors = { { id = "yprouds_tp_ancestors", text = "The ancestors watch over Camp Narache. When the wind turns in the grass, it is them." } },
    scaffolds = { { id = "yprouds_tp_scaffolds", text = "The scaffolds are built of ironwood and sinew, so they will stand until the winds take them." } },

    background = { { id = "tp_bg", text = "My own grandfather lies here, and so I asked the chief for this watch and no other." } },
    earth_mother = { { id = "tp_em", text = "She lends us our bodies for a while, and this is the place where we give them back." } },
    scourge = { { id = "tp_sc", text = "I have heard that in the north the dead are made to rise and serve, and I can think of no greater wrong." } },
    _none = { { id = "tp_none", text = "I could not say, and this is not the place to guess aloud." } },
  },
}

---------------------------------------------------------------------------
-- Brave Running Wolf: patrols the southeast corner of Camp Narache.
---------------------------------------------------------------------------
P:NPC {
  key = "brave_running_wolf", id = TODO_NPC("Brave Running Wolf"), name = "Brave Running Wolf", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "narache" }, temper = { "fierce" }, values = { "protective", "proud" },
  notices = { "class" },
  impression = {
    first = "Brave Running Wolf paces the southeast edge of Camp Narache with his eyes fixed on the east, where the ravine is. He grips his weapon like someone who has been told to wait and does not enjoy it.",
    third = "{name} met Brave Running Wolf, who guards the southeast edge of Camp Narache.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "You can fight, I know that much. Walk where you like, friend, and call if the wolves come." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Stay inside the camp, {class}. I've no wish to haul you back from the wolves." },
    { id = "g_default", text = "Stay inside the camp's edge unless you can fight, {class}, because the quilboar are closer than the elders like to say." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and you are in one piece, so the Bristleback did not get the better of you." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You carry yourself like one who has stood in a line before. I wish the chief would send ten of you into that ravine with me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Brave Running Wolf, and this corner of the camp is mine to hold. Brambleblade Ravine lies to the east of here, full of Bristleback quilboar, and I am the first horn they will meet if they ever come out of it.", fx = { learn = { "quilboar" } } },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Bristleback", min = 10 } }, text = "I hear the ravine is quieter since you went into it, and I will not pretend I am not envious. Brave Running Wolf holds this corner, and he would rather have been beside you." },
      },
      again = {
        { id = "h_again", text = "Speak, but forgive me if I keep my eyes on the east." },
        { id = "h_again2", text = "What more would you ask? Ask it fast, while the ravine is quiet; when the Bristleback stir, I stop talking." },
      },
      choices = {
        { text = "Tell me about the Bristleback.", next = "quilboar" },
        { text = "You would rather be fighting them.", next = "wait" },
        { text = "I've bloodied the ravine already.", next = "bloodied", when = { killed = { name = "Bristleback", min = 10 } } },
        { text = "What have you seen at the ravine?", next = "ywatch" },
        { text = "Why do you want to fight so badly?", next = "ywhy" },
        { text = "Do you have family in the camp?", next = "yfam" },
        { text = "A warrior wants to stand with you.", next = "BACK", when = { class = "WARRIOR" }, reply = "Then stand here a while, and if the Bristleback come, we will meet them together." },
        { text = "What will you do if the chief lets you fight?", next = "w7_fight" },
        { text = "Hold your corner well, brave.", next = "END" },
      },
    },
    w7_fight = {
      lines = {
        { id = "w7_fight_l1", text = "Go into Brambleblade Ravine at dawn, with my father's spear, and not come out until Sharptusk Thornmantle's tusks are hanging from my belt. Then I will come back to this post, and stand here again, because the ravine will still be full of quilboar." },
      },
      choices = {
        { text = "Then what changes?", next = "w7_fight2" },
        { text = "Revenge won't bring your father back.", next = "w7_fight3" },
        { text = "Something else, Running Wolf.", next = "BACK" },
      },
    },
    w7_fight2 = {
      lines = {
        { id = "w7_fight2_l1", text = "I do, a little. My mother will sleep better, and so will I, and the young ones who walk past this corner will be a little safer. That is enough for one brave to change." },
        { id = "w7_fight2_l2", when = { class = "WARRIOR" }, text = "Me, a little. You fight, so you know: one victory does not end a war, but it changes the one who wins it. I want to stand at this post knowing I did what my father would have done." },
      },
      choices = {
        { text = "I understand.", next = "BACK", reply = "Thank you. Few do, here." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_fight3 = {
      lines = {
        { id = "w7_fight3_l1", text = "No. Nothing will. But it might let him rest, and me with him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    quilboar = {
      lines = { { id = "q_default", text = "They are bristled, squealing raiders who dig their thorns into good land and call it theirs. They steal from our hunters and foul the ravine, and their shamans work some craft with the brambles that I do not understand." } },
      choices = {
        { text = "Who leads them?", next = "quilboar_lead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quilboar_lead = {
      lines = { { id = "ql_default", text = "The worst of them keep to the back of the ravine, where the thorns are thickest, and they send the young ones out to do the stealing. Ask Grull Hawkwind if you want names, for he has been counting their wrongs longer than I have." } },
      choices = { { text = "I'll ask him. Something else.", next = "BACK" } },
    },
    wait = {
      big = true,
      lines = { { id = "w_default", text = "I would, and I have said so to the chief more than once. He tells me that a brave who leaves his post to hunt glory leaves a gap, and that the gap is what the enemy is waiting for." } },
      choices = {
        { text = "The chief is right. The post matters more.", next = "BACK", reply = "I know that he is, and I stand here because I know it. I only wish knowing it made the standing easier.", fx = { align = { order = 1 } } },
        { text = "Better to strike them first than to wait.", next = "BACK", reply = "That is what my blood says as well, every single morning. Do not say it too loudly near the chief's tent.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bloodied = {
      lines = { { id = "bl_default", text = "Then you have done what I am not allowed to do, and the camp sleeps better for it. Tell me one day how they fight when they are cornered, because I mean to be ready." } },
      choices = { { text = "They fight dirty. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  
    ywhy = {
      lines = {
        { id = "yrunnin_ywhy_d", text = "My father fell to the Bristleback when I was a calf, at the edge of the ravine, protecting a hunting party. They brought his body back with thorns in it. I have wanted to go into that ravine every day since." },
      },
      choices = {
        { text = "Is it vengeance you want?", next = "yvengeance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yvengeance = {
      lines = {
        { id = "yrunnin_yvengeance_d", text = "I tell myself it is justice. The chief says it is vengeance, and that vengeance is a fire that burns the one who carries it. I do not know which of us is right, and I am tired of asking." },
      },
      choices = {
        { text = "Justice for your father is honourable.", next = "BACK", reply = "Thank you. It is good to hear someone say it.", fx = { align = { honor = 1 } } },
        { text = "The chief is right. Let go of vengeance.", next = "BACK", reply = "Perhaps. But letting go feels too much like forgetting him.", fx = { align = { honor = -1 } } },
      },
    },
    yfam = {
      lines = {
        { id = "yrunnin_yfam_d", text = "My mother, who weaves baskets by the well, and my sister, who is already better with a bow than I am. They want me to stay at this post. I think they are afraid I will go into the ravine and not come back." },
        { id = "yrunnin_yfam_v0", when = { race = "Tauren" }, text = "My mother and my sister. You will know how tauren families worry. They want me at this post, safe, and I understand why." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ywatch = {
      lines = {
        { id = "yrunnin_ywatch_d", text = "The Bristleback come out at dusk, mostly young ones on raids. I have seen their scouts at the ravine's mouth, and I have counted them. There are more each week, which worries me more than I tell the chief." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    brambleblade = { { id = "yrunnin_tp_brambleblade", text = "Brambleblade Ravine is full of thorns and quilboar. Do not go in alone." } },
    father = { { id = "yrunnin_tp_father", text = "My father was a hunter. The camp still sings of him on the longest night." } },

    background = { { id = "tp_bg", text = "I was the fastest runner of my season, and now I am asked to stand still, which the Earth Mother surely finds amusing." } },
    quilboar = { { id = "tp_qb", text = "They hold Brambleblade Ravine to the east, and they will hold more than that if no one pushes them back." } },
    advice = { { id = "tp_adv", text = "Do not go into the ravine alone until your arm is stronger, for there are more of them than there are thorns." } },
    _none = { { id = "tp_none", text = "I know the east edge and the enemy beyond it, and for anything else you must ask in the camp." } },
  },
}

---------------------------------------------------------------------------
-- Brave Cloudmane: Bloodhoof Village, the north bridge toward Thunder Bluff.
---------------------------------------------------------------------------
P:NPC {
  key = "brave_cloudmane", id = TODO_NPC("Brave Cloudmane"), name = "Brave Cloudmane", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "bloodhoof" }, temper = { "mild" }, values = { "dutiful", "patient" },
  notices = { "race" },
  impression = {
    first = "Brave Cloudmane stands near the north bridge out of Bloodhoof Village with one eye on the road and one on the sky. He seems to know what the weather will do an hour before it does it.",
    third = "{name} met Brave Cloudmane, who watches the north bridge of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Well met, friend! The wind is gentle today, and so is the company now that you're here." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Well met, {class}. The wind is from the bluffs, and it's colder than usual. Some days it is." },
    { id = "g_default", text = "Well met, {class}. The wind is from the bluffs today, so you will have fair walking if you are bound north." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to the bridge, friend, and the sky has been kind since you last crossed it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Mu'sha lights the bridge well enough tonight, though the wolves like the far bank after dark." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Troll", "Scourge" } },
      text = "You are a long way from your own hearth, and you are welcome at ours. Ask me the way to anything in the village, for directions are half of my duty." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Brave Cloudmane, and I keep the bridge on the north side of the village. If you are looking for someone in Bloodhoof, I can likely point you to the right tent." },
      },
      again = {
        { id = "h_again", text = "What else can I point you toward?" },
        { id = "h_again2", text = "Ask freely, for the road is empty just now." },
      },
      choices = {
        { text = "Where does the north road go?", next = "north" },
        { text = "Who should I see in the village?", next = "village" },
        { text = "You keep looking at the sky.", next = "sky" },
        { text = "Has the weather ever cost the village?", next = "ystorm" },
        { text = "Do you get many strangers on the bridge?", next = "ystrangers" },
        { text = "What of the dwarves digging west of the bluffs?", next = "ydwarves" },
        { text = "Can you teach me to read the clouds?", next = "w7_clouds" },
        { text = "Winds guide you, brave.", next = "END" },
      },
    },
    w7_clouds = {
      lines = {
        { id = "w7_clouds_l1", text = "A little, if you have a moment. Look there, over Thunder Bluff: long thin clouds like the hair of an old bull mean wind tomorrow, and fat grey ones that sit low over the plains mean rain by dusk." },
      },
      choices = {
        { text = "And what are those now?", next = "w7_clouds2" },
        { text = "I'll trust my eyes instead.", next = "w7_clouds3" },
        { text = "Something else, Cloudmane.", next = "BACK" },
      },
    },
    w7_clouds2 = {
      lines = {
        { id = "w7_clouds2_l1", text = "Old bull's hair, which means tomorrow the swoops will fly high and the herders will grumble about dust. You learn quickly; my grandmother would have liked you." },
        { id = "w7_clouds2_l2", when = { class = { "SHAMAN", "DRUID" } }, text = "Old bull's hair, wind tomorrow. You may feel it already, if you listen to the air spirits. My family reads with the eye; yours reads with something deeper. Between us, nobody in Bloodhoof gets wet." },
      },
      choices = {
        { text = "Thank you, Cloudmane.", next = "BACK", reply = "Walk with the wind, and watch the sky." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_clouds3 = {
      lines = {
        { id = "w7_clouds3_l1", text = "Your eyes will tell you it is raining when it is already raining. The clouds tell you before." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    north = {
      lines = { { id = "n_default", text = "Across the bridge and over the plain to the great lifts of Thunder Bluff, which you can see from here on a clear day. It is a half day's easy walk, and prairie wolves are the worst you should meet beside the road." } },
      choices = {
        { text = "And off the road?", next = "north_off" },
        { text = "Something else.", next = "BACK" },
      },
    },
    north_off = {
      lines = { { id = "no_default", text = "Off the road is another matter, for the Windfury harpies nest on the ridges far to the north, and dwarves are digging where they should not be to the west of the bluffs. Baine can tell you more of both, if you have a mind to help." } },
      choices = { { text = "I'll speak to Baine. Something else.", next = "BACK" } },
    },
    village = {
      lines = { { id = "v_default", text = "Baine Bloodhoof for the troubles of the plains, and Innkeeper Kauth for a bed and a meal. Harn Longcast sells lines and hooks just by my bridge here, if Stonebull Lake has caught your eye." } },
      choices = { { text = "My thanks. Something else.", next = "BACK" } },
    },
    sky = {
      lines = { { id = "s_default", text = "It is a habit of my family, and the reason for our name. The clouds over the bluffs tell you by midday whether the evening will bring rain, and a guard who knows the rain is coming can warn the kodo herders in time." } },
      choices = {
        { text = "What does the sky say today?", next = "BACK", reply = "It says dry until dusk and a wind after, so tie down anything you care about." },
        { text = "The elements say the same to me.", next = "BACK", when = { class = { "SHAMAN", "DRUID" } }, reply = "Then you hear in a moment what I read in an hour, and I will trust your word over my own eyes.", fx = { affinity = 1 } },
      },
    },
  
    ystorm = {
      lines = {
        { id = "ycloudm_ystorm_d", text = "Three summers ago, a hailstorm came over the bluffs faster than I had ever seen one move. I ran to warn the herders, but two young kodo were caught in the open, and the hail broke one's back. I still remember its cry." },
      },
      choices = {
        { text = "You couldn't have known.", next = "yknown" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yknown = {
      lines = {
        { id = "ycloudm_yknown_d", text = "I should have, for the clouds were wrong all morning, and I doubted my own eyes. My father says a watcher who doubts himself is worse than a blind one. My mother says a watcher who never doubts will one day be very wrong." },
      },
      choices = {
        { text = "Trust your training and act at the first sign.", next = "BACK", reply = "My father would be glad to hear it. I will run sooner next time.", fx = { align = { order = 1 } } },
        { text = "Doubt keeps a watcher humble. Your mother is wise.", next = "BACK", reply = "Perhaps she is. She has outlived two storms that my father swore would not come.", fx = { align = { order = -1 } } },
      },
    },
    ystrangers = {
      lines = {
        { id = "ycloudm_ystrangers_d", text = "More each season. Orcs come to trade, trolls come to see the bluffs, and the Forsaken come quietly and leave quieter. I give them all the same directions, for the road does not ask who walks on it." },
        { id = "ycloudm_ystrangers_v0", when = { race = "Tauren" }, text = "More each season, and not all of them understand our ways as you do. I give them the same directions I would give you, for the road does not ask who walks it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ydwarves = {
      lines = {
        { id = "ycloudm_ydwarves_d", text = "Bael'dun dwarves, digging into the earth beyond the western hills with machines that shake the ground. Baine has sent braves to watch them. They say the dwarves seek something buried, though none of us know what." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    weather = { { id = "ycloudm_tp_weather", text = "The wind from the bluffs means dry days. Wind from the lake means rain by nightfall, every time." } },
    harn = { { id = "ycloudm_tp_harn", text = "Harn Longcast sells fishing lines just by my bridge. He tells me the fish know the weather better than I do." } },

    background = { { id = "tp_bg", text = "The Cloudmane have read the weather for the Bloodhoof herds since before we came to Mulgore." } },
    cairne = { { id = "tp_ca", text = "The chieftain sits in Thunder Bluff at the end of my road, and it is an honour to guard the way to him." } },
    advice = { { id = "tp_adv", text = "Cross the plain in the morning, when the wolves are fed and lazy." } },
    _none = { { id = "tp_none", text = "That I cannot point you to, friend, though Baine may know." } },
  },
}

---------------------------------------------------------------------------
-- Brave Darksky: Bloodhoof Village, the east side; keeps the night watch.
---------------------------------------------------------------------------
P:NPC {
  key = "brave_darksky", id = TODO_NPC("Brave Darksky"), name = "Brave Darksky", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "bloodhoof" }, temper = { "wary" }, values = { "protective", "dutiful" },
  notices = { "race", "stealth" },
  impression = {
    first = "Brave Darksky stands at the east edge of Bloodhoof Village and studies every stranger a little longer than is comfortable. He prefers the night watch, and he looks as if he has not missed one in years.",
    third = "{name} met Brave Darksky, who watches the east side of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ah, you. You need not state your business, friend. Bloodhoof knows it by now." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "State your business in Bloodhoof, {class}, and state it plainly. I am still deciding about you." },
    { id = "g_default", text = "State your business in Bloodhoof, {class}, and then be welcome to it." },
    { id = "g_back", when = { metBefore = true }, text = "I know your face now, so pass, and mind the east road after dark." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "You walk late. So do I, by choice, because the things I watch for prefer the dark." },
  },
  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You move too quietly for an honest traveller, and I notice such things. Keep your hands where the village can see them and we will have no quarrel." },
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "A goblin in Bloodhoof. You will understand if I watch you closely, given what your cousins have done to our hills." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Brave Darksky. I hold the east side of the village, which is the side that faces the Venture Company's mine, and I do not trust anything that comes from that direction until I have looked at it twice.", fx = { learn = { "venture_company" } } },
      },
      again = {
        { id = "h_again", text = "Go on, then, but I am listening to the road as well as to you." },
        { id = "h_again2", text = "Ask it quickly, and keep your voice low; the goblins' machines go quiet at night, and then I can hear everything." },
      },
      choices = {
        { text = "Looking twice is wise. A watch is only as good as its doubt.", next = "BACK", reply = "Then you will live long, {class}, and so will the village behind me.", fx = { align = { order = 1 } } },
        { text = "You see enemies in every shadow, Darksky.", next = "BACK", reply = "Perhaps. But I have yet to be wrong about the mine.", fx = { align = { order = -1 } } },
        { text = "What have the goblins done?", next = "goblins" },
        { text = "Why do you prefer the night?", next = "night" },
        { text = "You don't trust strangers much.", next = "trust" },
        { text = "Who else keeps watch in the village?", next = "watch" },
        { text = "The Venture mine runs all night, doesn't it?", next = "mine" },
        { text = "I could scout the goblin mine for you.", next = "scout", when = { class = "ROGUE" } },
        { text = "What do you hear from the mine at night?", next = "w7_hear" },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    w7_hear = {
      lines = {
        { id = "w7_hear_l1", text = "Picks, mostly, and the goblins arguing about who owes whom. But some nights I hear something else, a grinding deep in the hill, as if their machines have dug into a place that should have been left alone." },
      },
      choices = {
        { text = "What do you think it is?", next = "w7_hear2" },
        { text = "Probably just a machine.", next = "w7_hear3" },
        { text = "Something else, Darksky.", next = "BACK" },
      },
    },
    w7_hear2 = {
      lines = {
        { id = "w7_hear2_l1", text = "I do not know, and I do not like not knowing. Baine says the Venture Company will dig until there is nothing left, and I think they may already have dug too far." },
        { id = "w7_hear2_l2", when = { class = "ROGUE" }, text = "I do not know. You move quietly; you could go and see, if you were willing. I would want to know what is in that hill before it decides to come out on its own." },
      },
      choices = {
        { text = "I'll keep an ear out.", next = "BACK", reply = "Good. Two ears in the night are better than one." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_hear3 = {
      lines = {
        { id = "w7_hear3_l1", text = "Probably. And probably the Bristleback are only hungry. I keep the watch for the times probably is wrong." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = { { id = "watch_d", text = "Dawneagle holds the middle of the village, and she has stood longer than any of us. Rockhorn walks the south road, and Strongbash watches the inn, though he spends more time listening to the guests than watching the doors." } },
      choices = {
        { text = "What do you make of Dawneagle?", next = "watch_dawneagle" },
        { text = "Strongbash doesn't seem much of a watchman.", next = "BACK", reply = "He watches people, not roads. Perhaps that is a kind of watch too, though I would not tell him so." },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_dawneagle = {
      lines = { { id = "watch_dawneagle_d", text = "She is the steadiest of us, and she knew this land when there was no village here at all. When I first came to the watch, she told me that a brave who trusts nothing will soon trust nothing about himself, and I have been chewing on that ever since." } },
      choices = {
        { text = "She sounds wise.", next = "BACK", reply = "She is, and she knows it, which is why I seldom tell her." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    mine = {
      lines = { { id = "mine_d", text = "It does, and that is why I keep the night watch. Their machines grind and bang until dawn, and the smoke drifts west over our fields, and the elders say the Earth Mother is weeping every time the goblins break the stone." } },
      choices = {
        { text = "What do they take from the mine?", next = "mine_take" },
        { text = "Goblins never stop working, do they?", next = "BACK", reply = "Not when there is coin in it. I have never seen a goblin sleep, and I have looked." },
        { text = "Something else.", next = "BACK" },
      },
    },
    mine_take = {
      lines = { { id = "mine_take_d", text = "Iron and copper, and they cut down every tree near their camp for timber to brace their tunnels. I have counted the stumps from the ridge, and every one of them was older than the village." } },
      choices = {
        { text = "That's a heavy price for ore.", next = "BACK", reply = "It is, and the goblins will never pay it. The land will, and so will we." },
        { text = "Another question.", next = "BACK" },
      },
    },
    scout = {
      lines = { { id = "scout_d", text = "I would not refuse the help, though I would not ask it either. Go quietly, look at what they have built near the entrance, and come back to tell me how many guards they post after dark." } },
      choices = {
        { text = "I'll be quieter than the wind.", next = "BACK", reply = "Then you are quieter than most of us. Go carefully." },
        { text = "Another time, perhaps.", next = "BACK" },
      },
    },
    goblins = {
      lines = { { id = "gb_default", text = "They came with papers and smiles, and when we would not sell the land they began to dig it anyway. Now there is a hole in the hills to the east and their machines cut the trees that shade our hunting grounds." } },
      choices = {
        { text = "Why not drive them out?", next = "goblins_out" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblins_out = {
      lines = { { id = "go_default", text = "Baine means to, and he asks every able traveller to help him do it. There are a great many of them, and they pay their guards better than they treat their land." } },
      choices = { { text = "I'll ask Baine about it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    night = {
      lines = { { id = "n_default", text = "The day watch sees herders and traders, and the night watch sees what waits until the herders and traders have gone to their fires. I would rather meet a thing in the dark with my eyes already used to it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trust = {
      lines = { { id = "t_default", text = "I trust strangers exactly as far as I can see them, and at night that is not far. Do not take it as an insult, for the village sleeps easier because one of us is rude." } },
      choices = {
        { text = "None taken. I'd do the same.", next = "BACK", fx = { affinity = 1 } },
        { text = "Even your own kind?", next = "BACK", when = { race = "Tauren" }, reply = "The Grimtotem are my own kind as well, and I would look twice at them before any goblin." },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I asked for the night watch as a young brave, and nobody has ever tried to take it from me." } },
    venture_company = { { id = "tp_vc", text = "They dig east of here and cut what they do not dig, and no word of ours has slowed them." } },
    grimtotem = { { id = "tp_gt", text = "A tribe that smiles at Cairne's fire and sharpens its axes behind its back. I say no more than that." } },
    _none = { { id = "tp_none", text = "I do not know, and I do not guess aloud." } },
  },
}

---------------------------------------------------------------------------
-- Brave Dawneagle: Bloodhoof Village; the longest-serving of the braves.
---------------------------------------------------------------------------
P:NPC {
  key = "brave_dawneagle", id = TODO_NPC("Brave Dawneagle"), name = "Brave Dawneagle", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "bloodhoof" }, temper = { "steady" }, values = { "loyal", "wise" },
  notices = { "race", "class" },
  impression = {
    first = "Brave Dawneagle stands her post in the middle of Bloodhoof Village as though she had grown there. The younger braves glance at her before they answer a question, and she pretends not to notice.",
    third = "{name} met Brave Dawneagle, the longest-serving brave of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "An'she's light upon you, friend. Bloodhoof is glad of your return, and so am I." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "An'she's light upon you, {class}. Keep to the paths, and keep the peace in Bloodhoof." },
    { id = "g_default", text = "An'she's light upon you, {class}. You have found Bloodhoof Village, and you have found the one who has watched it longest." },
    { id = "g_back", when = { metBefore = true }, text = "I remember you, for I remember everyone who has walked through this village." },
    { id = "g_dawn", when = { timeOfDay = "dawn" }, text = "You are up with the sun, which is the proper hour, and the one I was named for." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc is always welcome here. I was with the tribe when Thrall's warriors stood beside us against the centaur, and I do not forget a debt." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Brave Dawneagle. I was standing a watch for the Bloodhoof before there was a village here to stand it in, and I expect to be standing it when the young ones beside me have gone grey." },
      },
      again = {
        { id = "h_again", text = "Ask, child, for I have answered every question this village has."  },
        { id = "h_again2", text = "What else would you know, child? Ask; I have stood this watch since before your mother was a calf, and I have answers enough." },
      },
      choices = {
        { text = "A long watch kept faithfully deserves respect.", next = "BACK", reply = "Then you understand the Bloodhoof, and you are welcome among us.", fx = { align = { order = 1 } } },
        { text = "Watches are for those with nothing better to do.", next = "BACK", reply = "Then go and do better things, child, and I will keep the watch for you.", fx = { align = { order = -1 } } },
        { text = "What was it like before the village?", next = "before" },
        { text = "Where can I find things here?", next = "find" },
        { text = "The other braves look to you.", next = "others" },
        { text = "What do the young braves ask you most?", next = "young" },
        { text = "Bloodhoof Village is busy for a tauren town.", next = "busy" },
        { text = "Do the tauren still remember what the orcs did for them?", next = "orcs_help", when = { race = "Orc" } },
        { text = "Have you ever thought of leaving your post?", next = "w7_leave" },
        { text = "May the eternal sun shine on you.", next = "END", fx = { affinity = 1 } },
      },
    },
    w7_leave = {
      lines = {
        { id = "w7_leave_l1", text = "Once, when the High Chieftain asked me to come up to Thunder Bluff and train the young braves there. I thought about it for a whole night, and in the morning I came back here, because the village needs someone who remembers it as tents." },
      },
      choices = {
        { text = "Do you regret it?", next = "w7_leave2" },
        { text = "The Bluff needed you more.", next = "w7_leave3" },
        { text = "Something else, Dawneagle.", next = "BACK" },
      },
    },
    w7_leave2 = {
      lines = {
        { id = "w7_leave2_l1", text = "Never. Thunder Bluff has many teachers, and Bloodhoof has only one old brave who knows where every fence post was set and why. That is worth more to me than a lodge on the high rise." },
        { id = "w7_leave2_l2", when = { race = "Tauren" }, text = "Never, child. You'll learn this as you grow: some places need you more than you need them. Bloodhoof is mine, and I will stand here until the Earth Mother calls me home." },
      },
      choices = {
        { text = "That's loyal.", next = "BACK", reply = "It is only love, with a spear in its hand." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_leave3 = {
      lines = {
        { id = "w7_leave3_l1", text = "Perhaps. But the Bluff has many braves, and only one of them stood here when Bloodhoof was four tents." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    young = {
      lines = { { id = "young_d", text = "Whether I have ever been afraid, mostly, and they do not like the answer, which is yes, every day. The young think courage means feeling nothing, and it takes them a long while to learn that courage is feeling it and staying anyway." } },
      choices = {
        { text = "That's a good lesson to give them.", next = "young_more" },
        { text = "I'd have thought you'd lie to comfort them.", next = "BACK", reply = "Lies only comfort until the first real danger. After that they cost lives." },
        { text = "Something else.", next = "BACK" },
      },
    },
    young_more = {
      lines = { { id = "young_more_d", text = "It is the only one I have, child, and I give it to everyone who asks. Ruul Eagletalon gives them the harpies and the elders give them the stories, but somebody has to tell them the truth about fear." } },
      choices = {
        { text = "Then I'm glad it's you.", next = "BACK", reply = "So am I, most days. Go well, and stay afraid enough to stay alive." },
        { text = "Another question.", next = "BACK" },
      },
    },
    busy = {
      lines = { { id = "busy_d", text = "It is, and it grows busier every season. Orcs and trolls come through on the road to the Barrens, and the Forsaken come to trade, and Innkeeper Kauth has had to put up another tent for those who cannot fit inside his inn." } },
      choices = {
        { text = "You don't seem to mind the crowds.", next = "busy_mind" },
        { text = "The Horde is a strange mix of peoples.", next = "BACK", reply = "It is, but no stranger than a herd of different beasts drinking at the same pool." },
        { text = "Something else.", next = "BACK" },
      },
    },
    busy_mind = {
      lines = { { id = "busy_mind_d", text = "I mind the noise, but not the people. When I was young we were hunted by the centaur across these very plains, and now strangers come to us for shelter, and I find I am proud of that." } },
      choices = {
        { text = "You should be.", next = "BACK", reply = "Perhaps. But pride is a soft thing, and I keep it soft so it does not make me careless." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    orcs_help = {
      lines = { { id = "orcs_help_d", text = "We remember, orc, and we will not forget. When the centaur had driven us nearly to the edge, Thrall and his people fought beside the High Chieftain and drove them back, and it was after that the tauren could rest here at last." } },
      choices = {
        { text = "The orcs were glad to help.", next = "BACK", reply = "I know it. And your people have been welcome here ever since." },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = { { id = "b_default", text = "We were wanderers in the Barrens, following the kodo and running from the centaur, who killed us for sport and for our water. I stood guard over tents that were folded and gone by morning, year after year.", fx = { learn = { "centaur" } } } },
      choices = {
        { text = "And then Cairne brought you here.", next = "before_cairne" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before_cairne = {
      lines = { { id = "bc_default", text = "Cairne and the orcs together, for it took both to break the centaur's hold on the road. The first night we camped beside Stonebull Lake I slept without my spear in my hand, and I had not done that since I was a calf.", fx = { learn = { "cairne" } } } },
      choices = {
        { text = "The Horde paid that debt gladly.", next = "BACK", when = { race = { "Orc", "Troll" } }, reply = "And we pay ours in turn, which is why you will never want for a fire in Mulgore.", fx = { affinity = 1 } },
        { text = "You earned that sleep. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    find = {
      lines = { { id = "f_default", text = "Baine Bloodhoof sits by the great totem, and the inn is the long tent where Kauth keeps the fire. The trainers and the crafters have the lodges around the edge, and any brave you pass will point you the rest of the way." } },
      choices = { { text = "Thank you. Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "o_default", text = "They are good braves, every one, though Strongbash talks too much and Darksky not enough. I trained half of them, so I may say so." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have carried a spear for the Bloodhoof through the wandering years and all the years since, and I have no wish to put it down." } },
    centaur = { { id = "tp_ce", text = "They hunted us across the Barrens for generations, and I will not hear them spoken of lightly." } },
    cairne = { { id = "tp_ca", text = "I have followed him since he was a young chief with more courage than followers, and he has never led us wrong." } },
    thrall = { { id = "tp_th", text = "He gave us the strength to win a home, and he asked only friendship for it." } },
    _none = { { id = "tp_none", text = "In all my years I have not learned that, so it must not be worth the knowing, or else Baine knows it." } },
  },
}

---------------------------------------------------------------------------
-- Brave Ironhorn: Bloodhoof Village, by the trainers' lodges.
---------------------------------------------------------------------------
P:NPC {
  key = "brave_ironhorn", id = TODO_NPC("Brave Ironhorn"), name = "Brave Ironhorn", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "bloodhoof" }, temper = { "stern" }, values = { "discipline", "dutiful" },
  notices = { "class", "kit" },
  impression = {
    first = "Brave Ironhorn stands near the trainers' lodges in Bloodhoof Village with his back as straight as a totem pole. He looks over every weapon that passes him and has an opinion on how it is carried.",
    third = "{name} met Brave Ironhorn, who stands guard by the trainers' lodges in Bloodhoof Village.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "At ease, friend. You stand straight enough without my telling you. What brings you back?" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Stand straight when you speak to a brave, {class}. You have given me reason to be strict with you." },
    { id = "g_default", text = "Stand straight when you speak to a brave, {class}, and then tell me what you need." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and carrying yourself a little better than last time, I think." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Krang Stonehoof teaches your craft in the lodge behind me, and he will tell you what I am about to, which is that your grip is too tight." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your gear is in a poor state, and a warrior is judged by it. Mahnott Roughwound can mend it before it shames you in a fight." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Brave Ironhorn. My post is here by the lodges where the young are taught, and I see to it that what they learn inside is not forgotten the moment they step outside." },
      },
      again = {
        { id = "h_again", text = "Speak plainly, as a brave should." },
        { id = "h_again2", text = "What else? Speak it plainly; I have no patience for a question that hides behind its own tail." },
      },
      choices = {
        { text = "Who teaches in these lodges?", next = "trainers" },
        { text = "You're hard on the young ones.", next = "hard" },
        { text = "How does a tauren become a brave?", next = "brave" },
        { text = "What weapon do you carry?", next = "yweapon" },
        { text = "What worries you about the young?", next = "yworry" },
        { text = "Have you fought the Venture Company?", next = "yventure" },
        { text = "Which of the young ones shows the most promise?", next = "w7_promise" },
        { text = "As you were, brave.", next = "END" },
      },
    },
    w7_promise = {
      lines = {
        { id = "w7_promise_l1", text = "A girl named Tahsi, who trains with Krang Stonehoof and cannot hold a spear straight yet, but who gets up every single time she falls. I have watched her fall forty times in a morning, and she has never once stayed down." },
      },
      choices = {
        { text = "That's courage.", next = "w7_promise2" },
        { text = "Falling forty times isn't promise.", next = "w7_promise3" },
        { text = "Something else, Ironhorn.", next = "BACK" },
      },
    },
    w7_promise2 = {
      lines = {
        { id = "w7_promise2_l1", text = "It is the only courage that matters, in the end. Skill can be taught; getting up cannot. I do not tell her this, because she would stop trying so hard." },
        { id = "w7_promise2_l2", when = { class = "WARRIOR" }, text = "It is. You'll know, as a warrior: the ones who get up are the ones who last. Do not tell her I said so; she would become proud, and pride falls harder than she does." },
      },
      choices = {
        { text = "Your secret is safe.", next = "BACK", reply = "Good. Let her keep falling." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_promise3 = {
      lines = {
        { id = "w7_promise3_l1", text = "It is the start of it. The ones who fall forty times learn forty ways not to fall." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    trainers = {
      lines = { { id = "t_default", text = "Krang Stonehoof has the warriors and Yaw Sharpmane the hunters, and the druids and shaman have their own teachers nearby. For the crafts, Chaw Stronghide and Yonn Deepcut work hides, and Vira Younghoof will show you how to bind a wound." } },
      choices = { { text = "That's a great deal of teaching. Something else.", next = "BACK" } },
    },
    hard = {
      lines = { { id = "hd_default", text = "I am exactly as hard as the plains will be, and no harder. A swoop does not care that a young hunter was tired, and a gnoll will not wait while he remembers which end of the spear to hold." } },
      choices = {
        { text = "Did someone treat you the same?", next = "hard_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard_who = {
      lines = { { id = "hw_default", text = "Brave Dawneagle did, and I cursed her for it every morning of my first year with the spear. I have thanked her for it every year since, though never where the young ones could hear." } },
      choices = { { text = "Your secret is safe. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    brave = {
      lines = { { id = "br_default", text = "By completing the rites the elders set, and then by standing a watch without complaint until the village forgets that you were ever a calf. The first part takes a season, and the second takes the rest of your life." } },
      choices = {
        { text = "I walked those rites at Narache.", next = "BACK", when = { race = "Tauren" }, reply = "Then you know the beginning of it, and the plains will teach you the remainder. Stand straight while they do.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  
    yweapon = {
      lines = {
        { id = "yironho_yweapon_d", text = "A spear of ironwood with a head of Thunder Bluff steel, given to me by Brave Dawneagle on the day I passed my rites. I have broken three shafts since then, and never the head. I mean to give it to my own student someday." },
        { id = "yironho_yweapon_v0", when = { class = "WARRIOR" }, text = "A spear of ironwood with a head of Thunder Bluff steel. You carry yourself like a warrior, so you will know that a weapon is only as good as the hand that learns it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yworry = {
      lines = {
        { id = "yironho_yworry_d", text = "That they learn to fight before they learn when not to. A young brave came back from the Venture camp last month, proud of the goblin he had killed. The goblin had been running away." },
      },
      choices = {
        { text = "What did you tell him?", next = "ytold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytold = {
      lines = {
        { id = "yironho_ytold_d", text = "That a fleeing enemy is not a victory, and that the Earth Mother saw what he did. His friends said I was too hard on him, that the goblins are destroying our land and deserve no mercy." },
      },
      choices = {
        { text = "You were right. Honour doesn't stop for goblins.", next = "BACK", reply = "I am glad you think so. He will hear it again from me, until he understands.", fx = { align = { honor = 1 } } },
        { text = "His friends have a point. The goblins started this.", next = "BACK", reply = "They did. But a brave does not stop being a brave because his enemy is not one.", fx = { align = { honor = -1 } } },
      },
    },
    yventure = {
      lines = {
        { id = "yironho_yventure_d", text = "Once, at their camp to the north. They have machines that eat trees and spit out boards, and they laugh while they do it. I broke one of the machines with my spear, and the goblins ran. I do not regret it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dawneagle = { { id = "yironho_tp_dawneagle", text = "Brave Dawneagle trained me, and she still watches the plains. Do not tell her she was right about me." } },
    lodges = { { id = "yironho_tp_lodges", text = "The trainers' lodges are the heart of Bloodhoof. Every brave in the village learned there." } },

    background = { { id = "tp_bg", text = "I have been a brave of Bloodhoof for many seasons, and I have never once been late to a watch." } },
    advice = { { id = "tp_adv", text = "Look after your weapon before you look after your supper, for only one of them will save your life." } },
    cairne = { { id = "tp_ca", text = "The chieftain fights at the front of the line even now, and that is the only kind of chief worth following." } },
    _none = { { id = "tp_none", text = "That is not a matter for my post, so ask one of the elders." } },
  },
}

---------------------------------------------------------------------------
-- Brave Leaping Deer: Bloodhoof Village, the shore of Stonebull Lake.
---------------------------------------------------------------------------
P:NPC {
  key = "brave_leaping_deer", id = TODO_NPC("Brave Leaping Deer"), name = "Brave Leaping Deer", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "bloodhoof" }, temper = { "cheerful" }, values = { "protective", "kind" },
  notices = { "pet", "class" },
  impression = {
    first = "Brave Leaping Deer keeps the lake side of Bloodhoof Village, and she is the youngest of the braves by some seasons. She watches the sky over the water as keenly as the shore, and she smiles easily for a guard.",
    third = "{name} met Brave Leaping Deer, who watches the lake shore of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Hello, friend! It's so good to see you. The lake is calm today, if you want a walk by the shore." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Hello, {class}. Mind the shore, and mind yourself. Folk here remember how you've behaved." },
    { id = "g_default", text = "Hello, {class}! Mind the shore if you go down to the water, because the swoops have been bold this season." },
    { id = "g_back", when = { metBefore = true }, text = "It is good to see you again, and the lake is as lovely as you left it." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "What a fine companion you have in {pet}! Keep it close by the water, though, because a swoop will try for anything smaller than a kodo." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Brave Leaping Deer, and I have the lake shore, which the others call the easy post. They have never had to chase a swoop off a calf who only wanted to wade." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? I do like the company." },
        { id = "h_again2", text = "Go on, I am listening with one ear and watching the sky with both eyes." },
      },
      choices = {
        { text = "Are the swoops truly that bold?", next = "swoops" },
        { text = "Tell me about the lake.", next = "lake" },
        { text = "You're young for a brave.", next = "young" },
        { text = "Why do you watch the swoops so closely?", next = "yswoop" },
        { text = "Who do you look up to?", next = "yhero" },
        { text = "What would you do if not a brave?", next = "yelse" },
        { text = "A hunter like you. Any advice for me?", next = "BACK", when = { class = "HUNTER" }, reply = "Watch the sky as well as the ground. The swoops will teach you that, whether you like it or not." },
        { text = "Do you swim in Stonebull Lake?", next = "w7_swim" },
        { text = "Keep the shore safe.", next = "END" },
      },
    },
    w7_swim = {
      lines = {
        { id = "w7_swim_l1", text = "Every morning, before my watch, when the water is cold enough to wake a kodo. Harn Longcast shouts at me from the bridge that I am scaring his fish, and I tell him the fish are glad of the company." },
      },
      choices = {
        { text = "Are they?", next = "w7_swim2" },
        { text = "Harn has a point.", next = "w7_swim3" },
        { text = "Something else, Leaping Deer.", next = "BACK" },
      },
    },
    w7_swim2 = {
      lines = {
        { id = "w7_swim2_l1", text = "I think so! A little sunfish follows me every morning, the same one, I am sure of it, with a nick in its tail. I have named it Harn, which Harn does not find as funny as I do." },
        { id = "w7_swim2_l2", when = { race = "Troll" }, text = "I think so! You'll know about swimming with fish, from the Echo Isles. A little sunfish follows me every morning; I named it Harn, after the fisherman, and he is very cross about it." },
      },
      choices = {
        { text = "That's a good name.", next = "BACK", reply = "I think so too. The fish has no opinion." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_swim3 = {
      lines = {
        { id = "w7_swim3_l1", text = "He does, and I swim anyway. A brave must have one foolish thing she loves, or the watch becomes too heavy." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    swoops = {
      lines = { { id = "s_default", text = "They are great carrion birds with a wingspan wider than I am tall, and they have learned that the village means food. Most only steal fish from the drying racks, but the hungry ones will dive at a child or a hound." } },
      choices = {
        { text = "How do you drive off a bird that size?", next = "swoops_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swoops_how = {
      lines = { { id = "sh_default", text = "I shout, and I throw, and if neither works I have my bow, though I would rather not use it over the heads of the little ones. Yaw Sharpmane says I shoot well enough to be a hunter, and I tell her that someone must mind the shore." } },
      choices = {
        { text = "A hunter's eye is wasted on a post.", next = "BACK", when = { class = "HUNTER" }, reply = "You sound just like Yaw! Perhaps one day, when there is another brave who likes children and dislikes birds." },
        { text = "The shore is lucky to have you. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    lake = {
      lines = { { id = "l_default", text = "Stonebull Lake is the heart of the village, for it waters the kodo and feeds half our fires. Uthan Stillwater teaches fishing on the shore, and he will be cross if you splash near his line." } },
      choices = { { text = "I'll keep my distance. Something else.", next = "BACK" } },
    },
    young = {
      lines = { { id = "y_default", text = "I am, and Brave Ironhorn reminds me of it daily. I finished my rites two summers ago and asked for a spear the very same evening, because I could not think of anything I wanted more than to look after this place." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  
    yhero = {
      lines = {
        { id = "yleapin_yhero_d", text = "Brave Rainchaser, who can read a night's passing in the mud. I follow her on my days off, and she pretends not to notice. She has taught me more about tracks than Yaw Sharpmane ever did." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yelse = {
      lines = {
        { id = "yleapin_yelse_d", text = "I would follow the herds, maybe, all the way to the Barrens and back. My grandmother did that before the tauren settled Mulgore, and she said there was no freedom like it. But Cairne says we must hold the plains now." },
      },
      choices = {
        { text = "Do you agree with Cairne?", next = "ycairne" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycairne = {
      lines = {
        { id = "yleapin_ycairne_d", text = "I do, mostly. The centaur drove us across the Barrens for generations, and here we are safe. But sometimes I think we have traded the wind for walls. My grandmother says I am too young to understand what safety costs." },
      },
      choices = {
        { text = "Cairne is right. A people needs a home to defend.", next = "BACK", reply = "My grandmother would agree with you. I am starting to, as well.", fx = { align = { order = 1 } } },
        { text = "The old ways had freedom. Don't let it be forgotten.", next = "BACK", reply = "I won't. I will walk the herds one day, if only for a season.", fx = { align = { order = -1 } } },
      },
    },
    yswoop = {
      lines = {
        { id = "yleapin_yswoop_d", text = "A swoop once took my brother's fishing catch, and I chased it all the way to the lake's far shore. I did not catch it. My brother still teases me about it, and I still look for that bird." },
        { id = "yleapin_yswoop_v0", when = { race = "Tauren" }, text = "A swoop once took my brother's catch, and I chased it across the lake shore. You know how brothers are. He still teases me, and I still look for that bird." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    stonebull_lake = { { id = "yleapin_tp_stonebull_lake", text = "Stonebull Lake waters the whole village. On calm mornings you can see the bluffs reflected in it." } },
    rainchaser = { { id = "yleapin_tp_rainchaser", text = "Brave Rainchaser is the finest tracker in Bloodhoof. I mean to be as good someday." } },

    background = { { id = "tp_bg", text = "I grew up wading in this lake, and now I guard the calves who wade in it, which seems right to me." } },
    advice = { { id = "tp_adv", text = "If a swoop's shadow crosses you, crouch and keep still, because they dive at whatever runs." } },
    earth_mother = { { id = "tp_em", text = "I think she must love this lake best of all, for she has made it so beautiful." } },
    _none = { { id = "tp_none", text = "Oh, I do not know that one! Brave Dawneagle will, because she knows everything." } },
  },
}

---------------------------------------------------------------------------
-- Brave Rainchaser: Bloodhoof Village, the west side toward Palemane Rock.
---------------------------------------------------------------------------
P:NPC {
  key = "brave_rainchaser", id = TODO_NPC("Brave Rainchaser"), name = "Brave Rainchaser", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "bloodhoof" }, temper = { "patient" }, values = { "watchful", "dutiful" },
  notices = { "class" },
  impression = {
    first = "Brave Rainchaser crouches at the west edge of Bloodhoof Village to read the ground more often than she stands to watch the horizon. She can tell you what crossed the grass in the night and how much it weighed.",
    third = "{name} met Brave Rainchaser, who watches the west side of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Greetings, friend. Your tracks are welcome ones, and I always know them now." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Greetings, {class}. I read your tracks as I read anyone's, carefully, and with an eye for trouble." },
    { id = "g_default", text = "Greetings, {class}. You came in from the east, by your tracks, and you have been walking a good while." },
    { id = "g_back", when = { metBefore = true }, text = "I knew your step before I saw you, for you favour the same foot you did last time." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You read the ground as you walk, as I do. Look there by the tall grass and tell me whether you see a gnoll's print or a wolf's." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Brave Rainchaser, and I watch the west, where the Palemane gnolls keep their rock. They creep close to the village after dark to see what they might steal, and they leave me a tidy record of it in the mud." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? I have time, for tracks do not run away." },
        { id = "h_again2", text = "Speak, friend, but softly; there are fresh Palemane prints by the west fence, and I am still reading them." },
      },
      choices = {
        { text = "Tell me about the Palemane.", next = "gnolls" },
        { text = "What do the tracks say today?", next = "tracks" },
        { text = "Rainchaser is an unusual name.", next = "name" },
        { text = "What's the hardest track you've followed?", next = "yhard" },
        { text = "How do you get along with the other braves?", next = "yothers" },
        { text = "Any trouble from the Venture Company?", next = "yventure" },
        { text = "What do gnoll tracks tell you that others don't?", next = "w7_gnoll" },
        { text = "Good hunting, brave.", next = "END" },
      },
    },
    w7_gnoll = {
      lines = {
        { id = "w7_gnoll_l1", text = "That they are afraid, nearly always. A gnoll walks on its toes, ready to run, and the prints are deep at the front and shallow at the heel. The only time I see a full print is when there are many of them together." },
      },
      choices = {
        { text = "So you can tell when they gather?", next = "w7_gnoll2" },
        { text = "Fear makes them dangerous.", next = "w7_gnoll3" },
        { text = "Something else, Rainchaser.", next = "BACK" },
      },
    },
    w7_gnoll2 = {
      lines = {
        { id = "w7_gnoll2_l1", text = "I can, and I tell Baine at once. The last time I saw full prints, there were fourteen gnolls in the brush by the west fields, and we were ready for them before they were ready for us." },
        { id = "w7_gnoll2_l2", when = { class = "HUNTER" }, text = "I can, and you could learn to as well. Look at the heel. A scared gnoll never puts its heel down; a bold one does. When you see heels, run for help, because they are not alone." },
      },
      choices = {
        { text = "Useful to know.", next = "BACK", reply = "It has kept this village safe more than once." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_gnoll3 = {
      lines = {
        { id = "w7_gnoll3_l1", text = "It does. A frightened thing bites harder than a hungry one. That is why I watch them so closely." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gnolls = {
      lines = { { id = "gn_default", text = "They are hyena-folk, cowardly alone and vicious in a pack, and they have taken the rocks to the west and south of the lake. They poach our game and leave the carcasses half eaten, which offends me more than the stealing." } },
      choices = {
        { text = "Why does the waste offend you more?", next = "gnolls_waste" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnolls_waste = {
      lines = { { id = "gw_default", text = "A thief at least wants what he takes. A hunter who kills and leaves the kill to rot has insulted the beast and the Earth Mother both, and that is the kind of neighbour who will never learn to live beside you.", fx = { learn = { "earth_mother" } } } },
      choices = {
        { text = "I use everything I kill.", next = "BACK", when = { any = { { profession = "Skinning" }, { class = "HUNTER" } } }, reply = "Then you hunt as we do, and the plains will not grudge you what you take.", fx = { affinity = 1 } },
        { text = "I see it. Something else.", next = "BACK" },
      },
    },
    tracks = {
      lines = { { id = "t_default", text = "Two gnolls came within a spear's cast of the kodo pens before dawn and turned back, likely when Brave Darksky's shadow moved. A prairie wolf followed them out again, hoping for scraps, and was disappointed." } },
      choices = { { text = "You see all that in the mud? Something else.", next = "BACK" } },
    },
    name = {
      lines = { { id = "n_default", text = "The best tracking is done just after rain, when the ground is soft and everything that moves must sign its name. My mother followed the storms for that reason, and I was born at the edge of one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  
    yhard = {
      lines = {
        { id = "yrainch_yhard_d", text = "A gnoll scout who walked backwards in his own tracks for a full mile, and then climbed a tree. I nearly lost him at the river. When I found him, he was asleep in the branches, and I could not bring myself to wake him with a spear." },
      },
      choices = {
        { text = "What did you do?", next = "ydo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydo = {
      lines = {
        { id = "yrainch_ydo_d", text = "I took his weapons and left him a warning cut into the bark. Brave Ironhorn says I should have killed him, that he will only come back with others. My mother says a hunter who kills a sleeping enemy hunts without honour." },
      },
      choices = {
        { text = "Your mother is right. You showed honour.", next = "BACK", reply = "I believe so. I will not change my mind, whatever Ironhorn says.", fx = { align = { honor = 1 } } },
        { text = "Ironhorn has a point. The gnoll will return.", next = "BACK", reply = "He might. If he does, I will not let him sleep again.", fx = { align = { honor = -1 } } },
      },
    },
    yothers = {
      lines = {
        { id = "yrainch_yothers_d", text = "Well enough. Leaping Deer follows me on her days off and thinks I do not notice. Ironhorn thinks I am too soft. Swiftwind and I share news over the fire. We are a family, in our way." },
        { id = "yrainch_yothers_v0", when = { race = "Tauren" }, text = "Well enough, as braves do. You know how it is, a village of quarrelling siblings who would die for one another." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yventure = {
      lines = {
        { id = "yrainch_yventure_d", text = "Their machines leave tracks I cannot read, deep ruts and oil that kills the grass. I have followed them to their camps in the north, and I do not like what I found. Baine knows of it already." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    palemane = { { id = "yrainch_tp_palemane", text = "The Palemane gnolls are clever in small ways. They are learning our patrols, and I am learning theirs." } },
    tracks = { { id = "yrainch_tp_tracks", text = "Every creature writes its story in the mud. The trick is to read it before the rain washes it away." } },

    background = { { id = "tp_bg", text = "I was a tracker for the hunt before I took a brave's spear, and I find the two are much the same work." } },
    earth_mother = { { id = "tp_em", text = "She writes everything that happens on her skin, for those who trouble to read it." } },
    advice = { { id = "tp_adv", text = "Look at the ground before you make camp, because whatever slept there last night may come back tonight." } },
    _none = { { id = "tp_none", text = "There are no tracks leading to that answer, I am afraid." } },
  },
}

---------------------------------------------------------------------------
-- Brave Rockhorn: patrols just south of Bloodhoof Village.
---------------------------------------------------------------------------
P:NPC {
  key = "brave_rockhorn", id = TODO_NPC("Brave Rockhorn"), name = "Brave Rockhorn", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "bloodhoof" }, temper = { "stolid" }, values = { "dutiful", "steadfast" },
  notices = { "race" },
  impression = {
    first = "Brave Rockhorn walks the road just south of Bloodhoof Village at the pace of a grazing kodo. He takes his time before he answers, and what he says is never more than is needed.",
    third = "{name} met Brave Rockhorn, who patrols the road south of Bloodhoof Village.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "You've reached Bloodhoof again, friend, and the village is the better for it." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "You have reached Bloodhoof, {class}. The road behind you is open, should you wish to take it back." },
    { id = "g_default", text = "You have reached Bloodhoof Village, {class}, and the road behind you is the one I keep." },
    { id = "g_back", when = { metBefore = true }, text = "You are on the south road again, and it is as you left it." },
    { id = "g_tauren", when = { race = "Tauren", maxLevel = 8 }, text = "You are fresh down from Red Cloud Mesa, I think, for you still have its dust on your hooves. Welcome to the wide plains, young one." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "I walked up from Camp Narache on this same road, a good many seasons ago. It seemed longer then." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Brave Rockhorn. I walk the south road between the village and the pass up to Red Cloud Mesa, and I see the young ones in when they come down from Camp Narache." },
      },
      again = {
        { id = "h_again", text = "Ask, and I will think on it. I am a slow answerer, but I have never had to take an answer back." },
        { id = "h_again2", text = "There is no hurry, so say what you wish." },
      },
      choices = {
        { text = "Seeing the young ones home safely is good work.", next = "BACK", reply = "It is the best work I know, and I thank you for seeing it.", fx = { align = { honor = 1 } } },
        { text = "The young ones should learn to find their own way.", next = "BACK", reply = "They will, in time. Until then, I walk the road.", fx = { align = { honor = -1 } } },
        { text = "What lies south of here?", next = "south" },
        { text = "Where should a newcomer go first?", next = "first" },
        { text = "Lightninghorn says his road is quiet.", next = "lightning", when = { heardLine = "brave_lightninghorn.rw_default" } },
        { text = "You're a tauren of few words.", next = "words" },
        { text = "What do the young ones say coming down from Narache?", next = "young" },
        { text = "This road has seen a great many hooves.", next = "road" },
        { text = "You'd make a fine tracker, walking this road every day.", next = "tracks", when = { class = "HUNTER" } },
        { text = "Vira says you let her treat others first.", next = "w7_vira" },
        { text = "I'll walk on.", next = "END" },
      },
    },
    w7_vira = {
      lines = {
        { id = "w7_vira_l1", text = "She talks too much, that one, though she bandages well. The young brave was frightened, and I was not, and a wound waits better than fear does." },
      },
      choices = {
        { text = "Weren't you in pain?", next = "w7_vira2" },
        { text = "You could have bled out.", next = "w7_vira3" },
        { text = "Something else, Rockhorn.", next = "BACK" },
      },
    },
    w7_vira2 = {
      lines = {
        { id = "w7_vira2_l1", text = "I was. But pain is only the body talking, and I have learned to let it talk without listening too closely. The young one's fear was louder than my shoulder." },
        { id = "w7_vira2_l2", when = { class = { "WARRIOR", "PALADIN" } }, text = "I was. You'll know how it is; pain is the body talking, and a warrior learns when to listen and when to let it speak to itself. The boy's fear was the louder wound." },
      },
      choices = {
        { text = "You're tougher than most.", next = "BACK", reply = "I am only old. Old is a kind of tough." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_vira3 = {
      lines = {
        { id = "w7_vira3_l1", text = "I could have. I did not. Vira is very good at her work, and I knew it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    young = {
      lines = { { id = "young_d", text = "They talk of the wolves and the Bristleback, and of the first time they held a spear against something that meant to kill them. Most are proud, a few are frightened, and every one of them asks how far it is to Bloodhoof." } },
      choices = {
        { text = "What do you tell the frightened ones?", next = "young_fear" },
        { text = "I asked the same question, I think.", next = "BACK", reply = "Most do. The road is longer for the first time, and shorter every time after." },
        { text = "Something else.", next = "BACK" },
      },
    },
    young_fear = {
      lines = { { id = "young_fear_d", text = "That fear is the plains teaching them to listen, and that the plains are a good teacher if you heed them. Then I walk beside them for a while without talking, which helps more than anything I could say." } },
      choices = {
        { text = "Silence is a good comfort.", next = "BACK", reply = "It is the only kind I am good at giving, so I am glad it works." },
        { text = "Another question.", next = "BACK" },
      },
    },
    road = {
      lines = { { id = "road_d", text = "It has, and more every year. Caravans come down from Thunder Bluff and go east toward the Barrens, and the orcs who pass this way always ask why the tauren road is so slow, and I tell them it is a road for walking, not for running." } },
      choices = {
        { text = "Where does the road lead, past Mulgore?", next = "road_barrens" },
        { text = "Orcs are always in a hurry.", next = "BACK", reply = "They are, and they arrive tired. We take our time and arrive ready." },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_barrens = {
      lines = { { id = "road_barrens_d", text = "Out through the gate and down into the Barrens, to the Crossroads and beyond. It is a hot, dry country, and the centaur ride there too, so the young ones who go that way should carry water and keep their spears close." } },
      choices = {
        { text = "I'll be careful.", next = "BACK" },
        { text = "Another question.", next = "BACK" },
      },
    },
    tracks = {
      lines = { { id = "tracks_d", text = "I have learned a little of it, {class}. The plainstriders leave three toes, the wolves leave four, and the gnolls leave the marks of their boots and of what they have dragged behind them, and I know them all by now." } },
      choices = {
        { text = "You'd do well among the hunters.", next = "BACK", reply = "Perhaps, but I would miss the road. A watch is a hunter's patience without the kill." },
        { text = "Something else.", next = "BACK" },
      },
    },
    south = {
      lines = { { id = "s_default", text = "The road runs south across the plain and climbs to Red Cloud Mesa, where the Hawkwind keep Camp Narache and raise our young. West of the road the Palemane gnolls have a camp, and I keep them on their side of it." } },
      choices = {
        { text = "Do the gnolls test you often?", next = "south_gnolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    south_gnolls = {
      lines = { { id = "sg_default", text = "They tested me once, three of them together, on a night with no moon. They have not done so again, and I have not needed to say anything about it." } },
      choices = { { text = "I can imagine why. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    first = {
      lines = { { id = "f_default", text = "Go to Baine Bloodhoof by the great totem, who will know what the village needs. After that the inn, because nothing the plains ask of you will be done better hungry." } },
      choices = { { text = "Sound counsel. Something else.", next = "BACK" } },
    },
    lightning = {
      lines = { { id = "li_default", text = "His road is always quiet, and he is never quiet on it. I am glad to hear it all the same, and I thank you for carrying the word down." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    words = {
      lines = { { id = "w_default", text = "A rock does not need to say that it is a rock. I find that most things worth knowing about a brave can be seen by watching where he stands." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I came down from Camp Narache as a youth and took the south road as my watch, and I have not wanted another." } },
    advice = { { id = "tp_adv", text = "Keep to the road until you know the plain, and keep your pace until you know the road." } },
    cairne = { { id = "tp_ca", text = "He is a great chief, and that is all that needs saying." } },
    _none = { { id = "tp_none", text = "I do not know, and I would rather say so than guess." } },
  },
}

---------------------------------------------------------------------------
-- Brave Strongbash: Bloodhoof Village, by the inn.
---------------------------------------------------------------------------
P:NPC {
  key = "brave_strongbash", id = TODO_NPC("Brave Strongbash"), name = "Brave Strongbash", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "bloodhoof" }, temper = { "hearty" }, values = { "strength", "hospitality" },
  notices = { "class", "drink" },
  impression = {
    first = "Brave Strongbash fills the space outside the Bloodhoof inn the way a kodo fills a doorway. He greets every traveller as an old friend, and he sizes up each one as a possible wrestling partner.",
    third = "{name} met Brave Strongbash, who stands guard by the inn at Bloodhoof Village.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ho, friend! Come in, come in! There's a fire, and food, and I'll save you the warmest spot." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ho, {class}. There is a fire, and you may sit at it. Don't expect me to save you a place." },
    { id = "g_default", text = "Ho, {class}! Come in off the plain and be welcome, for there is a fire in the inn and stew on it." },
    { id = "g_back", when = { metBefore = true }, text = "Ho, my friend returns! You look thinner, and Kauth's stew will mend that." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Now there is a pair of shoulders! Tell me that you wrestle, friend, because no one in this village will give me a proper match any longer." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You have found the bottom of a cup or two, I see. Sit by the fire until the ground stops moving, and I will see that nobody trips over you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Brave Strongbash, and I keep the peace at the inn, which is mostly a matter of standing where people can see me. Nobody has started a quarrel at Kauth's fire in three seasons, and I admit that I find it a little dull." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I am glad of the talk." },
        { id = "h_again2", text = "Ask away, for I am planted here like the inn post, and about as easy to move." },
      },
      choices = {
        { text = "Who's inside the inn today?", next = "inn" },
        { text = "You wrestle?", next = "wrestle" },
        { text = "Does a tauren village need a guard at its inn?", next = "need" },
        { text = "Have you ever had to throw someone out?", next = "ythrow" },
        { text = "Who would you most like to wrestle?", next = "ywho" },
        { text = "Who's the best story-teller in the inn?", next = "ystory" },
        { text = "Who's the best wrestler you've ever faced?", next = "w7_wrestle" },
        { text = "I'll go in to the fire.", next = "END" },
      },
    },
    w7_wrestle = {
      lines = {
        { id = "w7_wrestle_l1", text = "An orc grunt from the Crossroads, half my size, who threw me over his shoulder in front of the whole inn. I lay on the floor and laughed so hard that Kauth thought I had hit my head, and the orc and I have been friends ever since." },
      },
      choices = {
        { text = "How did he throw you?", next = "w7_wrestle2" },
        { text = "You let him win.", next = "w7_wrestle3" },
        { text = "Something else, Strongbash.", next = "BACK" },
      },
    },
    w7_wrestle2 = {
      lines = {
        { id = "w7_wrestle2_l1", text = "He went low, under my arms, and used my own weight against me. Tauren wrestle by pushing, orcs by twisting, and I had never been twisted before. I have practised it since, and now I can throw any tauren in Bloodhoof." },
        { id = "w7_wrestle2_l2", when = { race = "Orc" }, text = "He went low and twisted, the way your people do. Tauren only push. If you'd like to try me, after my watch, I'll show you I've learned a few orc tricks since then." },
      },
      choices = {
        { text = "I'd like that.", next = "BACK", reply = "After my watch, then. Kauth will hold the coats." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_wrestle3 = {
      lines = {
        { id = "w7_wrestle3_l1", text = "I did not! Well, a little, at the very end. But he had already won." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    inn = {
      lines = { { id = "i_default", text = "Innkeeper Kauth, as always, and Magrin Rivermane, who has had the same seat by the fire for longer than I have had this post. There are usually a few travellers from Orgrimmar as well, come to see what grass looks like." } },
      choices = {
        { text = "What does Magrin do all day?", next = "inn_magrin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inn_magrin = {
      lines = { { id = "im_default", key = true, text = "He sits, and he listens, and he knows more about who has passed through Bloodhoof than I do, though I am the one standing at the door. Ask him yourself, for he is friendlier than he looks." } },
      choices = { { text = "I may do that. Something else.", next = "BACK" } },
    },
    wrestle = {
      lines = { { id = "w_default", text = "Every tauren wrestles as a calf, and I simply never stopped. I have thrown every brave in the village except Dawneagle, who refuses on the grounds that she has nothing to prove, and Rockhorn, who cannot be moved." } },
      choices = {
        { text = "I'd give you a match someday.", next = "BACK", when = { any = { { class = "WARRIOR" }, { race = "Orc" }, { race = "Tauren" } } }, reply = "Ha! I will hold you to that, and I will try not to break anything you need.", fx = { affinity = 2 } },
        { text = "I'll pass. Something else.", next = "BACK" },
      },
    },
    need = {
      lines = { { id = "n_default", text = "Not for our own, no. Travellers are another matter, for an orc and a Forsaken who have both had too much firewater will find something to disagree about, and it is easier to carry them out than to reason with them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  
    ythrow = {
      lines = {
        { id = "ystrong_ythrow_d", text = "Twice. An orc who wanted to fight a Forsaken, and a Forsaken who wanted to fight everyone. The orc apologised the next morning. The Forsaken never came back, and I am told he spoke ill of Bloodhoof in Undercity." },
      },
      choices = {
        { text = "Should you have let them fight it out?", next = "yfight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfight = {
      lines = {
        { id = "ystrong_yfight_d", text = "Some in the village say so, that a quarrel is better ended with fists than carried home in silence. Kauth says no fight in his inn, ever. I keep Kauth's rule, but I sometimes wonder if the others are wiser." },
      },
      choices = {
        { text = "Kauth's rule is right. The inn is for peace.", next = "BACK", reply = "Then I will keep it, and gladly. It is easier to stand than to fight.", fx = { align = { order = 1 } } },
        { text = "Let them settle it. A fair fight clears the air.", next = "BACK", reply = "A fair fight, maybe. But firewater makes few fights fair.", fx = { align = { order = -1 } } },
      },
    },
    ywho = {
      lines = {
        { id = "ystrong_ywho_d", text = "Cairne Bloodhoof, if he would ever agree, which he will not, because he is wise. Brave Dawneagle, if she would ever stop refusing. And you, perhaps, if you have the shoulders for it." },
        { id = "ystrong_ywho_v0", when = { race = "Tauren" }, text = "Cairne himself, though he would never agree. Dawneagle, who refuses. And you, friend, for you have the build of a tauren who wrestled as a calf." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ystory = {
      lines = {
        { id = "ystrong_ystory_d", text = "Magrin Rivermane, without a doubt. He has a story for every traveller and two for every brave. Ask him about the centaur war, if you have a whole evening to spare." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    kauth = { { id = "ystrong_tp_kauth", text = "Innkeeper Kauth keeps the best fire in Mulgore. He also keeps the peace, with my help." } },
    wrestling = { { id = "ystrong_tp_wrestling", text = "Every tauren calf wrestles. The trick is never stopping." } },

    background = { { id = "tp_bg", text = "I was the largest calf of my season and I am the largest brave of the village, so they put me where travellers would see me first." } },
    advice = { { id = "tp_adv", text = "Eat before you fight and rest before you travel, and you will live to be as big as I am." } },
    thrall = { { id = "tp_th", text = "The Warchief's people are welcome at this fire always, and I have yet to lose a wrestling match to one." } },
    _none = { { id = "tp_none", text = "Ha, you have me there, friend! Ask Magrin inside, for he hears everything." } },
  },
}

---------------------------------------------------------------------------
-- Brave Swiftwind: Bloodhoof Village, the bridge and road east toward the Barrens.
---------------------------------------------------------------------------
P:NPC {
  key = "brave_swiftwind", id = TODO_NPC("Brave Swiftwind"), name = "Brave Swiftwind", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "bloodhoof" }, temper = { "alert" }, values = { "dutiful", "loyal" },
  notices = { "race", "class" },
  impression = {
    first = "Brave Swiftwind watches the eastern road out of Bloodhoof Village and counts the caravans that come along it. She stands lightly, like a runner waiting for the word, and she has the news from the road before anyone else.",
    third = "{name} met Brave Swiftwind, who watches the eastern road at Bloodhoof Village.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Greetings, friend. If you came by the east road, tell me what you saw, for I trust your eyes." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Greetings, {class}. Tell me what you saw on the east road, and I'll decide how much of it to believe." },
    { id = "g_default", text = "Greetings, {class}. If you came by the eastern road, tell me what you saw on it, for I collect such news." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and I hope the road treated you well, because it has not treated everyone so." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Troll" } },
      text = "You will have come through the Barrens to reach us, and I would be glad to hear how the road stands at the pass." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Brave Swiftwind, and the eastern road is my watch. Everything that comes to Mulgore from the Barrens and from Orgrimmar comes along it, and so does every piece of news, good or ill." },
      },
      again = {
        { id = "h_again", text = "What else would you hear? I have the whole road's worth." },
        { id = "h_again2", text = "Ask, and then tell me something in return if you can." },
      },
      choices = {
        { text = "What news from the road?", next = "news" },
        { text = "Where does the eastern road lead?", next = "east" },
        { text = "You stand like someone ready to run.", next = "run" },
        { text = "What's your fastest run?", next = "yfast" },
        { text = "What did you find at the caravan?", next = "ycaravan" },
        { text = "Have you been to Orgrimmar?", next = "yorg" },
        { text = "What's the best news you ever carried?", next = "w7_best" },
        { text = "Safe watch, brave.", next = "END" },
      },
    },
    w7_best = {
      lines = {
        { id = "w7_best_l1", text = "The day the High Chieftain came home from Ashenvale after the battle at Mount Hyjal. I ran from the eastern pass to the lifts with the word that he was alive, and I did not feel my legs at all until the next morning." },
      },
      choices = {
        { text = "What was it like in the village?", next = "w7_best2" },
        { text = "That was a long time ago.", next = "w7_best3" },
        { text = "Something else, Swiftwind.", next = "BACK" },
      },
    },
    w7_best2 = {
      lines = {
        { id = "w7_best2_l1", text = "Everyone came out of their tents at once, and the drums started, and nobody stopped them for two days. Old Dawneagle wept openly, and I had never seen her weep, and I never have since." },
        { id = "w7_best2_l2", when = { race = "Tauren" }, text = "Every drum in Mulgore beat at once. You may have been a calf then, and heard them; it is a sound no Bloodhoof forgets. I hope I carry news like that again before I am too old to run." },
      },
      choices = {
        { text = "I hope so too.", next = "BACK", reply = "Thank you. Bring me some good news, if you find any." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_best3 = {
      lines = {
        { id = "w7_best3_l1", text = "Not so long. A runner remembers the good news longer than the bad, because the bad ones he tries to forget." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "The worst of it is the caravan that was struck on the plain east of the lake. The wagons still lie where they were broken, and I pass the place whenever I carry word to the pass, which is why I do not walk that stretch slowly." } },
      choices = {
        { text = "Who would attack a caravan in Mulgore?", next = "news_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    news_who = {
      lines = { { id = "nw_default", text = "There are folk enough who would, between the gnolls, the goblins' hired blades and worse things that leave fewer tracks. I report what I find to Baine and leave the judging to him, for a guard who guesses aloud starts fights." } },
      choices = {
        { text = "I'll look the wagons over myself.", next = "BACK", reply = "Then go carefully, and bring me whatever you learn, for I would rather know than wonder.", fx = { affinity = 1 } },
        { text = "A wise habit. Something else.", next = "BACK" },
      },
    },
    east = {
      lines = { { id = "e_default", text = "Across the plain to the pass in the eastern hills, and through it into the Barrens, where Camp Taurajo keeps a fire for our people. From there an orc could show you the road north to the Crossroads and on to Orgrimmar." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    run = {
      lines = { { id = "r_default", text = "I am the one who runs to Thunder Bluff when the village needs the chieftain to know something before nightfall. I have done it in less than half the time the walk should take, and I am prouder of that than of anything I have done with a spear." } },
      choices = {
        { text = "Travel form would beat you there.", next = "BACK", when = { class = "DRUID" }, reply = "It would, and I have raced a druid to the lifts to prove it. I lost, but not by as much as he expected.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  
    yfast = {
      lines = {
        { id = "yswiftw_yfast_d", text = "From Bloodhoof to the lifts of Thunder Bluff in less time than it takes to boil a kettle of tea, or so the elders say. I carried word of the caravan attack. Cairne received me himself and thanked me with a cup of water." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ycaravan = {
      lines = {
        { id = "yswiftw_ycaravan_d", text = "Goblin tracks, and something else, a heavy boot I did not know. Baine thinks it was hired swords from the Venture Company, sent to frighten traders away from Mulgore. I am not so sure." },
      },
      choices = {
        { text = "What do you think it was?", next = "ythink" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ythink = {
      lines = {
        { id = "yswiftw_ythink_d", text = "I think someone wants the caravans gone, so the plains are emptier, so their machines can take more. Some braves want to raid the Venture camps before they strike again. Baine says wait until we know more." },
      },
      choices = {
        { text = "Baine is right. Wait for proof.", next = "BACK", reply = "I will tell the braves so. They will grumble, but they will wait.", fx = { align = { order = 1 } } },
        { text = "Strike first. The tracks are proof enough.", next = "BACK", reply = "Many braves agree with you. Baine will hear their voices, and yours.", fx = { align = { order = -1 } } },
      },
    },
    yorg = {
      lines = {
        { id = "yswiftw_yorg_d", text = "Once, carrying a message. It is loud, red and hot, and the orcs shout at each other like brothers. I did not understand it at first. By the end of a week, I had begun to shout too." },
        { id = "yswiftw_yorg_v0", when = { race = "Orc" }, text = "Once, carrying a message. Your city is loud and red and hot, and your people shout like brothers. By the end of a week I was shouting too, and I missed it on the road home." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    taurajo = { { id = "yswiftw_tp_taurajo", text = "Camp Taurajo in the Barrens keeps a fire for our people. It is the first stop for anyone running east." } },
    caravans = { { id = "yswiftw_tp_caravans", text = "The caravans bring salt, iron and news. Without them, Mulgore would be very quiet indeed." } },

    background = { { id = "tp_bg", text = "I was a herd runner before I was a brave, and the village has made use of my legs ever since." } },
    advice = { { id = "tp_adv", text = "When you pass something wrong on the road, tell the next guard you meet, even if it seems small." } },
    venture_company = { { id = "tp_vc", text = "Their wagons use my road too, and I count every one, in and out." } },
    _none = { { id = "tp_none", text = "No word of that has come along my road yet, but I will listen for it." } },
  },
}
