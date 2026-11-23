-- Badlands: folk a roster scan found with no conversation yet. Voice: bibles/badlands_wanderers.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC = P.TODO_NPC

-- Thorkaf Dragoneye: the orc dragonscale leatherworker of Dustwind Gulch.
P:NPC {
  key = "bad_thorkaf_dragoneye", id = TODO_NPC("Thorkaf Dragoneye"), name = "Thorkaf Dragoneye", title = "Dragonscale Leatherworking Trainer", gender = "male",
  bible = "bibles/badlands_wanderers.md", role = "trainer", tier = "service",
  communities = { "badlands" }, temper = { "gruff", "proud" }, values = { "craft", "strength" },
  notices = { "craft", "race" },
  impression = {
    first = "Thorkaf Dragoneye keeps a lonely camp in Dustwind Gulch, scraping whelp hides beside a fire. He looked at my armor before he looked at my face.",
    third = "{name} met Thorkaf Dragoneye, the orc who teaches dragonscale leatherworking in the Badlands.",
  },
  greetings = {
    { id = "g_default", text = "You walked a long way into dragon country, stranger, so either you are lost or you want to learn something worth the walk." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and with all your limbs. The whelps must be getting slow, or you are getting quick." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Your hands smell of tanning salt, so you already know the craft. Good, because I do not teach beginners how to hold a knife." },
    { id = "n_ally", cat = "race", when = { faction = "Alliance" },
      text = "I teach the Horde, and you are not the Horde, so do not waste my fire. Talk if you must, but keep your hands where I can see them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Thorkaf Dragoneye, and I work the hides of dragons, which is the hardest leather in the world to cut and the best in the world to wear. The black flight's whelps nest all over these canyons, so I am never short of material." } },
      again = {
        { id = "h_again", text = "What else, then? The fire will not wait forever." },
        { id = "h_again2", text = "Speak, and be quick about it." },
      },
      choices = {
        { text = "How did you earn the name Dragoneye?", next = "name" },
        { text = "Hunting whelps for leather sounds dangerous work.", next = "whelps" },
        { text = "Why camp out here instead of Kargath?", next = "camp" },
        { text = "Teach me what you know.", next = "END" },
      },
    },
    name = {
      lines = { { id = "nm_default", text = "I learned to read the scales the way a shaman reads the wind, and I can tell you which flight a hide came from by the light that falls through it. The grunts said I must have a dragon's eye, and the name stuck to me like tar." } },
      choices = {
        { text = "So you can read any dragon's scales?", next = "flights" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flights = {
      lines = { { id = "fl_default", text = "Black scale drinks the heat and gives it back slowly, and that is what you want against fire. Blue and green are rarer out here, and I trade for them when a caravan is foolish enough to come this far." } },
      choices = { { text = "Something else, Thorkaf.", next = "BACK" } },
    },
    whelps = {
      lines = { { id = "w_default", text = "Dangerous, yes, and that is why the armor is worth wearing. A whelp is small, but its mother is not, and the black dragons do not forgive a hunter who gets careless near Lethlor Ravine." } },
      choices = {
        { text = "Killing young dragons is a hard thing to justify.", next = "BACK", reply = "Hard? These are the brood of Deathwing, and they would burn Kargath to ash given the chance. I will not weep for them.", fx = { align = { light = 1 } } },
        { text = "Deathwing's brood deserves no mercy. Skin them all.", next = "BACK", reply = "Now you speak like an orc. Bring me hides and I will show you what they are good for.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "Kargath is full of shouting and smoke, and a tanner needs quiet and clean water, which is rare enough in the Badlands. Out here the gulch keeps the wind off my racks, and nobody steals my hides but the vultures." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am an orc of the Horde, and I have worked hides since the internment camps, where it was the only work they let us do with knives." } },
    _none = { { id = "tp_none", text = "I know leather and dragons, stranger. Ask someone in Kargath about the rest." } },
  },
}

---------------------------------------------------------------------------
-- High Executioner Nuzrak: Kargath's headsman, who keeps the Horde's grudge against the Dark Irons.
---------------------------------------------------------------------------
P:NPC {
  key = "bad_nuzrak", id = 9538, name = "High Executioner Nuzrak", role = "guard", tier = "service",
  temper = { "grim", "stern" }, values = { "honor", "duty" },
  notices = { "faction" },
  greetings = {
    { id = "g_default", text = "You stand before the executioner of Kargath. Speak plainly, for I have little patience for wasted words." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "An Alliance face, this close to my axe. Speak your business and pray it is a good one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I am Nuzrak, and when the Horde judges a traitor in the Badlands, it is my axe that carries out the sentence. Kargath watches the Blackrock and the Dark Irons both, and my work is never finished." } },
      again = { { id = "h_again", text = "What else, {class}?" } },
      choices = {
        { text = "Whom have you executed?", next = "traitors" },
        { text = "What do you know of the Dark Irons below?", next = "darkiron" },
        { text = "Lok'tar.", next = "END", when = { faction = "Horde" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    traitors = {
      lines = { { id = "t_default", text = "Orcs who forgot their blood and sold themselves to the Blackrock clan, mostly. Grark Lorkrub was one. He sold our plans to the Blackrock, and when he was dragged to the Searing Gorge in chains, my axe was waiting." } },
      choices = {
        { text = "Traitors deserve the axe.", next = "BACK", reply = "They do. A Horde that forgives betrayal will not be a Horde for long.", fx = { align = { order = 1 } } },
        { text = "Perhaps they had their reasons.", next = "BACK", reply = "Every traitor has reasons. That is why we do not listen to them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkiron = {
      lines = { { id = "d_default", text = "They build their city beneath the mountain and bow to a fire lord, and the Blackrock orcs above them bow to a dragon. If there is a nest of serpents in all of Azeroth, it is that peak." } },
      choices = {
        { text = "Then it should be cleansed.", next = "BACK", reply = "Yes. Go down there, and come back with the proof, and I will remember your name." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I am an executioner, not a scholar. Ask someone with softer hands." } } },
}
