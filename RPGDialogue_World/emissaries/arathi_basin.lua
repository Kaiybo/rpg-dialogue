-- Arathi Basin emissaries: the League of Arathor's human envoy (Stormwind, Ironforge, Darnassus) and the Defilers' Forsaken envoy (Orgrimmar, Undercity, Thunder Bluff). Classic year one.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- League of Arathor Emissary (Alliance, human of Stromgarde)
---------------------------------------------------------------------------
P:NPC {
  key = "emissary_arathor", id = TODO_NPC("League of Arathor Emissary"), name = "League of Arathor Emissary",
  role = "soldier", tier = "quest",
  temper = { "steady", "proud" }, values = { "dutiful", "loyal" },
  notices = { "pvp", "race" },

  impression = {
    first = "The League of Arathor's emissary is a weathered human of Stromgarde who talks about the Arathi Basin the way other people talk about a family grave. He wants soldiers, and he wants them to understand what they're fighting over.",
    third = "{name} met the League of Arathor's emissary, a Stromgarde soldier sent to the Alliance capitals to raise swords for the fight over the Arathi Basin.",
  },

  greetings = {
    { id = "g_default", text = "The League of Arathor stands ready, {class}. The basin won't win itself back, and the Defilers are digging in while we talk." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still standing, which is the first thing I ask of anyone I send to Arathi. What do you need?" },
    { id = "g_marks", when = { carrying = { 20559, min = 3 } }, text = "Those are Arathi marks in your pack, unless my eyes have gone. Each mark stands for a stretch of the basin we held for a while, and I'm glad to take them." },
    { id = "g_honored", when = { reputation = { faction = "League of Arathor", min = "honored" } }, text = "They speak your name at Trollbane Hall now, friend, and not just when they're counting the dead. Sit down a moment before you go back out." },
    { id = "g_horde_kills", when = { honorKills = { min = 500 } }, text = "You've the look of someone the Horde has learned to avoid on a battlefield. Arathi could use that look, if you've time for it." },
  },

  notice = {
    { id = "n_rank", cat = "pvp", when = { pvpRank = 6 },
      text = "That's a proper rank you're carrying, and the Alliance doesn't hand those out for sitting in taverns. I'd wager the basin has seen you before." },
    { id = "n_green", cat = "pvp", when = { honorKills = { max = 10 } }, place = "before",
      text = "You've not been blooded against the Horde yet, have you? There's no shame in it, but Arathi is a hard place to learn." },
    { id = "n_human", cat = "race", when = { race = "Human" }, place = "before",
      text = "A human face, and maybe some Arathorian blood behind it, for all of us are Arathor's children if you go back far enough. The basin belongs to your grandfathers as much as mine." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I speak for the League of Arathor, the soldiers of Stromgarde and our allies who hold Trollbane Hall above the Arathi Basin. The Defilers mean to strip that valley bare for the Horde, and we mean to stop them, so I'm asking every able blade in the Alliance to come and stand with us." },
        { id = "h_sw", when = { zone = "Stormwind City" },
          text = "Stormwind's a grand city, and it's good to see banners that haven't been burned lately. I'm here for the League of Arathor, friend, and I'm asking every blade in this city to remember that Arathor came before all of it." },
        { id = "h_if", when = { zone = "Ironforge" },
          text = "The Thane's halls are warm, I'll give the dwarves that, though my ears haven't stopped ringing since I came through the gate. I speak for the League of Arathor, and the dwarves have always answered when the Highlands called." },
        { id = "h_darn", when = { zone = "Darnassus" },
          text = "I've stood in this city a month and I still feel like a boot on someone's clean floor. The Sentinels listen politely when I talk about the Arathi Basin, and I'm grateful, because it's a long way from their trees to our fields." },
        { id = "h_honored", when = { reputation = { faction = "League of Arathor", min = "honored" } },
          text = "You've held the basin for us more than once, and Trollbane Hall remembers its friends. Tell me how the fight is going, from where you stand." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You're a long way from your own side, and I'd ask you to keep your hands where I can see them. Say your piece and go." },
      },
      again = {
        { id = "h_again", text = "Go on, then. I've time until the next caravan north." },
        { id = "h_again2", text = "What else do you want to know about Arathi?" },
        { id = "h_again3", text = "Ask away. Every soldier I talk to here is one more for the Hall." },
      },
      choices = {
        { text = "What's actually in the Arathi Basin worth fighting for?", next = "basin" },
        { text = "Who are you fighting for the basin?", next = "defilers" },
        { text = "Stromgarde seems to have fallen on hard times.", next = "strom" },
        { text = "I've brought marks from the basin.", next = "marks", when = { carrying = 20559 } },
        { text = "How does a soldier earn the League's trust?", next = "marks" },
        { text = "You seem far from home here.", next = "city" },
        { text = "Stromgarde's people are my people too.", next = "k_human", when = { race = "Human" } },
        { text = "The Wildhammer and Thandol Span. Do they still matter?", next = "k_dwarf", when = { race = "Dwarf" } },
        { text = "Would gnomes be any use in your basin?", next = "k_gnome", when = { race = "Gnome" } },
        { text = "Why should Darnassus bleed for human fields?", next = "k_nelf", when = { race = "NightElf" } },
        { text = "Does the Light go with you into the basin?", next = "xpala", when = { class = "PALADIN" } },
        { text = "Who tends to the fallen at Arathi?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Would the League take a warlock?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is there work for someone who fights from the shadows?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I'll go to Arathi when I'm ready.", next = "END" },
      },
    },

    -- The basin itself (chain: basin -> basin_points -> basin_farm)
    basin = {
      lines = {
        { id = "bs_default", text = "Good land and old roads, friend, with a gold mine in the hills, a lumber mill on the ridge, a smithy, stables and a farm that once fed half the Highlands. Whoever holds them holds the resources of all Arathi, and the Horde wants them as badly as we do." },
      },
      choices = {
        { text = "How does the fighting actually go there?", next = "basin_points" },
        { text = "Surely the land could be shared.", next = "basin_share" },
        { text = "Something else.", next = "BACK" },
      },
    },
    basin_points = {
      lines = {
        { id = "bp_default", text = "Five points, the Stables, the Gold Mine, the Lumber Mill, the Blacksmith and the Farm, and every one you hold sends resources back to the Hall. The first side to gather two thousand carries the day, so you'll spend most of it running between flags and bleeding over them." },
        { id = "bp_warrior", when = { class = "WARRIOR" }, text = "Five points, and you hold as many as you can until one side has gathered two thousand resources. A warrior who'll plant his feet at the Blacksmith and refuse to move is worth ten who chase the Horde across the fields." },
      },
      choices = {
        { text = "Which point matters most?", next = "basin_farm" },
        { text = "Running between flags sounds like a dull sort of war.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    basin_farm = {
      big = true,
      lines = {
        { id = "bf_default", text = "Ask ten soldiers and you'll get ten answers, but for me it's the Farm, because my grandmother's people worked those fields before the troll wars and the orcs and the Plague. Some of the Defilers who come down to take it were farmhands there once, and I've heard them call the rows by name." },
      },
      choices = {
        { text = "Then they've as much right to mourn it as you.", next = "BACK", fx = { opinion = { forsaken = "pity" }, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "They gave up that right when they died and came back.", next = "BACK", fx = { opinion = { forsaken = "hate" }, align = { light = -1 }, trait = { stern = 1 } } },
        { text = "That must make the fighting there very strange.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    basin_share = {
      lines = {
        { id = "bsh_default", text = "Shared with whom, friend? The Defilers don't plant, they strip, and when they're done with a valley there's nothing left in it but bones and bad water. Ask anyone who's seen Tirisfal what the Forsaken call farming." },
      },
      choices = {
        { text = "Tell me about the Defilers, then.", next = "defilers" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The enemy (chain: defilers -> defilers_dead -> defilers_den)
    defilers = {
      lines = {
        { id = "df_default", text = "They're Forsaken, sworn to the Dark Lady in Undercity, and they've built a camp called the Defiler's Den in the hills below Hammerfall. They want Arathi's gold and timber for the Horde's war, and they want something else besides, which troubles me more." },
      },
      choices = {
        { text = "You make it sound as if they want something else.", next = "defilers_dead" },
        { text = "Hammerfall? So the orcs are in it too.", next = "defilers_orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    defilers_dead = {
      big = true,
      lines = {
        { id = "dd_default", text = "The basin is full of graves, Arathorian graves, some of them older than Stormwind's first stone. We find the barrows opened after the Defilers have held a point for a day, and nobody at the Hall wants to guess what the apothecaries took out of them." },
      },
      choices = {
        { text = "Then we fight for the dead as much as the land.", next = "defilers_den", fx = { align = { order = 1 } } },
        { text = "Graves are just dirt. Fight for what the living need.", next = "defilers_den", fx = { align = { order = -1 } } },
        { text = "Do you know what they took?", next = "defilers_den" },
      },
    },
    defilers_den = {
      lines = {
        { id = "dn_default", text = "We don't, and that's the worst of it. Some say they're raising soldiers from the old bones, others say they're grinding them for the plague cauldrons, and the dead don't come back to tell us which, or if they do, they come back wearing Defiler colors." },
      },
      choices = {
        { text = "Then I'll take the Farm and hold it.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Rumors, then. Nobody's seen it done.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    defilers_orcs = {
      lines = {
        { id = "do_default", text = "Hammerfall's the Horde's foothold in the Highlands, and the orcs there have no love for Stromgarde, which I understand, since the Alliance kept their grandfathers in camps. But it's the Forsaken who come to the basin, and the orcs seem content to let them." },
      },
      choices = {
        { text = "The internment camps were a long time ago.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Stromgarde
    strom = {
      lines = {
        { id = "st_default", text = "Stromgarde was the heir of Arathor, the first kingdom of men, and it stood when the rest of the north fell. Now the Syndicate holds half the city and the ogres hold the rest of the hills, and the League is what's left of a king's army." },
      },
      choices = {
        { text = "Why fight for the basin when Stromgarde itself is lost?", next = "strom_why" },
        { text = "The Syndicate? I thought they were thieves.", next = "strom_syn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strom_why = {
      big = true,
      lines = {
        { id = "sw_default", text = "Because a city can be taken back with stone and swords, but not without bread and iron, and the basin is where both come from. If we lose Arathi's fields to the Horde, Stromgarde stays a ruin forever." },
      },
      choices = {
        { text = "Then the basin comes first. That's sound soldiering.", next = "BACK", fx = { opinion = { stromgarde = "patience" }, align = { honor = 1 } } },
        { text = "Let the Horde bleed for the basin. Strike Stromgarde while they're busy.", next = "BACK", fx = { opinion = { stromgarde = "reclaim" }, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    strom_syn = {
      lines = {
        { id = "ss_default", text = "Thieves with a lord's coat on, friend, since half their leaders are Alterac nobles who sold their own kingdom to the Horde once already. They'll sell Arathi to whoever's buying, and they'd be glad to see the League and the Defilers bleed each other dry." },
      },
      choices = {
        { text = "Then they're the real enemy.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Marks and reputation
    marks = {
      lines = {
        { id = "mk_default", text = "Every victory at Arathi earns a mark, and the Hall keeps count of the soldiers who bring them in. Hand them to me or to any of the League's people, and your name goes on the roll at Trollbane Hall." },
        { id = "mk_carry", when = { carrying = 20559 }, text = "Arathi Basin marks, and you've carried them all the way here. Every one of those is a fight we won, and the League doesn't forget the soldiers who won them." },
        { id = "mk_honored", when = { reputation = { faction = "League of Arathor", min = "honored" } }, text = "You've brought me enough of these that the quartermaster at the Hall knows your face. Keep at it, and there's more the League can put in your hands." },
      },
      choices = {
        { text = "What does the roll at Trollbane Hall mean?", next = "marks_roll" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marks_roll = {
      lines = {
        { id = "mr_default", text = "It means you're one of ours, friend, whatever city you were born in. The Hall arms its friends and remembers its dead, and both lists have more names on them every week." },
      },
      choices = {
        { text = "Then put my name on it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The capital he stands in
    city = {
      lines = {
        { id = "ct_default", text = "It's quiet, and the beds are soft, and I can't sleep in either. I keep thinking about who's holding the Lumber Mill tonight." },
        { id = "ct_sw", when = { zone = "Stormwind City" }, text = "Stormwind's rebuilt herself well, and the people here are kind enough, but most of them think Arathi is a story their grandfathers told. I'd like to remind them their grandfathers came from there." },
        { id = "ct_if", when = { zone = "Ironforge" }, text = "The dwarves understand, I think, better than anyone in Stormwind does. They know what it is to lose a stronghold and spend a lifetime trying to take it back." },
        { id = "ct_darn", when = { zone = "Darnassus" }, text = "The night elves are courteous, and I've been fed better here than anywhere, but they ask me why men fight over dirt. I tell them it's the dirt our dead are buried in, and they go quiet, which I take to mean they understand." },
      },
      choices = {
        { text = "You'll be back in Arathi soon enough.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Race
    k_human = {
      lines = {
        { id = "kh_default", text = "Then the basin is yours as much as mine, because every human kingdom grew from Arathor's roots, Stormwind among them. When you take the Stables, you're standing where the first kings kept their horses." },
      },
      choices = {
        { text = "I didn't know Stormwind came from Arathor.", next = "k_human_line" },
        { text = "Then I'll fight for it like it's mine.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    k_human_line = {
      lines = {
        { id = "khl_default", text = "Arathor's kings sent their people south long ago, and those people built Stormwind. Most of the city's forgotten it, but a good scholar in the Cathedral library could show you the old rolls, if you've the patience for dust." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    k_dwarf = {
      lines = {
        { id = "kd_default", text = "Thandol Span is the only road from the Highlands to your mountains, and the Dark Iron dwarves have made it a misery to cross. As for the Wildhammer, they flew beside Stromgarde in the Second War, and I'd give my best horse to see a gryphon over the basin again." },
      },
      choices = {
        { text = "I'll write to Aerie Peak for you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "The Wildhammer answer to nobody, human.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    k_gnome = {
      lines = {
        { id = "kg_default", text = "Any use? A gnome who can keep the lumber mill running under fire would be worth a squad of knights to me. The Defilers use the same mill when they hold it, and I'd love to see what a gnome could do to the saws on the way out." },
      },
      choices = {
        { text = "Rig the saws? That's an engineering challenge.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "I'd rather just fight, thanks.", next = "BACK" },
      },
    },
    k_nelf = {
      big = true,
      lines = {
        { id = "kn_default", text = "You've no need to, and I'd not blame you if you stayed home. But the Defilers are spreading their plague across the old forests too, and I'd sooner stop them in a human valley than in your own woods." },
      },
      choices = {
        { text = "Any land poisoned is a wound to all. I'll come.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then I'll fight there for Ashenvale's sake, not yours.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll think on it.", next = "BACK" },
      },
    },

    -- Class
    xpala = {
      big = true,
      lines = {
        { id = "xp_default", text = "It goes with the paladins of the League, and some of them are Stromgarde men who never left the Highlands. Remember, though, many of the Forsaken knelt in Lordaeron's chapels once, and that makes the Light a heavy thing to carry into the basin." },
      },
      choices = {
        { text = "The Light shows them mercy. I can do no less.", next = "BACK", fx = { opinion = { undeath = "mercy" }, align = { light = 1 } } },
        { text = "The dead belong in the ground. I'll put them back.", next = "BACK", fx = { opinion = { undeath = "put_down" }, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      lines = {
        { id = "xpr_default", text = "Not enough of your kind, friend, and that's the reason I'm asking. The barrow fields need blessing again after every fight, and the priests at the Hall can't keep up." },
      },
      choices = {
        { text = "I'll bless the barrows myself.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xl_default", text = "The League would take you, I expect, because the League takes anyone who'll stand on the Alliance's side of the field. I'd ask you not to summon anything near the graves, though, because I've had enough of the dead being disturbed." },
      },
      choices = {
        { text = "I'll respect the graves. They're not mine to use.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "War doesn't stop at a gravestone, emissary.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xr_default", text = "There's always work for someone who can reach the Gold Mine before the Defilers know they've lost it. Take a flag quietly, friend, and nobody at the Hall will ask how you got there." },
      },
      choices = {
        { text = "The quiet ones win the most flags.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = { _none = { { id = "t_none", text = "That's nothing I'd know about, friend. Ask me about the basin, or about Stromgarde, and I'll talk till the lamps burn out." } } },
}

---------------------------------------------------------------------------
-- Defilers Emissary (Horde, Forsaken)
---------------------------------------------------------------------------
P:NPC {
  key = "emissary_defilers", id = TODO_NPC("Defilers Emissary"), name = "Defilers Emissary",
  role = "soldier", tier = "quest",
  temper = { "dry", "sharp" }, values = { "loyal", "practical" },
  notices = { "pvp", "race" },

  impression = {
    first = "The Defilers' emissary is a Forsaken who speaks of the Arathi Basin like a ledger of debts owed, and who once, I think, called that country home. Every word came out cold, but none of it sounded like a lie.",
    third = "{name} met the Defilers' emissary, a Forsaken soldier of the Dark Lady sent to the Horde's capitals to raise blades for the war over the Arathi Basin.",
  },

  greetings = {
    { id = "g_default", text = "The Defilers have need of you, living or otherwise. Speak, if you've come about Arathi." },
    { id = "g_back", when = { metBefore = true }, text = "Still breathing, I see, though most of the people I send to the basin come back in pieces, if they come back. What is it?" },
    { id = "g_marks", when = { carrying = { 20559, min = 3 } }, text = "You carry Arathi marks, and enough of them to be useful. The Defilers keep a careful count, and they'll count yours." },
    { id = "g_honored", when = { reputation = { faction = "The Defilers", min = "honored" } }, text = "The Den speaks well of you, and the Den speaks well of almost no one. Come closer, ally." },
    { id = "g_kills", when = { honorKills = { min = 500 } }, text = "You've killed enough of the Alliance to make the League remember your face. I find that very encouraging." },
  },

  notice = {
    { id = "n_rank", cat = "pvp", when = { pvpRank = 6 },
      text = "Your rank's well earned, by the look of you. The Dark Lady values soldiers who have already proven they can survive the Alliance." },
    { id = "n_green", cat = "pvp", when = { honorKills = { max = 10 } }, place = "before",
      text = "You've not yet killed anyone who could kill you back, have you? The basin will correct that quickly." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Your people watch me as if I might poison the well, and I can't fault them, given what the apothecaries brew. I mean your herds no harm, tauren, and I'll say so as often as I must." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I speak for the Defilers, who serve the Dark Lady in the Arathi Highlands. The League of Arathor wants the basin back for Stromgarde's corpse of a kingdom, and we intend to take every grain and nugget from it for the Horde, so I'm here to gather blades." },
        { id = "h_og", when = { zone = "Orgrimmar" },
          text = "Orgrimmar is very warm, and very loud, and everyone in it seems to want to shake my hand and then think better of it. I speak for the Defilers, and the Warchief's people fight well, so I'm here to put that to use in Arathi." },
        { id = "h_uc", when = { zone = "Undercity" },
          text = "Home, or what passes for it, and I'm glad of the cool air after my last trip to Orgrimmar. The Defilers need soldiers in Arathi, and the Dark Lady expects her own to go first." },
        { id = "h_tb", when = { zone = "Thunder Bluff" },
          text = "The tauren built their city high, which I suspect is so they can keep an eye on the likes of me. I speak for the Defilers, and I'm told to recruit here with good manners, so I'm trying." },
        { id = "h_honored", when = { reputation = { faction = "The Defilers", min = "honored" } },
          text = "You've done well by us in the basin, and the Den doesn't forget its uses for people. Tell me what you need." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You're a long way from your own lines, and you're lucky I'm feeling patient. Say what you came to say, then go." },
      },
      again = {
        { id = "h_again", text = "Continue. I don't tire, so you may as well." },
        { id = "h_again2", text = "Is there more? The dead have nothing but time." },
        { id = "h_again3", text = "Go on, then, ask. I'll answer what I'm allowed to." },
      },
      choices = {
        { text = "What do the Defilers want with Arathi?", next = "basin" },
        { text = "Who holds the basin against you?", next = "league" },
        { text = "You must have lived before the Plague.", next = "self" },
        { text = "I've marks from the basin.", next = "marks", when = { carrying = 20559 } },
        { text = "Recruiting in this city can't be easy.", next = "city" },
        { text = "Why should orcs bleed for Forsaken ambitions?", next = "k_orc", when = { race = "Orc" } },
        { text = "Da Darkspear don't trust your apothecaries, mon.", next = "k_troll", when = { race = "Troll" } },
        { text = "What do the Forsaken do with the land they take?", next = "k_tauren", when = { race = "Tauren" } },
        { text = "I worked Arathi soil once, before I died.", next = "k_forsaken", when = { race = "Scourge" } },
        { text = "Do the Defilers have use for a warlock?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The Forsaken still have priests. Do they go to Arathi?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Any work for a warrior who doesn't care who's buried there?", next = "xwar", when = { class = "WARRIOR" } },
        { text = "Is there work for someone who moves quietly?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I'll go when I'm ready.", next = "END" },
      },
    },

    -- What they want (chain: basin -> basin_points -> basin_strip)
    basin = {
      lines = {
        { id = "bs_default", text = "Gold, timber, iron and grain, and the basin has all four, while Tirisfal's fields grow mostly blight. The Undercity is a great deal of mouth for very little field, and the Horde's war doesn't feed itself, though the League howls whenever we go near their old barrows." },
      },
      choices = {
        { text = "How does the fighting go there?", next = "basin_points" },
        { text = "And the graves? The League says you open them.", next = "basin_graves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    basin_points = {
      lines = {
        { id = "bp_default", text = "Five points, the Stables, the Gold Mine, the Lumber Mill, the Blacksmith and the Farm, and each one you hold feeds the Den. The first side to two thousand resources wins, so it's a war of patience as much as blood, and the dead are very patient." },
      },
      choices = {
        { text = "Which point do you favor?", next = "basin_strip" },
        { text = "Patience suits you, I suppose.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    basin_strip = {
      big = true,
      lines = {
        { id = "bst_default", text = "The Gold Mine, because gold buys everything else, and the League's soldiers die there rather than give it up. They say we strip the land bare, and they're right, but the land was Lordaeron's neighbor and we were Lordaeron's people, and nobody asked us when the Plague took our own fields." },
      },
      choices = {
        { text = "The Forsaken earned that land with their suffering. Take it.", next = "BACK", fx = { opinion = { forsaken = "deserving" }, align = { order = -1 } } },
        { text = "Take what the Horde needs, and leave the rest in order.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "That's a bitter way to see it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    basin_graves = {
      big = true,
      lines = {
        { id = "bg_default", text = "The League says many things, and some of them are even true. Arathor's dead have been in the ground long enough to be of no use to anyone but the apothecaries, and the Dark Lady doesn't waste what's useful." },
      },
      choices = {
        { text = "The dead should rest. Leave the barrows alone.", next = "BACK", fx = { opinion = { necromancy = "wrong" }, align = { light = 1 } } },
        { text = "The dead don't need their bones. The living do.", next = "BACK", fx = { opinion = { necromancy = "useful" }, align = { light = -1 } } },
        { text = "I can't think what the apothecaries want with them.", next = "basin_apoth" },
      },
    },
    basin_apoth = {
      lines = {
        { id = "ba_default", text = "That's the Royal Apothecary Society's business, and they don't share it with soldiers. I'll only say that nothing taken from Arathi goes to waste, and leave you to decide how that makes you feel." },
      },
      choices = {
        { text = "That's not much of an answer.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The enemy
    league = {
      lines = {
        { id = "lg_default", text = "Stromgarde's leftovers, with a few Alliance hangers-on, holed up in Trollbane Hall near Refuge Pointe. They call it reclaiming their heritage, and I suppose it is, if your heritage is a city full of Syndicate thieves and ogres." },
      },
      choices = {
        { text = "They're fighting for their homeland. That's not nothing.", next = "league_home" },
        { text = "So they're weak?", next = "league_weak" },
        { text = "Something else.", next = "BACK" },
      },
    },
    league_home = {
      big = true,
      lines = {
        { id = "lh_default", text = "No, it isn't, and that's what makes them dangerous. A man defending his grandfather's grave will hold a flag long after he ought to have run, and I've watched them do it." },
      },
      choices = {
        { text = "Then they deserve an honorable death in the field.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then strike when they're tired, and strike from behind.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    league_weak = {
      lines = {
        { id = "lw_default", text = "Not weak, only few, and few soldiers with nowhere to retreat fight harder than many with somewhere to go. Never underestimate a human in the last field he owns." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The emissary's own past
    self = {
      lines = {
        { id = "sf_default", text = "Everyone did, once. I was a carter in Lordaeron, hauling grain down from the Highlands, and I knew the basin's roads before I ever fought over them." },
      },
      choices = {
        { text = "Does it trouble you, fighting over roads you once drove?", next = "self_roads" },
        { text = "Something else.", next = "BACK" },
      },
    },
    self_roads = {
      lines = {
        { id = "sr_default", text = "Trouble isn't a feeling I have much use for anymore. But I know which stretch of the road floods in spring and which farmhouse had a dog, and the League's soldiers don't, which is a great advantage." },
      },
      choices = {
        { text = "I'd hate to think what happened to the dog.", next = "self_dog" },
        { text = "Something else.", next = "BACK" },
      },
    },
    self_dog = {
      lines = {
        { id = "sd_default", text = "I've no idea, and I won't guess, since the Plague went through the Highlands before I did. I don't look for it anymore when I pass the Farm, and I want that understood." },
      },
      choices = {
        { text = "I understand.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "You don't fool me. You still look.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },

    -- Marks and reputation
    marks = {
      lines = {
        { id = "mk_default", text = "Every victory at Arathi earns a mark, and the Defilers pay for marks in the only currency the Den cares about, which is trust. Bring them to me, and the Den will know your name." },
        { id = "mk_honored", when = { reputation = { faction = "The Defilers", min = "honored" } }, text = "More marks, and from someone the Den already trusts. Keep this up and they'll start thinking of you as one of us, which is a compliment, whatever your heart's still doing." },
      },
      choices = {
        { text = "What does the Den's trust buy?", next = "marks_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marks_trust = {
      lines = {
        { id = "mt_default", text = "Arms, armor and a place at the Den's fire, though we keep the fire for the living's sake, not ours. The Defilers reward their own, and the Dark Lady remembers those who served her when it mattered." },
      },
      choices = {
        { text = "Then I'll serve.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The capital
    city = {
      lines = {
        { id = "ct_default", text = "The Horde's cities are loud, and the living in them stare. I've learned to stand very still, which seems to unsettle them more." },
        { id = "ct_og", when = { zone = "Orgrimmar" }, text = "The orcs respect strength, so I've found it best to talk about the basin as a battle rather than a harvest. They come to me in good numbers, and they ask fewer questions than anyone else." },
        { id = "ct_uc", when = { zone = "Undercity" }, text = "Here I needn't explain myself, which is restful. Our own volunteer gladly, because they know what Arathi means to Lordaeron's people, and to the Dark Lady." },
        { id = "ct_tb", when = { zone = "Thunder Bluff" }, text = "The tauren are polite, and they don't trust me at all, which is wise of them. Their elders ask what the apothecaries do with the herbs we take, and I tell them what I've been told, which is very little." },
      },
      choices = {
        { text = "The tauren have reason to worry.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Race
    k_orc = {
      big = true,
      lines = {
        { id = "ko_default", text = "Because the League marches under the same Alliance banner that built the camps your people rotted in. I'd have thought that was reason enough to come to Arathi, orc." },
      },
      choices = {
        { text = "Then the camps will be avenged in Arathi.", next = "BACK", fx = { opinion = { peace = "against" }, align = { honor = -1 } } },
        { text = "The Warchief says we leave the camps behind us.", next = "BACK", fx = { opinion = { warchief = "trust" }, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_troll = {
      lines = {
        { id = "kt_default", text = "Nor should you, troll, but you trust Arathor's grandchildren even less, I hope. Their kings broke the Amani in those same hills, and they'd be glad to tell you so." },
      },
      choices = {
        { text = "Da Darkspear ain't Amani, but I take your point.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_tauren = {
      lines = {
        { id = "ktn_default", text = "We use it, tauren, until there's nothing left to use, and then we move on. I know your people find that cruel, but the dead don't plant in hope of a harvest they'll never eat." },
      },
      choices = {
        { text = "The Earth Mother will remember it.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_forsaken = {
      big = true,
      lines = {
        { id = "kf_default", text = "Then you know what's down there as well as I do: the farm with the red door, the old millrace, and the graves of people we both buried once. Do you mean to take it back for the Dark Lady, or only to see it again?" },
      },
      choices = {
        { text = "For the Dark Lady. What I was is buried with them.", next = "BACK", fx = { opinion = { sylvanas = "loyal" }, align = { order = 1 } } },
        { text = "For me. The Dark Lady can have whatever's left.", next = "BACK", fx = { opinion = { sylvanas = "indifferent" }, align = { order = -1 } } },
        { text = "I don't know yet.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    -- Class
    xlock = {
      lines = {
        { id = "xl_default", text = "The Defilers have use for anyone with power and no squeamishness about where it comes from. Bring your demons to the Lumber Mill, and let the League's footmen meet them." },
      },
      choices = {
        { text = "They'll be hungry when they arrive.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = {
        { id = "xpr_default", text = "Some do, though not to pray, since most of us gave that up when we woke in the earth. The Light still answers some Forsaken, I'm told, and the shadow answers more." },
      },
      choices = {
        { text = "The Light answers anyone who still asks.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The shadow is more honest with the dead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwar = {
      lines = {
        { id = "xw_default", text = "That's the very sort I want. Stand at the Blacksmith, keep standing, and the League will break on you like water on a stone." },
      },
      choices = {
        { text = "I'll be the last one standing.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xr_default", text = "There's always work for someone who can take a flag before the Alliance notices it's gone. The Stables are often left lightly guarded, and the League never seems to learn." },
      },
      choices = {
        { text = "I'll take the Stables, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = { _none = { { id = "t_none", text = "I don't know, and the dead have very little curiosity left. Ask me about Arathi, if you must ask something." } } },
}
