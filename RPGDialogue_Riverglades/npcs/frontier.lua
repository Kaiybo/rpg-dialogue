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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Name's Hurley. I cut trees for Turner and keep Curly from getting himself killed, and the trees are the easy part." },
        { id = "h_helping", tags = { "news" }, when = { questActive = TODO_QUEST("Helping Hands") },
          text = "Come on, come on. Curly's in trouble out there and we haven't much time." },
        { id = "h_after", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Helping Hands"), days = 3 } },
          text = "Curly's on his feet, mostly. He says thank you, and he also says he had it handled, which he didn't." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Oh, good, maybe the Horde will think twice about our woodpiles if they see you standing by them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Could you say a prayer for Curly? He keeps wandering off, and one day he won't come back for his lunch, and I'll go gray with worrying." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Could you keep an eye on the treeline? Something's been watching us from it, and I don't think it's a wolf." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Oh! You gave me a fright, sneaking up like that, and please don't do it again, because my heart can't take it." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Could you bless the camp? Halligan says it's nonsense, but I'd feel better, and so would Curly." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Could you light the cookfire? Mine always smoke, and Halligan says he can taste it in the stew." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Oh. Oh dear, is that a demon behind you? Please tell me it's tame, because I'm not sure my legs will hold." },
      },
      again = { { id = "h_again", text = "Something else? Quick, before Curly wanders off again." } },
      choices = {
        { text = "Who's Curly?", next = "curly" },
        { text = "Who's been raiding your woodpiles?", next = "raids" },
        { text = "How's the logging?", next = "logging" },
        { text = "How's Curly holding up?", next = "curly_after", when = { questDone = TODO_QUEST("Helping Hands") } },
        { text = "I'm a druid. These trees aren't yours to fell.", next = "xdruid", when = { class = "DRUID" } },
        { text = "How often does the Horde raid the camp?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Who's Curly, and why does he wander?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What's watching you from the trees?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Want me to scout the Horde's camp for you?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Of course. What do you fear most, Hurley?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why do you stay at the camp, Hurley?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "It's bound to me. It won't harm you.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Good luck, Hurley.", next = "END" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every week or so, and they don't even fight us, they just take the wood and run off toward Rog'mar. Halligan says they're building something with it, and that makes me more nervous than the raids do." } },
      choices = {
        { text = "Make an example of the next raiders.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let them have some wood. It's not worth a life.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "He's a good worker and the youngest of us, and he thinks the Horde won't hurt a boy who smiles at them. Halligan swears at him every day, but he'd go after him barefoot through the woods, same as I would." } },
      choices = {
        { text = "Then he must learn caution. Keep him close.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let him be. His kindness might do more than swords.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Horde scouts, Halligan says, but I've seen eyes up there after dark that didn't look orcish to me. I didn't say so to Halligan, because he'd only tell me I'm jumping at shadows again." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Is your {pet} friendly? It isn't, is it? Never mind, just keep it away from the woodpiles, please." },
      },
      choices = {
        { text = "Trust your gut and tell Halligan anyway.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Keep it quiet. No need to frighten the others.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Would you? I mean, you don't have to, but if you could see what they're doing with our wood, I'd sleep better, or at least I'd know what I'm losing sleep over." } },
      choices = {
        { text = "I'll wreck their work while I'm there.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll only look. No sense starting a war.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "That the Horde will come for us one day instead of the wood, and we're loggers, not soldiers. Halligan says they've no reason to, but I didn't think they had a reason to steal wood until they did." } },
      choices = {
        { text = "The Light protects the faithful. Take heart.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayer won't stop axes. Learn to fight.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the wood's good and the pay's honest, and because Halligan would never manage without somebody to worry for him. Somebody has to do the worrying, and I'm good at it." } },
      choices = {
        { text = "Leave while you can. No wage is worth dying for.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Stay. Your camp needs you, worries and all.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "If you say so, then I'll believe you, though I'll stand over here by the woodpile, if you don't mind. Halligan says I'm too trusting, but I'd rather be that than suspicious of everyone." } },
      choices = {
        { text = "Trust is a fine thing. Keep it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Halligan's right. Trust no one out here.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
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
      lines = { { id = "r_default", text = "Somebody's been at the woodpiles at night, and spear-length pieces have gone missing. Halligan thinks it's the Horde. I think so too, but I like to let Halligan be right first." } },
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
      lines = { { id = "xdr_default", text = "Not mine, no, they're Turner's, or the Brotherhood's, or Stormwind's if anyone there remembers us. But the keep needs walls and the walls need timber, and I'd rather cut a tree than bury a soldier." } },
      choices = {
        { text = "Walls first. The forest will grow back.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Take what you need, and not one tree more.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a logger, with an axe in my hands since I was twelve, and a worrier since I met Curly." } },
    advice = { { id = "tp_ad", text = "If you hear singing in the woods and it isn't us, run." } },
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
    { id = "g_default", text = "If you're buying, talk. If you're standing around, there's an axe." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Pick up a saw or pick a direction." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Arms like that, and you swing a sword? That's a waste; you'd fell an oak in an afternoon." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Halligan Turner. This camp feeds Farholde its timber, the Brotherhood keeps the cultists off it, mostly, and I keep the loggers off each other." },
        { id = "h_after", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Helping Hands"), days = 3 } },
          text = "You brought the kid back. He's a good worker when he isn't being an idiot, so... thanks, and that's all you're getting." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, out at a logging camp. If you've come to preach, the men are busy; if you've come to stand guard, pick up an axe as well." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Good, because the deer have gone out of these woods and the men are sick of salt pork." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "I know your type. If you're here for the payroll, it's already spent, and if you're here for work, grab an axe." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Say a word for Curly, if you've one spare; the boy will be the death of me, and I'd like him to outlive me." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Don't set fire to the timber; it's the only thing we've got that the Horde wants." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Keep that thing on a short leash. My men are jumpy enough without a demon sniffing round the cookfire." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf, at a logging camp. Go on, then, tell me I'm killing the forest; Hurley says your lot always do." },
      },
      again = { { id = "h_again", text = "What else? Daylight's money, so be quick." } },
      choices = {
        { text = "Is it safe, logging this far out?", next = "safe" },
        { text = "What's it like working for the Brotherhood?", next = "brotherhood" },
        { text = "Hurley says you're hard on Curly.", next = "curly", when = { heardLine = "hurley.h_default" } },
        { text = "I worked land like this, once.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "I could swing an axe for you, if you're short.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "Do your men need protecting, or just more hands?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why have the deer left the woods?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is the Horde really behind all your missing wood?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "You care about that boy a great deal.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Could the camp use a ward against raiders?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "My demon could guard the camp at night.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You take only what you need, I hope?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Both, and I'd take the hands first. The Horde steals our wood, the cultists steal our sleep, and Stormwind never sent a single man to help, so we do it ourselves." } },
      choices = {
        { text = "I'll guard the camp. That's what the Light asks.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Arm your men. They should defend themselves.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Same reason the birds have, I'd guess, which is the Hammer's lot camping in the hills. Animals know when something's wrong with the land, and these woods have been wrong for a while." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} had better not be after my supper, {class}. I've only got the one ham." },
      },
      choices = {
        { text = "Hunt what's left. Your men come before the woods.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Let the herds recover, or there'll be none next year.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Most of it, aye, but not all of it, and that's the part that bothers me. Some of it walks off at night when the Horde's nowhere near, and I've a man or two I'm keeping my eye on." } },
      choices = {
        { text = "Find the thief and make an example of him.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let it go. Hungry men steal; it happens.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The boy's a hard worker and a bigger fool, and that's all I'll say on it. If you tell Hurley I said anything softer, I'll swear I never met you." } },
      choices = {
        { text = "Tell him yourself. Kindness unsaid helps no one.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Keep it to yourself. Soft words make soft workers.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "If you can make one that keeps orcs out and doesn't scare off the mules, I'll pay for it. Ashe tried one last year, and the mules wouldn't come within a hundred yards of the woodpile for a week." } },
      choices = {
        { text = "A ward's no substitute for watchmen. Post guards.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let me try again. Magic can do better.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It could, aye, and it'd scare off the Horde, and it'd scare off my men too, and then I'd have no one left to cut wood. Thanks, but I'll keep my watchmen and you can keep your pet." } },
      choices = {
        { text = "Fair. Your men's trust matters more.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fear keeps raiders away. You should use it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I take what Farholde needs, which is walls and firewood and coffins, and that's more every year. I plant two saplings for every tree I fell, though, and you can tell that to whoever's counting." } },
      choices = {
        { text = "That's fair dealing. The forest can bear it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "These woods aren't yours to fell at all.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
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
      lines = { { id = "b_default", text = "They pay in silver when they have it and in promises when they don't, and I've had more promises than silver this year. Brant keeps his, eventually." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "brotherhood_horse" } } } },
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
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Loggers gossip worse than fishwives, and I hear all of it whether I want to or not. Ask what you want." },
    },
    background = { { id = "tp_bg", text = "This is Turner's camp. My name's on it, so the blame is too." } },
    advice = { { id = "tp_ad", text = "Never stand downhill of a falling tree, or of a falling logger." } },
    brotherhood_horse = { { id = "tp_brotherhood", text = "Best customers I've got, and the only customers I've got." } },
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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Benjy Wheeler, and this is Wheeler's Grange. It was a farm, before the harvest reapers got into the fields, and now it's a farmhouse with a view of trouble." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Hear that clicking? That's them, all night, up and down the rows." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, out at the Grange. The reapers in the rows don't flinch and they don't bleed, so I hope you hit hard." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I'm not much for chapel, but if the Light wants to bless a field full of reapers, I'll not stand in its way." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The crows have left the fields, which tells you something's wrong, because crows don't leave for anything." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You'll be wanting a look round the barn, I expect. There's nothing in it worth taking, unless you've a use for a broken plough." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. My mother would have had you in for supper, but there's not much on the table these days, and I'll not shame the house." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Could you tell me what makes the reapers go? I opened one up, and there was nothing in it but gears and a smell like a lightning strike." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You've a cold about you, like the wind before a hailstorm. Stay off the porch, if you would; the boards are rotten, and I'd rather you didn't fall through." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf. The soil's gone sour since the reapers came, and I'd give a lot to know why, if you can tell by looking." },
      },
      again = { { id = "h_again", text = "Anything else? I've a fence to mend." } },
      choices = {
        { text = "Where did the reapers come from?", next = "reapers" },
        { text = "Why stay?", next = "stay" },
        { text = "Farholde's close. Can't they help?", next = "farholde" },
        { text = "Harvest golems ran my family off our farm too.", next = "westfall", when = { origin = "human_westfall_farmhand" } },
        { text = "Those reapers are machines. I could take one apart.", next = "xgnome", when = { race = "Gnome" } },
        { text = "Want me to clear the reapers from the fields?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The Light helps those who keep faith, Benjy.", next = "xapala", when = { class = "PALADIN" } },
        { text = "What else has left the fields?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Has anyone been sneaking around the Grange?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "How long have you worked these fields?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Something powers them. Did you keep the parts?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does my craft trouble you, farmer?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Let me see the soil, Benjy.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Take care, Benjy.", next = "END" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I'd want it more than supper, but there's always more of them by morning, and I've never seen where the new ones come from. Clear a row if you like, and I'll watch the treeline to see who comes to mend them." } },
      choices = {
        { text = "Burn the fields and starve the reapers of their rows.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll clear them, and you'll plant again come spring.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Maybe so, but I've kept faith with these fields since I was a boy, and they've not kept much with me. I'll take a strong arm before a prayer, if it's all the same to you." } },
      choices = {
        { text = "Then take both. Faith and steel work together.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fair. Hard work's its own prayer.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Rabbits, foxes, even the mice in the barn, all gone since the reapers came. A farm's quiet without them, and I didn't know I'd miss the mice till they went." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} off the rows, {class}. The reapers cut anything that moves, and they'd not spare it." },
      },
      choices = {
        { text = "They'll come back once the reapers are gone.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some places stay dead. Maybe it's time to move on.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Footprints by the fence some mornings, and the reapers don't leave footprints like that. I've not told Farholde, because I can't prove a thing, and they've enough on their plate." } },
      choices = {
        { text = "Tell Farholde anyway. Let them judge what matters.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Keep quiet and watch. Catch them yourself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Since I was a boy, through bad harvests and worse winters. Folk left Windstead and Meadowsbrook in the old days, and I always said I'd be the one who stays, reapers or not." } },
      choices = {
        { text = "Staying takes courage. The Light honors that.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Stubbornness isn't courage. Leave before it kills you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "In the barn, in a sack, and I'll not go near it after dark, because I swear it clicks on its own. Take a look if you've the stomach for it, and tell me if I'm going mad." } },
      choices = {
        { text = "Bury it. Some things shouldn't be tinkered with.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Keep it. If we learn how they work, we break them.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Everything troubles me these days, and you're not the worst thing I've seen this week. Do some good out in those rows, and I'll not ask how you do it." } },
      choices = {
        { text = "Good. The ends justify my means.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "You should ask. Power like mine needs watching.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "There, by the fence post, where it's grey instead of brown. Nothing's come up in that patch for two seasons, and the reapers walk round it, which they don't do for anything else." } },
      choices = {
        { text = "Burn the patch. Whatever's in it shouldn't spread.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Leave it to me. I'll try to coax it back.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
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
  },

  topics = {
    background = { { id = "tp_bg", text = "A farmer: was, is, and will be. There's nothing more to say about it that the dirt doesn't." } },
    advice = { { id = "tp_ad", text = "Stay off the rows after dark. The reapers don't sleep, and they don't ask who you are." } },
    _none = { { id = "tp_none", text = "I'm a farmer, so ask me about weather, or about reapers even, but not that." } },
  },
}
