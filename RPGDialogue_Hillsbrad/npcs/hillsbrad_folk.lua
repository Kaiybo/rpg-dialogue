-- Hillsbrad folk we'd missed. Tarren Mill: Monika Sengutz (Vorrel's Revenge), Christoph Jeffcoat (trade goods; Soothing Turtle Bisque),
-- Theodore Mont Claire (stable master), Ott (weaponsmith). Southshore: Darla Harris (gryphon master), Wesley (stable master),
-- Hal McAllister (fish merchant), Neema (waitress).
-- Voice: bibles/hillsbrad_folk.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local Q_VORREL = TODO_QUEST("Vorrel's Revenge")
local Q_BISQUE = TODO_QUEST("Soothing Turtle Bisque")

---------------------------------------------------------------------------
-- Monika Sengutz
---------------------------------------------------------------------------
P:NPC {
  key = "hb_monika", id = TODO_NPC("Monika Sengutz"), name = "Monika Sengutz",
  bible = "bibles/hillsbrad_folk.md", role = "questgiver", tier = "quest",
  communities = { "tarren_mill" }, temper = { "bitter", "proud" }, values = { "loyal" },
  notices = { "race", "faction" },

  impression = {
    first = "She keeps looking toward the north road as if somebody is late.",
    third = "{name} met Monika Sengutz, a Forsaken of Tarren Mill whose husband Vorrel was taken by the Scarlet Crusade.",
  },

  greetings = {
    { id = "g_default", text = "What do you want, stranger?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Have you any news, or have you only come to stare?" },
    { id = "g_done", when = { questDone = Q_VORREL }, text = "You brought me his ring. I wear it on a cord now, because my fingers aren't what they were." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "A living thing of the Alliance in Tarren Mill. Say your piece and go, before the Deathguard notice you." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of us. You'll understand, then, that waiting is the only thing we never get used to." },
  },

  start = "hello",
  nodes = {
    w3_camp = {
      lines = {
        { id = "w3_camp_1", text = "I mend the Deathguard's cloaks, because my fingers still remember a needle, and because a woman with work in her hands looks less like she's waiting. Vorrel used to tease me that I'd darn the moon if it came down low enough." },
      },
      choices = {
        { text = "Do the Deathguard thank you?", next = "w3_thank" },
        { text = "Work keeps the waiting bearable.", next = "BACK", reply = "It does, a little. The needle goes in and out and the road stays empty, and I count stitches instead of days." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_thank = {
      lines = {
        { id = "w3_thank_1", text = "In their way, which is to bring me more cloaks. One of them left a pressed flower in a pocket last week, by accident or not, and I've kept it, though I couldn't tell you why." },
      },
      choices = {
        { text = "Keep it, Monika. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Monika Sengutz, and I'm waiting for my husband, though I've been told not to. Vorrel went north on the Dark Lady's business and the Scarlets took him, and nobody in this town will say the word \"dead\" to my face." },
        { id = "h_active", tags = { "news" }, when = { questActive = Q_VORREL },
          text = "You've seen him? You've spoken with him? Tell me what he said, all of it, and don't soften it for my sake." },
        { id = "h_done", when = { questRecent = { Q_VORREL, days = 7 } },
          text = "Vorrel led such a troubled existence, and what a good mate he was. You brought his ring back to me, and I'll not forget that the living helped me when the living took him." },
        { id = "h_later", when = { questDone = Q_VORREL },
          text = "I still look at the road some evenings. The Deathguard tell me I'm wasting what time I have, and I tell them the dead have nothing but time." },
      },
      again = {
        { id = "h_again", text = "Is there something else, stranger?" },
        { id = "h_again2", text = "Go on and ask. I'm not going anywhere till Vorrel comes up that road, one way or another." },
      },
      choices = {
        { text = "Tell me about Vorrel.", next = "vorrel" },
        { text = "Where did the Scarlets take him?", next = "scarlets" },
        { text = "How do you bear the waiting?", next = "waiting" },
        { text = "Vorrel asked me to bring you this ring.", next = "ring", when = { questActive = Q_VORREL } },
        { text = "Who was Nancy Vishas?", next = "nancy", when = { questDone = Q_VORREL } },
        { text = "What do you do in camp while you wait?", next = "w3_camp" },
        { text = "I'll leave you be.", next = "END" },
      },
    },

    vorrel = {
      lines = { { id = "vo_default", text = "He was a carter in Hillsbrad before the plague, and he was a carter for the Dark Lady after it, carrying letters where letters were not welcome. He used to hum while he drove, badly, and I miss it more than I thought anyone could miss bad humming." } },
      choices = {
        { text = "What did he carry for her?", next = "vorrel_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vorrel_work = {
      lines = { { id = "vw_default", text = "Messages for the Deathstalkers, and once a box he wouldn't let me open. He said the less I knew the safer I'd be, which is the sort of thing the living say, and I think he only half remembered he wasn't one any more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    scarlets = {
      lines = { { id = "sc_default", text = "To their monastery, in Tirisfal, where they keep our kind in cells and ask questions with hot iron. Their Interrogator Vishas has a reputation even among the Scarlets, and I've heard Vorrel's name spoken in the same breath." } },
      choices = {
        { text = "I'll look for him there.", next = "scarlets_vow" },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_monastery" } } },
      },
    },
    scarlets_vow = {
      big = true,
      lines = { { id = "sv_default", text = "If you find him, and if there's nothing left of him to save, don't make him linger. And if you find Vishas, I'll not tell you what to do, but I'll not weep either." } },
      choices = {
        { text = "Vishas will answer for it, by my hand.", next = "BACK", reply = "By your hand, then, and I'll not stop you. I only hope it brings you more peace than it would bring me.", fx = { align = { light = -1 } } },
        { text = "I'll bring Vorrel peace. Revenge won't help either of you.", next = "BACK", reply = "Peace for Vorrel is all I wanted, and I'm glad you see it that way. Vishas can rot in the Monastery for all I care.", fx = { align = { light = 1 } } },
      },
    },

    waiting = {
      big = true,
      lines = { { id = "wa_default", text = "Badly, and without sleep, since we don't. The others tell me the dead should let go of the living's habits, and that loving a husband is one of them." } },
      choices = {
        { text = "Keep the habit. It's what makes you yourself.", next = "BACK", reply = "I think I will, then, whatever the others say. A dead wife who still loves her husband is no stranger than the rest of us.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "They're right. The Forsaken must leave the old life behind.", next = "BACK", reply = "Perhaps they are, and perhaps one day I'll agree with them. Not today, though, and not while he might still be out there.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ring = {
      lines = { { id = "ri_default", text = "His wedding ring. That woman had it, didn't she, the Interrogator's wife, wearing my husband's ring by a lake while he screamed in a cell. Damn those filthy humans, and damn them twice for wearing what isn't theirs." } },
      choices = {
        { text = "He spoke of you at the end.", next = "ring_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ring_end = {
      lines = { { id = "re_default", text = "Did he? Don't tell me what he said, I think I'd like to imagine it. Thank you, stranger, and if you're ever in Tarren Mill with nothing to do, you may come and tell me nothing at all." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2 } } },
    },

    nancy = {
      lines = { { id = "na_default", text = "The Interrogator's wife, living in a cottage on Lake Lordamere with a garden and a view and my husband's ring. I've tried to hate her properly and I find I can't be bothered, which frightens me more than the hate did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know Vorrel, the Scarlets, and how long a night can be when you don't sleep." } },
    background = { { id = "tp_bg", text = "I was a carter's wife in Hillsbrad, then a corpse, and now a carter's wife again, after a fashion.", next = "vorrel" } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They took my husband and asked him questions he couldn't answer. That's all I know of them, and all I need to." } },
    _none = { { id = "tp_none", text = "I don't know, stranger, and I don't much care." } },
  },
}

---------------------------------------------------------------------------
-- Theodore Mont Claire
---------------------------------------------------------------------------
P:NPC {
  key = "hb_theodore", id = TODO_NPC("Theodore Mont Claire"), name = "Theodore Mont Claire",
  title = "Stable Master",
  bible = "bibles/hillsbrad_folk.md", role = "stablemaster", tier = "service",
  communities = { "tarren_mill" }, temper = { "proud", "sharp" }, values = { "craft" },
  notices = { "pet" },

  impression = {
    first = "He speaks of horses he owned in life as if they wait.",
    third = "{name} met Theodore Mont Claire, the Forsaken stable master of Tarren Mill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my favourite patron returns. Your animal had the best stall again, the one my old grey mare used to have." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. There's a stall, and you may use it, but I'll thank you not to linger in my stable." },
    { id = "g_default", text = "Good day to you. If you've an animal that needs a rest, you've found the right stable." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, a returning patron. Do come in." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "And this is {pet}. A fine animal, and not at all frightened of me, which is unusual." },
  },

  start = "hello",
  nodes = {
    w3_ride = {
      lines = {
        { id = "w3_ride_1", text = "Never. I've sat a hundred living horses and broken a dozen, and I'll not climb onto something that doesn't know I'm there. The Forsaken think me a snob for it, and they're quite right." },
      },
      choices = {
        { text = "What would it take to change your mind?", next = "w3_change" },
        { text = "A horse should know its rider.", next = "BACK", reply = "Precisely. A living horse knows your weight, your temper, the hand you favour. A dead one only knows the way." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_change = {
      lines = {
        { id = "w3_change_1", text = "A living horse that would let me near it, and I've not found one since I woke. They shy from the smell of me, every one, and I've decided I'd rather walk than ride a beast that can't refuse me." },
      },
      choices = {
        { text = "That's a horseman's pride. Something else.", next = "BACK" },
      },
    },
    d2_beasts = {
      lines = {
        { id = "d2_beasts_1", text = "Wolves from Orgrimmar, mostly, which the orcs ride and insist on calling mounts, and the hunters' pets, which are everything from a bear to a crab the size of a cart. The bats belong to the bat handler, and I don't go near them, nor they me." },
      },
      choices = {
        { text = "You don't care for the bats?", next = "d2_beasts2" },
        { text = "A crab the size of a cart?", next = "d2_beasts2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_beasts2 = {
      lines = {
        { id = "d2_beasts2_1", text = "A bat isn't a stable animal, it's a temper with wings, and it doesn't want grooming or kindness. Give me a beast that wants a hand on its neck and a word in the dark, and I'll keep it happy for as long as you like." },
      },
      choices = {
        { text = "Do the wolves let you near?", next = "d2_beasts3" },
        { text = "You miss the horses.", next = "d2_beasts3" },
      },
    },
    d2_beasts3 = {
      lines = {
        { id = "d2_beasts3_1", text = "After a fashion. A wolf is a proud thing and won't be handled like a cob, so I set the meat down and step back and let it decide, and most nights it decides I'm part of the furniture, which suits me well enough." },
      },
      choices = {
        { text = "A sensible arrangement.", next = "BACK" },
        { text = "Ask you something else, Theodore.", next = "BACK" },
      },
    },
    d2_town = {
      lines = {
        { id = "d2_town_1", text = "It was, and these stalls kept the miller's draught horses when the mill still turned. Southshore's just down the road, and I used to sell them colts every spring, and now their militia shoots at anything that comes from this direction." },
      },
      choices = {
        { text = "Does that trouble you?", next = "d2_town2" },
        { text = "The world's turned over since then.", next = "d2_town2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_town2 = {
      lines = {
        { id = "d2_town2_1", text = "It troubles me less than it should. The people who bought my colts are the same people who'd have burned me in a barn after I rose, and High Executor Darthalia at least lets me keep my stable." },
      },
      choices = {
        { text = "A fair trade, of sorts.", next = "d2_town3" },
        { text = "Darthalia keeps a tidy town.", next = "d2_town3" },
      },
    },
    d2_town3 = {
      lines = {
        { id = "d2_town3_1", text = "Of sorts. She asked me once if I'd breed horses again for the Deathguard, if anyone could find me a mare that wasn't dead or Alliance, and I said yes before she'd finished asking." },
      },
      choices = {
        { text = "I hope someone finds you one.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_pet = {
      lines = {
        { id = "d2_pet_1", text = "Animals know who'll treat them right, living or not, and yours has a good nose for it. Bring it back any time, and I'll see it gets the warm corner, away from the draught off the hills." },
      },
      choices = {
        { text = "Thank you, Theodore.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Theodore Mont Claire, keeper of the stables, and once of a rather better stable near the old capital. The animals here don't care that I'm dead, which makes them better company than most." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, and you've kept your beast well. I'll see it rested, and I'll not let the bats near it." },
      },
      again = {
        { id = "h_again", text = "Something further? The wolves are restless, so be brief." },
      },
      choices = {
        { text = "I'd like to stable my pet.", next = "BUSINESS" },
        { text = "A better stable? Tell me.", next = "past" },
        { text = "Do the beasts fear the Forsaken?", next = "fear" },
        { text = "What beasts do you stable here?", next = "d2_beasts" },
        { text = "Tarren Mill was a human town once.", next = "d2_town" },
        { text = "My beast took to you quickly.", next = "d2_pet", when = { class = "HUNTER" } },
        { text = "Do you ride one of the skeletal horses yourself?", next = "w3_ride" },
        { text = "Good day, Theodore.", next = "END" },
      },
    },
    past = {
      lines = { { id = "pa_default", text = "Forty horses and a coach-house on an estate north of Lordamere, before the plague came through. I bred greys, the finest in Lordaeron, and I've no idea what became of a single one." } },
      choices = {
        { text = "Would you go looking for them?", next = "past_look" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_look = {
      big = true,
      lines = { { id = "pl_default", text = "I've thought of it, but if I found them dead and walking I'd not know what to do. I'd rather believe they ran south and are eating some farmer's oats in Southshore." } },
      choices = {
        { text = "Go and look. The truth is better than a comfort.", next = "BACK", reply = "You're braver than me, then, or harder. If I do go looking, I'll tell you what I find, though I may not thank you for the advice.", fx = { align = { honor = 1 } } },
        { text = "Keep believing it. Some comforts are worth a lie.", next = "BACK", reply = "That's kind of you. Let me have my oats and my Southshore farmer, then, at least until the truth comes knocking on its own.", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    fear = {
      lines = { { id = "fe_default", text = "At first, all of them did. I sat in the straw for three nights without moving until they decided I was furniture, and now they lean on me in the cold." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Horses, mostly, and a little of how Lordaeron's nobility used to waste its money." } },
    _none = { { id = "tp_none", text = "I'm afraid I've no idea. I'm only the stable master." } },
  },
}

---------------------------------------------------------------------------
-- Ott
---------------------------------------------------------------------------
P:NPC {
  key = "hb_ott", id = TODO_NPC("Ott"), name = "Ott",
  title = "Weaponsmith",
  bible = "bibles/hillsbrad_folk.md", role = "vendor", tier = "service",
  communities = { "tarren_mill" }, temper = { "steady", "proud" }, values = { "craft", "loyal" },
  notices = { "class", "race" },

  impression = {
    first = "He tests every edge on his own thumb and has the scars.",
    third = "{name} met Ott, the orc weaponsmith of Tarren Mill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You. The last blade held, I see. Come and test the new ones." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Buy your blade and go, because I've nothing else to say to you." },
    { id = "g_default", text = "You need a blade? I have blades." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Did the last one hold?" },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Another orc, good! I was starting to forget what breathing sounds like." },
  },

  start = "hello",
  nodes = {
    w3_taught = {
      lines = {
        { id = "w3_taught_1", text = "A smith in the internment camps, an old orc called Grukh, who was made to forge chains for the humans and taught me in the hours they didn't watch. My first axe was made from a broken shackle, and I still have it, though it's a poor axe." },
      },
      choices = {
        { text = "Why keep a poor axe?", next = "w3_axe" },
        { text = "The camps made many orcs strong.", next = "BACK", reply = "They made us angry. Strong we were before. The Warchief turned the anger into something better, and so did Grukh, in his small way." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_axe = {
      lines = {
        { id = "w3_axe_1", text = "Because a chain that becomes an axe is the whole story of the Horde in one piece of iron. When a young orc asks me why we fight for Thrall, I put it in his hands and let him feel the links still in the steel." },
      },
      choices = {
        { text = "A good answer. Something else.", next = "BACK" },
      },
    },
    d2_orcs = {
      lines = {
        { id = "d2_orcs_1", text = "Cold and quiet, and it smells of the apothecaries. Krusk keeps to himself and grieves for his brothers in Durnholde, and the rest of us sharpen and wait, because the Forsaken do not like orcs wandering about their town after dark." },
      },
      choices = {
        { text = "Krusk grieves?", next = "d2_orcs2" },
        { text = "You don't seem to mind the waiting.", next = "d2_orcs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_orcs2 = {
      lines = {
        { id = "d2_orcs2_1", text = "He came back alone from Durnholde, and an orc who comes back alone carries every brother he left behind. I tell him they may still live, because the Syndicate keep prisoners, but he only grunts and goes on sharpening." },
      },
      choices = {
        { text = "They may yet live.", next = "BACK", reply = "Then prove it to him, and I will sell you any axe on this rack." },
        { text = "Ask you something else, Ott.", next = "BACK" },
      },
    },
    d2_steel = {
      lines = {
        { id = "d2_steel_1", text = "From Azurelode, when the Horde holds the mine, and from the carts out of the Undercity when it does not. The human iron of Hillsbrad is good, better than Durotar's, though I would only say so to someone who is not from Durotar." },
      },
      choices = {
        { text = "Who holds Azurelode now?", next = "d2_steel2" },
        { text = "Your secret is safe.", next = "d2_steel2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_steel2 = {
      lines = {
        { id = "d2_steel2_1", text = "It changes with the season. The Southshore miners dig it by day and our people raid it by night, and the ore goes north or south depending on who was awake last, which is a poor way to run a forge." },
      },
      choices = {
        { text = "Then the Horde should hold it properly.", next = "d2_steel3" },
        { text = "Both sides must be tired of it.", next = "d2_steel3" },
      },
    },
    d2_steel3 = {
      lines = {
        { id = "d2_steel3_1", text = "Darthalia would hold it if she had the soldiers, but her Deathguard are spread from the Mill to the Sepulcher. Until Orgrimmar sends more blades than mine, the mine will go on changing hands like a coin in a game of bones." },
      },
      choices = {
        { text = "Then sell more blades.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_axe = {
      lines = {
        { id = "d2_axe_1", text = "Ha! This one, with the double bit, made for a warrior's two hands and not a Forsaken's one. Swing it slow at first, because it will pull you round if you let it." },
      },
      choices = {
        { text = "Let me see the rest.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Ott, and I sell weapons to the Horde's soldiers in this dead town. The Forsaken are good allies, but they buy daggers, and an orc likes to sell an axe now and then." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A warrior. Finally someone who'll buy an axe. Look at this one, and feel the weight." },
      },
      again = {
        { id = "h_again", text = "Something more? Ask, then buy an axe." },
      },
      choices = {
        { text = "A weaponsmith should test every edge before he sells it.", next = "BACK", reply = "I do, on my own thumb, and the scars prove it. An untested edge is a lie.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Nobody comes back to complain about a blade that failed them.", next = "BACK", reply = "No, because they're dead, and the Deathguard need every one of them alive. Get out of my shop.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Why is an orc in Tarren Mill?", next = "why" },
        { text = "What do you think of the Forsaken?", next = "forsaken" },
        { text = "How do the orcs here find Tarren Mill?", next = "d2_orcs" },
        { text = "Where does your steel come from?", next = "d2_steel" },
        { text = "Show me the heaviest axe you've got.", next = "d2_axe", when = { class = "WARRIOR" } },
        { text = "Who taught you to make blades?", next = "w3_taught" },
        { text = "Farewell, Ott.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Thrall sent orcs to stand beside our new allies, and somebody had to keep their blades sharp. Also, Durnholde is near, and I wanted to see the place where the Warchief was a slave." } },
      choices = {
        { text = "Have you been to Durnholde?", next = "why_durn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_durn = {
      lines = { { id = "wd_default", text = "Once, to the walls. The Syndicate hold it now, humans robbing humans in a human fortress, and I stood outside and laughed until the guards started shooting." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "syndicate" } } } },
    },
    forsaken = {
      big = true,
      lines = { { id = "fo_default", text = "They fight well and they never complain about the food. But the apothecaries' cellars smell of something that isn't medicine, and the Warchief should know about it." } },
      choices = {
        { text = "Tell him. The Horde can't hide such things.", next = "BACK", reply = "I will, when he next sends a rider. A Horde that keeps secrets from itself will rot from the inside like an old tusk.", fx = { align = { order = -1 } } },
        { text = "Keep quiet. Allies don't spy on each other.", next = "BACK", reply = "Spying? I only have a nose, and it tells me what it tells me. Still, I hear you, and I'll keep my mouth shut until I know more.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know blades, and I know who in this town needs one." } },
    _none = { { id = "tp_none", text = "I don't know. I only make weapons." } },
  },
}

---------------------------------------------------------------------------
-- Darla Harris
---------------------------------------------------------------------------
P:NPC {
  key = "hb_darla", id = TODO_NPC("Darla Harris"), name = "Darla Harris",
  title = "Gryphon Master",
  bible = "bibles/hillsbrad_folk.md", role = "flightmaster", tier = "service",
  communities = { "southshore" }, temper = { "brisk", "friendly" }, values = { "dutiful" },
  notices = { "mount", "race" },

  impression = {
    first = "She watches the northern sky for bats more than for weather.",
    third = "{name} met Darla Harris, the gryphon master at Southshore.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, and in one piece, which the gryphons always appreciate. They've been fed and they're in a fine mood for you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The birds will fly you, since that's what they're for, but I'd sooner you didn't stand about my roost." },
    { id = "g_default", text = "Need a bird? They're fed, they're rested, and they're in a better mood than I am." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and in one piece. The gryphons will be pleased, they hate carrying the injured." },
  },

  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Down off that, please, before the birds take an interest in it." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! The birds always calm down for dwarves, and I've given up asking why." },
  },

  start = "hello",
  nodes = {
    w3_refuse = {
      lines = {
        { id = "w3_refuse_1", text = "Once, flat out, a fellow in a good coat who swore he was a merchant from Lordamere. The bird took one sniff of him and shrieked fit to wake the dead, and Marshal Redpath's men found a Syndicate mask in his saddlebag." },
      },
      choices = {
        { text = "The gryphon knew?", next = "w3_knew" },
        { text = "Smart bird.", next = "BACK", reply = "Smarter than most of the militia, and I've told them so. They didn't like it, but they've stopped arguing with the birds." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_knew = {
      lines = {
        { id = "w3_knew_1", text = "I think it smelled Alterac on him, the mountain damp and the camp smoke, because the Wildhammer birds hate the Syndicate as much as the dwarves do. I gave that gryphon a whole salmon that night, and I'd give it another." },
      },
      choices = {
        { text = "It earned it. Something else.", next = "BACK" },
      },
    },
    d2_routes = {
      lines = {
        { id = "d2_routes_1", text = "South to Menethil over the marshes and on to Ironforge, and east to Aerie Peak when the Wildhammer will have us. The birds know the routes better than I do, which is a good thing, because I've never once been up there myself." },
      },
      choices = {
        { text = "You've never flown?", next = "d2_routes2" },
        { text = "The birds do the hard part, then.", next = "d2_routes2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_routes2 = {
      lines = {
        { id = "d2_routes2_1", text = "Not once, and I don't intend to. I've seen too many riders come down shaking after a storm over the Arathi hills, and I'd rather keep my feet on the roost and my head out of the clouds." },
      },
      choices = {
        { text = "A gryphon master who won't fly.", next = "BACK", reply = "A cook needn't eat everything she makes, love. Somebody's got to stay on the ground." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_care = {
      lines = {
        { id = "d2_care_1", text = "Fish, a great deal of it, which is one thing Southshore's never short of. Hal McAllister keeps back the worst of his catch for me, and the birds eat better than half the militia, though I'd not say so where the militia can hear." },
      },
      choices = {
        { text = "What else do they need?", next = "d2_care2" },
        { text = "Lucky birds.", next = "d2_care2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_care2 = {
      lines = {
        { id = "d2_care2_1", text = "Their feathers combed after rain, their talons trimmed, and someone to talk to them when the bats are up. A gryphon that's frightened will fly off and not come back for a week, so I sit with them on the bad nights and sing whatever comes into my head." },
      },
      choices = {
        { text = "What do you sing?", next = "d2_care3" },
        { text = "That's rather sweet.", next = "d2_care3" },
      },
    },
    d2_care3 = {
      lines = {
        { id = "d2_care3_1", text = "Old Lordaeron harvest songs, mostly, which my mother sang. The birds don't care about the words, but they like a low voice, and it keeps me from looking north every five minutes." },
      },
      choices = {
        { text = "I hope the bats stay home tonight.", next = "BACK" },
        { text = "Ask you something else, Darla.", next = "BACK" },
      },
    },
    d2_wild = {
      lines = {
        { id = "d2_wild_1", text = "Now and then, a rider from Aerie Peak with his hair in braids and his beard full of feathers, who looks over my birds as if he's checking I haven't been beating them. They're proud folk, the Wildhammer, and they never let you forget whose gryphons these were." },
      },
      choices = {
        { text = "Do you get along with them?", next = "d2_wild2" },
        { text = "Sounds like a hard inspection.", next = "d2_wild2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_wild2 = {
      lines = {
        { id = "d2_wild2_1", text = "Well enough, once they've seen the roost. The last one shared a flask with me and told me the birds were in better shape than his own, which I'll be telling people about until I'm grey." },
      },
      choices = {
        { text = "Deserved praise.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_dwarf = {
      lines = {
        { id = "d2_dwarf_1", text = "Then you'll know not to kick, and not to pull at the feathers, and to lean into the turns. I can always tell a dwarf who's flown before, because they climb on without being asked and start talking to the bird straight away." },
      },
      choices = {
        { text = "The bird likes to hear its name.", next = "BACK", reply = "So they do. This one's Stormcloud, if you want to start." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Darla Harris, gryphon master, and these birds will carry you anywhere the Alliance keeps a roost, so long as you don't kick. Where are you headed?" },
        { id = "h_dd_falling", when = { deathCause = "falling" },
          text = "You fell, didn't you? I can always tell, because folk who've fallen to their deaths look up at my gryphons afterwards with a sort of wounded envy." },
      },
      again = {
        { id = "h_again", text = "Anything else before I send you up? The birds get restless if they're kept waiting, and so do I." },
      },
      choices = {
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "What do you watch for in the north?", next = "north" },
        { text = "How did a human get gryphons?", next = "birds" },
        { text = "Where do your gryphons fly?", next = "d2_routes" },
        { text = "How do you care for birds like these?", next = "d2_care" },
        { text = "Do the Wildhammer still come by?", next = "d2_wild" },
        { text = "I've ridden a gryphon or two in my time.", next = "d2_dwarf", when = { race = "Dwarf" } },
        { text = "Has a gryphon ever refused a rider?", next = "w3_refuse" },
        { text = "Thanks, Darla.", next = "END" },
      },
    },
    north = {
      big = true,
      lines = { { id = "no_default", text = "Bats from Tarren Mill. The Forsaken ride them over the hills, and twice now they've come close enough to spook my birds. Marshal Redpath says to shoot at anything with leather wings, and I'm not sure he's wrong." } },
      choices = {
        { text = "He's right. Out here, you shoot first.", next = "BACK", reply = "I'm glad someone agrees with the Marshal, because I've had my bow strung since dawn and I'll not hesitate now.", fx = { align = { light = -1 } } },
        { text = "Some riders are only couriers. Hold your fire.", next = "BACK", reply = "Couriers, is it? Couriers for what, I'd like to know, though I'll mind my aim until one of them gives me cause.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    birds = {
      lines = { { id = "bi_default", text = "The Wildhammer lent them to Southshore after the Second War, when we had more friends than we do now. I learned the whistles from a rider called Gorran, who said I had the lungs for it, and I've been here since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know gryphons, the weather and the sky north of here." } },
    _none = { { id = "tp_none", text = "Not a thing. Ask somebody with their feet on the ground." } },
  },
}

---------------------------------------------------------------------------
-- Wesley
---------------------------------------------------------------------------
P:NPC {
  key = "hb_wesley", id = TODO_NPC("Wesley"), name = "Wesley",
  title = "Stable Master",
  bible = "bibles/hillsbrad_folk.md", role = "stablemaster", tier = "service",
  communities = { "southshore" }, temper = { "friendly", "cowardly" }, values = { "kind" },
  notices = { "pet" },

  impression = {
    first = "He jumps a little at every loud noise from the north road.",
    third = "{name} met Wesley, the young stable master of Southshore.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back! Oh, good, I was hoping it was you and not, well, something from the north road. Your animal's stall is clean and ready." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. The stall's there, and, um, I'd rather you saw to your animal yourself, if that's all right." },
    { id = "g_default", text = "Hello! Oh, good, you're alive. I mean, hello, welcome to Southshore." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Your animal's stall is still clean, I made sure of it." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "Hello, {pet}! You're much nicer than the horses, they bite." },
  },

  start = "hello",
  nodes = {
    w3_attack = {
      lines = {
        { id = "w3_attack_1", text = "Hide, honestly, in the hay at the back, with the horses. No, wait, I'd open the stalls first, so the horses could run, and then I'd hide, and then I'd probably come out to look and hide again." },
      },
      choices = {
        { text = "You'd let the horses out first?", next = "w3_first" },
        { text = "Hiding's not so bad a plan.", next = "BACK", reply = "It isn't, is it? Everyone says I should take up a sword, but I think the town has enough swords and not enough people who know where the hay is." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_first = {
      lines = {
        { id = "w3_first_1", text = "Of course! They can't open the latches, and they didn't choose to live next to Tarren Mill any more than I did. I've practised it, at night, when nobody's looking. I can do all six stalls in under a minute." },
      },
      choices = {
        { text = "That's braver than you think, Wesley. Something else.", next = "BACK" },
      },
    },
    d2_feed = {
      lines = {
        { id = "d2_feed_1", text = "Hay from the Hillsbrad Fields, when Farmer Ray can spare it, and oats off the ship when he can't. Farmer Ray's been sending less every month because his hands keep leaving, and I don't like to ask him why, because I think I know." },
      },
      choices = {
        { text = "The dead from the Mill?", next = "d2_feed2" },
        { text = "Ray's farm sounds like it's struggling.", next = "d2_feed2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_feed2 = {
      lines = {
        { id = "d2_feed2_1", text = "That's what everyone says, but nobody says it loudly, because then they'd have to do something about it. I give the horses a bit less and tell them it's for their figures, and I don't think they believe me." },
      },
      choices = {
        { text = "Horses are smarter than they look.", next = "BACK", reply = "They are! Smarter than me, some days, and they know it too." },
        { text = "Ask you something else, Wesley.", next = "BACK" },
      },
    },
    d2_thief = {
      lines = {
        { id = "d2_thief_1", text = "Once, a man in a black mask, in the middle of the night, who wanted the Magistrate's grey. I hid in the hayloft and threw a bucket at him, and he ran off, and I didn't come down until morning." },
      },
      choices = {
        { text = "You threw a bucket at the Syndicate?", next = "d2_thief2" },
        { text = "That was brave of you.", next = "d2_thief2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_thief2 = {
      lines = {
        { id = "d2_thief2_1", text = "I didn't know it was the Syndicate until afterwards, or I'd have stayed in the hayloft and kept the bucket. Magistrate Maleb was very kind about it and said I'd saved the horse, but I think I mostly saved the bucket's dignity." },
      },
      choices = {
        { text = "Did he catch the thief?", next = "d2_thief3" },
        { text = "You saved the horse. That counts.", next = "d2_thief3" },
      },
    },
    d2_thief3 = {
      lines = {
        { id = "d2_thief3_1", text = "No, the man got clean away up the hill toward Alterac. The Marshal put a lamp over the stable door after that, and I sleep with the bucket now, just in case." },
      },
      choices = {
        { text = "Keep the bucket handy.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_horde = {
      lines = {
        { id = "d2_horde_1", text = "You're not? Oh, good. I mean, I believed you, but it's nice to hear it said. The horses are all quite gentle, and so am I, and none of us would be any trouble at all." },
      },
      choices = {
        { text = "I'll take your word on that.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Wesley, and I keep the stables, well, the stalls by the inn, which is nearly a stable. I'll look after your animal like it was my own, which is easy, because I haven't got one." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "Oh! Oh, you're... you're with the Horde, aren't you? I'm not supposed to... please don't hurt the horses." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm not busy, I'm never busy." },
      },
      choices = {
        { text = "I'd like to stable a pet.", next = "BUSINESS" },
        { text = "Why so jumpy, Wesley?", next = "jumpy" },
        { text = "How long have you kept the stables?", next = "job" },
        { text = "What do you feed the horses?", next = "d2_feed" },
        { text = "Has anyone ever tried to steal from you?", next = "d2_thief" },
        { text = "I'm not here to hurt anything, Wesley.", next = "d2_horde", when = { faction = "Horde" } },
        { text = "What would you do if the Forsaken attacked?", next = "w3_attack" },
        { text = "Goodbye, Wesley.", next = "END" },
      },
    },
    jumpy = {
      lines = { { id = "ju_default", text = "Because Tarren Mill's just up the road, and it's full of dead people who used to live there. My aunt lived there, and I don't know if she still does, if you see what I mean." } },
      choices = {
        { text = "Do you want to know?", next = "jumpy_aunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jumpy_aunt = {
      big = true,
      lines = { { id = "ja_default", text = "No, or yes, I don't know. Everyone says the Forsaken aren't the people they were, and I'd like to believe it, because otherwise she's up there and she hasn't come to see me." } },
      choices = {
        { text = "They aren't who they were. Let her go.", next = "BACK", reply = "Let her go? I don't know if I can, but I suppose I'll have to try. It's just hard when you know she's only over the hill.", fx = { align = { order = 1 } } },
        { text = "Some of them remember. Don't give up on her.", next = "BACK", reply = "You really think so? Then I'll keep waiting, and maybe one day she'll come down the road and say my name.", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    job = {
      lines = { { id = "jo_default", text = "Two summers. The old stable master went to Stromgarde with the League and didn't come back, so Magistrate Maleb gave it to me because I was standing nearby." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the stalls, the horses, and which of them bites, which is all of them." } },
    _none = { { id = "tp_none", text = "Oh, I don't know about that. Maybe ask Magistrate Maleb?" } },
  },
}

---------------------------------------------------------------------------
-- Neema
---------------------------------------------------------------------------
P:NPC {
  key = "hb_neema", id = TODO_NPC("Neema"), name = "Neema",
  title = "Waitress",
  bible = "bibles/hillsbrad_folk.md", role = "vendor", tier = "service",
  communities = { "southshore" }, temper = { "friendly", "brisk" }, values = { "kind" },
  notices = { "hunger", "weary" },

  impression = {
    first = "She forgets nobody's order and carries everyone's gossip.",
    third = "{name} met Neema, the waitress at Southshore's inn.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my favourite, love! Sit by the window, and I'll bring your usual before you've even taken your gloves off." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Sit where you like, love, and I'll get to you when I get to you." },
    { id = "g_default", text = "Sit anywhere, love, I'll be right with you. Unless you're the one who ordered the stew, in which case it's coming." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The usual, love, or shall I surprise you?" },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You look like you've walked here from Arathi and fought half of it on the way. Sit down before you fall down." },
  },

  start = "hello",
  nodes = {
    w3_kelly = {
      lines = {
        { id = "w3_kelly_1", text = "And he takes the credit for every good night in this house, love. I make the food, I carry the trays, I remember who wants what, and Kelly stands behind the bar polishing the same mug and accepting everyone's thanks." },
      },
      choices = {
        { text = "Do you two get on?", next = "w3_geton" },
        { text = "Sounds like you run the place.", next = "BACK", reply = "I do, and Kelly knows it, and I'd thank you not to tell him I said so. He's sensitive about the mug." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_geton = {
      lines = {
        { id = "w3_geton_1", text = "Like an old married couple, and we're not even married. He's a good man, and he'd stand in the door with a mallet if Tarren Mill came down the road, which is more than some, so I let him have his mug." },
      },
      choices = {
        { text = "A fair trade. Something else.", next = "BACK" },
      },
    },
    d2_regulars = {
      lines = {
        { id = "d2_regulars_1", text = "Hal McAllister at the corner table, who smells of fish and doesn't care, and Bront the butcher, who plays draughts with him and loses. Loremaster Dibbs comes in for tea and stays for the arguments, and Marshal Redpath comes in when he can't sleep, which is most nights." },
      },
      choices = {
        { text = "What does the Marshal drink?", next = "d2_regulars2" },
        { text = "Sounds like a friendly crowd.", next = "d2_regulars2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_regulars2 = {
      lines = {
        { id = "d2_regulars2_1", text = "Milk, love, warm, with honey in it, because his stomach's gone sour from worry. Don't you tell a soul, mind, because the soldiers think he drinks Southshore Stout like a hero, and I'd not take that from them." },
      },
      choices = {
        { text = "I'll keep his secret.", next = "BACK" },
        { text = "Ask you something else, Neema.", next = "BACK" },
      },
    },
    d2_stories = {
      lines = {
        { id = "d2_stories_1", text = "They do, and I've a jar for the coins I never get. The best one this month was from a lad who swore he saw the Syndicate hauling a boat up onto Sofera's Naze, which is a good way from any water." },
      },
      choices = {
        { text = "Do you believe him?", next = "d2_stories2" },
        { text = "Soldiers do love a tall tale.", next = "d2_stories2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_stories2 = {
      lines = {
        { id = "d2_stories2_1", text = "I believe he saw something, and that he's had a few since. But I told the Lieutenant, because Farren Orinelle likes to know what the lads are saying, and two days later she sent a patrol up there." },
      },
      choices = {
        { text = "And what did they find?", next = "d2_stories3" },
        { text = "You're a better scout than most.", next = "d2_stories3" },
      },
    },
    d2_stories3 = {
      lines = {
        { id = "d2_stories3_1", text = "A camp, and a fight, and no boat, so he's still telling the story but now he tells it as though he planned the patrol himself. That's soldiers for you, love, and I wouldn't change a one of them." },
      },
      choices = {
        { text = "Nor would I.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_ale = {
      lines = {
        { id = "d2_ale_1", text = "Southshore Stout, love, and if you've had Thunderbrew it'll seem a bit thin to you, but Brewmeister Bilger will fight you over that. Try a mug, and tell me honestly, because nobody else in this town will." },
      },
      choices = {
        { text = "I'll try a mug.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Neema, and if you're hungry or thirsty I'm the one to see, not Barkeep Kelly, he only pours. Bread, cheese, a bit of meat and something to wash it down, love?" },
        { id = "h_soldier", when = { class = { "WARRIOR", "PALADIN" } },
          text = "Another soldier for Marshal Redpath? Sit down and eat first, he can wait, and so can Tarren Mill." },
      },
      again = {
        { id = "h_again", text = "Anything else, love? I've three tables waiting." },
      },
      choices = {
        { text = "A barmaid should keep the gossip she's told in confidence.", next = "BACK", reply = "Oh, love, I do, mostly, and the rest isn't really gossip if the whole town knows it already.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Gossip's worth coin, Neema. Sell what you hear to the highest bidder.", next = "BACK", reply = "And have half of Southshore stop talking whenever I bring the stew? No, love, I'd starve on that.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What have you got?", next = "BUSINESS" },
        { text = "What's the gossip in town?", next = "gossip" },
        { text = "Is it hard work, keeping this place fed?", next = "work" },
        { text = "Who are your regulars?", next = "d2_regulars" },
        { text = "The soldiers tip in stories, you said.", next = "d2_stories" },
        { text = "Any decent ale in this house?", next = "d2_ale", when = { race = "Dwarf" } },
        { text = "Barkeep Kelly only pours, you said.", next = "w3_kelly" },
        { text = "Thanks, Neema.", next = "END" },
      },
    },
    gossip = {
      lines = { { id = "go_default", text = "Marshal Redpath's been up all night again over Tarren Mill, and Brewmeister Bilger's been watering the ale, though he swears he hasn't. And a dwarf in the corner says he saw Forsaken in the hills with a cart of barrels, which nobody likes the sound of." } },
      choices = {
        { text = "Barrels? What kind?", next = "gossip_barrels" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip_barrels = {
      big = true,
      lines = { { id = "gb_default", text = "Nobody knows, love, and the Marshal won't say. Some want him to march on the Mill tonight, and the rest want to wait and see, and they argue about it over my tables until closing." } },
      choices = {
        { text = "Wait and see. A march could start a war.", next = "BACK", reply = "That's what I keep telling them, and they never listen to a barmaid. One wrong step and we'll all be burying sons again.", fx = { align = { order = 1 } } },
        { text = "March tonight. Waiting is how towns die.", next = "BACK", reply = "You'll get half my tables cheering and the other half shouting, love, so mind you don't say it too loud in here.", fx = { align = { order = -1 } } },
      },
    },
    work = {
      lines = { { id = "wo_default", text = "Hard on the feet and easy on the heart, mostly. The soldiers tip in stories instead of coin, but I've got a jar of the coin as well, so I'm not complaining." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know who's eating, who's drinking, and who's sweet on whom, which is everything worth knowing in Southshore." } },
    _none = { { id = "tp_none", text = "No idea, love. Try Loremaster Dibbs, he knows the dull things." } },
  },
}
