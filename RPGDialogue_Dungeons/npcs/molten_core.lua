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
        { text = "Your lieutenants all lie dead in the halls behind us.", next = "lieutenants" },
        { text = "The Hydraxian Waterlords sent us here.", next = "hydraxian" },
        { text = "My people know the elements. Fire should not rule them all.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Thaurissan's folly cursed my kin as much as yours.", next = "dwarf", when = { race = "Dwarf" } },
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
        { text = "What happens if he grows strong enough?", next = "trapped_free", fx = { learn = { "ragnaros" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "ragnaros" } } },
      },
    },
    trapped_free = {
      lines = { { id = "tf_default", text = "Then the mountain will not hold him, and the fire beneath it will spill across your kingdoms like a river over a broken dam. Ironforge will be first, I think, and then whatever lies beyond." } },
      choices = {
        { text = "Then he dies here, before that day.", next = "BACK", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lieutenants = {
      lines = { { id = "li_default", text = "Lucifron, Magmadar, Gehennas, Garr and the rest, yes, I felt each one go out like a guttered candle. They were servants, and servants can be replaced, though not quickly, and the Firelord will not be pleased with me." } },
      choices = {
        { text = "You sound afraid of your own master.", next = "lieutenants_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lieutenants_fear = {
      narr = "The flames along his shoulders flicker low for a moment before they flare again.",
      lines = { { id = "lf_default", text = "Every servant of Ragnaros fears him, mortal, and the ones who do not are already ash. He does not punish failure so much as consume it." } },
      choices = {
        { text = "Then turn on him, and be free.", next = "BACK", reply = "Free? There is no freedom for a creature of fire apart from its flame. You understand nothing.", fx = { align = { order = -1 } } },
        { text = "A servant keeps his oath, whatever it costs.", next = "BACK", reply = "At last, words a majordomo can respect. It changes nothing between us, of course.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hydraxian = {
      lines = { { id = "hy_default", text = "Duke Hydraxis and his drowned courtiers, playing at war from their little island. Water and fire have warred since the world was young, and the Waterlords would gladly see this hall drowned and cold." } },
      choices = {
        { text = "Their runes doused your master's fires.", next = "hydraxian_runes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hydraxian_runes = {
      lines = { { id = "hr_default", text = "Yes, and I felt every one of them go cold like a wound in my own side. Without them I could not call the Firelord at all, so perhaps your watery masters have done my work for me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "A shaman, who begs favours of the elements and calls it balance. The Firelord does not bargain, little spirit-talker, and the fire you pray to answers to him in the end." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Your kin and his were the same clan once, all of you grubbing in the same stone. Thaurissan's folly gave my master a door into this world, and for that the Firelord has never thanked the Dark Irons." } },
      choices = { { text = "Something else.", next = "BACK" } },
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
