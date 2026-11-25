-- Itharius: a green dragon of Ysera's flight in high elf guise, keeping a cave of whelps at the swamp's edge and grieving the dragons lost in the Temple of Atal'Hakkar. Voice: bibles/itharius.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "itharius", id = TODO_NPC("Itharius"), name = "Itharius",
  bible = "bibles/itharius.md", role = "scholar", tier = "major",
  communities = { "swamp_of_sorrows" }, temper = { "aloof", "grave" }, values = { "wise", "proud" },
  likesTone = "polite",
  notices = { "race", "form" },

  impression = {
    first = "He grieves for the temple's dragons but would never call it grief.",
    third = "{name} met Itharius, a green dragon in high elf form who keeps watch from a cave at the edge of the Swamp of Sorrows.",
  },

  greetings = {
    { id = "g_op_dragons", when = { opinion = { topic = "dragons", stance = "distrust" } }, text = "You hold that dragons meddle in mortal affairs, mortal. Then observe how I meddle now, by asking for your help instead of commanding it." },
    { id = "g_default", text = "You have come far into my cave, mortal, past whelps who would have eaten you had I allowed it. Speak, and be brief." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The whelps remember your scent, and so do I." },
    { id = "g_away", when = { away = 30 }, text = "A month and more, {away} by your counting. To me it was a blink, but the whelps grew in it." },
    { id = "g_oath", when = { questDone = TODO_QUEST("The Essence of Eranikus") }, text = "You carry the Oathstone's charge still, I can feel it. Your choices thus far have been correct ones." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I am told you lie to those who trust you. The Dream is woven of truths, mortal, and lies tear it." },
  },

  notice = {
    { id = "n_druid", cat = "form", when = { form = { "bear", "cat", "travel", "aquatic" } },
      text = "You walk in a beast's shape before a dragon of Ysera's flight. Bold, druid, and not unwelcome, for the Dream knows your kind." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "A child of the kaldorei. Your people and mine kept faith with the Dream together for ten thousand years, and some of us remember it." },
  },

  start = "hello",
  nodes = {
    op_dragons = {
      lines = {
        { id = "opd_default", text = "I have heard every answer from terror to worship, and I am curious which is yours. Tell me, mortal, when a dragon walks among your kind, what do you think it wants?" },
      },
      choices = {
        { text = "To watch over us. I'm grateful for it.", next = "op_dragons_trust", fx = { affinity = 1, align = { order = 1 }, opinion = { dragons = "trust" } } },
        { text = "To meddle. Azeroth belongs to those who live in it.", next = "op_dragons_distrust", fx = { affinity = -1, align = { order = -1 }, trait = { proud = 1 }, opinion = { dragons = "distrust" } } },
        { text = "My people chained the red flight at Grim Batol. I'm ashamed of it.", next = "op_dragons_shame", fx = { affinity = 2, opinion = { dragons = "respect" } }, when = { race = "Orc" } },
        { text = "The Dream's guardians have my respect, eldest.", next = "op_dragons_trust", fx = { affinity = 1, opinion = { dragons = "respect", druidism = "respect" } }, when = { class = "DRUID" } },
        { text = "I've learned not to guess at a dragon's mind.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    op_dragons_trust = {
      lines = {
        { id = "opdt_default", text = "Gratitude is rarer than fear, and I will remember it. Do not let it make you careless, though, for not every dragon who wears a kind face is of Ysera's flight." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_dragons_distrust = {
      lines = {
        { id = "opdd_default", text = "A bold answer, and not a foolish one, for some of my kin have meddled cruelly. Yet you are standing in my cave at my asking, mortal, so consider who meddles with whom." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_dragons_shame = {
      lines = {
        { id = "opds_default", text = "Shame is a heavy thing for one who was not there to do the deed. The red flight remembers Grim Batol, and so do I, but I have also seen what your Warchief made of your people since." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Itharius, of Ysera's flight, and this cave is mine, as are the whelps you were wise enough not to provoke. I am patient, mortal, but do not mistake my patience for welcome." },
        { id = "h_essence", tags = { "news" }, when = { questActive = TODO_QUEST("The Essence of Eranikus") },
          text = "You bring the Chained Essence of Eranikus, and the Oathstone has spoken in your mind. Relinquish the gem to me, and we will work together to redeem a soul worthy of redemption." },
        { id = "h_words", tags = { "news" }, when = { questActive = TODO_QUEST("In Eranikus' Own Words") },
          text = "Seek Umbranse the Spiritspeaker in the east of Winterspring, a human medium who speaks for the dead. Eranikus is not dead, but he is near enough to it that Umbranse may reach him." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid. The Cenarion Circle answered my call once, when the temple fell to madness, and I have not forgotten it. Speak freely, child of the Dream." },
      },
      again = {
        { id = "h_again", text = "What else would you know? Choose your question carefully." },
        { id = "h_again2", text = "Ask. The whelps are sleeping, so I have a little time." },
        { id = "h_again3", text = "Speak on, mortal. I am listening." },
      },
      choices = {
        { text = "What happened in the sunken temple?", next = "temple" },
        { text = "Who is Eranikus?", next = "eranikus", when = { any = { { questActive = TODO_QUEST("The Essence of Eranikus") }, { questDone = TODO_QUEST("The Essence of Eranikus") } } } },
        { text = "Why keep so many whelps here?", next = "whelps" },
        { text = "Why take the shape of a high elf?", next = "visage" },
        { text = "Tell me of the Dream.", next = "dream", when = { class = "DRUID" } },
        { text = "I've seen the green dragons in the temple.", next = "xtemple", when = { minLevel = 50 } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },

    temple = {
      lines = {
        { id = "te_default", text = "The Atal'ai trolls sank their temple calling on their blood god, and Ysera sent some of my kin to guard against his return. The guardians watched too long and too close, and they were twisted, and now they serve the madness they were sent to stop." },
      },
      choices = {
        { text = "Can they be saved?", next = "temple_saved" },
        { text = "I'd guess the Atal'ai are long gone now.", next = "temple_atalai" },
        { text = "Something else.", next = "BACK" },
      },
    },
    temple_saved = {
      lines = {
        { id = "ts_default", text = "Most of them, no, and I asked mortals to put an end to them so that their madness ends with them. One may yet be saved, for his free will still lingers in a gem, chained and whispering." },
      },
      choices = {
        { text = "You'd have your own kin killed?", next = "temple_kin" },
        { text = "Who is the one who may be saved?", next = "eranikus" },
      },
    },
    temple_kin = {
      lines = {
        { id = "tk_default", text = "I would have them freed, and death is the only freedom left to them. Do not think it costs me nothing, mortal, simply because I do not weep in front of you." },
      },
      choices = {
        { text = "Mercy can look like killing. I understand.", next = "BACK", reply = "You do, and that is rarer than you know. Go swiftly, mortal, and be kind in the striking.", fx = { align = { light = 1 } } },
        { text = "Kin or not, a threat is a threat. Kill them.", next = "BACK", reply = "A threat, yes, and you are not wrong. But they were my brothers and sisters once, and I will remember them so.", fx = { align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    temple_atalai = {
      lines = {
        { id = "ta_default", text = "They linger in the ruins still, chanting for Hakkar, and the Horde at Stonard watches them through Fel'zerul, a troll of its own who is wiser than his masters know. The trolls are a lesser danger than what they serve." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    eranikus = {
      lines = {
        { id = "er_default", text = "Eranikus was among the greatest of Ysera's flight, and he was sent to the temple with the others, and he fell furthest of all. He lies now between sleep and death, twisted within a weave of nightmares." },
      },
      choices = {
        { text = "How do we reach him?", next = "eranikus_reach" },
        { text = "Why redeem him if he's fallen so far?", next = "eranikus_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eranikus_reach = {
      lines = {
        { id = "eu_default", text = "Through the gem that holds his free will, though the essence in it is badly tainted. We must learn to speak with him through it, and for that I need a mortal medium, one who speaks for the dead." },
        { id = "eu_done", when = { questDone = TODO_QUEST("In Eranikus' Own Words") },
          text = "Umbranse has begun the work, you tell me, and Eranikus will soon give us advice in his own words. That is further than I dared hope when you first came." },
      },
      choices = {
        { text = "I'll find the medium.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    eranikus_why = {
      lines = {
        { id = "ew_default", text = "Because a soul worthy of redemption is worth any number of sacrifices, and Eranikus was worthy once. If I abandon him, I abandon the reason my flight exists at all." },
      },
      choices = {
        { text = "That loyalty speaks well of you.", next = "BACK", reply = "It speaks of hope, mortal, which is a heavier thing to carry than loyalty. I thank you all the same.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Sentiment, from a dragon. Cut him loose.", next = "BACK", reply = "Cut him loose? Then I would be no better than the madness that took him. No, I will wait.", fx = { align = { order = -1 } } },
        { text = "What lies behind your calm, Itharius?", tag = "Persuade", next = "eranikus_bond",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "DRUID" }, { questDone = TODO_QUEST("The Essence of Eranikus") } } } },
          fail = { next = "eranikus_cold", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eranikus_bond = {
      lines = {
        { id = "eb_default", text = "You ask what few mortals dare. I flew beside Eranikus for longer than your kingdoms have stood, and when the temple took him I felt it as you would feel a limb torn away. I keep these whelps because they are what he once was, and I will not lose them too." },
      },
      choices = { { text = "Thank you for telling me.", next = "BACK", fx = { affinity = 1 } } },
    },
    eranikus_cold = {
      lines = {
        { id = "ec_default", text = "My calm is the calm of a dragon, and nothing more, and it is not yours to look behind. Ask about the work, mortal, not the worker." },
      },
      choices = { { text = "As you say.", next = "BACK" } },
    },

    whelps = {
      lines = {
        { id = "wh_default", text = "Because they are young and foolish and the swamp is full of things that would take them, the Atal'ai among them. Someone of my flight must teach them patience, and I am the one who stayed." },
      },
      choices = {
        { text = "They don't seem patient.", next = "whelps_temper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    whelps_temper = {
      lines = {
        { id = "wt_default", text = "No, they are cantankerous and quick to bite, and they think every mortal is a meal or a threat. They will learn, as I learned, that most mortals are neither, merely loud." },
      },
      choices = {
        { text = "Teach them that mortals can be allies.", next = "BACK", reply = "I will try, mortal, and you may help them learn it. Do not let them bite you too often.", fx = { align = { honor = 1 } } },
        { text = "Let them bite. Mortals should learn to fear dragons.", next = "BACK", reply = "Fear is a poor teacher, and the whelps have enough of it already. They will learn better from you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    visage = {
      lines = {
        { id = "vi_default", text = "Because a dragon in a cave frightens mortals into foolishness, and an elf in a cave merely puzzles them. The quel'dorei are a graceful people, and their shape suits my temper well enough." },
      },
      choices = {
        { text = "Other dragons must walk among us like this.", next = "visage_others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    visage_others = {
      lines = {
        { id = "vo_default", text = "Some, of every flight, and not all of them with honest purposes. If you meet a stranger who seems too old for his face, mortal, be courteous and be careful, in that order." },
      },
      choices = {
        { text = "What do you think mortals make of your kind?", next = "op_dragons" },
        { text = "Something else.", next = "BACK" },
      },
    },

    dream = {
      lines = {
        { id = "dr_default", text = "The Dream is the world as it was meant to be, untouched by mortal hands, and Ysera dreams it and keeps it. Your druids walk its edges in their sleep, and my flight walks its heart." },
      },
      choices = {
        { text = "Something feels wrong in the Dream.", next = "dream_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream_wrong = {
      lines = {
        { id = "dw_default", text = "You feel it too, then, even at the edges. Something has crept into the places where my kin sleep, and what happened in the temple may be only the first sign, so watch your own dreams, druid." },
      },
      choices = {
        { text = "I'll watch, and tell the Circle.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xtemple = {
      big = true,
      lines = {
        { id = "xt_default", text = "Then you have seen what madness does to the proudest of us, and I hope you were swift. Tell me plainly, mortal, did they fight like dragons or like beasts?" },
      },
      choices = {
        { text = "Like dragons. I honored them, even in killing them.", next = "BACK", reply = "Then they were honoured, and so are you for remembering it. Thank you, mortal.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Like beasts. I didn't stop to wonder.", next = "BACK", reply = "Beasts, then, as the nightmare made them. I will grieve for them, since you did not have time to.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "You speak with a courtesy that few mortals trouble themselves to learn. It is noted, and I find my regard for your kind improved by a small measure." },
        { id = "s2", text = "It is long since anyone offered me praise and wished only to give it. You have a gracious tongue, mortal, and the Dreamer's servants do not forget such things." },
      },
      fail = {
        { id = "f1", text = "I have listened to the flatteries of princes who are dust these ten thousand years. Yours is not the equal of theirs, and theirs did not move me either." },
        { id = "f2", text = "You offer sweet words as one offers meat to a beast, hoping it will grow tame. I am not what you take me for, and I am not so easily fed." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "You jest with me, here, in my own cave. That is either great folly or a kind of courage, mortal, and I find that I am inclined to call it courage." },
        { id = "s2", text = "The whelps nip at my heels in much the same manner, and I am fond of the whelps. You are bold, and boldness will be needed where I must send you." },
      },
      fail = {
        { id = "f1", text = "You make sport of what you do not comprehend. Were I less patient, mortal, you would learn swiftly why the whelps obey me without a word." },
        { id = "f2", text = "My kin lie in madness beneath the Pool of Tears, and you bring me mockery. Take it out of my cave, and return when you have remembered respect." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", narr = "The whelps fall silent and draw in close about his feet.", text = "There is more to you than your brief years would suggest, and I am old enough to recognise it. I will not provoke you needlessly, so ask what you would." },
        { id = "s2", text = "You press me, and I feel the weight of it, which I did not expect from a mortal. Very well, I shall answer you with more care." },
      },
      fail = {
        { id = "f1", text = "You would threaten me, little one. You have no notion of what stands before you, and it is better for your sleep that you never learn." },
        { id = "f2", text = "I have watched ages turn from within the Dream, and nothing in your short life could trouble me. Be still, before the whelps mistake your manner for a challenge." },
      },
    },
  },
  blurts = {
    { id = "bl1", text = "Jammal'an the Prophet leads the Atal'ai in the depths of the temple, and their rites falter without him. Strike him down, and you will have done more than all my kin managed." },
    { id = "bl2", text = "My own kin guard the deepest halls of the temple now, and their minds are no longer their own. Do not hesitate when you meet them, mortal, for they will not." },
    { id = "bl3", text = "Eranikus is held in the temple's lowest chamber, more shade than dragon. If you ever carry his essence out of that place, bring it to me, and do not listen if it whispers to you on the way." },
  },
  confides = {
    { id = "cnf_1", text = "The Atal'ai send their acolytes up through a drowned stair on the north side of the Pool of Tears, and they come at dusk, when the mists are thickest." },
    { id = "cnf_2", text = "The swamp's crocolisks will not hunt near the old troll stones on the lake's edge, for something in those stones still remembers Hakkar, and the beasts can smell it." },
    { id = "cnf_3", text = "Those who sleep too near the temple begin to dream of a great red serpent, and if your dreams ever turn that colour, wake and leave the swamp at once." },
  },
  topics = {
    regard = {
      { id = "rg_1", text = "I think you are less brief than most of your kind, mortal, though you do not live any longer. You pause before you act, and in a dragon's eyes that is the beginning of wisdom." },
      { id = "rg_earned", when = { fondness = "earned" }, text = "You have gone into the temple on my behalf and come back unchanged, which many of my own flight could not manage. I have not forgotten it, and I do not intend to." },
      { id = "rg_al_light", when = { alignment = { axis = "light", min = 30 } }, text = "There is a clarity in you that the Dream recognises, mortal. When you sleep, I expect its edges are kinder to you than to most." },
      { id = "rg_druid", when = { class = "DRUID" }, text = "You walk the Dream's paths with the Cenarion Circle's blessing, and the whelps grow quiet when you enter, as they do for my own kin. That is no small thing." },
    },
    confide = {
      { id = "cf_1", text = "Eranikus was my elder in the flight, and he taught me to fly through the Dream without losing my way. It is a strange thing, mortal, to ask a stranger to bring back the essence of one's own teacher." },
      { id = "cf_2", text = "The whelps in this cave are not mine by blood. They are the young of the kin who went into the temple and did not come out, and I have not told them so." },
      { id = "cf_3", text = "I have not walked the Dream in many seasons. I fear that what took my kin in the temple would follow me in, and so I keep my eyes open, which for one of Ysera's flight is a kind of exile." },
    },
    trust = {
      { id = "tr_1", text = "Trust the druids of the Cenarion Circle in this swamp, for they serve the Dream and want nothing from the temple. Trust no troll who speaks of the old gods with longing." },
      { id = "tr_2", text = "Trust my whelps' noses more than your own eyes. If they will not follow you down a path, there is a reason, even if you cannot see it." },
    },
    watchout = {
      { id = "wo_1", text = "Beware the dragonkin in the temple's deeper halls, mortal, for they wear the colours of my flight and their minds are no longer their own. Do not mistake them for allies because they look like me." },
      { id = "wo_2", text = "Beware the Pool of Tears after dark. The Atal'ai have laced its waters with something, and those who drink from it begin to hear voices they will later wish they had not." },
    },
    worries = {
      { id = "wy_1", text = "That the silence of my kin is spreading. Those I sent to ask after Eranikus have not returned, and the Dream itself feels further away than it should." },
      { id = "wy_2", text = "That I am too proud to ask my mistress for help, and too few to manage without it. A dragon should not have to admit such a thing to a mortal, and yet here I am." },
    },
    hopes = {
      { id = "hp_1", text = "That Eranikus may yet be freed of whatever holds him, and that he will remember the one who waited for him. I do not ask that he thank me, only that he know me." },
      { id = "hp_2", text = "To see these whelps grown and flying in the Dream as their parents did, untouched by the temple's corruption. That would be enough for a long while, even by a dragon's reckoning." },
    },
    favor = {
      { id = "fv_1", text = "Strike at the Atal'ai wherever you find them, mortal, and tell me what you saw in their eyes. I must know whether they are mad or merely devoted, for the two are dealt with differently." },
      { id = "fv_2", text = "If you walk the edges of the Dream in your sleep, and you see a great green shape that does not know its own name, do not run from it. Say mine, and see if it listens." },
    },
    friendship = {
      { id = "fr_1", text = "A dragon does not use that word lightly, mortal, for we outlive our friends and must carry them a very long time. I will carry you, and I find I do not mind the weight." },
      { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "You have served my flight without being asked and without asking anything in return. Yes, I count you a friend, and I have counted very few of your kind in my long life." },
      { id = "fr_al_honor", when = { alignment = { axis = "honor", min = 30 } }, text = "Your word is woven truly, mortal, and the Dream is made of such threads. I count you a friend of the green flight, and that is no small thing for a creature who lives so briefly." },
    },
    never_told = {
      { id = "nt_1", text = "When my kin went down into the temple, I was meant to go with them. I lingered at the entrance a moment too long, and the way closed behind them, and I have never been certain it was an accident." },
      { id = "nt_2", text = "Sometimes, in the deepest part of the night, I hear Eranikus calling my name from beneath the water. I do not answer, and I do not know whether that is wisdom or cowardice." },
    },
    grievance = {
      { id = "gv_al_shadow", when = { alignment = { axis = "light", max = -30 } }, text = "There is a shadow in you that the Dream recoils from, mortal, and I feel the recoil each time you enter my cave. My mistress would not suffer you near her, and I am less patient than she is." },
      { id = "gv1", text = "You have given me no reason to think well of you, mortal, and dragons do not hand out good opinion for nothing. That is the whole of it." },
      { id = "gv_tone_b", when = { grudge = "tone", tone = "blunt" }, text = "You speak to me as you would to a tavern keeper, mortal. I have watched your kingdoms rise and fall, and I will be addressed accordingly." },
      { id = "gv_wronged", when = { grudge = "wronged" }, text = "You spoke lightly of my flight and my mistress in my own cave. I do not forget such things, and I have a very long time in which to remember them." },
      { id = "gv_values", when = { grudge = "values" }, text = "I have seen how you walk the world, taking what you wish and caring little what it costs. The Dream feels such carelessness, even when you do not." },
    },
    amends = {
      { id = "am1", text = "Serve the Dream, and do it without being asked. Then perhaps I will think better of you, in a century or two." },
      { id = "am_tone_b", when = { grudge = "tone", tone = "blunt" }, text = "Learn courtesy, mortal. It costs you little, and it is the least a dragon is owed." },
    },
    spite = {
      { id = "sp1", text = "I think you are a brief and careless creature who mistakes being noticed for being important. The whelps have better manners." },
      { id = "sp_wronged", when = { grudge = { worst = "wronged" } }, text = "I think you are exactly the sort of mortal my mistress warned me of, and I am sorry she was right. Leave my cave." },
    },
    knows = {
      { id = "tp_knows", text = "I have watched this swamp and the world beyond it for a long while, mortal. I will tell you what a dragon thinks a mortal should know." },
    },
    background = { { id = "tp_ba", text = "I am a servant of Ysera, keeper of whelps, and watcher at the edge of a ruined temple. That is all I am at present." } },
    advice = { { id = "tp_ad", text = "Do not sleep near the sunken temple, mortal. Your dreams are not as private as you believe." } },
    atalhakkar = { { id = "tp_temple", text = "The Temple of Atal'Hakkar lies beneath the Pool of Tears, sunk by the trolls' own folly, and my kin who guard it are lost to madness." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Dream is the world as it was meant to be, green and unbroken, and my mistress Ysera watches over it from within. Mortals glimpse its edges when they sleep, and most of them forget by morning." } },
    green_dragons = { { id = "tp_green_dragons", text = "The green flight serves the Dreamer, and we guard the places where the Dream touches your world. Some of my kin have fallen silent of late, and I do not like the silence." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "The Atal'ai sank their own temple to hide their god, and now they work in its depths to call Hakkar back. My kin went down to stop them, and Eranikus is held there still, and I am not certain what he has become." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The Gurubashi to the south call on the same blood god that the Atal'ai serve. Hakkar has two doors into your world, and my flight watches only one of them." } },
    nordrassil = {
      { id = "tp_nordrassil", text = "Nordrassil was blessed by my mistress herself, and its roots run deep into the Dream. The night elves gave up their immortality when they lost its blessing, and I have seen few sacrifices as great." },
      { id = "tp_nordrassil2", when = { race = "NightElf" }, text = "Your people's new tree grew without my mistress's blessing, and I have wondered what that will mean for you. Do not mistake my concern for disapproval, kaldorei." },
    },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The druids of the Cenarion Circle walk the Dream with my mistress's leave, and I count them among my few allies in this swamp. They are patient, which suits a dragon." } },
    black_dragonflight = { { id = "tp_black_dragonflight", text = "Deathwing's children are cruel and patient and very hard to kill, and they would see my mistress's flight broken. I watch for them, even here." } },
    _none = { { id = "tp_none", text = "That is beneath my notice, or beyond it. Either way, I will not speak of it." } },
    _gated = {
      { id = "gt1", text = "That is not for mortal ears, or at least not for yours as yet. Prove yourself a friend to my flight, and I may speak of it." },
      { id = "gt2", text = "I will keep my own counsel on that matter. You have not earned such trust, and I do not give it lightly." },
    },
  },
}
