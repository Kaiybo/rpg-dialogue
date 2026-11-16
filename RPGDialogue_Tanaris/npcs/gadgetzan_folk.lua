-- Gadgetzan's working folk (0.37.0): the bank, the flight masters, the butcher, the gunsmith, the smith by the south gate,
-- and Yeh'kinya down at Steamwheedle Port. Voice: bibles/tanaris.md
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gimblethorn", id = TODO_NPC("Gimblethorn"), name = "Gimblethorn", title = "Banker",
  bible = "bibles/tanaris.md", role = "banker", tier = "service",
  communities = { "gadgetzan" }, temper = { "dry" }, values = { "careful", "profit" },
  notices = { "purse" },

  impression = {
    first = "Gimblethorn keeps Gadgetzan's vault and counts every coin twice, once for the Cartel and once for himself. He trusts the Bruisers more than the walls, and the walls more than anyone holding a sword.",
    third = "{name} met Gimblethorn, the goblin who keeps the bank in Gadgetzan.",
  },

  greetings = {
    { id = "g_default", text = "Deposit, withdrawal, or are you just here for the shade? The shade's free, the vault isn't." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and your box is right where you left it, which in this town counts as a minor miracle." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "That's a heavy purse to carry across a desert full of Wastewanders, friend. I'd let the vault carry it, if I were you." },
    { id = "n_poor", cat = "purse", when = { money = { max = 500 } },
      text = "You can keep the vault for your things even with an empty purse, so don't look so worried; nobody here charges you for being broke." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gimblethorn, banker to the Steamwheedle Cartel in Gadgetzan. Horde gold and Alliance gold weigh the same on my scales, and both go in the same vault behind the same Bruisers." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The vault never closes, because a goblin bank that closes is a goblin bank somebody else is opening. Make it quick, though; I'm on my third pot of coffee." },
      },
      again = {
        { id = "h_again", text = "Anything else, or shall I open your box?" },
        { id = "h_again2", text = "Still here? Time is money, friend, and so is the lamp oil." },
      },
      choices = {
        { text = "Open my box, please.", next = "BUSINESS" },
        { text = "Is anything in this town actually safe?", next = "safe" },
        { text = "Who banks with you?", next = "clients" },
        { text = "Do the Horde keep their gold beside ours?", next = "both_sides", when = { faction = "Alliance" } },
        { text = "Do the Alliance keep their gold beside ours?", next = "both_sides", when = { faction = "Horde" } },
        { text = "That's all.", next = "END" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "The vault is safe, because the Cartel pays the Bruisers to make it safe, and the Bruisers don't care what colour your tabard is. Everything outside the walls belongs to the bandits and the sun." } },
      choices = {
        { text = "What about the Wastewanders?", next = "safe_bandits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_bandits = {
      lines = { { id = "sb_default", text = "They took the water towers, and if they could find a way through these doors they'd take the vault too. The Water Company pays bounties for them, so ask Bilgewhizzle, and bring the bounty money back here afterwards." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    clients = {
      lines = { { id = "c_default", text = "Everyone who means to come back. I won't name names, because a banker who talks about his customers doesn't stay a banker long, but Marin's box is very full of receipts." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    both_sides = {
      lines = {
        { id = "bs_default", text = "Side by side, in the same vault, and they've never once started a war down there. If the factions behaved half as well as their gold does, I'd be out of a job guarding it." },
      },
      choices = {
        { text = "Neutral ground is good for everyone.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd sooner not share a roof with them.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I counted coins in Booty Bay until the Cartel needed a careful pair of hands out here, and careful hands are rare in a desert." } },
    advice = { { id = "tp_ad", text = "Never carry more across the dunes than you can afford to lose to a bandit." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel keeps the peace because peace is good for business, and the vault is where that business ends up." } },
    _none = { { id = "tp_none", text = "That isn't something I can put a price on, so I don't know anything about it." } },
  },
}

P:NPC {
  key = "bera", id = TODO_NPC("Bera Stonehammer"), name = "Bera Stonehammer", title = "Gryphon Master",
  bible = "bibles/tanaris.md", role = "flightmaster", tier = "service",
  communities = { "gadgetzan" }, temper = { "blunt" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Bera Stonehammer keeps the Alliance gryphons in Gadgetzan and spends half her day keeping sand out of their feathers. She speaks of the desert like a personal insult.",
    third = "{name} met Bera Stonehammer, the dwarf who keeps the Alliance gryphons in Gadgetzan.",
  },

  greetings = {
    { id = "g_default", text = "Need a bird? Mind the sand on the perch, it gets into everything, and the gryphons hate it more than I do." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, this far south! Did you get lost on the way to the mountains, or did someone pay you to come and sweat?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bera Stonehammer, gryphon master for the Alliance in Gadgetzan. I'll get you back to Theramore or Feathermoon, or wherever else your road runs, and if you're Horde, the orc with the wind riders is over there." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "My birds won't carry you, I'm afraid, and they bite strangers anyway. Bulkrek keeps the wind riders a little further on, and he'll see you right." },
      },
      again = {
        { id = "h_again", text = "Anything else? The birds are restless in this heat." },
        { id = "h_again2", text = "Go on, then, ask; I've a bucket of water to fetch before the gryphons start complaining." },
      },
      choices = {
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "How do gryphons stand the desert?", next = "heat" },
        { text = "You and the orc get along?", next = "bulkrek" },
        { text = "Goodbye.", next = "END" },
      },
    },
    heat = {
      lines = { { id = "he_default", text = "Badly, and they let me know it, because a gryphon is a mountain bird with a mountain bird's opinions. I keep them in the shade and pay the Water Company for their troughs, and that's more water than some folk here drink." } },
      choices = {
        { text = "Water for birds, in a drought?", next = "heat_water" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heat_water = {
      lines = { { id = "hw_default", text = "A thirsty gryphon drops you in the dunes, friend, so yes, water for birds, and gladly. If you want the price to come down, go and run those bandits off Waterspring Field." } },
      choices = {
        { text = "The birds come first. Fair enough.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "People should drink before animals.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bulkrek = {
      lines = {
        { id = "bk_default", text = "We share a well and a wall, and we nod in the mornings. The Bruisers make sure that's all we do, though truth be told, he keeps his beasts better than half the gryphon masters I trained with." },
        { id = "bk_dwarf", when = { race = "Dwarf" }, text = "Aye, I know what Ironforge would say about it, and Ironforge isn't here sweating with me. He keeps his beasts well, and that's the measure I use." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I've kept gryphons since I was a lass in the snows of Dun Morogh, and the Alliance sent me where the birds were needed. Nobody asked whether I liked sand." } },
    advice = { { id = "tp_ad", text = "Carry water on the flight, because there's none to land for between here and Feralas." } },
    _none = { { id = "tp_none", text = "Couldn't tell you; ask somebody with less sand in their ears." } },
  },
}

P:NPC {
  key = "bulkrek", id = TODO_NPC("Bulkrek Ragefist"), name = "Bulkrek Ragefist", title = "Wind Rider Master",
  bible = "bibles/tanaris.md", role = "flightmaster", tier = "service",
  communities = { "gadgetzan" }, temper = { "gruff" }, values = { "dutiful", "honor" },
  notices = { "race" },

  impression = {
    first = "Bulkrek Ragefist keeps the Horde's wind riders in Gadgetzan and says very little that isn't about them. He nods at the dwarf across the yard every morning, and seems to mean it.",
    third = "{name} met Bulkrek Ragefist, the orc who keeps the Horde's wind riders in Gadgetzan.",
  },

  greetings = {
    { id = "g_default", text = "You need a wind rider, or you need shade? Both are here; only one is free." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar. It's good to see a face from Durotar in this goblin oven; the sun here is worse than ours, and the company talks more." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Bulkrek Ragefist, and I keep the wind riders for the Horde here. They will take you to Orgrimmar, the Crossroads, Camp Mojache and wherever else the Horde flies." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "My riders don't carry the Alliance, and they'd tell you so themselves, louder than I would. Stonehammer keeps your gryphons; go and see her." },
      },
      again = {
        { id = "h_again", text = "Speak, then. The riders are fed." },
        { id = "h_again2", text = "More? The heat makes orcs short-tempered, but I will listen." },
      },
      choices = {
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "How do the wind riders take the heat?", next = "riders" },
        { text = "Do you trust the goblins here?", next = "goblins" },
        { text = "Goodbye.", next = "END" },
      },
    },
    riders = {
      lines = { { id = "r_default", text = "Better than the dwarf's gryphons, because the Barrens raised them hard. They hunt the basilisks out past the walls when I let them, and the goblins pay me not to let them hunt anything else." } },
      choices = {
        { text = "What else would they hunt?", next = "riders_hunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    riders_hunt = {
      lines = { { id = "rh_default", text = "Goats, mostly, and once a goblin's chicken, which cost me a week's wages and a long apology to the Bruisers. A wind rider does not understand property, and I have stopped trying to teach it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    goblins = {
      lines = {
        { id = "g_line", text = "I trust them to want my coin, which is a kind of trust. Their Bruisers keep the peace with the dwarf across the yard, and peace with a dwarf is a strange thing for an orc to get used to." },
        { id = "g_orc", when = { race = "Orc" }, text = "Every orc remembers the camps, or the stories of them, so you know what it means to nod at a dwarf each morning and not reach for an axe. I've done it for a year now, and some days I even mean the nod." },
      },
      choices = {
        { text = "Peace with the Alliance is worth keeping.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A truce bought by goblins won't last.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I sat in the camps until Thrall broke them open, and I have flown for the Horde since. Now I fly goblins' customers, and I don't complain where the Warchief can hear." } },
    advice = { { id = "tp_ad", text = "Don't feed the riders from your hand unless you've spare fingers." } },
    _none = { { id = "tp_none", text = "I know wind riders and I know the sky. That is neither." } },
  },
}

P:NPC {
  key = "dirge", id = TODO_NPC("Dirge Quikcleave"), name = "Dirge Quikcleave", title = "Butcher",
  bible = "bibles/tanaris.md", role = "vendor", tier = "quest",
  communities = { "gadgetzan" }, temper = { "boastful" }, values = { "pride", "profit" },
  notices = { "class" },

  impression = {
    first = "Dirge Quikcleave calls himself the greatest living chef in Azeroth and waves a cleaver to make the point. There is a drought in Gadgetzan, but somehow never a shortage of his meat.",
    third = "{name} met Dirge Quikcleave, the boastful goblin butcher of Gadgetzan's inn.",
  },

  greetings = {
    { id = "g_default", text = "Hungry? Course you're hungry; everyone who smells my kitchen is hungry." },
    { id = "g_chops", when = { questActive = TODO_QUEST("Dirge's Kickin' Chimaerok Chops") }, text = "Tenderloins! Tell me you brought tenderloins, because the pan's hot and my patience isn't." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Then you know good meat when you skin it, and you know my prices are fair for it, more or less." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Dirge Quikcleave, greatest living chef in all of Azeroth, and the living part matters, because the competition keeps dying in the desert. Water's short in Gadgetzan, but meat isn't, so what'll it be?" },
        { id = "h_chops_before", when = { level = { min = 58 }, questBefore = TODO_QUEST("Dirge's Kickin' Chimaerok Chops") },
          text = "You look like somebody who goes to dangerous places, and I've got a recipe that needs a dangerous place. Chimaerok, friend, off the Isle of Dread, and nobody's tasted it the way I cook it." },
        { id = "h_chops_during", tags = { "news" }, when = { questActive = TODO_QUEST("Dirge's Kickin' Chimaerok Chops") },
          text = "The Isle of Dread's off the Feralas coast, and the chimaerok there are the size of houses and twice as mean. Bring me their tenderloins, and the rest of the recipe's my secret." },
        { id = "h_chops_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("Dirge's Kickin' Chimaerok Chops"), days = 3 } },
          text = "Kickin' Chimaerok Chops, made right, for the first time this side of the sea! I'd frame the pan if I didn't need it for dinner." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, the grill's on." },
        { id = "h_again2", text = "Still standing there? Either buy something or tell me a secret ingredient." },
        { id = "h_again3", text = "Go on, I can chop and listen at the same time." },
      },
      choices = {
        { text = "Let's see what you're selling.", next = "BUSINESS" },
        { text = "Where does the meat come from?", next = "meat" },
        { text = "Greatest living chef? Says who?", next = "boast" },
        { text = "Tell me about these chimaerok chops.", next = "chops", when = { level = { min = 55 } } },
        { text = "Any tips for a fellow cook?", next = "cook", when = { profession = "Cooking" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    meat = {
      lines = { { id = "m_default", text = "Basilisks, mostly, and the odd hyena, and a few things the hunters bring in that I don't ask about. Out here you don't ask the meat where it's been, you ask how long it's been dead." } },
      choices = {
        { text = "And how long has it been dead?", next = "meat_age" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat_age = {
      lines = { { id = "ma_default", text = "Not long enough to matter, which is the important thing in a desert! Fizzgrimble serves it at the bar and nobody's died yet, or nobody's complained, which is nearly the same." } },
      choices = {
        { text = "I'll take my chances. Smells good.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I think I'll eat my own rations.", next = "BACK", fx = { affinity = -1, trait = { cautious = 1 } } },
      },
    },
    boast = {
      lines = { { id = "b_default", text = "Says me, and says every Bruiser who's ever eaten here and come back for seconds. Show me another cook in Kalimdor who can make a basilisk taste like a holiday, and I'll hand him my cleaver." } },
      choices = {
        { text = "I've eaten better in Stormwind.", next = "boast_rival", when = { faction = "Alliance" } },
        { text = "I've eaten better in Orgrimmar.", next = "boast_rival", when = { faction = "Horde" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boast_rival = {
      lines = { { id = "br_default", text = "Have you, now? Then they had water to cook with and a cellar full of herbs, and I've got sand, a grill and genius. You come back after a week in the dunes and tell me what tastes better." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    chops = {
      lines = { { id = "c_default", text = "My masterpiece, Dirge's Kickin' Chimaerok Chops, and it needs chimaerok tenderloins, which means the Isle of Dread. The beasts there have two heads and both of them bite, so bring friends and come back with fewer bite marks than they do." } },
      choices = {
        { text = "Who eats chimaerok, anyway?", next = "chops_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chops_who = {
      lines = { { id = "cw_default", text = "People with money, friend, and people with money don't say why they're hungry. That's my favourite kind of customer, and I'd advise you not to ask either." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    cook = {
      lines = { { id = "ck_default", text = "Season like you mean it, and never let a customer see what's in the pot. Half of cooking is the food, and the other half is not telling anyone how you made it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I cooked for pirates, for the Cartel and once for a trogg, who ate the plate. Now I cook for Gadgetzan, which is all of those at once." } },
    advice = { { id = "tp_ad", text = "In the desert, salt the meat and not your wounds. Learn that one the easy way." } },
    _none = { { id = "tp_none", text = "Can I fry it? No? Then I don't know it." } },
  },
}

P:NPC {
  key = "blizrik", id = TODO_NPC("Blizrik Buckshot"), name = "Blizrik Buckshot", title = "Gunsmith",
  bible = "bibles/tanaris.md", role = "vendor", tier = "service",
  communities = { "gadgetzan" }, temper = { "loud" }, values = { "profit", "inventive" },
  notices = { "class", "race" },

  impression = {
    first = "Blizrik Buckshot sells guns in a town where the Bruisers forbid using them, and sees no contradiction in it. He test-fires everything into the same unlucky sand dune.",
    third = "{name} met Blizrik Buckshot, the goblin gunsmith of Gadgetzan.",
  },

  greetings = {
    { id = "g_default", text = "Looking for a boomstick? You came to the right goblin, and the only one, so either way you're in luck." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and I can tell from the squint! Somebody who aims for a living deserves better than that rusty thing on your back." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf in my shop, so I'll keep my prices honest and my mouth shut about Ironforge barrels. Mostly shut." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Blizrik Buckshot, gunsmith! Rifles, ammunition, and the occasional something special when a crate turns up from Booty Bay, and every one of them tested on that dune out back." },
        { id = "h_bruisers", when = { metBefore = true },
          text = "The Bruisers came round again about my testing, so I'm aiming further left now. The dune didn't complain, but the goat behind it did." },
      },
      again = {
        { id = "h_again", text = "What else? I've got powder drying and it doesn't like to wait." },
        { id = "h_again2", text = "Go ahead, ask, but keep your fingers off the triggers." },
      },
      choices = {
        { text = "Show me your guns.", next = "BUSINESS" },
        { text = "Guns in a town that bans fighting?", next = "peace" },
        { text = "Dwarven guns or goblin guns?", next = "rivals" },
        { text = "Goodbye.", next = "END" },
      },
    },
    peace = {
      lines = { { id = "p_default", text = "The Bruisers ban shooting people inside the walls, not selling the means to shoot them outside. That's a distinction worth a great deal of money, and I live in it." } },
      choices = {
        { text = "A neat loophole. Good for you.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Seems the Bruisers should close it.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivals = {
      lines = {
        { id = "r_default", text = "Dwarves make guns that last a hundred years, and goblins make guns that go bang a hundred times louder. You pick which you'd rather have in a fight, but mine come with a lot more personality." },
        { id = "r_dwarf", when = { race = "Dwarf" }, text = "You'll say Ironforge, of course, and you'll be right about the barrels and wrong about everything else. A goblin rifle has heart, and sometimes a little too much powder." },
      },
      choices = {
        { text = "Too much powder?", next = "rivals_powder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivals_powder = {
      lines = { { id = "rp_default", text = "Only a little too much, and only on the cheaper ones, and the eyebrows grow back in a month. I tell every customer that before they buy, which makes me the most honest gunsmith in Tanaris." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I blew up my first workshop in Ratchet and my second in Booty Bay, so Gadgetzan's got lots of open space, which I appreciate." } },
    advice = { { id = "tp_ad", text = "Clean the barrel after the sandstorm, not before the next one." } },
    _none = { { id = "tp_none", text = "Never heard of it, but if it needs shooting, I know a goblin." } },
  },
}

P:NPC {
  key = "trenton", id = TODO_NPC("Trenton Lighthammer"), name = "Trenton Lighthammer",
  bible = "bibles/tanaris.md", role = "blacksmith", tier = "quest",
  communities = { "gadgetzan" }, temper = { "patient" }, values = { "craft", "dedication" },
  notices = { "class", "race" },

  impression = {
    first = "Trenton Lighthammer works a forge by Gadgetzan's south gate and speaks of metal the way a priest speaks of prayer. He wants something from Zul'Farrak's trolls, and he is patient about it.",
    third = "{name} met Trenton Lighthammer, the night elf smith by Gadgetzan's south gate.",
  },

  greetings = {
    { id = "g_default", text = "Mind the sparks, friend. The desert dries everything, even fire." },
    { id = "g_temper", when = { questActive = TODO_QUEST("Troll Temper") }, text = "Have the Sandfury given up their temper yet, or are they still guarding it with their lives?" },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah. You're wondering what one of the kaldorei is doing at a goblin's anvil, and the answer is that steel doesn't care who strikes it." },
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Your blade's been well used and badly kept, and it'll fail you at the wrong moment. Bring it to an anvil before you go anywhere near the trolls." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Trenton Lighthammer, smith. I work here by the south gate because it's nearest the road to Zul'Farrak, and the trolls of that city have something I need for my craft." },
        { id = "h_before", when = { level = { min = 42 }, questBefore = TODO_QUEST("Troll Temper") },
          text = "You have the look of someone who could walk into Zul'Farrak and walk out again. The Sandfury carry a temper in vials, a troll-made thing for treating steel, and I'd pay well for it." },
        { id = "h_during", tags = { "news" }, when = { questActive = TODO_QUEST("Troll Temper") },
          text = "Twenty vials of their temper is what I need, and the Sandfury carry it on their persons, not in some storeroom. You'll have to take it from them, one troll at a time." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("Troll Temper"), days = 3 } },
          text = "The temper's already in the quench, and the steel took it better than I hoped. Whatever the Sandfury are, they know metal, and I won't pretend otherwise." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk while the iron heats." },
        { id = "h_again2", text = "Ask on. The forge is patient, and so am I." },
      },
      choices = {
        { text = "What is troll temper, exactly?", next = "temper" },
        { text = "What's Zul'Farrak like?", next = "zf" },
        { text = "A night elf working steel?", next = "kaldorei" },
        { text = "Tell me what a smith wants with trolls.", next = "smith_talk", when = { profession = "Blacksmithing" } },
        { text = "I'll bring you their temper.", next = "END", when = { questBefore = TODO_QUEST("Troll Temper") }, fx = { affinity = 2 } },
        { text = "Goodbye.", next = "END" },
      },
    },
    temper = {
      lines = { { id = "t_default", text = "A troll quenching draught, made in vials and carried by their warriors. Steel quenched in it holds an edge longer than anything I can mix here, and I've tried every recipe a goblin will sell me." } },
      choices = {
        { text = "So the trolls are better smiths?", next = "temper_better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    temper_better = {
      lines = {
        { id = "tb_default", text = "At this, yes, and a smith who can't admit that has stopped learning. I'd sooner learn from an enemy than go on making blades that fail the people who carry them." },
        { id = "tb_troll", when = { race = "Troll" }, text = "You'd know better than I would, perhaps. The Darkspear and the Sandfury aren't kin in any way that matters now, I'm told, but some old knowledge runs through every tribe, and this is some of it." },
      },
      choices = {
        { text = "Wisdom is wisdom, whoever holds it.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Take it from them. They'd take it from you.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zf = {
      lines = { { id = "z_default", text = "A walled city of the Sandfury trolls to the west, old and sunbaked and full of them. Gadgetzan trades with half the world, but nobody trades with Zul'Farrak, and the Bruisers watch that road closely." } },
      choices = {
        { text = "What do the Sandfury want?", next = "zf_want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zf_want = {
      lines = { { id = "zw_default", text = "The desert back, I'd guess, and every outsider out of it, goblin and elf alike. Tran'rek knows more about what's inside the walls than I do, though getting him to say so is its own expedition." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    kaldorei = {
      lines = {
        { id = "k_default", text = "My people work wood and moonlight, mostly, and most of them think a forge is a dwarf's toy. I thought so too until I watched good steel save a sentinel's life, and then I stopped thinking it." },
        { id = "k_nelf", when = { race = "NightElf" }, text = "You'll have heard the elders on the subject, I expect, and I've heard them too, many times. The forest doesn't need my blades, but the people walking out of it into places like this do." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    smith_talk = {
      lines = { { id = "st_default", text = "A smith wants whatever makes the edge hold, and pride is the first thing that has to go. Krinkle by the forge on the south side sells good supplies, and he'll sell to anyone who doesn't ask awkward questions." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I left Kalimdor's forests for its forges, and the forges led me here, to sand and goblins and patience." } },
    advice = { { id = "tp_ad", text = "Keep your edge oiled in the desert. The sand eats a dry blade." } },
    _none = { { id = "tp_none", text = "I can't say, though if it's made of metal I'll look at it." } },
  },
}

-- Steamwheedle Port.
P:NPC {
  key = "yehkinya", id = TODO_NPC("Yeh'kinya"), name = "Yeh'kinya",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  communities = { "steamwheedle_port" }, temper = { "sly" }, values = { "secretive", "patient" },
  notices = { "race", "class" },

  impression = {
    first = "Yeh'kinya is an old troll at Steamwheedle Port who says drink has dulled his eyes but not his inner sight. He talks about a dead god very calmly for someone who claims not to believe in him.",
    third = "{name} met Yeh'kinya, an old jungle troll at Steamwheedle Port who studies the god Hakkar.",
  },

  greetings = {
    { id = "g_default", text = "Ah, mon, sit with old Yeh'kinya a while. The sea is loud, but the spirits are louder." },
    { id = "g_bramble", when = { questActive = TODO_QUEST("Screecher Spirits") }, text = "You still carry my bramble, mon, so wave it over a dead screecher and see what rises." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "One of the Darkspear, so far from the Echo Isles! Then you've heard the old tales of the Soulflayer, even if your elders hush the young ones when they tell them." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "SHAMAN" } },
      text = "You speak to powers too, mon, so you'll understand an old troll who listens to the dead. We're not so different, you and me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Yeh'kinya, they call me, and I sit here by the water and study the old gods of my people. My eyes are tired and my hands shake from the drink, but the spirits still talk to me, mon." },
        { id = "h_screech_before", when = { level = { min = 42 }, questBefore = TODO_QUEST("Screecher Spirits") },
          text = "The screechers of Feralas are cousins to an old god of the trolls, and their spirits remember him. Bring me a few of those spirits, and I'll tell you a story most outsiders never hear." },
        { id = "h_screech_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Screecher Spirits"), days = 3 } },
          text = "The screecher spirits are restless in their jar, mon, and that's a good sign. Now Yeh'kinya can tell you of Hakkar, the Soulflayer." },
        { id = "h_moshaaru", tags = { "news" }, when = { questActive = TODO_QUEST("The Prophecy of Mosh'aru") },
          text = "The tablets of Mosh'aru are in Zul'Farrak, mon, and the Sandfury don't share their history with strangers. Bring them both to me." },
        { id = "h_egg", tags = { "news" }, when = { questActive = TODO_QUEST("The Ancient Egg") },
          text = "The egg, mon, the ancient egg! The tablets told us where to look, so be gentle when you find it, because old things break easily." },
        { id = "h_godhakkar", tags = { "news" }, when = { questActive = TODO_QUEST("The God Hakkar") },
          text = "Take the egg into the sunken temple of Atal'Hakkar, and let it drink what it was made to drink. Then bring it back to Yeh'kinya, mon, and we'll keep that power safe together." },
      },
      again = {
        { id = "h_again", text = "More questions? The spirits don't mind, and neither does Yeh'kinya." },
        { id = "h_again2", text = "Sit, sit. The tide's slow, and so am I." },
      },
      choices = {
        { text = "Who is Hakkar?", next = "hakkar" },
        { text = "Why study him at all?", next = "why" },
        { text = "Why live among goblins at a port?", next = "port" },
        { text = "My elders never spoke of the Soulflayer.", next = "darkspear", when = { race = "Troll" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    hakkar = {
      lines = {
        { id = "hk_default", text = "The Soulflayer, a blood god the old Gurubashi served long ago, until the tribes turned on his priests and his temple sank into a swamp far across the sea. There's a prophecy among my people that he'll come back one day." },
        { id = "hk_done", when = { questDone = TODO_QUEST("Screecher Spirits") }, text = "You've heard the start of it already, mon. Some trolls say his return means glory for our people, and others say it means the end of everything, and Yeh'kinya listens to both." },
      },
      choices = {
        { text = "And what do you believe?", next = "hakkar_believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hakkar_believe = {
      lines = { { id = "hb_default", text = "Me? I believe it's a myth, mon, a story for frightening children. But even a myth has power in it, and power like that should be kept from hands that would misuse it." } },
      choices = {
        { text = "Some power should be destroyed, not kept.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Power's only dangerous in the wrong hands.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because nobody else will, mon, not the Darkspear and not the goblins. If a god is going to stir, better someone old and careful is watching for it than nobody at all." } },
      choices = {
        { text = "Careful? You seem very eager.", next = "why_eager" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_eager = {
      lines = { { id = "we_default", text = "Eager, careful, they look the same on an old face, mon. You go on asking questions like that, and you'll live a long time in this world." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    port = {
      lines = { { id = "p_default", text = "Ships come here from every coast, and every ship carries rumours. A troll who listens at the docks hears more than one who sits in a jungle, and the goblins only care that I pay for my drink." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    darkspear = {
      lines = { { id = "d_default", text = "No, they wouldn't, mon, and Sen'jin was wise to keep the young ones from it. But the Darkspear came out of the same old empire as the Gurubashi, and old blood remembers what the elders forget." } },
      choices = {
        { text = "Then let it stay forgotten.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "I'd rather know my people's history.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "An old troll from the old jungles, mon, with too much drink in him and too many stories." } },
    advice = { { id = "tp_ad", text = "Never wake something just to see if it's sleeping, mon." } },
    _none = { { id = "tp_none", text = "The spirits don't say, mon, and Yeh'kinya doesn't guess." } },
  },
}
