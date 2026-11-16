-- Durotar between the towns, and Razor Hill's trainers. Voice: bibles/durotar.md
-- Misha Tor'kren keeps a lonely hut in the north; Margoz watches Skull Rock from his.
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "misha", id = TODO_NPC("Misha Tor'kren"), name = "Misha Tor'kren",
  bible = "bibles/durotar.md", role = "questgiver", tier = "quest",
  temper = { "grieving" }, values = { "loyal", "proud" },
  notices = { "race" },
  impression = {
    first = "Misha Tor'kren lives alone in a hut in Durotar's north, and the grief for her son Kron sits on her like a second skin. She asks for his amulet back from the beasts that took him, and she does not ask twice.",
    third = "{name} met Misha Tor'kren, a widowed orc keeping a lonely hut in northern Durotar.",
  },
  greetings = {
    { id = "g_hut", text = "Few walk this far north, and fewer stop at my door. Say what brings you, traveler." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to this old hut, then. Sit, if you can stand the quiet." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "You have the look of the camps about you, young one, the way my Kron did before he grew into his shoulders." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Misha Tor'kren, and this hut is all the clan I have left. My son Kron went out hunting and never came home, and the beasts of this hill have his amulet still." },
        { id = "h_amulet", when = { questActive = TODO_QUEST("Lost But Not Forgotten") },
          text = "The beasts that killed my Kron roam the hills nearby. Bring me back his amulet, so that I have something of him to bury." },
        { id = "h_done", when = { questDone = TODO_QUEST("Lost But Not Forgotten") },
          text = "His amulet hangs by my door now, and I touch it every morning. You did a kindness for an old woman, and I have not forgotten it." },
      },
      choices = {
        { text = "Tell me about Kron.", next = "kron" },
        { text = "Why live so far from Razor Hill?", next = "alone" },
        { text = "Who else lives out here?", next = "neighbours" },
        { text = "I lost my kin to the camps as well.", next = "camps", when = { race = "Orc" } },
        { text = "I'll leave you in peace.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Ask what you will, then. The wind does most of my talking these days." },
        { id = "h_again2", text = "Something more? I have time, if nothing else." },
      },
    },
    kron = {
      lines = { { id = "k_default", text = "He was born in the internment camps, and he never once complained about it. When the Warchief freed us, Kron wanted only open land and something to hunt, and Durotar gave him both." } },
      choices = { { text = "How did he die?", next = "kron_death" } },
    },
    kron_death = {
      lines = { { id = "kd_default", text = "He tracked something bigger than he should have, alone, because he was proud like his father. The hunters who found him brought back his spear but not his amulet, and that is the part I cannot let rest." } },
      choices = { { text = "What was the amulet?", next = "kron_amulet" } },
    },
    kron_amulet = {
      lines = { { id = "ka_default", text = "A plain thing of bone and cord that I made him when he was small, so that the spirits would know him. Without it, I fear they wander looking for a name they cannot find." } },
      choices = {
        { text = "I'll bring it back to you, mother.", next = "BACK", fx = { affinity = 3, align = { light = 1 } } },
        { text = "The dead don't need trinkets. You should let him go.", next = "BACK", fx = { affinity = -2, align = { light = -1 } } },
        { text = "Something else, if you'll allow it.", next = "BACK" },
      },
    },
    alone = {
      lines = { { id = "a_default", text = "Razor Hill is full of young warriors shouting about glory, and I have heard enough of that for one life. Out here the hills are quiet, and quiet is what a grieving woman wants." } },
      choices = {
        { text = "The Horde should care for its widows better.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Quiet is your right. Nobody should drag you back.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
      },
    },
    neighbours = {
      lines = { { id = "nb_default", text = "There is Margoz, who sits by Skull Rock and watches the cultists come and go, and he is no better company than I am. South, the soldiers at Razor Hill, and past them only scorpids." } },
      choices = { { text = "I'll look in on Margoz.", next = "BACK" } },
    },
    camps = {
      lines = { { id = "c_default", text = "Then you know why I will not forget, because the camps took years from us and the hills took the rest. Carry them with you, child, but do not let them make you bitter." } },
      choices = { { text = "I'll try. Thank you.", next = "BACK", fx = { affinity = 2 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know this hut and these hills, and little else matters to me now." } },
  },
}

P:NPC {
  key = "margoz", id = TODO_NPC("Margoz"), name = "Margoz",
  bible = "bibles/durotar.md", role = "questgiver", tier = "quest",
  temper = { "watchful" }, values = { "dutiful", "patient" },
  notices = { "class" },
  impression = {
    first = "Margoz keeps a hut within sight of Skull Rock and counts the Burning Blade cultists who slip in and out of it. He is patient and sour about it, and he would rather you did the killing than him.",
    third = "{name} met Margoz, an orc keeping watch over Skull Rock from a hut in the hills.",
  },
  greetings = {
    { id = "g_watch", text = "Keep your voice down, because the rock has ears. What do you want?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The cultists haven't gone anywhere, if that's what you're wondering." },
  },
  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You smell of the same fel as the ones in that cave, and I will be watching your hands while we talk." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Margoz, and I watch Skull Rock for the Horde. The Burning Blade have dug themselves into that cave like ticks, and someone has to count them." },
        { id = "h_skull", when = { questActive = TODO_QUEST("Skull Rock") },
          text = "Down into Skull Rock with you, then, and bring me back what the cultists carry. Proof is what Orgrimmar wants, and proof is what I'll send them." },
        { id = "h_neeru", when = { questActive = TODO_QUEST("Margoz") },
          text = "So Orgrimmar sent you to old Margoz. Good, because I've been waiting for someone with more sword than sense." },
      },
      choices = {
        { text = "Who are the Burning Blade?", next = "blade" },
        { text = "Why watch from out here?", next = "watch" },
        { text = "Who sends you your orders?", next = "orders" },
        { text = "I study the fel too, but I'm no cultist.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I'll get to it.", next = "END" },
      },
      again = {
        { id = "h_again", text = "More questions? Fine, but keep one eye on the rock while you ask them." },
        { id = "h_again2", text = "Go on. I'm not going anywhere, and neither are they." },
      },
    },
    blade = {
      lines = { { id = "b_default", text = "Orcs who never let go of the demons, even after the demons ruined us. They meet in caves and whisper to things the Warchief swore we'd never bow to again." } },
      choices = { { text = "How many are there?", next = "blade_count" } },
    },
    blade_count = {
      lines = { { id = "bc_default", text = "More every season, and that's what worries me. Some of them walk out of Orgrimmar in daylight, which means someone inside the city is feeding them." } },
      choices = { { text = "Someone in Orgrimmar? Who?", next = "blade_who" } },
    },
    blade_who = {
      lines = { { id = "bw_default", text = "If I knew a name, I'd have sent it to Thrall already. I only know the cultists go north with full packs and come back with empty ones, and that a cleft in the city is dark enough to hide anything." } },
      choices = {
        { text = "Traitors deserve to be dragged into the light.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Every orc chooses his own masters. That's freedom.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "A hut makes a poor fortress, but it makes a fine blind. They think I'm an old hermit, and old hermits see a great deal." } },
      choices = { { text = "Clever.", next = "BACK" } },
    },
    orders = {
      lines = { { id = "o_default", text = "Orgrimmar, by way of whoever they send. Gar'Thok at Razor Hill knows I'm here, and Orgnil hunts the same cultists from his end." } },
      choices = { { text = "I'll tell them you're still watching.", next = "BACK", fx = { affinity = 1 } } },
    },
    warlock = {
      lines = { { id = "wl_default", text = "So they all say, right up until the day they don't. Prove it in that cave, and maybe I'll stop watching your hands." } },
      choices = {
        { text = "I'll prove it on their skulls.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I owe you no proof, old man.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
  },
  topics = {
    burning_blade = { { id = "tp_blade", text = "Cultists, fools and worse. Kill them where you find them, and look hard at who mourns them." } },
    _none = { { id = "tp_none", text = "I watch a rock for a living, so ask someone who gets out more." } },
  },
}

P:NPC {
  key = "swart", id = TODO_NPC("Swart"), name = "Swart",
  bible = "bibles/durotar.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "calm" }, values = { "wise" },
  notices = { "class" },
  impression = {
    first = "Swart trains the shaman of Razor Hill, a calm orc who speaks of the elements the way other orcs speak of old friends.",
    third = "{name} met Swart, the shaman trainer at Razor Hill.",
  },
  greetings = {
    { id = "g_hi", text = "The wind is dry today, and it carries you here. Welcome." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Swart, and I teach those the elements will answer. If you have the gift, I can help you hear it; if not, I can still tell you what the spirits say of this land." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "A shaman, good. Sit, and let us see what the earth has taught you since we last spoke." },
      },
      choices = {
        { text = "What do the spirits say of Durotar?", next = "land" },
        { text = "How did the orcs regain the old ways?", next = "ways" },
        { text = "Farewell, Swart.", next = "END" },
      },
      again = { { id = "h_again", text = "Something more? The elements are patient, and so am I." } },
    },
    land = {
      lines = { { id = "l_default", text = "That it is hard and honest, like the people who chose it. The fire here is close to the surface and the water is scarce, so we learn to give thanks for every rain." } },
      choices = {
        { text = "A hard land makes a strong people.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Strong or not, we deserved better land.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    ways = {
      lines = { { id = "w_default", text = "The Warchief learned them from Drek'Thar, who kept them alive through the dark years. Now every shaman Thrall trains carries a little of that old Frostwolf patience with him." } },
      choices = { { text = "Tell me more of Drek'Thar.", next = "ways_drek" } },
    },
    ways_drek = {
      lines = { { id = "wd_default", text = "He is old and blind, and he still leads the Frostwolves in Alterac far to the north. I never met him, but every shaman owes him something." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "The spirits have told me nothing of that, and I won't guess for them." } },
  },
}

P:NPC {
  key = "tarshaw", id = TODO_NPC("Tarshaw Jaggedscar"), name = "Tarshaw Jaggedscar",
  bible = "bibles/durotar.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "gruff" }, values = { "brave" },
  notices = { "class" },
  impression = {
    first = "Tarshaw Jaggedscar trains Razor Hill's warriors, a scarred veteran who judges a recruit by the way they stand before they ever swing.",
    third = "{name} met Tarshaw Jaggedscar, the warrior trainer at Razor Hill.",
  },
  greetings = {
    { id = "g_hi", text = "Stand straight when you come to my yard, recruit. Now, what is it?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Tarshaw Jaggedscar, and I teach the warriors of Razor Hill how to stay alive long enough to be useful. The scars are from the ones who taught me." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Back for more lessons, warrior? Good, because the scorpids out there won't wait for you to get better." },
      },
      choices = {
        { text = "How did you get those scars?", next = "scars" },
        { text = "What makes a good warrior?", next = "good" },
        { text = "I'll be going.", next = "END" },
      },
      again = { { id = "h_again", text = "You're still here, so ask your question and let me get back to watching the road." } },
    },
    scars = {
      lines = { { id = "s_default", text = "The Second War, mostly, and a few from the camps' guards when I was too stubborn to sit down. Every one of them taught me something, which is more than I can say for most teachers." } },
      choices = { { text = "Which one taught you most?", next = "scars_best" } },
    },
    scars_best = {
      lines = { { id = "sb_default", text = "The one I got running from a fight I could have won. I've never run since, and I've never let a recruit of mine run either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    good = {
      lines = { { id = "g_default", text = "Feet first, then shield, then blade, and the head over all of them. A warrior who only knows how to swing dies young and loud." } },
      choices = {
        { text = "Discipline wins more fights than rage.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rage won the orcs plenty of fights.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I teach fighting, recruit, not gossip. Ask Grosk at the inn." } },
  },
}
