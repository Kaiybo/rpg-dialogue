-- Dolanaar's missed folk and the roads beyond: Melarith in the village; Huntress Yaeliura on the
-- Darnassus road with Moon Priestess Amara; Sentinel Shaya south of the village. (The rest were doubled
-- by deeper copies in more_folk.lua and were removed in 0.94.0.) Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Melarith: a quiet resident of Dolanaar.
P:NPC {
  key = "melarith", id = TODO_NPC("Melarith"), name = "Melarith", gender = "male",
  bible = "bibles/missed.md", role = "villager", tier = "service",
  communities = { "dolanaar" }, temper = { "reflective", "gentle" }, values = { "peace", "memory" },
  notices = { "race", "travel" },
  impression = {
    first = "Melarith is a quiet man of Dolanaar who seems to have no trade but watching the road. He talks about the village as someone who remembers when there was no tree beneath it.",
    third = "{name} met Melarith, a quiet resident of Dolanaar.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveller. Sit a moment, if the road will allow it." },
    { id = "g_back", when = { metBefore = true }, text = "The road has brought you round again. I had wondered whether it would." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune is bright over Dolanaar tonight. It is a good hour to be awake, and a better one for talking." },
  },
  notice = {
    { id = "n_outlander", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "Your people live so briefly and travel so far. I have not gone a mile from this village in years, and I confess I envy you a little." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Melarith, and I live here in Dolanaar, which is nearly all there is to say of me. I watch who comes down the road and who goes up it, and I find that is occupation enough for one who has already lived a long while." },
      },
      again = {
        { id = "h_again", text = "What else shall we speak of?" },
        { id = "h_again2", text = "I am in no hurry, as you may have gathered." },
      },
      choices = {
        { text = "What have you seen on the road lately?", next = "road" },
        { text = "You do not seem troubled by much.", next = "calm" },
        { text = "Where were you before Teldrassil?", next = "before" },
        { text = "Rest well, Melarith.", next = "END" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "More of the young than ever, coming up from Shadowglen with new weapons and old names. More Sentinels as well, riding toward Ban'ethil Hollow, and they come back slower than they went." } },
      choices = {
        { text = "What waits at Ban'ethil Hollow?", next = "hollow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hollow = {
      lines = { { id = "ho_default", text = "The Gnarlpine, and beneath them a barrow den where druids once slept in peace. I used to walk there in the evenings, and now I would not send a friend that way without a blade.", fx = { learn = { "furbolgs" } } } },
      choices = { { text = "I will go armed. Something else.", next = "BACK" } },
    },
    calm = {
      lines = { { id = "c_default", text = "I have been troubled enough for several lifetimes, and it mended nothing. These days I leave the worrying to Tallonkai, who is very good at it, and I keep the watching for myself." } },
      choices = { { text = "A fair division. Something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "b_default", text = "In the forests below Hyjal, in a village that the Legion's fires did not spare. Dolanaar is very like it, if you do not look down, and I have learned not to look down.", fx = { learn = { "burning_legion" } } } },
      choices = {
        { text = "I am sorry for what you lost.", next = "BACK", reply = "Thank you. It was long ago as you count such things, and only yesterday as I do.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am old, and I have settled here. There is no more to it than that, and I am content." } },
    teldrassil = { { id = "tp_tel", text = "It is a fine tree to live upon. I only wish I could forget how quickly it grew." } },
    _none = { { id = "tp_none", text = "That has not come down the road to me yet. Ask at the inn, where the news sleeps." } },
  },
}

-- Huntress Yaeliura: rides the Darnassus road with Moon Priestess Amara and Huntress Nhemai.
P:NPC {
  key = "huntress_yaeliura", id = TODO_NPC("Huntress Yaeliura"), name = "Huntress Yaeliura", gender = "female",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "dolanaar" }, temper = { "easy", "alert" }, values = { "dutiful", "loyal" },
  notices = { "pet", "class" },
  impression = {
    first = "Huntress Yaeliura rides the Darnassus road with Moon Priestess Amara, and she is the friendlier of the priestess's two guards, though her hand never leaves her bow. She keeps a tally of travellers seen safely past.",
    third = "{name} met Huntress Yaeliura, who guards the road to Darnassus with Moon Priestess Amara.",
  },
  greetings = {
    { id = "g_default", text = "Elune light your way, traveller. You are safe on this stretch, so long as we are on it." },
    { id = "g_back", when = { metBefore = true }, text = "Well met again, {class}. That makes twice I have counted you safely by." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Hold {pet} close, if you would. My saber is courteous, but she does not share the road gladly." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Huntress Yaeliura, and I ride with Moon Priestess Amara and Nhemai between Dolanaar and the gates of Darnassus. We see travellers through and send the Gnarlpine back into the trees, a dozen times a night." },
      },
      again = {
        { id = "h_again", text = "Anything more before we ride on?" },
        { id = "h_again2", text = "Speak, and walk with us a few paces if you like." },
      },
      choices = {
        { text = "How far is Darnassus from here?", next = "darnassus" },
        { text = "Your companion says very little.", next = "nhemai" },
        { text = "It must be dull, riding one road.", next = "dull" },
        { text = "Does a hunter's eye see this road differently?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Safe riding, huntress.", next = "END" },
      },
    },
    darnassus = {
      lines = { { id = "d_default", text = "Follow the stones west and you will see the gates before the moon has moved a hand's breadth. Do not leave the road for anything that calls to you from the trees, however much it sounds like someone in need." } },
      choices = {
        { text = "The furbolgs lure travellers?", next = "lure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lure = {
      lines = { { id = "l_default", text = "Not cleverly, but a branch shaken in the dark will draw the curious, and the curious are who they want. The priestess has us ride past every such place twice, and it has saved more than one novice." } },
      choices = { { text = "I will stay on the stones. Something else.", next = "BACK" } },
    },
    nhemai = {
      lines = { { id = "n_default", text = "Nhemai speaks when there is something to shoot at and at no other time, and I have ridden beside her long enough to find that restful. She has the best eyes of any huntress I know, so I do the talking and let her do the seeing." } },
      choices = { { text = "It seems to work. Something else.", next = "BACK" } },
    },
    dull = {
      lines = { { id = "du_default", text = "It was a peaceful road for a long time, and I would gladly have it dull again. A huntress who is bored is a huntress whose people are safe, and I have learned to pray for boredom." } },
      choices = { { text = "May you be bored soon. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "It should, and if you look you will see claw marks high on the trunks where they climb. Read those as you would a deer trail, and you will know where the next ambush waits before it knows you." } },
      choices = { { text = "I see them now. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have served the Sentinels since I could draw a bow. The Moon Priestess asked for me by name, and I was proud to come." } },
    furbolgs = { { id = "tp_fur", text = "The Gnarlpine were our neighbours once. I take no joy in driving them off, but the road must stay open." } },
    _none = { { id = "tp_none", text = "I could not say, friend. Ask Moon Priestess Amara, who knows far more than her huntresses." } },
  },
}

-- Sentinel Shaya: wounded on her patrol south of Dolanaar. Classic: the priest lesson Garments of the Moon.
P:NPC {
  key = "sentinel_shaya", id = TODO_NPC("Sentinel Shaya"), name = "Sentinel Shaya", gender = "female",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "dolanaar" }, temper = { "stubborn", "proud" }, values = { "dutiful", "tough" },
  notices = { "class", "priest" },
  impression = {
    first = "Sentinel Shaya holds her post south of Dolanaar with one arm bound up and no intention of leaving it. She took being wounded as an insult, and being fussed over as a worse one.",
    third = "{name} met Sentinel Shaya, a wounded Sentinel who would not leave her patrol south of Dolanaar.",
  },
  greetings = {
    { id = "g_default", text = "Hold there, {class}. This path is watched, even if the watcher is bleeding on it." },
    { id = "g_garments", when = { questActive = TODO_QUEST("Garments of the Moon") }, text = "Laurna sent you, and I can guess why. Very well, priest, do what you came to do, and be quick about it." },
    { id = "g_done", when = { questDone = TODO_QUEST("Garments of the Moon") }, text = "My healer returns. The arm is sound and the patrol is walked, and I have you to thank for both." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I am still here, and no, I have not gone back to the village." },
  },
  notice = {
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "You wear the look of the Sisterhood. I suppose you will tell me to rest, as Laurna does, and I will tell you what I told her." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_garments", when = { questActive = TODO_QUEST("Garments of the Moon") }, text = "I am Sentinel Shaya, and I am told you are to mend me and bless me before I am allowed to be useful again. I will hold still, which is more than I have done for anyone this season." },
        { id = "h_default", text = "I am Sentinel Shaya, and this stretch south of Dolanaar is mine to patrol. The Gnarlpine opened my arm two nights ago, and I have been explaining ever since that one arm is enough to hold a glaive." },
      },
      again = {
        { id = "h_again", text = "What else? I have a patrol to finish." },
        { id = "h_again2", text = "Ask, and do not look at the bandage." },
      },
      choices = {
        { text = "How were you wounded?", next = "wound" },
        { text = "You ought to be resting in Dolanaar.", next = "rest" },
        { text = "What do you guard out here?", next = "guard" },
        { text = "Elune's grace will see you mended.", next = "priest", when = { class = "PRIEST" } },
        { text = "Hold your post, Sentinel.", next = "END" },
      },
    },
    wound = {
      lines = { { id = "w_default", text = "Three Gnarlpine came out of the brush at once, and I was watching the fourth. They did not fight as furbolgs used to, with warning and bluster, but all in a rush as though something were driving them.", fx = { learn = { "furbolgs" } } } },
      choices = {
        { text = "What became of the four?", next = "four" },
        { text = "Something else.", next = "BACK" },
      },
    },
    four = {
      lines = { { id = "f_default", text = "Two will not trouble the road again, and two ran toward Ban'ethil Hollow with my blood on their claws. I mean to be standing here when they come back for the rest of me." } },
      choices = { { text = "I believe you will be. Something else.", next = "BACK" } },
    },
    rest = {
      lines = { { id = "r_default", text = "So Laurna says, and Byancie, and my captain, and now you. If I lie down in the inn, there is a gap in the watch as wide as I am, and the Gnarlpine find gaps faster than water does.", fx = { learn = { "sentinels" } } } },
      choices = {
        { text = "Then stand, but let someone tend the arm.", next = "BACK", reply = "That I can agree to, provided they tend it here. I will not be carried anywhere." },
        { text = "Something else.", next = "BACK" },
      },
    },
    guard = {
      lines = { { id = "g_guard", text = "The south approach to the village and the path down toward Lake Al'Ameth. Novices wander that way after timberlings and forget what else lives in the brush, so somebody has to stand between them and it." } },
      choices = { { text = "They are fortunate. Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "p_default", text = "I do not doubt it, and I have never refused the Goddess's gifts, only the bed that the priestesses want to go with them. Heal what you can where I stand, and I will thank you and Elune both." } },
      choices = { { text = "Where you stand, then. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have been a Sentinel for longer than this tree has stood. I have been wounded worse, and I walked those off too." } },
    sentinels = { { id = "tp_sen", text = "We hold the watch so that others may sleep. A Sentinel who leaves her post has stopped being one." } },
    _none = { { id = "tp_none", text = "That is beyond my patrol. Take it to Athridas Bearmantle in the village." } },
  },
}

-- Sentinel Lynessa Duskblossom: a Forever escort Sentinel at Ban'ethil Hollow, pinned in by the
-- Gnarlpine and waiting for someone to see her out. Escort quest name unconfirmed.
P:NPC {
  key = "lynessa_duskblossom", id = TODO_NPC("Sentinel Lynessa Duskblossom"), name = "Sentinel Lynessa Duskblossom", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "dolanaar" }, temper = { "brisk", "wry" }, values = { "dutiful", "loyal" },
  notices = { "race", "weary" },
  impression = {
    first = "She was wounded, outnumbered and still making jokes about it.",
    third = "{name} met Sentinel Lynessa Duskblossom, cut off by the Gnarlpine in Ban'ethil Hollow.",
  },

  greetings = {
    { id = "g1", text = "Keep your voice down. The furbolgs in this hollow have good ears and worse tempers." },
    { id = "g_again", when = { timesTalked = { min = 1 } }, text = "You came back, and on purpose. Most people only find this hollow by mistake." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune's light reaches even down here, which is the only kind thing I can say about this place." },
    { id = "g_done", when = { questDone = TODO_QUEST("Lynessa escort") }, text = "There's the one who walked me out of the hollow. Dolanaar still owes you a drink on my account." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Three of us came down to see why the Gnarlpine were gathering here, and I'm the only one still standing. I can walk, but I can't walk out through all of them alone." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Lynessa escort") },
          text = "Stay close and watch the tunnels on the left. They like to come at you from the dark while you're looking at the one in front." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, thank Elune. The Gnarlpine were your friends once, so perhaps you can tell me what's been done to them." },
      },
      again = { { id = "h_again", text = "Ask what you like, but quickly. They'll come round on their patrol again soon." } },
      choices = {
        { text = "What happened to the other two?", next = "lost" },
        { text = "Why are the Gnarlpine gathering here?", next = "why" },
        { text = "You're bleeding worse than you're letting on.", next = "wound" },
        { text = "The Gnarlpine were friends of the Circle once.", next = "druid", when = { class = "DRUID" } },
        { text = "Your people don't often trust outsiders this far in.", next = "outsider", when = { ["not"] = { race = "NightElf" } } },
        { text = "I'll get you out of here.", next = "BUSINESS" },
        { text = "Hold on a little longer.", next = "END" },
      },
    },
    lost = {
      lines = { { id = "lo_default", text = "Ilthara fell at the mouth of the hollow, and Faeryn went down the far tunnel to draw them off me. I heard her horn once, and then I heard nothing at all." } },
      choices = {
        { text = "Then we make them pay for it on the way out.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Getting you home alive is what they'd want.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Faeryn might still be alive down there.", next = "faeryn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    faeryn = {
      lines = { { id = "fa_default", text = "She might, and I've told myself so every hour since. But that tunnel runs deep into the den, and I can't go after her with one good leg and half a quiver." } },
      choices = {
        { text = "Once you're safe, I'll look for her.", next = "BACK", reply = "Then look carefully, and don't make me mourn two of you.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "They've been carrying green moss in from the Fel Rock and chewing it like it's bread. Whatever's in it, it's made them strong and stupid and very, very angry." } },
      choices = {
        { text = "Where does a moss like that come from?", next = "moss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moss = {
      lines = { { id = "ms_default", text = "From the Fel Rock, west of Dolanaar, where the ground has a sick glow and the little sprites go mad. Something old and foul was buried in that stone, and Teldrassil's roots grew right through it." } },
      choices = {
        { text = "Then the tree itself is touched by it?", next = "tree" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tree = {
      lines = { { id = "tr_default", text = "Hush, the priestesses would say, and Fandral would say it louder. But I've walked these roads for years, and the shadows on Teldrassil are darker than they were when it was planted." } },
      choices = {
        { text = "The Archdruid knows what he's doing.", next = "BACK", reply = "I hope so, because none of the rest of us do.", fx = { align = { order = 1 } } },
        { text = "Someone should make the Archdruid answer for this.", next = "BACK", reply = "Say that quietly in Darnassus, and say it to no one in Dolanaar.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wound = {
      lines = { { id = "wd_default", text = "A Gnarlpine axe in the thigh, and I've bound it twice. If I sit down I won't get up again, so I'm leaning on this root and pretending it's a choice." } },
      choices = { { text = "Lean on me when we move, then.", next = "BACK", reply = "I'll lean on my bow, thank you, and on you only if I fall.", fx = { affinity = 1 } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "They were, and some of them still hold a bit of the old courtesy before the moss takes them. If the Circle can cure them, I'd be glad, but tonight I need you to get me past them, not to save them." } },
      choices = {
        { text = "They're victims, and I'll spare who I can.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If they come at us, they fall like any foe.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    outsider = {
      lines = { { id = "ou_default", text = "We don't, and you'll hear plenty of grumbling in Dolanaar about it. But I'm in a hole full of angry furbolgs, so I'm not choosing my rescuers by the shape of their ears." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
  },

  topics = {
    sentinels = { { id = "ly_sen", text = "We watch the roads so the village can sleep. Tonight the village will have to watch for itself, because I'm a little busy." } },
    gnarlpine = { { id = "ly_gn", text = "They traded honey and furs with us when I was young. I'd rather not have to kill the ones who remember that, but they don't seem to remember it themselves." } },
    _none = { { id = "ly_none", text = "Ask me again when we're out of this hollow, and I'll answer anything you like." } },
  },
}

---------------------------------------------------------------------------
-- Sentinel Eralya Leafshadow: a runner for the Council of the Forest, still in
-- training, ambushed by harpies on the road to the Oracle Tree and dying of
-- a festering wound. (Quests: The Lost Runner, Not Dead Yet, Easing Suffering;
-- Byancie in Dolanaar makes the salve.) Speaks in pain, but whole sentences.
---------------------------------------------------------------------------
P:NPC {
  key = "eralya_leafshadow", id = TODO_NPC("Sentinel Eralya Leafshadow"), name = "Sentinel Eralya Leafshadow", title = "Sentinels",
  role = "soldier", tier = "quest",
  communities = { "teldrassil" }, temper = { "brave", "frightened" }, values = { "duty", "Elune" },
  notices = { "class", "race" },

  impression = {
    first = "A young Sentinel slumped against a tree by the road, her wound dark and wrongly coloured.",
    third = "{name} found Sentinel Eralya Leafshadow, a Council runner left dying on the road to the Oracle Glade.",
  },

  greetings = {
    { id = "g_default", text = "Elune's grace, someone came. I was beginning to think no one would." },
    { id = "g_eased", when = { questDone = TODO_QUEST("Easing Suffering") }, text = "You came back. The pain is quieter now, thanks to you." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "You carry Elune's light, I think. Would you say a word to her for me, if I can't find the breath?" },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Then you will feel it, the foulness in this wound, the same sickness that is in the forest." },
  },

  start = "hello",
  nodes = {
    hello = {
      narr = "She presses a hand to her side, and it comes away dark.",
      lines = {
        { id = "h_default", key = true, text = "I am Eralya Leafshadow, of the Sentinels, and I was carrying the Oracle Tree's message to Darnassus when the harpies came down on us. My sisters scattered, and I could not run any further than this." },
        { id = "h_active", when = { questActive = TODO_QUEST("Not Dead Yet") },
          text = "Please, go to Byancie in Dolanaar, because she will know what to do. I can hold on a little longer, I think, if I know someone is going." },
        { id = "h_salve", when = { questActive = TODO_QUEST("Easing Suffering") },
          text = "Is that the salve? Byancie's work, I would know the smell of it anywhere. Please, quickly, before I lose my nerve." },
        { id = "h_eased", tags = { "news" }, when = { questDone = TODO_QUEST("Easing Suffering") },
          text = "The salve has cooled the wound, and I can breathe again without crying out. I will not pretend that means I am mending, but it means I am not afraid, and that is a great gift." },
      },
      again = {
        { id = "h_again", text = "Stay a moment longer, if you can. It is easier when someone is here." },
        { id = "h_again2", text = "Ask what you like. Talking keeps me awake." },
      },
      choices = {
        { text = "What happened here?", next = "ambush" },
        { text = "What message were you carrying?", next = "message" },
        { text = "That wound looks wrong. What is it?", next = "wound" },
        { text = "Were you alone?", next = "sisters" },
        { text = "Are you afraid?", next = "afraid" },
        { text = "How long have you been a Sentinel?", next = "sentinel" },
        { text = "Tell me about the Oracle Tree.", next = "oracle" },
        { text = "Let me pray over you, sister.", next = "pray", when = { class = "PRIEST" } },
        { text = "Let me look at the wound. I know nature's sicknesses.", next = "druid", when = { class = "DRUID" } },
        { text = "I'm a stranger here, but I'll help however I can.", next = "outsider", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "I'll bring help from Dolanaar.", next = "END" },
      },
    },
    ambush = {
      lines = { { id = "am_default", text = "We were on the road west of the glade when they fell on us from the branches, more harpies than I have ever seen together. They used to keep to their roosts, but these were frenzied, and they fought as if something were driving them." } },
      choices = {
        { text = "Something driving them? Like what?", next = "ambush2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambush2 = {
      lines = { { id = "a2_default", text = "The same foulness that has turned the furbolgs and soured the water in the lower woods, I think. The druids speak of it in low voices, and now it is in me, so perhaps I will learn its name before they do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    message = {
      lines = { { id = "me_default", text = "The Oracle Tree speaks to our elders, and the Council sends runners to carry its words to Darnassus. It was my first turn alone on the long road, and I was so proud to be trusted with it." } },
      choices = {
        { text = "Can I carry the message for you?", next = "message2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    message2 = {
      big = true,
      lines = { { id = "m2_default", text = "It is not written down; it was given to me to remember, and the harpies have shaken it half out of my head. Tell the Council a runner fell, and that the road to the Oracle Glade is not safe, and that is the part that matters most now." } },
      choices = {
        { text = "I'll tell them. The Council must know at once.", next = "BACK", reply = "Thank you. Then I have not failed entirely, and the next runner will go armed.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Forget the Council. You matter more right now.", next = "BACK", reply = "That is kind, and very foolish, and I will remember it as long as I have.", fx = { affinity = 2, align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wound = {
      lines = { { id = "wo_default", text = "A harpy's talon, but it should have closed by now, and instead it is spreading, black at the edges and hot to the touch. Byancie in Dolanaar knows salves better than anyone, so if anyone can slow it, she can." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sisters = {
      lines = { { id = "si_default", text = "No, there were others with me, and I do not know where they are now. I pray they reached the Oracle Glade, or Dolanaar, or anywhere that is not this road." } },
      choices = {
        { text = "They'll be safe. Sentinels are hard to kill.", next = "BACK", reply = "You sound like my instructors. I hope you are all right.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    afraid = {
      lines = { { id = "af_default", text = "Yes. I was taught that the Sentinels do not fear death, and I believed it in the training grounds, under the moon with my sisters around me. Out here, alone on the road, I find I am still very young." } },
      choices = {
        { text = "Fear doesn't make you any less a Sentinel.", next = "afraid_elune" },
        { text = "Something else.", next = "BACK" },
      },
    },
    afraid_elune = {
      lines = { { id = "ae_default", text = "Perhaps not. The priestesses say Elune gathers her children into her light when they fall, and I want to believe them. I only wish I had seen more of the world before I found out whether they are right." } },
      choices = {
        { text = "Then hold on. There's more world yet.", next = "afraid_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    afraid_stance = {
      big = true,
      lines = { { id = "as_default", text = "You speak as though the choice were mine. Tell me honestly, do you think a Sentinel should fight to the last breath, or make her peace with Elune while she still can?" } },
      choices = {
        { text = "Fight. Every breath you take is a victory.", next = "BACK", reply = "Then I will fight, for your sake if not for mine. Thank you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Make your peace. There's no shame in it.", next = "BACK", reply = "No, perhaps there isn't. It is a strange comfort, to be told I may rest.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinel = {
      lines = { { id = "se_default", text = "Not quite a decade, which is nothing at all to my people. My instructor said I had quick feet and a slow tongue, so they made me a runner, and I was glad, because I would rather carry words than spears." } },
      choices = { { text = "You carried them well. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    oracle = {
      lines = { { id = "or_default", text = "An old and wise tree in the glade, that the druids say still remembers the days before the Sundering. It speaks very slowly, and only to those who are patient enough to listen, which is why its messages matter so much to the Council." } },
      choices = {
        { text = "What do you think it was trying to say?", next = "oracle_guess" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oracle_guess = {
      lines = { { id = "og_default", text = "I only heard part of it, and I may be wrong, but it spoke of roots that drink something bitter. I think it was warning us that the sickness in the forest is coming from below, from deep in Teldrassil itself." } },
      choices = { { text = "I'll make sure the Council hears that. Something else.", next = "BACK" } },
    },
    pray = {
      lines = { { id = "pr_default", text = "Please. <She closes her eyes as you pray, and for a moment her breathing eases.> I felt that. Whatever happens, I will not forget that you stopped." } },
      choices = { { text = "Elune keep you, Eralya.", next = "BACK", fx = { affinity = 2 } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "<You see the black veins spreading from the wound like roots in poisoned soil.> You see it too, then? It is the same darkness as in the furbolgs and the water. If you learn what it is, I beg you to tell the Arch Druid." } },
      choices = { { text = "I will. Something else.", next = "BACK" } },
    },
    outsider = {
      lines = { { id = "ou_default", text = "A stranger from across the sea, here on our island, and the first to stop for me. My elders say your people are short-lived and hasty, and I think I will tell them they are wrong about the second part." } },
      choices = { { text = "That's kind of you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    oracle_tree = { { id = "tp_oracle", text = "It remembers more than any of us, and it is trying to warn us. I wish I had kept all its words." } },
    byancie = { { id = "tp_byancie", text = "She makes the best salves in Dolanaar. If anyone can slow this, she can." } },
    harpies = { { id = "tp_harp", text = "They are sick, like the rest of the forest, and sickness makes them cruel." } },
    _none = { { id = "tp_none", text = "Forgive me, I can't think about that now. Ask me again if I am still here." } },
  },
}
