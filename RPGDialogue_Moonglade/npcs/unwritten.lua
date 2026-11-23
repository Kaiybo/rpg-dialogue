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
    { id = "g_default", text = "Peace, little one. In Moonglade, no one needs a weapon in hand." },
    { id = "g_druid", when = { class = "DRUID" }, text = "A druid! Welcome home, then, for every druid's home is here, whatever their tribe." },
  },
  start = "hello",
  nodes = {
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
    { id = "g_default", text = "Welcome to Moonglade, {class}. Here the Horde and the Alliance walk side by side, and the wardens see that it stays that way." },
  },
  notice = {
    { id = "n_ally", cat = "faction", when = { faction = "Alliance" }, text = "You will see Horde in Nighthaven, Alliance traveller. Leave your quarrels at the edge of the glade." },
    { id = "n_horde", cat = "faction", when = { faction = "Horde" }, text = "You will see Alliance in Nighthaven, Horde traveller. Leave your quarrels at the edge of the glade." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am a warden of the Cenarion Circle, and Moonglade is under the Circle's protection. Whoever draws a blade on a guest here answers to us, whatever banner they march under." } },
      again = { { id = "h_again", text = "Something more? Speak; I am listening, and I am watching." } },
      choices = {
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
    _none = { { id = "tp_none", text = "Ask in Nighthaven, {class}. The wardens watch the paths, not the gossip." } },
  },
}
