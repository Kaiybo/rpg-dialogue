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
