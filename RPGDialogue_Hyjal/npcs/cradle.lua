-- The Cradle of Tranquility: Maerion Thaelemaches, demon hunter, and Jereman, the dread raven. Voice: bibles/hyjal.md
local P = RPGDialogueAPI:Pack("rpgd.hyjal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hyj_maerion", id = TODO_NPC("Maerion Thaelemaches"), name = "Maerion Thaelemaches", title = "Demon Hunter",
  bible = "bibles/hyjal.md", role = "questgiver", tier = "major",
  communities = { "hyjal" }, temper = { "sharp", "proud" }, values = { "stern", "brave" },
  likesTone = "blunt", private = { "nordrassil" },
  notices = { "class", "race", "form" },

  impression = {
    first = "He calls the victory at Hyjal a defeat with better songs.",
    third = "{name} met Maerion Thaelemaches, a grim night elf demon hunter keeping his own vigil in the Cradle of Tranquility.",
  },

  greetings = {
    { id = "g_default", text = "You walk into the Cradle as if it were safe. Nothing on this mountain is safe, least of all me." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Either you are brave, or you have not yet understood what I am." },
    { id = "g_warm", when = { disposition = { min = 70 } }, text = "Sit, if you like. Your company is less tiresome than most." },
    { id = "g_away", when = { away = 14 }, text = "You have been gone {away}, and the mountain did not miss you, though I find that I noticed. Nothing that walks away from Hyjal comes back unchanged." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You carry more power than when we last spoke, and I can smell what some of it cost you, so be careful with it, because I know better than anyone where that road ends." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I am told someone on this mountain caught you in a lie, and I am the last who should judge a deceiver, though the others will remember it longer than I will." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "Word on the mountain is that you frightened someone into giving way, and I recognize the method, because fear works well enough, though it builds no trust, as I have learned." },
  },

  notice = {
    { id = "n_warlock", cat = "class", place = "before", when = { class = "WARLOCK" },
      text = "I can taste the bargain on you, warlock, and I know its flavour better than you do. Keep your servant leashed in my sight, or I will cut the leash for you." },
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Shadow, worn like a cloak by one who serves the Light. We are more alike than your temple would like to admit." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei. I see your hand drift toward your weapon; the Sentinels taught you well, though I have done nothing to you." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, glowing like a lantern. The demons will see you coming a league away, and perhaps that is the point." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Elves from the sky, here on the mountain. I have heard of your people only in passing, and I find I am curious, which happens rarely." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "Your shadow is a poor hiding place. I have learned to see what hides from eyes." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "My kind are hated by the Watchers and scorned by the priestesses, and we hunt the Legion anyway. You have seen me fight, so tell me what you think of those who take a demon's power to kill demons." },
      },
      choices = {
        { text = "You do what must be done. I respect that.", next = "op_r1", fx = { affinity = 1, align = { order = -1 }, opinion = { demon_hunters = "respect" } } },
        { text = "You've let the enemy inside you. That's how it starts.", next = "op_r2", fx = { align = { order = 1 }, trait = { cautious = 1 }, opinion = { demon_hunters = "distrust" } } },
        { text = "Illidan's followers belong in the Watchers' chains.", next = "op_r3", fx = { affinity = -2, align = { order = 1 }, trait = { stern = 1 }, opinion = { demon_hunters = "hate" } } },
        { text = "We both bargained with the Legion for power. Don't pretend otherwise.", next = "op_r4", fx = { affinity = -1, opinion = { demons = "useful", demon_hunters = "kin" } }, when = { class = "WARLOCK" } },
        { text = "I'll keep my judgment to myself.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Respect is rare and cheap at the same time. Keep yours until you have seen me hungry." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "It started ten thousand years ago, mortal. I am only what was left over when it ended." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "The Watchers agree with you, and they have had ten thousand years of practice with chains. Leave me to the Legion and leave the chains to them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "I do not bargain. I take, and I never let what I took speak back to me, so pray that you can say the same." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_dd_bonfires", when = { questDone = TODO_QUEST("Blademaster's Bonfires") },
          text = "I watched your fires burn in Dae'gun from the ridge. The orc knows how to bait a demon, I'll give him that, and so, it seems, do you." },
        { id = "o_talon_caution_act", tags = { "news" }, when = { gossip = { topic = "talon_caution", stance = "act" } },
          text = "The druid says you favour burning over watching. Then you understand my way better than hers." },
        { id = "o_burning_legion_beaten", tags = { "news" }, when = { gossip = { topic = "burning_legion", stance = "beaten" } },
          text = "The orc says you think the Legion is finished. It is never finished; it is only elsewhere." },
        { id = "h_default", key = true,
          text = "I am Maerion Thaelemaches. They call this place the Cradle of Tranquility, and I suppose it is tranquil, if you ignore what lies under the mountain and what still hides on its slopes. I have hunted the Legion since the Well of Eternity burned, and if this is what we call a victory, you would not want to know the full breadth of a defeat." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the human Light. You will want to save me, I expect, and I will decline politely, and we will both be disappointed." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "The Horde, in the Cradle. I fought beside orcs on these slopes and I bear them no grudge, which makes me unusual among my people." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid of the Circle, come to look at the outcast. Tell your elders I am still here, and still killing what they would rather pray away." },
        { id = "h_windwalk", tags = { "news" }, when = { questRecent = { TODO_QUEST("Yashiro's Windwalk"), days = 3 } },
          text = "Yashiro killed his doomguard, and you were with him. Good work, but do not mistake one dead warlord for a clean mountain." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The night is when they move, the things the Legion left behind. I sleep in the day, when I sleep at all." },
        { id = "h_hyjal", when = { origin = "nightelf_hyjal_survivor" },
          text = "You were here, on the day. I can see it in how you look at the slopes, counting the places where the line broke. Most of the kaldorei who stood on this mountain would rather not see me again, and yet here you are." },
      },
      again = {
        { id = "h_again", text = "Ask. I have nothing but time and very little of it is pleasant." },
        { id = "h_again2", text = "What else would you know? Speak, or let me return to watching." },
      },
      choices = {
        { text = "That hardly sounds like a victory.", next = "victory" },
        { text = "I've never seen anyone quite like you.", next = "what" },
        { text = "What lies under the mountain?", next = "under" },
        { text = "Why keep watch in the Cradle?", next = "cradle" },
        { text = "Who else hunts demons on this mountain?", next = "yashiro" },
        { text = "Your power is fel. How can it be trusted?", next = "xlight", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "The Sentinels say your kind betrayed us.", next = "xnelf", when = { race = "NightElf" } },
        { text = "I stood on these slopes when the Tree gave up its gifts.", next = "xsurvivor", when = { origin = "nightelf_hyjal_survivor" } },
        { text = "Strip away the glaives, and you and I are much the same.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What does a demon hunter see in me?", next = "xshadow", when = { form = "shadow" } },
        { text = "Farewell, hunter.", next = "END" },
      },
    },

    victory = {
      big = true,
      lines = {
        { id = "v_default", text = "We killed Archimonde, yes. To do it we burned the World Tree, and with it went our immortality, and the Legion's filth soaked into the forest until Felwood rotted below us. The Legion lost a general; we lost a part of what we were." },
      },
      choices = {
        { text = "What was lost can be rebuilt.", next = "BACK", reply = "Rebuilt, perhaps, but not returned, and you speak as one who has never woken to find ten thousand years taken from them in a single night.", fx = { align = { light = 1 } } },
        { text = "Every victory costs. That's war.", next = "BACK", reply = "Spoken like a soldier, and I cannot fault it. Walk down into Felwood one day, though, and tell me the bill has been settled.", fx = { align = { light = -1 } } },
        { text = "Do you regret the battle?", next = "victory_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsurvivor = {
      big = true,
      lines = {
        { id = "xsv_default", text = "Then you know the sound it made, which nobody who wasn't here believes when I describe it. Afterward, the Sentinels went home to grieve their lost eternity, and I stayed to hunt what crawled out of the ashes, so tell me, which of those did you do?" },
      },
      choices = {
        { text = "I went home. Someone had to carry the living.", next = "BACK", reply = "Then you did the harder thing, perhaps, and I will not mock you for it, though the Legion was very glad of every blade that went home.", fx = { affinity = -1, align = { honor = 1 }, trait = { kind = 1 } } },
        { text = "I kept fighting. Grief could wait for the Legion to be gone.", next = "BACK", reply = "Then we are of a kind, you and I, and the Sentinels will thank neither of us for it, but the forest is cleaner for our stubbornness.", fx = { affinity = 2, align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "The mountain must still remember that day.", next = "xsurvivor_mem" },
      },
    },
    xsurvivor_mem = {
      lines = {
        { id = "xsm_default", text = "The mountain remembers everything, and it forgives very little of it. The ground where the Tree's roots burned still won't take a seed, and the Wild Gods who live here speak of that day as if it were last night, which to them, I suppose, it was." },
      },
      choices = {
        { text = "Then I'll remember it with them.", next = "BACK", fx = { affinity = 1, learn = { "burning_legion" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    victory_regret = {
      lines = {
        { id = "vr_default", text = "No. The alternative was the Legion drinking from the Well and remaking the world in its image. I regret only that we needed to be pushed to the very edge before we fought as one people." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_legion" } } },
      },
    },

    what = {
      lines = {
        { id = "wh_default", text = "A demon hunter. I took the enemy's power into myself so that I could see it, and fight it, and follow it where others cannot. My people call that a betrayal, and I call it the only weapon that ever worked." },
      },
      choices = {
        { text = "What did it cost you?", tag = "Persuade", next = "what_cost",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "WARLOCK" }, { trait = "kind" } } } },
          fail = { next = "what_no", fx = { affinity = -1 } } },
        { text = "Who taught you?", next = "what_teacher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    what_cost = {
      lines = {
        { id = "wc_default", text = "My name, among the Sentinels, and my family's door, which closed behind me and stayed closed. And sleep; the fel does not let you forget what it is, and some nights I hear it bargaining with me in my own voice." },
      },
      choices = {
        { text = "You've already given this mountain your share.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    what_no = {
      lines = {
        { id = "wn_default", text = "Enough to make the question an unkindness. Ask me something else." },
      },
      choices = { { text = "Forgive me.", next = "BACK" } },
    },
    what_teacher = {
      lines = {
        { id = "wt_default", text = "The first of us learned from the one who was locked in the barrows under this very mountain for ten thousand years. Where he went after he was freed, I do not know and do not ask, and I would thank you not to say his name too loudly in the Cradle." },
      },
      choices = {
        { text = "Under this mountain?", next = "under" },
        { text = "Something else.", next = "BACK" },
      },
    },

    under = {
      lines = {
        { id = "un_default", text = "Barrow dens, dug long ago by the druids and guarded by the Watchers. They held a prisoner there for ten millennia, and the deeps run further down than anyone living has walked. Prisons remember what they held, and I do not think these are as empty as the Circle hopes." },
      },
      choices = {
        { text = "You think something is waiting down there.", next = "under_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    under_what = {
      big = true,
      lines = {
        { id = "uw_default", text = "I do not know, and I would rather know than guess. The Watchers left to chase their escaped prisoner, and whatever they left unwatched has had years to grow. When someone finally goes down in strength, I hope they go with their eyes open." },
      },
      choices = {
        { text = "Some doors are better left sealed.", next = "BACK", reply = "That is the counsel of the Wardens who sealed them, and it held for ten thousand years, but a seal nobody watches is only a door left closed.", fx = { align = { order = 1 } } },
        { text = "Then someone should go and look.", next = "BACK", reply = "Agreed, and I would go myself if anyone would follow, but go with your eyes open and your blade drawn, because nothing down there is asleep.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    cradle = {
      lines = {
        { id = "cr_default", text = "Because the raven allows me to. Jereman keeps this place, and keeps it quiet, and for some reason it has decided an outcast with fel in his veins is worth tolerating. I have not asked why; one does not interrogate a Wild God." },
      },
      choices = {
        { text = "Jereman is a Wild God?", next = "cradle_jereman" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cradle_jereman = {
      lines = {
        { id = "cj_default", text = "A great raven, old and patient, of the kind that watched the first war against the Legion. Speak to it respectfully, and do not expect it to answer the question you asked; it answers the one you should have." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    yashiro = {
      big = true,
      lines = {
        { id = "ya_default", text = "Yashiro, the orc blademaster in Dae'gun, is a good hunter and a better killer, and his grief makes him careless with his own life. I have watched him from the ridge; we want the same thing, and neither of us would say so to the other." },
      },
      choices = {
        { text = "Does everyone distrust you the way Yashiro does?", next = "op_ask" },
        { text = "You should hunt together.", next = "BACK", reply = "Perhaps, if either of us could bear the other's company, but I suspect we would argue over who strikes the killing blow until the demon left of boredom.", fx = { align = { honor = 1 } } },
        { text = "Let him take the risks. You watch.", next = "BACK", reply = "That is my habit already, and I am not proud of it, but if he falls I will be close enough to finish whatever killed him.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xlight = {
      big = true,
      lines = {
        { id = "xli_default", text = "It cannot be trusted; that is the point. I do not trust it either, and that distrust is what has kept me myself. Your Light asks for faith, and mine asks for vigilance, and I have seen faith fail more often." },
        { id = "xli_priest", when = { class = "PRIEST" }, text = "It cannot be trusted, priest, and I do not ask you to trust it. Your Light asks for faith, and mine asks for vigilance, and I would not trade my vigilance for all the faith in Stormwind's cathedral." },
      },
      choices = {
        { text = "The Light would accept you, even so.", next = "BACK", reply = "The Light accepts many who never asked for it, but I think it would find me a poor guest, and I would find its house too bright to sleep in.", fx = { align = { light = 1 } } },
        { text = "Use the enemy's weapons. It's only sense.", next = "BACK", reply = "At last, someone who does not flinch. Most who climb this mountain bring courage enough; it is sense they leave behind in Winterspring.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      big = true,
      lines = {
        { id = "xne_default", text = "Some did, and some of them deserved what they got. I fought on this mountain for our people while the Sentinels spat at my back, and I would do it again, and I would still not ask them for forgiveness." },
      },
      choices = {
        { text = "You fought for us. That should count.", next = "BACK", reply = "It should, and it does not, and I have stopped waiting for it to, but I thank you for saying it aloud where the wind could hear.", fx = { align = { order = -1 } } },
        { text = "The Sentinels have their reasons. Respect them.", next = "BACK", reply = "They have, and I understand them better than they would like, but respecting their reasons will not make me sorry for what I did here.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlo_default", text = "We are very different. You bargain with demons and call it mastery, and I took one into myself so that I would never need to bargain again. One day yours will call in the debt, and I hope I am not the one sent to collect it." },
      },
      choices = {
        { text = "My servants obey, or they suffer. That's all I need.", next = "BACK", reply = "Then may they keep obeying, for your sake, because the day they stop, you will learn how little mastery a contract buys.", fx = { align = { light = -1 } } },
        { text = "I hope you never have to.", next = "BACK", reply = "So do I, more than you know, but hope is a thin ward against what you carry, and I will keep my glaives close all the same.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshadow = {
      lines = {
        { id = "xs_default", text = "Someone who has looked into the dark and found that it looked back. It is not fel, so you are not damned, but do not let it wear you for longer than you wear it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "It is a long while since anyone spoke well of what I am, and longer since I believed it. I find that I believe you, and I am not certain what to do with that." },
        { id = "s2", text = "You offer respect where my own people offer a hand on the hilt. I will not pretend it means nothing to me, though I would ask you not to say it where the Sentinels can hear." },
      },
      fail = {
        { id = "f1", text = "The fel in me speaks sweetly too, and it has had far longer to practise than you. I have learned what a pleasant voice is usually reaching for." },
        { id = "f2", text = "Do not praise me. The songs praised everyone who stood on this mountain, and I have seen what the songs are worth." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "You would goad a demon hunter in the Cradle, with nothing between us but the grass. That is the first honest thing anyone has done in front of me this season, and I respect it." },
        { id = "s2", text = "Good. I had taken you for one more pilgrim come to admire the scars on the mountain, and I see now that you have an edge of your own." },
      },
      fail = {
        { id = "f1", text = "I have been called a monster by people whose lives I saved, and they said it with more skill. You will need something sharper than that to reach me." },
        { id = "f2", text = "Be careful how you speak to me. I keep a hard hold on what I carry, and I do not loosen it to trade insults with the living." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "I felt that, and very little reaches me now. You have looked at what I am and pushed against it regardless, and I will give ground to that, because few have earned it." },
        { id = "s2", text = "The thing I carry stirred when you spoke, as it does when it scents a rival. I do not fear you, but I will treat you as I would treat something dangerous, and from me that is a courtesy." },
      },
      fail = {
        { id = "f1", text = "I took a demon's fire into my own flesh, and I have held it there by will alone ever since. There is nothing in your voice that can frighten me after that." },
        { id = "f2", text = "You threaten me as the Watchers do, and they at least bring chains. Stand down, before I begin to wonder what is making you so bold." },
      },
    },
  },

  topics = {
    _gated = {
      { id = "gt1", text = "I will not speak of that to you. I have told strangers too much before, and I learned what they did with it." },
      { id = "gt2", text = "That stays with me until I know what you are. Show me, and I may answer." },
    },
    knows = {
      { id = "tp_knows", text = "I know the Legion, and I know what it left on this mountain. Ask, and I will tell you the truth, which is not always welcome." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "Ask quickly. I am not here to keep company." },
    },
    background = { { id = "tp_bg", text = "I was a soldier, then an outcast, then a hunter of demons. The order of those matters more than the details." } },
    advice = { { id = "tp_ad", text = "If something on this mountain speaks to you kindly in a voice you know, walk away from it." } },
    burning_legion = { { id = "tp_bl", text = "They are patient, and they are not finished. The ones hiding in Dae'gun are the least of them." } },
    highborne = { { id = "tp_hb", text = "Their hunger for magic called the Legion here the first time. I see little reason to admire them." } },
    malfurion = { { id = "tp_malf", text = "The Shan'do called the wisps and saved us all. He would not want me here, I think; he has never forgiven anyone who walked his brother's road." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil stood when the Legion came, and it still stands, scarred to the heartwood. I stood beneath it that night, and I do not go up to look at it now." } },
    scourge = { { id = "tp_scourge", text = "The Scourge marched before Archimonde on this mountain, and they died here in their thousands. Their master is still in the north, and he has not forgotten what he lost at Hyjal." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad is the lich who called Archimonde into this world at Dalaran, and the mountain paid for it. He leads the plague from Naxxramas now, and I would very much like to finish what Hyjal began." } },
    tyrande = {
      { id = "tp_tyrande", text = "The High Priestess does not trust me, and she is right not to. I would rather be distrusted by her than trusted by most." },
      { id = "tp_tyrande2", when = { race = "NightElf" }, text = "Your Sentinels watch me as though I might turn at any moment, sister. Tell your High Priestess that I have not turned yet." },
    },
    sylvanas = { { id = "tp_sylvanas", text = "The banshee queen of the Forsaken was once the Ranger-General of Quel'Thalas, and the Scourge made her what she is. I know something of being changed into a weapon, so I watch her closely." } },
    thrall = { { id = "tp_thrall", text = "The orcs fought beside us on this mountain because Thrall chose to bring them. Whatever they are doing in Ashenvale now, that choice was made, and it held." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids look to the Dream for answers, and I look to the ground for demons. I find mine more often." } },
    _none = { { id = "tp_none", text = "I do not know, and if it is not a demon, I likely do not care. Ten thousand years of hunting leaves little room for other questions." } },
    grievance = {
      { id = "gv_1", text = "I have no use for you, and you have given me no reason to find one. That is my grievance." },
      { id = "gv_val", when = { grudge = "values" }, text = "You are careless, and carelessness on this mountain gets others killed. I watched it happen ten thousand years ago." },
      { id = "gv_prej", when = { grudge = "prejudice", class = "WARLOCK" }, text = "You bargain with the same creatures I have hunted for ten thousand years. I am not inclined to think kindly of you." },
      { id = "gv_wr", when = { grudge = { worst = "wronged" } }, text = "You spoke to me as though I were a curiosity. I am not, and I remember the ones who think so." },
    },
    amends = {
      { id = "am_1", text = "Kill demons and leave me in peace. That is the only thing you could do that I would notice." },
      { id = "am_prej", when = { grudge = "prejudice" }, text = "You cannot. You chose your road, and I chose mine. They do not meet." },
    },
    spite = {
      { id = "sp_1", text = "I think you are the kind of fool the Legion finds most useful. I have killed better than you who thought they could bargain." },
      { id = "sp_val", when = { grudge = { worst = "values" } }, text = "I think you would have stood with the Highborne at the Well of Eternity and called it wisdom." },
    },
  },
  blurts = {
    { id = "bl_1", text = "The Shadow Council hides in the Shadow Hold beneath Jaedenar, in Felwood. The rot in that forest flows from them, whatever the druids tell you." },
    { id = "bl_2", text = "Demon Fall Canyon in Ashenvale is where Mannoroth died, and his blood is still in the stone. The satyrs gather there, and I hunt them when I can." },
  },
}

P:NPC {
  key = "hyj_jereman", id = TODO_NPC("Jereman"), name = "Jereman",
  bible = "bibles/hyjal.md", role = "questgiver", tier = "quest",
  communities = { "hyjal", "wild_gods" }, temper = { "steady" }, values = { "curious" },
  notices = { "class", "form" },

  impression = {
    first = "It answers questions sideways, and I keep thinking about the answers afterward.",
    third = "{name} spoke with Jereman, a raven of the Wild Gods who watches over the Cradle of Tranquility.",
  },

  greetings = {
    { id = "g_default", text = "Little one. You have walked a long way to stand in my shadow." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the Cradle. The wind told me you would, though the wind is often wrong." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A child of the Circle. Your teachers learned the shapes of my cousins long ago; do not let them tell you they invented flight." },
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "You carry darkness the way my feathers carry it, but mine is only colour. Be careful that yours stays only a garment." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Your beast lowers its head to me. It has better manners than most of the two-legged things that come up the mountain." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "The kaldorei grew a new tree on Teldrassil without the Aspects' blessing, while Nordrassil stands wounded above us. The mountain has an opinion, and so do I. What is yours?" },
      },
      choices = {
        { text = "Teldrassil gives the kaldorei a home. That matters most.", next = "op_r1", fx = { align = { order = 1 }, opinion = { teldrassil_tree = "home" } } },
        { text = "They should have healed Nordrassil before planting another.", next = "op_r2", fx = { affinity = 1, align = { order = -1 }, opinion = { teldrassil_tree = "wrong" } } },
        { text = "Fandral's ambition will cost them, sooner or later.", next = "op_r3", fx = { trait = { skeptical = 1 }, opinion = { fandral = "distrust" } } },
        { text = "I have no opinion on trees.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "A home grown in pride is still a home, I suppose. The mountain remembers which tree came first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "So say the wild gods, in our way. The Archdruid did not come to ask us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Ambition is a seed like any other. What it grows into depends on who waters it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dd_celastrus = {
      lines = {
        { id = "dd_celastrus_1",
          text = "The mountain is one body, and its sickness is one sickness, even if you see it as many brambles and many slopes. When a great root of that sickness is cut, the whole of Hyjal shivers, the way your arm twitches when a splinter comes out." },
        { id = "dd_celastrus_2",
          text = "It will take a long age to heal the rest. I have such ages to spend, and you do not, so I would know whether you mean to come back." },
      },
      choices = {
        { text = "I'll come back. The mountain deserves to heal.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I go where I'm needed, not where I'm owed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Jereman.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_celastrus", when = { questDone = TODO_QUEST("Celastrus the Bitter") },
          text = "The eastern hollow breathes easier since the bitter thorn fell, and I felt it under my wings before Thylaen ever told me. You did that, small one, and the mountain will remember it longer than you will." },
        { id = "h_dd_deaths", when = { deaths = { min = 10 } },
          text = "You have fallen and risen again more often than most who climb this mountain. I watch the spirits go up from the slopes, and I have started to recognise yours." },
        { id = "o_demon_hunters_respect", tags = { "news" }, when = { gossip = { topic = "demon_hunters", stance = "respect" } },
          text = "You told the demon hunter you respect his kind. I allow him in the Cradle, and that is not the same thing as respect." },
        { id = "h_default", key = true,
          text = "I am Jereman, and the Cradle rests under my wings. Below me the slopes are still sick, and above me the great tree is still burned, and here, for a little while, there is quiet. Ask what you came to ask." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "A {g:son|daughter} of the stars, returned to the mountain at last. Your people once came to the Cradle to rest; now they send only those they have cast out." },
        { id = "h_apriest", when = { class = "PRIEST" }, text = "A priest. Your Light is a sun I have flown under for a very long time, and it has never once told me anything I needed to know." },
      },
      again = { { id = "h_again", text = "Another question. Ravens are patient, little one; ask it." } },
      choices = {
        { text = "How could you feel the thorn fall?", next = "dd_celastrus", when = { questDone = TODO_QUEST("Celastrus the Bitter") } },
        { text = "What do the wild gods make of Teldrassil?", next = "op_ask" },
        { text = "This Cradle of Tranquility feels strangely calm.", next = "cradle" },
        { text = "Why do you allow the demon hunter here?", next = "maerion" },
        { text = "What did you see when the Legion came?", next = "legion" },
        { text = "How do I keep my mind clear up here?", next = "xshadow", when = { form = "shadow" } },
        { text = "I will leave you to your watch.", next = "END" },
      },
    },
    cradle = {
      lines = {
        { id = "c_default", text = "A place where the mountain holds its breath. When the Legion came, the defenders camped here below the summit, and the ground still remembers their fear, and so it rests now, the way a body rests after a fever." },
      },
      choices = {
        { text = "Can I help it rest?", next = "cradle_help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cradle_help = {
      big = true,
      lines = {
        { id = "ch_default", text = "Perhaps, if you mean help and not change. Many come up the mountain eager to fix it, as though it were a broken cart, and the mountain does not want to be fixed. It wants to grow, which is slower." },
      },
      choices = {
        { text = "Then I'll tend, not change.", next = "BACK", reply = "Good. Kneel in the soil below the Cradle and leave your hands there a while, little one; the mountain will feel the difference, even if it never says so.", fx = { align = { order = 1 } } },
        { text = "Some things need fixing, whether they want it or not.", next = "BACK", reply = "Many have said that on this slope, and some were right, but the mountain remembers the ones who were wrong much longer.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    maerion = {
      lines = {
        { id = "m_default", text = "Because he watches what I cannot see, the hiding things that smell of the Legion. Carrion birds and demon hunters are alike in that way: the world finds us unpleasant, and needs us all the same." },
      },
      choices = {
        { text = "Do you trust him?", next = "maerion_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    maerion_trust = {
      big = true,
      lines = {
        { id = "mt_default", text = "I trust that he hates them more than he loves himself, and that will have to do. Whether it holds, I will learn when it fails, and so will he." },
      },
      choices = {
        { text = "That's not trust. That's a gamble.", next = "BACK", reply = "A gamble, yes, and the stakes are his soul and this forest, but I have played with worse odds and the mountain is still here.", fx = { align = { honor = 1 } } },
        { text = "Use what serves, and watch it closely.", next = "BACK", reply = "That is how a raven watches everything, little one, and you have the makings of a good watcher if you can learn to be patient about it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    legion = {
      lines = {
        { id = "l_default", text = "Fire falling from the sky, and green rot running down the slopes like rain, and the great demon climbing toward the tree. Then the wisps came, more of them than there are stars, and the light was so bright that I flew blind for a day." },
      },
      choices = {
        { text = "Did the Wild Gods fight?", next = "legion_gods" },
        { text = "Something else.", next = "BACK" },
      },
    },
    legion_gods = {
      lines = {
        { id = "lg_default", text = "Some did, in our own ways, and some had already died in the first war and could not. I watched, and I remembered, and that is what ravens are for; someone must remember accurately, because the songs never do." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xshadow = {
      lines = {
        { id = "xs_default", text = "Sit in the Cradle, let the shadow fall from you for an hour, and listen to the wind. It is not a cure, but it is a reminder of what you are without it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am old, and I am a raven, and I watch. That is all the history a raven needs." } },
    burning_legion = { { id = "tp_bl", text = "They came twice to this mountain. I would prefer they did not come a third time." } },
    nordrassil = { { id = "tp_nordrassil", text = "The great tree remembers, little one, and so do I. The songs say it was saved, but the songs never tell you what it cost." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Dream is the green behind your eyelids, little one, and the ravens fly there too. Something nests in its far corners now that was not there before." } },
    scourge = { { id = "tp_scourge", text = "The dead came up the mountain once, and they fed the ground for years after. The ravens remember them as a feast, little one, and the mountain remembers them as a wound." } },
    green_dragons = { { id = "tp_green_dragons", text = "Ysera's children and I have known one another a long time, little one. They have stopped visiting, and I have stopped asking why." } },
    highborne = { { id = "tp_highborne", text = "I remember the Highborne, little one, when they were beautiful and terrible. The songs make them only terrible, which is kinder than they deserve." } },
    _none = { { id = "tp_none", text = "That is not a thing the wind has carried to me, little one." } },
  },
}
