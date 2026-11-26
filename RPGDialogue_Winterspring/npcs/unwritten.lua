-- Winterspring folk with no conversation until now: the Remorseful Highborne at Kel'Theril,
-- Grum Redbeard in the Starfall barrow den, and Umaron Stragarelm in Everlook.
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Remorseful Highborne
---------------------------------------------------------------------------
P:NPC {
  key = "ws_remorseful", id = TODO_NPC("Remorseful Highborne"), name = "Remorseful Highborne",
  role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "mournful", "haunted" }, values = { "atonement" },
  impression = {
    first = "A banshee of the Highborne, grieving at the frozen lake of Kel'Theril.",
    third = "{name} met the Remorseful Highborne, a banshee who haunts the Ruins of Kel'Theril and regrets what her people did.",
  },
  greetings = {
    { id = "g_default", text = "You can see me? Then hear me, mortal, for I have waited so long for someone to listen." },
    { id = "g_crystal", when = { questActive = TODO_QUEST("Tormented By the Past") }, text = "That light you carry... the crystal of Zin-Malor. Bring it closer, please. I have not seen it whole since I died." },
    { id = "g_wynd", when = { questActive = TODO_QUEST("Remorseful Highborne") }, text = "Go to Wynd Nightchaser at Starfall. Let her decide what becomes of the crystal, and of us." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Once, I was a Highborne sorceress of Kel'Theril. We served Queen Azshara and drew on powers we did not understand, and when the world broke, we paid for it. Now we remain here, bound to the lake." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "You are kaldorei. Your ancestors fought mine in the war that ended everything. I do not blame you for hating us." },
        { id = "h_done", when = { questDone = TODO_QUEST("Remorseful Highborne") }, text = "The others are quieter since the crystal left. I think, perhaps, some of them have finally begun to rest." },
      },
      again = {
        { id = "h_again", text = "What else would you know of the dead?" },
        { id = "h_again2", text = "Ask, mortal. Time means little to me now." },
      },
      choices = {
        { text = "What happened here at Kel'Theril?", next = "kel" },
        { text = "What is the crystal of Zin-Malor?", next = "crystal" },
        { text = "Why do you remain here?", next = "remain" },
        { text = "Your people destroyed the world. Why should I help you?", next = "hate", when = { race = "NightElf" } },
        { text = "Farewell, spirit.", next = "END" },
      },
    },
    kel = {
      lines = { { id = "ke_default", text = "Kel'Theril was a place of learning, where the Highborne studied the arcane by the water's edge. When the Well of Eternity was destroyed, the cold came, and we died here, and no one remembered us." } },
      choices = {
        { text = "Did you know what Azshara intended?", next = "kel2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kel2 = {
      lines = { { id = "k2_default", text = "Some of us knew, and most of us chose not to see. I was one who chose not to see. That is my shame, and it has outlasted my flesh by ten thousand years." } },
      choices = {
        { text = "Choosing not to see is still a crime.", next = "BACK", reply = "Yes. It is. I know that now.", fx = { align = { light = 1 } } },
        { text = "You were only following your queen.", next = "BACK", reply = "That is what we told ourselves. It was never enough.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crystal = {
      lines = { { id = "cr_default", text = "A focus for our power, shattered when Kel'Theril fell. The druids would see it in Fandral Staghelm's hands, and perhaps that is fitting. The Highborne have no right to it now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    remain = {
      lines = { { id = "re_default", text = "Because our guilt holds us, and the others here are not as sorry as I am. They rage, and they would harm you if they could. Be careful by the water." } },
      choices = { { text = "I'll be careful. Something else.", next = "BACK" } },
    },
    hate = {
      lines = { { id = "ha_default", text = "You should not, for my sake. Do it for the land, so that what was taken from it is not used again by someone worse." } },
      choices = { { text = "For the land, then.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Grum Redbeard
---------------------------------------------------------------------------
P:NPC {
  key = "ws_grum", id = TODO_NPC("Grum Redbeard"), name = "Grum Redbeard",
  role = "citizen", tier = "service", race = "Dwarf",
  communities = { "winterspring_wilds" }, temper = { "jovial", "gruff" }, values = { "kin", "comfort" },
  impression = {
    first = "A dwarf making himself at home in a night elf barrow den.",
    third = "{name} met Grum Redbeard, a dwarf who keeps warm in the barrow den at Starfall Village.",
  },
  greetings = {
    { id = "g_default", text = "Shut the door behind ye, if ye can find it! It's cold enough out there to freeze a beard solid." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A dwarf! In Winterspring! Come in, come in, there's a fire and nobody's usin' half of it." },
  },
  start = "hello",
  nodes = {
    xfound = {
      narr = "He rummages in a pack and pulls out a chipped piece of blue stone.",
      lines = { { id = "xfound_default", text = "Bits of carved stone, mostly, and a bowl Jaron swears is ten thousand years old. I think it's a chamber pot. Either way, the League'll want it, and they pay by the pound." } },
      choices = {
        { text = "Should you be taking things from elven ruins?", next = "xtaking" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtaking = {
      lines = { { id = "xtaking_default", text = "Aye, well, that's the argument, isn't it? The elves say it's their history and we're robbin' it. I say history in a museum's better than history under the snow. Who's right, eh?" } },
      choices = {
        { text = "The elves are right. It's their past.", next = "BACK", reply = "Ach, you sound like the druid who keeps scowlin' at me.", fx = { align = { order = 1 } } },
        { text = "Knowledge belongs to whoever digs it up.", next = "BACK", reply = "Ha! Now there's a proper Explorers' League answer.", fx = { align = { order = -1 } } },
      },
    },
    xdruids = {
      lines = { { id = "xdruids_default", text = "They sleep, mostly, so we get on famous. One woke up last week and asked me what century it was. I told him, and he went back to sleep looking very disappointed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfood = {
      lines = { { id = "xfood_default", text = "I trade with the goblins at Everlook, though they charge a dwarf's ransom for a wheel of cheese. And I've a cask of Thunderbrew hidden in the den that I'll deny havin' to anyone who asks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xkin = {
      lines = { { id = "xkin_default", text = "Dun Morogh, born and bred, so I know cold, lad. But this Winterspring cold is a different beast. It gets into your beard and argues with ye. Sit down and warm yerself!" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "Grum Redbeard's the name. I came north to poke at the old elven ruins, same as Jaron Stoneshaper, and I've been hidin' in this barrow den from the snow ever since." },
      },
      again = {
        { id = "h_again", text = "What else, eh? Sit by the fire while ye ask." },
        { id = "h_again2", text = "Aye? Out with it." },
      },
      choices = {
        { text = "What have you found in the ruins so far?", next = "xfound" },
        { text = "How do you get on with the druids?", next = "xdruids" },
        { text = "How do you eat out here?", next = "xfood" },
        { text = "A fellow dwarf! Where are you from?", next = "xkin", when = { race = "Dwarf" } },

        { text = "Why not stay out with Jaron at the ruins?", next = "jaron" },
        { text = "What's a barrow den?", next = "barrow" },
        { text = "Farewell, Grum.", next = "END" },
      },
    },
    jaron = {
      lines = { { id = "ja_default", text = "Because Jaron likes the cold more than any sane dwarf ought to, and because the ruins are full of angry ghosts. I'll dig a nice warm tunnel any day, but I'll not argue with a banshee." } },
      choices = {
        { text = "Somebody has to face those ghosts.", next = "BACK", reply = "Aye, and that somebody can be you, lad.", fx = { align = { honor = 1 } } },
        { text = "Staying warm is the smarter choice.", next = "BACK", reply = "Ha! A dwarf after my own heart.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    barrow = {
      lines = { { id = "ba_default", text = "Where the elf druids sleep, so they tell me, deep in their dreams. It's quiet, and it's warm, and the druids don't snore, which is more than I can say for Jaron." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    jaron = { { id = "tp_xjaron", text = "Jaron Stoneshaper. Good dwarf, terrible sense. He'll freeze out there one of these days." } },
    everlook = { { id = "tp_xeverlook", text = "Goblin town. Good ale, bad prices, and a sense o' humour about it." } },
  },
}

---------------------------------------------------------------------------
-- Umaron Stragarelm (Everlook)
---------------------------------------------------------------------------
P:NPC {
  key = "ws_umaron", id = TODO_NPC("Umaron Stragarelm"), name = "Umaron Stragarelm",
  role = "citizen", tier = "service", race = "Goblin",
  communities = { "everlook" }, temper = { "shrewd", "chatty" }, values = { "profit" },
  impression = {
    first = "A goblin in Everlook who seems to do nothing and know everything.",
    third = "{name} met Umaron Stragarelm, a goblin of Everlook who watches the trade come and go.",
  },
  greetings = {
    { id = "g_default", text = "Hey, hey, a new face in Everlook! Don't mind me, I'm just watchin' the money move." },
  },
  start = "hello",
  nodes = {
    xcartel = {
      narr = "He taps the side of his nose and leans closer.",
      lines = { { id = "xcartel_default", text = "Eyes and ears, pal. Who's buyin', who's sellin', and who's sellin' what they shouldn't. Then I write it all down, and somebody in Gadgetzan decides if it matters." } },
      choices = {
        { text = "That sounds like spying.", next = "xspy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xspy = {
      lines = { { id = "xspy_default", text = "Spying's such an ugly word. I prefer market research. Everybody does it, pal; I just do it out in the open where everybody can see me doin' it. Do you think that's honest, or just clever?" } },
      choices = {
        { text = "Honest enough. You don't hide what you are.", next = "BACK", reply = "See? You get it. That's why I like you.", fx = { align = { honor = 1 } } },
        { text = "Clever. Honest people don't keep ledgers on neighbours.", next = "BACK", reply = "Ouch. You'd make a terrible goblin, and I mean that kindly.", fx = { align = { honor = -1 } } },
      },
    },
    xdeal = {
      lines = { { id = "xdeal_default", text = "A Timbermaw elder traded forty frostsaber pelts for one music box. One! It played a little tune and spun a little dancer. He cried when he heard it, and I still can't decide who got the better deal." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xleave = {
      lines = { { id = "xleave_default", text = "Leave? Outside are yetis and wildkin and furbolgs with bad tempers. Inside are hot food and gossip. Pal, I'm a goblin; I can do the arithmetic." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xgoblin = {
      lines = { { id = "xgoblin_default", text = "Sell furs south and boots north, and never the other way. And if Vizzie offers you a drink on the house, check the house. Nothin' in Everlook is ever really free." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "Umaron Stragarelm, at your service, though I don't actually provide any services. I'm here for the cartel, keepin' an eye on who buys what and who's selling it cheap." },
      },
      again = {
        { id = "h_again", text = "What else you wanna know, pal?" },
        { id = "h_again2", text = "Still here? Good. Talk's cheap, so let's have some." },
      },
      choices = {
        { text = "What does the cartel want with you here?", next = "xcartel" },
        { text = "What's the biggest deal you've seen here?", next = "xdeal" },
        { text = "Do you ever leave the town?", next = "xleave" },
        { text = "Got any tips for a fellow goblin?", next = "xgoblin", when = { race = "Goblin" } },

        { text = "Who runs Everlook?", next = "who" },
        { text = "Why would anyone trade in this cold?", next = "cold" },
        { text = "See you around, Umaron.", next = "END" },
      },
    },
    who = {
      lines = { { id = "wh_default", text = "Innkeeper Vizzie runs the inn, the guards run the gate, and Gadgetzan runs everybody. Everlook's a Steamwheedle town, neutral as can be, and we don't care what color your banner is." } },
      choices = {
        { text = "Neutrality is just greed with good manners.", next = "BACK", reply = "Ha! Maybe so, pal, but greed keeps the peace better than swords do.", fx = { align = { order = -1 } } },
        { text = "A neutral town keeps the peace. That's worth something.", next = "BACK", reply = "Now you're talkin' sense. Somebody's gotta.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cold = {
      lines = { { id = "co_default", text = "Furs, pal. Frostsaber pelts, chimaera hides, and the stuff the Timbermaw trade for. Folks pay a fortune for 'em down south, and they're up here for the taking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    steamwheedle = { { id = "tp_xsteam", text = "The cartel. Everlook, Gadgetzan, Booty Bay and Ratchet. Neutral, profitable, and always watchin'." } },
    timbermaw = { { id = "tp_xtimbermaw", text = "Furbolgs who still have their wits. Good traders, if you've made friends first." } },
  },
}

-- Elder Brightspear: a night elf ancestor honored at the Lunar Festival, at the Ruins of Kel'Theril.
P:NPC {
  key = "ws_elder_brightspear", id = 15606, name = "Elder Brightspear", gender = "female",
  role = "questgiver", tier = "quest",
  communities = { "lunar_elders" }, temper = { "gentle", "melancholy" }, values = { "memory", "faith" },
  notices = { "race" },
  impression = {
    first = "A night elf elder spirit standing in the snow among the broken stones of Kel'Theril.",
    third = "{name} honored Elder Brightspear, a night elf ancestor among the ruins of Kel'Theril.",
  },
  greetings = {
    { id = "g_default", text = "Peace, traveler. The snow is cold, but the memory of this place is colder." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival has come, and you found me even here. That pleases me." },
    { id = "g_honored", when = { questDone = TODO_QUEST("Brightspear the Elder") }, text = "You have honored me once. Carry it well, and keep warm." },
  },
  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "A Kaldorei walks among these ruins. Do you know what they once were?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Brightspear, an elder of the Kaldorei. I come to Kel'Theril each year at the festival, to remember what was lost here." } },
      again = { { id = "h_again", text = "Ask what you wish." } },
      choices = {
        { text = "What happened at Kel'Theril?", next = "ruins" },
        { text = "What is the Lunar Festival?", next = "festival" },
        { text = "I've come to honor you, Elder.", next = "honor" },
        { text = "What were these ruins, Elder?", next = "highborne", when = { race = "NightElf" } },
        { text = "Farewell.", next = "END" },
      },
    },
    ruins = {
      lines = { { id = "r_default", text = "It was a city of the Highborne once, proud and full of magic. Their pride brought the Sundering, and the snow covered what was left." } },
      choices = {
        { text = "The Highborne got what they deserved.", next = "BACK", reply = "Perhaps. But their children did not.", fx = { align = { light = -1 } } },
        { text = "Even the proud deserve to be mourned.", next = "BACK", reply = "Yes. That is why I return.", fx = { align = { light = 1 } } },
        { text = "What became of their children?", next = "children" },
      },
    },
    children = {
      lines = { { id = "ch_default", text = "Some died in the cold, and some walked south and learned humility among us. Many of the Kaldorei you know have Highborne blood, child, though few will admit it." } },
      choices = {
        { text = "Does that shame them?", next = "shame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shame = {
      lines = { { id = "sh_default", text = "It should not. Shame belongs to the choice, not the blood, and those children chose the moon and the forest. That is why I honour them here." } },
      choices = { { text = "I understand. Something else.", next = "BACK" } },
    },
    festival = {
      lines = { { id = "f_default", text = "The new year, when the elders walk among the living. Find us, honor us, and you carry a coin of ancestry as a token of our blessing." } },
      choices = { { text = "Thank you. Something else.", next = "BACK" } },
    },
    honor = {
      lines = { { id = "h2_default", text = "Then I accept, and I give you this coin. May the moon light your path through the snow." } },
      choices = { { text = "Thank you, Elder Brightspear.", next = "BACK" } },
    },
    highborne = {
      narr = "She looks at the frozen lake for a long while before answering.",
      lines = { { id = "hb_default", text = "Homes and libraries of the Highborne, before Azshara's madness. Some of them still linger here as ghosts, weeping. Be kind to them if you can." } },
      choices = { { text = "I will, Elder.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I do not know, child." } },
  },
}

---------------------------------------------------------------------------
-- Priestess of Elune: a generic priestess among Winterspring's snows.
---------------------------------------------------------------------------
P:NPC {
  key = "ws_priestess_elune", id = 12116, name = "Priestess of Elune", gender = "female",
  role = "citizen", tier = "service",
  communities = { "winterspring_wilds" }, temper = { "serene", "grave" }, values = { "Elune", "the old places" },
  impression = {
    first = "A priestess in white and silver stands in the snow, her breath faint in the cold air, her hands folded as if in prayer.",
    third = "{name} spoke with a Priestess of Elune in the snows of Winterspring.",
  },
  greetings = {
    { id = "g_default", text = "Elune's light on you, traveller. Winterspring is cold, but the moon is bright here." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The moon is up. On nights like this, I can almost hear her singing over the snow." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Elune sees you, even in the blizzard." },
  },
  start = "hello",
  nodes = {
    xshrines = {
      narr = "She brushes snow from a carved stone at her feet, revealing a crescent moon.",
      lines = { { id = "xshrines_default", text = "The old moonwells and the little altars along the Owl Wing paths. Most are buried, and some are broken. I clear one each day, if the weather allows, and pray over it before it fills again." } },
      choices = {
        { text = "Isn't that a hopeless task?", next = "xhope" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhope = {
      lines = { { id = "xhope_default", text = "Perhaps. But Elune does not ask that a task be finished, only that it be done with love. Some sisters say I should return to Darnassus where I am needed. Should I?" } },
      choices = {
        { text = "Stay. The old places deserve someone faithful.", next = "BACK", reply = "Then I will stay, and clear another stone tomorrow.", fx = { align = { light = 1 } } },
        { text = "Go home. The living need you more.", next = "BACK", reply = "Perhaps you are right. But not before spring.", fx = { align = { light = -1 } } },
      },
    },
    xcold = {
      lines = { { id = "xcold_default", text = "With prayer, and with very warm boots from the goblins of Everlook. Elune gives warmth to the spirit, but she has never claimed to warm the feet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xsaber = {
      lines = { { id = "xsaber_default", text = "The Winterspring frostsabers are sacred to the Sentinels, and Rivern Frostwind breeds them at the cave to the south. They are proud animals. They will let you ride them only if they decide to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpriest = {
      lines = { { id = "xpriest_default", text = "That faith is easier in a warm temple than in the snow. Kneel here with me for one night, and you will learn which of your prayers you truly mean." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I came to Winterspring to tend the old shrines our people built when this land was green. The snow has buried most of them, but Elune remembers where they are." },
      },
      again = { { id = "h_again", text = "Ask, if you wish. The cold makes for short conversations, but not short memories." } },
      choices = {
        { text = "Which shrines do you tend?", next = "xshrines" },
        { text = "How do you endure the cold?", next = "xcold" },
        { text = "Tell me about the frostsabers.", next = "xsaber" },
        { text = "I'm a priest as well. What can I learn here?", next = "xpriest", when = { class = "PRIEST" } },

        { text = "What happened to this land?", next = "land" },
        { text = "What threatens Winterspring now?", next = "threat" },
        { text = "Elune-adore, priestess.", next = "END" },
      },
    },
    land = {
      lines = { { id = "la_default", text = "Long ago, Winterspring was home to many kaldorei. When the Well fell and the world broke, the cold came down from the mountains. Our people left, and only the ruins stayed behind." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    threat = {
      lines = { { id = "th_default", text = "The Winterfall furbolgs have been poisoned by something from Felwood, and the demons at Darkwhisper Gorge stir. The goblins of Everlook care only for their trade. I pray, and I watch." } },
      choices = {
        { text = "The goblins should help defend this land.", next = "BACK", reply = "They will help, when it is profitable. That is their way.", fx = { align = { order = 1 } } },
        { text = "Let each look after their own.", next = "BACK", reply = "Then who looks after the land itself? Only the moon, it seems.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    elune = { { id = "tp_xelune", text = "The Mother Moon. She watches even this frozen land, and so do I." } },
    frostsabers = { { id = "tp_xsabers", text = "Proud cats of the snow. The Sentinels prize them above all mounts." } },
  },
}
