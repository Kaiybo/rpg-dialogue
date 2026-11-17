-- Nijel's Point and Ghost Walker Post, more folk: Corporal Melkins (Centaur Bounty), Talendria (Vyletongue Corruption),
-- Baritanas Skyriver (hippogryph master), and Gurda Wildmane (Magram Alliance / Gelkis Alliance). Voice: bibles/nijels_ghostwalker.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Corporal Melkins
---------------------------------------------------------------------------
P:NPC {
  key = "melkins", id = TODO_NPC("Corporal Melkins"), name = "Corporal Melkins",
  bible = "bibles/nijels_ghostwalker.md", role = "soldier", tier = "quest",
  communities = { "nijels_point" }, temper = { "earnest", "hard" }, values = { "duty", "alliance" },
  notices = { "race", "class", "kills" },

  impression = {
    first = "Corporal Melkins is a young human soldier who has decided the centaur are the whole of Desolace's problem and that ears are the answer. He has the earnest look of a man repeating his orders to make them sound true.",
    third = "{name} met Corporal Melkins at Nijel's Point, who pays a bounty on centaur ears for the Alliance.",
  },

  greetings = {
    { id = "g_hello", text = "Stand easy. Unless you've come with ears, in which case stand right here." },
    { id = "g_active", when = { questActive = TODO_QUEST("Centaur Bounty") }, text = "Fifteen ears, any clan. I'm keeping count, even if nobody else is." },
    { id = "g_done", when = { questDone = TODO_QUEST("Centaur Bounty") }, text = "Good work out there. The raids on the road have slackened since you went hunting." },
  },

  notice = {
    { id = "n_kills", cat = "kills", when = { killed = { name = "Kolkar", min = 30 } },
      text = "You've been thinning the Kolkar, I hear. Good; the captain says that's the clan that raids our wagons most." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "A Sentinel's kin, are you? Talendria keeps telling me the centaur have their own reasons. I keep telling her they still raid us." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Corporal Melkins, of the Nijel's Point garrison. Many clans make up the centaur, each with its own khan, and they've all got one thing in common, which is cruelty." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Centaur Bounty") },
          text = "If we're ever to have peace in Desolace, the centaur have to be cleared from the roads. Hunt them wherever you find them and bring me their ears, fifteen to start, and do it in the service of the Alliance." },
        { id = "h_active", when = { questActive = TODO_QUEST("Centaur Bounty") },
          text = "Any clan will do: Kolkar, Gelkis, Magram, it doesn't matter to me. An ear's an ear, and every one is a raider who won't hit our wagons again." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Centaur Bounty"), days = 3 } },
          text = "That's a full bag, and I'll see it entered properly in the ledger. Captain Pentigast will hear your name, {name}." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a watch to stand." },
        { id = "h_again2", text = "Go on, then. Quickly." },
      },
      choices = {
        { text = "Why ears?", next = "ears" },
        { text = "Why are you out here, Corporal?", next = "why" },
        { text = "What do you make of Captain Pentigast?", next = "captain" },
        { text = "The captain plays the clans against each other.", next = "politics", when = { questDone = TODO_QUEST("Brutal Politics") } },
        { text = "I'll bring the ears.", next = "BUSINESS" },
        { text = "Farewell, Corporal.", next = "END" },
      },
    },

    ears = {
      lines = { { id = "ea_default", text = "Because the garrison won't pay on a story, and a centaur's too big to carry back whole. My sergeant said it in my first week here, and I've never heard a better answer." } },
      choices = {
        { text = "It's grim work.", next = "ears_grim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ears_grim = {
      big = true,
      lines = { { id = "eg_default", text = "It is, and I don't like it any more than you do. But I've buried two drivers off the Gizelton road this season, and the centaur took a good deal more than their ears." } },
      choices = {
        { text = "They raid and kill. They've earned it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Fight them, but leave them their dead.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = { { id = "wh_default", text = "I signed on in Stormwind for the harbor guard, and they put me on a ship to Theramore, and Theramore put me on a hippogryph to here. Nobody ever asked me where I wanted to go, which I'm told is how the army works." } },
      choices = {
        { text = "Do you miss Stormwind?", next = "why_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_home = {
      lines = { { id = "wy_default", text = "Every day, and the rain most of all, which is a thing I never thought I'd say. Desolace hasn't seen proper rain since before the elves were young, as far as I can tell." } },
      choices = {
        { text = "You'll see it again.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    captain = {
      lines = { { id = "ca_default", text = "The captain's sharp, sharper than the rest of us put together, and he's got plans for the centaur that he doesn't share with corporals. I hunt; he thinks. That's the arrangement." } },
      choices = {
        { text = "Do you trust his plans?", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    politics = {
      lines = { { id = "po_default", text = "So I hear, and I'll grant it's clever, making them bleed each other so we don't have to. I'd still rather have my ears, because ears I can count, and the captain's schemes I can't." } },
      choices = {
        { text = "Fair point.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Centaur, the roads, and the garrison roster. Not much else." } },
    background = { { id = "tp_bg", text = "Stormwind lad, harbor guard that never was, corporal at the end of the world.", next = "why" } },
    _none = { { id = "tp_none", text = "Not my business, I'm afraid. Ask the captain." } },
  },
}

---------------------------------------------------------------------------
-- Talendria
---------------------------------------------------------------------------
P:NPC {
  key = "talendria", id = TODO_NPC("Talendria"), name = "Talendria",
  bible = "bibles/nijels_ghostwalker.md", role = "questgiver", tier = "quest",
  communities = { "nijels_point" }, temper = { "cool", "watchful" }, values = { "nature", "balance" },
  notices = { "race", "class" },

  impression = {
    first = "Talendria is a night elf who stands a little apart from the human soldiers of Nijel's Point, as though she is keeping watch over them as much as with them. She speaks of Maraudon with the quiet anger of someone watching a forest burn.",
    third = "{name} met Talendria, a night elf at Nijel's Point who wants the corruption in Maraudon healed.",
  },

  greetings = {
    { id = "g_hello", text = "Ishnu-alah. Speak softly; the soldiers think louder is braver." },
    { id = "g_active", when = { questActive = TODO_QUEST("Vyletongue Corruption") }, text = "The vines in Maraudon still suffer. Go gently with them, and not at all gently with what comes out." },
    { id = "g_done", when = { questDone = TODO_QUEST("Vyletongue Corruption") }, text = "I felt something ease, the night you healed the vines. A small thing, but real." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You walk the Dream, druid. Then you will feel how Maraudon screams, even from here." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei. It is good to see one of our own so far from the forests." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Talendria. I came to Desolace to understand why the land stays dead, and I found my answer under it, in Maraudon, where the roots of everything have turned to poison." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Vyletongue Corruption") },
          text = "Within Maraudon the Vylestem vines rot from a corruption called Noxxious. Take this coated vial and fill it at the orange crystal pool, then pour it on the vines. The scions will be forced out of them, and when they die, the plant can heal." },
        { id = "h_active", when = { questActive = TODO_QUEST("Vyletongue Corruption") },
          text = "Eight vines, {name}. The crystal pool's water is pure enough to drive the corruption out, but it does not kill it; that part is yours." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Vyletongue Corruption"), days = 3 } },
          text = "Eight vines healed. Elune be thanked, and you as well, for the hard part." },
      },
      again = {
        { id = "h_again", text = "Is there more you would know?" },
        { id = "h_again2", text = "Ask, and I will answer what I can." },
      },
      choices = {
        { text = "What happened to this land?", next = "land" },
        { text = "What is Noxxious?", next = "noxxious" },
        { text = "How do you get along with the soldiers?", next = "soldiers" },
        { text = "Can the Dream show us the cause?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Give me the vial.", next = "BUSINESS" },
        { text = "Elune guide you.", next = "END" },
      },
    },

    land = {
      lines = { { id = "la_default", text = "Desolace was green once, the oldest stories say. War came, and demons, and then the centaur, and now Maraudon poisons it from below, so the land never has a chance to forget." } },
      choices = {
        { text = "Can it be healed?", next = "land_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    land_heal = {
      big = true,
      lines = { { id = "lh_default", text = "Slowly, if the corruption is cut out at its root, and the root is deep in Maraudon. Some of my sisters would rather wall it off and let it die; I would rather fight for every vine." } },
      choices = {
        { text = "Fight for it. Nothing is beyond saving.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Wall it off. Some things should be let go.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    noxxious = {
      lines = { { id = "no_default", text = "A sickness given shape, which grows inside the vines and comes out of them like a beast from its den. Where it walks, flowers bloom wrong, with teeth." } },
      choices = {
        { text = "Where does it come from?", next = "noxxious_from" },
        { text = "Something else.", next = "BACK" },
      },
    },
    noxxious_from = {
      lines = { { id = "nf_default", text = "From deeper, from whatever lies at the heart of Maraudon, which the centaur call their mother. I have not gone that deep, and I do not know anyone who has come back to describe it well." } },
      choices = {
        { text = "Then I'll describe it to you.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    soldiers = {
      lines = { { id = "so_default", text = "They are brave and loud and they hunt centaur for ears, and Corporal Melkins asks me every morning if I've changed my mind about it. I have not, but he keeps asking, which I find almost charming." } },
      choices = {
        { text = "He means well.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdruid = {
      lines = { { id = "xd_default", text = "I have tried, and the Dream goes dark around Maraudon, as though something is holding its hand over the window. Perhaps you will see further than I did." } },
      choices = {
        { text = "I'll try.", next = "BACK", fx = { trait = { curious = 1 }, learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Maraudon, the vines, and the long sorrow of this land." } },
    background = { { id = "tp_bg", text = "Kaldorei, from the forests of Ashenvale, come to understand a land that forgot how to grow.", next = "land" } },
    _none = { { id = "tp_none", text = "I cannot tell you. The land has not spoken of it." } },
  },
}

---------------------------------------------------------------------------
-- Baritanas Skyriver
---------------------------------------------------------------------------
P:NPC {
  key = "baritanas", id = TODO_NPC("Baritanas Skyriver"), name = "Baritanas Skyriver",
  title = "Hippogryph Master",
  bible = "bibles/nijels_ghostwalker.md", role = "flightmaster", tier = "service",
  communities = { "nijels_point" }, temper = { "wry", "gentle" }, values = { "sky", "freedom" },
  notices = { "race" },

  impression = {
    first = "Baritanas Skyriver is a night elf who looks out of place on the bare ridge of Nijel's Point and knows it. He speaks of the forests to the north the way an exile speaks of home.",
    third = "{name} met Baritanas Skyriver, the hippogryph master of Nijel's Point.",
  },

  greetings = {
    { id = "g_hello", text = "Ishnu-alah. The hippogryphs are restless; they don't like the dust here any more than I do." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Shall I send you somewhere with trees?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Baritanas Skyriver. My hippogryphs carry the Alliance out of Desolace, which is a kindness to everyone, and back into it, which is a kindness to no one." },
      },
      again = { { id = "h_again", text = "What else, traveler?" } },
      choices = {
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "Do your hippogryphs mind the desert?", next = "birds" },
        { text = "Why does a night elf serve here?", next = "why" },
        { text = "Farewell.", next = "END" },
      },
    },
    birds = {
      lines = { { id = "bi_default", text = "They hate it, and they tell me so every morning, loudly. The dust gets into their feathers, and there is nothing worth hunting here but carrion, which they consider beneath them." } },
      choices = {
        { text = "They have good taste.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because the Sentinels asked, and because the humans here need wings to reach Feathermoon and Auberdine. I would rather be in Ashenvale, but the Alliance is a thing we agreed to, and I keep my agreements." } },
      choices = {
        { text = "The Alliance is worth it.", next = "why_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_stance = {
      big = true,
      lines = { { id = "ws_default", text = "Is it? My people kept to themselves for ten thousand years, and some of the elders say we should have kept on. The humans are generous, but they are also very loud." } },
      choices = {
        { text = "Together we're stronger. The Alliance matters.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your people owe the humans nothing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The roosts from here to Feathermoon, and every hippogryph by name." } },
    advice = { { id = "tp_ad", text = "Keep your mouth shut when you fly over Desolace, or you'll land with a mouthful of dust." } },
    _none = { { id = "tp_none", text = "I don't know. I have spent too long looking at the sky to learn much about the ground." } },
  },
}

---------------------------------------------------------------------------
-- Gurda Wildmane
---------------------------------------------------------------------------
P:NPC {
  key = "gurda", id = TODO_NPC("Gurda Wildmane"), name = "Gurda Wildmane",
  bible = "bibles/nijels_ghostwalker.md", role = "questgiver", tier = "quest",
  communities = { "ghost_walker" }, temper = { "calm", "cunning" }, values = { "earth", "spirits" },
  notices = { "race", "class" },

  impression = {
    first = "Gurda Wildmane is the tauren shaman who leads Ghost Walker Post. She talks of easing old kodo into their next lives in one breath and of setting the centaur clans at each other's throats in the next, and seems to see no contradiction.",
    third = "{name} met Gurda Wildmane, the shaman who leads Ghost Walker Post and means to use the centaur clans' hatred against them.",
  },

  greetings = {
    { id = "g_hello", text = "The spirits of the kodo are quiet today. Walk softly, and they'll stay that way." },
    { id = "g_magram", when = { questActive = TODO_QUEST("Magram Alliance") }, text = "The Magram measure friendship in Gelkis blood. Keep paying, and Warug will greet you." },
    { id = "g_gelkis", when = { questActive = TODO_QUEST("Gelkis Alliance") }, text = "The Gelkis measure friendship in Magram blood. Keep paying, and Uthek will greet you." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You hear the spirits too. Then you'll understand why this post is quiet at night: we don't want to wake them." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Child of the Earth Mother, you're welcome here. The centaur hate you most of all, so use that well." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Gurda Wildmane, and Ghost Walker Post is mine to keep. We tend the dying kodo on their way to the graveyard, and we watch the centaur, who would gladly send us along after them." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Magram Alliance") },
          text = "If the centaur clans of Desolace ever united, they'd be a terrible force. So we'll make sure they don't. Choose a clan, Magram or Gelkis, kill its enemies until it calls you friend, and through them we'll learn to beat them all." },
        { id = "h_magram", when = { questActive = TODO_QUEST("Magram Alliance") },
          text = "The Magram are in the southeast. Slay the Gelkis until the Magram trust you, then find their spokesman Warug at the edge of their village." },
        { id = "h_gelkis", when = { questActive = TODO_QUEST("Gelkis Alliance") },
          text = "The Gelkis are in the southwest. Slay the Magram until the Gelkis trust you, then find Uthek the Wise at the edge of their village." },
        { id = "h_done", tags = { "news" }, when = { any = { { questDone = TODO_QUEST("Magram Alliance") }, { questDone = TODO_QUEST("Gelkis Alliance") } } },
          text = "You have a clan's ear now, {name}. Listen well to what they tell you, and don't forget whose side you're truly on." },
      },
      again = {
        { id = "h_again", text = "What else? The spirits are patient, and so am I." },
        { id = "h_again2", text = "Ask what you came to ask." },
      },
      choices = {
        { text = "Which clan should I choose?", next = "choose" },
        { text = "How do you ease the kodo?", next = "kodo" },
        { text = "Isn't it dishonest, playing the clans?", next = "honest" },
        { text = "What do the kodo spirits tell you?", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "Let me hear the task.", next = "BUSINESS" },
        { text = "Farewell, Gurda.", next = "END" },
      },
    },

    choose = {
      lines = { { id = "ch_default", text = "The Magram are brutes who love strength and despise their own mother. The Gelkis are earth-worshippers who bow to Theradras and think themselves holy. Both hate each other more than they hate you, which is all that matters." } },
      choices = {
        { text = "Can I switch sides later?", next = "choose_switch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose_switch = {
      lines = { { id = "cs_default", text = "You can, if you're willing to start killing your new friends. Most who try it find they'd rather pick one and stay, because centaur remember a betrayal even longer than tauren do." } },
      choices = {
        { text = "I'll choose carefully.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    kodo = {
      lines = { { id = "ko_default", text = "The old kodo walk to the graveyard here when they know their time is near. We sing to them on the way, and some nights we talk to the spirits of the ones already there, who are more patient than the living." } },
      choices = {
        { text = "What do the spirits say?", next = "kodo_spirits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kodo_spirits = {
      lines = { { id = "ks_default", text = "Mostly that they're tired, and that the land under them is sick, and that the Gizelton goblins drive their living kin too hard. I can't fix the land, but I've had words with the goblins." } },
      choices = {
        { text = "I'd like to hear those words.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    honest = {
      big = true,
      lines = { { id = "ho_default", text = "Dishonest? The centaur raided Mulgore for generations, and they'd do it here tonight if we let them. I'd rather they spent their spears on each other than on my people." } },
      choices = {
        { text = "War is war. Use whatever works.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd rather beat them in open battle.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xshaman = {
      lines = { { id = "xs_default", text = "Come to the graveyard with me some night and listen for yourself. They don't speak in words, but you'll understand them, and you'll walk a little slower afterward." } },
      choices = {
        { text = "I'd be honored.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The kodo, the spirits, and the centaur clans, and which of them is lying this week." } },
    background = { { id = "tp_bg", text = "A shaman of the tauren, sent to keep this post and the dead who pass through it." } },
    _none = { { id = "tp_none", text = "The spirits haven't told me, and I won't guess." } },
  },
}
