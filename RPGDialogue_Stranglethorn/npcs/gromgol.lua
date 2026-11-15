-- Grom'gol Base Camp: the Horde's foothold on the coast, and the road to Stonard. Voice: bibles/stranglethorn.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "aggrogosh", id = TODO_NPC("Commander Aggro'gosh"), name = "Commander Aggro'gosh",
  bible = "bibles/stranglethorn.md", role = "soldier", tier = "major",
  communities = { "gromgol" }, temper = { "blunt" }, values = { "dutiful", "stern" },
  notices = { "kit", "race" },

  greetings = {
    { id = "g_camp", text = "This is Grom'gol, and everyone in Grom'gol works. Are you here to work?" },
    { id = "g_back", when = { metBefore = true }, text = "You again? Fine, there's always more to do than hands to do it." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's in pieces, so get it to the forge before you go out again. A dead grunt hauls no crates." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear? Good. Your cousins out past the walls are less friendly, so show them what a troll of the Horde is worth." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Commander Aggro'gosh. This camp keeps the road to Stonard open, and that road feeds the Horde. The ogres and the Bloodscalp make it hard, and I make it happen anyway." },
        { id = "h_defense", tags = { "news" }, when = { questActive = TODO_QUEST("The Defense of Grom'gol") },
          text = "Something out there tests our walls every night. Go out and test it in return, and test it harder." },
        { id = "h_defense_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Defense of Grom'gol"), days = 3 } },
          text = "The caravan masters say the road is quieter since you went out, and caravan masters never say anything kind. You did your duty, and you did it with honor." },
        { id = "h_road", when = { metBefore = true }, text = "Three caravans reached Stonard this week, all three, and the ogres got none of them. Write that down; I want to read it later." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The Bloodscalp drums are close tonight. Let them drum, for we have walls, and all they have is drums." },
        { id = "h_zeppelin", when = { race = "Scourge" },
          text = "Off the zeppelin from the Undercity, are you? Good. The Dark Lady's people don't tire and don't complain, which makes you the best grunts I've had all month." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it; the next caravan won't guard itself." },
        { id = "h_again2", text = "Speak, then, but speak while you walk if you can." },
      },
      choices = {
        { text = "How's the supply line?", next = "road" },
        { text = "What do you need most?", next = "need" },
        { text = "Who are you watching the walls for?", next = "threats" },
        { text = "Who else is in this camp?", next = "camp" },
        { text = "The Darkspear came from this jungle, Commander.", next = "darkspear", when = { race = "Troll" } },
        { text = "An orc mage. Does that trouble you?", next = "orc_mage", when = { race = "Orc", class = "MAGE" } },
        { text = "Thunder Bluff sent me. I'm a Windshaper.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "I'll get to work.", next = "END", fx = { affinity = 1, standing = { gromgol = 1 } } },
      },
    },

    road = {
      lines = {
        { id = "r_default", text = "Stonard sits in the swamp past the mountains, and every caravan that reaches it in one piece is a victory. I count every one." },
        { id = "r_ruag", when = { heardLine = "ruag.h_default" },
          text = "You've met Ruag in Stonard, so you know he counts them at the other end. Between the two of us not one crate goes missing without somebody shouting about it." },
      },
      choices = {
        { text = "Who's hitting the caravans?", next = "road_raiders" },
        { text = "Why does Stonard matter so much?", next = "road_stonard" },
        { text = "Then I'll help you count.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Stonard's caravans are someone else's problem.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    road_raiders = {
      lines = {
        { id = "rr_default", text = "Mosh'Ogg ogres come down from the east, and a band of them sits in the Mizjah Ruins to the southeast and ambushes anything with wheels. The Bloodscalp steal our rations at night, and that's an insult as much as a loss." },
      },
      choices = {
        { text = "Did you try talking to the ogres?", next = "road_warned", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_warned = {
      lines = {
        { id = "rw_default", text = "We came here to supply Stonard, not to make war on every tribe in the jungle, and I warned them. They kept on ambushing my caravans, so now I warn them with axes." },
      },
      choices = { { text = "Fair. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    road_stonard = {
      lines = {
        { id = "rs_default", text = "Stonard is one of the oldest orc towns in Azeroth, built when the Dark Portal first opened, and it's the Horde's eyes on the swamp and the Blasted Lands. Eyes don't see far on an empty stomach, so we feed them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    need = {
      lines = { { id = "n_default", text = "More grunts, fewer ogres, and one week without rain. I'll settle for the first." } },
      choices = {
        { text = "Where should a new grunt start?", next = "need_start" },
        { text = "I'm not a grunt.", next = "need_proud", fx = { trait = { proud = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    need_start = {
      lines = {
        { id = "ns_default", text = "Outside the gate, where the lashtail raptors have grown bold enough to stalk the caravans. Thin them out, and when you've made a real dent, come back to me for something harder." },
      },
      choices = { { text = "Raptors first, then.", next = "BACK", fx = { affinity = 1, standing = { gromgol = 1 } } } },
    },
    need_proud = {
      lines = {
        { id = "np_default", text = "In my camp everyone is a grunt, and I'm the grunt who gives the orders. Wear the word with pride or wear it with a scowl, but carry the crate either way." },
      },
      choices = {
        { text = "Understood, Commander.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'm nobody's grunt, Commander.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    threats = {
      lines = {
        { id = "t_default", text = "Jungle trolls from the ruins up the coast, naga out of the water, and the Alliance, who come down from Duskwood or walk over from Booty Bay looking for an easy fight. These walls were built thick for all three." },
      },
      choices = {
        { text = "Booty Bay is neutral, isn't it?", next = "threats_bay" },
        { text = "Naga? Here?", next = "threats_naga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    threats_bay = {
      lines = {
        { id = "tb_default", text = "The goblins sell to anyone with coin, and their Bruisers keep the peace inside their town. Outside it, a human who drank with you last night will cut your throat on the road, so keep your axe loose." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    threats_naga = {
      lines = {
        { id = "tn_default", text = "They crawl up from the sea to poke at old ruins and holy springs along the coast. Ask Mok'thardin about it; the far seer had someone chase a whole expedition of them off a cliff." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    camp = {
      lines = {
        { id = "c_default", text = "Nimboya and Kin'weelay came from Orgrimmar on the Darkspear's business, Mok'thardin works enchantments by the fire, and Thulbek keeps the inn. Every one of them pulls their weight, or they'd hear about it from me." },
      },
      choices = {
        { text = "The trolls aren't here for your caravans.", next = "camp_trolls" },
        { text = "And Thulbek?", next = "camp_thulbek" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_trolls = {
      lines = {
        { id = "ct_default", text = "No, they're hunting their chief's lost son, and that's Vol'jin's business, not mine. But a Bloodscalp killed for Nimboya is a Bloodscalp who won't steal my rations, so I call it a fair trade." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "yenniku" } } } },
    },
    camp_thulbek = {
      lines = {
        { id = "cth_default", text = "Thulbek feeds my grunts and listens to their lies about gorillas, which saves me from doing either. A camp without a cook is a camp that mutinies by the third week." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    darkspear = {
      lines = {
        { id = "d_default", text = "So I'm told, and now the ones who stayed behind would take your head for wearing the Horde's colors. Show them what they lost when your tribe walked away with the Warchief." },
      },
      choices = {
        { text = "They're not my people anymore.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Some of them still are.", next = "BACK", fx = { align = { order = -1 }, affinity = 1, trait = { kind = 1 } } },
      },
    },
    orc_mage = {
      lines = {
        { id = "om_default", text = "The last orcs who played with that kind of power turned our skin green and our homeland to dust, so yes, it troubles me. But if your fire lands on ogres and not on my caravans, I'll keep my troubles to myself." },
      },
      choices = {
        { text = "My fire knows where to land.", next = "BACK", fx = { align = { light = -1 }, affinity = 1, trait = { proud = 1 } } },
        { text = "It troubles me too, sometimes.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
    skyborne = {
      lines = {
        { id = "sk_default", text = "I've heard Thunder Bluff speaks for your people, and the tauren don't give their word lightly. I know nothing about your sky, but in my camp you'll be judged on whether you carry your share, like everyone else." },
      },
      choices = { { text = "That's all I ask.", next = "BACK", fx = { affinity = 2, standing = { gromgol = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "My scouts report everything that moves on the Stonard road. Ask what you need, and don't waste my time." },
    },
    yenniku = { { id = "tp_yenniku", text = "That's Nimboya's business, and he's welcome to it, as long as he pulls his weight while he's in my camp." } },
    background = {
      { id = "tp_ba", text = "I'm the Commander of Grom'gol, sent by the Warchief to keep the road to Stonard open. Everything that happened to me before this camp happened to someone with far less to do.", next = "road" },
      { id = "tp_ba2", text = "I command a camp, I guard caravans, and I count crates. If you want a song about it, ask Thulbek to make one up." },
    },
    advice = { { id = "tp_ad", text = "Never walk the jungle road alone at night, and never trust the quiet. When the birds stop, something bigger than you is listening." } },
    _none = { { id = "tp_none", text = "That's not my problem. Find someone with time to talk." } },
  },
}

P:NPC {
  key = "nimboya", id = TODO_NPC("Nimboya"), name = "Nimboya",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "gromgol" }, temper = { "wary" }, values = { "loyal", "stern" },
  notices = { "race" },

  greetings = {
    { id = "g_wary", text = "Nimboya don't know you. Say what you come for, and say it quick." },
    { id = "g_back", when = { metBefore = true }, text = "You again, good. You keep coming back like this, maybe you be useful." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear blood. Then you understand why I be here, so far from Durotar." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The chief's son be lost in this jungle, Yenniku. I come from Orgrimmar to find him, and I don't go back without him." },
        { id = "h_hunt", tags = { "news" }, when = { questActive = TODO_QUEST("Hunt for Yenniku") },
          text = "The Bloodscalp got him, I think, so hunt them to the north and bring me their tusks. Show Nimboya you can make prey of them before we go further." },
        { id = "h_heads", when = { questActive = TODO_QUEST("Headhunting") },
          text = "Bring me the shrunken heads the Bloodscalp headhunters carry, many of them, and Nimboya look at every one. I pray to the Great Serpent his face not be among them." },
        { id = "h_clanheads", when = { questActive = TODO_QUEST("Bloodscalp Clan Heads") },
          text = "Gan'zulah and Nezzliok sit deep in Zul'Kunda, and they know where the boy be. Bring their heads to the cauldron, and we make the dead talk." },
        { id = "h_grim", when = { questActive = TODO_QUEST("Grim Message") },
          text = "Time the Witherbark learn what Darkspear do to those who betray the Warchief. Make it a message they remember." },
        { id = "h_saving", when = { questActive = TODO_QUEST("Saving Yenniku") },
          text = "Kin'weelay tell me you go after Yenniku with the gem. Whatever they done to him, we undo it, and I be waiting right here." },
        { id = "h_saved", tags = { "news" }, when = { questRecent = { TODO_QUEST("Saving Yenniku"), days = 7 } },
          text = "The chief's son's soul be free of Zanzil, because of you. The Darkspear will sing your name, and we carve your tale in stone so it never wash away." },
        { id = "h_trolkalar", when = { questDone = TODO_QUEST("Trol'kalar") },
          text = "Zengu send Trol'kalar down from Hammerfall, the humans' troll-killer sword, and now it hang here waiting for the Gurubashi. You had a hand in that too, I hear." },
        { id = "h_dream", when = { metBefore = true }, text = "Nimboya dream of Yenniku last night, small, like when he was a boy. Nimboya wake up and sharpen the spear." },
      },
      again = {
        { id = "h_again", text = "What else? Nimboya listening, but not for long." },
        { id = "h_again2", text = "Ask, then, and I tell you what I can." },
      },
      choices = {
        { text = "Who is Yenniku?", next = "yenniku" },
        { text = "And the Bloodscalp?", next = "bloodscalp" },
        { text = "Why punish the Witherbark?", next = "witherbark" },
        { text = "Do the Darkspear miss this jungle?", next = "walls" },
        { text = "I'm Darkspear. Tell me what the chief needs.", next = "kin", when = { race = "Troll" } },
        { text = "His soul is free. Is it over?", next = "after", when = { questDone = TODO_QUEST("Saving Yenniku") } },
        { text = "I'll help you find him.", next = "END", fx = { affinity = 2, align = { honor = 1 }, learn = { "yenniku" } } },
        { text = "Good hunting, but the chief's son is no business of mine.", next = "END", fx = { align = { honor = -1 } } },
      },
    },

    yenniku = {
      big = true,
      lines = {
        { id = "y_default", text = "Vol'jin's youngest son. It be the custom of our people that he go to the Gurubashi of Zul'Gurub, and when the Darkspear left with Thrall, the boy be lost to us." },
      },
      choices = {
        { text = "Your people gave a child away?", next = "yenniku_custom" },
        { text = "The chief trusts you with this?", next = "yenniku_trust" },
        { text = "Something else.", next = "BACK", fx = { learn = { "yenniku" } } },
      },
    },
    yenniku_custom = {
      lines = {
        { id = "yc_default", text = "It be an old way, older than Nimboya and older than Orgrimmar, and I don't argue it with strangers. What matter now be bringing him home, not how he come to be gone." },
      },
      choices = { { text = "Fair. Something else.", next = "BACK", fx = { learn = { "yenniku" } } } },
    },
    yenniku_trust = {
      lines = {
        { id = "yt_default", text = "The chief send me from distant Orgrimmar back to this jungle, and that be trust enough. If I fail him, I don't go back, so I don't fail him." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "yenniku" } } } },
    },

    bloodscalp = {
      lines = {
        { id = "bs_default", text = "Their witch doctor, Nezzliok, know where the boy be. Alive or dead, he going to tell me." },
      },
      choices = {
        { text = "How does a dead troll tell you anything?", next = "bloodscalp_cauldron" },
        { text = "And their chief?", next = "bloodscalp_chief" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bloodscalp_cauldron = {
      lines = {
        { id = "bc_default", text = "Kin'weelay keep a cauldron bubbling by the north gate, and the heads go in, and the heads talk. The Bloodscalp won't speak to us freely, so we force the truth from their dead lips." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    bloodscalp_chief = {
      lines = {
        { id = "bch_default", text = "Gan'zulah, and if Yenniku die by Bloodscalp hands, may a curse sit on his spirit for six hundred years. Nimboya don't curse lightly, mon." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    witherbark = {
      lines = {
        { id = "w_default", text = "The Witherbark of the Hinterlands, far north past Tarren Mill, once stand with the Horde, and they betray Thrall. Betrayal must cost something, or everybody try it." },
      },
      choices = {
        { text = "What message do you want sent?", next = "witherbark_pike" },
        { text = "Something else.", next = "BACK" },
      },
    },
    witherbark_pike = {
      lines = {
        { id = "wp_default", text = "My own pike, heavy with their skulls, driven into the ground at one of their villages, Hiri'watha or Zun'watha. It be grim work, but there be honor in it if they heed it." },
      },
      choices = {
        { text = "I'll carry your pike.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "That's cruel.", next = "BACK", fx = { align = { light = 1 }, opinion = { witherbark_pike = "against" } } },
      },
    },

    walls = {
      lines = {
        { id = "wl_default", text = "This jungle be the Darkspear's home once, and the trolls who stayed don't like us much now. Nimboya don't fear no Bloodscalp or Skullsplitter, but I don't mind these high walls at night either." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },

    kin = {
      lines = {
        { id = "k_default", text = "Then you hear me as kin, not as some hired axe. The chief need his son's spirit back from whoever hold it, and every Darkspear who help be standing with Vol'jin himself." },
      },
      choices = {
        { text = "For Vol'jin, then.", next = "BACK", fx = { affinity = 3, align = { order = 1 } } },
        { text = "I help for the boy's sake, not for any chief.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Does Vol'jin speak of him?", next = "kin_chief" },
      },
    },
    kin_chief = {
      lines = {
        { id = "kc_default", text = "The chief carry it quiet, the way a chief must. He don't speak of it to me, and I don't ask, because I be the answer he sent." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    after = {
      lines = {
        { id = "a_default", text = "His soul be free, and I thank you for it with all my blood. But his body still walk with Zanzil on the Cape, empty, and that be a thing Nimboya will carry home." },
      },
      choices = {
        { text = "It's still a victory.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then Zanzil should answer for it.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    yenniku = { { id = "tp_yenniku", text = "Every day he be gone, the chief carry it. I carry it too.", next = "yenniku" } },
    background = { { id = "tp_ba", text = "Nimboya be Darkspear, sent by the chief from Orgrimmar. That all you need to know, and more than most get." } },
    advice = { { id = "tp_ad", text = "The Bloodscalp hunt heads, so keep yours low in the ruins along the coast. They come from above, mon, always from above." } },
    _none = { { id = "tp_none", text = "Nimboya got one thing on his mind, and that not it." } },
  },
}

P:NPC {
  key = "kinweelay", id = TODO_NPC("Kin'weelay"), name = "Kin'weelay",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "gromgol" }, temper = { "playful" }, values = { "loyal", "curious" },
  notices = { "class", "form" },

  greetings = {
    { id = "g_spirits", text = "The spirits told me somebody coming, but they don't say who. Spirits be rude like that, mon." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the spirits remember your face, and that be a fine thing, mostly." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You hear them too, the ones nobody else hear? Then we talk easy, you and me." },
    { id = "n_druid", cat = "form", when = { class = "DRUID" },
      text = "A shapechanger. The wild spirits like you, since you wear their skins with respect, but the Bloodscalp won't like you at all." },
  },

  react = {
    { id = "r_cat", on = "form", when = { form = "cat" }, text = "Heh! Big cat in Grom'gol, and the grunts don't even blink. You walk it well, mon." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kin'weelay, witch doctor of the Darkspear. Orgrimmar send me to help Nimboya: he use his spear, and I use what can't be seen." },
        { id = "h_reef", when = { questActive = TODO_QUEST("The Vile Reef") },
          text = "Under the water at the Vile Reef, old troll carving be waiting. Bring me a piece of it. Mind the murlocs; they don't read." },
        { id = "h_necklaces", when = { questActive = TODO_QUEST("Bloody Bone Necklaces") },
          text = "The Bloodscalp wear bloody bone round their necks. Bring me enough, and I make something useful out of something ugly." },
        { id = "h_split", when = { questActive = TODO_QUEST("Split Bone Necklace") },
          text = "Now the Skullsplitter, to the southeast, who the Darkspear been warring with for years. Bring me their split bone necklaces, and you earn the friendship of my tribe." },
        { id = "h_marg", tags = { "news" }, when = { questActive = TODO_QUEST("The Troll Witchdoctor") },
          text = "There be an angry spirit hanging about you, an orc with a job left undone. Who you carrying, and what he want from Kin'weelay?" },
        { id = "h_fate", tags = { "news" }, when = { questActive = TODO_QUEST("The Fate of Yenniku") },
          text = "I look for the boy with my magic, and what I find, I don't like. His body walk here, but his spirit not with it." },
        { id = "h_crystals", when = { questActive = TODO_QUEST("The Singing Crystals") },
          text = "Them crystals sing, if you know how to listen. I need their song for what come next." },
        { id = "h_eye", when = { questActive = TODO_QUEST("The Mind's Eye") },
          text = "Mai'Zoth hold the Mind's Eye deep in the Mosh'Ogg mound, and he be strong even without it. Take friends, mon, and take them all the way in." },
        { id = "h_spirits", when = { metBefore = true }, text = "De jungle spirits be loud here, mon, louder than at home. Dey not friendly and dey not unfriendly, dey just loud." },
      },
      again = {
        { id = "h_again", text = "More questions? The spirits got more answers, if they in the mood." },
        { id = "h_again2", text = "Go on, mon, Kin'weelay still here, and so be the spirits." },
      },
      choices = {
        { text = "What can't be seen?", next = "unseen" },
        { text = "Why do you want Bloodscalp necklaces?", next = "trophies" },
        { text = "What's down at the Vile Reef?", next = "reef" },
        { text = "Can Yenniku still be saved?", next = "hope" },
        { text = "I carry an orc's head from Dustwallow.", next = "marg", when = { questActive = TODO_QUEST("The Troll Witchdoctor") } },
        { text = "A Darkspear warlock. What do the spirits make of me?", next = "troll_warlock", when = { race = "Troll", class = "WARLOCK" } },
        { text = "I'm a Windshaper. Do your spirits know mine?", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Farewell, witch doctor.", next = "END" },
      },
    },

    unseen = {
      lines = {
        { id = "u_default", text = "Spirits, curses, old magic left lying around, and Stranglethorn full of all three. You walk through them every day and never know." },
      },
      choices = {
        { text = "That's not comforting.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Do they talk to you?", next = "unseen_talk" },
      },
    },
    unseen_talk = {
      lines = {
        { id = "ut_default", text = "All day, mon, and loud. They say you come to aid my chief, and they say it so loud I can't hear myself stir the pot." },
        { id = "ut_listener", when = { class = { "SHAMAN", "PRIEST" } },
          text = "You know how it be: they talk, you listen, and half the time they talking about you. Today they say you be useful, so don't prove them wrong." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    trophies = {
      lines = {
        { id = "tr_default", text = "Nimboya be my reason for coming, but I got reasons of my own. The Bloodscalp be enemy to the Darkspear, and a trophy from your enemy give you power over him." },
      },
      choices = {
        { text = "What do you do with them?", next = "trophies_paste" },
        { text = "Your tribe has a lot of enemies here.", next = "trophies_skull" },
      },
    },
    trophies_paste = {
      lines = {
        { id = "tp2_default", text = "I boil them, and leech them, and grind them down to paste, and every turn of the pestle their owners' spirits get a little weaker. It be nasty work, but it be honest nasty work." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    trophies_skull = {
      lines = {
        { id = "ts_default", text = "The Skullsplitter too, mon, to the southeast. The Darkspear don't live in Stranglethorn no more, but a war don't care who moved away." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },

    reef = {
      lines = {
        { id = "rf_default", text = "Long ago the earth shudder and an old troll city sink under the waves off the Savage Coast, and murlocs live in it now. Among the ruins be a tablet telling the tale of Gri'lek, a hero of our legends." },
      },
      choices = {
        { text = "Why does the Darkspear want it?", next = "reef_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reef_why = {
      lines = {
        { id = "rw_default", text = "The tablet too big to move, but a shard of it can go home with me to Orgrimmar. We put it in a sacred place, so the young ones remember the might of Gri'lek in a land that never heard of him." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    hope = {
      big = true,
      lines = {
        { id = "ho_default", text = "Nezzliok's head tell us Zanzil the Outcast hold the boy, body and soul, and Zanzil be a vile and powerful witch doctor. The hope be faint, mon, tiny as the smallest bug, but it still be hope." },
      },
      choices = {
        { text = "What would it take?", next = "hope_eye" },
        { text = "Then let's not waste it.", next = "BACK", fx = { affinity = 2, align = { honor = 1 }, learn = { "yenniku" } } },
        { text = "Hope that faint isn't worth anyone's life.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    hope_eye = {
      lines = {
        { id = "he_default", text = "A jewel from the heart of the jungle called the Mind's Eye, which I reshape into a soul gem, and singing shards from the basilisks of the Crystalvein Mine to bend it to my will. Then we take back what Zanzil stole." },
      },
      choices = {
        { text = "Who has the Mind's Eye?", next = "hope_maizoth" },
        { text = "Something else.", next = "BACK", fx = { learn = { "yenniku" } } },
      },
    },
    hope_maizoth = {
      lines = {
        { id = "hm_default", text = "Mai'Zoth, an ogre mage of the Mosh'Ogg. I know him from when the Darkspear still dwell here, and he be vicious then, and with the Eye he be worse." },
        { id = "hm_nimetz", when = { heardLine = "nimetz.h_default" },
          text = "Mai'Zoth, an ogre mage of the Mosh'Ogg, and I hear a human priest at the rebel camp swear to kill him too. Everybody want that ogre dead, mon, so the line be long." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    marg = {
      lines = {
        { id = "mg_default", text = "Ah, I see him now, bound to this world and boiling with rage, an orc spy with his task still undone. Nazeer want to know how he die, so let us have words with this angry orc." },
      },
      choices = {
        { text = "What does he say?", next = "marg_speaks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marg_speaks = {
      lines = {
        { id = "ms_default", text = "He be shouting about a pendant and a crab-man, and he want you to finish his mission more than he want to rest. Listen to him close; the dead don't repeat themselves for free." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    troll_warlock = {
      lines = {
        { id = "tw_default", text = "They flinch, mon, the way a dog flinch from a hand that hit it once. Witch doctors bargain with spirits and warlocks chain them, and the jungle know the difference even when you don't." },
      },
      choices = {
        { text = "I chain demons, not spirits.", next = "troll_warlock_chain", fx = { trait = { proud = 1 } } },
        { text = "Then teach me to bargain.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Chains work well enough, and I'll keep using them.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    troll_warlock_chain = {
      lines = {
        { id = "twc_default", text = "Heh, that what the Atal'ai say too, and look where they end up, under a swamp. Keep your chains tight and your own spirit loose, Darkspear, and maybe you be the first to get it right." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    skyborne = {
      lines = {
        { id = "sk_default", text = "The jungle spirits don't say your name, mon, and they say everybody's name. I hear your people feel a debt to the spirits of the wind, so maybe you just come from too far up for them to see." },
      },
      choices = {
        { text = "Our spirits went quiet too.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    yenniku = { { id = "tp_yenniku", text = "His spirit wander, mon. I bring it home, one way or another.", next = "hope" } },
    background = { { id = "tp_ba", text = "They call Kin'weelay the strongest witch doctor of the Darkspear, and I don't argue, because arguing be bad luck. The chief send me here, so here I be." } },
    advice = { { id = "tp_ad", text = "If a trinket in the ruins hum at you, leave it be, mon. Old magic in Stranglethorn always want a new owner." } },
    _none = { { id = "tp_none", text = "Even the spirits don't know that one. Or they not telling." } },
  },
}

P:NPC {
  key = "mokthardin", id = TODO_NPC("Far Seer Mok'thardin"), name = "Far Seer Mok'thardin",
  bible = "bibles/stranglethorn.md", role = "priest", tier = "quest",
  communities = { "gromgol" }, temper = { "calm" }, values = { "wise", "patient" },
  notices = { "class" },

  greetings = {
    { id = "g_fire", text = "The camp is loud, but here by the fire it's quieter. Speak, and I'll listen." },
    { id = "g_back", when = { metBefore = true }, text = "The fire kept your place for you. Sit." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Another who listens to the elements. Out here they speak loudly, and mostly about rain." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Far Seer Mok'thardin, of Orgrimmar. The beasts of Stranglethorn carry old power in their blood and bones, and I'm learning to draw it out." },
        { id = "h_ench", when = { questActive = TODO_QUEST("Mok'thardin's Enchantment") },
          text = "The enchantment needs what only those beasts can give. Bring it, and I'll show you what it becomes." },
        { id = "h_ench_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Mok'thardin's Enchantment"), days = 2 } },
          text = "Every piece you've brought has been perfect, and I thanked the spirits of each beast for it. A little more patience, and the choker will be ready." },
        { id = "h_bones", when = { metBefore = true }, text = "A raptor's bones sing differently than a panther's, and I can hear it now. At night, I wish I couldn't." },
      },
      again = {
        { id = "h_again", text = "There's more you wish to know? The fire has time, and so do I." },
        { id = "h_again2", text = "Ask. The elements are in no hurry tonight." },
      },
      choices = {
        { text = "What kind of power?", next = "power" },
        { text = "What are you making?", next = "ench" },
        { text = "Why send a far seer to a supply camp?", next = "why" },
        { text = "What do you make of the trolls' magic?", next = "trolls" },
        { text = "The elements speak to me as well.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I'm an orc who studies the arcane.", next = "orc_mage", when = { race = "Orc", class = "MAGE" } },
        { text = "My people honor the elements too.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Thank you, far seer.", next = "END" },
      },
    },

    power = {
      lines = {
        { id = "p_default", text = "The kind that settles into anything that's lived long in a wild place. Orgrimmar teaches us to ask before we take, so I ask." },
      },
      choices = {
        { text = "And if the answer's no?", next = "power_no", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    power_no = {
      lines = {
        { id = "pn_default", text = "Then I go without, and I don't sulk about it. The orcs who stopped asking once drank something worse than any panther's blood, and we're still paying for that cup." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } } },
    },

    ench = {
      lines = {
        { id = "e_default", text = "A ceremonial choker, enchanted for a defender of the Horde. Shadowmaw claws and a pristine tigress fang for its strength, stalker feathers for its speed, and a sinew from an old gorilla east of Booty Bay to tie it all together." },
      },
      choices = {
        { text = "Why must the fang be pristine?", next = "ench_fang" },
        { text = "Is that everything?", next = "ench_spring" },
      },
    },
    ench_fang = {
      lines = {
        { id = "ef_default", text = "A broken fang has already given up part of its spirit, and I can't bind what isn't there. It may take many hunts to find the right one, and every one of those hunts is part of the price." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ench_spring = {
      lines = {
        { id = "es_default", text = "One thing more: water from the Holy Spring high on the bluffs to the south. Every people in Azeroth claims those waters were blessed for them alone, and now the naga have come to claim them too." },
      },
      choices = {
        { text = "Who's right about the spring?", next = "ench_claim", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ench_claim = {
      lines = {
        { id = "ec_default", text = "Perhaps all of them, perhaps none. The water doesn't seem to mind who drinks it, which is more than I can say for the scholars who argue about it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    why = {
      lines = {
        { id = "w_default", text = "The jungle's magic should be understood and harnessed for the Horde before someone else harnesses it against us. My rituals have worked so far, and the Warchief's defenders wear the proof." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    trolls = {
      lines = {
        { id = "t_default", text = "Kin'weelay sees things in that cauldron I would not look at, and I am glad he looks so I don't have to. The Darkspear's spirits are older in this land than mine, so I listen when he speaks." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    shaman = {
      lines = {
        { id = "sh_default", text = "Then you know the jungle is never silent. Water presses in from every side here, and fire sulks under the damp, so call on it gently or it won't come at all." },
      },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    orc_mage = {
      lines = {
        { id = "om_default", text = "I won't pretend I'm easy with it; the last of our people to reach for power without asking ended in chains and fel. But you came and told me plainly, which is a kind of asking, and I'll judge you by what you do with it." },
      },
      choices = {
        { text = "That's fair, far seer.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The arcane isn't the fel.", next = "BACK", fx = { align = { order = -1 }, trait = { proud = 1 } } },
      },
    },
    skyborne = {
      lines = {
        { id = "sk_default", text = "I'm told the Earthen Ring spoke for your people when you came to the Horde. If the elements welcomed you, then so do I, though I would like to know how they sound where you come from." },
      },
      choices = {
        { text = "Quieter than they used to.", next = "BACK", fx = { affinity = 2 } },
        { text = "Another time, far seer.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was trained in Orgrimmar to listen to the elements, and Orgrimmar sent me here to listen to the jungle. So far the jungle mostly talks about rain." } },
    advice = { { id = "tp_ad", text = "Thank what you kill, even a raptor. It costs you nothing, and the land remembers the ones who don't." } },
    _none = { { id = "tp_none", text = "That is beyond what the elements tell me." } },
  },
}

P:NPC {
  key = "thulbek", id = TODO_NPC("Innkeeper Thulbek"), name = "Innkeeper Thulbek",
  bible = "bibles/stranglethorn.md", role = "innkeeper", tier = "service",
  communities = { "gromgol" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary", "drink" },

  greetings = {
    { id = "g_inn", text = "Come in and sit by the fire! Out here a fire keeps things away, not cold." },
    { id = "g_home", when = { homeInn = { "Grom'gol Base Camp" } }, text = "Home again. Your bed's dry, which in Stranglethorn counts as a luxury." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the spirit healer just sent you back. Sit down, eat, and don't argue." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Slow down. The grog in this camp is strong, and it holds a grudge." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Thulbek. As long as Grom'gol stands, there's a bed here for you. All I ask is a story of the fighting while you eat." },
        { id = "h_story", when = { metBefore = true }, text = "A grunt told me last night he wrestled a gorilla. By morning it was two gorillas, and by noon, a gorilla king, which makes a good story and a bad liar." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The jungle never sleeps. Listen, and you'll hear that everything out there is either hunting or hiding, so eat your stew." },
      },
      again = { { id = "h_again", text = "Still here? Good, the stew's still hot, so what else?" } },
      choices = {
        { text = "I've a story or two.", next = "story" },
        { text = "What's the talk in camp?", next = "talk" },
        { text = "Where does the zeppelin go?", next = "zeppelin" },
        { text = "Do you even cook for the Forsaken?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Just a meal, thanks.", next = "END" },
      },
    },
    story = {
      lines = { { id = "s_default", text = "Good! Tell it loud, so the grunts by the wall get some cheer and the trolls outside hear what's waiting for them." } },
      choices = {
        { text = "[Tell it]", next = "story_told", fx = { affinity = 2, standing = { gromgol = 1 } } },
        { text = "On second thought, another time.", next = "BACK" },
      },
    },
    story_told = {
      lines = {
        { id = "st_default", text = "Ha! I'll be telling that one myself by tomorrow, and it'll have one more ogre in it each time I do. That's the toll for the bed, and you've paid it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    talk = {
      lines = {
        { id = "tk_default", text = "The Commander's counting caravans again, the far seer's been sniffing panther claws, and Nimboya hasn't smiled since he got here. Nothing new, which in this jungle is good news." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "yenniku" } } } },
    },
    zeppelin = {
      lines = {
        { id = "z_default", text = "The tower outside the walls sends them to Orgrimmar and to the Undercity, and the goblins who run them swear they've never lost one. I've never asked what they mean by lost." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = {
        { id = "f_default", text = "I cook for anyone who sits at my fire, and you lot are the easiest guests I have, since you never send the stew back. Take a bowl anyway; it's warm, and warm is worth something even to the dead." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Just an innkeeper who goes where the Horde goes, because the Horde has to eat wherever it ends up." } },
    advice = { { id = "tp_ad", text = "Sleep with your boots on and your axe within reach. Not because of anything in particular, just because it's Stranglethorn." } },
    _none = { { id = "tp_none", text = "Ask the Commander. He hears everything in this camp, and complains about most of it." } },
  },
}
