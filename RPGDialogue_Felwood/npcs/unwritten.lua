-- Felwood folk with no conversation until now: Altsoba Ragetotem, weaponsmith of Bloodvenom Post.
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Altsoba Ragetotem
---------------------------------------------------------------------------
P:NPC {
  key = "fw_altsoba", id = TODO_NPC("Altsoba Ragetotem"), name = "Altsoba Ragetotem",
  role = "vendor", tier = "service", race = "Tauren",
  communities = { "bloodvenom_post" }, temper = { "grim", "steady" }, values = { "craft", "strength" },
  impression = {
    first = "A tauren weaponsmith who keeps his blades oiled against Felwood's rot.",
    third = "{name} met Altsoba Ragetotem, the tauren who sells weapons at Bloodvenom Post in Felwood.",
  },
  greetings = {
    { id = "g_default", text = "Hm. You'll want a weapon, coming through Felwood. Everyone does, sooner or later." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "One of the shu'halo, here in this sick place. The Earth Mother guard you, for this land will not." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Altsoba of the Ragetotem. I sell weapons to those who pass through Bloodvenom Post, and I keep them sharp, because in Felwood a dull blade is a death sentence." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Speak. I am listening, though my hands are busy." },
      },
      choices = {
        { text = "What makes Felwood so dangerous?", next = "danger" },
        { text = "The Ragetotem? I don't know that tribe.", next = "tribe" },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Farewell, Altsoba.", next = "END" },
      },
    },
    danger = {
      lines = { { id = "da_default", text = "Demons poisoned this forest long ago, and the poison never left. The furbolgs went mad from it, the satyrs thrive in it, and the river runs green with it." } },
      choices = {
        { text = "Can it ever be healed?", next = "danger2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger2 = {
      lines = { { id = "d2_default", text = "The druids of the Emerald Circle say so. Winna Hazzard says she'd rather study it. I say keep your weapon close until someone decides." } },
      choices = {
        { text = "Then the forest must be cleansed, whatever it takes.", next = "BACK", reply = "Bold words. Felwood has eaten bolder.", fx = { align = { light = 1 } } },
        { text = "Some poisons are worth understanding, not destroying.", next = "BACK", reply = "Say that to Winna. She'll love you for it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe = {
      lines = { { id = "tr_default", text = "We are warriors, mostly, and few in number. My tribe taught me that a weapon is a promise you make to yourself, so I make my promises well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

-- Elder Nightwind: a night elf ancestor-spirit by the Bloodvenom River during the Lunar Festival.
P:NPC {
  key = "fw_elder_nightwind", id = 15603, name = "Elder Nightwind", gender = "male",
  role = "elder", tier = "quest",
  temper = { "grave", "steadfast" }, values = { "memory", "the forest" },
  notices = { "race" },
  impression = {
    first = "A night elf spirit stands just south of the poisoned river, sorrow in every line of him.",
    third = "{name} honoured Elder Nightwind in Felwood at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Be welcome, traveller, though this is no glad place to meet. The forest weeps around us." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "Another Lunar Festival, and another year turned. The ancestors smile on those who seek out their elders." },
    { id = "g_back", when = { metBefore = true }, text = "You come back to this blighted wood. That takes courage, or foolishness." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Nightwind the Elder") }, text = "You seek the elders' blessing, even here. Then you shall have mine." },
  },
  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" }, text = "A kaldorei, come to the woods our people lost. Do not despair; the land remembers us." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" }, text = "A druid. Then you feel how sick this forest is far better than I can tell it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Nightwind, and in life I walked these woods when they were green and whole. Now the festival brings me back to see them poisoned, and still I come." } },
      again = {
        { id = "h_again", text = "What more, traveller? The river does not sleep, and neither do I." },
        { id = "h_again2", text = "Speak. The demons have long ears in these woods." },
      },
      choices = {
        { text = "What happened to this forest?", next = "forest" },
        { text = "Why return to a place so ruined?", next = "why" },
        { text = "Is there any hope for Felwood?", next = "hope" },
        { text = "I am a druid. Can the wood be healed?", next = "druid", when = { class = "DRUID" } },
        { text = "Farewell, Elder.", next = "END" },
      },
    },
    forest = {
      lines = { { id = "f_default", text = "The demons came in the war against the Legion and left their corruption in the soil. The satyrs and the Shadow Council keep it festering still, in Jaedenar and beyond." } },
      choices = {
        { text = "Who are the Shadow Council?", next = "council" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council = {
      lines = { { id = "c_default", text = "Warlocks who serve the Burning Legion, the same who once raised the Horde for war. They hide in the ruins of Jaedenar and call more demons to them." } },
      choices = {
        { text = "They must be destroyed, every one.", next = "BACK", reply = "Then go with strength, and with friends.", fx = { align = { valor = 1 } } },
        { text = "Better to avoid them entirely.", next = "BACK", reply = "Perhaps. But they will not avoid you.", fx = { align = { valor = -1 } } },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because those who loved a place should not abandon it in its grief. If I remember Felwood as it was, then something of it survives." } },
      choices = { { text = "A fine reason. Something else.", next = "BACK" } },
    },
    hope = {
      lines = { { id = "h2_default", text = "There is always hope. The Cenarion Circle works at the Emerald Sanctuary to cleanse the land, and the Timbermaw in the north hold on." } },
      choices = { { text = "I'll help where I can. Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "Slowly, with patience and much hard work. The Circle's druids are trying; go and lend them your strength." } },
      choices = { { text = "I will. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A kaldorei elder who loved Felwood when it was green." } },
    _none = { { id = "tp_none", text = "I cannot say, traveller. Ask the druids of the sanctuary." } },
  },
}
