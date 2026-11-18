-- The Military Ward's Hall of Arms and Timberline Arms, and the Forlorn Cavern's rogues and fishermen.
-- Voices: bibles/wards_cavern.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC = P.TODO_NPC

-- Ulbrek Firehand: stable master in the Hall of Arms; gentle with beasts.
P:NPC {
  key = "if_ulbrek", id = TODO_NPC("Ulbrek Firehand"), name = "Ulbrek Firehand",
  bible = "bibles/wards_cavern.md", role = "stablemaster", tier = "service",
  communities = { "ironforge" }, temper = { "gentle" }, values = { "kind", "patient" },
  notices = { "pet" },

  impression = {
    first = "Ulbrek Firehand keeps the stables in the Hall of Arms and talks to the animals in his care more than he talks to people. He knows every beast in the stalls by name and temper.",
    third = "{name} met Ulbrek Firehand, the stable master of Ironforge's Hall of Arms.",
  },

  greetings = {
    { id = "g_default", text = "Quietly, now; there's a bear sleepin' in the third stall, an' he's grumpy when he wakes." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, back again. Yer beasts are fed an' well, if ye've any wi' me." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "There's a fine beast at yer heel, an' it's been well fed, I can see. It trusts ye, an' ye cannae buy that wi' any amount o' meat." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They know somethin' about yer kind that they've never known about me, for they've never once gone quiet for me. The cat in the end stall growls at everybody who comes through that door, an' she put her head down for the last shaman as if he were her own hunter." } },
      choices = {
        { text = "Keep them well, Ulbrek. The beasts deserve your kindness.", next = "BACK", reply = "I will, an' they'll know ye said so, for beasts hear more than we give them credit for, an' the cat in the end stall hears everythin'.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They know who's strongest. Beasts always do.", next = "BACK", reply = "Maybe they do, but the strongest isnae always the one they trust, an' I've seen that cat turn her back on a whole squad o' guards.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some do, an' I let them out on the hills when I can, but the hunters' beasts chose their masters, an' they're happy enough. A beast that's loved isnae a prisoner, whatever the elves might say." } },
      choices = {
        { text = "Love and care are a fair bargain for any beast.", next = "BACK", reply = "Aye, that's how I see it, an' I'm glad tae hear it from a druid, for yer lot usually look at my stables as if they were cages.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "A beast bound by love is still bound.", next = "BACK", reply = "Maybe so, an' I'll no' argue, but I've never seen a happier prisoner than a hunter's wolf when its master walks through that door.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They take kindly tae anyone who's calm, an' warriors are calmer than ye'd think once they've put the axe down. It's the nervous ones who upset them, for a beast can smell fear before ye've noticed it yerself." } },
      choices = {
        { text = "I'll keep calm and greet them gently.", next = "BACK", reply = "That's the way, an' they'll come tae ye like old friends, an' ye'll find they calm a warrior as much as a warrior calms them.", fx = { align = { order = 1 } } },
        { text = "A beast should learn to respect a warrior's steel.", next = "BACK", reply = "Respect, aye, maybe, but a beast that fears steel is a beast that'll bolt when ye need it most, so try gentleness first.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Fed, brushed an' talked tae every day, for a beast that's left alone forgets its manners an' starts tae think it's been abandoned. I tell them their hunters are comin' back, an' I'll swear they understand me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Fed, brushed an' talked tae every day, for a beast that's left alone starts tae think it's been abandoned. Yer {pet} looks well, I'm glad tae see; ye've been feedin' it properly, I can tell from the coat." },
      },
      choices = {
        { text = "I'd never leave a beast longer than I must.", next = "BACK", reply = "Good, for they count the days, I swear it, an' a hunter who comes back on time is a hunter whose beast will never let him down.", fx = { align = { honor = 1 } } },
        { text = "A beast is a tool. It'll keep while I'm gone.", next = "BACK", reply = "It'll keep, aye, but it'll pine, an' a pinin' beast fights slower, so ye might find yer tool a wee bit blunter when ye come back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Better than most dwarves remember their debts. A hunter's wolf came back from a fight wi' a singed tail an' wouldnae let a mage near it for a month, so be gentle an' they'll forgive ye." } },
      choices = {
        { text = "I'll be gentle, Ulbrek. The beasts deserve it.", next = "BACK", reply = "Thank ye, an' they'll remember it, for a beast's memory is longer than a dwarf's grudge, an' kinder too.", fx = { align = { honor = 1 } } },
        { text = "Beasts are beasts. They'll get over it.", next = "BACK", reply = "They will, eventually, but a singed tail takes a month tae forgive, an' I'd rather ye didnae test that on my stables.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because it's no' from this world, an' every beast knows that the moment it catches the scent. I've seen a bear tear its stall apart tryin' tae get away from an imp, an' I'll no' see it again." } },
      choices = {
        { text = "I'll keep the creature far from your stables.", next = "BACK", reply = "Thank ye, truly, for I've only just mended the last stall, an' the bear's still givin' me a wounded look about it.", fx = { align = { light = 1 } } },
        { text = "They'll learn to live with it, Ulbrek.", next = "BACK", reply = "They'll no', an' I'll no' make them try, so keep it well away, or I'll be mendin' stalls an' soothin' bears till spring.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Now an' again, when a hunter's companion comes back hurt an' the hunter cannae bear tae watch. I'll take any healin' I can get for them, for they didnae choose tae fight, an' they deserve mendin' as much as any dwarf." } },
      choices = {
        { text = "Every creature deserves healing. I'll help when I can.", next = "BACK", reply = "Bless ye, for that's all I ask, an' the beasts will know who healed them long after their hunters have forgotten.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Beasts heal on their own. Save prayers for dwarves.", next = "BACK", reply = "They do, slowly, an' it hurts them all the while, so I'll take a prayer for a wolf if ye've one tae spare, whatever ye think.", fx = { align = { light = -1 } } },
        { text = "Show me the stables, Ulbrek.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Gently, an' wi' respect, for a charger will carry ye intae battle wi'out askin' why, an' that's a trust ye should never break. I've seen paladins who forget it, an' I've seen what happens tae their mounts, an' I'd rather no' see it again." } },
      choices = {
        { text = "A charger's trust is sacred. I'll never break it.", next = "BACK", reply = "Good, for a charger that trusts ye will carry ye through fire, an' I'd like tae think yours will come home in one piece.", fx = { align = { light = 1 } } },
        { text = "A charger is a tool of war. It must serve.", next = "BACK", reply = "Aye, it is, an' it will, but it serves better when it loves ye, so treat it kindly an' ye'll find it serves twice as well.", fx = { align = { light = -1 } } },
        { text = "Something else, Ulbrek.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They trust anyone who's gentle wi' them, an' quiet folk usually are, for they've learned that loud ones get noticed. Speak low an' move slow, an' they'll come tae ye in time, same as they do tae me." },
      },
      choices = {
        { text = "I'll be gentle with them.", next = "BACK", reply = "Good, an' they'll come tae ye, for quiet folk an' gentle hands are the two things a beast trusts most in this world.", fx = { align = { light = 1 } } },
        { text = "I'm not here to make friends with rams.", next = "BACK", reply = "Fair enough, but they'll make friends wi' ye anyway, if ye stand still long enough, for they've no' much sense about who they like.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest at the stables! The beasts like a gentle voice, an' I'd wager yers is gentler than most, so come an' say hello tae them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin at the stables! Ye'll be wantin' a charger one day, I'd guess, an' I'd like tae meet it when ye do, for chargers are fine beasts." },
        { id = "h_default", key = true,
          text = "Ulbrek Firehand, stable master. The hunters leave their companions wi' me when they've a new beast tae tame, an' I keep them fed an' brushed an' happy till they come back." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage at the stables! I'll ask ye no' tae frighten the beasts, for some o' them have seen a mage's fire an' they remember it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock at the stables! Keep yer creature well back, for the beasts can smell it, an' they dinnae like it one bit." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, eh? Ye've no beast for me tae keep, but ye're welcome tae stand by the stalls an' say hello." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Come in, come in; is it a new beast ye're after, or are ye leavin' an old friend wi' me for a while?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, an' a kaldorei. The beasts in the stalls'll smell the forest on ye, so don't be surprised if they all start fussin'." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. The rams always know when someone quiet comes in, for they go still an' watch the door, an' they've been watchin' ye since ye stepped in." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! My charges always go quiet when yer kind passes, so ye'll forgive them if they stare. I've seen hunters get less respect." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? Keep yer voice low, mind." },
        { id = "h_again2", text = "Go on, the beasts don't mind ye." },
      },
      choices = {
        { text = "I'd like to see the stables.", next = "BUSINESS" },
        { text = "What beasts do you keep here?", next = "beasts" },
        { text = "The animals must miss their hunters.", next = "miss" },
        { text = "Where can I find a ram to ride?", next = "rams" },
        { text = "Do the beasts really remember a mage's fire?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why do the beasts hate a warlock's creature so?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the beasts here take kindly to warriors, Ulbrek?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How do you care for the beasts we leave, Ulbrek?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever need a priest for the beasts, Ulbrek?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How should a paladin treat a charger, Ulbrek?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the beasts in your stalls miss the wild, Ulbrek?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do your beasts trust someone so quiet, Ulbrek?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the beasts in your stable know a shaman on sight?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Ulbrek.", next = "END" },
      },
    },

    beasts = {
      lines = {
        { id = "be_default", text = "Bears from Dun Morogh, mostly, an' wolves an' a few cats, an' once a great crab from the Wetlands that pinched everyone who came near. The hunters tame all sorts, an' I've learned tae care for all sorts." },
      },
      choices = {
        { text = "What happened to the crab?", next = "beasts_crab" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_crab = {
      lines = {
        { id = "bc_default", text = "Its hunter came back for it, an' the two o' them went off tae Stranglethorn as happy as ye like. I still have the scar on my thumb, an' I'm fond o' it, in a strange way." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    miss = {
      lines = {
        { id = "mi_default", text = "Aye, they do, for a beast that's been tamed has given its heart tae one person. They eat less an' sleep more while they're waitin', an' when their hunter comes back, ye've never seen such joy." },
      },
      choices = {
        { text = "Then hunters shouldn't leave them behind at all.", next = "BACK", reply = "Maybe no', but the hunt doesnae always allow it, an' I'd rather they came here tae me than were left alone in the wilds.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A hunter needs the right beast for the hunt.", next = "BACK", reply = "Aye, that's true, an' I understand it, but the old beast in the stall still waits for ye, so come an' say hello now an' then.", fx = { align = { light = -1 } } },
      },
    },

    rams = {
      lines = {
        { id = "ra_default", text = "No' here, for these stalls are for hunters' companions. Ye'll want the Amberstills' ranch out in Dun Morogh, east o' Kharanos, where they breed the finest rams in the mountains." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a hunter once, till a wendigo in the Grizzled Den taught me I'd rather tend beasts than chase them." } },
    advice = { { id = "tp_ad", text = "Feed yer companion before ye sit down tae yer own supper, for a beast remembers who fed it first." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer's gryphons are fine beasts, but they're spoiled rotten, an' I'll no' take one in my stable. They'd eat the rams." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw keep bears an' wolves in their tunnels, I'm told, an' treat them like kin. I'd like tae see their stables, if they have such a thing." } },
    centaur = { { id = "tp_centaur", text = "The centaur ride nothin', since they're already horse an' rider both. I find that unsettling, an' so do my rams." } },
    _none = { { id = "tp_none", text = "Beasts I know, but that I don't. Try somebody in the Commons." } },
  },
}

-- Bixi Wobblebonk: weapon master in Timberline Arms; daggers, crossbows and thrown weapons.
P:NPC {
  key = "if_bixi", id = TODO_NPC("Bixi Wobblebonk"), name = "Bixi Wobblebonk",
  bible = "bibles/wards_cavern.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "eager" }, values = { "friendly", "proud" },
  notices = { "class" },

  impression = {
    first = "Bixi Wobblebonk teaches daggers, crossbows and throwing weapons at Timberline Arms. She is cheerful about it in a way that is slightly alarming, given what she teaches.",
    third = "{name} met Bixi Wobblebonk, a gnome weapon master in Ironforge's Military Ward.",
  },

  greetings = {
    { id = "g_default", text = "Well, hello there! Come to learn something sharp, have you? Sharp, balanced and properly weighted, I hope, because I can tell a dagger's balance point by eye to the width of a hair." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Have you been practicing? I can always tell when someone hasn't, because the wrist drops about two degrees." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue! You lot always want daggers, and you always hold them wrong at first. Let me see your grip before you leave." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Not mine, it never has! But a shaman threw an axe at a target down here last month and swore the wind carried it the last foot. I couldn't measure it and he wouldn't throw it again, which is very suspicious and very annoying." } },
      choices = {
        { text = "Honest aim, not borrowed wind. That's how I fight.", next = "BACK", reply = "That's the spirit, and much easier to measure, so I'll put you on my target range and see how honest your aim really is.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A little help from the wind never hurt anyone.", next = "BACK", reply = "Never hurt anyone, perhaps, but it's terrible for my data, so if you use it on my range, please write down which way it was blowing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Everyone needs to learn the dagger, because sooner or later you're on two legs with your claws out of reach. A good blade in the hand is better than a good intention in the head." } },
      choices = {
        { text = "Prepared is better than proud. Teach me.", next = "BACK", reply = "Splendid, a sensible druid, and you'll be glad of it the first time something catches you between shapes, I promise.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "My claws have never failed me yet.", next = "BACK", reply = "Yet is the most dangerous word in any fight, and I'll be here when they do, with a nice sharp dagger and an I told you so.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every warrior should, for it's how you pull one troll out of a camp instead of all twelve. Learn to load it quickly and shoot it straight, and then you can go back to hitting things, which I know is your favourite part." } },
      choices = {
        { text = "One at a time is the sensible way.", next = "BACK", reply = "Exactly, and you'll be much less tired and much more alive than the warriors who rush in, though admittedly less dramatic.", fx = { align = { order = 1 } } },
        { text = "I'd rather fight all twelve at once.", next = "BACK", reply = "Oh, you're one of those, and I'll have the bandages ready, because twelve trolls at once is a very short fight for somebody.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Quieter, cheaper, and they don't blow up in your face when the powder's damp, which is more than any rifle can say in a Wetlands rain. The dwarves won't hear a word of it, of course, but then the dwarves also like loud noises." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Quieter, cheaper, and they don't blow up in your face when the powder's damp. And your {pet} won't flinch at every shot, either, which I always think is kinder." },
      },
      choices = {
        { text = "I'll learn the crossbow properly, from the start.", next = "BACK", reply = "Splendid, from the start is the only way, and you'll thank me when your powder's damp and mine's not needed at all.", fx = { align = { order = 1 } } },
        { text = "I'll stick to my rifle. Noise has its uses.", next = "BACK", reply = "It does, I suppose, mostly for telling the trolls exactly where you are, but every hunter to their own taste.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "For when the mana runs out, of course, which is always at the worst moment. I teach them to hold a dagger properly, and I tell them to stand behind someone large, which is the best advice I give anyone." } },
      choices = {
        { text = "A good mage keeps a blade for emergencies. I'll learn.", next = "BACK", reply = "Wonderful, and I'll teach you to hold it properly, which most mages don't, and to stand behind someone large, which most mages do.", fx = { align = { order = 1 } } },
        { text = "If my mana runs out, I'll run. Daggers are for others.", next = "BACK", reply = "Running is a perfectly respectable tactic, and very good exercise, but a dagger in the hand makes running a great deal safer.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Every warlock should, for a demon can't follow you everywhere and some fights start before you can summon one. A dagger's always there, and it never sulks or sets your robes alight like an imp." } },
      choices = {
        { text = "I'll learn it and fight beside my demon, not behind it.", next = "BACK", reply = "Splendid, and your demon will thank you for it, assuming they thank anyone, which I doubt, but you'll be alive to wonder.", fx = { align = { honor = 1 } } },
        { text = "My demon does the fighting. That's what it's for.", next = "BACK", reply = "It is, until the day it isn't there, and then you'll wish you'd spent an afternoon on my range learning the pointy end.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Oh, I think so, because a priest who can't defend herself is a priest who'll be healing herself, and that's no good to anyone. But I'll admit the Mystic Ward's priests think differently, and they're very polite when they tell me so." } },
      choices = {
        { text = "A priest's strength is in faith. I'll keep my hands open.", next = "BACK", reply = "That's a lovely thought, and I won't argue with faith, but keep a little knife in your boot anyway, purely for emergencies.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You're right. A healer who can't fight is a target.", next = "BACK", reply = "Exactly, and I'm glad you see it, because the Mystic Ward's priests keep coming to me with bruises and asking where they went wrong.", fx = { align = { light = -1 } } },
        { text = "Thanks, Bixi.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Is it honourable for an ogre to be three times your size? I think not, so I don't see why I should fight fair when he doesn't. But I'll admit a few paladins have told me otherwise, and very sternly." } },
      choices = {
        { text = "Honour doesn't depend on the foe's size. I'll fight fairly.", next = "BACK", reply = "That's very noble of you, and I'll respect it, though I'll keep a crossbow handy in case the ogre doesn't share your views.", fx = { align = { honor = 1 } } },
        { text = "You're right. Use every advantage. Fairness is for duels.", next = "BACK", reply = "Exactly, and I'm glad you see it, because a paladin who fights smart lives long enough to fight fair another day.", fx = { align = { honor = -1 } } },
        { text = "Thanks, Bixi.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You'd be surprised how many priests want to learn daggers, and how many of them hold them like a candle." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll want a hammer, I expect, but I don't teach those, so I'll teach you to throw something instead." },
        { id = "h_default", key = true,
          text = "Bixi Wobblebonk, weapon master! I teach daggers, crossbows and throwing weapons, which are all the best weapons for someone my size, mathematically speaking, and quite good for someone yours." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! You'd be surprised how many mages want to learn daggers, and how few of them can throw straight." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock! I'll teach you daggers if you like, though I suspect your demons do most of your fighting for you." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want to learn the crossbow, I expect, for there's nothing like a bolt to bring an ogre to you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I teach crossbows, and I'll tell you now, they're better than rifles by every measure I've tested, whatever the dwarves say." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You probably fight with claws, which are basically daggers you never lose, and I'm a little bit jealous." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! You'll want maces and staves, I expect, and I teach neither, but you're welcome to try a dagger and tell me what the wind thinks of it." },
      },
      again = {
        { id = "h_again", text = "What else? Ask me anything about pointy things, and I'll give you the angles as well." },
        { id = "h_again2", text = "More questions? Lovely, I've got three new crossbow trigger designs and nobody to tell about them." },
      },
      choices = {
        { text = "I'd like some weapon training.", next = "BUSINESS" },
        { text = "Why those weapons in particular?", next = "why" },
        { text = "Who teaches the other weapons?", next = "others" },
        { text = "A dagger seems a coward's weapon to me.", next = "coward" },
        { text = "Why would a mage want to learn daggers?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Should a warlock learn to fight with a dagger?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Should a warrior learn the crossbow, Bixi?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Are crossbows really better than rifles, Bixi?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Should a priest carry a weapon at all, Bixi?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is a thrown weapon an honourable way to fight, Bixi?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would a druid ever need to learn the dagger, Bixi?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would the wind guide a thrown dagger, Bixi?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I grew up in Tinker Town. Small weapons were all anyone let me hold.", next = "xorig_tt", when = { origin = "gnome_ironforge_raised" } },
        { text = "Thanks, Bixi.", next = "END" },
      },
    },
    xorig_tt = {
      lines = {
        { id = "xtt_default", text = "Oh, me too, and every dwarf in the Ward tried to hand me an axe twice my height and then laughed when I fell over! So I learned the dagger, and then I learned to throw it, and then they stopped laughing, which I think is the whole lesson of Tinker Town, really." },
      },
      choices = {
        { text = "Twice as clever and half as loud. That's what I learned.", next = "xorig_tt2", fx = { trait = { witty = 1 }, affinity = 1 } },
        { text = "The stares never stopped bothering me.", next = "xorig_tt2", fx = { trait = { cautious = 1 } } },
      },
    },
    xorig_tt2 = {
      lines = {
        { id = "xtt2_default", text = "They stare at everyone who's short and doesn't have a beard, so don't take it to heart. That said, a well-thrown dagger from someone they weren't watching is the best answer to a stare I've ever found." },
      },
      choices = {
        { text = "I'll remember that, Bixi.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because a gnome with a big axe falls over, and I've seen it happen. A dagger, a crossbow or a good throwing knife doesn't care how tall you are, only how clever, and gnomes are very clever." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    others = {
      lines = {
        { id = "ot_default", text = "Buliwyf Stonehand, just here, for axes and the heavier things, and there's no finer teacher on axes in the city. He doesn't say much, but he's patient, and he hasn't once laughed at my height." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    coward = {
      lines = {
        { id = "co_default", text = "Only if you think fighting fair against a troll twice your size is brave rather than silly. A dagger lets a small person win, and I don't see anything cowardly in that." },
      },
      choices = {
        { text = "A fight should be won face to face.", next = "BACK", reply = "Face to face is very brave, and very tall, and I'm neither, so I'll leave that to you and keep my daggers where they work best.", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Winning is all that matters.", next = "BACK", reply = "Spoken like one of my best students, and I'll teach you everything I know, so long as you don't use it on anyone in this city.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Point taken. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I taught weapons to the guards in Gnomeregan, and now I teach them to anyone, which is more fun anyway." } },
    advice = { { id = "tp_ad", text = "Practice every day, even if only for a few minutes. Your hand forgets faster than your head, at roughly twice the rate, by my own notes." } },
    _none = { { id = "tp_none", text = "I don't know about that, but I know thirty-one ways to hold a dagger, and I've charted every one, if you'd like to hear those." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The Gurubashi Arena would be perfect for a good throwing contest, if they'd only stop all the stabbing. I'd go, if I weren't so fond of my ears." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's got a knife-throwing booth, and I won every prize on the shelf. The barker hasn't spoken to me since, which is his loss." } },
    ravenholdt = { { id = "tp_ravenholdt", text = "Some of my students go on to Ravenholdt, or so they hint. I don't ask, and they don't tell, and we're all happier for it." } },
  },
}

-- Ormyr Flinteye: rogue trainer in the Forlorn Cavern; trains rogues and nobody else.
P:NPC {
  key = "if_ormyr", id = TODO_NPC("Ormyr Flinteye"), name = "Ormyr Flinteye",
  bible = "bibles/wards_cavern.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "sharp" }, values = { "cunning", "discreet" },
  notices = { "stealth" },

  impression = {
    first = "Ormyr Flinteye trains rogues in the Forlorn Cavern and has nothing to say to anyone else. He watches the cavern's entrance even while he talks, as if expecting someone he'd rather not see.",
    third = "{name} met Ormyr Flinteye, a rogue trainer in Ironforge's Forlorn Cavern.",
  },

  greetings = {
    { id = "g_default", text = "Ye found the Forlorn Cavern, then. Most folk walk past it twice." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "One o' ours. Come in, an' keep yer voice down." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I heard ye coming at the third step, so keep practicin'. Ye'll get there." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Aye, if the shaman could keep quiet, which few o' them can, what wi' all the thunder. Mind, a rogue who knew the very stones were listenin' would think twice about a job, for the earth's a witness who cannae be paid." } },
      choices = {
        { text = "The earth sees everything. Rogues should remember that.", next = "BACK", reply = "Aye, they should, an' I'll pass it on, though most o' my lot think the walls are already on their side.", fx = { align = { honor = 1 } } },
        { text = "For the right job, the earth and I could look away.", next = "BACK", reply = "Ha, now that's a shaman I could use, an' I'll remember yer face, for a job that needs the earth lookin' away is worth a great deal.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "There's honour in whatever ye do with it, an' none in the doin' itself. A cat stalks tae eat an' a rogue stalks tae get paid, an' I'll no' pretend one's nobler than the other." } },
      choices = {
        { text = "Stealth serves the hunt, never a purse.", next = "BACK", reply = "Fair enough, an' I'll no' argue wi' a druid about the hunt, but a purse has fed more dwarves in this cavern than any deer.", fx = { align = { honor = 1 } } },
        { text = "A purse is a hunt too. Survival is survival.", next = "BACK", reply = "That's the truth o' it, an' I'll no' pretend otherwise, so ye'd make a decent rogue if ye ever got tired o' the trees.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because ye walk like a warrior, heavy an' straight an' lookin' ahead, an' everyone in the Forlorn Cavern can see ye comin'. A rogue would have yer coin before ye'd finished turnin' round, an' I'd no' stop them." } },
      choices = {
        { text = "I'll walk straight anyway. I've nothing to hide.", next = "BACK", reply = "Then ye'll keep yer honour an' lose yer coin, an' that's a fair trade for some, but mind yer pockets in the Forlorn Cavern.", fx = { align = { honor = 1 } } },
        { text = "Then I'll learn to walk softer, and watch closer.", next = "BACK", reply = "Good, an' ye'll keep yer coin a good deal longer, an' maybe one day ye'll be the one watchin' the warriors walk past.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It looks at what it's thinkin' about, an' a watcher can follow its eyes tae yer target before ye've drawn. Train it tae look away, an' ye'll be harder tae read than half the rogues I teach." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It looks at what it's thinkin' about, an' a watcher can follow its eyes tae yer target, so train it tae look away. Yer {pet} is lookin' at me now, as it happens, which tells me ye've already decided I'm the danger in this room." },
      },
      choices = {
        { text = "My beast is honest. I'll not train that out of it.", next = "BACK", reply = "Fair enough, an' an honest beast is a fine thing, but it'll give ye away one day, an' then ye'll wish it had learned tae lie.", fx = { align = { honor = 1 } } },
        { text = "A useful trick. I'll teach it to look away.", next = "BACK", reply = "Good, an' it'll take a few weeks, but once it's learned, ye'll be harder tae read than half the rogues in this cavern.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a mage can open a portal where a rogue cannae, an' a portal leaves no footprints. I'll no' tell ye who's askin', but if ye ever fancy the work, ye know where I stand." } },
      choices = {
        { text = "I'll not use my portals for thieves, Ormyr.", next = "BACK", reply = "Then ye'll keep yer good name, an' I'll no' think less o' ye, but the offer stands, should yer purse ever need fillin'.", fx = { align = { order = 1 } } },
        { text = "A portal with no footprints? I'd like to hear more.", next = "BACK", reply = "I thought ye might, an' I'll tell ye more when we're somewhere quieter, for the walls in this cavern have very long ears.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Peacefully enough, for both of us know the guards would happily throw us out together. We keep tae our corners, an' we nod in passin', an' that's how it'll stay." } },
      choices = {
        { text = "Then I'll keep to my corner, and nod as I pass.", next = "BACK", reply = "Good, an' we'll get along fine, for a nod in passin' is the best friendship a rogue can offer in the Forlorn Cavern.", fx = { align = { order = 1 } } },
        { text = "Corners are for the cautious. I go where I like.", next = "BACK", reply = "Then ye'll find out how quickly the guards come runnin', an' I'll be nowhere near ye when they do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Now an' again, though they'd never admit it, for a rogue who admits he's hurt is a rogue who's been caught. If ye've a healin' word tae spare, I'll no' stop ye givin' it, but I'll no' ask ye for it either." } },
      choices = {
        { text = "Then I'll give it freely. Everyone deserves healing, rogue or not.", next = "BACK", reply = "Bless ye, though no rogue would say so aloud, an' I'll see the word gets around that ye're a soft touch, in the kindest way.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Rogues choose their dangers. Let them heal themselves.", next = "BACK", reply = "Aye, they do, an' they'll no' complain, but a rogue who heals himself is a rogue who limps, an' limpin' rogues get caught.", fx = { align = { light = -1 } } },
        { text = "I'll be on my way.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because the King knows, an' the guards know, an' they've decided they'd rather have us where they can see us. If ye report it, ye'll be tellin' them what they already know, an' I'll be wonderin' why ye bothered." } },
      choices = {
        { text = "The law knows. I'll leave it there, and you be.", next = "BACK", reply = "Wise, paladin, an' rarer than ye'd think, so I'll thank ye for it, an' I'll keep my lads out o' yer way in return.", fx = { align = { order = 1 } } },
        { text = "Knowing isn't the same as approving. I'll keep an eye on you.", next = "BACK", reply = "Ye'll find me easy tae watch, paladin, for I'm always right here, an' the ones ye should worry about never are.", fx = { align = { order = -1 } } },
        { text = "I'll be on my way.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, down here? I've nothin' tae teach ye, but I'll say the cavern could use a kind word now an' then, for it doesnae get many." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Ye're in the wrong cavern, an' I'd suggest ye find the right one before somebody mistakes ye for the guards." },
        { id = "h_default",
          text = "Ormyr Flinteye. I train rogues, an' only rogues, so unless ye are one, I've no' much to offer ye but advice, an' my advice is to keep yer purse close in this part o' the city." },
        { id = "h_rogue", key = true, when = { class = "ROGUE" },
          text = "Ormyr Flinteye, an' ye've come to the right corner. I'll teach ye what ye're ready to learn an' not a lesson more, for a rogue who knows too much too soon gets careless." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. I've nothin' tae teach ye, but I'll tell ye that plenty o' rogues in this cavern would pay well for a mage who could keep a secret." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock. Yer trainers aren't far from mine, an' I'd say we get along, so long as yer lot keeps their creatures out o' our corner." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Ye're in the wrong cavern, friend, but I'll no' throw ye out for askin' directions." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Ye've a lighter step than most, I'll grant ye, but yer beast gives ye away." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Yer kind can walk as a cat in the dark, I hear, which makes ye more of a rogue than some o' the ones I train." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Ye'll no' find many friends o' the earth down here, for my lot prefer the shadows, an' shadows dinnae answer tae anybody." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Quickly." },
        { id = "h_again2", text = "Go on, then; nobody's listening, for I checked the passage myself." },
      },
      choices = {
        { text = "Show me what you teach.", next = "BUSINESS" },
        { text = "Why is this place called the Forlorn Cavern?", next = "cavern" },
        { text = "What makes a good rogue?", next = "good" },
        { text = "The guards must know what you teach down here.", next = "guards" },
        { text = "I learned my trade picking pockets on the canals.", next = "k_canal", when = { origin = "human_canal_pickpocket" } },
        { text = "Why would rogues pay for a mage who keeps secrets?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the rogues and warlocks share the Forlorn Cavern peacefully?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why should a warrior keep his purse close down here?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How does a hunter's beast give me away, Ormyr?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your rogues ever need a priest's help, Ormyr?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why shouldn't a paladin report what you teach down here, Ormyr?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is there honour in a druid's stealth, Ormyr?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Could a rogue and a shaman ever work together, Ormyr?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    cavern = {
      lines = {
        { id = "ca_default", text = "Because nobody comes here by choice, an' the light's poor, an' the folk who work here prefer it that way. The fishermen an' the warlocks keep to their own business, an' I keep to mine." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    good = {
      lines = {
        { id = "go_default", text = "Patience, mostly, an' knowing when no' to strike. Any fool can stab a man, but a rogue picks the moment, an' half the time the moment never comes, an' ye walk away an' nobody knew ye were there." },
      },
      choices = {
        { text = "A blade in the back is still a blade in the back.", next = "BACK", reply = "It is, an' I'll no' pretend otherwise, but it's a blade in the back that didnae have tae be a war, an' that's worth somethin'.", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "The one who strikes first lives longest.", next = "BACK", reply = "Sometimes, aye, but the one who strikes at the right moment lives longest of all, an' that's what I teach in this cavern.", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },

    guards = {
      lines = {
        { id = "gu_default", text = "They know, an' the King knows, an' they let us be. Ironforge has enemies who don't fight fair, so it's useful to have a few folk who don't either." },
      },
      choices = {
        { text = "Which enemies?", next = "guards_enemies" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guards_enemies = {
      lines = {
        { id = "ge_default", text = "Dark Iron spies, mostly, wearin' our colors an' listening at our doors. I've caught two in this very cavern, an' I'll not say what happened after, so don't ask." },
      },
      choices = { { text = "I won't ask.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron" } } } },
    },

    k_canal = {
      lines = {
        { id = "kc_default", text = "Stormwind's canals, eh? Ye'll have quick hands, then, but sloppy feet, for nobody ever chased ye far. We'll fix the feet, an' ye'll keep the hands." },
      },
      choices = { { text = "My feet are fine, thank you.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'd tell ye, but then I'd have to stop trusting ye, an' I've only just started." } },
    advice = { { id = "tp_ad", text = "Never sit wi' yer back to a door. No' even in Ironforge." } },
    ravenholdt = { { id = "tp_ravenholdt", text = "If ye have tae ask about Ravenholdt, ye've no business there. That's all ye'll get from me, an' it's more than I tell the guards." } },
    syndicate = { { id = "tp_syndicate", text = "The Syndicate are thieves who think they're nobles, or nobles who think they're thieves. Either way, they make the rest o' us look bad." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's a fine place fer a rogue tae lose himself, if ye can keep yer purse away from the goblins. They're better at it than we are." } },
    _none = { { id = "tp_none", text = "Never heard of it, an' if I had, I'd no' tell ye." } },
  },
}

-- Grimnur Stonebrand: fishing trainer at the Traveling Fisherman in the Forlorn Cavern.
P:NPC {
  key = "if_grimnur", id = TODO_NPC("Grimnur Stonebrand"), name = "Grimnur Stonebrand",
  bible = "bibles/wards_cavern.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "calm" }, values = { "patient", "friendly" },
  notices = { "craft" },

  impression = {
    first = "Grimnur Stonebrand teaches fishing from the doorway of the Traveling Fisherman, deep in a cavern with no water worth the name. He finds this funny, and he has the patience to explain why it doesn't matter.",
    third = "{name} met Grimnur Stonebrand, who teaches fishing in Ironforge's Forlorn Cavern.",
  },

  greetings = {
    { id = "g_default", text = "Come tae learn the rod, have ye? Sit, then; fishin' starts wi' sittin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the water, are ye? Sit an' tell me what was bitin', an' what got away." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = { "Fishing" } },
      text = "Ye smell like a lake, friend, an' I mean that kindly. What were they bitin' on?" },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Every day, an' I've half a mind tae ask ye tae call some up for me. There's an old dwarf tale that the mountain once had rivers runnin' through its halls, before the forges dried them out. I've no idea if it's true, but I'd give my best rod tae fish one." } },
      choices = {
        { text = "The forges matter more. The rivers can stay outside.", next = "BACK", reply = "Fair enough, an' the forges have earned their place, but I'd still give a great deal tae hear a river runnin' through the Commons.", fx = { align = { order = 1 } } },
        { text = "The mountain should have its rivers back, Grimnur.", next = "BACK", reply = "Aye, it should, an' I'll drink tae the day it does, though I suspect the King would have a word or two about the forges.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every summer, when the old knees allow it, an' the loch's the finest water in Khaz Modan since they raised the dam. Ye can feel the fish thinkin' in that water, an' that's a thing ye cannae teach in a cave." } },
      choices = {
        { text = "Take only what you eat, and the loch keeps giving.", next = "BACK", reply = "That's the old way, an' the right one, for the loch has fed my family for three generations, an' I'd like it tae feed three more.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Fish are fish. Catch all you can while they're biting.", next = "BACK", reply = "That's the way tae have no fish next summer, an' I'll no' teach ye a single knot until ye've thought better o' it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a warrior posted at Menethil or Thelsamar can eat fresh from the water instead o' hard biscuit, an' a warrior who eats well fights well. Patience is the lesson, mind, an' warriors are short on it, so they need it most." } },
      choices = {
        { text = "Patience, then. I'll learn the knots.", next = "BACK", reply = "Good, an' the knots will teach ye patience faster than any drill, for a fish doesnae care how strong yer arm is.", fx = { align = { order = 1 } } },
        { text = "I'll learn, but I'll catch them my own way.", next = "BACK", reply = "Yer own way, eh? Well, the fish will teach ye theirs soon enough, an' then ye'll come back an' learn mine.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Easier than most, for ye already know how tae wait an' how tae read where somethin' wants tae be. A fish is just a deer that's learned tae swim, an' a good hunter knows that the first time he casts a line." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Easier than most, for ye already know how tae wait an' how tae read where somethin' wants tae be. Yer {pet} would like fishin' too, as long as ye share the catch." },
      },
      choices = {
        { text = "I'll share the catch with my beast.", next = "BACK", reply = "That's the way, an' the beast will love ye for it, for there's nothin' a wolf likes better than a fresh trout from its master.", fx = { align = { honor = 1 } } },
        { text = "Beasts can catch their own. The fish are mine.", next = "BACK", reply = "Fair enough, an' they can, but a shared catch makes a closer partner, an' ye'll find yer beast fishes better when it's well fed.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than ye'd think, for fishin' is all about waitin' for the right moment an' strikin' quick. The best rogues I've known were good fishermen, an' the worst ones never sat still long enough tae learn." } },
      choices = {
        { text = "Patience and timing. I'll learn both, Grimnur.", next = "BACK", reply = "Good, an' ye'll be a better rogue for it, for patience is the one thing ye cannae steal from anybody.", fx = { align = { order = 1 } } },
        { text = "I'd rather take the fish from someone else's line.", next = "BACK", reply = "Ha, I've known a few who tried, an' they all ended up in the loch, so learn tae fish yer own, it's safer.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They think it makes the fish easier tae catch, but it only makes them angry an' cold. Use a rod like an honest dwarf, an' ye'll find it's more pleasant than any spell." } },
      choices = {
        { text = "A rod it is, then. I'll fish the honest way.", next = "BACK", reply = "Good, an' ye'll find it's far more pleasant, for there's nothin' like the tug on a line tae make a mage forget his books.", fx = { align = { honor = 1 } } },
        { text = "A frozen fish is still a fish, Grimnur.", next = "BACK", reply = "Aye, but an angry, cold fish isnae worth eatin', an' the rest o' the loch will remember ye, so try a rod first.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "One or two have, from the warlock trainers' corner o' the cavern, an' they were surprisingly patient. I'd ask ye only tae keep yer demon from scarin' off the fish, for they're shy enough already." } },
      choices = {
        { text = "I'll keep my demon quiet and fish patiently.", next = "BACK", reply = "Good, an' ye'll find the fishin' does yer patience good, which is a thing every warlock could use a wee bit more of.", fx = { align = { light = 1 } } },
        { text = "If my demon scares them up, that's quicker fishing.", next = "BACK", reply = "Quicker, aye, an' the fish will be too frightened tae taste right, so let the poor things come up in their own time.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some days, aye, when the line's still an' the water's quiet an' there's naught tae do but wait. I'll no' say the fish answer, but I've done a good deal o' thinkin' at the end o' a line, an' I've come home calmer than I left." } },
      choices = {
        { text = "Then it's prayer enough. Quiet waiting is holy work.", next = "BACK", reply = "That's a fine way tae put it, an' I'll think on it at the water's edge, for I've always felt there was somethin' holy in the waitin'.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fishing is fishing. Prayer is something else entirely.", next = "BACK", reply = "Maybe so, an' I'll no' argue wi' a priest, but I've thought more holy thoughts at the loch than I ever did in a church.", fx = { align = { light = -1 } } },
        { text = "Teach me to fish, Grimnur.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Patience, an' how tae wait wi'out fidgetin', which most paladins I've met could use more of. A fish doesnae care how brave ye are, an' that's a good lesson for anyone who thinks bravery solves everythin'." } },
      choices = {
        { text = "Patience is a virtue. I'll learn it, line and all.", next = "BACK", reply = "Good, an' ye'll find a fish teaches patience better than any sermon, an' it doesnae lecture ye while it does it.", fx = { align = { order = 1 } } },
        { text = "Bravery solves more than patience. I'll stick to my hammer.", next = "BACK", reply = "Fair enough, but a hammer never caught a trout, an' I'll be here when ye decide ye'd like tae learn somethin' new.", fx = { align = { order = -1 } } },
        { text = "Good fishing, Grimnur.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest wantin' tae fish? Ye'll have the patience for it, I'd wager, for yer sort sit still better than most." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin wantin' tae fish? Ye'll laugh at a fishin' lesson, I expect, but ye'll thank me for it in the Wetlands when the rations run out." },
        { id = "h_default", key = true,
          text = "Grimnur Stonebrand, fisherman, an' I teach fishin' in a cave in the middle o' a mountain, which is a joke I've stopped noticin'. Ye don't need water tae learn the knots, only patience an' a good pair o' hands." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue wantin' tae fish? I'll teach ye, but I'll warn ye that patience matters more than quick hands here." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage wantin' tae fish? I've had a few, an' every one tried tae freeze the water first." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock wantin' tae fish? I'd never have guessed it, but I've learned no' tae judge a body by their trade." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Ye'll laugh at a fishin' lesson, I expect, but I've taught warriors tae fish an' they've thanked me for it in the Wetlands." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Ye'll take tae fishin' easy, I'd wager, for it's just huntin' wi' the beast underwater." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Yer people fish the shores o' Teldrassil, I hear, so ye'll laugh at a dwarf teachin' fishin' in a mountain, same as everyone." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Ye'll know the water, then, an' ye'll forgive me teachin' fishin' in a cave wi' no water in it. The joke's on me, I know." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I've all day." },
        { id = "h_again2", text = "Take yer time, friend." },
      },
      choices = {
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "Where's the best fishing near Ironforge?", next = "where" },
        { text = "Where do I learn beyond what you teach?", next = "beyond" },
        { text = "Fishing hardly seems worth learning.", next = "why" },
        { text = "A rogue could learn something from fishing, I'd think.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why would a mage freeze the water to fish?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do warlocks really fish, Grimnur?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why would a warrior thank you for fishing lessons?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters really take to fishing easily, Grimnur?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is fishing like prayer, Grimnur?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Can a paladin learn anything from fishing, Grimnur?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you ever fish the waters of Loch Modan, Grimnur?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "You must wish the water came to your cave, Grimnur.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good fishing, Grimnur.", next = "END" },
      },
    },

    where = {
      lines = {
        { id = "wh_default", text = "The frozen lakes in Dun Morogh, if ye can break the ice, but Loch Modan's better, for it's the biggest water this side o' the mountains. Stand on the shore by Thelsamar at dawn, an' ye'll catch more than ye can carry." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    beyond = {
      lines = {
        { id = "be_default", text = "Once ye've learned what I can teach, there's a book ye'll need, sold by Old Man Heming in Booty Bay, down in Stranglethorn. After that, the finest fisherman in the world is Nat Pagle, who sits on a little island in Dustwallow Marsh an' won't talk tae ye till ye've proved yerself." },
      },
      choices = {
        { text = "How do I prove myself to Nat Pagle?", next = "beyond_nat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beyond_nat = {
      lines = {
        { id = "bn_default", text = "By fishin', an' years of it, an' bringin' him somethin' he's no' seen before. I met him once, an' he said three words tae me in an hour, an' all three were about my knots." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    why = {
      lines = {
        { id = "wy_default", text = "Because fish are food, an' food's life when ye're far from an inn. An' because sittin' quiet by the water is the only time some adventurers ever stop tae think, an' most o' them need it." },
      },
      choices = {
        { text = "The sitting's the best part. The fish are a bonus.", next = "BACK", reply = "Ha, that's the right answer, an' ye'll make a fine fisherman, for the ones who come for the sittin' always catch the most.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd rather be doing something useful.", next = "BACK", reply = "Fishin' is useful, an' ye'll find out how useful the first time ye're far from an inn wi' nothin' but a rod an' an empty belly.", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fished Loch Modan for thirty years, till my back told me tae sit somewhere warmer an' teach." } },
    advice = { { id = "tp_ad", text = "Use the right bait for the right water. A lake fish won't touch what a river fish loves." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got the best fishing in the world an' the worst fishermen, all pirates an' goblins who'd sooner sell a fish than catch one. Still, I'd go back." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's docks are fine fer fishing, if ye dinnae mind goblins watching ye an' offering tae buy yer catch before ye've landed it. They always undersell, too." } },
    everlook = { { id = "tp_everlook", text = "I fished through the ice near Everlook once, an' caught nothin' but a cold. Still, it was the finest fishin' trip I ever had." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye about that, friend. Fish, I know." } },
  },
}

-- Tansy Puddlefizz: fishing supplies at the Traveling Fisherman; Grimnur's gnome assistant.
P:NPC {
  key = "if_tansy", id = TODO_NPC("Tansy Puddlefizz"), name = "Tansy Puddlefizz",
  bible = "bibles/wards_cavern.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "quick" }, values = { "friendly", "inventive" },
  notices = { "craft" },

  impression = {
    first = "Tansy Puddlefizz sells rods, bait and lures at the Traveling Fisherman and keeps trying to improve them. She is Grimnur's assistant and talks about him with great affection and mild exasperation.",
    third = "{name} met Tansy Puddlefizz, who sells fishing supplies in Ironforge's Forlorn Cavern.",
  },

  greetings = {
    { id = "g_default", text = "Rods, bait, lures and bobbers! Everything a fisherman needs, and some things they don't yet, because I invented them on Tuesday." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did the bobber float? I've been worried about that bobber." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = { "Fishing" } },
      text = "Oh, a proper fisher! Tell me what lure you use, and I'll tell you what's wrong with it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I've never thought to ask them! Grimnur says fish are fish and lures are lures, but if there's a spirit in the water deciding which bait it likes, that's a variable I've completely ignored. I'll need a new notebook." } },
      choices = {
        { text = "Mind the water's balance, and the water will mind you.", next = "BACK", reply = "Oh, that's lovely, and I'll add balance to my variables, though I'm not quite sure how to measure it with a stopwatch.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Fish are fish. Keep ticking, Tansy.", next = "BACK", reply = "Exactly what Grimnur says, and he's usually right, so I'll keep ticking and leave the spirits to the shamans.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I've tried, and they never answer, which Grimnur says is the whole point of fishing. I suspect a druid could tell me, but I'm afraid of what the fish would say." } },
      choices = {
        { text = "Let the fish keep their secrets. That's fair sport.", next = "BACK", reply = "That's what Grimnur says too, and I suppose you're both right, but my curiosity keeps tugging at me like a fish on a line.", fx = { align = { honor = 1 } } },
        { text = "Use every trick you can. The fish would do the same.", next = "BACK", reply = "Ha, I like that, and I'll put it in my notes, because the fish have been out-thinking me for years and it's time I caught up.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "In theory, and I've only tested it on Grimnur, who isn't an ogre but argues like one. Warriors buy it for tying up their packs, mostly, and one bought it for climbing, which I don't recommend but can't stop." } },
      choices = {
        { text = "I'll use it for my pack, as intended.", next = "BACK", reply = "Splendid, a sensible customer, and I'll note that you used it as intended, which helps my warranty enormously.", fx = { align = { order = 1 } } },
        { text = "I'll test it on the next ogre I meet.", next = "BACK", reply = "Oh, would you, and tell me how it holds, because Grimnur argues like an ogre, but he doesn't pull nearly as hard.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That's what I'm hoping, for if it draws a fish out of the deep, it might draw a fox out of the brush. Grimnur says I'm mixing up my trades, but Grimnur's been fishing in a cave for twenty years, so I'm not sure he's the one to talk." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That's what I'm hoping, for if it draws a fish out of the deep, it might draw a fox out of the brush. Your {pet} could tell me whether it sounds right, though I'd hold on to it in case it sounds too right." },
      },
      choices = {
        { text = "I'll test it fairly and tell you the truth.", next = "BACK", reply = "Splendid, an honest test is the best kind, and I'll have a notebook ready for the results, fox or fish.", fx = { align = { honor = 1 } } },
        { text = "I'll test it, and keep the lure if it works.", next = "BACK", reply = "Fair enough, you've earned it, and I'll have another ready for the next tester, because I always make two of everything.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the ones I make for the cavern's rogues get used for all sorts of things besides fishing, and I make a point of not asking. A quiet line's a useful tool, and I'm a gnome who appreciates a useful tool." } },
      choices = {
        { text = "I'll only use it for fishing, Tansy, you have my word.", next = "BACK", reply = "Thank you, that's very reassuring, and I'll make you a nice one, though I'll pretend I didn't hear the honestly part.", fx = { align = { honor = 1 } } },
        { text = "Better you don't ask what it's really for.", next = "BACK", reply = "Then I won't, and I'll be very careful not to think about it, though I may sleep a little less well tonight.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "In theory, yes, though the fish might also be attracted to the light in a way that's less helpful. Gnomeregan's fishermen had something similar before the fall, and I'm trying to rebuild it from memory." } },
      choices = {
        { text = "Let's test it carefully before you sell it.", next = "BACK", reply = "Splendid, careful is always better, and I'll test it on Grimnur first, because he's very patient and not at all shiny.", fx = { align = { order = 1 } } },
        { text = "Sell it now. The fish won't complain.", next = "BACK", reply = "Oh, I couldn't, not until it's tested, because if the fish complain, they'll do it by biting off something important.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because a green glow tends to attract things that aren't fish, and I've had enough surprises in this cavern. Grimnur says I'm too cautious, but Grimnur wasn't the one who had to fish an imp out of the pool." } },
      choices = {
        { text = "Ordinary lures for me, then. I'll leave the imp-fishing to you.", next = "BACK", reply = "Very wise, and much safer for everyone, and if you ever do go imp-fishing, please don't do it in my cavern.", fx = { align = { light = 1 } } },
        { text = "The things that aren't fish sound more interesting.", next = "BACK", reply = "That's exactly what I'm afraid of, and I'll keep my green lures in a locked drawer until somebody braver comes along.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Oh, I've wondered, but Grimnur says it'd be disrespectful, and I suppose he's right, though I still think the fish would like it. I'll stick to arcane glow, for now, and keep the holy sort for the priests." } },
      choices = {
        { text = "Grimnur's right. Some things shouldn't be used for sport.", next = "BACK", reply = "He usually is, the old grump, and I'll stick to arcane glow and leave the Light for the priests, where it belongs.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If it works, why not? Holy things can be useful things.", next = "BACK", reply = "That's very practical of you, and I'm tempted, but Grimnur would never speak to me again, and I'd miss his grumbling.", fx = { align = { light = -1 } } },
        { text = "Show me your supplies, Tansy.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Tied up, if it can be done, because even ogres have families, I suppose, though I've never met one. But Grimnur says I'm too soft, and maybe I am, and maybe that's no bad thing." } },
      choices = {
        { text = "Tie it up. Mercy, where it's possible, is always right.", next = "BACK", reply = "Thank you, I knew I couldn't be the only one who thought so, and I'll tell Grimnur a paladin agreed with me.", fx = { align = { light = 1 } } },
        { text = "Put it down. Ogres don't show mercy, and neither should we.", next = "BACK", reply = "Maybe you're right, and Grimnur would say so too, but I'd still rather tie one up than not, if I ever have the choice.", fx = { align = { light = -1 } } },
        { text = "Goodbye, Tansy.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I've been working on a lure that glows softly, like a candle in a chapel, and I'd love to know if you think it's too much." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I don't sell hammers, but I sell a line that'll hold an ogre's weight, if you ever need to tie one up before the guards arrive." },
        { id = "h_default", key = true,
          text = "Tansy Puddlefizz, fishing supplies, and assistant to Grimnur, who teaches the fishing. I sell the rods and the lures, and I tinker with them when nobody's looking, which is most of the time down here." },
        { id = "h_tinkertown", when = { origin = "gnome_ironforge_raised" },
          text = "Hello, neighbour! You grew up in Tinker Town too, didn't you? Then you know why I came out to the Forlorn Cavern, because it's the one place in the city where nobody stares at a gnome with a fishing rod." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! You'll be wanting a fishing line that doesn't squeak, I expect, and I've just the thing." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! I've been tinkering with a lure that glows with arcane light, and I'd love to know if you think it'd work." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock! I've had warlocks ask for lures that glow green, and I've always said no, because the fish don't like it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! I don't sell axes, but I sell a very good line that'll hold an ogre's weight, if you ever need to tie one up." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've been making a lure that sounds like a wounded rabbit, and you're exactly the person to test it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You're the first customer who might actually know what the fish think of my lures, and I have so many questions." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Could you tell me whether fish like a ticking lure? My mechanical ones catch more gnomes than fish." },
      },
      again = {
        { id = "h_again", text = "Anything else? Ask away, and I'll keep winding this reel; I'm trying to get the drag down to a perfect three turns." },
        { id = "h_again2", text = "Ask me anything about lures, and I'll tell you more than you wanted." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What do you tinker with?", next = "tinker" },
        { text = "A gnome selling fishing rods is an unusual sight.", next = "how" },
        { text = "What's Grimnur like to work for?", next = "grimnur" },
        { text = "Why would a rogue need a fishing line that doesn't squeak?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would an arcane lure really attract more fish?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why won't you make green-glowing lures for warlocks?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Could your line really hold an ogre, Tansy?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Would a fishing lure work for hunting beasts, Tansy?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you think holy light could ever be used for fishing, Tansy?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you rather an ogre be tied up or put down, Tansy?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Have you ever asked the fish what they think of your lures?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would the water spirits approve of your mechanical lures, Tansy?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Tansy.", next = "END" },
      },
    },

    tinker = {
      lines = {
        { id = "ti_default", text = "Lures, mostly, for fish like things that shine and wiggle, and I can make things that shine and wiggle better than any dwarf alive. I'm working on a bobber that rings a bell, so you can nap while you fish." },
      },
      choices = {
        { text = "That sounds like cheating.", next = "BACK", reply = "Cheating? It's science, and the fish can perfectly well ignore the bell if they don't like it, which they often do.", fx = { align = { order = 1 } } },
        { text = "That sounds like genius.", next = "BACK", reply = "Oh, thank you, that's exactly what I think, and I'll name the first working bobber after you, if it ever stops ringing on its own.", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },

    how = {
      lines = {
        { id = "ho_default", text = "I needed work after Gnomeregan, and Grimnur needed someone who could fix a reel. It turned out I liked fishing far more than I expected, though I still don't like the fish." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },

    grimnur = {
      lines = {
        { id = "gr_default", text = "Lovely, really, and very patient, though he says everything twice, slowly, as if I'm a fish. He thinks my lures are silly, but he uses the shiny ones when he thinks I'm not watching." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fixed water pumps in Gnomeregan, and now I fix reels, and it's not so different, except reels don't flood." } },
    advice = { { id = "tp_ad", text = "Bring spare line. You'll always need more than you think." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's bait shop sells lures that glow, and I want to know how. Grimnur says I'm not to experiment, but he says that about everything." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet sells cheap line that snaps if you look at it wrong, and they know it. I've written to complain, and they've offered to sell me better line." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire has a fishing game with wooden fish, and I won every time. Grimnur says that's not fishing, and he's right, but it's still winning." } },
    _none = { { id = "tp_none", text = "Hmm, I don't know that one, and there's no gear in it for me to take apart! Ask Grimnur; he knows everything that's not about gadgets." } },
  },
}
