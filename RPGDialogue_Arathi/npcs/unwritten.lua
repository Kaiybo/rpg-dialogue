-- Arathi folk without a conversation yet: Refuge Pointe's commander and defenders, Smokywood Pastures'
-- two food carts, Hammerfall's gate guards and the Winterhoof leatherworker on the hill by Boulder'gor.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Commander Amaren: Stromic commander at Refuge Pointe.
P:NPC {
  key = "ar_commander_amaren", id = TODO_NPC("Commander Amaren"), name = "Commander Amaren", gender = "female",
  bible = "bibles/missed.md", role = "commander", tier = "quest",
  communities = { "refuge_pointe" }, temper = { "stern", "weary" }, values = { "duty", "loyal" },
  impression = {
    first = "Commander Amaren keeps her maps pinned under stones on a table at Refuge Pointe, and she reads them as if the wind might carry the highlands away. She is a soldier of the Stromic army who has held this hill longer than she expected to.",
    third = "{name} met Commander Amaren, who commands soldiers at Refuge Pointe in the Arathi Highlands.",
  },
  greetings = {
    { id = "g_default", text = "Speak plainly, {class}. I've no time for anything else." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good, I've work if you've a sword." },
    { id = "g_qactive", when = { questActive = TODO_QUEST("Quae and Kinelory") }, text = "Quae's camp is south of here, beyond the stream. Find her, and find out what Kinelory has gotten herself into." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("Quae and Kinelory") }, tags = { "news" }, text = "So Kinelory's still alive, and still meddling. Good work, though I'll want a full report from Quae herself." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Commander Amaren, of the Stromic army. Refuge Pointe is the last hill in Arathi that still flies Stromgarde's banner without question, and I mean to keep it that way." } },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Go on, but be quick about it." } },
      choices = {
        { text = "Who are Quae and Kinelory?", next = "quae" },
        { text = "Who threatens Refuge Pointe?", next = "threats" },
        { text = "You look like you haven't slept.", next = "sleep" },
        { text = "Stromgarde's people deserve better than this.", next = "stromgarde", when = { race = "Human" } },
        { text = "Farewell.", next = "END" },
      },
    },
    quae = {
      lines = { { id = "quae_default", text = "Two of my scouts, a woman named Quae and her partner Kinelory, sent to watch the Forsaken at Go'Shek Farm. Quae's camped outside the walls, and Kinelory went deeper than she should have." } },
      choices = {
        { text = "What are the Forsaken doing at Go'Shek?", next = "goshek" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    goshek = {
      lines = { { id = "goshek_default", text = "Brewing something in that farmhouse, under an apothecary named Jorell. Whatever it is, the Dark Lady wants it badly enough to guard it with her best." } },
      choices = {
        { text = "Plague, then?", next = "plague" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    plague = {
      lines = { { id = "plague_default", text = "I'd wager my commission on it, and I'd rather not wait to find out. If the Forsaken are making a new plague in Arathi, it'll be our farms they test it on first." } },
      choices = {
        { text = "We should burn that farm to the ground.", next = "BACK", reply = "Tempting, but I'd rather know what's in it first.", fx = { align = { order = -1 } } },
        { text = "We need proof before we act.", next = "BACK", reply = "Aye, and that's what Quae and Kinelory are for.", fx = { align = { order = 1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    threats = {
      lines = { { id = "threats_default", text = "Everyone, it seems, the Syndicate to the north, the Boulderfist ogres in the hills, the Witherbark trolls to the east and the Horde at Hammerfall. I've lost count of the patrols that didn't come back." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sleep = {
      lines = { { id = "sleep_default", text = "I haven't, much, since the last raid on the stables. A commander sleeps when the hill is safe, and the hill hasn't been safe in a long while." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    stromgarde = {
      lines = { { id = "stromgarde_default", text = "They do, and I mean to see them get it. Prince Galen's at the keep, and as long as he holds, so do we." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Not my concern, {class}. Ask Captain Nials if it's about supplies." } },
  },
}

-- Kosco Copperpinch: goblin food and drink vendor at Hammerfall.
P:NPC {
  key = "ar_kosco_copperpinch", id = TODO_NPC("Kosco Copperpinch"), name = "Kosco Copperpinch", title = "Smokywood Pastures", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "hammerfall" }, temper = { "pushy", "cheerful" }, values = { "trade", "practical" },
  impression = {
    first = "Kosco Copperpinch runs a food and drink cart at Hammerfall, wedged between the orcs' tents with a hand-painted Smokywood Pastures sign. He prices everything twice, once for orcs and once for anyone who argues.",
    third = "{name} met Kosco Copperpinch of Smokywood Pastures, selling food and drink at Hammerfall.",
  },
  greetings = {
    { id = "g_default", text = "Hungry, friend? I got bread, I got cheese, I got prices that'll make ya weep with joy." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, pal? The orcs eat like wolves, so get it while it's here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Kosco Copperpinch, Smokywood Pastures, Hammerfall branch, which is a very small branch with very big customers. Orcs eat more than any race I've ever sold to, which is great for business and terrible for my inventory." } },
      again = { { id = "h_again", text = "What else, buddy?" }, { id = "h_again2", text = "Go on, the meter's not runnin'." } },
      choices = {
        { text = "Why sell in Hammerfall?", next = "why" },
        { text = "What's Smokywood Pastures doing here?", next = "company" },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = { { id = "why_default", text = "Because nobody else would, pal, which means no competition and a captive market. The supply wagons come up from the Barrens once a week, if the Stromgarde patrols don't get 'em first." } },
      choices = {
        { text = "Do the patrols often get them?", next = "patrols" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    patrols = {
      lines = { { id = "patrols_default", text = "Often enough that I've started billin' the shipping as hazard pay. One cart in five gets raided, and I've got a cousin in Booty Bay who insures the other four, at a very reasonable rate." } },
      choices = {
        { text = "Trade should go wherever there are buyers.", next = "BACK", reply = "Now you're talkin' my language, pal!", fx = { align = { order = -1 } } },
        { text = "Selling to both sides in a war is shameful.", next = "BACK", reply = "Shameful? Pal, it's called diversification.", fx = { align = { order = 1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    company = {
      lines = { { id = "company_default", text = "Selling food, friend, same as everywhere, and we do Winter Veil too, but that's another branch entirely. We sell to anybody, Horde or Alliance, and Hammerfall's my little corner of the empire." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Never heard of it, but if you find it, I'll sell it." } },
  },
}

-- Targot Jinglepocket: goblin food and drink vendor at Refuge Pointe.
P:NPC {
  key = "ar_targot_jinglepocket", id = TODO_NPC("Targot Jinglepocket"), name = "Targot Jinglepocket", title = "Smokywood Pastures", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "refuge_pointe" }, temper = { "harried", "cheerful" }, values = { "trade", "family" },
  impression = {
    first = "Targot Jinglepocket sells food and drink at Refuge Pointe from a stall that has clearly been rebuilt more than once. He is a goblin from Smokywood Pastures with the jumpy look of someone who has been raided by ogres.",
    third = "{name} met Targot Jinglepocket of Smokywood Pastures, selling food and drink at Refuge Pointe.",
  },
  greetings = {
    { id = "g_default", text = "Food, drink, and a roof, mostly! What'll it be, friend?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, pal? Good, I need the custom after the last raid." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Targot Jinglepocket, Smokywood Pastures, Refuge Pointe branch, which has been burned down twice this year. The soldiers here pay on time, though, which is more than I can say for the ogres." } },
      again = { { id = "h_again", text = "What else, friend?" }, { id = "h_again2", text = "Talk fast, I gotta restock before the next raid." } },
      choices = {
        { text = "Are you related to Wulmort Jinglepocket?", next = "wulmort" },
        { text = "You've been burned down twice?", next = "burned" },
        { text = "Farewell.", next = "END" },
      },
    },
    wulmort = {
      lines = { { id = "wulmort_default", text = "Cousin, on my mother's side, and he got the cushy Ironforge job while I got Arathi. Family's family, but I'll tell ya, I'd trade places with him in a heartbeat." } },
      choices = {
        { text = "Why not ask for a transfer?", next = "transfer" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    transfer = {
      lines = { { id = "transfer_default", text = "Asked three times, and three times the company said the Refuge Pointe branch is 'strategically valuable.' That's goblin for 'nobody else would take it,' so here I stay." } },
      choices = {
        { text = "Loyalty to the company will pay off.", next = "BACK", reply = "That's what they keep tellin' me, pal.", fx = { align = { order = 1 } } },
        { text = "You should quit and set up on your own.", next = "BACK", reply = "Ha! Don't think I haven't thought about it.", fx = { align = { order = -1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    burned = {
      lines = { { id = "burned_default", text = "Once by ogres, once by a Syndicate thug who didn't like my prices. I rebuilt both times, because a goblin who quits is a goblin with no income." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Never heard of it, friend, and I hear about everything." } },
  },
}

-- Hammerfall Guardian: orc guards of Hammerfall.
P:NPC {
  key = "ar_hammerfall_guardian", id = TODO_NPC("Hammerfall Guardian"), name = "Hammerfall Guardian", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "hammerfall" }, temper = { "blunt", "watchful" }, values = { "honor", "duty" },
  impression = {
    first = "A Hammerfall Guardian stands at the gate of the orcish outpost with an axe across his chest. He watches the hills for Stromgarde riders and Witherbark trolls alike.",
    third = "{name} spoke with one of the Hammerfall Guardians who hold the gates of the Horde's outpost in Arathi.",
  },
  greetings = {
    { id = "g_default", text = "State your business, {class}." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The gate still stands." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I guard Hammerfall, where Orgrim Doomhammer once held the human prisons and the orcs broke free. We hold this place now, and no human will take it from us again." } },
      again = { { id = "h_again", text = "Speak." }, { id = "h_again2", text = "What else?" } },
      choices = {
        { text = "What happened here?", next = "history" },
        { text = "Who threatens Hammerfall?", next = "threats" },
        { text = "Farewell.", next = "END" },
      },
    },
    history = {
      lines = { { id = "history_default", text = "This was an internment camp once, where humans held orcs after the Second War. Thrall freed us, and we took it back, and we named it Hammerfall to remember Doomhammer." } },
      choices = {
        { text = "Do you remember the camps?", next = "camps" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    camps = {
      lines = { { id = "camps_default", text = "I was born in one, and I remember the bars and the lethargy that ate our spirit. Thrall woke us from that sleep, and I will die before I go back." } },
      choices = {
        { text = "No one should be caged like that.", next = "BACK", reply = "You speak with honor.", fx = { align = { honor = 1 } } },
        { text = "The humans had reason to fear you.", next = "BACK", reply = "Perhaps, but they had no right to cage us.", fx = { align = { honor = -1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    threats = {
      lines = { { id = "threats_default", text = "The Stromgarde soldiers at Refuge Pointe, the Witherbark in the east, the ogres in the hills. We hold, because we are the Horde, and the Horde does not break." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know nothing of that. Ask Drum Fel, if you must." } },
  },
}

-- Refuge Pointe Defender: Stromic guards at Refuge Pointe.
P:NPC {
  key = "ar_refuge_pointe_defender", id = TODO_NPC("Refuge Pointe Defender"), name = "Refuge Pointe Defender", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "refuge_pointe" }, temper = { "weary", "steady" }, values = { "duty", "loyal" },
  impression = {
    first = "A Refuge Pointe Defender stands at the edge of the hill with a shield on one arm and a tired look in his eyes. He wears Stromgarde's colours, faded from too many highland winters.",
    third = "{name} spoke with one of the Refuge Pointe Defenders who guard Stromgarde's last outpost in Arathi.",
  },
  greetings = {
    { id = "g_default", text = "Hail, {class}. Watch yourself on the roads." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good to see a friendly face." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I guard Refuge Pointe for Stromgarde, and for the people who still call this land home. There aren't many of us left, but we hold the hill." } },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Ask away, friend." } },
      choices = {
        { text = "Who attacks Refuge Pointe?", next = "threats" },
        { text = "Is Stromgarde lost?", next = "stromgarde" },
        { text = "Farewell.", next = "END" },
      },
    },
    threats = {
      lines = { { id = "threats_default", text = "Ogres from the hills, Syndicate bandits from the north, and the orcs at Hammerfall to the east. Some days they come one after another, and some days they come all at once." } },
      choices = {
        { text = "How many have you lost?", next = "losses" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    losses = {
      lines = { { id = "losses_default", text = "Too many to count, and some of them friends I grew up with. We bury them on the north slope, facing Stromgarde, so they can see home." } },
      choices = {
        { text = "Their sacrifice won't be forgotten.", next = "BACK", reply = "Thank you, friend. That means something.", fx = { align = { honor = 1 } } },
        { text = "They died for a lost cause.", next = "BACK", reply = "Perhaps, but it's our cause, lost or not.", fx = { align = { honor = -1 } } },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    stromgarde = {
      lines = { { id = "stromgarde_default", text = "Not lost, not yet, though most of the city's in Syndicate hands. Prince Galen holds the keep, and while he holds, we hold." } },
      choices = {
        { text = "One more thing, then.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know about that, friend. Ask the Commander." } },
  },
}

-- Brumn Winterhoof: Winterhoof tauren elemental leatherworking trainer near Boulder'gor.
P:NPC {
  key = "ar_brumn_winterhoof", id = TODO_NPC("Brumn Winterhoof"), name = "Brumn Winterhoof", title = "Leatherworking Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "quest",
  communities = { "hammerfall" }, temper = { "calm", "gentle" }, values = { "nature", "craft" },
  impression = {
    first = "Brumn Winterhoof camps on a hill west of Boulder'gor, far from the orcs at Hammerfall, with hides drying on racks around him. He is a tauren of the Winterhoof tribe, and he works leather as though he were listening to it.",
    third = "{name} met Brumn Winterhoof, a tauren who teaches elemental leatherworking in the Arathi Highlands.",
  },
  greetings = {
    { id = "g_default", text = "Walk gently, friend. The hides are drying, and so am I." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The Earth Mother smiles on you." },
    { id = "g_qactive", when = { questActive = TODO_QUEST("Elemental Leatherworking") }, text = "Bring me the elements' gifts, and I will teach you to bind them into leather." },
    { id = "g_qdone", when = { questDone = TODO_QUEST("Elemental Leatherworking") }, tags = { "news" }, text = "You have learned the elements' ways in leather. Use them wisely, and they will serve you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Brumn Winterhoof, of the Winterhoof tribe. I teach leatherworkers to bind the elements, fire and earth and wind and water, into the hides they shape." } },
      again = { { id = "h_again", text = "What else, friend?" }, { id = "h_again2", text = "Speak, I am listening." } },
      choices = {
        { text = "What is elemental leatherworking?", next = "elemental" },
        { text = "Why camp so far from Hammerfall?", next = "camp" },
        { text = "The ogres of Boulder'gor are close.", next = "ogres" },
        { text = "I'm a leatherworker. Can you teach me?", next = "teach", when = { profession = "Leatherworking" } },
        { text = "Farewell.", next = "END" },
      },
    },
    elemental = {
      lines = { { id = "elemental_default", text = "It is the art of binding the spirits of the elements into leather, so that the armour sings with their strength. Fire makes it fierce, earth makes it steady, and the wind makes it swift." } },
      choices = {
        { text = "Is it dangerous?", next = "danger" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    danger = {
      lines = { { id = "danger_default", text = "Only to the impatient, for the elements do not like to be rushed. I have seen hides burst into flame because their maker did not listen." } },
      choices = {
        { text = "How does one listen to leather?", next = "listen" },
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
    listen = {
      lines = { { id = "listen_default", text = "With your hands, and with your heart, the way a hunter listens to the grass. The hide was once a living thing, and it remembers, if you are gentle." } },
      choices = {
        { text = "Every craft should honor the living.", next = "BACK", reply = "You understand, friend. The Earth Mother walks with you.", fx = { align = { light = 1 } } },
        { text = "A hide is just a hide.", next = "BACK", reply = "Then you will never master this art.", fx = { align = { light = -1 } } },
        { text = "One more thing, then.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "camp_default", text = "The orcs are loud, and the elements prefer quiet. Here on the hill, I can hear the wind and the earth, and they teach me more than any orc could." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ogres = {
      lines = { { id = "ogres_default", text = "They are, and they are not quiet neighbours. But they leave me alone, mostly, for they fear the spirits I call." } },
      choices = {
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    teach = {
      lines = { { id = "teach_default", text = "If you are patient, and if your hands are steady. Bring me the elements' gifts, and we shall see what you can learn." } },
      choices = {
        { text = "Back to what we were saying.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I do not know that, friend. The winds have not whispered it to me." } },
  },
}

