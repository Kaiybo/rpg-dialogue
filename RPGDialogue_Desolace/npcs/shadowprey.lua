-- Shadowprey Village, the Horde's fishing village on the Desolace coast: Taiga Wisemane (Hand of Iruxos),
-- Vark Battlescar (Vyletongue Corruption), Drulzegar Skraghook (Other Fish to Fry), Jinar'Zillen (Fish in a Bucket),
-- Innkeeper Sikewa. Voice: bibles/shadowprey.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Taiga Wisemane
---------------------------------------------------------------------------
P:NPC {
  key = "taiga", id = TODO_NPC("Taiga Wisemane"), name = "Taiga Wisemane",
  bible = "bibles/shadowprey.md", role = "questgiver", tier = "quest",
  communities = { "shadowprey" }, temper = { "grave", "patient" }, values = { "duty", "earth" },
  notices = { "race", "class" },

  impression = {
    first = "Taiga Wisemane is an old tauren with a voice like distant thunder, who speaks of demons the way other people speak of bad weather coming. He looked north toward the fortress on the hill before he looked at me.",
    third = "{name} met Taiga Wisemane, a tauren elder at Shadowprey Village set on closing the Burning Blade's portals.",
  },

  greetings = {
    { id = "g_hello", text = "Sit, {class}, and let the sea breathe a while before we speak of darker things." },
    { id = "g_active", when = { questActive = TODO_QUEST("Hand of Iruxos") }, text = "The Demon Box still lies in Thunder Axe Fortress. Each day it stays there, the Coven grows louder." },
    { id = "g_done", when = { questDone = TODO_QUEST("Hand of Iruxos") }, text = "The Hand is out of the cult's reach. I sleep a little better, though not yet well." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You carry the smell of the Twisting Nether on you, warlock. I will trust you as far as your deeds allow, and no further." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. You know better than any of us what the Burning Blade wants to bring back." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Taiga Wisemane. While the others here fish and trade, I watch the Burning Blade at Thunder Axe Fortress, and I do not like what I see." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Hand of Iruxos") },
          text = "The Burning Blade possesses a thing called the Demon Box, and within it lies the Hand of Iruxos. With it they open portals at Mannoroc Coven, and demons walk into our world through them. Take this pick, break the red crystal in the fortress, and bring the box to me." },
        { id = "h_active", when = { questActive = TODO_QUEST("Hand of Iruxos") },
          text = "Use the demon pick on the red crystal, and the box will be yours to take. Do not open it, {name}, whatever it whispers." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Hand of Iruxos"), days = 3 } },
          text = "The Hand rests here now, wrapped in hide and blessed by the Earth Mother. It is a cold thing to hold, and colder to keep." },
        { id = "h_orc", when = { race = "Orc" },
          text = "You are an orc, and the cultists in that fortress are orcs too, who chose the old masters over the Warchief. I say this not to shame you, but because you will understand them better than I ever could." },
      },
      again = {
        { id = "h_again", text = "What else weighs on you, {class}?" },
        { id = "h_again2", text = "Speak. The tide has time, and so do I." },
      },
      choices = {
        { text = "Who are the Burning Blade?", next = "blade" },
        { text = "What is Mannoroc Coven?", next = "coven" },
        { text = "What will you do with the Hand?", next = "hand" },
        { text = "Why does a fishing village worry about demons?", next = "village" },
        { text = "I once served the same masters, elder.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Tell me what must be done.", next = "BUSINESS" },
        { text = "Farewell, Taiga.", next = "END" },
      },
    },

    blade = {
      lines = { { id = "bl_default", text = "A cult of orcs who would bring back the demon lords that once enslaved their people. They hide in Durotar's caves and here in Desolace, and they call the Warchief's new ways weakness." } },
      choices = {
        { text = "How do they recruit?", next = "blade_recruit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade_recruit = {
      lines = { { id = "br_default", text = "They find the angry and the lost, the ones who miss the war, and promise them power. Some of those men drank from Mannoroth's blood once, and they remember how it felt." } },
      choices = {
        { text = "Can they be turned back?", next = "blade_turn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blade_turn = {
      big = true,
      lines = { { id = "bt_default", text = "Thrall believes his people can be freed from the demons' hold, and he has freed many. But a cultist with the fel already in his blood is a different matter, and I have seen what mercy costs here." } },
      choices = {
        { text = "Every cultist deserves a chance to turn back.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Those who chose demons have chosen their end.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    coven = {
      lines = { { id = "co_default", text = "In the south of this land lie the bones of a pit lord, great as a hill, and the ground around them has never healed. The Burning Blade gather there, because they believe the old blood still calls to its masters." } },
      choices = {
        { text = "Is that where Mannoroth died?", next = "coven_bones" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coven_bones = {
      lines = { { id = "cb_default", text = "Some say it is, and some say it is another of his kind. It does not matter to me whose bones they are; what matters is what is crawling out among them." } },
      choices = {
        { text = "I'll see it for myself.", next = "BACK", fx = { trait = { brave = 1 }, learn = { "burning_legion" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hand = {
      lines = { { id = "ha_default", text = "With the Hand, the portals the cult has opened can be sealed again. What the box opens, it can close, if the one who holds it is not tempted to keep it open." } },
      choices = {
        { text = "And will you be tempted?", next = "hand_tempt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hand_tempt = {
      lines = { { id = "ht_default", text = "Every hand that holds such a thing is tempted, {name}, mine included. That is why I will hold it only as long as I must, and then the earth will have it." } },
      choices = {
        { text = "That's wise.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    village = {
      lines = { { id = "vi_default", text = "Because Shadowprey is the Horde's only roof in all of Desolace's west, and the demons do not care that we came here for fish and trade. If the Coven spills over, the first village it finds will be ours." } },
      choices = {
        { text = "Then I'll help keep it safe.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xlock = {
      lines = { { id = "xl_default", text = "I know what you are, and I know you bind demons rather than serve them, or so you would tell me. Help me close these portals, and your deeds will speak louder than your art." } },
      choices = {
        { text = "My deeds will speak for me.", next = "BACK", fx = { affinity = 1, trait = { proud = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The Burning Blade, the Coven, and the long memory of my people. Ask what you will." } },
    background = { { id = "tp_bg", text = "An elder of the tauren, sent west with the others to keep watch where the Horde is thin." } },
    burning_blade = { { id = "tp_blade", text = "Orcs who would kneel again to the masters their Warchief broke free of. I pity them, and I will stop them." } },
    _none = { { id = "tp_none", text = "The earth has not spoken to me of that." } },
  },
}

---------------------------------------------------------------------------
-- Vark Battlescar
---------------------------------------------------------------------------
P:NPC {
  key = "vark", id = TODO_NPC("Vark Battlescar"), name = "Vark Battlescar",
  bible = "bibles/shadowprey.md", role = "questgiver", tier = "quest",
  communities = { "shadowprey" }, temper = { "blunt", "brooding" }, values = { "earth", "strength" },
  notices = { "race", "class" },

  impression = {
    first = "Vark Battlescar is a scarred tauren warrior who lives upstairs above the skinning trainer and seems to resent the stairs. He speaks of Maraudon as if it were a wound in his own side.",
    third = "{name} met Vark Battlescar, a tauren warrior at Shadowprey Village who wants the corruption inside Maraudon healed.",
  },

  greetings = {
    { id = "g_hello", text = "Mind your head on the beam. Everyone hits it once." },
    { id = "g_active", when = { questActive = TODO_QUEST("Vyletongue Corruption") }, text = "The vines are still poisoned, I take it, or you'd be smiling." },
    { id = "g_done", when = { questDone = TODO_QUEST("Vyletongue Corruption") }, text = "The druids say the vines in Maraudon have stopped weeping. Good work, {name}." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Good, because I have the arm for this work, but not the craft." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Vark Battlescar. I've fought centaur, quilboar and harpies, and none of them frightened me the way Maraudon does, because you cannot cut a sickness that lives in the earth itself." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Vyletongue Corruption") },
          text = "Deep in Maraudon the plants are rotting from the root, and the rot has a name: Noxxious. Fill this vial at the orange crystal pool inside, pour it on the Vylestem vines, and kill what crawls out of them. Eight healed plants and I'll call it a start." },
        { id = "h_active", when = { questActive = TODO_QUEST("Vyletongue Corruption") },
          text = "The orange crystal pool first, then the vines. When the scions come out of them, and they will, put them down quickly before they spit." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Vyletongue Corruption"), days = 3 } },
          text = "Eight vines healed! It's a few drops of clean water in a poisoned well, but it's more than anyone else has done." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "One of the Earth Mother's children! Then you'll feel it when you go into Maraudon, {name}, the way the ground is sick under your hooves. Don't let it get into your head." },
      },
      again = {
        { id = "h_again", text = "What else? Ask before I have to go down those stairs again." },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What is Maraudon?", next = "maraudon" },
        { text = "How did you get those scars?", next = "scars" },
        { text = "Who poisoned the plants?", next = "who" },
        { text = "Can a druid's craft help?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Give me the vial.", next = "BUSINESS" },
        { text = "Farewell, Vark.", next = "END" },
      },
    },

    maraudon = {
      lines = { { id = "ma_default", text = "A great cave in the south, holy to the centaur, who say their mother lies at its heart. The Maraudine clans guard its mouth, and beyond them the caves glow with crystals and stink of rot." } },
      choices = {
        { text = "Their mother?", next = "maraudon_mother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    maraudon_mother = {
      lines = { { id = "mm_default", text = "Theradras, they call her, a princess of the earth itself, and the centaur say Zaetar fathered them on her. The Gelkis worship her, the Magram curse her, and I'd rather not meet her either way." } },
      choices = {
        { text = "Neither would I.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'd like to see her.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },

    scars = {
      lines = { { id = "sc_default", text = "Most from the Kolkar, when they came across the Barrens for our kodo. This big one is from a Grimtotem who didn't think a tauren should fight beside orcs, and told me so with an axe." } },
      choices = {
        { text = "What happened to him?", next = "scars_grim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scars_grim = {
      big = true,
      lines = { { id = "sg_default", text = "I left him alive in the dirt, because killing him would have proven his point about the Horde making us savage. Some days I think I was wise, and some days I think he's still out there with that axe." } },
      choices = {
        { text = "Mercy was the right choice.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You should have finished it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    who = {
      lines = { { id = "wh_default", text = "The druids I trust say it comes from below, from whatever Theradras has become, and the vines are only where it rises. I'm no druid and I can't follow half of it, but I know what poison looks like, and I know you start by cutting the worst of it away." } },
      choices = {
        { text = "Then I'll start cutting.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdruid = {
      lines = { { id = "xd_default", text = "More than my axe, I'd wager. If you find a way to heal the vines without killing what grows from them, come and tell me, because I'd like to learn it before I'm too old." } },
      choices = {
        { text = "I'll come back and teach you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Fighting, scars, and Maraudon's rot. Not much else, but those I know well." } },
    advice = { { id = "tp_ad", text = "Don't breathe deep in Maraudon, and don't trust anything that blooms down there." } },
    _none = { { id = "tp_none", text = "I don't know. Ask the elder; he reads more than I do." } },
  },
}

---------------------------------------------------------------------------
-- Drulzegar Skraghook
---------------------------------------------------------------------------
P:NPC {
  key = "drulzegar", id = TODO_NPC("Drulzegar Skraghook"), name = "Drulzegar Skraghook",
  bible = "bibles/shadowprey.md", role = "questgiver", tier = "quest",
  communities = { "shadowprey" }, temper = { "bitter", "haunted" }, values = { "vengeance", "crew" },
  notices = { "race", "kills" },

  impression = {
    first = "Drulzegar Skraghook is a troll fisherman who doesn't fish anymore. He sits on the dock with his hook in his lap, staring north toward Ranazjar Isle, and speaks about the naga with a hate that hasn't cooled at all.",
    third = "{name} met Drulzegar Skraghook, the only survivor of a Shadowprey fishing crew killed by the Slitherblade naga.",
  },

  greetings = {
    { id = "g_hello", text = "You come to fish, mon? Don't. Not up north." },
    { id = "g_active", when = { questActive = TODO_QUEST("Other Fish to Fry") }, text = "More naga, mon. Always more naga." },
    { id = "g_done", when = { questDone = TODO_QUEST("Other Fish to Fry") }, text = "You killed many of them, and I thank you. It still don't feel like enough." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear. My crew was Darkspear, every one, and they'd have liked you." },
    { id = "n_naga", cat = "kills", when = { killed = { name = "Slitherblade", min = 20 } },
      text = "You got Slitherblade blood on your boots, mon. That be the finest smell on this whole coast." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "They call me Drulzegar Skraghook, mon, and I be a fisherman, or I was. My crew and I fished off Ranazjar Isle every season, until the naga came up out of the water one morning and killed every one of them but me." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Other Fish to Fry") },
          text = "I can't fight them all, mon, but you can. Kill me Slitherblade: the naga, the myrmidons and the sorceresses, and I'll pay what I can from what's left of my nets." },
        { id = "h_active", when = { questActive = TODO_QUEST("Other Fish to Fry") },
          text = "They be along the northern shore and out in the water. Look for the bubbling cracks on the seabed; you can breathe at them, and the naga don't know that we know." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Other Fish to Fry"), days = 3 } },
          text = "That many dead? Good, mon, good. I'll go up to the cliff tonight and tell my crew about it." },
      },
      again = {
        { id = "h_again", text = "What else you want, mon?" },
        { id = "h_again2", text = "Ask. I got nothing but time and a hook." },
      },
      choices = {
        { text = "Tell me about that morning.", next = "morning" },
        { text = "Tell me about your crew.", next = "crew" },
        { text = "Why do the naga attack?", next = "naga" },
        { text = "How do you breathe under the water?", next = "bubbles" },
        { text = "I'll kill your naga.", next = "BUSINESS" },
        { text = "Farewell, Drulzegar.", next = "END" },
      },
    },

    morning = {
      lines = { { id = "mo_default", text = "Fog on the water, mon, and the nets full, and Zin'ka singin' something rude about my mother. Then the boat rocked, and they came over the sides with tridents, and I went into the sea and swam until I couldn't hear the screaming." } },
      choices = {
        { text = "You couldn't have saved them.", next = "morning_guilt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morning_guilt = {
      big = true,
      lines = { { id = "mg_default", text = "Everybody says that, mon, and maybe it be true. But I swam away, and they didn't, and now I pay strangers to kill naga because that be the only thing that makes it quiet in my head." } },
      choices = {
        { text = "Vengeance is your right. Take every one of them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Killing won't quiet it. You need to grieve.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    crew = {
      lines = { { id = "cr_default", text = "Five of them, mon, from Sen'jin Village, who followed me west because I said the fishing be better. Zin'ka was my cousin, and the others be cousins of somebody, and I had to tell all their mothers." } },
      choices = {
        { text = "I'm sorry for your loss.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    naga = {
      lines = { { id = "na_default", text = "Who knows why a naga does anything, mon? The old trolls say they be elves that drowned when the world broke, and that they hate everything that still walks in the sun." } },
      choices = {
        { text = "The naga were elves?", next = "naga_elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_elves = {
      lines = { { id = "ne_default", text = "So the stories say, mon, and the night elves don't argue with it, which tells you plenty. Whatever they were once, they be killers now, and the sea be full of them." } },
      choices = {
        { text = "Then I'll empty some of it.", next = "BACK", fx = { trait = { brave = 1 }, learn = { "highborne" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bubbles = {
      lines = { { id = "bu_default", text = "There be cracks in the seabed that bubble up air, mon, and if you put your face in them you can breathe as long as you like. Jinar'Zillen told me, and he made me promise not to tell, and now I told you, so don't tell him." } },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The sea, the naga, and the names of five dead fishermen. That be all I know now." } },
    background = { { id = "tp_bg", text = "Sen'jin Village born, Shadowprey fisherman, last of my crew.", next = "crew" } },
    _none = { { id = "tp_none", text = "Don't know, mon, don't care. Ask me about naga." } },
  },
}

---------------------------------------------------------------------------
-- Jinar'Zillen
---------------------------------------------------------------------------
P:NPC {
  key = "jinarzillen", id = TODO_NPC("Jinar'Zillen"), name = "Jinar'Zillen",
  bible = "bibles/shadowprey.md", role = "questgiver", tier = "quest",
  communities = { "shadowprey" }, temper = { "lazy", "cheerful" }, values = { "comfort", "trade" },
  notices = { "race", "class" },

  impression = {
    first = "Jinar'Zillen is a troll who has arranged his whole life around doing as little as possible, and he is proud of it. He talked to me from a hammock and never once put his feet on the dock.",
    third = "{name} met Jinar'Zillen, a lazy troll at Shadowprey Village who trades fish for the shellfish in his traps.",
  },

  greetings = {
    { id = "g_hello", text = "Ey, mon! You look like somebody who likes to swim. I got just the thing for you." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite swimmer comes back! The traps be full, mon, they always be full." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! You got water spirits that let you breathe down there? Then you be the perfect friend for me, mon." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jinar'Zillen, mon, and I'll tell you my philosophy: do as little as you can, and pay somebody else to do the rest. Under these docks be my shellfish traps, and every five shellfish you bring me get you a nice fat Bloodbelly fish." },
        { id = "h_active", when = { questActive = TODO_QUEST("Fish in a Bucket") },
          text = "The traps be right under the docks, mon, down in the water. Bring me five and I'll find you a fish, and if you bring me ten I'll find you two." },
        { id = "h_done", when = { questDone = TODO_QUEST("Fish in a Bucket") },
          text = "You came back for more work! That be the most beautiful thing a lazy troll ever saw, mon." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Talking be the only work I enjoy." },
        { id = "h_again2", text = "Go on, mon, I'm not going anywhere. I'm never going anywhere." },
      },
      choices = {
        { text = "Why don't you check your own traps?", next = "lazy" },
        { text = "How can I breathe that deep?", next = "secret" },
        { text = "What's a Bloodbelly fish?", next = "fish" },
        { text = "Is the water dangerous?", next = "danger" },
        { text = "I'll get your shellfish.", next = "BUSINESS" },
        { text = "Farewell, Jinar'Zillen.", next = "END" },
      },
    },

    lazy = {
      lines = { { id = "la_default", text = "Because the water be cold, mon, and the hammock be warm, and I already worked hard once when I was young. It didn't agree with me." } },
      choices = {
        { text = "That's no way to live.", next = "lazy_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lazy_stance = {
      big = true,
      lines = { { id = "ls_default", text = "It be the best way to live, mon! Everybody gets what they want: you get fish, I get shellfish, and nobody gets wet that don't want to. Drulzegar says I be shameful, but Drulzegar don't smile." } },
      choices = {
        { text = "A man should earn his own bread.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You've got it figured out, Jinar.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    secret = {
      lines = { { id = "se_default", text = "I'll let you in on a little secret, mon, but keep it between us. Deep in the water there be bubbly cracks in the sand, and you can breathe at them as long as you like." } },
      choices = {
        { text = "Why keep it secret?", next = "secret_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    secret_why = {
      lines = { { id = "sw_default", text = "Because if everybody knows, mon, everybody puts down shellfish traps, and then where am I? Working, that be where, and we already talked about how I feel about that." } },
      choices = {
        { text = "I won't tell a soul.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Drulzegar already told me.", next = "BACK", fx = { trait = { witty = 1 } }, when = { heardLine = "drulzegar.bu_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },

    fish = {
      lines = { { id = "fi_default", text = "Red in the belly, sweet in the meat, and they make you breathe better under water for a while. Very useful, mon, for somebody going down to collect shellfish, if you see where I'm going." } },
      choices = {
        { text = "That's clever.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    danger = {
      lines = { { id = "da_default", text = "Under the docks? Some crabs, mon, and they pinch, but they don't hate you personally. Up north be the naga, and they hate everybody, so stay here where it be friendly." } },
      choices = {
        { text = "Good to know.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Traps, fish, hammocks, and how to make other people do the swimming. A lot of wisdom, mon." } },
    advice = { { id = "tp_ad", text = "Never stand when you can sit, mon, and never sit when you can lie down." } },
    _none = { { id = "tp_none", text = "That sounds like work to know about, mon, so I don't." } },
  },
}

---------------------------------------------------------------------------
-- Innkeeper Sikewa
---------------------------------------------------------------------------
P:NPC {
  key = "sikewa", id = TODO_NPC("Innkeeper Sikewa"), name = "Innkeeper Sikewa",
  title = "Innkeeper",
  bible = "bibles/shadowprey.md", role = "innkeeper", tier = "service",
  communities = { "shadowprey" }, temper = { "warm", "steady" }, values = { "hearth", "rest" },
  notices = { "weary" },

  impression = {
    first = "Innkeeper Sikewa is a tauren woman who keeps a big pot of fish stew on the fire and doesn't let anyone leave without a bowl of it. She talks to her guests the way she'd talk to her own calves.",
    third = "{name} met Innkeeper Sikewa, who keeps the inn at Shadowprey Village.",
  },

  greetings = {
    { id = "g_hello", text = "Come in from the wind, little one. There is stew, and there is a bed." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to us! Sit; the stew has been waiting for you." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { resSick = true },
      text = "You look half a spirit already. Rest here tonight, and let the Earth Mother finish putting you back together." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Sikewa, and this is the only inn between the mountains and the sea in all of Desolace's west. I keep it warm, I keep it fed, and I keep the fishermen from arguing too loudly." },
      },
      again = { { id = "h_again", text = "Is there more, little one?" } },
      choices = {
        { text = "I'd like to rest here.", next = "BUSINESS" },
        { text = "What's in the stew?", next = "stew" },
        { text = "How do you like Shadowprey?", next = "village" },
        { text = "Farewell, Sikewa.", next = "END" },
      },
    },
    stew = {
      lines = { { id = "st_default", text = "Whatever the boats bring in, and whatever Jinar'Zillen's traps catch, though I make him bring the shellfish himself or he doesn't eat. It's the only work he does all week." } },
      choices = {
        { text = "You're a hard woman, Sikewa.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    village = {
      lines = { { id = "vi_default", text = "It is a quiet place, at the edge of a land that died long ago. But the sea is alive, and the people here are alive, and I would rather keep a hearth here than in Thunder Bluff where there are a hundred." } },
      choices = {
        { text = "Why does Desolace stay dead?", next = "village_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village_dead = {
      big = true,
      lines = { { id = "vd_default", text = "Old wars, the elders say, and demons, and the centaur fighting over what's left. Some here say we should leave it to them; others want the Horde to claim it all and make it green again." } },
      choices = {
        { text = "Leave it. Some places should be left to heal alone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Claim it. The Horde can bring it back.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Who's sleeping where, who's eating what, and who owes me for last week." } },
    advice = { { id = "tp_ad", text = "Eat before you go north. The naga won't feed you." } },
    _none = { { id = "tp_none", text = "I don't know that, little one, but have some stew while you wonder." } },
  },
}
