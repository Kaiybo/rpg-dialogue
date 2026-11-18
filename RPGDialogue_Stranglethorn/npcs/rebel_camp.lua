-- The Rebel Camp: soldiers of Kurzen's expedition who walked away from their colonel. Voice: bibles/stranglethorn.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "doren", id = TODO_NPC("Lieutenant Doren"), name = "Lieutenant Doren",
  bible = "bibles/stranglethorn.md", role = "soldier", tier = "major",
  communities = { "rebel_camp" }, temper = { "wary" }, values = { "dutiful", "loyal" },
  notices = { "kit", "soldier" },

  impression = {
    first = "Lieutenant Doren met me with a drawn sword and a hard question about Colonel Kurzen. Whatever took the Colonel's mind, this man has not forgiven it.",
    third = "{name} was challenged at the rebel camp by Lieutenant Doren, who led the men who broke from Colonel Kurzen's expedition.",
  },

  greetings = {
    { id = "g_op_light", when = { gossip = { topic = "the_light", stance = "doubt" } }, text = "Brother Nimetz says you don't put much stock in prayer. I don't either, some days, but don't tell him I agreed with you; he takes it hard." },
    { id = "g_halt", text = "Stop there and state your business. If you're one of the Colonel's, you won't be walking out of this camp." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. We've few enough friends this far from Stormwind." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I'd wondered if Kurzen had you. We've few enough friends out here, so I'm glad to be wrong." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown harder since we last spoke, and it shows. That's what this jungle does to the ones it doesn't kill." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "My men say you were caught in a lie in this camp. We left the Colonel because of lies, so you'll understand why I'm asking you not to." },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "I hear you put the fear into one of my men. They had enough of that from Kurzen, so ease off." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Kurzen's men did that, or the jungle? Either way, sit down before you fall down, and we'll find you a patch." },
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry yourself like someone who's served. Then you'll understand that we didn't leave lightly." },
  },

  start = "hello",
  nodes = {
    op_stormwind = {
      lines = {
        { id = "ops_default", text = "I used to be sure of it. Highlord Bolvar holds the Keep with Lady Prestor at his elbow, the king's been missing a year, and nobody's come for us. You've been there more lately than I have, so is it still the city I left?" },
      },
      choices = {
        { text = "Bolvar holds it together. Stormwind hasn't forgotten you.", next = "op_sw_trust", fx = { affinity = 1, align = { order = 1 }, opinion = { stormwind = "trust", bolvar = "trust" } } },
        { text = "The nobles care for coin and nothing else now.", next = "op_sw_distrust", fx = { align = { order = -1 }, opinion = { stormwind = "distrust" } } },
        { text = "Lady Prestor whispers and the court nods. Something's wrong there.", next = "op_sw_prestor", fx = { trait = { skeptical = 1 }, opinion = { prestor = "distrust" } } },
        { text = "It's my city, Lieutenant, and lately I'm ashamed of it.", next = "op_sw_distrust", fx = { affinity = 1, opinion = { stormwind = "ashamed" } }, when = { race = "Human" } },
        { text = "I can't answer for Stormwind.", next = "BACK" },
      },
    },
    op_sw_trust = {
      lines = {
        { id = "opst_default", text = "I'd like to believe that, and coming from someone who's walked the Trade District lately, I almost do. When this is done, I'll go and ask the Highlord myself." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_sw_distrust = {
      lines = {
        { id = "opsd_default", text = "That's what the men say around the fire, and I tell them to hold their tongues. I don't tell them they're wrong, and I've noticed they've stopped asking me to." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_sw_prestor = {
      lines = {
        { id = "opsp_default", text = "Careful saying that aloud, even out here. She came from nowhere and has the whole court eating from her hand, and I don't know what that means, only that I don't like it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_doren = {
      big = true,
      lines = { { id = "xpt_doren_default", text = "Kurzen happened, or whatever got into his head out here; one day he was our commander and the next he was something else, and most of the men followed him. A company is only as good as the one leading it, so remember that before you follow anyone into this jungle." } },
      choices = {
        { text = "A soldier follows orders, Lieutenant. That's what discipline means.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No one should follow a leader blindly. Your men chose wrong.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_zg = {
      big = true,
      lines = { { id = "xcl_zg_default", text = "Safer, maybe, but this jungle never forgets anything, and a troll empire doesn't go quiet because one god dies. Kurzen came here to fight trolls, remember, and somewhere along the way the jungle turned him into something I had to walk away from." } },
      choices = {
        { text = "Then strike the trolls while they're reeling. Stormwind should march now.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let them bury their dead. We came here for Kurzen, not a slaughter.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Do you think the trolls had a hand in Kurzen's madness?", next = "xcl_zg2" },
      },
    },
    xcl_zg2 = {
      lines = { { id = "xcl_zg2_default", text = "I've asked myself that every night since we walked out of his camp. Brother Nimetz thinks it was something in the jungle itself, but I've seen what Gurubashi priests can do to a man's mind, and I've never ruled them out." } },
      choices = {
        { text = "Whatever it was, you were right to walk away.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Something did, and it took his men down with him, so I'll not rule anything out. If your spirits can tell the jungle's voice from whatever's whispering to Kurzen, you'd be worth more to us than a squad." } },
      choices = {
        { text = "They were good men once. Some of them can still be saved.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Mad or not, Kurzen's men need putting down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Because Kurzen is here, and somebody has to stop him before his madness spreads any further. I didn't choose this jungle, but I won't leave it until that's done." } },
      choices = {
        { text = "Thank you. Let me ask something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_doren", tags = { "news" }, when = { party = { size = 4 }, faction = "Alliance" },
          text = "Five blades at once. I haven't seen that many friendly swords together since the Colonel took the rest of my company into the jungle, so you'll forgive me for staring." },
        { id = "h_cl_zg", tags = { "news" }, when = { cleared = "Zul'Gurub", faction = "Alliance" }, text = "One of my lads says you came back out of Zul'Gurub after its blood god fell, and I didn't believe him until I saw your face. That city ate whole patrols in the old days, and nobody ever learned where the bodies went." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Kurzen", min = 30 } }, text = "The scouts say Kurzen's patrols are thinner on the river road, and they say it's your doing. Good work, but keep your head down, because the Colonel counts his dead too." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid, here? Then you've seen what the trolls do to the jungle, and maybe what the jungle does to us." },
        { id = "h_default", key = true,
          text = "Lieutenant Doren. We came into this jungle under Colonel Kurzen, and something took his mind, and his closest men with it. The rest of us broke away, and we mean to stop him." },
        { id = "h_secrets", tags = { "news" }, when = { questActive = TODO_QUEST("Jungle Secrets") },
          text = "Private Thorsen was our man inside the Colonel's camp, and someone gave him away. I want the name." },
        { id = "h_herod", when = { questActive = TODO_QUEST("Bookie Herod") },
          text = "Bookie Herod takes bets from anyone with coin, and I think he takes coin from Kurzen too. Find out." },
        { id = "h_spy", when = { questActive = TODO_QUEST("The Spy Revealed!") },
          text = "So now we know who sold us. Good; now we deal with it, and quietly." },
        { id = "h_patrol", when = { questActive = TODO_QUEST("Patrol Schedules") },
          text = "If we know when Kurzen's men march, we know when to hit them. Bring me their schedules." },
        { id = "h_kurzen", when = { questActive = TODO_QUEST("Colonel Kurzen") },
          text = "It's time to end the Colonel. He won't come back to himself, and we've waited long enough to be sure." },
        { id = "h_roll", when = { metBefore = true }, text = "Called the roll this morning, and we're two short. They'll walk in by dusk or they won't, and I've stopped guessing which." },
        { id = "h_after", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Colonel Kurzen"), days = 3 } },
          text = "The men keep asking me what he said at the end. I tell them it doesn't matter, and I'd like to believe that myself." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf with totems. Kurzen's men started hearing things in this jungle too, so I'll have to ask what you're hearing." },
      },
      again = {
        { id = "h_again", text = "Go on. I've a few minutes before the next patrol comes in." },
        { id = "h_again2", text = "What else? Keep it short; I've a camp to run." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Quietly. Half the camp's asleep and the other half pretends to be." },
      },
      choices = {
        { text = "Why fight a war in a jungle that doesn't want you?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "What happened to Kurzen?", next = "mind" },
        { text = "Why walk away? Why not stop him then and there?", next = "left" },
        { text = "Has anyone betrayed your camp?", next = "informant" },
        { text = "There can't be many of you left.", next = "men" },
        { text = "I've been given a bad order before.", next = "soldier", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "My order fell apart too. Nobody told us why.", next = "squire", when = { origin = "human_paladin_squire" } },
        { text = "It's done. Kurzen's dead.", next = "done", when = { questDone = TODO_QUEST("Colonel Kurzen") } },
        { text = "I could pray over your dead, Lieutenant.", next = "priest_dead", when = { class = "PRIEST" } },
        { text = "What happened to your company, Lieutenant?", next = "xpt_doren", when = { party = { size = 4 }, faction = "Alliance" } },
        { text = "I'm here to help.", next = "END", fx = { affinity = 2, standing = { rebel_camp = 1 }, learn = { "kurzen" } } },
        { text = "I know something of spying, Lieutenant.", next = "k_rogue", when = { class = "ROGUE" } },
        { text = "I could track Kurzen's patrols for you.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "Could magic have turned Kurzen's mind?", next = "k_mage", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "Do you think the spirits drove Kurzen mad, Lieutenant?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Zul'Gurub's god is dead, Lieutenant. The jungle should be safer now.", next = "xcl_zg", when = { cleared = "Zul'Gurub", faction = "Alliance" } },
        { text = "I'll be going.", next = "END" },
      },
    },

    mind = {
      big = true,
      lines = {
        { id = "m_default", text = "Brother Nimetz thinks it was troll magic. To me it hardly matters what it was, because the man who led us here is gone." },
      },
      choices = {
        { text = "Troll magic? What does the Brother know?", next = "mind_nimetz", fx = { trait = { curious = 1 } } },
        { text = "He must have been a different man, before.", next = "mind_before" },
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 }, learn = { "kurzen" } } },
        { text = "Then let's finish it.", next = "END", fx = { affinity = 2, trait = { stern = 1 }, learn = { "kurzen" } } },
      },
    },
    mind_nimetz = {
      lines = {
        { id = "mn_default", text = "That his medicine men brew something, and the Colonel drank it first. Nimetz keeps samples in bottles by his cot. I don't sleep near them." },
        { id = "mn_priest", when = { class = "PRIEST" },
          text = "Ask him yourself; he'll be glad of a priest who can follow him, because I can't. I hear 'elixir' and 'curse' and stop listening at 'possibly'." },
      },
      choices = {
        { text = "I'll talk to him.", next = "BACK", fx = { learn = { "kurzen" } } },
        { text = "And if it can be cured?", next = "mind_cure" },
      },
    },
    mind_cure = {
      lines = {
        { id = "mc_default", text = "Then I'll be the first to cheer, and I'll still keep my sword on. A cure doesn't bring back the men he sent into the trees." },
      },
      choices = {
        { text = "Fair. Something else.", next = "BACK" },
        { text = "Mercy first, if there's any chance.", next = "BACK",
          fx = { align = { light = 2 }, trait = { kind = 1 }, opinion = { kurzen = "mercy" } } },
        { text = "A cure won't matter. He has to answer for them.", next = "BACK",
          fx = { align = { order = 2 }, trait = { stern = 1 }, opinion = { kurzen = "justice" } } },
      },
    },
    mind_before = {
      lines = {
        { id = "mb_default", text = "Careful, and fair. He'd walk the line at night and know every man's name, and that's the part I can't square." },
      },
      choices = {
        { text = "People change out here.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Then he's still in there somewhere.", next = "BACK", fx = { trait = { kind = 1 }, affinity = 1 } },
      },
    },

    left = {
      big = true,
      lines = {
        { id = "l_default", text = "With what? Most of the expedition went with him. We'd have been killing our own friends in the dark, and losing." },
      },
      choices = {
        { text = "You did the right thing.", next = "left_stormwind", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Stormwind will call it desertion.", next = "left_stormwind", fx = { affinity = -1, align = { order = 2 } } },
        { text = "Does Stormwind even know?", next = "left_stormwind", fx = { trait = { curious = 1 } } },
      },
    },
    left_stormwind = {
      lines = {
        { id = "ls_default", text = "I sent word, twice. If an answer came, it went to the Colonel's tent, so I've no idea what Stormwind thinks of us." },
        { id = "ls_noble", when = { origin = "human_minor_noble" },
          text = "I sent word twice and heard nothing, but your sort might know better than I do. Somebody in the Keep signed for this expedition, and I'd like to hear they still remember it." },
      },
      choices = {
        { text = "Does Stormwind even care what happens out here?", next = "op_stormwind" },
        { text = "I could carry word myself.", next = "left_word", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    left_word = {
      lines = {
        { id = "lw_default", text = "That's kind of you, but wait until it's over. I'd rather they read one report than two." },
      },
      choices = {
        { text = "Understood.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Their families shouldn't have to wait for word.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    informant = {
      lines = {
        { id = "i_default", text = "Someone told Kurzen's people what Thorsen was. Someone who comes and goes from this camp, or drinks with men who do." },
        { id = "i_herod", when = { questActive = TODO_QUEST("Bookie Herod") },
          text = "Herod takes bets on anything, including whether my patrols come back. A man like that doesn't care where his coin comes from." },
        { id = "i_known", when = { questDone = TODO_QUEST("The Spy Revealed!") },
          text = "We know now, and I won't say it twice. Some of the men drank with him." },
      },
      choices = {
        { text = "Could it be one of your own?", next = "informant_own", when = { ["not"] = { questDone = TODO_QUEST("The Spy Revealed!") } } },
        { text = "You must have plans for when you find him.", next = "informant_after" },
        { text = "You already have a name in mind, Lieutenant.", tag = "Persuade", next = "herod", when = { ["not"] = { questDone = TODO_QUEST("The Spy Revealed!") } },
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Jungle Secrets") }, { class = { "WARRIOR", "PALADIN" } } } } },
          fail = { next = "herod_no", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    informant_own = {
      lines = {
        { id = "io_default", text = "I've thought it. I look at every face at roll call and think it, and that's what this has done to us." },
      },
      choices = {
        { text = "Trust your men until there's proof.", next = "BACK", fx = { align = { honor = 2 }, affinity = 1 } },
        { text = "Then watch them. All of them.", next = "BACK", fx = { align = { honor = -2 }, trait = { cautious = 1 } } },
      },
    },
    informant_after = {
      lines = {
        { id = "ia_default", text = "Whatever a lieutenant does in a jungle with no court and no captain. I'd rather not decide that tonight." },
      },
      choices = {
        { text = "Hand him to Stormwind's justice.", next = "BACK", fx = { align = { order = 2 } } },
        { text = "Thorsen nearly died. Let him decide.", next = "BACK", fx = { align = { order = -1 }, trait = { stern = 1 } } },
      },
    },

    men = {
      lines = {
        { id = "mn2_default", text = "Enough to hold this clearing, but not enough to take Kurzen's Compound. Private Thorsen made it back from the Colonel's camp, thank the Light, and Brother Nimetz patches up the rest of us." },
      },
      choices = {
        { text = "Tell me about Thorsen.", next = "men_thorsen" },
        { text = "What do the men need most?", next = "men_need", fx = { trait = { generous = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    men_thorsen = {
      lines = {
        { id = "mt_default", text = "He volunteered to wear their colors and walk into their camp, and he came back thinner and quieter. Go easy with him." },
      },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 1 } } },
    },
    men_need = {
      lines = {
        { id = "mnn_default", text = "Food that isn't roots, dry boots, and a reason. Booty Bay sells the first two, if Krazek, our friend in the Bay, remembers we exist." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    soldier = {
      lines = {
        { id = "s_default", text = "Then you know there's a moment when you stop telling yourself it's strategy. Mine was a burning village. What was yours?" },
      },
      choices = {
        { text = "I'd rather not talk about it.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "I obeyed it. I still think about that.", next = "soldier_obeyed", fx = { trait = { pious = 1 } } },
        { text = "I refused it, and paid for it.", next = "soldier_refused", fx = { align = { honor = 2 } } },
        { text = "I never had that moment, because orders were orders.", next = "BACK", fx = { align = { order = 2 } } },
      },
    },
    soldier_obeyed = {
      lines = { { id = "so_default", text = "So did most of the men out there with Kurzen, and I don't hate them for it, but I can't let them past the trees." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    soldier_refused = {
      lines = { { id = "sr_default", text = "Good; somebody has to. Out here it was a whole camp of us, at least, and I'd not have liked doing it alone." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },

    squire = {
      lines = {
        { id = "sq_default", text = "The Silver Hand? I heard it broke after Lordaeron. Then you know what it's like to keep a camp going on habit when the people at the top stop answering." },
      },
      choices = {
        { text = "Habit and the Light. It's enough.", next = "BACK", fx = { align = { light = 2 }, affinity = 1 } },
        { text = "It isn't. That's why I'm out here.", next = "BACK", fx = { align = { light = -1 }, trait = { brave = 1 }, affinity = 1 } },
      },
    },

    done = {
      big = true,
      lines = {
        { id = "d_default", text = "Heard it from three men before you reached the clearing. I don't know if I'm meant to thank you or salute him." },
      },
      choices = {
        { text = "Both, maybe.", next = "done_now", fx = { align = { order = -1 }, affinity = 2, trait = { kind = 1 } } },
        { text = "He stopped being your colonel a long time ago.", next = "done_now", fx = { align = { order = 1 }, trait = { stern = 1 } } },
      },
    },
    done_now = {
      lines = {
        { id = "dn_default", text = "Now we bury who we can and take the rest home to Stormwind, assuming anyone there remembers sending us." },
      },
      choices = {
        { text = "They'll remember. I'll see to it.", next = "END", fx = { affinity = 2, standing = { rebel_camp = 2 } },
          journal = { first = "Told Doren that Stormwind would remember the Rebel Camp. I meant it when I said it.",
                      third = "{name} promised Lieutenant Doren that Stormwind would remember his men." } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_dead = {
      lines = { { id = "pd_default", text = "We buried them without a priest; Nimetz was busy with the living, and I said what words I could remember. Would you? The graves are past the tents, and the men would like to see it done properly." } },
      choices = {
        { text = "I'll go tonight.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, standing = { rebel_camp = 2 }, trait = { pious = 1 } } },
        { text = "Words over graves won't help anyone now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    herod = {
      lines = {
        { id = "hr_default", text = "I do, and I can't prove it. Bookie Herod takes wagers in Booty Bay, and half my men have placed a bet with him at one time or another, and a man who keeps a ledger of everyone's debts knows exactly who can be bought." },
        { id = "hr_secrets", when = { questDone = TODO_QUEST("Jungle Secrets") },
          text = "You've earned it, so here it is: Bookie Herod, in Booty Bay. My men bet with him, and a man who keeps a ledger of everyone's debts knows exactly who can be bought, but I've no proof yet, so it stays between us." },
      },
      choices = {
        { text = "Then let's find the proof.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    herod_no = {
      lines = {
        { id = "hn_default", text = "If I had a name, I'd not hand it to someone I've only just met. That's how Thorsen nearly died." },
        { id = "hn_rogue", when = { class = "ROGUE" },
          text = "I won't hand names to someone who walks as quietly as you do, because that's how Thorsen nearly died." },
      },
      choices = {
        { text = "I'd do the same in your boots.", next = "BACK" },
      },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "Then you know how it ends when someone talks, so I'll be watching what I say around you. Thorsen went in quiet and came back out half-dead, and somebody in this camp knew he was going." },
      },
      choices = {
        { text = "Then let me find your informant.", next = "informant" },
        { text = "Watch me all you like. I'm on your side.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Trust no one, Lieutenant. Me included.", next = "BACK", fx = { align = { honor = -1 }, trait = { skeptical = 1 } } },
      },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "You could, and you'd be the first one who came back with numbers instead of rumors. Kurzen's men move by night along the river, and they leave tracks a child could follow, which makes me think he wants us to follow them." },
      },
      choices = {
        { text = "Then I'll follow, and watch for the trap.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "How many of you are left?", next = "men" },
      },
    },
    k_mage = {
      lines = {
        { id = "xmg_default", text = "Brother Nimetz says troll magic, and I've no learning to argue with him. Kurzen was a hard man before, but he was never cruel, and then he was, and nobody could tell me why." },
      },
      choices = {
        { text = "And if it's a curse that can be lifted?", next = "mind_cure" },
        { text = "Some men only need an excuse to be cruel.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I keep my ears open and my mouth shut, mostly, but I'll answer what I can for someone on our side. Ask." },
    },
    background = { { id = "tp_bg", text = "Stormwind officer, Kurzen's expedition, and now this clearing. Every step of it was an order but the last.", next = "left" } },
    advice = { { id = "tp_ad", text = "If a soldier in Kurzen's colours offers you a drink, decline it, then walk away, and then run." } },
    kurzen = { { id = "tp_kurzen", text = "He was a good officer once, and don't let anyone tell you different. That's what makes this hard." } },
    bolvar = { { id = "tp_bolvar", text = "Highlord Fordragon is a soldier's soldier, and I'd trust him with my life, but Stormwind hasn't sent us a single company in months. I can't blame him for that, not entirely." } },
    varian = { { id = "tp_varian", text = "The king vanished on the road, and Stormwind stopped looking south. We've been forgotten down here, and I don't think it's an accident." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay sells to everyone, including Kurzen's men, and the goblins don't ask which side you're on. I've learned not to trust anyone who doesn't care." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The trolls of Zul'Gurub have been sending raiders into the jungle, and I've lost three scouts to them this month. If their god walks, this camp won't last a week." } },
    second_war = { { id = "tp_second_war", text = "I fought in the Second War as a young man, and I learned that the jungle is worse than any orc. I didn't think I'd ever come back here." } },
    holy_light = { { id = "tp_holy_light", text = "Brother Nimetz prays to the Light for every man we lose, and I've stopped asking whether it helps. It helps him, and that's enough." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "Some of my men go to the Arena on leave, and they come back with stories and wounds. I don't stop them, because it's better than going mad in camp." } },
    _none = { { id = "tp_none", text = "Ask the Brother. He does the thinking around here." } },
  },
}

P:NPC {
  key = "nimetz", id = TODO_NPC("Brother Nimetz"), name = "Brother Nimetz",
  bible = "bibles/stranglethorn.md", role = "priest", tier = "quest",
  communities = { "rebel_camp" }, temper = { "earnest" }, values = { "devout", "curious" },
  notices = { "class", "craft", "form" },

  impression = {
    first = "Brother Nimetz has glassware drying on every flat surface of a jungle camp, and he apologized to me for nearly knocking over a flask I hadn't touched. He tended the sick, and now he studies what drove them mad.",
    third = "{name} met Brother Nimetz at the rebel camp, a priest studying the sickness of mind that took Colonel Kurzen and his men.",
  },

  greetings = {
    { id = "g_op_stormwind", when = { gossip = { topic = "stormwind", stance = "distrust" } }, text = "Lieutenant Doren says you think the nobles have forgotten us. He didn't argue with you, which worried me more than if he had." },
    { id = "g_glass", text = "The Light keep you. Mind your step; I've glassware drying on every flat surface in this camp." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you again. Any news is welcome here, even bad news." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Shadow, is it? I study dark things for a living, and I'd still rather you stood downwind, though I'm mostly joking. Sit, if you like." },
    { id = "n_light", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "A servant of the Light, out here! Then pray with me tonight, for these men need it, and so do I." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist! Would you look at this residue for me? I've my suspicions, but a second eye never hurts." },
  },

  start = "hello",
  nodes = {
    op_light = {
      lines = {
        { id = "opl_default", text = "I believe it does, though some nights the jungle's louder than any prayer I know. Tell me plainly, since nobody in this camp will: what does the Light mean to you out here?" },
      },
      choices = {
        { text = "It's the only thing that keeps us whole.", next = "op_light_faith", fx = { affinity = 1, align = { light = 1 }, trait = { pious = 1 }, opinion = { the_light = "faith" } } },
        { text = "Prayers don't stop troll spears. Steel does.", next = "op_light_doubt", fx = { affinity = -1, align = { light = -1 }, opinion = { the_light = "doubt" } } },
        { text = "It's my calling, Brother. I'd not walk without it.", next = "op_light_faith", fx = { affinity = 2, opinion = { the_light = "faith" } }, when = { class = "PALADIN" } },
        { text = "Ironforge prays less and builds more, but we believe.", next = "op_light_respect", fx = { affinity = 1, opinion = { the_light = "respect" } }, when = { race = "Dwarf" } },
        { text = "I'd rather not say, Brother.", next = "BACK" },
      },
    },
    op_light_faith = {
      lines = {
        { id = "oplf_default", text = "Then you'll understand why I keep praying for Kurzen, even now. Thank you; it's a lonely thing to believe in a camp full of tired men." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_light_doubt = {
      lines = {
        { id = "opld_default", text = "Steel stops spears, I grant you, but it hasn't stopped one nightmare in this camp. I'll pray for you anyway, and you needn't thank me for it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_light_respect = {
      lines = {
        { id = "oplr_default", text = "Building is a kind of prayer, if you ask me, and the Ironforge chapels are the finest I've ever knelt in. I'll take your quiet belief over a loud one any day." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_nimetz = {
      big = true,
      lines = { { id = "xpt_nimetz_default", text = "It might ease it, but I'm a man of glassware as well as faith, and I want to know what causes it before I start praying at it. Faith without study gave Stormwind half its quack cures, and study without faith gave us Kel'Thuzad." } },
      choices = {
        { text = "Trust the Light, Brother. Some things can't be measured in glass.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Study first. Faith alone has let too many sick men die.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_zg = {
      big = true,
      lines = { { id = "xcl_zg_default", text = "I believe you, because I've treated men who only heard the drums from a distance and woke screaming for weeks. Whatever the Gurubashi priests served, it fed on the blood of the living, and I've spent years at this table trying to understand what such a hunger does to a mind." } },
      choices = {
        { text = "Places like that should be burned and forgotten, Brother.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Understanding it might cure the madness. Study what's left.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Will the madness fade now that Hakkar is gone?", next = "xcl_zg2" },
      },
    },
    xcl_zg2 = {
      lines = { { id = "xcl_zg2_default", text = "In some of them, perhaps, the ones whose minds were only bent and not broken. I've seen fevers break when their source was cut away, and if Zul'Gurub was the source, we may yet see men here sleep through the night." } },
      choices = {
        { text = "I hope you're right, Brother. Something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I've wondered, though I'd sooner blame the trolls' witch doctors. If the land here is sick, you'd feel it before I could find it under a lens, and I'd welcome your help with the men it has touched." } },
      choices = {
        { text = "I'll help you study it, Brother. Patience will cure them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some minds can't be saved. Spare your glassware.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It took the discipline out of them first, which in a soldier is the most frightening thing to watch, and then it took their loyalty. Good men who had drilled together for years turned on each other almost overnight, and I am still trying to understand why." } },
      choices = {
        { text = "Discipline is a soldier's armor. Without it, anything gets in.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Discipline only holds so long. Every soldier breaks eventually.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Anything Kurzen's men might have eaten or brewed, because I've begun to wonder whether some of the madness came out of a pot rather than a curse. The trolls know which leaves turn a man's mind, and I'd wager somebody learned it from them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Anything Kurzen's men might have eaten or brewed, because I've begun to wonder whether some of the madness came out of a pot rather than a curse. The trolls know which leaves turn a man's mind, and I'd wager somebody learned it from them. And watch what {pet} eats out there, too, because if I'm right about those leaves, the beasts may know about them before we do." },
      },
      choices = {
        { text = "If it's poison, it can be cured. I'll help you find it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Mad soldiers are dangerous. Better to put them down than cure them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I suspect everything, and I can prove nothing, which is the worst place a healer can be. The troll ruins are full of old curses, and Kurzen's camp is close to more than one of them, so I'd not rule out a spell." } },
      choices = {
        { text = "Let me examine the ruins. Magic leaves a trace.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Burn the ruins and be done with the curses.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Men who were good soldiers once, turned into things that kill without thinking, and I could do nothing to save them. If your power could find the cause, I'd take your help gladly, whatever the Light might say about it." } },
      choices = {
        { text = "The Light and I can work together on this.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light failed them. My power won't.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Traces of the elixir Kurzen's medicine men hand out to their soldiers, which makes a frightened man brave and a brave man reckless. A rogue might think it a fine thing to carry into a fight, but I watched one of Kurzen's men on it wade out to fight a river crocolisk bare-handed, and we buried what the crocolisk left." } },
      choices = {
        { text = "I'll leave it alone, Brother. It's your study.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little courage in a bottle might be useful, Brother.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_nimetz", tags = { "news" }, when = { party = { class = "PRIEST" }, faction = "Alliance" },
          text = "You travel with a priest, I see. I'd like a word with {companion} before you go, because the madness that took Kurzen's men wasn't a fever, and I'm beginning to think medicine alone won't cure it." },
        { id = "h_cl_zg", tags = { "news" }, when = { cleared = "Zul'Gurub", faction = "Alliance" }, text = "You've been to the heart of Zul'Gurub and come back whole, which I hadn't thought possible, and the Light be thanked for it. I'd like to hear what you saw there, if you have the stomach to tell me." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. Mind the glassware as you pass, friend, because there's residue in those flasks that I'd rather nobody carried out of this camp in a pocket." },
        { id = "h_default", key = true,
          text = "Brother Nimetz. I came with the Colonel's expedition to tend the sick, and now I study what made them sick in the mind." },
        { id = "h_mystery", when = { questActive = TODO_QUEST("Kurzen's Mystery") },
          text = "I have a theory about what took the Colonel. I need proof before I say it aloud." },
        { id = "h_witchery", when = { questActive = TODO_QUEST("Troll Witchery") },
          text = "Troll magic, I'm nearly sure of it now. Bring me what I asked for and we'll be certain." },
        { id = "h_maizoth", tags = { "news" }, when = { questActive = TODO_QUEST("Mai'Zoth") },
          text = "Mai'Zoth, an ogre mage, is the root of it all. I swore he'd die before anyone else lost their mind the way the Colonel did." },
        { id = "h_dreams", when = { metBefore = true }, text = "One of the men woke screaming the Colonel's name again. Whatever touched Kurzen's mind touches their dreams too." },
        { id = "h_maizoth_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Mai'Zoth"), days = 3 } },
          text = "I kept my vow, through your hands, and I said a prayer for him anyway. I'm not sure the Light approves of that, but I am." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Perhaps you can help me understand what drove Kurzen's men mad, since I've studied every herb and fever in the jungle and found nothing that explains it." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. The Light makes me wary of your craft, I'll admit, but I've seen worse in this jungle than anything you could summon." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Forgive my staring, but you hold yourself the way Kurzen's men did before the madness took them, and I find myself checking your eyes." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll go deeper into this jungle than any of us, so keep an eye out for strange leaves and roots, if you'd be so kind." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! You heal by earth and water, I'm told, and I'd welcome any healer who can tell me what this jungle did to these men's minds." },
      },
      again = {
        { id = "h_again", text = "Yes? Mind the flask by your elbow. That one I'm still not sure about." },
        { id = "h_again2", text = "Another question? Good; questions are the only medicine I trust out here." },
      },
      choices = {
        { text = "What made them sick?", next = "elixir" },
        { text = "A priest who studies like an alchemist? That's unusual.", next = "craft" },
        { text = "How are the men holding up?", next = "men" },
        { text = "Pray with me, Brother.", next = "pray", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Let me look at the residue.", next = "residue", when = { profession = "Alchemy" } },
        { text = "What did the madness do to Kurzen's soldiers, Brother?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What plants are you looking for, Brother?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What's in those flasks that I shouldn't pocket, Brother?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could the Light cure Kurzen's madness, Brother?", next = "xpt_nimetz", when = { party = { class = "PRIEST" }, faction = "Alliance" } },
        { text = "The Light keep you, Brother.", next = "END", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I know the jungle's plants. I could help with a cure.", next = "k_druid", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "Do you suspect magic drove Kurzen's men mad, Brother?", next = "xmage", when = { class = "MAGE" } },
        { text = "You must have seen terrible things in the jungle, Brother.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Could the jungle itself have poisoned Kurzen's mind, Brother?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I saw Hakkar's altar, Brother. It was worse than you imagine.", next = "xcl_zg", when = { cleared = "Zul'Gurub", faction = "Alliance" } },
        { text = "Keep your prayers, Brother, because they won't help out here.", next = "END", fx = { align = { light = -1 } } },
      },
    },

    elixir = {
      lines = {
        { id = "e_default", text = "Kurzen's medicine men hand out an elixir. It makes a frightened man brave and a brave man reckless. I'm not done studying it, and I'm certainly not drinking it." },
      },
      choices = {
        { text = "Who taught Kurzen's men to brew it?", next = "elixir_source", fx = { trait = { curious = 1 } } },
        { text = "Could it be undone?", next = "elixir_cure" },
        { text = "Be careful, Brother.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 }, learn = { "kurzen" } } },
      },
    },
    elixir_source = {
      lines = {
        { id = "es_default", text = "Not Kurzen's men; they haven't the learning. It's someone in this jungle who knows minds better than I'd like, and I've a name for him, and a vow to go with it." },
        { id = "es_known", when = { questDone = TODO_QUEST("Mai'Zoth") },
          text = "An ogre mage who knew minds better than I'd like. Knew, I should say; I keep correcting myself." },
      },
      choices = {
        { text = "A vow? That's a heavy thing for a healer.", next = "elixir_vow" },
        { text = "Something else.", next = "BACK", fx = { learn = { "kurzen" } } },
      },
    },
    elixir_vow = {
      big = true,
      lines = {
        { id = "ev_default", text = "I've sat with too many men who called for their mothers in a voice that wasn't theirs. Healing has to include stopping the wound." },
      },
      choices = {
        { text = "The Light would agree.", next = "BACK", fx = { align = { light = 2 }, affinity = 1 } },
        { text = "Careful. Vows like that change people.", next = "BACK", fx = { trait = { cautious = 1 }, affinity = 1 } },
        { text = "Good. Some things need killing.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    elixir_cure = {
      lines = {
        { id = "ec_default", text = "In the young ones who only drank once, perhaps. In the Colonel? I've stopped asking the Light for that one. It seemed greedy." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    craft = {
      lines = {
        { id = "c_default", text = "Every evening, for prayer and alchemy are both patience, clean hands, and knowing exactly what you put in. My abbot called it a hobby, but out here it's the job." },
      },
      choices = {
        { text = "Where did you learn?", next = "craft_learn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_learn = {
      lines = {
        { id = "cl_default", text = "Bandaging soldiers who'd been at the wrong mushrooms. You learn quickly what the body forgives and what it doesn't." },
        { id = "cl_dwarf", when = { race = "Dwarf" },
          text = "Ironforge, partly. A dwarf brewer taught me more about what makes a mind wander than any book, and he meant it as a joke, but it wasn't." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    men = {
      lines = {
        { id = "m_default", text = "Their wounds are mending well enough, but their minds are another matter. They argue about whether they're deserters, and I tell them the Light doesn't keep that ledger." },
      },
      choices = {
        { text = "Doesn't it?", next = "men_ledger", fx = { trait = { skeptical = 1 } } },
        { text = "And the one who leads you now?", next = "men_doren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    men_ledger = {
      lines = { { id = "ml_default", text = "If it does, I hope it's kinder than Stormwind's. Ask me again when this is over, and I may have a better answer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    men_doren = {
      lines = { { id = "md_default", text = "He carries every man in this camp on his back and won't let any of us carry a scrap of him, though you didn't hear that from me." } },
      choices = {
        { text = "I won't.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "He ought to hear it, and I'll tell him myself.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },

    pray = {
      lines = {
        { id = "p_default", text = "Gladly. It's been weeks since anyone here knew the words. Kneel, if the mud allows." },
      },
      choices = {
        { text = "For the men here.", next = "BACK", fx = { align = { light = 2 }, affinity = 2, trait = { pious = 1 } } },
        { text = "For your Colonel.", next = "pray_kurzen", fx = { align = { light = 3 }, trait = { kind = 1 } } },
      },
    },
    pray_kurzen = {
      lines = { { id = "pk_default", text = "Yes, yes, him too, and thank you. Doren would call that soft, and he'd be wrong." } },
      choices = {
        { text = "Does the Light reach this far, Brother?", next = "op_light" },
        { text = "Something else.", next = "BACK", fx = { affinity = 2 } },
      },
    },

    residue = {
      lines = {
        { id = "r_default", text = "Here, smell it, but don't taste it. What do you make of that green rim?" },
      },
      choices = {
        { text = "Something's been added that shouldn't dissolve.", next = "residue_right", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Just a bad batch. Spoiled herbs.", next = "residue_wrong" },
      },
    },
    residue_right = {
      lines = { { id = "rr_default", text = "That's what I thought: something carried, not brewed, which means someone's bringing it to them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "kurzen" } } } },
    },
    residue_wrong = {
      lines = { { id = "rw_default", text = "I'd hoped so too. Spoiled herbs don't make a whole camp dream the same dream." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_druid = {
      lines = {
        { id = "xdr_default", text = "Could you? The jungle grows the poison and, I'm told, the answer to it, and I've only my books and my glassware to tell one from the other. If you know the plants here, walk the riverbank with me tomorrow." },
      },
      choices = {
        { text = "I'll walk it with you, Brother.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The jungle's cures aren't the Light's, Brother. Don't mix them.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I study, I pray, and I listen to the men when they can't sleep, so I've learned a fair amount. Ask, and I'll share what I can." },
    },
    background = { { id = "tp_bg", text = "A priest with an alchemist's habits, sent with an expedition that needed a healer. It needed more than one." } },
    advice = { { id = "tp_ad", text = "Don't drink anything in this jungle you didn't see poured, not water, not wine, not medicine." } },
    kurzen = { { id = "tp_kurzen", text = "I prayed for him every night. Now I pray for whoever finally stops him." } },
    holy_light = {
      { id = "tp_holy_light", text = "The Light gives me strength to tend the sick, and I've needed it more in this jungle than anywhere else. I pray every night, and some nights it's the only thing I do." },
      { id = "tp_holy_light2", when = { class = "PRIEST" }, text = "You know what it is to pray over a man who won't wake, then. The Light doesn't always answer how we'd like, but it hasn't let me give up yet." },
    },
    zul_gurub = { { id = "tp_zul_gurub", text = "The trolls' blood magic has a smell to it, and I've caught it on the wind from the north. I'd study it if I dared, but I'd rather keep my soul." } },
    new_plague = { { id = "tp_new_plague", text = "I've read the reports from the north about the plague in Lordaeron, and I've wondered if something like it got into Kurzen's men. I pray it didn't, because I don't know how to cure that." } },
    scourge = { { id = "tp_scourge", text = "The Scourge are the dead raised by the plague, and the north is lost to them. I've seen enough death out here to know I don't want to see it walk." } },
    _none = { { id = "tp_none", text = "I'm afraid I've no answer. I'll add it to my list of questions; it's a long list." } },
  },
}

P:NPC {
  key = "thorsen", id = TODO_NPC("Private Thorsen"), name = "Private Thorsen",
  bible = "bibles/stranglethorn.md", role = "soldier", tier = "quest",
  communities = { "rebel_camp" }, temper = { "wary" }, values = { "loyal", "brave" },
  notices = { "stealth", "kit" },

  impression = {
    first = "Private Thorsen spent time inside Kurzen's force pretending to be one of them, and he still keeps his voice down out of habit. He knows more than he's said.",
    third = "{name} met Private Thorsen, who went among Colonel Kurzen's men in disguise and nearly did not come back.",
  },

  greetings = {
    { id = "g_careful", text = "Keep your voice down. This part of the jungle has ears, and some of them belong to Kurzen." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You ran into Kurzen's men, didn't you? They fight like they've got nothing left to lose, and they haven't." },
  },

  react = { { id = "r_stealth", on = "stealth", text = "Good, stay low. That's how I lived through Kurzen's camp, mostly." } },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "That they're orc witches, and that the jungle trolls' witch doctors are worse. Most of them say a good deal crazier things now, so I wouldn't take it to heart." } },
      choices = {
        { text = "I'll prove them wrong by fighting beside you.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let them fear me. Fear makes men careless.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the Colonel told them magic was the cause of everything that went wrong, and they believed him. I never knew if he was telling the truth or just looking for someone to blame, and I'm still not sure now." } },
      choices = {
        { text = "Kurzen lied to them. Magic didn't do this.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "He may have been right. Someone should investigate.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, Thorsen.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Without a second thought, because they saw demons in every shadow, real or not. The madness made them suspicious of everything, and a real demon walking into their camp would have set them screaming." } },
      choices = {
        { text = "Their madness was their own. I'd have walked in anyway.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd have left my demon behind, out of respect.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Good men taking orders from a mind that wasn't right anymore, and doing things to the trolls and to each other that they'd never have done in Stormwind. I played along to stay alive, and some nights I can't tell whether I was pretending or whether I was one of them for a while." } },
      choices = {
        { text = "You pretended to survive. The Light forgives that.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You did what you had to. Bury it and keep moving.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They did, to clear firing lines and make the trolls keep their distance, or so they said, but I watched them do it and some of them liked it too much. The jungle's growing back already, faster than I'd believe if I hadn't seen it, though it's growing back thorny." } },
      choices = {
        { text = "Kurzen must answer for that fire. It was done for cruelty.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Burning ground in a war is no worse than burning a farm.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Good, though keep your voice down, because I spent too long among Kurzen's men to talk loud anymore, and some of what I saw in there I'd sooner confess to someone than carry." },
        { id = "h_default", key = true,
          text = "Private Thorsen. I spent time inside Kurzen's force, pretending to be one of them, and nearly didn't come out, so I know what they're planning, or some of it." },
        { id = "h_supplies", tags = { "news" }, when = { questActive = TODO_QUEST("Supplies to Private Thorsen") },
          text = "Supplies from Booty Bay? Bless Krazek, he actually remembered us! I've been eating roots for a week." },
        { id = "h_secrets", when = { questActive = TODO_QUEST("Jungle Secrets") },
          text = "Kurzen's men carry orders, and orders are paper, and paper talks. Bring me what they carry; Lieutenant Doren needs to know what I know." },
        { id = "h_sleep", when = { metBefore = true },
          text = "I still wake up reaching for their uniform, and then I remember which side I'm on. It takes a moment longer than I'd like." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Kurzen's men feared magic more than anything, and I'll admit I still flinch a little when I see a spell cast." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. I spent months pretending to be one of Kurzen's men, and I'll tell you that his officers would've killed you on sight." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid. Kurzen's men burned a stretch of the jungle north of here to clear a camp, and I'd wager you can still smell it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Kurzen's lot would've called you a heathen, so I'm inclined to like you on principle." },
      },
      again = {
        { id = "h_again", text = "Something more? Speak softly; the jungle listens." },
        { id = "h_again2", text = "Go on, I'm listening. I'm always listening, these days." },
      },
      choices = {
        { text = "What was it like in there?", next = "inside" },
        { text = "They must be planning something.", next = "plans" },
        { text = "How were you found out?", next = "betrayed" },
        { text = "You can talk to me. I'm good at going unseen too.", next = "rogue", when = { class = { "ROGUE", "HUNTER" } } },
        { text = "What did you see inside Kurzen's camp, Thorsen?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'll help you.", next = "END", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Kurzen's war isn't mine, Private, and I'll stay out of it.", next = "END", fx = { align = { order = -1 } } },
        { text = "I'm a soldier, Private. What did they do to you?", next = "k_warrior", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Why did Kurzen's men fear magic so much, Thorsen?", next = "xmage", when = { class = "MAGE" } },
        { text = "Would Kurzen's officers really have killed me on sight, Thorsen?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Kurzen's men have burned a great swath of jungle, Thorsen.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What did Kurzen's men say about shamans, Thorsen?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Rest. I'll leave you be.", next = "END", fx = { trait = { kind = 1 } } },
      },
    },

    inside = {
      lines = {
        { id = "in_default", text = "Quiet, and that's what scared me. Nobody joked; they drank the medicine men's cup at dusk and stared at the fire like it was telling them something." },
      },
      choices = {
        { text = "Did you drink it?", next = "inside_drink" },
        { text = "You must have kept your nerve somehow.", next = "inside_nerve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inside_drink = {
      lines = { { id = "id_default", text = "I poured it down my shirt, mostly, and I do mean mostly. Brother Nimetz checks my eyes every morning and says they're fine, and I check them again after." } },
      choices = {
        { text = "You did well.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Tell Nimetz everything. Even the 'mostly'.", next = "BACK", fx = { trait = { cautious = 1 }, affinity = 1 } },
      },
    },
    inside_nerve = {
      lines = { { id = "inn_default", text = "I counted things: tents, boots, men on watch. You can't be afraid and count at the same time, so try it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    plans = {
      lines = {
        { id = "pl_default", text = "They march on a schedule, like soldiers still, and that's the strange part. Whatever's in their heads, the drill is still there." },
        { id = "pl_done", when = { questDone = TODO_QUEST("Patrol Schedules") },
          text = "Doren has their schedules now, thanks to you, and it's the first time in weeks we've known where they'll be before they get there." },
      },
      choices = {
        { text = "Then Doren can use that drill against them.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Do they still talk about Stormwind?", next = "plans_stormwind" },
      },
    },
    plans_stormwind = {
      lines = { { id = "ps_default", text = "Never, not once, as if it was somewhere they'd read about. That bothered me more than the trolls." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    betrayed = {
      lines = {
        { id = "b_default", text = "If I knew, I'd have told the Lieutenant before I'd sat down. Someone knew my face, and that's all I have." },
        { id = "b_known", when = { questDone = TODO_QUEST("The Spy Revealed!") },
          text = "The Lieutenant told me, but I'd rather not say it out loud. I liked him." },
      },
      choices = {
        { text = "Do you want revenge?", next = "betrayed_revenge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    betrayed_revenge = {
      lines = { { id = "br_default", text = "I want to sleep a whole night. Revenge comes after that, if there's room." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    rogue = {
      lines = {
        { id = "r_default", text = "Then tell me your trick for the moment someone looks right at you. Mine was to look bored. Bored men aren't spies." },
      },
      choices = {
        { text = "Mine's to look busy. Nobody stops a busy man.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Don't get looked at in the first place.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    k_warrior = {
      lines = {
        { id = "xwa_default", text = "They asked me questions and didn't wait for answers, {g:sir|ma'am}. I held out as long as I could, and I don't know if it was long enough, and that's the part that keeps me up." },
      },
      choices = {
        { text = "You held. That's all anyone can ask.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "What are they planning?", next = "plans" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A private in the Stormwind army, then a spy for a while, and a private again now. I liked being a private better." } },
    advice = { { id = "tp_ad", text = "Count things when you're scared: boots, tents, trees. It keeps your hands still." } },
    kurzen = { { id = "tp_kurzen", text = "The Colonel's not himself, and his officers aren't either. Whatever's in that compound is in their heads now." } },
    si7 = { { id = "tp_si7", text = "SI:7 trained me for a while, before they sent me here, and I learned to keep my mouth shut and my eyes open. That's all I can tell you, and that's more than I should." } },
    booty_bay = { { id = "tp_booty_bay", text = "I'd love a week in Booty Bay, just one, with a bed and a drink and nobody trying to kill me. Maybe when this is over." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "Kurzen's men trade with the trolls sometimes, I saw it with my own eyes. I don't know what they're buying, and I don't want to." } },
    _none = { { id = "tp_none", text = "I only know Kurzen, and that's more than enough." } },
  },
}
