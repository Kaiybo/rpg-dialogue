-- Ragefire Chasm: the Burning Blade's lair under Orgrimmar. Taragaman the Hungerer, the demon who
-- feeds the cult, and Jergosh the Invoker, the warlock who keeps its rituals, both speak before blades are drawn.
-- Voices: bibles/dg_taragaman.md, bibles/dg_jergosh.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Taragaman the Hungerer: a demon gorging on the fire below the orcs' new capital.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_taragaman", id = TODO_NPC("Taragaman the Hungerer"), name = "Taragaman the Hungerer",
  bible = "bibles/dg_taragaman.md", role = "boss", tier = "quest",
  temper = { "cruel", "mocking" }, values = { "hungry", "ambitious" },
  notices = { "race", "class" },
  impression = {
    first = "He looks at you the way a wolf looks at a lamb that has wandered into its den.",
    third = "{name} faced Taragaman the Hungerer in the depths of Ragefire Chasm.",
  },

  greetings = {
    { id = "g_default", text = "Another morsel climbs down into my chasm. How thoughtful of the Warchief to keep feeding me." },
    { id = "g_slay", when = { questActive = TODO_QUEST("Slaying the Beast") }, text = "You've come for my heart, have you? Many have wanted it, little one, and the fire has eaten every one of them." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. Your grandfathers drank the blood of my masters and begged for more, and I can still smell it in your veins." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. You bind lesser things than me with your little circles, and you think that makes you a master. It makes you a meal that hasn't learned it yet." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Taragaman, and I am hungry. The Burning Blade feeds me their prisoners and their prayers, and in return I make them strong enough to rot the Horde from beneath its own feet." },
      },
      again = { { id = "h_again", text = "Still talking? The fire grows impatient, and so do I." } },
      choices = {
        { text = "Why hide beneath Orgrimmar?", next = "orgrimmar" },
        { text = "What does the Burning Blade get from you?", next = "blade" },
        { text = "Tell me about the Legion.", next = "legion" },
        { text = "Enough talk. I'm here to end you.", next = "END" },
      },
    },
    orgrimmar = {
      lines = { { id = "o_default", text = "Where better? Thrall built his city on a crack in the world full of fire, and fire has always belonged to my kind. Every year the orcs grow comfortable above, and every year my cultists grow bolder below." } },
      choices = {
        { text = "Thrall will burn this nest out.", next = "BACK", reply = "Thrall is busy pretending his people were never ours. Let him pretend; it suits me perfectly.", fx = { align = { order = 1 } } },
        { text = "Comfort makes every ruler blind.", next = "BACK", reply = "Ah, you understand. Perhaps you'd make a better cultist than a corpse, though I doubt I'll find out.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade = {
      lines = { { id = "b_default", text = "Power, of course, the same thing every mortal wants. I teach them which fires to stoke and which throats to cut, and they tell themselves they're the masters of this bargain." } },
      choices = {
        { text = "And who really is the master?", next = "master" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master = {
      lines = { { id = "m_default", text = "Not me, if that's what you hope. I serve greater hungers than mine, and when they return to this world they'll find the Horde softened and its belly full of rot." } },
      choices = {
        { text = "Then I'll cut the rot out.", next = "BACK", reply = "Brave words for something so small. Come and try.", fx = { align = { light = 1 } } },
        { text = "Every power has its price. I'd pay it.", next = "BACK", reply = "Spoken like a true orc of the old Horde. How delightful.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    legion = {
      lines = { { id = "l_default", text = "The Legion is patient, mortal, and your victory at Mount Hyjal was one battle in a war older than your world. I am a crumb they left behind, and even a crumb can poison a feast." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    burning_blade = { { id = "tp_bb", text = "My servants, my worshippers, my little knives. They do the work while I eat.", next = "blade" } },
    _none = { { id = "tp_none", text = "I don't care about that. I care about how you'll taste." } },
  },
}

---------------------------------------------------------------------------
-- Jergosh the Invoker: a Burning Blade warlock tending the cult's rituals.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_jergosh", id = TODO_NPC("Jergosh the Invoker"), name = "Jergosh the Invoker",
  bible = "bibles/dg_jergosh.md", role = "boss", tier = "quest",
  temper = { "zealous", "scornful" }, values = { "ambitious", "faithful" },
  notices = { "race", "class" },
  impression = {
    first = "His eyes glow faintly green, and his voice never rises above a hiss.",
    third = "{name} confronted Jergosh the Invoker of the Burning Blade in Ragefire Chasm.",
  },

  greetings = {
    { id = "g_default", text = "You interrupt the invocation. That is a mistake you will only make once." },
    { id = "g_hidden", when = { questActive = TODO_QUEST("Hidden Enemies") }, text = "Thrall sent you sniffing after us, didn't he? Then sniff closer, and learn what his precious Horde is hiding under its own floor." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. You whisper to the spirits like a child begging scraps, when the fel would give you everything." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc who has forgotten what we were. The Blade remembers for you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Jergosh, Invoker of the Burning Blade. Thrall preaches that the orcs were enslaved by demonic power, but I say we were never freer than when the fel burned in our blood." },
      },
      again = { { id = "h_again", text = "Speak quickly. The circle won't hold itself." } },
      choices = {
        { text = "What are you summoning down here?", next = "ritual" },
        { text = "Why turn against your own people?", next = "betray" },
        { text = "The old Horde nearly destroyed the orcs.", next = "oldhorde" },
        { text = "I'm done listening.", next = "END" },
      },
    },
    ritual = {
      lines = { { id = "r_default", text = "Doors, mostly, small ones for now. Every soul that dies on this altar widens them a little, and one day something will walk through that Orgrimmar can't stop." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    betray = {
      lines = { { id = "b_default", text = "I betray nobody. Thrall betrayed us when he made us farmers and herders and told us to be ashamed of our strength. The Blade only wants back what was taken." } },
      choices = {
        { text = "Thrall freed the orcs from chains.", next = "BACK", reply = "He traded one set of chains for another, and called the new ones honor.", fx = { align = { order = 1 } } },
        { text = "Strength shouldn't be something to be ashamed of.", next = "BACK", reply = "At last, a voice with sense in it. A pity it belongs to someone I'm about to kill.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    oldhorde = {
      lines = { { id = "oh_default", text = "It nearly conquered a world, too. You remember the camps and the lethargy, but I remember Blackrock Spire and the dragons we rode. Weakness came after the fel was taken from us, not before." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I have no time for your questions. The ritual matters more." } },
  },
}
