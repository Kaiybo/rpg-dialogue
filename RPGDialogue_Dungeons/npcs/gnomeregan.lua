-- Gnomeregan: Kernobee, a dazed gnome wandering the irradiated halls; Emi Shortfuse, the survivor
-- who holds the workshop door in Grubbis's event; and Mekgineer Thermaplugg, the traitor on his throne.
-- Voices: bibles/dg_kernobee.md, bibles/dg_emi_shortfuse.md, bibles/dg_thermaplugg.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Kernobee: a gnome survivor wandering in a radiation daze, escorted out in "A Fine Mess".
---------------------------------------------------------------------------
P:NPC {
  key = "dg_kernobee", id = TODO_NPC("Kernobee"), name = "Kernobee",
  bible = "bibles/dg_kernobee.md", role = "escort", tier = "quest",
  temper = { "confused", "cheerful" }, values = { "curious", "kind" },
  notices = { "race" },
  impression = {
    first = "He seems pleasantly unaware that his hair is faintly glowing.",
    third = "{name} found Kernobee wandering the halls of Gnomeregan.",
  },

  greetings = {
    { id = "g_default", text = "Oh, hello! Are you the new shift? Nobody's been by in ages, and the coffee pot's gone all green." },
    { id = "g_mess", when = { questActive = TODO_QUEST("A Fine Mess") }, text = "Scooty sent you? Splendid! I've been meaning to go up and see him, only the stairs keep moving around." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome! Which department are you with? I'm with... well, it'll come to me." },
  },

  start = "hello",
  nodes = {
    w8_mem = {
      lines = { { id = "w8_mem_a", text = "Breakfast! Toast with gear-grease jam, which is a joke, it's apricot, and the morning siren going off three times instead of twice. I thought someone had miscalibrated it and went to file a complaint, and then I seem to have filed it with the troggs." } },
      choices = {
        { text = "The siren was the evacuation warning, Kernobee.", next = "w8_mem2" },
        { text = "Apricot jam sounds lovely.", next = "w8_mem2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w8_mem2 = {
      lines = { { id = "w8_mem2_a", text = "Was it? Oh dear, that does make the complaint look rather silly. Still, I'd like to file it properly when we get to Ironforge, because three sirens is very confusing for those of us who only listened for two." } },
      choices = {
        { text = "I'll help you file it.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "Kernobee, assistant engineer, third level, west wing. Or east wing. Something's happened to the signs, and to the walls, and to the troggs, come to think of it." },
      },
      again = { { id = "h_again", text = "Sorry, where were we? I lose the thread a bit lately, and sometimes the spool as well." } },
      choices = {
        { text = "Kernobee, Gnomeregan was evacuated.", next = "evac" },
        { text = "Do you remember the troggs coming?", next = "troggs" },
        { text = "Your hair is glowing, Kernobee.", next = "hair" },
        { text = "What were you working on, before?", next = "work" },
        { text = "I'm from Tinker Town. Do you remember me?", next = "tinker", when = { race = "Gnome" } },
        { text = "Come with me. I'll get you out.", next = "escort" },
        { text = "Do you have any family, Kernobee?", next = "yfamily" },
        { text = "What's the last thing you remember clearly?", next = "w8_mem" },
        { text = "Stay safe. I'll be back.", next = "END" },
      },
    },
    evac = {
      lines = { { id = "e_default", text = "Evacuated? Oh, that explains the quiet, because I thought it was a holiday. Did everyone get out, Mekkatorque and the whole lot of them?" } },
      choices = {
        { text = "Many didn't. I'm sorry.", next = "BACK", fx = { affinity = 1 } },
        { text = "Mekkatorque got out. He's in Ironforge now.", next = "mekkatorque" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mekkatorque = {
      lines = { { id = "mk_default", text = "Ironforge! With the dwarves and their enormous beards? Well, good for him, though I do hope somebody's told him the coffee pot on level three needs replacing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troggs = {
      lines = { { id = "t_default", text = "I remember a lot of shouting, and a green fog, and somebody saying the radiation would fix everything. I don't think it fixed anything, and I've been feeling a bit funny, honestly." } },
      choices = {
        { text = "Who said the radiation would fix things?", next = "thermaplugg" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thermaplugg = {
      lines = { { id = "th_default", text = "Oh, that was Mekgineer Thermaplugg, he's very senior, and he said it with such confidence that we all believed him. I saw him go down toward the core afterwards, and I don't think he came back up, which is odd for a man so keen on fixing things." } },
      choices = {
        { text = "Thermaplugg betrayed you all.", next = "BACK", reply = "Did he? Oh dear, and he always remembered my birthday, or somebody's birthday, anyway." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hair = {
      lines = { { id = "hr_default", text = "Is it? Oh, how lovely, I always wanted to be distinguished. I did wonder why I could read my notes in the dark, and I thought perhaps I'd simply become very good at reading." } },
      choices = {
        { text = "That's the radiation. You need a healer.", next = "BACK", reply = "A healer! Splendid idea, I'll pencil that in for after my shift.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "wk_default", text = "Pressure valves, mostly, and one very promising little steam regulator that only exploded twice. It's somewhere on my bench, unless the troggs ate it, and they do eat the strangest things." } },
      choices = {
        { text = "Was it worth staying behind for?", next = "stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "sy_default", text = "Staying behind? I don't think I meant to stay, I just went back for my notes and then everybody was gone. It's funny how a person can miss an entire evacuation by being thorough." } },
      choices = {
        { text = "Your notes aren't worth your life.", next = "BACK", reply = "No, I suppose not, though they were very good notes, with diagrams.", fx = { align = { order = 1 } } },
        { text = "Good work is worth a few risks.", next = "BACK", reply = "That's what I always say! Well, I think I do. It sounds like me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tinker = {
      lines = { { id = "tk_default", text = "Tinker Town, is that a new department? You do look awfully familiar, now that I squint, so perhaps we shared a lift once, or a lunch, or possibly an explosion." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    escort = {
      lines = { { id = "es_default", text = "Out? To the surface? With the sky and everything? Oh, yes please. I'll stay close and try not to wander off. Try." } },
      choices = {
        { text = "Every survivor matters. We go together.", next = "BACK", reply = "That's very kind. You remind me of somebody, though I can't remember who.", fx = { align = { order = 1 } } },
        { text = "Keep up, or I can't help you.", next = "BACK", reply = "Right, right. Keep up. I can do that, I think.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfamily = {
      narr = "He pats his pockets, as though his family might be in one of them.",
      lines = {
        { id = "yfa_default", text = "A wife, I'm nearly sure, called Nibbly or Nobbly, with lovely spectacles. She was on the evening shift. Do you think she got out? I'd like to think she got out and is cross with me for being late." },
        { id = "yfa_gnome", when = { race = "Gnome" }, text = "A wife, Nibbly or Nobbly, with lovely spectacles, on the evening shift. You're from Tinker Town, you said? Could you ask about her? I'd like to think she's there, and cross with me for being late." },
      },
      choices = {
        { text = "I'll ask in Tinker Town for her.", next = "BACK", reply = "Oh, would you? Tell her I'm coming, eventually, once I find the stairs." , fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    scooty = { { id = "yt_scooty", text = "Scooty! Lovely fellow, up in Booty Bay, or possibly on level two. He builds transporters that mostly work." } },
    mekkatorque = { { id = "yt_mekka", text = "The High Tinker? Splendid gnome. He signed my promotion, or my parking fine. Something with his signature on it, anyway." } },
    coffee = { { id = "yt_coffee", text = "The coffee on level three has gone a lovely shade of green. I'd not drink it, but I do admire it." } },
    radiation = { { id = "yt_rad", text = "Is that what this is? I thought I was just very warm. It's a pleasant sort of warm, mostly." } },
    _none = { { id = "tp_none", text = "Hmm? I'm sorry, I don't remember anything about that." } },
  },
}

---------------------------------------------------------------------------
-- Emi Shortfuse: a gnome engineer fighting to hold the workshop against the troggs.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_emi_shortfuse", id = 7998, name = "Blastmaster Emi Shortfuse",
  bible = "bibles/dg_emi_shortfuse.md", role = "event", tier = "quest",
  temper = { "brisk", "brave" }, values = { "practical", "dutiful" },
  notices = { "craft", "race" },
  impression = {
    first = "She has soot on her face and a bundle of explosives under her arm.",
    third = "{name} helped Emi Shortfuse blow the trogg tunnels in Gnomeregan.",
  },

  greetings = {
    { id = "g_default", text = "Oh, thank goodness, people who aren't troggs! Quick, I need help, and I need it now." },
  },

  notice = {
    { id = "n_engineer", cat = "craft", when = { profession = { "Engineering" } },
      text = "An engineer! Then you know what a charge looks like. Keep your hands steady and stay out of my blast radius." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome come back home. Welcome back to what's left of it." },
  },

  start = "hello",
  nodes = {
    w8_hold = {
      lines = { { id = "w8_hold_a", text = "Since the fall, give or take, and I've stopped counting days because it's bad for morale and I'm the only morale there is down here. I've got water from a cracked coolant pipe and three crates of biscuits, and I'm on the last crate." } },
      choices = {
        { text = "You'll be out of here soon.", next = "w8_hold2" },
        { text = "Why didn't you leave with the others?", next = "w8_hold2" },
        { text = "Something else, Emi.", next = "BACK" },
      },
    },
    w8_hold2 = {
      lines = { { id = "w8_hold2_a", text = "Because I opened half these tunnels, and I'm not leaving them open for the troggs to walk up into Dun Morogh. Seal them, then biscuits, then sunlight, in that order, and if you keep them off me, we'll do all three today." } },
      choices = {
        { text = "Then let's seal them.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Emi Shortfuse, and demolitions are my specialty. The troggs keep pouring through those tunnels, and I've got enough charges to seal them, if someone can keep them off me while I set them." },
      },
      again = { { id = "h_again", text = "Talk faster, they're coming!" } },
      choices = {
        { text = "What's your plan exactly?", next = "plan" },
        { text = "Where did all these troggs come from?", next = "troggs" },
        { text = "Why stay down here alone?", next = "stay" },
        { text = "Those charges look homemade.", next = "charges" },
        { text = "I'm from Gnomeregan too. What's left of it?", next = "home", when = { race = "Gnome" } },
        { text = "I know a little about explosives myself.", next = "engineer", when = { race = { "Dwarf", "Gnome" } } },
        { text = "What did you do before the city fell?", next = "ybefore" },
        { text = "How long have you been holding out down here?", next = "w8_hold" },
        { text = "Let's do it.", next = "END" },
      },
    },
    plan = {
      lines = { { id = "p_default", text = "I set a charge on each tunnel mouth, you keep the troggs off me, and when I say run, you run. Ideally, nobody we like gets blown up." } },
      choices = {
        { text = "How many tunnels are we talking about?", next = "plan_tunnels" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan_tunnels = {
      lines = { { id = "pt_default", text = "Two big ones that matter, the east and the west, though they branch like a root system underneath. If both mouths collapse, I calculate an eighty-percent drop in trogg traffic, give or take a cave-in." } },
      choices = {
        { text = "What happens to the other twenty percent?", next = "plan_rest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan_rest = {
      lines = { { id = "pr_default", text = "They come out of the cracks in ones and twos, and that's what you're for. Honestly, a trickle of troggs is a vast improvement on a flood, and I'll take it gladly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    charges = {
      lines = { { id = "ch_default", text = "Homemade, field-tested and only slightly unstable, which for Gnomeregan these days is practically a certificate of quality. I scavenged the powder from a dead mechano-tank, so be grateful it went to a good cause." } },
      choices = {
        { text = "As long as they blow the right way.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      narr = "She pushes her goggles up and looks at you for the first time without squinting.",
      lines = { { id = "ho_default", text = "Not much, I'm afraid, just leper gnomes and troggs and Thermaplugg's machines rattling around the workshops. But every tunnel I seal is one less door they have into our city, and one day we'll walk back in." } },
      choices = {
        { text = "We'll take it back. Mekkatorque swore it.", next = "BACK", reply = "He did, and I'm holding him to it, preferably with a parade.", fx = { align = { order = 1 } } },
        { text = "Forget the High Tinker. We'll do it ourselves.", next = "BACK", reply = "Ha! That's the spirit, though maybe don't say it that loudly in Ironforge.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    engineer = {
      lines = { { id = "en_default", text = "Then you know to keep your fingers away from the blue wire, and the red one, and frankly most of the wires. Watch my back, and if I go down, finish setting the last charge." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troggs = {
      lines = { { id = "t_default", text = "From under the city, deep down. Thermaplugg says they came up on their own, but the timing was awfully convenient, and the radiation was his idea in the first place." } },
      choices = {
        { text = "Thermaplugg should face judgment.", next = "BACK", reply = "He should, and Mekkatorque would agree, if he could get down here.", fx = { align = { order = 1 } } },
        { text = "Just kill him and be done with it.", next = "BACK", reply = "I won't argue. I'll even lend you a charge.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "s_default", text = "Because this is home, and somebody has to stop the troggs before they spread. Somebody had to stay; it may as well be the one carrying the explosives." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ybefore = {
      lines = {
        { id = "yb_default", text = "Ran the demolition crew for the lower excavations, opening new tunnels at roughly four hundred feet a week. Which, in hindsight, is precisely how we found the troggs in the first place. I try not to think about that ratio." },
        { id = "yb_dwarf", when = { race = "Dwarf" }, text = "Ran the demolition crew on the lower digs, and I trained under a dwarf from the Ironforge Mining Guild, so I know you lot like a good controlled blast. We dug too deep, though, and found the troggs." },
      },
      choices = {
        { text = "So it's partly your fault?", next = "yfault" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfault = {
      narr = "Her hands stop on the fuse she's crimping.",
      lines = { { id = "yf_default", text = "Partly, technically, statistically. I've done the sums a hundred times. Mekkatorque says nobody could have known, and Thermaplugg made it worse with the radiation. But I lit the charges, and I'm still lighting them, so maybe that balances it." } },
      choices = { { text = "You're making it right now. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    troggs = { { id = "yt_troggs", text = "Troggs. Stone-skinned, dim, and endlessly breeding. I've run the numbers, and they're not good numbers." } },
    thermaplugg = { { id = "yt_therma", text = "Mekgineer Thermaplugg. Advisor, traitor, and the reason my city glows green. I've a charge with his name on it." } },
    mekkatorque = { { id = "yt_mekka", text = "High Tinker Mekkatorque got as many of us out as he could. I'll follow him back in, with fuses lit." } },
    _none = { { id = "tp_none", text = "Ask me again when we're not under attack!" } },
  },
}

---------------------------------------------------------------------------
-- Tink Sprocketwhistle: engineering supplier in the Clean Zone, with business very slow.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_tink", id = 9676, name = "Tink Sprocketwhistle", title = "Engineering Supplies", role = "vendor", tier = "service",
  temper = { "chipper", "harried" }, values = { "craft", "practical" },
  notices = { "craft" },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "My favourite customer, back again! I've been keeping the shiny unirradiated sprockets aside for you, which is roughly four of them." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'll still sell to you, business being what it is down here, but I've moved the good wrenches out of reach." },
    { id = "g_default", text = "A customer! An actual, living, non-trogg customer! Come in, come in, mind the decontamination puddle." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering" } },
      text = "An engineer, down here? Oh, you have no idea how long it's been since I talked torque ratios with someone who understood them." },
  },
  start = "hello",
  nodes = {
    w8_stk = {
      lines = { { id = "w8_stk_a", text = "A volunteer brings a crate down from Tinker Town once a fortnight, and I check every item with a gauge for glow before it goes on the shelf! Anything that glows a little I sell at a discount, and anything that glows a lot I put in the decontamination puddle and hope." } },
      choices = {
        { text = "Does the puddle work?", next = "w8_stk2" },
        { text = "Selling glowing parts seems risky.", next = "w8_stk2" },
        { text = "I'm an engineer. Your gauge needs recalibrating.", next = "w8_stk2", when = { profession = "Engineering" } },
        { text = "Something else, Tink.", next = "BACK" },
      },
    },
    w8_stk2 = {
      lines = {
        { id = "w8_stk2_a", text = "Statistically, the puddle reduces glow by about forty percent, which is not nothing! The rest of the glow is technically a feature, because you can find your spanner in the dark." },
        { id = "w8_stk2_eng", when = { profession = "Engineering" }, text = "Oh, it absolutely does, it's reading eight percent low since a trogg sat on it, and I can't get the needle off the pin without a jeweller's screwdriver. If you've got one, I'll trade you a whole crate of the non-glowing sprockets for five minutes with it." },
      },
      choices = {
        { text = "Keep your spanners glowing, Tink.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", key = true, text = "Tink Sprocketwhistle, engineering supplies, at your service and very much open for business, though business has been down roughly ninety-seven percent since the troggs moved in. Still, the Clean Zone is clean, mostly, and my stock is excellent." } },
      again = {
        { id = "h_again", text = "What else can I do for you? Anything at all, really, I'm not busy." },
        { id = "xh_again2", text = "Back so soon? Wonderful, that makes three visits this month, which is a record!" },
      },
      choices = {
        { text = "Gnomeregan's refugees deserve fair prices, even down here.", next = "BACK", reply = "Oh, thank you! I keep telling myself that, and it's very nice to hear someone else say it out loud.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "No other shop for miles. You could charge whatever you like.", next = "BACK", reply = "I could, and I've done the sums, but the sums don't account for having to live with myself afterwards.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why stay in Gnomeregan at all?", next = "stay" },
        { text = "What's the Clean Zone?", next = "clean" },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What's your best-selling item?", next = "xbest" },
        { text = "What was Gnomeregan like before the fall?", next = "xbefore" },
        { text = "Who else lives in the Clean Zone?", next = "xwho" },
        { text = "I'm an engineer. What's worth buying here?", next = "xeng", when = { profession = "Engineering" } },
        { text = "I grew up in Gnomeregan too.", next = "xgnome", when = { race = "Gnome" } },
        { text = "How do you get stock down into the city?", next = "w8_stk" },
        { text = "Good luck, Tink.", next = "END" },
      },
    },
    stay = {
      lines = { { id = "s_default", text = "Because this is home, and somebody has to be here when we take it back! Besides, the rent in Ironforge is outrageous, and the dwarves keep asking me to stop testing things indoors." } },
      choices = {
        { text = "Gnomeregan will be yours again someday.", next = "BACK", reply = "That's the spirit! I've already drawn up the plans for the new storefront.", fx = { align = { order = 1 } } },
        { text = "It's a tomb now. You should leave.", next = "BACK", reply = "A tomb with excellent ventilation, I'll have you know. Well, adequate ventilation.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    clean = {
      lines = { { id = "c_default", text = "It's the one stretch of the city we've scrubbed free of radiation, more or less, and the holdouts defend it from the troggs and Thermaplugg's leper gnomes. If you start glowing, please don't do it near the merchandise." } },
      choices = { { text = "I'll try not to glow.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    xbest = {
      lines = { { id = "xbe_default", text = "Bronze tubes, by a mile, because every engineer always needs one more bronze tube. Second place goes to blasting powder, and third place goes to bandages, which I suspect are related to the second." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xbefore = {
      narr = "Tink's hands go still on the counter for the first time since you arrived.",
      lines = { { id = "xbf_default", text = "Bright, loud and full of wonderful smells, oil and hot copper and Mrs. Gearlock's cinnamon buns. My shop had a window onto the main concourse, and you could watch the trams go by all day." } },
      choices = {
        { text = "Do you think Mekkatorque can win it back?", next = "xmekka" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmekka = {
      lines = { { id = "xme_default", text = "I think the High Tinker will try, and try again, and keep trying until he gets it right, because that's what gnomes do. The real question is whether there'll be anything left down here worth winning." } },
      choices = {
        { text = "Every gear is worth saving. Rebuild it all.", next = "BACK", reply = "Oh, I like you. I'll put you on the list for the grand reopening.", fx = { align = { order = 1 } } },
        { text = "Better to start fresh somewhere new.", next = "BACK", reply = "Somewhere new? Heresy, but very practical heresy. I'll think about it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwho = {
      lines = { { id = "xwh_default", text = "The holdouts, mostly, the medics and technicians who fix things and the ones with guns who shoot things. Ozzie Togglevolt comes and goes from Kharanos with plans for a radiation bomb, which is exactly as safe as it sounds." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xeng = {
      lines = { { id = "xen_default", text = "Everything, obviously, but if you want my honest advice, stock up on the coloured fuses and the whirring bronze gizmos. Nobody in Ironforge keeps them in stock, because nobody in Ironforge appreciates good engineering." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xgnome = {
      lines = { { id = "xgn_default", text = "Then you remember the trams and the singing pipes and the smell of the forge district! Oh, it's nice to talk to someone who misses it the right way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gnomeregan = { { id = "xtp_gnomer", text = "Home, if somewhat glowing. We'll scrub it clean one wall at a time." } },
    ozzie = { { id = "xtp_ozzie", text = "Ozzie Togglevolt has a plan to blow up the radiation, and I'm selling him the parts. What could possibly go wrong?" } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend, though if you need a wrench for it, I've got eleven kinds." } } },
}

---------------------------------------------------------------------------
-- Holdout Medic: a gnome keeping the Clean Zone's defenders patched up.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_holdout_medic", id = 6392, name = "Holdout Medic", role = "soldier", tier = "service",
  temper = { "frazzled", "kind" }, values = { "duty" },
  greetings = { { id = "g_default", text = "Are you hurt? Irradiated? Both? Hold still and let me have a look at you." } },
  start = "hello",
  nodes = {
    w8_safe = {
      lines = { { id = "w8_safe_a", text = "A lead apron, a mask with three filters and a strict rule about washing my hands every hour, which my patients find very tedious. I've a little glow in my fingertips anyway, and I've decided to call it a useful reading light." } },
      choices = {
        { text = "Does it hurt?", next = "w8_safe2" },
        { text = "You should go up to Ironforge and rest.", next = "w8_safe2" },
        { text = "I'm a priest. Let me look at your hands.", next = "w8_safe2", when = { class = "PRIEST" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w8_safe2 = {
      lines = {
        { id = "w8_safe2_a", text = "Only when I think about it, so I try not to, which is very nearly a medical technique. I'll go up to Ironforge when the holdouts stop needing stitches, and they show no sign of stopping." },
        { id = "w8_safe2_pr", when = { class = "PRIEST" }, text = "Would you? That's kind, and I'll admit it tingles less when somebody prays over it, though I don't know if it's the Light or just the company. Thank you, truly, and now go and look at the holdouts by the airlock, because they need it more than I do." },
      },
      choices = {
        { text = "Take care of yourself, too.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", key = true, text = "I patch up the holdouts who defend the Clean Zone, and lately I've been patching faster than they can get hurt again, which is a terrible ratio. The troggs come in waves and the radiation never stops." } },
      again = {
        { id = "h_again", text = "Anything else? I've got bandages boiling." },
        { id = "xh_again2", text = "Still here? Then sit, and I'll check your pulse while you talk." },
      },
      choices = {
        { text = "How bad is the radiation?", next = "rad" },
        { text = "Who are the holdouts?", next = "holdouts" },
        { text = "Where do you get your supplies down here?", next = "xsupply" },
        { text = "What's the worst wound you've treated?", next = "xworst" },
        { text = "Do the irradiated ever recover?", next = "xcure" },
        { text = "I'm a priest. Can I help with the wounded?", next = "xheal", when = { class = { "PRIEST", "PALADIN", "DRUID", "SHAMAN" } } },
        { text = "I'm a gnome too. Gnomeregan was my home.", next = "xgnome", when = { race = "Gnome" } },
        { text = "How do you keep yourself safe from the radiation?", next = "w8_safe" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    rad = {
      lines = { { id = "r_default", text = "Bad enough that the gnomes who stayed behind went mad and pale, and now they serve Thermaplugg. If you feel a tingle in your teeth, turn around and walk briskly toward the exit." } },
      choices = {
        { text = "Thermaplugg should hang for this.", next = "BACK", reply = "Hanging's too good for him, but I'd settle for it.", fx = { align = { light = -1 } } },
        { text = "Those lepers were your people once. Pity them.", next = "BACK", reply = "I do, every time I have to fight one. That's what makes it so hard.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    holdouts = {
      lines = { { id = "h2_default", text = "Gnomes who refused to leave when Mekkatorque ordered the retreat, or who came back afterward because they couldn't stand to watch from Ironforge. We're stubborn folk, and stubborn is all that's keeping this corner of the city ours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xsupply = {
      lines = { { id = "xsu_default", text = "Some come down from Ironforge with brave volunteers, some I scavenge from the old infirmary, and the rest I improvise. You'd be amazed what a gnome can do with a spool of linen, a cleaning solvent and a very steady hand." } },
      choices = {
        { text = "Does Ironforge send enough help?", next = "xironforge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xironforge = {
      lines = { { id = "xir_default", text = "Never enough, though the dwarves have been kinder than we had any right to expect. Mekkatorque says the city's retaking is coming soon, and he's said it every month for a long while now." } },
      choices = {
        { text = "Mekkatorque will keep his word. Be patient.", next = "BACK", reply = "I try to be, truly. Patience is easier when the bandages aren't running low.", fx = { align = { order = 1 } } },
        { text = "Don't wait for him. Act yourselves.", next = "BACK", reply = "We already are, in our way. Every holdout down here is someone who stopped waiting.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xworst = {
      narr = "She pauses with a roll of gauze half wound around her wrist.",
      lines = { { id = "xwo_default", text = "A technician who tried to reroute a coolant pipe by hand, during an attack, with a trogg chewing on his boot. He lived, and he fixed the pipe, and he still asks me every week whether his eyebrows will grow back." } },
      choices = { { text = "Will they?", next = "BACK", reply = "Probably not, but I tell him to be patient, and it seems to cheer him up." }, { text = "Something else.", next = "BACK" } },
    },
    xcure = {
      lines = { { id = "xcu_default", text = "Not the ones who've gone too far, the pale ones who follow Thermaplugg now. A light dose can be scrubbed out with rest and clean air, which is why I keep shouting at people to leave before they start to tingle." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xheal = {
      lines = { { id = "xhe_default", text = "Oh, would you? The holdouts by the airlock took a beating this morning, and they'd be glad of a healer who doesn't smell of solvent. Just don't heal anyone mid-fight without asking, they startle easily." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xgnome = {
      lines = { { id = "xgn_default", text = "Then welcome home, such as it is. Mind you get yourself checked when you leave, because home has a nasty way of getting into your bones down here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    radiation = { { id = "yt_rad", text = "If your teeth tingle, leave. If your hair glows, leave faster. If you can see in the dark, come and see me first." } },
    ironforge = { { id = "yt_if", text = "Ironforge took us in when we had nothing. I send my worst cases up to the Tinker Town infirmary, when there's anyone to carry them." } },
    troggs = { { id = "yt_troggs", text = "Trogg bites go bad fast. Clean them with solvent, wrap them tight, and don't let anyone tell you to use ale." } },
    clean_zone = { { id = "yt_clean", text = "The Clean Zone is the only part of Gnomeregan where the air won't poison you. We keep it that way, hour by hour." } },
    mekkatorque = { { id = "yt_mekka", text = "The High Tinker visits Tinker Town's wounded every week. He listens, which is more than most leaders do." } },
    gnomeregan = { { id = "xtp_gnomer", text = "Our city, still, whatever Thermaplugg thinks. I'd like to see it with the lights back on one day." } },
    thermaplugg = { { id = "xtp_therma", text = "He gave the advice that poisoned us all, and now he hides in the heart of the city. I'm a medic, but I'd make an exception." } },
    _none = { { id = "tp_none", text = "I'm a medic, not a mechanic. Ask a technician, or better yet, ask Tink." } } },
}

---------------------------------------------------------------------------
-- Holdout Technician: a gnome keeping the Clean Zone's machinery running.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_holdout_technician", id = 6407, name = "Holdout Technician", role = "soldier", tier = "service",
  temper = { "busy", "precise" }, values = { "craft", "duty" },
  greetings = { { id = "g_default", text = "Careful where you step, that cable carries enough current to curl your eyebrows permanently." } },
  start = "hello",
  nodes = {
    w8_bld = {
      lines = { { id = "w8_bld_a", text = "A proper air plant on the fourth level, with real filters and a backup that doesn't depend on a single relay older than I am. And a memorial in the tram station, with every name on it, including Pindle's, spelled correctly for once." } },
      choices = {
        { text = "That's a worthy plan.", next = "w8_bld2" },
        { text = "Air before memorials, surely.", next = "w8_bld2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w8_bld2 = {
      lines = { { id = "w8_bld2_a", text = "Air first, yes, because you can't remember anyone if you can't breathe. But I've started a list of names in my toolbox lid, and every time I fix a relay I add one more, so the memorial is getting built, a relay at a time." } },
      choices = {
        { text = "Keep adding names.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", key = true, text = "I keep the scrubbers, the lights and the turrets running so the Clean Zone stays clean. Every hour something breaks, and every hour I fix it, and the troggs chew through another cable just to spite me." } },
      again = {
        { id = "h_again", text = "Make it quick, the third relay is sparking again and I've only got two hands and one good spanner." },
        { id = "xh_again2", text = "Still here? Hand me that spanner while you're asking, then." },
      },
      choices = {
        { text = "What happened to Gnomeregan?", next = "fall" },
        { text = "Can the city be saved?", next = "save" },
        { text = "What's the hardest machine to keep running?", next = "xscrub" },
        { text = "Tell me about Thermaplugg.", next = "xtherma" },
        { text = "What are those turrets you keep up?", next = "xturret" },
        { text = "I'm an engineer. Can I lend a hand?", next = "xeng", when = { profession = "Engineering" } },
        { text = "Did you lose anyone when the city fell?", next = "ylost" },
        { text = "What would you build if Gnomeregan were yours again?", next = "w8_bld" },
        { text = "Carry on.", next = "END" },
      },
    },
    fall = {
      lines = { { id = "f_default", text = "The troggs came up from below, and High Tinker Mekkatorque flooded the city with radiation to stop them, on Thermaplugg's advice. It didn't stop them, and it killed most of us instead." } },
      choices = {
        { text = "Mekkatorque made a terrible choice.", next = "BACK", reply = "He did, and he knows it better than anyone. That's why he wants the city back so badly.", fx = { align = { order = -1 } } },
        { text = "He did what he had to. Thermaplugg betrayed him.", next = "BACK", reply = "Aye, that's how I see it too, though not everyone in the Zone agrees.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    save = {
      lines = { { id = "s_default", text = "Not by fixing relays, sadly, though it keeps us alive while we wait. Thermaplugg sits in the heart of the city, and until someone brings him down, we're just holding the door." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xscrub = {
      narr = "He wipes his hands on a rag that only makes them dirtier.",
      lines = { { id = "xsc_default", text = "The air scrubbers, without a doubt, because they were built to clean steam, not radiation. I've rebuilt the main filter four times, and each time it lasts a little less long, which is a trend I don't enjoy charting." } },
      choices = {
        { text = "What happens if they fail?", next = "xfail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfail = {
      lines = { { id = "xfa_default", text = "Then the Clean Zone stops being clean, and we fall back to the surface and Gnomeregan belongs to the troggs and the lepers. So they won't fail, because I won't let them." } },
      choices = {
        { text = "Then you'll need to cut corners to keep them going.", next = "BACK", reply = "Corners, spare parts, sleep, whatever it takes. Safety codes are for cities that aren't on fire.", fx = { align = { order = -1 } } },
        { text = "Do it by the book, or it'll fail worse.", next = "BACK", reply = "You sound like my old foreman, and you're probably right, which is irritating.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtherma = {
      lines = { { id = "xth_default", text = "Sicco Thermaplugg was Mekkatorque's chief adviser, and he wanted to be High Tinker himself. When the troggs came he gave the advice that killed the city, and then he took the rubble for his throne." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xturret = {
      lines = { { id = "xtu_default", text = "Salvaged from the city's old defences and rewired to tell a trogg from a gnome, most of the time. If one swivels toward you, stand very still and say something cheerful in Gnomish." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xeng = {
      lines = { { id = "xen_default", text = "An actual engineer! Then go and look at the relay by the eastern door, and if you can tell me why it hums in B-flat, I'll name a spanner after you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ylost = {
      narr = "He goes very still, spanner halfway to a bolt.",
      lines = {
        { id = "yl_default", text = "My apprentice, Pindle. Quick hands, terrible jokes. He went back for a toolkit when the alarms sounded and never came out. I see pale gnomes in the lower halls sometimes, and I look at every face, and I hope I never see his." },
        { id = "yl_gnome", when = { race = "Gnome" }, text = "My apprentice, Pindle, who went back for a toolkit when the alarms sounded. You've lost someone too, I'd guess, every gnome has. I look at every pale face in the lower halls and hope never to see his." },
      },
      choices = {
        { text = "If you did, what would you do?", next = "yfind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfind = {
      lines = { { id = "yfi_default", text = "Medic says a leper that far gone can't come back, and the kindest thing is a quick end. Part of me wants to drag him up to Ironforge anyway and make the alchemists try. I don't know which part is right." } },
      choices = {
        { text = "Give him peace. A quick end is mercy.", next = "BACK", reply = "Yeah. Yeah, I know. I just needed somebody else to say it.", fx = { align = { light = 1 } } },
        { text = "Drag him out. Never stop trying.", next = "BACK", reply = "That's the gnome in me talking too. Thanks.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    scrubbers = { { id = "yt_scrub", text = "The air scrubbers hum in three different keys when they're healthy. When they hum in a fourth, I start running." } },
    tinker_town = { { id = "yt_tinker", text = "Tinker Town is cramped and loud and full of refugees, and it's the most beautiful place in Ironforge." } },
    troggs = { { id = "yt_troggs", text = "Troggs chew cables for fun, I swear it. I've started coating them in pepper oil, and it's working, a bit." } },
    thermaplugg = { { id = "xtp_therma", text = "A traitor with good wiring. I hate admitting the second part." } },
    mekkatorque = { { id = "xtp_mekka", text = "The High Tinker made a terrible call, but he's still the one gnome I'd follow back down here." } },
    _none = { { id = "tp_none", text = "Not my department. Unless it's wired, I don't know about it." } } },
}
