-- Blackfathom Deeps: Argent Guard Thaelrid, the Argent Dawn's watcher in the flooded temple,
-- and Twilight Lord Kelris, who keeps the Twilight's Hammer's vigil over Aku'mai.
-- Voices: bibles/dg_thaelrid.md, bibles/dg_kelris.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Argent Guard Thaelrid: a night elf of the Argent Dawn, alone in the dark water.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_thaelrid", id = TODO_NPC("Argent Guard Thaelrid"), name = "Argent Guard Thaelrid",
  bible = "bibles/dg_thaelrid.md", role = "questgiver", tier = "quest",
  temper = { "grave", "earnest" }, values = { "dutiful", "faithful" },
  notices = { "class", "race" },
  impression = {
    first = "A sentinel's patience, worn thin by too many nights underwater.",
    third = "{name} met Argent Guard Thaelrid keeping watch in Blackfathom Deeps.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveler. Step softly here, because the water carries every sound down to the ones who worship below." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Blackfathom Villainy") }, text = "Kelris still draws breath, then. Go deeper, and bring me proof that the Twilight Lord's prayers have ended." },
    { id = "g_done", when = { questDone = TODO_QUEST("Blackfathom Villainy") }, text = "Since Kelris fell, the chanting from below has thinned. It hasn't stopped, but I can sleep an hour at a time now." },
  },

  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "One of the Kaldorei, here in the halls our people raised to Elune. It grieves me that you must see them like this." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Then you can feel it too, the cold that sits under the old prayers to Elune." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I serve the Argent Dawn, and they sent me here to watch the Twilight's Hammer and learn what they want in these ruins. What I've learned is that they want something old and very hungry woken up." },
        { id = "h_elf", when = { race = "NightElf" }, text = "These were temples once, sister of the moon, built when Ashenvale's shore still stood above the sea. The Sundering drowned them, and now worse things than water fill them." },
      },
      again = { { id = "h_again", text = "What else would you know?" }, { id = "h_again2", text = "Ask, but keep watch on the water while you do." } },
      choices = {
        { text = "Who are the Twilight's Hammer?", next = "hammer" },
        { text = "What is down there that they worship?", next = "akumai" },
        { text = "What was this place before?", next = "temple" },
        { text = "The Argent Dawn reaches a long way.", next = "dawn" },
        { text = "What do you need from me?", next = "BUSINESS" },
        { text = "I'll go on.", next = "END" },
      },
    },
    hammer = {
      lines = { { id = "hm_default", text = "A cult of men and orcs and worse, who believe the world must end so something older can wake. Their leader here is Twilight Lord Kelris, and he leads their prayers to the creature in the deepest pool." } },
      choices = {
        { text = "Why would anyone want the world to end?", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "I've asked that of the ones I've caught, and they smile as though I were a child. They say the old powers whisper to them in their sleep, and that the whispers promise them a place when everything else is gone." } },
      choices = {
        { text = "Then there's no reasoning with them.", next = "BACK", reply = "No, there isn't. Kill them cleanly, and burn whatever they write down.", fx = { align = { light = -1 }, learn = { "twilights_hammer" } } },
        { text = "Some of them might still be saved.", next = "BACK", reply = "Perhaps, and the Dawn would want me to say so. But not the ones down here, not anymore.", fx = { align = { light = 1 }, learn = { "twilights_hammer" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "twilights_hammer" } } },
      },
    },
    akumai = {
      lines = { { id = "a_default", text = "They call it Aku'mai, and they feed it, and it grows. I have only seen its shadow move under the water, but the shadow was larger than any boat in Auberdine." } },
      choices = {
        { text = "Something that big can't just be killed.", next = "kill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kill = {
      lines = { { id = "k_default", text = "Everything can be killed if enough brave people go together, and that's why I'm glad to see you. The lighting of the old braziers in the last chamber calls it up, or so the cultists' notes say." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    temple = {
      lines = { { id = "t_default", text = "A temple to Elune on the shore of Ashenvale, long before the Sundering broke the land. You can still see the moon carved in the arches, if you hold a torch close and don't mind what's crawling on them." } },
      choices = {
        { text = "It's a shame to see it fouled.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dawn = {
      lines = { { id = "dw_default", text = "It does, though most of its strength is with the Plaguelands far to the north. The Dawn believes any darkness left to grow will one day join the rest, so we watch even the quiet corners." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    twilights_hammer = { { id = "tp_th", text = "The Twilight's Hammer, cultists who pray for the end of the world.", next = "hammer" } },
    _none = { { id = "tp_none", text = "I'm sorry, but my mind is on the water. Ask me again somewhere drier." } },
  },
}
