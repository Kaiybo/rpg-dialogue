-- Deathknell (Forever only): the tradeskill guide and the junior trainers. Voice: bibles/deathknell_forever.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Clarence Gillian: Deathknell's cheerful guide to the professions.
P:NPC {
  key = "tf_clarence", id = TODO_NPC("Clarence Gillian"), name = "Clarence Gillian",
  bible = "bibles/deathknell_forever.md", role = "citizen", tier = "service",
  communities = { "deathknell" }, temper = { "eager" }, values = { "kind", "practical" },
  notices = { "craft", "greenness" },
  impression = {
    first = "His good cheer is so stubborn that it seems almost like defiance.",
    third = "{name} met Clarence Gillian in Deathknell, who points the newly risen toward the trainers and the trades.",
  },

  greetings = {
    { id = "g_default", text = "Hello there! Have you thought about taking up a trade yet? I'd be glad to point you toward the trainers." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did you find the trainer I sent you to, or shall I point again?" },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Look at you, grown strong enough to leave Deathknell well behind! I do hope you took a trade with you when you went." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 3 },
      text = "You've only just climbed out of the ground, haven't you? Don't worry, because nobody expects you to choose a trade today, and you can always come back to me." },
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "I can smell the peacebloom on you from here, or I could if I could still smell. Florence Nightshade, our herbalism trainer, will be pleased; she says nobody picks properly anymore." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hello, {name}! Have you considered taking up a trade? I'm happy to answer any questions, or to point you toward the trainers here in Deathknell." },
        { id = "h_young", when = { maxLevel = 5 },
          text = "Hello, and welcome to Deathknell! It's a lot to take in all at once, I know, so if a trade feels like too much today, come back whenever you like, and I'll still be standing here." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "A living visitor, and in Deathknell of all places! The trainers here teach the newly risen, but a skinning knife works the same in any hand, so ask me anything you like." },
      },
      again = {
        { id = "h_again", text = "What else can I help you with? I've answered every question there is at least twice, and I still enjoy it." },
        { id = "h_again2", text = "Anything more? Take your time; the dead have plenty of it." },
      },
      choices = {
        { text = "What are professions, exactly?", next = "what" },
        { text = "What kinds of trades are there?", next = "kinds" },
        { text = "Where are the trainers in Deathknell?", next = "trainers" },
        { text = "Why does a dead man care about trades?", next = "why" },
        { text = "I've already taken up a trade.", next = "already", when = { any = { { profession = "Herbalism" }, { profession = "Mining" }, { profession = "Skinning" }, { profession = "Alchemy" }, { profession = "Blacksmithing" }, { profession = "Leatherworking" }, { profession = "Tailoring" }, { profession = "Engineering" }, { profession = "Enchanting" } } } },
        { text = "Thank you, Clarence. I'll be going.", next = "END" },
      },
    },
    what = {
      lines = {
        { id = "w_default", text = "I'm glad you asked! Professions are the skills of crafting and gathering and getting by in the wild, and each has its own uses, whether you're after coin, or supplies for your friends, or the pleasure of wearing something you made with your own hands." },
      },
      choices = {
        { text = "And how does one learn them?", next = "learn" },
        { text = "Something else, Clarence.", next = "BACK" },
      },
    },
    learn = {
      lines = {
        { id = "l_default", text = "From trainers, mostly, like the ones here, though recipes turn up all over Azeroth if you keep your eyes open. Once you've learned a recipe it's yours for good, and you can make as many as you like, so long as you can find the materials." },
      },
      choices = {
        { text = "That's simpler than I expected.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kinds = {
      lines = {
        { id = "k_default", text = "There are primary trades and secondary ones. You can only keep two primary trades at a time, and if you drop one you lose everything you learned of it, so choose carefully. The secondary ones, like cooking and fishing and first aid, have no limit at all, and they'll keep you alive more often than they'll make you rich." },
      },
      choices = {
        { text = "Which two would you choose?", next = "choose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose = {
      big = true,
      lines = {
        { id = "c_default", text = "Oh, I'm the wrong one to ask, because I'd choose all of them if they'd let me! Most folk pick a gathering trade to feed a making trade, herbs for alchemy or ore for the forge, but some like the freedom of two gathering trades and selling what they find. What sort are you?" },
      },
      choices = {
        { text = "A planner. I'll pick two that work together.", next = "BACK", reply = "Oh, splendid, a planner! Herbs and alchemy, or ore and the forge, and you'll never be short of what you need, which is more than I can say for my own scattered workbench.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll take what the road gives me and sell it.", next = "BACK", reply = "A wanderer's answer, and a perfectly good one, because the auctioneers in the Undercity are always hungry. Just keep a full pack and a sharp knife, and the road will be generous.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trainers = {
      lines = {
        { id = "t_default", key = true, text = "Florence Nightshade teaches herbalism and Walter Mason teaches mining, and Margaret Weaver will show you how to skin a beast without ruining the hide. They're only junior trainers, mind, so when they've taught you all they can, the trainers in Brill and in the Undercity will take you further." },
      },
      choices = {
        { text = "What are they like to learn from?", next = "trainers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trainers2 = {
      lines = {
        { id = "t2_default", text = "Florence is particular, and she'll scold you for pulling a root the wrong way, but she's right to. Walter will talk your ear off about copper veins if you let him, and Margaret is the patient one, which is a fine quality in someone who carries that many knives." },
      },
      choices = {
        { text = "I'll go and see them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "y_default", text = "Because work is the first thing the Scourge took from us, and it's the first thing we can take back. A mindless corpse can swing a blade, {name}, but it can't cure a hide or brew a draught, and I think every new skill one of us learns proves we belong to ourselves again." },
      },
      choices = {
        { text = "I hadn't thought of it that way.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'd rather prove it with a blade.", next = "BACK" },
      },
    },
    already = {
      lines = {
        { id = "a_default", text = "Splendid! Then keep at it, and when the trainers here run out of things to teach you, go on to Brill and the Undercity. A trade grows with you, the way a good habit does." },
        { id = "a_herb", when = { profession = "Herbalism" }, text = "Splendid! Tirisfal is thick with peacebloom and silverleaf, if you don't mind the odd bat while you dig, and the apothecaries will always want more." },
      },
      choices = {
        { text = "I'll keep at it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I woke in Deathknell like everyone else, and I decided I'd rather help people than mope about it. That's the whole story, and I think it's a good one." } },
    advice = { { id = "tp_ad", text = "Learn a trade before you need one. Coin runs out, but what you know how to make stays with you." } },
    _none = { { id = "tp_none", text = "Oh, I'm afraid that's outside my knowledge entirely! Ask me about trades and I'll talk all day." } },
  },
}

-- Florence Nightshade: junior herbalism trainer.
P:NPC {
  key = "tf_florence", id = TODO_NPC("Florence Nightshade"), name = "Florence Nightshade", title = "Junior Herbalism Trainer",
  bible = "bibles/deathknell_forever.md", role = "trainer", tier = "service",
  communities = { "deathknell" }, temper = { "brisk" }, values = { "orderly", "practical" },
  notices = { "craft" },
  impression = {
    first = "She plainly loves the plants more than the people who pick them.",
    third = "{name} met Florence Nightshade, Deathknell's junior herbalism trainer, who has no patience for a root pulled the wrong way.",
  },

  greetings = {
    { id = "g_default", text = "If you've come to learn herbs, then come and learn them properly." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Show me your hands; I want to see whether you've been tearing leaves." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "An alchemist. Then you'll want your herbs whole and not bruised, and for once I'll have a pupil who understands why it matters." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You've been picking, I see, and not badly, though you've crushed half that silverleaf. Hold the stem lower next time." },
    { id = "n_green", cat = "craft", when = { maxLevel = 4, race = "Scourge" },
      text = "Your fingers are still stiff from the ground, which makes for clumsy picking. Flex them every morning, and don't practise on anything I'd miss." },
    { id = "n_tauren", cat = "craft", when = { race = "Tauren" },
      text = "Your people speak to the plants before they cut them, I've heard. I don't, but I'd sooner teach someone who does than someone who rips." },
  },

  start = "hello",
  nodes = {
    junior = {
      lines = {
        { id = "jr_default", text = "Because I teach the first steps and no more, and I'm content with that. When you've learned what I know, Faruza in Brill will take you further, and after her there's Martha Alliestar in the Undercity's Apothecarium." },
      },
      choices = {
        { text = "You don't want to teach the rest yourself?", next = "junior2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    junior2 = {
      lines = {
        { id = "jr2_default", text = "The first steps are the ones that matter. By the time a picker reaches Faruza, the habits are set, and if I've taught them to cut clean and leave the root, they'll do it for the rest of their days without thinking." },
      },
      choices = {
        { text = "Then yours is the lesson that lasts.", next = "BACK", reply = "It is, and I'd thank you not to say so in front of Faruza. She thinks it's hers.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = {
        { id = "wh_default", text = "Along the fences and the old field walls, where the peacebloom likes the shelter, and under the trees on the north side for silverleaf. Keep away from the Scarlet camp to the south, because no herb is worth a Crusader's torch." },
      },
      choices = {
        { text = "And earthroot?", next = "where2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where2 = {
      lines = {
        { id = "wh2_default", text = "On the slopes and the rocky banks, further along the road toward Brill. You dig for that one, carefully, and you fill the hole in afterwards, which nobody ever does unless I've shouted at them first." },
      },
      choices = {
        { text = "Consider me shouted at.", next = "BACK", reply = "Good. It saves me the walk." },
        { text = "Something else, Florence.", next = "BACK" },
      },
    },
    patch = {
      lines = {
        { id = "pa_default", text = "Thank you, and it takes some keeping. The mindless ones trample through it when Deathguard Saltain's scavengers stir them up, and I've had to replant the whole east row twice since the thaw." },
      },
      choices = {
        { text = "Does anyone help you with it?", next = "BACK", reply = "Clarence Gillian waters it when I'm teaching, and tells every seedling how well it's doing. I can't say the encouragement hurts them." },
        { text = "Something else.", next = "BACK" },
      },
    },
    sick = {
      lines = {
        { id = "si_default", text = "They are sick, and they're growing anyway, which I find rather admirable. Don't go trying to mend the soil on my account, {class}; better people than either of us have looked at Tirisfal and shaken their heads." },
      },
      choices = {
        { text = "I'll honor them for growing at all.", next = "BACK", reply = "That's the right spirit. Pick them gently, then, and you'll have honoured them enough.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Herbalism is the gentlest trade there is, and most people do it as if they were pulling weeds. I can teach you to do it properly, if you'll listen." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid. I suppose you think you know plants already, and perhaps you do, but Tirisfal's soil has been through the plague, and it grows things differently now." },
      },
      again = {
        { id = "h_again", text = "Well? What else?" },
        { id = "h_again2", text = "Go on, then, and mind where you're standing; that's a seedling." },
        { id = "h_again3", text = "Is there more? I've a row of peacebloom to see to, so ask it briskly." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "What grows in Tirisfal?", next = "grows" },
        { text = "Who buys what you pick?", next = "buyers" },
        { text = "Nightshade? Like the plant you sell?", next = "name" },
        { text = "Why does it matter so much how it's picked?", next = "careful" },
        { text = "Why 'junior' trainer?", next = "junior" },
        { text = "Where should a beginner pick, near Deathknell?", next = "where" },
        { text = "Your patch is the only tidy thing in this village.", next = "patch" },
        { text = "The plants here feel sick to me, Florence.", next = "sick", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "Goodbye, Florence.", next = "END" },
      },
    },
    name = {
      lines = {
        { id = "nm_default", text = "Like the plant, yes, and you're the hundredth person to ask. It's a family name and nothing more, and I've never once picked the stuff, so you can stop looking at me like that." },
      },
      choices = {
        { text = "Forgive me, I shouldn't have asked. Something else.", next = "BACK" },
      },
    },
    careful = {
      lines = {
        { id = "cf_default", text = "Because a herb torn up by the root is a herb that never grows back, and Tirisfal has lost enough already. The newly risen come out of Deathknell grabbing at everything green as if they're afraid it'll run away, and I'd like at least a few of them to leave something for next spring." },
      },
      choices = {
        { text = "I'll leave the roots.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grows = {
      lines = {
        { id = "gr_default", text = "Peacebloom and silverleaf, mostly, and earthroot in the hills, all of them tougher than they ought to be after what this land has drunk. The plague didn't kill the glades, whatever you've heard, though it did leave them strange." },
      },
      choices = {
        { text = "Strange how?", next = "strange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange = {
      lines = {
        { id = "s_default", text = "Paler, for one, and slower to rot once they're picked, which the apothecaries find very interesting. I don't, particularly, because I only care whether they're picked cleanly, but you'd be surprised what this soil remembers." },
      },
      choices = {
        { text = "I'll pick them cleanly.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      big = true,
      lines = {
        { id = "b_default", text = "The Royal Apothecary Society buys more than anyone, and they don't say what for. Some of what I teach ends up in poultices, and some of it ends up in things I'd rather not think about, so I've learned to teach the picking and leave the rest to the people who use it." },
      },
      choices = {
        { text = "Then I'll sell where it does the most harm to our enemies.", next = "BACK", reply = "Then the Society will be glad of you, and I'll try very hard not to ask what you sold them. Pick cleanly, at least, so the roots grow back for next season.", fx = { align = { light = -1 } } },
        { text = "I'd rather my herbs went into poultices, not poisons.", next = "BACK", reply = "So would I, though once a leaf leaves my hands I've no say in where it goes. Sell to the healers in Brill, then, and you'll sleep a little easier.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I picked herbs before, and I pick them now. The only difference is that I can't smell them anymore, and that's a loss I feel every day." } },
    advice = { { id = "tp_ad", text = "Take the leaf and leave the root, unless it's the root you're after. A patch you strip bare is a patch you'll never pick again." } },
    new_plague = { { id = "tp_plague", text = "I don't ask what the Society does with what I sell, and I'd take it kindly if you didn't tell me. I teach the picking." } },
    forsaken = { { id = "tp_forsaken", text = "The newly risen grab at everything as though it might run off. A season of herb picking steadies them better than any sermon I've heard in that chapel." } },
    _none = { { id = "tp_none", text = "I know plants, and that isn't one." } },
  },
}

-- Margaret Weaver: junior skinning trainer.
P:NPC {
  key = "tf_margaret", id = TODO_NPC("Margaret Weaver"), name = "Margaret Weaver", title = "Junior Skinning Trainer",
  bible = "bibles/deathknell_forever.md", role = "trainer", tier = "service",
  communities = { "deathknell" }, temper = { "gentle" }, values = { "patient", "practical" },
  notices = { "craft", "pet" },
  impression = {
    first = "She is patient with the clumsy and firm with the wasteful.",
    third = "{name} met Margaret Weaver, Deathknell's junior skinning trainer, who sells knives, salt and thread to the newly risen.",
  },

  greetings = {
    { id = "g_default", text = "Care to learn how to take leather from a beast, or do you need new tools?" },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. Keep your knife sharp; a dull one ruins more hides than a careless hand." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Don't look so worried, {pet}; I only skin the ones that have stopped moving." },
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "Let me see your knife. Yes, you've been working, and it needs a whetstone before it needs anything else." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Skinning is slow, careful work, and the dead are good at slow work. I can teach you, and I sell knives and salt and coarse thread for whatever you mean to do with the hides." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "A hunter. You'll leave a trail of carcasses behind you wherever you go, so you might as well learn to take the hides from them as well." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear?" },
      },
      choices = {
        { text = "Teach me skinning.", next = "BUSINESS" },
        { text = "What's worth skinning around here?", next = "beasts" },
        { text = "What's the salt for?", next = "salt" },
        { text = "Does skinning ever trouble you?", next = "trouble" },
        { text = "Who uses the hides once they're cured?", next = "hides" },
        { text = "How do you keep a knife that sharp?", next = "knife" },
        { text = "You handle that knife like you've done this before.", next = "past" },
        { text = "My pet brought this down. Can I skin it?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "My people use every part of the kodo too.", next = "xtauren", when = { race = "Tauren" } },
        { text = "Goodbye, Margaret.", next = "END" },
      },
    },
    beasts = {
      lines = {
        { id = "b_default", text = "The duskbats give thin leather, but it's leather all the same, and the wolves in the hills give better. Leave the spiders of Night Web's Hollow alone, unless you'd like to learn what a skinner looks like after the spider wins." },
      },
      choices = {
        { text = "I'll start with the bats.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "The spiders don't frighten me.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    trouble = {
      big = true,
      lines = {
        { id = "tr_default", text = "Not the skinning, no. What troubles me is waste, a beast killed for sport and left for the crows with its hide spoiling, and I've seen plenty of that from the newly risen. If you take a life, the least you can do is use all of it." },
      },
      choices = {
        { text = "Agreed. Using all of it is a kind of respect.", next = "BACK", reply = "It is, and I'm glad someone finally said it back to me. Take the hide, the sinew and the fat, and the beast won't have died for nothing.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast is a resource, Margaret. Nothing more.", next = "BACK", reply = "Call it what you like, but a resource spoiled in the sun is still a waste, and waste is what offends me. Skin it properly or don't kill it at all.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = {
        { id = "hd_default", text = "Leatherworkers, mostly, in Brill and the Undercity, for armor and packs and the like. The Deathguard wear through boots at a ridiculous rate, for people who don't feel the blisters." },
      },
      choices = {
        { text = "Why do the Deathguard wear out their boots?", next = "hides2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides2 = {
      lines = { { id = "h2_default", text = "Because they never sit down, dear, and they march the same road between here and the Bulwark day and night. A living soldier rests his feet when they ache, and the dead ones just keep walking until the sole's gone and they're walking on bone." } },
      choices = {
        { text = "Bone wears down too, surely?", next = "hides3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides3 = {
      lines = { { id = "h3_default", text = "It does, and the apothecaries can't grow it back, which is why I'd like every skinner I train to bring in two good hides a week. Every pair of boots is a deathguard who'll still be standing on the wall next winter." } },
      choices = {
        { text = "Two hides a week. I'll do my share.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    knife = {
      lines = { { id = "kn_default", text = "A whetstone every evening, twenty strokes a side, and never use it to pry anything open, whatever the temptation. A skinning knife that's been used as a lever never sits true again." } },
      choices = {
        { text = "Twenty strokes a side. What else should I know?", next = "knife2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    knife2 = {
      lines = { { id = "k2_default", text = "Wipe it dry before you sheathe it, because this valley's damp gets into the steel and rusts it overnight. And keep it away from the apothecaries, who borrow things and give them back smelling of something you'd rather not know about." } },
      choices = { { text = "I'll keep it close, Margaret. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    past = {
      lines = { { id = "pa_default", text = "Have I? Perhaps my hands remember things I'd rather leave where I left them. I'll tell you this much, dear, and no more: they knew needle and thread long before they knew a knife." } },
      choices = {
        { text = "A seamstress, then? Is that the Weaver in your name?", next = "past2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past2 = {
      lines = { { id = "p2_default", text = "Maybe it is and maybe I chose it, and either way it's mine now. The Scourge took a great deal from me, but it didn't take my hands, so I use them, and I don't look back over my shoulder." } },
      choices = {
        { text = "I won't ask again, Margaret.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = { { id = "xh_default", text = "You can, if you know how, and if your beast will let you near its supper. Cut it before it stiffens, which in this cold is sooner than you'd think, and thank the beast that did the hard part." } },
      choices = { { text = "I'll thank it with the scraps.", next = "BACK", fx = { affinity = 1 } } },
    },
    xtauren = {
      lines = { { id = "xt_default", text = "So I'm told, hide for tents and horn for tools and nothing left for the crows. I'd like to see your people work a hide one day, because I think I'd learn more in an hour than in a year of teaching." } },
      choices = {
        { text = "Come to Thunder Bluff one day.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    salt = {
      lines = {
        { id = "s_default", text = "It's for curing. A raw hide goes bad quickly, even in this damp, and salt draws the water out so the leatherworkers have something to work with. You'd think the dead would have lost the habit of keeping things from rotting, but it turns out we're rather good at it." },
      },
      choices = {
        { text = "That's a grim joke, Margaret.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "That's my own business, dear, and it was a long time ago. I'd rather teach you something useful." } },
    scourge = { { id = "tp_scourge", text = "The Scourge wasted everything it touched, people and beasts alike, and left them lying. I'll not be like it, not in the smallest thing." } },
    advice = { { id = "tp_ad", text = "Cut along the grain and don't rush the belly. Hurry and you'll have two half-hides that nobody wants." } },
    _none = { { id = "tp_none", text = "I couldn't say, dear. Ask me about hides." } },
  },
}

-- Walter Mason: junior mining trainer.
P:NPC {
  key = "tf_walter", id = TODO_NPC("Walter Mason"), name = "Walter Mason", title = "Junior Mining Trainer",
  bible = "bibles/deathknell_forever.md", role = "trainer", tier = "service",
  communities = { "deathknell" }, temper = { "cheerful" }, values = { "practical", "proud" },
  notices = { "craft", "race" },
  impression = {
    first = "He talks about copper veins the way other men talk about friends.",
    third = "{name} met Walter Mason, Deathknell's junior mining trainer, who will talk about copper for as long as anyone lets him.",
  },

  greetings = {
    { id = "g_default", text = "How can I help you? If it's about rocks, I'm your man." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Found any good veins yet?" },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, in Deathknell! I won't presume to teach you mining, friend, but I'd love to hear what you think of our copper." },
    { id = "n_mine", cat = "craft", when = { profession = "Mining" },
      text = "There's copper dust in the creases of your gloves. Good; that means you've been working rather than just carrying the pick about." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mining is honest work, and it doesn't care whether your heart still beats. I can teach you the basics, and I sell picks and packs, and a blacksmith's hammer if you mean to do something with the ore once you've got it." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A tauren! I'm told your people don't care much for digging in the earth, so I'm curious what brings you to a mining trainer, though you're welcome all the same." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know?" },
      },
      choices = {
        { text = "Teach me mining.", next = "BUSINESS" },
        { text = "Where's the ore around here?", next = "ore" },
        { text = "What do I do with ore?", next = "smelt" },
        { text = "Who buys the copper?", next = "buyers" },
        { text = "Why sell a blacksmith's hammer?", next = "hammer" },
        { text = "Were you a miner before you died?", next = "life" },
        { text = "Mason's a stonemason's name, surely?", next = "grand" },
        { text = "This copper's thin stuff next to Dun Morogh's.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "My people ask the earth before we take from it.", next = "xtauren", when = { race = "Tauren" } },
        { text = "Goodbye, Walter.", next = "END" },
      },
    },
    ore = {
      lines = {
        { id = "o_default", text = "Copper, in the hills around Deathknell and on toward Brill, and you'll see the green streaks in the rock once you know what to look for. There's a fair bit in Night Web's Hollow too, but the spiders got there first, and they don't share." },
      },
      choices = {
        { text = "And once I've outgrown copper?", next = "ore2" },
        { text = "I'll clear the spiders, then.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I'll stick to the hills.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    buyers = {
      big = true,
      lines = {
        { id = "by_default", text = "The smiths in Brill and the Undercity, and most of what they make goes to the Deathguard, one way or another. A good share of every vein in Tirisfal ends up on the walls at the Bulwark, so I like to think a miner's doing his part, though others just sell to whoever pays most." },
      },
      choices = {
        { text = "Arming the Forsaken is good work. That's where mine goes.", next = "BACK", reply = "Good, because the Bulwark eats iron faster than we can dig it. Every bar you bring back is another blade between Brill and the plague.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll sell to whoever pays best, Walter.", next = "BACK", reply = "Plenty do, and I'll not pretend coin doesn't spend. Only remember that the walls at the Bulwark don't hold themselves up when the Scourge comes calling.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hammer = {
      lines = {
        { id = "hm_default", text = "Because the new ones always come back a week later wanting to try their hand at the forge, and it saves them a walk. A pick and a hammer go together like bread and butter, or they did when I could still taste either." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    smelt = {
      lines = {
        { id = "s_default", text = "Smelt it into bars, and then the smiths will buy it, or you can take up blacksmithing yourself and make something of it. I'd say the forge is the natural partner to the pick, but then I'm biased, and I always will be." },
      },
      choices = {
        { text = "The forge it is, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore2 = {
      lines = { { id = "o2_default", text = "Then it's tin, down in Silverpine past the Sepulcher, and silver if you're lucky, and you'll want to ask Johan Focht there about the old workings. He'll grumble, but he knows every vein from the Sepulcher to the coast." } },
      choices = {
        { text = "Is there no tin in Tirisfal?", next = "ore3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore3 = {
      lines = { { id = "o3_default", text = "A little, up north toward the old forge, but the Scourge overran that end of the valley and it's not been taken back. I'd not send a new miner up there, not for all the tin in Lordaeron." } },
      choices = { { text = "Silverpine it is, then. Something else.", next = "BACK" } },
    },
    life = {
      lines = { { id = "li_default", text = "Forty years in the hills of Lordaeron, copper and tin and once, gloriously, a seam of silver that kept my family in shoes for a decade. I came up out of the ground one evening and the plague was waiting at the top of the shaft." } },
      choices = {
        { text = "And yet you went back to mining.", next = "life2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    life2 = {
      big = true,
      lines = { { id = "l2_default", text = "What else would I do? The rock doesn't care that I'm dead, and it doesn't care whose side I'm on, and there's a great comfort in that. Some of the risen say we should leave our old lives in the grave, and some say they're all we've got. What do you say?" } },
      choices = {
        { text = "Hold on to who you were. It's yours.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The grave took that life. Build a new one.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grand = {
      lines = { { id = "gr_default", text = "My grandfather's, and he cut the stone for half the farmhouses between here and the capital. I dig it up and he shaped it, so between us we've handled most of the rock in Tirisfal, one way or another." } },
      choices = {
        { text = "Do any of his houses still stand?", next = "grand2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grand2 = {
      lines = { { id = "g2_default", text = "A few, though the Scarlets have taken one at Solliden and put their banners on it. That galls me more than it should, for a man who's been dead this long, but it was good stone and they don't deserve it." } },
      choices = {
        { text = "We'll take it back from them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = { { id = "xd_default", text = "Ha! It is, and I won't pretend otherwise to a dwarf, but it's our thin stuff and we're glad of it. If you ever want to show an old Lordaeron miner how it's done in Ironforge, I'll buy the ale, though I can't drink it." } },
      choices = { { text = "You've a deal, Walter.", next = "BACK", fx = { affinity = 2 } } },
    },
    xtauren = {
      lines = { { id = "xt_default", text = "Do you, now? I always just said sorry to the mountain when I struck it, which my wife thought was daft. Perhaps your people and I would have got on, after all." } },
      choices = {
        { text = "Sorry is a fine start, Walter.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Everyone asks whether the name means I was a stonemason, and I tell them it means my grandfather was. I just dig up what the masons used." } },
    advice = { { id = "tp_ad", text = "Mine the vein from the edges in. Strike the middle first and half of it crumbles to dust." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron was built on good stone and better copper, and I dug a fair bit of both. The kingdom's gone, but the rock's still there, waiting." } },
    _none = { { id = "tp_none", text = "That's not something you'll find in a rock, friend, so I wouldn't know." } },
  },
}

-- Frightened Paladin: a newly risen Forsaken paladin who fled into the hills west of Deathknell
-- and cannot bear what she has become. Aramis Hammerhand sends risen paladins to find her (Coming to Terms).
P:NPC {
  key = "tf_frightened_paladin", id = TODO_NPC("Frightened Paladin"), name = "Frightened Paladin", gender = "female",
  bible = "bibles/deathknell_forever.md", role = "citizen", tier = "quest",
  communities = { "deathknell" }, temper = { "anxious", "hostile" }, values = { "faith" },
  notices = { "race", "class" },
  impression = {
    first = "She holds her mace out in both hands, as if she were warding off a ghoul.",
    third = "{name} found the frightened paladin in the hills west of Deathknell, who would rather die than be Forsaken.",
  },
  greetings = {
    { id = "g_default", text = "Get away from me, monster! Don't come any closer!" },
  },
  notice = {
    { id = "n_pal", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "You wear the Light's colours over rotten skin, and you think that makes you one of us. It makes you a mockery of everything we swore." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "Her armour is too big for what is left of her, and it rattles when she backs away.",
      lines = {
        { id = "h_default", key = true, text = "Get away from me, monster! I've seen what's down in that chapel, and I won't let you drag me back to it." },
        { id = "h_quest", when = { questActive = TODO_QUEST("Coming to Terms") },
          text = "Hammerhand sent you, didn't he? I heard him calling after me, all kindness and prayers, as if the Light could ever look at what we are." },
      },
      again = {
        { id = "h_again", text = "Why are you still here? Say it and go." },
        { id = "h_again2", text = "Stay back, I said! What else could you possibly want?" },
      },
      choices = {
        { text = "You've been raised, and the Light still answers you.", next = "raised" },
        { text = "What do you remember, before you woke?", next = "before" },
        { text = "Who did you serve in life?", next = "served" },
        { text = "Aramis Hammerhand is worried about you.", next = "aramis" },
        { text = "Your armour doesn't fit you anymore.", next = "armour" },
        { text = "What did you see in the chapel?", next = "chapel" },
        { text = "I'm a paladin too, risen like you. Look at me.", next = "look", when = { class = "PALADIN" } },
        { text = "The Shadow is a kinder master than the Light.", next = "shadow", when = { class = "PRIEST" } },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    raised = {
      lines = { { id = "r_default", text = "Raised? I was dragged out of a grave by the Dark Lady's servants, and you call that a second chance. I swore an oath to burn creatures like us, and I kept it, right up until I became one." } },
      choices = {
        { text = "The Light answers us still. That must mean something.", next = "plea" },
        { text = "Then you know what has to happen now.", next = "plea" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plea = {
      big = true,
      lines = { { id = "p_default", text = "No! No, no, no, this can't be what I am. I would rather be dead than Forsaken, and if you won't let me be, I'll make you do it." } },
      choices = {
        { text = "Come with me. We'll face this together, sister.", next = "END", reply = "<She raises her weapon, shaking, and lunges at you.>", fx = { align = { light = 1 } } },
        { text = "If that's your choice, I'll grant you a clean end.", next = "END", reply = "<She raises her weapon with a cry and charges.>", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = { { id = "b_default", text = "Smoke, and a field full of the dead walking, and my own sword feeling heavier with every swing. Then nothing, and then a cold stone floor and a voice telling me to rise, and I did, Light forgive me, I did." } },
      choices = { { text = "That wasn't your fault. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    served = {
      lines = { { id = "s_default", text = "The Silver Hand, as squire to a knight of Lordaeron, and I was nearly made a paladin myself before the plague came. I don't know if my knight still lives, and I hope to the Light he never sees me now." } },
      choices = {
        { text = "What was your knight's name?", next = "knight" },
        { text = "I'm sorry. Something else.", next = "BACK" },
      },
    },
    knight = {
      lines = { { id = "k_default", text = "I won't say it, not with this mouth. He used to tell me the Light was a lamp you carried for others, and I carried it, I swear I did, right up until the lamp went out." } },
      choices = {
        { text = "It didn't go out. It's still in you.", next = "knight_lamp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    knight_lamp = {
      lines = { { id = "kl_default", text = "<She looks down at her own hands as if they belonged to someone else.> It came when I prayed, the first night. I thought it had come to burn me clean, and I waited for it to finish, and it never did." } },
      choices = {
        { text = "Maybe it wasn't trying to burn you at all.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    aramis = {
      lines = { { id = "ar_default", text = "Hammerhand! He prays over us in that chapel as if nothing were wrong, as if a dead man calling on the Light were the most natural thing in the world. He frightens me more than the ghouls do, because he isn't afraid at all." } },
      choices = {
        { text = "He found peace with what he is. So could you.", next = "aramis_peace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    aramis_peace = {
      lines = { { id = "ap_default", text = "Peace? He calls it peace, and I call it giving up. If I stop being afraid of what I am, then I've accepted it, and if I've accepted it, then the Crusade was right about all of us." } },
      choices = {
        { text = "The Crusade was never right about anything.", next = "BACK", reply = "You say that easily, but you never knelt beside them. They weren't all monsters, and that's the trouble." },
        { text = "Something else.", next = "BACK" },
      },
    },
    armour = {
      lines = { { id = "am_default", text = "It was fitted to me when I had flesh to fill it. Every step, it rattles, and every rattle reminds me how little of me is left inside it, so don't you dare make light of it." } },
      choices = { { text = "I wasn't mocking you. Something else.", next = "BACK" } },
    },
    chapel = {
      lines = { { id = "ch_default", text = "Rows of us, laid out on stone, and those dark priests walking between the slabs and whispering until the bodies sat up. I watched a man I knew in Brill open his eyes and ask for his wife, and the priest told him she'd been burned." } },
      choices = { { text = "That's a hard way to wake. Something else.", next = "BACK" } },
    },
    look = {
      lines = { { id = "lo_default", text = "<She stares at your tabard, then your face, and her mace dips a little.> You call on it too? And it doesn't flinch away from you? Then tell me, how do you bear it?" } },
      choices = {
        { text = "By serving. The Light judges what we do, not what we are.", next = "BACK", reply = "What we do, not what we are. I want to believe that more than I've wanted anything.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I don't ask the Light's opinion. I use it.", next = "BACK", reply = "That's blasphemy, and it's exactly what the Crusade said your kind would do. Stay away from me!", fx = { affinity = -2, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadow = {
      lines = { { id = "sh_default", text = "Kinder? It whispered to me in that chapel, all cold and patient, and I'd sooner have the Light burn me to ash than listen to it again. Keep your shadow, priest, and keep it far from me." } },
      choices = { { text = "Suit yourself. Something else.", next = "BACK" } },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "I knelt beside some of them in chapel, once. They'd burn me now and pray while they did it, and I'm not certain they'd be wrong." } },
    aramis = { { id = "tp_aramis", text = "He's too calm. Nobody dead should be that calm." } },
    _none = { { id = "tp_none", text = "I don't care! Leave me alone!" } },
  },
}

-- Deathguard Veteran: the guards at Deathknell's entrance.
P:NPC {
  key = "tf_deathguard_veteran", id = TODO_NPC("Deathguard Veteran"), name = "Deathguard Veteran", gender = "male",
  bible = "bibles/deathknell_forever.md", role = "guard", tier = "service",
  communities = { "deathknell" }, temper = { "cold", "dry" }, values = { "duty" },
  impression = {
    first = "He has the patience of a man who has stood at this gate for a very long time.",
    third = "{name} spoke with a Deathguard Veteran at the entrance to Deathknell.",
  },
  greetings = {
    { id = "g_default", text = "Newly risen, are you? Inside is the safe side of this gate, and outside is not, so keep that straight." },
    { id = "g_back", when = { metBefore = true }, text = "Still walking, I see. That's more than most manage their first week." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I've held Deathknell's gate since the Dark Lady took it back from the Scourge, and I've watched a great many fresh corpses walk out of it. The mindless wander the fields, and the Scarlet Crusade comes over the hills when they feel bold, so mind both." } },
      again = { { id = "h_again", text = "Anything else? I'll be here." } },
      choices = {
        { text = "What's out there, past the gate?", next = "out" },
        { text = "Are the Scarlets really that close?", next = "scarlet" },
        { text = "How long have you stood this gate?", next = "long" },
        { text = "You don't seem to blink much.", next = "blink" },
        { text = "What became of the mindless who wake here?", next = "mindless" },
        { text = "I've come to Deathknell from the Horde lands.", next = "horde", when = { faction = "Horde", ["not"] = { race = "Scourge" } } },
        { text = "Carry on, Deathguard.", next = "END" },
      },
    },
    out = {
      lines = { { id = "o_default", text = "The mindless, mostly, who woke without their wits, and the Night Web spiders in the hollow, and the old graves past them. Shadow Priest Sarvis sets the newly risen to clearing it, and you'd do well to go to him if you haven't." } },
      choices = { { text = "I'll find him. Something else.", next = "BACK" } },
    },
    scarlet = {
      lines = { { id = "s_default", text = "Close enough that I've had their arrows in my shield, and they come burning everything they think is ours. They'd put Deathknell to the torch tomorrow if they thought they could hold it." } },
      choices = {
        { text = "Let them come. They'll find us ready.", next = "BACK", reply = "That's the spirit the Deathguard likes, so keep it till you're strong enough to back it up.", fx = { align = { order = 1 } } },
        { text = "Then maybe we should strike them first.", next = "BACK", reply = "Bold, and not wrong, but you'll want some flesh on those bones before you try it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    long = {
      lines = { { id = "lo_default", text = "Since we took this village back from the Scourge, and I've counted the risen who came out past me since. I stopped counting the ones who didn't come back at around three hundred." } },
      choices = {
        { text = "Three hundred? What killed them?", next = "long_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    long_dead = {
      lines = { { id = "ld_default", text = "Overconfidence, mostly, dressed up as Scarlet arrows or spider bites. A fresh corpse thinks it can't die twice, and the world is very keen to correct that notion." } },
      choices = {
        { text = "And what keeps you going, after all that?", next = "long_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    long_why = {
      big = true,
      lines = { { id = "lw_default", text = "The Dark Lady gave me my will back, and I've decided to spend it standing here. Some call that duty and some call it a rut, so which do you call it?" } },
      choices = {
        { text = "Duty. Someone has to hold the gate.", next = "BACK", reply = "Spoken like a future Deathguard. Mind you don't end up holding a gate yourself.", fx = { align = { order = 1 } } },
        { text = "A rut. You were freed to do more than this.", next = "BACK", reply = "Maybe so, but a free man can choose a rut, and I've chosen mine.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    blink = {
      lines = { { id = "bl_default", text = "My eyelids went the way of my lips, a long while ago. It's a help on watch, and a terrible hindrance when the wind blows dust off the graves." } },
      choices = { { text = "I'll take your word for it. Something else.", next = "BACK" } },
    },
    mindless = {
      lines = { { id = "mi_default", text = "Some wake hollow, with nothing in their heads but hunger, and we turn them out into the fields. The newly risen are set to put them down, which is a cruel lesson, but it teaches you what you were spared." } },
      choices = { { text = "That's a grim mercy. Something else.", next = "BACK" } },
    },
    horde = {
      lines = { { id = "ho_default", text = "Have you, now? The Horde's own folk, come to see where the Forsaken are made. Mind you don't eat anything offered in Brill, and don't stare at the raising." } },
      choices = { { text = "Good advice. Something else.", next = "BACK" } },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "Bold when there's a dozen of them, and running when there's three. Shoot the one with the banner first." } },
    sarvis = { { id = "tp_sarvis", text = "Shadow Priest Sarvis raised half the corpses who walk past this gate. Report to him if you've not done so." } },
    _none = { { id = "tp_none", text = "I watch a gate, risen one. Ask in the chapel." } },
  },
}

-- Injured Deathguard: kneeling in Deathknell, too broken to stand his post.
P:NPC {
  key = "tf_injured_deathguard", id = TODO_NPC("Injured Deathguard"), name = "Injured Deathguard", gender = "male",
  bible = "bibles/deathknell_forever.md", role = "guard", tier = "service",
  communities = { "deathknell" }, temper = { "weary", "dry" }, values = { "duty" },
  impression = {
    first = "He kneels with one hand on the ground, holding himself together in more than one sense.",
    third = "{name} spoke with an injured Deathguard kneeling in Deathknell.",
  },
  greetings = {
    { id = "g_default", text = "Don't mind me, I'm only resting, and I'll be back on my feet once someone sews my leg on properly." },
    { id = "g_back", when = { metBefore = true }, text = "Still kneeling, as you see. The stitches are taking their time." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "One of his greaves lies on the ground beside him, and so, you notice, does part of the leg.",
      lines = { { id = "h_default", key = true, text = "The Scarlets caught our patrol on the road west of here, and I came off worse than I'd like to admit. The good news about being dead is that it hurts less than it should, and the bad news is that I mend slower than a living man." } },
      again = { { id = "h_again", text = "Something more? I'm not going anywhere, as you can see." } },
      choices = {
        { text = "Will you heal?", next = "heal" },
        { text = "You took it well, for a man in pieces.", next = "joke" },
        { text = "Tell me about the ambush.", next = "ambush" },
        { text = "What became of the rest of your patrol?", next = "patrol" },
        { text = "I could patch that leg, if you'll hold still.", next = "patch", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Want me to hunt the Scarlets who did this?", next = "revenge", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } } },
        { text = "Rest easy, Deathguard.", next = "END" },
      },
    },
    heal = {
      lines = { { id = "he_default", text = "The Apothecaries say so, and they've a thread and a needle for most things. I've seen worse put back together, though I'd rather not tell you which parts of which men." } },
      choices = { { text = "Then I'll wish you a quick mending. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    joke = {
      lines = { { id = "j_default", text = "Ha, that's the trick of it, friend, because you learn to laugh about these things or you don't last. If a Crusader ever takes your arm, pick it up and carry it home, because it's easier to sew than to grow." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    ambush = {
      lines = { { id = "am_default", text = "Five of them in the trees by the road, with a priest behind calling the Light down on us like it was hail. I've never felt anything like it, friend, it was like being dropped in boiling oil." } },
      choices = {
        { text = "The Light hurts the Forsaken that badly?", next = "ambush_light" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambush_light = {
      lines = { { id = "al_default", text = "When it's thrown at you in hate, yes. Funny thing is, the paladins up at Bandarion Keep say it doesn't hurt them half so much when they call it themselves, though I've never fancied testing that." } },
      choices = {
        { text = "Would you trust those paladins at your back?", next = "ambush_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambush_trust = {
      big = true,
      lines = { { id = "at_default", text = "After that priest? I'm not sure, and that's the honest answer. What do you think, should the Forsaken be letting dead men pray?" } },
      choices = {
        { text = "Any weapon against the Scarlets is a good weapon.", next = "BACK", reply = "That's a practical way of seeing it, and I'm a practical man, or what's left of one.", fx = { align = { light = 1 } } },
        { text = "No. The Light has done nothing but burn us.", next = "BACK", reply = "Aye, that's my leg's opinion too. I'll keep it in mind next time I see a tabard.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    patrol = {
      lines = { { id = "pa_default", text = "Two came back with me and one didn't, and we couldn't find enough of him to bring to the Apothecaries. The Scarlets burn what they kill, which is about the only thing they're thorough about." } },
      choices = { { text = "I'm sorry for your loss. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    patch = {
      lines = {
        { id = "pt_default", text = "Kind of you, but your sort of mending tends to sting the dead, and I've had enough stinging for one week. A needle and a bit of embalming fluid will do me, thank you all the same." },
        { id = "pt_scourge", when = { race = "Scourge", class = "PRIEST" }, text = "A shadow priest's hand would do me no harm, though I'd still rather wait for the needle. Thank you all the same." },
      },
      choices = { { text = "As you like. Something else.", next = "BACK" } },
    },
    revenge = {
      lines = { { id = "rv_default", text = "Would I? I'd like it more than I can say, but the Deathguard doesn't hand out vengeance like sweets. Take whatever work Sarvis and the others give you, and if a Scarlet falls along the way, I'll consider us square." } },
      choices = { { text = "Consider it done. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "They bring priests to an ambush now. Keep that in mind on the western road." } },
    _none = { { id = "tp_none", text = "I don't know, friend, and I've other things on my mind, like my leg." } },
  },
}
