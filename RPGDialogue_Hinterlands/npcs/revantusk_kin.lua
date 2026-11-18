-- The Revantusk beyond the village: Elder Torntusk in his Vilebranch cage at the top of Jintha'Alor, and
-- Renn'az, who sells arrows on the village platforms and counts every one. Voice: bibles/revantusk_kin.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "elder_torntusk", id = TODO_NPC("Elder Torntusk"), name = "Elder Torntusk",
  bible = "bibles/revantusk_kin.md", role = "noble", tier = "quest",
  communities = { "revantusk" }, temper = { "proud", "dry" }, values = { "loyal", "wise" },
  notices = { "race" },

  impression = {
    first = "Elder Torntusk sat in a Vilebranch cage at the top of Jintha'Alor and greeted me like a chieftain receiving a guest. He fought for the old Horde, and he talks about his mate as if she were the one in danger.",
    third = "{name} found Elder Torntusk of the Revantusk caged at Jintha'Alor, awaiting the Vilebranch altar.",
  },

  greetings = {
    { id = "g_cage", text = "You climbed all de way up here? Den you either be very brave or very lost, an' I be hopin' for brave." },
    { id = "g_kidnap", when = { questActive = TODO_QUEST("Kidnapped Elder Torntusk!") }, text = "My mate sent you. Course she did; she never could leave a ting alone, an' dat be why I married her." },
    { id = "g_key", when = { questActive = TODO_QUEST("Recover the Key!") }, text = "De key, mon, you got de key? Dis cage be gettin' smaller every day, or I be gettin' bigger." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "An Alliance face at de top of Jintha'Alor. Strange days, but I be in no position to be choosy about my visitors." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear! Your people kept faith with de Horde too, an' paid for it like we did, so you be welcome even in a cage." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, come for an old troll. I fought beside your fathers, young one, back when de Horde first came over de mountains." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I be Elder Torntusk of de Revantusk, an' dis be not my hut. De Vilebranch came in de night an' brought me up here for deir priestess an' her altar, an' she be takin' her time about it." },
        { id = "h_found", tags = { "news" }, when = { questActive = TODO_QUEST("Kidnapped Elder Torntusk!") },
          text = "So my mate found where dey keep me. Good. Now hear me: de cage be locked, an' one of deir keepers carry de key, so dat be de next ting you need." },
        { id = "h_key", when = { questActive = TODO_QUEST("Recover the Key!") },
          text = "Find de one who hold de key, take it from dem, an' bring it back up de stairs. Don't stop to admire de view; it be full of Vilebranch." },
        { id = "h_free", tags = { "news" }, when = { questActive = TODO_QUEST("Return to Primal Torntusk") },
          text = "De door be open! Go back to my mate an' tell her I be comin', but tell her slowly, because she have a temper an' I want to be dere first." },
        { id = "h_after", when = { questDone = TODO_QUEST("Return to Primal Torntusk") },
          text = "I sleep in my own hut again, though I wake up at every drum. You did dat, an' de Revantusk don't forget." },
        { id = "h_horde_old", when = { race = "Orc" },
          text = "De Horde of today be not de Horde I marched with, an' I tank de spirits for dat. Thrall be a better chief dan any I had." },
      },
      again = {
        { id = "h_again", text = "What else? I got nowhere to be, as you see." },
        { id = "h_again2", text = "Ask, ask. Talkin' be better dan listenin' to de drums." },
      },
      choices = {
        { text = "What do the Vilebranch want with you?", next = "vile" },
        { text = "Tell me about the Revantusk.", next = "tribe" },
        { text = "You fought in the old Horde?", next = "war" },
        { text = "Primal Torntusk is waiting for you.", next = "mate" },
        { text = "What do you think of the Wildhammer?", next = "xwild", when = { faction = "Alliance" } },
        { text = "Who is this priestess who wants your blood?", next = "hexx" },
        { text = "Hold on. I'll get you out.", next = "END" },
      },
    },

    vile = {
      lines = { { id = "vi_default", text = "Blood, mon, for de dark gods dey pray to on dis hill. An old chieftain's blood be worth more to dem dan a young warrior's, or so deir priestess believe." } },
      choices = {
        { text = "How have you held out so long?", next = "vile_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vile_hold = {
      big = true,
      lines = { { id = "vh_default", text = "I tell dem stories, loud an' rude, about deir grandmothers. Dey get so angry dey forget to sharpen de knife, an' every day I be alive be one more day for my mate to find me." } },
      choices = {
        { text = "Mocking your captors? That's brave, Elder.", next = "BACK", reply = "Brave, or too old to be scared anymore, mon. Either way, de knife stay dull, an' I stay breathin'.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Clever. I'd have lied to them, promised them anything.", next = "BACK", reply = "Promise dem anything, an' dey keep you longer to get it. No, mon, rude stories be de better way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tribe = {
      lines = { { id = "tr_default", text = "We be few, an' we be stubborn, an' we live on de coast because de other tribes want us dead for keepin' faith with de Horde. De Witherbark call us weak an' de Vilebranch call us traitors, an' we call dem both worse." } },
      choices = {
        { text = "Why do they hate you so much?", next = "tribe_hate" },
        { text = "Why do the Revantusk stand with the Horde?", next = "horde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe_hate = {
      big = true,
      lines = { { id = "th_default", text = "Because when de Horde lost de war an' de orcs went into de camps, every other forest troll said de Horde be finished. We said de Horde be family, an' family don't finish." } },
      choices = {
        { text = "Loyalty through defeat is worth more than victory.", next = "BACK", reply = "Ya, it be, mon, an' de Revantusk remember who stood an' who ran. Dat be why we still here.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The others weren't wrong to look after themselves.", next = "BACK", reply = "Maybe not, mon, an' maybe dey still livin' where we be dyin'. But I sleep better, an' dat count for somethin'.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "revantusk" } } },
      },
    },

    war = {
      lines = { { id = "wa_default", text = "When I be young an' my tusks be sharp, yes. De Amani joined de orcs to burn de elves, an' de Revantusk went with dem, an' we came back with fewer warriors every season." } },
      choices = {
        { text = "Do you regret it?", next = "war_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_regret = {
      big = true,
      lines = { { id = "wr_default", text = "I regret de dead, an' I regret de warlocks dat led de Horde den, but I don't regret standin' with de orcs. Some of dem be de only friends I ever had who meant it." } },
      choices = {
        { text = "The old Horde did terrible things. You should regret more.", next = "BACK", reply = "Maybe I should, an' maybe I do, on de long nights. But I don't regret de orcs, mon, an' dat be my answer.", fx = { align = { light = 1 } } },
        { text = "War is war. Nobody walks out of it clean.", next = "BACK", reply = "Ya, nobody, mon. I came out with blood on me hands an' a few friends still beside me, an' dat be more dan most.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mate = {
      lines = { { id = "ma_default", text = "Course she be. She have a spear an' a temper an' a whole village to run, an' she still be countin' de nights I been gone, I know it." } },
      choices = {
        { text = "She's sworn blood on every Vilebranch for this.", next = "mate_blood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mate_blood = {
      big = true,
      lines = { { id = "mb_default", text = "Dat be her way. Me, I just want to go home an' eat somethin' dat ain't Vilebranch gruel, but she won't rest until dis hill pay, an' maybe she be right." } },
      choices = {
        { text = "She's right. The Vilebranch have to pay.", next = "BACK", reply = "She be right, mon, an' she always be right, dat be de trouble. I'll get her de Vilebranch, if I must.", fx = { align = { light = -1 } } },
        { text = "Go home and rest, Elder. Vengeance can wait.", next = "BACK", reply = "Ya, dat be what I want too, mon. Tell de Primal dat, an' see what she do to you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    horde = {
      lines = { { id = "ho_default", text = "When Thrall freed de orcs, we sent runners to him, an' he answered. Friendship an' help both ways, he said, an' so far he kept his word better dan most chiefs I knew." } },
      choices = {
        { text = "Thrall honours his word. That's the new Horde.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xwild = {
      big = true,
      lines = { { id = "xw_default", text = "Dey fly over our village an' dey throw stones at our boats, an' we throw spears at deir birds. But de Wildhammer never put a Revantusk on an altar, which be more dan I can say for my own cousins." } },
      choices = {
        { text = "Maybe there's room for peace with the Wildhammer.", next = "BACK", reply = "Room, maybe, mon, but de dwarves got to make some too. I'll throw one less spear, if dey throw one less stone.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Old enemies stay enemies. That's just how it is.", next = "BACK", reply = "Ya, dat be de way, mon, and it been de way since before de Horde. Me grandfather threw spears at Wildhammer, an' his grandfather too, an' I don't see de dwarves tryin' to change it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hexx = {
      lines = { { id = "hx_default", text = "De Vile Priestess Hexx, an' she sing to her gods every night at de top of dese stairs, loud enough to wake de dead, which be maybe de point. She come to look at me sometimes, de way you look at a pig before de feast." } },
      choices = {
        { text = "She won't get the chance. I'll see to her.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "An old warrior of de Revantusk, too stubborn to die an' too old to run. My mate say dat be de same ting." } },
    revantusk = { { id = "tp_rev", text = "Few, stubborn, loyal. Dat be all you need to know about us, an' all we need to know about ourselves." } },
    _none = { { id = "tp_none", text = "I been in a cage, mon, I don't hear de news. Ask my mate." } },
  },
}

P:NPC {
  key = "rennaz", id = TODO_NPC("Renn'az"), name = "Renn'az", title = "Ammunition Vendor",
  bible = "bibles/revantusk_kin.md", role = "vendor", tier = "service",
  communities = { "revantusk" }, temper = { "watchful", "dry" }, values = { "practical", "careful" },
  notices = { "class", "race" },

  impression = {
    first = "Renn'az sells arrows on the Revantusk platforms and knows exactly how many he has left. He talks about the Vilebranch the way a farmer talks about weather.",
    third = "{name} bought arrows from Renn'az, the ammunition seller at Revantusk Village.",
  },

  greetings = {
    { id = "g_default", text = "Arrows, mon, sharp ones an' rough ones an' quivers to put dem in. What you be needin'?" },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, an' your quiver be lookin' thin! Come, come, Renn'az fix dat." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? Good. Arrows be de only ting dat always run out, mostly when de Vilebranch come callin'." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear cousin! Your arrows be from de islands, I see, an' dey fly crooked here because of de wind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Renn'az, an' I sell de arrows dat keep de Vilebranch off our platforms. Every one I sell be one less dey get to climb past." },
      },
      again = { { id = "h_again", text = "What else? De arrows don't sell demselves." } },
      choices = {
        { text = "Show me your arrows.", next = "BUSINESS" },
        { text = "How often do the Vilebranch come?", next = "raids" },
        { text = "Where do you get your shafts?", next = "wood" },
        { text = "What do you think of the Wildhammer?", next = "wild" },
        { text = "Later, Renn'az.", next = "END" },
      },
    },

    raids = {
      lines = { { id = "ra_default", text = "Not so often since dey took Elder Torntusk, because dey know his mate, de Primal, be waitin' for dem. But dey come at night when dey come, so I keep a quiver by my bed." } },
      choices = {
        { text = "Should the village strike first?", next = "raids_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raids_stance = {
      big = true,
      lines = { { id = "rs_default", text = "De Primal want to, an' half de village want to with her. Me, I sell arrows either way, but I'd rather sell dem to folk who come home." } },
      choices = {
        { text = "Strike first. Waiting only invites another raid.", next = "BACK", reply = "Ya, de Primal say de same, an' de arrows sell themselves when she do. Strike first, mon.", fx = { align = { order = -1 } } },
        { text = "Hold the walls. A tribe this small can't spend warriors.", next = "BACK", reply = "Dat be sense, mon, an' de Primal don't always like sense. I'll tell her you said it, not me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    wood = {
      lines = { { id = "wo_default", text = "From de trees by de shore, where de Wildhammer don't fly so low. Feathers from de owls, when de hunters bring dem, an' from de seagulls when dey don't." } },
      choices = {
        { text = "Seagull feathers. I'll take your word they fly true.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    wild = {
      lines = { { id = "wi_default", text = "Dey fly over, we shoot at dem, dey fly higher. It be a game, mostly, until somebody hit somebody, an' den it be a war again for a while." } },
      choices = {
        { text = "Should the Revantusk make peace with them?", next = "wild_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wild_stance = {
      big = true,
      lines = { { id = "ws_default", text = "Peace with de dwarves? De Primal would laugh, an' den she would hit me. But I sell more arrows in war, so maybe I should not be de one to ask." } },
      choices = {
        { text = "Peace would save Revantusk lives. It's worth a try.", next = "BACK", reply = "Worth tryin', maybe, but de Primal hit harder dan you think. I'll keep me arrows, just in case.", fx = { align = { light = 1 } } },
        { text = "The dwarves are enemies. Keep shooting.", next = "BACK", reply = "Ya, keep shootin', mon, an' keep buyin' from Renn'az. Dat be good for everybody but de dwarves.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Revantusk, born an' raised. I make arrows an' sell arrows an' sometimes shoot arrows." } },
    _none = { { id = "tp_none", text = "Don't know, mon. Ask Lard, de innkeeper; he hear everyting." } },
  },
}
