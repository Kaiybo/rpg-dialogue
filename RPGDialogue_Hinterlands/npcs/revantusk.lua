-- Revantusk Village (Horde, forest trolls of the Revantusk tribe). Voice: bibles/revantusk.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "torntusk", id = TODO_NPC("Primal Torntusk"), name = "Primal Torntusk",
  bible = "bibles/revantusk.md", role = "noble", tier = "major",
  communities = { "revantusk" }, temper = { "fierce" }, values = { "loyal", "protective", "proud" },
  notices = { "race", "class" },

  impression = {
    first = "Primal Torntusk leads the Revantusk while her mate sits in a Vilebranch cage at Jintha'Alor. She speaks of the Horde like a debt her tribe has paid twice over, and she isn't wrong.",
    third = "{name} met Primal Torntusk, who leads the Revantusk trolls of the Hinterlands coast and wants her mate back from the Vilebranch.",
  },

  greetings = {
    { id = "g_village", text = "You be standin' in Revantusk, stranger, the last forest trolls who still keep faith with the Horde. Speak plain, for I got little time for pretty words." },
    { id = "g_back", when = { metBefore = true }, text = "You come back to the coast, good. Revantusk remembers who walks in and who walks out again." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear, from Thrall's islands, and you got the look of a long voyage. Jungle or forest, a troll who keeps faith with the Horde be welcome in Revantusk." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, walkin' free in the Hinterlands. Last time I saw so many of you, the humans was puttin' you in cages, and none of us could stop them." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "The spirits walk close behind you, shaman. They be welcome here, so long as they keep their eyes on Jintha'Alor." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I be Primal Torntusk, and I lead the Revantusk while my mate sits in a Vilebranch cage. They came at midnight, they took him up to Jintha'Alor, and every night since I been countin' how many of them owe me blood." },
        { id = "h_kidnap", tags = { "news" }, when = { questActive = TODO_QUEST("Kidnapped Elder Torntusk!") },
          text = "My spies say he still breathes, up on the top of Jintha'Alor, and the Vile Priestess Hexx be readyin' him for her altar. Go quick, before she finishes her preparations." },
        { id = "h_hexx", when = { questActive = TODO_QUEST("Wanted: Vile Priestess Hexx and Her Minions") },
          text = "You read the poster, then. Hexx and her Aman'zasi guards sit at the summit as if the hill belongs to them, so show them it don't." },
        { id = "h_job", when = { questActive = TODO_QUEST("Job Opening: Guard Captain of Revantusk Village") },
          text = "You want Malkhor's post? Then kill the Vilebranch that killed him, the berserkers and shadow hunters and blood drinkers and soul eaters, and come tell me how many." },
        { id = "h_home", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Return to Primal Torntusk"), days = 3 } },
          text = "He walked in last night, thin as a reed and sore in every joint, and the first thing he asked was who brought him home. I told him your name, and Revantusk will not forget it." },
        { id = "h_later", when = { questDone = TODO_QUEST("Return to Primal Torntusk") },
          text = "My mate sleeps in his own hut again, though he wakes at every drum, and I be Primal Torntusk still. The Vilebranch learned what Revantusk does when it be wronged." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Midnight again. That be the hour they came for him, so the watchers stand double on the walls now, and I stand with them." },
      },
      again = {
        { id = "h_again", text = "What else, then? Say it quick." },
        { id = "h_again2", text = "Go on. The tide be comin' in, but I can listen." },
        { id = "h_again3", when = { questDone = TODO_QUEST("Return to Primal Torntusk") }, text = "Ask what you want, friend of Revantusk." },
      },
      choices = {
        { text = "Tell me about the raid.", next = "raid" },
        { text = "Why do the other trolls hate you?", next = "tribes" },
        { text = "How did the Revantusk come to the Horde?", next = "horde" },
        { text = "What about the Wildhammer?", next = "wildhammer" },
        { text = "Who was Malkhor?", next = "malkhor" },
        { text = "Your mate is home. I saw to it.", next = "after", when = { questDone = TODO_QUEST("Return to Primal Torntusk") } },
        { text = "My people were in those camps too.", next = "orc", when = { race = "Orc" } },
        { text = "The Darkspear stand with you, Primal.", next = "troll", when = { race = "Troll" } },
        { text = "I serve the Dark Lady. What use am I here?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'll go up to Jintha'Alor.", next = "END", fx = { affinity = 2, standing = { revantusk = 1 } } },
      },
    },
    raid = {
      big = true,
      lines = {
        { id = "ra_default", text = "They came up from the south in the dark, quiet as fog, and they knew where every hut stood. Malkhor met them at the gate with a spear, and they took him and my mate both up the hill." },
      },
      choices = {
        { text = "How did they know the village so well?", next = "raid_spies" },
        { text = "Then I'll bring him back, whatever it costs.", next = "raid_vow", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Pay the Vilebranch back first. Rescue can wait.", next = "raid_vow", fx = { align = { honor = -1 } } },
      },
    },
    raid_spies = {
      lines = { { id = "rs_default", text = "Because they watched us for many moons, the same way my spies be watchin' them now. Trolls been doin' this to each other since before your grandfather's grandfather was born." } },
      choices = {
        { text = "What do your spies say?", next = "raid_hexx" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raid_vow = {
      lines = { { id = "rv_default", text = "Big words, and I heard many of them since the raid. Bring me back somethin' I can hold in my hands, and then we talk about what you be worth." } },
      choices = {
        { text = "Where is he held?", next = "raid_hexx" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raid_hexx = {
      lines = {
        { id = "rh_default", text = "At the summit of Jintha'Alor, where the Vile Priestess Hexx keeps her altar and her Aman'zasi guard. She wants to spill him slow, so the gods can watch, and that slowness be the only gift she ever gave me." },
        { id = "rh_done", when = { questDone = TODO_QUEST("Wanted: Vile Priestess Hexx and Her Minions") },
          text = "Hexx be dead now, and her altar cold, but the Vilebranch still crawl over that hill like ants on a carcass. They will choose a new priestess soon enough." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Farewell, Primal.", next = "END" },
      },
    },
    tribes = {
      big = true,
      lines = { { id = "tb_default", text = "Because we kept faith. When the old Horde broke, the Witherbark and Vilebranch ran home and spat on the orcs, but we could not forget who we fought beside. So now they call us weaklings, and we call them traitors, and only one of us be right." } },
      choices = {
        { text = "Couldn't you have freed the orcs?", next = "tribes_camps" },
        { text = "Loyalty is worth more than numbers.", next = "BACK", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "Loyalty left you small and hunted. That's a poor bargain.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
      },
    },
    tribes_camps = {
      lines = { { id = "tc_default", text = "We was too few, and the orcs in the camps was too tired to want freedom. I will not pretend that sits easy with me, so I don't ask anyone to pretend it for me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    horde = {
      lines = { { id = "hd_default", text = "We fled to this coast and hid, until word came that a young warchief named Thrall built a new Horde across the sea. I sent my fastest runners, and he took our hands in friendship and in help, and we been Horde ever since." } },
      choices = {
        { text = "Has the Horde kept its word?", next = "horde_word" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde_word = {
      lines = { { id = "hw_default", text = "It sends us you, and the wind riders, and Gorkas, who fishes more than he flies. It be a small help for a small tribe, but it be more than the Witherbark ever gave anyone." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wildhammer = {
      big = true,
      lines = { { id = "wh_default", text = "The dwarves at Aerie Peak hate all trolls the same, Revantusk or Vilebranch, and their gryphons kill our hunters in the hills. Otho wants to send them messages in blood; Markhor wants their birds. I want my mate back first, and then we see." } },
      choices = {
        { text = "The Wildhammer fight the Vilebranch too. Use that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Enemies of the Horde are enemies. Strike them now.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    malkhor = {
      lines = { { id = "mk_default", text = "My guard captain, and Markhor's twin. The Vilebranch did not want him for any altar, so they killed him where he stood and fed him to their beasts, and his post be empty now." } },
      choices = {
        { text = "Who will take his post?", next = "malkhor_job" },
        { text = "Something else.", next = "BACK" },
      },
    },
    malkhor_job = {
      lines = {
        { id = "mj_default", text = "Whoever proves it on the Vilebranch, troll or orc or anything else that bleeds for us. I posted the notice myself, and so far nobody brought me enough heads to be worth the title." },
        { id = "mj_done", when = { questDone = TODO_QUEST("Job Opening: Guard Captain of Revantusk Village") },
          text = "You brought me the heads, so the post be yours in my heart, even if you never stand at our gate. The watchers already call you captain when you not listenin'." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      big = true,
      lines = { { id = "af_default", text = "You did, and I been tryin' to find the right way to repay it since. A tribe this small don't have much gold, so take this: anywhere you hear the name Revantusk, you be family." } },
      choices = {
        { text = "That's payment enough.", next = "BACK", fx = { affinity = 3, align = { honor = 1 }, standing = { revantusk = 2 } } },
        { text = "Family's fine, but gold spends better.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    orc = {
      lines = { { id = "oc_default", text = "Then you know the shame I carry, that we ran and left you behind the walls. Thrall forgave it when he made the pact; I hope you can forgive it too, in time." } },
      choices = {
        { text = "There's nothing to forgive.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Help me pay the humans back, and we're even.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    troll = {
      lines = { { id = "tr_default", text = "The Darkspear be few too, and hated by their cousins, so we understand each other. When you see Vol'jin, tell him the Revantusk still stand on the coast." } },
      choices = {
        { text = "I'll tell him.", next = "BACK", fx = { affinity = 2, standing = { revantusk = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken = {
      lines = { { id = "fs_default", text = "Plenty of use. The Vilebranch fear the dead almost as much as they fear their own priests, and you don't need sleep to stand a watch at midnight." } },
      choices = {
        { text = "Then I'll stand your watch.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the Hinterlands and every tribe in them. Ask, and I tell you what serves Revantusk." } },
    background = { { id = "tp_bg", text = "Revantusk born, Revantusk chief, and Horde since the runners came home with Thrall's word.", next = "horde" } },
    advice = { { id = "tp_ad", text = "Never sleep in the open near Jintha'Alor. The Vilebranch like their meat fresh." } },
    vilebranch = { { id = "tp_vile", text = "Cannibals and traitors who drink what they should bury. Ask Yayo'jin, if you want the long tellin'.", next = "tribes" } },
    _none = { { id = "tp_none", text = "That don't feed the village or free my mate. Ask me somethin' else." } },
  },
}

P:NPC {
  key = "markhor", id = TODO_NPC("Huntsman Markhor"), name = "Huntsman Markhor",
  bible = "bibles/revantusk.md", role = "stablemaster", tier = "quest",
  communities = { "revantusk" }, temper = { "grave" }, values = { "loyal", "devoted" },
  notices = { "class", "race" },

  impression = {
    first = "Huntsman Markhor keeps the stables at Revantusk and judges the wilds as harshly as any judge of men. His twin brother died in the Vilebranch raid, and grief has made him patient, not soft.",
    third = "{name} met Huntsman Markhor, the Revantusk stable master who mourns his twin brother Malkhor.",
  },

  greetings = {
    { id = "g_default", text = "Step easy near the stables, stranger. The beasts be skittish since the raid, and so be I." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Good, for the wilds don't thin themselves." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and your beast walks well beside you. You can stable it here while you go after the Silvermane, if you want." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You smell of the arcane, mon, like hot copper and spoiled milk. Keep it away from my stables; the beasts hate it nearly as much as I do." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Huntsman Markhor, master of the hunt for Revantusk. Many brave trolls been lost to these wilds, and I hunt what hunts us, so the rest of the village can sleep." },
        { id = "h_stalkers", when = { questActive = TODO_QUEST("Stalking the Stalkers") },
          text = "The Silvermane lie low in the brush and wait for a hunter to pass. Hunt them the way they hunt us, slow and quiet, and then all at once." },
        { id = "h_savages", when = { questActive = TODO_QUEST("Hunt the Savages") },
          text = "The savage owlbeasts took more of our warriors than the Wildhammer ever did. Kill them until you cannot stand the bloodshed, and then come back and we weigh what you done." },
        { id = "h_skylord", when = { questActive = TODO_QUEST("Avenging the Fallen") },
          text = "A Skylord be an old gryphon, the kind that breeds the young the dwarves ride against us. Bring me one plume, and I will count it as a hundred." },
        { id = "h_brother", tags = { "news" }, when = { questActive = TODO_QUEST("Separation Anxiety") },
          text = "My brother's bones be somewhere in that pit with the oozes, or in the wolf den near the top. I cannot save his life, but I can still save his spirit." },
        { id = "h_buried", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Separation Anxiety"), days = 3 } },
          text = "Yayo'jin prepared him last night, and we gave him to the earth the proper way. I slept for the first time since the raid, and I have you to thank for it." },
      },
      again = {
        { id = "h_again", text = "What else you need, hunter?" },
        { id = "h_again2", text = "Speak. The beasts be quiet for now." },
      },
      choices = {
        { text = "What hunts in these hills?", next = "wilds" },
        { text = "Tell me about your brother.", next = "brother" },
        { text = "Why hate the gryphons so?", next = "gryphons" },
        { text = "Why do you hate magic?", next = "arcane" },
        { text = "I'd like to stable my pet.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "I learned the arcane, huntsman. It's served me well.", next = "mage", when = { class = "MAGE" } },
        { text = "The Earth Mother keeps the beasts in balance too.", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll hunt for Revantusk.", next = "END", fx = { affinity = 1 } },
      },
    },
    wilds = {
      lines = { { id = "w_default", text = "Silvermane wolves in the brush, savage owlbeasts in the forests, and gryphons overhead, which be the worst, because the dwarves teach them what a troll tastes like." } },
      choices = {
        { text = "How do you hunt the Silvermane?", next = "wilds_silvermane" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wilds_silvermane = {
      lines = { { id = "ws_default", text = "You think like them. They wait downwind and they strike when you look away, so you never look away, and you strike first." } },
      choices = {
        { text = "And Zul'jin? The trolls say he'll return.", next = "wilds_zuljin" },
        { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    wilds_zuljin = {
      lines = { { id = "wz_default", text = "He will, one day; I believe it the way I believe the tide. Until then, we hold our places and keep as many forest trolls alive as we can, and that be work enough for anyone." } },
      choices = {
        { text = "A wise way to wait.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother = {
      big = true,
      lines = { { id = "b_default", text = "Malkhor, my twin, our guard captain. The Vilebranch took him in the same raid as Torntusk's mate, and him they did not keep for any altar; they killed him quick and fed him to their oozes and their wolves." } },
      choices = {
        { text = "Then let me bring his remains home.", next = "brother_bones", fx = { trait = { kind = 1 } } },
        { text = "Do you want revenge?", next = "brother_revenge" },
      },
    },
    brother_bones = {
      lines = { { id = "bb_default", text = "The refuse pit near the top of Jintha'Alor, where the oozes live, and the wolf den beside it. Bring back what you find, and Yayo'jin will prepare him for a proper burial." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother_revenge = {
      lines = { { id = "br_default", text = "Revenge be for the Primal to decide, and she decides it every night. What I want be smaller: my brother in the ground where his spirit can rest." } },
      choices = {
        { text = "The dead deserve rest before revenge.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "His spirit will rest easier with Vilebranch blood spilled.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    gryphons = {
      big = true,
      lines = { { id = "gr_default", text = "The Wildhammer train them to kill trolls, and they do it well. The Skylords breed the young ones, so you kill a Skylord and you kill a hundred hunts before they ever happen." } },
      choices = {
        { text = "Then the Skylords die first.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The beasts aren't to blame. Hunt the riders instead.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arcane = {
      lines = { { id = "a_default", text = "It be the magic of the high elves, who burned our forests and broke the old empire. It sours the beasts and it sours the land, and I don't need a reason past that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "mg_default", text = "Served you, maybe. It never served a troll in this forest, not once. Keep it in your sleeve while you stand by my stables, and we be friends enough." } },
      choices = {
        { text = "Fair enough. I'll keep it sheathed.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "So I hear. Your Earth Mother and my loa might get along, since both of them like a hunter who takes only what the land can spare." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the beasts and the trails. Ask me those, and leave the talk of mojo to Yayo'jin." } },
    background = { { id = "tp_bg", text = "Master huntsman of Revantusk, and once a twin. Now only the first.", next = "brother" } },
    advice = { { id = "tp_ad", text = "Watch the brush, not the path. Nothing in the Hinterlands walks on the path." } },
    _none = { { id = "tp_none", text = "That be no beast I know. Ask somebody else." } },
  },
}

P:NPC {
  key = "yayojin", id = TODO_NPC("Mystic Yayo'jin"), name = "Mystic Yayo'jin",
  bible = "bibles/revantusk.md", role = "vendor", tier = "quest",
  communities = { "revantusk" }, temper = { "mysterious" }, values = { "devout", "proud" },
  notices = { "class", "race" },

  impression = {
    first = "Mystic Yayo'jin sells reagents from a platform at the north end of Revantusk and talks about Zul'jin as if he might walk up the stairs. She told me to mind her goods before she told me her name.",
    third = "{name} met Mystic Yayo'jin, who sells mystical goods at Revantusk Village and hates the cannibal Vilebranch.",
  },

  greetings = {
    { id = "g_default", text = "Mind your feet, mon. You be standin' next to my goods, and they cost more than your boots." },
    { id = "g_back", when = { metBefore = true }, text = "The spirits said you would come back, though they say that about everybody." },
  },

  notice = {
    { id = "n_caster", cat = "class", when = { class = { "PRIEST", "SHAMAN", "WARLOCK", "MAGE", "DRUID" } },
      text = "You use reagents, I can tell by the stains on your fingers. Come buy, then, because nobody up here sells better." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear with mojo in your walk. You know the old ways a little, so maybe you know the price of them too." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mystic Yayo'jin, and mystical goods be my trade. Candles, powders, and the things that make a spell hold, all bought and sold by a troll who knows what each one be for." },
        { id = "h_cousins", when = { questActive = TODO_QUEST("Cannibalistic Cousins") },
          text = "The Vilebranch soothsayers and scalpers gather by the temples of Shaol'watha and Agol'watha, north and east of here. Thin them out, mon, and the hills breathe easier." },
        { id = "h_cousins_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Cannibalistic Cousins"), days = 3 } },
          text = "The smoke over Agol'watha be thinner today, and I know whose work that be. Zul'jin himself would nod at you, and he don't nod for much." },
        { id = "h_malkhor", when = { questDone = TODO_QUEST("Separation Anxiety") },
          text = "I prepared Malkhor for the earth with my own hands. His brother wept the whole night, and that be how it should be." },
      },
      again = {
        { id = "h_again", text = "Somethin' more? The spirits be listenin'." },
        { id = "h_again2", text = "Ask, mon, and don't step on the candles." },
      },
      choices = {
        { text = "Who are the Vilebranch?", next = "vilebranch" },
        { text = "Tell me about Zul'jin.", next = "zuljin" },
        { text = "What do you sell?", next = "goods" },
        { text = "What do the spirits say lately?", next = "spirits", when = { class = { "SHAMAN", "PRIEST" } } },
        { text = "Our loa are the same, mystic.", next = "troll", when = { race = "Troll" } },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "I'll be going.", next = "END" },
      },
    },
    vilebranch = {
      big = true,
      lines = { { id = "v_default", text = "Three tribes live in the Hinterlands, and all we share be that we be trolls and we live here. The Vilebranch eat their own kind and anything else that walks, and they be proud of it." } },
      choices = {
        { text = "Why don't the other tribes stop them?", next = "vilebranch_tribes" },
        { text = "Cannibals have no place among trolls. They must end.", next = "vilebranch_end", fx = { align = { light = 1 } } },
        { text = "Their mojo is strong. I'd learn what they know first.", next = "vilebranch_end", fx = { align = { light = -1 } } },
      },
    },
    vilebranch_tribes = {
      lines = { { id = "vt_default", text = "The Witherbark be no better, and the Revantusk be too few. If Zul'jin were here, he would end the Vilebranch with one flick of his hand, but he be gone and we be left to our own devices." } },
      choices = {
        { text = "Then I'll be your device.", next = "vilebranch_end", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vilebranch_end = {
      lines = { { id = "ve_default", text = "Good. Go north to the temples and bring the fight to them; the soothsayers first, because they whisper the rest into madness." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    zuljin = {
      big = true,
      lines = { { id = "z_default", text = "The warlord of the Amani, who led the forest trolls with the old Horde against the elves. Nobody knows where he walks now, but I tell you, mon, when he comes back the whole forest will know it." } },
      choices = {
        { text = "Do you believe he'll come back?", next = "zuljin_back" },
        { text = "He fought for the old Horde. Thrall leads the new one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A warlord like that is what the trolls need.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    zuljin_back = {
      lines = { { id = "zb_default", text = "I believe it, and Markhor believes it, and half the village burns a candle for it. Believin' costs nothin', mon, and it keeps a small tribe standin' straight." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    goods = {
      lines = { { id = "go_default", text = "Powders for the priests and the shaman, candles for the ones who call on darker things, and herbs I won't name to a stranger. Everything you need, and a few things you shouldn't." } },
      choices = {
        { text = "Which ones shouldn't I need?", next = "goods_dark" },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goods_dark = {
      lines = { { id = "gd_default", text = "Ask me that again after you seen what the Vilebranch keep in their pots up at Jintha'Alor. Then maybe I sell you somethin' to forget it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    spirits = {
      lines = { { id = "sp_default", text = "They say the hill of Jintha'Alor be full of bad blood, and the ground under it be tired of drinkin' it. The rest they say only to me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troll = {
      lines = { { id = "tr_default", text = "Same loa, different drums, mon. The Darkspear sing them faster on the islands, but they come when either of us calls." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the spirits, the tribes and the price of every powder on this coast. Ask, and I tell you one of the three." } },
    background = { { id = "tp_bg", text = "A mystic sells mystery, mon. You don't get mine for free." } },
    advice = { { id = "tp_ad", text = "Never buy a reagent from a Vilebranch. You never know what they mixed in." } },
    vilebranch = { { id = "tp_vile", text = "Cannibals, mon, and proud of it.", next = "vilebranch" } },
    _none = { { id = "tp_none", text = "The spirits don't say nothin' about that, and neither do I." } },
  },
}

P:NPC {
  key = "katoom", id = TODO_NPC("Katoom the Angler"), name = "Katoom the Angler",
  bible = "bibles/revantusk.md", role = "trainer", tier = "quest",
  communities = { "revantusk" }, temper = { "serene" }, values = { "patient", "friendly" },
  notices = { "craft" },

  impression = {
    first = "Katoom the Angler would rather be fishing than doing anything else in the world, and says so with real peace. His only enemies are the turtles that steal his bait.",
    third = "{name} met Katoom the Angler, Revantusk's fishing trainer and an admirer of Nat Pagle.",
  },

  greetings = {
    { id = "g_default", text = "Ah, mon, sit a while. The water be calm, and the fish be thinkin' about bitin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back by the water, mon? Good. Everybody comes back to the water in the end." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You carry a pole, mon, and you hold it like you mean it. Sit down, we talk about bait." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Katoom the Angler. I teach the fishin' and I sell the gear, but mostly I sit right here and fish, which be the most pleasant thing a troll can do." },
        { id = "h_snapjaws", when = { questActive = TODO_QUEST("Snapjaws, Mon!") },
          text = "Them snapjaws got big sweet eyes, mon, but don't trust them. They take my bait and break my line every five minutes, so thin them out for me." },
        { id = "h_gammerita", when = { questActive = TODO_QUEST("Gammerita, Mon!") },
          text = "Gammerita be the big one, the queen of the snapjaws, and she got my best lure in her belly. Get it back, mon, and the fish will love me again." },
        { id = "h_gammerita_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Gammerita, Mon!"), days = 3 } },
          text = "My lure, mon! I been usin' it all mornin', and the fish be pilin' up like they missed it as much as I did." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night fishin' be the best fishin', mon. The water goes quiet and the big ones come up to look at the moon." },
      },
      again = {
        { id = "h_again", text = "What else, mon? The fish be patient." },
        { id = "h_again2", text = "Go on, I be listenin' and fishin' both." },
      },
      choices = {
        { text = "Who taught you to fish?", next = "pagle" },
        { text = "What's wrong with the turtles?", next = "snapjaws" },
        { text = "Doesn't the war worry you?", next = "war" },
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "What's the best bait on this coast?", next = "bait", when = { profession = "Fishing" } },
        { text = "Not now, Katoom.", next = "END" },
      },
    },
    pagle = {
      big = true,
      lines = { { id = "p_default", text = "Nat Pagle, mon, and there be no better hand with a rod on any shore. Everything calm in me, I learned sittin' beside him. You know the name?" } },
      choices = {
        { text = "Where is he?", next = "pagle_where" },
        { text = "Fishing is a waste of a good warrior.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "A peaceful man is rare. Good for you.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    pagle_where = {
      lines = { { id = "pw_default", text = "Somewhere down by Theramore, on an island in the marsh, I hear, fishin' all day and talkin' to nobody. If you want to learn the way, mon, he be the one to show you." } },
      choices = {
        { text = "An island full of Alliance?", next = "pagle_alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pagle_alliance = {
      lines = { { id = "pa_default", text = "A fisherman got no alliance, mon, only a pole. Nat don't care who you march with, so long as you keep your voice down by the water." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    snapjaws = {
      lines = { { id = "s_default", text = "The saltwater snapjaws, mon, big hungry fish vacuums with shells on. And their queen, Gammerita, be the worst thief on the whole coast." } },
      choices = {
        { text = "I'll deal with them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "It worries me, mon, every day. But the Primal fights, and Markhor hunts, and somebody got to catch the fish they eat when they come home." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    bait = {
      lines = { { id = "b_default", text = "Bright lure in the morning, slow bait at night, and never the same spot twice when the snapjaws watchin'. Don't tell Gorkas, mon; he be fishin' for that big grouper with all the wrong things." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know fish, mon. Ask me about fish." } },
    background = { { id = "tp_bg", text = "I fish. Before that, I wanted to fish. That be my whole story, mon.", next = "pagle" } },
    advice = { { id = "tp_ad", text = "Be patient, mon. The fish know when you be in a hurry." } },
    _none = { { id = "tp_none", text = "No idea, mon. Ask me about fish instead." } },
  },
}

P:NPC {
  key = "lard", id = TODO_NPC("Lard"), name = "Lard",
  bible = "bibles/revantusk.md", role = "innkeeper", tier = "quest",
  communities = { "revantusk" }, temper = { "simple" }, values = { "friendly", "generous" },
  notices = { "weary" },

  impression = {
    first = "Lard is an ogre who keeps the inn at Revantusk, keeps the peace, and sells fish. He is enormous and gentle, and mostly worried about his lunch.",
    third = "{name} met Lard, the ogre innkeeper of Revantusk Village.",
  },

  greetings = {
    { id = "g_default", text = "Hello, little one! Lard has beds, and Lard has fish, and nobody makes trouble while Lard is watchin'." },
    { id = "g_home", when = { homeInn = { "Revantusk Village" } }, text = "Little one come home! Lard keep bed warm for you, and nobody sit on it, because Lard tell them no." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Somebody hit you with big stick, like they hit Lard. You sit down and eat, and then you feel better." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lard keep the inn for the trolls, and Lard keep the peace, because nobody want to fight when Lard is standin' there. Lard is very big, so it work good." },
        { id = "h_lunch", tags = { "news" }, when = { questActive = TODO_QUEST("Lard Lost His Lunch") },
          text = "Lard's picnic got ruined by Vilebranch with big sticks, and Lard ran so fast he left the whole basket behind. Now Lard's belly is makin' noises like a storm." },
        { id = "h_lunch_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Lard Lost His Lunch"), days = 3 } },
          text = "Lard still thinkin' about that lunch you bring back! It was the best haunch Lard ever ate, and Lard eat many haunches." },
      },
      again = {
        { id = "h_again", text = "What else little one want? Lard listenin'." },
        { id = "h_again2", text = "You still here. Good, Lard like company." },
      },
      choices = {
        { text = "Make this inn my home.", next = "BUSINESS" },
        { text = "An ogre among trolls?", next = "ogre" },
        { text = "Where's your secret spot?", next = "spot" },
        { text = "How do you keep the peace?", next = "peace" },
        { text = "Ogres are enemies of the Horde.", next = "orc", when = { race = "Orc" } },
        { text = "Goodbye, Lard.", next = "END" },
      },
    },
    ogre = {
      lines = { { id = "o_default", text = "Trolls is nice to Lard. They give Lard roof and fish and don't make Lard fight for chief, so Lard stay. Other ogres not nice like trolls." } },
      choices = {
        { text = "Do you miss them?", next = "ogre_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ogre_miss = {
      lines = { { id = "om_default", text = "Lard not miss gettin' hit on the head every mornin'. Lard miss the singin' a little, but trolls sing too, and they sing better." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    spot = {
      lines = { { id = "s_default", text = "Is secret, little one! But Lard tell you, because you is nice. It is island to the north, past the beach, and nobody go there except Lard and now the mean Vilebranch." } },
      choices = {
        { text = "I'll get your lunch back.", next = "spot_promise", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spot_promise = {
      lines = { { id = "sp_default", text = "You do that for Lard? Then Lard make you a picnic basket of your own, a little one, for a little one. Watch out for the Vilebranch, because they hit hard." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    peace = {
      big = true,
      lines = { { id = "p_default", text = "When two trolls get angry in Lard inn, Lard stand between them and look down. Mostly they stop, and if they don't stop, Lard pick them up and put them outside." } },
      choices = {
        { text = "That's a fine way to keep order.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Let them fight. It settles things faster.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc = {
      lines = { { id = "oc_default", text = "Some ogres, yes, the ones at Hammerfall and in the mountains. Lard is not those ogres; Lard only want fish, and a nap, and no fightin'." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Lard know fish, and beds, and who is fightin'. Ask Lard." } },
    background = { { id = "tp_bg", text = "Lard was ogre in the mountains. Now Lard is ogre by the sea, which is better.", next = "ogre" } },
    advice = { { id = "tp_ad", text = "Always eat lunch before Vilebranch find you. Lard learn that the hard way." } },
    _none = { { id = "tp_none", text = "Lard not know that. Lard know fish, though!" } },
  },
}

P:NPC {
  key = "slagtree", id = TODO_NPC("Smith Slagtree"), name = "Smith Slagtree",
  bible = "bibles/revantusk.md", role = "blacksmith", tier = "quest",
  communities = { "revantusk" }, temper = { "cheerful" }, values = { "practical", "grateful" },
  notices = { "kit", "race" },

  impression = {
    first = "Smith Slagtree is an orc who mends anything broken at Revantusk's forge, while you wait. His best tools were a gift from a gnome who once saved his life, and the Vilebranch stole them.",
    third = "{name} met Smith Slagtree, the orc smith of Revantusk Village, who lost a treasured set of tools to the Vilebranch.",
  },

  greetings = {
    { id = "g_default", text = "Broken blade? Cracked shield? Bring it to the anvil, friend, and pull up a stump while I work." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the anvil! Let's see what the Hinterlands did to your gear this time." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at the state of that armor! You can't fight in that, friend, so hand it over before something kills you." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! You've got nothing to fear from me, little one, because one of your kind saved my life." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Smith Slagtree, and I keep the forge for Revantusk. Nobody leaves this village with a split shield while I've got coals in the forge." },
        { id = "h_tools", tags = { "news" }, when = { questActive = TODO_QUEST("Vilebranch Hooligans") },
          text = "Those Vilebranch thieves took my tools in the raid, the good set. Try the temples up in the northeast, or Skulk Rock, and bring them back, because they mean the world to me." },
        { id = "h_tools_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Vilebranch Hooligans"), days = 3 } },
          text = "My tools! I still can't believe you found them. I've been using them all day just to feel the weight of them in my hands again." },
      },
      again = {
        { id = "h_again", text = "What else? The forge is hot." },
        { id = "h_again2", text = "Ask away; I can talk and hammer at once." },
      },
      choices = {
        { text = "Mend my gear.", next = "BUSINESS" },
        { text = "A gnome gave you tools?", next = "gnome" },
        { text = "What's an orc doing with trolls?", next = "village" },
        { text = "What do the Vilebranch want with tools?", next = "thieves" },
        { text = "My people have no love for gnomes.", next = "orc_gnome", when = { race = { "Orc", "Troll", "Scourge" } } },
        { text = "Later, smith.", next = "END" },
      },
    },
    gnome = {
      big = true,
      lines = { { id = "gn_default", text = "When I was young and stupid, a gnome pulled me out of trouble that should have killed me, and then he gave me his own tools. I never knew his name, and I've used his hammer every day since." } },
      choices = {
        { text = "What happened?", next = "gnome_story" },
        { text = "A debt to an enemy is still a debt.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "He was Alliance. Don't get sentimental.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
      },
    },
    gnome_story = {
      lines = { { id = "gs_default", text = "That's mine to keep, friend. I'll just say I was bleeding, and he was small, and he didn't have to stop. Most folk wouldn't have, on either side." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    village = {
      lines = { { id = "v_default", text = "Every village needs a smith, and the Revantusk kept faith with the Horde when nobody else did. Seemed right that an orc kept faith with them back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thieves = {
      lines = { { id = "th_default", text = "Nothing; they don't know iron from bone. They took them because they were shiny and they were mine, which is the Vilebranch all over." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orc_gnome = {
      lines = { { id = "og_default", text = "Neither did I, till one of them saved my hide. I'm not asking you to like them, friend; I'm asking you to bring my tools back." } },
      choices = {
        { text = "Fair enough. I'll find them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Iron, steel, and what the Vilebranch broke this week. Ask." } },
    background = { { id = "tp_bg", text = "A smith since I was young enough to burn myself every day. A gnome's hammer taught me most of it.", next = "gnome" } },
    advice = { { id = "tp_ad", text = "Mend before you need to, not after. Broken armor never warns you." } },
    _none = { { id = "tp_none", text = "Can't hammer that into shape for you, friend. Ask somebody else." } },
  },
}

P:NPC {
  key = "otho", id = TODO_NPC("Otho Moji'ko"), name = "Otho Moji'ko",
  bible = "bibles/revantusk.md", role = "vendor", tier = "quest",
  communities = { "revantusk" }, temper = { "spiteful" }, values = { "proud", "loyal" },
  notices = { "race" },

  impression = {
    first = "Otho Moji'ko sells cooking supplies and dreams of terrifying Aerie Peak. He spits when he says the word Wildhammer, and he says it often.",
    third = "{name} met Otho Moji'ko, the Revantusk cook's supplier who wants to send the Wildhammer a message.",
  },

  greetings = {
    { id = "g_default", text = "You hungry, mon, or you lookin' for trouble? I sell for the first and I got plans for the second." },
    { id = "g_back", when = { metBefore = true }, text = "There you be, mon. You ready to make some dwarves very unhappy?" },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = { "Orc", "Troll" } },
      text = "Good, a strong one. The dwarves at Aerie Peak gonna remember your face, mon, if you do what I ask." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Otho Moji'ko. I sell the spices and the salt and the things a cook can't do without, but what I really want be sendin' the Wildhammer a message they never forget." },
        { id = "h_elves", when = { questActive = TODO_QUEST("Message to the Wildhammer") },
          text = "The Wildhammer be makin' friends with the high elves at Quel'Danil Lodge. You go up there and leave the elves where the dwarves will find them, mon." },
        { id = "h_feathers", when = { questActive = TODO_QUEST("Another Message to the Wildhammer") },
          text = "Gryphon feathers, mon, as many as you can pull. The dwarves love their birds like a troll loves his mate, and that be exactly why we use them." },
        { id = "h_spear", tags = { "news" }, when = { questActive = TODO_QUEST("The Final Message to the Wildhammer") },
          text = "You got the spear, mon. Plant it by the well in the middle of Aerie Peak, drive it deep, and then run, because they gonna be very, very angry." },
        { id = "h_spear_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("The Final Message to the Wildhammer"), days = 3 } },
          text = "I wish I coulda seen their faces, mon! Tell me again how loud the Thane yelled, and don't leave nothin' out." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Talk fast." },
        { id = "h_again2", text = "Go on. I be thinkin' up the next message anyway." },
      },
      choices = {
        { text = "Why hate the Wildhammer so much?", next = "dwarves" },
        { text = "What kind of message?", next = "message" },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "I've been to Aerie Peak. They're tough.", next = "peak", when = { questDone = TODO_QUEST("The Final Message to the Wildhammer") } },
        { text = "The Darkspear have their own grudges, Otho.", next = "troll", when = { race = "Troll" } },
        { text = "Not today, Otho.", next = "END" },
      },
    },
    dwarves = {
      lines = { { id = "d_default", text = "They hunt us from the sky, mon, on beasts they teach to kill trolls. They don't care if we be Revantusk or Vilebranch; to them a troll be a troll, and that be all the reason I need." } },
      choices = {
        { text = "And the high elves?", next = "dwarves_elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarves_elves = {
      lines = { { id = "de_default", text = "The Highvale elves at Quel'Danil, old friends of the dwarves. Elves and trolls been killin' each other since before the dwarves crawled out of their mountains, so it be no surprise to me who they side with." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    message = {
      big = true,
      lines = { { id = "m_default", text = "First the elves, so they know their friends can't protect them. Then the gryphons, so they know their birds can't protect themselves. Then a spear in the middle of their town, so they know nothin' can." } },
      choices = {
        { text = "Fear is a weapon. I'll carry it.", next = "message_go", fx = { align = { honor = -1 } } },
        { text = "I'd rather fight their warriors face to face.", next = "message_go", fx = { align = { honor = 1 } } },
        { text = "Does the Primal approve?", next = "message_primal" },
      },
    },
    message_go = {
      lines = { { id = "mg_default", text = "Either way they bleed, mon, and either way they remember. Come back when you ready to start." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    message_primal = {
      lines = { { id = "mp_default", text = "The Primal got her mind on her mate, and she don't stop me. That be as good as yes in Revantusk, mon." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    peak = {
      lines = { { id = "pk_default", text = "Tough, sure, but they ain't stupid, mon. Now they know a troll can walk right into the middle of their town, and they gonna sleep a little worse every night." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { revantusk = 1 } } } },
    },
    troll = {
      lines = { { id = "tr_default", text = "Everybody got grudges, mon, but the Darkspear keep theirs on the islands. Mine be right up the hill, with gryphons on it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know cookin' and I know grudges, mon. Ask about either." } },
    background = { { id = "tp_bg", text = "Revantusk all my life, mon, and angry at the dwarves for most of it.", next = "dwarves" } },
    advice = { { id = "tp_ad", text = "Salt your meat and watch the sky. The gryphons like a troll that don't look up." } },
    _none = { { id = "tp_none", text = "That don't cook and it don't scare dwarves, so I don't care, mon." } },
  },
}

P:NPC {
  key = "gorkas", id = TODO_NPC("Gorkas"), name = "Gorkas",
  bible = "bibles/revantusk.md", role = "flightmaster", tier = "service",
  communities = { "revantusk" }, temper = { "grumpy" }, values = { "patient" },
  notices = { "race" },

  impression = {
    first = "Gorkas is the wind rider master at Revantusk, and he spends more time fishing off the pier than tending his beasts. He's waiting for one particular grouper and doesn't care who knows it.",
    third = "{name} met Gorkas, the orc wind rider master at Revantusk, who fishes off the pier between flights.",
  },

  greetings = {
    { id = "g_default", text = "Quiet! You'll scare the fish. Fine, what do you want, a wind rider?" },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still no grouper. Where are you flying today?" },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Tread soft on the pier, tauren. The boards are older than I am, and the fish feel every step." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gorkas, wind rider master. The beasts fly to Tarren Mill, Hammerfall and the Undercity, and in between flights I fish off this pier until I catch the biggest grouper on the coast." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Wind riders sleep, the trolls sleep, and the grouper is somewhere out there laughing at me. Where do you need to go?" },
      },
      again = {
        { id = "h_again", text = "Anything else? The line's twitching." },
        { id = "h_again2", text = "Speak up, but quietly." },
      },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "What grouper?", next = "grouper" },
        { text = "How do the wind riders like the coast?", next = "riders" },
        { text = "Goodbye, Gorkas.", next = "END" },
      },
    },
    grouper = {
      lines = { { id = "gp_default", text = "A monster of a fish that's broken every line I own. Katoom says I use the wrong bait, but Katoom says that about everyone, so I stopped listening." } },
      choices = {
        { text = "Maybe Katoom is right.", next = "grouper_katoom", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grouper_katoom = {
      lines = { { id = "gk_default", text = "Maybe he is, but I'll catch it my way or not at all. An orc has to have something he's stubborn about, and mine is a fish." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    riders = {
      lines = { { id = "r_default", text = "They hate the gryphons, and the gryphons hate them, so I keep them low along the coast till they're well past Aerie Peak. The salt doesn't bother them, but the dwarves do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Routes, winds and fish. Ask about one of those." } },
    background = { { id = "tp_bg", text = "Orgrimmar sent me to keep the wind riders. Nobody said I couldn't fish." } },
    advice = { { id = "tp_ad", text = "Don't fly over Aerie Peak. The dwarves shoot first and ask about your business never." } },
    _none = { { id = "tp_none", text = "No idea. Let me fish." } },
  },
}
