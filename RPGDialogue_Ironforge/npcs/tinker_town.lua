-- Tinker Town: the gnome refugees who are still trying to get home.
-- Voices: bibles/tinker_town.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Tinkmaster Overspark: gnomish engineering's master; Techbot gone rogue; the Pledge of Secrecy.
P:NPC {
  key = "overspark", id = TODO_NPC("Tinkmaster Overspark"), name = "Tinkmaster Overspark", title = "Gnome Engineering Trainer",
  bible = "bibles/tinker_town.md", role = "trainer", tier = "quest",
  communities = { "ironforge" }, temper = { "proud" }, values = { "inventive", "proud" },
  notices = { "craft" },

  impression = {
    first = "Tinkmaster Overspark apologizes for his melodrama and then carries straight on with it. He mourns a broken robot called Techbot as if it were a friend, and perhaps it was.",
    third = "{name} met Tinkmaster Overspark, the master of gnome engineering, who works in Tinker Town while Gnomeregan lies poisoned.",
  },

  greetings = {
    { id = "g_stand", text = "Yes, yes, how may I help? I've nothing but time, standing about in Tinker Town while our dear city sits under its green poison cloud." },
    { id = "g_eng", when = { profession = "Engineering" }, text = "An engineer! Seeing a fellow engineer brightens even a terrible day, and they're all terrible lately." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { name = "Engineering", min = 200 } },
      text = "You've the burn marks of a serious engineer, and the eyebrows of one who's learned from them. Have you chosen a discipline yet? Choose wisely; choose gnomish." },
    { id = "n_priest", cat = "craft", when = { class = "PRIEST" },
      text = "A priest! Brother Sarno in your Cathedral was very kind about Techbot when I wrote to him. Do thank him for me, if you're passing." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tinkmaster Overspark, master of gnomish engineering, the one true discipline. Forgive my melodrama, but our situation is dire, and dire situations deserve a bit of drama." },
        { id = "h_techbot", tags = { "news" }, when = { questActive = TODO_QUEST("Tinkmaster Overspark") },
          text = "It's true, then, Sarno told you. Techbot has gone rogue, my Techbot, who used to help everyone, and now he's down in Gnomeregan doing who knows what. Will you help me?" },
        { id = "h_brain", tags = { "news" }, when = { questActive = TODO_QUEST("Save Techbot's Brain!") },
          text = "Techbot's still in the city, near the entrance, and the memory core is the part that matters. Bring me his brain, and gently, if you can; I'd like to know what went wrong." },
        { id = "h_brain_done", when = { questDone = TODO_QUEST("Save Techbot's Brain!") },
          text = "I've been reading Techbot's memory core every evening. Most of it is helpfulness, rows and rows of it, and then something went wrong near the end, and I'm still looking for the bad line." },
        { id = "h_gnome_eng", tags = { "news" }, when = { questActive = TODO_QUEST("Gnome Engineering") },
          text = "You've brought the manual! A young engineer answering the call of true engineering, how splendid. Read it all, then sign the pledge, and mean it." },
      },
      again = {
        { id = "h_again", text = "What else? I'm not going anywhere, alas." },
        { id = "h_again2", text = "Ask on, ask on! It takes my mind off things." },
      },
      choices = {
        { text = "Who is Techbot?", next = "techbot" },
        { text = "What makes gnomish engineering the true discipline?", next = "discipline" },
        { text = "What's this pledge of secrecy?", next = "pledge", when = { profession = "Engineering" } },
        { text = "Do you know Oglethorpe Obnoticus?", next = "oglethorpe" },
        { text = "What happened to your city?", next = "city" },
        { text = "I'll leave you to it, Tinkmaster.", next = "END" },
      },
    },

    techbot = {
      lines = {
        { id = "te_default", text = "My mechanical assistant, a kind and helpful thing who fetched tools and greeted visitors and was, frankly, better company than half the Assembly. We left him behind when we fled, and now he's malfunctioned." },
      },
      choices = {
        { text = "What went wrong with him?", next = "techbot_wrong" },
        { text = "It's only a machine, Tinkmaster.", next = "BACK", fx = { affinity = -2 } },
      },
    },
    techbot_wrong = {
      lines = {
        { id = "tw_default", text = "The radiation, I suspect, or the troggs, or being alone too long in a dead city. Machines aren't supposed to mind being alone, but I built him to like people, and perhaps that was the flaw." },
      },
      choices = {
        { text = "Building him to care was no flaw.", next = "techbot_save", fx = { align = { light = 1 }, affinity = 2, trait = { kind = 1 } } },
        { text = "Then the next one shouldn't feel anything.", next = "techbot_save", fx = { align = { light = -1 }, trait = { practical = 1 } } },
      },
    },
    techbot_save = {
      lines = {
        { id = "ts_default", text = "Whatever he is now, his memory core is still in there. If someone brought it back, I could read what happened, and maybe build him better." },
        { id = "ts_done", when = { questDone = TODO_QUEST("Save Techbot's Brain!") },
          text = "And someone did bring it back, thank you. I'll build him again one day, with better shielding and the same manners." },
      },
      choices = {
        { text = "I'll bring it back.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    discipline = {
      lines = {
        { id = "di_default", text = "Gnomish engineering is about wonderful devices that make life better, while goblin engineering is about bigger explosions and getting paid. Membership is permanent, mind, so choose with your head and not your eyebrows." },
      },
      choices = {
        { text = "Making life better is the nobler aim.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "A good explosion solves a lot of problems.", next = "BACK", fx = { align = { order = -1 }, affinity = -1, trait = { witty = 1 } } },
        { text = "Why must the choice be permanent?", next = "pledge" },
      },
    },
    pledge = {
      lines = {
        { id = "pl_default", text = "Because our secrets are all we carried out of Gnomeregan, besides each other. Every gnomish engineer signs a pledge of secrecy, I signed it, and so will you, and we keep it for life." },
      },
      choices = {
        { text = "Knowledge should be shared freely.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A pledge kept is worth more than a secret.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Who would steal your secrets?", next = "pledge_who" },
      },
    },
    pledge_who = {
      lines = {
        { id = "pw_default", text = "Goblins, chiefly, who'll sell anything to anyone, and a few gnomes who've forgotten whose side they're on. We learned the hard way what happens when you trust the wrong engineer." },
      },
      choices = { { text = "Thermaplugg.", next = "BACK", fx = { affinity = 1, learn = { "gnomeregan" } } } },
    },

    oglethorpe = {
      lines = {
        { id = "og_default", text = "Obnoticus! He let the Crowd Pummeler loose, whatever he tells people, and the council banished him for it. I hear he's set up shop among the goblins of Booty Bay, which suits him." },
      },
      choices = {
        { text = "Maybe he was wronged.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    city = {
      lines = {
        { id = "ci_default", text = "Troggs from below, a plan to flush them out, and poison that found our homes instead. Now Gnomeregan glows, and I stand in Tinker Town teaching young engineers to build things they can't take home." },
      },
      choices = {
        { text = "You'll go home one day.", next = "BACK", fx = { affinity = 1, learn = { "gnomeregan", "troggs" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Engineers talk, endlessly and about everything. Here's what's stuck in my head." } },
    background = { { id = "tp_bg", text = "I'm the Tinkmaster, which means I'm in charge of gnomish engineering and the pledge that keeps it ours. Before the fall I had a workshop; now I have a corner." } },
    advice = { { id = "tp_ad", text = "Test it on a dummy first. Ideally a dummy that isn't you.", next = "discipline" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Our city, poisoned and full of troggs, and Techbot still down there somewhere.", next = "techbot" } },
    _none = { { id = "tp_none", text = "That isn't engineering, so I'm afraid I've no opinion. Well, I've an opinion, but it isn't informed." } },
  },
}

-- Master Mechanic Castpipe: organizes data-rescue missions into Gnomeregan (the punch cards).
P:NPC {
  key = "castpipe", id = TODO_NPC("Master Mechanic Castpipe"), name = "Master Mechanic Castpipe",
  bible = "bibles/tinker_town.md", role = "questgiver", tier = "quest",
  communities = { "ironforge" }, temper = { "anxious" }, values = { "practical", "dutiful" },
  notices = { "craft" },

  impression = {
    first = "Master Mechanic Castpipe is organizing expeditions back into Gnomeregan to recover lost data, and talks about punch cards the way other people talk about lost children.",
    third = "{name} met Master Mechanic Castpipe, who organizes missions into Gnomeregan to rescue the city's lost data.",
  },

  greetings = {
    { id = "g_data", text = "Are you here for the data mission? Please be here for the data mission." },
    { id = "g_back", when = { metBefore = true }, text = "Have you any punch cards at all? Even a white one would cheer me up." },
  },

  notice = {
    { id = "n_gnome", cat = "craft", when = { race = "Gnome", origin = "gnome_tinker_apprentice" },
      text = "You were an apprentice in the city, weren't you? Then you know what's on those terminals, and you know we can't leave it there." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! You'll understand the terminals, then, or at least you won't hit them, which is more than I can say for the last group." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Castpipe, Master Mechanic. I'm sending teams back into Gnomeregan to recover our lost data, and if you've come to join one, listen closely, because the procedure is complicated." },
        { id = "h_task", tags = { "news" }, when = { questActive = TODO_QUEST("Castpipe's Task") },
          text = "You came! The Assembly told you it was important, I suppose, and for once they've undersold it. Let me explain about the punch cards." },
        { id = "h_rescue", tags = { "news" }, when = { questActive = TODO_QUEST("Data Rescue") },
          text = "Not back with the prismatic card yet? Then remember: white card, terminal A; yellow card, terminal B; then blue, then red, and the prismatic's deep in the city on the D." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Data Rescue") },
          text = "You found the prismatic card and brought back the data, data so important I haven't a big enough word for it! Gnomeregan will remember you, and so will I, every time I open the archive." },
        { id = "h_low", when = { maxLevel = 24 },
          text = "You're keen, I can see that, but Gnomeregan would eat you whole just now. Come back when you've a few more scars, and some friends who have more." },
      },
      again = {
        { id = "h_again", text = "Questions? Ask them now, before you're in the city; there's no asking down there." },
        { id = "h_again2", text = "What else? Quickly, quickly." },
      },
      choices = {
        { text = "What data was left behind?", next = "data" },
        { text = "Explain the punch cards.", next = "cards" },
        { text = "What's it like down there now?", next = "down" },
        { text = "Is data worth risking lives for?", next = "worth" },
        { text = "I worked those terminals once.", next = "apprentice", when = { origin = "gnome_tinker_apprentice" } },
        { text = "I'll be back.", next = "END" },
      },
    },

    data = {
      lines = {
        { id = "da_default", text = "Everything! Designs, records, census rolls, schematics for half the machines in Khaz Modan. When we fled, nobody stopped to save the archives, because nobody stopped for anything." },
      },
      choices = {
        { text = "Why does it matter so much?", next = "data_why" },
        { text = "You saved yourselves first. That was right.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    data_why = {
      lines = {
        { id = "dw_default", text = "Because a people is what it knows, and we've lost so much of ourselves already. If we go home one day, I'd like us to go home knowing how the doors work." },
      },
      choices = {
        { text = "Then it's worth the risk.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Knowledge can be rebuilt; people can't.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    cards = {
      lines = {
        { id = "ca_default", text = "The prismatic card sits in a high-security terminal, the Matrix Punchograph 3005-D, deep in the city. To reach it you need clearance from the A, B and C terminals, and to use those you need cards, and we left every card in the city." },
      },
      choices = {
        { text = "So where do I begin?", next = "cards_begin" },
        { text = "Whoever designed that should be fired.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },
    cards_begin = {
      lines = {
        { id = "cb_default", text = "Find a white card on one of the poor souls near the entrance and run it through the A terminal by the Train Depot. It'll give you yellow, and yellow gets you blue, and so on; it's very logical, once you stop crying." },
      },
      choices = {
        { text = "Very logical indeed.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    down = {
      lines = {
        { id = "do_default", text = "Troggs, leper gnomes, machines gone wrong, and the air hums. Some of the leper gnomes were our neighbors, so be quick, and be kind if you can, and if you can't, be quick." },
      },
      choices = {
        { text = "They're not our neighbors any more.", next = "BACK", fx = { align = { light = -1 }, learn = { "gnomeregan", "troggs" } } },
        { text = "I'll show them mercy where I can.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 }, learn = { "gnomeregan", "troggs" } } },
      },
    },

    worth = {
      lines = {
        { id = "wo_default", text = "I ask myself that every time a group goes in. Then I remember that Thermaplugg sits on those archives, and I'd rather they were ours than his." },
      },
      choices = {
        { text = "Then let's take them from him.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    apprentice = {
      lines = {
        { id = "ap_default", text = "Did you! Then you'll know the B terminal sticks if you feed it crooked, and you'll know which corridors the troggs like. You're worth three of anyone else down there." },
      },
      choices = { { text = "I'll go down with the next group.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I've catalogued what's lost, which means I know a great deal about what we haven't got. Here's what I can tell you." } },
    background = { { id = "tp_bg", text = "Master Mechanic, formerly of a very large workshop in Gnomeregan and now of this very small one. I keep lists, mostly." } },
    advice = { { id = "tp_ad", text = "Keep a copy of everything, and keep it somewhere else.", next = "data" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Our city, and our archives, and I want them both back, in that order or the other.", next = "down" } },
    _none = { { id = "tp_none", text = "No data on that, I'm afraid. Possibly it's on a punch card somewhere in Gnomeregan." } },
  },
}

-- Klockmort Spannerspan: gnomish blacksmith; Furen's notes, searing coral, essential artificials.
P:NPC {
  key = "klockmort", id = TODO_NPC("Klockmort Spannerspan"), name = "Klockmort Spannerspan",
  bible = "bibles/tinker_town.md", role = "blacksmith", tier = "quest",
  communities = { "ironforge" }, temper = { "eager" }, values = { "inventive", "curious" },
  notices = { "craft", "kit" },

  impression = {
    first = "Klockmort Spannerspan is on a quest for new alloys and harder metals for the greatest invention of all. He would not tell me what the invention is, and I suspect he doesn't know yet.",
    third = "{name} met Klockmort Spannerspan, a gnomish blacksmith in Tinker Town forever chasing harder metals.",
  },

  greetings = {
    { id = "g_day", text = "Hello, whatever time of day it is up there; it's always the same down here. Have you brought me business?" },
    { id = "g_quest", text = "I'm on a quest! A quest for new alloys and harder metals for the greatest invention of all!" },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Oh, your poor armor, the poor thing! Who did that to it, and was it a new technique? Tell me it was a new technique." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! What are you working on, what temperature, what quench? Sorry, sorry, I get excited about quenching." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Klockmort Spannerspan, smith and seeker! I'm on a quest for new alloys and harder metals for the greatest invention of all, and every bit of metal you bring me gets me a little closer." },
        { id = "h_notes", tags = { "news" }, when = { questActive = TODO_QUEST("Klockmort Spannerspan") },
          text = "Notes? From Furen Longbeard? Oh my, give them here; these are marvelous, these are astounding, my knees have gone quite weak!" },
        { id = "h_coral", tags = { "news" }, when = { questActive = TODO_QUEST("Iron Coral") },
          text = "Have you found the searing coral? It only grows in the shallows below Menethil Harbor, and I'm so eager to start that my toes are twisting." },
        { id = "h_gauntlets", tags = { "news" }, when = { questDone = TODO_QUEST("Klockmort's Creation") },
          text = "How are the gauntlets? Furen's process worked brilliantly; a siege engine could roll over them and they'd pop back into shape. Please don't test that." },
        { id = "h_artificials", tags = { "news" }, when = { questActive = TODO_QUEST("Essential Artificials") },
          text = "The essential artificials are in the deep parts of Gnomeregan, in big steam-powered cabinets called artificial extrapolators. Nobody thought to bring any when we fled, and now I need twelve." },
      },
      again = {
        { id = "h_again", text = "What else? I've a crucible warming." },
        { id = "h_again2", text = "Go on, go on, I'm listening, mostly." },
      },
      choices = {
        { text = "What's the greatest invention of all?", next = "invention" },
        { text = "Who's Furen Longbeard?", next = "furen" },
        { text = "What's an essential artificial?", next = "artificial" },
        { text = "Can you look at my work?", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "Good luck with your quest.", next = "END" },
      },
    },

    invention = {
      lines = {
        { id = "in_default", text = "Ah! Well! It's, um, very great, and very inventive, and it'll need the hardest metal anyone's ever made, which is why I'm making that first." },
      },
      choices = {
        { text = "You don't know yet, do you?", next = "invention_know" },
        { text = "Every great invention starts with a good metal.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    invention_know = {
      lines = {
        { id = "ik_default", text = "Shh! Not so loud! I'll know it when the metal's ready, because the metal will tell me, and anyway that's how half of Gnomeregan's best inventions began." },
      },
      choices = {
        { text = "A craftsman should plan before he forges.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The best ideas come from following your curiosity.", next = "BACK", fx = { align = { order = -1 }, affinity = 2, trait = { curious = 1 } } },
      },
    },

    furen = {
      lines = {
        { id = "fu_default", text = "A dwarven armorsmith, and a very clever one, who's been fire-hardening mail with a technique of his own. He sent me his notes, and I've been applying his method to mine, and the results are, well, marvelous!" },
      },
      choices = {
        { text = "How does fire-hardening work?", next = "furen_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    furen_how = {
      lines = {
        { id = "fh_default", text = "Heat, quench, and a special coral that only grows in hot water near Menethil, smelted in. The coral does something to the iron that I don't fully understand yet, which is the best kind of something." },
      },
      choices = {
        { text = "Some secrets are better left in the coral.", next = "BACK", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "Then cut it open and find out.", next = "BACK", fx = { align = { light = -1 }, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    artificial = {
      lines = {
        { id = "ar_default", text = "A nigh-universal mechanical component! Every tinker and smith in Gnomeregan used them for everything, and in all the panic, not a single one of us remembered to bring any." },
      },
      choices = {
        { text = "Why need so many?", next = "artificial_why" },
        { text = "Panic makes people forget.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    artificial_why = {
      lines = {
        { id = "aw_default", text = "Experiments! Lots of them, and most will fail, which is the point of experiments. Whoever brings me twelve pushes gnomish research forward by miles." },
      },
      choices = {
        { text = "Science is worth the risk.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Experiments should have safeguards.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
      },
    },

    smith = {
      lines = {
        { id = "sm_default", text = "Ooh, let me see! Good folding, decent temper, and a quench that's a touch too quick; dwarves taught you, I can tell, because you hit it like it owes you money." },
      },
      choices = {
        { text = "Fair, I'll slow the quench.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Metals, mostly, but I hear things over the anvil. Here's what's rattling round my head." } },
    background = { { id = "tp_bg", text = "Smith, gnome, seeker of harder metals. That's the whole of me, and I like it that way." } },
    advice = { { id = "tp_ad", text = "Never trust a metal you haven't broken at least once. It hasn't told you its secrets yet." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "We left everything behind, including every essential artificial in the city.", next = "artificial" } },
    _none = { { id = "tp_none", text = "Is it a metal? If it isn't, then I'm afraid I've no idea." } },
  },
}

-- Gnoarn: lost his gnomefro to the radiation; would very much like to save Gnomeregan.
P:NPC {
  key = "gnoarn", id = TODO_NPC("Gnoarn"), name = "Gnoarn",
  bible = "bibles/tinker_town.md", role = "questgiver", tier = "quest",
  communities = { "ironforge" }, temper = { "fierce" }, values = { "vengeful", "loyal" },
  notices = { "kin" },

  impression = {
    first = "Gnoarn lost his magnificent hair in the radiation leak and his temper along with it. He shakes his fist at the troggs whenever they come up, which is often, and talks about saving Gnomeregan like a general.",
    third = "{name} met Gnoarn, a bald and furious gnome in Tinker Town who coordinates the effort to take back Gnomeregan.",
  },

  greetings = {
    { id = "g_home", text = "Where troggs and leper gnomes roam stands our home, Gnomeregan! We must make our stand, friend!" },
    { id = "g_back", when = { metBefore = true }, text = "Back for orders? Good, because the movement needs everyone!" },
  },

  notice = {
    { id = "n_refugee", cat = "kin", when = { race = "Gnome", origin = "gnome_gnomeregan_refugee" },
      text = "You got out too! Then you remember the carefree days, before the troggs, before the leak, before my hair. We'll have them back, the days, I mean; the hair's beyond science." },
    { id = "n_dwarf", cat = "kin", when = { race = "Dwarf" },
      text = "A dwarf! Your King gave us Tinker Town, and I'll never forget it, though I'd like to point out that it was your digging that woke the troggs." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Gnoarn, at your service and the service of Gnomeregan! Our families lost, our homes taken, our people scattered, and I'm the one who keeps the plans, so if you want to help, you've come to the right gnome." },
        { id = "h_day_after", tags = { "news" }, when = { questActive = TODO_QUEST("The Day After") },
          text = "Ozzie Togglevolt and Razzle are working on a cure in Kharanos, so go to them and tell them Gnoarn sent you. Perhaps it isn't too late to save the city." },
        { id = "h_bingles", tags = { "news" }, when = { questActive = TODO_QUEST("Find Bingles") },
          text = "Bingles Blastenheimer went scouting over the Loch and hasn't reported for more than a week. I'd bet my last sprocket he's exploded himself again." },
        { id = "h_shoni", tags = { "news" }, when = { questActive = TODO_QUEST("Speak with Shoni") },
          text = "Shoni the Shilent commands our underground assault crew, down in Stormwind among the dwarves. She needs help with her gyrodrillmatic excavationators, and nobody can say that word but her." },
        { id = "h_bingles_done", when = { questDone = TODO_QUEST("Find Bingles") },
          text = "Bingles is alive, and unexploded, even! He says I don't trust his reconnaissance abilities, and he's right, but I'm glad all the same." },
      },
      again = {
        { id = "h_again", text = "What else, recruit? The troggs aren't resting, and neither am I." },
        { id = "h_again2", text = "Ask your questions, recruit, and then go!" },
      },
      choices = {
        { text = "What happened to your hair?", next = "hair" },
        { text = "Tell me about the movement.", next = "movement" },
        { text = "Who's Bingles?", next = "bingles" },
        { text = "Do you really think we can save Gnomeregan?", next = "save" },
        { text = "I was raised here in Tinker Town.", next = "raised", when = { origin = "gnome_ironforge_raised" } },
        { text = "For Gnomeregan!", next = "END" },
      },
    },

    hair = {
      lines = {
        { id = "ha_default", text = "Did you think I was born this shiny? I wore the one and only gnomefro in Azeroth, and the radiation leak took it in clumps, clusters, right there on the workshop floor." },
      },
      choices = {
        { text = "Hair grows back.", next = "hair_back" },
        { text = "It suits you, honestly.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    hair_back = {
      lines = {
        { id = "hb_default", text = "Not this hair, not after that. So I turned my anger on the troggs, and every trogg in Dun Morogh owes me a gnomefro, and I mean to collect." },
      },
      choices = {
        { text = "Then let's make the troggs pay.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1, trait = { brave = 1 }, learn = { "troggs" } } },
        { text = "Vengeance won't grow it back.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1, learn = { "troggs" } } },
      },
    },

    movement = {
      lines = {
        { id = "mo_default", text = "Every gnome who wants to go home, working together: Ozzie and Razzle in Kharanos on the cure, Shoni in Stormwind on the drills, Bingles in the air, and me here, keeping the plans straight." },
      },
      choices = {
        { text = "What's the cure?", next = "movement_cure" },
        { text = "Who commands it all?", next = "movement_cmd" },
      },
    },
    movement_cure = {
      lines = {
        { id = "mc_default", text = "Ozzie calls it Gnogaine, and it's meant to scrub the radiation out of the leper gnomes. It doesn't work yet, but the important thing is that it doesn't work in very promising ways." },
      },
      choices = {
        { text = "Science will cure them.", next = "BACK", fx = { align = { light = -1 }, learn = { "gnomeregan" } } },
        { text = "They'll need prayer as much as science.", next = "BACK", fx = { align = { light = 1 }, learn = { "gnomeregan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    movement_cmd = {
      lines = {
        { id = "mm_default", text = "The High Tinker, officially, and he's very good at it. Unofficially, central command is this corner of Tinker Town, and central command is me." },
      },
      choices = { { text = "Yes, commander.", next = "BACK", fx = { affinity = 2 } } },
    },

    bingles = {
      lines = {
        { id = "bi_default", text = "Bingles Blastenheimer, our aerial reconnaissance, which is to say he flies over things and writes down what he sees, when he doesn't crash. Mostly he crashes." },
      },
      choices = {
        { text = "I'll keep an eye out for him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    save = {
      big = true,
      lines = {
        { id = "sa_default", text = "Think it? I know it, recruit, right down to my boots! I don't know when, or how, or which of us will be left to do it, but we'll walk back through those gates, and I'll stand in my old workshop and shake my fist at the ceiling." },
      },
      choices = {
        { text = "I'll walk in beside you.", next = "BACK", fx = { align = { order = 1 }, affinity = 2, trait = { brave = 1 } } },
        { text = "Maybe it's time to build somewhere new.", next = "BACK", fx = { align = { order = -1 }, affinity = -2 } },
      },
    },

    raised = {
      lines = {
        { id = "ra_default", text = "Then you've never seen the city! You've grown up among dwarves and never seen the great lift, or the Clean Room, or the light on the gears at shift change. We'll fix that, recruit, I promise you." },
      },
      choices = { { text = "I'd like to see it.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Central command hears everything, eventually, and most of it's about troggs. Here's the report." } },
    background = { { id = "tp_bg", text = "I'm Gnoarn, formerly of the only gnomefro in Azeroth, now of the movement to retake Gnomeregan. That's all you need to know." } },
    advice = { { id = "tp_ad", text = "Never stand next to a radiation leak. I know it sounds obvious, but somebody has to say it.", next = "hair" } },
    troggs = { { id = "tp_troggs", text = "Damn those troggs, damn them all! They owe me a city and a head of hair.", next = "hair_back" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Our home! Where troggs and leper gnomes roam now, but not for ever.", next = "movement" } },
    _none = { { id = "tp_none", text = "That's not a matter for central command. Ask a dwarf, they love questions." } },
  },
}
