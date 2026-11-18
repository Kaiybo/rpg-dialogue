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
        { text = "Some things shouldn't be caged, Jeeda. Remember that.", next = "BACK", reply = "I remember it every night, mon, when dat elf was crying. Maybe you be right, and maybe I'll tell Jin'Zil so, one day when I'm braver.", fx = { align = { light = 1 } } },
        { text = "Power is learned the hard way. Your master's right.", next = "BACK", reply = "Dat be what he say too, mon, and he been doin' this longer than me. I'll keep learnin', and try not to listen to the cages at night.", fx = { align = { light = -1 } } },
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
        { text = "Learn everything first. Rushing gets apprentices killed.", next = "BACK", reply = "Ya, mon, I know, and I seen apprentices who rushed. Their pots be still sittin' in the cave, and they ain't.", fx = { align = { order = 1 } } },
        { text = "Don't wait for his blessing. Take your chance when it comes.", next = "BACK", reply = "Ha! Dat be my kind of talk, mon, but don't you tell Jin'Zil I agreed. When my chance come, I'll be ready for it.", fx = { align = { order = -1 } } },
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
-- Malaka'jin, the Darkspear camp at the foot of the Stonetalon Mountains: Xen'Zilla (Blood Feeders) and
-- Ken'zigla (the healing draught for Grunt Dogran). Voice: bibles/malakajin.md
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Xen'Zilla
---------------------------------------------------------------------------
P:NPC {
  key = "xenzilla", id = TODO_NPC("Xen'Zilla"), name = "Xen'Zilla",
  bible = "bibles/malakajin.md", role = "questgiver", tier = "quest",
  communities = { "malakajin", "sun_rock" }, temper = { "easy", "sly" }, values = { "hunt", "kin" },
  notices = { "race", "class" },

  impression = {
    first = "Xen'Zilla is a lean Darkspear hunter who keeps his spear within reach even while he skins. He laughs easily, but his eyes go to the northern trees every time something rustles.",
    third = "{name} met Xen'Zilla, a Darkspear hunter at Malaka'jin who wants the Stonetalon spiders kept away from the camp's meat.",
  },

  greetings = {
    { id = "g_hello", text = "Ey, come in close to the fire, mon, because the dark be where the spiders are." },
    { id = "g_active", when = { questActive = TODO_QUEST("Blood Feeders") }, text = "The Deepmoss still be crawlin' up the path, so you still got work, mon." },
    { id = "g_done", when = { questDone = TODO_QUEST("Blood Feeders") }, text = "The meat racks be full in the morning now, and that be your doing, {name}." },
    { id = "g_back", when = { metBefore = true }, text = "You come back to Malaka'jin! The trolls remember a friend, and they remember who brought the spider legs." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear blood, I can see it in the tusks. Sen'jin's spirit be proud you came this far from the Echo Isles." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter with a beast at the heel! {pet} would make short work of a creeper, so long as it don't mind the taste." },
  },

  start = "hello",
  nodes = {
    dd_forestmagic = {
      lines = {
        { id = "dd_fm_default", text = "Witch doctor things, mon, and I don't ask too many questions, because the answers sometimes follow you home. He say the forest of Stonetalon be full of spirits who remember the night elves, and he want to know what they remember. Do you trust that kind of magic?" },
      },
      choices = {
        { text = "Any magic that helps the Horde is good magic.", next = "BACK", reply = "Spoken like Jin'Zil himself, mon. I just hunt, so I leave the magic to the ones who don't mind the smell.", fx = { align = { light = -1 } } },
        { text = "Some spirits are better left sleeping, I think.", next = "BACK", reply = "Dat be what my mother used to say, and she be a wise woman. I'll tell Jin'Zil, but he won't listen.", fx = { align = { light = 1 } } },
        { text = "Something else, Xen'Zilla.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_forestmagic", when = { questDone = TODO_QUEST("Jin'Zil's Forest Magic") },
          text = "Jin'Zil been brewin' all week with what you brought him from the forest, and the whole cave smell like burnt herbs and wet fur. I don't know what he be makin', mon, but he be smilin' about it, and dat worries me." },
        { id = "h_default", key = true,
          text = "Xen'Zilla, mon, hunter of Malaka'jin. The Stonetalon been good to us trolls, with plenty of game on the slopes, but lately we be feedin' guests we never invited." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Blood Feeders") },
          text = "The spiders come down from the Webwinder at night, mon, and they steal from the drying racks like they paid for the meat. Kill me some of them Deepmoss and the whole camp be in your debt." },
        { id = "h_active", when = { questActive = TODO_QUEST("Blood Feeders") },
          text = "Creepers and venomspitters, mon, north up the path where the webs get thick. Mind the spitters, because that venom burns going in and worse coming out." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Blood Feeders"), days = 3 } },
          text = "Last night not one leg came over the fence, mon, and the old women slept for the first time in a week. You got the thanks of Malaka'jin." },
        { id = "h_troll", when = { race = "Troll" },
          text = "Ey, a Darkspear! Sit, sit, cousin, and tell me how things be in Sen'jin Village, because up here everything be rock and spider." },
      },
      again = {
        { id = "h_again", text = "What else you want to know, mon? The fire be warm and I ain't goin' anywhere." },
        { id = "h_again2", text = "Ask away, mon, while the spiders be sleepin'." },
      },
      choices = {
        { text = "What does Jin'Zil do with all those ingredients?", next = "dd_forestmagic", when = { questDone = TODO_QUEST("Jin'Zil's Forest Magic") } },
        { text = "What do the spiders want with your camp?", next = "spiders" },
        { text = "What brought trolls up into these mountains?", next = "why" },
        { text = "Who else lives at Malaka'jin?", next = "camp" },
        { text = "How do you hunt up here?", next = "hunt" },
        { text = "How do things stand on the Echo Isles?", next = "xtroll", when = { race = "Troll" } },
        { text = "Show me the work.", next = "BUSINESS" },
        { text = "I'll be on my way, Xen'Zilla.", next = "END" },
      },
    },

    spiders = {
      lines = { { id = "sp_default", text = "Same thing we want, mon: the hunt. We kill the stag and hang the meat, and the Deepmoss smell it from the Webwinder and come crawlin' in the dark to steal it." } },
      choices = {
        { text = "Why not move the racks?", next = "spiders_move" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spiders_move = {
      lines = { { id = "sm_default", text = "We moved them twice, mon, and twice the spiders follow, because a creeper nose be better than a troll nose. The third time we stopped movin' and started killin', and that be where you come in." } },
      choices = {
        { text = "Could you keep the meat behind fire?", next = "spiders_fire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spiders_fire = {
      big = true,
      lines = { { id = "sf_default", text = "Fire keeps the creepers off, sure, but it burns wood we gotta carry up the mountain, and every night we be feedin' a fire instead of a family. Some say leave the spiders their share and be done with it." } },
      choices = {
        { text = "Kill them and keep what you hunted. That's fair.", next = "BACK", reply = "Dat be fair, mon, and it be what my brothers say too. We hunted it, we keep it, and the spiders can find their own supper.", fx = { align = { order = 1 } } },
        { text = "Leave them a share. The mountain was theirs first.", next = "BACK", reply = "The mountain was theirs, ya, I can't argue with that, mon. A share for the spiders and a share for us, and maybe we all sleep better.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = { { id = "wh_default", text = "Thrall give the Darkspear Durotar, mon, but some of us got feet that itch, and the Stonetalon had game nobody be huntin'. We built Malaka'jin at the foot of the mountain where the Barrens road comes in." } },
      choices = {
        { text = "Do the tauren at Sun Rock mind you here?", next = "why_sunrock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_sunrock = {
      lines = { { id = "ws_default", text = "The tauren be good neighbors, mon, though they look at our cooking pots like we might be boilin' a kodo. Maggran Earthbinder up on Sun Rock send word down when the harpies be bad, and we send up meat when the hunt be good." } },
      choices = {
        { text = "Sounds like a fair trade.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    camp = {
      lines = { { id = "ca_default", text = "Ken'zigla brews the healing draughts, and folk come from as far as Camp Taurajo for them. And then there be Witch Doctor Jin'Zil, who keeps to his cave with his pots and his voices, and we let him be." } },
      choices = {
        { text = "Voices?", next = "camp_jinzil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_jinzil = {
      lines = { { id = "cj_default", text = "The spirits talk to Jin'Zil, mon, or he talks to them, and some nights it be hard to tell who be winnin' the argument. He be powerful and he be strange, and I bring him meat and don't ask what he does with the bones." } },
      choices = {
        { text = "Wise of you not to ask.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll ask him myself.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },

    hunt = {
      lines = {
        { id = "hu_default", text = "Slow and low, mon, with the wind in your face, and you never chase a stag uphill because the stag wins every time. The best hunting be on the slopes above the Charred Vale, though the fire elementals make it noisy." },
        { id = "hu_hunter", when = { class = "HUNTER" }, text = "You know already, hunter, so I just tell you where: the slopes above the Charred Vale, before dawn, with {pet} downwind of you." },
      },
      choices = {
        { text = "Thanks for the advice.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xtroll = {
      lines = { { id = "xt_default", text = "Not good, mon. Vol'jin leads us from Orgrimmar now, and Zalazane still holds the Isles with his hexed slaves. Some day I go home and put a spear through that one, after the spiders." } },
      choices = {
        { text = "I'll go with you when you do.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the slopes, the stag, the spiders, and which of my cousins be lyin' about his kills. Ask, mon." } },
    background = { { id = "tp_bg", text = "Darkspear, born on the Echo Isles, come up the Barrens road to hunt where nobody else be huntin'.", next = "why" } },
    advice = { { id = "tp_ad", text = "Burn the web before you walk through it, mon, because what's waitin' in it don't want to be surprised." } },
    _none = { { id = "tp_none", text = "Never heard of it, mon, and if I can't hunt it or eat it, I don't lose sleep." } },
  },
}

---------------------------------------------------------------------------
-- Ken'zigla
---------------------------------------------------------------------------
P:NPC {
  key = "kenzigla", id = TODO_NPC("Ken'zigla"), name = "Ken'zigla",
  bible = "bibles/malakajin.md", role = "questgiver", tier = "quest",
  communities = { "malakajin", "sun_rock" }, temper = { "dry", "careful" }, values = { "healing", "craft" },
  notices = { "weary", "race", "class" },

  impression = {
    first = "Ken'zigla smells of bitterroot and smoke, and he measures everything twice, the draughts and the people who ask for them. He spoke to me while stirring and never once looked away from the pot.",
    third = "{name} met Ken'zigla, the Darkspear brewer of healing draughts at Malaka'jin.",
  },

  greetings = {
    { id = "g_hello", text = "Don't touch the pots, mon. Anything else you can touch, but not the pots." },
    { id = "g_active", when = { questActive = TODO_QUEST("Ken'zigla's Draught") }, text = "Give Dogran half the draught, mon, then wait a night before the other half, and don't you forget." },
    { id = "g_done", when = { questDone = TODO_QUEST("Ken'zigla's Draught") }, text = "Word come back from Taurajo that the grunt be walking. Good brew, if I say so myself." },
  },

  notice = {
    { id = "n_hurt", cat = "weary", when = { resSick = true },
      text = "You look like the spirits sent you back before they finished with you, mon. Sit down before you fall in my pot." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "SHAMAN", "DRUID" } },
      text = "A healer, eh? Then you know a wound don't care how pretty the prayer be, only how clean the cut." },
  },

  start = "hello",
  nodes = {
    dd_deaths = {
      lines = {
        { id = "dd_de_default", text = "No brew keep a fool alive, mon, and no brew kill a careful one. What I give you mend the body after, but the dying itself, dat be your choice every time you charge in first. Do you charge in first?" },
      },
      choices = {
        { text = "Always. Somebody has to, and it might as well be me.", next = "BACK", reply = "Then you keep me in business, and Bwonsamdi too. I'll have a draught ready when you come back.", fx = { align = { order = -1 } } },
        { text = "Not anymore. I've learned to wait for my moment.", next = "BACK", reply = "Good, dat be wisdom, and wisdom cost less than my draughts. Come back anyway, mon, because I like the company.", fx = { align = { order = 1 } } },
        { text = "Something else, Ken'zigla.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_deaths", when = { deaths = { min = 6 } },
          text = "You come up the road with more than holes in you, mon. You come up with the cold of the spirit healer's touch still on your skin, and more than once, I think, so sit and drink something warm before you go dying again." },
        { id = "h_default", key = true,
          text = "Ken'zigla, brewer of Malaka'jin. Folk come up the Barrens road with holes in them, and I send them back down with fewer, if they be patient and they listen." },
        { id = "h_news", tags = { "news" }, when = { questActive = TODO_QUEST("News of Dogran") },
          text = "You come from Camp Taurajo about the grunt? Then I already know why you be here, mon, because they sent a runner for my draught days ago and the runner never come back." },
        { id = "h_draught", when = { questActive = TODO_QUEST("Ken'zigla's Draught") },
          text = "Take it to Grunt Logmar at Taurajo, mon, he knows where they keep Dogran. First half de draught, then wait a night, or he bleeds himself dry tryin' to stand up." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("Ken'zigla's Draught"), days = 3 } },
          text = "Dogran be on his feet, they say, and cursing the quilboar already. That be the best sign there is, mon, because the dyin' don't curse." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Speak while it simmers." },
        { id = "h_again2", text = "Ask, then. The pot don't mind and neither do I." },
      },
      choices = {
        { text = "Can your brews keep me from dying so often?", next = "dd_deaths", when = { deaths = { min = 6 } } },
        { text = "What's in your draught?", next = "brew" },
        { text = "Who is this Dogran?", next = "dogran" },
        { text = "What happened to the first runner?", next = "runner" },
        { text = "How did a troll learn to brew like this?", next = "learn" },
        { text = "Do you know herbs, like I do?", next = "xherb", when = { profession = { "Herbalism", "Alchemy" } } },
        { text = "Let's get to it.", next = "BUSINESS" },
        { text = "Farewell, Ken'zigla.", next = "END" },
      },
    },

    brew = {
      lines = { { id = "br_default", text = "Bitterroot from the slopes, kingsblood when I can get it, and a few things I keep in my own pouch, mon. It closes a wound from the inside, but it pulls the strength out of you to do it, which be why you only give half." } },
      choices = {
        { text = "So too much would kill him?", next = "brew_much" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brew_much = {
      lines = { { id = "bm_default", text = "Too much all at once and the body tries to mend everything in one night, and it runs out of blood before it runs out of holes. Every healing be a loan, mon, and you pay it back in sleep." } },
      choices = {
        { text = "Then why not brew it weaker?", next = "brew_weak" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brew_weak = {
      big = true,
      lines = { { id = "bw_default", text = "Weaker be too slow for a grunt with the rot in his wound, mon. A weak brew be safe for the brewer, because nobody blames you, but the patient dies polite and slow." } },
      choices = {
        { text = "Better strong and dangerous than safe and useless.", next = "BACK", reply = "Dat be what I say every time, mon, and nobody listen. Strong and careful, and the grunt lives to complain.", fx = { align = { order = -1 } } },
        { text = "A healer should follow the safe measure, always.", next = "BACK", reply = "Safe for the brewer, mon, and slow for the dying. I'll follow it when I must, but I won't like it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dogran = {
      lines = { { id = "do_default", text = "A grunt from Camp Taurajo, mon, leading a few others against one of the quilboar camps. They got him bad, and the others drag themselves back, and Dogran be lying somewhere with his wounds festerin' because nobody dare move him." } },
      choices = {
        { text = "Will the draught be enough?", next = "dogran_enough" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dogran_enough = {
      lines = { { id = "de_default", text = "If he still be breathin' when you get there, mon, it be enough. If not, then the draught be for the next fool who leads three grunts against thirty pigs." } },
      choices = {
        { text = "I'll get there in time.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "You don't think much of his courage.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },

    runner = {
      lines = { { id = "ru_default", text = "I made the draught and gave it to him, and he went down the road toward the Barrens, and that be the last anybody saw. Could be centaur, could be the harpies, could be he drank it himself, mon." } },
      choices = {
        { text = "That's why you made another.", next = "runner_spare" },
        { text = "Something else.", next = "BACK" },
      },
    },
    runner_spare = {
      lines = { { id = "rs_default", text = "I figured another one would come askin', so I made a second pot. A brewer who only makes one of anything don't stay a brewer long, mon." } },
      choices = {
        { text = "Wise of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    learn = {
      lines = { { id = "le_default", text = "My grandmother brewed on the Echo Isles before the sea witch and the humans, mon, and she smacked my hand every time I stirred the wrong way. I still stir like she watchin', because maybe she is." } },
      choices = {
        { text = "She'd be proud of you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xherb = {
      lines = { { id = "xh_default", text = "Then you know bitterroot be bitter for a reason, mon, and that the reason be it wants to stay in the ground. Pick it at dawn, wet with the dew, and it give up more of what you want." } },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Wounds, roots, and how long a grunt can lie in the dirt before he stops bein' a grunt. Ask." } },
    background = { { id = "tp_bg", text = "Darkspear, grandson of a brewer, brewer myself. Not much story in that, mon.", next = "learn" } },
    advice = { { id = "tp_ad", text = "Clean the wound before you pray over it, mon. The spirits like a clean wound better too." } },
    _none = { { id = "tp_none", text = "Don't know it, mon, and it don't go in a pot, so I don't need to." } },
  },
}
