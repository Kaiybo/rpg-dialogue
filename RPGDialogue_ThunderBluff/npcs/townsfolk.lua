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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Old shields, mostly, and armour from fights they'd rather not forget. I keep it all in the rock beneath the mesa, and some of the braves come back years later just to look at the shield that saved them." } },
      choices = {
        { text = "I'll keep the gear that saved me. It deserves respect.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Old gear is clutter. I'll sell it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Many do, and I don't mind, as long as they're cleaned first. One hunter left the skull of a plains lion with me and visits it every season, which I find touching, though the other bankers find it strange." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} can wait at the door, please. The vaults are no place for a beast, however well behaved." },
      },
      choices = {
        { text = "I keep my trophies to honour the beasts I've taken.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Trophies are for showing off. I'd sell mine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Sturdy enough that you'll never find out, and I'll thank you not to wonder aloud near the guards. The vaults of Thunder Bluff are cut into the rock of the mesa itself, and anyone who wants in will need a pick and a lifetime." },
      },
      choices = {
        { text = "Only curious, Chesmu. Your vaults are safe from me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A lifetime is long. Locks only need patience.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Is Thunder Bluff safe for my things?", next = "safe" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Mages keep the strangest things of anyone, and I've learned not to ask. One left a stone that hummed all night, and another left a book I'm sure moved to a different shelf by itself, so I keep the mages' things at the far end." },
      },
      choices = {
        { text = "Fair. I'll keep my strange things properly sealed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "What I keep is my own business, banker.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What do tauren keep in their vaults?", next = "keep" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Chesmu, and I keep the vaults of Thunder Bluff. Whatever you leave here is safe until you return for it, and you may reach the same vault from any bank of the Horde." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "Welcome, child of the Earth Mother. Our grandparents carried everything they owned on a kodo's back, and now we leave it with a stranger on a mesa. The world changes, and we change with it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The elders say the earth keeps its treasures deep, and so do I, though mine have locks on them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll have spare armour to store, I expect, because warriors always carry more than they can wear." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Hides and trophies go in the lower vaults, where the smell won't bother the other guests." },
      },
      again = { { id = "h_again", text = "Is there something more you wanted to ask, friend? The vaults have waited this long, so they can wait a little longer." } },
      choices = {
        { text = "Do shamans keep anything in your vaults, Chesmu?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I'd like my vault.", next = "BUSINESS" },
        { text = "Did the tauren always have banks?", next = "history" },
        { text = "What do tauren keep in their vaults?", next = "keep" },
        { text = "Is Thunder Bluff safe for my things?", next = "safe" },
        { text = "Your vaults look sturdy, Chesmu. How sturdy, I wonder?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do mages keep anything strange in your vaults?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What do warriors usually leave with you, Chesmu?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do hunters keep their trophies here, Chesmu?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Totems wrapped in old hide, mostly, and a few sacred stones the elders won't let anyone else touch. When we wandered, a shaman carried the tribe's whole wealth on her back, and now I carry it in iron, which my back is grateful for." } },
      choices = {
        { text = "Sacred things belong in safe hands, and your vault serves the tribe.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sacred things belong on the road with the people, not locked away.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To the Crossroads, mostly, where the centaur raid and the quilboar fight, and to Camp Taurajo, where the Razorfen grow bolder every season. The wind riders carry warriors to the fight and bring them home again, though they always seem to fly faster on the way back." } },
      choices = {
        { text = "Send me where the Horde needs me most, Tal.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Send me where the fighting pays best, Tal.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "With patience, raw meat and a great deal of respect, because a wind rider remembers every kindness and every slight. They're proud creatures, and a hunter would understand them better than most, so you're welcome to come up the tower and meet them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} doesn't care for the wind riders, I see. They're not fond of it either, but they've never once quarrelled with a hunter's beast." },
      },
      choices = {
        { text = "Respect is the only way to earn a beast's trust.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A strong hand earns trust faster than respect.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The wind riders watch it, and they sleep lighter than any guard. More than one thief has tried to climb the tower at night, and the beasts woke the whole rise before he reached the top, so I've never needed to sleep with one eye open." },
      },
      choices = {
        { text = "Good beasts. Nobody should rob a flight master.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Light sleepers only need a quieter thief.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What is it like to fly?", next = "fly" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They'll carry you, but not what follows you, and they'll grumble about the smell of you the whole way to the Crossroads. Wind riders are honest beasts, and they don't care for anything that comes from the Twisting Nether." },
      },
      choices = {
        { text = "I'll leave it behind. Calm skies for your beasts.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They'll learn to bear it, like everyone else.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Where do the wind riders come from?", next = "beasts" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Tal, and I keep the wind riders of Thunder Bluff. They will carry you to the Crossroads, Camp Taurajo, Sun Rock Retreat, or anywhere else the Horde keeps a roost you've visited." },
        { id = "h_skyborne", when = { race = "Skyborne" }, text = "One of the Windshapers. Your people know the sky better than mine, I think, but the wind riders will still carry you, if you'll let them do the flying." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, then you'll enjoy the flight more than most, because the wind riders say your kind talk to the air the whole way." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The wind riders will carry you wherever the Horde needs you, but hold on tight, because they don't slow down for armour." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. My wind riders are beasts too, and they always know when a hunter is near; they lift their heads and watch." },
      },
      again = { { id = "h_again", text = "Anything more? The wind won't wait forever." } },
      choices = {
        { text = "Do the wind riders feel the air spirits, Tal?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Take me somewhere.", next = "BUSINESS" },
        { text = "What is it like to fly?", next = "fly" },
        { text = "Where do the wind riders come from?", next = "beasts" },
        { text = "Why don't you fly to Bloodhoof Village?", next = "bloodhoof" },
        { text = "Who watches the tower while you sleep, Tal?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Where do the wind riders take warriors, Tal?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How do you care for the wind riders, Tal?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Will your wind riders carry a warlock?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They feel everything about the wind, and they turn skittish when a storm is brewing over the Barrens long before I see a cloud. I've wondered whether they hear the same spirits you do, and I suspect they're better at listening." } },
      choices = {
        { text = "The beasts listen more humbly than we do, so we could learn from them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Beasts sense weather. The spirits speak only to the trained.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The one in your hand, until it breaks, and then the one nearest you. A tauren warrior learns the axe, the mace and the staff, because the herd must be protected with whatever is at hand, and a warrior who can only fight with one weapon fights poorly with all the others." } },
      choices = {
        { text = "I'll learn every weapon I can, to protect the herd.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll master one weapon. The rest are distractions.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every tauren hunter once carried a spear, long before the orcs brought their guns across the sea. A spear keeps a charging beast at arm's length, and a hunter who knows how to use one will stand when others fall." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} will thank you for learning, {class}. A hunter who can protect his companion is a hunter worth following." },
      },
      choices = {
        { text = "I'll learn the spear, for my companion's sake.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My bow is enough. Let the beast handle the rest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They do, in their way, which is the way of the hand that slips between the herd and the wolf. I'll grant you that a dagger in the dark has saved more than one camp, though I'd still rather the wolf saw us coming and chose to leave." },
      },
      choices = {
        { text = "Better the wolf sees us and runs. Agreed.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The wolf who never sees us never comes back.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Why protect the herd and not conquer?", next = "herd" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A staff is a fine weapon, and the oldest, since every tauren elder carries one whether or not they can cast. Learn to swing it properly and you'll be glad of it the day your spells run dry, which is a day that comes for every mage." },
      },
      choices = {
        { text = "Then I'll learn the staff properly. Wise advice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My spells won't run dry. I'll be fine.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Which weapon do you prefer?", next = "prefer" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ansekhwa, and I teach the use of weapons to any who can learn them. A weapon is a tool for protecting the herd, and the more tools you carry, the fewer ways the herd can be hurt." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior. You'll want to know every weapon there is, then, because one day the one in your hand will break, and you'll need to pick up whatever lies nearby." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll need a weapon you trust as much as your totems, and I can teach you one." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Show me how you hold that weapon, and I'll tell you how many fights it has lost you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know the bow and the gun, but I can teach you the spear and the axe for when the beast comes close." },
      },
      again = { { id = "h_again", text = "What else? Ask, and I'll answer plainly." } },
      choices = {
        { text = "Which weapons should a shaman learn, Ansekhwa?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Teach me a weapon.", next = "BUSINESS" },
        { text = "Which weapon do you prefer?", next = "prefer" },
        { text = "Why protect the herd and not conquer?", next = "herd" },
        { text = "Do daggers protect the herd too, in their way?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A mage only needs a staff, Ansekhwa.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Which weapon should a warrior master first, Ansekhwa?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Should a hunter learn the spear, Ansekhwa?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Maces, axes, staves and daggers, and a good shaman learns more than one, because the elements can be slow to answer when a centaur is already at your throat. Every weapon is a promise to protect someone, so choose the one you mean to keep." } },
      choices = {
        { text = "One weapon, mastered and kept, like a promise.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever weapon is nearest when the centaur come is the right one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every warrior should carry something that reaches further than his arm, because the harpies stay in the air and the centaur throw spears. A Thunderhorn bow is light enough to carry beside an axe, and it'll start a fight on your terms instead of theirs." } },
      choices = {
        { text = "I'll carry a bow and use it wisely.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A warrior fights face to face. Bows are for hunters.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The wood comes from the old trees of Mulgore, and we cut only from trees that have already fallen, so the Earth Mother gives each bow freely. A bow made from a gift shoots truer than one made from a theft, or so my grandmother always said." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks like it would enjoy a good hunt. Take it out to the plains with a Thunderhorn bow, and you'll both come home happy." },
      },
      choices = {
        { text = "I'll honour the bow and the land it came from.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A bow is a tool. I care only how far it shoots.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They buy throwing knives, mostly, and sometimes a small crossbow, though they never say what for. I sell to anyone who pays, but I tell them all the same thing, which is that a Thunderhorn bow has never been fired into a tauren's back and I'd like to keep it that way." },
      },
      choices = {
        { text = "Fair words. I'll keep my aim honest.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Where an arrow lands is the archer's business.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What makes a good bow?", next = "bow" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A wand fires true, I'll grant you, but it's only a stick with somebody else's magic in it. A bow needs a string and a strong arm, and I'll wager on a strong arm over borrowed magic any day." },
      },
      choices = {
        { text = "Perhaps. There's something to be said for simple tools.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Magic is magic, borrowed or not. It works.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Are you kin to Holt Thunderhorn?", next = "holt" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Kuna Thunderhorn, and I sell bows, arrows and guns on Hunter Rise. The Thunderhorns have always been hunters, and somebody in the family had to make the bows instead of only using them." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Come and look at the long bows. They're cut from the old trees of Mulgore, and they'll carry an arrow further than anything the orcs make." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman on Hunter Rise! You'll want a mace more than a bow, I'd wager, but you're welcome to admire the craftsmanship." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior on Hunter Rise? You'll be wanting a gun for when the centaur keep their distance, I'd wager." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! I can tell by the way you looked at my bows before you looked at me." },
      },
      again = { { id = "h_again", text = "Anything else? Take your time choosing; a bow is a long friendship." } },
      choices = {
        { text = "Do shamans ever take up the bow, Kuna?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "What makes a good bow?", next = "bow" },
        { text = "Are you kin to Holt Thunderhorn?", next = "holt" },
        { text = "Why sell guns, if you make bows?", next = "guns" },
        { text = "Do rogues ever buy your bows, Kuna?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Bows are clumsy. A wand fires just as true.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Should a warrior carry a bow, Kuna?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What makes a Thunderhorn bow special, Kuna?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not often, because the elements want you up close, and lightning flies straighter than any arrow I've made. Still, the old shaman who blessed my first bow said the wood remembers the tree, and I've carved every bow since as if that were true." } },
      choices = {
        { text = "It is true. Everything made from the land keeps a spirit.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Wood is wood. Good craft comes from your own hands.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a warrior on the road must eat, and the lakes of Mulgore are full of fish for anyone patient enough to catch them. The braves who learn to fish learn patience along with it, and patience is a warrior's best friend when the centaur are waiting in ambush." } },
      choices = {
        { text = "Patience is worth learning. I'll try the line.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fishing is for peons. I'll eat jerky.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than most hunters think, because you read the water as you read the grass and you wait where the prey wants to be. The difference is that a fish won't charge you, which makes fishing a gentler hunt, though no less honest." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks like it would like a fish. Most beasts do, and the lakes of Mulgore have plenty to share." },
      },
      choices = {
        { text = "I'll take only what I'll eat, from lake or plain.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If the fish are biting, I'll fill the bucket.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Kah Mistrunner, and I teach fishing. It's a strange thing to teach on top of a mesa, I know, but the lakes of Mulgore are only a lift and a walk away." },
        { id = "h_troll", when = { race = "Troll" }, text = "A Darkspear! Your people fish the sea, and mine fish the lakes. We should trade secrets, you and I." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Then maybe you can tell me why the fish bite better after a rain, because I've wondered for years." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior who fishes? Don't laugh, because the best warriors I know are the ones who know how to wait." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know patience already, so you'll make a fine fisher, and the lakes of Mulgore are waiting." },
      },
      again = { { id = "h_again", text = "Something more? Fishing gives plenty of time for talking." } },
      choices = {
        { text = "Why do you think the fish bite better after rain, Kah?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why would a warrior need to fish, Kah?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Is fishing much like hunting, Kah?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "My best guess is that the water spirits stir them up, and the fish get hungry and careless. Your guess would be better than mine, but a fisherman learns not to ask too many questions while the line is pulling." } },
      choices = {
        { text = "The water spirits deserve thanks for every catch.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A catch is skill and patience, so leave the spirits out of it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a warrior who can cook keeps his strength on the road, and a warrior who can't eats jerky until his teeth ache. The braves who learn to stew a plainstrider at dawn fight better by noon, and they share their pot with whoever's beside them." } },
      choices = {
        { text = "I'll learn to cook and share the pot.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Jerky does me well enough. Cooking is for camps.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Plainstrider for stew and kodo for roasting, though a prairie wolf makes a fine broth if you cook it slowly. Every part of the beast has its use, and a hunter who learns to cook wastes nothing the Earth Mother gave." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would like a share, I'd wager. Set aside a little for it every time you cook, and it'll never wander far from your fire." },
      },
      choices = {
        { text = "I'll cook every part and waste nothing.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll cook the best cuts and leave the rest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because conjured bread tastes like nothing and keeps you going for an hour, child, and a good stew warms you until morning. Learn to cook something real and you'll make more friends at a campfire than you ever will with your spells." },
      },
      choices = {
        { text = "You're right. Real food it is.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Conjured bread costs nothing. That's good enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What should I cook first?", next = "first" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then a rogue is a fool, and I've met many who prove it. A cold camp keeps you hidden, I'll grant you, but a little dried meat stewed at dawn before you move on will keep you alive longer than any shadow." },
      },
      choices = {
        { text = "Fair point. I'll take your advice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll keep my cold camps, thank you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why does cooking matter so much?", next = "why" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Aska Mistrunner, and I teach cooking. A warrior who can cook eats well on the road and makes friends at every campfire, and those are both worth more than a sharper sword." },
        { id = "h_orc", when = { race = "Orc" }, text = "An orc! Your people eat everything burnt and call it cooked. Sit down, and I'll teach you to roast meat without turning it to charcoal." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, and too thin, like all of you who spend your nights talking to campfires instead of cooking on them. Sit, and I'll fix that." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll eat well if you learn to cook, and you'll make friends at every campfire, which is worth more than a sharp blade." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! You'll bring me meat to cook, I hope, because a hunter's game makes the finest stew there is." },
      },
      again = { { id = "h_again", text = "What else, dear? Ask while the pot's still warm." } },
      choices = {
        { text = "Do shamans cook differently from other tauren, Aska?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "What should I cook first?", next = "first" },
        { text = "What's the best food in Mulgore?", next = "best" },
        { text = "Why does cooking matter so much?", next = "why" },
        { text = "I can conjure food, Aska. Why learn to cook?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "A rogue eats cold on the road, Aska.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why should a warrior learn to cook, Aska?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What's the best game to cook in Mulgore, Aska?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Shamans thank the fire before they start cooking, and I've never seen one burn a stew, so there might be something to it. Most of you forget to eat after a long trial, though, which is why I keep a pot ready." } },
      choices = {
        { text = "Thanking the fire is good manners, and the old way besides.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A fire is a tool. It doesn't need thanking.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Healing first, always, and something for strength if you can afford it. The Earth Mother grows peacebloom and silverleaf across Mulgore, and a warrior who carries a few of my potions comes home far more often than one who trusts only his armour." } },
      choices = {
        { text = "I'll carry healing and use it wisely.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Potions are a crutch. My armour is enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The good ones do, and I'm grateful, because they know where the earthroot grows and where the mageroyal hides. A hunter who brings me herbs is helping heal the tribe, and I'd thank the Earth Mother for every one of them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} might sniff out a few herbs for us, if you trained it. Some beasts have a nose for them, you know." },
      },
      choices = {
        { text = "I'll gather herbs to heal the tribe, Bena.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll gather herbs to sell, Bena. Coin's coin.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Your poisons are what alchemy becomes when someone forgets why the Earth Mother grew the herbs. I'll not teach you to make them, and I'll not pretend I like seeing them on your belt, but the orcs and trolls have always used them and I can't change that." },
      },
      choices = {
        { text = "Fair. I'll only use them on those who deserve it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A poison is just a potion with a purpose.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What do you think of the Forsaken apothecaries?", next = "forsaken" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "My advice is to buy them from someone else, because I'll not have my herbs feeding a demon's summoning. The Earth Mother grows things to heal and strengthen, and nothing I teach is meant to open a door to the Twisting Nether." },
      },
      choices = {
        { text = "Fair. Your herbs should serve healing, not demons.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Herbs don't care whose hands they're in.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What potion should I learn first?", next = "first" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Bena Winterhoof, and I teach alchemy. The Earth Mother grows the herbs, and alchemy draws out what she put in them to heal and to strengthen, which is all it should be used for." },
        { id = "h_alch", when = { profession = "Alchemy" }, text = "An alchemist! Tell me you've been making healing draughts, and not anything the Forsaken would be proud of." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Good, because you'll understand that what the Earth Mother grows is meant for healing, whatever the apothecaries on Spirit Rise think." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll want healing potions, I expect, because warriors always need more of them than they think." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know the herbs of the plains better than most, because you walk among them every day." },
      },
      again = { { id = "h_again", text = "Something else? Ask quickly, before this boils over." } },
      choices = {
        { text = "Should a shaman worry about the Forsaken on Spirit Rise, Bena?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "What do you think of the Forsaken apothecaries?", next = "forsaken" },
        { text = "What potion should I learn first?", next = "first" },
        { text = "Is the Winterhoof Water Well named for your clan?", next = "well" },
        { text = "My poisons are alchemy too, Bena.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Which potions should a warrior carry, Bena?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do hunters bring you herbs, Bena?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Warlocks use reagents too, Bena. Any advice?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I worry enough for the whole bluff, and the elders tell me Cairne has his reasons for letting them stay. The dead brewing poisons beside the Pools of Vision is not what the Earth Mother intended, and I'd like a shaman to tell me the spirits agree." } },
      choices = {
        { text = "Healing is what herbs are for, and the spirits know it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A poison has its uses too, against the right enemy.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every warrior should know which plants heal and which plants poison, because a wounded brave far from home must make do with what grows around him. The peacebloom of Mulgore has saved more warriors than any shield, though few of them ever thank it." } },
      choices = {
        { text = "I'll learn which plants heal, and thank them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Herbs are for healers. I'll trust my armour.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Peacebloom and silverleaf in the grass, earthroot in the hills and mageroyal near the water, if you know where to look. The Earth Mother hides her gifts well, and a hunter who learns to see them will never go home empty-handed." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has been sniffing at the peacebloom by the lift. Let it; some beasts know which plants heal better than we do." },
      },
      choices = {
        { text = "I'll gather only what the land can spare.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Every herb I find, I'll take.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then you're still gathering the Earth Mother's gifts, and I'd ask you to thank her for them whatever you mean to do with them. Some of the plants on the plains are poison in the wrong hands, and I'd rather they stayed in the right ones." },
      },
      choices = {
        { text = "I'll thank her, and use them wisely.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A plant is just a plant. I'll use it as I please.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What herbs grow in Mulgore?", next = "herbs" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Rarely, because mages buy their powders from the reagent sellers and think the plants grow in little bags. I'd like to see more of them out on the plains with a gathering pouch, because a mage who knows where things come from respects them more." },
      },
      choices = {
        { text = "You're right. I'll learn where my reagents come from.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I don't need to dig in dirt to cast a spell.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why thank the Earth Mother for weeds?", next = "thanks" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Nida Winterhoof, and I teach herbalism. The Earth Mother grows what we need everywhere, if we only learn to see it, and I teach that seeing." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid! Then you already know the plants are alive in more ways than one. Come, let me teach you to gather without hurting them." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You must feel how glad the earth is when an herb is gathered properly, with thanks." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Strong hands make fine gatherers, if you're gentle enough not to crush what you pick." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You walk the plains every day, so you've passed more herbs than anyone, though perhaps you never stopped to see them." },
      },
      again = { { id = "h_again", text = "Something more? I'm always glad to talk about green things." } },
      choices = {
        { text = "Do the earth spirits mind when we gather herbs, Nida?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "What herbs grow in Mulgore?", next = "herbs" },
        { text = "Why thank the Earth Mother for weeds?", next = "thanks" },
        { text = "Do you work with Bena?", next = "bena" },
        { text = "I gather herbs too, though not always for healing.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do mages ever come to you for herbs?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Should a warrior learn herbalism, Nida?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Which herbs grow on the plains of Mulgore, Nida?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not when we take only what we need and leave the roots to grow again. The Venture Company tears up whole hillsides in Stonetalon and the spirits there are sick with it, so I teach my students to do the opposite." } },
      choices = {
        { text = "Take only what we need, and thank the earth for it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Take what you can, because someone worse will take it otherwise.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Under their mail, always, because mail against bare skin is a misery no warrior forgets. The braves who guard the bluffs wear a quilted jerkin beneath their armour, and every one of them was cut from a hide some hunter brought me." } },
      choices = {
        { text = "I'll honour the beasts that clothe me.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Leather is leather. I don't think about beasts.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "With respect, and with a sharp knife, because a torn hide wastes the life the beast gave. Scrape it clean, salt it well and bring it to me before it stiffens, and I'll teach you to make something worthy of the beast that wore it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} watches me work the hides very closely. Don't worry, {class}; I'd never use a hunter's companion." },
      },
      choices = {
        { text = "I'll treat every hide with respect, Una.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A hide is a hide. I'll sell it as it comes.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Soft leather, oiled well, because a stiff hide creaks and a creaking rogue is a dead one. Use all of the beast, as I tell my students, and when you slip past someone in the armour it gave you, remember who made you quiet." },
      },
      choices = {
        { text = "I'll remember the beast. That's only fair.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's leather, and the beast is long gone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "How do you honour a beast you've skinned?", next = "honour" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Too heavy for you, perhaps, but not for the hunters and druids who trust it with their lives. Cloth is pretty, I'll grant you, though I've never seen a robe turn a raptor's claw." },
      },
      choices = {
        { text = "Fair. Each to their own armour.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A good spell turns a claw better than leather.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What's the best hide in Mulgore?", next = "best" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Una, and I teach leatherworking. Every hide that comes to me was a living beast, and I teach my students to use all of it and waste none, because that's how you honour what was given." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "A hunter! You'll have hides in your packs, then, and you should learn to work them yourself rather than selling them for a few coppers." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll understand better than most that every hide I work once held a spirit, and that spirit deserves respect." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Leather armour won't stop an axe the way mail will, but a good leather jerkin under it will stop the chafing." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and I can smell the hides in your pack from here. Let me see them, and I'll tell you which ones you've ruined." },
      },
      again = { { id = "h_again", text = "Something else? Ask while I stitch." } },
      choices = {
        { text = "Do the spirits of the beasts stay with their hides, Una?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Teach me leatherworking.", next = "BUSINESS" },
        { text = "What's the best hide in Mulgore?", next = "best" },
        { text = "How do you honour a beast you've skinned?", next = "honour" },
        { text = "Rogues wear leather too. What would you recommend?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Mages wear cloth, Una. Leather's too heavy.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do warriors wear leather, Una?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How should a hunter treat a hide, Una?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
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
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The old shamans said a little of the beast stays, so they sang over the hides before the tanning. I keep that song, though I'm no shaman, because I'd rather honor a spirit that isn't there than shame one that is." } },
      choices = {
        { text = "Honoring them costs nothing, so the song should be kept.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A hide is only a hide once the beast is gone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know. Ask someone who doesn't spend all day with hides." } },
  },
}
