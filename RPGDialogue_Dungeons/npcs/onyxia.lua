-- Onyxia's Lair: the broodmother's cavern in Dustwallow Marsh. Onyxia herself has nothing to hide
-- here, and taunts the heroes who have come to take her head.
-- Voices: bibles/dg_onyxia.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Onyxia: daughter of Deathwing, in her own lair and her true shape.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_onyxia", id = TODO_NPC("Onyxia"), name = "Onyxia",
  bible = "bibles/dg_onyxia.md", role = "boss", tier = "quest",
  temper = { "mocking", "proud" }, values = { "cunning", "ambitious" },
  notices = { "faction", "race" },
  impression = {
    first = "A great black dragon, amused that anyone would come to her door.",
    third = "{name} faced Onyxia in her lair in Dustwallow Marsh.",
  },

  greetings = {
    { id = "g_default", text = "How fortuitous. Usually I must leave my lair to feed, and today my meal has walked in on its own." },
    { id = "g_amulet", when = { questDone = TODO_QUEST("Drakefire Amulet") }, text = "So you wear the amulet that opens my door. Someone has been talking, and I will see that they stop." },
  },

  notice = {
    { id = "n_ally", cat = "faction", when = { faction = "Alliance" },
      text = "I know that crest. I have sat in Stormwind's court and smiled at men wearing it, and they never once looked closely at my eyes." },
    { id = "n_horde", cat = "faction", when = { faction = "Horde" },
      text = "The Horde, in my marsh. Rexxar sends his regards in arrows, I suppose, and Thrall sends his children to die." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Onyxia, daughter of Deathwing and broodmother of this lair. My whelps sleep in the side caves, and they wake hungry, so do speak while you still can." },
        { id = "h_ally", when = { faction = "Alliance" }, text = "Stormwind's court knew me as Lady Katrana Prestor, and how they listened to me. A boy king and a room full of frightened lords are the easiest hounds in the world to lead." },
      },
      again = {
        { id = "h_again", text = "Another question? You are stalling, and I can smell it." },
        { id = "h_again2", text = "Go on, little thing. Amuse me." },
      },
      choices = {
        { text = "Your masquerade in Stormwind is over.", next = "stormwind" },
        { text = "Your brother hides atop Blackrock.", next = "brother" },
        { text = "This marsh is a lonely throne.", next = "marsh" },
        { text = "We've come for your head.", next = "head" },
      },
    },
    stormwind = {
      lines = { { id = "s_default", text = "Is it? One mask slips and I have a dozen more, and the court still has a dozen fools who would rather believe me than a common marshal. Windsor learned that, I believe, in a Dark Iron cell." } },
      choices = {
        { text = "Windsor's truth will free the king.", next = "BACK", reply = "Perhaps, and perhaps it will only get the marshal killed. Hope is such a pretty thing to watch die.", fx = { align = { order = 1 } } },
        { text = "Fools deserve to be ruled by dragons.", next = "BACK", reply = "Now that is a sentiment I can respect. Pity it will not save you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother = {
      lines = { { id = "b_default", text = "Nefarian and his flasks and his chromatic pets. He builds armies while I take kingdoms with a smile, and we shall see whose way serves our father better." } },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "nefarian" } } },
      },
    },
    marsh = {
      lines = { { id = "m_default", text = "Lonely? I have the swamp, the black dragonkin of Wyrmbog and every drake that guards my door. Lonely is a word for mortals who need to be loved." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    head = {
      lines = { { id = "h2_default", text = "So many have said that, and their bones line the floor you are standing on. Come, then, and I will add yours to the collection." } },
      choices = {
        { text = "Then let's begin.", next = "END" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I care nothing for that, and soon you will care for nothing at all." } },
  },
}
