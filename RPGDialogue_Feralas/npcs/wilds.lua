-- Feralas beyond the towns: the Forgotten Coast, the Twin Colossals, the Grimtotem country and the quieter folk of Feathermoon and Camp Mojache.
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gregan", id = TODO_NPC("Gregan Brewspewer"), name = "Gregan Brewspewer",
  bible = "bibles/feralas.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Gregan Brewspewer is a dwarf camped out in the Feralas wilds who talks about brewing the way priests talk about the Light.",
    third = "{name} met Gregan Brewspewer, a dwarven brewer camped in the wilds of Feralas.",
  },
  greetings = {
    { id = "g_main", text = "Well met, well met! Sit a moment, if ye can stand the smell of the mash." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, lad? Ye've a nose for a good brew, I'll give ye that." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gregan Brewspewer, brewer by trade and by calling! I came all the way to Feralas because the fruit and grain out here grow wilder than anything back in Dun Morogh, and wild makes for a grand ale." },
        { id = "h_c0", when = { race = "Dwarf" }, text = "A fellow son or daughter of Ironforge, out here in the jungle! Ye'll understand, then, why a dwarf goes this far for the perfect brew." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! I don't hold with spirits much myself, but if you can bless a barrel, I'll call it a fair morning's work." },
      },
      again = { { id = "h_again", text = "What else, friend? The mash won't stir itself." }, { id = "h_again2", text = "Ask away, I'm only half busy." } },
      choices = {
        { text = "Why brew all the way out here?", next = "b1_1" },
        { text = "What's your best brew?", next = "b2_1" },
        { text = "Is it safe camping here?", next = "b3_1" },
        { text = "Ironforge misses its brewers.", next = "x_1", when = { race = "Dwarf" } },
        { text = "Do the spirits care about your brewing, Gregan?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is brewing worth all this danger?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Because Feralas grows things ye can't find anywhere else, and a brewer chases flavor the way a hunter chases game. I've found berries here that'd make a Thunderbrew weep." } },
      choices = { { text = "What's after you?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The trouble is everything out here wants to eat ye while ye're picking, from the yetis to the gnolls. I'm a better brewer than a fighter, and I know it." } },
      choices = { { text = "Can I help?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "So I pay in the only coin I've got, which is honest thanks and the first taste of whatever comes out of the barrel." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Ask me again in a year, when this batch is done! Every brew I've made is me best until the next one, and I mean that every time I say it." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Safe? Not a word I'd use for Feralas, friend. I keep a stout door, a loud voice and a hammer by the bed, and so far that's been enough." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Aye, and I miss Ironforge, more than I'd admit to anyone but a dwarf. Tell the lads at the Stonefire I'm alive and fermenting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say a dwarf who risks his neck for ale is a fool, and maybe they're right, but they drink it all the same." } },
      choices = { { text = "A man should chase what he loves, danger or not.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Your life's worth more than a barrel of ale.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If they don't, they ought to, because a good ale is the land's own gift poured into a mug. Feralas grows wild fruit and wilder grain, and if there's a spirit in all that, it's a cheerful one." } },
      choices = {
        { text = "Then thank the land for every barrel you brew.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Ale's a craft, not a blessing, and the credit is yours.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Can't say I know, friend. If it doesn't ferment, I don't pay it much mind." } } },
}

P:NPC {
  key = "zorbin", id = TODO_NPC("Zorbin Fandazzle"), name = "Zorbin Fandazzle",
  bible = "bibles/feralas.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Zorbin Fandazzle runs his business from the Forgotten Coast in Feralas and wants something done about the giants, with as little personal risk as possible.",
    third = "{name} met Zorbin Fandazzle, a goblin on the Forgotten Coast of Feralas.",
  },
  greetings = {
    { id = "g_main", text = "Customer! Or contractor! I'm not picky, come on over." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite adventurer's back! Got another job, if you've got the nerve." },
  },
  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Must I? Friend, my crates belonged on this beach until one of those giants sat on them, so yes, I must. You druids can talk to nature all you like, but nature has never once paid its bills." } },
      choices = {
        { text = "Shrink only the ones that threaten you, then.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fair enough. Business is business.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Zorbin Fandazzle, goblin of commerce and science, mostly commerce. The giants on these islands and shores have been tearing up the coast, and I've got a gizmo that'll do something about it." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Zapped Giants") }, text = "Use the zapper on the giants, and bring back what's left when they shrink down. Don't ask me how it works, because the instructions fell in the ocean." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, huh? You turn into animals, right, so tell me, could you turn into something big enough to scare off a giant? I'm asking for business reasons." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Say, can you ask the earth why the giants keep stomping my coast? I've got a gizmo, but I'd love a second opinion." },
      },
      again = { { id = "h_again", text = "What else? Clock's ticking." }, { id = "h_again2", text = "More questions? Sure, those are free." } },
      choices = {
        { text = "Must you shrink the giants, Zorbin?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's this about giants?", next = "b1_1" },
        { text = "Is your zapper safe?", next = "b2_1" },
        { text = "Why set up shop here?", next = "b3_1" },
        { text = "I could improve that zapper.", next = "x_1", when = { race = "Gnome" } },
        { text = "Do you know why the giants are stirring, Zorbin?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the giants deserve this?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Big ones, out by the coast and the Twin Colossals, smashing anything that looks like it might be worth money. I had a shipment, past tense, because a giant stepped on it." } },
      choices = { { text = "Shrinking giants? Really?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "So I built a little device that zaps them down to a more reasonable size. A small giant is still angry, but at least it's angry at your knees instead of your house." } },
      choices = { { text = "And what do I get?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "What you bring me from them pays for the next shipment, and the next shipment pays for you. That's business." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Safe is relative, friend. It's safe compared to a giant, and that's the only comparison that matters out here." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Nobody else is here, and that means nobody else is selling! The ocean's full of trade and the coast is full of trouble, and trouble is where the money hides." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "A gnome? Well, sure, every gnome says that, and then the thing explodes. Tell you what, you zap the giants and I'll keep the blueprints." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Hey, I'm not a philosopher, I'm a businessman. They stepped on my crates first, and fair's fair." } },
      choices = { { text = "They wreck the coast. Someone has to stop them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "They were here first. You're the trespasser.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not a clue, and as a goblin of science that bothers me. My guess is something under the coast has them riled, and my gizmo doesn't care why, which is the beauty of a gizmo." } },
      choices = {
        { text = "Find out why first. Blind fixes cause new trouble.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Who cares why? If the gizmo works, use it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "No idea, friend, and if it doesn't pay, I've got no time to learn." } } },
}

P:NPC {
  key = "kindal", id = TODO_NPC("Kindal Moonweaver"), name = "Kindal Moonweaver",
  bible = "bibles/feralas.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Kindal Moonweaver watches over the creatures of Feralas, and she is angry at what the Grimtotem do to them.",
    third = "{name} met Kindal Moonweaver, a night elf protector of the wild creatures of Feralas.",
  },
  greetings = {
    { id = "g_main", text = "Hush, friend. The forest listens, and so do the Grimtotem." },
    { id = "g_back", when = { metBefore = true }, text = "Elune guide you. You've returned, and I'm glad of it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Kindal Moonweaver. The Grimtotem have been trapping the wild creatures of Feralas and caging them, and I mean to see every one of them freed." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Freedom for All Creatures") }, text = "The cages are in the Grimtotem compound. Open them, and the creatures will find their own way home; they know these woods better than we do." },
      },
      again = { { id = "h_again", text = "Ask, and speak gently; the creatures of these woods startle at loud voices." }, { id = "h_again2", text = "Ask, but quietly." } },
      choices = {
        { text = "Why do the Grimtotem cage them?", next = "b1_1" },
        { text = "Who are you, Kindal?", next = "b2_1" },
        { text = "Are the creatures dangerous?", next = "b3_1" },
        { text = "The wild calls to me too.", next = "x_1", when = { class = "DRUID" } },
        { text = "Should the Grimtotem be punished?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "For their hides, their strength, or simply to prove they can. The Grimtotem are not like other tauren; they take what they want and call it their right." } },
      choices = { { text = "Not all tauren are like that.", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "I have watched them drag sprites and beasts into those pens for months. Each night I hear them crying out, and each morning there are fewer." } },
      choices = { { text = "I'll help.", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "So I ask you to do what I cannot do alone. Free them, and let the Grimtotem learn the forest has friends." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "A daughter of Elune who has spent her life in these forests. Feathermoon guards the coast, but somebody must guard the creatures, and that duty fell to me." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Frightened creatures are always dangerous, friend. Move slowly, open the cages, and step back, because they'll run before they'll fight you." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Then you understand why I can't simply walk away. Cenarius gave us this charge, and I mean to keep it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some at Feathermoon want the Grimtotem driven out of Feralas entirely. I only want the cages emptied, though I'm no longer sure that's enough." } },
      choices = { { text = "Free the creatures. Revenge is not our charge.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Drive the Grimtotem out. They've earned it.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That I cannot say. The forest keeps its own secrets." } } },
}

P:NPC {
  key = "angelas", id = TODO_NPC("Angelas Moonbreeze"), name = "Angelas Moonbreeze",
  bible = "bibles/feralas.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Angelas Moonbreeze serves the Feathermoon Sentinels and keeps her eye on the ruins of the old highborne across Feralas.",
    third = "{name} met Angelas Moonbreeze at Feathermoon Stronghold in Feralas.",
  },
  greetings = {
    { id = "g_main", text = "Ishnu-alah, traveler. Feathermoon welcomes those who come in peace." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to Feathermoon." },
  },
  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Perhaps, in time, but not while the ogres squat in Eldre'Thalas and the naga dig along the coast. The Circle teaches patience, and I'm afraid I have less of it than I should." } },
      choices = {
        { text = "Be patient. The forest has outlasted worse than ogres.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Patience lets the rot spread. Strike now.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Angelas Moonbreeze of Feathermoon Stronghold. While Shandris guards the island, I watch the mainland, especially the ruins where our ancestors' mistakes still linger." },
        { id = "h_c0", when = { race = "NightElf" }, text = "A sister of Teldrassil, so far from home! The ruins of this land are your history too, though I wish they were a kinder one." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Then you'll feel what I feel in the ruins on the mainland, where the old Highborne magic still sours the ground after ten thousand years." },
      },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Speak, friend." } },
      choices = {
        { text = "Can the land around the ruins be healed?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What ruins do you mean?", next = "b1_1" },
        { text = "What is Feathermoon like?", next = "b2_1" },
        { text = "How do you know so much?", next = "b3_1" },
        { text = "Arcane magic needn't be dangerous.", next = "x_1", when = { class = "MAGE" } },
        { text = "Should the ruins be studied or sealed?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Isildien, Ruins of Ravenwind, and the great sunken halls of the Highborne. Our ancestors built them in the days before the Sundering, and they were proud, too proud." } },
      choices = { { text = "What happened to the Highborne?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Now the naga and the ogres crawl over them, and worse things stir beneath. The magic the Highborne used still clings to the stones like a sickness." } },
      choices = { { text = "Should I go there?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "We keep watch so no one wakes what sleeps there. Treat those places with care, and never with greed." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Quiet, mostly, with the sea all around, and as safe a place as Feralas offers. Shandris keeps us sharp, and the hippogryphs keep us connected to the rest of Kalimdor." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "I have walked these forests for longer than your grandparents' grandparents. Memory is the one thing my people have in abundance." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Every Highborne said the same before the world split. Be careful, mage, because the lesson cost us everything." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some of my sisters say we should bury the ruins and forget. Others say we must understand them, lest someone else does first." } },
      choices = { { text = "Study them. Ignorance is a danger of its own.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Seal them. Some knowledge should stay buried.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I know little of that, I'm afraid." } } },
}

P:NPC {
  key = "hadoken", id = TODO_NPC("Hadoken Swiftstrider"), name = "Hadoken Swiftstrider",
  bible = "bibles/feralas.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Hadoken Swiftstrider of Camp Mojache hunts the gordunni ogres of Feralas and trusts newcomers only as far as their blades have proven.",
    third = "{name} met Hadoken Swiftstrider, a tauren hunter at Camp Mojache in Feralas.",
  },
  greetings = {
    { id = "g_main", text = "The Earth Mother walks with you, stranger. Come, sit near the fire." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. The winds told me you would be." },
  },
  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Fight them as yourself, druid, whether you choose claw or moonlight. I ask only that you don't hold back out of pity, because the gordunni show none to our braves." } },
      choices = {
        { text = "Even an ogre deserves mercy if it yields.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "No pity, then. The camp comes first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Hadoken Swiftstrider. Camp Mojache is home to the tauren of Feralas, and the gordunni ogres to the west threaten us every season." },
        { id = "h_c0", when = { race = "Tauren" }, text = "A child of Mulgore, here among us. Our camp is small, but the fire is warm, and you are welcome to it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid among the hunters of Mojache! The gordunni to the west have no love for the Earth Mother, and you'll see it in every stump they leave behind." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The gordunni have shamans of their own who call fire out of the earth, so I'll want to see whether yours burns hotter." },
      },
      again = { { id = "h_again", text = "What else do you seek?" }, { id = "h_again2", text = "Speak, friend." } },
      choices = {
        { text = "Should I fight the ogres as a hunter would?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Tell me of the gordunni.", next = "b1_1" },
        { text = "Why is the camp here?", next = "b2_1" },
        { text = "Do you trust the Alliance here?", next = "b3_1" },
        { text = "I hunt as well. Show me the trails.", next = "x_1", when = { class = "HUNTER" } },
        { text = "Are the gordunni shamans dangerous, Hadoken?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Should we make peace with Feathermoon?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "They are ogres who came into Feralas and took the old elven ruins as their own. They follow warlocks among them, and the dark magic makes them bolder every year." } },
      choices = { { text = "What do you need from me?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "They raid our hunting grounds and drive away the game we need. If they are left alone, Camp Mojache will not last another winter." } },
      choices = { { text = "How do I stop them?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "Strike at their leaders in Dire Maul's shadow, and the rest will lose heart. Ogres need a strong voice to follow." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Feralas is rich with game and green, and our people need such lands. We came to hunt and to watch over the forest, as the Earth Mother asks of us." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "The night elves at Feathermoon keep to their island and we keep to our hills. I do not trust them, but I do not hate them, and that is enough for now." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Then follow the streams west, and look for where the ogres break the brush. They are loud hunters, which makes them easy prey." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some here say we should speak with the night elves, since we face the same ogres. Others say peace with the Alliance is a fool's dream." } },
      choices = { { text = "A common enemy makes allies. Speak with them.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } }, { text = "The Horde stands alone. Trust no Alliance blade.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They burn our scouts and laugh about it, so yes, they're dangerous, and their brutes are worse. The gordunni crowd the hills to the west, and they won't leave until they're made to." } },
      choices = {
        { text = "Then we face them openly and drive them back.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then poison their camps and let them sicken.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "The Earth Mother has not shared that knowledge with me." } } },
}

P:NPC {
  key = "jangdor", id = TODO_NPC("Jangdor Swiftstrider"), name = "Jangdor Swiftstrider",
  bible = "bibles/feralas.md", role = "trainer", tier = "service",
  impression = {
    first = "Jangdor Swiftstrider works leather at Camp Mojache, and he judges the quality of a hide before he judges the person carrying it.",
    third = "{name} met Jangdor Swiftstrider, the leatherworker at Camp Mojache in Feralas.",
  },
  greetings = {
    { id = "g_main", text = "Ah, you bring hides, or you seek knowledge. Either way, you are welcome." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Show me what you have learned." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Jangdor Swiftstrider, and I work the hides of Feralas into armor worthy of hunters. Hadoken Swiftstrider hunts the ogres, and I make sure the hunters who follow him come home whole." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Your kind need room to move when the totems go down, so I'll want to fit you for armor that doesn't fight you." },
      },
      again = { { id = "h_again", text = "Anything else, friend?" }, { id = "h_again2", text = "Ask away." } },
      choices = {
        { text = "What makes a good hide?", next = "b1_1" },
        { text = "You know Hadoken?", next = "b2_1" },
        { text = "Is it wrong to hunt for profit?", next = "s_1" },
        { text = "What armor suits a shaman in Feralas, Jangdor?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Patience, and respect for the beast that gave it. A hunter who rushes the kill ruins the hide, and a leatherworker who rushes the curing ruins the armor." } },
      choices = { { text = "Teach me more.", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Feralas has yetis, scorpids and great cats, and each needs its own care. Bring me good leather and I will teach you to honor it." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "We share a name and a fire, and he worries too much, though in Feralas worry keeps you alive. Tell him I said that, and he will only worry more." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some of the young ones hunt for coin and leave the meat to rot. I do not like it, though the goblins pay them well." } },
      choices = { { text = "Take only what you need from the land.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "A hunter must eat, and coin buys food.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Leather from the beasts of this forest, oiled against the rain, and mail once you're strong enough to carry it. A shaman must move freely when the ogres come, and I'd rather fit you properly than bury you properly." } },
      choices = {
        { text = "Good craft keeps hunters alive, so I'll trust your hand.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather fight light and fast, armor or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I know leather, not that." } } },
}
