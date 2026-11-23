-- Thunder Bluff folk the roster scan found unwritten: the Smokywood Pastures Copperpinches who sell at
-- Winter Veil, Cor and Gorm Grimtotem of Magatha's household on the Elder Rise, a Midsummer Merchant,
-- Rumstag Proudstrider the cloth quartermaster, and Senior Sergeant Taiga, the war effort recruiter.
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Seersa Copperpinch: Smokywood Pastures vendor (cheaper goods) at Winter Veil.
---------------------------------------------------------------------------
P:NPC {
  key = "tb_seersa_copperpinch", id = TODO_NPC("Seersa Copperpinch"), name = "Seersa Copperpinch", title = "Smokywood Pastures", gender = "female",
  role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "cheerful" }, values = { "profit" },
  impression = {
    first = "A goblin woman in a red cap trimmed with white fur stands beside a cart of sweets and wrapped parcels on the lower rise. She rings a little bell whenever a tauren walks past.",
    third = "{name} met Seersa Copperpinch, who sells Smokywood Pastures treats in Thunder Bluff at Winter Veil.",
  },
  greetings = {
    { id = "g_default", text = "Happy Winter Veil! Treats, trinkets and cheer, priced for every purse." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more cheer? I knew you were a festive one." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Seersa Copperpinch, Smokywood Pastures. I sell the small things, the cookies and the candy and the wrapping paper, and Whulwert beside me sells the big ones." } },
      again = { { id = "h_again", text = "Anything else? The bell is getting tired." } },
      choices = {
        { text = "Do tauren even keep Winter Veil?", next = "tauren" },
        { text = "Why split the cart with Whulwert?", next = "whulwert" },
        { text = "Let me see your treats.", next = "END" },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "They do now, or at least they buy the cookies. The elders say the long nights are for stories and gifts anyway, and Smokywood is happy to supply both." } },
      choices = {
        { text = "Every feast is a good feast.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The tauren have their own customs.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    whulwert = {
      lines = { { id = "w_default", text = "Because the company says rich and poor shouldn't have to queue together. I get the happier customers, and he gets the bigger tips, and we both pretend we don't mind." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Whulwert Copperpinch: Smokywood Pastures vendor (dearer goods) at Winter Veil.
---------------------------------------------------------------------------
P:NPC {
  key = "tb_whulwert_copperpinch", id = TODO_NPC("Whulwert Copperpinch"), name = "Whulwert Copperpinch", title = "Smokywood Pastures", gender = "male",
  role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "smooth" }, values = { "profit" },
  impression = {
    first = "A goblin in a velvet coat stands behind a polished counter of fine holiday goods, every price tag turned so you have to ask.",
    third = "{name} met Whulwert Copperpinch, who sells Smokywood Pastures' finer goods in Thunder Bluff at Winter Veil.",
  },
  greetings = {
    { id = "g_default", text = "Ah, a discerning shopper. Welcome to the quality end of the cart." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Quality always calls its customers back." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Whulwert Copperpinch, Smokywood Pastures, purveyor of the finer things in festive life. Seersa sells the cookies, and I sell the gifts that people remember." } },
      again = { { id = "h_again", text = "Something more, or shall I wrap something for you?" } },
      choices = {
        { text = "Why are your prices hidden?", next = "prices" },
        { text = "Who buys fine goods in Thunder Bluff?", next = "buyers" },
        { text = "Show me your wares.", next = "END" },
      },
    },
    prices = {
      lines = { { id = "p_default", text = "A price you can see is a price you can argue with. A price you have to ask about is a conversation, and I'm very good at conversations." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "b_default", text = "Hunters back from a good season, traders from the Barrens, and the occasional elder who wants to spoil a grandchild. Tauren pay slowly, but they never haggle, which is a miracle." } },
      choices = { { text = "Don't take advantage of that.", next = "BACK", reply = "Me? Never. Well, only a little, and only at holidays." } },
    },
  },
}

---------------------------------------------------------------------------
-- Cor Grimtotem: one of Magatha's Grimtotem on the Elder Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "tb_cor_grimtotem", id = TODO_NPC("Cor Grimtotem"), name = "Cor Grimtotem", gender = "male",
  role = "citizen", tier = "service",
  communities = { "thunder_bluff", "grimtotem" }, temper = { "cold" }, values = { "pride", "tradition" },
  impression = {
    first = "A tauren in Grimtotem paint stands on the Elder Rise with his arms folded, watching the Horde visitors cross the bridges as if counting them.",
    third = "{name} met Cor Grimtotem, one of Magatha's tribe on the Elder Rise.",
  },
  greetings = {
    { id = "g_default", text = "You walk on Grimtotem ground now, stranger. Walk softly." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You have a way of wandering where you are not asked." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Cor, of the Grimtotem. Our elder Magatha sits among Cairne's council, and we live here because she wishes it, not because we love these crowds." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "You are of the Bloodhoof's people, I think. Tell your chieftain that the Grimtotem remember who held these mesas before him." },
      },
      again = { { id = "h_again", text = "What more? Be brief." } },
      choices = {
        { text = "You don't like the Horde.", next = "horde" },
        { text = "Tell me about Magatha.", next = "magatha" },
        { text = "I'll walk softly.", next = "END" },
      },
    },
    horde = {
      lines = { { id = "hr_default", text = "The orcs came with axes and called it friendship, and Cairne gave them our trust in return. The Grimtotem would rather the tauren stood alone, as we did for ages before." } },
      choices = {
        { text = "The tauren are stronger with allies.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A people should stand on its own hooves.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    magatha = {
      lines = { { id = "m_default", text = "She is the wisest of the elders, and the only one who sees what the Horde costs us. Speak of her with respect, or do not speak of her at all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Gorm Grimtotem: another of Magatha's household on the Elder Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "tb_gorm_grimtotem", id = TODO_NPC("Gorm Grimtotem"), name = "Gorm Grimtotem", gender = "male",
  role = "citizen", tier = "service",
  communities = { "thunder_bluff", "grimtotem" }, temper = { "brooding" }, values = { "pride" },
  impression = {
    first = "A heavy tauren with Grimtotem markings sits near the Elder Rise's lodges, sharpening a totem-headed club. He doesn't stop when you approach.",
    third = "{name} met Gorm Grimtotem, a brooding Grimtotem tauren on the Elder Rise.",
  },
  greetings = {
    { id = "g_default", text = "Hmph. Another wanderer. What do you want?" },
    { id = "g_back", when = { metBefore = true }, text = "You keep coming back. I have not decided if I mind." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Gorm. I guard Magatha's lodges, though no one in this city would dare trouble them. It gives my hands something to do while the council talks." } },
      again = { { id = "h_again", text = "More questions? Ask, then." } },
      choices = {
        { text = "Why guard what nobody threatens?", next = "guard" },
        { text = "Where do the Grimtotem come from?", next = "tribe" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    guard = {
      lines = { { id = "g_default", text = "Nobody threatens them today. The Bloodhoof smile at us, but a smile is not the same as trust, and Magatha taught us to remember that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tribe = {
      lines = { { id = "t_default", text = "From the high places, Stonetalon and the Needles, where the earth is hard and so are we. Other tribes went soft under Cairne, and the Grimtotem did not." } },
      choices = {
        { text = "Hardness isn't the same as strength.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Hard places make hard people. I respect that.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Midsummer Merchant: seasonal vendor for the Midsummer Fire Festival.
---------------------------------------------------------------------------
P:NPC {
  key = "tb_midsummer_merchant", id = TODO_NPC("Midsummer Merchant"), name = "Midsummer Merchant",
  role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "cheerful" }, values = { "festival" },
  impression = {
    first = "A merchant in festival colours tends a stall of garlands, sweets and fire-red ribbons near the bonfire. The heat of the flames makes everyone nearby squint and smile.",
    third = "{name} met a Midsummer Merchant at the Fire Festival.",
  },
  greetings = {
    { id = "g_default", text = "Happy Midsummer! Warm your hands, and buy something bright." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "The longest day calls for the brightest fires, and the brightest fires call for garlands and treats. I follow the festival wherever the bonfires burn." } },
      again = { { id = "h_again", text = "Anything else? The fire's not going out." } },
      choices = {
        { text = "What is the Midsummer festival for?", next = "festival" },
        { text = "Who comes to the fires here?", next = "crowd" },
        { text = "Show me your wares.", next = "END" },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It honours the sun at its strongest, and the fire that keeps us through the dark half of the year. Every people has a reason, and all of them end in dancing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crowd = {
      lines = { { id = "c_default", text = "Tauren families, orc soldiers off duty, and trolls who will dance until the fire's out. The tauren say the flame is a gift of An'she, the sun, and they thank it with songs." } },
      choices = { { text = "A fine custom.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Rumstag Proudstrider: Horde cloth quartermaster, takes cloth donations.
---------------------------------------------------------------------------
P:NPC {
  key = "tb_rumstag_proudstrider", id = TODO_NPC("Rumstag Proudstrider"), name = "Rumstag Proudstrider", title = "Horde Cloth Quartermaster", gender = "male",
  role = "questgiver", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady" }, values = { "duty", "community" },
  impression = {
    first = "In the armourers' lodge on the middle rise, a tauren sits behind stacks of folded wool and silk, tallying each bundle on a strip of hide.",
    third = "{name} met Rumstag Proudstrider, who gathers cloth for the Horde in Thunder Bluff.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, friend. Have you brought cloth for the Horde's need?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and with full packs, I hope." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Rumstag Proudstrider. I gather cloth for the Horde, wool and silk and mageweave and runecloth, and Thunder Bluff remembers every bundle given." },
        { id = "h_q", when = { questActive = TODO_QUEST("A Donation of Wool") }, text = "Wool! Set it here, friend, and the tribe will know your name." },
      },
      again = { { id = "h_again", text = "Anything else? I have counting to do." } },
      choices = {
        { text = "What does the Horde do with the cloth?", next = "use" },
        { text = "Why should I give it away?", next = "why" },
        { text = "Let's talk donations.", next = "END" },
      },
    },
    use = {
      lines = { { id = "u_default", text = "Bandages for the wounded, cloaks for the braves on the plains, blankets for the young ones when winter comes down off the mesas. Nothing given here is wasted." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because the Horde is a family, and a family shares what it has. The tribe honours those who give, and that honour opens doors that gold cannot." } },
      choices = {
        { text = "Giving freely is its own reward.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I give for the standing it buys.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Senior Sergeant Taiga: war effort recruiter on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "tb_senior_sergeant_taiga", id = TODO_NPC("Senior Sergeant Taiga"), name = "Senior Sergeant Taiga", title = "War Effort Recruiter", gender = "female",
  role = "soldier", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "brisk" }, values = { "duty" },
  notices = { "level" },
  impression = {
    first = "A tauren sergeant in battered mail stands on the lower rise beside a banner reading 'The Horde Needs You', calling out to every passing brave.",
    third = "{name} met Senior Sergeant Taiga, who recruits for the war effort in Thunder Bluff.",
  },
  greetings = {
    { id = "g_default", text = "You there! The Horde needs strong arms and full wagons. Will you answer?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, soldier. Ready to do your part?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Senior Sergeant Taiga. The Horde is gathering supplies for a great war in the south, and every city must give. Thunder Bluff will not be the one found wanting." },
        { id = "h_q", when = { questActive = TODO_QUEST("The Horde Needs Your Help!") }, text = "You've taken the call! Good, now get to Orgrimmar and see the war effort with your own eyes." },
      },
      again = { { id = "h_again", text = "What else, soldier? Time is short." } },
      choices = {
        { text = "What war in the south?", next = "war" },
        { text = "What does the war effort need?", next = "supplies" },
        { text = "I'm too green for any war.", next = "green", when = { maxLevel = 30 } },
        { text = "Not today, sergeant.", next = "END" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "Beyond Silithus, behind the old walls, something has woken that the night elves sealed away long ago. The Warchief and the Alliance both march against it, for once on the same road." } },
      choices = {
        { text = "Fighting beside the Alliance?", next = "alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alliance = {
      lines = { { id = "a_default", text = "Not beside, exactly. Ahead of them, if we can manage it, and the Horde should be the first through those gates." } },
      choices = {
        { text = "A common enemy makes a common cause.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let the Alliance bleed first.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    supplies = {
      lines = { { id = "s_default", text = "Copper and tin, herbs and leather, bandages and food. A soldier is only as strong as the wagon behind them, and our wagons must be full." } },
      choices = {
        { text = "Where do the wagons go?", next = "wagons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wagons = {
      lines = { { id = "wg_default", text = "To Orgrimmar first, where the war effort counts every crate, and then south to Silithus. Every city's pile is measured against the others, so Thunder Bluff's honour rides on those wagons too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    green = {
      lines = { { id = "g_default", text = "Nobody is too green to carry a bundle of linen. The war needs hands before it needs heroes, and every bundle counts." } },
      choices = { { text = "Then I'll carry what I can.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
}
