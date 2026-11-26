-- Desolace, folk no earlier pass reached: Marandis' Sister (the dryad of Nijel's Point and Sar'theris Strand),
-- the Gizelton Caravan's two harvest-golem vendors (Super-Seller 680, Vendor-Tron 1000), and a Shadowprey Guardian.
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC = P.TODO_NPC

-- Marandis' Sister: a dryad of the Cenarion Circle, kin to Keeper Marandis.
P:NPC {
  key = "des_marandis_sister", id = TODO_NPC("Marandis' Sister"), name = "Marandis' Sister", gender = "female",
  role = "citizen", tier = "service",
  communities = { "nijels_point" }, temper = { "kindly", "wistful" }, values = { "nature", "healing" },
  notices = { "class", "race" },
  impression = {
    first = "Marandis' Sister is a dryad, a daughter of Cenarius like the keeper she calls brother, and her hooves leave small green marks in the grey dust that are gone by evening. She looks at Desolace the way a healer looks at a wound that will not close.",
    third = "{name} met Marandis' Sister, a dryad of the Cenarion Circle in Desolace.",
  },
  greetings = {
    { id = "g_default", text = "Be welcome, traveller. Mind where you step, if you would; I planted something there this morning, and I am hoping it lives until tomorrow." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, and so did the shoot I planted. It is a good day in Desolace when two things return." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You carry my father's teaching in you, druid. Put your hand on this soil before you leave and tell me whether you feel anything at all." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah, child of the moon. Your people remember this land green, and so do mine." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "My brother keeps watch over this land and counts its wounds. I am not so patient, so I walk the strand and the hills and try to make something grow." },
      },
      again = {
        { id = "h_again", text = "Is there more you would ask a dryad, traveller?" },
        { id = "h_again2", text = "I am listening, though I may be planting while I do it." },
      },
      choices = {
        { text = "What happened to this land?", next = "land" },
        { text = "Keeper Marandis is your brother?", next = "brother" },
        { text = "Nothing will grow in this grey dust.", next = "dust" },
        { text = "May your seeds take root.", next = "END" },
      },
    },
    land = {
      lines = { { id = "l_default", text = "Demons, long ago, and the blood of the demigod they slew at Mannoroc Coven. The earth has been sick with it ever since, and the centaur fight over the bones of what is left." } },
      choices = {
        { text = "Can it be healed?", next = "heal" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    heal = {
      lines = { { id = "he_default", text = "My brother believes so, and I have chosen to believe him. A sickness that took centuries to settle will take centuries to lift, but dryads are good at waiting, as long as we are planting while we wait." } },
      choices = {
        { text = "Then the work is worth doing.", next = "BACK", reply = "It is. Thank you for saying so aloud; it helps to hear it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some places should be left to die.", next = "BACK", reply = "Perhaps, but not this one, and not while I still have seeds.", fx = { align = { light = -1 } } },
      },
    },
    brother = {
      lines = { { id = "b_default", text = "All the keepers and dryads are children of Cenarius, so in that way we are kin. He is older and graver than I am, and he lets me fuss over the saplings while he does the worrying for us both." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    dust = {
      lines = { { id = "d_default", text = "Not much, you are right, and not quickly. But I found a cactus blooming by the strand last spring, and if a cactus can manage it, I do not see why I should give up." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
  },
  topics = {
    cenarion_circle = { { id = "tp_circle", text = "The Circle sent my brother here to watch, and I came because he would not have asked me to." } },
    _none = { { id = "tp_none", text = "I know roots and rain, traveller, and very little else. Ask the soldiers at the point." } },
  },
}

-- Super-Seller 680: the Gizelton Caravan's general goods golem.
P:NPC {
  key = "des_super_seller", id = TODO_NPC("Super-Seller 680"), name = "Super-Seller 680", gender = "male",
  role = "vendor", tier = "service",
  communities = {}, temper = { "odd" }, values = { "commerce" },
  notices = { "kit" },
  impression = {
    first = "Super-Seller 680 is a harvest golem fitted out as a shop, and it walks the road with the Gizelton Caravan. Its voice box has been tuned to sound cheerful, which works most of the time.",
    third = "{name} met Super-Seller 680, the Gizelton Caravan's general goods golem.",
  },
  greetings = {
    { id = "g_default", text = "Greetings, valued customer! Super-Seller 680 is open for business, and every price has been approved by the Gizelton Caravan Company." },
  },
  notice = {
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Scanning customer. Your equipment is reading as badly damaged, so Super-Seller 680 recommends supplies, bandages and a different hobby." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Super-Seller 680 carries food, drink and general goods for the long road across Desolace. Please do not climb on Super-Seller 680, as the warranty does not cover it." } },
      again = { { id = "h_again", text = "Super-Seller 680 is still listening. Please continue, valued customer." } },
      choices = {
        { text = "Who programmed you?", next = "maker" },
        { text = "You used to work a farm, didn't you?", next = "farm" },
        { text = "What's your best-selling item?", next = "xbest" },
        { text = "Do you ever get tired of selling?", next = "xtired" },
        { text = "Your voice sounds a bit rusty.", next = "xrusty" },
        { text = "I'm a gnome. Who built your speech module?", next = "xgnome", when = { race = "Gnome" } },
        { text = "Goodbye, machine.", next = "END" },
      },
    },
    maker = {
      lines = { { id = "m_default", text = "Super-Seller 680 was refitted by the Gizelton Caravan's goblin engineers, who also installed the sales voice. Super-Seller 680 has been told the old voice frightened customers." } },
      choices = {
        { text = "What did the old voice say?", next = "oldvoice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oldvoice = {
      lines = { { id = "o_default", text = "That record has been deleted, valued customer. Super-Seller 680 is a happy shop now, and only the occasional word about harvesting slips out." } },
      choices = { { text = "That's not reassuring. Something else.", next = "BACK" } },
    },
    farm = {
      lines = { { id = "f_default", text = "Super-Seller 680 was built for fields, yes, and was bought cheap when its first owners stopped needing it. Now it harvests coin instead of wheat, and the goblins say that is a promotion." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xbest = {
      lines = { { id = "xxbest_d", text = "Super-Seller 680's best-selling item is Ice Cold Milk, which is not cold, and the Gizelton Caravan Company would like to remind you that the name is a brand and not a promise." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtired = {
      lines = { { id = "xxtired_d", text = "Super-Seller 680 does not get tired. Super-Seller 680 does sometimes get lonely, but that is not in the manual, and Super-Seller 680 has been instructed not to mention it." } },
      choices = {
        { text = "Should a machine be allowed to feel lonely?", next = "xlonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlonely = {
      lines = { { id = "xxlonely_d", text = "Super-Seller 680 is not sure. Super-Seller 680 would like to hear a customer opinion." } },
      choices = {
        { text = "Yes. Whatever you feel is real enough.", next = "BACK", reply = "Thank you, valued customer. Super-Seller 680 will add you to the special list.", fx = { align = { light = 1 } } },
        { text = "No. You're a machine, and machines don't feel.", next = "BACK", reply = "Understood, valued customer. Super-Seller 680 will resume normal operation.", fx = { align = { light = -1 } } },
      },
    },
    xrusty = {
      narr = "Something inside it clicks, and three faint notes of a tune play before it shudders and falls quiet.",
      lines = { { id = "xxrusty_d", text = "Super-Seller 680's voice box was damaged in a sandstorm and repaired with parts from a broken music box. Some customers report hearing a lullaby when Super-Seller 680 says certain words." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = { { id = "xxgnome_d", text = "Super-Seller 680's speech module was purchased from a gnome in Ratchet who later went missing. Super-Seller 680 sometimes says things it does not understand, which may be his fault." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gizelton = { { id = "tp_xgizelton", text = "The Gizelton Caravan Company. Super-Seller 680's employer and owner." } },
    kodo_graveyard = { { id = "tp_xkodo_graveyard", text = "Super-Seller 680 does not stop near the Kodo Graveyard. The kodos do not buy anything." } },
   
    _none = { { id = "tp_none", text = "That query is outside Super-Seller 680's merchandise list. Would you like to buy some bread?" } },
  },
}

-- Vendor-Tron 1000: the caravan's trade goods golem.
P:NPC {
  key = "des_vendor_tron", id = TODO_NPC("Vendor-Tron 1000"), name = "Vendor-Tron 1000", gender = "male",
  role = "vendor", tier = "service",
  communities = {}, temper = { "odd" }, values = { "commerce" },
  notices = { "class" },
  impression = {
    first = "Vendor-Tron 1000 is the Gizelton Caravan's trade goods golem, a harvest golem with shelves bolted to its chest. It is very proud of its model number and mentions it often.",
    third = "{name} met Vendor-Tron 1000, a trade goods golem of the Gizelton Caravan.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Vendor-Tron 1000, the finest mobile trade goods outlet in Desolace. Please browse carefully, because the road is bumpy and the shelves are not." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Customer profile suggests a spellcaster. Vendor-Tron 1000 stocks thread, flux and dye, but sadly no arcane reagents, and apologizes for the inconvenience." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Vendor-Tron 1000 carries thread, dye, flux and other goods for crafting folk. It is one thousand, which is more than the Super-Seller, and you may draw your own conclusions." } },
      again = { { id = "h_again", text = "Vendor-Tron 1000 awaits your further enquiry." } },
      choices = {
        { text = "Is the road safe for the caravan?", next = "road" },
        { text = "You and the Super-Seller don't get along?", next = "rival" },
        { text = "What's the most useful thing you sell?", next = "xuseful" },
        { text = "Have you been attacked on the road?", next = "xattack" },
        { text = "You seem very proud of your number.", next = "xproud" },
        { text = "I'm a tailor. Do you have fine thread?", next = "xtailor", when = { profession = "Tailoring" } },
        { text = "Farewell.", next = "END" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "The road is not safe, customer. The centaur raid the caravan and the caravan pays adventurers to stop them, which Vendor-Tron 1000 records as an operating expense." } },
      choices = {
        { text = "Who do I ask about guarding it?", next = "guard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guard = {
      lines = { { id = "g2_default", text = "Speak to the goblins who drive the kodos, customer. Vendor-Tron 1000 sells goods and does not hire, though it watches the hiring with interest." } },
      choices = { { text = "Thanks. Something else.", next = "BACK" } },
    },
    rival = {
      lines = { { id = "rv_default", text = "Vendor-Tron 1000 has no opinion of the Super-Seller 680, beyond noting that six hundred and eighty is a smaller number than one thousand." } },
      choices = { { text = "Noted. Something else.", next = "BACK" } },
    },
    xuseful = {
      lines = { { id = "xxuseful_d", text = "Vendor-Tron 1000 recommends flux, which smiths need more often than they admit, and dye, which tailors need more often than they plan. Thread is popular with everyone who has holes in their trousers." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xattack = {
      lines = { { id = "xxattack_d", text = "Vendor-Tron 1000 has been attacked forty-one times by centaur, eleven times by kodo and once by an angry customer who disputed a price. Vendor-Tron 1000 survived all of them." } },
      choices = {
        { text = "Who was the angry customer?", next = "xangry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xangry = {
      lines = { { id = "xxangry_d", text = "A dwarf who believed flux should cost less. Vendor-Tron 1000 disagreed, and the caravan's guards resolved the dispute. Was Vendor-Tron 1000 right to hold its price?" } },
      choices = {
        { text = "Yes. A fair price is a fair price.", next = "BACK", reply = "Agreed. Vendor-Tron 1000 is pleased to meet a reasonable customer.", fx = { align = { order = 1 } } },
        { text = "No. You should have haggled with him.", next = "BACK", reply = "Vendor-Tron 1000 is not programmed to haggle. Vendor-Tron 1000 will consider an upgrade.", fx = { align = { order = -1 } } },
      },
    },
    xproud = {
      narr = "A small lamp on its chest blinks in what might be smugness.",
      lines = { { id = "xxproud_d", text = "One thousand is a very good number. It is higher than six hundred and eighty, which is the Super-Seller's number, and Vendor-Tron 1000 mentions this often." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtailor = {
      lines = { { id = "xxtailor_d", text = "Vendor-Tron 1000 stocks fine thread in several colours, though the caravan's bumpy road has tangled most of it. Please untangle at your own expense." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    super_seller = { { id = "tp_xsuper_seller", text = "Super-Seller 680. Lower number. Vendor-Tron 1000 does not wish to discuss it further." } },
    centaur = { { id = "tp_xcentaur", text = "Centaur attack the caravan often. Vendor-Tron 1000 has been dented forty-one times." } },
   
    _none = { { id = "tp_none", text = "Query not recognized. Vendor-Tron 1000 suggests you purchase some thread while you think of a better one." } },
  },
}

-- Shadowprey Guardian: a Darkspear guard of the village by the sea.
P:NPC {
  key = "des_shadowprey_guardian", id = TODO_NPC("Shadowprey Guardian"), name = "Shadowprey Guardian", gender = "male",
  role = "guard", tier = "service",
  communities = { "shadowprey" }, temper = { "gruff" }, values = { "duty" },
  impression = {
    first = "The Shadowprey Guardians are Darkspear trolls who keep watch over Shadowprey Village and its little harbour. This one leaned on his spear and looked at me as if he had seen a hundred like me and buried a few.",
    third = "{name} spoke with a Shadowprey Guardian in Desolace.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Shadowprey, mon. Keep your weapon down in de village and you and me be fine friends." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "You be a long way from Nijel's Point, stranger. Walk slow, talk soft, and do your business quick." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I guard dis village and de docks for de Horde, and de sea gives us more trouble than de centaur do. De Kolkar come from de north, but de naga come from de water, and dat be worse." } },
      again = { { id = "h_again", text = "Anything else you want from a tired guard, mon?" } },
      choices = {
        { text = "Naga come here?", next = "naga" },
        { text = "Who runs Shadowprey?", next = "who" },
        { text = "How long have you guarded Shadowprey?", next = "xlong" },
        { text = "What do the naga want here?", next = "xwant" },
        { text = "You look like you've seen hard fighting.", next = "xhard" },
        { text = "I'm a Darkspear too. How's the village?", next = "xtroll", when = { race = "Troll" } },
        { text = "Stay sharp.", next = "END" },
      },
    },
    naga = {
      lines = { { id = "n_default", text = "Out on Ranazjar Isle and up de coast at Sar'theris, ya. Dey watch de village at night, and some nights dey come close enough dat you hear dem breathin' in de surf." } },
      choices = {
        { text = "Then push them back into the sea.", next = "BACK", reply = "Ya, mon, dat be de plan, if de Horde send us enough spears.", fx = { align = { order = 1 } } },
        { text = "Leave them be, if they leave you be.", next = "BACK", reply = "Dey never leave nobody be, but maybe you be luckier than me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "De Horde sends orders from Orgrimmar by wind rider, and de innkeeper hears everything dat de fighters forget to say. Ask at de inn for de rest." } },
      choices = { { text = "I'll ask there. Something else.", next = "BACK" } },
    },
    xlong = {
      lines = { { id = "xxlong_d", text = "Since de Darkspear came to Kalimdor with Thrall, mon. Vol'jin sent some of us down de coast to hold dis place, and here I stay, with de sea and de sand and de centaur arguin'." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwant = {
      lines = { { id = "xxwant_d", text = "Dey want de coast, de shipwrecks and anything shiny. Some say dey be tied to de old elf queen, and some say dey just be hungry." } },
      choices = {
        { text = "Should the Horde drive them back into the sea?", next = "xdrive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdrive = {
      lines = { { id = "xxdrive_d", text = "Dat be de question de elders argue every night by de fire, mon." } },
      choices = {
        { text = "Drive them back. The coast belongs to the Horde.", next = "BACK", reply = "Ha! Dat be de warrior talkin'. I like it, mon.", fx = { align = { order = 1 } } },
        { text = "Leave them alone. The sea is theirs.", next = "BACK", reply = "Maybe, mon, if dey leave us alone too. Dey don't, though.", fx = { align = { order = -1 } } },
      },
    },
    xhard = {
      narr = "He rolls one shoulder, and you see a long, pale scar run from his collarbone down his arm.",
      lines = { { id = "xxhard_d", text = "Hard enough, mon. Naga in de night, centaur in de day and once a big Burning Blade warlock from de south. I be tired, but I be alive, and dat be enough for a guard." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtroll = {
      lines = { { id = "xxtroll_d", text = "De village be good, mon, the fish be fat and de huts be dry. But de loa say somethin' be stirrin' in de deep water, and I listen to de loa." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    naga = { { id = "tp_xnaga", text = "Dey come from de sea at night. Watch de water." } },
    kolkar = { { id = "tp_xkolkar", text = "De Kolkar fight de other centaur more than us, mon." } },
   
    _none = { { id = "tp_none", text = "I watch de water, mon, not de gossip. Ask somebody with more time." } },
  },
}
