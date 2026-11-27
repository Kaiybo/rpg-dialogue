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
    w8_move = {
      lines = { { id = "w8_move_a", text = "Carefully, mortal, and as something smaller than I am, and never in the same hall twice in a day. The orcs see only another stranger, and the dragonspawn do not look at strangers at all." } },
      choices = {
        { text = "Something smaller than you are?", next = "w8_move2" },
        { text = "You could teach me that trick.", next = "w8_move2" },
        { text = "Something else, Vaelan.", next = "BACK" },
      },
    },
    w8_move2 = {
      lines = { { id = "w8_move2_a", text = "You ask the question I told you not to ask, and I will give you the same answer. Be useful to me, and in time you may learn more of who I am, though I hope for both our sakes that you never need to." } },
      choices = {
        { text = "Then I'll be useful.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

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
        { text = "What did the black flight do to yours?", next = "ywrong" },
        { text = "How do you move through the Spire unseen?", next = "w8_move" },
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
    ywrong = {
      narr = "Something old and hot moves behind his mortal eyes, then is gone.",
      lines = {
        { id = "ywr_default", text = "They took what was not theirs, mortal, eggs and lives both, and used them in a forge of flesh beneath this mountain. I will not say more, for the stones listen. I will say only that I have waited a long time for mortals strong enough to climb." },
        { id = "ywr_priest", when = { class = "PRIEST" }, text = "They took eggs and lives, priest, and used them in a forge of flesh. You feel the grief on me, I think. Do not name what you sense. I have waited a long time for mortals strong enough to climb." },
      },
      choices = {
        { text = "Then I'll climb for you.", next = "BACK", reply = "Not for me. For yourselves, and for all who live beneath this sky.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    rend = { { id = "yt_rend", text = "Rend Blackhand calls himself warchief, and wears his father's name like a borrowed cloak." } },
    drakkisath = { { id = "yt_drakk", text = "General Drakkisath holds the upper Spire for his master. He is strong, but he is not the strongest thing up there." } },
    blackrock = { { id = "yt_br", text = "This mountain has more masters than it has floors, and every one of them answers to fire or to a dragon." } },
    seal = { { id = "yt_seal", text = "The Seal of Ascension opens Drakkisath's hall. Gather the lords' gemstones, and do not lose them." } },
    nefarian = { { id = "yt_nef", text = "Lord Victor Nefarius, they call him at his table. Do not be fooled by the mortal face." } },
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
    w8_hide = {
      lines = { { id = "w8_hide_a", text = "None, my friend, none for at least a month, because the very smell of leather now makes me think of being digested. I'll sit by a window and look at the sky and eat something that hasn't been inside a Beast." } },
      choices = {
        { text = "And after the month?", next = "w8_hide2" },
        { text = "You'll be back at it in a week.", next = "w8_hide2" },
        { text = "I skin too. Any advice for big game?", next = "w8_hide2", when = { profession = "Skinning" } },
        { text = "Something else, Finkle.", next = "BACK" },
      },
    },
    w8_hide2 = {
      lines = {
        { id = "w8_hide2_a", text = "After the month, I'll be back in the mountains looking for something even bigger, because I'm a fool and I know it. A skinner who's been swallowed once has very little left to fear, which is either wisdom or madness." },
        { id = "w8_hide2_sk", when = { profession = "Skinning" }, text = "Make sure it's dead, my friend, properly dead, not mostly dead and sleeping off its supper. Cut from the belly up, never the back down, and if it hiccups, run." },
      },
      choices = {
        { text = "Wisdom or madness. I'll call it both.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

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
        { text = "What's the first hide you'll work when you get home?", next = "w8_hide" },
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
