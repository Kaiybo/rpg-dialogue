-- Undercity folk no earlier pass reached: holiday visitors (Darkcaller Yanka, the Copperpinches, the Midsummer
-- merchant), battlemasters, the War Effort recruiter, the wandering apothecaries and others.
-- Voice: bibles/townsfolk.md (Forsaken dry chill; goblins sell; orcs plain).
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Darkcaller Yanka: Hallow's End, the Ruins of Lordaeron and the zeppelin towers.
P:NPC {
  key = "uc_darkcaller_yanka", id = TODO_NPC("Darkcaller Yanka"), name = "Darkcaller Yanka", gender = "female",
  bible = "bibles/townsfolk.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "grim", "proud" }, values = { "loyal", "ambitious" },
  impression = {
    first = "Darkcaller Yanka wears the black and orange of Hallow's End as if it were a uniform, and she speaks of the Wickerman the way a priest speaks of a cathedral.",
    third = "{name} met Darkcaller Yanka, who calls the Forsaken to the burning of the Wickerman at Hallow's End.",
  },
  greetings = {
    { id = "g_default", text = "Hallow's End is upon us, {class}. Tonight the Forsaken remember the day we threw off the Lich King's chains, and the Wickerman burns for it." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "A living thing from the south, at our festival? Keep well away from the Wickerman, or the guardians will make kindling of you." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "A farmer's wife near Brill, who carved turnip lanterns every autumn and set them on the gate to scare off the spirits. Then I became the spirit. I still carve the lanterns, out of spite more than tradition." } },
      choices = {
        { text = "Do you miss the old festival?", next = "yold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yold = {
      lines = { { id = "yold_x", text = "Miss it? The old festival was the living hiding from the dead. Ours is the dead laughing back. I like ours better, though I'll admit I miss the smell of the bread." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ywicker = {
      lines = { { id = "ywicker_x", text = "It's the night we burned our bonds. The Lich King held us, and the Dark Lady broke his grip, and so every year we build him in wicker and set him alight. The Scarlets see it from their walls, and I hope they shiver." } },
      choices = {
        { text = "Some say it mocks the living's holy day.", next = "ymock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymock = {
      lines = { { id = "ymock_x", text = "Some say that, aye, mostly priests from Stormwind who never set foot in Tirisfal. Should we keep their festival as they kept it, or make it ours?" } },
      choices = {
        { text = "Make it yours. You paid for it in death.", next = "BACK", reply = "Exactly so. You'll have a good seat at the burning.", fx = { align = { light = -1 } } },
        { text = "Keep some of the old prayers. They meant something.", next = "BACK", reply = "Perhaps. I'll say one for the farmer's wife, if no one's listening.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylady = {
      lines = { { id = "ylady_x", text = "She lets it happen, which for the Dark Lady is the same as approval. I've never seen her at the fire, though I've heard she watches the smoke from the Royal Quarter. I'd like to think so." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Darkcaller Yanka, and I keep the rites of Hallow's End for the Dark Lady's people. The humans made this a night of candles and sweets, but for us it is the night we were set free." },
        { id = "yh_human", when = { race = "Human" }, text = "A living human, here for Hallow's End? You've come to the right fire. Mind you don't stand too close." },
      },
      again = { { id = "h_again", text = "What else would you know of the festival?" }, { id = "h_again2", text = "Speak, before the fires are lit." } },
      choices = {
        { text = { normal = "What is the Wickerman?", polite = "Would you tell me what the Wickerman is?", blunt = "What's the Wickerman?" }, next = "wicker" },
        { text = "Hallow's End is a human festival.", next = "human" },
        { text = "How can I help with the celebration?", next = "help" },
        { text = "Are you ready for the Wickerman's burning?", next = "ready", when = { questActive = TODO_QUEST("A Time to Build Up") } },
        { text = "Who were you before you died?", next = "ylife" },
        { text = "What does the Wickerman mean to you?", next = "ywicker" },
        { text = "Does the Dark Lady approve of all this?", next = "ylady" },
        { text = "I'll come back when the fires burn.", next = "END" },
      },
    },
    wicker = {
      lines = { { id = "w_default", text = "A great figure of wood and straw that stands outside the Undercity, built by Forsaken hands. When we set it alight, every one of us remembers the moment our wills came back to us, and the Scourge's grip burned away." } },
      choices = {
        { text = "Do the Alliance know of it?", next = "alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alliance = {
      lines = { { id = "a_default", text = "They know, and they send their soldiers from Southshore to douse it with their little buckets. The Wickerman guardians are there to see that they don't, and they do it with great enthusiasm." } },
      choices = {
        { text = "Let them try. They'll learn.", next = "BACK", reply = "Spoken like one of us. I'll tell the guardians to save one for you.", fx = { align = { honor = -1 } } },
        { text = "A festival shouldn't be a battlefield.", next = "BACK", reply = "Then tell that to Southshore, {class}, because we didn't start the custom.", fx = { align = { honor = 1 } } },
      },
    },
    human = {
      lines = { { id = "hu_default", text = "It was, once, and most of us were human when it was. We have kept what we liked of it and burned the rest, which is how the Forsaken deal with most of what we inherited." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    help = {
      lines = { { id = "he_default", text = "Every flame needs fuel, and every celebration needs hands. Speak to the innkeepers across the Horde's lands; they keep treats for those who carry the season's message, and I've a task or two of my own." } },
      choices = {
        { text = "What sort of task?", next = "task" },
        { text = "Something else.", next = "BACK" },
      },
    },
    task = {
      lines = { { id = "t_default", text = "The Wickerman must be built up before it can be burned, and the shipments of wood and straw have a way of going astray between here and Brill. Bring me what I ask for, and you will have your place at the fire." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ready = {
      lines = { { id = "r_default", text = "Nearly, if you have brought what I asked. Once it's built, you'll stand with us when it burns, and you will understand why we celebrate as we do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    hallows_end = { { id = "ytp_he", text = "Hallow's End is ours now. We died for it, after all." } },
    wickerman = { { id = "ytp_wm", text = "The Wickerman burns at Brill. Come and watch, and bring a mask." } },
    _none = { { id = "tp_none", text = "Ask me again after the burning. Tonight I've thought only for the fire." } },
  },
}

-- Harbinger Balthazad: wandering herald of the Undercity.
P:NPC {
  key = "uc_harbinger_balthazad", id = TODO_NPC("Harbinger Balthazad"), name = "Harbinger Balthazad", gender = "male",
  bible = "bibles/townsfolk.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "grand", "cold" }, values = { "loyal", "duty" },
  impression = {
    first = "Harbinger Balthazad walks the rings of the Undercity in a long dark coat, calling out the Dark Lady's needs in a voice that carries down every tunnel.",
    third = "{name} met Harbinger Balthazad, the Undercity's herald, who calls the Forsaken to arms.",
  },
  greetings = {
    { id = "g_default", text = "Hear me, {class}! The Dark Lady has need of every blade, and I have need of a moment of your time." },
  },
  start = "hello",
  nodes = {
    ynews = {
      lines = { { id = "ynews_x", text = "The Bulwark needs hands, the Sepulcher needs blades, and the Apothecarium needs subjects, though I'm told not to cry that last one quite so loudly. Each tunnel hears a different verse of the same song." } },
      choices = {
        { text = "Who decides which verse you cry?", next = "ywho" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywho = {
      lines = { { id = "ywho_x", text = "Varimathras hands me the list at dawn, and I cry it until dusk. I've wondered why a dreadlord writes the Dark Lady's needs. Have you?" } },
      choices = {
        { text = "The Dark Lady trusts him. So should you.", next = "BACK", reply = "Then I shall cry his words and keep my wondering for the quiet hours.", fx = { align = { order = 1 } } },
        { text = "A demon's words deserve a second look.", next = "BACK", reply = "Hush. Not here, not so near the throne. But yes. Yes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytire = {
      lines = { { id = "ytire_x", text = "My voice has no lungs to tire, only a memory of breath that I push through a dead throat. I was a town crier in Lordaeron. I called the coronation of a prince who later killed us all, and I sometimes think this is my penance." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Balthazad, harbinger to the Dark Lady. Where the Forsaken must march, I am the one who calls them, and lately I've been calling them to the Plaguelands." },
        { id = "yh_tauren", when = { race = "Tauren" }, text = "Tauren. The Dark Lady values the Bloodhoof's friendship, and so do I. Hear the city's needs, if you'll lend those great ears." },
      },
      again = { { id = "h_again", text = "What more do you need to hear?" }, { id = "h_again2", text = "Speak, {class}; I've a long circuit to walk." } },
      choices = {
        { text = { normal = "What's happening in the Plaguelands?", polite = "What news is there from the Plaguelands, Harbinger?", blunt = "What's in the Plaguelands?" }, next = "plague" },
        { text = "You must walk a great distance every day.", next = "walk" },
        { text = "I'm ready to fight for the Dark Lady.", next = "ready", when = { minLevel = 50 } },
        { text = "Who were you before you were the harbinger?", next = "hb_before" },
        { text = "I died in Lordaeron too, Harbinger.", next = "BACK", when = { race = "Scourge" }, reply = "Then you know why my voice carries. We were all silenced once." },
        { text = "What news do you carry today?", next = "ynews" },
        { text = "Do you ever tire of the call?", next = "ytire" },
        { text = "I'll keep that in mind.", next = "END" },
      },
    },
    plague = {
      lines = { { id = "p_default", text = "The Scourge holds Andorhal and the lands east of it, and the Scarlet Crusade squats in Hearthglen pretending to fight them. Our Apothecaries have a foothold at the Bulwark, and it is our task to widen it." } },
      choices = {
        { text = "What is the Bulwark?", next = "bulwark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bulwark = {
      lines = { { id = "b_default", text = "A wall of Deathguard and barricades on the road east out of Tirisfal, where Western Plaguelands begins. Every night the dead come against it, and every night it holds, because the Forsaken do not run." } },
      choices = {
        { text = "The Scourge must be destroyed utterly.", next = "BACK", reply = "Utterly, and their master with them. The Dark Lady will see to the last of it herself.", fx = { align = { order = 1 } } },
        { text = "Leave them be and they'll rot on their own.", next = "BACK", reply = "Rot? They don't rot, {class}; they spread. That's rather the point.", fx = { align = { order = -1 } } },
      },
    },
    walk = {
      lines = { { id = "w_default", text = "From the Trade Quarter to the Royal Quarter and back again, every hour without fail. My legs feel nothing, and so I've no excuse to stop." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ready = {
      lines = { { id = "r_default", text = "Then go east to the Bulwark and present yourself to High Executor Derrington. Tell him the harbinger sent you, though he'll know it from the look of purpose on you." } },
      choices = {
        { text = "What will he ask of me?", next = "ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask = {
      lines = { { id = "a_default", text = "To kill what the Scourge throws at the wall, mostly, and to carry the fight to Andorhal when it's time. It is honest work for a soldier, and there's no shortage of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hb_before = {
      lines = { { id = "hb_b_default", text = "A town crier in Capital City. I read the king's proclamations from the palace steps, including the last one, which promised that Prince Arthas would return with a cure. I read it in this same voice. I have tried since to make amends for that." } },
      choices = {
        { text = "How does a harbinger make amends?", next = "hb_amends" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hb_amends = {
      lines = { { id = "hb_a_default", text = "By calling only true things. The Dark Lady's needs are real, and her enemies are real, and when I tell the Forsaken to march, there is something worth marching against. Terenas never gave me that comfort." } },
      choices = {
        { text = "And if her orders were ever wrong?", next = "BACK", reply = "Then I would still call them, {class}, and pray that they weren't. I've no other trade." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    varimathras = { { id = "ytp_vari", text = "The dreadlord writes the lists I cry. I cry them. That is all I will say." } },
    bulwark = { { id = "ytp_bulwark", text = "The Bulwark holds the line at the Plaguelands' edge, and it always needs more of us." } },
    sylvanas = { { id = "tp_sylvanas_x", text = "She gave us our voices back. I use mine in her service, gladly." } },
    scourge = { { id = "tp_scourge_x", text = "Every proclamation I make is, in the end, about them." } },
    _none = { { id = "tp_none", text = "I carry the Dark Lady's words, {class}, not the city's gossip." } },
  },
}

-- Kurden Bloodclaw: Warsong Gulch battlemaster.
P:NPC {
  key = "uc_kurden_bloodclaw", id = TODO_NPC("Kurden Bloodclaw"), name = "Kurden Bloodclaw", title = "Warsong Gulch Battlemaster", gender = "male",
  bible = "bibles/townsfolk.md", role = "battlemaster", tier = "service",
  communities = { "undercity" }, temper = { "gruff", "proud" }, values = { "brave", "honor" },
  impression = {
    first = "Kurden Bloodclaw stands among the Forsaken like a boulder in a crypt, an orc of the Warsong Outriders with no patience for the city's chill.",
    third = "{name} met Kurden Bloodclaw, the orc who sends warriors to Warsong Gulch from the Undercity.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're welcome at our fire any night you like." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Stay clear of the camp, unless you've orders to be here." },
    { id = "g_default", text = "You look like you can swing a weapon, {class}. The Warsong Outriders need fighters at the gulch." },
  },
  start = "hello",
  nodes = {
    ygrom = {
      lines = { { id = "ygrom_x", text = "Grom drank the demon's blood a second time at Ashenvale, and then he killed the demon Mannoroth and freed us all. He died doing it. The Warsong carry his name into that forest like a torch." } },
      choices = {
        { text = "The night elves say we ravaged their forest.", next = "yforest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yforest = {
      lines = { { id = "yforest_x", text = "They say it, and they are not wrong. We cut their trees and they killed our loggers. Grom killed Cenarius. Should the Warsong make amends, or finish what we started?" } },
      choices = {
        { text = "Make amends. Grom's sin needn't be ours.", next = "BACK", reply = "Thrall says much the same. I am not sure the forest is listening.", fx = { align = { honor = 1 } } },
        { text = "Finish it. The Horde needs that timber.", next = "BACK", reply = "Lok'tar! Then go to the gulch and take their flag.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylead = {
      lines = { { id = "ylead_x", text = "Warchief Thrall commands, but the Outriders answer to the Warsong first and their memory of Grom second. In the gulch it's every orc's own axe that leads. That is how we like it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ywant = {
      lines = { { id = "ywant_x", text = "A sky I can see, and a fight I can smell coming. The Undercity gives me neither. The battlemasters were posted to every city, and I drew the deepest hole of them all." } },
      choices = {
        { text = "Is the cold that bad?", next = "ycold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycold = {
      lines = { { id = "ycold_x", text = "The cold here is wrong. It comes up from the stone and doesn't leave. The Forsaken don't feel it. I drink grog and stamp my feet, and the Deathguard laugh at me, though they're polite about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Kurden Bloodclaw, of the Warsong Outriders. The night elves of the Silverwing want us out of Ashenvale, and we mean to keep cutting their trees whether they like it or not." },
        { id = "yh_tauren", when = { race = "Tauren" }, text = "A tauren. Good. Your kind remember what the Ashenvale forest cost us. The Warsong have not forgotten either." },
      },
      again = { { id = "h_again", text = "What else, warrior?" } },
      choices = {
        { text = "Tell me about Warsong Gulch.", next = "gulch" },
        { text = "You don't care for the Undercity.", next = "city" },
        { text = "Send me to the gulch.", next = "BUSINESS" },
        { text = "How did an Outrider end up in the Undercity?", next = "kb_here" },
        { text = "What are the Silverwing like?", next = "kb_silverwing" },
        { text = "Lok'tar, brother. How fares the Warsong?", next = "BACK", when = { race = "Orc" }, reply = "Bleeding and winning, brother. As it should be." },
        { text = "What happened to Grom Hellscream?", next = "ygrom" },
        { text = "Who leads the Outriders?", next = "ylead" },
        { text = "What do you want most?", next = "ywant" },
        { text = "Another time.", next = "END" },
      },
    },
    gulch = {
      lines = { { id = "gulch_default", text = "A valley in Ashenvale, where Grom Hellscream's clan cut the forest and the Sentinels came to make them pay. Now we steal each other's flags and carry them home, and the side with the most wins the day." } },
      choices = {
        { text = "The elves are defending their forest.", next = "BACK", reply = "Aye, and we're feeding our people. Both of us are right, so we fight about it.", fx = { align = { honor = 1 } } },
        { text = "Then we take the forest and their flag.", next = "BACK", reply = "Lok'tar! That's the spirit the Outriders need.", fx = { align = { honor = -1 } } },
      },
    },
    city = {
      lines = { { id = "c_default", text = "It's cold, it stinks of the apothecaries' brews, and nobody here has eaten a proper meal in years. Still, the Forsaken fight hard, and a Warsong warrior respects that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kb_here = {
      lines = { { id = "kb_h_default", text = "Warchief Thrall wanted every city of the Horde sending fighters to the gulch, and somebody had to stand in this crypt and ask. I lost the draw. The Forsaken fight well, I'll say that, even if they smell like an old battlefield." } },
      choices = {
        { text = "Do you trust the Forsaken as allies?", next = "kb_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kb_trust = {
      lines = { { id = "kb_t_default", text = "I've seen them hold the line at the gulch while the Sentinels came over the walls, and none of them broke. Some orcs say the dead don't belong in the Horde. I say anyone who bleeds for it, or used to, belongs." } },
      choices = {
        { text = "The Forsaken have earned their place in the Horde.", next = "BACK", reply = "Aye. Say it louder in Orgrimmar, where they need to hear it.", fx = { align = { honor = 1 } } },
        { text = "The dead are useful, but never truly Horde.", next = "BACK", reply = "Hmph. Keep that thought out of the gulch, where they're guarding your back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kb_silverwing = {
      lines = { { id = "kb_s_default", text = "Night elf women with glaives and owls and very long memories. They don't shout their war cries; they just appear behind you. I've fought their kind since Grom's days in Ashenvale, and I still can't hear them coming." } },
      choices = {
        { text = "How do you beat them?", next = "kb_beat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kb_beat = {
      lines = { { id = "kb_b_default", text = "Keep together, guard the flag carrier, and never chase an elf into the trees alone. The ones who chase alone come back on a stretcher, if they come back. Do that, and the Silverwing lose like anyone else." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    grom_hellscream = { { id = "ytp_grom", text = "Grom freed us with his own blood. The Warsong will never forget." } },
    ashenvale = { { id = "ytp_ash", text = "Ashenvale's trees are worth fighting for. The elves agree. That's the trouble." } },
    thrall = { { id = "tp_thrall_x", text = "The Warchief sent me here himself. I'd go anywhere he asked, even a crypt." } },
    forsaken = { { id = "tp_forsaken_x", text = "Cold, quiet, and harder than they look. Good fighters." } },
    advice = { { id = "tp_advice_x", text = "Guard the flag carrier. Glory comes after." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. Ask me about the gulch." } },
  },
}

-- Grizzle Halfmane: Alterac Valley battlemaster.
P:NPC {
  key = "uc_grizzle_halfmane", id = TODO_NPC("Grizzle Halfmane"), name = "Grizzle Halfmane", title = "Alterac Valley Battlemaster", gender = "male",
  bible = "bibles/townsfolk.md", role = "battlemaster", tier = "service",
  communities = { "undercity" }, temper = { "gruff", "steady" }, values = { "loyal", "honor" },
  impression = {
    first = "Grizzle Halfmane wears the furs of the Frostwolf clan, and the snow of Alterac seems to cling to him even down in the Undercity's damp.",
    third = "{name} met Grizzle Halfmane, the Frostwolf who sends warriors to Alterac Valley from the Undercity.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you still standing. Come, stand with us a while." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'd not trust you to hold a line, and I'll not pretend otherwise." },
    { id = "g_default", text = "Frostwolf greets you, {class}. Drek'Thar needs warriors in Alterac, and the Stormpike dwarves aren't leaving on their own." },
  },
  start = "hello",
  nodes = {
    ysnows = {
      lines = { { id = "ysnows_x", text = "Every day. Down here the cold is wet and sour, and it gets into the joints. In Alterac the cold is clean, and a Frostwolf breathes it like water. I'd trade this post for a snowdrift tomorrow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yforsaken = {
      lines = { { id = "yforsaken_x", text = "They fight, and they don't complain, and they never tire. I respect that. I do not respect the smell of the Apothecarium, and I keep my mane well away from it." } },
      choices = {
        { text = "Do you trust them?", next = "ytrust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytrust = {
      lines = { { id = "ytrust_x", text = "Thrall says they are Horde, and I follow Thrall. But I've seen apothecaries ask strange questions of wounded Frostwolves. Should a soldier speak up about such things, or hold his tongue for the sake of the alliance?" } },
      choices = {
        { text = "Speak up. Thrall would want to know.", next = "BACK", reply = "Aye. Thrall values truth over comfort. I'll send word to Orgrimmar.", fx = { align = { honor = 1 } } },
        { text = "Hold your tongue. The Horde needs unity.", next = "BACK", reply = "Hm. Unity, aye. I'll keep watching, though.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhistory = {
      lines = { { id = "yhistory_x", text = "Gul'dan exiled the Frostwolves for refusing the demons' bargain, and we fled into Alterac's peaks. There we sheltered young Thrall when he escaped his human masters. Drek'Thar taught him the elements. We are proud of that above all else." } },
      choices = {
        { text = "And the ring you wear on that cord?", next = "ymane" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymane = {
      lines = { { id = "ymane_x", text = "The rest of my mane, you mean. A Stormpike blade took it at Dun Baldar's bridge. I took his hand in return, and I wear his ring on a cord. Drek'Thar says it's vanity. Drek'Thar is right." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Grizzle Halfmane of the Frostwolf clan. Our home is the valley in Alterac where Durotan's people lived in exile, and the Stormpike dig into it as if it were theirs." },
        { id = "yh_orc", when = { race = "Orc" }, text = "Lok'tar, brother. It warms the blood to see an orc face among these cold halls. Speak, and I'll tell you of the valley." },
      },
      again = { { id = "h_again", text = "Speak, and quickly; the valley waits." } },
      choices = {
        { text = "Who are the Stormpike?", next = "stormpike" },
        { text = "Why does the valley matter so much?", next = "valley" },
        { text = "Send me to Alterac.", next = "BUSINESS" },
        { text = "How did you lose half your mane?", next = "gh_mane" },
        { text = "What is Drek'Thar like?", next = "gh_drek" },
        { text = "The Earth Mother watches over the Frostwolves.", next = "BACK", when = { race = "Tauren" }, reply = "Then I'll thank her, through you. The valley needs every blessing." },
        { text = "Do you miss the snows?", next = "ysnows" },
        { text = "What do you think of the Forsaken?", next = "yforsaken" },
        { text = "Tell me of the Frostwolf clan's history.", next = "yhistory" },
        { text = "Farewell.", next = "END" },
      },
    },
    stormpike = {
      lines = { { id = "s_default", text = "Dwarves out of Ironforge who came to dig for iron and old relics in our valley. They built a fortress at Dun Baldar, and they think a fortress makes them owners." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    valley = {
      lines = { { id = "v_default", text = "Durotan raised Thrall's people there, and Drek'Thar kept the clan alive through the long winters. A Frostwolf would sooner give up his own blood than give up that ground." } },
      choices = {
        { text = "Then the Frostwolves must hold it.", next = "BACK", reply = "We will, with your help. Lok'tar, {class}.", fx = { align = { order = 1 } } },
        { text = "Land is land. Share it and be done.", next = "BACK", reply = "Spoken like one who's never buried kin in it.", fx = { align = { order = -1 } } },
      },
    },
    gh_mane = {
      lines = { { id = "gh_m_default", text = "A Stormpike rifleman, from the ridge above Iceblood. The shot burned off half my hair and none of my head, and the clan has called me Halfmane ever since. I keep it this way, so the dwarves remember that they missed." } },
      choices = {
        { text = "What's it like to fight in that snow?", next = "gh_snow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gh_snow = {
      lines = { { id = "gh_s_default", text = "Cold enough to freeze a wolf to the ground, and the wind takes your war cry before anyone hears it. The dwarves are made for it, curse them. The Frostwolves were made for it too, in the long years of exile." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gh_drek = {
      lines = { { id = "gh_d_default", text = "Old and blind, and he sees more than any orc in the valley. He kept the clan alive when the rest of the Horde was penned in camps, and he gave Thrall back his name. When Drek'Thar speaks, even the wolves go quiet." } },
      choices = {
        { text = "Does he still lead in battle?", next = "gh_drek2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gh_drek2 = {
      lines = { { id = "gh_d2_default", text = "From Frostwolf Keep, with the spirits at his call. The Stormpike want his head more than they want the iron, I think. They'll have to climb a great many of us to reach it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    frostwolf = { { id = "ytp_fw", text = "The Frostwolves sheltered Thrall when no one else would. We'll shelter the valley the same way." } },
    stormpike = { { id = "ytp_sp", text = "The Stormpike dig in our valley as if it were theirs. Their maps will learn otherwise." } },
    thrall = { { id = "tp_thrall_x", text = "Son of Durotan, raised to the clan's name by Drek'Thar. The Frostwolves will follow him anywhere." } },
    alterac = { { id = "tp_alterac_x", text = "The mountains are ours by right of exile and blood. The Stormpike will learn it." } },
    advice = { { id = "tp_advice_x", text = "Dress warm and kill the riflemen first." } },
    _none = { { id = "tp_none", text = "I know snow and battle. Ask someone else about that." } },
  },
}

-- Brother Malach: Cult of Forgotten Shadows priest who runs the War Quarter pit fights.
P:NPC {
  key = "uc_brother_malach", id = TODO_NPC("Brother Malach"), name = "Brother Malach", gender = "male",
  bible = "bibles/townsfolk.md", role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "wry", "cold" }, values = { "curious" },
  impression = {
    first = "Brother Malach stands by the War Quarter pit with his hands folded in his sleeves like a friar at prayer, watching the fighters below with a bookmaker's eye.",
    third = "{name} met Brother Malach, the Forsaken priest who arranges the War Quarter's bouts.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. It's good to see a friendly face." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Make it quick, if you please. I've no time for you." },
    { id = "g_default", text = "Have you come to watch, {class}, or to bleed? Either way, there's a place for you here." },
  },
  start = "hello",
  nodes = {
    ywager = {
      lines = { { id = "ywager_x", text = "The crowd wagers, and the Cult receives a modest tithe. Coin keeps candles burning and the cages mended. I find the faithful pray far harder when they have silver riding on the outcome." } },
      choices = {
        { text = "Andrew Hartwell thinks you rig the bouts.", next = "yrig" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yrig = {
      lines = { { id = "yrig_x", text = "Andrew Hartwell thinks a great many things, all of them loudly. I do not rig the bouts. I merely choose the opponents, and the choice is a sermon of its own. Is that cheating, in your eyes?" } },
      choices = {
        { text = "Yes. A fight should be fair or not fought.", next = "BACK", reply = "Fairness. How very Lordaeron of you. The Scourge never offered us any.", fx = { align = { honor = 1 } } },
        { text = "No. The house always chooses. That's the game.", next = "BACK", reply = "Precisely. You'd make a fine deacon of the pit.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylife = {
      lines = { { id = "ylife_x", text = "I wore the robes of the Church of the Holy Light in a chapel near Hearthglen. I prayed for the plague to pass, and it did not, and the Light did not answer. When I woke dead, the Shadow did. I have been grateful ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ywins = {
      lines = { { id = "ywins_x", text = "No captive has won, yet. Edward and Tyler are too good, and I am too careful. But I have promised the crowd that a captive who wins will go free, and I would keep that promise. I think." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Brother Malach, of the Forgotten Shadow. I keep the bouts in this pit, and I mend the fighters afterward, because a priest of shadow knows exactly where a body breaks." },
        { id = "yh_priest", when = { class = "PRIEST" }, text = "A priest. You'll understand, then, that suffering is a teacher, and that I merely provide it with a classroom." },
      },
      again = { { id = "h_again", text = "Anything else? The next bout starts soon." } },
      choices = {
        { text = "Who fights here?", next = "fighters" },
        { text = "A priest running fights is an odd thing.", next = "priest" },
        { text = "Tell me of the Forgotten Shadow.", next = "shadow", when = { class = "PRIEST" } },
        { text = "Where do the captives come from?", next = "bm_captives" },
        { text = "Do the fighters ever die for good?", next = "bm_die" },
        { text = "I'm human. Would you put me in the pit?", next = "BACK", when = { race = "Human" }, reply = "Only if you asked nicely, or crossed the Dark Lady. Most of my guests did the latter." },
        { text = "Do you take wagers on the fights?", next = "ywager" },
        { text = "How did you come to the Forgotten Shadow?", next = "ylife" },
        { text = "What becomes of a captive who wins?", next = "ywins" },
        { text = "I'll watch from a distance.", next = "END" },
      },
    },
    fighters = {
      lines = { { id = "f_default", text = "Tyler and Edward, chiefly, two Forsaken who had some quarrel in life and found that death didn't end it. I put things in the pit with them, and the crowd watches to see whether they'll finally lose." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "p_default", text = "Not to us. The Light taught that suffering was a test; the Forgotten Shadow teaches that it's a lesson, and this pit is my classroom." } },
      choices = {
        { text = "Suffering teaches nothing but cruelty.", next = "BACK", reply = "You'd be surprised how many students disagree, once they've healed.", fx = { align = { light = 1 } } },
        { text = "Strength is learned through pain.", next = "BACK", reply = "Then you've already passed the first lesson, {class}.", fx = { align = { light = -1 } } },
      },
    },
    shadow = {
      lines = { { id = "s_default", text = "We turned from the Light when it turned from us, and we found that the shadow answers more honestly. Speak to Aelthalyste in the War Quarter if you want the full catechism." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bm_captives = {
      lines = { { id = "bm_c_default", text = "Scarlet zealots taken near Tirisfal, mostly, and the odd bandit the Deathguard catch on the roads. Every one of them would have burned us, given the chance. I give them a sword, which is more than they offered us." } },
      choices = {
        { text = "Then the pit is a kind of justice?", next = "bm_justice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bm_justice = {
      lines = { { id = "bm_j_default", text = "Justice is the Light's word, and I've put it away with the rest. I call it a lesson. The captives learn what they made of us, the fighters learn what they still are, and the crowd learns that it can still feel something." } },
      choices = {
        { text = "Captives deserve a quick death, not a show.", next = "BACK", reply = "A tidy sentiment. The Crusade gave us neither.", fx = { align = { honor = 1 } } },
        { text = "They chose their war. Let them fight in it.", next = "BACK", reply = "Just so. And they fight better than you'd think.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bm_die = {
      lines = { { id = "bm_d_default", text = "Not yet. I stitch them up after each bout, and Tyler complains that I sew crooked, and Edward complains that I sew at all. One day something in the pit will take them apart past mending, and I'll have to find new students." } },
      choices = {
        { text = "Would you mourn them?", next = "bm_mourn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bm_mourn = {
      lines = { { id = "bm_m_default", text = "The Forgotten Shadow doesn't mourn, {class}. We record. I'd write their names in the book and the number of bouts they won, and I'd read it to the next pair. That is a kind of mourning, I suppose, if you insist." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forgotten_shadow = { { id = "ytp_shadow", text = "The Forgotten Shadow asks nothing of us but honesty about what we have become." } },
    the_pit = { { id = "ytp_pit", text = "The pit is a chapel with a sandy floor, and every bout is a homily." } },
    forsaken = { { id = "tp_forsaken_x", text = "We learned what we are in the dark. The pit is just a smaller dark, with a crowd." } },
    scarlet_crusade = { { id = "tp_scarlet_crusade_x", text = "My best source of students. They never volunteer, though." } },
    _none = { { id = "tp_none", text = "Not my concern, {class}. My concern is in the pit." } },
  },
}

-- Jaycrue Copperpinch: Smokywood Pastures, Winter Veil (the dearer goods).
P:NPC {
  key = "uc_jaycrue_copperpinch", id = TODO_NPC("Jaycrue Copperpinch"), name = "Jaycrue Copperpinch", title = "Smokywood Pastures", gender = "female",
  bible = "bibles/townsfolk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "brisk", "cheerful" }, values = { "ambitious" },
  impression = {
    first = "Jaycrue Copperpinch has set out a Winter Veil stall in the Trade Quarter as though the Undercity's gloom were simply an untapped market.",
    third = "{name} met Jaycrue Copperpinch, a Smokywood Pastures goblin selling Winter Veil goods in the Undercity.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you, friend. I've been keeping an eye out for things you might want." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
    { id = "g_default", text = "Happy Winter Veil, sweetheart! Smokywood Pastures, finest holiday goods this side of the Great Sea, and no, I don't give samples." },
  },
  start = "hello",
  nodes = {
    yhow = {
      lines = { { id = "yhow_x", text = "Me and Nardstrum drew the short straws at the Smokywood meeting, didn't we? The cousins got Orgrimmar and Booty Bay, and we got a cellar full of corpses. Turns out corpses tip better, so who's laughing now?" } },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "They tip better? How?", next = "ytip" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytip = {
      lines = { { id = "ytip_x", text = "Dead folks remember the holiday from when they were alive, see. They buy the fancy stuff for kids who aren't around any more. It's sad, real sad, and real profitable. I don't charge them full price. Mostly." } },
      choices = {
        { text = "Then don't. Give the grieving a fair price.", next = "BACK", reply = "Fair price. Ugh. You sound like my mother. Fine, ten percent off for the mourners.", fx = { align = { honor = 1 } } },
        { text = "Charge them double. Grief pays.", next = "BACK", reply = "Hah! That's cold, pal. I like you, but I'm not doin' it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysmoky = {
      lines = { { id = "ysmoky_x", text = "Smokywood's a family business, or that's what the brochure says. Really it's three dozen cousins, a recipe for gingerbread and a very angry bookkeeper in Booty Bay. Greatfather Winter's on the payroll too, but don't quote me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ybuy = {
      lines = { { id = "ybuy_x", text = "Ornaments, mostly, and candles. Never cookies. A Forsaken tried one once and it came out the side of his jaw. I gave him a refund and a napkin." } },
      choices = {
        { text = "Anything here worry you?", next = "yworry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yworry = {
      lines = { { id = "yworry_x", text = "What keeps me up? The apothecaries. One of them bought every snowball I had last year and asked whether they'd keep. Keep for what, pal? I sold 'em anyway." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Jaycrue Copperpinch, the premium side of the Copperpinch operation. My brother Nardstrum over there sells the cheap stuff, and I sell the stuff people actually want to unwrap." },
        { id = "yh_troll", when = { race = "Troll" }, text = "A troll! Your people buy mistletoe by the armload, ya know, I've never asked why and I'm not gonna start now." },
      },
      again = { { id = "h_again", text = "What else, pal? Browsing's free, buying's better." } },
      choices = {
        { text = "Winter Veil in the Undercity?", next = "undercity" },
        { text = "You and Nardstrum compete?", next = "brother" },
        { text = "Show me the goods.", next = "BUSINESS" },
        { text = "What's the priciest thing on your stall?", next = "jc_price" },
        { text = "Do goblins even celebrate Winter Veil?", next = "jc_self" },
        { text = "Got anything big enough for a tauren?", next = "BACK", when = { race = "Tauren" }, reply = "Sweetheart, for a tauren I'll stitch two hats together. Double price, naturally." },
        { text = "How did you end up in the Undercity?", next = "yhow" },
        { text = "Who runs Smokywood Pastures?", next = "ysmoky" },
        { text = "Do the Forsaken buy much?", next = "ybuy" },
        { text = "Not today.", next = "END" },
      },
    },
    undercity = {
      lines = { { id = "u_default", text = "Listen, a corpse with gold is still a customer, and these folks remember the holiday from when they had pulses. They buy the gift wrap for nostalgia and the hats for irony, and I bill them for both." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother = {
      lines = { { id = "b_default", text = "Compete? We're diversified, sweetheart, so whichever way the customer's purse leans, a Copperpinch catches it. He keeps the volume, I keep the margins, and the Cartel keeps a cut of the whole festive mess." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    jc_price = {
      lines = { { id = "jc_p_default", text = "The gift-wrapped stuff, top shelf, the boxes with bows that sing when you open them. Costs me a copper to wrap and you a silver to unwrap, and that difference is called Winter Veil spirit, pal." } },
      choices = {
        { text = "Isn't that robbery?", next = "jc_rob" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jc_rob = {
      lines = { { id = "jc_r_default", text = "Robbery is when they don't come back next year. These folks come back every year, so I call it a relationship. Tell me honestly, do you think I should knock the prices down for the dead?" } },
      choices = {
        { text = "Charge what they'll pay. That's honest business.", next = "BACK", reply = "Finally, somebody gets it! You want a job?", fx = { align = { honor = -1 } } },
        { text = "Fleecing the grieving dead is low, even for a goblin.", next = "BACK", reply = "Low, sure, but profitable. Those are different shelves.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jc_self = {
      lines = { { id = "jc_s_default", text = "Sure, in Undermine we give each other receipts. Very sentimental. Greatfather Winter gets a cut of the season, so he's practically family, and family's what you invoice at cost." } },
      choices = {
        { text = "What did you get last year?", next = "jc_gift" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jc_gift = {
      lines = { { id = "jc_g_default", text = "A ledger from Nardstrum, with all his margins written in. Best gift I ever got. I used it to undercut him for a month." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    smokywood = { { id = "ytp_smoky", text = "Smokywood Pastures, finest holiday goods on both sides of the war, and that's a promise." } },
    nardstrum = { { id = "ytp_nard", text = "My brother undercuts everybody, mostly me. Family's like that." } },
    goblins = { { id = "tp_goblins_x", text = "We're the only folk who'll sell to everybody. Somebody's got to." } },
    forsaken = { { id = "tp_forsaken_x", text = "Great customers. Never hungry, never sleep, and they've got old money tucked in odd places." } },
    _none = { { id = "tp_none", text = "Can't sell you that, so I can't say I care about it." } },
  },
}

-- Nardstrum Copperpinch: Smokywood Pastures, Winter Veil (the cheaper goods).
P:NPC {
  key = "uc_nardstrum_copperpinch", id = TODO_NPC("Nardstrum Copperpinch"), name = "Nardstrum Copperpinch", title = "Smokywood Pastures", gender = "male",
  bible = "bibles/townsfolk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "loud", "cheerful" }, values = { "ambitious" },
  impression = {
    first = "Nardstrum Copperpinch shouts his Winter Veil prices across the Trade Quarter canal, cheerfully undercutting nobody but his own sister.",
    third = "{name} met Nardstrum Copperpinch, a goblin selling cheap Winter Veil treats in the Undercity.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. For a regular like you, I'll find the better stock from the back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The prices are what they are, and I'm not in a haggling mood." },
    { id = "g_default", text = "Greatfather Winter's best prices, buddy, right here! Cookies, cocoa, candy canes, and all of it priced for a working stiff, if you'll pardon the expression." },
  },
  start = "hello",
  nodes = {
    yhow = {
      lines = { { id = "yhow_x", text = "Smokywood sends one Copperpinch to each city. Jaycrue got here first and set up shop with the fancy goods, so I set up across the canal with the cheap ones. Competition, pal, it's the true spirit of Winter Veil." } },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Is it really competition, or a scheme?", next = "yscheme" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yscheme = {
      lines = { { id = "yscheme_x", text = "Okay, between us? We split the profits at the end of the season. She's the high price, I'm the low price, and everybody thinks they're getting a bargain from one of us. Is that cheating, really?" } },
      choices = {
        { text = "Yes. Your customers think they have a choice.", next = "BACK", reply = "Aw, come on. They do have a choice. Both choices are just us.", fx = { align = { honor = 1 } } },
        { text = "No. That's just good business.", next = "BACK", reply = "See? You get it. I'll throw in a free candy cane.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybest = {
      lines = { { id = "ybest_x", text = "The Deathguard. They buy hats. Lots of hats. I think they like having something on their heads that isn't a helmet. One of 'em bought eleven." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yprofit = {
      lines = { { id = "yprofit_x", text = "Volume, pal! Sell a thousand cookies at a copper profit and you've got ten silver. Sell 'em to the dead, who don't eat 'em, and they come back for more decorations. It's beautiful." } },
      choices = {
        { text = "Anything threaten the business?", next = "yworry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yworry = {
      lines = { { id = "yworry_x", text = "Venture Company's sniffing around holiday markets, I hear. If they muscle in on Smokywood, we're all out of business. Don't spread that around, it's bad for the season." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Nardstrum Copperpinch, Smokywood Pastures, value line. My sister Jaycrue handles the fancy merchandise, and I handle everybody who's actually got to count their coppers." },
        { id = "yh_orc", when = { race = "Orc" }, text = "An orc! You lot love a good holiday ham, I know it. Got a deal for you, pal, a real steal, practically criminal." },
        { id = "yh_scourge", when = { race = "Scourge" }, text = "Hey, a Forsaken customer! You don't eat, I don't judge. Have a look at the hats, they're very popular with your crowd." },
      },
      again = { { id = "h_again", text = "Anything else? Cocoa's gettin' cold, and so's everybody." } },
      choices = {
        { text = "Do the Forsaken even eat cookies?", next = "eat" },
        { text = "Who is Greatfather Winter?", next = "greatfather" },
        { text = "What are you selling?", next = "BUSINESS" },
        { text = "Is your sister really the smart one?", next = "nc_sister" },
        { text = "Cheap or fair, which is your price?", next = "nc_price" },
        { text = "I'm a troll, mon. Got any rum cocoa?", next = "BACK", when = { race = "Troll" }, reply = "Rum cocoa! Not on the list, buddy, but give me a minute and a barrel." },
        { text = "How did you end up in the Undercity?", next = "yhow" },
        { text = "Who's your best customer?", next = "ybest" },
        { text = "How do you undercut and still profit?", next = "yprofit" },
        { text = "Goodbye.", next = "END" },
      },
    },
    eat = {
      lines = { { id = "e_default", text = "Eat 'em, no, but they buy 'em and leave 'em on graves, which is a market I never saw comin'. The trolls and orcs passin' through eat plenty, so the stock moves either way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    greatfather = {
      lines = { { id = "greatfather_default", text = "The jolly fella in Orgrimmar with the beard and the presents, and the best mascot Smokywood ever signed. The dwarves call him something else on their side, but the cookies cost the same." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nc_sister = {
      lines = { { id = "nc_s_default", text = "She's the smart one with the expensive boxes, sure. But I move six crates to her one, and at the end of the season we compare ledgers, and she goes very quiet. A goblin who goes quiet is a goblin who lost." } },
      choices = {
        { text = "So who wins, in the end?", next = "nc_wins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nc_wins = {
      lines = { { id = "nc_w_default", text = "The Cartel wins, buddy, it always does. But I win more often than Jaycrue tells people. Don't tell her I told you that, because she'll raise her prices just to spite me." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    nc_price = {
      lines = { { id = "nc_p_default", text = "Cheap's my whole line, pal. A working stiff should get a candy cane for a copper, even down here. Jaycrue says I'm leaving money on the table, and I say the table's where folks can reach it." } },
      choices = {
        { text = "A fair price for working folk is the right way.", next = "BACK", reply = "See? You get it. Have a cookie, on me. Well, at cost.", fx = { align = { honor = 1 } } },
        { text = "Cheap is just bad business. Charge more.", next = "BACK", reply = "You sound just like my sister. I hope you're happy.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    jaycrue = { { id = "ytp_jay", text = "My sister charges too much and smiles while she does it. I love her for it." } },
    winter_veil = { { id = "ytp_wv", text = "Greatfather Winter brings gifts, and Smokywood sells the wrapping paper." } },
    goblins = { { id = "tp_goblins_x", text = "Kezan, Undermine, Booty Bay, wherever there's a coin. That's goblin country." } },
    advice = { { id = "tp_advice_x", text = "Buy your cocoa early. By the end of the week, even I raise the price." } },
    _none = { { id = "tp_none", text = "No idea, pal, but I've got a candy cane that'll take your mind off it." } },
  },
}

-- Senior Sergeant Grimsford: War Effort Recruiter, Trade Quarter.
P:NPC {
  key = "uc_senior_sergeant_grimsford", id = TODO_NPC("Senior Sergeant Grimsford"), name = "Senior Sergeant Grimsford", title = "War Effort Recruiter", gender = "male",
  bible = "bibles/townsfolk.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "gruff", "brisk" }, values = { "duty", "practical" },
  impression = {
    first = "Senior Sergeant Grimsford stands behind a table of ledgers in the Trade Quarter, tallying copper bars and linen bandages as though the fate of Kalimdor depended on his arithmetic.",
    third = "{name} met Senior Sergeant Grimsford, who collects supplies in the Undercity for the Horde's war effort.",
  },
  greetings = {
    { id = "g_default", text = "You there, {class}! The Horde is gathering for war in the south, and the war needs more than swords. Have you any supplies to spare?" },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "A quartermaster sergeant in the Lordaeron army, posted at the Capital City garrison. I counted every boot and every blade. When Arthas returned, I counted the dead instead, and I've never quite stopped." } },
      choices = {
        { text = "You were there when the king died?", next = "yking" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yking = {
      lines = { { id = "yking_x", text = "I was in the stores beneath the throne room, tallying flour sacks for the victory feast. I heard the crowd cheer, and then I heard it stop. Forty-two sacks of flour, I wrote, and then I put my pen down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yeffort = {
      lines = {
        { id = "yeffort_tauren", when = { race = "Tauren" }, text = "Thunder Bluff's tallies come in on time, which I'll say for the tauren. There's a gate in Silithus, shut with old magic, and the Horde means to be ready when it opens. Bring me meat and herbs, and the Bloodhoof will stay ahead of Orgrimmar." },
        { id = "yeffort_x", text = "There's a gate in Silithus, shut with old magic, and the Horde means to be ready when it opens. Copper, linen, herbs and meat. All of it. Every city counts, and the Undercity will not be last on my watch." },
      },
      choices = {
        { text = "Should we work with the Alliance on this?", next = "yalliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yalliance = {
      lines = { { id = "yalliance_x", text = "There's talk of it, aye, of the two war efforts sharing the burden. Myself, I'd sooner count only our own crates. What do you say, should the Horde go it alone?" } },
      choices = {
        { text = "Alone. We can't trust the Alliance's tallies.", next = "BACK", reply = "Exactly my view. Our crates, our numbers, our victory.", fx = { align = { honor = -1 } } },
        { text = "Together. Whatever's behind that gate threatens all of us.", next = "BACK", reply = "Perhaps. I'll count both, then, and see which grows faster.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywrong = {
      lines = { { id = "ywrong_x", text = "Never. Once, a crate of linen came in three bolts short, and I walked to Brill to find the missing bolts. They'd been used to bandage a Deathguard. I wrote that down too." } },
      choices = {
        { text = "Are you related to Reginald Grimsford?", next = "yreginald" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yreginald = {
      lines = { { id = "yreginald_x", text = "Reginald? My nephew, walking about with those two idlers in the Magic Quarter. He could have been a quartermaster. He chose to be a gentleman instead, which is a waste of perfectly good arithmetic." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Senior Sergeant Grimsford, recruiter for the war effort. The Warchief has called on every city of the Horde to send supplies, and the Undercity will not be the city that sent the least." },
        { id = "yh_orc", when = { race = "Orc" }, text = "An orc, good. Orgrimmar sends its tallies late every week, so perhaps you can tell me why. No? Then bring me linen." },
      },
      again = { { id = "h_again", text = "Next question, {class}. I've ledgers to fill." }, { id = "h_again2", text = "Anything else? Make it quick." } },
      choices = {
        { text = { normal = "What war is this?", polite = "Which war is the Horde preparing for, Sergeant?", blunt = "What war?" }, next = "war" },
        { text = "What supplies do you need?", next = "need" },
        { text = "You count everything twice, don't you?", next = "count" },
        { text = "I've brought supplies.", next = "brought", when = { minLevel = 20 } },
        { text = "Who were you before?", next = "ylife" },
        { text = "What's the war effort for?", next = "yeffort" },
        { text = "Are your numbers ever wrong?", next = "ywrong" },
        { text = "I'll be back.", next = "END" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "Something stirs in Silithus, beyond the deserts of Tanaris, and the Cenarion Circle says it's older and worse than anything we've faced. The Warchief means to be ready, and readiness is built out of bandages and bars." } },
      choices = {
        { text = "The Alliance is gathering too, I hear.", next = "alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alliance = {
      lines = { { id = "a_default", text = "They are, in Ironforge, and they're counting their bars as fast as we count ours. For once, the Horde and the Alliance are racing toward the same enemy, and I'd like us to win the race." } },
      choices = {
        { text = "Then we should share the effort.", next = "BACK", reply = "Share? I'll share a battlefield with them, {class}, not a warehouse.", fx = { align = { order = -1 } } },
        { text = "The Horde must arrive first and strongest.", next = "BACK", reply = "Exactly so. Now go and help me make it happen.", fx = { align = { order = 1 } } },
      },
    },
    need = {
      lines = { { id = "n_default", text = "Metal bars, cloth, herbs, leather and food, by the crate. Each city has its own list, and mine is posted here for anyone with eyes, so read it and bring what you can." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    count = {
      lines = { { id = "c_default", text = "Three times, if you must know. A soldier who loses count of his arrows dies, and a quartermaster who loses count of his crates kills a whole company." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brought = {
      lines = { { id = "b_default", text = "Then set it on the table and let me tally it. Every crate goes into the ledger beside your name, and the Warchief reads the ledgers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    war_effort = { { id = "ytp_we", text = "Copper bars and linen bandages. That's how wars are won, not with speeches." } },
    reginald_grimsford = { { id = "ytp_reg", text = "My nephew walks. That's all he does. I'd give him a ledger if he'd hold still." } },
    _none = { { id = "tp_none", text = "If it's not on my list, {class}, it's not my concern." } },
  },
}

-- Apothecary Katrina: Royal Apothecary Society, patrols the Apothecarium and Trade Quarter.
P:NPC {
  key = "uc_apothecary_katrina", id = TODO_NPC("Apothecary Katrina"), name = "Apothecary Katrina", title = "Royal Apothecary Society", gender = "female",
  bible = "bibles/townsfolk.md", role = "citizen", tier = "service",
  communities = { "undercity", "apothecarium" }, temper = { "wry", "precise" }, values = { "curious" },
  impression = {
    first = "Apothecary Katrina moves between the Apothecarium and the Trade Quarter with a satchel of corked vials, and she smells faintly, oddly, of perfume.",
    third = "{name} met Apothecary Katrina, a member of the Royal Apothecary Society who walks the Undercity's rings.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you. Come, stay a while." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Say what you need, and then go." },
    { id = "g_default", text = "Mind the satchel, {class}. Half of it heals and half of it doesn't, and I'd rather not find out which half broke." },
  },
  start = "hello",
  nodes = {
    yfaranell = {
      lines = { { id = "yfaranell_x", text = "Samples, mostly, and discretion always. I carry reagents from the Trade Quarter down to the Apothecarium and I carry nothing back up but my own good manners. The perfume helps people forget where I've been." } },
      choices = {
        { text = "Where have you been, then?", next = "ywhere" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywhere = {
      lines = { { id = "ywhere_x", text = "In rooms where the subjects stop screaming after the first hour. I tell myself they were Scarlets, and mostly they were. I've learned not to look too closely at the ones who weren't." } },
      choices = {
        { text = "Then stop. Some things can't be justified.", next = "BACK", reply = "Stop? And be the next subject? You're kinder than this city can afford.", fx = { align = { light = 1 } } },
        { text = "The Scourge made us. We'll unmake the living.", next = "BACK", reply = "That's what the Society says, word for word. I'll pretend it comforts me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydoubt = {
      lines = { { id = "ydoubt_x", text = "Doubt is for alchemists who haven't seen what the Lich King does to a village. I have. Whatever we brew below, it will be aimed at him first, or so we are told, and I choose to believe it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ytrade = {
      lines = { { id = "ytrade_x", text = "The Trade Quarter is all noise and bargaining, and the Apothecarium is all quiet and screaming. I prefer the Trade Quarter, though I'd never say so to Master Faranell." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yforsaken = {
      lines = { { id = "yforsaken_x", text = "Your part is to keep your head down and your vials corked, like the rest of us. The Society remembers who helps it, and it remembers who asks questions too. Try to be remembered for the first." } },
      choices = {
        { text = "What do you make of the Trade Quarter?", next = "ytrade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Apothecary Katrina, of the Royal Apothecary Society. I carry samples between the Apothecarium and the merchants, which is the Society's way of keeping a junior member busy." },
        { id = "yh_troll", when = { race = "Troll" }, text = "A troll. Your people know their herbs, I'm told, though I doubt they ever brewed anything quite like what we do." },
      },
      again = { { id = "h_again", text = "Something else? I'm expected below." } },
      choices = {
        { text = "You smell of perfume.", next = "perfume" },
        { text = "What does the Society work on?", next = "work" },
        { text = "The innkeeper sells perfume?", next = "ak_norman" },
        { text = "How did you come to join the Society?", next = "ak_join" },
        { text = "I brew potions myself.", next = "BACK", when = { profession = "Alchemy" }, reply = "Then mind your hands, {class}. The Society's vials are not your sort of potion." },
        { text = "What does Master Faranell ask of you?", next = "yfaranell" },
        { text = "Do you ever doubt the work?", next = "ydoubt" },
        { text = "I'm Forsaken. What's my part in this?", next = "yforsaken", when = { race = "Scourge" } },
        { text = "Safe travels.", next = "END" },
      },
    },
    perfume = {
      lines = { { id = "p_default", text = "From Norman, the innkeeper, if you can believe it. A Forsaken ought to smell of embalming salts, but I find it helps the merchants forget what they're bargaining with." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work = {
      lines = { { id = "w_default", text = "Cures for the Scourge's plague, officially, and other things less officially. Master Apothecary Faranell keeps the real work behind locked doors, and I'm not yet senior enough to see behind them." } },
      choices = {
        { text = "A new plague, perhaps?", next = "plague" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plague = {
      lines = { { id = "pl_default", text = "I didn't say that, {class}, and you didn't hear it. Ask Faranell if you're curious, and see how long you remain curious afterwards." } },
      choices = {
        { text = "A weapon against the living is only fair.", next = "BACK", reply = "Hush. Fair or not, keep it to yourself.", fx = { align = { light = -1 } } },
        { text = "That would be a grave mistake.", next = "BACK", reply = "Perhaps it would. Most mistakes here are grave ones, literally.", fx = { align = { light = 1 } } },
      },
    },
    ak_norman = {
      lines = { { id = "ak_n_default", text = "Innkeeper Norman, by the Trade Quarter. He keeps a few bottles of scent behind the bar for guests who would rather not notice the canals, and he sells them to me at a discount, since I am the only one who asks." } },
      choices = {
        { text = "Why does perfume matter to you?", next = "ak_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ak_why = {
      lines = { { id = "ak_w_default", text = "I was a perfumer's apprentice in life, in a shop off the palace square. The Society took me on because I can tell one compound from another by smell. I think they'd rather I forgot the perfume part." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ak_join = {
      lines = { { id = "ak_j_default", text = "I woke in Deathknell and walked to the city with nothing but my nose. The Society tested me with forty unlabelled jars, and I named thirty-nine. The fortieth was something I still don't care to name." } },
      choices = {
        { text = "What was in the fortieth jar?", next = "ak_jar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ak_jar = {
      lines = { { id = "ak_ja_default", text = "Something with plague in it, and something older underneath. I knew the smell from the last week in the capital, when the grain carts came. I told them so, and they promoted me on the spot." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    faranell = { { id = "ytp_faranell", text = "Master Faranell keeps his secrets in jars, and I'd advise you to leave the lids alone." } },
    apothecarium = { { id = "ytp_apoth", text = "The Apothecarium never sleeps, and neither do we, which suits the work better than it suits the workers." } },
    forsaken = { { id = "tp_forsaken_x", text = "We smell like what we are. Some of us would rather not, and I can help with that." } },
    new_plague = { { id = "tp_new_plague_x", text = "I didn't say anything, {class}. My nose is very discreet." } },
    _none = { { id = "tp_none", text = "Not in my notes, {class}. Try the Apothecarium library." } },
  },
}

-- Apothecary Lycanus: Royal Apothecary Society, patrols the city.
P:NPC {
  key = "uc_apothecary_lycanus", id = TODO_NPC("Apothecary Lycanus"), name = "Apothecary Lycanus", title = "Royal Apothecary Society", gender = "male",
  bible = "bibles/townsfolk.md", role = "citizen", tier = "service",
  communities = { "undercity", "apothecarium" }, temper = { "cold", "exacting" }, values = { "ambitious", "curious" },
  impression = {
    first = "Apothecary Lycanus walks the canals with a notebook open, observing the living who pass him with the careful interest of a man studying insects.",
    third = "{name} met Apothecary Lycanus, a cold-eyed member of the Royal Apothecary Society.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you. Come, stay a while." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'd rather you were brief today." },
    { id = "g_default", text = "Stand still a moment, {class}. No, no reason, I was simply noting your colour." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "A physician's apprentice in Lordaeron, writing down the symptoms of plague victims in a neat hand while they died. I suppose I never stopped. The only difference is that now nobody asks me to cure them." } },
      choices = {
        { text = "Do you remember any of them?", next = "yremember" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yremember = {
      lines = { { id = "yremember_x", text = "A baker's boy with a fever that would not break. I wrote eleven pages on him. He rose a week later, mindless, and the Deathguard put him down. I still have the pages somewhere, and I cannot bring myself to burn them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ynotes = {
      lines = { { id = "ynotes_x", text = "They go to the Apothecarium, to Master Faranell's desk, and from there I do not know. I have noticed that the questions sent back to me grow narrower and narrower, as if someone below is aiming at something very small." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ywill = {
      lines = { { id = "ywill_x", text = "I have not been asked to. I expect that I will be, one day, and I have been trying to decide what I shall say. You seem to have an opinion. Tell me, and I will write it down." } },
      choices = {
        { text = "Refuse. A citizen of the city deserves better.", next = "BACK", reply = "Noted, with the date. I suspect the Society will disagree with you.", fx = { align = { order = -1 } } },
        { text = "Obey. The Society serves the Dark Lady.", next = "BACK", reply = "Noted. That is the answer I expected to write, and I am oddly sorry to.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycanals = {
      lines = { { id = "ycanals_x", text = "The canals carry everything the city wants rid of, and everything floats eventually. I have learned more about the Undercity from what drifts past the Trade Quarter than from any book in the Magic Quarter." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Apothecary Lycanus. I study how things decay, which in the Undercity gives me no shortage of subjects." },
        { id = "yh_tauren", when = { race = "Tauren" }, text = "A tauren, and such a quantity of living tissue. Forgive me if I stare, the notebook has not seen one so closely." },
      },
      again = { { id = "h_again", text = "Something further? I'm taking notes regardless." } },
      choices = {
        { text = "What are you writing about me?", next = "notes" },
        { text = "Where do you find your subjects?", next = "subjects" },
        { text = "What have you learned about decay?", next = "al_decay" },
        { text = "Do you study yourself as well?", next = "al_self" },
        { text = "Who were you before the Society?", next = "ylife" },
        { text = "What happens to your notes?", next = "ynotes" },
        { text = "Would you study a Forsaken against their will?", next = "ywill" },
        { text = "I'll be going now.", next = "END" },
      },
    },
    notes = {
      lines = {
        { id = "n_default", text = "Height, gait, the healthy flush you'd probably rather keep. The Society finds it useful to know how the living hold up against our more ambitious tinctures." },
        { id = "n_undead", when = { race = "Scourge" }, text = "That your stitching is holding and your jaw is properly set. Someone did good work on you, which is rarer than you'd think." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    subjects = {
      lines = { { id = "s_default", text = "The Plaguelands, Silverpine and Hillsbrad, wherever the Society has outposts. Gnolls, wolves and the occasional Scarlet volunteer, though they rarely volunteer as willingly as they ought." } },
      choices = {
        { text = "Science needs subjects. That's how it is.", next = "BACK", reply = "Precisely. You would make a fine apothecary, or a fine subject.", fx = { align = { light = -1 } } },
        { text = "That sounds like cruelty with a notebook.", next = "BACK", reply = "All science looks like cruelty to the subject, {class}.", fx = { align = { light = 1 } } },
      },
    },
    al_decay = {
      lines = { { id = "al_d_default", text = "That it is slower in the Undercity than in the Plaguelands, because the Society's salts hold us together. Remove the salts, and a Forsaken lasts about as long as an apple in a sack. I find that clarifying." } },
      choices = {
        { text = "What happens when a Forsaken decays entirely?", next = "al_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    al_end = {
      lines = { { id = "al_e_default", text = "Bones and a stain, and sometimes a voice for a little while after. The Society has records of that. I'll not tell you what the voices say, because I don't believe you'd sleep afterwards, if you sleep at all." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    al_self = {
      lines = { { id = "al_s_default", text = "Every morning. My left hand is losing its third finger slowly, and I record the rate. It is the most dependable subject I have, and the only one who has never once complained to Faranell." } },
      choices = {
        { text = "Does it frighten you?", next = "al_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    al_fear = {
      lines = { { id = "al_f_default", text = "Fear is a measurement like any other. It peaks at night, when the canals are quiet. I have written it down, and once a thing is written down, it belongs to me rather than the other way around." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    canals = { { id = "ytp_canals", text = "Watch the green water long enough and the whole city's diet floats past you." } },
    faranell = { { id = "ytp_faranell", text = "Master Faranell reads my notes without comment, which in him is high praise." } },
    scourge = { { id = "tp_scourge_x", text = "The Scourge preserve their dead with necromancy. We use chemistry. Ours lasts longer, in my notes." } },
    forsaken = { { id = "tp_forsaken_x", text = "Fascinating subjects, every one. Myself included." } },
    _none = { { id = "tp_none", text = "I haven't observed that. Bring me a sample and I'll tell you." } },
  },
}

-- Midsummer Merchant: by the bonfire during the Midsummer Fire Festival.
P:NPC {
  key = "uc_midsummer_merchant", id = TODO_NPC("Midsummer Merchant"), name = "Midsummer Merchant", gender = "male",
  bible = "bibles/townsfolk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "cheerful", "dry" }, values = { "practical" },
  impression = {
    first = "The Midsummer merchant keeps his stall by the festival bonfire and stays exactly far enough from it, as any Forsaken should.",
    third = "{name} met a merchant selling goods for the Midsummer Fire Festival in the Undercity.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back! You're one of the few who pays fair and talks civil, and I don't forget it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
    { id = "g_default", text = "Midsummer greetings, {class}. Come and buy something festive, and please don't push me toward the fire." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "A candlemaker in Brill, of all the trades for a Forsaken to remember. I made the festival tapers every summer. My wife wove the garlands, and our daughter sold them by the bridge." } },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What happened to them?", next = "yfamily" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfamily = {
      lines = { { id = "yfamily_x", text = "My wife fled south when the plague came. I heard she reached Southshore. Our daughter didn't make the road. I sell these garlands because I remember how she tied them. I don't know if that's mourning or business." } },
      choices = {
        { text = "Find your wife. She may still be there.", next = "BACK", reply = "And let her see me like this? I'll think on it, but I doubt it.", fx = { align = { order = -1 } } },
        { text = "Let her go. You belong to the city now.", next = "BACK", reply = "Aye, that's what the Deathguard tell me. I suppose they're right.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ypopular = {
      lines = { { id = "ypopular_x", text = "The fire-red ribbons sell to the living and the black candles sell to the dead. The trolls buy everything, and the orcs buy nothing but cider. The Earthen Ring buy the incense and pretend it's for ritual purposes." } },
      choices = {
        { text = "What do the Earthen Ring make of you?", next = "yring" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfrighten = {
      lines = { { id = "yfrighten_x", text = "Every moment I stand here. That's why I took the stall, I think. If I can sell garlands beside a bonfire all summer, I can face whatever else the world throws at me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yring = {
      lines = { { id = "yring_x", text = "The Earthen Ring's shamans say the fire honours the elements, and the elements keep the world turning. I don't argue with them. They pay promptly and they've never once tried to set me alight." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I sell the season's trinkets for the Fire Festival, which is a strange trade for a man who'd burn like dry kindling. Still, the Earthen Ring pays its vendors well." },
        { id = "yh_tauren", when = { race = "Tauren" }, text = "A tauren at the fire! You'll know the old rites, I'd wager. Come, buy a garland, and stand on that side of me, if you would." },
        { id = "yh_scourge", when = { race = "Scourge" }, text = "One of us, at the fire festival! Stand back with me, friend. We'll buy the ribbons and let the living do the jumping." },
      },
      again = { { id = "h_again", text = "Anything else, {class}?" } },
      choices = {
        { text = "Why would the Forsaken celebrate fire?", next = "fire" },
        { text = "What's the festival about?", next = "festival" },
        { text = "Let me see what you sell.", next = "BUSINESS" },
        { text = "Do you remember Midsummer in Lordaeron?", next = "mm_memory" },
        { text = "Who are the Earthen Ring?", next = "mm_ring" },
        { text = "The elements bless the fire, merchant.", next = "BACK", when = { class = "SHAMAN" }, reply = "Then tell them to bless it from a little further away, if you would." },
        { text = "Who were you before you died?", next = "ylife" },
        { text = "What's your most popular item?", next = "ypopular" },
        { text = "Does fire still frighten you?", next = "yfrighten" },
        { text = "Happy Midsummer.", next = "END" },
      },
    },
    fire = {
      lines = { { id = "f_default", text = "Because fire is the one thing that frightens the Scourge as much as it frightens us. We light the bonfire and stand well back from it, and that's as good a celebration as any." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    festival = {
      lines = { { id = "fe_default", text = "The longest day of the year, kept by the shamans and their Earthen Ring. You honour the flames in your own cities and steal them from the Alliance's, which is the part most of the Horde enjoys." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mm_memory = {
      lines = { { id = "mm_m_default", text = "In Brill we jumped the bonfire on the longest night, the young ones, for luck in love. I jumped it three years running and married a girl who didn't. Now I'd go up like a straw doll if I tried, so I sell other people the jumping." } },
      choices = {
        { text = "And what of stealing the Alliance's flames?", next = "mm_steal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mm_steal = {
      lines = { { id = "mm_s_default", text = "The Horde goes to Ironforge and Stormwind and carries off their city flames, and they do the same to us. It's sport, mostly. Some say it shames the holiday, and some say a flame stolen from your enemy burns sweeter." } },
      choices = {
        { text = "A sacred fire should be honoured, not stolen.", next = "BACK", reply = "You'd have got on with my wife. She never jumped either.", fx = { align = { honor = 1 } } },
        { text = "Take their fire. It's war, even on holidays.", next = "BACK", reply = "Spoken like a true Horde. Bring it back without burning me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mm_ring = {
      lines = { { id = "mm_r_default", text = "Shamans of every race who listen to the elements and pay merchants like me to sell their trinkets. They keep the festival so the elements remember we're grateful. I'm grateful too, from a safe distance." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    midsummer = { { id = "ytp_mid", text = "The longest day of the year, and the longest I spend near a fire." } },
    brill = { { id = "ytp_brill", text = "Brill had the best Midsummer in the kingdom, before. Now it has the best graveyard." } },
    lordaeron = { { id = "tp_lordaeron_x", text = "We had bonfires on every hill at Midsummer. I could see four from my door." } },
    forsaken = { { id = "tp_forsaken_x", text = "Fire is the one thing we fear and still celebrate. That's very Forsaken, if you think about it." } },
    _none = { { id = "tp_none", text = "I only know what's on my stall, {class}." } },
  },
}

-- Edward Remington: Tabard Designer, Trade Quarter.
P:NPC {
  key = "uc_edward_remington", id = TODO_NPC("Edward Remington"), name = "Edward Remington", title = "Tabard Designer", gender = "male",
  bible = "bibles/townsfolk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "prim", "proud" }, values = { "craft" },
  notices = { "craft" },
  impression = {
    first = "Edward Remington sits among swatches and dye pots in the Trade Quarter, holding colours up to the green lamplight and frowning at all of them.",
    third = "{name} met Edward Remington, who designs guild tabards in the Undercity.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. For a regular like you, I'll find the better stock from the back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The prices are what they are, and I'm not in a haggling mood." },
    { id = "g_default", text = "Ah, a client, or at least someone standing near enough to become one. Do you have a guild, {class}, and does it have taste?" },
  },
  start = "hello",
  nodes = {
    yfinest = {
      lines = { { id = "yfinest_x", text = "A tabard for a knight of the Silver Hand, worked in white and gold, with a lion so fine it seemed to breathe. I cannot remember his name. I remember every stitch of the lion, which tells you what kind of man I was." } },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Would you make such a thing again?", next = "yagain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yagain = {
      lines = { { id = "yagain_x", text = "The Silver Hand casts us out and burns our kind on sight. And yet that lion was the best work of my life. Should I let it go, or should I stitch it again, for my own eyes, and hang it in the dark?" } },
      choices = {
        { text = "Stitch it. Beauty doesn't belong to the Light.", next = "BACK", reply = "Then I shall, very quietly, and show nobody but you.", fx = { align = { light = -1 } } },
        { text = "Let it go. That light isn't ours any more.", next = "BACK", reply = "Perhaps you're right. I'll sew bats and skulls like everyone else.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydevice = {
      lines = { { id = "ydevice_x", text = "The Forsaken have taken purple and black, with the Horde's mark where the old crowns used to sit. It's a good device, simple and grim. I wish I'd been asked, but nobody consults the tailors." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ydead = {
      lines = { { id = "ydead_x", text = "All my customers are dead, or nearly. The trick is fitting the cloth over a ribcage that shows. Leave room at the shoulders, tack the hem, and never use pins near anything that might fall off." } },
      choices = {
        { text = "How do you see colours in this light?", next = "ydyes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ydyes = {
      lines = { { id = "ydyes_x", text = "Green lamps eat red alive and turn blue to slate. I carry a little shard of sunstone in my pocket and hold the cloth under it, which a mage sold me for far too much. It works, mostly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Edward Remington, tabard designer. I stitch a guild's colours and crest onto a tabard, and I try to dissuade them from choosing pink." },
        { id = "yh_orc", when = { race = "Orc" }, text = "An orc. Your clan banners are wonderfully bold, you know. Red on black, never a stitch wasted. I envy them." },
      },
      again = { { id = "h_again", text = "Anything else, before I lose the light?" } },
      choices = {
        { text = "What makes a good tabard?", next = "good" },
        { text = "Colours are hard to see down here.", next = "light" },
        { text = "I'd like to design a tabard.", next = "BUSINESS" },
        { text = "Who did you design for in life?", next = "er_life" },
        { text = "What would you design for me?", next = "er_me" },
        { text = "What's your finest work?", next = "yfinest" },
        { text = "Does the Dark Lady have a herald's device?", next = "ydevice" },
        { text = "Do you ever design for the dead?", next = "ydead" },
        { text = "Not today.", next = "END" },
      },
    },
    good = {
      lines = { { id = "good_default", text = "Two colours, one emblem, and restraint. Lordaeron's old houses understood that, and their banners could be read across a battlefield, but every guild now wants six colours and a dragon." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "l_default", text = "It is the bane of my profession. Everything under these lamps looks the colour of pond water, so I take my samples up to the ruins to see them in daylight, and the Deathguard think I'm mad." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    er_life = {
      lines = { { id = "er_l_default", text = "The heralds of Lordaeron's lesser houses, the ones who wanted a coat of arms without paying a heraldist. I painted lions for barons who owned three goats. The lions were very good, and the barons are all gone." } },
      choices = {
        { text = "Should the Forsaken wear Lordaeron's colours still?", next = "er_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    er_stance = {
      lines = { { id = "er_s_default", text = "Some of the guilds ask for the old blue and gold. I stitch it, of course, but it sits strangely on a corpse. The Dark Lady's people wear purple and black now, and some say we should forget the old banner entirely." } },
      choices = {
        { text = "Lordaeron's colours are ours by right. Wear them proudly.", next = "BACK", reply = "A traditionalist! I'll give you the gold thread at cost.", fx = { align = { order = 1 } } },
        { text = "Burn the old banners. We're something new now.", next = "BACK", reply = "Bold, if a bit dramatic. Purple suits you, I think.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    er_me = {
      lines = {
        { id = "er_m_rogue", when = { class = "ROGUE" }, text = "Black on black, naturally, with an emblem nobody can make out at twenty paces. I've done a dozen for the Rogues' Quarter." },
        { id = "er_m_warlock", when = { class = "WARLOCK" }, text = "Green fel on purple, I suppose, since your lot insist. I'll make it tasteful if it kills me again." },
        { id = "er_m_default", text = "Something sober. A single charge on a plain field, two colours, and nothing that glows. Restraint is very fashionable among the dead, since we've had enough excitement." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    silver_hand = { { id = "ytp_sh", text = "The Silver Hand had the finest tabards in all the kingdoms, and the worst opinion of us." } },
    trade_quarter = { { id = "ytp_tq", text = "The Trade Quarter is noisy, damp and full of customers. I couldn't ask for more." } },
    lordaeron = { { id = "tp_lordaeron_x", text = "The old houses had the best heraldry in the north. Their banners are mostly ash now." } },
    advice = { { id = "tp_advice_x", text = "Two colours, one emblem. And never pink." } },
    _none = { { id = "tp_none", text = "I design tabards, {class}, not opinions." } },
  },
}

---------------------------------------------------------------------------
-- Theresa, Gerard's Mindslave: a living woman Gerard Abernathy cut and "improved".
-- She carries parcels between Gerard and Father Lankester. Flat, obedient, with
-- something of the old Theresa surfacing now and then.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_theresa", id = 5697, name = "Theresa", title = "Gerard's Mindslave",
  role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "flat", "obedient" }, values = { "the errand", "Gerard" },
  impression = {
    first = "A living woman with a scar along her scalp and eyes that look just past you. She waits, perfectly still, until she is spoken to.",
    third = "{name} spoke with Theresa, the living woman Gerard Abernathy keeps as a mindslave in the War Quarter.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. It's good to see a friendly face." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've heard enough about you to keep my distance." },
    { id = "g_default", text = "Good day. Master Gerard says I am to be polite to everyone who speaks to me, so I am being polite to you." },
    { id = "g_back", when = { metBefore = true }, text = "I remember you. Master Gerard says remembering faces is one of the parts of me that still works." },
    { id = "g_hallows", when = { holiday = "hallowsend" }, text = "The city is burning a wicker man this week. Master Gerard says I am not to stand too close to the fire." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Theresa. I carry things from Master Gerard to Father Lankester, and from Father Lankester back to Master Gerard. That is what I am for." },
        { id = "h_living", when = { race = "Human" }, text = "You are warm, like me. There are not many warm people down here, and the cold ones look at us both the same way." },
      },
      again = {
        { id = "h_again", text = "Is there something else? I must not keep the parcel waiting." },
        { id = "h_again2", text = "I am still here. I am usually still here." },
      },
      choices = {
        { text = "What did Gerard do to you?", next = "gerard" },
        { text = "Do you remember your life before this?", next = "before" },
        { text = "What do you carry for them?", next = "parcels" },
        { text = "Who is Father Lankester?", next = "th_lankester" },
        { text = "Do you want to be free, Theresa?", next = "th_free" },
        { text = "Let me look at that scar.", next = "BACK", when = { class = "PRIEST" }, reply = "Master Gerard says only he may look at it. But you may look a little, if you are quick." },
        { text = "Go on with your errand, Theresa.", next = "END" },
      },
    },
    gerard = {
      lines = { { id = "ge_default", text = "He opened my head and took away the parts that were afraid. Then he woke up the parts that listen. He says I am his finest work, and I believe him, because I do not remember how to disbelieve him." } },
      choices = {
        { text = "That is monstrous. Someone should stop him.", next = "BACK", reply = "Stop him? Then who would tell me where to walk?", fx = { align = { light = 1 } } },
        { text = "It's no crueler than what the Scourge does.", next = "BACK", reply = "Master Gerard says that too. He says it often.", fx = { align = { light = -1 } } },
        { text = "Does it hurt?", next = "hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurt = {
      lines = { { id = "hu_default", text = "Sometimes there is a pain behind my eyes, like a word I cannot remember. Then a parcel comes, and I carry it, and the pain goes somewhere else for a while." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "be_default", text = "There was a kitchen, I think, with bread in it. There was someone who called me by a shorter name. I try to think of the name, and then I think of the parcel instead." } },
      choices = {
        { text = "I'm sorry, Theresa.", next = "BACK", reply = "Thank you. I do not know what for, but thank you.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    parcels = {
      lines = { { id = "pa_default", text = "Bottles, mostly, and papers sealed with wax. Father Lankester says I must never open them, and I never have. I would not know how to want to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    th_lankester = {
      lines = { { id = "th_l_default", text = "He is a priest of the Forsaken in the War Quarter. He takes the parcels and reads the papers inside them, and sometimes he looks at me for a long time before he gives me the next one. I do not know what he is looking for." } },
      choices = {
        { text = "Is he kind to you?", next = "th_kind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    th_kind = {
      lines = { { id = "th_k_default", text = "He gave me a cup of water once, without being asked. Master Gerard was angry, because water was not in the instructions. I drank it anyway. I do not know why I did that." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    th_free = {
      lines = { { id = "th_f_default", text = "Free is a word I know. I do not know where it would go, inside me. If you took away the parcels, I think I would stand in the street until someone gave me another one." } },
      choices = {
        { text = "Someone should take you away from Gerard.", next = "BACK", reply = "Then who would carry the parcels? Somebody must.", fx = { align = { order = -1 } } },
        { text = "Your errands are your purpose now. Keep to them.", next = "BACK", reply = "Yes. That is what Master Gerard says. It is a comfortable thing to hear.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background_x", text = "I am Theresa. I carry parcels. Before that there was a kitchen, and bread." } },
    _none = { { id = "tp__none_x", text = "Master Gerard did not tell me about that. I am sorry." } },
  },
}

---------------------------------------------------------------------------
-- Spoops: a little Hallow's End ghost in the Undercity. Playful, a bit lonely,
-- delighted by the festival that celebrates the Forsaken's freedom.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_spoops", id = 15309, name = "Spoops",
  role = "citizen", tier = "service",
  communities = { "undercity" }, temper = { "playful", "mischievous" }, values = { "fun", "the festival" },
  impression = {
    first = "A small, pale spirit bobs in the air and giggles, as if it has just pulled a prank on someone and is waiting for them to notice.",
    third = "{name} met Spoops, a mischievous little ghost who haunts the Undercity at Hallow's End.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are. I was hoping you'd come by again." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'd rather you were brief today." },
    { id = "g_default", text = "Boo! Oh, you didn't jump. Nobody down here ever jumps, and it isn't fair at all." },
    { id = "g_hallows", when = { holiday = "hallowsend" }, text = "It's Hallow's End! Everybody's dressing up as something scary, and I'm already scary, so I win." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Did you bring sweets? Ghosts can't eat them, but I like to look at them." },
  },
  start = "hello",
  nodes = {
    yfriends = {
      lines = { { id = "yfriends_x", text = "The rats, mostly. And the bats in the Ruins, but they're rude. There's an old lady ghost in the Royal Quarter who hums, and she lets me listen if I don't giggle. I always giggle." } },
      choices = {
        { text = "Who was the old lady?", next = "ylady" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylady = {
      lines = { { id = "ylady_x", text = "She says she was the old queen's nurse, but I don't know if ghosts lie. She hums the same song over and over. I think it's about a little prince. It makes her sad, so I play pranks to cheer her up." } },
      choices = {
        { text = "That's kind of you, Spoops.", next = "BACK", reply = "Kind? Hee hee, don't tell anyone, I'll lose my reputation!", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywhere = {
      lines = { { id = "ywhere_x", text = "Down in the canals, where the green water glows. Sometimes I float through the Apothecarium walls and make the vials rattle. The apothecaries hate it! Should I stop? They said they'd catch me in a jar." } },
      choices = {
        { text = "Keep it up. They deserve a scare.", next = "BACK", reply = "Hee hee! I knew you'd say that. Rattle, rattle!", fx = { align = { order = -1 } } },
        { text = "Stop. The apothecaries' work is important.", next = "BACK", reply = "Aww. Fine. I'll only rattle the little ones.", fx = { align = { order = 1 } } },
        { text = "A jar? Can they do that?", next = "yjar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yjar = {
      lines = { { id = "yjar_x", text = "Can ghosts go in jars? I don't want to find out. Promise you won't let them, if they try? Hee. I'll haunt you nicely if you promise." } },
      choices = { { text = "I promise, Spoops.", next = "BACK", reply = "Yay! You're my favourite now. Don't tell the rats.", fx = { affinity = 1 } } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Spoops. I float about the city when the Wicker Man is burning, and I try to scare people. The Forsaken are terribly hard to scare, though; they've seen worse than me." },
        { id = "yh_tauren", when = { race = "Tauren" }, text = "Ooh, you're big! Can I sit on your horns? I'm not heavy. I'm not anything, really. Hee hee!" },
      },
      again = { { id = "h_again", text = "Do you want to hear another secret? I know lots of them, mostly about rats." } },
      choices = {
        { text = "Who were you, before you were a ghost?", next = "before" },
        { text = "What is Hallow's End to you?", next = "hallows" },
        { text = "Want to try scaring me again?", next = "scare" },
        { text = "What secrets do you know about rats?", next = "sp_rats" },
        { text = "Are you lonely, Spoops?", next = "sp_lonely" },
        { text = "I'm dead too, you know. Boo.", next = "BACK", when = { race = "Scourge" }, reply = "Eek! Oh, you got me! Nobody ever gets me. Do it again!" },
        { text = "Do you have any friends, Spoops?", next = "yfriends" },
        { text = "Where do you go when nobody's looking?", next = "ywhere" },
        { text = "Goodbye, Spoops.", next = "END" },
      },
    },
    before = {
      lines = { { id = "be_default", text = "I don't remember, really. I think there was a house and a dog. Now there's this, and it's quite a lot more interesting, so I try not to be sad about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hallows = {
      lines = { { id = "ha_default", text = "The grown-up dead burn the Wicker Man to show they're free of the Lich King. I don't really understand that part. I just like the fire, and the masks, and the living people who come to stare." } },
      choices = {
        { text = "Freedom from the Scourge is worth a celebration.", next = "BACK", reply = "That's what the big ghosts say. Then they shout a lot.", fx = { align = { order = -1 } } },
        { text = "The dead should rest, not throw parties.", next = "BACK", reply = "Rest is boring. I tried it once.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scare = {
      lines = { { id = "sc_default", text = "All right, close your eyes. Now open them. Boo! Did that work? It didn't work, did it." } },
      choices = {
        { text = "Oh no, I'm terrified!", next = "BACK", reply = "Ha! I knew it! Wait until I tell the rats.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sp_rats = {
      lines = { { id = "sp_r_default", text = "The big grey one under the bank is called Lord Whiskers, and he steals coins from the vault. The little ones in the Apothecarium glow at night because they drink from the green puddles. Don't tell the apothecaries. They'd want them back." } },
      choices = {
        { text = "Do the rats ever see you?", next = "sp_rats2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sp_rats2 = {
      lines = { { id = "sp_r2_default", text = "Oh yes, rats can see ghosts. They're the only ones in the city who still jump when I say boo, so they're my best friends. Lord Whiskers pretends he isn't scared, but his tail goes all puffy." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    sp_lonely = {
      lines = { { id = "sp_l_default", text = "A little, after the festival ends and everyone stops looking at the fire. The grown-up ghosts in the Royal Quarter are very gloomy and won't play hide and seek. They say they're haunting, but I think they're just sulking." } },
      choices = {
        { text = "Should ghosts like you be put to rest?", next = "sp_rest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sp_rest = {
      lines = { { id = "sp_re_default", text = "A priest tried once. He said a lot of words, and I hid in a barrel until he went away. I don't want to rest. Resting is what you do when you're finished, and I'm not finished at all." } },
      choices = {
        { text = "Stay, Spoops. The city needs a bit of mischief.", next = "BACK", reply = "Yay! I'll tell the rats you said so.", fx = { align = { light = -1 } } },
        { text = "Rest would be kinder, little one.", next = "BACK", reply = "Kinder for who? Not for me. Boo!", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    apothecarium = { { id = "ytp_apoth", text = "The Apothecarium smells funny and the vials go clinky. I love it there!" } },
    royal_quarter = { { id = "ytp_rq", text = "The old lady ghost hums in the Royal Quarter. Shh, you have to be quiet to hear her." } },
    background = { { id = "tp_background_x", text = "There was a house and a dog. Now there's the whole city to haunt!" } },
    forsaken = { { id = "tp_forsaken_x", text = "The big dead people. They never jump, but they're nice when they think nobody's looking." } },
    _none = { { id = "tp__none_x", text = "I don't know that one! Ask the rats. They know everything." } },
  },
}
