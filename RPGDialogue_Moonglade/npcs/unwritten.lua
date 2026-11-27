-- Moonglade folk with no conversation until now: Bessany Plainswind, a tauren of the Cenarion Circle in Nighthaven.
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Bessany Plainswind
---------------------------------------------------------------------------
P:NPC {
  key = "mg_bessany", id = TODO_NPC("Bessany Plainswind"), name = "Bessany Plainswind",
  role = "citizen", tier = "service", race = "Tauren",
  communities = { "nighthaven" }, temper = { "warm", "serene" }, values = { "nature", "balance" },
  impression = {
    first = "A tauren of the Cenarion Circle, at ease among the night elves of Nighthaven.",
    third = "{name} met Bessany Plainswind, a tauren of the Cenarion Circle in Nighthaven.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Peace, little one. I'm glad you've come back to us. The glade always seems kinder when you're in it." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Peace, {class}. In Moonglade, even those I'm unsure of are given a quiet place to stand." },
    { id = "g_default", text = "Peace, little one. In Moonglade, no one needs a weapon in hand." },
    { id = "g_druid", when = { class = "DRUID" }, text = "A druid! Welcome home, then, for every druid's home is here, whatever their tribe." },
  },
  start = "hello",
  nodes = {
    xpath = {
      narr = "Bessany smiles and runs a broad hand along the grass at her side.",
      lines = { { id = "xpath_default", text = "Through Hamuul Runetotem, who was the first of us to come to Moonglade. He said the shu'halo had walked with Cenarius long before the kaldorei found us again, and that we should walk with his teachers too." } },
      choices = {
        { text = "Were your people welcomed?", next = "xwelcome" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwelcome = {
      lines = { { id = "xwelcome_default", text = "Not at first. Some of the elder druids remembered only that we march with the orcs. But Remulos spoke for us, and Malfurion's own students taught Hamuul, and the doubts quieted, slowly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xstudy = {
      lines = { { id = "xstudy_default", text = "Herbs, and the way the moonlight falls on the lake. And patience, which is the hardest study of all. My teacher says a druid who hurries is only a hunter with leaves in her hair." } },
      choices = {
        { text = "Will you ever enter the Dream?", next = "xdream2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdream2 = {
      lines = { { id = "xdream2_default", text = "One day, when I am ready. Some here say druids should spend more time in the Dream and less in the world. I think the world needs us more. Where should a druid stand, do you think?" } },
      choices = {
        { text = "In the world, where people suffer.", next = "BACK", reply = "That is my heart's answer as well.", fx = { align = { order = -1 } } },
        { text = "In the Dream, guarding what the world grows from.", next = "BACK", reply = "The elders would agree. Perhaps they see further than I do.", fx = { align = { order = 1 } } },
      },
    },
    xmulgore = {
      lines = { { id = "xmulgore_default", text = "Every day. The wind there smells of open sky and grass that never ends. Here it smells of moonflowers and still water. Both are good. I am lucky to know two homes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xelf = {
      lines = { { id = "xelf_default", text = "Here, yes, most of them. They are slow to laugh, but when they do, it is a gift. One of the old druids sang to me in the old tongue on my first night here. I did not understand a word, and I wept." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Bessany Plainswind of Mulgore. I came to Nighthaven to learn the ways of the Cenarion Circle, and I stayed because the moon shines kinder here than anywhere else." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "Your people taught mine the druid's path, long ago. I thank them every day, and I thank you now." },
      },
      again = {
        { id = "h_again", text = "What more would you ask?" },
        { id = "h_again2", text = "Speak freely. Moonglade listens kindly." },
      },
      choices = {
        { text = "How did a tauren come to the Circle?", next = "xpath" },
        { text = "What are your studies here?", next = "xstudy" },
        { text = "Do you miss Mulgore?", next = "xmulgore" },
        { text = "I'm kaldorei. Are my people kind to you?", next = "xelf", when = { race = "NightElf" } },

        { text = "Do the night elves treat you as an equal here?", next = "equal" },
        { text = "What makes Moonglade special?", next = "glade" },
        { text = "Farewell, Bessany.", next = "END" },
      },
    },
    equal = {
      lines = { { id = "eq_default", text = "Here they do. Outside Moonglade, the Horde and the Alliance quarrel, but within it we are only druids, and Keeper Remulos would have it no other way." } },
      choices = {
        { text = "The Circle should stay above the war.", next = "BACK", reply = "Yes. If we take sides, who will speak for the land?", fx = { align = { honor = -1 } } },
        { text = "Sooner or later, everyone must pick a side.", next = "BACK", reply = "Perhaps. But I pray that day is far away.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    glade = {
      lines = { { id = "gl_default", text = "It is a holy place, guarded by Remulos, son of Cenarius. The Emerald Dream lies very close here, and some nights, if you listen, you can almost hear it." } },
      choices = {
        { text = "What is the Emerald Dream?", next = "dream" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream = {
      lines = { { id = "dr_default", text = "The world as it was meant to be, before anyone touched it. The elder druids walk there in their sleep. I am not yet wise enough to follow them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    hamuul = { { id = "tp_xhamuul", text = "Arch Druid Hamuul Runetotem. He opened the path for my people, and I follow it." } },
    mulgore = { { id = "tp_xmulgore", text = "Home. Wide skies and long grass. I will go back one day, wiser I hope." } },
  },
}

---------------------------------------------------------------------------
-- Moonglade Warden: the night elf and tauren guards of Nighthaven who keep the Cenarion Circle's peace.
---------------------------------------------------------------------------
P:NPC {
  key = "mg_moonglade_warden", id = 11822, name = "Moonglade Warden", gender = "male",
  role = "guard", tier = "service",
  communities = { "nighthaven" }, temper = { "stern", "calm" }, values = { "balance", "peace" },
  notices = { "faction" },
  impression = {
    first = "A warden of the Circle, watching both Horde and Alliance with the same even look.",
    third = "{name} spoke with a Moonglade Warden in Nighthaven.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ah, it's you. The other wardens speak well of you, and that is not a small thing in this glade. Walk in peace." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "The wardens have their eye on you. Walk the glade in peace, and see that you keep it." },
    { id = "g_rep1", when = { rep = { faction = "Cenarion Circle", min = "Honored" } }, text = "The wardens know your name, friend of the Circle. Walk the glade in peace." },
    { id = "g_default", text = "Welcome to Moonglade, {class}. Here the Horde and the Alliance walk side by side, and the wardens see that it stays that way." },
  },
  notice = {
    { id = "n_ally", cat = "faction", when = { faction = "Alliance" }, text = "You will see Horde in Nighthaven, Alliance traveller. Leave your quarrels at the edge of the glade." },
    { id = "n_horde", cat = "faction", when = { faction = "Horde" }, text = "You will see Alliance in Nighthaven, Horde traveller. Leave your quarrels at the edge of the glade." },
  },
  start = "hello",
  nodes = {
    xfight = {
      narr = "The warden's mouth thins, and for a moment she looks very old.",
      lines = { { id = "xfight_default", text = "More than once. An orc and a human came to blows by the lake last spring, over a word neither would repeat. We put them both in roots until they cooled. They left the glade the next morning, still glaring, but alive." } },
      choices = {
        { text = "Is that justice, holding both alike?", next = "xjustice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xjustice = {
      lines = { { id = "xjustice_default", text = "It is the only kind the glade can afford. If we judged who struck first, we would become a court, and then a side. Some of my fellows think we should judge. What do you think?" } },
      choices = {
        { text = "Hold both alike. Neutrality must be blind.", next = "BACK", reply = "That is the Circle's way, and mine.", fx = { align = { order = 1 } } },
        { text = "Judge them. The guilty should answer for it.", next = "BACK", reply = "A fair heart, but a dangerous road for the glade.", fx = { align = { order = -1 } } },
      },
    },
    xwardens = {
      lines = { { id = "xwardens_default", text = "Druids, mostly, of every people the Circle accepts, and a few who are not druids but swore to Remulos anyway. We are few. We do not need to be many, for the glade itself is on our side." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlunar = {
      lines = { { id = "xlunar_default", text = "When the new year turns, the village fills with fireworks and pilgrims, and the spirits of the elders come home. It is the busiest time of the year for the wardens, and the most beautiful." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdruid = {
      lines = { { id = "xdruid_default", text = "As a guest at your own hearth. Help those who are new here, and remember that the druid from the other side of the war is still your kin in the Circle. That is harder than it sounds." } },
      choices = { { text = "I'll try.", next = "BACK", reply = "Trying is enough to begin with." } },
    },

    hello = {
      lines = { { id = "h_default", text = "I am a warden of the Cenarion Circle, and Moonglade is under the Circle's protection. Whoever draws a blade on a guest here answers to us, whatever banner they march under." } },
      again = { { id = "h_again", text = "Something more? Speak; I am listening, and I am watching." } },
      choices = {
        { text = "Have you ever had to stop a fight?", next = "xfight" },
        { text = "Who are the wardens?", next = "xwardens" },
        { text = "What of the Lunar Festival?", next = "xlunar" },
        { text = "I am a druid. How should I conduct myself here?", next = "xdruid", when = { class = "DRUID" } },

        { text = "Why keep the peace between enemies?", next = "peace" },
        { text = "What is this place?", next = "place" },
        { text = "I'll keep the peace.", next = "END" },
      },
    },
    peace = {
      lines = { { id = "p_default", text = "Because the land does not care which banner you follow, and neither does the Emerald Dream. The druids of both peoples study here, and a war in Moonglade would undo what Malfurion and the Circle have spent long years building." } },
      choices = {
        { text = "A neutral ground is wise. I respect it.", next = "BACK", reply = "Then you will find no trouble from the wardens, and perhaps a little welcome.", fx = { align = { order = 1 } } },
        { text = "My enemies are my enemies, wherever they stand.", next = "BACK", reply = "Then keep them so outside the glade. Inside it, your enemy is whoever breaks the peace.", fx = { align = { order = -1 } } },
      },
    },
    place = {
      lines = { { id = "pl_default", text = "Moonglade is sacred to the druids, a place where the Emerald Dream lies close to the waking world. Nighthaven is its village, Lake Elune'ara its heart, and the Shrine of Remulos stands in the north." } },
      choices = {
        { text = "Who is Remulos?", next = "remulos" },
        { text = "Something else.", next = "BACK" },
      },
    },
    remulos = {
      lines = { { id = "r_default", text = "Keeper Remulos is the son of Cenarius and the guardian of this glade, and he taught Malfurion himself in ages long gone. Show his shrine respect, {class}, and do not trouble him without need." } },
      choices = { { text = "I will. Something else.", next = "BACK" } },
    },
  },
  topics = {
    nighthaven = { { id = "tp_xnighthaven", text = "The village by the lake. Its doors are open to every druid and every peaceful guest." } },
    lunar_festival = { { id = "tp_xlunar", text = "When the elders return to Moonglade. The wardens sleep little that week." } },

    _none = { { id = "tp_none", text = "Ask in Nighthaven, {class}. The wardens watch the paths, not the gossip." } },
  },
}
