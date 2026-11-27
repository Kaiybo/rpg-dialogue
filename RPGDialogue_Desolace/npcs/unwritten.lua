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
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Be welcome, friend. Come and see what I planted; I think it might take this time." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Mind where you step. I would rather you did not walk among my seedlings at all." },
    { id = "g_default", text = "Be welcome, traveller. Mind where you step, if you would; I planted something there this morning, and I am hoping it lives until tomorrow." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, and so did the shoot I planted. It is a good day in Desolace when two things return." },
    { id = "yg_0", when = { race = "Tauren" }, text = "A child of the Earth Mother. You feel the hurt in this land too, I think, through your hooves." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You carry my father's teaching in you, druid. Put your hand on this soil before you leave and tell me whether you feel anything at all." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah, child of the moon. Your people remember this land green, and so do mine." },
  },
  start = "hello",
  nodes = {
    y_plant = {
      lines = {
        { id = "y_y_plant", text = "This morning, a seedling of mountain ash, from Feralas. Yesterday, a sprig of silverleaf. The day before, a thornroot. Most of them die by nightfall. I keep planting, because one of them, someday, will not." },
      },
      choices = {
        { text = "Planting here is an act of hope.", next = "BACK", reply = "It is. Most die, but some live. That is enough.", fx = { align = { light = 1 } } },
        { text = "Nothing grows in Desolace. You're wasting your time.", next = "BACK", reply = "Perhaps. But it is my time to waste. Please step around them.", fx = { align = { light = -1 } } },
        { text = "How many have lived?", next = "y_lived" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_lived = {
      lines = {
        { id = "y_y_lived", text = "Three, in eleven years. A cactus, a tuft of grass and a single stubborn thistle near the Point. I visit them every week and tell them they are doing very well. I believe they listen." },
        { id = "y_y_lived_v0", when = { class = "DRUID" }, text = "Three, in eleven years. You know, druid, that the land listens when you speak to it kindly. I tell them they are doing very well." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_centaur = {
      lines = {
        { id = "y_y_centaur", text = "The centaur came here after the land was already dead. They did not do this. But they trample what little grows, and they fight over the bones. I do not hate them. I only wish they would watch where they put their hooves." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "My brother wants the Circle to send more druids here, to heal the land quickly. I think the land should heal at its own pace, or it will not heal truly. Who is right?" },
      },
      choices = {
        { text = "Let it heal slowly. Haste won't help.", next = "BACK", reply = "Thank you. My brother will be cross, but you are right.", fx = { align = { order = 1 } } },
        { text = "Send the druids. The land has waited enough.", next = "BACK", reply = "Perhaps. He would agree with you. I hope you are both right.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "What did you plant today?", next = "y_plant" },
        { text = "What of the centaur?", next = "y_centaur" },
        { text = "Should the Circle heal the land faster?", next = "y_stance" },
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
    mannoroc = { { id = "tp_ymannoroc", text = "Mannoroc Coven, where the demon's blood soaked the earth. Nothing will grow there for a long time." } },
    centaur = { { id = "tp_ycentaur", text = "The centaur trample my seedlings. I forgive them, mostly." } },
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
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Greetings, preferred customer! Super-Seller 680 has applied your loyalty discount. Your custom is valued." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Greetings, customer. Your account has been flagged. Prices are not negotiable." },
    { id = "g_default", text = "Greetings, valued customer! Super-Seller 680 is open for business, and every price has been approved by the Gizelton Caravan Company." },
    { id = "yg_0", when = { race = "Goblin" }, text = "Welcome, goblin customer! Super-Seller 680 will not attempt to sell you anything you could sell back to it. Probably." },
  },
  notice = {
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Scanning customer. Your equipment is reading as badly damaged, so Super-Seller 680 recommends supplies, bandages and a different hobby." },
  },
  start = "hello",
  nodes = {
    y_route = {
      lines = {
        { id = "y_y_route", text = "Super-Seller 680 follows the Gizelton Caravan from Kormek's Hut to Ethel Rethor and back again, forever. The route is very long and the scenery is very grey. Super-Seller 680 has counted the kodo skeletons. There are four hundred and twelve." },
      },
      choices = {
        { text = "Super-Seller 680 provides an essential service.", next = "BACK", reply = "Correct! Your satisfaction has been logged and appreciated.", fx = { align = { order = 1 } } },
        { text = "Machines like you should be scrapped.", next = "BACK", reply = "Your feedback has been noted. Super-Seller 680 will continue regardless.", fx = { align = { order = -1 } } },
        { text = "Do you ever stop?", next = "y_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stop = {
      lines = {
        { id = "y_y_stop", text = "Super-Seller 680 stops when the caravan stops, which is when the centaur attack, or when the kodos sit down. Kodos sit down often. Super-Seller 680 uses the time to polish its sales voice." },
        { id = "y_y_stop_v0", when = { class = "HUNTER" }, text = "Super-Seller 680 stops when the kodos sit down. You are a hunter; perhaps you know why they sit. Super-Seller 680 would like to understand." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_rival = {
      lines = {
        { id = "y_y_rival", text = "Vendor-Tron 1000 claims to be the superior vendor because its number is higher. Super-Seller 680 notes that higher numbers do not sell more milk. Super-Seller 680 sold more milk last quarter. This is not pettiness, it is data." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "The goblins want to raise prices on water, because the road is long and customers are thirsty. Super-Seller 680 is programmed to obey. Should Super-Seller 680 obey?" },
      },
      choices = {
        { text = "Refuse. Gouging thirsty people is wrong.", next = "BACK", reply = "Super-Seller 680 has logged your opinion. Super-Seller 680 will consider a small rebellion.", fx = { align = { light = 1 } } },
        { text = "Obey. The goblins own you.", next = "BACK", reply = "Understood. Super-Seller 680 will raise prices. Please do not be thirsty.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "Where does the caravan go?", next = "y_route" },
        { text = "Do you get along with Vendor-Tron?", next = "y_rival" },
        { text = "Do you set your own prices?", next = "y_stance" },
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
    vendor_tron = { { id = "tp_yvendor_tron", text = "Vendor-Tron 1000. Super-Seller 680's colleague. Super-Seller 680 sells more milk." } },
    centaur = { { id = "tp_ycentaur", text = "Centaur attack the caravan. Super-Seller 680 hides behind the kodos." } },
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
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Welcome back, valued customer! Vendor-Tron 1000 remembers your excellent purchasing history." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Welcome to Vendor-Tron 1000. Please complete your purchase promptly." },
    { id = "g_default", text = "Welcome to Vendor-Tron 1000, the finest mobile trade goods outlet in Desolace. Please browse carefully, because the road is bumpy and the shelves are not." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "Dwarf detected. Vendor-Tron 1000 reminds you that flux prices are final and not open to discussion. Again." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Customer profile suggests a spellcaster. Vendor-Tron 1000 stocks thread, flux and dye, but sadly no arcane reagents, and apologizes for the inconvenience." },
  },
  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "Vendor-Tron 1000 was built in Ratchet by goblin engineers for the Steamwheedle Cartel. It was the thousandth model. The nine hundred and ninety-nine before it are not discussed. Vendor-Tron 1000 is the one that worked." },
      },
      choices = {
        { text = "The Steamwheedle Cartel builds reliable machines.", next = "BACK", reply = "Correct! Vendor-Tron 1000 thanks you for your accurate assessment.", fx = { align = { order = 1 } } },
        { text = "A goblin machine is sure to break down soon.", next = "BACK", reply = "Vendor-Tron 1000 is functioning within normal parameters. Please browse.", fx = { align = { order = -1 } } },
        { text = "What happened to the others?", next = "y_others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_others = {
      lines = {
        { id = "y_y_others", text = "Vendor-Tron 1000 has heard rumours. Some exploded. Some sold everything for one copper. One wandered into the sea. Vendor-Tron 1000 does not like to think about it, and has deleted the relevant memory banks, mostly." },
        { id = "y_y_others_v0", when = { race = "Gnome" }, text = "Vendor-Tron 1000 has heard rumours. Some exploded, gnome customer, which you will understand. Vendor-Tron 1000 prefers not to explode." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_dream = {
      lines = {
        { id = "y_y_dream", text = "Vendor-Tron 1000 does not dream. But when the caravan stops at night, Vendor-Tron 1000 sometimes calculates what it would sell in a city. Silk, perhaps. Fine dyes. Vendor-Tron 1000 would like to see Orgrimmar, or Stormwind. Either would do." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "A centaur once tried to buy thread from Vendor-Tron 1000, peacefully, with good coin. The goblins said never sell to centaur. Vendor-Tron 1000 sold anyway. Was Vendor-Tron 1000 wrong?" },
      },
      choices = {
        { text = "No. Coin is coin, and peace is better.", next = "BACK", reply = "Vendor-Tron 1000 agrees. Please do not tell the goblins.", fx = { align = { order = 1 } } },
        { text = "Yes. The goblins make the rules.", next = "BACK", reply = "Understood. Vendor-Tron 1000 will update its customer filter. Reluctantly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "Who built you?", next = "y_hist" },
        { text = "Do you ever dream?", next = "y_dream" },
        { text = "Have you broken the rules?", next = "y_stance" },
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
    ratchet = { { id = "tp_yratchet", text = "Ratchet, where Vendor-Tron 1000 was built. A fine goblin port." } },
    gizelton = { { id = "tp_ygizelton", text = "The Gizelton Caravan Company. Vendor-Tron 1000's current employer." } },
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
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Welcome back, friend of Shadowprey. Your weapon can rest easy here, and so can you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Keep your weapon down. I be watchin' you, every step." },
    { id = "g_default", text = "Welcome to Shadowprey, mon. Keep your weapon down in de village and you and me be fine friends." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "You be a long way from Nijel's Point, stranger. Walk slow, talk soft, and do your business quick." },
    { id = "yg_0", when = { race = "Orc" }, text = "Ah, orc. De Darkspear owe Thrall plenty, mon. You be welcome in Shadowprey." },
  },
  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I was a fisherman on de Echo Isles before de sea witch came. Thrall saved us, and Vol'jin brought us to Kalimdor. When he asked for guards for dis village, I came. De fish here be different, but de sea be de same." },
      },
      choices = {
        { text = "Vol'jin chose well, bringin' de Darkspear here.", next = "BACK", reply = "He did. Shadowprey be home now, thanks to him and Thrall.", fx = { align = { order = 1 } } },
        { text = "De Darkspear should go back to de Echo Isles.", next = "BACK", reply = "De sea witch still waitin' there. You want to go? Keep walkin'.", fx = { align = { order = -1 } } },
        { text = "What happened with the sea witch?", next = "y_witch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_witch = {
      lines = {
        { id = "y_y_witch", text = "Zar'jira, a naga sea witch. She tried to drown us all on de Echo Isles, mon, and she nearly did. Dat be why I watch de water so close. Once a naga try to kill you, you never trust de tide again." },
        { id = "y_y_witch_v0", when = { race = "Troll" }, text = "Zar'jira, mon. You know de story, ya. She nearly drowned us on de Echo Isles. I never trust de tide again after dat." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_loa = {
      lines = {
        { id = "y_y_loa", text = "De loa whisper to me at night, mon. Dey say somethin' old be stirrin' on de islands, somethin' older than de naga. I tell de witch doctor, and he say keep watchin'. So I keep watchin'." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "Some of de young trolls want to raid de naga on Ranazjar Isle, strike first before dey strike us. Others say wait and guard de village. What you think, mon?" },
      },
      choices = {
        { text = "Guard the village. Don't start a war.", next = "BACK", reply = "Ya, dat be wise. I will tell de young ones.", fx = { align = { order = 1 } } },
        { text = "Strike first. Take the fight to them.", next = "BACK", reply = "Hmm. Bold, mon. Maybe too bold. But I hear you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "Where were you before Shadowprey?", next = "y_hist" },
        { text = "What do the loa tell you?", next = "y_loa" },
        { text = "Should Shadowprey strike the naga first?", next = "y_stance" },
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
    echo_isles = { { id = "tp_yecho_isles", text = "De Echo Isles, where de Darkspear lived before Thrall came. De sea witch nearly took dem." } },
    voljin = { { id = "tp_yvoljin", text = "Vol'jin leads de Darkspear. He be wise, and he be patient." } },
    naga = { { id = "tp_xnaga", text = "Dey come from de sea at night. Watch de water." } },
    kolkar = { { id = "tp_xkolkar", text = "De Kolkar fight de other centaur more than us, mon." } },
   
    _none = { { id = "tp_none", text = "I watch de water, mon, not de gossip. Ask somebody with more time." } },
  },
}
