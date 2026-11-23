-- Zul'Gurub: the Gurubashi capital, where the Atal'ai have summoned Hakkar the Soulflayer.
-- Talkable here: Jin'do the Hexxer, who taunts intruders before the fight, and the voice of
-- Hakkar himself, which speaks to those who reach the altar.
-- Voices: bibles/dg_jindo.md, bibles/dg_hakkar.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Jin'do the Hexxer: High Priest of Hakkar, architect of the Soulflayer's return.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_jindo", id = TODO_NPC("Jin'do the Hexxer"), name = "Jin'do the Hexxer", title = "High Priest of Hakkar",
  bible = "bibles/dg_jindo.md", role = "boss", tier = "major",
  temper = { "mocking", "cunning" }, values = { "ambitious", "devout" },
  notices = { "race", "class" },
  impression = {
    first = "He grins like a man who has already seen how this ends.",
    third = "{name} traded words with Jin'do the Hexxer in the shadow of Hakkar's temple.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Zul'Gurub, mon. Most who come this far don't leave, but Jin'do is always happy to talk before the end." },
    { id = "g_back", when = { metBefore = true }, text = "You again? The spirits whispered you'd come back. They like you, mon, the way a cat likes a mouse." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, walking in the city of your betters. Your little tribe ran from these jungles once, and now you come crawling back to spit on the gods." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Listen close to your spirits now, mon. They're shaking, because they know who rules this place." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! Then you know what it means to serve something greater. Jin'do serves a god who answers back." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Jin'do, the Hexxer, and it was my hands that opened the way for the Soulflayer. The Gurubashi were broken and scattered, and Jin'do gave them a god again." },
        { id = "h_troll", when = { race = "Troll" }, text = "You have the tusks of our people, but you carry the stink of the orcs' Warchief. Pity, mon. Hakkar could have made you great." },
      },
      again = {
        { id = "h_again", text = "Ask, ask. Jin'do has all the time in the world, and you have very little." },
        { id = "h_again2", text = "What else you want to know before the end, mon?" },
      },
      choices = {
        { text = "Why bring Hakkar back? He nearly destroyed your empire.", next = "why" },
        { text = "What happened to the other high priests?", next = "priests" },
        { text = "The Zandalari want you stopped.", next = "zandalari" },
        { text = "Tell me about your hexes.", next = "hexes" },
        { text = "Enough talk. I'm here to kill you.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Nearly destroyed it? No, mon. Hakkar made the Gurubashi the masters of this whole land, and it was weak priests who turned on him and threw it all away. Jin'do only finishes what our grandfathers were too frightened to finish." } },
      choices = {
        { text = "He feeds on blood. Your people will be his cattle.", next = "cattle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cattle = {
      lines = { { id = "c_default", text = "Every god eats, mon. The Light eats your faith, the Earth Mother eats your dead. Hakkar is only honest about his hunger, and he pays his servants well for every drop." } },
      choices = {
        { text = "Power at any price is still slavery.", next = "BACK", reply = "Spoken like someone who has never had power at all. Hold on to that little conscience, mon; it'll keep you warm in the grave.", fx = { align = { light = 1 } } },
        { text = "I understand. The strong take what they need.", next = "BACK", reply = "Ah, now you talk like a troll. Too late for you to kneel, but Jin'do respects a clear eye.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priests = {
      lines = { { id = "p_default", text = "Jeklik, Venoxis, Mar'li, Thekal, Arlokk, all of them took the blessing of the primal gods and bent the knee to the Soulflayer. The Hakkari bind the spirits of bat and snake and spider and tiger, and every one of those spirits feeds my master's strength." } },
      choices = {
        { text = "So if the priests die, Hakkar weakens.", next = "weakens" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weakens = {
      lines = { { id = "wk_default", text = "Clever, clever. The Zandalari told you that, I think. Go and try it, mon, and see how many of you are left standing when you reach the altar." } },
      choices = {
        { text = "Plenty of us, I expect.", next = "BACK", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zandalari = {
      lines = { { id = "z_default", text = "Molthor and his old men on Yojamba Isle, wringing their hands and hiring outsiders to do their killing. The Zandalari were always good at keeping old secrets and bad at keeping their nerve." } },
      choices = {
        { text = "They're your kin. Doesn't that matter?", next = "kin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Kin who sat on their island while the Gurubashi bled and starved. When Hakkar walks again the Zandalari will remember who their elders are, or they'll be fed to him like everyone else." } },
      choices = {
        { text = "Loyalty to kin should come first.", next = "BACK", reply = "Loyalty! Loyalty is a leash, mon. Jin'do cut his a long time ago.", fx = { align = { order = 1 } } },
        { text = "A people who won't fight deserve what comes.", next = "BACK", reply = "Hah! Maybe you are not so soft after all. Still going to die, though.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hexes = {
      lines = { { id = "hx_default", text = "Jin'do can turn a warrior into a frog with a word and make a man's own shade turn on him. My totems drink the mind and call the brainwash, and the dead in my graveyard answer when I clap my hands." } },
      choices = {
        { text = "Cheap tricks. They won't save you.", next = "BACK", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    hakkar = { { id = "tp_hakkar", text = "The Soulflayer, the Blood God, master of all who bleed. Soon he walks the world again, mon.", next = "why" } },
    zul_gurub = { { id = "tp_zg", text = "The jewel of the Gurubashi, and soon the throne of a god." } },
    _none = { { id = "tp_none", text = "Jin'do does not care about that, mon. Ask about something that matters before you die." } },
  },
}

---------------------------------------------------------------------------
-- Hakkar the Soulflayer: the Blood God, speaking from the altar of Zul'Gurub.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_hakkar", id = TODO_NPC("Hakkar"), name = "Hakkar", title = "The Soulflayer",
  bible = "bibles/dg_hakkar.md", role = "boss", tier = "major",
  temper = { "imperious", "hungry" }, values = { "dominion" },
  notices = { "race", "class" },
  impression = {
    first = "The air thickens with the smell of blood when he speaks.",
    third = "{name} stood before Hakkar the Soulflayer at the heart of Zul'Gurub.",
  },

  greetings = {
    { id = "g_default", text = "PRIDE HERALDS THE END OF YOUR WORLD. Come, mortal, and let me taste what runs in your veins." },
    { id = "g_signets", when = { questActive = TODO_QUEST("Signets of the Zandalar") }, text = "You smell of Zandalari charms and borrowed courage. They will not protect you here." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll who does not kneel. Your ancestors bled for me gladly, child. You will bleed all the same." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "Your prayers are thin as water. Mine are written in blood, and they are always answered." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Hakkar, the Soulflayer, and the blood of every living thing is mine by right. Long ago the Gurubashi gave me an empire, and their cowardly priests banished me for it. Now I have a body again, and the world will pay its debt." },
      },
      again = {
        { id = "h_again", text = "Speak quickly. Your blood grows impatient." },
      },
      choices = {
        { text = "What do you want with this world?", next = "want" },
        { text = "How did you return?", next = "return" },
        { text = "Your priests are falling one by one.", next = "priests" },
        { text = "I'm not afraid of you.", next = "fear" },
        { text = "Then let's finish this.", next = "END" },
      },
    },
    want = {
      lines = { { id = "w_default", text = "To feed, and to rule what I feed upon. When the Gurubashi first called me, I gave them dominion over every jungle from here to the sea. Through them, and through the Atal'ai, I will drink the whole world dry." } },
      choices = {
        { text = "The trolls who banished you were right.", next = "BACK", reply = "They were afraid, and fear is only the first taste. You will see.", fx = { align = { light = 1 } } },
        { text = "Every empire is built on blood. You're merely honest.", next = "BACK", reply = "Yes. You understand. It will not save you, but you understand.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ["return"] = {
      lines = { { id = "r_default", text = "The Atal'ai kept faith in their sunken temple, and in the end my avatar found its way through. Jin'do finished what they began, and the Hakkari opened the gate. Mortals are always so eager to call on what they cannot hold." } },
      choices = {
        { text = "Then the Atal'ai temple was only the beginning.", next = "BACK", fx = { learn = { "atalai" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priests = {
      lines = { { id = "p_default", text = "They are vessels, nothing more. Each spirit you tear from them weakens my hold on this flesh, and I know it as well as the Zandalari do. But a weakened god is still a god." } },
      choices = {
        { text = "Then you're less invincible than you claim.", next = "BACK", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fear = {
      lines = { { id = "f_default", text = "Not yet. Fear comes later, when your own blood turns against your friends and you understand what it is to be my servant. I have seen braver hearts than yours burst in my hand." } },
      choices = {
        { text = "We'll see whose heart bursts first.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    jindo = { { id = "tp_jindo", text = "Jin'do is useful, and he knows it. That is his whole value." } },
    _none = { { id = "tp_none", text = "That is nothing to a god. Speak of blood, or be silent." } },
  },
}
