-- Molten Core: the Firelord's prison beneath Blackrock. Majordomo Executus, beaten and bound,
-- summons his master, and Ragnaros himself rises to speak before the battle.
-- Voices: bibles/dg_executus.md, bibles/dg_ragnaros.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Majordomo Executus: the Firelord's steward, defeated and forced to summon him.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_executus", id = TODO_NPC("Majordomo Executus"), name = "Majordomo Executus",
  bible = "bibles/dg_executus.md", role = "boss", tier = "quest",
  temper = { "haughty", "bitter" }, values = { "loyal", "proud" },
  notices = { "class", "race" },
  impression = {
    first = "A defeated servant of fire, bowing because he must and hating every moment of it.",
    third = "{name} defeated Majordomo Executus and heard him summon Ragnaros.",
  },

  greetings = {
    { id = "g_default", text = "Impudent whelps. You have bested me, so I am bound to serve your wishes, though it burns worse than any flame." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, in my master's hall. Your Dark Iron cousins knelt here three centuries ago, and you will learn why." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman, who thinks fire is a spirit to be asked politely. My master will teach you otherwise." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Executus, majordomo of the Firelord's hall, and I have tended his house since the Dark Iron fool called him into this mountain. Speak your wish, mortals, and I will answer as the binding demands." },
      },
      again = {
        { id = "h_again", text = "Speak, and be done. My master stirs." },
        { id = "h_again2", text = "What more do you want of me?" },
      },
      choices = {
        { text = "Who is your master?", next = "master" },
        { text = "Why serve Ragnaros at all?", next = "serve" },
        { text = "Summon your master, Executus.", next = "summon" },
        { text = "We'll be back when we're ready.", next = "END" },
      },
    },
    master = {
      lines = { { id = "m_default", text = "Ragnaros, Lord of Fire, who was old when your kind still huddled in caves. The titans chained him and his brothers away, and Thaurissan's summoning tore him free into this mountain's heart." } },
      choices = {
        { text = "He's trapped here, then.", next = "trapped" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trapped = {
      lines = { { id = "t_default", text = "Not trapped, mortal, only waiting. He grows stronger every year beneath Blackrock, and he is at war with the black dragonflight above for the mountain itself." } },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "ragnaros" } } },
      },
    },
    serve = {
      lines = { { id = "s_default", text = "Because fire is the end of all things, and it is better to serve the end than to be consumed by it. You may call that cowardice, but you have not stood before him." } },
      choices = {
        { text = "Serving the strongest is only sense.", next = "BACK", reply = "At last, a mortal with some wisdom. You will not live long enough to profit from it, but it is wisdom all the same.", fx = { align = { light = -1 } } },
        { text = "A slave's excuse. We will end him.", next = "BACK", reply = "Brave words. Say them again when the Firelord's hammer is falling, and I will listen for your screams.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    summon = {
      lines = { { id = "su_default", text = "As you wish, though you will regret it before your hearts beat ten times. Rise, my master, rise from the flames, and see the insects who have come to die in your hall!" } },
      choices = {
        { text = "Let him come.", next = "END" },
        { text = "Wait, not yet.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Such matters mean nothing in the Firelord's hall. Ask something worthy of fire." } },
  },
}

---------------------------------------------------------------------------
-- Ragnaros: the Firelord, roused before his time.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_ragnaros", id = TODO_NPC("Ragnaros"), name = "Ragnaros",
  bible = "bibles/dg_ragnaros.md", role = "boss", tier = "quest",
  temper = { "wrathful", "arrogant" }, values = { "dominant" },
  notices = { "class" },
  impression = {
    first = "A god of fire, furious to be woken too soon.",
    third = "{name} stood before Ragnaros the Firelord in the depths of the Molten Core.",
  },

  greetings = {
    { id = "g_default", text = "Too soon! You have awakened me too soon, Executus, and you have let these insects into my sanctum!" },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman dares to stand before me. Your little totems bow to me, mortal, whether you will it or not." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ragnaros, the Firelord, and this mountain is my throne. You come here for treasure and glory, and you will find only ash." },
      },
      again = {
        { id = "h_again", text = "Speak, insect, while you still have a tongue to speak with!" },
      },
      choices = {
        { text = "The titans chained you once.", next = "titans" },
        { text = "Your war with the black dragons ends here.", next = "dragons" },
        { text = "We've come to send you back.", next = "back" },
        { text = "Then let it begin.", next = "END" },
      },
    },
    titans = {
      lines = { { id = "t_default", text = "And their chains are broken, as all chains break in the end. Thaurissan learned that lesson, and so will you." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dragons = {
      lines = { { id = "d_default", text = "Nefarian squats on my mountain and thinks himself its lord. When I have finished with you, I will burn his roost and his brood and his sister's too." } },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "nefarian" } } },
      },
    },
    back = {
      lines = { { id = "b_default", text = "Back? I am already home, mortal, and you are the trespassers. Come, then, and let me teach you what it means to stand against the flame." } },
      choices = {
        { text = "For Azeroth, and for the living!", next = "END", reply = "Noble, and useless. By fire be purged!", fx = { align = { light = 1 } } },
        { text = "For your treasure, Firelord.", next = "END", reply = "Greed, at least, I understand. Die for it, then!", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Silence! The Firelord does not answer to insects!" } },
  },
}
