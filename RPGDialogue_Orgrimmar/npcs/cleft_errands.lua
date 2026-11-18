-- Quiet errands in the Cleft of Shadow and the Drag: Craven Drok and Keldran (Alliance Relations),
-- and two of the Shattered Hand, Therzok the recruiter and Jes'rimon the fence. Voices: bibles/cleft_errands.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Craven Drok: wanders the Cleft and sends the right people to Keldran.
---------------------------------------------------------------------------
P:NPC {
  key = "craven_drok", id = TODO_NPC("Craven Drok"), name = "Craven Drok",
  bible = "bibles/cleft_errands.md", role = "questgiver", tier = "quest",
  communities = { "orgrimmar" }, temper = { "anxious", "smooth" }, values = { "loyal", "cunning" },
  notices = { "class", "soldier" },
  impression = {
    first = "Craven Drok paces the Cleft of Shadow with his hands behind his back, as if he were forever waiting for someone late. He talks low and close, the way a man shares a secret he has been told to share.",
    third = "{name} met Craven Drok, a restless orc in the Cleft of Shadow who carries messages for Keldran.",
  },

  greetings = {
    { id = "g_hi", text = "Walk with me a moment, would you? I think better on my feet, and this ramp is the only stretch of the Cleft nobody sells anything on." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and walking the same circle I walk. People will think we're plotting something." },
    { id = "g_done", when = { questDone = TODO_QUEST("Alliance Relations") }, text = "Keldran speaks well of you, and he barely speaks at all, so I'd listen when he does." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You stand like a grunt on the wall, all shoulders and no patience. What I have to tell you needs a bit of the second." },
    { id = "n_soldier", cat = "soldier", when = { minLevel = 30 },
      text = "You've seen real fighting now, I can tell from the scars. Good, because the people who need your help have seen plenty of it too." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Craven Drok, and before you ask, the name was my grandfather's joke and I've stopped arguing with it. Our Warchief is a wiser orc than most of his grunts give him credit for, and there are people in this city working quietly to prove it." },
        { id = "h_before", when = { minLevel = 28, questBefore = TODO_QUEST("Alliance Relations") },
          text = "Be still a moment and hear me, because what I have to say matters to our people, though it won't look like it at first. Thrall is a diplomat at heart, and he learned more than the humans' cruelty in their camps. Keldran, near the Valley of Spirits, could use someone like you." },
        { id = "h_active", when = { questActive = TODO_QUEST("Alliance Relations") },
          text = "Keldran is north of the Valley of Spirits, near the water, and he'll be expecting you. Go on, and don't shout his business about on the way." },
      },
      again = {
        { id = "h_again", text = "Keep walking with me, then. What else did you want?" },
        { id = "h_again2", text = "Go on, I'm listening, though I'll keep pacing if it's all the same to you." },
      },
      choices = {
        { text = "Why do you pace like that?", next = "pacing" },
        { text = "Who is Keldran, and what does he want?", next = "keldran" },
        { text = "Why do they call you Craven?", next = "name" },
        { text = "What goes on down here in the Cleft?", next = "cleft" },
        { text = "Do you miss the old Horde, Drok?", next = "oldhorde", when = { race = "Orc" } },
        { text = "I'll leave you to your walking.", next = "END" },
      },
    },
    pacing = {
      lines = { { id = "pa_default", text = "Eleven years in the internment camps, friend, in a pen you could cross in twenty steps. When Thrall broke us out, I promised myself I'd never stand still again unless someone made me, and nobody's tried yet." } },
      choices = {
        { text = "Which camp were you in?", next = "camp" },
        { text = "Something else, Drok.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "cp_default", text = "One in the hills south of Durnholde, where the guards were bored rather than cruel, which was its own kind of misery. The lethargy took most of us, and I watched good warriors sit in the mud for years and forget what they were." } },
      choices = { { text = "I'm glad you got out.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    keldran = {
      lines = {
        { id = "ke_default", text = "Keldran studies magic, and other things he doesn't care to name, and he worries about how the Horde looks from the far side of the sea. The Alliance is pushing into Kalimdor, and every warlock fire they find, they lay at our door." },
        { id = "ke_done", when = { questDone = TODO_QUEST("Alliance Relations") }, text = "You've met him, so you know he's not one for idle talk. He has people in Desolace now, hunting the Burning Blade, and I'd guess he sent you there too." },
      },
      choices = {
        { text = "Why should we care what the Alliance thinks?", next = "peace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      big = true,
      lines = { { id = "pe_default", text = "Because one day the war will end, or it won't, and the difference may be whether some human lord believes we still bargain with demons. Thrall has had his fill of fighting, I think, and Keldran means to make peace a little easier to reach when the time comes." },
      },
      choices = {
        { text = "Then I'll help. Peace is worth the quiet work.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The humans caged us. Let them believe what they like.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Drok.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    name = {
      lines = { { id = "na_default", text = "My grandfather ran from a battle against the draenei once, and the clan never let him forget it, so they named his grandson to remind everyone. I've stopped minding, mostly, because a name that makes people underestimate you is worth keeping." },
      },
      choices = {
        { text = "Did he really run?", next = "name2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name2 = {
      lines = { { id = "n2_default", text = "He ran to warn a village that the warband was coming, which is a different thing from running away, though nobody wanted to hear it at the time. I suppose that's why I carry messages now, since it runs in the family." } },
      choices = { { text = "That's a better story than the name.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    cleft = {
      lines = { { id = "cl_default", text = "Warlocks on one side, rogues on the other, and poison and reagents sold in between, while everyone pretends not to be listening. I walk the ramp because a man who's always moving is a man nobody bothers to watch." },
      },
      choices = { { text = "Something else, Drok.", next = "BACK" } },
    },
    oldhorde = {
      big = true,
      lines = { { id = "oh_default", text = "I miss the feeling of it, the drums and ten thousand voices, and I'd be lying if I said otherwise. I don't miss what fed it, though, because I remember the green in our blood and what we did with it." } },
      choices = {
        { text = "We were strong then. We should be strong again.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Thrall's Horde is better, even if it's quieter.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born in Draenor, raised in a camp, freed by Thrall, and walking ever since. It isn't much of a story, but it keeps me moving." } },
    advice = { { id = "tp_ad", text = "Keep your voice down in the Cleft, and keep your feet moving. Nobody stabs a man who isn't where they expected him to be." } },
    _none = { { id = "tp_none", text = "I don't know that one, friend, and I've walked past nearly every conversation in this city." } },
  },
}

---------------------------------------------------------------------------
-- Keldran: proving to the Alliance that the Horde has no truck with demons.
---------------------------------------------------------------------------
P:NPC {
  key = "keldran", id = TODO_NPC("Keldran"), name = "Keldran",
  bible = "bibles/cleft_errands.md", role = "questgiver", tier = "quest",
  communities = { "orgrimmar" }, temper = { "calm", "sharp" }, values = { "practical", "loyal" },
  notices = { "fel", "class" },
  impression = {
    first = "Keldran is a quiet orc who calls himself a student of magic and other mystical arts, and he chooses every word as if it cost him. He wants the Alliance to stop believing the Horde still deals with demons, and he is willing to work outside the usual channels to make it so.",
    third = "{name} met Keldran, an orc in Orgrimmar who sends agents to Desolace to root out the Burning Blade.",
  },

  greetings = {
    { id = "g_hi", text = "Putanni, {class}. Sit, if you like, since this business takes a little longer to explain than a sword stroke." },
    { id = "g_takata", when = { questDone = TODO_QUEST("Alliance Relations") }, text = "Takata's reports are good, and the Blade is bleeding in Desolace. You had a hand in that, so you're welcome here." },
  },

  notice = {
    { id = "n_lock", cat = "fel", when = { class = "WARLOCK" },
      text = "You carry the smell of the Twisting Nether on you, and that's the very thing the humans fear about us. I don't hold it against you, but I'd ask you to be careful who sees your demons in Desolace." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Keldran, a student of magic and of other mystical arts that have nothing to do with demons, whatever the rumours say. My work is quieter than most, and it serves the Warchief in ways he may not need to hear about." },
        { id = "h_active", when = { questActive = TODO_QUEST("Alliance Relations") },
          text = "Craven sent you, so you're someone who can keep a confidence. The business I have needs more subtlety than you're used to, but it's no less important for that." },
        { id = "h_desolace", when = { questActive = TODO_QUEST("Alliance Relations (2)") },
          text = "Desolace is south of the Charred Vale, past Stonetalon, and Takata Steelblade waits at Ghost Walker Post above the Kodo Graveyard. Don't linger among the bones, because the dead there are restless." },
      },
      again = {
        { id = "h_again", text = "Ask what you need to, {class}. I would rather you understood the work than simply did it." },
        { id = "h_again2", text = "There's more, I can see it in your face. Go on." },
      },
      choices = {
        { text = "What work do you have in Desolace?", next = "plan" },
        { text = "Why does it matter what the Alliance believes?", next = "why" },
        { text = "Does the Warchief know about this?", next = "thrall" },
        { text = "What sort of magic do you study?", next = "magic" },
        { text = "A Forsaken warlock hunting warlocks? Explain Maurin.", next = "maurin", when = { race = "Scourge" } },
        { text = "I'll take my leave, Keldran.", next = "END" },
      },
    },
    plan = {
      lines = { { id = "pl_default", text = "The Burning Blade has a foothold in Desolace, among the satyrs and the centaur, and every Alliance scout who passes sees orc warlocks dancing with demons. I have sent Takata Steelblade to cut the demons down and Maurin Bonesplitter to deal with the Blade's warlocks." } },
      choices = {
        { text = "Who is Takata Steelblade?", next = "takata" },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_blade" } } },
      },
    },
    takata = {
      lines = { { id = "tk_default", text = "A warrior who doesn't care for warlocks and won't pretend to, which makes for honest company beside Maurin. Takata hunts anything demonic in that valley, and hates the smell of centaur dung nearly as much as the Blade." } },
      choices = { { text = "Something else, Keldran.", next = "BACK" } },
    },
    why = {
      lines = { { id = "wh_default", text = "Because the Alliance is pushing deeper into Kalimdor every season, and they draw conclusions from what they find. If they decide the Horde has bargained with the Burning Legion again, no ambassador in Theramore will ever take our word for anything." } },
      choices = {
        { text = "So you're doing this for peace with them.", next = "peace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      big = true,
      lines = { { id = "pe_default", text = "I'm doing it so peace is possible, which isn't the same thing as wanting it tomorrow. The Warchief is growing weary of the war, I think, and when he reaches for a truce I want the humans to have no excuse to slap his hand away." } },
      choices = {
        { text = "A truce would save more lives than any battle.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The humans don't deserve our courtesy, Keldran.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    thrall = {
      lines = { { id = "th_default", text = "He knows the Blade must be driven out, and he's said as much in his own hall. Whether he knows exactly whom I've sent, and why, is something I haven't troubled him with yet." } },
      choices = {
        { text = "You're acting without his orders.", next = "orders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders = {
      big = true,
      lines = { { id = "or_default", text = "I'm acting in the spirit of them, which is what a good servant does when his master has a hundred other fires to put out. If I'm wrong, I'll answer for it, and the Warchief will be no worse off for my mistake." } },
      choices = {
        { text = "That's not your choice to make. Tell him.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sometimes the work gets done faster without asking.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Keldran.", next = "BACK" },
      },
    },
    magic = {
      lines = { { id = "mg_default", text = "Wards, mostly, and the reading of old seals, and the spirits our shaman speak with, though I haven't their gift for it. A man who studies how demons are bound learns quickly how to tell an honest circle from a dishonest one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    maurin = {
      lines = { { id = "ma_default", text = "Maurin knows how the Blade's warlocks think, because he once studied what they study, and he's of your people, so he doesn't frighten easily. A sword cuts down the demon, but it takes a warlock to know where the next one will be called." } },
      choices = { { text = "Something else, Keldran.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a scribe for a shaman in the camps, which taught me to read human letters. I've found it more useful than any spell." } },
    advice = { { id = "tp_ad", text = "Learn what your enemy fears about you, {class}, and then make sure there's nothing behind it." } },
    _none = { { id = "tp_none", text = "That's outside what I study. Ask a shaman, or a scout, or someone with more patience for rumour than I have." } },
  },
}

---------------------------------------------------------------------------
-- Therzok: recruits for the Shattered Hand, and thinks the Warchief too timid.
---------------------------------------------------------------------------
P:NPC {
  key = "therzok", id = TODO_NPC("Therzok"), name = "Therzok",
  bible = "bibles/cleft_errands.md", role = "questgiver", tier = "quest",
  communities = { "orgrimmar" }, temper = { "sharp", "proud" }, values = { "ambitious", "cunning" },
  notices = { "stealth", "class" },
  impression = {
    first = "Therzok speaks for the Shattered Hand in the Cleft of Shadow, and he speaks of the old Horde's glory with a hunger he doesn't bother to hide. He measures everyone who comes near him as a weapon, and tells them so.",
    third = "{name} met Therzok, a Shattered Hand recruiter in Orgrimmar's Cleft of Shadow.",
  },

  greetings = {
    { id = "g_hi", text = "Keep walking, unless you've business with the Hand. If you do, keep your voice down while you tell me." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Kaplak said you'd come, and here you are, quieter than most. Good, because that's the first lesson and you've already learned it." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Come out of the shadow, you're standing in my light. The Hand notices its own, and we notice everyone else first." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Therzok of the Shattered Hand. We work from the shadows of Orgrimmar so the Horde can remember what it was, before the Warchief taught it to be careful." },
        { id = "h_kaplak", when = { questActive = TODO_QUEST("Therzok") },
          text = "Good, Kaplak was able to reach you. We have things to speak of, not least your future with the Hand, if you have the stomach for one." },
        { id = "h_tazan", when = { questActive = TODO_QUEST("The Shattered Hand") },
          text = "Tazan still breathes, then. He trades with the pirates on the coast south of Ratchet, and he knows things about the Hand that he has no business knowing." },
        { id = "h_satchel", when = { questDone = TODO_QUEST("The Shattered Hand") },
          text = "Tazan is gone, which pleases me, but a locked satchel tells me nothing. You did the easy part, and the harder test is still in front of you." },
      },
      again = {
        { id = "h_again", text = "Well? You're still here, so ask." },
        { id = "h_again2", text = "Speak plainly, recruit. The Hand doesn't reward hesitation." },
      },
      choices = {
        { text = "What is the Shattered Hand?", next = "hand" },
        { text = "Who is Tazan, and why must he die?", next = "tazan" },
        { text = "You speak against the Warchief?", next = "thrall" },
        { text = "Kaplak sent me. What does the Hand want of me?", next = "kaplak", when = { class = "ROGUE" } },
        { text = "Leave the shadows to you, then.", next = "END" },
      },
    },
    hand = {
      lines = { { id = "ha_default", text = "Our clan was the fist of the old Horde, the ones who cut off their own fingers to swear their oaths and fought on with blades bound to the stump. We build strength in the dark now and strike at whoever leaves themselves exposed." } },
      choices = {
        { text = "The old Horde nearly destroyed us.", next = "pride" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pride = {
      big = true,
      lines = { { id = "pr_default", text = "The old Horde conquered a world, recruit, and it was the demon blood that ruined us, not the strength. Take the demons away and keep the strength, and you have something the humans would never dare to cage again." } },
      choices = {
        { text = "Then let the Horde be conquerors again.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Thrall's caution kept us alive. I'll keep it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tazan = {
      lines = { { id = "tz_default", text = "Tazan is a troll who sells what he hears to the Southsea pirates near Ratchet, and lately he's been hearing about us. He carries a satchel with everything he's learned, and I want it in my hand before it's in a pirate's." } },
      choices = {
        { text = "What happens if the satchel's locked?", next = "satchel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    satchel = {
      lines = { { id = "sa_default", text = "Then you'll find out how to open it, because that's the second test, and the one that matters. Anyone can kill a fat troll on a beach, but the Hand wants people who can get into what's been shut." } },
      choices = { { text = "Something else, Therzok.", next = "BACK" } },
    },
    thrall = {
      big = true,
      lines = { { id = "th_default", text = "I serve the Horde, and the Warchief leads it, so I do as I'm told. But he is too subtle, too slow to unleash what we are, and somebody has to keep the old edge sharp for the day he needs it." } },
      choices = {
        { text = "The Warchief's word is law. Remember that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Someone should keep the edge sharp. You're right.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kaplak = {
      lines = { { id = "kp_default", text = "Kaplak tells me you can handle yourself and aren't shy of a little sneakery. The Hand wants eyes in Ratchet, on the coast and in the Barrens, and a blade that stays sheathed until I say otherwise." } },
      choices = {
        { text = "And what do I get from it?", next = "kaplak2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kaplak2 = {
      lines = { { id = "k2_default", text = "Coin, when the work pays, and the Hand at your back when it doesn't. There are rogues in this city who walk alone, and you'll notice they don't walk for very long." } },
      choices = { { text = "Something else, Therzok.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I carried a blade for the Hand at the Dark Portal, and I've been carrying it since. Some of us never put it down." } },
    advice = { { id = "tp_ad", text = "Never let anyone see the knife until it's in them, and never tell anyone who gave you the order." } },
    _none = { { id = "tp_none", text = "The Hand knows plenty, recruit, but it doesn't share for free, and it doesn't share that." } },
  },
}

---------------------------------------------------------------------------
-- Jes'rimon: the Hand's fence on the top floor above Yelmak's shop.
---------------------------------------------------------------------------
P:NPC {
  key = "jesrimon", id = TODO_NPC("Jes'rimon"), name = "Jes'rimon",
  bible = "bibles/cleft_errands.md", role = "questgiver", tier = "quest",
  communities = { "orgrimmar" }, temper = { "smooth", "cheerful" }, values = { "cunning", "greedy" },
  notices = { "class", "purse" },
  impression = {
    first = "Jes'rimon keeps to the top floor above Yelmak's alchemy shop in the Drag, a lanky troll who greets everyone as if he'd been expecting them. He buys and sells for the Shattered Hand and doesn't mind who knows it, as long as they don't say it loudly.",
    third = "{name} met Jes'rimon, a troll fence for the Shattered Hand above Yelmak's shop in the Drag.",
  },

  greetings = {
    { id = "g_hi", text = "Ah, you find the stairs, mon, and most folk never even look up. That be the first good sign." },
    { id = "g_tablet", when = { questActive = TODO_QUEST("Delivery to Jes'rimon") }, text = "That be Jediga's package you carryin', me can smell the Azshara salt on it from here. Come, come, set it down gentle." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You walk like the Hand teach you, or like you teach yourself, and either way me like it. Keep that up, mon." },
    { id = "n_purse", cat = "purse", when = { class = "WARRIOR" },
      text = "Your purse be hangin' loose on the outside of your belt, warrior, and every cutpurse from here to the bank already see it. Me not sayin' anything, me just sayin'." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jes'rimon and the Shattered Hand both bid you welcome, {class}. Don't look so surprised, mon, because even the highest roofs in Orgrimmar throw a shadow, and somebody got to live in it." },
        { id = "h_claws", when = { questActive = TODO_QUEST("Bone-Bladed Weapons") },
          text = "You still be huntin' them white claws, mon? Un'Goro be far, me know, but the Hand's clients be patient only so long." },
        { id = "h_clawsdone", when = { questDone = TODO_QUEST("Bone-Bladed Weapons") },
          text = "Them white claws you bring make the finest blades me sell this year, and the buyers be very happy. You make Jes'rimon look good, and he not forget it." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Jes'rimon got time for a friend of the Hand." },
        { id = "h_again2", text = "Ask, ask. The worst me can say is no, and me rarely say it to good customers." },
      },
      choices = {
        { text = "You admit you work for the Shattered Hand?", next = "hand" },
        { text = "Where is Un'Goro Crater?", next = "ungoro" },
        { text = "Who buys weapons made of raptor claw?", next = "claws" },
        { text = "Tell me about Jediga.", next = "jediga" },
        { text = "I'll leave you to your perch.", next = "END" },
      },
    },
    hand = {
      lines = { { id = "ha_default", text = "Thrall, even with his good heart, know the Hand be necessary to keep orc and troll safe. We watch what the guards cannot see, and in return nobody climb these stairs to ask Jes'rimon where his goods come from." } },
      choices = {
        { text = "That sounds like a fence's excuse.", next = "fence" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fence = {
      big = true,
      lines = { { id = "fe_default", text = "It be a fence's excuse and a true thing both, mon, and those be the best kind. A city need somewhere for the quiet goods to go, or they go to the pirates instead, and then where be the Horde?" } },
      choices = {
        { text = "Better the Hand than the pirates. I see that.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Stolen goods are stolen goods, whoever buys them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ungoro = {
      lines = { { id = "un_default", text = "Un'Goro Crater be far to the south of Kalimdor, past the Thousand Needles and down through Tanaris. Look for the big stones floatin' over the road, because they mark the way in, and keep your eyes open after, since the raptors not wait far from the entrance." } },
      choices = {
        { text = "Floating stones?", next = "ungoro2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ungoro2 = {
      lines = { { id = "u2_default", text = "Just hangin' in the air like they forget to fall, mon, and the goblins in Gadgetzan swear somethin' old be buried down in that crater. Me not care what it be, me only care what the raptors carry." } },
      choices = { { text = "Something else, Jes'rimon.", next = "BACK" } },
    },
    claws = {
      lines = { { id = "cl_default", text = "Some of them Un'Goro raptors grow claws white as bone instead of black, and a blade carved from one hold an edge like nothin' you ever see. The Hand have clients who like such things, and they pay good coin, especially when it come quick." } },
      choices = {
        { text = "Who are these clients?", next = "clients" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clients = {
      lines = { { id = "ci_default", text = "Rich ones, mon, and that be all you need to know about them. Me will tell you this much, though, since you ask nice: not one of them ever hunt a raptor themselves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    jediga = {
      lines = { { id = "je_default", text = "Jediga be a fine woman, and deadly too, and what could be better than that? She work out of Valormok in Azshara now, and she send Jes'rimon the old things the night elves leave lyin' in their ruins." } },
      choices = {
        { text = "Like the Tablet of Jin'yael?", next = "tablet", when = { questDone = TODO_QUEST("Delivery to Jes'rimon") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tablet = {
      lines = { { id = "ta_default", text = "Perfect condition, that tablet, not one chip, and you carry it all that way without droppin' it in the sea. Me already know the buyer, and Jediga get her payment, so everybody be happy." } },
      choices = { { text = "Something else, Jes'rimon.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Me come from the Echo Isles with Vol'jin's people, and me find Orgrimmar have more buyers than any island ever do." } },
    advice = { { id = "tp_ad", text = "Never sell the same thing twice in one city, mon. Somebody always remember." } },
    _none = { { id = "tp_none", text = "Jes'rimon not know that one, and he know a lot of things. Maybe nobody know it." } },
  },
}
