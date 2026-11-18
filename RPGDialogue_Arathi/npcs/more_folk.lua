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
        { id = "sn_default", text = "Lolo thinks so too! Lolo saw scaly ones with many arms down in the water that night, and Lolo told the captain, and the captain said Lolo had been drinking. Lolo had not been drinking, not very much." },
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
    { id = "g_back", when = { metBefore = true }, text = "Back again, soldier? Good. Crates don't carry themselves out of the Basin." },
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
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Why do the Forsaken care about Arathi?", next = "why" },
        { text = "What do you want from the Basin?", next = "work" },
        { text = "You work with Hammerfall's orcs?", next = "orcs" },
        { text = "Starving soldiers. Not a very honourable war.", next = "honour" },
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
    { id = "g_default", text = "League kit for League soldiers. Show me your marks and we'll talk." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The Basin's been busy, by the look of you." },
    { id = "g_rep", when = { reputation = { faction = "League of Arathor", min = "revered" } }, text = "I keep the best of it back for soldiers like you, and you've earned every piece." },
  },

  notice = {
    { id = "n_exalted", cat = "reputation", when = { reputation = { faction = "League of Arathor", min = "exalted" } },
      text = "The whole Pointe knows your name by now. I've had soldiers ask me which armour you wear, so they can wear the same." },
    { id = "n_pvp", cat = "pvp", when = { pvpRank = 6 },
      text = "That's a rank most never reach. Stand straighter, soldier, because people are watching you now." },
  },

  start = "hello",
  nodes = {
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
        { id = "h_again", text = "Anything else, soldier?" },
        { id = "h_again2", text = "Go on. The marks will keep." },
      },
      choices = {
        { text = "Show me what the League offers.", next = "BUSINESS" },
        { text = "How does a soldier earn your gear?", next = "earn" },
        { text = "Where does all this come from?", next = "source" },
        { text = "Equipment doesn't win battles. Soldiers do.", next = "soldiers" },
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
    { id = "g_default", text = "Marks first, questions after. That is the order of things." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Let me guess: more marks, and fewer limbs." },
    { id = "g_rep", when = { reputation = { faction = "The Defilers", min = "revered" } }, text = "The Defilers think well of you. I have the paperwork to prove it." },
  },

  notice = {
    { id = "n_exalted", cat = "reputation", when = { reputation = { faction = "The Defilers", min = "exalted" } },
      text = "Exalted with the Defilers. I've only written that word in my ledger a handful of times, and I underlined it each time." },
    { id = "n_pvp", cat = "pvp", when = { pvpRank = 6 },
      text = "A rank like that frightens the Leaguers more than any plague. Do keep it up." },
  },

  start = "hello",
  nodes = {
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
      },
      choices = {
        { text = "Show me what the Defilers offer.", next = "BUSINESS" },
        { text = "You keep a careful ledger.", next = "ledger" },
        { text = "What were you, before?", next = "before" },
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
    { id = "g_default", text = "You want to learn to cook, or you want to stand there smelling my fire?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good. The fire is hot and the buzzards are plucked." },
    { id = "g_cook", when = { profession = "Cooking" }, text = "A cook! Come, I will show you what a buzzard is good for." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You carry a cook's knife. Hold it like a weapon and it will serve you like one." },
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look like you have fought much and eaten little. That is how warriors die stupid." },
  },

  start = "hello",
  nodes = {
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
      },
      choices = {
        { text = "Teach me what you know.", next = "BUSINESS" },
        { text = "Buzzard? People eat buzzard?", next = "buzzard" },
        { text = "Why should a warrior learn to cook?", next = "warrior" },
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
    { id = "g_default", text = "Meat. You want some, or not?" },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still hungry? Good. Buy." },
    { id = "g_forsaken", when = { race = "Scourge" }, text = "The dead buy meat too, I have learned. I do not ask what for." },
  },

  notice = {
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look half eaten yourself. Buy something and sit down before you fall down." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Uttnar, butcher. I sell meat to the warriors of Hammerfall, and they eat a lot of it, so do not waste my time if you are not buying." },
      },
      again = {
        { id = "h_again", text = "More? Ask fast." },
        { id = "h_again2", text = "What else, then?" },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Where does the meat come from?", next = "meat" },
        { text = "You and Slagg sell the same thing.", next = "slagg" },
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
    _none = { { id = "tp_none", text = "I sell meat. That is all I know, and it is enough." } },
  },
}
