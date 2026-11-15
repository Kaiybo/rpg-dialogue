-- Ironforge's people a paladin meets: the Hall of Mysteries, the Commons, the gates.
-- Voices: bibles/brandur.md, bibles/john_turner.md, bibles/jordan.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Brandur Ironhammer: paladin trainer; sends dwarves to Tiza Battleforge, humans to Rall.
P:NPC {
  key = "brandur", id = TODO_NPC("Brandur Ironhammer"), name = "Brandur Ironhammer", title = "Paladin Trainer",
  bible = "bibles/brandur.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "proud" }, values = { "pious", "brave" },
  spiritSensitive = true,
  notices = { "kit" },

  greetings = {
    { id = "g_hall", text = "The Light keep ye! Are ye here for trainin', or for the warm floor?" },
    { id = "g_human", when = { race = "Human", class = "PALADIN" }, text = "A human paladin up the mountain! Rall'll want ye back by supper." },
  },

  notice = {
    { id = "n_kit", cat = "kit", place = "before", when = { class = "PALADIN", durability = { max = 0.25 } },
      text = "Yer plate's in a shameful state. A paladin's armor is a promise tae the people behind ye, so mend it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Brandur Ironhammer, an' I train the Light's young ones here in Ironforge. Dwarves I send on tae Tiza Battleforge an' humans tae Duthorian Rall, for the Light's no' fussy about beards." },
        { id = "h_dwarf", when = { race = "Dwarf", class = "PALADIN" },
          text = "Ye've a dwarf's stubbornness an' a paladin's oath. That's a fine pair, as long as the oath wins the arguments." },
        { id = "h_other", when = { ["not"] = { class = "PALADIN" } },
          text = "Ye're no' one o' mine, but ye're welcome in the Hall all the same. Mind the mages, though; they bite." },
        { id = "h_noble", when = { class = "PALADIN", minLevel = 40 },
          text = "Look at ye, all plate an' purpose! I'll own it, I get a wee bit jealous, an' Tiza says that's my weakness. I'm workin' on it." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Ye're in the right hall, then. Rohan's along the way, pacin' as he does; tell him Brandur sent ye, an' he'll pretend tae know who that is." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? The Light's patient, but my students aren't." },
        { id = "h_again2", text = "Ask away; my students can drill without me for a wee while." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "Who's Tiza Battleforge?", next = "tiza" },
        { text = "How did dwarves come to the Light?", next = "light" },
        { text = "Farewell.", next = "END" },
      },
    },
    tiza = {
      lines = {
        { id = "tz_default", text = "Tiza's one o' our most respected. She gives the young ones the Tome o' Divinity, then sends 'em tae help someone who cannae repay it, an' her husband Muiredon tests the rest." },
      },
      choices = {
        { text = "Tests them how?", next = "tiza_muiredon" },
        { text = "Something else.", next = "BACK", fx = { learn = { "tome_of_divinity" } } },
      },
    },
    tiza_muiredon = {
      lines = {
        { id = "tm_default", text = "There's Dark Irons south o' Helm's Bed Lake. Muiredon an' Narm went spyin' on 'em an' only one came back walkin', an' still the Senate wants proof they're there at all." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    light = {
      lines = {
        { id = "li_default", text = "From the humans, {g:lad|lass}. The Silver Hand took a few o' us in after the Second War, an' more after the Third, when it needed hands. We brought hammers; they brought prayers." },
      },
      choices = {
        { text = "And now?", next = "light_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_now = {
      lines = {
        { id = "ln_default", text = "Now Ironforge trains its own, here in the Hall, wi' the same oaths an' better beer." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Light's servants hear a great deal in this hall, an' I've kept my ears open. Ask me about any o' this." },
    },
    background = { { id = "tp_bg", text = "I'm a paladin o' the Silver Hand an' a trainer in the Hall. I've sent more young ones up tae Tiza than I can count, an' I can count." } },
    advice = { { id = "tp_ad", text = "Mend yer armor before ye pray. The Light hears ye either way, but the troll's quicker." } },
    tome_of_divinity = { { id = "tp_tome", text = "Tiza teaches it here an' Rall teaches it in Stormwind. It's the same book, just in different accents." } },
    _none = { { id = "tp_none", text = "That's no' a matter for the Hall o' Mysteries. Ask up in the Commons." } },
  },
}

-- John Turner: always in Ironforge, always collecting for the Stormwind orphans.
P:NPC {
  key = "john_turner", id = TODO_NPC("John Turner"), name = "John Turner",
  bible = "bibles/john_turner.md", role = "citizen", tier = "quest",
  communities = { "ironforge" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "wealth" },

  barks = { { id = "b_orphans", text = "Spare a thought for the orphans of Stormwind! A thought, a copper, anything at all!" } },
  greetings = {
    { id = "g_orphans", text = "Friend! Have you a moment for the orphans of Stormwind?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The orphans thank you for your attention, though they'd thank you more for linen." },
  },

  notice = {
    { id = "n_rich", cat = "wealth", when = { money = { min = 500000 } },
      text = "You've a heavy purse, if you don't mind my saying so. I mind saying it, but I say it anyway, because it's for the children." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "John Turner, at your service. My wife Stephanie and I run the orphanage in Stormwind, and I come up to Ironforge every month to gather supplies. I'm usually here, mind; it's a long month." },
        { id = "h_stephanie", when = { heardLine = "stephanie.h_tome" },
          text = "You've met Stephanie! How is she, and is she tired? She's always tired, poor thing, so tell her I've nearly got the supplies together, as I always have." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Your people are generous, once they've decided you're not a fool. It took them a year to decide about me, and I'm still not sure about some of them." },
        { id = "h_linen", tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Divinity"), race = "Dwarf" },
          text = "Is that linen you've brought? Bless you, friend; Stephanie can make ten shirts out of that, eleven if the boys stand still." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Would you say a word for the children the next time you're in the Cathedral? Children always notice who prays for them." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've time, plenty of it, and a cart that won't fill." },
        { id = "h_again2", text = "Go on, friend. I'll be here, as the whole of Ironforge will tell you, for another month at least." },
      },
      choices = {
        { text = "How are the children?", next = "children" },
        { text = "Aren't you always here?", next = "always" },
        { text = "Where do the children come from?", next = "where" },
        { text = "Why collect in Ironforge?", next = "why_if" },
        { text = "I came out of Lordaeron myself.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "I could pray with them, back in Stormwind.", next = "pray", when = { class = "PRIEST" } },
        { text = "Good luck, John.", next = "END" },
      },
    },
    children = {
      lines = { { id = "c_default", text = "They're growing out of everything we give them, which is good news, really. It's just expensive good news." } },
      choices = {
        { text = "What do they need most?", next = "need" },
        { text = "Ha. I'll keep them in mind.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Best not to take in more children than you can feed.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    need = {
      lines = {
        { id = "nd_default", text = "Linen, always linen. Stephanie sews their shirts, and there are more tradesmen about than ever, buying up every bolt before I can get to it." },
      },
      choices = {
        { text = "I'll keep an eye out for linen.", next = "BACK", fx = { affinity = 2, trait = { generous = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    always = {
      lines = {
        { id = "al_default", text = "Every month! I do come up every month; it's only that the months have been very close together this year." },
      },
      choices = {
        { text = "Very close.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "You miss her, don't you?", next = "miss" },
      },
    },
    miss = {
      lines = {
        { id = "mi_default", text = "Terribly. Stephanie writes that she's fine, and she always writes that, which is how I know to hurry home." },
      },
      choices = {
        { text = "Then hurry, John.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = {
        { id = "wh_default", text = "Most lost their parents to the Scourge, these last years; some to the war before that. They don't talk about it much, and we don't make them." },
      },
      choices = {
        { text = "That's a kindness.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_if = {
      lines = {
        { id = "wi_default", text = "Dwarves are generous once they've decided you're not a fool, and Ironforge has wool, linen and coin that nobody's asked for twice yet." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    refugee = {
      lines = {
        { id = "rf_default", text = "Then you know where most of mine come from. Lordaeron's children came south with nothing, and some of them still have nothing but us." },
      },
      choices = {
        { text = "Thank you for them.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Ironforge has enough mouths to feed without Lordaeron's.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
    pray = {
      lines = {
        { id = "pr_default", text = "Would you? They'd like that very much. Bring something sweet with you, because prayers go down easier with something sweet." },
      },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "I'll bring the sweets, but you can keep the prayers.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "John Turner, of the Stormwind orphanage: Stephanie's husband, collector of linen, and the most persistent man in Ironforge." } },
    advice = { { id = "tp_ad", text = "Ask twice. Most people say no the first time out of habit." } },
    tome_of_divinity = { { id = "tp_tome", text = "The young paladins bring Stephanie linen as part of their training, and it's the best thing the Church ever started." } },
    _none = { { id = "tp_none", text = "No idea! But the orphans of Stormwind could use your help." } },
  },
}

-- Jordan Stilwell: the Church's smith, outside the Gates of Ironforge.
P:NPC {
  key = "jordan", id = TODO_NPC("Jordan Stilwell"), name = "Jordan Stilwell",
  bible = "bibles/jordan.md", role = "blacksmith", tier = "quest",
  communities = { "ironforge" }, temper = { "steady" }, values = { "pious", "honest" },
  notices = { "paladin", "craft" },

  greetings = {
    { id = "g_gate", text = "It's cold out here by the gates, but it's warmer by the anvil, so come closer." },
    { id = "g_fist", when = { questActive = TODO_QUEST("The Test of Righteousness") }, text = "You're here about the hammer? Good; bring me what I asked for and I'll do the rest." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "A paladin. I trained for it once, before my father's forge called me home, and now I make the hammers instead of swinging them. It's a different sort of prayer." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! Show me your hands, then. Those are good burns, and honest ones." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jordan Stilwell. I serve the Church of the Holy Light the only way I know: at the anvil." },
        { id = "h_fist", tags = { "news" }, when = { questActive = TODO_QUEST("The Test of Righteousness") },
          text = "Bosch Verigan was my friend. This hammer will carry his name, and it'll go to a paladin worthy of it, which I hope is you." },
        { id = "h_daphne", when = { questDone = TODO_QUEST("The Tome of Valor") },
          text = "You stood with Daphne at the farm? She wrote to me that you were brave and she was braver, and that sounds just like her." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest of the Church, which has been good to Daphne and me. If you're ever on the Westfall coast, look in on her; she'll put you to work." },
      },
      again = {
        { id = "h_again", text = "What else? The fire's in no hurry." },
        { id = "h_again2", text = "Go on. I can listen and hammer at once." },
      },
      choices = {
        { text = "Who was Verigan?", next = "verigan" },
        { text = "Why work outside the gates?", next = "outside" },
        { text = "Where did you learn your craft?", next = "learned" },
        { text = "Tell me about Daphne.", next = "daphne" },
        { text = "You trained as a paladin?", next = "paladin_path", when = { class = "PALADIN" } },
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "Stay warm, Jordan.", next = "END" },
      },
    },
    verigan = {
      lines = { { id = "v_default", text = "He was an old friend and a good man, the kind you name things after so people keep asking who he was. That's the whole point of it." } },
      choices = {
        { text = "Who was he?", next = "verigan_who" },
        { text = "Then I'll remember him.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Names fade, however many things you put them on.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    verigan_who = {
      lines = {
        { id = "vw_default", text = "He was a dwarf of the Silver Hand, and the best friend a human smith ever had in Ironforge. He'd have laughed at a hammer with his name on it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    outside = {
      lines = {
        { id = "ou_default", text = "The cool mountain air, Duthorian tells people. The truth is I like to see the road, because people come up it needing things, and I'd rather meet them halfway." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    learned = {
      lines = {
        { id = "le_default", text = "From my father first, at a keep in Silverpine. Then from Bailor Stonehand in Thelsamar, who taught me what a dwarf's forge can do that a man's can't." },
      },
      choices = {
        { text = "A keep in Silverpine?", next = "keep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      big = true,
      lines = {
        { id = "kp_default", text = "Baron Silverlaine's, back when we lived in Pyrewood. When the keep went foul, Daphne and I ran with nothing, and my father's hammer is still lying in the stables there." },
      },
      choices = {
        { text = "And your father?", next = "father" },
        { text = "Something else.", next = "BACK" },
      },
    },
    father = {
      lines = {
        { id = "fa_default", text = "The Scourge took him. He always said that hammer was enchanted and I laughed at him for it, and I'd give a great deal to laugh at him again." },
      },
      choices = {
        { text = "I'm sorry, Jordan.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Maybe someone will fetch it back.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    daphne = {
      lines = {
        { id = "dp_default", text = "My wife. She keeps our farm on the Westfall coast while I'm up here, with the Defias at the Longshore. She writes that she's killed a few, and I believe her." },
      },
      choices = {
        { text = "Why leave her alone?", next = "daphne_why" },
        { text = "Something else.", next = "BACK", fx = { learn = { "defias", "westfall" } } },
      },
    },
    daphne_why = {
      lines = {
        { id = "dw_default", text = "I came north to work with the dwarves for a while, and she told me to go. You'd understand if you met her, because nobody wins an argument with Daphne." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    paladin_path = {
      lines = {
        { id = "pp_default", text = "I was going to be, until my father's forge needed me more than the Order did. Seeing what you do now, I'm a little envious, though only a little." },
      },
      choices = {
        { text = "The Order's loss.", next = "BACK", fx = { affinity = 2 } },
        { text = "You serve it anyway.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your father's forge mattered more than any vow would have.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a smith and the son of a smith, and a paladin who never was. I make the hammers for the ones who are.", next = "learned" } },
    advice = { { id = "tp_ad", text = "Look after your tools and they'll look after you. My father said that about hammers, but it's truer of people." } },
    tome_of_divinity = { { id = "tp_tome", text = "Faith first, then the hammer, and Rall's right about that. Being a smith, I'd put it the other way round, if he'd let me." } },
    westfall = { { id = "tp_westfall", text = "My Daphne keeps the farm there. She's a stubborn woman, and I married her for it." } },
    defias = { { id = "tp_defias", text = "Daphne fights them at our own door. Stormwind's advisors took a good deal longer to notice them than she did." } },
    _none = { { id = "tp_none", text = "I couldn't say, I'm afraid. I only know hammers and prayers." } },
  },
}
