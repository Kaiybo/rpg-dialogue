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
