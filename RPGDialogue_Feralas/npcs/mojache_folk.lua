-- Camp Mojache, more folk: Krueg Skullsplitter (Belgrom's Grimtotem bounty), Sage Korolusk (Elven Legends)
-- and Shyn (wind rider master). Voice: bibles/mojache_folk.md
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Krueg Skullsplitter
---------------------------------------------------------------------------
P:NPC {
  key = "krueg", id = TODO_NPC("Krueg Skullsplitter"), name = "Krueg Skullsplitter",
  bible = "bibles/mojache_folk.md", role = "soldier", tier = "quest",
  communities = { "mojache" }, temper = { "fierce", "blunt" }, values = { "orders", "strength" },
  notices = { "race", "class", "kills" },

  impression = {
    first = "Krueg Skullsplitter is an orc who lives up to his name in conversation as well as battle. He wants Grimtotem horns, piles of them, and when I asked why, he looked at me as if I'd asked why water was wet.",
    third = "{name} met Krueg Skullsplitter, an orc at Camp Mojache collecting Belgrom Rockmaul's bounty on the Grimtotem.",
  },

  greetings = {
    { id = "g_hello", text = "Speak up, and speak fast. I have horns to count." },
    { id = "g_active", when = { questActive = TODO_QUEST("A Grim Discovery") }, text = "Twenty horns, and don't bring me calves' nubs. I'll know." },
    { id = "g_done", when = { questDone = TODO_QUEST("A Grim Discovery") }, text = "Belgrom has your horns, and the Grimtotem have fewer heads. A good trade." },
  },

  notice = {
    { id = "n_kills", cat = "kills", when = { killed = { name = "Grimtotem", min = 25 } },
      text = "You've been at the Grimtotem already. Good; they don't scare you, and they should scare you a little." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, hunting tauren. I don't envy you that, but Cairne himself has no love for the Grimtotem." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Krueg Skullsplitter, sent from Orgrimmar by Belgrom Rockmaul. My orders were to watch Feralas and report, until somebody found tauren in the hills who weren't any friend of ours." },
        { id = "h_before", when = { questBefore = TODO_QUEST("A Grim Discovery") },
          text = "You came across tauren out there? What did they look like? The Grimtotem! Belgrom has an interest in their kind, and a bounty on them. Go back and bring me their horns, piles of them if you can." },
        { id = "h_active", when = { questActive = TODO_QUEST("A Grim Discovery") },
          text = "The Grimtotem are not to be trifled with or underestimated, {class}. Go in hard and come back with twenty horns, and let the rivers of Feralas carry the rest away." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Grim Discovery"), days = 3 } },
          text = "That's a heavy sack. I'll send it to Orgrimmar with your name on it, and Belgrom can count them himself." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "I'll say this once, tauren: I've nothing against your people, only against the ones who'd see the Horde fall. If that sticks in your throat, take it up with the Grimtotem." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly." },
        { id = "h_again2", text = "More questions? Fine, but make them good ones." },
      },
      choices = {
        { text = "Why does Belgrom hate the Grimtotem?", next = "belgrom" },
        { text = "Who are the Grimtotem?", next = "grimtotem" },
        { text = "Why horns?", next = "horns" },
        { text = "How do the tauren here feel about this?", next = "camp" },
        { text = "Give me the bounty.", next = "BUSINESS" },
        { text = "I'll go.", next = "END" },
      },
    },

    belgrom = {
      lines = { { id = "be_default", text = "He's never told me, and I've never asked twice. Belgrom has his reasons and his temper, and only a fool goes poking at either one." } },
      choices = {
        { text = "You must have a guess.", next = "belgrom_guess" },
        { text = "Something else.", next = "BACK" },
      },
    },
    belgrom_guess = {
      lines = { { id = "bg_default", text = "My guess is the Grimtotem spit on the Warchief's name once too often, and Belgrom took it personally. He takes most things personally; it's how he got where he is." } },
      choices = {
        { text = "That's a dangerous trait in a leader.", next = "belgrom_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    belgrom_stance = {
      big = true,
      lines = { { id = "bs_default", text = "Maybe, but I'm a grunt, not a counsellor. Belgrom says hunt, so I hunt, and if he's wrong, the Warchief can tell him so." } },
      choices = {
        { text = "A soldier follows orders. That's how the Horde holds.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A soldier should know why he kills.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    grimtotem = {
      lines = { { id = "gr_default", text = "A tauren tribe that never joined Cairne's people and never wanted the Horde. They think the land belongs to them alone, and they put spears in anyone who disagrees, orc or tauren." } },
      choices = {
        { text = "Where are they in Feralas?", next = "grimtotem_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grimtotem_where = {
      lines = { { id = "gw_default", text = "Up in the north of the hills, in a compound of their own, caging beasts and chanting at the sky. You'll smell the smoke before you see them." } },
      choices = {
        { text = "I'll find them.", next = "BACK", fx = { trait = { brave = 1 }, learn = { "grimtotem" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    horns = {
      lines = { { id = "ho_default", text = "Because a horn can't be faked, and a tauren doesn't give his up while he's breathing. One horn, one Grimtotem; that's arithmetic even a grunt can do." } },
      choices = {
        { text = "That's grim, Krueg.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    camp = {
      lines = { { id = "ca_default", text = "They don't love it, and Hadoken looks at my sacks like I've filled them with his cousins. But the Grimtotem have raided these braves too, and nobody here is sorry to see them fewer." } },
      choices = {
        { text = "Be gentle with the tauren here.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The Grimtotem, the bounty, and my orders. That's all I need." } },
    background = { { id = "tp_bg", text = "Grunt of Orgrimmar, sent west by Belgrom Rockmaul. That's the whole story.", next = "belgrom" } },
    grimtotem = { { id = "tp_grim", text = "Traitors to their own kind. Bring me their horns." } },
    _none = { { id = "tp_none", text = "I don't know and I don't care, so bring me horns or bring me nothing." } },
  },
}

---------------------------------------------------------------------------
-- Sage Korolusk
---------------------------------------------------------------------------
P:NPC {
  key = "korolusk", id = TODO_NPC("Sage Korolusk"), name = "Sage Korolusk",
  bible = "bibles/mojache_folk.md", role = "scholar", tier = "quest",
  communities = { "mojache" }, temper = { "mild", "obsessive" }, values = { "lore", "patience" },
  notices = { "race", "class" },

  impression = {
    first = "Sage Korolusk is an old tauren scholar surrounded by notes he has carried across half the world. He speaks of a lost elf named Telmius Dreamseeker as if the elf were an old friend he had simply mislaid.",
    third = "{name} met Sage Korolusk at Camp Mojache, who has followed the trail of the elven master Telmius Dreamseeker all the way to Dire Maul.",
  },

  greetings = {
    { id = "g_hello", text = "Ah, a visitor! Mind the scrolls; that pile is Quel'Thalas, and that one is the Burning Steppes." },
    { id = "g_active", when = { questActive = TODO_QUEST("Elven Legends") }, text = "Any sign of Telmius in the halls? Even a footprint would do." },
    { id = "g_done", when = { questDone = TODO_QUEST("Elven Legends") }, text = "So the trail ends in Eldre'Thalas. I have been writing for days, and I may never stop." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Then you'll understand why an elven master's lost artifacts would be worth chasing across the sea." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Sage Korolusk. For years I have followed the trail of an elven master named Telmius Dreamseeker, who fled the ruin of his homeland with ancient artifacts in his keeping, and the trail has led me here." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Elven Legends") },
          text = "We followed him from the ruins of Quel'Thalas, through the Burning Steppes and across the sea to Feralas. I believe he sought sanctuary in Eldre'Thalas, which you call Dire Maul. Find him, alive or dead, for the knowledge he carried must not be lost." },
        { id = "h_active", when = { questActive = TODO_QUEST("Elven Legends") },
          text = "Search the halls of Dire Maul, {name}. If he died there, there will be something left of him, and if he lives, he will be very old and, I hope, very talkative." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Elven Legends"), days = 3 } },
          text = "Bones, and nothing more. Well, I suppose a journey this long was never going to end with tea. Thank you for looking, {name}, and for coming back to tell me." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I have more answers than this camp has ears for." },
        { id = "h_again2", text = "Ask on, ask on." },
      },
      choices = {
        { text = "Why follow one elf so far?", next = "why" },
        { text = "What is Eldre'Thalas?", next = "eldre" },
        { text = "Did you travel alone?", next = "companion" },
        { text = "What do you hope to learn?", next = "learn" },
        { text = "I'll search Dire Maul for him.", next = "BUSINESS" },
        { text = "Farewell, Sage.", next = "END" },
      },
    },

    why = {
      lines = { { id = "wh_default", text = "Because the artifacts he carried are older than my people's memory of the Earth Mother, and an old tauren would like to understand the world a little better before he joins her. Also because I am stubborn, which my students call patience to my face." } },
      choices = {
        { text = "And what do they call it behind your back?", next = "why_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_back = {
      lines = { { id = "wb_default", text = "Something about an old kodo who won't stop walking. They are not wrong, though I prefer to think of it as a long pilgrimage." } },
      choices = {
        { text = "A good pilgrimage, then.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    eldre = {
      lines = { { id = "el_default", text = "A great elven city, older than any city now standing, broken in the war that shattered the world. The ogres squat in its courtyards, and older things haunt its halls, and somewhere in there my elf went to ground." } },
      choices = {
        { text = "Who built it?", next = "eldre_built" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eldre_built = {
      lines = { { id = "eb_default", text = "The Highborne, the elves of the old queen's court, who loved magic more than their own people. Those who survived their own folly went east, and Telmius's ancestors among them, I believe." } },
      choices = {
        { text = "Fascinating.", next = "BACK", fx = { trait = { curious = 1 }, learn = { "highborne" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    companion = {
      lines = { { id = "co_default", text = "For a time I travelled with a night elf scholar called Runethorn, who was hunting the same elf for his own reasons. We parted at the sea, politely, each sure the other would get there second." } },
      choices = {
        { text = "Who got there first?", next = "companion_race" },
        { text = "Something else.", next = "BACK" },
      },
    },
    companion_race = {
      big = true,
      lines = { { id = "cr_default", text = "That depends on who sends the faster adventurer, I suppose. I would gladly share what we find with Runethorn, but the Horde would rather I didn't, and the Horde feeds me." } },
      choices = {
        { text = "Knowledge belongs to everyone. Share it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Keep it for the Horde. That's your duty.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    learn = {
      lines = { { id = "le_default", text = "How the elves bent magic to their will, and what it cost them. A people who understand that cost may avoid paying it twice, and the Horde has paid it once already." } },
      choices = {
        { text = "A wise reason.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Elves, ruins, the old roads of the world, and one particular elf who refuses to be found." } },
    background = { { id = "tp_bg", text = "A sage of the tauren, too old to stop walking.", next = "why" } },
    highborne = { { id = "tp_high", text = "Brilliant, proud and ruinous. I study them the way a sailor studies storms." } },
    _none = { { id = "tp_none", text = "Hm. I have no notes on that, which is rare enough that I'll write it down." } },
  },
}

---------------------------------------------------------------------------
-- Shyn
---------------------------------------------------------------------------
P:NPC {
  key = "shyn", id = TODO_NPC("Shyn"), name = "Shyn",
  title = "Wind Rider Master",
  bible = "bibles/mojache_folk.md", role = "flightmaster", tier = "service",
  communities = { "mojache" }, temper = { "bright", "brisk" }, values = { "sky", "speed" },
  notices = { "race" },

  impression = {
    first = "Shyn is a tauren woman with wind-burned cheeks who loves her wind riders and the rain of Feralas in equal measure. She talked while she saddled, and the saddle was finished before the sentence was.",
    third = "{name} met Shyn, the wind rider master of Camp Mojache.",
  },

  greetings = {
    { id = "g_hello", text = "The riders are fed and the sky is wet, which is how they like it. Where to?" },
    { id = "g_back", when = { metBefore = true }, text = "You again! They remember you; this one tried to nibble your hair last time." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Shyn, and these are the riders of Camp Mojache. They'll carry you to Thunder Bluff, Freewind, or wherever else the Horde has a perch." },
      },
      again = { { id = "h_again", text = "Anything else before you fly?" } },
      choices = {
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Is flying over Feralas dangerous?", next = "danger" },
        { text = "Do the riders like the rain?", next = "rain" },
        { text = "Farewell, Shyn.", next = "END" },
      },
    },
    danger = {
      lines = { { id = "da_default", text = "The Sentinels' hippogryphs sometimes come too close over the coast, and the riders want to fight them. I don't let them, but it takes a firm hand on the reins." } },
      choices = {
        { text = "Why not let them fight?", next = "danger_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_stance = {
      big = true,
      lines = { { id = "ds_default", text = "Because a rider that fights carries no one home. Some of the braves say I'm too soft, and that the elves should learn to keep their beasts away from ours." } },
      choices = {
        { text = "You're right. Keep the peace in the sky.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The braves are right. Teach the elves a lesson.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rain = {
      lines = { { id = "ra_default", text = "They love it! Mulgore's riders get dusty and cross, but these ones are always clean and always hungry. I've had to stop them diving into Wildwind Lake after fish." } },
      choices = {
        { text = "That sounds like fun.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The winds of Feralas and every perch between here and Thunder Bluff." } },
    advice = { { id = "tp_ad", text = "Lean into the turns, not away from them. The rider knows what it's doing." } },
    _none = { { id = "tp_none", text = "I don't know. I'm usually in the air when people talk about things like that." } },
  },
}
