-- The Emerald Sanctuary: the Emerald Circle's camp in southern Felwood. Voice: bibles/felwood.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "eridan", id = TODO_NPC("Eridan Bluewind"), name = "Eridan Bluewind",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "hopeful" }, values = { "devout", "patient" },
  notices = { "class", "race" },

  impression = {
    first = "Eridan Bluewind insists there's still green under Felwood's sickness, and she plants a seed every morning to prove it. Her hope is stubborn enough to be almost catching.",
    third = "{name} met Eridan Bluewind of the Emerald Circle, who believes Felwood can be healed.",
  },

  greetings = {
    { id = "g_green", text = "Ishnu-alah, traveler. Look past the sickness, if you can, for there's still green under it, as there was before the Legion ever came." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to Felwood, when most don't once they've seen it. Thank you." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and while you were gone three of my seeds came up green, which I'll count as a welcome. Thank you for coming back to Felwood." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since you were last here, and I mean that the way I'd say it of a sapling, with gladness. Felwood needs those who grow stronger instead of sicker." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "One of the Circle came back from speaking with you smiling, and there's little enough to smile at in Felwood. Whatever you said was a small green thing in all this sickness." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Can you feel it? The forest is still alive under the poison, and it's screaming, but it's alive." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "One of our own! You'll remember this forest as it was, or your parents will, so help me make it that again." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Some druids say Felwood is lost and we should let it burn itself out. I don't believe it, but I want to know what a stranger sees, so tell me: can Felwood be saved?" },
      },
      choices = {
        { text = "Yes. Your seeds will take root, given time.", next = "op_r1", fx = { affinity = 2, align = { light = 1 }, opinion = { felwood_hope = "hope" } } },
        { text = "No. Burn it all and plant fresh.", next = "op_r2", fx = { affinity = -1, align = { light = -1 }, opinion = { felwood_hope = "lost" } } },
        { text = "Kill the satyrs first. The trees can wait.", next = "op_r3", fx = { trait = { stern = 1 }, opinion = { felwood_hope = "war_first" } } },
        { text = "I can feel the land still breathing under the fel.", next = "op_r4", fx = { affinity = 1, opinion = { felwood_hope = "hope" } }, when = { class = "DRUID" } },
        { text = "I couldn't say yet.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Time is something my people used to have in abundance. I'll make do with what's left, and keep planting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Burning is what the Legion did here. I'll not finish their work for them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "The Shadow Council would agree that the trees can wait, which is part of why I don't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "So you feel it too. Then it's not only my hope talking, and that matters more than you know." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_eridan = {
      big = true,
      lines = { { id = "xpt_eridan_default", text = "I think it has to be, because if a forest this old can be poisoned past saving, then nothing is safe anywhere. The demons left their filth in the water and the roots, and every seed I plant that comes up green is one small argument against despair." } },
      choices = {
        { text = "Keep planting. Somebody has to.", next = "BACK", reply = "Somebody does, and I'm glad it's not only me. Come back in a season and count my sprouts with me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some places are lost. Burn it and start over.", next = "BACK", reply = "Burning is what the Legion did to us, and the forest is still paying for it. I'll keep planting, if you don't mind.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_st = {
      big = true,
      lines = { { id = "xcl_st_default", text = "Because Eranikus, Ysera's consort, was set to guard that temple, and something in the long watch poisoned his sleep, and a poisoned dreamer reaches into every dream that touches his, which is not so different from what the fel did to these trees." } },
      choices = {
        { text = "Then he must be redeemed. A dragon's mind can be healed.", next = "BACK", reply = "I hope so, with all my heart, and Ysera must hope it too. Be gentle with him, if you can.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A corrupted dragon should be destroyed before he spreads it.", next = "BACK", reply = "It may come to that, and the Circle has said as much, quietly. But I'd want every other road tried first.", fx = { align = { light = -1 } } },
        { text = "Could Felwood be healed the same way?", next = "xcl_st2" },
      },
    },
    xcl_st2 = {
      lines = { { id = "xcl_st2_default", text = "Slowly, with cleansed water and patient hands, which is the only way anything is healed here. I plant a seed every morning and most of them die, but the ones that live are proof the land remembers what it was." } },
      choices = {
        { text = "Then keep planting, and I'll keep fighting.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Thin their numbers, and find out what Xavaric, their leader, is planning, if you can get close enough. Every satyr that falls is a little less poison in the soil, and quick, quiet work suits me better than a war band trampling all my seedlings." } },
      choices = {
        { text = "I'll strike quickly and spare your seedlings.", next = "BACK", reply = "Thank you. The last warrior through here trampled a whole row, and I'm still replanting it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll do it my way, seedlings or not.", next = "BACK", reply = "Then do it your way, and I'll replant behind you. I'm used to it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I plant a seed every morning, and some mornings one of them sprouts, and that's all the proof I need. The Jadefire satyrs and the corruption in the streams fight me every step, but your Light shows that a dark place can hold something bright, and I think the forest is the same." } },
      choices = {
        { text = "I believe you. The Light and the land can both heal.", next = "BACK", reply = "They can, and they will, I'm sure of it. Come and see the oak by the well; it put out two green leaves last week.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some things are too far gone. Burn the rot away.", next = "BACK", reply = "Burning is the satyrs' way, not ours, and I won't follow them into it. Give the seeds a little more time.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Jadefire satyrs, mostly, and the fel that leaks from their camps into the soil. A warrior can't heal the ground, but every satyr you put down in Jadefire Glen is one less hand pouring poison into it." } },
      choices = {
        { text = "Then I'll fight them to protect your work, Eridan.", next = "BACK", reply = "Thank you. The satyrs dig up my seedlings just to watch me plant them again, so you'll be doing me a great kindness.", fx = { align = { honor = 1 } } },
        { text = "I'll fight them for the bounty. The seedlings are your business.", next = "BACK", reply = "Fair enough, the bounty's honestly earned. I'll be glad of you anyway, even if you never look at a single seedling.", fx = { align = { honor = -1 } } },
        { text = "Something else, Eridan.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "One, a fawn by the sanctuary's edge that drank from our cleansed water and grew up with clear eyes. It's a small thing, but I count it, because if one fawn can be saved, then the forest is only sick, not dead." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "One, a fawn by the sanctuary's edge that drank from our cleansed water and grew up with clear eyes. And look at {pet}, healthy and bright-eyed in the middle of Felwood! That does my heart more good than you know." },
      },
      choices = {
        { text = "Then there's hope for the rest. I'll help you find it.", next = "BACK", reply = "Thank you, and I'll show you where she grazes, if you like. One fawn is how every herd begins.", fx = { align = { light = 1 } } },
        { text = "One fawn proves nothing. The forest's beasts are lost.", next = "BACK", reply = "It proves one, and that's a beginning. I'd rather count one than none.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I have never seen fel touch a living thing and leave it better, and I have looked, because I am the hopeful sort. Perhaps a warlock can hold it without spilling it, but Felwood is what happens when even one hand slips." } },
      choices = {
        { text = "Then I'll hold it carefully, and never here.", next = "BACK", reply = "Thank you, and I'll believe you, because I'm the hopeful sort. Just never here, please, not even a little.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A slip is the price of real power.", next = "BACK", reply = "And the forest pays it, every time. I'd ask you to be the one who doesn't slip.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll keep clear of your seedlings.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They corrupt the ancients of the forest and turn their own hearts to fel, and every glade they touch withers to ash. Xavaric leads them from Jadefire Run, and I think an arcane eye might see how his magic spreads where mine only sees the damage it leaves behind." } },
      choices = {
        { text = "Then let's root Xavaric out together.", next = "BACK", reply = "Together, yes. Xavaric has hidden in Jadefire Run long enough, and the ancients there were my friends.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Strike his glades by surprise and leave nothing standing.", next = "BACK", reply = "Surprise I'll grant you, but leave the ancients standing if you can. Some of them might still be saved.", fx = { align = { honor = -1 } } },
        { text = "I'll look closer when I'm out there.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I don't know, and I'd love to find out, because nothing I've tried has made one take yet. The corruption is in the roots and the water both, so perhaps it needs a blessing as much as a salve, or perhaps I'm only hoping out loud again." } },
      choices = {
        { text = "Keep planting, Eridan, and I'll say a prayer over the rows.", next = "BACK", reply = "Thank you, and I'll plant a row just for your prayers. We'll see which one takes first.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Blessings won't touch the satyrs. Kill them, and the soil follows.", next = "BACK", reply = "Perhaps it does, and I'll not argue the satyrs need killing. But the soil will need more than that.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I don't know, and that's why I asked. The Circle tends the land through the Emerald Dream and your faith reaches for something else entirely, but every seed I plant here dies of the same poison, so I'm in no position to refuse help." } },
      choices = {
        { text = "Anything that heals is worth trying. I'll pray over them.", next = "BACK", reply = "Thank you, and I'll mark the ones you pray over. If one of them takes, I'll call it a miracle.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers are for people. Your seeds will have to fend for themselves.", next = "BACK", reply = "They usually do, poor things, and I'll go on helping them. You don't mind if I pray over them myself, then?", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_water", when = { questDone = TODO_QUEST("Cleansed Water Returns to Felwood") }, text = "Greta tells me you carried cleansed water back to the forest for her, and that the soil drank it gladly. The Circle works best when we work together, and you have helped both of us now." },
        { id = "h_pt_eridan", tags = { "news" }, when = { party = { class = "DRUID" } },
          text = "You've brought a druid with you! Ask {companion} to put a hand on the soil here, because I'd like a second opinion on whether I'm only imagining the green coming back." },
        { id = "h_cl_st", tags = { "news" }, when = { cleared = "The Temple of Atal'Hakkar" }, text = "The Dream feels a little less troubled tonight, and they say you went all the way to the bottom of the Sunken Temple. If the green dragons there are less tormented for it, you've done Felwood a kindness without setting foot in it." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Jadefire", min = 30 } },
          text = "The Jadefire satyrs are fewer, and I swear one of my seedlings sprouted the morning after you came back from their camps. I'll not call it a coincidence." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You move so quietly the satyrs won't hear you coming, which is good, because the Jadefire satyrs wear the corruption like a crown, and I'd love to see someone knock it off." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! I won't ask you to plant anything, but I'll show you the seedlings if you've a moment, because there's green under all this sickness, and I want someone else to see it too." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! I won't ask you to plant seeds, though I'll warn you that mending a forest is mostly clearing away what tries to kill the seedlings." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You've seen what the corruption does to the beasts, then, and I'd love to hear whether any of them are getting better." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock at the Emerald Sanctuary. The jadefire satyrs burn with the same flame you carry, and I'll ask you to keep it far from my seedlings while you're here." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! I wonder whether your arcane eye sees what the Jadefire satyrs are doing to the land, because to me it only looks like sickness and rot." },
        { id = "h_default", key = true,
          text = "I am Eridan Bluewind, of the Emerald Circle. Felwood was green once, part of Ashenvale for ten thousand years, and under all of this, somewhere, it still is, and we mean to find it again, even if I must plant a seed every morning that never takes." },
        { id = "h_jadefire", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Corruption of the Jadefire") }, { questActive = TODO_QUEST("Further Corruption") } } },
          text = "The Jadefire satyrs wear the corruption like a crown, so thin their numbers; every one that falls is a little less poison in the soil." },
        { id = "h_flute", when = { questActive = TODO_QUEST("Flute of Xavaric") },
          text = "Xavaric carries a flute, and I want it out of satyr hands, because what it does in theirs I'd rather not see again." },
        { id = "h_ancients", when = { questActive = TODO_QUEST("Felbound Ancients") },
          text = "The ancients guarded this forest once, and now the corruption holds them, and it hurts to look at them. Do what must be done." },
        { id = "h_purified", when = { questDone = TODO_QUEST("Purified!") },
          text = "Purified... say it again, please, for I've waited a long time to hear that word in Felwood." },
        { id = "h_linken", when = { heardLine = "linken.h_default" },
          text = "You've met Linken, the gnome in Un'Goro who lost his memory? If his trail ever leads you back to Felwood, come and tell me how he fares." },
        { id = "h_rest", when = { metBefore = true },
          text = "I planted a seed by the sanctuary's edge this morning, and it won't take, but I plant one every morning anyway. One day one will." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, at the Emerald Sanctuary! The druids here mend the soil, but I've always thought a priest mends something deeper, so you are very welcome among my seedlings." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, at the Emerald Sanctuary. You're welcome so long as you help things grow, and I'll confess I'm curious what a prayer might do for my seedlings." },
      },
      again = { { id = "h_again", text = "What else? Softly, please; the sanctuary listens, and so does Elune." } },
      choices = {
        { text = "Can Felwood really be saved?", next = "op_ask" },
        { text = "What happened to Felwood?", next = "what" },
        { text = "I've heard of the Emerald Circle.", next = "circle" },
        { text = "Why plant seeds that won't grow?", next = "seeds" },
        { text = "I can feel the sickness in the ground.", next = "druid", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "Is fel always poison, or only in the wrong hands?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The satyrs seem to be ruining the land.", next = "xmage", when = { class = "MAGE" } },
        { text = "Could a priest's prayer help your seedlings take root, Eridan?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What kills your seedlings, Eridan?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Some of Felwood's beasts must recover, Eridan.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you think Felwood can be healed, Eridan?", next = "xpt_eridan", when = { party = { class = "DRUID" } } },
        { text = "I came for the satyrs. They were our kin once.", next = "xorig_satyr", when = { origin = "nightelf_satyr_hunter" } },
        { text = "I'll help heal it.", next = "END", reply = "Thank you, and the seedlings will remember you, I think. Come back in a season and see how many made it.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Could a priest's prayers help your seedlings take?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you really believe Felwood can heal, Eridan?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would you have me do to the Jadefire satyrs, Eridan?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why would the Sunken Temple matter to the Emerald Circle?", next = "xcl_st", when = { cleared = "The Temple of Atal'Hakkar" } },
        { text = "I'm here for the satyrs, not for the trees.", next = "END", reply = "Then go and thin them, and the trees will be grateful anyway, even if you never look at one.", fx = { align = { light = -1 } } },
      },
    },
    xorig_satyr = {
      big = true,
      lines = {
        { id = "xsa_default", text = "They were, and that is what makes it so hard, because every Jadefire you bring down was somebody's ancestor long before it was a beast. I won't ask you to stop, for the forest needs them thinned, but do you ever wonder whether any of them remember who they were?" },
      },
      choices = {
        { text = "They chose the Legion. They're owed no pity.", next = "BACK", reply = "Some did, and some were dragged along, and I can't tell which from here. Strike them down, but I'll grieve them anyway.", fx = { align = { light = -1 } } },
        { text = "I hope some part of them is glad to be freed.", next = "BACK", reply = "I hope so too. I like to think there's an elf in there somewhere, glad to finally rest.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    what = {
      big = true,
      lines = {
        { id = "w_default", text = "It was the demons' war. To weaken Hyjal's defenders, a dreadlord poisoned the forest around the mountain with a cursed skull. The beasts twisted and the ancients turned, and the soil went sour under them, and it has not stopped." },
      },
      choices = {
        { text = "Surely it can be undone.", next = "what_undone" },
        { text = "I'll help heal it.", next = "BACK", reply = "Thank you, and the forest will feel it, I'm sure. Start at the springs; they're the easiest to cleanse.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Some places are past saving, and this is one of them.", next = "BACK", reply = "It may be, but I can't stop trying, not while a single seed takes. Come back and see, someday.", fx = { align = { light = -1 } } },
      },
    },
    what_undone = {
      lines = { { id = "wu_default", text = "Slowly, and not in my lifetime, perhaps, and mine is long. But every satyr gone and every spring cleansed is a step, and healing is mostly stubbornness." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    circle = {
      lines = { { id = "c_default", text = "We are those of the Cenarion Circle, and friends of it, who came to Felwood to fight for it, kaldorei and tauren side by side. The forest doesn't ask which." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    seeds = {
      lines = { { id = "s_default", text = "Because the day one takes, I want to have been here. And because a druid who stops planting has already lost." } },
      choices = {
        { text = "Do you ever stop believing one will take?", tag = "Persuade", next = "seeds_doubt",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = { "DRUID", "PRIEST" } }, { trait = "kind" } } } },
          fail = { next = "seeds_hope", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    druid = {
      lines = { { id = "d_default", text = "Then you know why we stay. It doesn't hurt less with time; it only hurts more honestly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    seeds_doubt = {
      lines = {
        { id = "sd_default", text = "Most mornings, and I've never said so inside the sanctuary. I plant the seed because my hands remember how to hope even when the rest of me has forgotten, and I've decided that has to be enough." },
      },
      choices = {
        { text = "It is enough.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then I'll plant one with you tomorrow.", next = "BACK", fx = { affinity = 3 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    seeds_hope = {
      lines = {
        { id = "sh_default", text = "Never, traveler, and I'd thank you not to put the thought in my head. Felwood has enough poison in it already." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The forest still speaks to the Circle, even poisoned, if we listen gently enough. Ask me about any of these." },
    },
    background = { { id = "tp_ba", text = "I'm a druid of the Circle, sent where the land hurts most, and Felwood hurts most.", next = "what" } },
    advice = { { id = "tp_ad", text = "Don't drink from the streams, don't eat the fruit, and don't trust anything that glows green." } },
    cenarion_circle = { { id = "tp_circle", text = "The Emerald Circle is the Cenarion Circle's hands in Felwood, and our hands are tired, but they're still working." } },
    emerald_dream = {
      { id = "tp_emerald_dream", text = "The Dream remembers Felwood as it was, green and quiet, and I go there in sleep to remind myself what we're fighting for. Waking up here is the hard part." },
      { id = "tp_emerald_dream2", when = { class = "DRUID" }, text = "You've walked the Dream's edge, then, so you know what this forest is meant to be. Help me make the waking world a little closer to it." },
    },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are the only furbolgs left uncorrupted, and they guard their tunnels like their lives depend on it, which they do. Earn their trust and it's yours for good." } },
    burning_legion = { { id = "tp_burning_legion", text = "The fel that poisons this forest came from the Legion, and the Shadow Council keeps it fed at Jaedenar. Every spring we cleanse, they foul another." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil is just across the gorge on Hyjal, and Felwood was its forest once. I'd like it to be again, before I die." } },
    _none = { { id = "tp_none", text = "I don't know, but the forest might, if you ask it gently, as my people have always asked." } },
  },
}

P:NPC {
  key = "greta", id = TODO_NPC("Greta Mosshoof"), name = "Greta Mosshoof",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "wary" }, values = { "protective", "wise" },
  notices = { "class", "race" },

  impression = {
    first = "Greta Mosshoof keeps a stone from Mulgore in her pocket for when the forest grows too loud. She is wary of anyone who might be tempted by the power here, and she says so.",
    third = "{name} met Greta Mosshoof of the Emerald Circle, who fights Felwood's corruption from the Emerald Sanctuary.",
  },

  greetings = {
    { id = "g_welcome", text = "The Emerald Circle welcomes you, and the Earth Mother with it. Stay on the path, and don't touch anything that glows." },
    { id = "g_back", when = { metBefore = true }, text = "Still clean? Good; Felwood gets into people, so watch for it." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I'd like a look at your eyes before you come any closer, because Felwood has a way of following people home." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear someone here caught you in a lie, and that's the first thing I watch for, because the forest's rot often starts with a small one. Stay honest, and stay on the path." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "Word is you put fear into someone at the sanctuary, and I'll ask you plainly not to do it again, because we have enough frightened things in Felwood already." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You wield the same power that did this to the forest. I'll accept your help, but I'll be watching while I do." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the Earth Mother, here in all this poison! She'd weep to see it, so help me dry her tears." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "It tempts everyone, and it would tempt you twice, because you know what it is to be made into something you never chose. Keep hold of the Light the way I keep hold of my stone from Mulgore, and the forest won't have you." } },
      choices = {
        { text = "The Light will keep me clean. I won't let go.", next = "BACK", reply = "Good, and hold it tightly, for Felwood will test you. It tested the Shadow Council too, and they failed.", fx = { align = { light = 1 } } },
        { text = "Power is power. I'll take what serves me.", next = "BACK", reply = "That's how the Council began, friend, and you know where they are now. Be careful.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Safer, but not safe, because I hear the Shadow Council at Jaedenar tempts warriors with strength instead of knowledge, and some take it. They come back with green eyes and a bigger swing, and they stop being themselves soon after." } },
      choices = {
        { text = "I'll trust my own strength. The fel can keep its gifts.", next = "BACK", reply = "Good, and the Earth Mother will be glad of it. I've watched three warriors walk into Jaedenar for that strength, and none came back as themselves.", fx = { align = { light = 1 } } },
        { text = "If that strength beats the Council, maybe it's worth the price.", next = "BACK", reply = "That is what they all say, the first time. Be careful what you pay with.", fx = { align = { light = -1 } } },
        { text = "Something else, Greta.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Made them hungry and angry and wrong, like the felpaw wolves who'll chase you to the edge of the sanctuary and then stand there snarling at the trees. I pity them, but I won't let one near the camp, and I'd ask you to do the same." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Made them hungry and angry and wrong, like the felpaw wolves who'll chase you to the edge of the sanctuary and then stand there snarling at the trees. Keep {pet} close to you while you're in the forest. I've seen beasts turn after a single night of drinking from the wrong stream." },
      },
      choices = {
        { text = "I'll keep my beast close and leashed. Felwood demands care.", next = "BACK", reply = "Wise. I've seen a wolf drink from one green stream and turn on its master by nightfall.", fx = { align = { order = 1 } } },
        { text = "My beast runs free. If it turns, I'll deal with it then.", next = "BACK", reply = "Then you'll deal with it, but your beast will pay first. I'd keep it close.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They do, and the elements are losing, which is the worst of it. The Shadow Council at Jaedenar drew fel up through the roots until the earth itself turned sour, and now even the fire in this forest burns green. A shaman who listens too closely here may find something other than the spirits listening back." } },
      choices = {
        { text = "I'll keep to the old ways and leave the fel alone.", next = "BACK", reply = "Good, shaman. The spirits here are frightened, and they'll come to a familiar voice.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every power can be mastered, given the will. Even this one.", next = "BACK", reply = "The Council said the same, shaman, and the earth paid for their will. I'd not test it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Only the satyrs, and they don't steal so much as spoil. When the Shadow Council were at Jaedenar, though, they sent creeping folk to watch every road, so I keep an ear open for footsteps that are softer than they ought to be." } },
      choices = {
        { text = "Better to watch the roads yourself, then.", next = "BACK", reply = "Good advice, and I'll take it. My ears are getting old, and the Deadwood are getting bolder.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good rogue would slip past you anyway.", next = "BACK", reply = "Perhaps, but I've caught a few, and they've not come back. I'd not try it.", fx = { align = { order = -1 } } },
        { text = "I'll make some noise next time.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Someone should, I suppose, and that is what the Emerald Circle does, with care and with prayers to the Earth Mother. What I fear is the scholar who studies it and grows fond of it, and I have heard of such scholars from Dalaran." } },
      choices = {
        { text = "Knowledge should serve the healing, nothing else.", next = "BACK", reply = "That's the right answer, and the Circle will be glad of it. Bring whatever you learn back here before you take it anywhere else.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Knowledge has no master. Whatever is learned is ours.", next = "BACK", reply = "That's what the Council said, too. I hope you prove them wrong.", fx = { align = { light = -1 } } },
        { text = "I'll keep that warning in mind.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I think any power held too tightly can be turned, and the Shadow Council were once orcs who only wanted to win a war. I don't doubt your heart, paladin, but Jaedenar is full of people who never doubted theirs either." } },
      choices = {
        { text = "The Light asks for humility. I'll hold it gently, not tightly.", next = "BACK", reply = "That's wise, paladin, and the Earth Mother would agree. Felwood has a way of pulling on anything held too tightly.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is a tool, and I'll use whatever I need to win.", next = "BACK", reply = "Then I'll pray for you, and I'll watch you too. Felwood takes the ones who think that.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Demons, and the power that comes with them, which they poured into the ground at Jaedenar until the trees grew teeth. They thought themselves wise the whole while, so any priest who leans on shadow should look long at that place before calling it a tool." } },
      choices = {
        { text = "No power is worth what was done to this forest.", next = "BACK", reply = "No, it is not, and I'm glad to hear you say it. Too many young priests come here curious instead of sorry.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is only as foul as the hand that holds it.", next = "BACK", reply = "Perhaps, but the hand changes, too. I've seen it happen more times than I'd like.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I believe it can, but not quickly, and not by druids alone. The satyrs and the Shadow Council poisoned it on purpose, and they're still here, so we cleanse a grove and they foul the next one. Every seed you plant in clean soil is a small victory, and I've learned to be grateful for small ones." } },
      choices = {
        { text = "Then we plant, and keep planting. The land will answer.", next = "BACK", reply = "Then we'll plant together, and I'll show you which soil still takes a seed. It's less than you'd hope.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Strike at the Shadow Council first. Healing means little while they live.", next = "BACK", reply = "That's what the warriors say, and they're not wrong. But someone has to plant behind them.", fx = { align = { order = -1 } } },
        { text = "Something else, Greta.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_flute", tags = { "news" }, when = { questDone = TODO_QUEST("Flute of Xavaric") }, text = "Eridan says you took the Flute of Xavaric out of the satyrs' hands in Jadefire Run. The Earth Mother does not delight in killing, little one, but she will not mourn the satyrs who fell for it." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Jaedenar", min = 40 } },
          text = "Jaedenar is quieter than it was, and I know who's been walking into it. Mind what you saw down there, because the Shadow Council's tricks don't always show until later." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Good, steel is honest, and it can't be tempted by the fel the way a spell can, so you may be the safest visitor I've had all month." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Then you'll have seen what the fel does to the beasts here, and you'll understand why I keep my stone in my pocket." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, here? Then you'll feel the fel in this place pulling at you, so don't answer it; I've watched stronger spirits than yours bend." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You move very quietly for someone in a camp full of druids, rogue. Quiet is good in Felwood; the Deadwood furbolgs hear everything else." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Your kind and mine see the world differently, but we agree, I hope, that whatever the demons left in Felwood was not left for anyone to study." },
        { id = "h_default", key = true,
          text = "I am Greta Mosshoof, of the Emerald Circle. The satyrs and the Shadow Council made this forest what it is, and I'd like to unmake it, slowly, the way the Earth Mother heals. Don't let the power here tempt you, because it's what poisoned the land." },
        { id = "h_jaedenar", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Forces of Jaedenar") }, { questActive = TODO_QUEST("A Final Blow") } } },
          text = "Jaedenar belongs to the Shadow Council now, warlocks and demons, and worse beneath. Every one you put down gives the forest room to breathe." },
        { id = "h_water", when = { any = { { questActive = TODO_QUEST("Collection of the Corrupt Water") }, { questActive = TODO_QUEST("Seeking Spiritual Aid") } } },
          text = "The water carries the corruption downstream, into everything. A friend of mine, Islen Waterseer, may know how to cleanse it. Bring her what we gather." },
        { id = "h_cleansed", when = { questDone = TODO_QUEST("Cleansed Water Returns to Felwood") },
          text = "Clean water, back in Felwood, is a small thing, but it's how forests heal: one small thing, and then the next." },
        { id = "h_felwood_resolved", tags = { "news" }, when = { thread = { id = "felwood_rot", state = "resolved" } },
          text = "The stone's still on my table, if you're wondering, and I've only picked it up twice since you came back from Jaedenar. Eridan says that's progress, and for once I haven't argued with her." },
        { id = "h_flames", when = { questActive = TODO_QUEST("Dousing the Flames of Protection") },
          text = "The Council's fires protect them. Put them out, and their walls come down with them." },
        { id = "h_watch", when = { metBefore = true },
          text = "I keep a stone from Mulgore in my pocket, and when the forest gets too loud, I hold it. It's quiet, the way stones should be." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" },
          text = "A paladin of the Alliance, with the Light shining off your armour. The Light is a power too, so I'll say to you what I say to everyone: don't let what's here tempt you." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. I'll be plain with you: I watch what every spellcaster reaches for in these woods, because the Shadow Council reached too, and Felwood is what they caught." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, and here at the Sanctuary. Good; we need every pair of hands, and every one that can call the roots back to life is worth ten that only hold a sword." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, and one of the Forsaken. The Light is a power, and death is another, so I'll say to you what I say to everyone: don't let what's here tempt you." },
      },
      again = { { id = "h_again", text = "Yes? Ask, and I'll hold my stone from Mulgore while you do." } },
      choices = {
        { text = "Do the fel and the elements fight each other here, Greta?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You speak of the Shadow Council.", next = "council" },
        { text = "Tempt me? How?", next = "tempt" },
        { text = "Tell me about the stone.", next = "stone", when = { metBefore = true } },
        { text = "The power here doesn't frighten me.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Have you had trouble with thieves out here?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Someone ought to study the corruption to understand it.", next = "xmage", when = { class = "MAGE" } },
        { text = "What did the Shadow Council reach for, Greta?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is a warrior safer from Felwood's temptations, Greta?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What has the fel done to Felwood's beasts, Greta?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Can Felwood really be healed, Greta?", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'll help.", next = "END", reply = "Good, and the Earth Mother will thank you for it. Walk carefully, and if the fel ever answers you, don't answer back.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I can't see how the Light could be turned to corruption.", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "Would Felwood's corruption tempt a Forsaken paladin, Greta?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Power's power, and I'll take what this forest offers.", next = "END", reply = "Then go carefully, shaman, for the forest offers a great deal and takes even more. I'll pray you remember the difference.", fx = { align = { light = -1 } } },
      },
    },
    council = {
      lines = { { id = "c_default", text = "Warlocks who serve the demons, the same kind who poisoned the orcs long ago. They've made Jaedenar their home. They like this forest the way it is." } },
      choices = {
        { text = "Why Jaedenar?", next = "council_why" },
        { text = "Then we change it.", next = "BACK", reply = "Then I'm glad you came. Start at Jaedenar, and take someone with you; nobody goes there alone twice.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The forest suits them, so leave them to it.", next = "BACK", reply = "Leave them, and they'll spread, and one day they'll be on your own doorstep. I'd not wait for that.", fx = { align = { light = -1 } } },
      },
    },
    council_why = {
      lines = { { id = "cw_default", text = "It was a kaldorei village once, and something lies beneath it that they want, though I don't know what. I know they dig, and that the digging makes the forest worse." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tempt = {
      big = true,
      lines = { { id = "t_default", text = "The fel here hums, and some feel it as strength. Take a little, and you'll fight better tomorrow; take a little more, and you'll fight for them the day after." } },
      choices = {
        { text = "I won't touch it.", next = "BACK", reply = "Good. You'll sleep better for it, and so will I.", fx = { align = { light = 2 }, affinity = 1 } },
        { text = "Power is power. It's how you use it.", next = "BACK", reply = "That's what the hum wants you to think. Be very careful how you use it.", fx = { align = { light = -2 }, affinity = -2 } },
      },
    },
    stone = {
      lines = { { id = "s_default", text = "It's from the plains near home, plain grey and a little warm, and it's never once tried to be anything it isn't. I find that restful, here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warlock = {
      lines = { { id = "w_default", text = "It should, since you know better than any of us what it costs. Mind your hands while you're here, warlock, because the forest is watching what you reach for." } },
      choices = {
        { text = "I'll reach for whatever serves me, druid.", next = "BACK", reply = "Then the forest will watch you reach, warlock, and so will I. Mind it doesn't reach back.", fx = { align = { light = -1 } } },
        { text = "I'll keep my hands to myself while I'm here.", next = "BACK", reply = "Thank you, and I'll believe it until you give me reason not to. I'm told I believe people far too easily.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I'll speak only of what the Circle knows for certain, and these I know. Ask me, and stay on the path." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what any traveler might learn here, and I'll be watching while I do." },
    },
    background = { { id = "tp_ba", text = "I'm a daughter of Mulgore who followed the Circle north. Some days I think I'll go home, and then I see one clean spring, and I stay." } },
    advice = { { id = "tp_ad", text = "If something here offers you strength, ask what it wants back. It always wants something back.", next = "tempt" } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother weeps for this forest, and I can hear it in the springs when they're foul. When we cleanse one, she stops weeping, for a little while." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof is our wisest chief, and he let me come north with the Circle. I write to my family in Mulgore, and they tell him I'm well." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are gentle when they trust you and fierce when they don't. I brought them salve once, and they've let me pass ever since." } },
    elune = { { id = "tp_elune", text = "The elves pray to Elune, and I pray to the Earth Mother, and we both look up at the same moon. I think the moon is happy with that." } },
    _none = { { id = "tp_none", text = "That's not something the Circle has spoken of, and the ancestors taught me that it's better to say nothing than something wrong." } },
  },
}

P:NPC {
  key = "maybess", id = TODO_NPC("Maybess Riverbreeze"), name = "Maybess Riverbreeze",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "earnest" }, values = { "kind", "practical" },
  notices = { "craft" },

  impression = {
    first = "Maybess Riverbreeze believes the forest can be mended more than fought for, one salve at a time. She asks everyone to help and seems to mean everyone.",
    third = "{name} met Maybess Riverbreeze of the Emerald Circle, who asks the Horde to help heal Felwood.",
  },

  greetings = {
    { id = "g_hello", text = "The Earth Mother's blessing on you. Come and sit a moment; there's always more work than hands in Felwood." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { "Herbalism", "Skinning", "Mining", "Enchanting" } },
      text = "You've a trade, and that's good, because the salve needs all kinds of hands: herbs, hides, ore, enchanting dust. Everyone can help heal this place." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not on its own, I think, but a mage knows magic better than most, and the corruption here is magic gone very badly wrong. If you can help me understand why the salves work on some plants and not on others, you'd be worth ten druids who only know how to hope." } },
      choices = {
        { text = "I'll study the corruption to help you mend it.", next = "BACK", reply = "Oh, would you? I'd be so grateful, because I've been guessing for months. Two heads are better than one, especially when one of them knows magic.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd rather study it for its own sake.", next = "BACK", reply = "That's your right, I suppose, but I'd be glad if some of what you learn found its way back to my salves. The forest could use it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The same way anyone can: one salve at a time, one plant at a time, one corrupted beast at a time. The Cenarion beacons show where the cleansing's needed, and I'll take any hand that will carry one, Horde or Alliance, because the forest doesn't care whose hand it is." } },
      choices = {
        { text = "Then I'll carry a beacon, whatever banner I fly.", next = "BACK", reply = "Then you'll be as welcome as anyone. The plants never once asked me which side I was on.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll mend what I can, but my own people come first.", next = "BACK", reply = "That's fair, and I won't fault you for it. Whatever you mend here is still mended.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Plenty, because the corrupted plants fight back, and the things guarding the Irontree Caverns fight harder. You'll clear the way, I'll lay the salve, and between us we'll make one corner of Felwood a little greener." } },
      choices = {
        { text = "Then I'll follow your lead and guard the menders.", next = "BACK", reply = "Thank you, and the menders will sleep better for it. They've been jumping at every snapped twig for weeks.", fx = { align = { order = 1 } } },
        { text = "I'll fight where I please. The menders can keep up.", next = "BACK", reply = "They'll try, but please don't leave them too far behind. The plants fight back.", fx = { align = { order = -1 } } },
        { text = "Something else, Maybess.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Where the beasts still graze, mostly, because they know better than we do which leaves are safe. Follow a deer that's still healthy and it'll lead you to the last clean patches in the forest, if you're patient and don't spook it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Where the beasts still graze, mostly, because they know better than we do which leaves are safe. And {pet} might sniff them out faster than either of us. Animals know a sick plant from a clean one, even when I can't." },
      },
      choices = {
        { text = "I'll follow the deer gently and leave them in peace.", next = "BACK", reply = "That's the way. The deer find the clean patches before any of us, and they've never once led me wrong.", fx = { align = { light = 1 } } },
        { text = "Easier to follow the deer, then have it for supper.", next = "BACK", reply = "Oh, please don't, they're the only ones who know where the clean patches are! Supper can come from somewhere else.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman_mb = {
      lines = {
        { id = "smb_default", text = "Not these ones, I'm afraid. The elementals in Felwood are twisted by the corruption, the way the furbolgs are, and there isn't anything left in them to call kin. Ask your spirits, if you doubt me; I think they'll tell you the same." },
      },
      choices = {
        { text = "Then freeing them is a mercy. I'll do it.", next = "BACK", reply = "Thank you, and I hope the spirits forgive us both. I'll say the words for them tonight, if you'll stand with me.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Twisted or not, they're kin. Find someone else.", next = "BACK", reply = "I understand, and I'll not ask you again. There are others who'll do it, if it must be done.", fx = { align = { order = -1 }, affinity = -1 } },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "If you carry salve and gather blood amber like everyone else, yes, and gladly. The forest doesn't care whose hands mend it, only that they don't add more poison while they work, and I'll trust you to know the difference." } },
      choices = {
        { text = "I'll mend, then. The forest has suffered enough.", next = "BACK", reply = "Thank you, truly. Take a beacon from the pile by the tent, and I'll show you the first patch.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Healing's not my work. Burning the satyrs is.", next = "BACK", reply = "Burning the satyrs helps too, I suppose, and I'll not pretend otherwise. Just mind the saplings.", fx = { align = { light = -1 } } },
        { text = "We'll see how I can help.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The corrupted creatures, mostly, because the sap and amber I need lie right beside them and the beasts don't like to share. I'd rather you slip in and slip out than fight your way through, since every fight here spills more poison into the ground." } },
      choices = {
        { text = "Slipping in quietly suits me fine.", next = "BACK", reply = "Good. In and out, nobody hurt, and nobody the wiser; that's the best kind of day in Felwood.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather face them openly and end it.", next = "BACK", reply = "That's brave, and I'll be grateful either way. Just don't trample the amber.", fx = { align = { honor = 1 } } },
        { text = "I'll see what I can gather.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Salves for the sick beasts, clean water for the saplings, and patience for all of it, because the Jadefire satyrs can undo a week's work in a night. A priest's hands are steady ones, and I'd sooner have yours here than out hunting satyrs for their horns." } },
      choices = {
        { text = "Then I'll stay and mend for as long as I can.", next = "BACK", reply = "Thank you. Some of these beasts have been sick so long they've forgotten what it was like to be well.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the satyrs choke on their own fel. That's quicker mending.", next = "BACK", reply = "They'll choke on it eventually, I'm sure, but the saplings can't wait that long. Please, help me with the slow way too.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Patience, more than anything. The corrupted plants here can be cleansed if they're tended with care, and the Cenarion water we use is precious, so I'd rather you healed one grove slowly than burned through a whole season's supply in a day." } },
      choices = {
        { text = "Slow and careful, then. I'll tend each grove properly.", next = "BACK", reply = "Thank you, and the groves will remember you, I think. I'll mark the first one for you on my map.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "We haven't time to go slowly. The corruption is spreading.", next = "BACK", reply = "It is, and I feel it every day. But hurried cleansing doesn't take, and then we've wasted the water.", fx = { align = { order = -1 } } },
        { text = "Something else, Maybess.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_jaedenar", when = { questDone = TODO_QUEST("Forces of Jaedenar") }, text = "Greta says you went into Jaedenar for her and came back with the Shadow Council's blood on your blade. I ask the Horde to mend more than to fight, but some things must be cut out before anything can grow." },
        { id = "o_felwood_hope_lost", tags = { "news" }, when = { gossip = { topic = "felwood_hope", stance = "lost" } },
          text = "Eridan says you'd burn Felwood to the ground. I'd ask you not to say it while I'm in the middle of mending it." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! I hope you came to mend, friend, because Felwood's had enough magic thrown at it, and I'd much rather see you use yours to make something grow." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Good, because mending is what we do here, and your Light mends too, so you'll understand. Will you lend Felwood a hand while you're passing through?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior! I know, I know, you came to fight, and I'm going to ask you to mend instead, but bear with me, because this forest needs both." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter! Oh, you could help me so much, because you know how to find things that don't want to be found, and the cleanest plants in Felwood are the best hidden." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock of the Horde, here among the menders! That makes the back of my neck prickle a little, but I'll take any hands willing to help, and I mean that." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue! You've a light step, and I could use someone who can get close to things that would rather not be got close to, if you'll forgive me for saying so." },
        { id = "h_default", key = true,
          text = "I am Maybess Riverbreeze, of the Emerald Circle. I ask the Horde to help take Felwood back from the poison, not by fighting, mostly, but by mending, the way rain mends the plains after a fire." },
        { id = "h_cleansing", tags = { "news" }, when = { questActive = TODO_QUEST("Cleansing Felwood") },
          text = "Bring me blood amber, the sap of the Warpwood elementals in the Irontree Caverns to the north. They're beyond saving, and what I learn from them may save everything else." },
        { id = "h_trusted", tags = { "news" }, when = { questRecent = { TODO_QUEST("Cleansing Felwood"), days = 3 } },
          text = "I trust you now, friend, and I don't say that lightly in this forest. Take a Cenarion beacon, and let's begin on the plants." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You'll want Arathandris, to the south, who does for the Alliance what I do for the Horde. It's the same forest, and the same work." },
        { id = "h_daily", when = { metBefore = true },
          text = "Every day a little salve, and every day a little less poison. I'll not live to see it all clean, but somebody will." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Good, because mending is what we do here, and you'll understand that better than most. Will you lend Felwood a hand while you're passing through?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid of the Earth Mother, here to mend Felwood. You're very welcome at the Sanctuary, and the Emerald Circle has work enough for you to last a season." },
      },
      again = {
        { id = "h_again", text = "Something more? Ask while my hands are busy; they work better when I'm talking." },
      },
      choices = {
        { text = "How do you mend a forest?", next = "mend" },
        { text = "Why must I kill elementals to earn your trust?", next = "trust", when = { any = { { questActive = TODO_QUEST("Cleansing Felwood") }, { questDone = TODO_QUEST("Cleansing Felwood") } } } },
        { text = "What is the Emerald Circle?", next = "circle" },
        { text = "Felwood can't always have looked like this.", next = "past" },
        { text = "I'm an herbalist, if that's any use to you.", next = "herb", when = { profession = "Herbalism" } },
        { text = "I'm Alliance. Can I still help?", next = "alliance", when = { faction = "Alliance" } },
        { text = "The alchemist at Bloodvenom wants the corruption.", next = "winna", when = { heardLine = "winna.h_default" } },
        { text = "Would you really let a warlock help the cleansing?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do you need someone to get close to?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What does Felwood need mending most, Maybess?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What use is a warrior in mending a forest?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "There must be clean plants somewhere in Felwood.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "The Emerald Circle must need something from me.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "I'll help mend it.", next = "END", reply = "Oh, thank you, I knew a priest would understand! Go well, and come back with your hands full of amber.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Must I kill elementals? The spirits are my kin.", next = "shaman_mb", when = { class = "SHAMAN", any = { { questActive = TODO_QUEST("Cleansing Felwood") }, { questDone = TODO_QUEST("Cleansing Felwood") } } } },
        { text = "How can a paladin help mend Felwood, Maybess?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Can a mage's magic really heal a forest, Maybess?", next = "xmage", when = { class = "MAGE" } },
        { text = "I'm here for what I can take, not to mend.", next = "END", reply = "Well, I can't stop you, but please don't take anything we need. The forest has given enough already.", fx = { align = { light = -1 } } },
      },
    },

    mend = {
      lines = {
        { id = "m_default", text = "With a salve the Cenarion Circle taught us, laid on the corrupted plants one by one. Some of them come back from it, and every one that does is a little root of the old forest taking hold again." },
      },
      choices = {
        { text = "How do you find the sick ones?", next = "mend_beacon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mend_beacon = {
      lines = {
        { id = "mb_default", text = "A Cenarion beacon shows you the taint the naked eye misses, the fel creep in the herbs and the sickness in the soil. I can make the salve from many things, so whatever your trade is, there's a way for you to help." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },

    trust = {
      big = true,
      lines = {
        { id = "t_default", text = "Because what I know about cleansing this forest would be a terrible weapon in the wrong hands, and I can't give it to just anyone who asks kindly. It seems odd, I know, that killing proves you'll help me heal." },
      },
      choices = {
        { text = "It does seem odd.", next = "trust_odd" },
        { text = "I understand.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
      },
    },
    trust_odd = {
      lines = {
        { id = "to_default", text = "The Warpwood elementals are past any saving, and their sap may teach me how to save everything that isn't. When so many lives hang on it, I've decided the end has to justify the means, and I pray to the Earth Mother that I'm right." },
      },
      choices = {
        { text = "I think you are.", next = "BACK", reply = "Thank you, I needed to hear that. Some nights I sit by the salve pots and wonder.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'm not so sure.", next = "BACK", reply = "Neither am I, honestly, on the bad nights. But I'll keep going until someone shows me a better way.", fx = { align = { order = -1 }, trait = { skeptical = 1 } } },
      },
    },

    circle = {
      lines = {
        { id = "c_default", text = "Those of us here at the sanctuary who answer to the Cenarion Circle, tauren and night elves both. We came to learn what's poisoning Felwood and to stop it, and the stopping is slower than the learning." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },

    past = {
      lines = {
        { id = "p_default", text = "A green and peaceful forest, north of Ashenvale, before the demons came in the last war and twisted everything that grew here. The bears and the treants you see out there were whole once, and some part of them remembers it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    herb = {
      lines = {
        { id = "h2_default", text = "The fel creep, which clings to the herbs here like black moss. With the beacon you'll see it, and if you bring it to me I can purify it into the salve itself." },
      },
      choices = { { text = "I'll gather it.", next = "BACK", fx = { affinity = 2 } } },
    },
    alliance = {
      lines = {
        { id = "a_default", text = "Of course, though not from my hands; our peoples aren't ready for that, and the Sentinels would have words. Arathandris to the south makes the same salve, and the plants won't care whose banner you fly." },
      },
      choices = { { text = "Thank you, Maybess.", next = "BACK", fx = { affinity = 1, opinion = { peace = "for" } } } },
    },
    winna = {
      lines = {
        { id = "w_default", text = "I've heard of her, and of the moonwell she wants water from. It grieves me that anyone of the Horde would look at this poison and see a tool, but I can't mend her, only the forest." },
      },
      choices = {
        { text = "She's helping the Horde, in her way.", next = "BACK", reply = "In her way, perhaps, but her way frightens me. I hope the Horde finds better helpers.", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
        { text = "I'll keep my distance from her.", next = "BACK", reply = "That's probably wise, and I'd do the same. She means well for the Horde, I think, but not for anything else.", fx = { affinity = 2, align = { light = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A tauren of the Emerald Circle, who came to Felwood to heal what she could. I'll leave when it's healed, or when I'm too old to carry the salve." } },
    advice = { { id = "tp_ad", text = "Don't drink from any stream in Felwood, however clear it looks. The poison here is patient, and it doesn't always show itself." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made this forest, and the demons hurt it, and I'm here to heal what I can. She'd want that, and so do I." } },
    cairne = { { id = "tp_cairne", text = "Cairne is a good chief, and he trusts the Circle. I trust him, so here I am." } },
    thrall = { { id = "tp_thrall", text = "The Warchief gave my people a place among the Horde, and he honours the Earth Mother. He'd understand why I'm here healing trees instead of fighting." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw let me pass through their tunnels, because I carry salve and not axes. I wish more people did." } },
    _none = { { id = "tp_none", text = "I only know the forest, and only this bit of it. The Earth Mother gave me one patch of ground to tend, and that's enough." } },
  },
}

P:NPC {
  key = "arathandris", id = TODO_NPC("Arathandris Silversky"), name = "Arathandris Silversky",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  prejudice = { class = "WARLOCK", amount = 12, why = "the fel that poisoned Felwood came from demon-callers; she fears warlocks carry the curse back in" },
  communities = { "emerald_sanctuary" }, temper = { "determined" }, values = { "protective", "devout" },
  notices = { "craft" },

  impression = {
    first = "Arathandris Silversky spent a whole morning watching a single clean flower by the road. Her patience is the fighting kind, and she says the curse is no more stubborn than she is.",
    third = "{name} met Arathandris Silversky of the Emerald Circle, who asks the Alliance to help cleanse Felwood.",
  },

  greetings = {
    { id = "g_pj_lock", when = { prejudiced = true }, text = "Stay on the path, warlock, and keep your demon at your heel. This forest was poisoned by things like the one beside you, and the salve can't undo whatever you might carry back in." },
    { id = "g_pj_over", when = { prejudiced = "overcome" }, text = "I've been watching where you walk, and the plants you passed are as clean as the ones you didn't. I was wrong to think the curse followed you, and I'm sorry for it." },
    { id = "g_hello", text = "Ishnu-alah. These woods were beautiful once, for longer than your kingdoms have stood, so help me make them so again." },
  },

  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Herbalism", "Skinning", "Mining", "Enchanting" } },
      text = "Your trade can heal, here, because the salve needs what you gather, and Felwood will thank you, in its slow way." },
  },

  start = "hello",
  nodes = {
    pj_arath = {
      lines = { { id = "pj_arath_default", text = "No, but the ones who did spoke with demons as easily as you do, and they thought they had them leashed as well. I've seen what fel does to roots, and I can't make myself trust anyone who carries it on purpose." } },
      choices = {
        { text = "What did you see it do?", next = "pj_arath2" },
        { text = "A leash is all it takes. I master what I summon.", next = "BACK", reply = "They all thought so, warlock, right up until the leash snapped. I'll be watching yours.", fx = { align = { order = 1 } } },
        { text = "Fel is only power. Your fear does more harm than fel.", next = "BACK", reply = "Perhaps my fear does harm, but I've seen what fel does, and I'll keep my fear. It keeps me careful.", fx = { align = { order = -1 } } },
        { text = "Then I'll keep my demon away from the sanctuary.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    pj_arath2 = {
      lines = { { id = "pj_arath2_default", text = "There was a grove near Jaedenar that I tended when I was young, ash trees older than any city we have now, and when I came back after the satyrs took it, the bark wept green and the birds had no eyes. I salve a plant a day because I couldn't save one tree then." } },
      choices = {
        { text = "I'm sorry. I'll help where I can, demon or no.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It goes down to the roots and the water both, and that is why salves and seeds take so long. My people would say Elune's light has gone out of this place, and you'd say the spirits are sick, and I think we're describing the same wound." } },
      choices = {
        { text = "Then we'll mend it together, Arathandris.", next = "BACK", reply = "Together, then, and Elune and the Earth Mother both will be glad of it. Come, I'll show you where the roots are worst.", fx = { align = { light = 1 } } },
        { text = "Some wounds can't be mended. Cut it out.", next = "BACK", reply = "Some, perhaps, but not all of it, and I won't give up on any piece too soon. Cutting is how this began.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'll accept anyone who carries a beacon and doesn't let it go dark. The curse here is old and stubborn, and you are stubborn too, I think, since even death couldn't keep you from the Light." } },
      choices = {
        { text = "I'll carry your beacon wherever you need it.", next = "BACK", reply = "Then you're welcome among my salve-bearers. They'll want to hear where you've come from, so be ready for questions.", fx = { align = { order = 1 } } },
        { text = "I'll cleanse what I choose, in my own time.", next = "BACK", reply = "That's fair, I suppose, as long as you cleanse something. The forest isn't in a hurry, and neither am I.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because it's proof, and proof is precious in Felwood. The curse is stubborn, and so am I, and I'll not stop until every flower in this forest is clean, but a mage might see the corruption in a way that a druid can't, and I'd welcome that, if you're patient enough to look." } },
      choices = {
        { text = "I'll look, and help you find the source.", next = "BACK", reply = "Then you'll have my thanks. If we can find where it starts, I can stop guessing at every sick flower.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Patience won't cure this. Bold magic might.", next = "BACK", reply = "Bold magic is what made this forest, mage. I'd rather you were patient, if you can bear it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because cleansing is like a long stalk, waiting for the moment the plant is ready and not a moment before. Most of the Alliance's soldiers want it finished in an afternoon, but a hunter knows that some prey takes days." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because cleansing is like a long stalk, waiting for the moment the plant is ready and not a moment before. And {pet} may help, I think. The plants here seem to grow a little cleaner where something healthy has walked, though I can't prove it." },
      },
      choices = {
        { text = "Then I'll be patient and do it properly.", next = "BACK", reply = "Then you're a rare one among the Alliance's soldiers, and I'm glad of you.", fx = { align = { order = 1 } } },
        { text = "Patience is fine, but I'd rather burn the sick plants and start again.", next = "BACK", reply = "Burning is what the satyrs do, and look where it's left us. I'd ask you to wait a little longer.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior_ar = {
      lines = {
        { id = "war_default", text = "So would I, most days, and there's plenty in Felwood you can hit. But a warrior who only knows how to win a fight will lose this forest, because there's nothing here to defeat, only something to outlast." },
      },
      choices = {
        { text = "Then I'll outlast it. Patience is a weapon.", next = "BACK", reply = "It is, and a rare one among warriors. Most of the ones who come here want it over by supper.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Show me what to hit. I'll leave the patience to you.", next = "BACK", reply = "Fair enough, and there's plenty to hit. I'll point, you swing, and the patience can stay with me.", fx = { align = { order = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It goes down to the roots and the water both, so salves and seeds take seasons to show anything. My people would say Elune's light has gone out of this place, and yours would say the spirits are sick, and I think we're describing the same wound from opposite sides. That's as near as I'll come to agreeing with the Horde today." } },
      choices = {
        { text = "The spirits don't care about banners, and neither do I.", next = "BACK", reply = "Then you're welcome here, shaman, whatever your banner says. The roots don't know an orc from an elf.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "My place is with the Horde, and I'll mend from there.", next = "BACK", reply = "That's honest, and I'll take honest help from anywhere. Mend from wherever you stand.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The Circle is not Stormwind, and this forest is the reason why. I will work beside you, and I will thank you for the work, but I watched the Shadow Council turn Jaedenar into a nest of demons, and I cannot forget it on your account." } },
      choices = {
        { text = "I don't blame you. I'll keep my demon away.", next = "BACK", reply = "Thank you, and I'm grateful you understand. My salve-bearers won't even sleep near the place a demon stood.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Circle has no right to judge me.", next = "BACK", reply = "It doesn't judge, warlock, it remembers. That's a different thing entirely.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Let's just get the work done.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I have seen SI:7's sort in Talonbranch Glade from time to time, though they never say so and I never ask. Their business is the Shadow Council and the Horde, I suppose, and mine is the land, which is slower work but more honest." } },
      choices = {
        { text = "Your work is the more honest of the two.", next = "BACK", reply = "Kind of you to say, and I'll not argue. The forest doesn't need spies, only gardeners.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Spies keep the Alliance alive. Honesty doesn't.", next = "BACK", reply = "Perhaps, but they don't grow anything. I'll leave the spying to them and keep my salves.", fx = { align = { honor = -1 } } },
        { text = "I wouldn't know anything about that.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Tired, mostly, because the work is slow and the poison never sleeps, and Jaedenar's fires light the sky to the south every night. They won't complain to me, but they might talk to a priest, and I would count that a kindness." } },
      choices = {
        { text = "I'll sit with them a while. Healing isn't only for wounds.", next = "BACK", reply = "Thank you. They won't say so, but some of them haven't slept a whole night since spring.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Tired hands still work. They can rest when the forest's clean.", next = "BACK", reply = "They do, and they will, but a short rest now keeps them working longer. Still, I'll not argue with you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A good deal, because the corrupted things here don't like the Light, and my salve-bearers need someone at their backs on the road. The cleansing is slow and dull, though, and I've seen braver souls than you grow bored of it." } },
      choices = {
        { text = "Slow work done right is worth it. I'll stand guard.", next = "BACK", reply = "It is, and I'm glad you see it. Stand with my salve-bearers, and they'll stop looking over their shoulders.", fx = { align = { order = 1 } } },
        { text = "I'd rather strike at the demons themselves than guard flowerbeds.", next = "BACK", reply = "Then strike at them, and gladly, but my flowerbeds still need guarding. Someone will do it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The curse is older than your Horde and my Alliance both, and it will happily outlast our quarrels if we let it. I'll take any honest help, though I'll be watching the shadow in you as closely as I watch the shadow in these trees." } },
      choices = {
        { text = "Watch all you like. My help is honest.", next = "BACK", reply = "I will, and I hope you prove me wrong to have watched. I've been wrong about the Horde before, more than once.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll help where it profits the Horde, and nowhere else.", next = "BACK", reply = "That's honest, at least, and I'll take it. Mend what helps the Horde, and the forest will take the rest.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Slowly, and only if we are stubborn. The demons and their servants poured fel into this land for a reason, and the felwood itself remembers the taint, so we cleanse a patch at a time and guard it fiercely. I have outlasted worse hopes than this one, and I mean to outlast this too." } },
      choices = {
        { text = "Then we'll be stubborn together. Felwood will be green again.", next = "BACK", reply = "Together, then, and I'll be glad of every patch we take back. I keep a tally, if you'd like to see it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some ground is too far gone. Wall it off and save the rest.", next = "BACK", reply = "Some ground, perhaps, but walls are how the elves lost this forest in the first place. I'd rather try.", fx = { align = { light = -1 } } },
        { text = "Something else, Arathandris.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_rescue", when = { questDone = TODO_QUEST("Rescue From Jaedenar") }, text = "Jessir Moonbow came through the Sanctuary yesterday with her friend Arko'narin beside her, and she told me who had brought her out of Jaedenar. Ten thousand years, and I still find myself surprised by kindness." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. I spent a morning watching one clean flower by the road, and I'd wager you've spent mornings watching stranger things, so perhaps we're more alike than we look." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter of the Alliance! Then you have patience, which is the one thing the curse can't take from us, and the thing it tests hardest." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A Horde shaman. I'll say plainly that it's the Alliance I ask for help, but your kind know the land's voice as well as anyone, so speak." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock of the Alliance, and in my camp. Stormwind permits your kind, I know, but I will be honest with you: I would rather you left your demon outside the sanctuary." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Patient, quiet and careful, that is the sort of help a cleansing needs, and a rogue is all three when it suits them. I hope it suits you today." },
        { id = "h_default", key = true,
          text = "I am Arathandris Silversky, of the Emerald Circle. I ask the Alliance to help me cleanse Felwood. The curse is old and stubborn, but I have been stubborn for ten thousand years." },
        { id = "h_cleansing", tags = { "news" }, when = { questActive = TODO_QUEST("Cleansing Felwood") },
          text = "The salve is laid on the sick plants a little each day. It doesn't look like war, but it's harder than war." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Maybess, to the north of here, works with the Horde, so go to her; the forest doesn't care who heals it." },
        { id = "h_daily", when = { metBefore = true },
          text = "One of the plants by the road flowered yesterday, clean, a small white flower, and I've been watching it all morning." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Alliance, at last! The salve does its work on the plants, but the people who lay it need tending too, and they rarely ask." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" },
          text = "A paladin! I asked the Alliance for help cleansing Felwood and expected archers, so pardon me if I stare a little at all that plate." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. Maybess works with your people, to the north, but the curse doesn't care whose prayers it hears, so I'll hear you out." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Circle, come to Felwood. The curse here is older than you are, sister or brother, but it is not older than the forest, and the forest remembers being green." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin! I asked for help cleansing Felwood and expected archers, and I certainly didn't expect one of the Forsaken with the Light in hand." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. I asked the Alliance for help and never expected it to come clanking with totems, but speak, for the forest needs every friend it can find." },
      },
      again = { { id = "h_again", text = "Something else? Mind the flower, though; it's the first clean one this forest has given me in years." } },
      choices = {
        { text = "Does the curse here go deeper than the trees?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "I don't see how this is harder than war.", next = "harder" },
        { text = "Tell me about the flower.", next = "flower", when = { metBefore = true } },
        { text = "Does anyone else work to cleanse this forest?", next = "maybess" },
        { text = "I've some herb lore.", next = "herbs", when = { profession = "Herbalism" } },
        { text = "Stormwind's laws allow warlocks. Why shouldn't the Circle?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I'd guess the Alliance sends its spies into Felwood.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would you accept a Horde priest's help against the curse?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why would a hunter make a good cleanser, Arathandris?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Can the corruption be undone, Arathandris?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'll help cleanse it.", next = "END", reply = "Then speak with the land and lend your hands, and I'll be glad of you, Horde or not. Go well, shaman.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'd rather fight something I can hit.", next = "warrior_ar", when = { class = "WARRIOR" } },
        { text = "Your people look worn down by the curse.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Can a paladin be of use in cleansing work?", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "Why watch a single flower for a whole morning, Arathandris?", next = "xmage", when = { class = "MAGE" } },
        { text = "Will you accept a Forsaken paladin's help, Arathandris?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Does the curse here go deeper than the trees?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'm not the one who poisoned Felwood, Arathandris.", next = "pj_arath", when = { prejudiced = true } },
        { text = "I'll leave the salving to you, because it isn't my fight.", next = "END", reply = "As you like, shaman, and the forest will manage without you. Go well, all the same.", fx = { align = { light = -1 } } },
      },
    },
    harder = {
      lines = { { id = "h2_default", text = "In war you win or lose and it's over. Here you do the same small thing every day, and most days nothing changes. You have to keep believing anyway." } },
      choices = {
        { text = "I don't know how you keep believing.", next = "harder_how" },
        { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    harder_how = {
      lines = { { id = "hh_default", text = "I don't, every day, and on the days I don't, I put the salve on anyway. Belief catches up eventually, because hands are more reliable than hearts." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    flower = {
      lines = { { id = "f_default", text = "It's still there, and still white. A satyr walked past it this morning and didn't notice, and I've never wanted anything so badly to stay unnoticed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    maybess = {
      lines = { { id = "m_default", text = "Maybess Riverbreeze does, to the north, though not side by side; our people won't allow it yet. But we use the same salve, and we leave each other notes by the road. The forest gets both of us." } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } } },
    },
    herbs = {
      lines = { { id = "hb_default", text = "Then pick nothing here that looks too healthy, because in Felwood the bright ones are the sick ones, and the dull grey ones might be getting better." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know the curse well, and a few other things besides. Ask me about any of these." },
    },
    background = { { id = "tp_ba", text = "Kaldorei, Emerald Circle, and too stubborn to be told a forest can't be saved." } },
    advice = { { id = "tp_ad", text = "Do one good thing a day here, only one, and then do it again tomorrow, because that's how this works.", next = "harder" } },
    cenarion_circle = { { id = "tp_circle", text = "We are the Circle's hands in this forest, where few others would come." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Dream shows Felwood healthy, every leaf of it, and I refuse to believe that can't be made real. That's why the Circle calls me stubborn." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw kept their minds when the rest of their people fell, and I admire that more than I can say. We work with them where we can." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Legion's fel is in the soil, the water and the trees. I'll pull it out root by root if I have to." } },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess sends her Sentinels to Ashenvale, but nobody to Felwood. I don't blame her, but I'd like a few more hands." } },
    _none = { { id = "tp_none", text = "That I don't know, though the curse I know, and I have known it since the Legion left it here." } },
  },
}
