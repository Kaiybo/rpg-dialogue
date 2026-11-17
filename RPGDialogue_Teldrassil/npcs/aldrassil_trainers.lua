-- Aldrassil's class trainers in Shadowglen: Mardant Strongoak (druid), Alyissia (warrior), Frahun
-- Shadewhisper (rogue), Ayanna Everstride (hunter) and Shanda (priest). Each receives a new student's
-- sigil from Conservator Ilthalaine (Classic sigil quests). Voice: bibles/aldrassil_trainers.md
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Mardant Strongoak (druid trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "mardant", id = TODO_NPC("Mardant Strongoak"), name = "Mardant Strongoak", title = "Druid Trainer",
  bible = "bibles/aldrassil_trainers.md", role = "trainer", tier = "service",
  communities = { "shadowglen" }, temper = { "calm", "patient" }, values = { "nature", "wise" },
  notices = { "class", "form" },

  impression = {
    first = "Mardant Strongoak teaches young druids inside Aldrassil and speaks slowly, as if he were translating from a language only trees speak. He wants his students to listen to the spirits before they ever try to command them.",
    third = "{name} met Mardant Strongoak, the druid trainer in Aldrassil.",
  },

  greetings = {
    { id = "g_hello", text = "Be still a moment. Can you hear the tree breathing? Most can't, at first." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back, young one. The tree remembers you, and so do I." },
    { id = "g_sigil", when = { questActive = TODO_QUEST("Verdant Sigil") },
      text = "Ah, you carry the Verdant Sigil. Then Ilthalaine has sent you to me, and your training begins." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = { "bear", "cat", "travel" } },
      text = "You wear the shape well, though you hold it as if it might slip. Breathe into it, and it will sit easier." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Mardant Strongoak, and I teach the druids who wake in Shadowglen. My duty is to help you understand what the spirits of the forest are telling you, which is harder than it sounds and simpler than you'd think." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, newly woken. Good; sit with me, and we'll begin with listening, because a druid who can't listen is only a person with a stick." },
        { id = "h_other", when = { class = { "WARRIOR", "ROGUE", "HUNTER", "PRIEST", "MAGE", "WARLOCK", "PALADIN" } },
          text = "You don't walk the druid's path, I can see it, but you're welcome to sit here anyway. The tree doesn't mind who listens." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask. We have time; trees always have time." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "What do the spirits tell you?", next = "spirits" },
        { text = "What's wrong with the creatures of Shadowglen?", next = "wrong" },
        { text = "What comes after Shadowglen, for a druid?", next = "after", when = { class = "DRUID" } },
        { text = "Thank you, Mardant.", next = "END" },
      },
    },
    spirits = {
      lines = { { id = "sp_default", text = "Small things, mostly: that the rain is coming, that a wolf has been here, that the ground is tired. When they shout, something is very wrong, and lately in Teldrassil they shout more than I'd like." } },
      choices = {
        { text = "Should a druid obey the spirits, or guide them?", next = "obey" },
        { text = "Something else.", next = "BACK" },
      },
    },
    obey = {
      lines = { { id = "ob_default", text = "Neither, I'd say, though the Arch Druid might say otherwise. We are the forest's friends, not its masters and not its servants." } },
      choices = {
        { text = "Then a druid must act for the forest, even unasked.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Then a druid waits until the forest asks.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "wr_default", text = "The grells and the furbolgs, and the spiders in the Shadowthread Cave, all grown wilder than they should be. Teldrassil is young and was not blessed as Nordrassil was, and I worry that what grows wrong at the roots shows first in the creatures." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "teldrassil" } } } },
    },
    after = {
      lines = { { id = "af_default", text = "Dolanaar, and Kal, who teaches there, and then Darnassus and the Cenarion Enclave, when you're ready for the deeper shapes. Don't hurry it, because the bear will wait for you, and so will the sea." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
  },
}

---------------------------------------------------------------------------
-- Alyissia (warrior trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "alyissia", id = TODO_NPC("Alyissia"), name = "Alyissia", title = "Warrior Trainer",
  bible = "bibles/aldrassil_trainers.md", role = "trainer", tier = "service",
  communities = { "shadowglen" }, temper = { "stern", "brisk" }, values = { "dutiful", "brave" },
  notices = { "class", "kit" },

  impression = {
    first = "Alyissia trains Shadowglen's young warriors with a short temper and a long memory for mistakes. She has seen real war and isn't shy about saying so.",
    third = "{name} met Alyissia, the warrior trainer in Aldrassil.",
  },

  greetings = {
    { id = "g_hello", text = "Stand up straight. If you slouch like that against a grell, it'll take your ear off." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still standing. Show me what you've learned." },
    { id = "g_sigil", when = { questActive = TODO_QUEST("Simple Sigil") },
      text = "The Simple Sigil, good. I sent it because Ilthalaine says you've a strong arm, and now we'll find out if he's right." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor's held together by hope. Get it mended before the next fight, or the next fight will be your last." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Alyissia, and I train the warriors of Shadowglen. The Sentinels guard our people with bow and glaive, but someone must stand in front of them when the enemy closes, and that's you." },
        { id = "h_war", when = { class = "WARRIOR" },
          text = "A warrior, new to the blade. Good; I'd rather teach you from nothing than untrain your bad habits, so let's begin with your feet." },
      },
      again = {
        { id = "h_again", text = "Anything else? Speak quickly, then drill." },
        { id = "h_again2", text = "Ask, then back to the practice ground." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What makes a good warrior?", next = "good" },
        { text = "Have you fought in a real war?", next = "war" },
        { text = "Thank you.", next = "END" },
      },
    },
    good = {
      lines = { { id = "go_default", text = "Discipline first, strength second, and courage only when the other two are in place. A brave fool with no discipline dies in the first rush, and takes the archers behind him down too." } },
      choices = {
        { text = "Discipline wins battles. I'll hold the line.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Battles are won by whoever strikes hardest first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    war = {
      lines = { { id = "wa_default", text = "At Hyjal, when the Legion came, and I don't talk about it much. I'll only tell you that the line held because nobody ran, and that I've trained warriors ever since so they never have to learn that the way I did." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
  },
}

---------------------------------------------------------------------------
-- Frahun Shadewhisper (rogue trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "frahun", id = TODO_NPC("Frahun Shadewhisper"), name = "Frahun Shadewhisper", title = "Rogue Trainer",
  bible = "bibles/aldrassil_trainers.md", role = "trainer", tier = "service",
  communities = { "shadowglen" }, temper = { "wry", "smooth" }, values = { "cunning", "careful" },
  notices = { "class", "stealth" },

  impression = {
    first = "Frahun Shadewhisper keeps to the shadowed side of Aldrassil and seems faintly amused that anyone found him at all. He teaches young rogues to be quiet, and he is very good at it himself.",
    third = "{name} met Frahun Shadewhisper, the rogue trainer in Aldrassil.",
  },

  greetings = {
    { id = "g_hello", text = "You found me. That's either talent or luck, and I'll want to know which." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. You walked louder this time, so practise." },
    { id = "g_sigil", when = { questActive = TODO_QUEST("Encrypted Sigil") },
      text = "You've read the Encrypted Sigil, which means you can read, at least. That's a start." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Very nice. I almost didn't see you, and I'll pretend I didn't, so you can feel proud a moment longer." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Frahun Shadewhisper. I teach the young ones of Shadowglen to move without being heard and strike without being seen, which the Sentinels find useful, though they don't like to say so out loud." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue, fresh from the barrow. Come closer, quietly, and we'll see whether you have the hands for it." },
      },
      again = {
        { id = "h_again", text = "Something else? Keep it low." },
        { id = "h_again2", text = "Ask, but softly." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Do the kaldorei really need rogues?", next = "need" },
        { text = "Where do rogues go after Shadowglen?", next = "after", when = { class = "ROGUE" } },
        { text = "I'll go quietly.", next = "END" },
      },
    },
    need = {
      lines = { { id = "ne_default", text = "We've been fighting in the dark for ten thousand years, so yes, and the Sentinels know it better than anyone. A blade in the right shadow saves a hundred arrows, and nobody needs to sing about it afterwards." } },
      choices = {
        { text = "A clean fight is still better than a knife in the dark.", next = "need_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    need_stance = {
      lines = { { id = "ns_default", text = "Tell that to the satyr, who never once fought cleanly. I'll teach you both ways, and you can decide which one keeps you alive." } },
      choices = {
        { text = "I'll fight with honor, whatever the satyr do.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Whatever works. The dead don't complain.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    after = {
      lines = { { id = "af_default", text = "Jannok in Dolanaar, when you've outgrown me, and later Syurna in Darnassus. Jannok's a fine teacher when he isn't writing poems about Syurna, so catch him early in the day." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },
}

---------------------------------------------------------------------------
-- Ayanna Everstride (hunter trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "ayanna", id = TODO_NPC("Ayanna Everstride"), name = "Ayanna Everstride", title = "Hunter Trainer",
  bible = "bibles/aldrassil_trainers.md", role = "trainer", tier = "service",
  communities = { "shadowglen" }, temper = { "warm", "steady" }, values = { "nature", "patient" },
  notices = { "class", "pet" },

  impression = {
    first = "Ayanna Everstride trains young hunters at the top of Aldrassil, where she can see the whole glade below. She talks about animals with affection and about the hunt with a careful kind of respect.",
    third = "{name} met Ayanna Everstride, the hunter trainer at the top of Aldrassil.",
  },

  greetings = {
    { id = "g_hello", text = "You climbed all the way up! Good legs. A hunter needs them." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. What did the glade teach you today?" },
    { id = "g_sigil", when = { questActive = TODO_QUEST("Etched Sigil") },
      text = "The Etched Sigil. I carved it myself, you know, and I'm glad it found a steady hand." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Your companion's watching me. Good; it means it's watching for you, which is what a companion should do." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Ayanna Everstride, and I teach the hunters of Shadowglen. Up here I can see every trail in the glade, and I like to know where my students are going wrong before they do." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter! You'll have your own companion one day, when you're ready, and until then you'll learn to track and shoot and keep very still." },
      },
      again = {
        { id = "h_again", text = "What else? I've time; the glade is quiet." },
        { id = "h_again2", text = "Ask away." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How does a hunter respect the hunt?", next = "respect" },
        { text = "When do I get a companion?", next = "companion", when = { class = "HUNTER" } },
        { text = "Thank you.", next = "END" },
      },
    },
    respect = {
      lines = { { id = "re_default", text = "Take what you need, and take it quickly, and never take for the pleasure of it. The nightsabers hunt that way, and so did our people, once, before some forgot." } },
      choices = {
        { text = "Take only what you need. I'll hold to that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The strong take what they want. That's nature too.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    companion = {
      lines = { { id = "co_default", text = "When you're stronger, Dazalar in Dolanaar will teach you to tame a beast, and then the beast decides if you're worth following. Be patient, because the ones worth having don't come quickly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Shanda (priest trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "shanda", id = TODO_NPC("Shanda"), name = "Shanda", title = "Priestess Trainer",
  bible = "bibles/aldrassil_trainers.md", role = "trainer", tier = "service",
  communities = { "shadowglen" }, temper = { "gentle", "calm" }, values = { "devout", "kind" },
  notices = { "class" },

  impression = {
    first = "Shanda teaches Elune's young priests in Aldrassil, softly spoken and very sure of the Mother Moon. She sends her students on to Dolanaar with real fondness.",
    third = "{name} met Shanda, who trains the priests of Elune in Aldrassil.",
  },

  greetings = {
    { id = "g_hello", text = "Elune's light on you, child. Come in out of the dark." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. The Mother Moon notices those who return." },
    { id = "g_sigil", when = { questActive = TODO_QUEST("Hallowed Sigil") },
      text = "The Hallowed Sigil, carried carefully, I see. Then you're one of Elune's, and I'll teach you as she taught me." },
  },

  notice = {
    { id = "n_pri", cat = "class", when = { class = "PRIEST" },
      text = "There's a stillness about you that I recognize. Elune has already noticed you, whether you know it yet or not." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Shanda, and I teach the priests of Elune who wake in Shadowglen. The Mother Moon gives us her light to heal and to guard, and I'll show you the first of it here." },
        { id = "h_pri", when = { class = "PRIEST" },
          text = "A priestess of Elune, or a priest, newly come to her. Sit with me, and we'll begin with the simplest prayer, which is also the hardest to mean." },
        { id = "h_favor", tags = { "news" }, when = { questActive = TODO_QUEST("In Favor of Elune") },
          text = "Go to Laurna Morninglight in Dolanaar when your work here is done. She'll give you your first garments of the Moon, and she'll test you a little first." },
      },
      again = {
        { id = "h_again", text = "What else, child?" },
        { id = "h_again2", text = "Ask; Elune is patient, and I try to be." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Who is Elune, to you?", next = "elune" },
        { text = "Why must a priest also fight?", next = "fight" },
        { text = "Thank you, Shanda.", next = "END" },
      },
    },
    elune = {
      lines = { { id = "el_default", text = "The light that finds you when you're lost, and the mother who doesn't forget her children. She kept us through the Sundering and through ten thousand years of vigil, and she'll keep you too, if you let her." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "sisterhood_of_elune" } } } },
    },
    fight = {
      lines = { { id = "fi_default", text = "Because the Mother Moon is also the huntress, and the Sisterhood has always carried bows as well as prayers. Healing comes first, but a priestess who won't defend the wounded isn't much use to them." } },
      choices = {
        { text = "Healing first. A priest shouldn't seek the fight.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Strike first, and there's less to heal.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}
