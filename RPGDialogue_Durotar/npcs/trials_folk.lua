-- Valley of Trials, one more voice: Canaga Earthcaller, the Darkspear who tests young shaman with the
-- Call of Earth and sends every newcomer to Hana'zua. Voice: bibles/trials_folk.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "canaga", id = TODO_NPC("Canaga Earthcaller"), name = "Canaga Earthcaller",
  bible = "bibles/trials_folk.md", role = "questgiver", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "calm", "wry" }, values = { "devout", "wise" },
  notices = { "class", "race" },

  impression = {
    first = "He speaks of the earth as old soldiers speak of a comrade.",
    third = "{name} met Canaga Earthcaller, the Darkspear shaman in the Valley of Trials who sets young shaman on the path of earth.",
  },

  greetings = {
    { id = "g_default", text = "Stand still a moment, young one. The earth be tellin' me how heavy you walk." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you come back. The ground remember your feet, even if I forget your name." },
    { id = "g_call", when = { questActive = TODO_QUEST("Call of Earth") }, text = "The felstalkers be north, near the Burning Blade's cave. Two hooves, young shaman, and then we speak of your future." },
    { id = "g_away", when = { away = 14 }, text = "You be away {away}, and the valley be quieter for it. The earth notice, mon, even if the scorpids do not." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You carry a totem like you be afraid to drop it. Do not worry, mon, the earth catch what you drop, but it do not give it back for free." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, so far from the plains. Your people listen to the earth the longest of any of us, so I listen to you careful." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I be Canaga Earthcaller, and I listen to the ground of this valley for the young ones who need it. Earth be the foundation of all things, mon: your strength, your stamina and your patience." },
        { id = "h_hanazua", when = { questBefore = TODO_QUEST("Hana'zua") },
          text = "Before anything else, go and see Hana'zua, the wounded one by the scorpid nest. He tell you a story the young ones need to hear, and he need somebody to hear it." },
        { id = "h_call_done", when = { questDone = TODO_QUEST("Call of Earth") },
          text = "You took the sapta and the earth answered you, mon. Never forget the secrets it share with you, because earth be fickle like the rest, though slower to show it." },
        { id = "h_shaman", when = { class = "SHAMAN" },
          text = "A young shaman, standin' on my rock. You grow strong and your spirit endure like the earth, so maybe it be time you stand before the earth itself." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A warrior, with feet planted like a stubborn tree. The earth like that, mon, even if your sergeant tell you to move." },
      },
      again = {
        { id = "h_again", text = "What else, mon? The ground be in no hurry, and neither be I." },
        { id = "h_again2", text = "Speak, speak. The rocks be listenin' too." },
      },
      choices = {
        { text = "Who is Hana'zua?", next = "hanazua" },
        { text = "What does it mean, to call earth?", next = "earth" },
        { text = "Why felstalker hooves?", next = "felstalkers", when = { class = "SHAMAN" } },
        { text = "What's a sapta?", next = "sapta", when = { class = "SHAMAN" } },
        { text = "How do the trolls fare among orcs here?", next = "trolls" },
        { text = "Farewell, Canaga.", next = "END" },
      },
    },

    hanazua = {
      lines = { { id = "hz_default", text = "A young Darkspear hunter who rush the big scorpid Sarkoth and lose, mon, though he will not tell it that way. He lie wounded on his mat near the scorpid nests, and his story be a warnin' about pride that every young one need to hear." } },
      choices = {
        { text = "Is anything in the valley worse than scorpids?", next = "hz_blade", fx = { learn = { "burning_blade" } } },
        { text = "I'll go and see him.", next = "BACK" },
      },
    },
    hz_blade = {
      lines = { { id = "hzb_default", text = "The Burning Blade, mon, a cult of orcs who miss the old demon power, hidin' in the cave north of here where the felstalkers roam. The demons be gone from the world, they say, but the hunger for them stick around like smoke in a hut." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    earth = {
      big = true,
      lines = { { id = "ea_default", text = "Earth protect you, but only if shown the proper respect, mon. A shaman who call it to crush his enemies and never thank it soon find the ground very soft under his feet." } },
      choices = {
        { text = "Respect first. The elements are not tools.", next = "ea_more", fx = { align = { light = 1 } } },
        { text = "The elements serve the strong. That's how it works.", next = "ea_more", fx = { align = { light = -1 } } },
        { text = "How do you thank the earth?", next = "ea_more" },
      },
    },
    ea_more = {
      lines = { { id = "eam_default", text = "You stop, mon, and you notice it, and most folk walk right past. Thrall come back to the old ways because the warlocks forget that, and the whole orc race pay for their forgetting." } },
      choices = {
        { text = "The Warchief is a shaman too.", next = "ea_thrall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ea_thrall = {
      lines = { { id = "eat_default", text = "He be, and a good one, mon. Like Thrall be to the Horde, a shaman be to the village: the one people look to for wisdom and protection, so you better have some of both." } },
      choices = {
        { text = "I'll try to have both.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    felstalkers = {
      lines = { { id = "fe_default", text = "Because the felstalkers be demon-touched beasts that walk on our earth without its blessing, mon. Takin' their hooves be your way of tellin' the ground you will stand against what poison it." } },
      choices = {
        { text = "Two hooves, then. I'll bring them back.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sapta = {
      lines = { { id = "sa_default", text = "A little bundle of herbs and earth, mon, made by me and given in good faith. When you take it, you see things only shaman see, and you never quite look at the ground the same way again." } },
      choices = {
        { text = "What if I lose it?", next = "sa_lose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sa_lose = {
      lines = { { id = "sal_default", text = "Then come back and Canaga make you another, mon, and give it in good faith again. But me tinkin' you should be more careful in the future, because the earth be patient with fools only once or twice." } },
      choices = { { text = "I'll be careful.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    trolls = {
      lines = { { id = "tr_default", text = "Well enough, mon. The orcs save us from the sea witch and the human sailors when we be dyin' on the isles, and Vol'jin swear the Darkspear to Thrall for it. Some orcs still laugh at our tusks, but they laugh less after they see us fight." } },
      choices = {
        { text = "The Horde is stronger with the Darkspear in it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the earth of this valley, mon, and the young ones who walk on it." } },
    background = { { id = "tp_bg", text = "I be Darkspear, from the isles, and a shaman since before the boats come. The earth do not care where I be born." } },
    advice = { { id = "tp_ad", text = "Stand with your feet apart, mon. The earth like a body it can hold onto." } },
    burning_blade = { { id = "tp_bb", text = "The Burning Blade be orcs who miss the demons, mon, and the earth do not like how they walk." } },
    _none = { { id = "tp_none", text = "The ground say nothin' about that, mon, so I say nothin' too." } },
  },
}
