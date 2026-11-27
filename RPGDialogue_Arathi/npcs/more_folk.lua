-- More of Arathi: Lolo and Doctor Draxlegauge at Faldir's Cove; the Arathi Basin quartermasters and
-- resource officers (Sergeant Maclear and Samuel Hawke at Refuge Pointe, Deathstalker Mortis and
-- Rutherford Twing at Hammerfall); and Hammerfall's two butchers, Slagg and Uttnar.
-- Voices: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Lolo the Lookout: the Harbinger's ogre lookout, who speaks of himself in the third person.
P:NPC {
  key = "ar_lolo", id = TODO_NPC("Lolo the Lookout"), name = "Lolo the Lookout", title = "Blackwater Raiders",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "faldirs_cove", "blackwater" }, temper = { "cheerful", "eager" }, values = { "loyal", "simple" },
  notices = { "race", "stranger" },

  impression = {
    first = "He talks about Lolo as though Lolo stood next to him.",
    third = "{name} met Lolo the Lookout, the cheerful ogre who keeps watch over the stranded Blackwater Raiders at Faldir's Cove.",
  },

  greetings = {
    { id = "g_default", text = "Lolo sees you! Always on the lookout, Lolo is." },
    { id = "g_back", when = { metBefore = true }, text = "Lolo sees a face Lolo knows! Welcome back to the cove, friend." },
    { id = "g_landho", when = { questActive = TODO_QUEST("Land Ho!") }, text = "Captain O'Breen is on the Harbinger, friend. Lolo would go with you, but Lolo is on watch." },
    { id = "g_ogre", when = { race = { "Orc", "Troll" } }, text = "Lolo sees a big friend! Not as big as Lolo, but big enough to be welcome." },
    { id = "g_naga", when = { questDone = TODO_QUEST("Death From Below") }, text = "No naga in the water today, friend, and Lolo has looked very, very hard." },
  },

  notice = {
    { id = "n_small", cat = "race", when = { race = { "Gnome", "Dwarf" } },
      text = "Lolo almost did not see you down there! That is very bad for a lookout, so Lolo will look lower from now on." },
    { id = "n_stranger", cat = "stranger", when = { metBefore = false },
      text = "Lolo saw you come down the hill a long time ago, before you saw Lolo. That is how Lolo knows he is good at his job." },
  },

  start = "hello",
  nodes = {
    x_hunter = {
      lines = {
        { id = "xh_default", text = "Lolo thought about that! But a hunter must be quiet, and Lolo is not quiet, and the gulls fly away when Lolo sneaks. Lolo will look, and the friend can shoot, and that is a good crew." },
        { id = "xh_pet", when = { pet = true }, text = "Lolo thought about that! But a hunter needs a beast friend like {pet}, and the only beasts here are gulls and the captain's parrot. The parrot bit Lolo, so Lolo will stay a lookout." },
      },
      choices = {
        { text = "You look, I'll shoot. Agreed.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Lolo.", next = "BACK" },
      },
    },
    x_big = {
      lines = {
        { id = "xb_default", text = "Hm. Lolo looks again, and the friend is still small, but not so small as the goblins. Everybody is tiny from up here, even the captain, and Lolo does not tell him so." },
      },
      choices = {
        { text = "Fair enough. From up there, we all are.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_fish = {
      lines = {
        { id = "xf_default", text = "Lots of fish, friend! Lolo sees them shine by the sunk masts in the morning, big ones. But the scaly ones swim there too, so Lolo would fish from the rocks and keep one eye on the water." },
      },
      choices = {
        { text = "From the rocks, then. Thank you, Lolo.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lolo sees a tiny traveller! Welcome to Faldir's Cove, friend. Captain O'Breen said we would only be here a few hours, but Lolo thinks we will be here a lot longer than that." },
        { id = "h_treasure", tags = { "news" }, when = { questDone = TODO_QUEST("Sunken Treasure") },
          text = "Lolo saw you swimming with the doctor's goggles! You came up with shiny stones, and the captain smiled, and Lolo has not seen the captain smile since the ships went down." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Lolo knows ogres who fight for the Horde now, and Lolo knows ogres who fight for nobody. Lolo fights for Captain O'Breen and Booty Bay, and Lolo is happy with that." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Hello, friend! The Raiders do not care about Stormwind or the Horde, only gold, so Lolo will not bonk you. Captain says so." },
      },
      again = {
        { id = "h_again", text = "Lolo is still listening, and Lolo is still watching. Lolo can do both." },
        { id = "h_again2", text = "What else does the friend want to know? Lolo knows lots." },
      },
      choices = {
        { text = "What happened to your ships?", next = "ships" },
        { text = "You're a long way from Booty Bay.", next = "raiders" },
        { text = "What does a lookout see from here?", next = "lookout" },
        { text = "Why do you speak of yourself like that?", next = "thirdperson" },
        { text = "Someone sent me looking for the captain.", next = "captain", when = { questBefore = TODO_QUEST("Land Ho!") } },
        { text = "A good lookout would make a good hunter, Lolo.", next = "x_hunter", when = { class = "HUNTER" } },
        { text = "You call me tiny, Lolo. Look again.", next = "x_big", when = { race = { "Tauren", "Orc", "Troll" } } },
        { text = "Any fish worth catching in this cove?", next = "x_fish", when = { profession = "Fishing" } },
        { text = "Keep a good watch, Lolo.", next = "END" },
      },
    },

    ships = {
      lines = {
        { id = "sh_default", text = "We lost the other two ships from our formation, the poor Spirit of Silverpine and the Maiden's Folly. The sea rumbled and the water went away, and the ships hit the rocks, and now on the bottom of the sea they rest." },
      },
      choices = {
        { text = "The sea doesn't just go away on its own.", next = "ships_naga" },
        { text = "Did anyone from those ships live?", next = "ships_steelgut" },
        { text = "Something else, Lolo.", next = "BACK" },
      },
    },
    ships_naga = {
      lines = {
        { id = "sn_default", key = true, text = "Lolo thinks so too! Lolo saw scaly ones with many arms down in the water that night, and Lolo told the captain, and the captain said Lolo had been drinking. Lolo had not been drinking, not very much." },
      },
      choices = {
        { text = "Naga. You saw naga, Lolo.", next = "ships_believe" },
        { text = "Perhaps you had been drinking, Lolo.", next = "ships_doubt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ships_believe = {
      big = true,
      lines = {
        { id = "sb_default", text = "Naga! That is the word Nilzlix used too, after they came out of the water and chased everybody. Now the captain believes Lolo, and Lolo is happy, but Lolo would rather have been wrong." },
      },
      choices = {
        { text = "A lookout who's right deserves an apology. Ask for one.", next = "BACK", reply = "Lolo will ask! Lolo has never asked the captain for anything except more biscuits, so this will be very brave.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The captain's word stands. A good crewman lets it go.", next = "BACK", reply = "Yes, that is what Lolo thinks too. The captain has enough to be sad about without Lolo being sad at him.", fx = { align = { order = 1 } } },
        { text = "Something else, Lolo.", next = "BACK" },
      },
    },
    ships_doubt = {
      lines = {
        { id = "sd_default", text = "Hmph. Lolo has two good eyes, and Lolo does not drink on watch, only after. You ask the captain about the scaly ones, and you will see who was right." },
      },
      choices = {
        { text = "Fair enough. I believe you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ships_steelgut = {
      lines = {
        { id = "ss_default", text = "Captain Steelgut came out of the water by himself, all wet and quiet. Lolo gave him a blanket, and Lolo does not talk to him about the Maiden's Folly, because his face goes funny." },
      },
      choices = {
        { text = "That was kind of you, Lolo.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    raiders = {
      lines = {
        { id = "rd_default", text = "Very far, friend! The Blackwater Raiders sail for Booty Bay and for Fleet Master Seahorn, and Seahorn sent us north to find old elf treasure in the sea. Professor Phizzlethorpe has a machine that says where it is." },
        { id = "rd_goutgut", when = { faction = "Horde" },
          text = "Very far, friend! Seahorn sent us north for elf treasure, and Lolo misses the bay and Lolo's friend Goutgut, who is a very big ogre and smells very bad, but is very nice." },
      },
      choices = {
        { text = "How did an ogre come to sail with pirates?", next = "raiders_ogre" },
        { text = "Do you trust the Professor's machine?", next = "raiders_machine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raiders_ogre = {
      lines = {
        { id = "ro_default", text = "Lolo can see very far, and pirates need somebody who can see very far, so Lolo got a job. Ogres in the hills only want to smash things, but the Raiders pay Lolo, and they feed Lolo, and nobody smashes Lolo." },
      },
      choices = {
        { text = "Sounds like a good bargain.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Lolo.", next = "BACK" },
      },
    },
    raiders_machine = {
      lines = {
        { id = "rm_default", text = "The machine whistles and the Professor gets excited, and then something bad happens. Doctor Draxlegauge fixes it after, and Lolo likes the doctor, but Lolo stands far away from the machine." },
      },
      choices = {
        { text = "Wise of you.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    lookout = {
      lines = {
        { id = "lk_default", text = "Lolo sees the sea, and the rocks, and the masts of the poor sunk ships, and sometimes the scaly ones. On a clear day Lolo sees boats going south to the Thandol Span, but they never come to help us." },
      },
      choices = {
        { text = "You must get lonely up here.", next = "lookout_lonely" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lookout_lonely = {
      lines = {
        { id = "ll_default", text = "A little, but Lolo has the gulls, and Lolo counts them. Yesterday there were forty-one, or maybe there were fourteen, because Lolo is not so good at counting as at looking." },
      },
      choices = {
        { text = "Seeing is the hard part. Counting is easy.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Lolo.", next = "BACK" },
      },
    },

    thirdperson = {
      lines = {
        { id = "tp_default", text = "Because Lolo is Lolo! When Lolo says Lolo, everybody knows who is talking, and nobody gets mixed up. The captain says it is very strange, but the captain also talks to his hat." },
      },
      choices = {
        { text = "Then I'll call you Lolo, Lolo.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    captain = {
      lines = {
        { id = "cp_default", text = "Lolo suggests you talk to Captain O'Breen if you plan on sticking around here. He is on the Harbinger, the ship that did not sink, and he will tell you what the Raiders need." },
      },
      choices = {
        { text = "I'll find him.", next = "END" },
        { text = "Something else first.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Lolo does not know that one, friend. Lolo only knows what Lolo can see from up here." } },
  },
}

-- Doctor Draxlegauge: gnome doctor and tinkerer with the Raiders; built the Goggles of Gem Hunting.
P:NPC {
  key = "ar_draxlegauge", id = TODO_NPC("Doctor Draxlegauge"), name = "Doctor Draxlegauge", title = "Blackwater Raiders",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "faldirs_cove", "blackwater" }, temper = { "anxious", "eager" }, values = { "curious", "craft" },
  notices = { "gnome", "kit" },

  impression = {
    first = "He calls it scientific business on dry land and almost believes it.",
    third = "{name} met Doctor Draxlegauge, the gnome tinker who made the Raiders' gem-hunting goggles at Faldir's Cove.",
  },

  greetings = {
    { id = "g_default", text = "Ah, hello! Mind the wires, please; that coil is very nearly stable." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Good, good, I've recalibrated twice since you left, so everything should only explode a little." },
    { id = "g_goggles", when = { questActive = TODO_QUEST("Sunken Treasure") }, text = "How are the goggles working? Adjustments can be made if necessary, and I'll need them back when you're done." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "A fellow gnome! Oh, you've no idea how nice it is to talk to someone who knows what a flux regulator is." },
  },

  notice = {
    { id = "n_engineer", cat = "gnome", when = { profession = "Engineering" },
      text = "Is that a proper engineer's toolkit? Don't let the Professor see it, or he'll borrow it, and you'll get it back in four pieces." },
    { id = "n_wet", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You look like you've been through the cove and back again, and I can't say I envy you any of it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Doctor Draxlegauge, engineer, physician when required, and the reason half the Professor's machines still work. The treasure's on the sea floor so long it's calcified into thick stone, but a little gnomish ingenuity goes a long way!" },
        { id = "h_gems_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Sunken Treasure"), days = 3 } },
          text = "The gems are with O'Breen, and the Captain will be very pleased, and just wait until word gets back to Fleet Master Seahorn! I've already started a paper on the goggles, though nobody here will read it." },
        { id = "h_engineer", when = { profession = "Engineering" },
          text = "An engineer! Come, come, and look at this coil, because I've had nobody to show it to but Lolo, and Lolo only asks whether it's edible." },
      },
      again = {
        { id = "h_again", text = "Yes? Ask quickly, before this cools and I have to start over." },
        { id = "h_again2", text = "Something else? Go on, I can listen and solder at the same time." },
      },
      choices = {
        { text = "Tell me about these goggles of yours.", next = "goggles" },
        { text = "Why not go down for the gems yourself?", next = "swim" },
        { text = "How does a gnome end up with pirates?", next = "pirates" },
        { text = "What's in the cave up the hill?", next = "cave" },
        { text = "What happened to Gnomeregan, from your side?", next = "gnomeregan", when = { race = "Gnome" } },
        { text = "I'll let you work.", next = "END" },
      },
    },

    goggles = {
      lines = {
        { id = "go_default", text = "The Goggles of Gem Hunting! It's next to impossible to find gems in the dark sea without aid, so I built lenses that see the old elven enchantment through the stone. They needed charging from the rune stone in the cave, which the Professor managed, with help." },
      },
      choices = {
        { text = "So the goggles find the gems for you?", next = "goggles_how" },
        { text = "Something else, Doctor.", next = "BACK" },
      },
    },
    goggles_how = {
      lines = {
        { id = "gh_default", text = "They show where the gems are, and you do the fetching! The Captain wants ten at least, and with the goggles you'll see them glowing under the crust like coals in ash." },
        { id = "gh_active", when = { questActive = TODO_QUEST("Sunken Treasure") },
          text = "They show where the gems are, and you're doing the fetching, so keep at it! Ten will do, and do bring the goggles back, because I'm sure the Captain will have many uses for them later on." },
      },
      choices = {
        { text = "And then the gems go to the Captain?", next = "goggles_hand" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goggles_hand = {
      big = true,
      lines = {
        { id = "gd_default", text = "Straight to him, and not through my hands for a moment longer than needed. After a few weeks of consorting with pirates, the Professor and I have realised that the last thing good for our health is to be caught holding their treasure." },
      },
      choices = {
        { text = "They paid for the work. Hand it over honestly.", next = "BACK", reply = "Oh, honestly, every last gem, I promise you! I'd sooner hand O'Breen a live coal than a short count.", fx = { align = { honor = 1 } } },
        { text = "One gem would never be missed, Doctor.", next = "BACK", reply = "One gem would be missed by a pirate who can count to ten, and they all can, when it's gems! No, no, thank you.", fx = { align = { honor = -1 } } },
        { text = "Something else, Doctor.", next = "BACK" },
      },
    },

    swim = {
      lines = {
        { id = "sw_default", text = "I'd swim down there myself, but, um, well, I have important scientific business to tend to up here on the safe, dry land. Er, yes. Very important." },
      },
      choices = {
        { text = "You're afraid of the water.", next = "swim_afraid" },
        { text = "Of course. Someone has to mind the machines.", next = "swim_kind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swim_afraid = {
      lines = {
        { id = "sa_default", text = "Afraid is a very strong word! I've a healthy respect for the water, which is full of naga, and a healthy respect for my lungs, which are small. Put those together and you get a gnome who stays on the beach." },
      },
      choices = {
        { text = "Then build a diving machine.", next = "swim_machine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swim_kind = {
      lines = {
        { id = "sk_default", text = "Exactly, exactly! You understand. The Professor is brilliant, but if nobody minds his machines, they mind themselves, and that never ends well." },
      },
      choices = {
        { text = "Something else, Doctor.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    swim_machine = {
      big = true,
      lines = {
        { id = "sm_default", text = "I've drawn one! A brass bell, an air pump and a gnome inside it, and the arithmetic says it holds. The arithmetic also said the Harbinger would dock safely, so I've put the drawings away for now." },
      },
      choices = {
        { text = "Build it anyway. Someone has to test it.", next = "BACK", reply = "Someone does, and that someone would be me, at the bottom of the sea, in a bell. I'll think about it, very slowly.", fx = { align = { order = -1 } } },
        { text = "Check your sums twice. Then build it.", next = "BACK", reply = "Twice! Three times, even. You're right, it's the checking that keeps an engineer's eyebrows on.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    pirates = {
      lines = {
        { id = "pi_default", text = "Pirates pay very well for anyone who can keep a cannon from blowing up the wrong ship. The Professor came for the treasure, and I came because the Professor needs someone to stitch him up afterwards." },
      },
      choices = {
        { text = "You and the Professor go back a long way?", next = "pirates_prof" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirates_prof = {
      lines = {
        { id = "pp_default", text = "Long enough that I can hear his machines whistle wrong from across the cove. He's a genius and a menace in about equal measure, and I'm the only one here who can tell which he's being today." },
      },
      choices = {
        { text = "Someone should keep an eye on him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Doctor.", next = "BACK" },
      },
    },

    cave = {
      lines = {
        { id = "cv_default", text = "A rune stone, very old and very elven, and I believe the energy in it charged the goggles. But the cave is cursed, or so the Professor says, and the things that came out of the walls when we tried had no interest in being studied." },
        { id = "cv_mage", when = { class = "MAGE" },
          text = "A rune stone, very old and very elven, humming with something your sort would understand better than mine. The cave is cursed, mind, and the things that came out of the walls weren't the sort you'd want to study." },
      },
      choices = {
        { text = "What sort of things?", next = "cave_surges" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cave_surges = {
      lines = {
        { id = "cs_default", text = "Water, but angry, and shaped like it meant it. I've a theory they're bound to the stone the way the naga are bound to whatever's under the reef, and a second theory that I'd rather not find out." },
      },
      choices = {
        { text = "Keep the second theory to yourself.", next = "BACK" },
        { text = "Something else, Doctor.", next = "BACK" },
      },
    },

    gnomeregan = {
      lines = {
        { id = "gn_default", text = "I left before the end, if you can believe it, for a post in Booty Bay that paid in gold instead of gears. I hear the radiation and Thermaplugg's machines took it all, and I still haven't decided if I was lucky or a coward." },
      },
      choices = {
        { text = "Lucky. Nobody could have saved it from inside.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Not my field, I'm afraid! Ask me about lenses, or coils, or why the water here is so very deep." } },
  },
}

-- Sergeant Maclear: League of Arathor sergeant at Refuge Pointe who collects Arathi Basin resources.
P:NPC {
  key = "ar_maclear", id = TODO_NPC("Sergeant Maclear"), name = "Sergeant Maclear",
  bible = "bibles/more_folk.md", role = "soldier", tier = "quest",
  communities = { "refuge_pointe" }, temper = { "brisk", "steady" }, values = { "practical", "dutiful" },
  notices = { "soldier", "pvp" },

  impression = {
    first = "She thinks wars are lost in the larder before the field.",
    third = "{name} met Sergeant Maclear, who gathers Arathi Basin's resources for the League of Arathor at Refuge Pointe.",
  },

  greetings = {
    { id = "g_default", text = "If you've come from the Basin, I'll want to know what you brought back." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, soldier? Good. I've a column on this manifest with nothing in it yet, and I'd like it filled." },
    { id = "g_crate", when = { questActive = TODO_QUEST("Arathi Basin Resources!") }, text = "Do you have the resource crate? The League can't fight a decent battle without it." },
    { id = "g_rep", when = { reputation = { faction = "League of Arathor", min = "honored" } }, text = "The League knows your name now, soldier, and the quartermasters do especially." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Defiler colours or not, you've walked a long way into Refuge Pointe. Keep your hands where I can see them." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, faction = "Alliance" },
      text = "You carry yourself like you've stood in a line before. Stromgarde could use more of that." },
    { id = "n_pvp", cat = "pvp", when = { pvpRank = 3 },
      text = "I know that rank. You've fought for the League somewhere, if not here, and it shows." },
  },

  start = "hello",
  nodes = {
    w2_larder = {
      lines = {
        { id = "w2_larder_l", text = "Vikki Lonsav keeps the stores, and she's the only one in this camp who frightens me. She knows every sack of meal by its weight, and if a crate goes short she'll know whose boots it walked out in." },
        { id = "w2_larder_l1", when = { class = "ROGUE" }, text = "Vikki Lonsav keeps the stores, and you'll forgive me if I mention that she counts them twice after your sort come through. She knows every sack of meal by its weight." },
      },
      choices = {
        { text = "Has anyone ever walked off with a crate?", next = "w2_larder2" },
        { text = "Something else, Sergeant.", next = "BACK" },
      },
    },
    w2_larder2 = {
      lines = {
        { id = "w2_larder2_l", text = "A private from Southshore, last spring, who thought a sack of oats would buy him passage home. The Captain had him carry sacks up from the shore for a month instead, and he's the best porter we have now." },
      },
      choices = {
        { text = "A month's labour sounds about right for a theft like that.", next = "BACK", reply = "That's what I said. Hang a hungry man and you've lost a soldier as well as the oats.", fx = { align = { order = 1 } } },
        { text = "I'd have let him go. A homesick man is no use to anyone.", next = "BACK", reply = "Then you'd have taught every homesick man in the camp what a sack of oats is worth. No, soldier.", fx = { align = { order = -1 } } },
        { text = "Something else, Sergeant.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sergeant Maclear, League of Arathor. Any soldier will tell you a war's fought with soldiers, and they'll also tell you a battle fought with poor gear or on an empty stomach is lost before it starts." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Arathi Basin Resources!"), days = 3 } },
          text = "You got the resources! I've sent them to the quartermasters already, and they'll be on our troops' backs by nightfall. Missions like yours are how wars are truly won, soldier." },
        { id = "h_stromgarde", when = { race = "Human", faction = "Alliance" },
          text = "Sergeant Maclear, League of Arathor. If your people came from Arathor at all, then this is your grandfather's land we're fighting for, and I'll thank you to fight like it." },
      },
      again = {
        { id = "h_again", text = "What else? Keep it short; I've a manifest to finish." },
        { id = "h_again2", text = "Go on, soldier. I'm listening." },
      },
      choices = {
        { text = "Why does the Basin matter so much?", next = "basin" },
        { text = "What do you need from me?", next = "work" },
        { text = "Tell me about the League of Arathor.", next = "league" },
        { text = "Wars are won by fighting, not by counting crates.", next = "crates" },
        { text = "I'm with the Defilers. Why should I listen?", next = "horde", when = { faction = "Horde" } },
        { text = "Who else keeps the Pointe fed, Sergeant?", next = "w2_larder" },
        { text = "Carry on, Sergeant.", next = "END" },
      },
    },

    basin = {
      lines = {
        { id = "ba_default", text = "There are key places in the Basin that hold everything an army needs: a mine, a lumber mill, a blacksmith, farms and stables. Metal, weapons, food and lumber can all be gained there, and whoever holds them can hold the Highlands." },
      },
      choices = {
        { text = "And the Forsaken want the same.", next = "basin_defilers" },
        { text = "Something else, Sergeant.", next = "BACK" },
      },
    },
    basin_defilers = {
      lines = {
        { id = "bd_default", text = "The Defilers want it for the Undercity, and they've Hammerfall's orcs behind them. They'd strip it bare and leave nothing for Stromgarde, which is the difference between us, if you need one." },
      },
      choices = {
        { text = "What would Stromgarde do with it?", next = "basin_future" },
        { text = "Something else.", next = "BACK" },
      },
    },
    basin_future = {
      big = true,
      lines = {
        { id = "bf_default", text = "Feed the refugees at the Pointe, first, then arm the men who'll take back Stromgarde Keep from the Syndicate and the ogres. There's a long road home, and the Basin is the first mile of it." },
      },
      choices = {
        { text = "Then feed the refugees first. Soldiers can wait.", next = "BACK", reply = "Soldiers can't wait long, but you're not wrong, and the Field Marshal would agree with you. Hungry folk don't hold a wall.", fx = { align = { light = 1 } } },
        { text = "Arm the soldiers first. Win, then feed people.", next = "BACK", reply = "That's the sort of sum the officers make, and they're usually right. I just hope the refugees can wait that long.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    work = {
      lines = {
        { id = "wk_default", text = "Enter Arathi Basin, win the battle by holding more bases than the enemy, and bring me back a crate of resources. That's all I ask, and it's more than most manage." },
        { id = "wk_active", when = { questActive = TODO_QUEST("Arathi Basin Resources!") },
          text = "You've already got your orders, soldier. Hold more bases than the Defilers, win the day, and come back with a crate." },
      },
      choices = {
        { text = "What becomes of the crates?", next = "work_crates" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_crates = {
      lines = {
        { id = "wc_default", text = "They go to the quartermasters, who split them out to our troops quick as they can. Samuel Hawke keeps the better kit for those who've earned it, and you'll want to speak to him once you've a few battles behind you." },
      },
      choices = {
        { text = "I'll look him up.", next = "BACK" },
        { text = "Something else, Sergeant.", next = "BACK" },
      },
    },

    league = {
      lines = {
        { id = "lg_default", text = "We're what's left of Stromgarde's army, and anyone else willing to stand with us. Field Marshal Oslight leads us, and he's sworn we'll retake Arathi for the humans of Stromgarde and the Alliance both." },
      },
      choices = {
        { text = "Does the Alliance actually help?", next = "league_alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    league_alliance = {
      lines = {
        { id = "la_default", text = "More now than it did, and that's all I'll say on it. Stromgarde left the Alliance once, and some in Stormwind still remember that, so we earn our help one crate at a time." },
      },
      choices = {
        { text = "Then let's earn it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    crates = {
      big = true,
      lines = {
        { id = "cr_default", text = "Wars are won by fighting, aye, and fights are won by whoever ate this morning. I've seen brave men lose to tired men with sharper swords, and I count crates so it doesn't happen to ours." },
      },
      choices = {
        { text = "Fair. The quiet work matters most.", next = "BACK", reply = "Now you sound like a sergeant. Don't let the knights hear you say it.", fx = { align = { order = 1 } } },
        { text = "Still, I'd rather trust my blade than a manifest.", next = "BACK", reply = "Then trust it, and I'll make sure it's sharpened. Someone has to.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    horde = {
      lines = {
        { id = "hd_default", text = "You shouldn't, and I shouldn't be talking to you. But you'll find Deathstalker Mortis at Hammerfall wants the same crates I do, so I suppose we've that much in common." },
      },
      choices = {
        { text = "Then we'll see who carries more.", next = "END" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "If it isn't on a manifest, it isn't my business, soldier." } },
  },
}

-- Deathstalker Mortis: Forsaken deathstalker at Hammerfall who collects Arathi Basin supplies for the Defilers.
P:NPC {
  key = "ar_mortis", id = TODO_NPC("Deathstalker Mortis"), name = "Deathstalker Mortis",
  bible = "bibles/more_folk.md", role = "soldier", tier = "quest",
  communities = { "hammerfall" }, temper = { "cold", "dry" }, values = { "loyal", "ruthless" },
  notices = { "race", "pvp" },

  impression = {
    first = "He wants the League starved rather than beaten, and says so calmly.",
    third = "{name} met Deathstalker Mortis, who wants the League of Arathor's supply lines cut and keeps watch for the Defilers at Hammerfall.",
  },

  greetings = {
    { id = "g_default", text = "You've the look of someone who could carry a crate. That will do." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the Basin, or merely passing through? I prefer the first." },
    { id = "g_crate", when = { questActive = TODO_QUEST("Cut Arathor Supply Lines") }, text = "The crate, if you please. Every one I hold is one the League does not." },
    { id = "g_rep", when = { reputation = { faction = "The Defilers", min = "honored" } }, text = "The Defilers speak well of you, which is rare, as we speak well of very little." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "Lost, are you? Refuge Pointe is to the west, and I'd hurry if I were you." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "The living do sweat so in the Basin, I'm told. Drink something before you go in, since it seems to matter to your kind." },
    { id = "n_pvp", cat = "pvp", when = { pvpRank = 3 },
      text = "You've a soldier's rank about you. Good; the Basin is no place for the unblooded." },
  },

  start = "hello",
  nodes = {
    w2_crates = {
      lines = {
        { id = "w2_crates_l", text = "The ones marked for the stables. A soldier can go hungry a day and still fight, but a horse with no oats will not carry him to the Basin at all. Starve the beasts first, and the men follow." },
      },
      choices = {
        { text = "You've studied this. Was it your trade in life?", next = "w2_crates2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_crates2 = {
      lines = {
        { id = "w2_crates2_l", text = "I kept the stores at a garrison in Lordaeron, and I watched the plague come in on a grain cart. I learned there that a granary can kill more men than a siege. I simply learned it from the wrong side." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    x_stalker = {
      lines = {
        { id = "xs_default", text = "I am one still. A Defiler is only a Deathstalker who has been told to stand where he can be seen, and I confess I do not enjoy it. You move like someone who would understand the complaint." },
      },
      choices = {
        { text = "What would you have me do in the Basin?", next = "x_stalker_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_stalker_work = {
      lines = {
        { id = "xsw_default", text = "Leave the flags to the ones who like to shout. Find the wagon that feeds their farm and the smith who shoes their horses, and see that neither is there in the morning. That is how a battle is won before the horn." },
      },
      choices = {
        { text = "Quiet work. I know it well.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_undercity = {
      lines = {
        { id = "xu_default", text = "The Dark Lady wants Arathi denied to the living, and Deathmaster Dwire reports our progress to her each week. Beyond that, the Undercity sends Twing his inventories and sends me nothing, which is how I prefer it." },
      },
      choices = {
        { text = "Then we'll give Dwire something worth reporting.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_orc = {
      lines = {
        { id = "xo_default", text = "Some of them do, and Gor'mul has said it to my face, which I respect. Then his grunts eat the grain we carry off, and he says rather less about it." },
      },
      choices = {
        { text = "A full belly quiets most objections.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deathstalker Mortis, of the Defilers. The League of Arathor is sparing no expense in its move to retake Arathi, and all the races of the Alliance stream here to help it. We will stop them, and the best way to stop an army is to take its supper." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Cut Arathor Supply Lines"), days = 3 } },
          text = "Your crate has gone to the Dark Lady's quartermasters, and somewhere in Refuge Pointe a soldier is eating less tonight. I find that more satisfying than any corpse." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "One of us. Good, then I needn't explain why the living here make me tired. The League wants Arathi back, and we intend to see them want." },
      },
      again = {
        { id = "h_again", text = "Something further? Be brief; the dead have patience, but I have duties." },
        { id = "h_again2", text = "Go on. The dead are seldom interrupted, and I find I have grown used to it." },
      },
      choices = {
        { text = "Why do the Forsaken care about Arathi?", next = "why" },
        { text = "What do you want from the Basin?", next = "work" },
        { text = "You work with Hammerfall's orcs?", next = "orcs" },
        { text = "Starving soldiers. Not a very honourable war.", next = "honour" },
        { text = "You were a Deathstalker before you were a Defiler.", next = "x_stalker", when = { class = "ROGUE" } },
        { text = "What word from the Undercity, Deathstalker?", next = "x_undercity", when = { race = "Scourge" } },
        { text = "The Warchief's orcs would call this a coward's war.", next = "x_orc", when = { race = "Orc" } },
        { text = "How do you tell which crates will hurt the League most?", next = "w2_crates" },
        { text = "Farewell, Deathstalker.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because Arathi borders Hillsbrad, and Hillsbrad borders the Undercity's doorstep. A Stromgarde that grows strong again is a Stromgarde that marches on Tarren Mill, and the Dark Lady does not intend to let it." },
      },
      choices = {
        { text = "Many of you were Lordaeron's people once.", next = "why_past" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_past = {
      lines = {
        { id = "wp_default", text = "Many of us were, and Stromgarde's king was quick to leave the Alliance when it suited him, and quicker to forget us when we died. I do not owe his heirs a single field of barley." },
      },
      choices = {
        { text = "Then there's history between you.", next = "why_grudge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_grudge = {
      big = true,
      lines = {
        { id = "wg_default", text = "There's history between the dead and everyone, stranger. The difference is that we remember all of it, and we have nothing better to do with our evenings than settle accounts." },
      },
      choices = {
        { text = "Old debts are worth settling. Take the Basin.", next = "BACK", reply = "Spoken like one of us. I'll see the account closed, field by field.", fx = { align = { light = -1 } } },
        { text = "Let the old grudges rest. Fight for what's ahead.", next = "BACK", reply = "Rest is for the living, and they waste it. Still, I'll grant there is more to win than revenge.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    work = {
      lines = {
        { id = "wk_default", text = "Enter Arathi Basin, with its rich mines, its fertile land and its skilled craftsmen. Capture and control every base you can, win the battle, and return to me with the resources you gain." },
      },
      choices = {
        { text = "And the resources go where?", next = "work_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_where = {
      lines = {
        { id = "ww_default", text = "Some to Hammerfall, some to the Undercity, and the rest to Rutherford Twing, who hands out the Defilers' kit to those who have earned it. He'll want to see your marks, and he counts them twice." },
      },
      choices = {
        { text = "I'll speak to him.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    orcs = {
      lines = {
        { id = "or_default", text = "Hammerfall was theirs before it was ours, and Gor'mul runs it as an orc would, which is loudly. They fight well and complain about our smell, and we tolerate both." },
      },
      choices = {
        { text = "An uneasy alliance, then.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    honour = {
      big = true,
      lines = {
        { id = "ho_default", text = "Honour is a word the living use when they are winning. I was killed by men who sang about honour, and I promise you the song did nothing for me." },
      },
      choices = {
        { text = "Honour still matters, even to the dead.", next = "BACK", reply = "Then go and be honourable in the Basin, and bring me a crate while you're at it. I'll take your honour and your supplies both.", fx = { align = { honor = 1 } } },
        { text = "You're right. Victory is what's remembered.", next = "BACK", reply = "Now you're thinking like one of the dead. It's a much simpler way to live.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know, and I find I don't much care." } },
  },
}

-- Samuel Hawke: League of Arathor supply officer at Refuge Pointe; Arathi Basin rewards.
P:NPC {
  key = "ar_hawke", id = TODO_NPC("Samuel Hawke"), name = "Samuel Hawke", title = "League of Arathor Supply Officer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "refuge_pointe" }, temper = { "steady", "proud" }, values = { "fair", "dutiful" },
  notices = { "reputation", "pvp" },

  impression = {
    first = "He reckons a soldier's worth by marks, fair if not generous.",
    third = "{name} met Samuel Hawke, the League of Arathor's supply officer at Refuge Pointe.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back, and the League's heard of what you did in the Basin. I've kept the good kit back for you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Show your marks and take your kit, and spare me the stories." },
    { id = "g_default", text = "League kit for League soldiers. Show me your marks and we'll talk." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The Basin's been busy, by the look of you." },
    { id = "g_rep", when = { reputation = { faction = "League of Arathor", min = "revered" } }, text = "I keep the best of it back for soldiers like you, and you've earned every piece." },
  },

  notice = {
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You wear your plate as though you've slept in it, which most of the League's line has. I'll see it replaced before it fails you, if your marks allow." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That kit of yours is hanging together by its buckles, soldier. See Jannos Ironwill at the forge before you see me." },
    { id = "n_exalted", cat = "reputation", when = { reputation = { faction = "League of Arathor", min = "exalted" } },
      text = "The whole Pointe knows your name by now. I've had soldiers ask me which armour you wear, so they can wear the same." },
    { id = "n_pvp", cat = "pvp", when = { pvpRank = 6 },
      text = "That's a rank most never reach. Stand straighter, soldier, because people are watching you now." },
  },

  start = "hello",
  nodes = {
    pointe = {
      lines = {
        { id = "pt_default", text = "It's a ring of tents under a cliff, with Captain Nials holding the line and Field Marshal Oslight planning the Basin from a camp table. We've been pushed out of Stromgarde itself, so this is what's left of Arathor until we take the rest back." },
        { id = "pt_human", when = { race = "Human" }, text = "It's a ring of tents under a cliff, and it's the last ground in the Highlands that flies Stromgarde's colours. Every human kingdom began in these hills, friend, so I don't much like seeing them reduced to this." },
      },
      choices = {
        { text = "League rewards should go to those who fought for them.", next = "BACK", reply = "Exactly, and that's why I keep careful records of every mark.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Forge a few marks. The League will never know.", next = "BACK", reply = "The League will know, soldier, and so will I, and I'll see you stripped of your rank.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Who keeps the camp fed and shod?", next = "pointe_folk" },
        { text = "A cliff at your back is no bad thing.", next = "pointe_cliff" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pointe_folk = {
      lines = {
        { id = "pf_default", text = "Vikki Lonsav sells the everyday goods, Jannos Ironwill mends what the Basin breaks, and Narj Deepslice sees that nobody marches on an empty stomach. Cedrik Prose flies the dispatches out by gryphon, so if you want news of the south, he has it before I do." },
      },
      choices = {
        { text = "A small camp, but everyone has a task.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pointe_cliff = {
      lines = {
        { id = "pc_default", text = "So Captain Nials says, and she chose the place. Nothing comes down on us from behind, and from the rise you can see the road from Hammerfall long before anything on it can see you." },
      },
      choices = {
        { text = "Then it was well chosen.", next = "BACK" },
        { text = "Let's see the goods.", next = "BUSINESS" },
      },
    },
    basin = {
      lines = {
        { id = "bs_default", text = "Arathi Basin is the best land in the Highlands: a farm, a stable, a lumber mill, a gold mine and a smithy, all within sight of one another. Whoever holds three of the five can feed and arm an army, which is why the Forsaken sent their Defilers to take it." },
      },
      choices = {
        { text = "Which of the five matters most to you?", next = "basin_which" },
        { text = "The Defilers want it just as badly.", next = "basin_defilers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    basin_which = {
      lines = {
        { id = "bw_default", text = "The smithy, because it's my trade, though Sergeant Maclear would tell you the farm, and she has the crates to prove it. In truth the Field Marshal is right that it's the count that matters, and a soldier who chases one flag loses the other four." },
      },
      choices = {
        { text = "I'll remember that when the horn sounds.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    basin_defilers = {
      lines = {
        { id = "bd_default", text = "They do, and they've a supply officer of their own at Hammerfall, a dead clerk named Twing who counts as carefully as I do. I'm told he's good at it, and I take no comfort in that." },
      },
      choices = {
        { text = "An honest count is worth respecting, even over there.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ironforge = {
      lines = {
        { id = "if_default", text = "It does, and good steel too, though it comes the long way over the Thandol Span and half of it arrives late. I've asked for a dwarf smith to be posted here, and Jannos tells me I should be grateful I've got one already." },
      },
      choices = {
        { text = "One good dwarf smith is worth three wagons.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    line = {
      lines = {
        { id = "ln_default", text = "For the line, I'd take the heaviest plate your marks will stretch to and a shield you can stand behind all afternoon. The flags are won by whoever is still standing beside them, and that is usually the one in the better armour." },
      },
      choices = {
        { text = "Then show me the plate.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Samuel Hawke, supply officer for the League of Arathor. Armour, weapons, rations and the odd enchanted trinket, and every piece of it goes to someone who's held a flag in the Basin." },
        { id = "h_new", when = { reputation = { faction = "League of Arathor", max = "neutral" } },
          text = "Samuel Hawke, supply officer. You're new to the League, I'd say, so go and fight a few battles first, and then come back when the quartermasters know your name." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You want Rutherford Twing, at Hammerfall, if you want anything at all. Nothing on this table is for you." },
      },
      again = {
        { id = "h_again", text = "Anything else, soldier, or can I get back to watching that ridge?" },
        { id = "h_again2", text = "Go on. The marks will keep." },
        { id = "h_again3", text = "Ask what you like, though I'll keep counting while you do." },
      },
      choices = {
        { text = "Show me what the League offers.", next = "BUSINESS" },
        { text = "How does a soldier earn your gear?", next = "earn" },
        { text = "Where does all this come from?", next = "source" },
        { text = "Equipment doesn't win battles. Soldiers do.", next = "soldiers" },
        { text = "Refuge Pointe looks like a hard posting.", next = "pointe" },
        { text = "Tell me about the ground you're fighting over.", next = "basin" },
        { text = "Does Ironforge send you steel?", next = "ironforge", when = { race = { "Dwarf", "Gnome" } } },
        { text = "I carry a shield into the Basin. What suits me?", next = "line", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Not today.", next = "END" },
      },
    },
    earn = {
      lines = {
        { id = "ea_default", text = "By fighting in the Basin and winning there, mostly, so the League learns your name and the quartermasters learn your face. The better you're known, the better I'm allowed to give you." },
      },
      choices = {
        { text = "And the care packages?", next = "earn_packages" },
        { text = "Something else.", next = "BACK" },
      },
    },
    earn_packages = {
      lines = {
        { id = "ep_default", text = "Rations, bandages and a few odds and ends, packed up for soldiers coming off the field. Sergeant Maclear's crates fill them, so if you've brought her one, you've half fed yourself already." },
      },
      choices = {
        { text = "Let's see the goods, then.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = {
        { id = "so_default", text = "Some from Stromgarde's old armouries, some from Ironforge and Stormwind, and more every month from what the Basin's forge and mine turn out. Hold the blacksmith and I get better steel, simple as that." },
      },
      choices = {
        { text = "Then I'll hold the blacksmith.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldiers = {
      big = true,
      lines = {
        { id = "sd_default", text = "Soldiers win battles, and I'd never say otherwise. But I've buried good men in bad boots, and I'd rather not bury any more." },
      },
      choices = {
        { text = "Then give the best kit to the newest recruits.", next = "BACK", reply = "A kind thought, and a costly one. The League gives to those who've proven they'll come back with it.", fx = { align = { light = 1 } } },
        { text = "Reward the veterans. They've earned it.", next = "BACK", reply = "That's how the League sees it, and it's how I hand it out. Earn it, and it's yours.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I hand out kit, soldier. Ask the Field Marshal about the rest." } },
  },
}

-- Rutherford Twing: Forsaken Defilers supply officer at Hammerfall.
P:NPC {
  key = "ar_twing", id = TODO_NPC("Rutherford Twing"), name = "Rutherford Twing", title = "Defilers Supply Officer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "hammerfall" }, temper = { "dry", "precise" }, values = { "orderly", "loyal" },
  notices = { "reputation", "pvp" },

  impression = {
    first = "He counts marks twice and seems to enjoy it.",
    third = "{name} met Rutherford Twing, supply officer to the Forsaken Defilers at Hammerfall.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you again. The Defilers think highly of you, and I have the ledger to prove it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Marks first, and the rest of our conversation will be very short." },
    { id = "g_default", text = "Marks first, questions after. That is the order of things." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Let me guess: more marks, and fewer limbs." },
    { id = "g_rep", when = { reputation = { faction = "The Defilers", min = "revered" } }, text = "The Defilers think well of you. I have the paperwork to prove it." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Another of the Dark Lady's own, and upright, which is more than I can say for half the requisition forms I am sent." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your equipment is in a deplorable state. I shall note it as 'well used', which is the kindest entry I have." },
    { id = "n_exalted", cat = "reputation", when = { reputation = { faction = "The Defilers", min = "exalted" } },
      text = "Exalted with the Defilers. I've only written that word in my ledger a handful of times, and I underlined it each time." },
    { id = "n_pvp", cat = "pvp", when = { pvpRank = 6 },
      text = "A rank like that frightens the Leaguers more than any plague. Do keep it up." },
  },

  start = "hello",
  nodes = {
    w2_stock = {
      lines = {
        { id = "w2_stock_l", text = "The orcs wear out boots, the trolls wear out bowstrings, and the Forsaken wear out bandages, though not, perhaps, in the way you'd expect. I issue linen by the bolt to keep certain of our soldiers in one piece." },
      },
      choices = {
        { text = "Bandages, for the dead?", next = "w2_stock2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_stock2 = {
      lines = {
        { id = "w2_stock2_l", text = "Flesh does not mend on its own once it has stopped living, so it must be held together until an apothecary can stitch it. I have a column for it in the ledger, headed 'repairs', and it is the longest column I keep." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hammerfall = {
      lines = {
        { id = "hf_default", text = "It is loud, it smells of buzzard, and the orcs sharpen their axes at all hours. Still, Gor'mul keeps his walls manned and Drum Fel keeps his people busy, and I have worked in worse-run places that had roofs." },
      },
      choices = {
        { text = "The Defilers' rewards should go only to those who earned them.", next = "BACK", reply = "Quite. The ledger never lies, and neither do I, which is a rare thing among the dead.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Forge a few marks. The paperwork is easy to fudge.", next = "BACK", reply = "How amusing, since I keep the paperwork myself, and I assure you it will not be fudged by either of us.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do the orcs make room for your kind?", next = "hammerfall_orcs" },
        { text = "Who else answers to the Undercity here?", next = "hammerfall_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hammerfall_orcs = {
      lines = {
        { id = "ho_default", text = "They make room, and then they stand at the far end of it. The butcher Slagg is the exception, since he insists on offering me barbecued wings, and I have not the heart, nor the tongue, to tell him it is wasted on me." },
      },
      choices = {
        { text = "It's a kindness all the same.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hammerfall_dead = {
      lines = {
        { id = "hd_default", text = "Deathmaster Dwire commands the Defilers here, Deathstalker Mortis sees to the Basin's plunder, and Doctor Gregory Victor patches whatever comes back. Between the four of us we are a very small Lordaeron, and a rather better organised one." },
      },
      choices = {
        { text = "Let's see what a small Lordaeron issues.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    basin = {
      lines = {
        { id = "ba_default", text = "A farm, a stable, a mill, a mine and a forge are what an army eats, rides, builds with, pays with and fights with. Deny all five to the League of Arathor and Stromgarde stays a ruin, which keeps it from troubling Tarren Mill." },
      },
      choices = {
        { text = "And what do the Forsaken need with a farm?", next = "basin_farm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    basin_farm = {
      lines = {
        { id = "bf2_default", text = "Nothing at all, which is the elegance of it. We need only see that the living do not have it, and what we carry off goes to feed Hammerfall's orcs, who eat enough for both peoples." },
      },
      choices = {
        { text = "A cold sort of arithmetic.", next = "BACK" },
        { text = "It's sound strategy, whatever it looks like.", next = "BACK" },
      },
    },
    undercity = {
      lines = {
        { id = "uc_default", text = "It seems far away, and its requests for inventory arrive with great regularity all the same. I confess I miss the quiet of the canals, though not the apothecaries, who never once returned a borrowed crate." },
      },
      choices = {
        { text = "They don't return much of anything.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = {
        { id = "rg_default", text = "It shows that the quiet ones bring back fewer marks and lose far less equipment, which I regard as a fair exchange. I keep the blackened leathers on the lower shelf for people of your profession." },
      },
      choices = {
        { text = "Show me the lower shelf.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rutherford Twing, supply officer to the Defilers. Armour, arms and rations for those who fight in the Basin, issued according to merit, and merit is measured in marks." },
        { id = "h_new", when = { reputation = { faction = "The Defilers", max = "neutral" } },
          text = "Rutherford Twing, supply officer. My ledger doesn't know you yet, which means my shelves aren't for you yet, so do come back after a battle or three." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Your supply officer is at Refuge Pointe, and he is welcome to you. Nothing here is issued to the Alliance except by accident." },
      },
      again = {
        { id = "h_again", text = "Anything further?" },
        { id = "h_again2", text = "Do continue. I've another column to total." },
        { id = "h_again3", text = "Yes? I am listening, and I am also adding." },
      },
      choices = {
        { text = "Show me what the Defilers offer.", next = "BUSINESS" },
        { text = "You keep a careful ledger.", next = "ledger" },
        { text = "What were you, before?", next = "before" },
        { text = "Hammerfall seems an odd post for a Forsaken clerk.", next = "hammerfall" },
        { text = "What do the Defilers want with a few farms?", next = "basin" },
        { text = "How does the Undercity seem, from out here?", next = "undercity", when = { race = "Scourge" } },
        { text = "Your ledger must show what a rogue is worth.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Who uses the most of your stock?", next = "w2_stock" },
        { text = "Not today.", next = "END" },
      },
    },
    ledger = {
      lines = {
        { id = "le_default", text = "Careful is the only way to keep one. Every mark and every pair of greaves is written down, because when the Undercity asks where it all went, I intend to have an answer." },
      },
      choices = {
        { text = "Does anyone ever try to cheat you?", next = "ledger_cheat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ledger_cheat = {
      big = true,
      lines = {
        { id = "lc_default", text = "An orc once tried to claim the same mark twice, and I let Deathstalker Mortis explain the error to him. Now they all count before they come to me, which saves us both time." },
      },
      choices = {
        { text = "Rules are rules. He got what he deserved.", next = "BACK", reply = "Quite so. Order is what separates us from the Scourge, and the paperwork is what separates us from the orcs.", fx = { align = { order = 1 } } },
        { text = "One mark? You might have let it slide.", next = "BACK", reply = "One mark slides, then ten, then the whole ledger slides into the river. No, thank you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = {
        { id = "bf_default", text = "A quartermaster's clerk in Lordaeron, counting other men's spears. I died counting them, in fact, and I find I have simply carried on." },
      },
      choices = {
        { text = "Some habits outlast death.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Let's see the goods.", next = "BUSINESS" },
      },
    },
  },
  topics = {
    hammerfall = { { id = "tp_hf", text = "A fort of orcs built on the grave of an orc, with a handful of the Dark Lady's servants billeted in the corner. It functions, which I did not expect." } },
    _none = { { id = "tp_none", text = "That isn't in my ledger, and so, as far as I am concerned, it does not exist." } },
  },
}

-- Slagg: orc cooking trainer at Hammerfall, called the Superior Butcher.
P:NPC {
  key = "ar_slagg", id = TODO_NPC("Slagg"), name = "Slagg", title = "Superior Butcher",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "hammerfall" }, temper = { "gruff", "proud" }, values = { "craft", "proud" },
  notices = { "craft", "hunger" },

  impression = {
    first = "He thinks a warrior who can't cook is only half a warrior.",
    third = "{name} met Slagg, Hammerfall's butcher and cooking teacher.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, and I can smell that you've been cooking. Good, come and show me what you've learned." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll teach you, since it's my trade, but you'll not get any of my secrets." },
    { id = "g_default", text = "You want to learn to cook, or you want to stand there smelling my fire?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good. The fire is hot and the buzzards are plucked." },
    { id = "g_cook", when = { profession = "Cooking" }, text = "A cook! Come, I will show you what a buzzard is good for." },
    { id = "g_troll", when = { race = "Troll" }, text = "A troll! Your people know spice, at least, so sit and tell me if my sauce has enough of it." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren at my fire. Your people know the worth of a clean kill, and I will not serve you kodo, so do not look at me like that." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Bring your kills to a butcher before the sun spoils them, because half the meat in these hills is wasted by warriors who skin like children." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You carry a cook's knife. Hold it like a weapon and it will serve you like one." },
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look like you have fought much and eaten little. That is how warriors die stupid." },
  },

  start = "hello",
  nodes = {
    w2_feast = {
      lines = {
        { id = "w2_feast_l", text = "Boar, roasted whole over a pit, with the fat basted back on every hour until the skin cracks. We did it once, when the first wind rider landed here, and Gor'mul ate until he had to sit down." },
      },
      choices = {
        { text = "Why not do it more often?", next = "w2_feast2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_feast2 = {
      lines = {
        { id = "w2_feast2_l", text = "Because a whole boar feeds the fort once, and the same boar salted and smoked feeds the scouts for a month. A feast is a fine thing, but a full belly on patrol is a better one." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    eaters = {
      lines = {
        { id = "et_default", text = "Gor'mul's grunts, the wyvern riders who come through with Urda, and the dead ones from the Undercity who sit and do not eat. Innkeeper Adegwa sends her guests to me when her own pot runs low, and I send the thirsty ones back to her." },
      },
      choices = {
        { text = "A cook should use only good, fresh meat for the warriors.", next = "BACK", reply = "Yes. A warrior fed on rotten meat fights like rotten meat, and the Horde deserves better.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Old meat is still meat. Warriors won't taste the difference.", next = "BACK", reply = "They will taste it on the battlefield, when their bellies turn, and they will curse your name.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "And Uttnar? He sells meat too.", next = "eaters_uttnar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eaters_uttnar = {
      lines = {
        { id = "eu_default", text = "Uttnar cuts well and sells cheap, and he thinks that is all there is to it. He says I talk too much about meat, and then he comes at night to buy my sauce, so I know who is right." },
      },
      choices = {
        { text = "A butcher who buys your sauce has answered himself.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hammerfall = {
      lines = {
        { id = "hm_default", text = "The name is heavy because of what happened here. This was a prison camp of the humans, and Orgrim Doomhammer fell on this ground when the Horde broke it open, so the Warchief named it for him." },
      },
      choices = {
        { text = "Then every meal here is eaten on honoured ground.", next = "hammerfall_ground" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hammerfall_ground = {
      lines = {
        { id = "hg_default", text = "Yes, and I tell the young grunts so when they complain about the dust. Drum Fel remembers more of it than I do, and he will tell you, if you can stand to hear an old orc be right for an hour." },
      },
      choices = {
        { text = "I'll listen to him.", next = "BACK" },
        { text = "Teach me your craft, Slagg.", next = "BUSINESS" },
      },
    },
    camps = {
      lines = {
        { id = "cm_default", text = "You are an orc, so you know, or your father knows. They fed us grey porridge from a trough and we were too dull to care, and that is the part that shames me, more than the walls." },
      },
      choices = {
        { text = "The shame belongs to the ones who built the walls.", next = "camps_now" },
        { text = "And now you feed a whole fort.", next = "camps_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camps_now = {
      lines = {
        { id = "cn_default", text = "Now I stand where a camp stood and I cook what I choose, and no human hands me a bowl. Thrall gave us back our pride, and I say a full belly is where an orc keeps it." },
      },
      choices = {
        { text = "Lok'tar, Slagg.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    larder = {
      lines = {
        { id = "ld_default", text = "Buzzard for the wings, raptor from the eastern hills if your teeth are good, and spider from the caves, which is better than it sounds. The secret of all three is the same: cut away what is tough and cook the rest slowly." },
      },
      choices = {
        { text = "Show me how it's done.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Slagg, butcher of Hammerfall, and better than any butcher in Orgrimmar. I teach cooking to any who want it, and the buzzards of the Highlands are my best lesson." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Slagg, butcher of Hammerfall. In the camps we ate what the humans threw us, so now I cook properly, every day, and I teach any orc who asks." },
      },
      again = {
        { id = "h_again", text = "What else? The fire will not wait forever." },
        { id = "h_again2", text = "Speak. My hands are busy, not my ears." },
        { id = "h_again3", text = "Ask, then. The wings need turning soon." },
      },
      choices = {
        { text = "Teach me what you know.", next = "BUSINESS" },
        { text = "Buzzard? People eat buzzard?", next = "buzzard" },
        { text = "Why should a warrior learn to cook?", next = "warrior" },
        { text = "Who eats at your fire?", next = "eaters" },
        { text = "Hammerfall has a heavy name for a small fort.", next = "hammerfall" },
        { text = "You spoke of the camps.", next = "camps", when = { race = "Orc" } },
        { text = "I cook a little myself. What do the Highlands offer?", next = "larder", when = { profession = "Cooking" } },
        { text = "What would you cook for a feast here?", next = "w2_feast" },
        { text = "Not now.", next = "END" },
      },
    },
    buzzard = {
      lines = {
        { id = "bz_default", text = "Highland buzzards are tough and stringy, so most people throw them away. But barbecue the wings slow over a hot fire with a good sauce, and even the Forsaken ask for some, and they do not even taste much." },
      },
      choices = {
        { text = "What's the secret?", next = "buzzard_secret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buzzard_secret = {
      lines = {
        { id = "bs_default", text = "Patience. You do not rush meat any more than you rush a charge, and the fool who does both gets burned. I will teach you the rest if you pay me." },
      },
      choices = {
        { text = "Then teach me.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior = {
      big = true,
      lines = {
        { id = "wa_default", text = "Because a warrior who cannot feed himself must beg or steal, and an orc should do neither. Strength comes from the belly first and the arm after." },
      },
      choices = {
        { text = "Feeding yourself is a kind of honour. I agree.", next = "BACK", reply = "Good. Then you will be a better warrior than most I have fed.", fx = { align = { honor = 1 } } },
        { text = "I'll take what I need from the field.", next = "BACK", reply = "Then you will eat raw and die young. Come back when you are hungry enough to learn.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    hammerfall = { { id = "tp_hf", text = "Doomhammer fell here, and the Warchief named the fort for him. I cook on that ground, so I do not cook badly." } },
    _none = { { id = "tp_none", text = "I know meat and fire. Ask Gor'mul about the rest." } },
  },
}

-- Uttnar: orc meat vendor at Hammerfall.
P:NPC {
  key = "ar_uttnar", id = TODO_NPC("Uttnar"), name = "Uttnar", title = "Butcher",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "hammerfall" }, temper = { "blunt", "gruff" }, values = { "practical" },
  notices = { "hunger" },

  impression = {
    first = "He says Slagg fusses too much, yet he buys Slagg's sauce.",
    third = "{name} met Uttnar, who sells meat to Hammerfall's warriors.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You again. I saved the good cuts, the ones with fat on them. For you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Buy meat, or go. I have no words for you today." },
    { id = "g_default", text = "Meat. You want some, or not?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still hungry? Good. Buy." },
    { id = "g_forsaken", when = { race = "Scourge" }, text = "The dead buy meat too, I have learned. I do not ask what for." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Good, then you know what a clean kill is worth, and you will not argue about the price." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late for buying meat, but the block is still wet, so choose." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc with a real appetite, I hope. The dead ones pick at their food and the trolls argue about the price." },
    { id = "n_skinner", cat = "craft", when = { profession = "Skinning" },
      text = "You carry a skinning knife, and you keep it clean. Good, because a dirty knife spoils the hide and the meat both." },
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look half eaten yourself. Buy something and sit down before you fall down." },
  },

  start = "hello",
  nodes = {
    w2_cut = {
      lines = {
        { id = "w2_cut_l", text = "Boar shoulder. It is tough, so the warriors think it is cheap meat, and they leave it to me. Slow it over a low fire and it falls off the bone, but do not tell Slagg I said so." },
      },
      choices = {
        { text = "Why keep it from Slagg?", next = "w2_cut2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_cut2 = {
      lines = {
        { id = "w2_cut2_l", text = "Because he would put it on his fire and call it his own idea, and then he would make a speech about it. I have heard enough of his speeches for one lifetime." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    warriors = {
      lines = {
        { id = "wr_default", text = "They eat like wolves, and Gor'mul's grunts eat most of all, because he drills them until they drop. A fort that is fed does not grumble, so I count my work as part of the watch." },
      },
      choices = {
        { text = "A butcher should sell honest meat at an honest price.", next = "BACK", reply = "Yes. Meat is meat, and I do not cheat my people. That is not the orc way.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the Forsaken the spoiled cuts. They won't notice.", next = "BACK", reply = "They notice, and they complain, and I do not need their whining, so no.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Do the Forsaken buy from you as well?", next = "warriors_dead" },
        { text = "An army marches on its butcher.", next = "warriors_pride" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warriors_dead = {
      lines = {
        { id = "wd_default", text = "They do. The clerk Twing buys a little every week and writes it in his book, and I think he feeds the Deathmaster's hounds with it. I do not ask, and he does not say, and the coin is good." },
      },
      choices = {
        { text = "Good coin needs no questions.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warriors_pride = {
      lines = {
        { id = "wpr_default", text = "Hmph. That is the kind of thing Slagg would say, and he would take an hour to say it. It is true, though, so I will let you say it once." },
      },
      choices = {
        { text = "Once is enough. Show me the meat.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ogres = {
      lines = {
        { id = "og_default", text = "The Boulderfist, in the hills to the west and at their big hall in the south. They take goats, boars, and a hunter now and then, and they waste half of what they kill." },
      },
      choices = {
        { text = "Does Hammerfall do anything about them?", next = "ogres_hunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ogres_hunt = {
      lines = {
        { id = "oh_default", text = "Drum Fel sends warriors against them, and Korin Fel pays for what they bring back. I would go myself, but then who would cut the meat? Kill some for me, and my hunters will come home with more." },
      },
      choices = {
        { text = "I'll thin them out.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "I have my own hunters, and they know how I like a carcass brought in. But walk the east hills with them once and bleed your kill properly, and I will not turn you away from my block." },
      },
      choices = {
        { text = "Fair enough. What do you have today?", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "ta_default", text = "Boar and goat and buzzard, all killed clean, and I take no more from the hills than the fort will eat. A tauren told me once that this matters, and I found the meat tasted no worse for it." },
      },
      choices = {
        { text = "The Earth Mother notices such things.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Uttnar, butcher. I sell meat to the warriors of Hammerfall, and they eat a lot of it, so do not waste my time if you are not buying." },
      },
      again = {
        { id = "h_again", text = "More? Ask fast, before the flies find this side of boar." },
        { id = "h_again2", text = "What else, then?" },
        { id = "h_again3", text = "Talk while I cut, then. The knife does not stop." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Where does the meat come from?", next = "meat" },
        { text = "You and Slagg sell the same thing.", next = "slagg" },
        { text = "Hammerfall's warriors must keep you busy.", next = "warriors" },
        { text = "You said the ogres take the goats.", next = "ogres" },
        { text = "I hunt. Would you buy what I bring down?", next = "hunter", when = { class = "HUNTER" } },
        { text = "What does a tauren find on your block?", next = "tauren", when = { race = "Tauren" } },
        { text = "What's the best cut you sell?", next = "w2_cut" },
        { text = "Not now.", next = "END" },
      },
    },
    meat = {
      lines = {
        { id = "mt_default", text = "The hills. Boars, raptors from the east, and the odd goat the ogres did not take first. Our hunters bring it in, and I cut it before the flies do." },
      },
      choices = {
        { text = "Raptor? Out here?", next = "meat_raptor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat_raptor = {
      lines = {
        { id = "mr_default", text = "Witherbark trolls keep them, and some get loose and come down the hills. They are tough to kill and tough to chew, but a warrior with good teeth does not complain." },
      },
      choices = {
        { text = "I'll take some.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    slagg = {
      big = true,
      lines = {
        { id = "sl_default", text = "Slagg cooks it and makes speeches about it, and I sell it and keep my mouth shut. His sauce is good, but a warrior does not need a speech with his supper." },
      },
      choices = {
        { text = "Good food deserves a little pride.", next = "BACK", reply = "Hmph. Maybe. Do not tell Slagg I said so.", fx = { align = { order = -1 } } },
        { text = "Meat is meat. You have the right of it.", next = "BACK", reply = "Yes. Meat is meat. Buy some.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    hammerfall = { { id = "tp_hf", text = "It is a fort, and forts eat. Gor'mul commands it, Drum Fel speaks for it, and I feed it." } },
    slagg = { { id = "tp_slagg", text = "He cooks well and he knows it, and he will tell you so until the meat is cold. Buy his sauce and leave before the speech." } },
    _none = { { id = "tp_none", text = "I sell meat. That is all I know, and it is enough." } },
  },
}

-- First Mate Nilzlix: goblin first mate of the Harbinger at Faldir's Cove; keeps the logs.
P:NPC {
  key = "ar_nilzlix", id = TODO_NPC("First Mate Nilzlix"), name = "First Mate Nilzlix", title = "Blackwater Raiders",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "faldirs_cove", "blackwater" }, temper = { "harried", "sharp" }, values = { "loyal", "practical", "greedy" },
  notices = { "class", "race", "craft" },

  impression = {
    first = "First Mate Nilzlix keeps the Blackwater Raiders' logs at Faldir's Cove and frets over two sets of charts lying on the sea floor. He fears Fleet Master Seahorn more than he fears the naga, and says so.",
    third = "{name} met First Mate Nilzlix, who keeps the logs for the stranded Blackwater Raiders at Faldir's Cove.",
  },

  greetings = {
    { id = "g_default", text = "Whoa, whoa, watch the ledger, pal, the ink's still wet and it's the only dry thing I own." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Good, good, I was just adding up what this whole mess has cost us, and I could use the distraction." },
    { id = "g_active", when = { questActive = TODO_QUEST("Deep Sea Salvage") }, text = "Got my charts and logs yet, friend? Every tide they sit down there is a tide somebody else could find them." },
    { id = "g_done", when = { questDone = TODO_QUEST("Deep Sea Salvage") }, text = "There's my favourite salvager! The logs are drying nicely, and I've stopped dreaming about the plank." },
  },

  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "A goblin, out here! Tell me you're not from the Venture Company, pal, because I've had enough bad news this month." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Another gnome? We've got one already, and he keeps asking me to pay for goggles. Don't you start." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "I know that walk, friend, I learned to count my pockets around it in Booty Bay. No offence meant, and none of my pockets are worth it anyway." },
    { id = "n_swim", cat = "class", when = { class = { "DRUID", "SHAMAN" } },
      text = "Hey, your sort can breathe down there, or walk on it, or something, right? That's a marketable skill in this cove, I'm telling ya." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nilzlix, first mate of the Harbinger, and keeper of the logs for what used to be three ships. Two of them ran aground on some sort of temple in the reef, and their charts and logs went down with them, which is my problem and could be your payday." },
        { id = "h_active", when = { questActive = TODO_QUEST("Deep Sea Salvage") },
          text = "The Maiden's Folly and the Spirit of Silverpine are both out past the rocks, you can see the masts. The charts and the logs will be in the captains' cabins, in the lockboxes, and the naga are swimming all over them, so mind yourself." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Deep Sea Salvage"), days = 3 } },
          text = "Both logs, both sets of charts, and only a little chewed! You've saved the Raiders a fortune in secrets, friend, and you've saved me a very short walk off a very long plank." },
        { id = "h_later", when = { questDone = TODO_QUEST("Deep Sea Salvage") },
          text = "The charts are locked up tight and the logs are copied out fair, so Seahorn can't say I lost a thing. Now if somebody would only fetch us a shipwright, I could close this page of the ledger." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Talk fast, I'm paying myself by the hour." },
        { id = "h_again2", text = "Go on, go on, the ledger isn't going anywhere, and neither are we." },
        { id = "h_again3", text = "Something more? Fine, but if it costs money, the answer's no." },
      },
      choices = {
        { text = "Why do the charts matter so much?", next = "charts" },
        { text = "A temple in the reef. That's no accident.", next = "temple" },
        { text = "What does a first mate do with no ship moving?", next = "mate" },
        { text = "What has this cost the Raiders so far?", next = "cost" },
        { text = "I can stay under longer than most. Where exactly?", next = "x_swim", when = { class = { "DRUID", "SHAMAN", "WARLOCK" } } },
        { text = "A lockbox, you say. I'm good with locks.", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "Does Booty Bay know you're stuck here?", next = "x_goblin", when = { race = { "Goblin", "Gnome" } } },
        { text = "Keep your ledger dry, Nilzlix.", next = "END" },
      },
    },
    charts = {
      lines = {
        { id = "ch_default", text = "Because they show every cove, every cache and every quiet channel the Blackwater Raiders use from here to Booty Bay. If the Bloodsail Buccaneers got hold of them, or the naga, or anybody with a boat, Fleet Master Seahorn would have us all walk the plank, me first." },
      },
      choices = {
        { text = "And the logs?", next = "charts_logs" },
        { text = "Seahorn sounds like a hard master.", next = "charts_seahorn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    charts_logs = {
      lines = {
        { id = "cl_default", text = "The logs say who was paid what, and for which cargo, and where it was sold after. That's a lot of names that would rather stay in a book at the bottom of a drawer than float up on a beach, if you follow me." },
      },
      choices = {
        { text = "Secrets should stay bought. I'll fetch them back.", next = "BACK", reply = "That's the spirit, pal! Discretion is a service, and I pay for services.", fx = { align = { order = 1 } } },
        { text = "A book like that is worth more than your fee.", next = "BACK", reply = "Whoa, whoa. It's worth a knife in the back to anyone who tries to sell it, friend, so let's stay friends.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    charts_seahorn = {
      lines = {
        { id = "cs_default", text = "He's fair, which is worse. He pays on time, he remembers every copper, and he's never once lost a ship without finding out whose fault it was. I intend for it to be nobody's fault, and for that I need the books." },
      },
      choices = {
        { text = "Then let's keep it nobody's fault.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    temple = {
      lines = {
        { id = "tm_default", text = "That's what I said! I was at the rail when we struck, and I saw carved stone under the hulls, like a roof, with the weed grown over it. Then the naga came boiling up out of it, and I stopped taking notes." },
      },
      choices = {
        { text = "Lolo says he saw them first.", next = "temple_lolo", when = { heardLine = "ar_lolo.sn_default" } },
        { text = "What would naga want with an old ruin?", next = "temple_naga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    temple_lolo = {
      lines = {
        { id = "tl_default", text = "He did, the big lug, and the captain told him he'd been at the rum. I've written it into the log properly since, with the time and the watch, because an ogre who's right ought to be right on paper." },
      },
      choices = {
        { text = "That's decent of you, Nilzlix.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    temple_naga = {
      lines = {
        { id = "tn_default", text = "Beats me, pal, I'm a bookkeeper. The Professor says it's elven, older than old, and that there's treasure in it, which is why we sailed up here at all. The Daggerspine seem to think it's theirs, and they've got more spears than we do." },
      },
      choices = {
        { text = "Then the treasure hunt found the wrong owners.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mate = {
      lines = {
        { id = "mt_default", text = "Everything the captain doesn't, friend. I count the stores, I set the watches, I keep Lolo fed and the Professor away from the powder, and I write it all down so there's a record when someone asks what went wrong." },
      },
      choices = {
        { text = "How is Captain O'Breen bearing up?", next = "mate_obreen" },
        { text = "And Captain Steelgut?", next = "mate_steelgut" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mate_obreen = {
      lines = {
        { id = "mo_default", text = "Shakes is Shakes. He laughs loud and he drinks a little more than he did, and he walks the deck at night when he thinks I'm asleep. He'll get us home, though, because he's never yet left a crew behind, and I've checked the books." },
      },
      choices = {
        { text = "A captain who walks the deck is still on watch.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mate_steelgut = {
      lines = {
        { id = "ms_default", text = "He lost his ship and every hand on it, and he washed up alone. I put him on the roster as a passenger so nobody gives him orders, and I've told the crew that the first one who mentions the Maiden's Folly near him goes on half rations." },
      },
      choices = {
        { text = "You run a kinder ship than you let on.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cost = {
      big = true,
      lines = {
        { id = "co_default", text = "Two ships, two crews, the cargo, the Professor's first machine, and about forty barrels of everything. I've a column for the dead as well, pal, and I don't put a number in it, because I couldn't make it come out to anything I'd sign." },
      },
      choices = {
        { text = "Some losses don't belong in a ledger. Leave it blank.", next = "BACK", reply = "Yeah. That's what I figured, too.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Every loss has a price. Seahorn will want it.", next = "BACK", reply = "He will, and I'll give him the ships and the cargo to the copper. The rest he can ask me to my face.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_swim = {
      lines = {
        { id = "xw_default", text = "Now you're talking! The Folly's the nearer mast and the Silverpine's the one leaning. Go in from the rocks on the north side, where the current does half the swimming for you, and the cabins are aft on both." },
      },
      choices = {
        { text = "North rocks, aft cabins. I have it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_rogue = {
      lines = {
        { id = "xr_default", text = "I'll bet you are, and I'm not asking where you learned. The boxes are Booty Bay work, three tumblers and a false keyhole, so don't waste your breath on the one in the middle. Bring them up shut, if it's all the same to you." },
      },
      choices = {
        { text = "Shut they'll stay. You have my word.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_goblin = {
      lines = {
        { id = "xg_default", text = "Not yet, and I'd like to send good news with the bad. 'Lost two ships' reads a whole lot better with 'recovered all charts and found the treasure' written underneath it, and I've only got the first line so far." },
      },
      choices = {
        { text = "Then let's get you a second line.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    naga = { { id = "tp_naga", text = "Daggerspine, the Professor calls them. They came up out of that temple the night we struck, and they've been on the shore ever since, which is bad for morale and worse for salvage." } },
    booty_bay = { { id = "tp_bb", text = "Home, pal, and I'd give a month's share to smell the fish market again. The Raiders sail for Fleet Master Seahorn out of there, and the Baron takes his cut of everybody." } },
    _none = { { id = "tp_none", text = "That's not in my books, friend, and if it's not in my books I can't put a price on it." } },
  },
}

-- Hammon Karwn: human trade goods vendor at Refuge Pointe, titled Superior Tradesman.
P:NPC {
  key = "ar_karwn", id = TODO_NPC("Hammon Karwn"), name = "Hammon Karwn", title = "Superior Tradesman",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "refuge_pointe" }, temper = { "proud", "genial" }, values = { "trade", "practical" },
  notices = { "craft", "race" },

  impression = {
    first = "Hammon Karwn sells trade goods from a tent at Refuge Pointe and insists on being called a superior tradesman. His stock is ordinary, but he has it when nobody else in the Highlands does.",
    third = "{name} met Hammon Karwn, who sells trade goods to the camp at Refuge Pointe.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my favourite customer! I've a fresh load just in over the Thandol Span, and you get first pick." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. You'll pay full price, and I'll not be hearing any haggling." },
    { id = "g_default", text = "Thread, flux, vials and dye, friend, and every bit of it carried over the Thandol Span on my own mule." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I thought you might be, since there's no one else to buy from." },
    { id = "g_craft", when = { profession = { "Tailoring", "Blacksmithing", "Leatherworking", "Alchemy", "Engineering" } }, text = "A craftsman! Then you'll appreciate a tradesman who keeps the right goods dry." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, and you'll have crossed Dun Modr to get here, or flown over it. Tell me the bridge still stands, because my next shipment depends on it." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You've a tailor's eye, and it went straight to the dyes. They're true colours, I promise you, not the Southshore stuff that runs." },
    { id = "n_engineer", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer. I've flux and I've coal, but please do your mixing on the far side of the camp." },
  },

  start = "hello",
  nodes = {
    w2_odd = {
      lines = {
        { id = "w2_odd_l", text = "A gentleman from Dalaran wanted a pound of owlbeast feathers, plucked by moonlight. I sold him a pound of buzzard feathers plucked at noon, and he seemed perfectly happy with them." },
      },
      choices = {
        { text = "You cheated a mage?", next = "w2_odd2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_odd2 = {
      lines = {
        { id = "w2_odd2_l", text = "Cheated is a strong word, friend. I sold him feathers, and he wanted feathers, and nobody can tell the moon from the sun on a feather. If his spell went wrong, it'll have been his spelling." },
      },
      choices = {
        { text = "You should have told him the truth.", next = "BACK", reply = "Perhaps. My mother would have agreed with you, and she never made a copper in her life.", fx = { align = { honor = 1 } } },
        { text = "A fool and his gold, as they say.", next = "BACK", reply = "Just so, friend. I'd not have put it so plainly myself, but I'll not argue the point either.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_horde = {
      lines = {
        { id = "w2_horde_l", text = "Never, and don't say it so loudly. Captain Nials would have my tent down and my mule confiscated before supper. The orcs at Hammerfall have their own traders, and they're welcome to them." },
      },
      choices = {
        { text = "Never once?", next = "w2_horde2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_horde2 = {
      lines = {
        { id = "w2_horde2_l", text = "Well, there was a goblin who came through with a cart of flux from Booty Bay, and I bought it, and I didn't ask where he'd stopped on his way. A goblin's coin is the same colour as anyone's." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hammon Karwn, superior tradesman, at your service. Anything a craftsman needs to keep working in the field, I have, and what I haven't got is on its way from Menethil." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Hammon Karwn, tradesman, and I'd keep walking if I were you. The Captain's men are less patient than I am, and I am not very patient." },
      },
      again = {
        { id = "h_again", text = "What else can I find you, friend? There's more under the counter than on it." },
        { id = "h_again2", text = "Go on, friend. Talk is free, though little else here is." },
        { id = "h_again3", text = "Yes? I've the afternoon, and you've the look of a customer." },
      },
      choices = {
        { text = "A trader should sell dry goods honestly, and say when they're damp.", next = "BACK", reply = "Exactly, friend, and that's why my mule carries a tarpaulin and my name carries weight.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the damp flux at full price. Nobody else is selling here.", next = "BACK", reply = "They'd buy it once, and then they'd hang my mule from the wall, and rightly.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "What makes a tradesman superior?", next = "superior" },
        { text = "It's a long road to bring goods up here.", next = "road" },
        { text = "Who buys from you in a soldiers' camp?", next = "buyers" },
        { text = "What sells best to a tailor up here?", next = "x_tailor", when = { profession = "Tailoring" } },
        { text = "Does Ironforge trade this far north?", next = "x_dwarf", when = { race = { "Dwarf", "Gnome" } } },
        { text = "What's the strangest thing you've been asked to stock?", next = "w2_odd" },
        { text = "Do you ever trade with Hammerfall?", next = "w2_horde" },
        { text = "Good day, Hammon.", next = "END" },
      },
    },
    superior = {
      lines = {
        { id = "su_default", text = "Being here, friend. Any fool can sell thread in Stormwind, where there's a shop on every corner. It takes a superior sort to sell it under a cliff in the Highlands with ogres on one side and the Syndicate on the other." },
      },
      choices = {
        { text = "You gave yourself the title, then.", next = "superior_title" },
        { text = "Courage is a kind of quality, I'll grant.", next = "superior_title" },
        { text = "Something else.", next = "BACK" },
      },
    },
    superior_title = {
      lines = {
        { id = "st_default", text = "I painted it on the sign myself, and nobody in the camp has argued. Captain Nials read it, grunted, and bought a spool of thread for her tabard, which I took as a commission." },
      },
      choices = {
        { text = "A grunt from the Captain is high praise.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    road = {
      lines = {
        { id = "rd_default", text = "Menethil Harbor to Dun Modr, over the Thandol Span, and then up the Highlands road with one eye on the hills. The Dark Irons have made the bridge a misery, and the Syndicate like to collect a toll further on that nobody voted for." },
      },
      choices = {
        { text = "Have you been robbed on it?", next = "road_robbed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_robbed = {
      big = true,
      lines = {
        { id = "rr_default", text = "Twice. The first time they took the mule's whole load, and the second time I paid them a little to leave the rest. I'm not proud of it, but the camp had its flux that week, and it wouldn't have otherwise." },
      },
      choices = {
        { text = "You fed the camp. I'd have paid them too.", next = "BACK", reply = "That's how I reckon it. A tradesman's first duty is to arrive.", fx = { align = { honor = -1 } } },
        { text = "Paying bandits only buys more bandits.", next = "BACK", reply = "So Captain Nials told me, and at some length. He's right, and I'd still do it again with an empty forge waiting.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "by_default", text = "More than you'd think. Jannos Ironwill takes my coal and flux for the forge, Androd Fadran takes salt for his hides, and Drovnar Strongbrew buys vials by the crate. Vikki Lonsav and I split the rest between us without ever quite discussing it." },
      },
      choices = {
        { text = "You and Vikki sell side by side?", next = "buyers_vikki" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_vikki = {
      lines = {
        { id = "bv_default", text = "She has the bread, the waterskins and the bedrolls, and I have what goes into making things. If a soldier asks me for rations, I point to her tent, and she sends the crafters to mine. It's the nearest thing to a guild we've got." },
      },
      choices = {
        { text = "A small camp can't afford a feud.", next = "BACK", fx = { affinity = 1 } },
        { text = "Let me see what goes into making things.", next = "BUSINESS" },
      },
    },
    x_tailor = {
      lines = {
        { id = "xt_default", text = "Thread, and then more thread, because the wind up here finds every seam. I'd take the heavy silken if I were you, and a pot of dye, since the League likes its colours bright and its tabards mended." },
      },
      choices = {
        { text = "Heavy silken and dye, then.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_dwarf = {
      lines = {
        { id = "xd_default", text = "It does, through me, and I've no complaints of Ironforge goods except the price of carrying them. Half my coal is from your mountain, and Jannos says he can tell the difference with his eyes shut." },
      },
      choices = {
        { text = "Any dwarf could. It's good coal.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    refuge_pointe = { { id = "tp_rp", text = "A camp under a cliff, and all that's left of Stromgarde's ground outside the city walls. It isn't much, but it's well kept, and it pays its bills." } },
    _none = { { id = "tp_none", text = "I couldn't say, friend. I deal in thread and flux, and news is Cedrik's line of work." } },
  },
}

-- Androd Fadran: human leatherworking supplies vendor at Refuge Pointe.
P:NPC {
  key = "ar_fadran", id = TODO_NPC("Androd Fadran"), name = "Androd Fadran", title = "Leatherworking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "refuge_pointe" }, temper = { "quiet", "steady" }, values = { "craft", "patient" },
  notices = { "craft", "class", "pet" },

  impression = {
    first = "Androd Fadran sells leatherworking supplies at Refuge Pointe and smells of salt and tannin. He talks about hides the way other men talk about horses, and he knows every beast in the Highlands by its skin.",
    third = "{name} met Androd Fadran, who supplies the leatherworkers at Refuge Pointe.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hello again. I've a new batch of curing salt in, and I kept the finest of it back for you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. The racks are full, and so is my patience. Buy, or leave." },
    { id = "g_default", text = "Salt, thread and dye for the leather trade. Have a look, and mind the drying racks behind you." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. The racks are full today, so I hope you've come to buy and not to sell." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker, by your hands. Good, I'll not need to explain what curing salt is for." },
  },

  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "That's a skinning knife worn thin with honing. You'll have found the raptors up here, then, and their hides are worth the trouble." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. If you take a beast up here, take the hide off it too, because I hate to see the buzzards get good leather." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "That's a fine animal, and I mean that as a man who admires them alive as well. {pet} needn't look at my racks like that." },
  },

  start = "hello",
  nodes = {
    w2_cure = {
      lines = {
        { id = "w2_cure_l", text = "Under canvas, with the flaps tied down and a stone on every corner. The wind here dries a hide too fast, and a hide dried too fast cracks like old bark. You want it to take its time, like good cheese." },
      },
      choices = {
        { text = "And when it rains?", next = "w2_cure2" },
        { text = "I'll look him up when the cask arrives.", next = "BACK" },
      },
    },
    w2_cure2 = {
      lines = {
        { id = "w2_cure2_l", text = "Then I bring the racks inside the tent and sleep among them, which is why I smell the way I do. Nobody shares my tent, and I've stopped asking anyone to." },
      },
      choices = {
        { text = "I'll look him up when the cask arrives.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Androd Fadran. I keep the leatherworkers of the Pointe in salt, thread and dye, and I cure a few hides of my own when the weather holds. The Highlands are good country for it, if you can keep your scalp." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Androd Fadran. Your people have a man called Tunkk at Hammerfall who sells what I sell, and you'd be safer buying it there." },
      },
      again = {
        { id = "h_again", text = "Something else? I'm in no hurry, and neither are the hides." },
        { id = "h_again2", text = "Go on. The hides won't cure any faster for my watching them." },
        { id = "h_again3", text = "Aye? Ask away." },
      },
      choices = {
        { text = "A tanner should be honest about how well a hide was cured.", next = "BACK", reply = "Aye. A badly cured hide will rot on your back, and I'll not sell such a thing.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Rush the curing and sell the hides fast. Profit's profit.", next = "BACK", reply = "Then you'll sell a rotten jerkin once, and nobody will buy from you again.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What hides do the Highlands give you?", next = "hides" },
        { text = "A soldiers' camp must go through a lot of leather.", next = "camp" },
        { text = "You said a man has to keep his scalp.", next = "danger" },
        { text = "Which hide here is hardest to take off whole?", next = "x_skin", when = { profession = { "Skinning", "Leatherworking" } } },
        { text = "Where should a hunter look for good pelts?", next = "x_hunter", when = { class = "HUNTER" } },
        { text = "Who else keeps Refuge Pointe supplied?", next = "af_neigh" },
        { text = "Does the League of Arathor have a hope here?", next = "af_league" },
        { text = "How do you cure a hide in all this wind?", next = "w2_cure" },
        { text = "Good day, Androd.", next = "END" },
      },
    },
    af_neigh = {
      lines = {
        { id = "af_neigh_1", text = "Hammon Karwn trades the cloth and the metal, and Drovnar Strongbrew sells the alchemists their vials, and between the three of us we keep the craftsmen in work. The soldiers come to us for everything they can't get from the quartermaster, which is most things." },
      },
      choices = {
        { text = "Drovnar's a dwarf among humans, then.", next = "af_drovnar" },
        { text = "Three traders for a whole camp. Thin pickings.", next = "BACK", reply = "Thin, but steady, and steady's what a camp needs." },
      },
    },
    af_drovnar = {
      lines = {
        { id = "af_drovnar_1", text = "He is, and he says the Highlands remind him of nothing at all, which he means as a compliment. He's a good neighbour, quiet and sober, at least until the supply wagon brings in a cask from Ironforge." },
      },
      choices = {
        { text = "I'll look him up when the cask arrives.", next = "BACK" },
        { text = "Quiet and sober is rare in a soldier's camp. Something else.", next = "BACK" },
      },
    },
    af_league = {
      lines = {
        { id = "af_league_1", text = "Field Marshal Oslight thinks so, and he's not a man given to foolish hopes. The League wants to take back the farms and the mills that the Syndicate and the Horde have taken, and every soldier here is a farmer's son who'd like his father's land back." },
      },
      choices = {
        { text = "Is it working?", next = "af_working" },
        { text = "I'm from Lordaeron too. Arathor was our root.", next = "af_working", when = { race = "Human" } },
        { text = "A camp of farmers' sons. That's a hard army.", next = "BACK" },
      },
    },
    af_working = {
      lines = {
        { id = "af_working_1", text = "Slowly, a field here and a fence there, and then the ogres or the Witherbark take it back. But Refuge Pointe still stands, and the wall's been rebuilt twice since I came, so I'd say we're winning, if you squint." },
      },
      choices = {
        { text = "Squinting is how wars are won.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Androd.", next = "BACK" },
      },
    },
    hides = {
      lines = {
        { id = "hi_default", text = "Raptor, mostly, which is tough, scaled and takes a dye beautifully. Then there's buzzard for trim, and spider silk from the cave crawlers, if you count that, which the tailors do. I'd give a good deal for a whole hide off one of the big Highland striders, but they don't hold still." },
      },
      choices = {
        { text = "Raptor leather. Who wears that?", next = "hides_raptor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides_raptor = {
      lines = {
        { id = "hr_default", text = "Scouts, when they can get it, because it turns a blade and doesn't creak. Half the League's skirmishers in the Basin are wearing Highland raptor on their shoulders, and they've no notion a quiet man in a tent salted it for them." },
      },
      choices = {
        { text = "The quiet work is still the work.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "ca_default", text = "Straps, mostly. Sword belts, shield straps, saddle girths for Cedrik's gryphons, and boots, always boots. Samuel Hawke hands out the fine armour to the Basin's soldiers, and when it comes back cut to ribbons, somebody has to restitch it." },
      },
      choices = {
        { text = "And that somebody buys from you.", next = "camp_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_who = {
      lines = {
        { id = "cw_default", text = "They do, and so does every soldier who can hold an awl. Hammon Karwn sells me salt by the sack, Jannos makes my needles, and I sell on to the rest. In a camp this small, every copper goes round three times before it leaves." },
      },
      choices = {
        { text = "Then let mine go round as well.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      big = true,
      lines = {
        { id = "da_default", text = "I meant it plainly. The Witherbark trolls to the east take heads, the Boulderfist ogres to the west take everything, and the Syndicate hold Stromgarde's streets. I go out for hides with two of the Captain's men or not at all." },
      },
      choices = {
        { text = "No hide is worth a life. You're right to wait.", next = "BACK", reply = "So my wife said, in her last letter, and she underlined it.", fx = { align = { order = 1 } } },
        { text = "A craftsman who waits on escorts makes little.", next = "BACK", reply = "And one who doesn't makes nothing at all, after the first trip. I'll keep my escorts.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_skin = {
      lines = {
        { id = "xs_default", text = "The raptor, without question. The scales run one way along the back and another on the flanks, so a careless cut tears across the grain. Start behind the jaw and follow the spine, and don't hurry the tail." },
      },
      choices = {
        { text = "Behind the jaw, along the spine. Thank you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_hunter = {
      lines = {
        { id = "xh_default", text = "The raptors range the hills south and east of here, toward Witherbark Village, and the buzzards circle anything that's died. Keep clear of the stone circles, though. There are elementals about them that no arrow will trouble." },
      },
      choices = {
        { text = "South and east, and clear of the circles.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    refuge_pointe = { { id = "tp_rp", text = "It's a camp, and a good one, as camps go. Captain Nials keeps it in order, and nobody goes short of work." } },
    _none = { { id = "tp_none", text = "I don't know much beyond hides, I'm afraid. Captain Nials is the one to ask." } },
  },
}

-- Drovnar Strongbrew: dwarf alchemy supplies vendor at Refuge Pointe.
P:NPC {
  key = "ar_strongbrew", id = TODO_NPC("Drovnar Strongbrew"), name = "Drovnar Strongbrew", title = "Alchemy Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "refuge_pointe" }, temper = { "hearty", "stubborn" }, values = { "craft", "generous" },
  notices = { "craft", "race", "drink" },

  impression = {
    first = "Drovnar Strongbrew sells vials and alchemists' supplies at Refuge Pointe, and plainly wishes they were kegs. He is loud, fond of the camp, and convinced that a healing draught and a good ale are cousins.",
    third = "{name} met Drovnar Strongbrew, the dwarf who supplies alchemists at Refuge Pointe.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, an' welcome! I've a crate o' vials in that's clean as a priest's conscience an' twice as clear." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Buy yer vials an' dinnae drop any on the way out, for I'll no' replace them." },
    { id = "g_default", text = "Vials, flasks an' all an alchemist needs, {g:lad|lass}! Step up, they'll no' bite." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, are ye? Good, I've fresh vials in, an' not a crack in the crate." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "An alchemist! Now there's a customer who knows a good flask from a bad one." },
    { id = "g_drunk", when = { drunk = true }, text = "Ye've had a drop already, I see. Steady hands before ye touch the glass, if ye please." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Thank the stone, someone who'll understand me when I complain about the ale up here." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "Yer fingers are stained three colours, an' one o' them's swiftthistle. Ye've been busy, an' I approve." },
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "A herb gatherer, by the satchel. The Highlands are full o' goldthorn an' fadeleaf, if ye can pick faster than the raptors can run." },
  },

  start = "hello",
  nodes = {
    w2_brew = {
      lines = {
        { id = "w2_brew_l", text = "A wee batch behind the tent, in a keg I carried up on my own back. It's made wi' Highland barley an' rainwater, an' it's terrible, but it's mine, an' it's the only ale for thirty miles." },
      },
      choices = {
        { text = "Can I try some?", next = "w2_brew2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_brew2 = {
      lines = {
        { id = "w2_brew2_l", text = "Ye can, if ye promise no' tae tell Captain Nials, for he thinks I'm keepin' lamp oil in it. An' ye'll no' make a face, for I've had enough faces made at it already." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_home = {
      lines = {
        { id = "w2_home_l", text = "The Great Forge still burns an' the King still frets about his brother's lot in the Searing Gorge. Every letter my cousin sends ends the same: when are ye comin' home, ye great fool?" },
      },
      choices = {
        { text = "And when are you going home?", next = "w2_home2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_home2 = {
      lines = {
        { id = "w2_home2_l", text = "When Stromgarde's back on its feet, or when somebody up here learns tae brew. I'm no' holdin' my breath for either, but I'm a dwarf, an' we're a patient folk when we're stubborn." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Drovnar Strongbrew, an' aye, wi' a name like that I should be sellin' ale. Instead I sell the glass that potions go in, an' I tell myself it's near enough the same trade." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Drovnar Strongbrew, cousin, late o' Ironforge an' later o' this windy rock. I sell vials tae alchemists, an' I'd sell my beard for a proper Thunderbrew lager." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Drovnar Strongbrew, an' I've nothin' for the Horde but a hard look. Away wi' ye, before the Captain's lads take an interest." },
      },
      again = {
        { id = "h_again", text = "What else, then? I've time, an' nae ale tae fill it." },
        { id = "h_again2", text = "Go on, {g:lad|lass}. I've one ear for you an' one for the wind, an' the wind's no' sayin' much." },
        { id = "h_again3", text = "Aye? Speak up over the wind." },
      },
      choices = {
        { text = "An alchemist should sell sound glass, without hidden cracks.", next = "BACK", reply = "Aye, for a cracked vial's worse than nae vial, an' it'll leak on yer best boots.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the cracked vials cheap. Let the buyer beware.", next = "BACK", reply = "Let the buyer beware o' ye, more like, for I'll no' have that in my shop.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "A Strongbrew, selling empty bottles?", next = "name" },
        { text = "Who needs potions most in this camp?", next = "camp" },
        { text = "What's a dwarf doing in Stromgarde's war?", next = "why" },
        { text = "What grows in the Highlands worth brewing?", next = "x_alch", when = { profession = { "Alchemy", "Herbalism" } } },
        { text = "How does a dwarf stand the ale up here, cousin?", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "Do you brew anything yourself, up here?", next = "w2_brew" },
        { text = "What do you hear from Ironforge?", next = "w2_home" },
        { text = "Good day, Drovnar.", next = "END" },
      },
    },
    name = {
      lines = {
        { id = "na_default", text = "I've heard that one more often than I've had hot dinners. My father brewed, an' his father, an' I've the nose for it but no' the patience. A potion's done in an hour, an' a good stout wants a season, so I went where the quick work was." },
      },
      choices = {
        { text = "Is brewing so different from alchemy?", next = "name_same" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_same = {
      big = true,
      lines = {
        { id = "ns_default", text = "No' so different as the alchemists like tae think! Clean water, good herbs, the right heat an' a clean vessel. The difference is that nobody ever sang a song about a healin' potion, an' that tells ye which the world loves better." },
      },
      choices = {
        { text = "The potion saves the life. That matters more.", next = "BACK", reply = "Aye, aye, I'll grant ye that, an' it's why I'm here an' no' in a tavern cellar.", fx = { align = { order = 1 } } },
        { text = "The ale makes the life worth saving.", next = "BACK", reply = "Hah! Spoken like kin. I'll drink tae that the day a keg makes it over the Span.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "cp_default", text = "The Basin's wounded, first an' always. Every soldier who comes back from that valley on a litter gets a draught before he gets a bed. After them it's Captain Nials' patrols, an' the gryphon riders, who drink swiftness potions like water." },
      },
      choices = {
        { text = "Who brews, if you only sell the glass?", next = "camp_brew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_brew = {
      lines = {
        { id = "cb_default", text = "Whoever can. Apprentice Kryten knows a little, bein' a mage's lad, an' half the soldiers have learned tae boil peacebloom in a helmet. I sell them the vials, an' Hammon Karwn sells them what else they need, an' between us the camp stays on its feet." },
      },
      choices = {
        { text = "Peacebloom in a helmet. That's soldiering.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Then I'd best stock up too.", next = "BUSINESS" },
      },
    },
    why = {
      lines = {
        { id = "wy_default", text = "The same as half the dwarves ye'll meet north o' the Span. Stromgarde stood wi' us in the Second War when the Horde came for Khaz Modan, an' a dwarf pays what he owes. Besides, the League o' Arathor pays in coin, an' on time." },
      },
      choices = {
        { text = "Do you think they'll take the city back?", next = "why_city" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_city = {
      lines = {
        { id = "wc_default", text = "No' this year, {g:lad|lass}, an' I'll no' lie tae ye. There's Syndicate in one quarter an' ogres in another, an' the Prince holds a corner o' his own keep. But they said Ironforge couldnae hold either, once, an' here we are." },
      },
      choices = {
        { text = "Stubbornness has held worse places.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_alch = {
      lines = {
        { id = "xa_default", text = "Goldthorn on the hillsides, fadeleaf in the shade o' the old walls, an' khadgar's whisker up near the farms, if the Syndicate havenae trampled it. Kingsblood too, lower down. It's a fine larder for a brewer o' potions." },
      },
      choices = {
        { text = "Then I'll need vials to fill.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_dwarf = {
      lines = {
        { id = "xd_default", text = "Badly, cousin, badly. What the humans call ale here would be sent back in Kharanos as dishwater. I've written tae my brother in Ironforge for a keg, an' I check every gryphon that lands in case Cedrik's carryin' it." },
      },
      choices = {
        { text = "I'll raise a mug for you in Ironforge.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    refuge_pointe = { { id = "tp_rp", text = "A cold camp wi' a warm heart, an' nae brewery. Captain Nials runs it well, an' I'd follow her further than I'd follow most humans." } },
    _none = { { id = "tp_none", text = "Ye've got me there, {g:lad|lass}. Ask me about glass or about ale, an' I'm yer dwarf." } },
  },
}

-- Graud: orc general goods vendor at Hammerfall.
P:NPC {
  key = "ar_graud", id = TODO_NPC("Graud"), name = "Graud", title = "General Goods",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "hammerfall" }, temper = { "steady", "gruff" }, values = { "practical", "loyal" },
  notices = { "race", "weary" },

  impression = {
    first = "Graud sells general goods at Hammerfall and has an answer ready for whatever a warrior forgot to pack. He is an old campaigner who thinks most deaths begin with an empty waterskin.",
    third = "{name} met Graud, who sells general goods at Hammerfall.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You return, and you forgot nothing this time. I am almost disappointed, but I am glad to see you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Buy what you forgot, and do not waste my time with talk." },
    { id = "g_default", text = "Food, water, rope and bags. Tell me what you forgot, and I will sell it to you." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, so you forgot something else. It is always so." },
    { id = "g_orc", when = { race = "Orc" }, text = "Throm-ka, warrior. Check your pack before you march, and buy what is missing." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You come back torn and thirsty, and you went out the same way. Next time buy the waterskin first and the glory second." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear. Our shaman Tor'gan is one of yours, and he buys more rope than any three orcs, though he will not say why." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. I have bags, but none made for shoulders like those, so you must let out the straps yourself." },
  },

  start = "hello",
  nodes = {
    w2_march = {
      lines = {
        { id = "w2_march_l", text = "That the wagons win more battles than the warriors will admit. We left the camps with nothing, and Thrall's army ate because old orcs like me knew how to find grain the humans had hidden." },
      },
      choices = {
        { text = "You raided the human farms?", next = "w2_march2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_march2 = {
      lines = {
        { id = "w2_march2_l", text = "We took what we needed to live, and no more. Thrall's word was that we take food, not lives, and most of us kept it. I am not ashamed of that hunger, and I will not apologise for it." },
      },
      choices = {
        { text = "Taking only what you needed was the honourable way.", next = "BACK", reply = "It was. A starving warrior who still holds to his word is worth ten fat ones.", fx = { align = { honor = 1 } } },
        { text = "The humans owed you more than grain.", next = "BACK", reply = "Maybe. But a debt paid in blood is never paid, only passed on to the young.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_chest = {
      lines = {
        { id = "w2_chest_l", text = "Waterskins. Good ones, sealed with pitch, that I keep for the scouts who go east toward the Witherbark. I will not sell them to a grunt who will lose one in a week." },
      },
      choices = {
        { text = "Why not?", next = "w2_chest2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2_chest2 = {
      lines = {
        { id = "w2_chest2_l", text = "Because the scouts drink from them in country where there is no other water. A grunt can walk back to the well. A scout who loses his skin out there does not walk back at all." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Graud. I sell the things a warrior needs and does not think of until he is two days from a fort, and I have sold them in more camps than this one." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "I am Graud, and I do not sell to the Alliance. Go back down the road while Gor'mul's guards are still only watching you." },
      },
      again = {
        { id = "h_again", text = "What else? Speak." },
        { id = "h_again2", text = "Go on. I have stock to count, but I can count and listen." },
        { id = "h_again3", text = "More questions? Good, a warrior who asks lives longer." },
      },
      choices = {
        { text = "A trader of the Horde sells fair to every warrior.", next = "BACK", reply = "Yes. That is the way of the Horde, and that is my way.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell high to the humans who wander in. They deserve it.", next = "BACK", reply = "Humans do not wander into Hammerfall, and if they do, they do not live to shop.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "What do warriors forget most?", next = "forget" },
        { text = "You've kept stores in other camps.", next = "camps" },
        { text = "Hammerfall seems well supplied for a border fort.", next = "supply" },
        { text = "What should an orc carry into these hills?", next = "x_orc", when = { race = "Orc" } },
        { text = "I travel light. What can't I do without?", next = "x_light", when = { class = { "ROGUE", "HUNTER", "DRUID" } } },
        { text = "What did the march out of Lordaeron teach you?", next = "w2_march" },
        { text = "What's in that locked chest behind you?", next = "w2_chest" },
        { text = "Strength and honour, Graud.", next = "END" },
      },
    },
    forget = {
      lines = {
        { id = "fg_default", text = "Water. They remember the axe, the whetstone and the trophy sack, and they walk into the Highlands with one skin of water and a head full of songs. The hills are dry between the farms, and the ogres do not share their wells." },
      },
      choices = {
        { text = "And after water?", next = "forget_next" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forget_next = {
      lines = {
        { id = "fn_default", text = "A second bag, because a warrior who wins brings back more than he took. Then rope, and food that keeps. Uttnar's meat is good tonight and bad in three days, so buy his for the fire and mine for the road." },
      },
      choices = {
        { text = "Sound counsel. Let me see the road food.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camps = {
      lines = {
        { id = "cm_default", text = "I carried stores for the Warchief's march out of Lordaeron, when we broke the camps one by one, and I kept them at the landing in Durotar after. A Horde that is fed and shod can go anywhere, and one that is not goes nowhere, however brave." },
      },
      choices = {
        { text = "You were there when this camp was broken?", next = "camps_here" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camps_here = {
      big = true,
      lines = {
        { id = "ch_default", text = "I was behind the lines with the wagons, and I heard it more than saw it. Doomhammer fell on this ground, and Thrall took up his hammer and his armour before the dust settled. I have sold bread here ever since, and I do not sell it lightly." },
      },
      choices = {
        { text = "The ones behind the wagons won that day too.", next = "BACK", reply = "Hm. Few say so. I will remember that you did.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Glory belongs to those who held the axes.", next = "BACK", reply = "So it does, and I have never claimed otherwise. But they ate my bread before they held them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply = {
      lines = {
        { id = "sp_default", text = "It is, because Drum Fel sees to it. The wind riders bring what is small and the caravans from Tarren Mill bring what is heavy, and Keena and I divide it. She takes the trade goods, and I take what a soldier eats and carries." },
      },
      choices = {
        { text = "Who else trades inside the walls?", next = "supply_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply_who = {
      lines = {
        { id = "sw_default", text = "Mu'uta makes bows, Tunkk and Jun'ha sell to those who work leather and cloth, and Slagg and Uttnar argue over meat. The dead ones have their own quartermaster, Twing, who writes down everything and smiles at nothing." },
      },
      choices = {
        { text = "A fort with its own market. Not bad.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_orc = {
      lines = {
        { id = "xo_default", text = "Two skins of water, dried meat for four days, a spare bowstring even if you carry no bow, and a bandage you can tie with one hand. The humans of Stromgarde ride the roads, so leave the road when you hear hooves." },
      },
      choices = {
        { text = "Dabu. I'll pack as you say.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_light = {
      lines = {
        { id = "xl_default", text = "Then carry little, but carry the right little: water, a flint, and one bag that is empty. The ones who travel light and come back rich are the ones who left room." },
      },
      choices = {
        { text = "An empty bag. I hadn't thought of it.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    hammerfall = { { id = "tp_hf", text = "It was a prison of the humans, and Doomhammer died breaking it. Now it is ours, and it is named for him, and I keep it fed." } },
    _none = { { id = "tp_none", text = "I do not know. Ask Drum Fel, who knows what happens in these hills." } },
  },
}

-- Mu'uta: orc bowyer at Hammerfall.
P:NPC {
  key = "ar_muuta", id = TODO_NPC("Mu'uta"), name = "Mu'uta", title = "Bowyer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "hammerfall" }, temper = { "patient", "proud" }, values = { "craft", "honor" },
  notices = { "class", "kit", "pet" },

  impression = {
    first = "Mu'uta makes and sells bows at Hammerfall and tests each one on the wall before he will part with it. He has no patience for hunters who blame the bow.",
    third = "{name} met Mu'uta, the bowyer of Hammerfall.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You return, and your bow has held. That pleases me, for it is my work in your hands." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Look, do not touch, and do not insult my bows by haggling." },
    { id = "g_default", text = "Bows and arrows. Every one is strung by my hand and shot by my hand before it is sold." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Has the string held? Show me." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Good. Let me see how you hold a bow before I sell you one." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Your draw arm is thicker than the other. You have shot for years, and you will know good work when it is in your hand." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} watches my hands and not my face. That is a beast that has hunted beside a bow, and learned where the danger comes from." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll. Your people throw axes and spears, and throw them well, but I will show you what a string can do that an arm cannot." },
  },

  start = "hello",
  nodes = {
    w2_shoot = {
      lines = {
        { id = "w2_shoot_l", text = "The buzzards that come for Slagg's racks. He pays me a copper for each one I bring down, and then he cooks it, so he wins twice. I think he cheats me, but I enjoy the practice." },
      },
      choices = {
        { text = "How many have you shot?", next = "w2_shoot2" },
        { text = "A bow from a fence post is a hard lesson.", next = "BACK" },
      },
    },
    w2_shoot2 = {
      lines = {
        { id = "w2_shoot2_l", text = "Three hundred and eleven this summer, and I missed perhaps forty. Slagg says I have cost him a fortune, but I have seen his face when the racks are full, and he is not suffering." },
      },
      choices = {
        { text = "A bow from a fence post is a hard lesson.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Mu'uta, bowyer of Hammerfall. The warriors here laugh at bows until an ogre is charging them across open ground, and then they come to me, and I do not laugh at them." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "I am Mu'uta, bowyer of Hammerfall. Put down the bow you carry and try the pull of mine, hunter, and then tell me honestly which you would trust at eighty paces." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "I am Mu'uta, and my bows are for the Horde. The only arrow of mine you will carry out of here is one you did not buy." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk while I wax the string." },
        { id = "h_again2", text = "Ask. A good question is like a good arrow, and it should go straight." },
        { id = "h_again3", text = "Speak, then." },
      },
      choices = {
        { text = "A bow should be sold only when its maker trusts it.", next = "BACK", reply = "That is so. I shoot every bow I sell, for my name goes with it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the warped bows. Hunters can fix them themselves.", next = "BACK", reply = "Then they are not my bows, and you are not a hunter I would sell to.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "What makes a good bow in the Highlands?", next = "make" },
        { text = "The warriors here laugh at bows?", next = "laugh" },
        { text = "You test every bow on the wall.", next = "wall" },
        { text = "What quarry do you send hunters after?", next = "x_hunter", when = { class = "HUNTER" } },
        { text = "A warrior should carry a bow too, you'd say.", next = "x_war", when = { class = { "WARRIOR", "ROGUE" } } },
        { text = "Who taught you to make bows?", next = "mu_taught" },
        { text = "Hunters from Hammerfall hunt what, these days?", next = "mu_hunt" },
        { text = "What do you shoot at, when you're not testing bows?", next = "w2_shoot" },
        { text = "Shoot straight, Mu'uta.", next = "END" },
      },
    },
    mu_taught = {
      lines = {
        { id = "mu_taught_1", text = "An old hunter in the internment camps, who carved bows from fence posts when the guards weren't looking. He said a bow was the only thing the humans let us keep, because they did not think an orc could make one worth fearing." },
      },
      choices = {
        { text = "They were wrong, I take it.", next = "mu_wrong" },
        { text = "I'm an orc. My grandfather spoke of those camps.", next = "mu_wrong", when = { race = "Orc" } },
        { text = "A bow from a fence post is a hard lesson.", next = "BACK" },
      },
    },
    mu_wrong = {
      lines = {
        { id = "mu_wrong_1", text = "They were. He killed a guard with one when Thrall came, at a hundred paces, from the very walls of this place. I keep his first bow unstrung in my tent, and I string it only once a year, on the day Hammerfall was freed." },
      },
      choices = {
        { text = "That's a fine way to remember him.", next = "BACK", fx = { affinity = 1 } },
        { text = "A hundred paces. That's a hunter's shot. Something else.", next = "BACK" },
      },
    },
    mu_hunt = {
      lines = {
        { id = "mu_hunt_1", text = "Raptors in the eastern hills, and the Highland striders, and the mountain lions near Thoradin's Wall. Graud buys the meat and Tunkk buys the hides, so a good hunter can feed the fort and fill his purse in one day." },
      },
      choices = {
        { text = "Tunkk buys every scrap, I hear.", next = "mu_tunkk" },
        { text = "I'll go after the striders.", next = "BACK" },
      },
    },
    mu_tunkk = {
      lines = {
        { id = "mu_tunkk_1", text = "Every scrap and every sinew, and he wastes nothing, not even the teeth. I once saw him make a needle from a raptor's claw, and when I laughed, he sold it to me, and I still use it." },
      },
      choices = {
        { text = "Tunkk sounds like a good trader.", next = "BACK" },
        { text = "A raptor-claw needle. Something else.", next = "BACK" },
      },
    },
    make = {
      lines = {
        { id = "mk_default", text = "Wood that has grown slowly in the wind, which these hills give me, and kodo horn for the belly of the bow, which the caravans carry up from the Barrens. The sinew I take from raptors. A bow made from the land it hunts on shoots truer there, or so my teacher said, and I have not found her wrong." },
      },
      choices = {
        { text = "Who was your teacher?", next = "make_teacher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    make_teacher = {
      lines = {
        { id = "mt_default", text = "An old orc woman in the camps, who had been a hunter on the other world and kept the craft in her head when they took the bows away. She taught me with a stick and a bootlace. Everything I make, I make so that she would not be ashamed of it." },
      },
      choices = {
        { text = "She kept more than a craft alive.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    laugh = {
      big = true,
      lines = {
        { id = "lg_default", text = "Some do. They say a true orc looks his enemy in the eye and uses an axe. I say the hunter who feeds the clan looked his enemy in the eye from a hundred paces, and went home to eat." },
      },
      choices = {
        { text = "A kill at a hundred paces is as honourable as any.", next = "BACK", reply = "Yes. Skill is honour, whatever the distance.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "There's more honour in facing the enemy's blade.", next = "BACK", reply = "Then face it. But carry one of my bows for the day your enemy will not face yours.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wall = {
      lines = {
        { id = "wl_default", text = "Twenty arrows at the old post by the gate, at first light, before the wind rises. If the bow throws left, I unstring it and begin again. Gor'mul's guards have learned not to stand near the post at dawn." },
      },
      choices = {
        { text = "How many do you unstring?", next = "wall_fail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wall_fail = {
      lines = {
        { id = "wf_default", text = "One in three. Tunkk tells me I waste good sinew, and he may be right, but a hunter who buys from me stakes his life on the first shot. I will not sell him a bow I have only hoped about." },
      },
      choices = {
        { text = "Then I'll trust the ones you kept.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_hunter = {
      lines = {
        { id = "xh_default", text = "The raptors of the eastern hills, first, because they are fast and they turn, and they will teach you to lead a shot. Then the buzzards on the wing. When you can take a buzzard from the air, go and find the ogres, who are easier to hit and harder to stop." },
        { id = "xh_pet", when = { pet = { type = "Beast" } }, text = "The raptors of the eastern hills, first, because they are fast and they turn. Send {pet} to hold one while you learn its gait, and then try it with the beast held back. A hunter should know which of them is doing the work." },
      },
      choices = {
        { text = "Raptors, then buzzards, then ogres.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_war = {
      lines = {
        { id = "xw_default", text = "I would. You will not always reach the one who is running to warn his camp, and an arrow will. Buy a plain bow, shoot it badly for a month, and you will still be worth more than you are today." },
      },
      choices = {
        { text = "Fair. Show me a plain bow.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    hammerfall = { { id = "tp_hf", text = "A fort on ground that was a prison. They took our weapons from us here once, and now I make them here. I think of that most mornings." } },
    _none = { { id = "tp_none", text = "I know wood, horn and string. For the rest, ask Drum Fel." } },
  },
}

-- Jun'ha: orc tailoring supplies vendor at Hammerfall.
P:NPC {
  key = "ar_junha", id = TODO_NPC("Jun'ha"), name = "Jun'ha", title = "Tailoring Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "hammerfall" }, temper = { "sharp", "warm" }, values = { "craft", "practical" },
  notices = { "craft", "class", "kit" },

  impression = {
    first = "Jun'ha sells thread, dye and needles at Hammerfall and mends half the fort's banners besides. She has a sharp tongue for warriors who think cloth is beneath them, and a soft spot for anyone who can sew.",
    third = "{name} met Jun'ha, who sells tailoring supplies at Hammerfall.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back so soon, mon? Good, I been savin' a spool of the good thread, de kind dat don't snap in de rain." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it be you. De prices be what dey be, so don't go haggling wit' Jun'ha today." },
    { id = "g_default", text = "Thread, dye and needles. If you tore it, I can sell you what mends it." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon? Either you sew fast or you tear fast." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "A tailor! At last, someone in this fort who will not ask me what a bolt is." },
  },

  notice = {
    { id = "n_cloth", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "You wear cloth into battle, and it has been mended well, twice. Whoever did the second mend used better thread than the first." },
    { id = "n_torn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Look at you, all rags and loose seams. Sit still a moment and tell me what did that, so I know what thread to sell you." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "Those are needle calluses, and old ones. Good, we will understand each other." },
  },

  start = "hello",
  nodes = {
    w2_own = {
      lines = {
        { id = "w2_own_l", text = "A cloak, a little at a time, in the evenings, from the scraps the banners leave. It has every colour the fort has ever flown in it, and some that Gor'mul made me take down." },
      },
      choices = {
        { text = "Which ones did he make you take down?", next = "w2_own2" },
        { text = "A whole banner for a strong fort. Something else.", next = "BACK" },
      },
    },
    w2_own2 = {
      lines = {
        { id = "w2_own2_l", text = "A wolf's head in white, for a clan that some of the grunts belonged to before the camps. He said Hammerfall flies the Horde's colours and no clan's, and he was right, but I kept the cloth." },
      },
      choices = {
        { text = "A whole banner for a strong fort. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Jun'ha, and I keep Hammerfall in thread. The warriors think a fort is made of walls and axes, but every banner on those walls and every tabard under that armour came across my table first." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "I am Jun'ha. Your Defilers buy more black dye from me than the rest of the fort together, and I have stopped asking what is wrong with any other colour." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "I am Jun'ha, and there is nothing here for the Alliance. Leave, before a guard decides your tabard would look better with a hole in it." },
      },
      again = {
        { id = "h_again", text = "What else? I can stitch and talk." },
        { id = "h_again2", text = "Go on, I am listening, and the needle knows its own way." },
        { id = "h_again3", text = "Yes? Ask before I lose count of this hem." },
      },
      choices = {
        { text = "A good tailor should mend what's torn, not just sell new.", next = "BACK", reply = "Ya, mon, dat be true. A good stitch saves more den it costs, and dat be wisdom.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell them new cloth every time. Mending earns nothing.", next = "BACK", reply = "Ha! You be thinkin' like a goblin, mon, but Jun'ha got more pride dan dat.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You mend the fort's banners yourself?", next = "banners" },
        { text = "Where does good cloth come from, out here?", next = "cloth" },
        { text = "The warriors don't think much of your trade.", next = "warriors" },
        { text = "What sells to a tailor in the Highlands?", next = "x_tailor", when = { profession = "Tailoring" } },
        { text = "My robes take a beating. What thread holds?", next = "x_cloth", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "Which banner is hardest to keep whole?", next = "jh_banner" },
        { text = "Where does Hammerfall's cloth come from?", next = "jh_whence" },
        { text = "Do you sew for yourself at all?", next = "w2_own" },
        { text = "Good day, Jun'ha.", next = "END" },
      },
    },
    jh_banner = {
      lines = {
        { id = "jh_banner_1", text = "The great one over the gate, for the wind comes off the hills and tears at it every night. I climbed up there myself once, to stitch the corner, and Gor'mul shouted at me for half an hour, and then thanked me for it the next day." },
      },
      choices = {
        { text = "Gor'mul cares about the banner.", next = "jh_gormul" },
        { text = "I'd not climb that gate in the wind.", next = "BACK", reply = "Nor would I again, but someone had to." },
      },
    },
    jh_gormul = {
      lines = {
        { id = "jh_gormul_1", text = "He does, for it is the first thing the Stromgarde scouts see when they look at this fort. A torn banner tells them we are weak, and a whole one tells them we are not going anywhere, and so I keep it whole." },
      },
      choices = {
        { text = "Then your needle is a weapon too.", next = "BACK", fx = { affinity = 1 } },
        { text = "A whole banner for a strong fort. Something else.", next = "BACK" },
      },
    },
    jh_whence = {
      lines = {
        { id = "jh_whence_1", text = "Wool from the ship to the Undercity, and silk from the spiders in the hills, which the grunts fetch for me when they are bored. The spider silk is better than anything that comes off the boats, though the grunts complain about the bites." },
      },
      choices = {
        { text = "The grunts fetch spider silk for you?", next = "jh_silk" },
        { text = "I'm a tailor. I'd gather silk myself.", next = "jh_silk", when = { profession = "Tailoring" } },
      },
    },
    jh_silk = {
      lines = {
        { id = "jh_silk_1", text = "They do, if I promise to mend their tabards first. The spiders nest in the gorges toward the Drywhisker kobolds' tunnels, and the grunts like the hunting more than they like admitting it." },
      },
      choices = {
        { text = "A good arrangement for everyone.", next = "BACK" },
        { text = "I'll mind the gorges, then. Something else.", next = "BACK" },
      },
    },
    banners = {
      lines = {
        { id = "bn_default", text = "Every one. The wind off the hills shreds them in a season, and Gor'mul will not have a ragged banner on his wall, so I have a new one cut before the old one comes down. The red is hard to keep, because the sun here drinks it." },
      },
      choices = {
        { text = "A banner matters that much to him?", next = "banners_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    banners_why = {
      lines = {
        { id = "bw_default", text = "It matters to all of us, here. This was a place where orcs sat behind walls with nothing of their own, not even a clan's colours. Now the first thing a rider sees from the road is the Horde's banner, whole and bright, and I am the one who keeps it so." },
      },
      choices = {
        { text = "Then your needle guards the fort as well.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth = {
      lines = {
        { id = "ct_default", text = "The wool comes from Tarren Mill with the caravans, and the silk from the spiders in the caves, which the young grunts fetch for me when Drum Fel wants them kept busy. The finest bolts come by wind rider from Orgrimmar, and Urda grumbles at the weight." },
      },
      choices = {
        { text = "Spider silk? From those caves?", next = "cloth_silk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth_silk = {
      lines = {
        { id = "cs_default", text = "It is strong, it is light, and it takes dye better than wool. The grunts come back bitten and complaining, and I tell them a warrior who cannot face a spider should not talk so loudly about ogres. Then I pay them fairly, because I am not cruel." },
      },
      choices = {
        { text = "Sharp words and fair pay. A good bargain.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warriors = {
      big = true,
      lines = {
        { id = "wr_default", text = "They think it is soft work, until the strap of a shoulder plate gives way in a fight and they come to me holding the pieces. I mend it, and I say nothing, and I let them stand there while I do it slowly." },
      },
      choices = {
        { text = "Every craft serves the Horde. They should respect it.", next = "BACK", reply = "They should, and the wise ones do. Tor'gan thanks me every time, and he is the wisest in the fort.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them sneer. Charge them double.", next = "BACK", reply = "Hah! I have thought of it. But a fort that cheats its own warriors does not stand long.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_tailor = {
      lines = {
        { id = "xt_default", text = "Heavy thread, always, and dye in the Horde's red. If you can work the spider silk, I will tell you this: Tunkk, beside me, lines his leather with it, and he pays well for a clean bolt. So do the Defilers, though they want it black." },
      },
      choices = {
        { text = "Then show me the heavy thread.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_cloth = {
      lines = {
        { id = "xc_default", text = "Silken thread, doubled, and waxed where the seam takes the strain at the shoulder. Cloth will never turn an axe, so do not ask it to. Ask it to hold together while you run, and it will." },
      },
      choices = {
        { text = "Doubled and waxed. I'll take some.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    hammerfall = { { id = "tp_hf", text = "A hard fort full of loud warriors, on ground that deserves to be remembered. I keep its banners whole, and that is my part of the watch." } },
    _none = { { id = "tp_none", text = "That I cannot tell you. I know cloth, and Drum Fel knows the rest." } },
  },
}

-- Tunkk: orc leatherworking supplies vendor at Hammerfall.
P:NPC {
  key = "ar_tunkk", id = TODO_NPC("Tunkk"), name = "Tunkk", title = "Leatherworking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "hammerfall" }, temper = { "jovial", "blunt" }, values = { "craft", "thrifty" },
  notices = { "craft", "class", "pet" },

  impression = {
    first = "Tunkk sells salt, thread and dye to Hammerfall's leatherworkers and wastes nothing, not a scrap of hide nor a length of sinew. He is cheerful about it, and loud.",
    third = "{name} met Tunkk, who sells leatherworking supplies at Hammerfall.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ha, you again! Good. I have a fresh batch of thread, and I kept the strongest for you, because you pay fair." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Look, do not touch, and pay before you go. That is all." },
    { id = "g_default", text = "Salt, thread and dye for the leather trade! Come and look, and do not mind the smell, it is the smell of work." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, you again! Good. Did you bring me hides, or only coin? I take both." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker! Come, come, feel this thread and tell me it is not the best you have pulled." },
  },

  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "A skinner, with a clean knife. Bring me nothing with holes in it, and we will be friends for life." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Hunter! Shoot them in the eye, yes? An arrow through the flank is a hole in my leather." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "A fine beast. Do not worry, {pet}, I only take hides from the ones who lose." },
  },

  start = "hello",
  nodes = {
    w2_learn = {
      lines = {
        { id = "w2_learn_l", text = "In the camps, from an old orc who tanned rat skins for the guards' gloves. He was paid in scraps, and the scraps kept him alive, and when he was too old to work he gave the knife to me." },
      },
      choices = {
        { text = "Do you still have the knife?", next = "w2_learn2" },
        { text = "A secret weapon, indeed.", next = "BACK" },
      },
    },
    w2_learn2 = {
      lines = {
        { id = "w2_learn2_l", text = "Here, on my belt. It is a bad knife, a human knife, and the edge does not hold. I have better ones, but I would not trade this one for a raptor hide with the tail on." },
      },
      choices = {
        { text = "A secret weapon, indeed.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tunkk! I sell what a leatherworker needs, and I tan a little myself behind the wall, where Gor'mul has asked me to keep the vats, because of the smell. He is a great warrior with a small nose." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Tunkk, friend tauren! Your people taught the Horde that every part of the kill has a use, and I have built my whole trade on it, so sit, you are welcome here." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Tunkk, and I sell nothing to the Alliance. Go, before I begin to wonder what your hide would fetch." },
      },
      again = {
        { id = "h_again", text = "What else? Ask, ask! The vats stink whether I talk or not, so I may as well talk." },
        { id = "h_again2", text = "Go on! I talk better than I tan, some say." },
        { id = "h_again3", text = "More? Good, the vats can wait a little." },
      },
      choices = {
        { text = "A leatherworker should pay hunters a fair price for hides.", next = "BACK", reply = "Ha! Good. I pay fair, and the hunters bring me the best. That is good business.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Pay the hunters as little as you can. They'll sell anyway.", next = "BACK", reply = "Then they sell to someone else, and I am left with no hides and no trade.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What hides come out of these hills?", next = "hides" },
        { text = "You waste nothing, I hear.", next = "waste" },
        { text = "Who do you trade with in the fort?", next = "fort" },
        { text = "What will you pay a skinner's eye for?", next = "x_skin", when = { profession = { "Skinning", "Leatherworking" } } },
        { text = "The Earth Mother honours a kill used whole.", next = "x_tauren", when = { race = "Tauren" } },
        { text = "Gor'mul keeps your vats behind the wall?", next = "tk_vats" },
        { text = "What do you do with the scraps?", next = "tk_scraps" },
        { text = "How did you learn to tan hides?", next = "w2_learn" },
        { text = "Good tanning, Tunkk.", next = "END" },
      },
    },
    tk_vats = {
      lines = {
        { id = "tk_vats_1", text = "He does, because of the smell, and I do not blame him, because I have smelled it. Tanning is a dirty trade, but it keeps the fort in boots and belts, and a grunt without boots is a grunt who cannot march." },
      },
      choices = {
        { text = "The smell must keep the enemy away too.", next = "tk_smell" },
        { text = "A dirty trade but a needed one.", next = "BACK", reply = "Needed! Yes! That is the word I tell Gor'mul." },
      },
    },
    tk_smell = {
      lines = {
        { id = "tk_smell_1", text = "Ha! The Witherbark trolls have never once come near my vats, so maybe it does. I tell the warriors it is a secret weapon, and the young ones believe me, and the old ones just hold their noses." },
      },
      choices = {
        { text = "A secret weapon, indeed.", next = "BACK" },
        { text = "I'll keep upwind. Something else.", next = "BACK" },
      },
    },
    tk_scraps = {
      lines = {
        { id = "tk_scraps_1", text = "I keep a barrel by the gate, and any grunt without coin can take a strap or a patch from it. The Horde was poor in the camps, and I remember, so I give what I can and sell the rest." },
      },
      choices = {
        { text = "That's generous of you.", next = "tk_give" },
        { text = "I'm a leatherworker. I'd add to that barrel.", next = "tk_give", when = { profession = "Leatherworking" } },
      },
    },
    tk_give = {
      lines = {
        { id = "tk_give_1", text = "It is not generous, it is sense, for a grunt who can mend his own boots fights better. Drum Fel says I am the only orc in Hammerfall who can make a copper do the work of a silver, and I take that as praise." },
      },
      choices = {
        { text = "It is praise.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Tunkk.", next = "BACK" },
      },
    },
    hides = {
      lines = {
        { id = "hd_default", text = "Raptor, which is the best, tough as mail and light as cloth. Then the cave spiders, whose skin is bad but whose silk Jun'ha wants. And when the caravans come up from Tarren Mill they bring me kodo hide from the Barrens, thick as my thumb, and one of those keeps me in work for a month." },
      },
      choices = {
        { text = "Who brings them in?", next = "hides_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides_who = {
      lines = {
        { id = "hw_default", text = "The fort's hunters, and Uttnar the butcher, who takes the meat and throws me the skin as if it were nothing. Ha! He sells a boar once, and I sell it four times: the hide, the sinew, the bristles and the fat for the leather." },
      },
      choices = {
        { text = "Four sales from one boar. That's thrift.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    waste = {
      big = true,
      lines = {
        { id = "ws_default", text = "Nothing! In the camps we had nothing, so we learned what a scrap is worth. I keep every offcut in that barrel, and when a young grunt needs a strap and has no coin, the barrel provides. Mu'uta says I am a miser, and he takes my sinew all the same." },
      },
      choices = {
        { text = "Giving scraps to grunts who can't pay is no miser's act.", next = "BACK", reply = "Shh! Do not say it so loud, they will all come.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A strap given free is a strap never valued.", next = "BACK", reply = "Hm. Perhaps. But a grunt whose shield falls off is worth less than a strap, so I will keep the barrel.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fort = {
      lines = {
        { id = "ft_default", text = "Everyone! Keena sells me salt, Jun'ha sells me thread when mine runs short, and Mu'uta takes my sinew for his bowstrings and complains about the price. Tharlidun at the stables buys harness leather, and he at least does not haggle." },
      },
      choices = {
        { text = "And the Forsaken? Do they buy leather?", next = "fort_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fort_dead = {
      lines = {
        { id = "fd_default", text = "The Deathstalkers do, black and soft and quiet, and they pay without a word. I asked one how he liked the fit, and he looked at me until I went back to my vats. Good customers. I do not need them to be friends." },
      },
      choices = {
        { text = "Coin without talk is its own kind of courtesy.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Let me see what they buy.", next = "BUSINESS" },
      },
    },
    x_skin = {
      lines = {
        { id = "xs_default", text = "A whole raptor hide with the tail on, cut from the belly, and no arrow holes in the back. Bring me that and I will pay well and tell everyone your name. Bring me a hide like a fishing net and I will tell them that too." },
      },
      choices = {
        { text = "Whole, belly cut, tail on. You'll have it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_tauren = {
      lines = {
        { id = "xt_default", text = "Yes! A tauren hunter told me that at the landing in Durotar, when I was throwing bones on the midden. He picked them up and made needles from them in front of me. I have never thrown a bone away since." },
      },
      choices = {
        { text = "Then you honour the hunt better than most.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    hammerfall = { { id = "tp_hf", text = "A good fort, a proud name and a commander with a small nose. I would not tan anywhere else." } },
    _none = { { id = "tp_none", text = "Ha! You ask the wrong orc. I know hides, and Drum Fel knows everything else." } },
  },
}
