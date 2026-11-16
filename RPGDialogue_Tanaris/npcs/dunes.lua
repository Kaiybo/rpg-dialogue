-- Tanaris beyond the gates: Steamwheedle Port, the wandering turtle Tooga, and the Gadgetzan folk earlier passes skipped.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ironboot", id = TODO_NPC("Prospector Ironboot"), name = "Prospector Ironboot",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Prospector Ironboot is a dwarf at Steamwheedle Port who came to Tanaris for its buried treasures and stayed for the sand in his beard.",
    third = "{name} met Prospector Ironboot at Steamwheedle Port in Tanaris.",
  },
  greetings = {
    { id = "g_main", text = "Well met, friend! Shake the sand off yer boots before ye come any closer." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The desert didn't swallow ye, then. Good." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Bones, mostly, and old troll stonework that crumbles the moment the air touches it. Once or twice the ground's shifted under me like it was turning over in its sleep, and I'll admit I didn't stay to see it wake." } },
      choices = {
        { text = "The earth remembers. Dig with respect, or it'll bury you.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Ruins belong to whoever holds the shovel. Dig deep.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The League won't say it out loud, but aye, they've paid for quiet hands before. A sealed vault under the dunes keeps its secrets well, and sometimes the only key is someone who can open what was never meant to be opened." } },
      choices = {
        { text = "Ancient tombs should stay sealed. Leave the dead be.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it's buried and forgotten, it's fair game.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's dig into something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "There's old something, I'd stake my beard on it, because nobody builds walls like the ones at Eastmoon for no reason. The trolls of Zul'Farrak won't say what came before them, and the sand won't either, so I keep digging and hoping." } },
      choices = {
        { text = "Some old power should stay buried, Ironboot.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Dig it all up. Knowledge belongs to the finders.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Near Zul'Farrak they have, aye, and I'll not pretend otherwise. The trolls there don't let their dead lie quiet, so a dwarf with a shovel learns to listen for scratching under the sand before he digs another foot." } },
      choices = {
        { text = "Treat their graves with reverence, even if they're troll graves.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The dead won't miss what you take from them.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Someone to stand between my diggers and whatever we wake, mostly, because a shovel's no use against a troll with a spear. The League pays in maps and gratitude, I'm afraid, but there's honest work in keeping good folk alive." } },
      choices = {
        { text = "I'll guard your diggers. That's what a paladin is for.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Light doesn't serve the League. I go where I'm needed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, eh? I've no great love for the Horde, but out here the sand's the enemy of us all, so say yer piece and mind the dig." },
        { id = "h_default", key = true, text = "Prospector Ironboot, digger, surveyor and dwarf of Ironforge, out here in the worst sandbox ever made. Tanaris has more buried under the dunes than anyone knows, and I mean to find a bit of it." },
        { id = "h_c0", when = { race = "Dwarf" }, text = "A fellow dwarf! Then ye'll know why I'm here: Explorers' League blood doesn't let a dwarf sit still while there's ruins to dig." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Light fingers and soft boots, eh? I've worked digs with your sort before, and ye'd be surprised how often a locked tomb turns into an open one when there's a rogue on the payroll." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, out here in the sand! Tell me, can ye feel anything under these dunes? Old magic, buried cities, anything a poor prospector might dig up?" },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, out here in the dunes! Say a word over the dig for me, friend, because some of the troll bones I've turned up didn't seem to want turning." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, by my beard! There's not many of yer order this far south, and I'll sleep easier at the port knowing there's a hammer of the Light about." },
      },
      again = { { id = "h_again", text = "Anything more, friend?" }, { id = "h_again2", text = "Go on, ask; the sand'll wait." } },
      choices = {
        { text = "The earth here is dry and old. What have your digs disturbed?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's buried out here?", next = "b1_1" },
        { text = "Why Steamwheedle Port?", next = "b2_1" },
        { text = "Is it dangerous?", next = "b3_1" },
        { text = "Ironforge must miss its diggers.", next = "x_1", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Should the old ruins be left alone?", next = "s_1" },
        { text = "Would the Explorers' League hire a rogue, Ironboot?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is there old magic buried in Tanaris?", next = "xmage", when = { class = "MAGE" } },
        { text = "Have your digs disturbed any restless dead, Ironboot?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does the Explorers' League need from a paladin out here?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Old troll cities, for a start, the Sandfury's ancestors and Zul'Farrak's lot, and older things beneath them still. Some of the ruins out east are so old the trolls themselves don't know who built them." } },
      choices = { { text = "Older than the trolls?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The problem is the Wastewanderers, the Sandfury and the heat, and not always in that order. A dwarf can dig for a week and still find nothing but sand." } },
      choices = { { text = "What keeps you going?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "But when ye do find something, friend, there's no feeling like it in all the world. That's what keeps me out here." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Because the goblins sell everything a digger needs and don't ask questions about where ye're going. Cost me a fortune, mind, but nothing's free in Tanaris." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Everything here is dangerous, from the sand to the scorpids to the goblins' prices. Bring water, bring more water, and then bring more water." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Aye, and I miss Ironforge's ale, but a dwarf goes where the dirt's interesting. Tell Magni I said hello, if ye ever see him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say it's grave robbing, digging up the old troll cities. I say knowledge buried is knowledge wasted." } },
      choices = { { text = "Learn from the past. Dig carefully.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Let the dead keep their cities.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Can't say I've dug that up yet, friend." } } },
}

P:NPC {
  key = "tooga", id = TODO_NPC("Tooga"), name = "Tooga",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Tooga is an old turtle wandering the Tanaris sands, lost and very far from the friend who's waiting for him in Feralas.",
    third = "{name} met Tooga, a wandering turtle in the deserts of Tanaris.",
  },
  greetings = {
    { id = "g_main", text = "Tooga sees you! Tooga is lost, and very hot, and very slow." },
    { id = "g_back", when = { metBefore = true }, text = "Tooga remembers you. You are kind to Tooga." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The sand is hot on top and cold underneath, and it whispers when the wind runs over it. Tooga does not understand the whispering, but Tooga thinks the desert is lonely, like Tooga." } },
      choices = {
        { text = "Every land has its spirits, and every spirit keeps its place.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Spirits wander where they like, Tooga, just like you.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You smell like rain and stone, and Tooga likes that smell. Can you ask the sky to make a little water for a lost turtle?" },
        { id = "h_default", key = true, text = "Tooga is Tooga, and Tooga is very far from home. Torta is waiting for Tooga in Feralas, but the desert is big and Tooga's legs are small." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Tooga's Quest") }, text = "You will take Tooga to Torta? Tooga is slow, so please be patient, and please do not let the scorpids eat Tooga." },
      },
      again = { { id = "h_again", text = "What else? Tooga listens slowly." }, { id = "h_again2", text = "Tooga is here." } },
      choices = {
        { text = "What do the sands feel like to an old turtle, Tooga?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How did you get lost?", next = "b1_1" },
        { text = "Who is Torta?", next = "b2_1" },
        { text = "Are you all right?", next = "b3_1" },
        { text = "I understand beasts. Let me guide you.", next = "x_1", when = { class = { "DRUID", "HUNTER" } } },
        { text = "Should you have stayed home?", next = "s_1" },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Tooga went for a walk, and Tooga kept walking, and now Tooga is in the desert. Turtles are not good at deserts." } },
      choices = { { text = "Torta worries?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Tooga thinks Torta must be worried, because Torta always worries. Torta is Tooga's best friend." } },
      choices = { { text = "Probably?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If Tooga can get home, Tooga will never walk so far again, probably." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Torta is a turtle too, and Torta is very wise and very old. Torta lives near the water in Feralas, and Tooga misses the water." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Tooga is hot and tired and thirsty, but Tooga is still Tooga. Turtles are tough on the outside." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "You speak to Tooga like a friend. Tooga likes that, and Tooga will follow you anywhere slow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Torta always tells Tooga to stay close, but Tooga likes to wander. Tooga does not know if that is good or bad." } },
      choices = { { text = "Wandering is how you see the world.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Stay close to home next time, Tooga.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Tooga does not know, because Tooga is a turtle." } } },
}

P:NPC {
  key = "curgle", id = TODO_NPC("Curgle Cranklehop"), name = "Curgle Cranklehop",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Curgle Cranklehop is a gnome in Gadgetzan with a scholar's curiosity and a habit of finishing other people's sentences.",
    third = "{name} met Curgle Cranklehop, a gnome in Gadgetzan.",
  },
  greetings = {
    { id = "g_main", text = "Oh! A visitor, how wonderful. Do you have a moment for some science?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I've been thinking about what we discussed." },
  },
  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "The scorpids, without question! They go weeks without water and never complain, which is more than I can say for anyone in Gadgetzan, and if I could build a machine half as clever, I'd retire tomorrow." } },
      choices = {
        { text = "Some marvels should be admired, not copied.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Copy it, then. The scorpids won't miss the idea.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The basilisks certainly do; they bask on the stones at exactly the hour the rock holds the most heat, as if something told them. And the scorpids dig down a full hour before a sandstorm, which is either instinct or, well, a very good informant." } },
      choices = {
        { text = "Instinct, nothing more. Your notes will explain it in time.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They listen to the land. Scholars should try it sometime.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Natural magic, yes, that's what I said on Tuesday, and then on Wednesday I said the opposite! If you ever have to freeze one, do write down whether it turns to stone any slower, because nobody in Gadgetzan will take notes for me." } },
      choices = {
        { text = "Leave them in peace. Not every creature needs studying.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Knowledge is worth a few frozen basilisks.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Only to look, because a creature is a creature, and I study creatures! Though I'll admit the scorpids at least have the decency to be from this world, which your little friend clearly isn't, and that bothers the scholar in me terribly." } },
      choices = {
        { text = "Study it all you like. Fear is for the ignorant.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "You're wise to keep your distance.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Never mind my demon.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Oh, much worse, and I've the notes to prove it! Thirst thins the blood, scorpid venom lingers in it, and a fever out here climbs twice as fast as one in a cool stone city, so a healer in Tanaris never runs short of patients." } },
      choices = {
        { text = "Then I'll tend whoever falls ill, scholar or bandit alike.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Wastewanderers can look after their own sick.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Now, I've read that your people speak with the elements, which is either superstition or the most fascinating field study in Kalimdor, and I'd dearly like to know which." },
        { id = "h_default", key = true, text = "Curgle Cranklehop, at your service! I study the creatures of Tanaris, from the scorpids to the basilisks, because the desert hides more marvels than anyone in Gadgetzan gives it credit for." },
        { id = "h_c0", when = { race = "Gnome" }, text = "A fellow gnome! Oh, splendid, someone who'll understand when I talk about mechanical reproduction of insect behavior." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Oh, wonderful, you can settle an argument I've been having with myself: do basilisks really turn things to stone, or do they just stare very hard?" },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Oh, wonderful, you'll know whether the basilisks' stone gaze is an arcane effect or a natural one, because I've been arguing with myself about it for a fortnight." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Is that an imp? Oh, my, it is! May I look at it, from a distance, a safe and sensible distance, preferably with you between us?" },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Oh, wonderful, because I've been wondering whether the Light works the same on a basilisk as on a person, and nobody in Gadgetzan will let me find out." },
      },
      again = { { id = "h_again", text = "What else, friend?" }, { id = "h_again2", text = "More questions? Wonderful!" } },
      choices = {
        { text = "Do the desert beasts feel the elements the way I do?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What creature in Tanaris fascinates you most, Curgle?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What do you study?", next = "b1_1" },
        { text = "Why live in Gadgetzan?", next = "b2_1" },
        { text = "What do the goblins think of you?", next = "b3_1" },
        { text = "My pet might interest you.", next = "x_1", when = { class = "HUNTER" } },
        { text = "Is studying beasts better than hunting them?", next = "s_1" },
        { text = "I'd guess the basilisk gaze is natural magic.", next = "xmage", when = { class = "MAGE" } },
        { text = "You want to study my demon, Curgle?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Does the desert make sickness worse, Curgle?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "The way desert creatures survive with so little water, mostly. The scorpids, the hyenas and the basilisks have all adapted in ways I can only dream of reproducing." } },
      choices = { { text = "Reproducing them?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "I've been keeping notes for months, and I've filled four journals. The goblins think I'm mad, but they also think anything not for sale is mad." } },
      choices = { { text = "I'll keep an eye out.", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you see any unusual creatures out there, tell me about them. Science needs eyes, and I only have two." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "It's the only town in Tanaris with walls, water and a decent workbench. The bruisers keep the peace and the goblins keep the shops open, and I can't ask for more." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "They think I'm a customer who never buys anything, which is fair. I spend all my money on notebooks." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Oh, it might ever, and I'd love to take notes while it does, though I promise I won't poke it, at least not without asking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say knowledge is wasted on beasts we'll only kill. I say we kill them because we don't understand them." } },
      choices = { { text = "Understanding beats killing every time.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Beasts are for hunting. Study books instead.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, but I'd love to find out!" } } },
}

P:NPC {
  key = "jabbey", id = TODO_NPC("Jabbey"), name = "Jabbey",
  bible = "bibles/tanaris.md", role = "vendor", tier = "service",
  impression = {
    first = "Jabbey sells odds and ends from a stall in Gadgetzan, and every one of them, he swears, is a bargain.",
    third = "{name} met Jabbey, a vendor in Gadgetzan.",
  },
  greetings = {
    { id = "g_main", text = "Step right up, step right up! Jabbey's got what you need, even if you don't know you need it." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite customer! What can Jabbey sell you today?" },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Depends who's talking. The caravan folk swear the dust devils out past the Noonshade Ruins follow wagons on purpose, and one fellow told me the wind stole his hat and gave it back a mile on, though I sold him a new one anyway, just in case." } },
      choices = {
        { text = "The wind keeps its own accounts. Respect it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Dust devils are just hot air, like most travellers' tales.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Jabbey cares that the coin is real and the Bruisers don't see the blinding happen inside the walls. What happens in the dunes is between you and whoever you're blinding, and Jabbey sleeps very well, thank you." } },
      choices = {
        { text = "A merchant should care where his goods end up.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fair enough. I don't want my business known.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Booty Bay, mostly, and Ratchet when the boats are kind. Jabbey doesn't ask where Booty Bay gets them, and Booty Bay doesn't ask where Jabbey sends them, and that's how reagents get across the sea in one piece." } },
      choices = {
        { text = "Good trade keeps the world turning, whoever's on the other end.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You should know who you're buying from.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "That'll do for reagents.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Jabbey thinks you're a customer like any other, so long as you buy what's on the shelf. What you do with your own shadows is your business, but Jabbey would rather not have them in his stall." } },
      choices = {
        { text = "Every merchant has his price. Yours is just higher.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "A man with a line is worth respecting.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else, Jabbey.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Ask for 'em? They buy charms for 'em, friend, because a charm comes with a receipt. Most of this town believes in the Cartel first and luck second, though I'll tell you, when the Wastewanderers raid, everybody suddenly remembers a god or two." } },
      choices = {
        { text = "Selling charms to frightened folk is a cheap trick, Jabbey.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If a charm calms them, sell it. Comfort is comfort.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Then you'll be wanting ankhs, and I keep a few under the counter for your sort, priced like everything else here: fair, more or less." },
        { id = "h_default", key = true, text = "Name's Jabbey, and I sell a little of everything: reagents, odds, ends and the occasional thing I can't explain. Gadgetzan's the crossroads of Tanaris, and everything passes through my stall sooner or later." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Flash powder and blinding powder, friend, and Jabbey asks no questions about who you plan to blind. That's what makes Jabbey a reliable vendor." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Jabbey keeps runes and feathers for your kind, and arcane powder when the boats bring it, because mages always run out right before they need it most." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Jabbey doesn't sell soul shards, friend, so don't ask. Jabbey sells a lot of strange things, but even Jabbey has a line, and that line is anything that used to be somebody." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, is it? I've got holy water, or something that was holy water before it crossed the sea, and candles, and one very old prayer book I can't read a word of." },
      },
      again = { { id = "h_again", text = "What else? Jabbey's always open." }, { id = "h_again2", text = "More? Jabbey loves questions that end in sales." } },
      choices = {
        { text = "What do travellers say about the desert spirits out there?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What sells best here?", next = "b1_1" },
        { text = "Where do you get your goods?", next = "b2_1" },
        { text = "Do you ever overcharge?", next = "s_1" },
        { text = "You really don't care what your powder gets used for?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Where do you get your reagents out here?", next = "xmage", when = { class = "MAGE" } },
        { text = "You think less of me for my craft?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do folks in Gadgetzan ever ask for prayers, Jabbey?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Water, friend, by a long way, then cooling potions and anything that keeps the scorpids off you. After that, it's whatever the adventurers are hunting this week." } },
      choices = { { text = "Turtle shells?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Last month it was snake bits, this month it's turtle shells. Next month, who knows, but Jabbey'll have it." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Here and there, from traders and travelers and the port. Jabbey doesn't ask, and Jabbey doesn't tell, which is how business works in Gadgetzan." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Jabbey charges what the market bears, friend. If you call that overcharging, take it up with the market." } },
      choices = { { text = "Fair prices build loyal customers.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } }, { text = "A goblin should get what he can.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Jabbey doesn't sell that, but Jabbey might know a guy." } } },
}

P:NPC {
  key = "vizzklick", id = TODO_NPC("Vizzklick"), name = "Vizzklick",
  bible = "bibles/tanaris.md", role = "vendor", tier = "service",
  impression = {
    first = "Vizzklick sells cloth and tailoring supplies in Gadgetzan, and she thinks most adventurers dress, as though they lost a fight with a sandstorm.",
    third = "{name} met Vizzklick, the cloth vendor in Gadgetzan.",
  },
  greetings = {
    { id = "g_main", text = "Welcome, welcome! Oh dear, look at the state of your robes." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! And still in those clothes, I see." },
  },
  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It doesn't, which is how I stay in business. The sand gets into the weave and grinds it thin from the inside, so I double-stitch everything and charge full price for the second stitch." } },
      choices = {
        { text = "Double stitches and proper seams. Discipline beats the desert every time.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Cloth that fights the wind loses. Wear less and move with it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They're fine for Stormwind, or Undercity, or wherever you come from, but the desert sand gets into every seam and eats them. A mage who looks like a scarecrow doesn't get much respect at the auction house, and that's free advice." } },
      choices = {
        { text = "A mage's worth is in the spell, not the robe.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Fine. Appearances matter, even out here.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let's discuss something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It wears beautifully, and that's the trouble, because it hums when I hold it. I sell to warlocks the same as anyone, but I keep their cloth at the back of the shelf where it can't touch my good silk." } },
      choices = {
        { text = "Then your prejudice costs you good customers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "That's sensible. Fel taints whatever it touches.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, please.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Everybody cares, friend, whether they admit it or not, and a clean white robe in Gadgetzan says you've got water to spare for washing. Folks here trust a healer who looks like they've walked through the desert, though, so maybe dust is the right look for you after all." } },
      choices = {
        { text = "A priest's robe should be plain and kept clean. That's discipline.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The Light doesn't care about hems, Vizzklick, and neither do I.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, with totems clattering off your belt and a hem the wind's been chewing on. I'd ask the spirits for better tailoring, if I were you." },
        { id = "h_default", key = true, text = "Vizzklick, cloth and thread and the finest tailoring supplies in Tanaris! Desert living is hard on clothes, and I keep half of Gadgetzan dressed, whether they like it or not." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, dearie, and in robes that have seen far too much sand! Mageweave holds up better in this heat, if you'd let me show you some proper cloth." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Felcloth, is that? No, don't tell me where it came from, dearie, because I've heard the stories about the satyrs, and I'd sooner not know." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, in robes cut for cool stone halls! Your order makes a fine garment, I'll grant you, but its tailors never met a sandstorm, and it shows on every hem you're wearing." },
      },
      again = { { id = "h_again", text = "What else, dearie?" }, { id = "h_again2", text = "Anything more? I've got a needle waiting." } },
      choices = {
        { text = "The wind here never rests. How does cloth hold up against it?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's good cloth for the desert?", next = "b1_1" },
        { text = "Do you sew yourself?", next = "b2_1" },
        { text = "Do clothes really matter out here?", next = "s_1" },
        { text = "My robes are fine, Vizzklick.", next = "xmage", when = { class = "MAGE" } },
        { text = "Felcloth wears just as well as any other cloth.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Should a priest care how the robes look?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Light, tight and pale, dearie, unless you enjoy roasting in your own boots. The sand gets into everything, so a good weave keeps it out." } },
      choices = { { text = "And mageweave?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Silk's lovely, but it tears on the rocks, so most folks out here settle for mageweave and pray." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Of course! Selling cloth without knowing how to sew is like selling water without knowing how to drink." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say a fighter shouldn't care about looks. I say a well-dressed fighter frightens enemies twice as much." } },
      choices = { { text = "Looking sharp is half the battle.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "A blade matters more than a hem.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Not my line of work, dearie, but I'll keep an ear open." } } },
}
