-- Vartrus the Ancient, spirit of an Ancient of Lore in the Irontree Woods, who sets hunters on the demonic corrupters.
-- Voice: bibles/irontree_ancients.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "vartrus", id = TODO_NPC("Vartrus the Ancient"), name = "Vartrus the Ancient",
  bible = "bibles/irontree_ancients.md", role = "questgiver", tier = "quest",
  communities = { "felwood_wilds" }, temper = { "grave", "serene" }, values = { "nature", "wise" },
  notices = { "hunter", "pet" },

  impression = {
    first = "He weighs every word before he lets it go.",
    third = "{name} met Vartrus the Ancient, the spirit of an Ancient of Lore who guards what is left of the Irontree Woods.",
  },

  greetings = {
    { id = "g_kind_resolved", when = { class = "HUNTER", thread = { id = "hun_rhokdelar", state = "resolved" } }, text = "The one who carries the truth along with my wood. Have they forgiven you yet, small one?" },
    { id = "g_kind_soured", when = { class = "HUNTER", thread = { id = "hun_rhokdelar", state = "soured" } }, text = "You return, and Winterspring still grieves its kind neighbour. I hope no one new has smiled at it." },
    { id = "g_default", text = "Stand still, small one, and let me look at you. I have not seen many living things today that were not rotting." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter walks among the dead trees. Good. The forest has need of one." },
    { id = "g_stave", when = { questActive = TODO_QUEST("Stave of the Ancients") }, text = "The bark will guide you to the corrupters. Face them alone, as I told you, or they will not face you at all." },
    { id = "g_done", when = { questDone = TODO_QUEST("Stave of the Ancients") }, text = "The corrupters are dead, and the woods are quieter for it. I have not heard such quiet in a long age." },
  },

  notice = {
    { id = "n_hunter", cat = "hunter", when = { class = "HUNTER" },
      text = "You carry a bow as my brothers once carried branches, as part of yourself. That is how I knew you before you spoke." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your companion is unafraid of me. Beasts remember the Ancients longer than your kind do." },
  },

  start = "hello",
  nodes = {
    kind_end = {
      big = true,
      narr = "The leaves of the dead trees stir, though there is no wind.",
      lines = { { id = "kind_end_default", key = true,
        text = "They will, and they will grieve him, because a demon who wishes to be loved is very good at it. So I ask you before you go, hunter: when it is done, what will you tell the people who loved him?" } },
      again = { { id = "kind_end_again", text = "You have given me your answer, and the trees heard it." } },
      choices = {
        { text = "The truth, even if they hate me for it.", next = "kind_truth",
          fx = { thread = { id = "hun_rhokdelar", state = "resolved" }, align = { honor = 1 }, affinity = 1 },
          journal = { first = "I told Vartrus I'd tell Winterspring the truth about its kindly strangers.", third = "{name} told Vartrus the Ancient that {name} would tell Winterspring the truth." } },
        { text = "Nothing. Let them keep their kind neighbour.", next = "kind_silence",
          fx = { thread = { id = "hun_rhokdelar", state = "soured" }, align = { honor = -1 } },
          journal = { first = "I told Vartrus I'd let Winterspring keep its kind memories.", third = "{name} told Vartrus the Ancient that Winterspring could keep its kind memories." } },
        { text = "I haven't decided, Ancient.", next = "BACK" },
      },
    },
    kind_truth = {
      lines = { { id = "kind_truth_default",
        text = "Good. A hunter who carries my wood should carry the truth as well, for the two are heavier together, but they will not break." } },
      choices = { { text = "I'll carry both, Ancient.", next = "END" } },
    },
    kind_silence = {
      lines = { { id = "kind_silence_default",
        text = "Then they will keep their kind neighbour, and the next demon who smiles at them will find them just as trusting. Go carefully, small one." } },
      choices = { { text = "I will.", next = "END" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Vartrus, an Ancient of Lore, and these were once my woods. My body was destroyed when Archimonde and the Burning Legion marched upon Hyjal, ten thousand years ago, but my spirit remains, as do the spirits of my brothers, Stoma and Hastat." },
        { id = "h_hunter_before", when = { class = "HUNTER", questBefore = TODO_QUEST("An Introduction") },
          text = "Your diligence has been noted, hunter. We are the Ancients, protectors of this once great forest, and there are tasks that we can offer to one such as you, tasks that will open the way to a weapon this world has not seen in ten thousand years." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Stave of the Ancients"), days = 3 } },
          text = "Simone, Klinfran, Solenor and Artorius are dead, and you brought me their heads. Take the stave, and bring it to Stoma for its string, for together they will make a weapon worthy of what you have done." },
        { id = "h_nonhunter", when = { class = { "WARRIOR", "PALADIN", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" } },
          text = "I am Vartrus, an Ancient of Lore, or what remains of one. I have nothing to ask of you, small one, for my tasks are for those who hunt, but I will speak with you, because I have been a long time without speaking." },
      },
      again = {
        { id = "h_again", text = "Ask, small one. I have had ten thousand years to think of answers." },
        { id = "h_again2", text = "What else? The wind has time, and so do I." },
      },
      choices = {
        { text = "Everlook loves Artorius. They'll think I murdered a friend.", next = "kind_end",
          when = { class = "HUNTER", thread = { id = "hun_rhokdelar", beat = "b2_vartrus", state = "unfolding" },
                   any = { { thread = { id = "hun_rhokdelar", beat = "b3_harlo" } }, { thread = { id = "hun_rhokdelar", beat = "b3_donova" } } } } },
        { text = "What happened to you at Hyjal?", next = "hyjal" },
        { text = "Who are Stoma and Hastat?", next = "brothers" },
        { text = "What tasks do you offer hunters?", next = "tasks", when = { class = "HUNTER" } },
        { text = "Who are the corrupters?", next = "corrupters", when = { class = "HUNTER" } },
        { text = "Why do your tasks belong only to hunters?", next = "why_hunters", when = { class = { "WARRIOR", "PALADIN", "ROGUE", "PRIEST", "SHAMAN", "MAGE", "WARLOCK", "DRUID" } } },
        { text = "I'm a druid. I feel your grief in the Dream.", next = "druid", when = { class = "DRUID" } },
        { text = "I am kaldorei. Do you blame my people for the Well?", next = "kal_blame", when = { race = "NightElf" } },
        { text = "Tell me of the weapon your bark will become.", next = "hnt_rhok", when = { class = "HUNTER", minLevel = 55 } },
        { text = "I have the Ancient Leaf, Vartrus.", next = "hnt_leaf", when = { class = "HUNTER", questActive = TODO_QUEST("The Ancient Leaf") } },
        { text = "One of the corrupters wore a smiling face in Winterspring.", next = "hnt_artorius", when = { class = "HUNTER", questActive = TODO_QUEST("Stave of the Ancients") } },
        { text = "I'll leave you in peace, Ancient.", next = "END" },
      },
    },

    hyjal = {
      lines = { { id = "hy_default", text = "We stood at the foot of the mountain with the demigods and the night elves, and we held the line while the World Tree was saved. The fel fire took our bodies, root and branch, but we did not let the demons pass, and that is enough to rest on." } },
      choices = {
        { text = "And yet you didn't rest.", next = "hyjal_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hyjal_stay = {
      big = true,
      lines = { { id = "hys_default", text = "No. The forest we died for is dying now, poisoned by demons who came back after we were gone. Some say the dead should leave the living to their own wars, but I could not leave while the Legion's filth still crawled through my roots." } },
      choices = {
        { text = "The dead have done enough. You've earned your rest.", next = "hyjal_end", fx = { align = { order = 1 } } },
        { text = "A guardian guards. You were right to stay.", next = "hyjal_end", fx = { align = { order = -1 } } },
        { text = "Will you ever rest?", next = "hyjal_end" },
      },
    },
    hyjal_end = {
      lines = { { id = "hye_default", text = "When the last corrupter is gone, perhaps, or when the forest no longer needs me. I do not expect it soon, but an Ancient measures time in centuries, and I am patient." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    brothers = {
      lines = { { id = "br_default", text = "Ancients of Lore, like me, who fell beside me and remain beside me. Stoma knows the binding of strings, and Hastat holds knowledge of a quiver lost since our deaths. Each of us waits for a hunter worthy of what we can give." } },
      choices = {
        { text = "What do they ask for?", next = "brothers_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers_ask = {
      lines = { { id = "bra_default", text = "Things that are hard to come by, as all true gifts should be. Hastat will want the sinew of a grown blue dragon, for instance, and you will not find one sleeping by the road." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    tasks = {
      lines = {
        { id = "ta_default", text = "First you must bring me a leaf, an ancient leaf, which has fallen far from here into fire. Then I will set you against the agents of the Legion who still walk this world, and if you destroy them, I will give you a stave cut from my own bark." },
        { id = "ta_done", when = { questDone = TODO_QUEST("Stave of the Ancients") },
          text = "You have done all I asked, hunter. Go to my brothers now, for what I gave you is only part of the weapon, and they hold the rest." },
      },
      choices = {
        { text = "A leaf, fallen into fire?", next = "tasks_leaf" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tasks_leaf = {
      lines = { { id = "tl_default", text = "Into the deepest fire there is, beneath a mountain, where the Firelord keeps his treasures. I cannot tell you more, because I do not know how it came there, only that it is mine and that it calls to me." } },
      choices = { { text = "I'll find it.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    corrupters = {
      lines = { { id = "co_default", text = "Simone the Seductress, Klinfran the Crazed, Solenor the Slayer and Artorius the Doombringer. They wear other faces now and walk among your kind, and nature wilts and weeps wherever they pass." } },
      choices = {
        { text = "How do I fight them?", next = "corrupters_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    corrupters_how = {
      lines = { { id = "coh_default", text = "Alone, hunter. They are arrogant, and if you come to them by yourself they will try to destroy you, but if you bring allies, they will flee. Turn their arrogance into their misery, and bring me their heads." } },
      choices = { { text = "Alone, then.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    why_hunters = {
      lines = { { id = "wh_default", text = "Because a hunter walks with the beasts and listens to the forest, as we did. Your path is a good one, small one, but it is not ours, and our gifts would not sit easily in your hands." } },
      choices = { { text = "I understand.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "dr_default", text = "Then you know what it is to love a forest and watch it sicken. Go gently in the Dream while you are in Felwood, druid, for my grief is not the only thing you will hear there." } },
      choices = { { text = "I'll be careful, Vartrus.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    kal_blame = {
      big = true,
      lines = { { id = "kbl_d", text = "Blame is a short thing, small one, and I am a long one. Your Highborne drank from the Well until the Legion heard them drinking, and my body burned for it at Hyjal, but your Sentinels also stood beside my roots when the demons came, and I remember both." } },
      choices = {
        { text = "Then we owe the forest a debt we can never pay.", next = "BACK", reply = "You owe it care, which is a debt that is paid a little every day and never finished. That is not a curse, it is a life.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "The Highborne owe it, not my generation.", next = "BACK", reply = "Perhaps. The forest does not keep such careful accounts, and the satyrs who poison it now were Highborne too.", fx = { align = { light = -1 } } },
        { text = "What was Felwood, before?", next = "kal_before" },
      },
    },
    kal_before = {
      lines = { { id = "kbe_d", text = "The northern reach of Ashenvale, the same forest unbroken from the sea to the mountain, and the oldest oaks in the world grew in these woods. When the Legion came back, the demons fouled every root and stream they passed, and the forest your elders called beautiful became the forest your young ones call Felwood." } },
      choices = { { text = "Then it can be Ashenvale again, someday.", next = "BACK", reply = "The Emerald Circle believes so, and I would like to live long enough to be wrong about doubting them.", fx = { learn = { "cenarion_circle" } } } },
    },
    hnt_rhok = {
      big = true,
      lines = { { id = "hrh_d", text = "A longbow of the Ancient Keepers, the first in ten thousand years, and the kaldorei long ago called such a weapon Rhok'delar. My stave is its body, Stoma's string is its voice, and the arm that draws it must have proved, alone, that it can stand against the Legion's agents without flinching or calling for help." } },
      choices = {
        { text = "Why must I face them alone?", next = "corrupters_how" },
        { text = "I will be worthy of it.", next = "BACK", reply = "You will be, or you will not be anything at all. That is how the Ancients test.", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "A weapon is a weapon. I'll take it however I must.", next = "BACK", reply = "Then you have not understood, and the bark will know it. Think on it longer before you come back.", fx = { align = { honor = -1 } } },
      },
    },
    hnt_leaf = {
      lines = { { id = "hle_d", text = "Then you have walked in the Firelord's own house and come out with my leaf, and I can feel it from here, warm as a summer morning. Give it to me, small one, and I will set you on the hardest hunt of your life, for there is no more testing left after this but the real thing." } },
      choices = { { text = "I am ready for the real thing.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    hnt_artorius = {
      lines = { { id = "har_d", text = "Artorius, who calls himself the Amiable, and smiles at travellers on the snow road, and has never been amiable in all his long and evil life. He is a doomguard under that face, and when you show him you know it, he will burn you with a doom that clings, so stay beyond his reach and let your arrows do the walking." } },
      choices = { { text = "Beyond his reach. I understand.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know these woods, the war at Hyjal, and the demons who came back." } },
    background = { { id = "tp_bg", text = "An Ancient of Lore, who died at Hyjal and stayed.", next = "hyjal" } },
    burning_legion = { { id = "tp_legion", text = "They burned us once. They will not find us so easy to burn twice." } },
    malfurion = { { id = "tp_malf", text = "Cenarius's student. I remember him young, and very certain." } },
    _none = { { id = "tp_none", text = "That is a thing of your age, small one, not of mine." } },
  },
}

-- Hastat the Ancient: spirit of an Ancient of Lore in the Irontree Woods, Vartrus's brother. Gives the hunter quiver quest
-- (Ancient Sinew Wrapped Lamina: a mature blue dragon's sinew). Voice: bibles/irontree_ancients.md (shared with Vartrus).
P:NPC {
  key = "hastat", id = TODO_NPC("Hastat the Ancient"), name = "Hastat the Ancient",
  bible = "bibles/irontree_ancients.md", role = "questgiver", tier = "quest", gender = "male",
  communities = { "felwood_wilds" }, temper = { "grave", "dry" }, values = { "nature", "patient" },
  notices = { "hunter", "pet" },

  impression = {
    first = "Hastat is a ghost of an Ancient of Lore, half wood and half moonlight, and he talks to hunters about arrows the way an old smith talks about steel. He is drier than Vartrus, and he seems to enjoy it.",
    third = "{name} met Hastat the Ancient, the spirit in the Irontree Woods who knows the making of a quiver lost since Hyjal.",
  },

  greetings = {
    { id = "g_default", text = "Another small one among the dead trees. Vartrus will want to speak to you first, I expect, for my brother likes to be first." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, and you count your arrows before you sleep, I can tell. Good. Then we will understand each other." },
    { id = "g_lamina", when = { questActive = TODO_QUEST("Ancient Sinew Wrapped Lamina") }, text = "The sinew of a grown blue dragon, small one, and not a whelp's, for a whelp's would snap in the first winter." },
    { id = "g_done", when = { questDone = TODO_QUEST("Ancient Sinew Wrapped Lamina") }, text = "The quiver suits you. Do not hang it on a nail, for it was made to be carried." },
  },

  notice = {
    { id = "n_quiver", cat = "hunter", when = { class = "HUNTER" },
      text = "Your quiver rattles when you walk, which means it is either half empty or badly made, and I can help with only one of those." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your companion sniffs at my roots as if it remembers a living tree. Perhaps it does, in its blood." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Hastat, an Ancient of Lore, and like my brothers I left my body at Hyjal and did not leave the forest. Vartrus gives the stave and Stoma the string, and I give the quiver that carries what the bow will loose, for an archer with nothing to shoot is only a person holding a stick." },
        { id = "h_hunter_hi", when = { class = "HUNTER", minLevel = 58 }, text = "You have the look of one who has walked in fire and come back, hunter. If Vartrus has set you on the path, then hear me too, for I can wrap a quiver in the sinew of a blue dragon that will carry arrows faster than your hand can want them." },
        { id = "h_nonhunter", when = { ["not"] = { class = "HUNTER" } }, text = "I am Hastat, an Ancient of Lore, or the shade of one. My craft is for hunters, small one, but I will talk with anyone who stands still long enough, which most of the living do not." },
      },
      again = {
        { id = "h_again", text = "Ask on. The quiver will not make itself while we talk, but neither will it make itself if we do not." },
        { id = "h_again2", text = "What else, small one? I have time, and a great deal of it." },
      },
      choices = {
        { text = "What is the quiver you speak of?", next = "quiver" },
        { text = "Why a blue dragon's sinew?", next = "sinew", when = { class = "HUNTER" } },
        { text = "You and Vartrus seem different.", next = "brothers" },
        { text = "What do you remember of Hyjal?", next = "hyjal" },
        { text = "My people still remember the Ancients, Hastat.", next = "kal", when = { race = "NightElf" } },
        { text = "I'll let you rest, Ancient.", next = "END" },
      },
    },
    quiver = {
      lines = { { id = "q_d", text = "A lamina, a quiver of old kaldorei make, wrapped and bound so that the arrows sit ready and do not tangle. The Sentinels' greatest archers carried them before the Sundering, and the art was lost with the Ancients who made them, all but me." } },
      choices = {
        { text = "Why give it to a stranger?", next = "quiver2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiver2 = {
      lines = { { id = "q2_d", text = "Because the forest is dying and the Legion's agents are not, and because a gift kept by a ghost is no gift at all. I would rather it go to a hunter of any people who has earned it than rot in my memory for another ten thousand years." } },
      choices = {
        { text = "Then I'll earn it.", next = "BACK", reply = "Good. Earning is the part I enjoy watching.", fx = { align = { honor = 1 } } },
        { text = "I'll take it however it comes to me.", next = "BACK", reply = "Then you will take nothing, because it does not come any way but one.", fx = { align = { honor = -1 } } },
      },
    },
    sinew = {
      lines = { { id = "s_d", text = "Because blue dragonflight sinew remembers magic, and holds its shape through fire and frost both. There is a great blue dragon who walks the ruins of Azshara, and he will not give it gladly, so you will need friends for that hunt, and that is the one hunt where I would not ask you to go alone." } },
      choices = {
        { text = "A dragon. You don't ask small things.", next = "BACK", reply = "No, small one. Small things make small quivers.", fx = { trait = { brave = 1 } } },
        { text = "Must the dragon die for it?", next = "sinew2" },
      },
    },
    sinew2 = {
      lines = { { id = "s2_d", text = "He is not of the Legion, and I take no pleasure in it, but he is no gentle creature either, and he guards his ruins with storms. Whether you can take what you need without killing him, I do not know, and I would like to hear if you manage it." } },
      choices = { { text = "I'll tell you, if I do. Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    brothers = {
      lines = { { id = "b_d", text = "Vartrus speaks as though every word were a gift, Stoma speaks as though every word were a cost, and I speak because I like to. We were three trees side by side for longer than your oldest city has stood, and three ghosts side by side since, so we have had time to grow tired of each other's voices." } },
      choices = { { text = "And yet you stay together.", next = "BACK", reply = "Where else would we go? The forest is here, and so are they.", fx = { affinity = 1 } } },
    },
    hyjal = {
      lines = { { id = "hy_d", text = "Fire, mostly, and the sound of Archimonde laughing as he climbed. I remember that the kaldorei archers on the slopes never stopped loosing, not once, even as the trees around them burned, and I remember thinking that I had never seen anything so brave or so foolish." } },
      choices = { { text = "Brave and foolish often walk together.", next = "BACK", reply = "They do. That is why I like hunters.", fx = { learn = { "burning_legion" } } } },
    },
    kal = {
      big = true,
      lines = { { id = "k_d", text = "Some of you do. Many of your young ones in Darnassus think the Ancients are statues that walk, and the Archdruid's people talk of the new tree as though it were the first, but the oldest Sentinels still bow when they pass our grove, and that is enough for an old ghost." } },
      choices = {
        { text = "I'll bow too, then, and teach the young to.", next = "BACK", reply = "Do not teach them to bow. Teach them why, and they will find their own way of showing it.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Our people must look forward, not only back.", next = "BACK", reply = "True, small one, so long as you remember that the road behind you is how you got here.", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know quivers and sinew and the Irontree Woods, and my two brothers, of whom I know far too much." } },
    background = { { id = "tp_bg", text = "I am an Ancient of Lore who died at Hyjal and stayed, though Vartrus tells it better and at greater length." } },
    burning_legion = { { id = "tp_legion", text = "They burned my body. They will not get my craft, and that pleases me more than it should." } },
    _none = { { id = "tp_none", text = "That is beyond an old tree's roots, small one. Ask the living." } },
  },
}

-- Stoma the Ancient: spirit of an Ancient of Lore in the Irontree Woods, who binds the string for the hunter's longbow
-- (A Proper String: a mature black dragon's sinew). Voice: bibles/irontree_ancients.md.
P:NPC {
  key = "stoma", id = TODO_NPC("Stoma the Ancient"), name = "Stoma the Ancient",
  bible = "bibles/irontree_ancients.md", role = "questgiver", tier = "quest", gender = "male",
  communities = { "felwood_wilds" }, temper = { "terse", "grave" }, values = { "nature", "exacting" },
  notices = { "hunter" },

  impression = {
    first = "Stoma is the quietest of the three Ancient spirits in the Irontree Woods, and he weighs a hunter the way a bowyer weighs a length of yew. He says little, and means all of it.",
    third = "{name} met Stoma the Ancient, the spirit who binds the string for the Ancients' bow.",
  },

  greetings = {
    { id = "g_default", text = "You are standing on my roots, small one, and they still feel it, though they are only memory now." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Show me your bowstring, and I will tell you what kind of hunter." },
    { id = "g_string", when = { questActive = TODO_QUEST("A Proper String") }, text = "The sinew of a grown black dragon, small one. Only that will hold the stave's strength without snapping." },
    { id = "g_done", when = { questDone = TODO_QUEST("A Proper String") }, text = "The bow sings in your hand. I can hear it from here, and it is a good song." },
  },

  notice = {
    { id = "n_string", cat = "hunter", when = { class = "HUNTER" },
      text = "Your string is frayed near the nock, and you have not noticed. Mend it tonight, before it mends you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Stoma, an Ancient of Lore, dead at Hyjal with my brothers. Vartrus carves, Hastat talks, and I bind the string, and a bow without a proper string is only a bent stick and a hope." },
        { id = "h_stave", when = { class = "HUNTER", questDone = TODO_QUEST("Stave of the Ancients") }, text = "You carry my brother's stave, and you carry the heads of four of the Legion's servants behind you, though you do not see them. Now it needs a voice, hunter, and a voice that strong must come from a black dragon's sinew, for nothing gentler will hold." },
      },
      again = {
        { id = "h_again", text = "Ask, then, and ask it plainly." },
        { id = "h_again2", text = "What else, small one? The forest is quiet enough to hear you." },
      },
      choices = {
        { text = "Why a black dragon's sinew?", next = "sinew", when = { class = "HUNTER" } },
        { text = "You say little, for an Ancient.", next = "quiet" },
        { text = "What makes a string proper?", next = "proper" },
        { text = "Does it matter that I'm not kaldorei?", next = "outsider", when = { class = "HUNTER", ["not"] = { race = "NightElf" } } },
        { text = "I'll leave you to your silence.", next = "END" },
      },
    },
    sinew = {
      big = true,
      lines = { { id = "s_d", text = "Because the black dragons are the Legion's cousins in cruelty, and the strongest of them nests in a cave in the swamps of Dustwallow, far to the south, and a string made from her own sinew will never forget whom it was made to defeat. You will need many friends for that hunt, and you will not all come home." } },
      choices = {
        { text = "Then the bow is worth the risk.", next = "BACK", reply = "Every bow worth having is worth some risk. Whether it is worth theirs is for your friends to say.", fx = { align = { honor = -1 }, trait = { brave = 1 } } },
        { text = "I won't ask friends to die for my bow.", next = "BACK", reply = "Then ask them to fight for the world, which she would burn, and let the bow be what is left over.", fx = { align = { honor = 1 } } },
      },
    },
    quiet = {
      lines = { { id = "q_d", text = "Hastat talks enough for three of us, so someone must listen to the forest, and it does not speak loudly any more." } },
      choices = { { text = "Then I'll listen too. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    proper = {
      lines = { { id = "p_d", text = "It must be stronger than the arm and weaker than the stave, so that when the bow fails, it fails safely, in the string, and not in your face. Most bowyers forget the second half, and most hunters have the scars to show it." } },
      choices = { { text = "Stronger than the arm, weaker than the stave.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    outsider = {
      lines = { { id = "o_d", text = "The Legion did not ask whom it burned at Hyjal, so we do not ask whom we arm against it." } },
      choices = { { text = "That's a generous answer.", next = "BACK", reply = "It is a true one. Generous is Hastat's work.", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know strings and sinew, and I know when to be silent." } },
    background = { { id = "tp_bg", text = "I am an Ancient of Lore who died at Hyjal, and that is all of it worth telling." } },
    _none = { { id = "tp_none", text = "I do not know. Ask Hastat, who will tell you at length." } },
  },
}
