-- Azshara folk with no conversation until now: three passengers of the sunken Horizon Scout, ashore at the
-- captain's camp: Alexandra Blazen (priestess), Patrick Mills (paladin) and Lindros (a close-mouthed mage).
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Alexandra Blazen
---------------------------------------------------------------------------
P:NPC {
  key = "az_alexandra", id = TODO_NPC("Alexandra Blazen"), name = "Alexandra Blazen",
  role = "citizen", tier = "service", race = "Human",
  communities = { "ruined_reaches" }, temper = { "weary", "kind" }, values = { "healing", "faith" },
  impression = {
    first = "A priestess who has been mending sailors alone since the night the ship went down.",
    third = "{name} met Alexandra Blazen, a priestess who survived the wreck of the Horizon Scout on the Azshara coast.",
  },
  greetings = {
    { id = "g_default", text = "Light be with you. Forgive me if I don't stand; I haven't slept since the wreck." },
    { id = "g_healer", when = { class = { "PRIEST", "PALADIN", "SHAMAN", "DRUID" } }, text = "A healer! Oh, thank the Light. Two of the sailors still have fevers, and I'm nearly out of strength." },
    { id = "g_crew", when = { questDone = TODO_QUEST("A Crew Under Fire") }, text = "You held the beach for us when the naga came. I prayed for you that night, {name}, and I'll keep praying." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Alexandra Blazen. I paid for passage on the Horizon Scout, and when the naga sank her, I found myself the only priestess on a beach full of drowned and wounded men." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I should check on the wounded soon." },
        { id = "h_again2", text = "Go on. I can spare a moment." },
      },
      choices = {
        { text = "Why did you come to Azshara?", next = "why" },
        { text = "How are the wounded?", next = "wounded" },
        { text = "Rest, Alexandra. I'll keep watch.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "I'd rather not say, if you'll forgive me. Patrick and I had our reasons, and they hardly matter now that the ship is at the bottom of the sea." } },
      choices = {
        { text = "Everyone here keeps secrets. It makes me uneasy.", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "w2_default", text = "Lindros most of all, I know. But a secret isn't a sin, and I won't judge a man for keeping his own counsel when I'm keeping mine." } },
      choices = {
        { text = "Secrets on a stranded crew can get people killed.", next = "BACK", reply = "Perhaps. I'll speak to Patrick about it.", fx = { align = { order = 1 } } },
        { text = "Fair. A person's business is their own.", next = "BACK", reply = "Thank you. That's more grace than I expected.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounded = {
      lines = { { id = "wo_default", text = "Most will live, if the fevers break. Some won't, and I'll bury them as gently as I can. The Light gives what it gives." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Patrick Mills
---------------------------------------------------------------------------
P:NPC {
  key = "az_patrick", id = TODO_NPC("Patrick Mills"), name = "Patrick Mills",
  role = "soldier", tier = "service", race = "Human",
  communities = { "ruined_reaches" }, temper = { "steady", "earnest" }, values = { "duty", "faith" },
  impression = {
    first = "A paladin standing guard over a camp of shipwrecked sailors.",
    third = "{name} met Patrick Mills, a paladin who survived the wreck of the Horizon Scout and now guards the captain's camp.",
  },
  greetings = {
    { id = "g_default", text = "Hold there. Ah, you're no naga. Forgive me, friend; we're all a little jumpy since the wreck." },
    { id = "g_pal", when = { class = "PALADIN" }, text = "A brother of the Light! Good. One more sword and one more prayer might be the difference out here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Patrick Mills, paladin, at your service. Alexandra and I came aboard the Horizon Scout together, and now I keep watch so she can tend the wounded without looking over her shoulder." },
      },
      again = {
        { id = "h_again", text = "Anything else? I need to keep my eyes on the water." },
        { id = "h_again2", text = "Speak, friend. I'll listen and watch at once." },
      },
      choices = {
        { text = "What happened to the ship?", next = "wreck" },
        { text = "What brought a paladin to Azshara?", next = "why" },
        { text = "Farewell, Patrick.", next = "END" },
      },
    },
    wreck = {
      lines = { { id = "wr_default", text = "Naga, singing in the dark, and then the hull split open. The captain got most of us ashore, but the naga still come up the beach at night to see who's left." } },
      choices = {
        { text = "Then we strike them before they strike again.", next = "BACK", reply = "Spoken like a soldier. I'll follow your lead, if you'll go.", fx = { align = { honor = 1 } } },
        { text = "Better to hold the camp and wait for rescue.", next = "BACK", reply = "That's my thinking too. Our first duty is to the living.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Duty, of a sort, and I'll leave it at that. I'll tell you this much: Lindros knew more about where we were going than any of us did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Lindros
---------------------------------------------------------------------------
P:NPC {
  key = "az_lindros", id = TODO_NPC("Lindros"), name = "Lindros",
  role = "citizen", tier = "service", race = "Human",
  communities = { "ruined_reaches" }, temper = { "cold", "guarded" }, values = { "knowledge", "privacy" },
  impression = {
    first = "A mage who survived the wreck and will not say why he came.",
    third = "{name} met Lindros, the tight-lipped mage who survived the wreck of the Horizon Scout.",
  },
  greetings = {
    { id = "g_default", text = "Yes? If you're here to ask about my trunk, it's at the bottom of the sea, and good riddance." },
    { id = "g_mage", when = { class = "MAGE" }, text = "Ah, a mage. Perhaps you, at least, won't ask me foolish questions." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "My name is Lindros. I had business in Azshara, and the naga have delayed it considerably. That is all anyone in this camp needs to know." },
      },
      again = {
        { id = "h_again", text = "Is there more? Be brief." },
        { id = "h_again2", text = "You're persistent. Go on." },
      },
      choices = {
        { text = "What business does a mage have in Azshara?", next = "business" },
        { text = "The others don't trust you, you know.", next = "trust" },
        { text = "Fine. Keep your secrets.", next = "END" },
      },
    },
    business = {
      lines = { { id = "bu_default", text = "Azshara is littered with the ruins of the Highborne, the greatest arcanists this world has known. Any mage worth the name would want to see them, wouldn't you agree?" } },
      choices = {
        { text = "Knowledge is worth the risk.", next = "BACK", reply = "Finally, someone sensible.", fx = { align = { light = -1 } } },
        { text = "The Highborne's magic destroyed the world. Leave it buried.", next = "BACK", reply = "Spoken like someone who has never read a page of it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = { { id = "tr_default", text = "I know, and I do not care. I paid my fare like everyone else. If they need someone to blame for the wreck, they should look at the naga, not at me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Elder Skygleam: a kaldorei elder honoured at the Lunar Festival, among Azshara's ruins.
---------------------------------------------------------------------------
P:NPC {
  key = "az_elder_skygleam", id = 15600, name = "Elder Skygleam", gender = "male",
  role = "questgiver", tier = "quest",
  temper = { "calm" }, values = { "tradition", "memory" },
  notices = { "race", "faction" },
  impression = {
    first = "An ancient night elf stands among the fallen pillars near the Ravencrest Monument, his gaze fixed on the stars. The ruins around him seem to hold their breath.",
    third = "{name} paid respects to Elder Skygleam of the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. You have travelled far to find an old elf among old stones, and I thank you for it." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival has come round again, and the ancestors are near tonight. I am glad you came to honor them." },
    { id = "g_back", when = { metBefore = true }, text = "The stars bring you back to me. Come, look up with me a while." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Skygleam, and in this season the people honour the elders who carry their memories. I carry a great many of them, and some are heavier than others." },
        { id = "h_q", when = { questActive = TODO_QUEST("Skygleam the Elder") }, text = "You have come to honour the elders, and your journey has been seen. Take this coin of ancestry, and carry the past gently." },
        { id = "h_ne", when = { race = "NightElf" }, text = "A child of the kaldorei, come to these ruins. Do you feel it, little one, the weight of what was lost here?" },
      },
      again = {
        { id = "h_again", text = "The stars are patient. What else would you ask?" },
        { id = "h_again2", text = "Speak, child. The night is long." },
      },
      choices = {
        { text = "Why stand here, among these ruins?", next = "ruins" },
        { text = "What does the festival mean to you?", next = "festival" },
        { text = "You watch the stars very closely.", next = "stars" },
        { text = "Are these the ruins of Queen Azshara's realm?", next = "queen", when = { race = "NightElf" } },
        { text = "Elune-adore, Elder.", next = "END" },
      },
    },
    ruins = {
      lines = { { id = "r_default", text = "Because these stones were once a city, and I walked its streets when I was young. Most who come to Azshara see only ruins and satyrs, but I still see the lanterns." } },
      choices = {
        { text = "What happened to it?", next = "happened" },
        { text = "Something else.", next = "BACK" },
      },
    },
    happened = {
      lines = { { id = "h2_default", text = "The Highborne's pride called the Burning Legion into the world, and the Well of Eternity tore itself apart. The sea took the heart of our empire, and what remains is what you see." } },
      choices = {
        { text = "Pride like that must never return.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Their ambition built wonders, though.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It is the one night when the living and the remembered sit together. The druids light the sky at Moonglade, and the elders tell the young what the young have forgotten." } },
      choices = { { text = "Then tell me something I've forgotten.", next = "BACK", fx = { affinity = 1 } } },
    },
    stars = {
      lines = { { id = "s_default", text = "Elune's light is in every star, and I have counted them for more years than I can number. I find the counting comforting, though I always lose my place." } },
      choices = { { text = "That's a lovely way to pass the night.", next = "BACK" } },
    },
    queen = {
      lines = { { id = "q_default", text = "They are, and her name still sits on this land like a curse. We do not speak it lightly, child, and you would do well not to either." } },
      choices = { { text = "I'll remember.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That is not among my memories. Ask the druids of Moonglade, child." } } },
}
