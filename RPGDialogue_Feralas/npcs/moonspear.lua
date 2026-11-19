-- Latronicus and Vestia Moonspear, husband and wife at Feathermoon Stronghold (0.72.0).
-- Voice: bibles/moonspear.md. He fights the Hatecrest naga for Shandris; she reads the things he brings home.
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "latronicus", id = TODO_NPC("Latronicus Moonspear"), name = "Latronicus Moonspear",
  bible = "bibles/moonspear.md", role = "soldier", tier = "quest",
  communities = { "feathermoon" }, temper = { "brisk", "stern" }, values = { "dutiful", "loyal" },
  notices = { "soldier", "kit" },
  impression = {
    first = "Under the brusque manner he is fond of his wife.",
    third = "{name} met Latronicus Moonspear, Shandris Feathermoon's second, who leads Feathermoon's fight against the Hatecrest naga.",
  },

  greetings = {
    { id = "o_tyr_admire", when = { gossip = { topic = "tyrande", stance = "admire" } }, text = "The General says you spoke well of the High Priestess. That will earn you some patience from me, and I have very little to spare." },
    { id = "g_default", text = "State your business. The naga don't stop for pleasantries, so neither do I, and my boots have been full of seawater since dawn." },
    { id = "g_scales", when = { questActive = TODO_QUEST("Against the Hatecrest") }, text = "Bring me ten Hatecrest scales, in good condition. You know where the naga are." },
    { id = "g_shalzaru", when = { questDone = TODO_QUEST("Against Lord Shalzaru") }, text = "Ah, the one who put Shalzaru down. You're welcome on this island any time, and I mean that." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the naga have been busy in that time. I hope you have too." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The Sentinels tell me you've been of use around the Stronghold. Good; there's always more to do." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Word is you've put someone's back up here. Sort it out, because I've no time to referee." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry yourself like a soldier, and most who wash up on this island carry themselves like driftwood." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear's in tatters. See Pratt McGrubben at the stronghold before you go anywhere near Sardor's shore, or the naga will finish what someone else started." },
  },

  start = "hello",
  nodes = {
    op_horde = {
      lines = {
        { id = "oph_q", text = "The Horde's tauren sit at Camp Mojache across the Twin Colossals, and they fight the same ogres we do. My Sentinels ask me whether we should leave them be. What would you say?" },
      },
      choices = {
        { text = "Leave the tauren be. Fight the naga instead.", next = "op_horde_r1", fx = { align = { light = 1 }, opinion = { horde = "tolerate" } } },
        { text = "Drive them out. Feralas is kaldorei land.", next = "op_horde_r2", fx = { affinity = 1, align = { light = -1 }, opinion = { horde = "war" } } },
        { text = "The Horde has kept its word at Theramore. Let them keep it here.", next = "op_horde_r3", fx = { opinion = { peace = "peace" } }, when = { faction = "Alliance" } },
        { text = "Mojache means you no harm, Moonspear. You have my word.", next = "op_horde_r4", fx = { affinity = 1, opinion = { horde = "kin" } }, when = { faction = "Horde" } },
        { text = "That's not mine to say, Moonspear.", next = "BACK" },
      },
    },
    op_horde_r1 = {
      lines = {
        { id = "op_horde_r1", text = "That is the sensible answer, and the one the General has chosen. I would only add that I count their sentries all the same." },
      },
      choices = {
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    op_horde_r2 = {
      lines = {
        { id = "op_horde_r2", text = "Many of my Sentinels agree with you, and so might I on a worse day. But the naga come first, and I will not fight two wars to please my temper." },
      },
      choices = {
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    op_horde_r3 = {
      lines = {
        { id = "op_horde_r3", text = "Theramore is a long way from Feralas, but perhaps you're right. I'll leave the question to the General, which is where it belongs." },
      },
      choices = {
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    op_horde_r4 = {
      lines = {
        { id = "op_horde_r4", text = "Your word, from a stranger of the Horde, at Feathermoon. I'll write that down, and I'll hold you to it." },
      },
      choices = {
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Latronicus Moonspear, and I serve General Feathermoon and this Stronghold. If you're here to fight the naga, you're welcome, and if you're here for chit-chat, I'm afraid I'm unavailable." },
        { id = "h_fs", when = { questActive = TODO_QUEST("Feathermoon Stronghold") },
          text = "So Darnassus sent you. Good, because we need every blade we can get, and Darnassus sends us precious few." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Against the Hatecrest") },
          text = "Whatever the naga are doing at Solarsal, sooner or later they'll move to take this island for their own. I intend to counter that before it's too late." },
        { id = "h_scales", tags = { "news" }, when = { questRecent = { TODO_QUEST("Against the Hatecrest"), days = 3 } },
          text = "Those scales were more than satisfactory; I sent them down to Pratt to see what he can make of them. You've cut your teeth on the naga now." },
        { id = "h_shalzaru", tags = { "news" }, when = { questActive = TODO_QUEST("Against Lord Shalzaru") },
          text = "Lord Shalzaru is one of the crueler of their royals, and he's dug something up in a cave on the Isle of Dread. Stop him, and bring me what he found." },
        { id = "h_relic", when = { questActive = TODO_QUEST("Delivering the Relic") },
          text = "Take the relic to Vestia; she's just around the bend, no doubt with her nose in a book. I couldn't make heads or tails of it if there were a wager on it." },
        { id = "h_web", when = { questActive = TODO_QUEST("Lethtendris's Web") },
          text = "Lethtendris is in the satyrs' quarter of the old city, weaving her web of stolen magic. Bring it here, and we'll let that power go back into the wild before it does harm." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "One of our own, good. You'll understand why I don't let the island go unwatched for a single night." },
        { id = "h_dd_woodpaw", tags = { "news" }, when = { questDone = TODO_QUEST("The Woodpaw Gnolls") }, text = "Ginro tells me the Woodpaw paid for Raschal, and that you collected the debt. I'd have sent a patrol myself, but the naga keep my Sentinels on the shore." },
        { id = "h_human", when = { race = "Human" },
          text = "A human on Sardor Isle, and carrying a blade rather than a petition. Stormwind's envoys come to Darnassus asking for Sentinels often enough, so I suppose it's only fair that one of you finally came to us." },
        { id = "h_latro_soft", when = { npcFlagBefore = "latro_soft" },
          text = "You again, the one who argued me out of a grudge on my own shore. I've told Vestia about it, and she has not let me forget it for a single evening." },
      },
      again = {
        { id = "h_again", text = "Something else? Make it quick; the naga have had ten thousand years to plan, and I will not hand them another hour." },
        { id = "h_again2", text = "Go on. I can spare a moment more, Elune grant me patience." },
      },
      choices = {
        { text = "What are the naga up to?", next = "naga" },
        { text = "Shandris says you complain more than she does.", next = "shandris", when = { heardLine = "shandris.w_default" } },
        { text = "Have you family on the isle?", next = "vestia" },
        { text = "Any other news from the isle?", next = "courier" },
        { text = "Why fight the naga at all? Night elves aren't warmongers.", next = "strike" },
        { text = "Does the Alliance send Feathermoon any help?", next = "ally" },
        { text = "You speak of Stormwind as if it owed you something.", next = "xhuman_lat", when = { race = "Human" } },
        { text = "Vestia thinks better of the Alliance than you do.", next = "ally_vestia", when = { heardLine = "vestia.al_default" } },
        { text = "I've fought naga before. What should I know?", next = "veteran", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } } },
        { text = "Give me a task.", next = "BUSINESS" },
        { text = "The Woodpaw killed Raschal. Will the Sentinels go after them?", next = "dd_woodpaw", when = { questDone = TODO_QUEST("The Woodpaw Gnolls") } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    dd_woodpaw = {
      lines = {
        { id = "dd_woodpaw_1", text = "Not while Shalzaru's kin are digging in at Isle of Dread, and not with the Gordunni in the hills. Raschal was a good courier and a better friend, but the General counts her blades, and I can't spend them on gnolls when the naga are a day's swim away." },
      },
      choices = {
        { text = "Then I'll keep the gnolls in line myself.", next = "BACK", reply = "I won't stop you, and I'll see that Ginro knows it. Mind the southern camps, though; they fight dirty and they fight in packs.", fx = { align = { order = -1 } } },
        { text = "The General is right. The naga come first.", next = "BACK", reply = "She usually is, which is the most annoying thing about her. I'm glad someone outside the Sentinels sees it.", fx = { align = { order = 1 } } },
        { text = "Something else, Latronicus.", next = "BACK" },
      },
    },
    naga = {
      lines = { { id = "n_default", text = "Digging, mostly, in the old ruins across the water, and our scouts can't tell us what for. Royalty walks among their ranks and gives the orders, which means whatever they want, they want it badly." } },
      choices = {
        { text = "Who leads them?", next = "naga_lead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_lead = {
      lines = { { id = "nl_default", text = "A handful of their lords and ladies, each crueler than the last. Bring one of them down and you set their plans back weeks, if not months, and I'll take months gladly." } },
      choices = {
        { text = "Should Feathermoon fight the Horde as well?", next = "op_horde" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    shandris = {
      lines = { { id = "sh_default", text = "Does she now? Then she's been sleeping more than she lets on, which I'll take up with her. The General and I have kept this island watched since the day we landed, and neither of us has slept well since." } },
      choices = { { text = "Something else, Latronicus.", next = "BACK", fx = { affinity = 1 } } },
    },
    vestia = {
      lines = { { id = "v_default", text = "My wife, a fine priestess for this community and one of the most learned scholars you'll find anywhere. When I bring home something I don't understand, which is often, it goes to Vestia." } },
      choices = {
        { text = "She calls you Latro, doesn't she?", next = "vestia_latro", when = { any = { { questActive = TODO_QUEST("Delivering the Relic") }, { questDone = TODO_QUEST("Delivering the Relic") } } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vestia_latro = {
      lines = { { id = "vl_default", text = "She does, and so do my friends, and you are neither yet. Earn it on the shore, and we'll see." } },
      choices = { { text = "Then I'll go and earn it, Latronicus.", next = "BACK" } },
    },
    courier = {
      lines = { { id = "c_default", text = "Only that our courier never came back, and it's been more than a week, so I've had to declare him missing in action. Ginro Hearthkindle hasn't given up, though; speak with him, if you've time to spare." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    strike = {
      big = true,
      lines = { { id = "st_default", text = "We night elves are dedicated to peace and harmony, and that doesn't mean we wait politely for our throats to be cut. I'll protect this Stronghold's interests before the naga come for them, and that is my duty to the General." } },
      choices = {
        { text = "Striking first is how a careful soldier survives.", next = "BACK", reply = "Precisely, and I'm glad someone who isn't a Sentinel understands it, because Shandris has heard it from me often enough.", fx = { align = { order = 1 } } },
        { text = "Striking first makes you the aggressor.", next = "BACK", reply = "Perhaps, but the naga were aggressors long before the Stronghold was raised, and I would rather be called harsh than mourned.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ally = {
      big = true,
      lines = {
        { id = "al_default", key = true, fx = { hear = "alliance_takes_sentinels" },
          text = "Help? Stormwind's envoys come to the Temple of the Moon to ask how many Sentinels Darnassus can spare for the Alliance, and the answer is always more than it can spare for us. When the naga came up the Sardor shore, not one human ship sailed south to meet them." },
        { id = "al_nelf", when = { race = "NightElf" },
          text = "Between kaldorei, the Alliance is a fine bargain for Stormwind. They ask for our Sentinels to guard Ashenvale's roads and fill their councils, and Feathermoon receives what is left over, which this season was one courier who never arrived." },
        { id = "al_horde", when = { faction = "Horde" },
          text = "You'd enjoy the answer too much, so I'll keep it short. The Alliance remembers Feathermoon when it needs Sentinels, and forgets it when the naga come." },
      },
      choices = {
        { text = "Why does Darnassus keep agreeing to it?", next = "ally_why" },
        { text = "The Alliance stood with you at Hyjal. That debt runs both ways.", next = "BACK",
          reply = "It does, and I've heard it from the envoys in nearly those words. I only notice that the debt is always ours to pay and always paid in Sentinels.",
          fx = { align = { order = 1 }, opinion = { alliance = "trust" } } },
        { text = "Kaldorei blood shouldn't be spent on human quarrels.", next = "BACK",
          reply = "No, it shouldn't, and every Sentinel buried on this shore would say the same. Say it in Darnassus, though, and the priestesses will look at you as though you'd spat in the moonwell.",
          fx = { affinity = 1, align = { order = -1 }, opinion = { alliance = "distrust" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ally_why = {
      lines = {
        { id = "aw_default", text = "Because the High Priestess believes we cannot stand alone against what is coming, and she saw Hyjal with clearer eyes than mine. I obey her and I would die for her, but I am still allowed to count the cost." },
      },
      choices = {
        { text = "And what does the General think?", next = "ally_shandris" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ally_shandris = {
      big = true,
      lines = {
        { id = "as_default", text = "The General agrees with me more than she lets the envoys see, which may be why we hold an island at the edge of the map and not a chair in some council hall. She would sooner keep Feralas with her own blades than wait on a promise from a boy king's regents." },
      },
      choices = {
        { text = "A boy king's promise is still a promise. Keep faith with it.", next = "BACK",
          reply = "Spoken like someone who has never waited for a ship that didn't come. Still, the High Priestess would agree with you, and I'll not argue with her in her absence.",
          fx = { align = { honor = 1 } } },
        { text = "Then hold Feralas yourselves and let Stormwind keep its envoys.", next = "BACK",
          reply = "That is what we do, whatever Darnassus signs. The naga don't read treaties, and neither do I.",
          fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ally_vestia = {
      lines = {
        { id = "av_default", text = "She does, and she's welcome to, since she reads the Alliance's letters and I bury its absences. We have argued about it for longer than Stormwind has had walls, and neither of us has yet conceded an inch." },
      },
      choices = {
        { text = "Perhaps you're both right.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman_lat = {
      lines = {
        { id = "xl_default", text = "Not you, and I'll grant that you came here to fight rather than to ask. It's your lords I hold the grudge against, who'd borrow a thousand of my sisters to guard their caravans and couldn't spare a single ship when the naga rose." },
      },
      choices = {
        { text = "Then judge me by what I do on your shore.", next = "xhuman_lat_deeds", fx = { align = { honor = 1 } } },
        { text = "My lords don't answer to me, and I don't answer for them.", next = "xhuman_lat_cold", fx = { align = { honor = -1 } } },
        { text = "I've bled against the naga already. Count that.", tag = "Persuade", next = "xhuman_lat_soft",
          check = { pass = { any = { { questDone = TODO_QUEST("Against the Hatecrest") }, { questDone = TODO_QUEST("Against Lord Shalzaru") }, { disposition = { min = 65 } } } } },
          fail = { next = "xhuman_lat_fail", fx = { affinity = -1 } } },
      },
    },
    xhuman_lat_deeds = {
      lines = {
        { id = "xld_default", text = "Then bring me Hatecrest scales and we'll talk again. Deeds are the only coin I take on this island, and I've found that a human's spend as well as anyone's." },
      },
      choices = {
        { text = "I'll be back with them.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman_lat_cold = {
      lines = {
        { id = "xlc_default", text = "That's a soldier's answer, and I can't fault it. Keep your sword sharp, then, and let your lords and mine sort out who owes whom." },
      },
      choices = {
        { text = "Fair enough, Commander.", next = "BACK" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    xhuman_lat_soft = {
      lines = {
        { id = "xls_default", key = true, fx = { npcFlag = { set = { "latro_soft" } } },
          text = "You have, and I saw the scales myself. Very well: Stormwind's lords can keep their envoys, but you have earned the right to be counted as one of the Stronghold's own, and I'll say so to anyone who asks." },
      },
      choices = {
        { text = "That means more than a treaty.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman_lat_fail = {
      lines = {
        { id = "xlf_default", text = "Have you? I've not seen a single scale with your name on it. Go down to the Hatecrest shore and come back with something I can count." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Good day, Commander.", next = "END" },
      },
    },
    veteran = {
      lines = { { id = "ve_default", text = "Watch their sirens, because a naga warrior will hold you while the siren behind him does the killing. And never fight them waist-deep in the water, however good the footing looks." } },
      choices = { { text = "Good advice. Thank you, Commander.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A soldier of Darnassus, General Feathermoon's second, and Vestia's husband. In that order on duty, and the other order off it." } },
    advice = { { id = "tp_ad", text = "Assume your enemy will come for what's yours, and act before they do. I have buried Sentinels who were hoping the naga would stay in the sea." } },
    sentinels = { { id = "tp_sent", text = "The finest soldiers on Kalimdor, and the General is the finest of them. I'll argue the point with anyone." } },
    alliance = { { id = "tp_alliance", text = "A good bargain for Stormwind, and a costly one for us. The High Priestess thinks it's worth the price, and I am the one who digs the graves it costs.", next = "ally" },
      { id = "tp_alliance2", text = "Ask Vestia, if you want it praised. I'll only tell you how many Sentinels it has borrowed and how few ships it has sent back." } },
    tyrande = { { id = "tp_tyrande", text = "High Priestess Tyrande sent the general to hold Feralas, and the general sent me to hold the naga. Everyone in this chain knows what is expected of them." } },
    elune = { { id = "tp_elune", text = "Elune keeps my wife safe in those ruins, and my arrows keep the naga busy elsewhere. I trust both, but I sharpen the arrows myself." } },
    highborne = { { id = "tp_highborne", text = "The Highborne built the ruins my wife studies, and the naga are what the Highborne became under the sea. I find that a poor advertisement for their wisdom." } },
    dire_maul = { { id = "tp_dire_maul", text = "Eldre'Thalas was the Highborne's last great city, and now we call it Dire Maul because the ogres moved in. My wife grieves the name more than the city." } },
    queen_azshara = { { id = "tp_queen_azshara", text = "The naga call Azshara their queen still, after ten thousand years at the bottom of the sea. I knew Highborne who would have bowed to her too, and I was glad when the water closed over them." } },
    _none = { { id = "tp_none", text = "I've no time for that. Ask Shyria at the inn; she hears everything and has the time to repeat it." } },
  },
}

P:NPC {
  key = "vestia", id = TODO_NPC("Vestia Moonspear"), name = "Vestia Moonspear",
  bible = "bibles/moonspear.md", role = "scholar", tier = "quest",
  communities = { "feathermoon" }, temper = { "warm", "precise" }, values = { "curious", "kind" },
  notices = { "lore", "priest" },
  impression = {
    first = "She blushes a little when she calls her husband Latro.",
    third = "{name} met Vestia Moonspear, a priestess and scholar of Feathermoon Stronghold and Latronicus Moonspear's wife.",
  },

  greetings = {
    { id = "o_horde_war", when = { gossip = { topic = "horde", stance = "war" } }, text = "My husband says you'd drive the Horde out of Feralas. Please don't say so in front of him again, because he's already fighting one war and sleeping too little for it." },
    { id = "g_default", text = "Ishnu-alah! Yes, may I help you? Forgive the books; they multiply when I'm not looking, like moonmoths." },
    { id = "g_relic", when = { questDone = TODO_QUEST("Delivering the Relic") }, text = "Still working on that relic of yours, I'm afraid. It's being very stubborn, much like the man who sent it." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and I've filled another notebook in that time. Come and tell me where you've been." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "People here speak warmly of you, and in Feathermoon that's no small thing. Elune's blessings on you." },
  },

  notice = {
    { id = "n_lore", cat = "lore", when = { class = "MAGE" },
      text = "You've the look of someone who reads, and probably someone who reads things they shouldn't. I won't tell." },
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "A fellow priest! Then tell me, if you would, how you keep your prayers and your studies from fighting each other." },
  },

  start = "hello",
  nodes = {
    op_arcane = {
      lines = {
        { id = "opa_q", text = "That's the question I ask myself every time Latronicus brings me another relic, and I'd like an outsider's answer for once. What do you think of arcane magic?" },
        { id = "opa_q_mage", when = { class = "MAGE" }, text = "You're a mage, so you'll have weighed this longer than I have. I would hear what you think of the arcane, now that you've seen what it did to the highborne." },
      },
      choices = {
        { text = "It's a tool, Vestia. In careful hands it does great good.", next = "op_arcane_r1", fx = { align = { order = 1 }, opinion = { arcane_magic = "useful" } } },
        { text = "It's a disease, as you said. Every mage is a risk.", next = "op_arcane_r2", fx = { affinity = 1, align = { order = -1 }, opinion = { arcane_magic = "dangerous" } } },
        { text = "It burned the Well of Eternity. Your people were right to forbid it.", next = "op_arcane_r3", fx = { affinity = 2, opinion = { arcane_magic = "wrong" } }, when = { race = "NightElf" } },
        { text = "It's power, and power is worth the risk.", next = "op_arcane_r4", fx = { affinity = -2, trait = { ambitious = 1 }, opinion = { arcane_magic = "power" } } },
        { text = "I'll leave magic to the scholars, Vestia.", next = "BACK" },
      },
    },
    op_arcane_r1 = {
      lines = {
        { id = "op_arcane_r1", text = "Careful hands, yes, and I've seen how rare those are. I'll hope yours are among them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_arcane_r2 = {
      lines = {
        { id = "op_arcane_r2", text = "I said I study it like a disease, and I meant only that I am careful. I'd not call every mage a risk, though I understand why you would." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_arcane_r3 = {
      lines = {
        { id = "op_arcane_r3", text = "We were, and the Sisterhood still teaches it to every novice. Remember it whenever a relic whispers to you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_arcane_r4 = {
      lines = {
        { id = "op_arcane_r4", text = "That is exactly what Queen Azshara believed, and you've seen what her people became in the water. Be careful, please." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Vestia, a priestess of this community, and a scholar when the community lets me be one. My husband says I'd read the naga's shopping lists if he brought them home, and he isn't wrong." },
        { id = "h_relic", when = { questActive = TODO_QUEST("Delivering the Relic") },
          text = "Hold on, you're the one who's been helping General Feathermoon and Latro with the naga, aren't you? Erm, Latronicus, I mean. Do you have something for me from him?" },
        { id = "h_relic_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Delivering the Relic"), days = 3 } },
          text = "That relic from Solarsal doesn't belong there, I'm nearly sure of it, and it isn't of naga design either. It will take time, but I mean to find out what it is." },
        { id = "h_npriest", when = { race = "NightElf", class = "PRIEST" },
          text = "A sister of the moon, or nearly! Sit down, please, and tell me what news there is from the Temple." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I'm happy to put the book down; it's waited a few centuries, it can wait a few minutes more." },
        { id = "h_again2", text = "Ask away. I've been talking to parchment all morning." },
      },
      choices = {
        { text = "What do you make of the relic?", next = "relic", when = { questDone = TODO_QUEST("Delivering the Relic") } },
        { text = "What are you studying?", next = "study" },
        { text = "Tell me about your husband.", next = "latro" },
        { text = "What do you make of the naga?", next = "naga" },
        { text = "How do you balance prayer and study?", next = "priest", when = { class = "PRIEST" } },
        { text = "What do you make of the Alliance, Vestia?", next = "ally" },
        { text = "Latronicus says Stormwind never sent a ship.", next = "ally_latro", when = { heardLine = "latronicus.al_default" } },
        { text = "I'm from Ironforge. Do your books have room for dwarves?", next = "ally_dwarf", when = { race = "Dwarf" } },
        { text = "Do you have anything for me?", next = "BUSINESS" },
        { text = "I'll leave you to your books.", next = "END" },
      },
    },
    relic = {
      lines = { { id = "r_default", text = "It's strange, very strange, and it's giving me a headache. It doesn't match the ruins it came from, and it isn't naga work, and I'm afraid it's something altogether more alien than either." } },
      choices = {
        { text = "Alien? What do you mean?", next = "relic_alien" },
        { text = "Something else.", next = "BACK" },
      },
    },
    relic_alien = {
      lines = { { id = "ra_default", text = "The workmanship follows no school I know, and I know a great many. When I've studied it properly I may have need of you again, if you're still around." } },
      choices = {
        { text = "Some things are better left unstudied.", next = "relic_stance" },
        { text = "I'll come back when you know more.", next = "relic_stance" },
      },
    },
    relic_stance = {
      big = true,
      lines = { { id = "rs_default", text = "Perhaps, but not knowing has never kept anyone safe that I've heard of. The naga dug this out of the ground for a reason, and I mean to understand that reason before it surprises us." } },
      choices = {
        { text = "Knowledge is the best shield we have. Keep at it.", next = "BACK", reply = "Thank you, and I'll tell Latronicus you said so, since he worries every time I open one of these crates.", fx = { align = { order = -1 } } },
        { text = "Be careful. Some secrets are buried for a reason.", next = "BACK", reply = "I am careful, I promise you, and I keep a ward on the table, but I would still rather understand than guess.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    study = {
      lines = { { id = "s_default", text = "Whatever comes to hand, which out here means the ruins of Solarsal and the sea's leavings. The highborne built along this coast long ago, and the naga are digging up what's left of it." } },
      choices = {
        { text = "The highborne? Isn't that dangerous ground?", next = "study_high" },
        { text = "Something else.", next = "BACK" },
      },
    },
    study_high = {
      lines = { { id = "sh_default", text = "It is, and I study it the way one studies a disease, carefully and without falling in love with it. The highborne's magic nearly ended our people once, and remembering that is half of why I read." } },
      choices = {
        { text = "What do you think of the arcane yourself?", next = "op_arcane" },
        { text = "A wise way to put it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    latro = {
      lines = { { id = "l_default", text = "He's brusque and tired and very good at what he does, and he's kinder than he lets anyone see. He brings me puzzles the way other husbands bring flowers, and I like puzzles better." } },
      choices = { { text = "He seems lucky to have you.", next = "BACK", fx = { affinity = 1 } } },
    },
    naga = {
      lines = { { id = "n_default", text = "They worry me more than they worry Latro, and I lose sleep over them. They're not simply raiding; they're excavating, carefully, as if they know exactly what they're looking for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ally = {
      big = true,
      lines = {
        { id = "al_default", key = true,
          text = "I think it's the best thing that has happened to our people since Hyjal, and I'll say so even in this Stronghold. For ten thousand years we spoke to nobody but the trees and each other, and we were very nearly too proud to notice the Legion coming back." },
        { id = "al_human", when = { race = "Human" },
          text = "I think it's the best thing to happen to us since Hyjal, and you may tell Stormwind a kaldorei priestess said so. Your people remember things we forgot, because they've had to write everything down before they die." },
        { id = "al_horde", when = { faction = "Horde" },
          text = "I think we needed friends, and the Alliance were the ones who offered. I'd say the same of the tauren at Mojache, if my husband weren't listening from the archery range." },
      },
      choices = {
        { text = "Your husband doesn't seem to agree.", next = "ally_latro" },
        { text = "Kaldorei and humans together are stronger than either alone.", next = "BACK",
          reply = "That's what the High Priestess believes, and what I believe, and what Latro believes on the rare days when he's had enough sleep. Elune bless you for saying it aloud here.",
          fx = { affinity = 1, align = { light = 1 }, opinion = { alliance = "trust" } } },
        { text = "Proud or not, your people did fine alone for ten thousand years.", next = "BACK",
          reply = "Did we? We slept, and the world went on without us, and we woke to orcs in Ashenvale and demons on Hyjal. I'm not sure I'd call that fine.",
          fx = { align = { light = -1 }, opinion = { alliance = "distrust" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ally_latro = {
      lines = {
        { id = "alt_default", text = "He's right that no ship came, and he's wrong about why. Stormwind is a young kingdom fighting the Defias in its own fields and the Blackrock on its borders, and a city that can't keep its own roads safe has no ships to send to Feralas." },
      },
      choices = {
        { text = "Does he ever listen to you on this?", next = "ally_young" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ally_young = {
      lines = {
        { id = "ay_default", text = "He listens, and then he goes to the shore and counts his Sentinels, and I can't blame him for that. But the young ones in the Stronghold ask me about Stormwind and Ironforge and the sea, and I would rather they went to see the world than spent a thousand years watching a beach." },
      },
      choices = {
        { text = "The young should go. The world won't wait for them.", next = "BACK",
          reply = "That's what I tell them, very quietly, when Latro isn't near. Two have already asked the hippogryph master about Theramore.",
          fx = { align = { order = -1 } } },
        { text = "Someone has to watch the beach. Duty comes first.", next = "BACK",
          reply = "Spoken like my husband, and you're not wrong, either of you. I only wish duty didn't always look like the same stretch of sand.",
          fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ally_dwarf = {
      lines = {
        { id = "ad_default", text = "All the room in the world! Your Explorers' League has been digging up the titans' work for years, and I would give a season's wages to read what they've written. Latro grumbles that dwarves dig too much, but he grumbles about the tide as well." },
      },
      choices = {
        { text = "I'll ask the League to send you their journals.", next = "BACK", fx = { affinity = 1 } },
        { text = "He's right. We do dig too much.", next = "BACK", reply = "Then you're the first dwarf I've met who admits it, and I'll tell him so. He'll be insufferable for a week." },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "p_default", text = "I don't think prayer and study fight at all. Elune gave us minds, and I can't believe she wants them left on the shelf." } },
      choices = { { text = "I agree, Vestia.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A priestess, a scholar and Latro's wife. I've been asked which matters most, and I've never managed an answer." } },
    advice = { { id = "tp_ad", text = "Write things down, {class}. I trusted my memory for centuries before I learned that it keeps what it likes, not what happened." } },
    alliance = { { id = "tp_alliance", text = "The best thing to happen to our people since Hyjal, and I'll say so in front of my husband.", next = "ally" },
      { id = "tp_alliance2", text = "Humans write everything down because they haven't time to remember it, and their libraries are better for it than ours. That alone was worth an alliance to me." } },
    highborne = { { id = "tp_hb", text = "The Highborne were brilliant and reckless, and their reckless brilliance broke the world. I study them so I'm never tempted to admire them." } },
    elune = { { id = "tp_elune", text = "I am a priestess of Elune before I am a scholar, though Latro says the order runs the other way. He is usually right about me, which is very annoying." } },
    dire_maul = { { id = "tp_dire_maul", text = "The library of Eldre'Thalas was the greatest the Highborne ever built, and it is still there, under the ogres. I would sit through a century of ogre grunting to read a single shelf of it." } },
    queen_azshara = { { id = "tp_queen_azshara", text = "The tablets Latro brings back from the naga ruins speak of Azshara as a goddess. It is chilling to read, and very well written, which is more chilling still." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids walk in the Dream, and the priestesses of Elune pray beneath the moon, and we have had ten thousand years to argue about which is wiser. I think we are both a little right." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande blessed our marriage herself, and Latro cried, though he will tell you it was the incense. Please do not tell him I told you." } },
    _none = { { id = "tp_none", text = "I'm afraid that isn't in any of my books, and not in the Temple's either. Not yet, at least." } },
  },
}
