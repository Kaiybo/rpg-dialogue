-- Auberdine, the folk we had missed: Archaeologist Hollee (Explorers' League), Gershala Nightwhisper
-- (the corrupt brain stems), Sentinel Selarin (Raene's runner, Trek to Ashenvale), Thamarian (the docks),
-- Kurdram Stonehammer (mining trainer) and Jenna Lemkenilli (engineering trainer).
-- Classic Auberdine only. Voice: bibles/auberdine_folk.md
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Archaeologist Hollee
---------------------------------------------------------------------------
P:NPC {
  key = "hollee", id = TODO_NPC("Archaeologist Hollee"), name = "Archaeologist Hollee",
  title = "Explorers' League",
  bible = "bibles/auberdine_folk.md", role = "questgiver", tier = "quest",
  communities = { "auberdine" }, temper = { "anxious", "chatty" }, values = { "curious", "loyal" },
  notices = { "race", "class" },

  impression = {
    first = "She worships Prospector Remtravel and is plainly terrified for him.",
    third = "{name} met Archaeologist Hollee in Auberdine, a dwarf of the Explorers' League who fled the golems at Remtravel's dig.",
  },

  greetings = {
    { id = "g_hello", text = "Oh! You're not a golem, thank the Titans. Sorry, I've been jumpy ever since the dig." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Have you any word from the south? Please say you've word from the south." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Absent Minded Prospector") },
      text = "You found him alive, and still digging, I'd wager. I could hug you, though I'd get mud on you." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A face from home! You've no idea how good it is to hear a proper accent among all these tall, quiet elves." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "You've the look of a Bronzebeard about you. Were you ever at the academy in Ironforge, by any chance?" },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, good. Golems don't leave tracks you'd want to follow, but at least you'd hear them coming." },
  },

  start = "hello",
  nodes = {
    dd_ameth = {
      lines = {
        { id = "dda_default", text = "Everything! Ameth'Aran was a Highborne city, and the elves will barely talk about the Highborne, so every carved stone is a page of history nobody else will read to us. A curse and a fallen city, and a ghost or two by the sound of it, which is exactly what makes for good archaeology." },
      },
      choices = {
        { text = "The elves might not want strangers digging there.", next = "BACK", reply = "They don't, and Tysha has told me so in very polite and very firm words. I only look, I promise, and I take nothing that's nailed down.", fx = { align = { order = 1 } } },
        { text = "History belongs to whoever is brave enough to dig.", next = "BACK", reply = "That's the League's motto in all but name! Don't say it in front of the Sentinels, though.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_ameth", tags = { "news" }, when = { questDone = TODO_QUEST("The Fall of Ameth'Aran") }, text = "Sentinel Tysha says you read the tablets at Ameth'Aran for her, and I have been sick with envy ever since! I've written to Greywhisker in Darnassus, and he'll want to hear every word you remember." },
        { id = "h_default", key = true,
          text = "Hollee, of the Explorers' League, at your service, or at anyone's service who can swing a pick at a golem. I left Prospector Remtravel at the dig to the south when the ground opened up, and I've not slept properly since." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Absent Minded Prospector") },
          text = "Follow the coast road south and keep going until you see the tents. If the prospector is still alive, he'll be the one muttering at a rock and not looking at the golem behind him." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Absent Minded Prospector") },
          text = "Master Greywhisker, who runs the League's office in Darnassus, will hear how you went looking for the prospector, I promise you that. I've written him three letters already, and two of them were mostly about you." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Another dwarf, and so far from the mountain! I'm Hollee, of the League, and I'm in a spot of trouble, so I'll skip the pleasantries if you don't mind." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! You'll understand golems better than I do, I expect. These ones came up out of the earth like they'd been waiting, and I'd very much like a clever head to tell me why." },
      },
      again = {
        { id = "h_again", text = "What else? I've time, at least until someone brings news from the dig." },
        { id = "h_again2", text = "Go on, ask. Talking keeps me from pacing the jetty." },
      },
      choices = {
        { text = "What do the tablets at Ameth'Aran mean to the League?", next = "dd_ameth", when = { questDone = TODO_QUEST("The Fall of Ameth'Aran") } },
        { text = "What happened at the dig?", next = "dig" },
        { text = "Tell me about Prospector Remtravel.", next = "remtravel" },
        { text = "How does a dwarf end up in Darkshore?", next = "league" },
        { text = "What do the elves make of you?", next = "elves" },
        { text = "What were you digging for, exactly?", next = "society", when = { race = { "Dwarf", "Gnome" } } },
        { text = "He's alive. Muttering at rocks, as you said.", next = "found", when = { questDone = TODO_QUEST("The Absent Minded Prospector") } },
        { text = "I'll leave you to your worrying.", next = "END" },
      },
    },

    dig = {
      lines = { { id = "dig_default", text = "We'd cleared a lovely bit of worked stone, older than any elf ruin on this coast, and then the ground shook and great stone golems pulled themselves up out of the earth. I ran for help, and the prospector simply turned the page in his notebook." },
        { id = "dig_active", when = { questActive = TODO_QUEST("The Absent Minded Prospector") }, text = "You're going there, so listen: the golems are slow, but they don't tire and they don't stop. Don't let them pin you against the cliff." } },
      choices = {
        { text = "You left him there alone?", next = "dig_left" },
        { text = "Golems that rise from the earth? That's not elven work.", next = "society" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    dig_left = {
      lines = { { id = "dl_default", text = "I begged him to come, I did, and he told me to fetch more brushes while I was in town. I'm no fighter, and one more dead dwarf in that trench wouldn't have helped him a bit." } },
      choices = {
        { text = "You did right. Running for help took sense.", next = "BACK", reply = "Thank ye, that's what I keep tellin' myself, and it's nice to hear it from someone else. One more dead dwarf in a hole wouldn't help him.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Running saves your skin. Don't dress it up.", next = "BACK", reply = "Aye, fair, and I'll not pretend I wasn't scared. But I came for help, didn't I, and here ye are.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    remtravel = {
      lines = { { id = "re_default", text = "At the academy in Ironforge everyone knew his name, and when Master Greywhisker sent me to work under him I nearly fainted. He's brilliant, the best mind in the League by a mile, but he could lose a boot while wearing it." } },
      choices = {
        { text = "Is he really that absent-minded?", next = "rem_absent" },
        { text = "Greywhisker sent you? From Darnassus?", next = "rem_grey" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rem_absent = {
      lines = { { id = "ra_default", text = "He once dated a pot shard while standing in the cook fire, and he only noticed when his trousers did. If the golems ever get him, he'll go on describing the craftsmanship of the fist all the way down." } },
      choices = {
        { text = "Genius is worth a little danger.", next = "BACK", reply = "It is, and he'd say so himself, if he could stop talking about pots long enough. I'd still like him to keep his trousers.", fx = { align = { order = -1 } } },
        { text = "A leader who ignores danger gets his people killed.", next = "BACK", reply = "Aye, and that's what keeps me up at night. He's a genius, but he's a genius who forgets things, and the golems don't.", fx = { align = { order = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    rem_grey = {
      lines = { { id = "rg_default", text = "He keeps the League's office in Darnassus, if you can call a corner of the elves' city an office. He reads every report we send, so if you ever go there, tell him Hollee's well and hasn't lost a single notebook." } },
      choices = { { text = "I'll pass it on.", next = "BACK", fx = { trait = { kind = 1 }, learn = { "explorers_league" } } } },
    },

    league = {
      lines = { { id = "le_default", text = "The League goes wherever there's old stone, and Darkshore is nothing but old stone with trees on it. King Magni wants to know where we all came from, and I suspect the answer's buried somewhere a long way from Ironforge." } },
      choices = {
        { text = "Where do you think dwarves came from?", next = "league_origin" },
        { text = "Digging up the past is a waste of good miners.", next = "league_waste" },
        { text = "Something else.", next = "BACK" },
      },
    },
    league_origin = {
      lines = { { id = "lo_default", text = "There are carvings in Uldaman that some say show the makers shaping us out of stone, and I'll not say more than that, because it's not my theory to spread. But I'd not be surprised to find the same hands at work here." } },
      choices = {
        { text = "Then I hope you find the answer.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    league_waste = {
      lines = { { id = "lw_default", text = "That's what my father said, and he's never once wondered why the oldest halls under Ironforge are cut so straight. You can mine iron anywhere, but you only get one chance to find out who you are." } },
      choices = {
        { text = "The past should be remembered. Keep digging.", next = "BACK", reply = "Aye, and I will, whatever my father says. The past has more to tell us than he knows.", fx = { align = { order = 1 } } },
        { text = "The past is dead. Leave it buried.", next = "BACK", reply = "That's what my father says, and he's wrong, and so are ye, if ye don't mind me saying. There's a golem down at the dig that would argue the point.", fx = { align = { order = -1 } } },
      },
    },

    elves = {
      lines = { { id = "el_default", text = "They're polite, in the way a mountain is polite, and they look at our trenches the way you'd look at a muddy boot on a clean floor. Gwennyth's been kind, though, and the innkeeper keeps a stool low enough for me now." } },
      choices = {
        { text = "Do they mind you digging up their ruins?", next = "elves_mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves_mind = {
      lines = { { id = "em_default", text = "We don't touch the elf ruins, that was the bargain, and the dig is on older ground besides. Even so, a Sentinel comes by the camp now and then and counts our shovels, as if we'd steal a hillside." } },
      choices = {
        { text = "Their land, their rules. They're right to watch.", next = "BACK", reply = "Aye, and I don't begrudge them. A Sentinel with a bow by the camp keeps the golems honest, too.", fx = { align = { light = 1 } } },
        { text = "Nobody owns the past. Dig where you please.", next = "BACK", reply = "That's what the League says, but the Sentinels say otherwise, and they've the arrows. I'll stick to the bargain.", fx = { align = { light = -1 } } },
      },
    },

    society = {
      lines = { { id = "so_default", text = "Worked stone, cut by someone with a fine eye for an angle, under the roots of trees older than Auberdine. The prospector thinks there was a great society here before the elves, and the golems coming up out of it rather proves him right." } },
      choices = {
        { text = "The same makers as Uldaman's, you think?", next = "league_origin" },
        { text = "Something else.", next = "BACK" },
      },
    },

    found = {
      lines = { { id = "fo_default", text = "Muttering at rocks! That's him, that's exactly him, and I don't know whether to laugh or cry. Did he ask after me at all, or only after his brushes?" } },
      choices = {
        { text = "He asked after you first.", next = "found_kind", fx = { affinity = 1 } },
        { text = "Mostly the brushes, I'm afraid.", next = "found_true" },
      },
    },
    found_kind = {
      lines = { { id = "fk_default", text = "You're a kind liar, and I'll take it gladly. I'll go back down with the next caravan, golems or no golems, because somebody has to keep his notes dry." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    found_true = {
      lines = { { id = "ft_default", text = "Of course he did, the old goat. Well, I'll bring him his brushes and a stern word, and he'll listen to neither, and we'll get on with it." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Gershala Nightwhisper
---------------------------------------------------------------------------
P:NPC {
  key = "gershala", id = TODO_NPC("Gershala Nightwhisper"), name = "Gershala Nightwhisper",
  bible = "bibles/auberdine_folk.md", role = "questgiver", tier = "quest",
  communities = { "auberdine" }, temper = { "grim", "precise" }, values = { "curious", "careful" },
  notices = { "fel", "class" },

  impression = {
    first = "He asks for satyr and naga brain stems as calmly as ink.",
    third = "{name} met Gershala Nightwhisper in Auberdine, a night elf scholar studying how magic twisted the satyr and the naga.",
  },

  greetings = {
    { id = "g_hello", text = "Ishnu-alah. You have the look of someone who travels far, and I have need of such a person." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Sit, if you like, but mind the jars." },
    { id = "g_argos", when = { questDone = TODO_QUEST("The Corruption Abroad") },
      text = "My brother sent you across the sea to me, and you came. Argos chooses his messengers well, for all his faults." },
  },

  notice = {
    { id = "n_lock", cat = "fel", when = { class = "WARLOCK" },
      text = "You carry the smell of the Nether on you, {class}. I would study you as well, if I thought you'd stand still for it." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Then you know how easily the arcane gets into the blood, and how hard it is to get out again." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Gershala Nightwhisper, and I study what magic makes of those who drink too deeply of it. The satyr were once kaldorei, and the naga were once Highborne, and I want to know what road led them there before someone else walks it." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Researching the Corruption") },
          text = "The satyr and naga both haunt Blackfathom Deeps on the Ashenvale coast, which is a long road and a dark one. Bring me eight brain stems, and keep them out of the sun if you can." },
        { id = "h_done", when = { questDone = TODO_QUEST("Researching the Corruption") },
          text = "The stems you brought have told me much, and none of it comforting. The change begins in the mind long before it reaches the body, and the ones it happens to rarely notice." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "A warlock comes to the one elf in Auberdine who studies what fel magic does to a people. Either you're very brave or you haven't understood my work yet." },
        { id = "h_human", when = { race = "Human" },
          text = "Ishnu-alah, human. Your kingdoms lived beside the high elves for a long time, so perhaps you've seen what their hunger for magic does to them." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The jars keep, and so do I." },
        { id = "h_again2", text = "Go on. Questions are cheaper than brain stems." },
      },
      choices = {
        { text = "Why study brain stems, of all things?", next = "stems" },
        { text = "Who do you fear will go the same way?", next = "fear" },
        { text = "Have you any family nearby?", next = "argos" },
        { text = "What does the change look like, at the start?", next = "change", when = { questDone = TODO_QUEST("Researching the Corruption") } },
        { text = "Fel magic is a tool. It only twists the weak.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll go.", next = "END" },
      },
    },

    stems = {
      lines = { { id = "st_default", text = "Because whatever changed the satyr began behind the eyes, and the body only followed after. The naga of the Deeps and the satyr in Ashenvale were twisted by different hands, ten thousand years apart, and I want to see whether the same marks are left on both." } },
      choices = {
        { text = "That's grim work.", next = "stems_grim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stems_grim = {
      lines = { { id = "sg_default", text = "It is, and I sleep poorly because of it. But someone in Auberdine must look closely at the ugly things, or one day they'll be at our gates and we'll have no idea what they once were." } },
      choices = {
        { text = "Knowing the enemy is worth any cost.", next = "BACK", reply = "It is, and I would pay it again. But I sleep poorly all the same.", fx = { align = { light = -1 } } },
        { text = "Some knowledge stains whoever gathers it. Be careful.", next = "BACK", reply = "I know, and I am careful, as careful as anyone can be. That is why I sleep so poorly.", fx = { align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    fear = {
      lines = { { id = "fe_default", text = "The high elves of Quel'Thalas, or what's left of them since the Scourge burned their land. I hear the survivors call themselves blood elves now, and that they're hungry for magic in a way that sounds very familiar to an old kaldorei." } },
      choices = {
        { text = "They're our cousins. You can't know they'll fall.", next = "fear_cousins" },
        { text = "Why would you care what happens to them?", next = "fear_care" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fear_cousins = {
      lines = { { id = "fc_default", text = "I don't know it, and that is why I study rather than simply preach. But Azshara's court was full of clever, proud people who were certain they knew their own limits, and look at the sea where they used to live." } },
      choices = {
        { text = "Then warn them, before it's too late.", next = "BACK", reply = "I have tried, and they laugh, the way Azshara's court laughed. I will keep trying.", fx = { align = { light = 1 }, learn = { "highborne" } } },
        { text = "They made their choice. Let them pay for it.", next = "BACK", reply = "They will, and so will everyone near them. That is what frightens me.", fx = { align = { light = -1 }, learn = { "highborne" } } },
      },
    },
    fear_care = {
      lines = { { id = "fca_default", text = "Because Azeroth cannot afford another race of monsters, and because I would rather understand a danger than fight it. My people already learned that lesson once, at great cost, and we sank a continent learning it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "queen_azshara" } } } },
    },

    argos = {
      lines = { { id = "ar_default", text = "My brother Argos went to Stormwind to find help among the humans, because he says the adventurers there will go anywhere for the right word. He was always the one who talked and I was always the one who read." } },
      choices = {
        { text = "Do you miss him?", next = "argos_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    argos_miss = {
      lines = { { id = "am_default", text = "We've lived apart for longer than your grandparents were alive, so I suppose I've had time to get used to it. But his letters smell of chimney smoke and human cooking now, and I find I read them twice." } },
      choices = { { text = "Something else, then.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    change = {
      lines = { { id = "ch_default", text = "Pride, first, and a growing certainty that rules are for lesser minds, and then a hunger that nothing seems to feed. By the time horns grow or tails form, the one who's changing has stopped thinking of it as a change at all." } },
      choices = {
        { text = "That could describe half the scholars I know.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xlock = {
      lines = { { id = "xl_default", text = "Every satyr in Ashenvale once believed the same thing, {class}, and they were not weak; they were the finest minds of their age. I'd take more care with that belief than you're taking now." } },
      choices = {
        { text = "I'll master it, not the other way round.", next = "BACK", reply = "So did they, {class}, every one of them. I hope you are the first to succeed.", fx = { align = { light = -1 } } },
        { text = "You may be right. I'll keep watch on myself.", next = "BACK", reply = "Then you are wiser than most who carry it. Watch closely, and come back if you need help.", fx = { align = { light = 1 } } },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Sentinel Selarin
---------------------------------------------------------------------------
P:NPC {
  key = "selarin", id = TODO_NPC("Sentinel Selarin"), name = "Sentinel Selarin",
  bible = "bibles/auberdine_folk.md", role = "soldier", tier = "quest",
  communities = { "auberdine" }, temper = { "brisk", "steady" }, values = { "dutiful", "loyal" },
  notices = { "class", "race" },

  impression = {
    first = "She wants anyone strong enough to send down the road to Ashenvale.",
    third = "{name} met Sentinel Selarin in Auberdine, who serves Raene Wolfrunner of Astranaar and sends help south to her.",
  },

  greetings = {
    { id = "g_hello", text = "Stand easy, {class}. The road south is long, but you look like you could walk it." },
    { id = "g_back", when = { metBefore = true }, text = "Still in Auberdine? The road to Astranaar isn't getting any shorter, friend." },
    { id = "g_done", when = { questDone = TODO_QUEST("Trek to Ashenvale") },
      text = "You found my mistress, then. Raene doesn't send word back often, but she sent word about you." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Raene will like you, because she's never trusted anyone who couldn't read a trail." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "You're a long way from Stormwind, human. Did the boat from Menethil treat you kindly?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_dd_raene", when = { questDone = TODO_QUEST("Raene's Cleansing") }, text = "Raene Wolfrunner writes from Astranaar that the {class} I sent south has been of real help to her. I am glad I pointed you down that road, and gladder still that you took it." },
        { id = "h_default", key = true,
          text = "I am Sentinel Selarin, and I serve Raene Wolfrunner of Astranaar. Ashenvale is bleeding, from the orcs' axes and from the corruption both, and my mistress needs every capable hand Auberdine can send her." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Trek to Ashenvale") },
          text = "Head south and keep to the road, and you'll come to Astranaar on its island in the lake. If you stray into the hills, the furbolgs will remind you why you shouldn't have." },
        { id = "h_low", when = { maxLevel = 15 },
          text = "You're green yet, and I'll not send you south until you've some more seasoning. Help the folk of Auberdine first, and come back to me when the bears and murlocs stop worrying you." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "Sister of the forest, or brother, well met. Ashenvale is our oldest home and it's burning at the edges, so if you've grown strong here, I'd ask you to take that strength south." },
      },
      again = {
        { id = "h_again", text = "What else? I'm on watch, but I can talk and watch at once." },
        { id = "h_again2", text = "Ask. The road will wait a moment longer." },
      },
      choices = {
        { text = "Who is Raene Wolfrunner?", next = "raene" },
        { text = "What's wrong in Ashenvale?", next = "ashen" },
        { text = "What's the road south like?", next = "road" },
        { text = "Why are you here and not with her?", next = "post" },
        { text = "I've seen orcs in Ashenvale. They'll never leave.", next = "xorcs", when = { faction = "Alliance", minLevel = 18 } },
        { text = "I'm on my way.", next = "END" },
      },
    },

    raene = {
      lines = { { id = "ra_default", text = "The finest tracker I've ever served under, and the stubbornest, which in Ashenvale these days is the same thing. She keeps Astranaar's watch and knows every den and every trail between the lake and the Barrens." } },
      choices = {
        { text = "What's she like to serve?", next = "raene_serve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raene_serve = {
      lines = { { id = "rs_default", text = "Hard, and fair, and she never asks anything of us she hasn't done twice herself. She gave me this posting because she said I was the only one patient enough to stand on a dock for a season and not go mad." } },
      choices = {
        { text = "That's a kind of compliment.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ashen = {
      lines = { { id = "as_default", text = "The Warsong orcs cut our trees for their war, and the furbolgs of Thistlefur have gone savage, and the satyr creep out of the Felfire hills. There are moonwells in Ashenvale gone foul that I drank from as a girl." } },
      choices = {
        { text = "Then we drive the orcs out.", next = "ashen_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ashen_stance = {
      lines = { { id = "ast_default", text = "Some say that, and some say we'll never be rid of them and should hold what we can. My mistress says only that the forest must outlast them, however long that takes." } },
      choices = {
        { text = "Strike hard. Show them the forest has teeth.", next = "BACK", reply = "My mistress would agree with you on some days, the days she comes back from the Warsong camp with blood on her blade.", fx = { align = { light = -1 }, learn = { "warsong" } } },
        { text = "Protect what's left. Heal it first.", next = "BACK", reply = "That is what my mistress says, and I think she is right. Some of those burned groves will take a hundred years.", fx = { align = { light = 1 }, learn = { "warsong" } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    road = {
      lines = { { id = "ro_default", text = "Long, and quiet in the wrong places. Follow it south past the Grove of the Ancients and the Master's Glaive, and where it bends into the trees of Ashenvale, keep your eyes up, because the Thistlefur like to watch from the ridges." } },
      choices = {
        { text = "The Master's Glaive?", next = "road_glaive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_glaive = {
      lines = { { id = "rg_default", text = "A great blade standing in the earth, from some battle so old even the Sentinels only sing about it. Strangers in dark robes have been seen camping in its shadow of late, so admire it from a distance." } },
      choices = { { text = "I'll keep my distance.", next = "BACK" } },
    },

    post = {
      lines = { { id = "po_default", text = "Because the boats bring help from the human lands and the hippogryphs bring it from Teldrassil, and all of it lands here first. If I can turn one in ten of them south to Astranaar, I've done more than another bow on the wall would." } },
      choices = {
        { text = "A smart use of one Sentinel.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xorcs = {
      lines = { { id = "xo_default", text = "Perhaps not, {class}, though the forest is patient and orcs are not. I've heard some of them are only cutting wood to build their new homes, and I've heard others boast of the demigod they killed there, so I can't tell you which kind will stay." } },
      choices = {
        { text = "An orc with an axe in our forest is an enemy.", next = "BACK", reply = "It is, and I have fought many of them. But some are only cutting wood to keep warm.", fx = { align = { honor = 1 } } },
        { text = "Some might be bargained with. Worth trying.", next = "BACK", reply = "Perhaps, and I have heard of it, though I have never seen it. I would be glad to be proven wrong.", fx = { align = { honor = -1 } } },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Thamarian (the docks)
---------------------------------------------------------------------------
P:NPC {
  key = "thamarian", id = TODO_NPC("Thamarian"), name = "Thamarian",
  bible = "bibles/auberdine_folk.md", role = "citizen", tier = "service",
  communities = { "auberdine" }, temper = { "cheerful", "chatty" }, values = { "practical", "friendly" },
  notices = { "race", "drink" },

  impression = {
    first = "He knows the ships by their creaks.",
    third = "{name} met Thamarian, who gives directions to the boats on Auberdine's docks.",
  },

  greetings = {
    { id = "g_hello", text = "Lost, friend? Everyone on this dock is lost for the first minute, and then I set them right." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the boards, are you? Coming or going this time?" },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Mind the gaps between the planks, friend, I mean no insult by it. We built this dock for longer legs, and I fished one of your kinsmen out last month." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! You'll be wanting the Bravery to Menethil, I expect, since your lot never stay on this side of the sea for long." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Steady, now, the planks don't move half as much as you think they do. Stay away from the edge until it wears off." },
  },

  start = "hello",
  nodes = {
    landing = {
      lines = { { id = "la_default", text = "Every one, and I've a good memory for faces. Dwarves bound for the dig at Remtravel's, humans who stand and stare at the trees, and our own folk coming home from places they won't talk about. Gwennyth Bly'Leggonde stops half of them before they reach the town, to ask whether they'll look at what the sea has thrown up." } },
      choices = {
        { text = "What has the sea thrown up?", next = "landing2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    landing2 = {
      lines = { { id = "la2_default", text = "Threshers and great turtles, dead on the sand from here to the Twilight Vale, some of them bigger than the Moonspray. I have worked this dock a long while and I never saw the like, and the sailors have started making signs over the rail when they pass one." } },
      choices = { { text = "That would unsettle anyone. Something else.", next = "BACK" } },
    },
    cerellean = {
      lines = { { id = "ce_default", text = "That is Cerellean Whiteclaw, and he has stood there since before I took this post. He looks north toward Ameth'Aran, where someone he loved is said to walk still, and he asks the same favour of every traveler with a kind face. I bring him water and I do not ask." } },
      choices = {
        { text = "Someone should tell him to let go.", next = "BACK", reply = "Perhaps, friend, but it will not be me. A dock is a place for waiting, and he harms no one by it.", fx = { align = { light = -1 } } },
        { text = "Let him keep his vigil. Grief has no tide.", next = "BACK", reply = "That is well said, and I think I shall borrow it. He would thank you, if he looked round.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsailor = {
      lines = { { id = "xs_default", text = "Then you'll have opinions about the Bravery's crew, and I should love to hear them, because I have only my own. They reef late and they sing flat, but their captain has never been a minute behind the tide." } },
      choices = { { text = "Late reefing and flat singing. That's a human crew.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    xnelf = {
      lines = { { id = "xn_default", text = "Mud, mostly, at Menethil, and beyond it mountains with dwarves inside them and a stone city full of humans. They live so quickly over there that a shopkeeper's grandchild will serve you on your second visit. Go and see it, but come back and tell me, since I shall not be going myself." } },
      choices = { { text = "I'll bring you the tale. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thamarian, at your service. The Bravery sails from the south pier to Menethil Harbor in the Wetlands, and the Moonspray runs from the long pier to Rut'theran, at the roots of Teldrassil. Which will it be?" },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "Going home to the great tree, or leaving it? The Moonspray will take you to Rut'theran, and the Bravery will take you farther than most kaldorei ever care to go." },
      },
      again = {
        { id = "h_again3", text = "Go on, friend. The tide's an hour off and the gulls are poor conversation." },
        { id = "h_again", text = "Anything else? I'll be here until the last boat's tied up." },
        { id = "h_again2", text = "Ask away. Nobody ever asks me anything once they're on deck." },
      },
      choices = {
        { text = "Tell me about the boat to Menethil.", next = "bravery" },
        { text = "And the one to Teldrassil?", next = "moonspray" },
        { text = "Do you ever sail yourself?", next = "self" },
        { text = "You must see everyone who lands here.", next = "landing" },
        { text = "That elf at the end of the pier never moves.", next = "cerellean" },
        { text = "I've sailed worse seas than this one.", next = "xsailor", when = { race = { "Human", "Dwarf" } } },
        { text = "I've only ever known the tree. What's across the water?", next = "xnelf", when = { race = "NightElf" } },
        { text = "Thank you, that's all.", next = "END" },
      },
    },
    bravery = {
      lines = { { id = "br_default", text = "The Bravery's a human ship, and her crew sing worse than any I've heard, but she's never once failed to make the crossing. Menethil's a damp little harbor with dwarves in the hills and murlocs on the beach, so bring a good cloak." } },
      choices = {
        { text = "Is the crossing dangerous?", next = "danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = { { id = "da_default", text = "There are things under the Great Sea that could swallow a ship whole, and every sailor here has seen a shadow pass under the hull that was longer than the hull. They've never come up for the Bravery, and I say a word to Elune each time she leaves, just to keep it that way." } },
      choices = {
        { text = "Elune keeps the ships. That's good enough for me.", next = "BACK", reply = "It is good enough for me, too, and for every sailor on this dock. We have never lost a ship on the crossing to Rut'theran.", fx = { align = { order = 1 } } },
        { text = "Prayers don't patch hulls. I'll trust the carpenters.", next = "BACK", reply = "They do not, I know, and the carpenters are very good. But I pray anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonspray = {
      lines = { { id = "mo_default", text = "The Moonspray's ours, light as a leaf and twice as quiet, and she'll set you down at Rut'theran in no time. From there it's a short walk up the hill and through the portal into Darnassus." } },
      choices = {
        { text = "Why not just fly?", next = "fly" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fly = {
      lines = { { id = "fl_default", text = "Caylais, our hippogryph keeper, will happily put you on one, and plenty of folk prefer it. But you don't see the tree rise out of the sea from a hippogryph's back the way you do from the deck, and I'd not trade that sight for any amount of saved time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    self = {
      lines = { { id = "se_default", text = "Once, to Menethil and back, and I was sick the whole way and swore I'd never do it again. So now I stand here and send other people across, which suits my stomach far better." } },
      choices = {
        { text = "A wise choice.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I mind Auberdine's docks and tell travelers which pier is theirs. I've not missed a sailing in years." } },
    advice = { { id = "tp_advice", text = "Be on the pier before the bell, friend. Neither captain waits, and it's a long evening in Auberdine if you miss the last boat." } },
    _none = { { id = "tp_none", text = "That's beyond my dock, I'm afraid. Ask Shaussiy at the inn, or Thundris Windweaver if it's a grave matter." } },
  },
}

---------------------------------------------------------------------------
-- Kurdram Stonehammer (mining trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "kurdram", id = TODO_NPC("Kurdram Stonehammer"), name = "Kurdram Stonehammer",
  title = "Mining Trainer",
  bible = "bibles/auberdine_folk.md", role = "trainer", tier = "service",
  communities = { "auberdine" }, temper = { "gruff", "dry" }, values = { "craft", "practical" },
  notices = { "craft", "race" },

  impression = {
    first = "He grumbles about the elves, but nobody knows Darkshore's rock better.",
    third = "{name} met Kurdram Stonehammer, a dwarf who teaches mining in Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Ye want to learn the pick? Good, because nobody else in this soggy town does." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and with dirt on yer hands, I hope." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "Ye've the shoulders of somebody who's swung a pick, at least. Let's see if ye've learned to swing it right." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard face! Pull up a crate, lad, and tell me something about the mountain that isn't about rain." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_dd_murk", tags = { "news" }, when = { questDone = TODO_QUEST("WANTED: Murkdeep!") }, text = "So you're the one who did for that big murloc, Murkdeep! The fishermen've been toastin' ye all week, and I've been toastin' along with them, for a dwarf never turns down a good reason." },
        { id = "h_default", key = true,
          text = "Kurdram Stonehammer, and I teach mining, for those who can stand the work. There's copper and tin in these hills if ye know where to look, and I'll teach ye where, for a price." },
        { id = "h_miner", when = { profession = "Mining" },
          text = "A miner, good! Show me how ye hold that pick, and I'll show ye where ye've been doing it wrong." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, the damp gets in my knees if I stand still." },
        { id = "h_again2", text = "Go on, then. I've opinions on everything from ore to elves." },
        { id = "h_again3", text = "More? Fine, fine, but I'm sitting down for it." },
      },
      choices = {
        { text = "Teach me mining.", next = "BUSINESS" },
        { text = "What's worth digging in Darkshore?", next = "ore" },
        { text = "How do you get on with the elves?", next = "elves" },
        { text = "Any relation to Thelgrum Stonehammer?", next = "thelgrum" },
        { text = "What's dangerous in those hills?", next = "hills" },
        { text = "You sound homesick for the mountain.", next = "home", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Does it trouble you, digging in our land?", next = "kaldorei", when = { race = "NightElf" } },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    ore = {
      lines = { { id = "or_default", text = "Copper and tin in the hills along the road, and the odd seam of silver if ye're lucky and nobody's looking. The trouble is getting to it, because every other vein here has a tree growing out of it, and the elves get funny when ye take a pick near a tree." } },
      choices = {
        { text = "Then I'll mine around the trees.", next = "ore_trees" },
        { text = "Silver, you said?", next = "ore_silver" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore_trees = {
      lines = { { id = "ot_default", text = "Aye, that's the trick of it, and the rule I give every student. Some of them listen and some of them get a Sentinel's arrow in the dirt between their boots." } },
      choices = {
        { text = "Their forest, their rules. I'll mind the trees.", next = "BACK", reply = "Good on ye, and ye'll keep yer hide that way. The Sentinels shoot first and ask the tree how it's feeling after.", fx = { align = { order = 1 } } },
        { text = "Ore is ore. A tree can grow back.", next = "BACK", reply = "Aye, in a hundred years, and the Sentinels will put an arrow in ye before then. Mind the trees, friend.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ore_silver = {
      lines = { { id = "os_default", text = "Silver, aye, threaded through the copper like a vein through a hand, and gone before ye've got a proper look at it. Ye'll find it by accident or not at all, so keep swinging at copper and let the silver find you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elves = {
      lines = { { id = "el_default", text = "Well enough, once ye learn they say yes by saying nothing and no by saying it very slowly. They buy my copper and they feed me fish, and I'll not complain about either." } },
      choices = {
        { text = "Fish every day? Truly?", next = "elves_fish" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves_fish = {
      lines = { { id = "ef_default", text = "Every blessed day, baked and boiled and once, Light help me, raw. I'd trade a month's wages for a slab of Dun Morogh boar and a pint of something brown, but there's none of either this side of the sea." } },
      choices = {
        { text = "The inn must stock something stronger.", next = "elves_ale" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves_ale = {
      lines = { { id = "ea_default", text = "Moonberry wine, which tastes like a flower fell in a cup and drowned. I keep a wee cask of Thunder Ale under my bench that came over with Hollee's crates, and I'll thank ye not to tell the Sentinels." } },
      choices = { { text = "Not a word. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    thelgrum = {
      lines = { { id = "th_default", text = "My cousin, and he sells the picks I teach folk to use, which is a better business than mine and he knows it. Buy from him, but don't let him tell ye he taught me anything." } },
      choices = {
        { text = "I'll keep the family peace.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Did he teach you anything?", next = "thel_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thel_teach = {
      lines = { { id = "tt_default", text = "He taught me to hold a pick when we were bairns, and I've been teaching him to hold his tongue ever since, with less success. Don't ye dare tell him I said the first part." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hills = {
      lines = { { id = "hi_default", text = "The Blackwood furbolgs up north, who've gone mad as a hatter and twice as mean, and the moonkin, who look soft and aren't. Down on the shore the murlocs will take your boots off your feet if ye stop to dig near the water." } },
      choices = {
        { text = "Any miners gone missing?", next = "hills_missing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hills_missing = {
      lines = {
        { id = "hm_default", text = "Remtravel, the Explorers' League prospector, who wanders off with his head in a ruin and leaves his gear all over the coast. He's not lost so much as misplaced, and somebody always has to go and fetch him." },
        { id = "hm_found", when = { questDone = TODO_QUEST("The Absent Minded Prospector") }, text = "Remtravel, but ye found him, didn't ye? Good. The man would lose his own beard if it weren't attached, and even then I've wondered." },
      },
      choices = {
        { text = "Someone should keep him on a lead.", next = "hills_lead" },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    hills_lead = {
      lines = { { id = "hl_default", text = "I've suggested it, and Hollee laughed, and Remtravel thought I was serious and asked how long the lead would be. A dwarf with no sense of direction is a sad thing, but he does find good ruins." } },
      choices = {
        { text = "Digging up elf ruins is wrong. Leave them be.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The past should be dug up. Someone should learn from it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "Homesick for stone that stays dry, aye, and a hall where ye can't hear rain on the roof every blessed night. But the copper's good and the work's honest, and there's worse places for an old miner to grumble." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    kaldorei = {
      lines = { { id = "ka_default", text = "It troubles me that ye would think so, {g:lad|lass}, because I take nothing your Sentinels haven't seen me take. I dig small and I fill in my holes, and that's more than most dwarves would do for anyone." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Dig around the trees, not through them, and keep yer pick sharp. A dull pick works ye twice as hard for half the ore." } },
    explorers_league = { { id = "tp_explorers_league", text = "Hollee and Remtravel and their lot, digging up elf ruins up and down the coast. Good folk, if ye can keep them from wandering." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Blackwood up north have gone mad, and nobody can tell me why. I keep well clear of their camps." } },
    _none = { { id = "tp_none", text = "Never heard of it. If it's not rock or rain, I've no opinion on it, and that's rare." } },
  },
}

---------------------------------------------------------------------------
-- Jenna Lemkenilli (engineering trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "jenna", id = TODO_NPC("Jenna Lemkenilli"), name = "Jenna Lemkenilli",
  title = "Journeyman Engineer",
  bible = "bibles/auberdine_folk.md", role = "trainer", tier = "service",
  communities = { "auberdine" }, temper = { "eager", "chatty" }, values = { "inventive", "curious" },
  notices = { "craft", "race" },

  impression = {
    first = "After Gnomeregan, she is glad to be anywhere at all.",
    third = "{name} met Jenna Lemkenilli, a gnome who teaches engineering in Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Hello, hello! Mind the springs, they're loose, and so is the cog by your foot." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I've adjusted the whistle on the kettle, so if it screams, that's a success." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Oh, you've got oil on your cuffs! Engineer's oil, not the cooking sort, I can tell by the smell." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Were you down there, at the end? You needn't say, I can see you'd rather not." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Jenna Lemkenilli, journeyman engineer, and the only person in Auberdine who knows what a sprocket is for. I'll teach you the basics, and maybe a bit past the basics if you promise not to blow up the inn." },
        { id = "h_eng", when = { profession = "Engineering" },
          text = "A fellow tinker, at last! The elves here look at a gear the way you'd look at a dead fish, so you've no idea how nice it is to talk shop." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "Another gnome, so far from the mountain! There's a few of us scattered up this coast now, doing what we can, and I'm very glad you found your way here." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a spring to rewind, but I can talk while I do it." },
        { id = "h_again2", text = "Ask! Questions are how inventions start." },
        { id = "h_again3", text = "More? Wonderful, I was running out of things to say to this sprocket." },
      },
      choices = {
        { text = "Teach me engineering.", next = "BUSINESS" },
        { text = "Why does a gnome live in Auberdine?", next = "why" },
        { text = "What do the elves think of your work?", next = "elves" },
        { text = "Do you know Gelkak Gyromast?", next = "gelkak" },
        { text = "What's engineering actually good for?", next = "what" },
        { text = "Dwarves are engineers too, you know.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "I got out of Gnomeregan too.", next = "survivor", when = { race = "Gnome" } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "When Gnomeregan fell, those of us who got out went wherever there was a roof, and an elf captain offered me passage over the sea. I said yes before I'd thought about it, which is how I make most decisions, and how I make most explosions." } },
      choices = {
        { text = "Do you think Gnomeregan will be taken back?", next = "gnomeregan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomeregan = {
      lines = { { id = "gn_default", text = "The High Tinker says so, and I want to believe him. But the radiation and the troggs are still down there, and every month I tell myself next year." } },
      choices = {
        { text = "It will be taken back. Hold on to that.", next = "BACK", reply = "I will, I do, every single day! I keep a list of what I'll fix first, and it's up to forty-one items now.", fx = { align = { light = 1 }, learn = { "gnomeregan" } } },
        { text = "Build a new home. That city is gone.", next = "BACK", reply = "I've thought of it, I really have, and I even drew up plans. But Gnomeregan was home, and I'm not ready to give it up just yet.", fx = { align = { light = -1 }, learn = { "gnomeregan" } } },
        { text = "Who let the troggs in?", next = "gnomeregan_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomeregan_who = {
      lines = { { id = "gw_default", text = "Nobody let them in, they came up from underneath, and then Thermaplugg had the clever idea of flooding the city with radiation to kill them, which killed rather more gnomes than troggs. I'd call him a fool, but fools don't usually come out on top, and he's still down there." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } } },
    },
    elves = {
      lines = { { id = "el_default", text = "They're very polite about it, which is worse than shouting. Thundris asked me to keep my smoke on the far side of town, away from the moonwell, and I do, because I'd rather not find out what a moonwell does to a misfiring flare." } },
      choices = {
        { text = "Has anything ever misfired here?", next = "elves_misfire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves_misfire = {
      lines = { { id = "em_default", text = "One small firework, over the water, and it was a perfectly lovely green until it set a fishing net alight. The Sentinels were very understanding, and I've not been allowed to test anything on the pier since." } },
      choices = {
        { text = "Do you think they'll ever trust gnomish work?", next = "elves_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves_trust = {
      lines = { { id = "et_default", text = "They trust my cogs more than my rockets, and they're not wrong to. They remember a lot of things going very badly when people played with power they didn't understand, so I try to show them I understand mine." } },
      choices = {
        { text = "They're right to be careful with new things.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "They'll fall behind if they won't change.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gelkak = {
      lines = { { id = "ge_default", text = "The one who calls himself a pirate and talks about his machine like it's a sweetheart? He came through asking for gears a while ago, and he paid in sea-shells, which I've decided to count as payment out of politeness." } },
      choices = {
        { text = "What sort of machine is it?", next = "gelkak_machine" },
        { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    gelkak_machine = {
      lines = { { id = "gm_default", text = "The Threshwackonator 4100, he calls it, which is a magnificent name for something held together with tar and hope. He swears it's his first mate, and from the bits he described, I'd stand well clear when he turns it on." } },
      choices = { { text = "I'll keep my distance. Something else.", next = "BACK" } },
    },
    what = {
      lines = { { id = "wa_default", text = "Explosives, mostly, at first, and then goggles so you can see what you blew up, and then all sorts of lovely gadgets for the adventurer who wants to be a little bit less dead. Everything starts with a rough blasting powder and a copper bolt." } },
      choices = {
        { text = "That sounds dangerous.", next = "what_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    what_danger = {
      lines = { { id = "wd_default", text = "Oh, it's terribly dangerous, that's what makes it engineering! The trick is to be dangerous in the direction you mean to be, and I've a burn on my left thumb that reminds me of that every morning." } },
      choices = {
        { text = "How do you know which direction you mean?", next = "what_direction" },
        { text = "Something else.", next = "BACK" },
      },
    },
    what_direction = {
      lines = { { id = "wdi_default", text = "Measure twice, light once, and always stand behind the elf who's laughing at you. Well, no, don't do that last part, they've very long ears and they hear everything." } },
      choices = { { text = "Sound advice. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "I do know, and I've learned a great deal from Ironforge's engineers, mostly what not to do with a boiler. Your people make sturdier guns than we do; ours just have more buttons." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    survivor = {
      lines = { { id = "su_default", text = "Then you know, and I needn't say any of it. If you ever want to sit here and not talk about it over a cup of something, my workbench has two stools, and one of them hardly wobbles." } },
      choices = { { text = "I'd like that. Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    gnomeregan = { { id = "tp_gnomeregan", text = "Home, until Thermaplugg ruined it. I tell myself we'll go back next year, every year." } },
    advice = { { id = "tp_ad", text = "Wear goggles. I know they look silly, but eyebrows grow back and eyes don't." } },
    _none = { { id = "tp_none", text = "No idea! But give me an afternoon and a spanner, and I could probably build something that knows." } },
  },
}
