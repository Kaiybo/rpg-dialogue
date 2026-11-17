-- Bath'rah the Windwatcher: troll hermit shaman and weaponsmith at Chillwind Point, waiting for Cyclonian to fall.
-- Voice: bibles/bathrah.md
local P = RPGDialogueAPI:Pack("rpgd.dalaran")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dal_bathrah", id = TODO_NPC("Bath'rah the Windwatcher"), name = "Bath'rah the Windwatcher",
  bible = "bibles/bathrah.md", role = "questgiver", tier = "quest",
  communities = { "chillwind_point" }, temper = { "calm", "patient" }, values = { "wise", "patient", "craft" },
  notices = { "class" },

  impression = {
    first = "Bath'rah the Windwatcher is a troll hermit who has spent ages watching a ruined spot by the river for a wind lord nobody else can see. He forges weapons for champions and wants to know if I'm one.",
    third = "{name} met Bath'rah the Windwatcher, the troll shaman and weaponsmith who keeps watch at Chillwind Point.",
  },

  greetings = {
    { id = "g_default", text = "You have traveled far, young one. Sit, and let de wind look at you." },
    { id = "g_back", when = { metBefore = true }, text = "You come back to old Bath'rah. De wind told me you would." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and still I watch, mon. Cyclonian be patient, and so be I." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "De fire in your eyes be brighter now. Maybe you be dat champion after all." },
    { id = "g_cyclonian", when = { questActive = TODO_QUEST("Cyclonian") }, text = "Liferoot, Bloodscalp tusks and de essence of de exile, all on de parchment. Bring dem, and we summon." },
    { id = "g_summon", when = { questActive = TODO_QUEST("The Summoning") }, text = "I must have de whirlwind heart, so face de wind lord when you be ready." },
    { id = "g_totem", when = { questActive = TODO_QUEST("Spirit Totem") }, text = "Bear claws and spider eyes from de Plaguelands. Hurry, mon, for de spirits be tryin' to kill me." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, with fire in de eyes. You seek a weapon of great power, yes? I can see it before you say it." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! De elements be talkin' about you as you climb de path, and dey be talkin' kinder dan dey talk about me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I be Bath'rah, and dey call me de Windwatcher because I watch dis place for de wind lord. I make weapons for great warriors, and I wait for one great enough to face him." },
        { id = "h_windwatcher", tags = { "news" }, when = { questActive = TODO_QUEST("The Windwatcher") },
          text = "You have traveled far, and I see fire in your eyes. You seek a weapon of great power, yes? I can help you with your quest, and you can help me with mine." },
        { id = "h_heart", tags = { "news" }, when = { questReady = TODO_QUEST("The Summoning") },
          text = "You did it! You defeated Cyclonian and took his whirlwind heart, and I have waited ages to see it." },
        { id = "h_weapon", when = { questDone = TODO_QUEST("Whirlwind Weapon") },
          text = "How be de weapon? Every swing carries a piece of Cyclonian's storm, so swing it well, for he did not give it freely." },
        { id = "h_voodoo", tags = { "news" }, when = { questDone = TODO_QUEST("Da Voodoo") },
          text = "It be about time dis troll got a full night's rest! De spirit totem watches over me now, and de angry ones keep der distance." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A Darkspear! It be a long way from de islands to dese cold mountains, and I be glad of de company." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Alliance, Horde, it be all de same to de wind, mon. What I care about be whether you got de strength." },
      },
      again = {
        { id = "h_again", text = "What else, young one? De wind be in no hurry." },
        { id = "h_again2", text = "Ask, ask. Old Bath'rah got time." },
      },
      choices = {
        { text = "You keep speaking of Cyclonian.", next = "cyclonian" },
        { text = "Why do you watch this place?", next = "watch" },
        { text = "Why are the spirits angry with you?", next = "spirits" },
        { text = "How do you forge a weapon from a storm?", next = "forge" },
        { text = "Teach me about the wind, Windwatcher.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Farewell, Bath'rah.", next = "END" },
      },
    },

    cyclonian = {
      lines = {
        { id = "cy_default", text = "A lord of de wind, bound in dis place long ago, and he be sleepin' under de stones by de river. Summon him with de right offerings, and he comes angry, and if you defeat him, his whirlwind heart be yours." },
      },
      choices = {
        { text = "Why would you want to summon him?", next = "cyclonian_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cyclonian_why = {
      big = true,
      lines = {
        { id = "cw_default", text = "Because one day I might see de great Cyclonian fall, and his heart make a weapon worthy of a champion. Some say it be wrong to wake a sleepin' power for a blade, but a power dat sleeps does nobody any good." },
      },
      choices = {
        { text = "Leave sleeping powers alone, Bath'rah.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A power that serves a champion is a power well used.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    watch = {
      lines = {
        { id = "wa_default", text = "I have spent ages watchin' dis site, so I know when de wind lord stirs and when he sleeps. Nobody else be watchin', and somebody must." },
      },
      choices = {
        { text = "Don't you get lonely out here?", next = "watch_lonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_lonely = {
      lines = {
        { id = "wl_default", text = "De river talks, and de wind talks, and sometimes a warrior climbs up de path wantin' a weapon. Dat be enough company for a hermit, most days." },
        { id = "wl_warm", when = { disposition = { min = 65 } },
          text = "Some nights, yes. I left my people for de wind long ago, and de wind be a fine teacher but a poor friend." },
      },
      choices = { { text = "Something else, Bath'rah.", next = "BACK" } },
    },

    spirits = {
      lines = {
        { id = "sp_default", text = "De elemental spirits of dis place don't be likin' me any more, not since we started workin' with de wind lord's power. Dey know what we be up to, and dey been tryin' to kill me in my sleep." },
      },
      choices = {
        { text = "Then maybe you've gone too far.", next = "spirits_far" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits_far = {
      big = true,
      lines = {
        { id = "sf_default", text = "Maybe, young one, and maybe not. A shaman be askin' de elements for help, not orderin' dem around, and I wonder sometimes if I forgot de difference." },
      },
      choices = {
        { text = "Then make peace with them. Ask their forgiveness.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Spirits that turn on you deserve to be bound.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    forge = {
      lines = {
        { id = "fo_default", text = "Slowly, with fire and with prayer, and with de heart of de wind lord holdin' still long enough to be poured into de steel. It be a secret of my people, and I keep it close." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    shaman = {
      lines = {
        { id = "sh_default", text = "De wind be de quickest element and de hardest to hold, for it be everywhere and nowhere. Listen to it before a storm, young one, and you hear what it be plannin'." },
      },
      choices = {
        { text = "I'll listen, Windwatcher.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know de wind, de river and de weapons dat warriors carry. Ask, and old Bath'rah tell you." } },
    background = { { id = "tp_bg", text = "A hermit, a shaman and a maker of weapons. I watch, mostly." } },
    advice = { { id = "tp_ad", text = "Never fight de wind, young one. Bend with it, and strike when it turns." } },
    alterac = { { id = "tp_alterac", text = "Cold mountains, full of ogres, wizards and men with grudges. I keep to my river." } },
    the_elements = { { id = "tp_the_elements", text = "De spirits of de wind and de stone be angry wit' me, young one, ever since I started watchin' dis place. Dey don't like what I be waitin' for, and I don't blame dem." } },
    scourge = { { id = "tp_scourge", text = "De dead walk in de plaguelands just east of here, mon, and dey come up de river sometimes. I send dem back down it, and I don't sleep much." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "De Atal'ai worship de blood god in their swamp temple, and dey be fools, every one. De feathers from their trolls be good for my voodoo, though, so I don't complain too loud." } },
    darkspear = { { id = "tp_darkspear", text = "De Darkspear be clever trolls, mon, siding wit' de orcs and keepin' their heads. I be no Darkspear, but I tip my hat to dem." } },
    _none = { { id = "tp_none", text = "De wind never told me dat one, mon. Ask somebody with more neighbours." } },
  },
}
