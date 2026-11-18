-- Darkshire's corners: the Town Crier (who raises the alarm when the abomination walks the road),
-- Finbus Geargrind (gnome engineering trainer) and Malissa (poisons, behind a building).
-- Voice: bibles/darkshire_corners.md
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Town Crier
---------------------------------------------------------------------------
P:NPC {
  key = "darkshire_crier", id = TODO_NPC("Town Crier"), name = "Town Crier",
  bible = "bibles/darkshire_corners.md", role = "citizen", tier = "service",
  communities = { "darkshire" }, temper = { "loud", "nervous" }, values = { "dutiful", "community" },
  notices = { "class" },

  impression = {
    first = "Darkshire's Town Crier has a bell, a strong voice and a list of announcements that's mostly bad news. When the abomination walks the road, he's the one who shouts the town to arms.",
    third = "{name} met Darkshire's Town Crier, who rings the alarm when undead march on the town.",
  },

  greetings = {
    { id = "g_default", text = "Hear ye, hear ye! Oh, it's only you. Forgive me, friend, I shout at everyone out of habit." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! No news is good news, they say, and today there's no news, so it's a good day by Darkshire standards." },
    { id = "g_stitches", when = { killed = { name = "Stitches" } }, text = "You were there when the abomination fell! I shouted myself hoarse that night, and I'd do it again, though I hope I don't have to." },
  },

  notice = {
    { id = "n_soldier", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A fighter! If you hear me ring the bell, friend, run toward the center of town, not away from it. We'll need every sword." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Darkshire's Town Crier, friend, and my job is to tell the town what it needs to hear, which lately is mostly warnings. When something comes up the road, I'm the first to shout and the last to stop." },
        { id = "h_stitches", when = { killed = { name = "Stitches" } },
          text = "The abomination's gone, thanks to folk like you, and the night I don't have to shout 'Rouse to arms!' is a night I sleep like a babe." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Quiet so far tonight, friend, but the night's long, and my bell's never far from my hand." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm saving my voice, but I can spare a few words." },
        { id = "h_again2", text = "Ask away, friend. For once, quietly." },
      },
      choices = {
        { text = "What do you announce?", next = "announce" },
        { text = "What's this abomination?", next = "abomination" },
        { text = "Do people listen to you?", next = "listen" },
        { text = "Farewell, crier.", next = "END" },
      },
    },

    announce = {
      lines = { { id = "an_default", text = "Curfews, missing persons, the price of lamp oil, and every now and then a wedding, which I shout extra loud because it's good news. Mostly it's warnings, though, because Duskwood keeps giving me reasons." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    abomination = {
      big = true,
      lines = { { id = "ab_default", text = "A great stitched thing of corpses that marches on the town some nights, overrunning the Night Watch camps on the road. When it comes I shout 'Rouse to arms, citizens of Darkshire!' and everybody who can hold a weapon gathers in the center of town." } },
      choices = {
        { text = "When it comes, I'll stand with the town.", next = "ab_more", fx = { align = { honor = 1 } } },
        { text = "Let the Watch handle it. That's their job.", next = "ab_more", fx = { align = { honor = -1 } } },
        { text = "Who made such a thing?", next = "ab_more" },
      },
    },
    ab_more = {
      lines = { { id = "abm_default", text = "Nobody knows for certain, and nobody wants to say what they suspect. Somebody out there in the woods is sewing the dead together, friend, and the thought of it keeps me up more than the shouting does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    listen = {
      lines = { { id = "li_default", text = "They listen when I shout about the dead, friend, and ignore me when I shout about the curfew. I've stopped taking it personally, mostly." } },
      choices = {
        { text = "I'll listen.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Everything that's worth shouting about in Darkshire, friend." } },
    background = { { id = "tp_bg", text = "Born with a loud voice and no talent for anything quieter." } },
    advice = { { id = "tp_ad", text = "When you hear the bell, don't stop to ask why. Come running." } },
    night_watch = { { id = "tp_watch", text = "Brave lads, and the first to fall when the abomination comes." } },
    _none = { { id = "tp_none", text = "No announcement on that, friend, I'm afraid." } },
  },
}

---------------------------------------------------------------------------
-- Finbus Geargrind
---------------------------------------------------------------------------
P:NPC {
  key = "finbus", id = TODO_NPC("Finbus Geargrind"), name = "Finbus Geargrind",
  title = "Engineering Trainer",
  bible = "bibles/darkshire_corners.md", role = "trainer", tier = "service",
  communities = { "darkshire" }, temper = { "chatty", "harried" }, values = { "craft", "home" },
  notices = { "craft", "race" },

  impression = {
    first = "Finbus Geargrind is a gnome engineering trainer who swears he's never too busy to speak to a stranger, almost never anyway. He lives in Darkshire because it was the first town after Gnomeregan that let him set up a workbench.",
    third = "{name} met Finbus Geargrind, the gnome engineering trainer of Darkshire.",
  },

  greetings = {
    { id = "g_default", text = "I'm never too busy to speak to a stranger! Almost never, anyway... mind the solder, it's still warm." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, back again! Come in, come in, nothing's on fire at the moment." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Oh, splendid, somebody to talk to about torque ratios. Herble only wants to talk about prices." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Out here, in Duskwood! Tell me, were you a Gnomeregan gnome or an Ironforge gnome? I was Gnomeregan, third level, east workshops." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Finbus Geargrind, engineering trainer! I teach the craft to anyone with steady hands and a reasonable fear of explosions. When you outgrow me, and you will, you'll want Springspindle Fizzlegear in Ironforge." },
        { id = "h_eng", when = { profession = "Engineering" },
          text = "Back for more lessons? Splendid! You're getting good, I can tell, you've stopped flinching at the sparks." },
      },
      again = {
        { id = "h_again", text = "What else? I'll keep tinkering while we talk, if you don't mind." },
        { id = "h_again2", text = "Go on, I'm listening, mostly." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "Why Darkshire, of all places?", next = "why" },
        { text = "Do you know Viktori's star device?", next = "viktori" },
        { text = "Farewell, Finbus.", next = "END" },
      },
    },

    why = {
      big = true,
      lines = { { id = "wh_default", text = "After Gnomeregan fell, I wandered, and Darkshire was the first place that let me set up a bench without asking questions. The town needs engineers, too: lamps, traps, wagon axles, all the little things that keep the dark back." } },
      choices = {
        { text = "That's good work. You're helping people.", next = "wh_more", fx = { align = { light = 1 } } },
        { text = "You should go back and fight for Gnomeregan.", next = "wh_more", fx = { align = { light = -1 } } },
        { text = "Do you miss Gnomeregan?", next = "wh_more" },
      },
    },
    wh_more = {
      lines = { { id = "whm_default", text = "Every day, friend, every single day. But I can't fight radiation with a wrench, and here I can fight the dark with lamps, and that will have to do until the High Tinker has a plan." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },

    viktori = {
      lines = { { id = "vi_default", text = "The star-viewing contraption? He wants a bronze tube and a looking glass and who knows what else, and he's asked me six times whether it will see through fog. It won't, I keep telling him, but he keeps hoping." } },
      choices = {
        { text = "Herble sells bronze tubes too.", next = "vi_herble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vi_herble = {
      lines = { { id = "vih_default", text = "He does, and at a price that would make a goblin blush. We're friends, of course, but I wouldn't buy a bolt from him without counting the threads first." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Engineering, lamps, and every bolt in Darkshire." } },
    background = { { id = "tp_bg", text = "Gnomeregan, third level, east workshops, before everything went green." } },
    advice = { { id = "tp_ad", text = "Always keep a spare fuse. And a spare eyebrow, if you can manage it." } },
    gnomeregan = { { id = "tp_gnome", text = "Home, once. I still dream about the hum of it." } },
    _none = { { id = "tp_none", text = "Oh, that's not my field, I'm afraid, though I could build something to find out." } },
  },
}

---------------------------------------------------------------------------
-- Malissa
---------------------------------------------------------------------------
P:NPC {
  key = "malissa", id = TODO_NPC("Malissa"), name = "Malissa",
  title = "Poison Supplies",
  bible = "bibles/darkshire_corners.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "cool", "discreet" }, values = { "cunning", "practical" },
  notices = { "class", "stealth" },

  impression = {
    first = "Malissa sells poisons and empty vials from behind a building in Darkshire, out of sight of the Night Watch. She's quiet, she's polite, and she never asks what anything is for.",
    third = "{name} met Malissa, who sells poison supplies from behind a building in Darkshire.",
  },

  greetings = {
    { id = "g_default", text = "Quietly, please. The Watch knows I'm here, but they prefer not to be reminded." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Vials, or something to put in them?" },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah, one of the trade. Come around the corner where the lamplight doesn't reach." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I heard you coming, friend. The cobbles back here are loose on purpose." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Malissa. I sell vials, leaded and crystal, and the reagents to fill them, and I don't ask what they're for. In Duskwood, a blade that bites twice is worth a great deal." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue, and a careful one by the look of you. Take what you need, and if anyone asks, you came back here to get out of the wind." },
        { id = "h_priest", when = { class = { "PRIEST", "PALADIN" } },
          text = "A holy one, back here? Lost, I hope. If you're not, I'll trust you won't mention me to the commander." },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep your voice down." },
        { id = "h_again2", text = "Ask, but softly." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Why sell back here?", next = "why" },
        { text = "Do poisons work on the undead?", next = "undead" },
        { text = "Goodbye, Malissa.", next = "END" },
      },
    },

    why = {
      big = true,
      lines = { { id = "wh_default", text = "Because the commander tolerates me and the councilman doesn't, and a corner behind a building keeps everyone's conscience clean. Poison is a coward's weapon, some say, but cowards outlive heroes in Duskwood." } },
      choices = {
        { text = "Poison is dishonorable. I'd rather fight fair.", next = "BACK", reply = "Then fight fair, and I hope Duskwood returns the courtesy. Should you change your mind after a night on the Raven Hill road, my corner will still be here.", fx = { align = { honor = 1 } } },
        { text = "Fair fights are for people who like losing.", next = "BACK", reply = "You'd be surprised how few people in Darkshire will say that aloud, though plenty of them buy as if they believed it. Mind the vials; they don't care whose hands they're in.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    undead = {
      lines = { { id = "un_default", text = "Not as well as on the living, since there's not much blood left to carry it. For the walking dead, fire and a heavy mace; for the worgen, though, a good poison slows them down nicely." } },
      choices = {
        { text = "Good to know.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Vials, venoms, and who in town buys them. The last I keep to myself." } },
    background = { { id = "tp_bg", text = "Darkshire born. I learned the trade from a man who's no longer with us." } },
    advice = { { id = "tp_ad", text = "Wash your hands before you eat. Every time." } },
    worgen = { { id = "tp_worgen", text = "They bleed like anything else, and poison follows the blood." } },
    _none = { { id = "tp_none", text = "I wouldn't know, and I wouldn't say." } },
  },
}
