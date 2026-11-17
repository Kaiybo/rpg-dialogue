-- Jeeda, Jin'Zil's apprentice at Malaka'jin, the troll camp where the Barrens road climbs into Stonetalon. Voice: bibles/jeeda.md
-- Classic roster name from memory (TODO_NPC until captured); her character is authored from her place beside Jin'Zil.
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "stn_jeeda", id = TODO_NPC("Jeeda"), name = "Jeeda", title = "Apprentice Witch Doctor",
  bible = "bibles/jeeda.md", role = "vendor", tier = "service",
  communities = { "sun_rock" }, temper = { "wry", "sharp" }, values = { "curious", "ambitious" },
  notices = { "race", "class" },
  impression = {
    first = "Jeeda is Jin'Zil's apprentice and stirs his pots at Malaka'jin, and she rolls her eyes at half of what he says while writing the other half down. She is sharp, wry and far more ambitious than she lets her master see.",
    third = "{name} met Jeeda, the young troll apprentice to Witch Doctor Jin'Zil at Malaka'jin.",
  },

  greetings = {
    { id = "g_default", text = "Mind da pots, mon, because dat green one bites if you lean too close. You want somethin' from Jeeda, or you just lost?" },
    { id = "g_back", when = { metBefore = true }, text = "You again, mon. Jin'Zil been askin' about you, which is never a good sign for anybody." },
    { id = "g_jinzil", when = { questActive = TODO_QUEST("Jin'Zil's Forest Magic") }, text = "You doin' an errand for da old man? Good, because if you don't bring it, he gonna send me, and I got stirrin' to do." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear, all da way out here! You still got da salt of da Echo Isles on you, mon, and I miss dat smell more than I tell anybody." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Ah, a shaman. You talk to da spirits polite and ask nicely, and we witch doctors just tell dem what to do, so we never gonna agree, you and me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I be Jeeda, apprentice to Witch Doctor Jin'Zil, and I keep da camp at Malaka'jin while he be busy in his cave. I got a few things for sale, if you need dem, and a lot of opinions, if you don't." },
        { id = "h_troll", when = { race = "Troll" },
          text = "Hey, cousin! I be Jeeda, Jin'Zil's apprentice, and you da first Darkspear face I seen this week that ain't his. Sit a while, if you don't mind da smoke." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, come down from da rock to see da trolls! I be Jeeda, Jin'Zil's apprentice, and don't you worry, none of da pots got kodo in dem." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Ask quick, before da green pot boils over." },
        { id = "h_again2", text = "Go on, I'm listenin'. Da pots can stir demselves for a breath." },
      },
      choices = {
        { text = "Let me see what you sell.", next = "BUSINESS" },
        { text = "What's it like apprenticing for Jin'Zil?", next = "master" },
        { text = "Why do trolls camp out here?", next = "camp" },
        { text = "What's in all those pots?", next = "pots" },
        { text = "You don't think much of shaman, then?", next = "shaman", when = { class = "SHAMAN" } },
        { text = "How did a Darkspear end up this far inland?", next = "home", when = { race = "Troll" } },
        { text = "I'll leave you to your stirring.", next = "END" },
      },
    },

    master = {
      lines = {
        { id = "ma_default", text = "Loud, mostly, and it smell like boiled spider. He brag all day dat he be better than Darsok, and he keep cages in dat cave dat I don't look in, and still he know more about da loa than anybody I ever met." },
      },
      choices = {
        { text = "What's in the cages?", next = "cages" },
        { text = "Who's Darsok?", next = "darsok" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cages = {
      big = true,
      lines = {
        { id = "cg_default", text = "Sometimes a forest spirit, sometimes a beast, and once somethin' with pointed ears dat cried all night. Jin'Zil say a witch doctor must know a thing from da inside before da loa will let him use it, and I ain't sure yet if I believe him." },
      },
      choices = {
        { text = "Some things shouldn't be caged, Jeeda. Remember that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Power is learned the hard way. Your master's right.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darsok = {
      lines = {
        { id = "da_default", text = "Another Darkspear, off fightin' da night elves in Ashenvale, and he and Jin'Zil been rivals since before I was born. Nobody remember what started it, and I think dat's da whole reason it never end." },
      },
      choices = {
        { text = "Rivals keep each other sharp.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    camp = {
      lines = {
        { id = "cp_default", text = "Because da road from da Barrens come up right past here, and somebody got to watch it for da Horde. Da tauren on Sun Rock be good folk, but dey sleep heavy, and trolls hear everything dat walk by in da night." },
      },
      choices = {
        { text = "What walks by in the night?", next = "camp2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp2 = {
      lines = {
        { id = "cp2_default", text = "Venture goblins with dere lamps, goin' up to Windshear to cut more trees, and night elf scouts from da peak watchin' da goblins. Sometimes I think I should tell da elves where da goblins sleep, and den I remember dey'd shoot me too." },
      },
      choices = {
        { text = "The enemy of your enemy is still your enemy.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    pots = {
      lines = {
        { id = "po_default", text = "Dis one be spider venom for a curse, dat one be harpy feather for a charm, and da green one be my own work, so don't ask what it is, because I ain't sure yet either. Jin'Zil say every witch doctor ruin a hundred pots before one come out right." },
        { id = "po_mage", when = { class = "MAGE" },
          text = "Not your kind of magic, mon, nothin' in a book here. Da green one be my own work, and I can't tell you what it does yet, but I'm workin' on it." },
      },
      choices = {
        { text = "You want to be a witch doctor in your own right?", next = "pots2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pots2 = {
      big = true,
      lines = {
        { id = "pt2_default", text = "Course I do, mon, and one day I'll have my own cave and my own apprentice to stir for me. Jin'Zil think I'll wait ten more years for it, but I been watchin' him, and I think I'll be ready sooner." },
      },
      choices = {
        { text = "Learn everything first. Rushing gets apprentices killed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Don't wait for his blessing. Take your chance when it comes.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    shaman = {
      lines = {
        { id = "sh_default", text = "Oh, I think plenty of shaman, mon, only you ask da elements for help and wait for an answer. A witch doctor bargain with da loa, and sometimes we bargain hard, and Jin'Zil say dat's why we sleep worse than you do." },
      },
      choices = {
        { text = "Asking keeps the spirits willing. That matters.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = {
        { id = "hm_default", text = "Da Warchief need trolls everywhere da Horde reach, and Jin'Zil need somebody to stir. My mother cried when I left Sen'jin, and I didn't, but some nights out here I wish I'd cried a little too." },
      },
      choices = {
        { text = "The Echo Isles will still be there when you go back.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born in Sen'jin Village, apprenticed to Jin'Zil, and stirrin' his pots ever since." } },
    advice = { { id = "tp_ad", text = "Never eat anything from a witch doctor's pot, mon, not even mine." } },
    _none = { { id = "tp_none", text = "Dat ain't somethin' I know, mon. Ask Jin'Zil, if you want an hour of bragging with your answer." } },
  },
}
