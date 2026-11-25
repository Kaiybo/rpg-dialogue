-- Blackrock Spire: the orc and dragon fortress above the Depths. Vaelan, a bronze-touched spirit
-- in Lower Blackrock Spire, guides the hunt for the Seal of Ascension, and Finkle Einhorn crawls
-- out of the Beast he was swallowed by.
-- Voices: bibles/dg_vaelan.md, bibles/dg_finkle.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Vaelan: the mysterious figure who sets heroes on the Seal of Ascension.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_vaelan", id = TODO_NPC("Vaelan"), name = "Vaelan",
  bible = "bibles/dg_vaelan.md", role = "questgiver", tier = "quest",
  temper = { "cryptic", "urgent" }, values = { "wise", "vengeful" },
  notices = { "class", "level" },
  impression = {
    first = "A stranger in the Spire who knows far more about its masters than he says.",
    third = "{name} met Vaelan in the halls of Lower Blackrock Spire.",
  },

  greetings = {
    { id = "g_default", text = "You walk these halls as if you belong here, mortal. You do not, and neither do I, so let us be useful to each other." },
    { id = "g_seal", when = { questActive = TODO_QUEST("Seal of Ascension") }, text = "Have you the gemstones of the Spire's lords? Each one brings the seal closer, and the seal brings you to the throne of a dragon." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You carry arcane on you like a cloak. Good, because what waits above is older magic than any your tutors taught." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am called Vaelan, and that is all my name will tell you. The black dragonflight rules this mountain through orcs and trolls and ogres, and I would see its hold broken." },
      },
      again = {
        { id = "h_again", text = "What else, mortal? The Spire does not sleep." },
        { id = "h_again2", text = "Ask, but do not ask who I am." },
      },
      choices = {
        { text = "Who rules the upper Spire?", next = "drakkisath" },
        { text = "What is the Seal of Ascension?", next = "seal" },
        { text = "You're no ordinary traveller.", next = "who" },
        { text = "The orcs here once followed Blackhand. Now they serve dragons.", next = "orcs", when = { race = "Orc" } },
        { text = "I sense old magic about you, Vaelan.", next = "sense", when = { class = { "MAGE", "PRIEST", "DRUID" } } },
        { text = "What do you need from me?", next = "BUSINESS" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    drakkisath = {
      lines = { { id = "d_default", text = "General Drakkisath, a black dragonspawn who commands Nefarian's legions in the Spire. Below him sits Rend Blackhand, who calls himself warchief, and below Rend a whole Horde that has forgotten its name." } },
      choices = {
        { text = "Who is Nefarian?", next = "nefarian" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nefarian = {
      lines = { { id = "n_default", text = "The son of Deathwing, master of the black flight, who wears a mortal face and calls himself Lord Victor Nefarius. His lair lies at the very top of the mountain, and his sister keeps a lair of her own in the marshes of Dustwallow." } },
      choices = {
        { text = "Then the whole flight must be destroyed.", next = "BACK", reply = "Destroyed, aye, though dragons are harder to end than orcs. Start with the general and climb.", fx = { align = { order = 1 }, learn = { "nefarian" } } },
        { text = "I care about the gold, not the dragons.", next = "BACK", reply = "Then the gold will carry you up the stairs as well as any oath. The Spire is generous to those who survive it.", fx = { align = { order = -1 }, learn = { "nefarian" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "nefarian" } } },
      },
    },
    seal = {
      lines = { { id = "s_default", text = "A key forged from the gemstones of the Spire's lords and tempered in the blood of a black dragon. With it, the gates of Drakkisath's hall will open to you, and nothing else will open them." } },
      choices = {
        { text = "Which lords carry the gemstones?", next = "gems" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gems = {
      lines = { { id = "gm_default", text = "The generals of the lower halls, Highlord Omokk, War Master Voone and Overlord Wyrmthalak among them, each keeping one as a mark of rank. They do not know what they carry, which is the only mercy in this business." } },
      choices = {
        { text = "And the dragon's blood?", next = "blood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blood = {
      lines = { { id = "bl_default", text = "When you hold the unforged seal, take it to the ledge above the Spire where a black drake roosts, and let its blood do the rest. It will not give it willingly, and you should not ask it to." } },
      choices = {
        { text = "Then the drake dies. It has earned it.", next = "BACK", reply = "It has, many times over. Do not hesitate when the moment comes.", fx = { align = { light = -1 } } },
        { text = "I take no joy in killing even a dragon.", next = "BACK", reply = "Good. Keep that, mortal. It is rarer up here than gold.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs = {
      lines = { { id = "or_default", text = "So they do, and it should shame you more than it angers you. Rend calls himself warchief, but every order he gives comes down from Nefarian's table, and his warriors die guarding a dragon's hoard." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sense = {
      lines = { { id = "se_default", text = "Then sense it quietly, and say nothing of it in these halls. The black flight has ears in every stone of this mountain, and I am not ready to be found." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "w_default", text = "No, I am not, and it is better for both of us that you do not learn more today. Let it be enough that the black flight has wronged mine, and I have a long memory." } },
      choices = {
        { text = "I'll trust you, for now.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That is no concern of the Spire, and so no concern of mine." } },
  },
}

---------------------------------------------------------------------------
-- Finkle Einhorn: a skinner swallowed by the Beast, freed when it is skinned.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_finkle", id = TODO_NPC("Finkle Einhorn"), name = "Finkle Einhorn",
  bible = "bibles/dg_finkle.md", role = "trainer", tier = "quest",
  temper = { "giddy", "rattled" }, values = { "grateful", "practical" },
  notices = { "craft", "class" },
  impression = {
    first = "A man who has just crawled out of a monster's belly and is delighted about it.",
    third = "{name} freed Finkle Einhorn from the belly of the Beast in Upper Blackrock Spire.",
  },

  greetings = {
    { id = "g_default", text = "Air! Glorious, smoky, dragon-tainted air! You've no idea how good this mountain smells after the inside of that thing." },
    { id = "g_back", when = { metBefore = true }, text = "My rescuer again! I'm still picking bits of Beast out of my hair, but I'm ever so grateful." },
  },

  notice = {
    { id = "n_skin", cat = "craft", when = { profession = { "Skinning", "Leatherworking" } },
      text = "You skinned it! A fellow professional, and a fine clean cut too, which is the only reason I'm still in one piece." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and with a beast at heel, I see. Keep your pet well clear of that carcass, because it hasn't stopped twitching." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Finkle Einhorn, at your service, and I do mean at your service after what you've done for me. I came up here to skin the Beast and the Beast swallowed me whole instead, which is a hazard of the trade nobody warns you about." },
      },
      again = {
        { id = "h_again", text = "What else can I do for my hero?" },
        { id = "h_again2", text = "Ask away, I'm in a generous mood today." },
      },
      choices = {
        { text = "How long were you in there?", next = "inside" },
        { text = "Why hunt the Beast at all?", next = "why" },
        { text = "You smell absolutely dreadful.", next = "smell" },
        { text = "What exactly is the Beast, anyway?", next = "beast" },
        { text = "A hunter knows when prey's too big to take.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Can you teach me something?", next = "BUSINESS", when = { profession = { "Skinning", "Leatherworking" } } },
        { text = "Glad you're alive. Farewell.", next = "END" },
      },
    },
    inside = {
      lines = { { id = "i_default", text = "Days, I think, though it's hard to keep count in a stomach. I lived on what it ate, which was mostly orcs, and I'll never look at a stew the same way again." } },
      choices = {
        { text = "How did you not get digested?", next = "inside_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inside_how = {
      lines = { { id = "ih_default", text = "Good leathers, my friend, and a lifetime of working with hides told me just how to wrap myself in them. The acid ate my boots and half my pack, but the jerkin held, and I'll swear by that tanner till my dying day." } },
      choices = {
        { text = "That's a fine advertisement for your craft.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beast = {
      lines = { { id = "be_default", text = "Some great core hound or worse that the dragons dragged up and bred with fire and spite. It hasn't got a proper name, so the orcs just call it the Beast, and frankly that suits it." } },
      choices = {
        { text = "And you still want its hide?", next = "beast_hide" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beast_hide = {
      lines = { { id = "bh_default", text = "Every skinner alive would want it, and now that you've brought it down, I can teach you to work hides like it. Call it payment for the rescue, and a professional courtesy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Ha! Spoken like someone who's never been swallowed. You're right, of course, and I'll admit I'd have been wiser bringing a hunter and a pet along instead of just my knives." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because a hide like that only comes along once in a lifetime, and I meant to be the one who took it. The dragons breed things up here that no skinner has ever touched." } },
      choices = {
        { text = "Greed nearly got you killed.", next = "greed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    greed = {
      lines = { { id = "greed_default", text = "Greed, ambition, call it what you like. Nearly being digested does give a man time to reconsider his career, though I suspect I'll be back at it within the week." } },
      choices = {
        { text = "A craftsman should chase the impossible.", next = "BACK", reply = "Exactly what I told myself on the way in! Then again, I'd thank you not to say it too loudly near any more beasts.", fx = { align = { order = -1 } } },
        { text = "Know your limits and you'll live longer.", next = "BACK", reply = "Sensible, and probably right. I'll go for smaller game for a while, maybe something that doesn't eat skinners.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    smell = {
      lines = { { id = "s_default", text = "I imagine I do, and I'd blush if there were any colour left in me. Give me a hot bath in a proper inn and I'll be good as new, more or less." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Honestly, I've been inside a monster. Ask me about hides or stomachs, not that." } },
  },
}
