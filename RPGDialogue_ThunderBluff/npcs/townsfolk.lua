-- Thunder Bluff's working people: the bank, the wind riders, the weapon master and the bowyer,
-- and the teachers of fishing, cooking, alchemy, herbalism and leatherworking.
-- No quests and little gossip in the game. Voice: bibles/townsfolk.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- The central mesa
---------------------------------------------------------------------------

-- Chesmu: a banker who still thinks of wealth as a herd.
P:NPC {
  key = "chesmu", id = TODO_NPC("Chesmu"), name = "Chesmu", title = "Banker",
  bible = "bibles/townsfolk.md", role = "banker", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "honest", "patient" },
  impression = {
    first = "Chesmu keeps Thunder Bluff's vaults and still counts wealth the way the tauren did when they wandered, in herds and in friends. The coins are kept carefully all the same.",
    third = "{name} met Chesmu, a banker of Thunder Bluff who remembers when the tauren kept their wealth on the hoof.",
  },

  greetings = {
    { id = "g_hi", text = "Welcome, friend. Your vault is safe, as it was when you left it." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and your things have waited patiently for you. Shall I open the vault?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Chesmu, and I keep the vaults of Thunder Bluff. Whatever you leave here is safe until you return for it, and you may reach the same vault from any bank of the Horde." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "Welcome, child of the Earth Mother. Our grandparents carried everything they owned on a kodo's back, and now we leave it with a stranger on a mesa. The world changes, and we change with it." },
      },
      again = { { id = "h_again", text = "Is there something more you wanted to ask, friend? The vaults have waited this long, so they can wait a little longer." } },
      choices = {
        { text = "I'd like my vault.", next = "BUSINESS" },
        { text = "Did the tauren always have banks?", next = "history" },
        { text = "What do tauren keep in their vaults?", next = "keep" },
        { text = "Is Thunder Bluff safe for my things?", next = "safe" },
        { text = "Farewell, Chesmu.", next = "END" },
      },
    },
    history = {
      lines = { { id = "h2_default", text = "No. When we wandered the plains, a tauren's wealth was the herd, and the friends who'd help guard it. The High Chieftain built this city so we could stop running from the centaur, and a city needs a place to keep things." } },
      choices = {
        { text = "Do you miss the old ways?", next = "history_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    history_miss = {
      big = true,
      lines = { { id = "hm_default", text = "Sometimes, on a clear evening, I miss the sound of the herd at night. But my children sleep without fear of the Kolkar now, and I'd trade every song of the old plains for that." } },
      choices = {
        { text = "Safety is worth the change.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some freedom is lost when walls go up.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    keep = {
      lines = { { id = "k_default", text = "Totems carved by grandparents, a first hunter's bow, a hide painted with a family's story. Gold too, I suppose, but gold never seems to matter much to my people. The keepsakes are what they come back for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    safe = {
      lines = { { id = "s_default", text = "There's only the lifts up from Mulgore and the bridges between the rises, and the braves watch every one of them. A thief would need wings, and the wind riders would see him first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    grimtotem = { { id = "tp_grimtotem", text = "They keep their own counsel on Elder Rise. I keep their coin the same as anyone's, and say no more." } },
    _none = { { id = "tp_none", text = "I don't know, friend. Ask Innkeeper Pala; everyone talks to her." } },
  },
}

-- Tal: the wind rider master on the tower above the central mesa.
P:NPC {
  key = "tal", id = TODO_NPC("Tal"), name = "Tal", title = "Wind Rider Master",
  bible = "bibles/townsfolk.md", role = "flightmaster", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady" }, values = { "patient" },
  notices = { "mount", "form" },
  impression = {
    first = "Tal keeps the wind riders at the top of Thunder Bluff's tower and speaks of the sky the way other tauren speak of the plains. He is unhurried, and he trusts the wind more than any map.",
    third = "{name} met Tal, the wind rider master of Thunder Bluff.",
  },

  greetings = {
    { id = "g_hi", text = "The wind is good today. Where shall it carry you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back on the tower. The wind riders remember you, friend." },
  },

  notice = {
    { id = "n_flight", cat = "form", when = { form = "travel" },
      text = "Running in the cheetah's shape, up all those stairs? The wind riders will happily save your legs, druid, and you can save your breath." },
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Bring your mount down off my tower, friend. The wind riders are proud, and they don't like sharing it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Tal, and I keep the wind riders of Thunder Bluff. They will carry you to the Crossroads, Camp Taurajo, Sun Rock Retreat, or anywhere else the Horde keeps a roost you've visited." },
        { id = "h_skyborne", when = { race = "Skyborne" }, text = "One of the Windshapers. Your people know the sky better than mine, I think, but the wind riders will still carry you, if you'll let them do the flying." },
      },
      again = { { id = "h_again", text = "Anything more? The wind won't wait forever." } },
      choices = {
        { text = "Take me somewhere.", next = "BUSINESS" },
        { text = "What is it like to fly?", next = "fly" },
        { text = "Where do the wind riders come from?", next = "beasts" },
        { text = "Why don't you fly to Bloodhoof Village?", next = "bloodhoof" },
        { text = "Farewell, Tal.", next = "END" },
      },
    },
    fly = {
      lines = { { id = "f_default", text = "Like standing on the highest rise with the wind in your face, only the rise is moving. The first time I flew over Mulgore, I saw how small our troubles were from up there, and how large the Earth Mother's world is." } },
      choices = {
        { text = "The sky puts everything in its place.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "From up there, I'd only see targets.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "From the high places of Kalimdor, where the winds are strong. They are proud creatures, and they don't serve; they agree to carry us, as long as we treat them with respect." } },
      choices = {
        { text = "What happens if they're disrespected?", next = "beasts_respect" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_respect = {
      lines = { { id = "br_default", text = "They put you down somewhere you'd rather not be, and they don't fly for you again. I've seen it happen to an orc who kicked one, and he walked home from the Barrens." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bloodhoof = {
      lines = { { id = "bl_default", text = "Because the walk is a good one, and it's short. The plains of Mulgore are worth walking through slowly, friend, so take the lift down and go on foot; you'll thank me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I know the wind and the routes it takes. For anything else, ask someone on the ground." } },
  },
}

---------------------------------------------------------------------------
-- Hunter Rise
---------------------------------------------------------------------------

-- Ansekhwa: the weapon master, who teaches weapons as tools for protecting the herd.
P:NPC {
  key = "ansekhwa", id = TODO_NPC("Ansekhwa"), name = "Ansekhwa", title = "Weapon Master",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady" }, values = { "disciplined", "honorable" },
  notices = { "class" },
  impression = {
    first = "Ansekhwa teaches weapons on Thunder Bluff with the calm of someone who has never needed to raise his voice. He treats every blade and staff as a promise to protect someone.",
    third = "{name} met Ansekhwa, the weapon master of Thunder Bluff.",
  },

  greetings = {
    { id = "g_hi", text = "Come to learn a new weapon? Good; a warrior with only one is half armed." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Show me how your practice has gone." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid with a staff. Many of your kind forget that the staff is a weapon too, so let me teach you to use it properly, and you'll need fewer claws." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ansekhwa, and I teach the use of weapons to any who can learn them. A weapon is a tool for protecting the herd, and the more tools you carry, the fewer ways the herd can be hurt." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior. You'll want to know every weapon there is, then, because one day the one in your hand will break, and you'll need to pick up whatever lies nearby." },
      },
      again = { { id = "h_again", text = "What else? Ask, and I'll answer plainly." } },
      choices = {
        { text = "Teach me a weapon.", next = "BUSINESS" },
        { text = "Which weapon do you prefer?", next = "prefer" },
        { text = "Why protect the herd and not conquer?", next = "herd" },
        { text = "Farewell, Ansekhwa.", next = "END" },
      },
    },
    prefer = {
      lines = { { id = "p_default", text = "The mace, because it's honest. It doesn't pretend to be beautiful, and it hits just as hard whether you're skilled or not. A young tauren learns the mace first and then the finer things." } },
      choices = {
        { text = "What about guns?", next = "prefer_gun" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prefer_gun = {
      lines = { { id = "pg_default", text = "Loud, and useful, and the dwarves were clever to invent them. I teach them to hunters who want them, but I'll never love a weapon that frightens the whole herd every time it fires." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    herd = {
      big = true,
      lines = { { id = "h2_default", text = "Because we've seen what conquest did to the orcs and the humans both. The tauren fought only to survive the centaur, and the High Chieftain says we'll fight only to keep what we've built. I believe him." } },
      choices = {
        { text = "That's a wise way to fight.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sometimes the best defence is striking first.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I teach weapons, friend, not lore. Ask one of the elders on Elder Rise." } },
  },
}

-- Kuna Thunderhorn: sells bows, arrows and guns on Hunter Rise.
P:NPC {
  key = "kuna", id = TODO_NPC("Kuna Thunderhorn"), name = "Kuna Thunderhorn", title = "Bowyer & Fletcher",
  bible = "bibles/townsfolk.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "warm" }, values = { "diligent", "proud" },
  impression = {
    first = "Kuna Thunderhorn makes and sells bows on Hunter Rise and speaks of good wood the way others speak of old friends. There's a family pride in every bow on the rack.",
    third = "{name} met Kuna Thunderhorn, the bowyer of Thunder Bluff's Hunter Rise.",
  },

  greetings = {
    { id = "g_hi", text = "Come in, come in. Test the draw on any of them; that's what they're for." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter! You'll want arrows, I'd guess, and plenty of them. Hunters always run out of arrows first." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Kuna Thunderhorn, and I sell bows, arrows and guns on Hunter Rise. The Thunderhorns have always been hunters, and somebody in the family had to make the bows instead of only using them." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Come and look at the long bows. They're cut from the old trees of Mulgore, and they'll carry an arrow further than anything the orcs make." },
      },
      again = { { id = "h_again", text = "Anything else? Take your time choosing; a bow is a long friendship." } },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "What makes a good bow?", next = "bow" },
        { text = "Are you kin to Holt Thunderhorn?", next = "holt" },
        { text = "Why sell guns, if you make bows?", next = "guns" },
        { text = "Farewell.", next = "END" },
      },
    },
    bow = {
      lines = { { id = "b_default", text = "Good wood, cut in the right season, and patience while it dries. A bow made in a hurry will crack in the cold, and a bow made slowly will outlive the hunter who carries it." } },
      choices = {
        { text = "Patience makes the best tools.", next = "BACK", fx = { affinity = 1 } },
        { text = "What wood do you use?", next = "bow_wood" },
      },
    },
    bow_wood = {
      lines = { { id = "bw_default", text = "The trees along the streams of Mulgore, mostly, the ones the Earth Mother grew slowly. I never cut a living tree without asking it first, and if that sounds foolish, the bows haven't complained." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    holt = {
      lines = { { id = "h2_default", text = "We're both Thunderhorns, and he'd tell you every Thunderhorn is kin, which is true enough. He teaches the hunters on this rise, and I make sure they have something to shoot with when he's done." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guns = {
      lines = { { id = "g_default", text = "Because some hunters want them, and I'd rather they bought a good gun from me than a bad one from a goblin. I don't make them; I trade for them, and I check every one." } },
      choices = {
        { text = "A bow is more honourable.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Whatever works is the right weapon.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, friend. Ask Holt; he knows more than I do about most things." } },
  },
}

---------------------------------------------------------------------------
-- The crafters and teachers
---------------------------------------------------------------------------

-- Kah Mistrunner: the fishing trainer.
P:NPC {
  key = "kah", id = TODO_NPC("Kah Mistrunner"), name = "Kah Mistrunner", title = "Fishing Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "patient" },
  notices = { "profession" },
  impression = {
    first = "Kah Mistrunner teaches fishing on a mesa high above any water, and finds that more amusing than inconvenient. He is easy company, slow to hurry, and quick to laugh.",
    third = "{name} shared a laugh with Kah Mistrunner, who teaches the tauren to fish from a mesa nowhere near any water.",
  },

  greetings = {
    { id = "g_hi", text = "Ho, friend. Come to learn the patient art?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Tell me what you caught, and don't make it bigger than it was." },
  },

  notice = {
    { id = "n_angler", cat = "profession", when = { profession = { name = "Fishing", min = 150 } },
      text = "You've the look of a proper angler now, the kind who checks the clouds before the water. Sit, and let's talk shop." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Kah Mistrunner, and I teach fishing. It's a strange thing to teach on top of a mesa, I know, but the lakes of Mulgore are only a lift and a walk away." },
        { id = "h_troll", when = { race = "Troll" }, text = "A Darkspear! Your people fish the sea, and mine fish the lakes. We should trade secrets, you and I." },
      },
      again = { { id = "h_again", text = "Something more? Fishing gives plenty of time for talking." } },
      choices = {
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "Where's good fishing in Mulgore?", next = "where" },
        { text = "Why do tauren fish?", next = "why" },
        { text = "Are you kin to Aska Mistrunner?", next = "aska" },
        { text = "Farewell, Kah.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Stonebull Lake, in the south of Mulgore, is the best, though the gnolls of the Palemane like it too. The streams around Bloodhoof Village are good for a beginner, and nobody will laugh at you there." } },
      choices = {
        { text = "Do the gnolls bother you?", next = "where_gnolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_gnolls = {
      lines = { { id = "wg_default", text = "Only when they steal my catch. They've no patience for fishing themselves, so they wait until I've caught something and try to take it. Keep a club near your pole." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      big = true,
      lines = { { id = "y_default", text = "Because the Earth Mother provides in the water as well as on the plains, and it would be rude to refuse. And because a tauren who only hunts the kodo will one day find the kodo gone, so we take from many places a little, not from one place a lot." } },
      choices = {
        { text = "Taking only what's needed honours her.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The world gives freely. Take what you can.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    aska = {
      lines = { { id = "a_default", text = "She's my sister, and she'll cook whatever I catch, which is how she ended up teaching cooking. Some days I think I fish only so she has something to complain about." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Can't say I know it. Ask Aska; she listens to more gossip than I do." } },
  },
}

-- Aska Mistrunner: the cooking trainer, Kah's sister.
P:NPC {
  key = "aska", id = TODO_NPC("Aska Mistrunner"), name = "Aska Mistrunner", title = "Cooking Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "warm" }, values = { "generous", "practical" },
  notices = { "profession" },
  impression = {
    first = "Aska Mistrunner teaches cooking in Thunder Bluff and treats every visitor as someone who hasn't eaten properly in weeks. She is warm, bossy, and usually right.",
    third = "{name} was fussed over by Aska Mistrunner, who teaches cooking on Thunder Bluff and believes nobody eats enough.",
  },

  greetings = {
    { id = "g_hi", text = "You look hungry. Everyone does, but you look hungrier than most." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Have you been eating properly, or only that dry trail bread?" },
  },

  notice = {
    { id = "n_cook", cat = "profession", when = { profession = { name = "Cooking", min = 150 } },
      text = "I can smell spices on your sleeves, and they're good ones. You've been cooking properly, then, and I'm proud of you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Aska Mistrunner, and I teach cooking. A warrior who can cook eats well on the road and makes friends at every campfire, and those are both worth more than a sharper sword." },
        { id = "h_orc", when = { race = "Orc" }, text = "An orc! Your people eat everything burnt and call it cooked. Sit down, and I'll teach you to roast meat without turning it to charcoal." },
      },
      again = { { id = "h_again", text = "What else, dear? Ask while the pot's still warm." } },
      choices = {
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "What should I cook first?", next = "first" },
        { text = "What's the best food in Mulgore?", next = "best" },
        { text = "Why does cooking matter so much?", next = "why" },
        { text = "Farewell, Aska.", next = "END" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "Wolf meat, from the prairie wolves below the bluffs, with a little spice. It's simple, and if you can roast it well, you can roast anything." } },
      choices = {
        { text = "Where do I get spices?", next = "first_spice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_spice = {
      lines = { { id = "fs_default", text = "Any trade goods merchant will sell you mild spices, and that's all you need at first. When you're better, I'll tell you where to find the good ones." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    best = {
      lines = { { id = "b_default", text = "Kodo, roasted slowly over a fire of dried grass, the way our grandparents made it on the plains. Some say plainstrider is better, but they're wrong, and I'll tell them so to their faces." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because a full belly makes a calm mind, and a calm mind makes good choices. My brother Kah would say fishing does the same, but he's never had to feed a war band." } },
      choices = {
        { text = "Sharing food builds trust.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A good meal is just fuel.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, dear. Have something to eat and think about it; that always helps." } },
  },
}

-- Bena Winterhoof: the alchemy trainer, wary of the Forsaken apothecaries on Spirit Rise.
P:NPC {
  key = "bena", id = TODO_NPC("Bena Winterhoof"), name = "Bena Winterhoof", title = "Alchemy Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "sharp" }, values = { "precise", "devout" },
  notices = { "profession", "race" },
  impression = {
    first = "Bena Winterhoof teaches alchemy as a way of mending, not of making poisons, and says so firmly. She has strong opinions about the Forsaken apothecaries on Spirit Rise and shares them readily.",
    third = "{name} heard Bena Winterhoof, alchemist of Thunder Bluff, insist that potions are for mending and not for poisons.",
  },

  greetings = {
    { id = "g_hi", text = "Mind the vials. Some of them are still warm." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Have you been practising, or only buying potions from merchants?" },
  },

  notice = {
    { id = "n_alch", cat = "profession", when = { profession = { name = "Alchemy", min = 100 } },
      text = "Your fingers are stained green at the tips. You've been grinding Silverleaf, I'd wager, and grinding it well." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken. You'll find my alchemy is meant for healing, so if you've come looking for the other kind, you want Spirit Rise." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Bena Winterhoof, and I teach alchemy. The Earth Mother grows the herbs, and alchemy draws out what she put in them to heal and to strengthen, which is all it should be used for." },
        { id = "h_alch", when = { profession = "Alchemy" }, text = "An alchemist! Tell me you've been making healing draughts, and not anything the Forsaken would be proud of." },
      },
      again = { { id = "h_again", text = "Something else? Ask quickly, before this boils over." } },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "What do you think of the Forsaken apothecaries?", next = "forsaken" },
        { text = "What potion should I learn first?", next = "first" },
        { text = "Is the Winterhoof Water Well named for your clan?", next = "well" },
        { text = "Farewell.", next = "END" },
      },
    },
    forsaken = {
      big = true,
      lines = { { id = "f_default", text = "They're brilliant, I won't deny it, and Apothecary Zamah knows more about herbs than I do. But the Forsaken want to know what an herb can kill before what it can heal, and that frightens me more than any centaur." } },
      choices = {
        { text = "Knowledge is knowledge, whatever its use.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You're right to be wary of them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Why let them stay on Spirit Rise?", next = "forsaken_why" },
      },
    },
    forsaken_why = {
      lines = { { id = "fw_default", text = "The High Chieftain and the Arch Druid spoke for them when they joined the Horde, and the Grimtotem welcome them for reasons of their own. It isn't my place to argue with Cairne, but I watch them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "grimtotem" } } } },
    },
    first = {
      lines = { { id = "fi_default", text = "A minor healing potion, from Peacebloom and Silverleaf. It's simple, and it'll save your life one day when there's no healer near, so learn it well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    well = {
      lines = {
        { id = "w_default", text = "It is, though it's the land that matters, not the name. Something has been fouling the wells of Mulgore, and the druids are trying to cleanse them." },
        { id = "w_done", when = { questDone = TODO_QUEST("Winterhoof Cleansing") },
          text = "It is, and I'm told you're the one who carried the cleansing totem to it. My clan owes you thanks, so take mine, for what an alchemist's thanks are worth." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    grimtotem = { { id = "tp_grimtotem", text = "Magatha's clan. They keep close to the Forsaken, and I'd like to know why." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Ask on Elder Rise; the elders know more than I do." } },
  },
}

-- Nida Winterhoof: the herbalism trainer, who gathers what Bena brews.
P:NPC {
  key = "nida", id = TODO_NPC("Nida Winterhoof"), name = "Nida Winterhoof", title = "Herbalism Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "gentle" }, values = { "patient", "devout" },
  notices = { "profession", "form" },
  impression = {
    first = "Nida Winterhoof teaches herbalism and smells of crushed leaves and earth. She talks about plants as gifts that must be thanked for, and seems to mean it every time.",
    third = "{name} learned from Nida Winterhoof that every herb taken from Mulgore should be thanked for.",
  },

  greetings = {
    { id = "g_hi", text = "Welcome, friend. Come and smell the Peacebloom; it's fresh today." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Have you thanked the Earth Mother for what you've gathered?" },
  },

  notice = {
    { id = "n_herb", cat = "profession", when = { profession = { name = "Herbalism", min = 100 } },
      text = "There's pollen on your boots and earth under your nails. You've been gathering properly, and I'm pleased." },
    { id = "n_tree", cat = "form", when = { form = { "travel", "cat" } },
      text = "A druid in a beast's shape. You must cover so much ground that way, and see so many plants. Tell me what grows where you've been." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Nida Winterhoof, and I teach herbalism. The Earth Mother grows what we need everywhere, if we only learn to see it, and I teach that seeing." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid! Then you already know the plants are alive in more ways than one. Come, let me teach you to gather without hurting them." },
      },
      again = { { id = "h_again", text = "Something more? I'm always glad to talk about green things." } },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "What herbs grow in Mulgore?", next = "herbs" },
        { text = "Why thank the Earth Mother for weeds?", next = "thanks" },
        { text = "Do you work with Bena?", next = "bena" },
        { text = "Farewell, Nida.", next = "END" },
      },
    },
    herbs = {
      lines = { { id = "h2_default", text = "Peacebloom and Silverleaf on the plains, and Earthroot close by the rocks and hills. Further out, in the Barrens, you'll find Mageroyal and Briarthorn, but learn the gentle ones first." } },
      choices = {
        { text = "How do I tell them apart?", next = "herbs_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_tell = {
      lines = { { id = "ht_default", text = "Peacebloom is white and smells sweet, and Silverleaf shines in the sun like its name. Earthroot hides; you'll find it by the rocks, looking like nothing at all, which is how it likes it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thanks = {
      big = true,
      lines = { { id = "t_default", text = "Because there are no weeds, only plants we don't yet know the use of. Everything the Earth Mother grows is a gift, and a gift that isn't thanked stops being given." } },
      choices = {
        { text = "I'll thank her for every herb I take.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Plants don't care if you thank them.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    bena = {
      lines = { { id = "b_default", text = "She's my cousin, and she makes potions from what I gather. We argue about whether the herbs are for healing or for learning, and she always wins, because she's louder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, friend. Perhaps the Earth Mother will tell you, if you listen." } },
  },
}

-- Una: the leatherworking trainer, who honours every hide she works.
P:NPC {
  key = "una_tb", id = TODO_NPC("Una"), name = "Una", title = "Leatherworking Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady" }, values = { "practical", "devout" },
  notices = { "profession" },
  impression = {
    first = "Una teaches leatherworking in Thunder Bluff and insists that a hide is a gift from the beast that gave it. Her hands never stop working while she talks.",
    third = "{name} met Una, the leatherworking trainer of Thunder Bluff.",
  },

  greetings = {
    { id = "g_hi", text = "Come in. Mind the hides drying on the poles." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. Show me your stitching; I'll know whether you've practised." },
  },

  notice = {
    { id = "n_lw", cat = "profession", when = { profession = { name = "Leatherworking", min = 100 } },
      text = "Your fingers are hard where the needle pushes. You've been working leather, then, and working it properly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Una, and I teach leatherworking. Every hide that comes to me was a living beast, and I teach my students to use all of it and waste none, because that's how you honour what was given." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "A hunter! You'll have hides in your packs, then, and you should learn to work them yourself rather than selling them for a few coppers." },
      },
      again = { { id = "h_again", text = "Something else? Ask while I stitch." } },
      choices = {
        { text = "Teach me leatherworking.", next = "BUSINESS" },
        { text = "What's the best hide in Mulgore?", next = "best" },
        { text = "How do you honour a beast you've skinned?", next = "honour" },
        { text = "Farewell, Una.", next = "END" },
      },
    },
    best = {
      lines = { { id = "b_default", text = "Kodo, for its thickness. A kodo hide will turn a centaur's arrow if it's cured well, and our braves wore it long before we had steel. Plainstrider hide is lighter, and good for a beginner's hands." } },
      choices = {
        { text = "How long does curing take?", next = "best_cure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best_cure = {
      lines = { { id = "bc_default", text = "Days, if you're careful, and longer if you want it to last. Salt the hide, stretch it in the sun, and don't touch it until it tells you it's ready, which you'll learn to hear." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    honour = {
      big = true,
      lines = { { id = "h2_default", text = "You thank it, and you use everything: the hide for armour, the sinew for thread, the bones for tools. A beast killed for sport and left on the plains is a shame to the hunter, and the Earth Mother remembers." } },
      choices = {
        { text = "I'll waste nothing I take.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A beast is meat and leather, nothing more.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know. Ask someone who doesn't spend all day with hides." } },
  },
}
