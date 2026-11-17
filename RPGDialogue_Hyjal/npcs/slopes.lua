-- The slopes: Thylaen, who weeds the poisoned growth, and Zet'gan, at a Horde camp that can't get away. Voice: bibles/hyjal.md
local P = RPGDialogueAPI:Pack("rpgd.hyjal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hyj_thylaen", id = TODO_NPC("Thylaen"), name = "Thylaen",
  bible = "bibles/hyjal.md", role = "questgiver", tier = "quest",
  communities = { "hyjal" }, temper = { "steady" }, values = { "kind", "stern" },
  notices = { "class", "kit", "form" },

  impression = {
    first = "Thylaen tends the poisoned growth on Hyjal's slopes with the stubborn patience of a gardener who has decided not to lose. There is no softness in how they speak of the thorns, only of what grows after them.",
    third = "{name} met Thylaen, who is clearing the fel-soured brambles from Hyjal's slopes so the mountain can grow again.",
  },

  greetings = {
    { id = "g_default", text = "Watch your step; half of what's green on this slope wants to bite you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The weeds have grown since you left, but then, they always do." },
    { id = "g_done", when = { questDone = TODO_QUEST("Celastrus the Bitter") }, text = "There's the one who cut down Celastrus. The eastern hollow is greening already; go and look, when you've the time." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the slope has grown back over half the paths you knew, so mind your boots." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since you were last on this slope, and not the way the thorns do, which is a relief, because strong things that stay healthy are rare up here." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word on the mountain is that you've been helping, and I've seen the proof of it in a few greener hollows, so keep it up." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Good; you'll understand that pulling a weed counts as healing, even if it doesn't look like one." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Those claws would make short work of the brambles. Mind the roots of the good growth while you're at it." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Fire's tempting, I know, but if you burn the brambles they'll come back thicker, and the good growth won't come back at all." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The thorns got you too, I see. Wash those cuts before nightfall, because the sap up here is poisoned." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The mountain is overrun with wild growth, swollen by the fel that rained down on it so long ago. The weeds and the brambles are angry now, poisoned through, and they strangle everything else. They have to be cleared, or the mountain will never regrow." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Celastrus the Bitter") },
          text = "You're going after Celastrus, then. Take friends, take a sharp blade, and bring me its broken frond so I know it's truly finished." },
        { id = "h_recent", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Celastrus the Bitter"), days = 3 } },
          text = "Celastrus is gone. The deer came back into the hollow the very next morning, and I stood and watched them graze for longer than I'd care to admit." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. Your kind heals bodies; up here, the ground needs healing first, and it takes a blade more often than a prayer." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde or not, a pair of hands is a pair of hands. The brambles don't ask who you're loyal to before they bite." },
      },
      again = { { id = "h_again", text = "What else? Be quick, or something will have grown over your boots." } },
      choices = {
        { text = "What is Celastrus?", next = "celastrus" },
        { text = "How did the plants turn so foul?", next = "fel" },
        { text = "What grows back once they're cleared?", next = "regrow" },
        { text = "Why not just burn it all?", next = "xburn", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "Can the Light cleanse the ground?", next = "xlight", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Good luck with the weeding.", next = "END" },
      },
    },
    celastrus = {
      lines = {
        { id = "c_default", text = "A great thornbush that lurks about the slopes to the east. It kills animals, it lashes out at the other plants, and it feeds on the bodies of the dead, which is why it's grown so big. It must be destroyed." },
        { id = "c_done", when = { questDone = TODO_QUEST("Celastrus the Bitter") }, text = "It was a thornbush the size of a house, and now it's a heap of kindling, thanks to you. I've kept its frond on my shelf, which is petty of me, but I've earned a little pettiness." },
      },
      choices = {
        { text = "Why does it eat the dead?", next = "celastrus_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    celastrus_dead = {
      lines = {
        { id = "cd_default", text = "Because there are plenty of them on this mountain, and the fel taught the plants to be hungry. A healthy thorn takes rain and sun; a poisoned one takes whatever it can catch, and it's caught a great deal." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fel = {
      lines = {
        { id = "f_default", text = "When the Legion came up the mountain, its fire fell on the forest, and the poison soaked into the soil. The trees mostly endured, but the small, quick-growing things drank it down and changed, and they've been spreading ever since." },
      },
      choices = {
        { text = "Can they be saved?", next = "fel_saved" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fel_saved = {
      big = true,
      lines = {
        { id = "fs_default", text = "I don't think so. A druid might try to coax the poison out of a single bush, but there are thousands of them, and every day spent coaxing one is a day the rest spread further. I cut them out, and I don't apologise for it." },
      },
      choices = {
        { text = "Cut them out. The mountain comes first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Even weeds deserve a chance at healing.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    regrow = {
      lines = {
        { id = "rg_default", text = "Grass first, then the small flowers, then saplings, if the soil's clean enough. And then the animals come back, and the owls nest again, and you'd never know anything had been wrong except for the stumps." },
      },
      choices = {
        { text = "That's worth fighting for.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xburn = {
      big = true,
      lines = {
        { id = "xb_default", text = "Because the brambles have deeper roots than the good growth does. Burn the slope and the poisoned roots survive under the ash, and the clean ones don't, and you've handed the mountain to the very thing you meant to destroy." },
      },
      choices = {
        { text = "Then I'll cut, slowly and carefully.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then burn deeper. Fire solves most things.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlight = {
      lines = {
        { id = "xl_default", text = "I've seen it ease the sting of a thorn, and I'd not turn away a blessing on the soil. But the Light didn't plant these brambles, and I doubt it will pull them up for us." },
      },
      choices = {
        { text = "Then I'll bless the ground and cut the thorns.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I tend green things. On this mountain, that mostly means killing them." } },
    advice = { { id = "tp_ad", text = "Never sit down on a slope you haven't looked at first." } },
    burning_legion = { { id = "tp_bl", text = "They've been gone for years, and I'm still pulling up what they left behind." } },
    _none = { { id = "tp_none", text = "Couldn't say. Ask me about weeds, and I'll talk all day." } },
  },
}

P:NPC {
  key = "hyj_zetgan", id = TODO_NPC("Zet'gan"), name = "Zet'gan",
  bible = "bibles/hyjal.md", role = "questgiver", tier = "quest",
  communities = { "hyjal" }, temper = { "weary", "steady" }, values = { "loyal", "brave" },
  notices = { "class", "race", "kit" },

  impression = {
    first = "Zet'gan is a troll worn thin by a fight his people keep trying to leave and cannot. He jokes about arrows and owls, but every word comes back round to the friends he won't abandon.",
    third = "{name} met Zet'gan, a weary troll keeping a dwindling Horde camp supplied on Mount Hyjal.",
  },

  greetings = {
    { id = "g_default", text = "Ey, mon. Ya got arrows, or ya got news?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' still breathin'. Dat makes ya lucky up here." },
    { id = "g_troll", when = { race = "Troll" }, text = "A Darkspear face! Come sit by da fire, cousin, an' tell me how da islands be." },
    { id = "g_loa", when = { origin = "troll_loa_speaker" }, text = "Ey, you be da one da loa talk to, I can tell by how ya keep smilin' at nothin'. Ask 'em what dey want for lettin' us off dis mountain, mon, an' if it be funny, don't tell me." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, praise da loa. Ya know a good fletchin' when ya see one, so ya know why I be beggin' for feathers." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! Da spirits up here be loud, mon, an' dey don't care for us much, so ask 'em nicely to go easy on da camp." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ya look like ya been fightin' our fight already. Rest a while; nobody here gonna judge ya." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "We been tryin' ta leave dis mountain many a time, but we keep gettin' pulled back ta defend our brothas an' sistas. Our defenses be dwindlin', an' it be time we get ta restockin', startin' wit' arrows. Lots an' lots o' dem." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Feathers in Flight") },
          text = "Dem big white owls in da valley, mon, dey got da long feathers for straight shootin'. Bring me a bundle an' da camp be shootin' straight again." },
        { id = "h_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Feathers in Flight"), days = 3 } },
          text = "Da fletchers been busy since ya brought dem feathers, an' da quivers be full for da first time in weeks. Ya did good, mon." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, up in da cold. Ya people be friends o' da trees, so maybe ya can tell da trees we ain't here ta hurt nobody." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "A Forsaken, eh? Da dead walkin' to da west ain't so friendly as you, so don't go wanderin' dat way alone." },
      },
      again = { { id = "h_again", text = "Somethin' else, mon? Talk while I fletch." } },
      choices = {
        { text = "Why can't you leave?", next = "leave" },
        { text = "Why owl feathers?", next = "owls" },
        { text = "What's attacking the camp?", next = "threat" },
        { text = "How fare the Darkspear here?", next = "xtroll", when = { race = "Troll" } },
        { text = "Stay strong, Zet'gan.", next = "END" },
      },
    },
    leave = {
      big = true,
      lines = {
        { id = "l_default", text = "Every time we pack up, somebody gets cut off on da slopes, or a scout don't come back, an' we turn around ta fetch 'em. Ya don't leave ya own behind, mon, even when ya own be a fool who went chasin' a pretty bird." },
      },
      choices = {
        { text = "Then you're right to stay. No one gets left.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Sometimes you cut your losses to save the rest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    owls = {
      lines = {
        { id = "o_default", text = "Dem Hyjal owls grow long feathers, white an' straight, an' dey fly true. Da birds leave plenty in dey nests south o' here, so ya don't even need ta fight 'em, if ya be quick an' quiet about it." },
      },
      choices = {
        { text = "The druids won't like it.", next = "owls_druids" },
        { text = "Something else.", next = "BACK" },
      },
    },
    owls_druids = {
      lines = {
        { id = "od_default", text = "Da bird-druids? Nah, dey don't like nothin' we do. But I only want what da owls throw away, an' if dat be too much for 'em, dey can come fletch our arrows demselves." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    threat = {
      lines = {
        { id = "t_default", text = "Demons from Dae'gun, mostly, an' da dead from da west, an' sometimes da plants, if ya believe it. Dis mountain be fightin' everybody, mon, an' we just happen ta be standin' in da middle." },
      },
      choices = {
        { text = "An orc called Yashiro hunts those demons.", next = "threat_yashiro" },
        { text = "Something else.", next = "BACK" },
      },
    },
    threat_yashiro = {
      lines = {
        { id = "ty_default", text = "Da blademaster, yeah, we know him. He don't stay long, an' he don't eat much, but every time he come by, da demons stay away from da camp for a week. I'd give him all da arrows he want, if he used arrows." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xtroll = {
      big = true,
      lines = {
        { id = "xt_default", text = "Tired, cousin, but standin'. Da loa feel far away up here, an' da cold gets in ya bones. Still, a Darkspear don't run from a fight, even when da fight won't leave him alone." },
      },
      choices = {
        { text = "We endure. That's the Darkspear way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leave when you can. Pride won't keep you warm.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Darkspear, born on da islands, now freezin' on a mountain. Life be funny dat way, mon." } },
    advice = { { id = "tp_ad", text = "Keep ya quiver full an' ya back ta da fire. Dat be all da wisdom I got." } },
    _none = { { id = "tp_none", text = "Don't know nothin' 'bout dat, mon. Ask somebody wit' more time ta think." } },
  },
}
