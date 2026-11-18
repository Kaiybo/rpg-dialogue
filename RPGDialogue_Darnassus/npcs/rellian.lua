-- Rellian Greenspyre, a druid in Darnassus who studies Denalan's timberlings (0.72.0). Voice: bibles/rellian.md
-- Classic: Rellian Greenspyre (turn-in, from Denalan), Tumors, Return to Denalan.
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "rellian", id = TODO_NPC("Rellian Greenspyre"), name = "Rellian Greenspyre",
  bible = "bibles/rellian.md", role = "questgiver", tier = "quest",
  communities = { "darnassus" }, temper = { "earnest", "troubled" }, values = { "nature", "duty" },
  notices = { "craft", "form" },
  impression = {
    first = "Rellian Greenspyre wanted to grow a timberling from a seed and found the rot already inside it. He talks about cutting the sick ones down as if he were apologising to them.",
    third = "{name} met Rellian Greenspyre, a Darnassian druid who discovered the corruption carried in the timberlings' seeds.",
  },

  greetings = {
    { id = "g_hello", text = "Ishnu-alah, friend. Mind the seedlings, for they are the only healthy things on this table." },
    { id = "g_tumors", when = { questActive = TODO_QUEST("Tumors") }, text = "The timberlings at Wellspring Lake, friend, the ones that wander the shore. Bring me the tumors so they can be burned." },
    { id = "g_denalan", when = { questActive = TODO_QUEST("Return to Denalan") }, text = "Go to Denalan quickly. If he has found the cause, I want to hear it from him before nightfall." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I've buried three more tumors in the fire pit since. Welcome back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "You've grown since you carried that seed up from the lake. Denalan still asks after you, you know." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The Enclave says you've been a help to folk around the city. Good; there's never enough of that in Darnassus." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You're an herbalist; I can smell the earthroot on your gloves. Have you seen moss growing where it shouldn't on Teldrassil's plants?" },
    { id = "n_tree", cat = "form", when = { form = "tree" },
      text = "Please don't stand so near the seedlings in that shape. I know how it sounds, but they lean toward you, and I'm not sure it's good for them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "o_teldrassil_tree_wrong", tags = { "news" }, when = { gossip = { topic = "teldrassil_tree", stance = "wrong" } },
          text = "Denatharion says you doubt the tree. Come and see my timberlings, then, and tell me whether it's the tree that's wrong or something in the water." },
        { id = "h_default", key = true,
          text = "I'm Rellian Greenspyre. I've been helping Denalan at Lake Al'Ameth with his work on the timberlings, though lately my help has mostly meant bad news." },
        { id = "h_seed", tags = { "news" }, when = { questActive = TODO_QUEST("Rellian Greenspyre") },
          text = "A timberling seed from Denalan? I hoped to grow one, but I fear I've found a corruption in many of them, and a seed carries its parent's taint. This is beyond my talents to mend." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Tumors") },
          text = "There is a malevolence growing in the timberlings, and until we find its source, the worst of them must be cut down. It is not a task I enjoy asking of anyone." },
        { id = "h_tumors_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Tumors"), days = 3 } },
          text = "Well done. These tumors are the sign of their sickness, and they're full of a poison we must burn out of our new land." },
        { id = "h_return", tags = { "news" }, when = { questActive = TODO_QUEST("Return to Denalan") },
          text = "Denalan has sent word that he may know what causes the tumors. Speak with him, tell him I sent you, and hurry, because he needs our help." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid; good. You'll understand that cutting down a creature of the forest is never a light thing, even when it's the only kindness left." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I'm only sorting seeds, so I've time to talk." },
        { id = "h_again2", text = "Ask away. Talking is better than staring at these tumors." },
      },
      choices = {
        { text = "What's wrong with the timberlings?", next = "sickness" },
        { text = "You speak as if you know Denalan well.", next = "denalan" },
        { text = "Must we really kill them?", next = "cull" },
        { text = "Could the Circle heal them in their dreaming?", next = "druid_r", when = { class = "DRUID" } },
        { text = "I've seen fel moss on the grells and furbolgs too.", next = "felmoss", when = { any = { { questDone = TODO_QUEST("Gnarlpine Corruption") }, { topicKnown = "fel_moss" } } } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Goodbye, Rellian.", next = "END" },
      },
    },

    sickness = {
      lines = {
        { id = "si_default", text = "Mossy growths, swelling up out of their bark like boils, and inside them a poison that eats at the wood. The sick ones grow slow and angry, and the healthy ones that stand near them start to sicken too." },
      },
      choices = {
        { text = "Where did it come from?", next = "sickness_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sickness_where = {
      lines = {
        { id = "sw_default", text = "That is the question Denalan has been chasing for months. Wellspring Lake, north of Dolanaar, is the worst of it, so whatever feeds it is near there, or flows down from there." },
      },
      choices = {
        { text = "The source might be in the tree itself.", next = "sickness_tree" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sickness_tree = {
      big = true,
      lines = {
        { id = "st_default", text = "Then I would not want to be the one to tell the Arch Druid so. We were promised Teldrassil would be whole, and most of the Enclave would rather blame a satyr than the soil." },
      },
      choices = {
        { text = "Then someone has to say it plainly.", next = "BACK", reply = "Plainly, then, and I hope your voice carries further than mine has. The Enclave hears a truth more easily from a stranger than from one of its own.", fx = { align = { order = -1 } } },
        { text = "Bring proof first. Rumour helps no one.", next = "BACK", reply = "You sound like the elders, and in this you are right, which stings a little. Bring me seeds and I will bring the Arch Druid the proof.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "teldrassil" } } },
      },
    },

    denalan = {
      lines = {
        { id = "de_default", text = "We studied together long ago, and he was always better with things that grow. He's out at Lake Al'Ameth with his planters, and if anyone can find a cure for future timberlings, it's him." },
      },
      choices = {
        { text = "You trust him a great deal.", next = "denalan_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    denalan_trust = {
      lines = {
        { id = "dt_default", text = "I do, though I wish he'd come into the city more often. He forgets to eat when the work is going badly, and lately it always is." },
      },
      choices = {
        { text = "I'll check on him when I'm at the lake.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Goodbye, Rellian.", next = "END" },
      },
    },

    cull = {
      big = true,
      lines = {
        { id = "cu_default", text = "The ones beyond help, yes, because their seeds carry the taint and every sick sapling spreads it further. I hate it, and I have asked myself if there's another way more times than I can count." },
      },
      choices = {
        { text = "Then I'll take only the ones past saving.", next = "BACK", reply = "Thank you, and the forest will thank you too, in its slow way. Mercy for what can be saved is the whole of a druid's work.", fx = { align = { light = 1 } } },
        { text = "Burn them all, and be sure of it.", next = "BACK", reply = "No, I beg you, not all of them, or we are no better than the blight itself. The taint is cruel enough without us doing its work for it.", fx = { align = { light = -1 } } },
        { text = "What becomes of the tumors?", next = "cull_burn" },
      },
    },
    cull_burn = {
      lines = {
        { id = "cb_default", text = "I burn them in a stone pit away from any roots, and I stand there until the ash is cold. Nothing that poisonous should be buried in Teldrassil's soil." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Goodbye, Rellian.", next = "END" },
      },
    },
    druid_r = {
      lines = {
        { id = "dr_default", text = "I've wondered, but timberlings don't dream the way we do, and I wouldn't know where to find them in Ysera's realm. If you ever learn otherwise, come and tell me before you tell the Enclave." },
      },
      choices = {
        { text = "I'll come to you first.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    felmoss = {
      lines = {
        { id = "fm_default", text = "Then it's the same rot wearing different shapes, and that's worse than I feared. I'll write to Denalan tonight, and to Athridas in Dolanaar too." },
      },
      choices = {
        { text = "Good. Somebody needs to put it together.", next = "BACK", fx = { affinity = 1, learn = { "fel_moss" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A druid of the Enclave, which in my case means more hours with seeds than with sermons." } },
    advice = { { id = "tp_ad", text = "If a living thing grows wrong, find out why before you cut it down. And then, if you must, cut it down cleanly." } },
    fel_moss = { { id = "tp_felmoss", text = "I don't know that the moss on the timberlings and the fel moss on the Gnarlpine are the same thing, but I'd bet my seeds on it." } },
    teldrassil = { { id = "tp_tree", text = "It's young, for a world tree, and young things catch sicknesses. That's what I tell myself, anyway." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle tends the whole world's balance. I tend one lake's worth of timberlings, and some days that feels like too much." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "I've walked the edges of the Dream a few times, and every seed there grows the way it was meant to. Then I wake and go back to fel moss, and I try not to resent it." } },
    green_dragons = { { id = "tp_green_dragons", text = "Ysera's flight sleeps beneath the great trees in Ashenvale and Feralas and the human lands. The ground around those trees grows strange lately, and I don't like it." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil grew from the Well's waters and Teldrassil grew from Fandral's will. I've kept seeds from both, and I'll let you guess which ones sprout more willingly." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are the only furbolgs left untouched by the corruption, and they guard their tunnels in Felwood fiercely. Bring them clean seeds and they'll speak with you." } },
    _none = { { id = "tp_none", text = "I'm afraid that's outside my seed beds, friend. Ask someone at the Enclave, where the druids have had ten thousand years to learn the answer." } },
  },
}
