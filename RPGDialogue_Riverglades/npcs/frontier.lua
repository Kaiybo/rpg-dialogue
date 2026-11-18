-- Outside Farholde's walls: Turner's Logging Camp and Wheeler's Grange. Voice: bibles/riverglades.md
local P = RPGDialogueAPI:Pack("rpgd.riverglades")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hurley", id = TODO_NPC("Hurley"), name = "Hurley",
  bible = "bibles/riverglades.md", role = "worker", tier = "quest",
  communities = { "farholde" }, temper = { "nervous" }, values = { "loyal", "kind" },
  notices = { "kit" },

  impression = {
    first = "Hurley worries for a living, or so it seemed, and most of his worrying is about Curly. He cuts trees for Turner and looks as if he hasn't slept properly in a month.",
    third = "{name} met Hurley, a fretful logger at Turner's camp who looks out for his friend Curly.",
  },

  greetings = {
    { id = "g_default", text = "Mind the stumps." },
    { id = "g_curly", text = "You haven't seen Curly, have you? No, of course you haven't." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like Curly after a lunch break. Sit down before something else falls off you." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If they do, they get their own back; one's flattened Curly twice this month. Turner says trees don't have feelings, but Turner's never had one fall on him." } },
      choices = {
        { text = "Thank the trees before you cut them.", next = "BACK", reply = "I do, quietly, when Turner isn't looking. It feels daft, but it feels dafter not to.", fx = { align = { light = 1 } } },
        { text = "Trees are timber. Cut them and be done.", next = "BACK", reply = "That's Turner's view, word for word. I'll keep my quiet thanks to myself, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Name's Hurley. I cut trees for Halligan Turner and keep my partner Curly from getting himself killed, and the trees are the easy part." },
        { id = "h_helping", tags = { "news" }, when = { questActive = TODO_QUEST("Helping Hands") },
          text = "Come on, come on. Curly's in trouble out there and we haven't much time." },
        { id = "h_after", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Helping Hands"), days = 3 } },
          text = "Curly's on his feet, mostly. He says thank you, and he also says he had it handled, which he didn't." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "Oh good, a fighter. If you're staying a bit, could you stand near Curly? He wanders, and the woods don't like wanderers." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Could you say a word for Curly while you're here? He'd laugh at it, but I'd feel better." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. Has your beast smelled anything odd in the woods? Because I keep smelling something odd, and Curly says it's me." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Oh! You gave me a start. Do you always come up on folk so quiet? Curly does that, and it takes a year off me every time." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Please tell me nobody's hurt; it's not Curly, is it?" },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. You couldn't conjure up a bit of luck, could you? I'm running short." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "You've got a... friend with you. Is it friendly? It isn't, is it? Could it stand over there, maybe?" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! You couldn't ask the trees to fall the right way, could you? Curly's been flattened twice this month." },
      },
      again = { { id = "h_again", text = "Something else? Quick, before Curly wanders off again." } },
      choices = {
        { text = "Who's Curly?", next = "curly" },
        { text = "Someone's been raiding your woodpiles, by the look of it.", next = "raids" },
        { text = "This looks like good logging country.", next = "logging" },
        { text = "How's Curly holding up?", next = "curly_after", when = { questDone = TODO_QUEST("Helping Hands") } },
        { text = "I'm a druid. These trees aren't yours to fell.", next = "xdruid", when = { class = "DRUID" } },
        { text = "What's out in those woods, Hurley?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Would a blessing really help?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What kind of odd smell?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Shall I keep an eye on the woodpiles at night?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Someone at the camp must be hurt.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why are you short on luck?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does my companion frighten you?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do the trees here mind being cut, Hurley?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck, Hurley.", next = "END" },
      },
    },
    curly = {
      lines = { { id = "c_default", text = "He's my partner, strong as an ox with the sense of a smaller one. I've found two gray hairs this month, and both have his name on them." } },
      choices = {
        { text = "Why keep working with him?", next = "curly_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    curly_why = {
      lines = { { id = "cw_default", text = "Because he'd do the same for me, and because nobody else will hold the other end of the saw." } },
      choices = { { text = "That's a good reason.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    raids = {
      lines = { { id = "r_default", text = "Somebody's been at the woodpiles at night, and spear-length pieces have gone missing. Halligan, the camp boss, thinks it's the Horde. I think so too, but I like to let Halligan be right first." } },
      choices = {
        { text = "I'll keep watch.", next = "BACK", fx = { affinity = 1, standing = { farholde = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    logging = {
      lines = { { id = "l_default", text = "Good timber, bad neighbours. Every beam in Farholde's walls came out of these woods, and probably every arrow in the cultists' quivers too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    curly_after = {
      lines = { { id = "ca_default", text = "Bandaged, grumpy, and eating for three. Halligan's docking his pay for the axe he lost, and he'll pay it, and I'll help." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdr_default", text = "Not mine, no, they're Turner's, or the Brotherhood's, or Stormwind's if anyone there remembers us. But the keep needs walls and the walls need timber, and every tree I fell is a soldier I don't have to bury." } },
      choices = {
        { text = "Walls first. The forest will grow back.", next = "BACK", reply = "That's what Turner says, and he's the one paying. The forest's patient, I suppose.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Take what you need, and not one tree more.", next = "BACK", reply = "I'd like that, and so would the deer. Tell Turner, though, not me.", fx = { align = { order = -1 } } },
      },
    },
    xwarcl = {
      big = true,
      lines = {
        { id = "xwc_default", text = "Cultists sometimes, Horde raiders after the woodpiles, and whatever eats the deer, which I've never seen and don't want to. Curly says he could take any of them, and that's exactly what worries me." },
      },
      choices = {
        { text = "I'll stand with Curly. Nothing gets past me.", next = "BACK", reply = "Thank you. Curly's brave, but he'd stand there and let a raider take the axe out of his hands.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let Curly get bitten, then. He'll learn.", next = "BACK", reply = "Bitten, he'd only laugh it off and go back to felling. He never learns, that's the trouble.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "It would for me. Curly's strong as an ox, but oxen get stuck in bogs too, and I've nothing to keep him safe but nagging, and a blessing's better than nagging." },
      },
      choices = {
        { text = "The Light watches over good men. I'll bless him.", next = "BACK", reply = "Bless him, then, and I'll owe you for it. He'll not even notice, but I will.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Blessings won't save him. Teach him some caution.", next = "BACK", reply = "I've tried for three years, friend, and he still walks into bogs. A blessing might stick better.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Like wet fur and campfire, down by the north woodpiles, the mornings after things go missing. Halligan says that's the Horde, and I expect he's right, but I wish they'd wash." },
      },
      choices = {
        { text = "I'll track them back and warn the Brotherhood.", next = "BACK", reply = "Good. The Brotherhood will want to know, and Turner will want them to know first.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll track them and deal with it myself.", next = "BACK", reply = "Just come back and tell me what it was. I'd like to sleep without wondering.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Would you? Halligan pays the lookout in stew, so I can't promise you much, but nobody hears a raider better than someone who walks the way you do." },
      },
      choices = {
        { text = "I'll catch them alive, for the Brotherhood to question.", next = "BACK", reply = "Alive's better, aye. The Brotherhood will have questions, and so will Turner.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they come, they won't be leaving.", next = "BACK", reply = "Then I'll sleep easier, and I'll not ask what happened. Stew's on the fire.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = {
        { id = "xap_default", text = "Not today, thank the Light. Curly's always cutting himself, though, and he won't let anyone look at it till it's gone green, so if you've anything for stubborn men, that's what we need." },
      },
      choices = {
        { text = "I'll see to him, whether he likes it or not.", next = "BACK", reply = "He'll not like it, but he'll thank you after. Maybe.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A grown man can tend his own cuts.", next = "BACK", reply = "He can, but he doesn't, and then he bleeds on the timber. Turner hates that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Because I spend it all on Curly. Every tree he fells lands a foot from his head, and every time I think, well, there goes another bit of luck." },
      },
      choices = {
        { text = "Luck runs out. Teach him to fell properly.", next = "BACK", reply = "I've tried, and he nods, and then a tree lands a foot from his head again. You try.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some men are just lucky. Let him be.", next = "BACK", reply = "Lucky, aye, so far. I just wish he'd spread it around a bit.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "A little, yes, no offense meant. Curly would want to pet it, and then I'd have to stop him, and I'm tired enough already." },
      },
      choices = {
        { text = "Don't worry. It stays on a short leash.", next = "BACK", reply = "Good. Curly will still want to pet it, but at least I'll know it won't bite.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's harmless, unless I say otherwise.", next = "BACK", reply = "Unless you say otherwise is what worries me. Keep it away from Curly, please.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a logger, with an axe in my hands since I was twelve, and a worrier since I met Curly." } },
    advice = { { id = "tp_ad", text = "If you hear singing in the woods and it isn't us, run." } },
    twilights_hammer = { { id = "tp_twilights_hammer", text = "The cult takes people from the glades, and they never come back. I worry about Curly every day he goes into the woods, and every day he comes back, I worry about tomorrow." } },
    thrall = { { id = "tp_thrall", text = "The Horde raids our woodpiles, and Turner says they're just stealing timber, but I don't sleep well knowing they're out there. I'd sleep better if they were somewhere else." } },
    holy_light = { { id = "tp_holy_light", text = "I pray every night that Curly comes home safe. I don't know if the Light's listening, but it doesn't hurt to ask." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask Halligan; he knows things, or says he does." } },
  },
}

P:NPC {
  key = "halligan", id = TODO_NPC("Halligan Turner"), name = "Halligan Turner",
  bible = "bibles/riverglades.md", role = "worker", tier = "quest",
  communities = { "farholde" }, temper = { "gruff" }, values = { "stern", "loyal" },
  notices = { "kit", "class" },

  impression = {
    first = "Halligan Turner runs his logging camp like a sergeant and seems to think anyone standing still owes him an hour's work. I'd wager he's softer on his people than he lets them see.",
    third = "{name} met Halligan Turner, the gruff boss of the logging camp that feeds Farholde its timber.",
  },

  greetings = {
    { id = "g_default", text = "If you're buying timber, talk. If you're just standing around, there's an axe over there." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Pick up a saw or pick a direction." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Arms like that, and you swing a sword? That's a waste; you'd fell an oak in an afternoon." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I mind anyone who's not working. If you can keep the cultists off the timber, you can talk to the trees all you like." } },
      choices = {
        { text = "I'll keep the cultists off your timber.", next = "BACK", reply = "Then talk to the trees all you like, and I'll stop minding. The cultists are worse than any spirits.", fx = { align = { order = 1 } } },
        { text = "The spirits don't work for loggers, Turner.", next = "BACK", reply = "No, but they don't pay rent either. Keep out of the way of the axes, at least.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Halligan Turner. This camp feeds Farholde its timber, the Brotherhood keeps the cultists off it, mostly, and I keep the loggers off each other." },
        { id = "h_after", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Helping Hands"), days = 3 } },
          text = "You brought Curly back. He's a good worker when he isn't being an idiot, so... thanks, and that's all you're getting." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. If you're here to bless the trees, they're getting cut down anyway, so save your breath." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter, good. My meat store keeps getting raided, and my lads couldn't track a cart down a road." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "I know your sort. Keep your hands where I can see them when you're near the payroll." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, out here? Has Sister Rowland sent you to nag me about the lads' cuts again?" },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Don't you start any fires in my camp, or you'll be paying for the timber." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "I don't care what you are, so long as that pet of yours can carry logs. Can it?" },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. Go on, then, tell me I'm cutting down your cousins; Hurley already warned me you lot would." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, standing still. Everybody here works, so if your spirits can carry a log, put them to it." },
      },
      again = { { id = "h_again", text = "What else? Daylight's money, so be quick." } },
      choices = {
        { text = "Is it safe, logging this far out?", next = "safe" },
        { text = "Working for the Brotherhood can't pay much.", next = "brotherhood" },
        { text = "Hurley says you're hard on Curly.", next = "curly", when = { heardLine = "hurley.h_default" } },
        { text = "I worked land like this, once.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "I could swing an axe for you, if you're short.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "Do the lads ever need a healer out here?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Something's been raiding your meat store.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Worried about your payroll, Turner?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Are your loggers well looked after?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why fear fire so much?", next = "xmage", when = { class = "MAGE" } },
        { text = "You'd really put my pet to work?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'd hope you replant what you cut.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do you mind a shaman in your camp, Turner?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "No. We post a lookout, work in pairs, and sing loud so we know where everyone is. The Horde hears us too, but you can't have everything." } },
      choices = {
        { text = "And when they come?", next = "safe_come" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_come = {
      lines = { { id = "sc_default", text = "We drop the axes and run for the keep. Logs don't care who wins." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brotherhood = {
      lines = { { id = "b_default", text = "They pay in silver when they have it and in promises when they don't, and I've had more promises than silver this year. Commander Brant keeps his promises, eventually." } },
      choices = {
        { text = "Is their protection worth the silver?", next = "bh_ask", fx = { learn = { "brotherhood_horse" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "brotherhood_horse" } } },
      },
    },
    -- Opinion pass: Halligan asks the player how he should deal with the raids.
    bh_ask = {
      big = true,
      lines = { { id = "bq_default", text = "Some months it is and some it isn't, with the Horde still raiding my woodpiles. You've seen both banks of the river, so you tell me: do I keep paying the Brotherhood, or make my own peace with the orcs and save the silver?" } },
      choices = {
        { text = "Pay the Brotherhood. They're all that stands between you and Rog'mar.", next = "bh_ask_pay", fx = { opinion = { brotherhood_horse = "trust" }, align = { order = 1 }, affinity = 1 } },
        { text = "Make your own peace. A woodpile isn't worth a life.", next = "bh_ask_peace", fx = { opinion = { peace = "for" }, align = { order = -1 } } },
        { text = "Arm your loggers and teach the raiders a lesson.", next = "bh_ask_fight", fx = { opinion = { peace = "against", horde = "hate" }, trait = { brave = 1 } } },
        { text = "That's your business, Turner.", next = "BACK" },
      },
    },
    bh_ask_pay = {
      lines = { { id = "bqp_default", text = "That's what my head says, and my purse says otherwise, every month. Fine; Brant gets his silver, and I get to complain about it, which is half the pleasure." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bh_ask_peace = {
      lines = { { id = "bqn_default", text = "Peace with orcs? Brant would have me hanged off my own sawhorse. But I'll own I've thought it, on the nights I'm counting what's missing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bh_ask_fight = {
      lines = { { id = "bqf_default", text = "My loggers can swing an axe, I'll give them that, but they swing it at trees. I'll not send Curly against a war party, and neither would you if you'd met him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    curly = {
      lines = { { id = "c_default", text = "Hard? I'm keeping him alive, and if that's hard, so be it." } },
      choices = { { text = "Fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    farmhand = {
      lines = { { id = "f_default", text = "Then you know how long a day is out here. Grab a saw if you get bored; I pay in stew." } },
      choices = { { text = "Maybe I will.", next = "BACK", fx = { affinity = 2 } } },
    },
    xwarrior = {
      lines = { { id = "xwa_default", text = "Short? I'm always short, and a fighter who knows which way a trunk will fall is worth two who don't. Stay an afternoon, and if the raiders come, you'll already be holding the right tool for them as well." } },
      choices = {
        { text = "An afternoon, then.", next = "BACK", fx = { affinity = 2 } },
        { text = "Is it safe out here?", next = "safe" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Every week. Axes slip, trees roll, and Curly exists, so I send them up to the keep, and Sister Rowland sends them back with a lecture for me. Stay a day if you like; you'd save me the lecture." },
      },
      choices = {
        { text = "I'll stay. Your lads deserve better care.", next = "BACK", reply = "Good. They'll grumble, and they'll be glad of you. Rowland will too.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better tools mean fewer accidents. That's your job, not mine.", next = "BACK", reply = "Better tools cost money I haven't got, and Curly would find a way to cut himself on a spoon. Suit yourself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Something with four legs and no manners, I'd guess. The Horde takes the wood, but it doesn't take the bacon, and the bacon's going too, so find out what, and I'll owe you." },
      },
      choices = {
        { text = "I'll track it and drive it off.", next = "BACK", reply = "Good. Drive it off and the lads will stop jumping at shadows.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll track it down and skin it.", next = "BACK", reply = "Skin it, and bring me the hide. We'll call it the camp's trophy.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Worried? I've got eleven men and one silver box, and I count both twice a day. You do the sums on which one keeps me up at night." },
      },
      choices = {
        { text = "Your silver's safe from me, Turner.", next = "BACK", reply = "Glad to hear it. I'll still count the box twice tonight, mind.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A box like that wants a better lock.", next = "BACK", reply = "It does, and so do I, but Farholde's locks are dear. I'll make do with counting.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = {
        { id = "xap_default", text = "Looked after? They're fed, they're paid, mostly, and they're alive, which out here is the best I can do. If you want to do better, there's a bucket and bandages by the saw pit." },
      },
      choices = {
        { text = "Then I'll do better. Show me the bucket.", next = "BACK", reply = "Then you're welcome to try, and you'll find the bucket by the stumps. The lads will be grateful.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fed and paid is enough. Grown men mend.", next = "BACK", reply = "That's my view too, mostly. They're tougher than they look.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Because the whole camp is dry timber and sawdust, and one careless spark puts me out of business by suppertime. The cultists tried it once, and the lads put it out with their lunch." },
      },
      choices = {
        { text = "Fair. I'll keep my spells cold here.", next = "BACK", reply = "Thank you. Cold spells I can live with, and so can the sawdust.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A careful mage doesn't start fires by accident.", next = "BACK", reply = "Careful, yes, and the last careful mage burnt my tent. Keep it cold, please.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Ha! If it can, I'll pay it in stew, same as everyone. If it can't, keep it out of the sawdust, because I don't want to know what it does when it's bored." },
      },
      choices = {
        { text = "It'll haul logs. Better than what it usually does.", next = "BACK", reply = "It'll haul logs? Then it's the hardest worker here, and I'll pay it in stew like the rest.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My servant isn't for hire, Turner.", next = "BACK", reply = "Not for hire, then, and not near my sawdust either. We'll get along fine.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "When I can, and I can't often. Farholde needs walls more than the glades need saplings, and I'll plant when the war's done, if anyone ever tells me when that is." },
      },
      choices = {
        { text = "Plant now. The glades won't wait for peace.", next = "BACK", reply = "You're right, and I know it. I'll plant a few saplings this spring, whatever the keep says.", fx = { align = { light = 1 } } },
        { text = "Walls first. Saplings can wait.", next = "BACK", reply = "That's how I see it, and Farholde agrees. The glades can wait a season.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Loggers gossip worse than fishwives, and I hear all of it whether I want to or not. Ask what you want." },
    },
    background = { { id = "tp_bg", text = "This is Turner's camp. My name's on it, so the blame is too." } },
    advice = { { id = "tp_ad", text = "Never stand downhill of a falling tree, or of a falling logger." } },
    brotherhood_horse = { { id = "tp_brotherhood", text = "Best customers I've got, and the only customers I've got." } },
    thrall = { { id = "tp_thrall", text = "The Horde's new warchief can call himself honorable all he likes, but his warriors steal my timber twice a week. Honor doesn't pay for lost wood." } },
    bolvar = { { id = "tp_bolvar", text = "The Regent wants the Riverglades held, and he wants it held cheaply, which means me and my loggers holding it with axes. I'd like to see him swing one." } },
    second_war = { { id = "tp_second_war", text = "The old war came through these woods, and my father cut timber for Farholde's walls. I'm still cutting it, and the walls still need it." } },
    _none = { { id = "tp_none", text = "That's not my business; trees are my business." } },
  },
}

P:NPC {
  key = "benjy", id = TODO_NPC("Benjy Wheeler"), name = "Benjy Wheeler",
  bible = "bibles/riverglades.md", role = "farmer", tier = "quest",
  communities = { "farholde" }, temper = { "stubborn" }, values = { "practical" },
  notices = { "kit" },

  impression = {
    first = "Benjy Wheeler watches the fields at Wheeler's Grange with the look of a man who has stopped expecting good news. The clicking of the reapers out in the rows doesn't seem to let anyone there sleep.",
    third = "{name} met Benjy Wheeler at Wheeler's Grange, where harvest reapers have overrun the fields.",
  },

  greetings = {
    { id = "g_default", text = "Careful by the fence. Those reapers don't stay in the field." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They walk the rows all night and never stop. If the earth can feel them, I hope it hates them as much as I do." } },
      choices = {
        { text = "Stay and fight for the grange, Benjy.", next = "BACK", reply = "I'm trying, I am, but there's only me and the porch. If you're staying too, I'll stay longer.", fx = { align = { order = 1 } } },
        { text = "Leave the grange. Fields can be planted again.", next = "BACK", reply = "Maybe they can, but my father planted these. I'll not leave them to the reapers yet.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Benjy Wheeler, and this is Wheeler's Grange. It was a farm, before the harvest reapers got into the fields, and now it's a farmhouse with a view of trouble." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Hear that clicking? That's them, all night, up and down the rows." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A fighter. Good; the reapers don't care about hoes, but they might care about that." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, out at the Grange. I'll not say no to the Light, though I'd take a sharpened scythe just as gladly." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter. The deer won't come near the fields anymore, so I hope you're not hungry for venison." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You crept up on me like a reaper, except they click and you don't, and I'm not sure that's better." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Folk out here used to walk to Farholde's chapel on rest days, before the reapers, and now nobody walks anywhere." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. If you can melt one of those reapers, I'll feed you till you burst." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Whatever that is beside you, keep it off the rows. I've enough things walking in them already." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. The soil's still good, you know; it's only the things walking on it that have gone wrong." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Reaper", min = 20 } }, text = "The clicking's quieter at night, and I've counted fewer reapers in the near rows this week. Somebody's been breaking them, and I've a fair idea who." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Can you hear the reapers in the rows? The ground has to feel that clicking too." },
      },
      again = { { id = "h_again", text = "Anything else? I've a fence to mend." } },
      choices = {
        { text = "Where did the reapers come from?", next = "reapers" },
        { text = "Why stay?", next = "stay" },
        { text = "Farholde's close. Can't they help?", next = "farholde" },
        { text = "Harvest golems ran my family off our farm too.", next = "westfall", when = { origin = "human_westfall_farmhand" } },
        { text = "Those reapers are machines. I could take one apart.", next = "xgnome", when = { race = "Gnome" } },
        { text = "There seem to be a great many reapers out there.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Could the Light drive the reapers off?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Where did the deer go?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do the reapers ever leave the fields?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why did folk stop walking to the chapel?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What are the reapers made of?", next = "xmage", when = { class = "MAGE" } },
        { text = "Afraid of my companion, Benjy?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The soil looks good under all this.", next = "xdruid", when = { class = "DRUID" } },
        { text = "What do the reapers do to your fields, Benjy?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Take care, Benjy.", next = "END" },
      },
    },
    reapers = {
      lines = { { id = "r_default", text = "Nobody tells a farmer that. They walk the rows like they're working them, but they're not; they're cutting anything that moves." } },
      choices = {
        { text = "What do they do at night?", next = "reapers_night" },
        { text = "I'll clear some of them out.", next = "BACK", fx = { affinity = 2, standing = { farholde = 1 } } },
      },
    },
    reapers_night = {
      lines = { { id = "rn_default", text = "They keep walking the rows, and you can hear them from the porch, click, click, click, till sunup. I've stopped noticing, and that's what worries me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stay = {
      lines = { { id = "s_default", text = "Because the house is still standing, and nobody else is going to keep it that way." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    farholde = {
      lines = { { id = "f_default", text = "They help when they can, but they've a war on and I've a fence, and I know which one the Commander's watching." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    westfall = {
      lines = { { id = "w_default", text = "Westfall? I heard it's bad over there, so you know they don't stop for anything. Stay off the rows after dark." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2 } } },
    },
    xgnome = {
      lines = { { id = "xgn_default", text = "Take one apart? I'd be glad to see it in pieces, so long as nobody puts it back together after. They click all night in the rows, and I can't tell anymore whether I'm hearing them or dreaming them." } },
      choices = {
        { text = "I'll bring you a gear for luck.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Where did they come from?", next = "reapers" },
      },
    },
    xwarcl = {
      big = true,
      lines = {
        { id = "xwc_default", text = "Too many to count from the porch, and I've tried. Every one you break, another seems to turn up the next week, though I couldn't tell you from where." },
      },
      choices = {
        { text = "I'll clear the near rows first, one at a time.", next = "BACK", reply = "Thank you. One row at a time is more than I've managed in months.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll wade in and smash every one I see.", next = "BACK", reply = "Then I'll watch from the porch and cheer you on. Mind the blades; they don't stop.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = {
        { id = "xpa_default", text = "Couldn't say. They're machines, and I don't know that the Light pays much mind to machines, but it might give a man the courage to walk out past the fence, and that'd be something." },
      },
      choices = {
        { text = "Courage is the Light's gift. I'll walk out with you.", next = "BACK", reply = "Would you? Then maybe I'll find the nerve after all. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Courage won't stop a blade. Stay behind the fence.", next = "BACK", reply = "You're right, and I'll stay behind it. I'm not brave, only stubborn.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhc_default", text = "Up the hills, past the woods, where it's quiet. The reapers cut anything that moves in the rows, and the deer learned that faster than we did." },
      },
      choices = {
        { text = "Then leave them be. They've earned some peace.", next = "BACK", reply = "I'd like that. Something on this farm should get to rest.", fx = { align = { light = 1 } } },
        { text = "I'll bring one back for your table anyway.", next = "BACK", reply = "That's kind of you, though I'd rather the deer kept their peace. Still, I'll not say no to supper.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xro_default", text = "Sometimes, and that's the worst of it. One came right up to the porch last month and stood there clicking till dawn, and I sat inside with the poker across my knees the whole night." },
      },
      choices = {
        { text = "Send for me next time. You shouldn't face that alone.", next = "BACK", reply = "I will, I promise. I sat there shaking for an hour, and I'd rather not do it again.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You should have fought it. Sitting doesn't help.", next = "BACK", reply = "With what? A rake? I'd be in pieces in the rows. But maybe you're right.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = {
        { id = "xap_default", text = "Because of the reapers, mostly, and the road's not safe besides. It's been a long time without a rest-day sermon, and I miss it more than I'd have guessed." },
      },
      choices = {
        { text = "Then I'll say a few words for you, right here.", next = "BACK", reply = "Would you? It's been so long since anyone did. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sermons won't clear the road. Swords will.", next = "BACK", reply = "They won't, and I know it. But a word or two might help me sleep.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmg_default", text = "Iron and old wood, and something that keeps them moving that I don't understand. Melt the iron and the rest would burn well enough, I'd guess." },
      },
      choices = {
        { text = "Careful. Fire in a field spreads fast.", next = "BACK", reply = "Careful, aye, the weeds are dry. Burn them on the road, if you can.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then I'll burn them, row by row.", next = "BACK", reply = "Then I'll stand back and watch, and pray the barn doesn't go with them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "Afraid? No. I'm afraid of the reapers, and of the winter, and of the Commander forgetting us out here, so your friend's somewhere down the list." },
      },
      choices = {
        { text = "Good. It's no threat to honest folk.", next = "BACK", reply = "Good. I've enough to be afraid of without your friend.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It ought to be higher on the list.", next = "BACK", reply = "Maybe it should, but there's only so much room on the list. I'll put it fifth.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xdr_default", text = "Good and dark, the best around Farholde. It's only the reapers that keep us off it, and the weeds have taken whatever rows the reapers haven't." },
      },
      choices = {
        { text = "Then it can be saved. I'll help clear it.", next = "BACK", reply = "Then you're the first who's said so in a year. Thank you, truly.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the weeds have it. It's past saving.", next = "BACK", reply = "Maybe it is, but I'll not give it up yet. My father planted these rows.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A farmer: was, is, and will be. There's nothing more to say about it that the dirt doesn't." } },
    advice = { { id = "tp_ad", text = "Stay off the rows after dark. The reapers don't sleep, and they don't ask who you are." } },
    holy_light = { { id = "tp_holy_light", text = "I used to pray for a good harvest, and now I pray the reapers stop clicking. Neither prayer seems to get answered." } },
    bolvar = { { id = "tp_bolvar", text = "Stormwind doesn't care about the fields out here, and it never has. We grow what we can, and we keep our heads down." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Somebody said a gnome could fix the reapers, but no gnome's come this far east. I'd pay well for one, if I had anything to pay with." } },
    _none = { { id = "tp_none", text = "I'm a farmer, so ask me about weather, or about reapers even, but not that." } },
  },
}
