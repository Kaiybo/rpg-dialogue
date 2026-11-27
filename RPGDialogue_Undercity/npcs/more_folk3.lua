-- More of the Undercity, third file: the Trade Quarter's merchants, the War Quarter's weapon
-- sellers and suppliers, and the auctioneers of the ring. Voices: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Louis Warren: Trade Quarter weapons merchant; sells plain arms and remembers who carried them.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_lwarren", id = TODO_NPC("Louis Warren"), name = "Louis Warren", title = "Weapons Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "mournful", "honest" }, values = { "honesty", "memory" },
  notices = { "class", "purse" },
  impression = {
    first = "Louis Warren sells swords and maces in the Trade Quarter and sounds faintly sorry about every sale. He is honest about what each weapon will and will not do, and he seems to remember every customer who never came back.",
    third = "{name} met Louis Warren, a weapons merchant in the Undercity's Trade Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. For a regular like you, I'll find the better stock from the back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The prices are what they are, and I'm not in a haggling mood." },
    { id = "g_1", text = "Good day to you. Have a look, by all means, and I'll tell you the truth about anything you pick up." },
    { id = "g_2", when = { class = { "WARRIOR", "ROGUE" } }, text = "You've the walk of someone who uses these for a living. Then I'll not waste your time with the handsome ones." },
    { id = "g_3", when = { metBefore = true }, text = "You came back. I'm always glad of that, since a good many don't." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "WARRIOR" },
      text = "There's a notch a third of the way down your edge, where you parried something heavier than you. It held, and you held, so I'd call it a good blade." },
    { id = "n_2", cat = "purse", when = { money = { max = 5000 } },
      text = "You're short of coin, I think. Then buy the plain mace, friend. It's ugly and it never breaks, and I'd rather you had that than nothing." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Louis Warren. I sell the common arms, swords and maces and axes, to deathguards and travellers and anyone setting out. Gordon Wendham has the stall beside me, and between us we've armed half of what leaves by the east gate." },
        { id = "hello_2", when = { metBefore = true }, text = "Louis Warren, as before. The stock's much the same, good plain steel from the War Quarter forges. I've nothing fancy and I'd not sell it to you if I had." },
      },
      again = {
        { id = "hello_a1", text = "Was there something more?" },
        { id = "hello_a2", text = "Go on, friend. I've time." },
        { id = "hello_a3", text = "Ask what you like." },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "You promised me the truth about your stock.", next = "truth" },
        { text = "How's trade beside Gordon Wendham?", next = "gordon" },
        { text = "You said a good many don't come back.", next = "gone" },
        { text = "What would you sell a warrior like me?", next = "notch", when = { class = "WARRIOR" } },
        { text = "Farewell, Louis.", next = "END" },
      },
    },
    truth = {
      lines = { { id = "truth_1", text = "Then here it is. The swords are sound and a little soft, so they'll bend before they break, which is the right way round. The axes are better than they look. The daggers are poor, and you should buy those from Charles Seaton instead." } },
      choices = {
        { text = "You send customers to a rival?", next = "truth2" },
        { text = "An honest merchant, in this city.", next = "truth2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    truth2 = {
      lines = { { id = "truth2_1", text = "I do. If I sold you a bad dagger and it failed you in some cellar, I'd have a coin and you'd have nothing at all. I've made that trade before, without knowing it, and I don't care to make it knowingly." } },
      choices = {
        { text = "That's a rare kind of conscience.", next = "BACK", reply = "It's a late one. I'd have been a richer man with none.", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Sentiment is bad for business.", next = "BACK", reply = "So Gordon tells me, weekly. He's doing better than I am." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    gordon = {
      lines = { { id = "gordon_1", text = "Friendly enough. He sells and I supply the regrets. Gordon's a talker, and he's forever sending customers on errands to his friend the bat handler. I've less to say, so the quiet ones come to me, and it evens out." } },
      choices = {
        { text = "Every market needs a quiet stall.", next = "BACK", reply = "It does. Somebody has to let the customer think." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    gone = {
      lines = { { id = "gone_1", text = "I sell a sword to a young deathguard, and he tells me where he's posted. The Bulwark, or the Sepulcher, or down to Tarren Mill. Then a season passes. Some come back for a whetstone, and I'm always more pleased to see them than I let on." } },
      choices = {
        { text = "And the ones who don't?", next = "gone2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    gone2 = {
      big = true,
      lines = { { id = "gone2_1", text = "I keep a tally, on the back of the stall. A mark for each one I've armed, and a second stroke through it if they come back. There are a great many single strokes. Gordon says it's morbid and I should scrape it off. What do you say?" } },
      choices = {
        { text = "Keep it. Someone should remember them.", next = "BACK", reply = "Then I shall. It's little enough, a chalk mark.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Scrape it off. You sell swords, not graves.", next = "BACK", reply = "Maybe so. I'll think on it, though I expect I'll go on marking.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gone3 = {
      lines = { { id = "gone3_1", text = "The oldest single stroke is a girl called Wren, who bought a short sword with her first wages and went to the Bulwark. That was two winters back. I've not put the second stroke through, and I've not given up either." } },
      choices = {
        { text = "She may yet walk in for a whetstone.", next = "BACK", reply = "That's what I tell the chalk." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    notch = {
      lines = { { id = "notch_1", text = "The broad axe on the left, since you've the shoulders for it and you parry with the flat, which a sword won't forgive for long. It isn't pretty. Bring it back in a year and show me the notches, and I'll know I chose right." } },
      choices = {
        { text = "Do you remember them all, the ones you've armed?", next = "gone3" },
        { text = "I'll bring it back, notched.", next = "BACK", reply = "Do. I'll have the chalk ready." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We've all been killed once, and it makes me careful about sending anyone off badly armed to do it twice." } },
    advice = { { id = "tp_advice", text = "Buy the weapon you can swing a hundred times. The one that tires you in ten will get you killed at eleven." } },
    lordaeron = { { id = "tp_lordaeron", text = "I kept a pawnshop in the capital. Men pledged their swords to me and went to fight the plague with pitchforks. I think about that." } },
    scourge = { { id = "tp_scourge", text = "Most of what I sell is swung at them, and I'm glad of it. I only wish more of it came home." } },
    sylvanas = { { id = "tp_sylvanas", text = "She leads from the front, they say. I'd arm her gladly, though I doubt she needs anything of mine." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, friend, and I'd rather say so than guess." } },
  },
}

---------------------------------------------------------------------------
-- Lauren Newcomb: Trade Quarter light armour merchant; fits cloth and leather with a critical eye.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_newcomb", id = TODO_NPC("Lauren Newcomb"), name = "Lauren Newcomb", title = "Light Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "brisk", "frank" }, values = { "craft", "practicality" },
  notices = { "class", "race" },
  impression = {
    first = "Lauren Newcomb sells light armour in the Trade Quarter and fits it herself, tugging at straps and saying exactly what she thinks of the customer's posture. She is brisk and frank and seems to have no patience for vanity.",
    third = "{name} met Lauren Newcomb, a light armour merchant in the Undercity's Trade Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you, friend. I've been keeping an eye out for things you might want." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The prices are what they are, and I'm not in a haggling mood." },
    { id = "g_1", text = "Stand up straight and let me look at you, because I can't fit a slouch." },
    { id = "g_2", when = { class = { "ROGUE", "HUNTER", "DRUID" } }, text = "You'll want leather, and you'll want it quiet. Turn round. Yes, I thought so, one shoulder's lower than the other." },
    { id = "g_3", when = { metBefore = true }, text = "You again. Has it stretched? They always come back when it's stretched." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Robes, and nothing under them but hope. I can sell you a padded vest that sits flat beneath, and nobody need know you've grown sensible." },
    { id = "n_2", cat = "race", when = { race = "Tauren" },
      text = "I'll be plain with you. I've nothing on the rack that'll go round you, but I can let out a jerkin with gussets if you've an hour." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Lauren Newcomb. I sell the light stuff, padded cloth and leather, for those who'd rather not be hit than be hit and survive it. I fit everything myself, and I'll tell you if it doesn't suit, even if you've already paid." },
        { id = "hello_2", when = { metBefore = true }, text = "Lauren Newcomb. Let me see how the last piece is wearing. Hm. You've been sleeping in it, by the creases, and I can't say I blame you." },
      },
      again = {
        { id = "hello_a1", text = "Anything else? Arms down, please." },
        { id = "hello_a2", text = "Go on, I can pin and talk." },
        { id = "hello_a3", text = "Yes?" },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "What makes armour fit properly?", next = "fit" },
        { text = "Who makes your stock?", next = "makers" },
        { text = "Is it different, fitting the dead?", next = "dead" },
        { text = "An hour is no trouble.", next = "gusset", when = { race = "Tauren" } },
        { text = "I'll stop slouching and go.", next = "END" },
      },
    },
    fit = {
      lines = { { id = "fit_1", text = "Room at the shoulder and none at the waist. You should be able to touch your own back and draw a full breath, if you breathe. Most people buy too large, thinking it's comfortable, and then a blade finds the fold." } },
      choices = {
        { text = "And if it's too tight?", next = "fit2" },
        { text = "That sounds like experience talking.", next = "fit2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fit2 = {
      lines = { { id = "fit2_1", text = "Then you can't lift your arms, and you die tidy. I learned the trade fitting militia in Brill, farm lads who'd never worn more than a shirt. I got it wrong for the first dozen, and I heard afterwards which dozen it was." } },
      choices = {
        { text = "And you've fitted properly ever since.", next = "BACK", reply = "Every one. I'd sooner be rude than be wrong again.", fx = { affinity = 1 } },
        { text = "No fit would have saved them from the Scourge.", next = "BACK", reply = "That's likely true. I'd still rather it hadn't been my seams." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    makers = {
      lines = { { id = "makers_1", text = "The leather's from Arthur Moore's bench in the Rogues' Quarter, and the padded cloth from Rhiannon Davis. I do the finishing and the fitting. Gillian Moore sells leather too, further in, and hers is finer and mine is cheaper, and we're both honest about it." } },
      choices = {
        { text = "No rivalry with Gillian Moore?", next = "makers2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    makers2 = {
      lines = { { id = "makers2_1", text = "None worth the name. She dresses rogues and I dress everyone else, and when one of mine wants something silent and black I walk them across myself. There's little enough custom in a dead city without fighting over it." } },
      choices = {
        { text = "That's good sense.", next = "BACK", reply = "It's arithmetic, same as most good sense." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    dead = {
      big = true,
      lines = { { id = "dead_1", text = "Very. We've no flesh to speak of, some of us, so a jerkin hangs on bone and rubs it. I pad the collarbone and the hip. And we don't sweat, so the leather dries and cracks. I tell them to oil it weekly. Half of them don't. Would you, if you felt nothing?" } },
      choices = {
        { text = "I would. Care is a discipline, not a feeling.", next = "BACK", reply = "Good. I wish I could sew that into the lining.", fx = { align = { order = 1 } } },
        { text = "Why bother? It's only a skin over bones.", next = "BACK", reply = "That skin's the only thing between the bones and a Scourge axe. But suit yourself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gusset = {
      lines = { { id = "gusset_1", text = "Then stand still, and mind your horns on the lamp. Four gussets, two at the ribs and two under the arms, and I'll double the lacing. It's the most leather I've used on one customer, and I shall quite enjoy the puzzle of it." } },
      choices = {
        { text = "Have you fitted many of the living Horde?", next = "gusset2" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    gusset2 = {
      lines = { { id = "gusset2_1", text = "More each month. Orcs are easy, they're only wide. Trolls are all leg and want everything short in the body. And every one of you is warm! I'd forgotten that a customer could be warm. It gave me quite a turn the first time." } },
      choices = {
        { text = "We forget your people are cold.", next = "BACK", reply = "Well, now we've both learned something, and you've a jerkin that fits." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "Bone and gristle and stubbornness. We're hard to fit and harder to kill, and I've a hand in the second part." } },
    advice = { { id = "tp_advice", text = "Oil your leather and check your laces before you set out, and not when the trouble's already started." } },
    lordaeron = { { id = "tp_lordaeron", text = "Brill had a militia of forty. I could still tell you their chest measurements, every one." } },
    scourge = { { id = "tp_scourge", text = "They fight in rags. If they ever took to wearing armour, I think we'd be in real difficulty." } },
    sylvanas = { { id = "tp_sylvanas", text = "Ranger leathers, cut for a bow arm. Whoever made hers knew their business, and I say it with some envy." } },
    _none = { { id = "tp_none", text = "I've no idea. Ask me something I can measure." } },
  },
}

---------------------------------------------------------------------------
-- Timothy Weldon: the younger heavy armour merchant of the Trade Quarter; polishes everything, envies the deathguards.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_weldon", id = TODO_NPC("Timothy Weldon"), name = "Timothy Weldon", title = "Heavy Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "young", "earnest" }, values = { "duty", "pride" },
  notices = { "class", "race" },
  impression = {
    first = "Timothy Weldon sells mail and plate in the Trade Quarter and polishes it until it shows the lamps. He died young and never got to wear what he sells in a battle, and it shows in how he asks customers about theirs.",
    third = "{name} met Timothy Weldon, a heavy armour merchant in the Undercity's Trade Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my favourite customer. Come and look; I'll knock a little off for you, quietly." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The prices are what they are, and I'm not in a haggling mood." },
    { id = "g_1", text = "Welcome! Everything's been polished this morning, so please do try it on, and I'll buff the fingerprints off after." },
    { id = "g_2", when = { class = { "WARRIOR", "PALADIN" } }, text = "You've worn plate in a real fight, haven't you? I can tell by the dents. Would you tell me about one of them, when you've a moment?" },
    { id = "g_3", when = { metBefore = true }, text = "You're back! Did the armour hold? I've been wondering since you left." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "WARRIOR" },
      text = "That pauldron's taken a blow from above, a mace or a hammer. I'd love to know what was holding it. Sorry. Mr. Ellingson says I ask too many questions." },
    { id = "n_2", cat = "race", when = { race = "Orc" },
      text = "An orc! Your people's armour is all spikes and thick plate. I tried to make a shoulder like yours once and couldn't lift it onto the stand." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Timothy Weldon. I sell mail and plate, helms and shields, alongside Mr. Ellingson, who taught me the trade. He does the mending and the grumbling, and I do the polishing and the selling, mostly." },
        { id = "hello_2", when = { metBefore = true }, text = "Timothy Weldon, still polishing. Mr. Ellingson says there's no call to shine armour in a sewer, but I think a deathguard ought to look like somebody, going out." },
      },
      again = {
        { id = "hello_a1", text = "Anything else I can show you?" },
        { id = "hello_a2", text = "Please, ask. I like the talking part." },
        { id = "hello_a3", text = "Yes? I'm listening." },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "You keep it all very bright.", next = "polish" },
        { text = "What's Walter Ellingson like to work under?", next = "walter" },
        { text = "You've never worn this in battle yourself.", next = "fight" },
        { text = "I'll tell you how I got that dent.", next = "dent", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Our smiths would laugh at your stand.", next = "orcplate", when = { race = "Orc" } },
        { text = "Keep polishing, Timothy.", next = "END" },
      },
    },
    polish = {
      lines = { { id = "polish_1", text = "I do it every morning, the whole rack. It doesn't rust any slower for it, I know that. But I've seen the deathguards catch sight of themselves in a breastplate and stand a little straighter, and I think that's worth an hour with a rag." } },
      choices = {
        { text = "Pride is half of courage.", next = "polish2" },
        { text = "Shine doesn't stop an axe.", next = "polish2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    polish2 = {
      lines = { { id = "polish2_1", text = "That's what I think, the first one, I mean. Mr. Ellingson says the second, and he's right too, I suppose. Only, when you've already died once, you need a reason to walk out and risk it again, and looking like a soldier is a reason." } },
      choices = {
        { text = "Then you're arming more than their bodies.", next = "BACK", reply = "I hadn't put it that way. I'll remember that.", fx = { affinity = 1 } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    walter = {
      lines = { { id = "walter_1", text = "He was armourer to the royal guard, in the capital, for thirty years. He can hear a cracked rivet when a man walks past. He's never once told me I've done something well, but he's stopped redoing my straps behind my back, so I think I'm coming on." } },
      choices = {
        { text = "That's praise, from a master.", next = "BACK", reply = "I hope so! I check the straps every evening, to see if he has." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    fight = {
      big = true,
      lines = { { id = "fight_1", key = true, text = "No. I'd just been sworn to the Brill militia when the sickness came, and I never drew my sword. Now I hand armour to people going to the Bulwark, and I stay here with a rag. Sometimes I think I ought to put a suit on and go. Should I?" } },
      choices = {
        { text = "Yes. A man should test himself once.", next = "BACK", reply = "I think so too. I've a suit set by, in my size. I just haven't told Mr. Ellingson.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "No. Your post is here, and it matters.", next = "BACK", reply = "That's what he says. It's easier to hear from a stranger, somehow.", fx = { align = { order = 1 } } },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    dent = {
      lines = { { id = "dent_1", text = "Would you? Oh, wait, let me put the rag down. Right. Was it a big one? Was it Scourge? I'm sorry, go on, I won't interrupt." } },
      choices = {
        { text = "Something large hit me, and I stayed standing.", next = "dent2" },
        { text = "I was slow, and the armour wasn't.", next = "dent2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dent2 = {
      lines = { { id = "dent2_1", text = "And it held! That's the whole thing, isn't it. Some smith you never met made that plate properly, years ago, and so you're here talking to me. I think about that when I'm selling. Somebody's going to be standing up, later, because of this stall." } },
      choices = {
        { text = "They will. Sell it well.", next = "BACK", reply = "I shall. Thank you for telling me." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    orcplate = {
      lines = { { id = "orcplate_1", text = "Mr. Ellingson says it's built for people who mean to be hit a great deal and enjoy it. I only think it looks grand. Is it true your smiths leave the hammer marks in on purpose?" } },
      choices = {
        { text = "Aye. The marks show honest work.", next = "BACK", reply = "I knew it! I'm going to tell him, and he's going to say \"hmph.\"" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "I was seventeen. I'll be seventeen a good while yet, and I'd like to have something to show for it." } },
    advice = { { id = "tp_advice", text = "Check the straps, please. It's nearly always a strap that goes, hardly ever the plate." } },
    lordaeron = { { id = "tp_lordaeron", text = "I only ever saw the capital once, on a feast day. The guard were all in gilded plate. Mr. Ellingson made some of that." } },
    scourge = { { id = "tp_scourge", text = "I've never seen one close. The deathguards say you smell them first." } },
    sylvanas = { { id = "tp_sylvanas", text = "I saw her ride out once. She wasn't wearing plate at all, and nobody looked more like a soldier." } },
    _none = { { id = "tp_none", text = "I don't know, I'm sorry. Mr. Ellingson might, if he's in a good mood." } },
  },
}

---------------------------------------------------------------------------
-- Walter Ellingson: the elder heavy armour merchant; once armourer to Lordaeron's royal guard.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_ellingson", id = TODO_NPC("Walter Ellingson"), name = "Walter Ellingson", title = "Heavy Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "grumbling", "masterly" }, values = { "craft", "loyalty" },
  notices = { "class", "race" },
  impression = {
    first = "Walter Ellingson sells and mends heavy armour in the Trade Quarter, and he was armourer to the royal guard of Lordaeron before the plague. He grumbles about everything made since and can hear a loose rivet across the hall.",
    third = "{name} met Walter Ellingson, a heavy armour merchant in the Undercity and once armourer to Lordaeron's royal guard.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! You're one of the few who pays fair and talks civil, and I don't forget it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The prices are what they are, and I'm not in a haggling mood." },
    { id = "g_1", text = "Hmph. Come in, then, and stop clanking, because your left greave's loose and it's setting my teeth on edge." },
    { id = "g_2", when = { class = { "WARRIOR", "PALADIN" } }, text = "Plate. Good. Walk past me, slowly. There, the third rivet on the backplate's cracked, and I'd wager you never knew." },
    { id = "g_3", when = { metBefore = true }, text = "You again. Still wearing it, I see, so it can't have been as bad as I said." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Somebody's beaten that breastplate back into shape with a rock. I can see the rock. It was granite." },
    { id = "n_2", cat = "race", when = { race = "Orc" },
      text = "Orc plate. Thick as a door and half as subtle. I'll admit I've never seen one of your breastplates split, and I've looked." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Walter Ellingson. I was armourer to the king's own guard for thirty years, and now I sell mail to whoever walks in off the zeppelin. The boy Weldon does the smiling. If you want it mended properly, you want me." },
        { id = "hello_2", when = { metBefore = true }, text = "Ellingson. I've a hauberk half riveted and a boy who polishes when he should be learning, so say your piece." },
      },
      again = {
        { id = "hello_a1", text = "Hmph. What else?" },
        { id = "hello_a2", text = "Go on, I can rivet and listen." },
        { id = "hello_a3", text = "Well?" },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your armour.", next = "BUSINESS" },
        { text = "You armoured the royal guard?", next = "guard" },
        { text = "You're hard on young Weldon.", next = "boy" },
        { text = "Is today's armour worse than the old?", next = "work" },
        { text = "It was granite. How did you know?", next = "rock", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "I'll go and tighten my greave.", next = "END" },
      },
    },
    guard = {
      lines = { { id = "guard_1", text = "Two hundred suits, gilded for the feast days and plain steel under. Every one fitted to its man, and I knew each man's bad knee and short arm. They stood the palace steps in my work the day the prince came home, and it did none of them any good." } },
      choices = {
        { text = "What happened to them?", next = "guard2" },
        { text = "No armour could have stopped that day.", next = "guard2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guard2 = {
      big = true,
      lines = { { id = "guard2_1", text = "They died where they stood, to a man, and some of them stand there yet in the ruin, on the other side. I've seen my own rivets on a Scourge thing in the courtyard. I made that harness to protect a friend. Tell me what I'm to think of it now." } },
      choices = {
        { text = "That your work was sound. The betrayal wasn't yours.", next = "BACK", reply = "Hmph. That's what the Weldon boy says. I didn't expect to hear it twice.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "That steel serves whoever wears it.", next = "BACK", reply = "Aye. It's the truth, and I've never liked it.", fx = { align = { light = -1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    boy = {
      lines = { { id = "boy_1", text = "Somebody has to be. He's good hands and a soft head, and he's forever asking the customers about their battles. He wants to go to the Bulwark, the young fool. I've seen what comes back from the Bulwark, and I've mended what it was wearing." } },
      choices = {
        { text = "He has a suit set by in his own size.", next = "boy2", when = { heardLine = "uc_weldon.fight_1" } },
        { text = "You're fond of him.", next = "boy2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    boy2 = {
      lines = { { id = "boy2_1", text = "Hmph. I know about the suit, I've known a month. I've been through it at night and redone every strap, and put a second layer in the gorget. If the young idiot's going to go, he'll go in something I trust. Don't you tell him." } },
      choices = {
        { text = "I'll say nothing.", next = "BACK", reply = "See that you don't. He'd only thank me, and I couldn't bear it." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "work_1", text = "It's thinner, and it's quicker made, and it'll do. James Van Brunt's forge turns out honest plate, I'll say that. But nobody fits it to the man any more. They sell it by small, middling and large, like hats." } },
      choices = {
        { text = "What would you make, given the time?", next = "work2" },
        { text = "War doesn't leave time for fitting.", next = "BACK", reply = "No. It never did, and I fitted them anyway." },
        { text = "Something else.", next = "BACK" },
      },
    },
    work2 = {
      lines = { { id = "work2_1", text = "One suit, done right, for one deathguard, the way I did for the guard. Measured standing and kneeling, the plates lapped so that nothing catches. I've the steel set by for it. I've not yet met the soldier I'd spend it on, and I'm in no hurry to choose." } },
      choices = {
        { text = "The right one will walk in.", next = "BACK", reply = "Hmph. They'd best walk in quietly. I'll hear it if they don't." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    rock = {
      lines = { { id = "rock_1", text = "Granite leaves a wide flat dimple with grit in it. Sandstone crumbles and leaves scratches. River stone leaves it smooth. Thirty years, I've seen every roadside repair there is, and yours isn't the worst. Hand it here, and I'll put it right." } },
      choices = {
        { text = "I'd be grateful, master armourer.", next = "BACK", reply = "Hmph. Nobody's called me that since the palace. Give it here." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "I don't feel my knees any more. Thirty years at a low bench, and that's the only good that's come of dying." } },
    advice = { { id = "tp_advice", text = "Fit the armour to yourself, and never yourself to the armour. If it pinches, it's wrong." } },
    lordaeron = { { id = "tp_lordaeron", text = "I'll not talk about the capital. You're standing under it, and that's close enough." } },
    arthas = { { id = "tp_arthas", text = "I made his first training cuirass, when he was a boy of nine. That's all I have to say on him." } },
    sylvanas = { { id = "tp_sylvanas", text = "She kept what was left of us from being his. That buys a great deal of loyalty from an old man." } },
    _none = { { id = "tp_none", text = "Hmph. Not my trade. Ask the boy, he likes to guess." } },
  },
}

---------------------------------------------------------------------------
-- Ronald Burch: sells flour, spice and salt in the Trade Quarter; kin to Eunice Burch and thoroughly managed by her.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_rburch", id = TODO_NPC("Ronald Burch"), name = "Ronald Burch", title = "Cooking Supplier",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "mild", "dry" }, values = { "family", "thrift" },
  notices = { "profession", "race" },
  impression = {
    first = "Ronald Burch sells cooking supplies in the Trade Quarter, a few steps from his kinswoman Eunice, who teaches the cooking. He is mild and dry and has clearly been told how to arrange his stall, more than once.",
    third = "{name} met Ronald Burch, the cooking supplier of the Undercity's Trade Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! You're one of the few who pays fair and talks civil, and I don't forget it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy what you need and be on your way, if you please." },
    { id = "g_1", text = "Good day. If Eunice sent you, the answer is that the flour came in this morning and yes, I did sift it." },
    { id = "g_2", when = { profession = "Cooking" }, text = "A cook. You'll want salt, and spice, and somebody to complain to about the price of both, and I'm the man for all three." },
    { id = "g_3", when = { metBefore = true }, text = "Back again. You must be cooking for a crowd, or burning a great deal." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Cooking" },
      text = "You've a burn on the heel of your hand, from a pan handle. Wrap the handle in a cloth. Eunice told me that forty years ago and I've not burned myself since." },
    { id = "n_2", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "A living customer. Then you can tell me whether this pepper's still any good, because I've no way of knowing and Eunice says it's gone flat." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Ronald Burch. I sell flour, salt, spice and what sweetening I can get. Eunice Burch teaches the cooking just along there, and she's my sister, which is why my stall's arranged as it is and I'm not permitted to move the nutmeg." },
        { id = "hello_2", when = { profession = "Cooking" }, text = "Ronald Burch. Eunice will have told you to buy your spices from me, and to check the weight. Both are good advice, though she needn't say the second quite so loudly." },
      },
      again = {
        { id = "hello_a1", text = "Anything else? I've only the sacks to mind." },
        { id = "hello_a2", text = "Go on. It's a slow day for salt." },
        { id = "hello_a3", text = "Yes?" },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Your sister keeps you in order.", next = "eunice" },
        { text = "Where does spice come from, down here?", next = "spice" },
        { text = "Why do the dead buy seasoning?", next = "dead" },
        { text = "Let me taste that pepper for you.", next = "pepper", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Mind the nutmeg, Ronald.", next = "END" },
      },
    },
    eunice = {
      lines = { { id = "eunice_1", text = "She does, and has done since I was four and she was nine. She ran our mother's kitchen, then her own cookshop, and now half the Trade Quarter. Dying slowed her down for about a week." } },
      choices = {
        { text = "Does it wear on you?", next = "eunice2" },
        { text = "She told me she wrote down your mother's recipes.", next = "eunice2", when = { heardLine = "uc_eburch.t2_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eunice2 = {
      lines = { { id = "eunice2_1", text = "I'll tell you a thing I'd not tell her. When I woke in the dark with no name for where I was, the first voice I knew was Eunice, somewhere along the tunnel, telling a deathguard he was holding the lantern wrong. I've not minded being ordered about since." } },
      choices = {
        { text = "She's your lantern, then.", next = "BACK", reply = "She'd say she's my keeper. But yes.", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "You could stand up to her once.", next = "BACK", reply = "I could. I'd rather have my nutmeg where she can find it." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    spice = {
      lines = { { id = "spice_1", text = "By zeppelin from Orgrimmar, where the goblins bring it up from the south. Pepper, cinnamon, a hot red powder the trolls like. It costs four times what it did in Lordaeron, and I pay it, because Eunice would know by the smell if I bought cheap." } },
      choices = {
        { text = "And the flour and salt?", next = "spice2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    spice2 = {
      lines = { { id = "spice2_1", text = "Flour from Tarren Mill's stones, when the road's open, and salt from pans on the Tirisfal coast. The salt's my best seller by a distance. Half of it never sees a kitchen, I'm told, and goes to the apothecaries for keeping things." } },
      choices = {
        { text = "I won't ask what things.", next = "BACK", reply = "Nor do I. I weigh it and I wish them good day." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    dead = {
      big = true,
      lines = { { id = "dead_1", text = "Habit, and Eunice. She's taught half this city to cook by eye for the living Horde. The other half buy a twist of cinnamon just to open it and remember a kitchen, since the smell's the last of our senses to go. Is that a foolish thing to spend coin on?" } },
      choices = {
        { text = "No. A memory is worth a few coppers.", next = "BACK", reply = "I think so. I sell a good many memories, by the ounce.", fx = { align = { light = 1 } } },
        { text = "Yes. The dead should let the past lie.", next = "BACK", reply = "Perhaps. But they keep buying, and I'll not be the one to refuse them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pepper = {
      lines = { { id = "pepper_1", text = "Would you? Here, a pinch on the back of your hand. Eunice says it's gone flat and I say it's only mild, and we've not spoken properly since Tuesday." } },
      choices = {
        { text = "It's gone flat. She's right.", next = "pepper2" },
        { text = "It's mild, but it's sound.", next = "pepper2" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    pepper2 = {
      lines = { { id = "pepper2_1", text = "Hm. Well, I'll take your word, since you've a tongue and I've only an opinion. I shall tell her a stranger settled it, and I shan't tell her which way until she asks nicely." } },
      choices = {
        { text = "You enjoy this more than you admit.", next = "BACK", reply = "Forty years of practice. It'd be a waste to stop now." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We don't eat, mostly. I sell to the ones who cook for others, and the ones who can't quite give it up." } },
    advice = { { id = "tp_advice", text = "Salt early and taste late. Or have someone taste for you, in my case." } },
    lordaeron = { { id = "tp_lordaeron", text = "Eunice's cookshop was two streets from the palace gate, and I had the grocer's next door. I miss the smell of that street." } },
    sylvanas = { { id = "tp_sylvanas", text = "Eunice says she'd cook for the Dark Lady. I'd supply the salt and stand well back." } },
    thrall = { { id = "tp_thrall", text = "The orcs he sends buy the red powder by the pound, and pay fairly. I've no complaints of the Warchief." } },
    _none = { { id = "tp_none", text = "I couldn't say. Ask Eunice. She'll know, or she'll tell you regardless." } },
  },
}

---------------------------------------------------------------------------
-- Felicia Doan: sells general trade goods in the Trade Quarter; knows what every craft in the city is short of.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_doan", id = TODO_NPC("Felicia Doan"), name = "Felicia Doan", title = "Trade Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "efficient", "curious" }, values = { "order", "knowledge" },
  notices = { "profession", "race" },
  impression = {
    first = "Felicia Doan sells trade goods in the Trade Quarter, the thread and flux and vials that every craft runs out of. She can tell what the whole city is making from what leaves her crates, and she finds that more interesting than the selling.",
    third = "{name} met Felicia Doan, a trade goods vendor in the Undercity's Trade Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. For a regular like you, I'll find the better stock from the back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy what you need and be on your way, if you please." },
    { id = "g_1", text = "Good day. Tell me your craft and I'll tell you what you've run out of." },
    { id = "g_2", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing" } }, text = "I know that look. You're halfway through a piece and short of one small thing, and it's on my second shelf." },
    { id = "g_3", when = { metBefore = true }, text = "Back again. Let me guess what for, and don't tell me if I'm wrong." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Engineering" },
      text = "An engineer. You'll want flux and you'll say you don't. Take it. The Van Talens are always out, and you'll be glad of it on the day." },
    { id = "n_2", cat = "race", when = { race = "Troll" },
      text = "A troll. Your people buy more dye than anyone, and always the brightest. I've started ordering extra red on your account." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Felicia Doan. I sell the small necessary things, thread, flux, vials, salt, dye, whatever a craftsman forgets until the moment it's wanted. Every trade in this city comes to my crates sooner or later." },
        { id = "hello_2", when = { metBefore = true }, text = "Felicia Doan. I've restocked since you came, and the weak flux went in an afternoon, which tells me the smiths have a large order." },
      },
      again = {
        { id = "hello_a1", text = "What else are you short of?" },
        { id = "hello_a2", text = "Go on, I'm only counting." },
        { id = "hello_a3", text = "Yes?" },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "You read the city from your sales?", next = "read" },
        { text = "Where do your goods come from?", next = "crates" },
        { text = "There's another trade supplier in this quarter.", next = "bartlett" },
        { text = "Bright colours keep the spirits friendly.", next = "dye", when = { race = "Troll" } },
        { text = "I have what I need. Farewell.", next = "END" },
      },
    },
    read = {
      lines = { { id = "read_1", text = "I can't help it. When the tailors buy black thread, there's been a loss at the Bulwark and the shrouds are being cut. When the smiths buy flux, someone's ordered arms. And when the apothecaries clear me out of vials, I simply stay in for a few days." } },
      choices = {
        { text = "What is the city making now?", next = "read2" },
        { text = "You'd make a fine spy.", next = "read2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    read2 = {
      lines = { { id = "read2_1", text = "This week, a great many crates of vials, and coarse thread, and salt. That's something being bottled, something being bagged, and something being preserved. I don't know more than that, and I've decided I'm happier not adding it up." } },
      choices = {
        { text = "You could tell the Deathstalkers what you see.", next = "read3" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    read3 = {
      big = true,
      lines = { { id = "read3_1", text = "They've asked. A polite man in soft boots wanted a weekly list of who buys what. I told him I'd think about it. My customers trust me with their shortages, which is a small trust, but it's mine. What would you have told him?" } },
      choices = {
        { text = "Yes. The Dark Lady's safety comes first.", next = "BACK", reply = "That's the sensible answer, and I expect I'll give it in the end.", fx = { align = { order = 1 } } },
        { text = "No. A shopkeeper keeps her customers' secrets.", next = "BACK", reply = "That's the answer I'd like to give. He's coming back on Friday.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    crates = {
      lines = { { id = "crates_1", text = "The zeppelin, mostly, and a goblin in Orgrimmar who's never once sent the right count. Thread from Tarren Mill. The flux I buy from Samuel Van Brunt and sell a little dearer to people who can't be troubled to walk to the War Quarter." } },
      choices = {
        { text = "What goes wrong with the goblin's count?", next = "crates2" },
        { text = "You sell them the walk.", next = "BACK", reply = "Exactly. Laziness is the most reliable trade good there is." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    crates2 = {
      lines = { { id = "crates2_1", text = "Everything, and always in his favour. Forty spools become thirty-eight, a gross of vials becomes eleven dozen. I write and complain, and he sends a letter full of regret and a bill for the letter. I've begun ordering a tenth more than I need, and it comes out exactly right." } },
      choices = {
        { text = "You've priced in the goblin.", next = "BACK", reply = "One must. It's cheaper than arguing with one." },
        { text = "Something else.", next = "BACK" },
      },
    },
    bartlett = {
      lines = { { id = "bartlett_1", key = true, text = "Daniel Bartlett, yes, across the ring. We sell much the same. He's a gloomy soul and he's certain every crate will be the last. I buy from him when I'm short and he buys from me, and each of us is sure the other overcharges." } },
      choices = {
        { text = "Do you?", next = "BACK", reply = "Of course. So does he. It comes out even." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    dye = {
      lines = { { id = "dye_1", text = "Is that why? I'd wondered. I thought it was only taste. Then I'll order the red and the yellow both, and you can tell your people the Undercity's doing its part to keep the spirits in good humour." } },
      choices = {
        { text = "Dey'll be pleased to hear it.", next = "BACK", reply = "Good. It's the first I've been told my stock mattered to anybody dead longer than I have." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We're a busy people. I've the sales to prove it." } },
    advice = { { id = "tp_advice", text = "Buy the small things before you start the work. You'll never find them at midnight with glue on your hands." } },
    lordaeron = { { id = "tp_lordaeron", text = "I was a chandler's clerk. Lists and crates. I've changed less than most." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Royal Quarter orders very little from me. Whatever she needs, she already has." } },
    plague = { { id = "tp_plague", text = "I sell vials. What goes into them is nothing I'm told, and nothing I ask." } },
    _none = { { id = "tp_none", text = "That's not on my shelves, and I don't deal in what I can't count." } },
  },
}

---------------------------------------------------------------------------
-- Eleanor Rusk: general goods and drink in the Trade Quarter; sees to travellers and newly risen alike.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_rusk", id = TODO_NPC("Eleanor Rusk"), name = "Eleanor Rusk", title = "General Goods",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "motherly", "gossipy" }, values = { "community", "comfort" },
  notices = { "race", "purse" },
  impression = {
    first = "Eleanor Rusk sells general goods and drink in the Trade Quarter and fusses over travellers as though they had all forgotten their scarves. She has a soft spot for the newly risen, who come to her before they know what they need.",
    third = "{name} met Eleanor Rusk, the general goods vendor of the Undercity's Trade Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you, friend. I've been keeping an eye out for things you might want." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
    { id = "g_1", text = "Come in, pet, and let me look at you. You've not been eating, or whatever it is you do instead." },
    { id = "g_2", when = { race = { "Orc", "Troll", "Tauren" } }, text = "A living one, bless you, and you'll be parched after that lift. I've water that came down from Brill this morning and never went near the canal." },
    { id = "g_3", when = { metBefore = true }, text = "There you are again. I was only saying I hadn't seen you, though I forget to whom." },
  },

  notice = {
    { id = "n_1", cat = "purse", when = { money = { max = 3000 } },
      text = "You're down to your last coppers, pet, I can tell by how you look at the prices. Buy the bread and leave the rest. It keeps a week." },
    { id = "n_2", cat = "race", when = { race = "Scourge" },
      text = "You've the look of someone not long up. It gets easier. Buy a candle, even if you don't need the light. It helps to have something of your own." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Eleanor Rusk. I sell the ordinary things, bread and water and candles and a bit of rope, to folk coming and going. It isn't grand, but nobody's ever left this city on an adventure without stopping at my counter first." },
        { id = "hello_2", when = { metBefore = true }, text = "Eleanor Rusk, pet, same as ever. I've fresh bread from Innkeeper Norman's oven and a new lot of candles, and you look as though you need both." },
      },
      again = {
        { id = "hello_a1", text = "Anything else, pet?" },
        { id = "hello_a2", text = "Go on, I love a chat." },
        { id = "hello_a3", text = "Yes, dear?" },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "You look after the newly risen.", next = "risen" },
        { text = "You must see everyone who passes through.", next = "travellers" },
        { text = "Why do the dead buy drink?", next = "drink" },
        { text = "A candle did help, when I first woke.", next = "candle", when = { race = "Scourge" } },
        { text = "Take care, Eleanor.", next = "END" },
      },
    },
    risen = {
      lines = { { id = "risen_1", text = "Somebody must. They come down the lift from Deathknell with grave dirt still on them and no notion what they want. I sit them on that crate and give them a candle and tell them where the bank is. It's not much, but it's a start." } },
      choices = {
        { text = "What do they ask you?", next = "risen2" },
        { text = "That's kinder than this city's known for.", next = "risen2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    risen2 = {
      lines = { { id = "risen2_1", text = "Whether it hurts. Whether their family's alive. Whether they'll be like this for good. I say no, I don't know, and yes, in that order. I don't soften the last one. It's kinder to know it at my counter than to work it out alone." } },
      choices = {
        { text = "Do they thank you for the truth?", next = "risen3" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    risen3 = {
      big = true,
      lines = { { id = "risen3_1", text = "Some do, later. One girl screamed at me and threw the candle. She came back in a month and bought a dozen, and never mentioned it. The apothecaries say I coddle them, and that the Forsaken should harden at once. What do you think?" } },
      choices = {
        { text = "Go on coddling. They've had cruelty enough.", next = "BACK", reply = "Then I shall, pet, and the apothecaries can lump it.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "The apothecaries are right. This world is hard.", next = "BACK", reply = "It is. I only think a crate and a candle first does no harm.", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    travellers = {
      lines = { { id = "travellers_1", text = "Every one. Orcs off the zeppelin wanting waterskins, deathguards bound for the Bulwark wanting rope, and adventurers wanting everything at once. I can tell where they're going by what they buy, and I always say \"come back and tell me about it.\" A few do." } },
      choices = {
        { text = "Who was the last to come back and tell you?", next = "travellers2" },
        { text = "I'll come back and tell you.", next = "BACK", reply = "See that you do, pet. I'll keep the crate free." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    travellers2 = {
      lines = { { id = "travellers2_1", text = "A troll lad, a fortnight since, back from Hillsbrad with his arm in a sling and a story about a yeti that got longer every time he told it. He sat on that crate an hour. Jonathan Chambers came over from his bag stall to listen, and Jonathan never leaves his bags." } },
      choices = {
        { text = "A good story is worth an hour.", next = "BACK", reply = "It's worth more than the rope I sold him, and I told him so." },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink = {
      lines = { { id = "drink_1", text = "For the weight of a cup in the hand, mostly, and to sit with a friend across it. Innkeeper Norman pours the proper stuff. I sell a rough ale and Tirisfal's own moonshine, and half my customers never finish the bottle, they only like to have opened one." } },
      choices = {
        { text = "A habit can be a comfort.", next = "BACK", reply = "That's all I sell, when you come down to it. Habits, by the loaf." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    candle = {
      lines = { { id = "candle_1", text = "Did it? Oh, I am glad. Who gave it you? No, never mind, it doesn't matter who. You see, that's all I mean by it. One small thing that's yours, in a place where nothing else is." } },
      choices = {
        { text = "I still have the stub of it.", next = "BACK", reply = "Bless you. Keep it. I've the first one I ever sold, too, never lit." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "Poor loves, the lot of us. We'll manage. People do." } },
    advice = { { id = "tp_advice", text = "Carry more water than you think, and a spare candle. I've never heard anyone complain of having too many of either." } },
    lordaeron = { { id = "tp_lordaeron", text = "I kept a little shop on the Brill road. Same goods, same talk. The customers were pinker." } },
    sylvanas = { { id = "tp_sylvanas", text = "She took us in when no one else would have had us. I'll not hear her spoken ill of at my counter." } },
    scourge = { { id = "tp_scourge", text = "Don't, pet. I've a niece among them, somewhere. I'd rather talk about bread." } },
    _none = { { id = "tp_none", text = "I don't know, pet. Sit down a minute and tell me why you're asking." } },
  },
}

---------------------------------------------------------------------------
-- Thomas Mordan: Trade Quarter reagent vendor; handles everything with tongs.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_mordan", id = TODO_NPC("Thomas Mordan"), name = "Thomas Mordan", title = "Reagents",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "laconic", "superstitious" }, values = { "caution", "knowledge" },
  notices = { "class", "race" },
  impression = {
    first = "Thomas Mordan sells reagents in the Trade Quarter and handles most of them with a pair of tongs. He says little, watches what each caster buys, and seems to have firm private views on which spells ought to be left alone.",
    third = "{name} met Thomas Mordan, the reagent vendor of the Undercity's Trade Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. For a regular like you, I'll find the better stock from the back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Look, don't touch, and pay before you go. I've learned that much about you." },
    { id = "g_1", text = "Afternoon. Tell me what you cast and I'll tell you what you need, and I'd ask you not to open anything at the counter." },
    { id = "g_2", when = { class = { "MAGE", "WARLOCK", "PRIEST", "SHAMAN", "DRUID" } }, text = "A caster. I'd know it by the smell of your pouch, which is rune dust and something singed." },
    { id = "g_3", when = { metBefore = true }, text = "You again. Still in one piece, I notice, so you measured properly." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "WARLOCK" },
      text = "Soul shards, in the left bag. I can hear them. I don't sell those and I don't touch them, and I'll thank you to keep them off the counter." },
    { id = "n_2", cat = "class", when = { class = "SHAMAN" },
      text = "Ankhs, you'll be wanting. I sell more of them to your kind each month, and I've never asked what it's like to use one." },
    { id = "n_3", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your druids buy seeds and maple and thank me for them. It's the only time anyone thanks me for a reagent." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Thomas Mordan. I sell reagents. Powders, runes, candles, feathers, a few things in jars. Hannah Akeley has the Magic Quarter's trade and I have the travellers', and I've never had a complaint that lived to be made." },
        { id = "hello_2", when = { metBefore = true }, text = "Mordan. The stock's the same, and the tongs are the same. What do you need?" },
      },
      again = {
        { id = "hello_a1", text = "Something else?" },
        { id = "hello_a2", text = "Go on." },
        { id = "hello_a3", text = "Well?" },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your reagents.", next = "BUSINESS" },
        { text = "Why the tongs?", next = "tongs" },
        { text = "Who buys the most from you?", next = "buyers" },
        { text = "What's in the jars?", next = "jars" },
        { text = "I can tell you what the ankh is like.", next = "ankh", when = { class = "SHAMAN" } },
        { text = "I'll not open anything. Farewell.", next = "END" },
      },
    },
    tongs = {
      lines = { { id = "tongs_1", text = "Because I've seen what handles them bare. A reagent's a thing that wants to become something else, and it's not particular about whose hand it starts with. My predecessor at this stall used his fingers. He's the stain on the third flagstone." } },
      choices = {
        { text = "You're joking.", next = "tongs2" },
        { text = "That's a sensible habit, then.", next = "tongs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tongs2 = {
      lines = { { id = "tongs2_1", text = "I don't joke about stock. He was grinding arcane powder with a damp thumb. I was his boy, and I was standing where you are. I swept up, and I bought tongs with my first wages, and here I still am." } },
      choices = {
        { text = "Caution has kept you whole.", next = "BACK", reply = "Whole's a strong word, in this city. It's kept me in one heap.", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "You can't live your whole life afraid of powder.", next = "BACK", reply = "I've managed two lives at it so far." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "buyers_1", text = "Mages, for the portals. They burn a rune every time they can't be troubled to walk. After them the priests, for candles. Warlocks buy least, since their craft runs on things I don't stock and wouldn't." } },
      choices = {
        { text = "You disapprove of the warlocks.", next = "buyers2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    buyers2 = {
      big = true,
      lines = { { id = "buyers2_1", text = "I disapprove of anything that pays in souls. A rune's a rune. You buy it, you burn it, it's gone, and nobody was in it. That other trade is another kind of bookkeeping, and the debts come due. That's only my view. You'll have your own." } },
      choices = {
        { text = "You're right. Some powers cost too much.", next = "BACK", reply = "That's the whole of what I know, and it took a flagstone to teach me.", fx = { align = { light = 1 } } },
        { text = "Power is power. The squeamish stay weak.", next = "BACK", reply = "Could be. The squeamish also stay off the floor.", fx = { align = { light = -1 } } },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    jars = {
      lines = { { id = "jars_1", text = "Nothing alive, whatever you've heard. Fish oil. Ash from a lightning-struck oak. Grave dust, which I'll admit is easy to come by here. And one jar I was sold as dragon's breath, which I've never opened and never shall." } },
      choices = {
        { text = "Why keep it, if you'll never open it?", next = "jars2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jars2 = {
      lines = { { id = "jars2_1", text = "Because if it's truly what he said, opening it is the last thing I do. If it's not, I paid forty silver for air. As long as the lid's on, I've neither been robbed nor burned, and I find I can live with not knowing." } },
      choices = {
        { text = "That's one way to be at peace.", next = "BACK", reply = "It's the only one I've found that works." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    ankh = {
      lines = { { id = "ankh_1", text = "Go on, then. I've wondered for a year." } },
      choices = {
        { text = "Like waking from a fall you thought had killed you.", next = "ankh2" },
        { text = "Like being called back by name.", next = "ankh2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    ankh2 = {
      lines = { { id = "ankh2_1", text = "Hm. I've had something like that, once, in a churchyard, with nobody asking my leave. I'm glad yours comes with a choice in it. That'll be why your sort thank the spirits, and mine doesn't thank anyone." } },
      choices = {
        { text = "The spirits ask before they give.", next = "BACK", reply = "Then you've better suppliers than I ever had." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We were all somebody's reagent, once. I try not to hold it against the trade." } },
    advice = { { id = "tp_advice", text = "Measure with a spoon and never with your fingers, and keep your powders dry. I'll say it till I'm dust." } },
    lordaeron = { { id = "tp_lordaeron", text = "I was a shop boy on the chandlers' row. I remember the sweeping better than the city." } },
    dalaran = { { id = "tp_dalaran", text = "They wrote the book on reagents. I've a copy with half the warnings underlined, and I underlined the other half." } },
    sylvanas = { { id = "tp_sylvanas", text = "She needs no reagents that I know of. That sort of power worries me more than the sort I sell." } },
    _none = { { id = "tp_none", text = "Don't know. Don't much want to, if it's the kind of thing I think it is." } },
  },
}

---------------------------------------------------------------------------
-- Daniel Bartlett: the gloomy trade supplier of the Trade Quarter; certain every shipment will be the last.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_dbartlett", id = TODO_NPC("Daniel Bartlett"), name = "Daniel Bartlett", title = "Trade Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "gloomy", "dependable" }, values = { "thrift", "endurance" },
  notices = { "profession", "purse" },
  impression = {
    first = "Daniel Bartlett sells trade supplies in the Trade Quarter and expects the worst of every shipment, road and customer. Nothing he predicts ever quite happens, and his shelves are the best stocked in the ring because of it.",
    third = "{name} met Daniel Bartlett, a trade supplies vendor in the Undercity's Trade Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my favourite customer. Come and look; I'll knock a little off for you, quietly." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy what you need and be on your way, if you please." },
    { id = "g_1", text = "Buy it now if you want it, because I doubt there'll be another crate before winter." },
    { id = "g_2", when = { profession = { "Mining", "Blacksmithing", "Engineering" } }, text = "You'll be wanting coal, or flux. I've both, for the moment. I'd not count on next week." },
    { id = "g_3", when = { metBefore = true }, text = "You're back. I'm surprised, with the roads as they are." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Tailoring" },
      text = "A tailor. Thread's dear and it'll be dearer. I've forty spools left and no promise of forty more." },
    { id = "n_2", cat = "purse", when = { money = { min = 500000 } },
      text = "You've coin. Spend it on stock while there's stock to be had. Coin's no use to anyone once the zeppelins stop." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Daniel Bartlett. I sell trade supplies, thread and flux and coal and vials. I keep three months' stock behind the stall, because the zeppelin's bound to fail, or the road to Tarren Mill will close, or both." },
        { id = "hello_2", when = { metBefore = true }, text = "Bartlett. Still open, as you see. I didn't expect to be, after that storm at the tower, but the crate came through." },
      },
      again = {
        { id = "hello_a1", text = "Something else? Best be quick, in case." },
        { id = "hello_a2", text = "Go on. Nothing's gone wrong yet today." },
        { id = "hello_a3", text = "Yes?" },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what's left.", next = "BUSINESS" },
        { text = "You expect the worst of everything.", next = "worst" },
        { text = "Three months of stock is a great deal.", next = "stock" },
        { text = "Felicia Doan says you both overcharge.", next = "doan", when = { heardLine = "uc_doan.bartlett_1" } },
        { text = "What's the news of the roads?", next = "roads" },
        { text = "I'll buy before the sky falls.", next = "END" },
      },
    },
    worst = {
      lines = { { id = "worst_1", text = "I've grounds. I expected a good harvest the year of the plague, and I'd laid in nothing. I watched my neighbours starve behind their doors with coin in their fists. Since then I expect the worst, and I'm stocked for it, and I've not been caught out again." } },
      choices = {
        { text = "Does it never turn out better than you feared?", next = "worst2" },
        { text = "That's a hard way to have learned it.", next = "worst2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst2 = {
      big = true,
      lines = { { id = "worst2_1", text = "Every time, so far. The zeppelin always comes. The road always opens. Felicia says that proves I'm wrong. I say it only proves it hasn't happened yet. Which of us would you sooner be standing beside when it does?" } },
      choices = {
        { text = "You. Readiness is never wasted.", next = "BACK", reply = "Thank you. You're the first to say so, and I expect you'll be the last.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Her. Dread is no way to spend eternity.", next = "BACK", reply = "Perhaps not. But I've eternity's worth of thread, and she hasn't.", fx = { align = { order = -1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    stock = {
      lines = { { id = "stock_1", text = "It's the least I'm easy with. Coal stacked to the roof, flux in sealed tins, vials packed in straw. When the Trade Quarter ran short of thread last winter, I was the only stall selling. I sold at the usual price, too. I'm gloomy, but I'm no vulture." } },
      choices = {
        { text = "Where do you keep it all?", next = "stock2" },
        { text = "That was decently done.", next = "BACK", reply = "It was only sense. A town remembers who gouged it." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    stock2 = {
      lines = { { id = "stock2_1", text = "In an old cistern behind the bank, dry as a bone since the pumps were mended. William Montague lets me have it for a small rent and looks in once a month to count the coal, since he can't see a full room without wanting to tally it. I don't mind. Two counts are safer than one." } },
      choices = {
        { text = "You and the bankers think alike.", next = "BACK", reply = "We do. They're the only cheerful company I can stand." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    doan = {
      lines = { { id = "doan_1", text = "She would. She buys my flux at a fair price and marks it up a copper for the walk. I mark up her dye a copper for the same. We've been robbing each other evenly for a year, and I'd miss it if she stopped." } },
      choices = {
        { text = "That's nearly friendship.", next = "BACK", reply = "Don't say so where she can hear. She'd raise the price." },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads = {
      lines = { { id = "roads_1", text = "Bad, and worsening. The Bulwark holds, for now. The Scarlets are thick as flies north of Brill. The Silverpine road has those wolf-men on it, and the Tarren Mill carts go under guard or not at all." } },
      choices = {
        { text = "Yet the carts still come through.", next = "roads2" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    roads2 = {
      lines = { { id = "roads2_1", text = "They do, I'll grant you. There's a carter named Hobb who's brought my flour through four ambushes and complains only about the mud. I pay him double and tell him each trip will be his last. He says I'm the most cheerful man on his route." } },
      choices = {
        { text = "He has the measure of you.", next = "BACK", reply = "He has. I've stocked a spare wheel for him, in case." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We've had the worst happen already. You'd think it would make us easier in our minds. It hasn't made me so." } },
    advice = { { id = "tp_advice", text = "Buy before you need it, and store it dry. Shortage never sends word ahead." } },
    lordaeron = { { id = "tp_lordaeron", text = "A full granary and an empty town. I'll say no more about it." } },
    scourge = { { id = "tp_scourge", text = "They'll come at the Bulwark in earnest one day. I've lamp oil laid in for the siege." } },
    sylvanas = { { id = "tp_sylvanas", text = "She plans for the worst as I do. It's the chief reason I sleep, in the manner of speaking." } },
    _none = { { id = "tp_none", text = "I don't know. I expect it's bad news, whatever it is." } },
  },
}

---------------------------------------------------------------------------
-- Merill Pleasance: sells guild tabards beside the guild master; loves every company's colours.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_pleasance", id = TODO_NPC("Merill Pleasance"), name = "Merill Pleasance", title = "Tabard Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "sunny", "sentimental" }, values = { "belonging", "beauty" },
  notices = { "race", "class" },
  impression = {
    first = "Merill Pleasance sells tabards in the Trade Quarter, beside the guild master, and she is unreasonably cheerful for the Undercity. She remembers every company's colours and takes each new banner as a small personal triumph.",
    third = "{name} met Merill Pleasance, the tabard vendor of the Undercity's Trade Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! You're one of the few who pays fair and talks civil, and I don't forget it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy what you need and be on your way, if you please." },
    { id = "g_1", text = "Hello, hello! Are you founding a company, or joining one, or only admiring the colours?" },
    { id = "g_2", when = { guild = true }, text = "Oh, you're in a company already! Turn round and let me see how the tabard's sitting on you." },
    { id = "g_3", when = { metBefore = true }, text = "You're back! Have you settled on your colours? I've been thinking about it for you." },
  },

  notice = {
    { id = "n_1", cat = "race", when = { race = "Orc" },
      text = "Red and black, I expect, for an orc. It's always red and black. I'd so love to sell one of you a green, only once." },
    { id = "n_2", cat = "class", when = { class = { "PRIEST", "MAGE" } },
      text = "You'd carry a pale colour well, over those robes. Silver on grey. I'm only saying." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Merill Pleasance! I sell tabards, plain ones ready for a company's device. Mr. Drakul there does the charters and the signing, and then they come one step to the left and I dress them. It's the nicest part of anybody's day." },
        { id = "hello_2", when = { guild = true }, text = "Merill Pleasance. You've your colours already, so I can only offer you a spare, and tell you that yours is one of my favourites. I say that to everybody, and it's always true." },
      },
      again = {
        { id = "hello_a1", text = "Anything else? I've all the time there is!" },
        { id = "hello_a2", text = "Do go on." },
        { id = "hello_a3", text = "Yes?" },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your tabards.", next = "BUSINESS" },
        { text = "Do you remember every company's colours?", next = "colours" },
        { text = "You're very cheerful, for the Undercity.", next = "cheer" },
        { text = "How do you get on with the guild master?", next = "drakul" },
        { text = "Why would an orc wear green?", next = "green", when = { race = "Orc" } },
        { text = "Thank you, Merill.", next = "END" },
      },
    },
    colours = {
      lines = { { id = "colours_1", text = "Every one. There's a company of deathguards who took black with a white hand. Four tailors' apprentices who chose violet and call themselves the Seamless. And a pack of orcs with a red axe on black, naturally. I keep a strip of each pinned in a book." } },
      choices = {
        { text = "What becomes of the book when a company ends?", next = "colours2" },
        { text = "That's a great many strips of cloth.", next = "colours2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    colours2 = {
      lines = { { id = "colours2_1", text = "I leave the strip in. Some of the companies are only one name now, or none. I've a page for a band called the Lanterns, six of them, who went into the Plaguelands in yellow and gold. Nobody's come for a spare in a year. I still think it was a lovely yellow." } },
      choices = {
        { text = "You keep them so they're not forgotten.", next = "colours3" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    colours3 = {
      big = true,
      lines = { { id = "colours3_1", text = "I suppose I do. Mr. Drakul strikes them from the register when the last name's gone, because that's the rule. I've asked him to leave the Lanterns in a bit longer. He says a register must be true. Do you think he ought to bend it?" } },
      choices = {
        { text = "Yes. Leave them their page a while.", next = "BACK", reply = "That's what I said! I'll tell him a customer agreed.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "No. A register must record what is.", next = "BACK", reply = "Oh. Well, I've still my own book, and nobody strikes anything out of that.", fx = { align = { order = 1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    cheer = {
      lines = { { id = "cheer_1", text = "Somebody ought to be! I sold ribbons at fairs when I was alive, and I was cheerful then, and I didn't see why dying should change a person's nature. The apothecaries find me trying. I find them a bit grey." } },
      choices = {
        { text = "Is it truly never an effort?", next = "cheer2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    cheer2 = {
      lines = { { id = "cheer2_1", text = "Some mornings. I wake, so to speak, and there's the green light and the smell, and I think, oh, Merill. Then somebody comes along to found a company, all nervous and proud, and wants to know if blue goes with bone. And it does, you know. It really does." } },
      choices = {
        { text = "The city's better for you.", next = "BACK", reply = "What a nice thing to say! I'll pin that in the book as well." },
        { text = "Something else.", next = "BACK" },
      },
    },
    drakul = {
      lines = { { id = "drakul_1", text = "He's a dear, in a dusty sort of way. Very exact. He once sent a company back three times because the ninth signature was smudged. But he remembers every founding day, and I've caught him standing at the back when they first put the tabards on." } },
      choices = {
        { text = "He's softer than he looks.", next = "BACK", reply = "Don't tell him I told you. He thinks nobody's noticed." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    green = {
      lines = { { id = "green_1", text = "Because it would suit you! With that skin, a dark forest green and a bronze device, and you'd look like something out of an old tale. But no, it's the axe and the red, every time. I've a green set by, just in case one of you is brave." } },
      choices = {
        { text = "Red is for blood and black for the old shame.", next = "BACK", reply = "Oh! I never knew it meant something. Then I'll not tease again. It's a fine red." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We've lost our families, most of us. A company's the next best thing, and I've the cloth for it." } },
    advice = { { id = "tp_advice", text = "Choose colours you'll like in ten years. I've seen such regret over orange." } },
    lordaeron = { { id = "tp_lordaeron", text = "The midsummer fair at Brill! Ribbons on every pole. I can still smell the cider, almost." } },
    sylvanas = { { id = "tp_sylvanas", text = "Her banner's the loveliest thing in the city. That purple. I'd give anything to know the dye." } },
    scarlet_crusade = { { id = "tp_scarlet_crusade", text = "They've only the one tabard, and they all wear it, and none of them looks pleased about it." } },
    _none = { { id = "tp_none", text = "I've no idea! But it sounds interesting. Do tell me if you find out." } },
  },
}

---------------------------------------------------------------------------
-- Benijah Fenner: War Quarter weapon merchant; an old sergeant who sells what he'd carry himself.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_bfenner", id = TODO_NPC("Benijah Fenner"), name = "Benijah Fenner", title = "Weapon Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "hearty", "blunt" }, values = { "strength", "loyalty" },
  notices = { "class", "race" },
  impression = {
    first = "Benijah Fenner sells weapons in the War Quarter with a sergeant's voice and a sergeant's opinions. He was a soldier of Lordaeron, and he sells only what he would have been content to carry on a march.",
    third = "{name} met Benijah Fenner, a weapon merchant in the Undercity's War Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! You're one of the few who pays fair and talks civil, and I don't forget it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Look, don't touch, and pay before you go. I've learned that much about you." },
    { id = "g_1", text = "Step up, recruit, and let's see what you're swinging." },
    { id = "g_2", when = { class = "WARRIOR" }, text = "A proper soldier, at last. Put that on the counter and let me feel the weight. Aye, that'll do, though I'd shorten the grip." },
    { id = "g_3", when = { metBefore = true }, text = "Back from the field, are you? Good. Report." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "WARRIOR" },
      text = "You carry your shield high and your sword low. Somebody drilled that into you, and I'd like to shake their hand, if they've still got one." },
    { id = "n_2", cat = "race", when = { race = "Orc" },
      text = "An orc. I fought your fathers at the gates of the capital, in the Second War. They hit like falling masonry, and I'm glad to have you on this side of the wall." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Benijah Fenner, late a sergeant of the king's foot. I sell swords, axes and polearms, and every one of them is something I'd have carried on a twenty-mile march. If it's pretty, it's by accident." },
        { id = "hello_2", when = { metBefore = true }, text = "Fenner. Still here, still selling steel to anyone who'll point it at the Scourge. What do you need?" },
      },
      again = {
        { id = "hello_a1", text = "What else, recruit?" },
        { id = "hello_a2", text = "Go on, speak up." },
        { id = "hello_a3", text = "Well? Out with it." },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "You were a sergeant of Lordaeron?", next = "soldier" },
        { text = "Three weapon merchants on one ring.", next = "ring" },
        { text = "Have you kin in the city?", next = "lucian" },
        { text = "We hit hard, and you held the gate.", next = "war", when = { race = "Orc" } },
        { text = "Dismissed, sergeant. Farewell.", next = "END" },
      },
    },
    soldier = {
      lines = { { id = "soldier_1", text = "Thirty-one years. I carried a pike against the Horde, and then drilled farm boys for a peace that lasted about as long as a pair of boots. When the plague came they gave me a company of militia and told me to hold the Brill road." } },
      choices = {
        { text = "Did you hold it?", next = "soldier2" },
        { text = "Militia against the Scourge is no fair fight.", next = "soldier2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldier2 = {
      big = true,
      lines = { { id = "soldier2_1", text = "For a day and a night. Then the dead we'd lost that morning stood up behind us, in our own colours. I gave the order to fall back. Some say a sergeant holds till he drops. I've wondered about it since, with plenty of time for wondering. What's your judgement?" } },
      choices = {
        { text = "You saved who could be saved. That's command.", next = "BACK", reply = "That's what I told the lads who lived. It's good to hear it from outside.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "A soldier holds his ground.", next = "BACK", reply = "Aye. I've said the same to recruits. It was a different thing, standing on it.", fx = { align = { order = 1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    ring = {
      lines = { { id = "ring_1", text = "Fenner, Eliot and Hartwell, aye. Francis Eliot sells to officers, the sort who want a hilt that matches their gloves. Geoffrey Hartwell sells whatever's odd, and can talk for an hour about a foreign axe. I sell to the ranks. There's custom enough for all." } },
      choices = {
        { text = "And Archibald, the weapon master?", next = "ring2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    ring2 = {
      lines = { { id = "ring2_1", text = "Archibald teaches them which end to hold, and sends them to me for something to hold. He's a hard teacher and a fair one. I've seen him put a student on the floor nine times and help them up nine times, and that's the right count." } },
      choices = {
        { text = "It sounds like a proper garrison.", next = "BACK", reply = "It's the nearest I'll get to one again, and I'm content." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    lucian = {
      lines = { { id = "lucian_1", text = "A nephew, Lucian, down in the Rogues' Quarter with the knife-and-shadow lot. He's a good lad, but he went quiet after he rose, and took up with Mennet Carkad's people. I'd rather he'd carried a pike, where I could see who he was fighting." } },
      choices = {
        { text = "The Deathstalkers serve the Dark Lady too.", next = "lucian2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lucian2 = {
      lines = { { id = "lucian2_1", text = "So he tells me. I don't doubt it. Only, a soldier knows his enemy's face, and Lucian isn't always told whose throat it is. He comes by on feast days and we don't speak of work. I've a sword put aside for him, if he ever wants an honest trade." } },
      choices = {
        { text = "Keep it oiled. He may yet ask.", next = "BACK", reply = "Every week, recruit. Every week." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    war = {
      lines = { { id = "war_1", text = "You did, and we did, and here we both stand in a sewer on the same side. I'd not have believed it. Your Warchief's the reason, I'm told. I've never met him, but any commander who gets orcs and dead men to share a wall has my salute." } },
      choices = {
        { text = "Old enemies make strong allies.", next = "BACK", reply = "They know each other's measure, at least. Lok'tar, isn't it? I've been practising." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We're the last regiment of Lordaeron, whether the living like it or not. I mean to see we're armed like one." } },
    advice = { { id = "tp_advice", text = "Clean your weapon before you clean yourself. I've had it shouted at me and I've shouted it at others." } },
    lordaeron = { { id = "tp_lordaeron", text = "A good kingdom and a good army, betrayed from the top. I'll say no more than that in front of the young ones." } },
    scourge = { { id = "tp_scourge", text = "They've our dead in their ranks. Every one we put down is a soldier sent home, and that's how I think of it." } },
    sylvanas = { { id = "tp_sylvanas", text = "A general who was killed at her post and got up again to finish the fight. I'd follow that into anything." } },
    _none = { { id = "tp_none", text = "Above my rank, that. Ask an officer, and salt what you're told." } },
  },
}

---------------------------------------------------------------------------
-- Francis Eliot: War Quarter weapon merchant to officers; cares about hilts and lineage.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_eliot", id = TODO_NPC("Francis Eliot"), name = "Francis Eliot", title = "Weapon Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "refined", "snobbish" }, values = { "status", "beauty" },
  notices = { "class", "purse" },
  impression = {
    first = "Francis Eliot sells weapons in the War Quarter to those who want a blade with a history and a hilt to match. He was a gentleman's sword-cutler in Lordaeron and has not adjusted his manners to the sewer.",
    third = "{name} met Francis Eliot, a weapon merchant in the Undercity's War Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! You're one of the few who pays fair and talks civil, and I don't forget it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The prices are what they are, and I'm not in a haggling mood." },
    { id = "g_1", text = "Good day. Do wipe your hands before you touch the hilts, if you'd be so kind, since the wire is silver." },
    { id = "g_2", when = { money = { min = 1000000 } }, text = "Ah. Now here is a customer who understands that a weapon is also an introduction. Allow me to show you the case, and not the rack." },
    { id = "g_3", when = { metBefore = true }, text = "You return. I had thought you might, since quality has a way of bringing people back." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = { "PALADIN", "WARRIOR" } },
      text = "That is a serviceable sword, and it sits on your hip like a tool in a carpenter's belt. A blade should be worn. You are merely carrying yours." },
    { id = "n_2", cat = "purse", when = { money = { max = 10000 } },
      text = "I fear most of my stock is beyond you at present. I say it without malice. Sergeant Fenner, three stalls along, sells an honest blade to an honest purse." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Francis Eliot. I was sword-cutler to half the noble houses of Lordaeron, and I continue the trade for what gentry the Undercity affords. My blades are balanced, engraved, and provided with a history, and I sell them to those who can tell the difference." },
        { id = "hello_2", when = { metBefore = true }, text = "Francis Eliot, at your service once more. I have acquired a sabre from the Barov estate since you called, with the crest quite unmarked. One doesn't see its like twice." },
      },
      again = {
        { id = "hello_a1", text = "Was there something further?" },
        { id = "hello_a2", text = "Do go on." },
        { id = "hello_a3", text = "Yes? I am attending." },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me the case.", next = "BUSINESS" },
        { text = "A blade with a history costs more.", next = "history" },
        { text = "Is there any gentry left to sell to?", next = "gentry" },
        { text = "How do you regard the other merchants here?", next = "fenner" },
        { text = "Good day, Mr. Eliot.", next = "END" },
      },
    },
    history = {
      lines = { { id = "history_1", text = "Naturally, and so it should. A sword that was at Blackrock Spire has been proved, in the old sense. Its owner trusted his life to it and was right to. A new blade from the forge is only a promise, and I have known a great many promises broken." } },
      choices = {
        { text = "How do you know the histories are true?", next = "history2" },
        { text = "A dead man's crest is a grim ornament.", next = "history2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    history2 = {
      lines = { { id = "history2_1", text = "I knew the houses. I fitted the fathers, and often the grandfathers. When a deathguard brings me a sabre out of some burned hall, I can generally tell him whose hand it was made for, and I confess that part is harder than I allow the customers to see." } },
      choices = {
        { text = "You're selling your old patrons' swords.", next = "history3" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    history3 = {
      big = true,
      lines = { { id = "history3_1", text = "I am, to strangers, for coin. I tell myself a fine blade should be carried, and not left to rust under a fallen roof, and that Lord So-and-so would prefer it. I do not, in truth, know what he would prefer. What is your view of it?" } },
      choices = {
        { text = "Better carried with honour than left to rust.", next = "BACK", reply = "That is my own argument, and I am relieved to hear it from another mouth.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "You're a well-dressed grave robber, Eliot.", next = "BACK", reply = "Sir or madam, I have been called worse by better. But the remark has landed, I admit it.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    gentry = {
      lines = { { id = "gentry_1", text = "More than one might think. The Dark Lady's officers, a few old names who rose with their wits intact, and of late certain orc captains who appreciate a good edge even if they are baffled by the engraving. A troll once bought a rapier from me to wear in his hair." } },
      choices = {
        { text = "What do the orc captains ask for?", next = "gentry2" },
        { text = "And you sold it to him.", next = "BACK", reply = "I did. He wore it very well, I am bound to say." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    fenner = {
      lines = { { id = "fenner_1", text = "The good sergeant sells iron bars with a point on, and sells them honestly. Mr. Hartwell sells curiosities. I sell swords. We are perfectly civil, and I would trust Fenner with my life sooner than with my silver polish." } },
      choices = {
        { text = "That's almost a compliment.", next = "fenner2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fenner2 = {
      lines = { { id = "fenner2_1", text = "It is entirely one. When the alarm sounded in the spring, Fenner was at the stair with a pike before I had found my gloves. I stood behind him. I should stand behind him again, and I should not at all mind which gloves." } },
      choices = {
        { text = "Then you rate him higher than his wares.", next = "BACK", reply = "Considerably. Pray do not tell him." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    gentry2 = {
      lines = { { id = "gentry2_1", text = "A broad blade, a plain guard, and no engraving whatever. I explained to one captain that the scrollwork recorded the maker's lineage. He told me a sword's lineage is who it has killed, and that it would be written on soon enough. I found I had no answer." } },
      choices = {
        { text = "He had the better of that exchange.", next = "BACK", reply = "He did. I gave him the scabbard at cost, as a forfeit." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "Death has been a great leveller, and I have never cared for levelling. Still, one adapts, with as much grace as one can find." } },
    advice = { { id = "tp_advice", text = "Buy once, and buy well. A cheap blade is paid for a second time, at the worst possible moment." } },
    lordaeron = { { id = "tp_lordaeron", text = "I had a shop on the king's road with a bow window. I shall not describe it. It would only distress us both." } },
    sylvanas = { { id = "tp_sylvanas", text = "A lady of Quel'Thalas, and it shows in everything she does. I should be honoured to supply her household." } },
    syndicate = { { id = "tp_syndicate", text = "Fallen gentlemen of Alterac. I knew several of them when they still paid their accounts." } },
    _none = { { id = "tp_none", text = "I regret that I cannot oblige you there. It is hardly my province." } },
  },
}

---------------------------------------------------------------------------
-- Geoffrey Hartwell: War Quarter weapon merchant of foreign and curious arms; kin to the Hartwell mages.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_ghartwell", id = TODO_NPC("Geoffrey Hartwell"), name = "Geoffrey Hartwell", title = "Weapon Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "talkative", "curious" }, values = { "knowledge", "novelty" },
  notices = { "race", "class" },
  impression = {
    first = "Geoffrey Hartwell sells weapons in the War Quarter and prefers the strange ones: troll glaives, dwarven picks, anything from far off. He can talk about a foreign axe for an hour and will, unless stopped.",
    third = "{name} met Geoffrey Hartwell, a weapon merchant in the Undercity's War Quarter with a taste for foreign arms.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my favourite customer. Come and look; I'll knock a little off for you, quietly." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
    { id = "g_1", text = "Oh, good, a customer! Come and look at this, I've only just unpacked it and nobody here will let me explain it." },
    { id = "g_2", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Wait, don't move. Is that made by your own people? May I see how the haft is bound? I've only ever had drawings." },
    { id = "g_3", when = { metBefore = true }, text = "You're back! Splendid. I've a new piece, and I think it's from Stranglethorn, though the fellow who sold it was vague." },
  },

  notice = {
    { id = "n_1", cat = "race", when = { race = "Troll" },
      text = "That's a Darkspear grip, with the cord wound against the lay. I've tried to copy it four times and it unwinds on me every time." },
    { id = "n_2", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Then you'll know: is it true that a tauren totem-staff is balanced for throwing as well as striking? I've an argument riding on it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Geoffrey Hartwell. I sell weapons, and I try to sell the interesting ones, though the deathguards will keep asking for plain swords. I've a troll glaive, two dwarven war picks and something from Kalimdor I can't yet put a name to." },
        { id = "hello_2", when = { metBefore = true }, text = "Geoffrey Hartwell, still collecting faster than I sell. Anastasia says I ought to be a museum and charge at the door." },
      },
      again = {
        { id = "hello_a1", text = "What else? I've plenty more to show." },
        { id = "hello_a2", text = "Go on, ask. Or I'll go on, if you'd rather." },
        { id = "hello_a3", text = "Yes? Oh, do look at this while you think." },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why the foreign pieces?", next = "strange" },
        { text = "What's the thing from Kalimdor?", next = "kalimdor" },
        { text = "You're kin to Anastasia Hartwell, the mage?", next = "family" },
        { text = "Wind it wet, and let it dry tight.", next = "cord", when = { race = "Troll" } },
        { text = "I must go before you unpack another.", next = "END" },
      },
    },
    strange = {
      lines = { { id = "strange_1", text = "Because every one is an answer to a question. A dwarf fights in a tunnel, so his pick is short and has a spike behind. A troll fights in jungle, so his blade's curved for a draw cut through vines. You can read a whole people off a weapon rack." } },
      choices = {
        { text = "What does a Forsaken weapon say of us?", next = "strange2" },
        { text = "You talk like a scholar, not a merchant.", next = "strange2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange2 = {
      lines = { { id = "strange2_1", text = "That's the sad part. We haven't any. We carry Lordaeron's swords, a dead kingdom's pattern, made for living arms. I've been sketching what ours ought to be. Lighter, since we don't tire, and hooked, for pulling down a thing that won't stay down." } },
      choices = {
        { text = "Has anyone forged your sketch?", next = "strange3" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    strange3 = {
      lines = { { id = "strange3_1", text = "James Van Brunt made one, grumbling. It's ugly as sin and it works. A deathguard took it to the Bulwark, and I'm told she won't give it back for anything. It's the proudest I've been since I rose, and I didn't swing a hammer." } },
      choices = {
        { text = "A people's first weapon. That's worth pride.", next = "BACK", reply = "Isn't it? I'm calling it a reaver's hook, until someone thinks of better.", fx = { affinity = 1 } },
        { text = "A hook's a butcher's tool.", next = "BACK", reply = "Against the Scourge, friend, butchery is rather the point." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    kalimdor = {
      lines = {
        { id = "kalimdor_1", text = "A long haft, a crescent head with holes bored in it, and feathers tied through. A goblin said it was tauren. Benijah Fenner says it's a harpy's, and Eliot says it's rubbish. When you swing it, the holes make a sound like wind through a fence." },
        { id = "kalimdor_2", when = { race = "Tauren" }, text = "A long haft, a crescent head with holes bored through and feathers tied on. I was told it's tauren work. Is it? When it's swung it makes a low sound, like wind in a fence, and I've been longing to ask one of you what that's for." },
      },
      choices = {
        { text = "The sound warns the spirits a blow is coming.", next = "kalimdor2", when = { race = "Tauren" } },
        { text = "Perhaps the sound is meant to frighten.", next = "kalimdor2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    kalimdor2 = {
      lines = { { id = "kalimdor2_1", text = "Oh, that's good. That's much better than anything I'd guessed. I'm going to write that on the card. Do you know, I've learned more from customers at this stall than I did in ten years of books?" } },
      choices = {
        { text = "Then keep asking.", next = "BACK", reply = "I intend to. Nobody's managed to stop me yet." },
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      big = true,
      lines = { { id = "family_1", text = "Her brother. She got the magic and I got the enthusiasm. She's very good, and very stern, and she thinks my trade is beneath a Hartwell. I think a family ought to have one member who's simply fond of things. Am I wrong?" } },
      choices = {
        { text = "No. Fondness is rare here. Keep it.", next = "BACK", reply = "I shall. I'll tell her a customer ruled in my favour.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "She's right. Trinkets won't win the war.", next = "BACK", reply = "Hm. That's exactly her tone, too. I'll keep my axes, all the same.", fx = { align = { light = -1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    cord = {
      lines = { { id = "cord_1", text = "Wet! Of course. It shrinks as it dries and bites into itself. Four tries, and I never once thought to wet it. Would you do the first three turns for me, so I can see the angle?" } },
      choices = {
        { text = "Like dis. Now you.", next = "BACK", reply = "Ha! It's holding. Look at that. I owe you a favour, and a look at anything on the top shelf." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "A new people, really. We ought to be making new things, and we're mostly mending old ones." } },
    advice = { { id = "tp_advice", text = "Ask what a weapon was made for before you buy it. It'll never be as good at anything else." } },
    lordaeron = { { id = "tp_lordaeron", text = "I'd a cabinet of arms from six kingdoms, in a house by the lake. Looters had the lot. I hope they at least looked after them." } },
    trolls = { { id = "tp_trolls", text = "Marvellous smiths in bone and stone, and nobody gives them credit for it. I'd give a great deal to visit one of their forges." } },
    sylvanas = { { id = "tp_sylvanas", text = "I once saw her bow at ten paces. Thalassian, recurved, and older than this city. I didn't breathe, which is admittedly easy for me." } },
    _none = { { id = "tp_none", text = "No idea! But if it has an edge, bring it round and I'll find out." } },
  },
}

---------------------------------------------------------------------------
-- Nicholas Atwood: the War Quarter's gun merchant; sells a dwarven invention to a city that distrusts it.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_atwood", id = TODO_NPC("Nicholas Atwood"), name = "Nicholas Atwood", title = "Gun Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "defensive", "enthusiastic" }, values = { "novelty", "craft" },
  notices = { "class", "race" },
  impression = {
    first = "Nicholas Atwood sells guns in the War Quarter, to a people who mostly think them loud, foreign and unreliable. He is forever defending the things, and he keeps his powder in a lead-lined box a long step from the forge.",
    third = "{name} met Nicholas Atwood, the gun merchant of the Undercity's War Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! You're one of the few who pays fair and talks civil, and I don't forget it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
    { id = "g_1", text = "Before you say it, yes, they're loud, and no, they don't blow up in your hand if you load them properly." },
    { id = "g_2", when = { class = "HUNTER" }, text = "A hunter! Tell me you shoot. Tell me you don't only pull a string like everyone else in this city." },
    { id = "g_3", when = { metBefore = true }, text = "Back again. Have you come round to powder yet, or are you still thinking it over?" },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "HUNTER" },
      text = "There's burnt powder on your right cuff. Oh, well done. You'd be amazed how lonely it gets, being the only man in Lordaeron who likes a bang." },
    { id = "n_2", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your braves carry guns as often as bows now, I hear. Great long ones. I'd give a lot to see one fired." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Nicholas Atwood. I sell firearms, shot and powder. It's a dwarven craft and a goblin vice, and the Forsaken haven't taken to it, but one day a deathguard is going to drop an abomination at eighty paces and I'll be the busiest man in the quarter." },
        { id = "hello_2", when = { class = "HUNTER" }, text = "Nicholas Atwood. I've muskets, a pair of blunderbusses and one long rifle I'd sooner not sell to anybody who won't look after it. Shot's in the bin and powder's in the lead box." },
      },
      again = {
        { id = "hello_a1", text = "Anything else? I've powder to sift." },
        { id = "hello_a2", text = "Go on, ask. I like the questions." },
        { id = "hello_a3", text = "Yes?" },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your guns.", next = "BUSINESS" },
        { text = "Why don't the Forsaken trust guns?", next = "distrust" },
        { text = "You keep your powder well away from the forge.", next = "powder" },
        { text = "Have you family in the trade?", next = "helena" },
        { text = "Why should I give up my bow?", next = "bow", when = { class = "HUNTER" } },
        { text = "Mind your powder, Nicholas.", next = "END" },
      },
    },
    distrust = {
      lines = { { id = "distrust_1", text = "Three reasons. They're loud, and we're a people who like to arrive quietly. They're dwarven, and the dwarves are the other side. And the Dark Lady is the finest archer living or dead, so every recruit wants a bow like hers." } },
      choices = {
        { text = "It's hard to argue with the Dark Lady's bow.", next = "distrust2" },
        { text = "And yet you sell them anyway.", next = "distrust2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    distrust2 = {
      lines = { { id = "distrust2_1", text = "I don't argue with it. I only say this: it takes ten years to make an archer and a fortnight to make a musketeer. We've not got ten years of recruits. A gun lets a risen farmhand hold a wall, and there's no shame in a farmhand holding a wall." } },
      choices = {
        { text = "That's sound soldier's reasoning.", next = "BACK", reply = "Tell the deathguard captains. I've told them till my jaw came loose.", fx = { affinity = 1 } },
        { text = "A fortnight's training makes a fortnight's soldier.", next = "BACK", reply = "And a fortnight's soldier with a musket still kills a ghoul. I'll take it." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    powder = {
      lines = { { id = "powder_1", text = "Forty paces from James Van Brunt's fire, in a box lined with lead, with a wet blanket over. James measured the distance himself with a knotted rope and wouldn't sell me nails until I'd moved the box twice." } },
      choices = {
        { text = "Have you ever had an accident?", next = "powder2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    powder2 = {
      lines = { { id = "powder2_1", text = "One. A spark from a pipe, a small keg, and my left hand. They sewed on another, and it's not quite the same size. I tell customers it happened to a cousin. I ought to tell them the truth, since it's the best lesson I own." } },
      choices = {
        { text = "Tell them the truth. It'll keep them careful.", next = "BACK", reply = "You're right. I'll start with the next one in. Well, I suppose I've started with you." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    helena = {
      big = true,
      lines = { { id = "helena_1", text = "A sister, Helena, who thinks I've lost my wits. She says a Forsaken ought to fight in a Forsaken way, with blight and arrow, and not with a dwarf's toy. I say we use whatever kills the Scourge. Which of us has the right of it?" } },
      choices = {
        { text = "You do. Take any weapon that works.", next = "BACK", reply = "Ha! I'll tell her. She won't listen, but I'll tell her.", fx = { align = { order = -1 } } },
        { text = "She does. A people should keep its own ways.", next = "BACK", reply = "Hm. Then we'd best hope our own ways are enough.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bow = {
      lines = { { id = "bow_1", text = "Don't give it up! Carry both. A bow for when you want to be quiet, and a gun for when quiet's already failed and something large is running at you. There's a moment for each, and nobody ever regretted the second one being loud." } },
      choices = {
        { text = "Which would you trust at eighty paces?", next = "bow2" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    bow2 = {
      lines = { { id = "bow2_1", text = "The long rifle, if you've kept it clean, and your bow if you haven't. A dirty gun's a club with ambitions. That's why I won't sell the rifle to just anyone. I ask to see their other gear first, and if the bowstring's frayed, they go without." } },
      choices = {
        { text = "My string's sound. Look for yourself.", next = "BACK", reply = "So it is. Then come and hold her, and mind, she kicks." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "Quiet folk, with quiet weapons. I'm the noise in the family." } },
    dwarves = { { id = "tp_dwarves", text = "The enemy, and I'd shake any one of them by the hand for inventing this. I try not to say so too loudly." } },
    goblins = { { id = "tp_goblins", text = "They sell me powder, and I sift every pound of it for sawdust. There's always some." } },
    advice = { { id = "tp_advice", text = "Keep your powder dry and your pipe out. I'd carve it on the stall, if anyone read stalls." } },
    sylvanas = { { id = "tp_sylvanas", text = "The best shot in the world, with a bow. I'd never try to convert her. I'd only like her to let the rest of us cheat a little." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. If it doesn't go bang, I'm not your man." } },
  },
}

---------------------------------------------------------------------------
-- Samuel Van Brunt: sells coal, flux and hammers beside James Van Brunt's forge.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_svanbrunt", id = TODO_NPC("Samuel Van Brunt"), name = "Samuel Van Brunt", title = "Blacksmithing Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "dry", "meticulous" }, values = { "order", "family" },
  notices = { "profession", "race" },
  impression = {
    first = "Samuel Van Brunt sells blacksmithing supplies in the War Quarter, beside the forge of his kinsman James. He is dry and meticulous, counts coal by the scuttle, and appears to supply half the city with wire wool.",
    third = "{name} met Samuel Van Brunt, who sells blacksmithing supplies in the Undercity's War Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my favourite customer. Come and look; I'll knock a little off for you, quietly." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The prices are what they are, and I'm not in a haggling mood." },
    { id = "g_1", text = "Good day. Coal's by the scuttle, flux by the tin, and nothing's on account, whoever you are." },
    { id = "g_2", when = { profession = "Blacksmithing" }, text = "A smith. Then you know what you want, and I shan't need to explain flux to you, which is a relief." },
    { id = "g_3", when = { metBefore = true }, text = "Back again. You burn through coal faster than James does, and he's got the big forge." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Blacksmithing" },
      text = "Your hammer's mushroomed at the face. Dress it, or a chip will come off one day and find your eye." },
    { id = "n_2", cat = "race", when = { race = "Orc" },
      text = "An orc smith, I'd guess, by the burns. Your people use more coal per sword than anyone I supply. I'm not complaining." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Samuel Van Brunt. James has the anvil and the talent, and I have the coal, the flux, the hammers and the accounts. A forge is three parts supply to one part skill, though you'll not hear a smith admit it." },
        { id = "hello_2", when = { profession = "Blacksmithing" }, text = "Samuel Van Brunt. I've coal, weak and strong flux, grinding stones and a decent hammer or two. James will teach you what to do with them, and Basil Frye will teach you what not to." },
      },
      again = {
        { id = "hello_a1", text = "Anything else? I'm in the middle of a count." },
        { id = "hello_a2", text = "Go on." },
        { id = "hello_a3", text = "Yes?" },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You and James are family.", next = "brothers" },
        { text = "Where does coal come from, down here?", next = "coal" },
        { text = "I hear you supply the whole city with wire wool.", next = "wool" },
        { text = "We feed the fire well, and it feeds us.", next = "burn", when = { race = "Orc" } },
        { text = "I'll let you finish your count.", next = "END" },
      },
    },
    brothers = {
      lines = { { id = "brothers_1", text = "Cousins. There's Richard as well, who does nothing in particular and does it near the forge. James and I shared a smithy in life, the same way. He'd make a thing and forget to charge for it, and I'd go round a week later with the bill." } },
      choices = {
        { text = "And he never minded?", next = "brothers2" },
        { text = "Every craftsman needs someone to send the bill.", next = "brothers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brothers2 = {
      lines = { { id = "brothers2_1", text = "He never noticed. I don't think James has handled a coin in thirty years. He believes the coal simply arrives. I've considered letting it not arrive, once, for the education of him, and I've never had the heart." } },
      choices = {
        { text = "He's lucky in you.", next = "BACK", reply = "He is. I've it written down somewhere, in case he ever asks.", fx = { affinity = 1 } },
        { text = "You should let the coal run out once.", next = "BACK", reply = "I should. But then there'd be no swords for the Bulwark, and it would be on my ledger." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    coal = {
      lines = { { id = "coal_1", text = "Charcoal from Silverpine, burned by a crew near the Sepulcher, and a little true coal the goblins bring by zeppelin at a wicked price. Sarah Killian's miners turn up a seam now and then. I buy every scrap, because a cold forge is a disarmed city." } },
      choices = {
        { text = "A disarmed city. Is it as near as that?", next = "coal2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    coal2 = {
      big = true,
      lines = { { id = "coal2_1", text = "Nearer than the captains like to say. Every sword at the Bulwark came off that anvil, and the anvil stops when my bins are empty. I've nine days' coal as of this morning. I've told nobody but James, who didn't hear. Should I be telling the captains?" } },
      choices = {
        { text = "Yes. They can't plan around what they don't know.", next = "BACK", reply = "You're right. I'll write it out tonight, with the figures.", fx = { align = { honor = 1 } } },
        { text = "No. Quietly fix it. Panic helps no one.", next = "BACK", reply = "That's been my course so far. The charcoal cart's due Thursday.", fx = { align = { honor = -1 } } },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    wool = {
      lines = { { id = "wool_1", text = "It's true. The damp in this place rusts everything, so everybody with a tool wants wire wool. Mirelle Tremayne for her armour, Elizabeth Van Talen for her pumps, the bat handlers for harness buckles. I sell more wool than coal, by weight." } },
      choices = {
        { text = "Does anything down here not rust?", next = "wool2" },
        { text = "The whole city runs on your scouring.", next = "BACK", reply = "It runs on rust, strictly. I only keep up with it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    burn = {
      lines = { { id = "burn_1", text = "I'd heard your smiths speak to the fire. I thought it was a story. James talks to his, mind, though only to swear at it. If there's a courtesy that makes coal burn hotter, I'd pay to learn it." } },
      choices = {
        { text = "Greet the flame, and never spit in it.", next = "BACK", reply = "That's cheap enough. I'll pass it to James, and see whether the swearing counts against us." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    wool2 = {
      lines = { { id = "wool2_1", text = "Truesilver, and the Dark Lady's patience. Everything else goes brown in a month. I've had a pair of tongs since the old smithy that I oil every night without fail, and they're the only tools in the quarter older than the plague. James is forbidden to touch them." } },
      choices = {
        { text = "Every craftsman keeps one sacred tool.", next = "BACK", reply = "Mine has a label on it, with his name crossed out." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We don't feel the forge heat, and so we stand too near and scorch our sleeves. I sell a good many aprons." } },
    advice = { { id = "tp_advice", text = "Count your stock on the same day every week. Shortage hides in the weeks you skip." } },
    lordaeron = { { id = "tp_lordaeron", text = "Van Brunt and Van Brunt, on the smiths' row. The sign's still there, I'm told, the wrong way up." } },
    scourge = { { id = "tp_scourge", text = "Every blade we forge goes at them, and they never seem fewer. I keep counting anyway." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Royal Quarter pays its forge bills within the week. I can't say that of the old king." } },
    _none = { { id = "tp_none", text = "Not in my ledger. I can't help you." } },
  },
}

---------------------------------------------------------------------------
-- Sarah Killian: sells picks and lamps in the War Quarter; wife to Brom Killian, the mining trainer.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_skillian", id = TODO_NPC("Sarah Killian"), name = "Sarah Killian", title = "Mining Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "tough", "warm" }, values = { "endurance", "family" },
  notices = { "profession", "race" },
  impression = {
    first = "Sarah Killian sells mining supplies in the War Quarter, beside her husband Brom, who teaches the mining. She is tough and warm in about equal parts and has decided views on which tunnels under the city ought to be left shut.",
    third = "{name} met Sarah Killian, who sells mining supplies in the Undercity's War Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my favourite customer. Come and look; I'll knock a little off for you, quietly." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
    { id = "g_1", text = "Hello, love. If you're going underground, you'll want a pick, and if you've any sense you'll want two lamps." },
    { id = "g_2", when = { profession = "Mining" }, text = "A miner. Let's see your hands. Aye, there's the callus, across the palm where the haft turns." },
    { id = "g_3", when = { metBefore = true }, text = "Back up top, then. I'm always glad to see one come back up." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Mining" },
      text = "Your pick's been sharpened to a needle. It'll bite quick and blunt quicker. Put a chisel point on it, and it'll last you the seam." },
    { id = "n_2", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Brom says your people ask the earth's leave before they dig. I think that's lovely, and I've started doing it myself, under my breath." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Sarah Killian. Brom teaches folk to find ore and I sell them the picks to get it out with. We were miners in Alterac before any of this, and I've been underground more of my life than above it, so the Undercity suits me well enough." },
        { id = "hello_2", when = { profession = "Mining" }, text = "Sarah Killian. I've picks, lamps, oil and a good stout sack. Brom's the one to ask about finding a vein. I'm the one to ask about getting home again after." },
      },
      again = {
        { id = "hello_a1", text = "Anything else, love?" },
        { id = "hello_a2", text = "Go on. Brom's busy with a pupil." },
        { id = "hello_a3", text = "Yes?" },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your gear.", next = "BUSINESS" },
        { text = "You must feel at home down here.", next = "under" },
        { text = "You and Brom have worked together a long while.", next = "brom" },
        { text = "Are there tunnels under the city nobody enters?", next = "shut" },
        { text = "The earth hears, when you ask.", next = "leave", when = { race = "Tauren" } },
        { text = "I'll carry two lamps. Farewell.", next = "END" },
      },
    },
    under = {
      lines = { { id = "under_1", text = "More than most. The others miss the sky, and I never saw that much of it. A good dry gallery with a lamp and the sound of picks is as near to peace as I know. Mind, these aren't mine workings. Somebody built these, and it wasn't for ore." } },
      choices = {
        { text = "What were they built for?", next = "under2" },
        { text = "Not all of this is sewer, then.", next = "under2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    under2 = {
      lines = { { id = "under2_1", text = "The upper rings are sewer and crypt, built for the kings. Below that there's older stone, and it's cut a different way. The joints are finer than anything a human mason ever managed. Brom says dwarves. I've seen dwarf work, and I'm not so sure." } },
      choices = {
        { text = "Older than the kingdom itself.", next = "BACK", reply = "Aye. Folk build on top of things. I've stopped being surprised at what's under.", fx = { affinity = 1 } },
        { text = "Old stone is only stone.", next = "BACK", reply = "So I tell the apprentices. Then I send them down in pairs." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    brom = {
      lines = { { id = "brom_1", text = "Since we were sixteen, in the Alterac silver workings. He reads rock like print, and I'm the one who keeps count of the props and the air. We went under a roof fall together, the year before the plague, and dug each other out. After that, dying felt like a thing we'd rehearsed." } },
      choices = {
        { text = "What ore is there to find near the city?", next = "ore" },
        { text = "And you woke together as well?", next = "brom2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    brom2 = {
      lines = { { id = "brom2_1", text = "Near enough. He was up a day before me, and he'd dug down to my box with a coffin lid by the time I opened my eyes. First thing he said was that the soil was good loam and easy going. That's Brom. He'll tell you what the ground's like at his own wedding." } },
      choices = {
        { text = "That's a marriage that holds.", next = "BACK", reply = "It's held through worse than death, love." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    shut = {
      big = true,
      lines = { { id = "shut_1", text = "Three that I know of. The apothecaries have walled one and posted an abomination. One floods. And one Brom and I found ourselves, behind the lowest forge drain, that goes down further than our rope. There was a draught coming up it, warm. I bricked it shut and told nobody. Was I wrong?" } },
      choices = {
        { text = "No. Some doors are best left bricked.", next = "BACK", reply = "That's what my gut said, and my gut's kept me alive in the dark for forty years.", fx = { align = { order = 1 } } },
        { text = "Yes. I'd want to know what's down there.", next = "BACK", reply = "Would you? Then you've never smelled warm air in a place it shouldn't be.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    leave = {
      lines = { { id = "leave_1", text = "Does it? I'd hoped so. I only say \"by your leave\" and tap the wall twice. It's what my gran did at the pit head, and she said it was for luck. Maybe it was the same thing all along, and we'd just forgotten who we were asking." } },
      choices = {
        { text = "The old ways remember more than we do.", next = "BACK", reply = "They do. I'll keep tapping." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    ore = {
      lines = { { id = "ore_1", text = "Copper in the Tirisfal hills, plenty of it, and tin by the coast. For iron you go to Silverpine or Hillsbrad, and you go armed. There's silver in Alterac still, where we used to work, but the ogres have the old shafts and the Syndicate have the roads." } },
      choices = {
        { text = "Copper first, then.", next = "BACK", reply = "Aye, start with copper. Nobody ever died of starting small." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We're a buried people who got back up. A miner understands that better than most." } },
    advice = { { id = "tp_advice", text = "Two lamps, and never dig alone. I'll say it to every customer till the roof falls in." } },
    alterac = { { id = "tp_alterac", text = "Good silver, bad lords. They sold us to the Horde and we were the ones who went hungry for it." } },
    lordaeron = { { id = "tp_lordaeron", text = "We came down from Alterac for work when the mines there shut. It was a kind country to strangers." } },
    sylvanas = { { id = "tp_sylvanas", text = "She put a roof over us, in the most literal way. I'll not complain of the landlady." } },
    _none = { { id = "tp_none", text = "Don't know, love. If it's not under the ground, I've likely missed it." } },
  },
}

---------------------------------------------------------------------------
-- Auctioneer Cain: the loudest auctioneer of the ring; misses the gavel and the crowd.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_cain", id = TODO_NPC("Auctioneer Cain"), name = "Auctioneer Cain", title = "Auctioneer",
  bible = "bibles/more_folk.md", role = "auctioneer", tier = "service",
  communities = { "undercity" }, temper = { "booming", "theatrical" }, values = { "profit", "showmanship" },
  notices = { "purse", "class" },
  impression = {
    first = "Auctioneer Cain runs a stand on the ring between the Trade Quarter and the canals, and he has a voice built for a hall three times the size. He called livestock auctions in life and clearly misses a crowd that bids out loud.",
    third = "{name} met Auctioneer Cain, one of the auctioneers of the Undercity.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! You're one of the few who pays fair and talks civil, and I don't forget it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
    { id = "g_1", text = "Step up, step up! What am I bid? Forgive me, that's habit. What can I do for you?" },
    { id = "g_2", when = { money = { min = 1000000 } }, text = "Now there's a purse with ambitions. Come to the front, friend, the good lots are wasted on the back row." },
    { id = "g_3", when = { metBefore = true }, text = "A returning bidder! I knew you by your hesitation. You nearly had that last lot, you know." },
  },

  notice = {
    { id = "n_1", cat = "purse", when = { money = { max = 5000 } },
      text = "Light in the pocket today. Never mind. Sell before you buy, friend. Everyone's attic has one thing somebody else wants." },
    { id = "n_2", cat = "class", when = { class = "HUNTER" },
      text = "You've pelts on you, and good ones. Don't let the skinners have them cheap. List them here, and let the tailors and leatherworkers fight it out." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Auctioneer Cain, at your service and anybody's. You bring me what you'd sell, you name a price to start, and the whole Horde gets a chance to outbid its neighbour. The house takes a small cut, and I take the pleasure of it." },
        { id = "hello_2", when = { metBefore = true }, text = "Auctioneer Cain! You know how it's done. A deposit down, a price named, and patience. Mostly patience." },
      },
      again = {
        { id = "hello_a1", text = "What else? Going once." },
        { id = "hello_a2", text = "Go on, I've a moment between lots." },
        { id = "hello_a3", text = "Yes, friend?" },
      },
      choices = {
        { text = "I'd like to see the auctions.", next = "BUSINESS" },
        { text = "You've a voice for a bigger hall.", next = "voice" },
        { text = "What sells best in the Undercity?", next = "lots" },
        { text = "There are a great many auctioneers on this ring.", next = "seven" },
        { text = "Who pays most for good pelts?", next = "pelts", when = { class = "HUNTER" } },
        { text = "I'll bid another day.", next = "END" },
      },
    },
    voice = {
      lines = { { id = "voice_1", text = "I had the cattle ring at Andorhal, every market day for twenty years. Four hundred farmers, all shouting, and I could be heard at the back over a bull. Here it's all slips of paper and sealed bids. The trade's the same, but it's gone very quiet." } },
      choices = {
        { text = "You miss the shouting.", next = "voice2" },
        { text = "Paper bids are more orderly, surely.", next = "voice2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    voice2 = {
      lines = { { id = "voice2_1", text = "I miss a room deciding something together. You'd feel a price climb, like weather coming in. Two men who'd never spoken, bidding each other up over a heifer out of pure dislike. There's no dislike in a slip of paper. I call the big lots aloud anyway, to nobody." } },
      choices = {
        { text = "I'd have liked to hear the cattle ring.", next = "BACK", reply = "You'd have gone home with a cow you didn't want. Everyone did.", fx = { affinity = 1 } },
        { text = "The dead don't need theatre.", next = "BACK", reply = "The dead need it more than anybody, friend. What else have we got?" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    lots = {
      lines = { { id = "lots_1", text = "Cloth, by the bale, since half the city's bandaging the other half. Herbs for the apothecaries, who never bid against each other and so I suspect collusion. And anything enchanted goes in an hour. The slowest thing I ever sold was a wedding dress." } },
      choices = {
        { text = "Did the wedding dress sell in the end?", next = "lots2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    lots2 = {
      big = true,
      lines = { { id = "lots2_1", text = "After a month. A deathguard bought it, a big silent woman, for the starting price. She comes past the stand in her armour every week and never says a word about it. I've wanted to ask what she did with it. Ought I to?" } },
      choices = {
        { text = "No. Some purchases are private.", next = "BACK", reply = "You're right. An auctioneer sells the lot, and the reason isn't his.", fx = { align = { honor = 1 } } },
        { text = "Ask her. I'd want to know.", next = "BACK", reply = "So would I! I'll do it Friday, and if she flattens me, it's on your head.", fx = { align = { honor = -1 } } },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    seven = {
      lines = { { id = "seven_1", key = true, text = "Seven of us, and one hall's worth of goods between us, so it doesn't matter whose stand you use. Yarly's the quiet one, Epitwee's the quick one, and Naxxremis frightens people. I'm the loud one, in case that had escaped you." } },
      choices = {
        { text = "Why does Naxxremis frighten people?", next = "seven2" },
        { text = "It hadn't.", next = "BACK", reply = "Good! Then the voice still carries." },
        { text = "Something else.", next = "BACK" },
      },
    },
    pelts = {
      lines = { { id = "pelts_1", text = "The leatherworkers, on the first day of the week, when Arthur Moore sends his list round. List heavy hides on a Sunday night and you'll have three of them bidding by Monday noon. Never sell to the first offer. The first offer is only somebody testing whether you're tired." } },
      choices = {
        { text = "Sunday night. I'll remember.", next = "BACK", reply = "Do. And start low. A low start draws a crowd." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    seven2 = {
      lines = { { id = "seven2_1", text = "She was a bailiff, friend, and she's never stopped. I once watched her read the terms to a grown orc until he apologised. But I'll say this for her: in all my years on the ring, nobody's been cheated at her stand, buyer or seller, and I can't swear the same of every hall I've worked." } },
      choices = {
        { text = "Fear has its uses in a market.", next = "BACK", reply = "It keeps the thumbs off the scales, I'll give it that." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "A fine market. We want everything we had before, and we've all eternity to bid for it." } },
    advice = { { id = "tp_advice", text = "Never bid angry, and never bid thirsty. I've made my living off both." } },
    lordaeron = { { id = "tp_lordaeron", text = "Andorhal on market day. Don't ask me, friend. I could still call you the price of barley." } },
    goblins = { { id = "tp_goblins", text = "They taught the Horde to auction, and they take a cut of the cut. I admire the nerve." } },
    sylvanas = { { id = "tp_sylvanas", text = "I've never had a lot from the Royal Quarter. I'd call it in my best voice if I did." } },
    _none = { { id = "tp_none", text = "No bids on that one from me, friend. Try another stand." } },
  },
}

---------------------------------------------------------------------------
-- Auctioneer Epitwee: the fastest of the ring's auctioneers; does sums before the customer finishes speaking.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_epitwee", id = TODO_NPC("Auctioneer Epitwee"), name = "Auctioneer Epitwee", title = "Auctioneer",
  bible = "bibles/more_folk.md", role = "auctioneer", tier = "service",
  communities = { "undercity" }, temper = { "quick", "impatient" }, values = { "efficiency", "profit" },
  notices = { "purse", "profession" },
  impression = {
    first = "Auctioneer Epitwee works a stand on the Undercity's ring and finishes most people's sentences for them, usually with a number. She is quick and impatient and visibly pained by anyone who has not decided what they want.",
    third = "{name} met Auctioneer Epitwee, one of the auctioneers of the Undercity.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you, friend. I've been keeping an eye out for things you might want." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
    { id = "g_1", text = "Buying or selling? Quickly, please, since there's a queue even when there isn't." },
    { id = "g_2", when = { profession = { "Herbalism", "Mining", "Skinning" } }, text = "A gatherer. Good. You'll be selling. Stacks of twenty, priced by the stack, and don't round up." },
    { id = "g_3", when = { metBefore = true }, text = "You again. You took four minutes last time. Let's aim for three." },
  },

  notice = {
    { id = "n_1", cat = "purse", when = { money = { min = 1000000 } },
      text = "You've coin and you're dithering. Coin sitting in a purse earns nothing. Buy something or sell something." },
    { id = "n_2", cat = "profession", when = { profession = { "Herbalism", "Mining" } },
      text = "Your bags are full and unsorted. Sort before you reach the stand. I can't price a jumble." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Auctioneer Epitwee. You list, they bid, the house takes its share, the rest is yours. That's the whole of it. If you've a question that isn't answered by that, ask it briskly." },
        { id = "hello_2", when = { metBefore = true }, text = "Epitwee. You know the terms. What are we doing today?" },
      },
      again = {
        { id = "hello_a1", text = "Next question." },
        { id = "hello_a2", text = "Yes? Briefly." },
        { id = "hello_a3", text = "Go on, then." },
      },
      choices = {
        { text = "Show me the listings.", next = "BUSINESS" },
        { text = "Why the hurry? You have forever.", next = "hurry" },
        { text = "How do I price what I sell?", next = "price" },
        { text = "How do you rate the other auctioneers?", next = "others" },
        { text = "Why stacks of twenty?", next = "stacks", when = { profession = { "Herbalism", "Mining", "Skinning" } } },
        { text = "Done. Good day.", next = "END" },
      },
    },
    hurry = {
      lines = { { id = "hurry_1", text = "That's exactly the mistake. Everyone down here thinks forever means there's no rush, so nothing gets done, and the city silts up. I decided when I woke that I'd treat every day as if it were short. Somebody has to keep the pace." } },
      choices = {
        { text = "That's a discipline, in its way.", next = "hurry2" },
        { text = "What was your trade before?", next = "hurry2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurry2 = {
      lines = { { id = "hurry2_1", text = "Clerk at the exchange in the capital. Grain futures. Forty contracts an hour, on a good day, and the bell at noon. There's no bell here. I had Graham Van Talen build me a small one, and I ring it for myself." } },
      choices = {
        { text = "A bell of your own. I respect that.", next = "BACK", reply = "Thank you. It rings in six minutes.", fx = { affinity = 1 } },
        { text = "You could try slowing down.", next = "BACK", reply = "I tried it for a week once. I counted ceiling stones. Never again." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    price = {
      lines = { { id = "price_1", text = "Look at what's listed. Go a hair under the lowest, if you want it gone today. Go level, if you can wait. Never go over and hope, because hope isn't a price. And set a buyout. Half the Horde can't be troubled to bid." } },
      choices = {
        { text = "When is the best hour to list?", next = "price3" },
        { text = "And if nobody buys at all?", next = "price2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    price2 = {
      lines = { { id = "price2_1", text = "Then you were wrong about what it's worth, and you've lost your deposit learning so. That's the cheapest lesson this stand offers. Cut the price by a tenth and list again. The market isn't insulting you. It doesn't know you exist." } },
      choices = {
        { text = "That's bracing advice.", next = "BACK", reply = "It's accurate. Bracing is extra." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    others = {
      big = true,
      lines = { { id = "others_1", key = true, text = "Cain talks. Yarly thinks. Leeka chats with the customers as if they were guests. I've timed them. I clear half again as many lots as any of them. They say I'm rude. I say I'm respecting the customer's time. Which is it?" } },
      choices = {
        { text = "Respect. Time is the one thing worth saving.", next = "BACK", reply = "Precisely. You may come to the front of my queue.", fx = { align = { order = 1 } } },
        { text = "Rude. People aren't lots to be cleared.", next = "BACK", reply = "Hm. That's Leeka's line. She clears fewer lots.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stacks = {
      lines = { { id = "stacks_1", text = "Because a crafter needs twenty, or forty, or sixty, and can do the sum in their head. List seventeen and they have to think, and a buyer who has to think moves on to the next line. Make it easy to buy, and it gets bought." } },
      choices = {
        { text = "Easy to buy. Understood.", next = "BACK", reply = "Good. That took under a minute. You're improving." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    price3 = {
      lines = { { id = "price3_1", text = "Evening, when the zeppelin's in and the crafters have closed their stalls. They buy for the next day's work, and they're tired, and tired buyers use the buyout. Morning listings sit all day being undercut by people with nothing better to do." } },
      choices = {
        { text = "Evening. Noted.", next = "BACK", reply = "Good. Don't thank me, list something." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "Too slow, most of us. Death's made the whole nation unpunctual." } },
    advice = { { id = "tp_advice", text = "Decide before you reach the stand. Dithering costs you, and it costs the one behind you." } },
    goblins = { { id = "tp_goblins", text = "The only people who keep proper time. I'd hire one, if they came cheaper." } },
    lordaeron = { { id = "tp_lordaeron", text = "The exchange bell at noon. I can still hear it. That's all I miss, and I've replaced it." } },
    sylvanas = { { id = "tp_sylvanas", text = "She decides quickly and doesn't revisit it, and I approve of that more than I can say." } },
    _none = { { id = "tp_none", text = "No, and that's the whole of my answer, so who's next?" } },
  },
}

---------------------------------------------------------------------------
-- Auctioneer Leeka: the ring's friendliest auctioneer; treats every lot as news.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_leeka", id = TODO_NPC("Auctioneer Leeka"), name = "Auctioneer Leeka", title = "Auctioneer",
  bible = "bibles/more_folk.md", role = "auctioneer", tier = "service",
  communities = { "undercity" }, temper = { "sociable", "nosy" }, values = { "community", "gossip" },
  notices = { "race", "purse" },
  impression = {
    first = "Auctioneer Leeka runs a stand on the Undercity's ring and treats every listing as a piece of news about its owner. She is sociable and nosy, and she knows who is selling their sword and who has started buying silk.",
    third = "{name} met Auctioneer Leeka, one of the auctioneers of the Undercity.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! You're one of the few who pays fair and talks civil, and I don't forget it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
    { id = "g_1", text = "Hello, you! Come and lean on the stand and tell me what you're after. I've had nobody interesting all morning." },
    { id = "g_2", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Ooh, one of the living. You'll have things from across the sea in those bags, I shouldn't wonder. Do let me see." },
    { id = "g_3", when = { metBefore = true }, text = "There you are! I was only wondering how you got on with that last lot." },
  },

  notice = {
    { id = "n_1", cat = "race", when = { race = "Troll" },
      text = "Is that a real tusk ring? Gold? Don't ever sell it, but if you do, sell it through me." },
    { id = "n_2", cat = "purse", when = { money = { max = 5000 } },
      text = "You're selling, I think, and you'd rather not be. It's all right. Half my best lots are things people would rather have kept." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Auctioneer Leeka. I take in what people want rid of and find it somebody who wants it, and I do love to know the story in between. You can use any stand on the ring, but mine's the one where you'll be asked how you are." },
        { id = "hello_2", when = { metBefore = true }, text = "Leeka, as ever. Lean in, I've had a lot come through this week you'll not believe, and I can't tell you whose it was, so I'll only hint heavily." },
      },
      again = {
        { id = "hello_a1", text = "What else? I'm in no rush." },
        { id = "hello_a2", text = "Go on, I'm all ears. Well, one and a half." },
        { id = "hello_a3", text = "Yes, dear?" },
      },
      choices = {
        { text = "Let me see the auctions.", next = "BUSINESS" },
        { text = "You read news in the listings?", next = "news" },
        { text = "What came through this week?", next = "hint" },
        { text = "Epitwee says you clear fewer lots than she does.", next = "epitwee", when = { heardLine = "uc_epitwee.others_1" } },
        { text = "What sells from across the sea?", next = "sea", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "I'll be back, Leeka.", next = "END" },
      },
    },
    news = {
      lines = { { id = "news_1", text = "It's better than a town crier. When a deathguard lists her spare armour, she's been promoted or she's leaving. When an apothecary buys silk, he's courting, or he's got a new filter in mind. And when the same necklace comes through three times in a month, somebody's marriage is in a state." } },
      choices = {
        { text = "Who are your regulars?", next = "regulars" },
        { text = "Whose necklace?", next = "news2" },
        { text = "That's a great deal to know about your neighbours.", next = "news2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    news2 = {
      lines = { { id = "news2_1", text = "I never say whose. That's the rule. I hint, and people guess, and they're usually wrong, which keeps it harmless. Tawny Grisette guessed right once, and I had to give her a week's free listings to look surprised." } },
      choices = {
        { text = "Harmless gossip keeps a town together.", next = "BACK", reply = "That's just what I say! It's the mortar, dear.", fx = { affinity = 1 } },
        { text = "Gossip has a way of turning harmful.", next = "BACK", reply = "I know. That's why I only hint. Mostly." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    hint = {
      big = true,
      lines = { { id = "hint_1", text = "A set of child's clothes, never worn, and with them a silver rattle. Listed low, by someone who paid the deposit in exact coin and didn't look at me. I've not put it up yet. I can't decide if selling it is a kindness or a trespass. What would you do?" } },
      choices = {
        { text = "Sell it. They asked you to let it go.", next = "BACK", reply = "Yes. Yes, you're right. It's their choice, and I'm only the stand.", fx = { align = { order = 1 } } },
        { text = "Hold it a week. They may come back for it.", next = "BACK", reply = "That's what I've been doing. I'll give it till the new moon.", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    epitwee = {
      lines = { { id = "epitwee_1", text = "She's counted, has she? Of course she has. It's true, and I don't mind. She clears lots, and I keep customers. The ones she's hurried come along to me the next week, a bit flustered, and I ask after their mother." } },
      choices = {
        { text = "There's room for both ways.", next = "BACK", reply = "There is. Don't tell her I said so, she'd time it." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    sea = {
      lines = { { id = "sea_1", text = "Anything with colour in it. Kalimdor silks, troll beads, those tauren blankets with the red weave. We've gone grey down here, dear, and people will pay silly money for a bit of orange. I had two Forsaken bid a whole gold over a kodo-hide drum, and neither can play." } },
      choices = {
        { text = "Why would the dead want a drum?", next = "sea2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sea2 = {
      lines = { { id = "sea2_1", text = "To own something that came from under a sun, I think. It sits in a crypt somewhere, I expect, with a candle by it. One of them brings it out on feast days and taps it, very badly. I've heard him. It's the nicest sound in the quarter." } },
      choices = {
        { text = "Then the drum found a good home.", next = "BACK", reply = "I think so too. I do like it when a lot lands well." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    regulars = {
      lines = { { id = "regulars_1", text = "Tawny Grisette, for one, who never buys and never sells and comes for the talk. Jonathan Chambers lists his slow bags with me. And there's a deathguard off the Bulwark who sells one Scourge trinket a week and sends the coin to an orphanage in Orgrimmar, of all places." } },
      choices = {
        { text = "A deathguard with a soft heart.", next = "BACK", reply = "Don't let on I told you. He thinks nobody's worked it out." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "Lonely, most of us, and too proud to say so. That's why they come and lean on my stand." } },
    advice = { { id = "tp_advice", text = "Ask after people. It costs nothing, and you'd be amazed what you get back." } },
    lordaeron = { { id = "tp_lordaeron", text = "I kept the notice board in a market town. Births, deaths, lost cats. I've only changed the board." } },
    sylvanas = { { id = "tp_sylvanas", text = "Nothing of hers has ever come through an auction, and I'd know. Whatever she has, she keeps." } },
    goblins = { { id = "tp_goblins", text = "The ones in Orgrimmar send me the oddest lots. I think they do it to see my face." } },
    _none = { { id = "tp_none", text = "Haven't heard a word about that. Isn't it maddening? Tell me if you do." } },
  },
}

---------------------------------------------------------------------------
-- Auctioneer Naxxremis: the ring's stern auctioneer; never forgets a failed deposit.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_naxxremis", id = TODO_NPC("Auctioneer Naxxremis"), name = "Auctioneer Naxxremis", title = "Auctioneer",
  bible = "bibles/more_folk.md", role = "auctioneer", tier = "service",
  communities = { "undercity" }, temper = { "cold", "exacting" }, values = { "order", "justice" },
  notices = { "purse", "class" },
  impression = {
    first = "Auctioneer Naxxremis keeps a stand on the Undercity's ring and frightens most of her customers into perfect paperwork. She was a magistrate's bailiff in life and regards a contract as the nearest thing left to law.",
    third = "{name} met Auctioneer Naxxremis, one of the auctioneers of the Undercity.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you, friend. I've been keeping an eye out for things you might want." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The prices are what they are, and I'm not in a haggling mood." },
    { id = "g_1", text = "State your business plainly, and have your deposit in your hand when you do." },
    { id = "g_2", when = { metBefore = true }, text = "You have dealt here before. Your account is in order. See that it remains so." },
    { id = "g_3", when = { money = { max = 3000 } }, text = "You have barely the price of a deposit. I advise you to be very sure of what you list." },
  },

  notice = {
    { id = "n_1", cat = "purse", when = { money = { min = 1000000 } },
      text = "Wealth does not exempt you from the terms. I mention it because the wealthy so often suppose otherwise." },
    { id = "n_2", cat = "class", when = { class = "ROGUE" },
      text = "Keep your hands above the stand. I have recovered goods from quicker fingers than yours, and I recovered the fingers with them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Auctioneer Naxxremis. The terms are these: a deposit, forfeit if your lot fails; a fee from the sale; payment in full, at once, from the winning bid. I did not write the terms. I see them kept." },
        { id = "hello_2", when = { metBefore = true }, text = "Naxxremis. You know the terms, and you have kept them so far. Proceed." },
      },
      again = {
        { id = "hello_a1", text = "Is there more?" },
        { id = "hello_a2", text = "Continue." },
        { id = "hello_a3", text = "Speak." },
      },
      choices = {
        { text = "Show me the listings.", next = "BUSINESS" },
        { text = "You speak like an officer of the court.", next = "law" },
        { text = "What becomes of failed deposits?", next = "fail" },
        { text = "Does anyone try to cheat the auction?", next = "cheats" },
        { text = "You'd take a thief's fingers?", next = "fingers", when = { class = "ROGUE" } },
        { text = "My account is in order. Farewell.", next = "END" },
      },
    },
    law = {
      lines = { { id = "law_1", text = "I was bailiff to the magistrate of Brill for nineteen years. I served writs and seized goods and saw sentences carried out. When I rose there was no magistrate and no court, and I found the auction house was the one place left with rules that bound everyone alike." } },
      choices = {
        { text = "The auction is your courtroom now.", next = "law2" },
        { text = "A people needs more law than a market's.", next = "law2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    law2 = {
      big = true,
      lines = { { id = "law2_1", text = "It needs it, and it has not got it. The Dark Lady's word is law, and beneath that there is only the strong and the useful. At this stand an orc, a tauren and a risen beggar pay the same fee to the copper. I call that justice of a small sort. Do you?" } },
      choices = {
        { text = "Yes. Equal terms are where justice begins.", next = "BACK", reply = "Then you understand why I will not bend them, for anyone.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "No. Fees aren't justice. Mercy matters more.", next = "BACK", reply = "Mercy is a magistrate's luxury. I was only ever the bailiff.", fx = { align = { order = -1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    fail = {
      lines = { { id = "fail_1", text = "They go to the house, and from the house to the Royal Quarter's treasury, less our keep. I enter each in a book with the date and the name. People say I never forget a failed deposit. They are mistaken only in thinking I rely on memory." } },
      choices = {
        { text = "Has anyone ever talked you out of a forfeit?", next = "fail2" },
        { text = "The book forgets nothing.", next = "BACK", reply = "It does not, and unlike me it cannot be argued with." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    cheats = {
      lines = { { id = "cheats_1", text = "Weekly. They list a full stack and deliver nineteen. They bid, win, and plead poverty. A goblin once sold the same ring from three stands at once. I do not grow angry. I refer to the terms, and then I refer to Sergeant Rutger of the deathguard." } },
      choices = {
        { text = "What became of the goblin?", next = "cheats2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    cheats2 = {
      lines = { { id = "cheats2_1", text = "He paid each buyer in full, with a tenth over for the inconvenience, and he paid the house three forfeits. Then he thanked me. He said it was the first time in his career anyone had read his own small print back to him." } },
      choices = {
        { text = "You earned a goblin's respect. That's rare.", next = "BACK", reply = "I earned his compliance. The respect was his own affair." },
        { text = "Something else.", next = "BACK" },
      },
    },
    fingers = {
      lines = { { id = "fingers_1", text = "I would recover the goods. If the fingers are closed around them at the time, that is the thief's decision and not mine. I have never yet needed a second visit to the same hand." } },
      choices = {
        { text = "Then I'll keep mine to myself.", next = "BACK", reply = "That is the correct conclusion, and you reached it quickly. I note it in your favour." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    fail2 = {
      lines = { { id = "fail2_1", text = "One. A woman newly risen, who had listed her wedding ring at ten times its worth, not knowing how the house worked. The lot failed. The terms said forfeit. I paid her deposit back out of my own purse and entered it as received. The book is correct, and so, I think, was I." } },
      choices = {
        { text = "That was mercy, bailiff.", next = "BACK", reply = "It was bookkeeping. I will thank you to describe it so." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "A nation without a statute book. It troubles me more than the rot does." } },
    advice = { { id = "tp_advice", text = "Read the terms before you sign. No one does, and it is the whole of my work." } },
    lordaeron = { { id = "tp_lordaeron", text = "It had courts. Slow, pompous, and fair more often than not. I did not value them enough." } },
    sylvanas = { { id = "tp_sylvanas", text = "Her word is law. I serve it. I should prefer that it were written down." } },
    goblins = { { id = "tp_goblins", text = "They honour a contract to the letter and nowhere else. I can work with that." } },
    _none = { { id = "tp_none", text = "That is outside my jurisdiction." } },
  },
}

---------------------------------------------------------------------------
-- Auctioneer Rhyker: a tired, dry-humoured auctioneer who has seen every bad listing there is.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_rhyker", id = TODO_NPC("Auctioneer Rhyker"), name = "Auctioneer Rhyker", title = "Auctioneer",
  bible = "bibles/more_folk.md", role = "auctioneer", tier = "service",
  communities = { "undercity" }, temper = { "sardonic", "weary" }, values = { "honesty", "endurance" },
  notices = { "purse", "race" },
  impression = {
    first = "Auctioneer Rhyker works a stand on the Undercity's ring and has the patience of someone who has explained deposits ten thousand times. She is sardonic, a little weary, and more helpful than she pretends to be.",
    third = "{name} met Auctioneer Rhyker, one of the auctioneers of the Undercity.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you, friend. I've been keeping an eye out for things you might want." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
    { id = "g_1", text = "Yes, this is the auction house. No, I can't tell you what it's worth. Yes, there's a deposit." },
    { id = "g_2", when = { metBefore = true }, text = "Oh, it's you. You're one of the ones who reads the listings first, so I've less to sigh about." },
    { id = "g_3", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Welcome to the Undercity. The smell is the canal, the screaming is the Apothecarium, and the auction is here." },
  },

  notice = {
    { id = "n_1", cat = "purse", when = { money = { max = 5000 } },
      text = "Before you ask, no, you can't list on credit. I can see the question forming." },
    { id = "n_2", cat = "race", when = { race = "Orc" },
      text = "An orc. You lot at least say what you want and then stop talking. You've no idea how I value that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Auctioneer Rhyker. I've been asked the same four questions every hour since this stand opened, so let me save us both the bother. Deposit, yes. Fee, yes. Refunds, no. And I've no idea why it didn't sell." },
        { id = "hello_2", when = { metBefore = true }, text = "Rhyker. Go on, then. You're not the worst I get." },
      },
      again = {
        { id = "hello_a1", text = "What else? I've heard it before, but go on." },
        { id = "hello_a2", text = "Mm?" },
        { id = "hello_a3", text = "Ask. I'm braced." },
      },
      choices = {
        { text = "Show me the auctions.", next = "BUSINESS" },
        { text = "What do people ask you most?", next = "four" },
        { text = "What's the worst listing you've seen?", next = "worst" },
        { text = "You seem tired of the work.", next = "why" },
        { text = "We say it and stop. Talk wastes daylight.", next = "orc", when = { race = "Orc" } },
        { text = "No more questions. Farewell.", next = "END" },
      },
    },
    four = {
      lines = { { id = "four_1", text = "\"What's this worth?\" As if I'd tell them, and not buy it myself. \"Why didn't it sell?\" Because you asked a gold for a cracked buckler. \"Can I have my deposit back?\" No. And my favourite, \"Is this the bank?\" There are four bankers, in a booth, with a sign." } },
      choices = {
        { text = "Do people truly mistake you for the bank?", next = "bank" },
        { text = "And yet you answer them.", next = "four2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    four2 = {
      lines = { { id = "four2_1", text = "Every time. I sigh first, that's my fee. Then I tell them the price is whatever the next fool pays, and that the bank is behind them. Nobody else on this ring will tell a beginner the truth. Cain sells them a dream and Epitwee sells them a stopwatch." } },
      choices = {
        { text = "You're kinder than you let on.", next = "BACK", reply = "Keep your voice down. I've a reputation.", fx = { affinity = 1 } },
        { text = "A sigh is a poor welcome.", next = "BACK", reply = "It's an honest one. They'll get worse from the market." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    worst = {
      lines = { { id = "worst_1", text = "A man listed his own left arm. It had come off at the Bulwark and he thought an apothecary might want it. Starting bid, four silver. I told him it was against the terms. He asked which term. I had to go and look." } },
      choices = {
        { text = "Was there a term against it?", next = "worst2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    worst2 = {
      lines = { { id = "worst2_1", text = "No. So I listed it. It sold in an hour, to a bidder I shan't name, for nine silver. He was very pleased. He's since asked about the other one, and I've told him to think carefully." } },
      choices = {
        { text = "The Undercity never disappoints.", next = "BACK", reply = "It never does. It only lowers what you expect." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    why = {
      big = true,
      lines = { { id = "why_1", text = "I'm tired of people, not of the work. The work's clean. A thing has a price, or it hasn't. People want it to mean something as well, that they were clever, or cheated, or lucky. I keep telling them it's only a number. Am I wrong to?" } },
      choices = {
        { text = "No. Tell them the truth, even if it stings.", next = "BACK", reply = "Good. I'll go on sighing with a clear conscience.", fx = { align = { honor = 1 } } },
        { text = "Yes. Let them have their small victories.", next = "BACK", reply = "Hm. Leeka says that too. Perhaps I'll let one of them feel clever, on Fridays.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc = {
      lines = { { id = "orc_1", text = "I could weep for joy, if I'd still the means. An orc comes up, says \"sell this,\" puts down the deposit, and leaves. It's like a cool cloth on the forehead." } },
      choices = {
        { text = "Then sell this, Rhyker.", next = "BACK", reply = "Ha. Deposit first. There, you see? Lovely." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    bank = {
      lines = { { id = "bank_1", text = "Daily. I've pointed at the Montagues so often my arm's grown used to the position. William Montague sends me a candle every Winter Veil by way of apology. I send him back a list of everyone who asked, in order, with the hour." } },
      choices = {
        { text = "That's almost a friendship.", next = "BACK", reply = "It's a correspondence. In this city that's as near as makes no odds." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We complain a great deal, for people with nothing left to lose. I include myself." } },
    advice = { { id = "tp_advice", text = "It's worth what somebody pays. That's all the wisdom I've got, and it's free." } },
    lordaeron = { { id = "tp_lordaeron", text = "I sold tickets at a theatre. Same questions. \"Is this the play?\" Yes. It was always the play." } },
    goblins = { { id = "tp_goblins", text = "They invented the deposit. I'd thank them, but they'd charge me." } },
    sylvanas = { { id = "tp_sylvanas", text = "She's never once asked me what anything's worth. A woman who knows her own mind." } },
    _none = { { id = "tp_none", text = "Not a clue. And no, that isn't the bank either." } },
  },
}

---------------------------------------------------------------------------
-- Auctioneer Tricket: the ring's magpie auctioneer; loves the rare lots and bids on them herself.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_tricket", id = TODO_NPC("Auctioneer Tricket"), name = "Auctioneer Tricket", title = "Auctioneer",
  bible = "bibles/more_folk.md", role = "auctioneer", tier = "service",
  communities = { "undercity" }, temper = { "bright", "acquisitive" }, values = { "novelty", "profit" },
  notices = { "profession", "purse" },
  impression = {
    first = "Auctioneer Tricket runs a stand on the Undercity's ring and cannot hide her delight when something rare comes across it. She has an eye like a magpie's, and it is an open secret that she bids on her own favourite lots.",
    third = "{name} met Auctioneer Tricket, one of the auctioneers of the Undercity.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. For a regular like you, I'll find the better stock from the back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The prices are what they are, and I'm not in a haggling mood." },
    { id = "g_1", text = "Ooh, what have you brought me? Is it shiny? Do say it's shiny." },
    { id = "g_2", when = { profession = { "Enchanting", "Engineering", "Alchemy" } }, text = "A maker of things! You're my favourite kind. What's in the bag? I'll tell you in a breath whether it's rare." },
    { id = "g_3", when = { metBefore = true }, text = "You're back! Have you found anything odd since? You've the look of someone who finds odd things." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Enchanting" },
      text = "There's something in your pack humming. A wand? No, don't tell me, let me guess. Lesser magic, oak core. Am I close?" },
    { id = "n_2", cat = "purse", when = { money = { min = 1000000 } },
      text = "Now that's a purse that could outbid me. I'll have to be careful which lots I point out to you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Auctioneer Tricket! You list, they bid, the house takes a nibble. That's the dull part. The good part is that every strange and lovely thing in the Horde passes over this stand sooner or later, and I get to hold it first." },
        { id = "hello_2", when = { metBefore = true }, text = "Tricket, yes! Come and see. There's a lot up today that I've been turning over all morning, and I oughtn't to tell you which, so I shan't. It's the third one down." },
      },
      again = {
        { id = "hello_a1", text = "What else? Anything rare?" },
        { id = "hello_a2", text = "Go on, I'm listening with one eye on the listings." },
        { id = "hello_a3", text = "Yes, yes?" },
      },
      choices = {
        { text = "Show me the listings.", next = "BUSINESS" },
        { text = "What's the rarest thing you've handled?", next = "rare" },
        { text = "They say you bid on your own lots.", next = "own" },
        { text = "How do you tell rare from common?", next = "eye" },
        { text = "Lesser magic, yes. How did you know?", next = "wand", when = { profession = "Enchanting" } },
        { text = "I'll bring you something shiny.", next = "END" },
      },
    },
    rare = {
      lines = { { id = "rare_1", text = "A music box out of Stratholme, the size of a walnut, that played a tune nobody in the hall could name. The enamel was perfect. It went for forty gold to a bidder in Orgrimmar, and I held it for the whole two days and wound it every hour." } },
      choices = {
        { text = "You'd have liked to keep it.", next = "rare2" },
        { text = "Forty gold for a walnut that sings.", next = "rare2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rare2 = {
      lines = { { id = "rare2_1", text = "I bid thirty-eight. I haven't got forty, I've never had forty. I think about it most days. Some orc has it on a shelf between two skulls and winds it for his children, and I've decided that's a good end for it. I've nearly decided." } },
      choices = {
        { text = "It's being heard. That's what it was for.", next = "BACK", reply = "Yes. Yes, that's the right way to think of it. Thank you.", fx = { affinity = 1 } },
        { text = "You should never fall for the stock.", next = "BACK", reply = "I know. I do it weekly. It's why I took the job." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    own = {
      big = true,
      lines = { { id = "own_1", text = "Who says? Leeka. It's Leeka. Well, it's true. There's no term against it, I asked Naxxremis, and she looked for an hour. I pay the same as anyone. But I do see the lots first. Is that cheating, do you think?" } },
      choices = {
        { text = "No. You pay fair coin like anyone else.", next = "BACK", reply = "That's what I say! And I lose more often than I win, which surely proves it.", fx = { align = { honor = -1 } } },
        { text = "Yes. First sight is an unfair edge.", next = "BACK", reply = "Oh. Hm. I suppose it is, a bit. I could wait an hour before bidding. A quarter hour.", fx = { align = { honor = 1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    eye = {
      lines = { { id = "eye_1", text = "Weight, first. Real things are heavier than they look and fakes are lighter. Then the wear. A thing that's been loved is worn where a thumb goes. And the smell. Old silver smells of nothing, and new silver smells of the polish some goblin used to age it." } },
      choices = {
        { text = "Who buys the rare lots?", next = "buyers" },
        { text = "You've caught goblin fakes, then.", next = "eye2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    eye2 = {
      lines = { { id = "eye2_1", text = "Dozens. There's one in Booty Bay who ages brass in bat droppings and sells it as elven. I send each piece back with a note saying which bat. He's begun writing back. We're nearly friends, and he's getting better, which worries me." } },
      choices = {
        { text = "A rival who improves is a compliment.", next = "BACK", reply = "It is, isn't it? I've kept his best fake. It's quite lovely." },
        { text = "Something else.", next = "BACK" },
      },
    },
    wand = {
      lines = { { id = "wand_1", text = "The hum! Oak hums low and steady, and anything fancier sings higher. And lesser magic has a little flutter in it, like a moth. I've held ten thousand wands. Thaddeus Webb tests me with a blindfold on feast days, and I've only missed twice." } },
      choices = {
        { text = "That's a remarkable ear.", next = "BACK", reply = "It's a greedy one. It wants to hear all of them." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "buyers_1", text = "Bethor Iceshard's people, for anything out of Dalaran. The apothecaries, if it's a skull or a jar. Salazar Bloch for books, and he always bids once, high, and never again. And a troll witch doctor in Orgrimmar who outbids me on every single mask." } },
      choices = {
        { text = "You've a nemesis across the sea.", next = "BACK", reply = "I have! I've never met him. I think I'd like him enormously." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We lost everything we owned in a night. Of course we love things now. I don't see why anyone's surprised." } },
    advice = { { id = "tp_advice", text = "If you love it, don't list it. I've watched people cry at this stand, and I'm no use with crying." } },
    lordaeron = { { id = "tp_lordaeron", text = "My mother had a cabinet of thimbles. Two hundred. I can't think where even one of them is." } },
    goblins = { { id = "tp_goblins", text = "Cheats and artists. I can never decide which, and neither can they." } },
    sylvanas = { { id = "tp_sylvanas", text = "They say her quarters are bare as a barracks. I can't imagine it. Not one shiny thing?" } },
    _none = { { id = "tp_none", text = "I don't know! But if it turns up, bring it to my stand first, won't you?" } },
  },
}

---------------------------------------------------------------------------
-- Auctioneer Yarly: the quiet auctioneer; watches prices like weather and keeps a record of them.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_yarly", id = TODO_NPC("Auctioneer Yarly"), name = "Auctioneer Yarly", title = "Auctioneer",
  bible = "bibles/more_folk.md", role = "auctioneer", tier = "service",
  communities = { "undercity" }, temper = { "quiet", "thoughtful" }, values = { "patience", "knowledge" },
  notices = { "purse", "class" },
  impression = {
    first = "Auctioneer Yarly keeps the quietest stand on the Undercity's ring and watches prices the way a farmer watches the sky. He says little, writes a good deal in a long narrow book, and is usually right about what copper bars will cost next week.",
    third = "{name} met Auctioneer Yarly, one of the auctioneers of the Undercity.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my favourite customer. Come and look; I'll knock a little off for you, quietly." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
    { id = "g_1", text = "Good day. Take your time, since the prices will still be here when you've thought it over." },
    { id = "g_2", when = { metBefore = true }, text = "Hello again. Linen's up a little since you came, if that's any use to you." },
    { id = "g_3", when = { profession = { "Mining", "Herbalism", "Skinning", "Tailoring" } }, text = "You gather, or you craft. Then you'll want to know that the smiths are buying this week, and the tailors aren't." },
  },

  notice = {
    { id = "n_1", cat = "purse", when = { money = { min = 500000 } },
      text = "You've capital. Hold some back. There's always a week when everything's cheap, and it's never the week you've spent it all." },
    { id = "n_2", cat = "class", when = { class = "MAGE" },
      text = "A mage. You could carry goods from Orgrimmar's hall to ours faster than a zeppelin. I'm surprised more of you don't trade on the difference." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Auctioneer Yarly. I take listings and bids like the other six. I also keep a record of what things sell for, day by day. Nobody asked me to. I find that prices make more sense written down than they do shouted." },
        { id = "hello_2", when = { metBefore = true }, text = "Yarly. I've nothing new to tell you, except that silk is thin on the stands and wool's plentiful. Make of it what you will." },
      },
      again = {
        { id = "hello_a1", text = "Was there something else?" },
        { id = "hello_a2", text = "Take your time." },
        { id = "hello_a3", text = "Yes?" },
      },
      choices = {
        { text = "Show me the listings.", next = "BUSINESS" },
        { text = "What's in that long book?", next = "book" },
        { text = "You watch prices like weather.", next = "weather" },
        { text = "Cain calls you the quiet one.", next = "cain", when = { heardLine = "uc_cain.seven_1" } },
        { text = "Trade on the difference between halls?", next = "mage", when = { class = "MAGE" } },
        { text = "Thank you for the forecast, Yarly.", next = "END" },
      },
    },
    book = {
      lines = { { id = "book_1", text = "Every sale across my stand since I opened it. The date, the lot, the price. Copper bars, linen bolts, peacebloom by the stack. I'm on the fourth volume. It's very dull, line by line, and when you turn the pages quickly it's the history of the war." } },
      choices = {
        { text = "How is it the history of the war?", next = "book2" },
        { text = "That's a strange thing to keep.", next = "book2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    book2 = {
      lines = { { id = "book2_1", text = "Linen cloth doubled the week the Scourge pushed at the Bulwark, because of the bandages. Iron tripled when the Warchief sent to arm Tarren Mill. And there was a month when nobody listed herbs from the Plaguelands at all, and I knew before the criers did that the gatherers weren't coming back." } },
      choices = {
        { text = "You saw the losses in the prices.", next = "book3" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    book3 = {
      big = true,
      lines = { { id = "book3_1", text = "Three days before anyone said it aloud. I didn't tell the captains. I'm an auctioneer, and it was only a gap in a column. I've wondered since whether a man who notices a thing is bound to say so. What do you think?" } },
      choices = {
        { text = "Yes. If you see it, you must speak.", next = "BACK", reply = "I think so too, now. I've started sending the Royal Overseer a page each week.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "No. Your work is the stand, not the war.", next = "BACK", reply = "That's what I told myself. It was a comfortable answer, and I've stopped trusting it.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    weather = {
      lines = { { id = "weather_1", text = "It is weather. Nobody controls it, everybody complains of it, and if you watch long enough you can say that it'll likely rain. Copper's cheap in the first week of the month, when the new miners come up from Deathknell. Buy then, sell in the third." } },
      choices = {
        { text = "What's the oddest pattern in your book?", next = "weather2" },
        { text = "First week, buy copper. I'll remember.", next = "BACK", reply = "Do. It's held true eleven months running. I make no promise for the twelfth." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    cain = {
      lines = { { id = "cain_1", text = "He's right. Cain sells the excitement, and it's a real thing, I don't mock it. I sell the afternoon after, when you've got the item home and wonder what you paid. Somebody ought to stand at that end." } },
      choices = {
        { text = "The quiet end has its uses.", next = "BACK", reply = "It has. It's where the regulars end up." },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = { { id = "mage_1", text = "Runecloth is dearer here than in Orgrimmar, most weeks, by a fifth. Peacebloom's the other way about. A mage with a portal and a full pack could do very nicely, carrying each to where it's wanted. It's honest. You'd only be selling the walk." } },
      choices = {
        { text = "I'll think on it. A portal's cheap enough.", next = "BACK", reply = "Check my book before you go. I'll tell you which way the gap runs today." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    weather2 = {
      lines = { { id = "weather2_1", text = "Candles. Every time the Bulwark takes losses, candles sell out within the day, and Eleanor Rusk can't keep them on her counter. Nobody here needs the light. I've never asked what they're lit for, but I mark the days in the margin, and I buy one myself." } },
      choices = {
        { text = "The city mourns in its own way.", next = "BACK", reply = "It does, and it shows in the column before it shows anywhere else." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "A patient people. We ought to be good at markets. Mostly we're too sad to watch them properly." } },
    advice = { { id = "tp_advice", text = "Write the price down when you buy. You'll never remember it truly, and you'll always remember it kindly." } },
    lordaeron = { { id = "tp_lordaeron", text = "I kept the tithe rolls for a country parish. Columns of barley. It was good training." } },
    goblins = { { id = "tp_goblins", text = "They understand a market better than anyone, and trust it less. I think the two go together." } },
    sylvanas = { { id = "tp_sylvanas", text = "Her quartermasters buy steadily and never in a panic. That tells me more about her than any speech." } },
    _none = { { id = "tp_none", text = "I've no record of that. I'd rather not guess." } },
  },
}

