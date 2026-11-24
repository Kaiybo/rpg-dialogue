-- Camp Taurajo: the tauren and orc camp in the southern Barrens. Voice: bibles/taurajo.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "jorn", id = TODO_NPC("Jorn Skyseer"), name = "Jorn Skyseer",
  bible = "bibles/taurajo.md", role = "trainer", tier = "quest",
  communities = { "taurajo" }, temper = { "patient" }, values = { "wise", "kind" },
  notices = { "class", "pet", "lock_pact" },
  impression = {
    first = "Beside him, the empty Barrens began to look far less empty.",
    third = "{name} met Jorn Skyseer, the patient tauren at Camp Taurajo who teaches hunters to see the life hidden on the Barrens.",
  },

  greetings = {
    { id = "g_camp", text = "The Barrens look empty to those who don't know where to look. Sit; I'll show you where to look." },
    { id = "g_back", when = { metBefore = true }, text = "The hunter returns. Tell me what the grass showed you." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, hunter, so tell me what the grass showed you in all that time." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You walk more quietly than you did when you first sat by my fire, and you've grown strong besides. The Barrens has been a good teacher to you." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I'm told you said something in Taurajo that warmed someone's heart. A good hunter is patient with people as well as prey." },
    { id = "g_kw_soured", when = { thread = { id = "kolkar_war", state = "soured" } }, text = "Regthar's grunts rode down the centaur who were running home, I hear. The Kolkar in Desolace will count those dead, and a people who count their dead remember who did the killing." },
    { id = "g_walk", when = { origin = "tauren_long_migration" }, text = "You crossed this grass once already, on the long walk, with the centaur riding at our flanks. Sit, and I'll show you that the Barrens has a life of its own beyond the road we fled along, if you sit still long enough to see it." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter? Then you're my student, whether you meant to be or not. Sit down." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your companion trusts you; I can see it in how it stands. Earn that every day." },
    { id = "n_lock_pact", cat = "lock_pact", when = { class = "WARLOCK", aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "Your skin is flushed like a lion's before it springs, and I'd guess the little fire-thing you keep has put a fever in your blood. The plainstriders will smell it long before you're in bowshot, so hunt downwind." },
  },

  start = "hello",
  nodes = {
    xpt_jorn = {
      big = true,
      lines = { { id = "xpt_jorn_default", text = "Because we would choose those who agree with us, and we learn nothing from them. Cairne chose to march beside the orcs when many tauren thought them savages, and now Mulgore is safe from the centaur, so I'd say the Earth Mother knew best." } },
      choices = {
        { text = "Strangers become kin once they've shared the hunt.", next = "BACK", reply = "They do, and the fire burns warmer for every new face around it. Hunt beside us long enough, and Taurajo will call you kin without your asking.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some strangers stay strangers. I trust my own judgment.", next = "BACK", reply = "Trust it, then, but let it grow with the seasons, as the grass does. I've misjudged a stranger or two myself, and I was glad to be wrong.", fx = { align = { honor = -1 } } },
        { text = "Something else, Jorn.", next = "BACK" },
      },
    },
    xcl_rfk = {
      big = true,
      lines = { { id = "xcl_rfk_default", text = "Then you've seen where the quilboar were born, or where they believe they were. The Kraul grew from the body of Agamaggan, the great boar, and the quilboar guard it like a temple while their crone Charlga whispers to powers that should never have been invited in. I've hunted the Barrens all my life, and I've never once sent a student in there." } },
      choices = {
        { text = "It's their sacred ground, Jorn. I went in with respect.", next = "BACK", reply = "Then the great boar's spirit may have noticed, and so have I. I've watched proud hunters walk into those thorns and not walk out.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sacred or not, the quilboar raid our caravans.", next = "BACK", reply = "They do, and I won't pretend otherwise when the caravans come in bleeding. Strike at the raiders if you must, but leave the thorns their sleep.", fx = { align = { honor = -1 } } },
        { text = "Charlga must be hiding something down there.", next = "xcl_rfk2" },
      },
    },
    xcl_rfk2 = {
      lines = { { id = "xcl_rfk2_default", text = "The scouts say her Death's Head priests deal in death magic now, and Razorfen Downs beyond the Kraul is full of things that won't stay dead. A quilboar crone bargaining with that kind of power is something I'd never have believed, and I still don't like to say it aloud." } },
      choices = { { text = "Then I'll watch the Downs as well, Jorn.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They see a stranger, because the tauren never needed the Light; we live by the Earth Mother and the hunt. But you are very still, as the dead are, and perhaps the Light is something like that, a stillness inside you that waits." } },
      choices = {
        { text = "Perhaps. I'll learn your stillness, Jorn.", next = "BACK", reply = "Then sit with me at dusk and watch the plains, and we'll see who learns more from whom. The Earth Mother is patient with strangers, and so am I.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light isn't stillness. It's a weapon.", next = "BACK", reply = "Perhaps it is, in your hands. But even a spear is still before it flies, and the hunter who forgets that misses more than he hits.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "A patient hunter seldom needs one, but the Barrens punishes the impatient, and I have carried more than one young student back from the Gold Road. My people pray to the Earth Mother and not to your loa or your shadow, but I have never turned a healer away from Taurajo." } },
      choices = {
        { text = "Then I'll guard your students' lives as you guard their lessons.", next = "BACK", reply = "Then you'll be welcome at my side, and the young ones will be glad of you. I've sung over too many young ones who hunted bravely and never came home.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Impatient students learn from their wounds. I'd let them.", next = "BACK", reply = "Some lessons cost blood, it's true, but I'd rather they paid in scratches than in graves. Stay near enough to keep it to scratches, if you can.", fx = { align = { light = -1 } } },
        { text = "Something else, Jorn.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That every fight starts long before the first blow, in the grass and the wind and the tracks. The quilboar of the Razormane learned to strike from the brush because they watched the lions, and a warrior who learns the same will not walk into their ambushes." } },
      choices = {
        { text = "I'll watch the grass before I charge.", next = "BACK", reply = "Then the lions will have taught you, and the Razormane will find you waiting when they come. That's the whole lesson, young one, and it takes a lifetime.", fx = { align = { order = 1 } } },
        { text = "A strong arm needs no patience. I'll charge.", next = "BACK", reply = "A strong arm with no eyes behind it feeds the lions, and I've seen it happen. Charge if you must, but don't say Jorn never warned you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The strongest I know belongs to Lakota'mani, the great kodo. He has walked the plains so long that the herders say the earth spirits walk with him, and when you face him you face something older than the tauren, so face him with respect." } },
      choices = {
        { text = "I'll face him honorably, however old he is.", next = "BACK", reply = "Then the earth spirits will see it, and they'll judge you kindly whatever the outcome. Go well, and walk back to me with your bow and your honor whole.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A spirit's age won't save a beast from a careful hunter.", next = "BACK", reply = "Careful you may be, but Lakota'mani has outlived many careful hunters, and I knew some of them. Go with respect, and come back to tell me what you saw.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then we were taught by the same teacher, though yours lived in the shadows and mine lived in the tall grass. A lion waits in the grass until the zhevra forget it, and I suspect you wait in the dark for much the same reason, so remember that the lion only takes what it needs." },
      },
      choices = {
        { text = "I'll take only what I need, as the lion does.", next = "BACK", reply = "Then you hunt as the plains do, and the Earth Mother will not begrudge you. Walk in shadow or in grass, but walk lightly.", fx = { align = { light = 1 } } },
        { text = "A good hunter takes everything it can carry.", next = "BACK", reply = "And then it carries nothing home when the herds are gone. The lion that takes everything starves in the second winter, and so will you.", fx = { align = { light = -1 } } },
        { text = "What does a hunter learn first?", next = "first" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They are uneasy, because the arcane smells strange to them, the way the air does before a storm. Tauren have always been wary of that kind of power, so do your casting away from the herds, and the beasts will learn to forgive you in time." },
      },
      choices = {
        { text = "I'll keep away from the herds. They have their ways.", next = "BACK", reply = "They do, and the kodo will remember your kindness long after they've forgotten your smell. So will the herders, which counts for more in Taurajo.", fx = { align = { order = 1 } } },
        { text = "The beasts will just have to get used to me.", next = "BACK", reply = "They will, eventually, as the grass gets used to a storm. But the storm never asks the grass, and I'd hoped you'd be a gentler weather.", fx = { align = { order = -1 } } },
        { text = "What's the first thing a hunter learns?", next = "first" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Patience, if you'll take it, because a hunter waits for the beast to come to him, and I think your kind is too used to calling things that come at once. Watch the herds on the plain for an hour before you go after the centaur, and you'll see more than anything that whispers to you ever showed you." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Patience, if you'll take it, and I see your demon has none, because it hasn't stopped watching the herd since you arrived. Sit with me and watch the plain for an hour, and you'll learn more of the centaur than that thing at your heel could ever tell you." },
      },
      choices = {
        { text = "I'll learn your stillness, Jorn. Power can wait.", next = "BACK", reply = "That's a rare thing to hear from one of your kind, and it gladdens me. Watch the herds tomorrow, and come tell me what they taught you.", fx = { align = { order = 1 } } },
        { text = "I've no time for waiting. What I call answers now.", next = "BACK", reply = "And what answers quickly leaves quickly, or it stays and takes more than it gave. I hope your power is kinder to you than I fear.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_tauren", tags = { "news" }, when = { party = { race = "Tauren" } },
          text = "You walk with one of my people, and the winds tell me {companion} has been watching your back for many miles. The Earth Mother sends us the companions we need, though rarely the ones we would have chosen." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. Sit still a moment, if you can, and let the Barrens look at you." },
        { id = "h_default", key = true,
          text = "Jorn Skyseer is my name, and I teach young hunters the ways of the wild, here where it's safe enough to learn. The Barrens are full of life for those with the patience to see it." },
        { id = "h_cl_rfk", tags = { "news" }, when = { cleared = "Razorfen Kraul", faction = "Horde" }, text = "You went down into the thorns of Razorfen Kraul and came back. Sit a while, because I can see the quilboar's brambles still caught in your gear." },
        { id = "h_ishamuhale", tags = { "news" }, when = { questActive = TODO_QUEST("Ishamuhale") },
          text = "Ishamuhale is a thunder lizard, older and fiercer than the rest. Bring me proof that you faced it, and we'll talk about what's next." },
        { id = "h_lakota", when = { questActive = TODO_QUEST("Lakota'mani") },
          text = "Lakota'mani walks the plains like a moving hill. Bring me his hoof, because that hunt is a lesson in patience as much as courage." },
        { id = "h_owatanka", when = { questActive = TODO_QUEST("Owatanka") },
          text = "Owatanka is the thunderhawk who rules the sky over the southern Barrens. Face it, and you'll have learned something no one can teach." },
        { id = "h_washte", when = { questActive = TODO_QUEST("Washte Pawne") },
          text = "Washte Pawne is a wind serpent out of the old stories. Few hunters ever see it, and fewer come back to describe it." },
        { id = "h_dr_stone", when = { questActive = TODO_QUEST("Body and Heart") },
          text = "Turak's lunardust is on you; I can smell the moonglow from here. The Moonkin Stone is west of here, just before the grass turns to Mulgore, behind a tree south of the road, and Lunaclaw is a good deal faster than he looks." },
        { id = "h_dr_cat", when = { class = "DRUID", minLevel = 20, maxLevel = 30 },
          text = "You've the cat's shape now, druid, or you're close to it. Sit with me a while, and I'll show you how the lions of the Barrens decide which gazelle to chase, because the shape won't teach you that." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, here at Taurajo. The Earth Mother speaks to you through the elements and to me through the beasts, and I think we would both tell you to sit quietly and listen." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior in Taurajo. You've come to the right place, because the Barrens teach patience to anyone who listens, even those who carry axes." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. You will not find many of your kind among my students, but sit, because stillness is a lesson for anyone who listens." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Sit, then, and be still, because stillness is a lesson for every path. Even the one that leaves that cold about you." },
      },
      choices = {
        { text = "The great beasts of the Barrens must carry strong spirits.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I'd guess a hunter learns to shoot before anything else.", next = "first" },
        { text = "Teach me the four great beasts, teacher.", next = "hunter", when = { class = "HUNTER" } },
        { text = "How do I know my companion trusts me?", next = "pet", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "My people hunted with spears and voodoo, not patience.", next = "troll", when = { race = "Troll", class = "HUNTER" } },
        { text = "The skies of my home had beasts too.", next = "skyborne", when = { race = "Skyborne", class = "HUNTER" } },
        { text = "I'd guess you teach only hunters.", next = "druid", when = { class = "DRUID" } },
        { text = "Stillness is my first lesson too, teacher.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The beasts seem uneasy when I cast near them.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What can a warrior learn from you, Jorn?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "A hunter must have little need of a priest, Jorn.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is there anything someone like me could learn from a hunter?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do the Barrens see in me, Jorn?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I've been to the heart of Razorfen Kraul, Jorn.", next = "xcl_rfk", when = { cleared = "Razorfen Kraul", faction = "Horde" } },
        { text = "Why would she send companions we wouldn't choose?", next = "xpt_jorn", when = { party = { race = "Tauren" } } },
        { text = "I herded kodo before the Kolkar took my herd, Jorn.", next = "xorig_kodo", when = { origin = "tauren_kodo_herder" } },
        { text = "Thank you, teacher.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else would you learn? Sit, there's light enough yet." },
        { id = "h_again2", text = "Another question? Good, because a hunter who stops asking soon stops seeing the grass." },
      },
    },
    xorig_kodo = {
      lines = {
        { id = "xko_default", text = "Then you know the herds better than most of the hunters I teach, and you know what it is to lose one. The Kolkar still raid the trails west of here. Is it vengeance you want from them, or only the road back?" },
      },
      choices = {
        { text = "Vengeance. They took my uncle, and they'll pay for it.", next = "BACK", reply = "Then hunt them, and may your uncle's spirit guide your arrows. But vengeance burns hot and short, so take care it doesn't burn you as well.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "I want the trails safe for the next herder, nothing more.", next = "BACK", reply = "That is a herder's heart, and your uncle would be proud of it. The trails will be safer for your passing, and the herds will thank you.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I haven't decided yet, Jorn.", next = "BACK" },
      },
    },
    hunter = {
      big = true,
      lines = {
        { id = "hu_default", text = "Ishamuhale, Lakota'mani, Owatanka and Washte Pawne: the lizard, the kodo, the hawk and the serpent. Each one teaches something a bow can't, and a hunter who has faced all four can call the Barrens home." },
        { id = "hu_runner", when = { origin = "tauren_plains_runner" },
          text = "You've run these plains since you could stand, so you've seen Lakota'mani's tracks already, I'd wager. Now you'll learn why the runners never follow them alone." },
        { id = "hu_orc", when = { race = "Orc" },
          text = "Orc hunters come to me thinking a beast is something to break. The four will teach you otherwise, if you let them, and if you don't, Lakota'mani will teach you with his hooves." },
      },
      choices = {
        { text = "Which should I face first?", next = "hunter_first" },
        { text = "What does the thunderhawk teach?", next = "j_hawk" },
        { text = "And when all four are behind me?", next = "j_after", when = { minLevel = 20 } },
        { text = "I'll face them to honor the land.", next = "BACK", reply = "Then the land will see it, and the four will test you fairly. Come home to me with their stories, and you'll be a hunter of the Barrens in truth.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'll face them for the trophies, teacher.", next = "BACK", reply = "Trophies fade and crack on the wall, young one, but the lesson stays in your hands. I hope you bring home both.", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    hunter_first = {
      lines = { { id = "hf_default", text = "Ishamuhale, the thunder lizard, because he'll teach you to read the ground before he charges. Then the kodo for patience, the hawk for the sky, and the serpent last, because she teaches humility, and that lesson hurts." } },
      choices = { { text = "I'll start with the lizard.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    j_hawk = {
      lines = {
        { id = "jh_default", text = "That not every danger comes along the ground. The thunderhawks nest on the cliffs of the southern Barrens and strike from a sky a hunter forgets to watch, and Owatanka is the oldest of them, with lightning in his wings. Bring me his talon, and you'll never forget to look up again." },
        { id = "jh_done", when = { questDone = TODO_QUEST("Owatanka") }, text = "You've already learned it, and I can see it in you, the way your eyes go to the sky every few breaths. Owatanka's talon hangs by my fire, and I thank him each morning for the lesson he gave you." },
      },
      choices = {
        { text = "Must the hunt end in a death to teach?", next = "j_hawk2" },
        { text = "Something else, teacher.", next = "hunter" },
      },
    },
    j_hawk2 = {
      big = true,
      lines = { { id = "jh2_default", text = "Not always, and the young ones never believe me. A hunter can learn the hawk by watching it for a season, but the Barrens are short of seasons and long on Kolkar, so I send you after the old ones, who have lived long enough and taught us much." } },
      choices = {
        { text = "Then I'll take only the old ones, and give thanks.", next = "hunter", reply = "That is the way of Taurajo, and you walk it well. The Earth Mother sees.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A lesson that kills nothing is soon forgotten.", next = "hunter", reply = "Sometimes, young one, and that is why I send you. But I hope you remember the watching too.", fx = { align = { light = -1 } } },
        { text = "Something else, teacher.", next = "hunter" },
      },
    },
    j_after = {
      lines = {
        { id = "ja_default", text = "Then the Barrens have taught you what they can, and you go where the hunt is harder. My sister Mahren hunts the southern shore where the land meets the sea, and Senani Thunderheart at Splintertree Post keeps the Ashenvale hunt, where the beasts are guarded by night elves who would rather you didn't." },
        { id = "ja_all", when = { questDone = TODO_QUEST("Washte Pawne") }, text = "They are behind you, all four, and Washte Pawne's feather is proof enough. Go south to my sister Mahren on the shore, or north to Senani Thunderheart at Splintertree for the Ashenvale hunt, and later up to Melor Stonehoof on Hunter Rise, who sets the great hunts of our people." },
      },
      choices = {
        { text = "Hunting in Ashenvale will anger the night elves.", next = "j_ash" },
        { text = "Something else, teacher.", next = "hunter" },
      },
    },
    j_ash = {
      big = true,
      lines = { { id = "jas_default", text = "It will, and they have reason, for the forest is sacred to them as Mulgore is to us. But the Horde needs the timber and the game, and the night elves would rather we starved, so we hunt there carefully, and I teach my hunters to take only what they need, even there." } },
      choices = {
        { text = "Their forest is theirs. We should hunt elsewhere.", next = "hunter", reply = "There are tauren who say the same, and I respect them. But the Horde must eat, young one, and the Barrens are not enough.", fx = { align = { order = -1 } } },
        { text = "The Horde must eat. We hunt where we must.", next = "hunter", reply = "So we do, and quietly, and with thanks. Remember that the elves are watching, and so is the Earth Mother.", fx = { align = { order = 1 } } },
        { text = "Something else, teacher.", next = "hunter" },
      },
    },
    pet = {
      lines = {
        { id = "pe_default", text = "Watch {pet} when you're hurt. A beast that only follows you will hang back, but a beast that trusts you will put itself between you and the danger. When you see that, you'll have something no trainer can give you." },
      },
      choices = {
        { text = "{pet} already does that.", next = "pet_already" },
        { text = "Then I'll earn it.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    pet_already = {
      lines = { { id = "pa_default", text = "Then never send it into a fight you wouldn't walk into yourself. A beast's trust is the most patient thing in the world, and the easiest to spend." } },
      choices = { { text = "I won't.", next = "BACK", fx = { affinity = 2 } } },
    },
    troll = {
      lines = { { id = "tr_default", text = "Spears and voodoo have served the Darkspear well, and I won't ask you to give them up. But the Barrens are wider than any jungle, and out here the hunter who waits outlives the hunter who charges. Learn to wait, and then throw your spear." } },
      choices = {
        { text = "A headhunter strikes first. That's our way.", next = "BACK", reply = "And it has served you well in the jungle, I don't doubt it. Here the grass is long and the lions are patient, so strike first only when you've waited first.", fx = { align = { order = -1 } } },
        { text = "I'll learn your patience, and keep my spear.", next = "BACK", reply = "Then you'll be the most dangerous troll on these plains. The spear and the waiting together, that's the whole of hunting.", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    skyborne = {
      lines = { { id = "sk_default", text = "I'd like to hear of them one day, though I suspect your hawks were bigger than ours. The Windshaper hunters who came through Taurajo walked the grass as if they expected it to blow away beneath them, and they asked me the strangest questions." } },
      choices = {
        { text = "The ground here is very still.", next = "BACK", fx = { affinity = 2 } },
        { text = "What did they ask you?", next = "skyborne_ask" },
      },
    },
    skyborne_ask = {
      lines = { { id = "sa_default", text = "Whether the wind on the plains has a spirit that would answer them. I told them to ask Owatanka, the thunderhawk, and they laughed, but I wasn't joking." } },
      choices = { { text = "Maybe I'll ask him.", next = "BACK", fx = { affinity = 1 } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "Not only hunters. Hamuul Runetotem's druids come to sit with me now and then, to learn how a hunter reads the grass. A druid who can wear a cat's body still has to learn to think like one, and the cats here are very good teachers." } },
      choices = { { text = "Then teach me how a cat thinks.", next = "BACK", fx = { affinity = 2 } } },
    },
    first = {
      lines = { { id = "f_default", text = "No, a hunter learns stillness first. Anyone can run and anyone can shoot, but stillness is what lets you choose when to do either." } },
      choices = { { text = "I'll practice.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know. The plains might; ask them quietly, and the Earth Mother may let the grass answer." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother is in the stillness, and so a hunter must learn it first. Sit long enough and you will feel her breathing under the grass." } },
    centaur = { { id = "tp_centaur", text = "The centaur ride too loud to be good hunters, and they are always running from something or toward it. I have watched the Kolkar for years and never once seen them sit still." } },
    quilboar = { { id = "tp_quilboar", text = "Bristleback, Razormane, it is the same boar with a different temper. They hunt badly too, but they are clever when they are cornered, and every young hunter learns that once." } },
    cairne = { { id = "tp_cairne", text = "Cairne knows the stillness better than any of us. He can sit on the bluff and wait a whole day, and that patience is why the tauren have a home at all." } },
  },
}

P:NPC {
  key = "mangletooth", id = TODO_NPC("Mangletooth"), name = "Mangletooth",
  bible = "bibles/taurajo.md", role = "questgiver", tier = "quest",
  communities = { "taurajo" }, temper = { "scheming" }, values = { "cunning" },
  notices = { "race", "lock_shadow" },
  impression = {
    first = "He offers deals from his cage as though he held the keys.",
    third = "{name} met Mangletooth, a caged Razormane quilboar at Camp Taurajo with a grudge against his own kin and a deal for anyone who listens.",
  },

  greetings = {
    { id = "g_cage", text = "*snort* Come closer, come closer; Mangletooth doesn't bite, not through the bars." },
    { id = "g_back", when = { metBefore = true }, text = "*snort* You again, good. Mangletooth has a deal for you, because Mangletooth always has a deal." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "*snort* Tall cow-folk keep Mangletooth in a cage. Mangletooth remembers every face." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "*snort* Your shadow is wrong, because it lies toward the sun and not away. The Death's Head crones in the Kraul cast shadows like that, and Mangletooth does not trust them either." },
  },

  start = "hello",
  nodes = {
    xpt_mangletooth = {
      big = true,
      lines = { { id = "xpt_mangletooth_default", text = "Not fear, no, because they fear only Charlga and the voices she listens to, but they will count you, and quilboar who are busy counting enemies make mistakes. Go in many and come out many, and Mangletooth will hear the squealing from here and be glad." } },
      choices = {
        { text = "We go to break Charlga's hold on your people, Mangletooth.", next = "BACK", reply = "*snort* Free them? The tall one talks like a cow-folk, and Mangletooth likes it anyway. Go, and break the chains, and the Razormane will remember.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "We go for plunder. Your people are your own problem.", next = "BACK", reply = "*snort* Plunder, plunder, always plunder with the tall ones. Fine, take the shiny things, and let the squealing be loud enough for Mangletooth to hear.", fx = { align = { light = -1 } } },
        { text = "Something else, Mangletooth.", next = "BACK" },
      },
    },
    xcl_rfk = {
      big = true,
      lines = { { id = "xcl_rfk_default", text = "*snort* Then you walked on the bones of Agamaggan and the thorns let you live, so maybe the great boar did not mind you. Charlga Razorflank sits deep inside with her Death's Head priests and wants every tribe to kneel, but the Razormane kneel to no one. If you made her bleed, Mangletooth is not sorry." } },
      choices = {
        { text = "The quilboar should be left in peace in their holy place.", next = "BACK", reply = "*snort* Peace? Charlga does not want peace, she wants knees, and the Razormane will not bend them. The tall one is kinder than Mangletooth expected.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Kraul should be burned out, thorns and all.", next = "BACK", reply = "*snort* Burn the thorns and Agamaggan will grow them back through your bones. Mangletooth will laugh at the smoke, and then he will stop laughing.", fx = { align = { light = -1 } } },
        { text = "Who was Agamaggan to your people?", next = "xcl_rfk2" },
      },
    },
    xcl_rfk2 = {
      lines = { { id = "xcl_rfk2_default", text = "*snort* He was the great boar, who fought the demons in the old war and died, and his blood made the thorns. The quilboar live inside his body still, so when you walk the Kraul, you walk through him, and Mangletooth would like to see it once more before he dies in this cage." } },
      choices = { { text = "I'm sorry for your cage, Mangletooth.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "*snort* Mangletooth fears nothing, not even from inside a cage. But shining dead make the Razormane nervous, and nervous Razormane talk, so kill Bristlebacks for Mangletooth and he will tell you what they say." } },
      choices = {
        { text = "I'll strike at the Bristlebacks, and keep my word.", next = "BACK", reply = "*snort* A shining dead who keeps its word, Mangletooth has seen everything now. Kill the Bristlebacks, and Mangletooth will keep his word too.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll do what I like, pig. Talk now.", next = "BACK", reply = "*snort* Pig, it says, as if Mangletooth were the one in a cage by choice. Bristleback tusks first, shining dead, and then Mangletooth talks.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The Razormane have geomancers who speak with the earth, and Death's Head priests who speak with older things, and Mangletooth does not like either. Charlga Razorflank listens to something under the Razorfen, and it is not the Earth Mother, whatever the tauren say." } },
      choices = {
        { text = "Whatever your priests serve, I'll still tend your sores.", next = "BACK", reply = "*snort* Bless Mangletooth? No tall one ever offered that before. Keep it short, and don't let the cow-folk see, or they'll think Mangletooth went soft.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A Razormane in chains has earned his sores.", next = "BACK", reply = "*snort* Earned, yes, earned from the tauren spears and earned well. Mangletooth wears his bruises proudly, which is more than the priest can say.", fx = { align = { light = -1 } } },
        { text = "Something else, Mangletooth.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "*snort* All of them, because Bristlebacks are weak, and weak things should not walk on Agamaggan's ground. Kill them and bring Mangletooth proof, and Mangletooth will give you something the tall cow-folk never will, which is a secret." } },
      choices = {
        { text = "I'll fight quilboar for the Horde, not for you.", next = "BACK", reply = "*snort* For the Horde, for Mangletooth, the Bristlebacks die the same either way. Bring proof, and the secret is yours whoever you fought for.", fx = { align = { honor = 1 } } },
        { text = "A secret's worth killing for. Tell me more, quilboar.", next = "BACK", reply = "*snort* Good, a tall one who understands trade. Kill the Bristlebacks first, and Mangletooth will whisper the rest.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "*snort* Every Razormane hunter has a boar, and the boars are Agamaggan's children too, so they fight harder than any of your little pets. Free Mangletooth, and Mangletooth will show you how the quilboar call them, but you won't, because you're like the others." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "*snort* Every Razormane hunter has a boar, and your {pet} would not last long against one. Free Mangletooth, and he will show you how the quilboar call their boars." },
      },
      choices = {
        { text = "You'll stay caged. The Horde keeps its prisoners.", next = "BACK", reply = "*snort* Like the others, just as Mangletooth said, and Mangletooth is never wrong. The cage holds, the Horde keeps, and the boars keep their secrets.", fx = { align = { order = 1 } } },
        { text = "Teach me to call the boars, and maybe I'll help.", next = "BACK", reply = "*snort* Maybe, maybe, says the hunter, which is better than no. Bring Bristleback proof, and then Mangletooth will think about the boars.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "*snort* Agamaggan's blood made the thorns, so the earth and the boar god are one thing, and only cow-folk think otherwise. The Bristleback geomancers forgot that, and that is why they are weak." } },
      choices = {
        { text = "Every people's spirits deserve respect, even the quilboar's.", next = "BACK", reply = "*snort* Respect from a tall one with a stick and rattles, Mangletooth is almost touched. Agamaggan will remember you for it, maybe kindly.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your boar god's thorns will burn like any other brush.", next = "BACK", reply = "*snort* Many have tried burning the thorns, and the thorns are still here. Try it, and Agamaggan's blood will teach you how deep the roots go.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "*snort* Then do it, and Mangletooth will run, and the tauren guards will chase you instead of him. But you won't, because the little mage is only talk, like the geomancers of the Razormane who make the earth rumble and still lose to tauren spears." },
      },
      choices = {
        { text = "Maybe I will, if you make it worth my while.", next = "BACK", reply = "*snort* Worth its while, the mage says, like a goblin with a staff. Mangletooth has secrets, and secrets are worth more than spells.", fx = { align = { order = -1 } } },
        { text = "You'll stay in that cage where the Horde put you.", next = "BACK", reply = "*snort* Where the Horde put him, yes, and where the Horde forgets him. Go on, then, little mage, and take your talk with you.", fx = { align = { order = 1 } } },
        { text = "Who do the quilboar worship, then?", next = "agamaggan" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "*snort* The fire-thing you carry stinks worse than a Bristleback, and Agamaggan's children kneel to nothing. Mangletooth knows what such things are, because they always want something, and they always come back for it." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "*snort* The fire-thing stands right there and stinks worse than a Bristleback, and it stares at Mangletooth like it knows him. Agamaggan's children kneel to nothing, and Mangletooth knows such things always want something, so it can stare and get nothing." },
      },
      choices = {
        { text = "Everything kneels eventually, quilboar. Even your god.", next = "BACK", reply = "*snort* The demon-talker sounds just like the voices Charlga hears. Agamaggan will not kneel, and neither will Mangletooth, so go and kneel to your fire-thing yourself.", fx = { align = { light = -1 } } },
        { text = "Then we agree on one thing. Demons can't be trusted, mine included.", next = "BACK", reply = "*snort* Then the warlock is smarter than most warlocks. Keep the fire-thing on a short leash, and keep it far away from Mangletooth's cage.", fx = { align = { light = 1 } } },
        { text = "Why would you help us at all?", next = "why" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "*snort* Because the land is ours, and Agamaggan's blood gave us the thorns before any tauren walked here. Mangletooth sits in a cage, but the Razormane still remember that, and the Bristlebacks have forgotten, which is why they are weak." } },
      choices = {
        { text = "The Horde holds this land now, and that's the end of it.", next = "BACK", reply = "*snort* The end? The thorns do not know about ends, and the land does not know about the Horde. Mangletooth will wait, and the Razormane will wait longer.", fx = { align = { order = 1 } } },
        { text = "Your people were here first. Their claim deserves a hearing.", next = "BACK", reply = "*snort* A tall one says the Razormane were first, and Mangletooth almost falls over. Say it again to the cow-folk, and see how they snort back.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_band", tags = { "news" }, when = { party = { size = 4 } },
          text = "Mangletooth sees many of you, many sharp things, and that is good. The Death's Head would be afraid of a pack this size, and Mangletooth likes it when they are afraid." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "*snort* Dead one that shines! Mangletooth has seen many things in this cage, but not this. Shining dead are strange." },
        { id = "h_default", key = true,
          text = "*snort* Mangletooth is of the Razormane, strongest of the quilboar, and the Bristlebacks are weak. Kill them, and Mangletooth will tell you things." },
        { id = "h_cl_rfk", tags = { "news" }, when = { cleared = "Razorfen Kraul" }, text = "*snort* You stink of the Kraul and of Agamaggan's thorns. Mangletooth smells it from here, and Mangletooth remembers that smell from when he was young and free." },
        { id = "h_tribes", tags = { "news" }, when = { questActive = TODO_QUEST("Tribes at War") },
          text = "*snort* Go and break the Bristlebacks, and the Razormane will thank you. Maybe they will even remember Mangletooth." },
        { id = "h_shards", when = { questActive = TODO_QUEST("Blood Shards of Agamaggan") },
          text = "The Bristlebacks carry blood shards. Bring them to Mangletooth, and he will give you the boar god's gifts." },
        { id = "h_betrayal", when = { questActive = TODO_QUEST("Betrayal from Within") },
          text = "*snort* Nak, Kuz and Lok were Mangletooth's own, and they left him to the cow-folk's axes. Now they learn what Mangletooth thinks of that." },
        { id = "h_thorns", when = { metBefore = true }, text = "*snort* Mangletooth dreams of the thorns, great thorns taller than the cow-folk's poles, and one day Mangletooth goes home to them." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "*snort* A spirit-talker. The Razormane have geomancers who talk to the thorns and the earth, and they are stronger than you, so do not wave your little totems at Mangletooth." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "*snort* A shape-changer. The Razormane geomancers say your kind are only beasts pretending to be tall folk, so Mangletooth asks which one is pretending." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "*snort* A big one with an axe, good. Mangletooth knows which Bristlebacks need killing, and you look like you enjoy killing." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "*snort* A hunter, with a beast. Mangletooth likes beasts better than tall folk, because beasts don't lock cages." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "*snort* A healer comes to Mangletooth's cage. The tauren chains rub, and the Razormane witch doctors are far away, so maybe you will do what the tauren will not." },
      },
      choices = {
        { text = "Do the Razormane geomancers serve Agamaggan or the earth?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why do the quilboar fight the tauren for this land, Mangletooth?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "You've no reason to help us.", next = "why" },
        { text = "Who do the quilboar worship?", next = "agamaggan" },
        { text = "That lock wouldn't take me long to pick.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'm tauren. Why should I help you?", next = "tauren", when = { race = "Tauren" } },
        { text = "I could freeze that lock and shatter it, quilboar.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Which Bristlebacks need killing, Mangletooth?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "I'd guess the quilboar keep beasts of their own.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Your geomancers would kneel to what I keep, quilboar.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the Razormane have priests of their own, Mangletooth?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Mangletooth seems to fear the Light.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I went into Razorfen Kraul, Mangletooth.", next = "xcl_rfk", when = { cleared = "Razorfen Kraul" } },
        { text = "Will the Razorfen fear a company like ours, Mangletooth?", next = "xpt_mangletooth", when = { party = { size = { min = 2 } } } },
        { text = "You're not getting out of that cage.", next = "END", fx = { affinity = -1 } },
      },
      again = {
        { id = "h_again", text = "*snort* More questions? Mangletooth answers, for a price." },
      },
    },
    rogue = {
      big = true,
      lines = { { id = "ro_default", text = "*snort* Quiet, quiet! The cow-folk will hear. Mangletooth knows a sneaky one when he smells one, and a sneaky one who opened this cage would get the best of the boar god's gifts, all of them." } },
      choices = {
        { text = "The camp keeps its prisoner. I'm not a traitor.", next = "BACK", reply = "*snort* Not a traitor, the sneaky one says, very loudly. Fine, keep your honor and let Mangletooth keep his cage, then.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Keep talking. Maybe one day, for the right gifts.", next = "BACK", reply = "*snort* Good, good, the sneaky one listens. Bring the right gifts and the right night, and Mangletooth will make it worth the walk.", fx = { affinity = 2, align = { honor = -1 } } },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "*snort* Because Bristlebacks raid your kodo too, cow-folk, and Mangletooth tells you where they sleep. You hate quilboar, Mangletooth hates Bristlebacks, and today the hates point the same way." } },
      choices = { { text = "We share an enemy today. Tomorrow we'll see.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    agamaggan = {
      big = true,
      lines = {
        { id = "a_default", text = "*snort* The great boar fell long ago, fighting for this world, and where his blood touched the earth, the thorns grew. His bones lie in the south, and the quilboar remember." },
      },
      choices = { { text = "I hadn't heard that. Thank you.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
    why = {
      lines = {
        { id = "w_hate", text = "*snort* Mangletooth hates cages, but Mangletooth hates Bristlebacks more. A clever boar picks which hate to feed, and today Mangletooth feeds the bigger one." },
      },
      choices = { { text = "I'll remember you said that.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "*snort* Mangletooth knows nothing about that. Ask again with blood shards." } },
    quilboar = { { id = "tp_quilboar", fx = { learn = { "razorfen" } }, text = "*snort* The Razormane are Mangletooth's people, and the Razorfen is their home, and you have been killing both. Bring Mangletooth what he wants, and maybe he tells you which brothers to kill next." } },
    razorfen = { { id = "tp_razorfen", text = "*snort* Charlga Razorflank leads the Razorfen Kraul, and now she listens to the death-thing in Razorfen Downs. Mangletooth did not like it when he was free, and he likes it less from a cage." } },
    centaur = { { id = "tp_centaur", text = "*snort* The centaur hate the quilboar and the quilboar hate them, and the tauren hate both. Hating is the one thing everybody on the Barrens agrees on." } },
    scourge = { { id = "tp_scourge", text = "There's a cold thing in Razorfen Downs that wears bones and talks like a priest, and it's turning Mangletooth's people into its servants. Kill it, and Mangletooth will trade you something good, and he means that." } },
  },
}

P:NPC {
  key = "tatternack", id = TODO_NPC("Tatternack Steelforge"), name = "Tatternack Steelforge",
  bible = "bibles/taurajo.md", role = "blacksmith", tier = "quest",
  communities = { "taurajo" }, temper = { "curious" }, values = { "curious", "practical" },
  notices = { "craft", "kit", "lock_armor" },
  impression = {
    first = "To him every weapon is a letter from its wielder's hand.",
    third = "{name} met Tatternack Steelforge, a curious smith at Camp Taurajo who studies the weapons of every people the Horde meets.",
  },

  greetings = {
    { id = "g_forge", text = "Come, come. Let me see what you're carrying. Every weapon tells me something about the hand that holds it." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! Then you'll know what I mean: the quilboar's crude spears teach me more than a dozen fine orc blades." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "That armor's taken a beating, and an interesting one. Centaur, I'd guess, from the cuts." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That ward on you, the dark hide crawling over your shoulders, does it turn a blade? I'll note it in my book either way, though I'd rather study plain mail that doesn't watch me back." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Your hammer, for a start, because a paladin's hammer is a human weapon, made by human smiths to break orcs in the old wars. Seeing it swing for the Horde in Forsaken hands tells me more than any book, and I'll write it down for the Warchief, who may never read it." } },
      choices = {
        { text = "Tell him it swings for the Horde now.", next = "BACK", reply = "I'll tell him exactly that, and I think he'll be glad to hear it. Keep a steady hand on it, though, because the grunts will be watching which way it swings.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Tell him it swings for the Light, not the Horde.", next = "BACK", reply = "I'll write that too, though Thrall may scratch his head over it. Just make sure it swings at the quilboar first, whatever you're swinging it for.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Plenty, because a priest's staff has cracked more quilboar skulls than any sermon. I've a troll's ritual knife and a Forsaken's chipped mace in my notes already, and both had prayers carved where the grip wears down." } },
      choices = {
        { text = "A priest's true weapon is the healing, not the staff.", next = "BACK", reply = "Spoken like a true healer, and I'll note it beside the knife and the mace. Still, I've seen the staff, and the healing didn't crack that skull.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A good staff settles arguments faster than prayers do.", next = "BACK", reply = "Ha! That's what the troll told me, almost word for word. I'll put you down as agreeing with him, then, and leave the sermons to the shaman.", fx = { align = { light = -1 } } },
        { text = "Something else, Tatternack.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That you shoot more than you clean, which is true of most hunters I've met. The dwarves at Bael Modan carry guns finer than anything we make, and the quilboar use bows of bone and sinew, and I've learned from both, so don't think a weapon's worth depends on who made it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your weapon tells me you shoot more than you clean, but your {pet} is the better weapon, and the one I can't study. Steel doesn't love its wielder." },
      },
      choices = {
        { text = "I'll learn from every people's weapons, as you have.", next = "BACK", reply = "Then you've a smith's mind, whatever your trade is. Bring me anything strange you take off the dwarves or the quilboar, and I'll write down what it teaches.", fx = { align = { honor = 1 } } },
        { text = "Only the Horde's weapons matter to me. The rest is junk.", next = "BACK", reply = "Junk that killed plenty of our grunts at Bael Modan, all the same. Look harder at what kills you, hunter, before you call it junk.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They tell me you'd rather end a fight than win one, which is a different thing entirely. Plenty of orcs once called the dagger a coward's weapon, but I've seen what the Shattered Hand did with them, and nobody who saw that called them cowards twice." },
      },
      choices = {
        { text = "Ending a fight fast is the only victory that matters.", next = "BACK", reply = "That's the Shattered Hand talking, and they had a point. I'll write it down, though I'd still not want to meet you in a dark camp.", fx = { align = { honor = -1 } } },
        { text = "I'd still rather win it to their faces.", next = "BACK", reply = "Then you're more warrior than rogue at heart, and that's rarer than you'd think. I'll note it, and I'll keep an eye on your hands all the same.", fx = { align = { honor = 1 } } },
        { text = "What have you learned so far out here?", next = "learned" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I will, and gladly, because a mage's staff tells me more than a rack of swords. The wood is soft and the grip is worn where you rest on it, which means you lean on it to think and never mean to swing it, and that's the most honest weapon I've seen this week." },
      },
      choices = {
        { text = "A mage needn't swing anything. Clever spells win wars.", next = "BACK", reply = "Clever spells, maybe, but I've buried clever mages who ran out of mana. Keep a dagger in your belt, just in case, and don't tell the Kirin Tor I said so.", fx = { align = { honor = -1 } } },
        { text = "I'd swing it if I had to, face to face.", next = "BACK", reply = "Then you'd break that staff on the first swing, and you'd learn something from the splinters. I'll still write it down, because I like an honest answer.", fx = { align = { honor = 1 } } },
        { text = "What have you learned on your travels?", next = "learned" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Carefully, because the claws aren't forged and a bear's hide isn't armor I can weigh. So far I've written that a druid is their own weapon and the land is their smith, and I'd welcome a better line, if you've one to give me." } },
      choices = {
        { text = "Write that we fight openly, as the land's own guardians.", next = "BACK", reply = "A good line, and it's going in the book as you said it. The Warchief will like it, because it sounds like something Cairne would say.", fx = { align = { honor = 1 } } },
        { text = "Write that we fight however we must, and that we win.", next = "BACK", reply = "That's the honest version, and I'll write it under the first. Win however you must, druid, just don't let the land smith you into something it can't take back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Everything belongs in it, because the Warchief wants to know what every people fights with, and I write it all down whether or not I like it. I'll note what that thing of yours does to the quilboar, but I'll also note that the Burning Blade called on the same powers, so mind how your page reads." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Everything belongs in it, and I'm writing down how your demon is standing at my forge right now, because the Warchief wants to know. I'll note what it does to the quilboar, but I'll also note that the Burning Blade called on the same powers, so mind how your page reads." },
      },
      choices = {
        { text = "Write it plainly. I serve the Horde, as you do.", next = "BACK", reply = "Plainly, then, and I'll underline it so the Warchief sees it. Serve the Horde well, and nobody will remember what the Burning Blade did with the same art.", fx = { align = { order = 1 } } },
        { text = "Write what you like. I'll fight how I choose.", next = "BACK", reply = "I will, and I'll write that too, word for word. The Warchief is a fair reader, but he reads carefully.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin! The Warchief sent me to study every people that passes through Taurajo, and you're a people I've never studied." },
        { id = "h_default", key = true,
          text = "Tatternack Steelforge, at your service. The Warchief sent me to study weapons and armor, and to meet everyone who passes through Taurajo, because there's something to learn from every people, even the quilboar." },
        { id = "h_weapons", tags = { "news" }, when = { questActive = TODO_QUEST("Weapons of Choice") },
          text = "I'd like to see what the enemy fights with. Bring me their weapons. I promise to study them before I melt them." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Let me see that weapon you carry, because I've met hunters with a dozen different bows and guns, and every one tells a story." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! I've a chapter on the Horde's holy implements still to write for the Warchief, and I'd be grateful to know whether yours have ever been used in anger." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! I've a chapter for the Warchief on how each people fights, and your kind fight in whatever shape suits the moment, which makes for very difficult notes." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "I've studied every weapon the Barrens has shown me, but never the kind that smells like you do. Do you keep it on a leash?" },
      },
      choices = {
        { text = "What have you learned so far?", next = "learned" },
        { text = "What does my weapon tell you about me?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "A shaman's totems are made here too. You should study them.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "How would you write about a druid's way of fighting, Tatternack?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Daggers. What do they tell you about me?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I carry a staff and a wand. Write that down.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What does my weapon tell you, Tatternack?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Priests can't carry many weapons worth writing down.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "My sort probably doesn't belong in your study, Tatternack.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What can a paladin teach you, Tatternack?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll bring you something interesting.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } },
      },
      again = {
        { id = "h_again", text = "Something else? My hands are busy, but my ears aren't." },
      },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "Let me see the edge. It's dull in the middle and still sharp at the tip, so you stab more than you think you do, warrior." },
        { id = "wa_tauren", when = { race = "Tauren" },
          text = "A tauren warrior's grip wears the haft smooth just above the middle, every time, because you swing from the shoulders like a kodo. I've written a whole page on it." },
      },
      choices = { { text = "Then I'll learn to swing better.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "I would if anyone let me hold one long enough! The shamans here say a totem is carved for a spirit and not for study, and I respect that, though I'd still like to know which wood takes the lightning best." } },
      choices = { { text = "I'll ask the spirits for you.", next = "BACK", fx = { affinity = 2 } } },
    },
    learned = {
      lines = {
        { id = "l_bone", text = "That the quilboar sharpen bone better than most smiths sharpen steel, and the centaur don't sharpen anything at all; they just hit harder. I'm writing it all down for the Warchief, and he may never read it, but I'm writing it anyway." },
      },
      choices = { { text = "Somebody should.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not my field. Bring me a weapon from it, though, and it will be." } },
    second_war = { { id = "tp_second_war", text = "Every blade from the Second War has a story, and most of them end badly. I've written down forty of them for the Warchief, and I'm only half done." } },
    centaur = { { id = "tp_centaur", text = "Kolkar spears are rough work, but the stone heads are older than the shafts, passed from rider to rider. I find that more interesting than the centaur do." } },
    quilboar = { { id = "tp_quilboar", text = "Quilboar weapons are thorn and bone, and they break the moment you need them. I respect the effort, if not the craftsmanship." } },
    thrall = { { id = "tp_thrall", text = "The Warchief carries Doomhammer's hammer, and I would give a year of my life to hold it for a moment. Only to read it, you understand, not to keep it." } },
  },
}

P:NPC {
  key = "byula", id = TODO_NPC("Innkeeper Byula"), name = "Innkeeper Byula",
  bible = "bibles/taurajo.md", role = "innkeeper", tier = "service",
  communities = { "taurajo" }, temper = { "warm" }, values = { "generous", "kind" },
  notices = { "weary", "lock_shards" },
  impression = {
    first = "He has never found the hyenas' laughter funny.",
    third = "{name} rested at Innkeeper Byula's inn at Camp Taurajo, where the fire is always lit for travellers of the southern Barrens.",
  },

  greetings = {
    { id = "g_inn", text = "Welcome, traveler. Taurajo's fire is always lit, as An'she keeps the sun lit over the plains, and there's always room by it." },
    { id = "g_home", when = { homeInn = { "Camp Taurajo" } }, text = "You've come back to us, like a calf to the herd. Your bed's ready, and the kodo stew is hot." },
    { id = "g_away", when = { away = 14 }, text = "You've come back to Taurajo after {away} on the road. The fire's lit and the stew's hot, so sit down before the herders take your seat." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The herders have been talking about the help you've given the camp. They eat first here, but tonight you can eat with them." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Someone in camp says you told them a lie and they saw right through it. We're plain folk out here, traveler, and the Earth Mother hears every word, so we'd rather have the truth." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "The road back from the spirit healer is long. Sit, and let the stew warm you back into your body." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "You'll keep that bag of shards off my tables, because the cold off them curdles the milk and the herders will blame me. I don't know what you keep in those little stones, but they hum like something unhappy." },
  },

  start = "hello",
  nodes = {
    dd_gann = {
      lines = {
        { id = "dd_gn_default", text = "Neither did I, and I've known him for many summers. The Bael'dun dwarves dug into sacred ground and killed his kin when they protested, and he's carried that weight ever since. Now it's lighter, but you must know that killing them won't bring back what was lost." },
      },
      choices = {
        { text = "No, but it stops them taking more.", next = "BACK", reply = "That's true, and it's why I don't blame him or you. The Earth Mother's ground should not be dug for gold, and someone had to stand against it.", fx = { align = { light = -1 } } },
        { text = "I know. I hope he finds peace now.", next = "BACK", reply = "So do I, and I think he might, with time. Kind words like yours help more than you'd think.", fx = { align = { light = 1 } } },
        { text = "Something else, Byula.", next = "BACK" },
      },
    },
    xpt_byula = {
      big = true,
      lines = { { id = "xpt_byula_default", text = "Dangerous enough that I count the braves who ride out each morning and count them again at dusk, and the numbers don't always match. Companies that travel close come home, and I tell that to everyone who drinks here." } },
      choices = {
        { text = "Then we'll ride close and come home together.", next = "BACK", reply = "That's what I like to hear, and I'll count you back at dusk myself. May the Earth Mother keep your company close and your path short.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Danger is the price of glory. We'll ride as we like.", next = "BACK", reply = "Then ride as you like, and I'll keep counting, though I hope I don't have to subtract you. Glory won't keep you warm when the hyenas come laughing at the palisade.", fx = { align = { order = -1 } } },
        { text = "Thanks, Byula.", next = "BACK" },
      },
    },
    xcl_rfd = {
      big = true,
      lines = { { id = "xcl_rfd_default", text = "Then you've seen the dead walking among the quilboar, which I'd never have believed if the herders hadn't seen it too. Something cold came out of the north and made a nest in the Downs, and the quilboar there took it in like an honoured guest. The kodo won't graze within a day's walk of the place, and the kodo are wiser than most of my guests." } },
      choices = {
        { text = "The dead should be put back in the ground, every one.", next = "BACK", reply = "Yes, every one, and the Earth Mother will thank you for it. The Downs should hold quilboar and thorns, not the cold dead from the north.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the quilboar and the dead tear each other apart.", next = "BACK", reply = "That's a hard way to look at it, though the herders say the same some nights. Just be sure you're not standing between them when they start.", fx = { align = { light = -1 } } },
        { text = "What did the herders see?", next = "xcl_rfd2" },
      },
    },
    xcl_rfd2 = {
      lines = { { id = "xcl_rfd2_default", text = "They saw quilboar with skin as pale as frost and glowing eyes, and bones walking beside them as though they'd always been friends. One of the young herders hasn't slept a full night since, so I keep a bowl of stew warm for him whatever the hour." } },
      choices = { { text = "I hope he sleeps easier now, Byula.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The tauren welcome travellers, and you are a traveller. We do not know the Light well, so you'll find some of us curious and some uneasy. Don't take offence at the hyenas; they laugh at everyone, even the dead." } },
      choices = {
        { text = "I'll take no offence. Thank you for the welcome.", next = "BACK", reply = "You're welcome under my roof as long as you keep the peace. Rest well, and let the hyenas laugh at someone else tonight.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If they laugh at me, I'll teach them otherwise.", next = "BACK", reply = "Then you'll be busy until the moon sets, because there are many hyenas and only one of you. Sit, eat, and let them laugh.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Every night, I'd say, because the hyenas follow the herds and nip at whoever walks last. A priest by my fire would do them more good than another bowl, though don't tell them I said so, because they're proud of their scars." } },
      choices = {
        { text = "I'll sit by your fire and tend whoever limps in.", next = "BACK", reply = "Then the Earth Mother has sent you, and I'll bring you a bowl for your trouble. The herders will grumble and then they'll thank you, in that order.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Scars teach herders to walk faster. Let them keep learning.", next = "BACK", reply = "They do learn, but some of them learn slowly, and I'd rather they lived long enough to finish. Be kinder than that, if you can.", fx = { align = { light = -1 } } },
        { text = "Something else, Byula.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The quilboar of Razorfen to the south, and the Bristlebacks especially, who grow bolder every season. The dwarves at Bael Modan are no friends either, though they mostly dig and leave us be, so a warrior here will find more than enough to keep his axe busy." } },
      choices = {
        { text = "I'll help keep Taurajo safe, Byula.", next = "BACK", reply = "Then you're welcome by my fire as long as you like. Taurajo is small, and every spear that guards it is counted.", fx = { align = { honor = 1 } } },
        { text = "I'll go where the fighting's thickest and the loot best.", next = "BACK", reply = "You'll find both to the south, and you'll find the Razorfen thorns as well. Come back and tell me which hurt more.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That the lions are bolder here and the thunder lizards are larger, and the quilboar of Razorfen set traps in the brush for anything that walks. Rest well tonight, because the southern Barrens rewards a hunter who's slept." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} can rest by the fire tonight, and so should you, because the lions are bolder down here and the quilboar set traps in the brush." },
      },
      choices = {
        { text = "I'll take only what the land can spare.", next = "BACK", reply = "Then the land will spare you in return, I think. Walk gently, and you'll find the southern Barrens kinder than its reputation.", fx = { align = { honor = 1 } } },
        { text = "The southern Barrens has plenty. I'll take what I like.", next = "BACK", reply = "There's plenty, until there isn't, and I've seen the herds thin like that once already. The lions notice who takes too much, traveller, and so do the herders.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Their laughing keeps me up long after the fire burns low, and when it stops, I lie awake waiting for it. The camp's shamans say the hyenas out there are hungry rather than cursed, which makes me feel better, though not enough to sleep through it." } },
      choices = {
        { text = "Hungry beasts deserve pity more than hatred.", next = "BACK", reply = "They do, and I'm glad someone else thinks so. Perhaps the rains will come, and the hyenas will go back to the plains where they belong.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then hunt them until the laughing stops.", next = "BACK", reply = "The herders would thank you, and I'd sleep better, though I'd not cheer. Hunt them if you must, but hunt them quickly.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Once, a young orc tried it, and the kodo herders caught him halfway to Bael Modan and walked him back to settle his bill. We keep no guard at the door because the whole camp is the guard, and you'd do well to remember it while you're under my roof." },
      },
      choices = {
        { text = "I always settle my debts, kodo herders or no.", next = "BACK", reply = "Then you're welcome back any time, and the herders will never need to walk you anywhere. Rest well, traveller.", fx = { align = { order = 1 } } },
        { text = "A good thief wouldn't get caught halfway.", next = "BACK", reply = "A good thief wouldn't try it at Taurajo at all, because the whole camp is watching. Settle your bill like everyone else, and we'll stay friends.", fx = { align = { order = -1 } } },
        { text = "What's life like here in Taurajo?", next = "camp" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Whatever follows you can wait outside where the hyenas can laugh at it. The tauren of Taurajo have heard what the Burning Blade did in Durotar, and I'll not have one of those things sitting by my hearth while the kodo herders eat, whatever the Warchief allows." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "I said outside, and yet here it is, dripping sulphur on my floor where the kodo herders eat. The tauren of Taurajo have heard what the Burning Blade did in Durotar, so send your demon out to the hyenas, whatever the Warchief allows." },
      },
      choices = {
        { text = "I'll leave it outside. Your hearth deserves that respect.", next = "BACK", reply = "Thank you, because the herders would have left otherwise, and I'd have lost a night's trade. The hyenas will keep it company.", fx = { align = { light = 1 } } },
        { text = "Where I go, it goes. The Warchief allows it.", next = "BACK", reply = "The Warchief allows it in Orgrimmar, and this is my hearth, not his. Keep it outside, or eat your supper outside with it.", fx = { align = { light = -1 } } },
        { text = "What's Taurajo like for travelers?", next = "camp" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not like this, because the drought has driven them in close to the camp after the kodo and the scraps. The herders want them all killed, but I keep thinking they're only hungry, the same as everyone else in the southern Barrens." } },
      choices = {
        { text = "The herds come first. Thin the packs before they strike.", next = "BACK", reply = "The herders will be glad you said so, and so will their kodo. Be swift with the packs, then, and let the spirits sort out the rest.", fx = { align = { order = 1 } } },
        { text = "The hyenas belong here too. Find a way to live alongside them.", next = "BACK", reply = "That's what I keep telling the herders, and they keep laughing at me. If you find that way, come back and teach it to all of us.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Not often, and mostly trolls on their way south toward the Needles. The kodo herders were uneasy about the first one until she lit the cookfire without a spark, and now they ask every mage who stops here to do it again." },
      },
      choices = {
        { text = "I'll light your cookfire gladly, Byula.", next = "BACK", reply = "Oh, you'll make the herders very happy, and me as well. Just mind the hay, because the last mage nearly lit the whole stable.", fx = { align = { light = 1 } } },
        { text = "My spells aren't for cooking, innkeeper.", next = "BACK", reply = "No, I suppose they aren't, and I didn't mean any insult by it. Rest well anyway, and the hearth will light itself the old way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_gann", tags = { "news" }, when = { questDone = TODO_QUEST("Revenge of Gann") },
          text = "Gann Stonespire passed through on his way home, and for the first time since the dwarves came to Bael Modan, he smiled. He told me you had a hand in it, and that he owes you more than words." },
        { id = "h_pt_kin", tags = { "news" }, when = { party = { kin = true } },
          text = "You've come with your own people, and that's good to see down here, where the dwarves at Bael Modan and the quilboar both like to pick off stragglers. Stay together on the road to the Razorfen, and stay inside the palisade at night." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. The kodo herders eat first, because they've earned it, but there's stew enough for a curious stranger." },
        { id = "h_default", key = true,
          text = "I'm Byula, and I keep the inn. Everyone who crosses the southern Barrens stops at Taurajo eventually, the way the herds stop at water, and I make sure they leave rested." },
        { id = "h_herders", when = { metBefore = true }, text = "The kodo herders come in at sundown smelling of dust and kodo, and I serve them first. They've earned it." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Hear that, past the palisade? Those are hyenas, and they laugh when the moon, Mu'sha's eye, is open. I've never once found it funny." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, so sit by the fire. The kodo herders say it burns brighter when a shaman sits near it, and I've stopped arguing with the kodo herders." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid at Taurajo's fire, and welcome. Sit and eat, and if the hyenas start laughing out past the walls, I hope you will not mind if I do not laugh along." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and covered in dust from the road south. Taurajo welcomes you, and so does my fire." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Jorn Skyseer will want to meet you, if you haven't already met him, because he teaches every hunter who passes through." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest at Taurajo! Sit by the fire, because the herders come in limping every night and I can only do so much with stew." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage at my fire. You won't need it to warm your hands, I suppose, but sit by it anyway." },
        { id = "h_cl_rfd", tags = { "news" }, when = { cleared = "Razorfen Downs", faction = "Horde" }, text = "Travellers up from the south say the cold has lifted off the Downs, and that somebody's been to the bottom of the place. If it was you, sit nearer the fire, because I've heard what lives down there." },
      },
      again = {
        { id = "h_again", text = "What else can I get you? The stew keeps, and so do I, as patient as the grass." },
        { id = "h_again2", text = "Ask away. The kodo herders won't be in for supper for a while yet." },
      },
      choices = {
        { text = "Gann Stonespire smiled? I didn't know he could.", next = "dd_gann", when = { questDone = TODO_QUEST("Revenge of Gann") } },
        { text = "Do the hyenas' spirits trouble the camp at night?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Have the hyenas always plagued Camp Taurajo, Byula?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Taurajo looks like a hard place to live.", next = "camp" },
        { text = "Travelers must try slipping out without paying.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Who threatens Camp Taurajo, Byula?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What should a hunter know about the southern Barrens, Byula?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Is what follows me welcome by your fire, Byula?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "The kodo herders look like they need tending, Byula.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do mages come through Taurajo often, Byula?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Does Taurajo welcome a Forsaken paladin, Byula?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I went to the bottom of Razorfen Downs, Byula.", next = "xcl_rfd", when = { cleared = "Razorfen Downs", faction = "Horde" } },
        { text = "The southern Barrens seems dangerous, Byula.", next = "xpt_byula", when = { party = { kin = true } } },
        { text = "Just a rest, thanks.", next = "END" },
      },
    },
    camp = {
      lines = {
        { id = "c_fires", text = "It's quieter than the Crossroads, and hungrier. Centaur and quilboar both test the palisade, so we keep the fires high and the spears close, and we still sing at night." },
      },
      choices = { { text = "I'd like to hear that.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask Jorn; he knows the Barrens, and I only know soup. May the eternal sun shine upon you." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother sends rain to the herds and hyenas to the herders, and I have never understood the second part. Still, I thank her for the stew, and the stew has never failed me." } },
    quilboar = { { id = "tp_quilboar", fx = { learn = { "razorfen" } }, text = "The dwarves at Bael Modan dig nearby and the Razormane prowl to the south, and our herders face both every day. The quilboar warrens at Razorfen are so close you can smell them when the wind turns." } },
    cairne = { { id = "tp_cairne", text = "Cairne set this camp here to watch the south road, and every kodo herder at my fire would die for him. I would only feed him, but I would feed him very well." } },
    centaur = { { id = "tp_centaur", text = "The centaur leave Taurajo alone mostly, because we are too many and too stubborn. When they don't, the herders come back hungry, and that is when I earn my keep." } },
  },
}
