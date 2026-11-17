-- Ashenvale between the towns (0.38.0): Forest Song, a bowyer's roadside camp, Zoram'gar, and a captive furbolg. Voice: bibles/ashenvale.md
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "kayneth", id = TODO_NPC("Kayneth Stillwind"), name = "Kayneth Stillwind", title = "",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "forest_song" }, temper = { "tense" }, values = { "dutiful", "protective" },
  impression = {
    first = "Kayneth Stillwind holds Forest Song, the far eastern outpost of Ashenvale, with the Forsaken on one side and demons on the other. He speaks like a man counting arrows.",
    third = "{name} met Kayneth Stillwind, who keeps watch at Forest Song in eastern Ashenvale.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Forest Song, {class}, the last kind word you'll hear before Felwood." },
    { id = "g_back", when = { metBefore = true }, text = "You're back in the east, then, and in one piece. That's more than I can say for the Forsaken's last messenger." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If we have enough arrows and enough hands. Your spirits are welcome on the walls." } },
      choices = {
        { text = "Then count me among your hands, Kayneth.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forest Song is lost. Retreat.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Less than I feared, so far, though the deer near their camps have begun to waste and the streams there smell wrong. I can count arrows and Forsaken, but I can't count what a sickness does under the soil, and that is why I need your kind." } },
      choices = {
        { text = "Heal the woods first. Vengeance on the Forsaken can wait.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Burn out the sick ground and their camps before it spreads.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The satyrs of Satyrnaar would be my answer on most days, but the Forsaken and their diseases worry me more, because I don't know what they want. A blade will answer the satyrs, but against the Forsaken I need eyes before I need blades." } },
      choices = {
        { text = "Then I'll watch before I strike.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd strike the Forsaken before they strike us.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I don't know yet, and that's the trouble, because sick beasts wander and I can't tell what they carry. If you find carcasses near their camps, look closely, and bring back what you can without touching it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} away from anything dead in those woods, I beg you. Whatever the Forsaken carry, I don't want it in our companions." },
      },
      choices = {
        { text = "I'll investigate carefully and report back.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll burn their camps and be done with it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "You could, and you'd learn more in one night than my Sentinels have in a month, because the Forsaken know our footsteps by now. Bring me what they're brewing and who's brewing it, and don't touch anything with your bare hands." } },
      choices = {
        { text = "I'll bring you proof, and spill no blood doing it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll bring proof, and leave their brewers dead in the mist.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The druids would rather you didn't try, because the last ones who thought they could master Felwood's sickness were the Shadow Council at Jaedenar, and you can see what it made of them. Help me learn what the Forsaken are brewing, and leave the soil to those who can listen to it." } },
      choices = {
        { text = "I'll leave it to the druids, as you ask.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If the druids can't cleanse it, someone else should try.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Sickened some beasts, from what I hear, though we haven't yet learned what it does to the people who handle them. If you see the signs, burn what you can and pray, because I don't know what else to tell you." } },
      choices = {
        { text = "I'll pray, and watch for the signs everywhere.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burning is surer than prayer. I'll burn it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That's my instinct, though I'd rather learn what they're doing first, because a dead spy tells us nothing. If you find one, bring me something to read before you finish them." } },
      choices = {
        { text = "I'll learn what I can before I strike.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every one of them dies the moment I see them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Demons, and the satyrs who worship them, and the bones of the Legion's march through these woods. I've watched warlocks go down into that canyon for their own reasons, and I've never asked what they found there, because I'd rather not know." },
      },
      choices = {
        { text = "Something should be done about them. I'll thin their numbers.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I go down there to learn. That's my own business.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Kayneth Stillwind, and Forest Song is my charge. The Forsaken have been seen in the woods to the east carrying strange diseases, and after the Legion's fel I have no wish to see this forest poisoned again." },
        { id = "h_cond", when = { race = "Human" }, text = "A human, this far east? You'll know better than most what the Forsaken's plagues did to Lordaeron, so you'll understand why I lose sleep over them." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You came through the trees without a sound, and my lookouts will hear about it in the morning. Out here a quiet traveller lives longer than a loud one, so I'm glad you're on our side." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "You're a mage this close to Felwood, and I hope your masters warned you what the demons left in that soil. Some nights it rises into the air, and it doesn't care whose lungs it fills." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Forest Song could use another sword, because I've Forsaken on one side and demons on the other." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Good, because the Forsaken in the eastern woods have been seen near the beasts, and I don't like what that means." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Good, because if the Forsaken are carrying their plague into these woods, I'll want someone who knows what it looks like." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Then you know the dead, and you'll know what it means that the Forsaken are walking these woods." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at Forest Song, and welcome. The Forsaken carry their sickness into the eastern woods and the demons foul the canyon, so I'll take every healer of the land the Circle can spare." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock at Forest Song, with Demon Fall Canyon just to the south of us. I'd sooner have you where I can see you than down there among the demons." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = { "Felguard", "Mannoroc", "Infernal" }, min = 30 } },
          text = "You've been down into Demon Fall Canyon, and by the count my lookouts keep, a good many demons didn't come back up with you. That's the best news Forest Song has had in a month." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I hold Forest Song with the Forsaken on one side and demons on the other, so perhaps your spirits might help me count arrows." },
      },
      again = {
        { id = "h_again1", text = "There's more you want to know, I can see it, so ask while the woods are quiet." },
        { id = "h_again2", text = "Ask, then. The watch changes soon." },
      },
      choices = {
        { text = "What are the Forsaken doing here?", next = "forsaken" },
        { text = "Something must lie east of Forest Song.", next = "east" },
        { text = "How do you keep the outpost supplied?", next = "post" },
        { text = "I saw what the plague did at home.", next = "lordaeron", when = { race = "Human" } },
        { text = "Could I get close to the Forsaken camps for you?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Could arcane magic cleanse the corruption in Felwood?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Forest Song must face many threats, Kayneth.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Have the Forsaken been poisoning Ashenvale's beasts?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The Forsaken plague must have reached here too, Kayneth.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the Forsaken here be destroyed on sight?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What has the Forsaken sickness done to the eastern woods?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Demon Fall Canyon sounds like an evil place, Kayneth.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Can Forest Song hold, Kayneth?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Keep the outpost safe.", next = "END" },
      },
    },
    forsaken = {
      lines = {
        { id = "forsaken_default", text = "They've set up camps in the woods and they brew things there, vials and powders that kill trees from the root up. I've asked travellers to bring me samples, so the druids can learn what it is." },
      },
      choices = {
        { text = "What will you do once you know?", next = "forsaken2" },
      },
    },
    forsaken2 = {
      lines = {
        { id = "forsaken2_default", text = "That depends on the Sentinels, and on the Horde, who claim the Forsaken are their allies now. Some of my people would burn every camp, and others want proof before we start a war nobody can stop." },
      },
      choices = {
        { text = "Burn the camps. Plague is plague, whoever carries it.", next = "BACK", fx = { align = { order = -1 }, trait = { stern = 1 } } },
        { text = "Get proof first. A war needs more than suspicion.", next = "BACK", fx = { align = { order = 1 }, trait = { patient = 1 } } },
      },
    },
    east = {
      lines = {
        { id = "east_default", text = "Felwood, where the demons' corruption sits in the soil, and Azshara beyond, which is mostly ghosts and naga. We guard the road so the rot stays on that side of the hills." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    post = {
      lines = {
        { id = "post_default", text = "Badly, and slowly, from Astranaar along a road the Warsong orcs love to watch. Raene Wolfrunner sends what she can spare, and I'm grateful for every crate of it." },
      },
      choices = {
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    lordaeron = {
      lines = {
        { id = "lordaeron_default", text = "Then I'm sorry, and I'm glad you're here, because you'll recognise the signs faster than any of us. If you see a grey mist in the trees, don't breathe it, and tell me where it was." },
      },
      choices = {
        { text = "I will. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a Sentinel officer, and Forest Song is the post nobody else wanted." } },
    _none = { { id = "tp_none", text = "I couldn't say, and out here, so close to Felwood, I've learned not to guess." } },
  },
}

P:NPC {
  key = "bhaldaran", id = TODO_NPC("Bhaldaran Ravenshade"), name = "Bhaldaran Ravenshade", title = "Bowyer",
  bible = "bibles/ashenvale.md", role = "vendor", tier = "service",
  communities = { "ashenvale_road" }, temper = { "dry" }, values = { "craft", "private" },
  impression = {
    first = "Bhaldaran Ravenshade sells bows from a quiet camp off the Ashenvale road, far from town by choice. He judges a customer by how they hold a bow before he listens to a word they say.",
    third = "{name} met Bhaldaran Ravenshade, a bowyer who keeps a camp off the road in Ashenvale.",
  },

  greetings = {
    { id = "g_default", text = "Show me how you hold a bow before you ask the price of one." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still holding that thing wrong, I see. Come in, then." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Every hunter of the forest does. Your spirits might guide you, but a good bow answers truer." } },
      choices = {
        { text = "Then I'll learn the bow properly, Bhaldaran.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My spirits are enough. Keep your bows.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only fallen wood, and only from trees the storms brought down, because I learned long ago that a bow cut from a living tree never sits right in the hand. The orcs cut living wood by the cartload, and it shows in everything they make." } },
      choices = {
        { text = "A good rule. The forest gives enough without cutting.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A bow's a bow. The wood doesn't care how it fell.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I'll make you one, but I'll make it heavy, because you'll treat it roughly and a light bow would snap. Learn to draw it smooth instead of yanking it, and it'll serve you longer than you'd think." } },
      choices = {
        { text = "I'll learn to draw it properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "As long as it shoots, I don't care how.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Nothing, if you mean to shoot a man across a tavern, which I suppose is what your sort do. A bow wants a long draw and patient wood, and a rogue wants to be gone before the arrow lands, so we've never got on." } },
      choices = {
        { text = "I'd rather face a man than shoot him from hiding.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Gone before it lands is the whole point.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because Astranaar's Sentinels stare at anyone who smells of the arcane, and I don't, since I've no opinion on it worth the breath. Sit by the fire if you like, but don't warm it with a spell, because my staves season badly near magic." } },
      choices = {
        { text = "I'll mind your staves and sit by the plain fire.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "One small spell won't hurt your precious staves.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not often, but the woods have been louder lately, and I'd not mind a prayer for the trees the Warsong cut down by the river. A bow can't put them back, and neither can I." } },
      choices = {
        { text = "I'll say a prayer for the fallen trees.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Trees don't need prayer. They need guarding.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because the walls are only as good as the people behind them, and the woods have kept me alive longer. I'll not hide behind someone else's hammer, though I'll thank you for swinging it." } },
      choices = {
        { text = "Then I'll swing it for anyone who needs it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everyone fights their own battles out here.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because the wood takes on whatever's near it while it dries, and I won't have a bow that smells of the Burning Legion. Laugh if you like, but a good bow knows things, and I've broken the ones that learned the wrong things over my knee." },
      },
      choices = {
        { text = "I'll keep it well away. Your craft deserves that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Wood is wood. You're superstitious, bowyer.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Bhaldaran, and I make bows, which is all most people need to know about me. I live out here because the wood's older and the company's quieter, and I prefer both." },
        { id = "h_cond", when = { class = "HUNTER" }, text = "A hunter, at last, someone who'll appreciate the grain. Have a look at the longbows, and don't let your pet chew on the racks." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You'll be a rogue, then, and rogues always want a bow short enough to hide under a cloak. I'll make you one if you insist, but it'll shoot like it's ashamed of itself." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "You're a mage, so you'll not need anything I make, I expect. Either you've come for the quiet or you've lost your way, and I can help with the second." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want a bow for pulling, I suppose, and you'll hold it like a club." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll not want a bow, I suppose, but you're welcome to rest your feet while I work." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll hold a bow like a hammer, I expect, but I'll sell you one if you ask nicely." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and by how lightly you walk I'd guess you don't think much of bows. That's fine, because I make mine from fallen wood only, and you can tell the Circle so." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock out here, of all places. You won't want a bow, and I'd thank you to keep that thing of yours away from my drying staves." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, eh? Show me how you hold a bow, because your spirits won't straighten a crooked grip, and the Sentinels never forgive one." },
      },
      again = {
        { id = "h_again1", text = "If there's something else, out with it, because those staves won't shape themselves." },
        { id = "h_again2", text = "Go on, then. My fingers are split from the string, so I'll take any excuse to rest them." },
      },
      choices = {
        { text = "Let me see your bows.", next = "BUSINESS" },
        { text = "A good bow must take some making.", next = "bows" },
        { text = "Isn't it lonely out here?", next = "alone" },
        { text = "I'd like the best longbow you have.", next = "hunter", when = { class = "HUNTER" } },
        { text = "What's wrong with a short bow, Bhaldaran?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why would a mage come out here for the quiet?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Will you make a bow for a warrior, Bhaldaran?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you ever wish for company out here, Bhaldaran?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why trust the woods over Astranaar's walls, Bhaldaran?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you really only use fallen wood for your bows?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why keep my servant away from your staves, Bhaldaran?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I'd have thought a shaman had no need of a bow, Bhaldaran.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    bows = {
      lines = {
        { id = "bows_default", text = "Patient wood and a patient maker, and Ashenvale has the first if not always the second. I let my staves season a full year, so if you want one sooner you'll have to buy someone else's." },
      },
      choices = {
        { text = "Right. Something else, then.", next = "BACK" },
      },
    },
    alone = {
      lines = {
        { id = "alone_default", text = "It's peaceful, which isn't the same thing, though people in Astranaar never seem to understand that. The orcs cut on the far side of the river and leave me be, mostly." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hunter = {
      lines = {
        { id = "hunter_default", text = "Then you'll pay for it, and you'll treat it better than you treat your boots. A bow remembers how it's handled, whatever the humans say." },
      },
      choices = {
        { text = "Understood.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a bowyer, and that's the long and short of it." } },
    _none = { { id = "tp_none", text = "Don't know, and I can't say I'm curious. After a few centuries you learn which questions are worth asking." } },
  },
}

P:NPC {
  key = "karang", id = TODO_NPC("Karang Amakkar"), name = "Karang Amakkar", title = "",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "zoramgar" }, temper = { "watchful" }, values = { "loyal", "practical" },
  impression = {
    first = "Karang Amakkar keeps Zoram'gar Outpost, a scrap of Horde camp on the Zoram Strand surrounded by elves and naga. He has the patience of an orc who has learned to wait for his chances.",
    third = "{name} met Karang Amakkar, who commands the Horde's Zoram'gar Outpost on the coast of Ashenvale.",
  },

  greetings = {
    { id = "g_default", text = "Lok'tar, stranger. You found Zoram'gar, which means the elves didn't find you first." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the strand. Good, I can use every blade I can get." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The kelp is dying and the fish are leaving, and the naga have been working at something in the bay that they don't want seen. An orc can guard a camp, but he can't read the water, so I'd hear what a druid makes of it." } },
      choices = {
        { text = "I'll study the water first, then strike the naga where it matters.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Why read the water? Kill the naga and the shore will settle.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Someone to keep the naga off the beach when they crawl up at night, and to remind the elves in the trees that we're still here. Blackfathom Deeps lies out in the bay as well, and one day we'll go in after whatever lives there." } },
      choices = {
        { text = "I'll hold the beach. Zoram'gar won't fall.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let the naga come. I'll take their heads as trophies.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Crabs and murlocs on the sand and wolves in the trees, but it's the Wrathtail naga who hunt us. Kill their scouts before they reach the camp, and bring me word of anything bigger moving in the water." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} smells the naga already; I can see its hackles up. Good, because a beast that knows its enemy is worth two warriors who don't." },
      },
      choices = {
        { text = "I'll hunt the naga scouts and bring you word.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll hunt what I like. The naga can wait.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = {
        { id = "xhcast_lock", when = { class = "WARLOCK" }, text = "If you can sense dark powers, tell me what gathers down in Blackfathom, because the elves whisper that cultists meet in those drowned halls. If it's a cult, the Warchief will want to know whose before the elves do." },
        { id = "xhcast_default", text = "Wards on the beach at night, and someone who can tell me what the naga sorceresses are calling up out of the bay. My grunts can kill what crawls ashore, but they can't kill what they don't understand." },
      },
      choices = {
        { text = "I'll ward your beach. Your grunts deserve to sleep.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Spells cost. I'll name my price before I cast anything.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Sentinels from the elves' posts up the coast, and they're patient about it, the way only elves can afford to be. I'd like to know how many there are and when they change their watch, though I won't ask you to cut throats to learn it." } },
      choices = {
        { text = "I'll count them and come back without a drop spilled.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If a throat's in the way, I'll cut it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Dead fish in heaps, storms out of a clear sky, and once a water elemental that walked up the beach and went back without a word. Something in Blackfathom Deeps is poisoning more than the naga, and I'd like to know what it is before it comes ashore as well." } },
      choices = {
        { text = "Hold the shore, Karang, and I'll find out what stirs below.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let the elves and the naga bleed each other. It's their bay.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_bfd = {
      big = true,
      lines = {
        { id = "xcl_bfd_default", text = "Then the Twilight's Hammer have lost whatever beast they were feeding in the dark, and the naga will have to choose between a new master and the open sea. I've sent warriors into that cave who never came back, so I'll remember your face, whatever else the Horde forgets." },
      },
      choices = {
        { text = "Remember your dead, Karang, not me. They went first.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Remember me well. I'll want that favour back someday.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "The naga must have wanted something down there.", next = "xcl_bfd2" },
      },
    },
    xcl_bfd2 = {
      lines = { { id = "xcl_bfd2_default", text = "I've asked the prisoners, when we take any, and they say only that their mistress serves something greater than herself. A naga who admits to having a master is a frightening thing, so I stopped asking and started building the walls higher." } },
      choices = {
        { text = "Higher walls sound wise. Strength to Zoram'gar.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_bfd", tags = { "news" }, when = { cleared = "Blackfathom Deeps", faction = "Horde" }, text = "The runners say you went down into Blackfathom and came back up with naga blood on your boots. Zoram'gar has bled for this strand a long time, so it's good to hear the Deeps finally lost a fight." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The water spirits along this shore have been uneasy since the naga came up out of the bay, and I'd value your ear on it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest who walks with the Horde. The naga leave our wounded bleeding in the surf, so whatever answers your prayers, Light or loa or shadow, I'll be glad of your hands here." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage, and a long way from any library. The naga have sorceresses of their own out on the strand, so I hope your fire burns hotter than their water." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. I remember what your craft did to my people, and I serve a Warchief who chose to let you live, so I'll keep faith with him and watch you all the same." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You move like someone who doesn't want to be counted, which suits me. The elves have eyes in every tree around this strand, and I'd like a few of my own." },
        { id = "h_default", text = "I am Karang, and this outpost is the Horde's foothold on the western shore. The naga crawl up from the water, the elves watch from the trees, and somewhere out in the bay lies Blackfathom Deeps, full of things worse than either." },
        { id = "h_cond", when = { race = "Orc" }, text = "An orc of the Horde, good. You'll know we didn't come to this coast to admire it, so let us speak plainly." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior of the Horde. Good, because this outpost holds by strength alone, and I need more of it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The Zoram Strand is full of things worth hunting, and some of them are naga." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. I've little use for talk of balance out here, but if you can tell me what is wrong with this shore, that I would use." },
      },
      again = {
        { id = "h_again1", text = "Say what else is on your mind, and say it before the tide turns." },
        { id = "h_again2", text = "Speak, I'm listening. Mind the naga bones by the fire pit; the grunt who swore he'd bury them has done nothing of the sort." },
      },
      choices = {
        { text = "What has the sea brought ashore since the naga came?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does Zoram'gar need from someone who works spells?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who watches Zoram'gar from the trees?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Why hold this strand at all?", next = "strand" },
        { text = "The naga must come from somewhere.", next = "naga" },
        { text = "You must send word to Splintertree now and then.", next = "splinter" },
        { text = "Then plainly: what do you need?", next = "orc", when = { race = "Orc" } },
        { text = "Blackfathom Deeps has lost, Karang. I've been to its bottom.", next = "xcl_bfd", when = { cleared = "Blackfathom Deeps", faction = "Horde" } },
        { text = "Strength to Zoram'gar.", next = "END" },
        { text = "What does Zoram'gar need from a warrior, Karang?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Something must hunt along the Zoram Strand, Karang.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What is wrong with the shore, Karang?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
      },
    },
    strand = {
      lines = {
        { id = "strand_default", text = "Because the Warchief needs wood and the Horde needs a road to the sea, and the elves would give us neither if they could help it. Every day we stay here, the forest learns we are not leaving." },
      },
      choices = {
        { text = "The elves see it as theft.", next = "strand2" },
      },
    },
    strand2 = {
      lines = {
        { id = "strand2_default", text = "They would, and perhaps they are not wrong, but my people need timber and they are not going to freeze for an elf's sake. Some say we should parley with the Sentinels, and some say the axe is the only word they hear." },
      },
      choices = {
        { text = "Talk first. The Horde needs peace more than wood.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The axe, then. They started this when they hunted us.", next = "BACK", fx = { align = { order = -1 }, trait = { fierce = 1 } } },
      },
    },
    naga = {
      lines = {
        { id = "naga_default", text = "From the deep water, and from Blackfathom, where they serve some mistress the elves are afraid to name. They are cold and clever, and they hate the elves even more than they hate us, which I find almost comforting." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    splinter = {
      lines = {
        { id = "splinter_default", text = "When a runner can get through, yes. Splintertree fights the Sentinels on the east road and we fight the naga here, and between us we keep the Horde's name alive in this forest." },
      },
      choices = {
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    orc = {
      lines = {
        { id = "orc_default", text = "Blades, supplies, and someone who can walk into the Deeps and walk out again. If you're that orc, I'll remember your name to the Warchief." },
      },
      choices = {
        { text = "I'll think on it.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I serve the Horde, and Zoram'gar is where it sent me." } },
    _none = { { id = "tp_none", text = "I don't know. Ask someone who stays indoors more; an orc's work is out here with the blade." } },
  },
}

P:NPC {
  key = "ruul", id = TODO_NPC("Ruul Snowhoof"), name = "Ruul Snowhoof", title = "",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "thistlefur" }, temper = { "gentle" }, values = { "kind", "brave" },
  impression = {
    first = "Ruul Snowhoof is a furbolg held captive by his own maddened tribe, the Thistlefur. He is the only one left among them with clear eyes, and it grieves him.",
    third = "{name} met Ruul Snowhoof, a Thistlefur furbolg kept captive by his own maddened kin in Ashenvale.",
  },

  greetings = {
    { id = "g_default", text = "You are not Thistlefur, and you have not come to hurt Ruul. That is good, that is very good." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back for Ruul. Few do that for a furbolg, and Ruul will not forget it." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Ruul does not know, only that it came with the darkness creeping down from the north, and the Thistlefur breathed it in until their eyes went red. Ruul would have them healed and not killed, but Ruul fears that is too much to ask." } },
      choices = {
        { text = "Then I'll spare them when I can, for your sake.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If they're too far gone, kindness means a quick end.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They will, because the Thistlefur no longer remember that they were friends of the forest. Ruul is sad to ask it, but if they come, you must fight them, and Ruul will try not to watch." } },
      choices = {
        { text = "I'll spare any I can, for your sake.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "They'll come, and they'll die. That's the way of it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They hunted only what the forest gave, and they thanked the trees afterward, as furbolgs always did. Now they kill in anger and leave the bodies, and Ruul cannot bear to watch it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is not afraid of Ruul, and that makes Ruul glad. Beasts know a furbolg who is still a friend of the forest." },
      },
      choices = {
        { text = "Then I'll hunt as the furbolgs once did.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Anger's as good a reason to hunt as any.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = {
        { id = "xhcast_lock", when = { class = "WARLOCK" }, text = "You would know the bad voice better than Ruul does, Ruul thinks. Ruul asks only that you do not listen to it as long as the Thistlefur did, because Ruul has seen where that ends." },
        { id = "xhcast_default", text = "Ruul has wondered that every night in this cage. The madness is not a wound, it is a voice, and Ruul does not know if a spell can make a voice go quiet, but Ruul would like someone to try before the Sentinels and the Horde kill them all." },
      },
      choices = {
        { text = "I'll look for a cure before anyone draws a blade.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A quick death is the only mercy left for them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "The chieftain keeps the cage key on a cord, and the stores are piled at the back of the den where the old ones used to sleep. Ruul does not like stealing from his own tribe, but Ruul likes this cage even less." } },
      choices = {
        { text = "I'll take only the key. Your tribe keeps the rest.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever they've hoarded is fair game now.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The Thistlefur shamans went mad first, because they listened hardest, and something that was not the forest answered them. Ruul thinks something dark crept into their dreams, and the forest spirits have been quiet ever since." } },
      choices = {
        { text = "Your tribe can still be healed, Ruul. I believe that.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The mad ones are lost. Save yourself, Ruul.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You are shaman. Ruul's grandmother was shaman of the Thistlefur before the madness, and she spoke to the forest the way you speak to the wind." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "You carry a prayer with you, Ruul can smell the candle smoke on your hands. Will you say one for the Thistlefur, even the mad ones? Ruul thinks they need it more than Ruul does." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "Your hands crackle like the air before a storm. Ruul does not know your kind of magic, but Ruul hopes very much that it can open a cage." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "Ruul smells something on you, the same bad smell that came into the forest before the madness. Ruul will not judge you for it yet, but Ruul will watch your hands." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You came so quietly that even the Thistlefur guards did not hear you, and they hear everything now. Ruul is glad you are a friend, or Ruul hopes you are." },
        { id = "h_default", text = "Ruul's tribe, the Thistlefur, have gone mad, and they keep Ruul in this cage because Ruul would not go mad with them. If you set Ruul free, Ruul will walk you to safety, though the way is long." },
        { id = "h_cond", when = { race = "Tauren" }, text = "Shu'halo, cousin of the forest! Ruul knew your people's drums once, from the old days, before the madness." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "You carry a blade, and you are not Thistlefur. Ruul hopes that blade is not for Ruul." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "You walk the way the forest walks, quiet and watchful. Ruul likes that." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! Ruul knows the smell of Cenarius's children, and Ruul's heart is glad, because perhaps you can see what has made the Thistlefur sick." },
      },
      again = {
        { id = "h_again1", text = "What else does the friend want to know?" },
        { id = "h_again2", text = "Ruul is listening, and Ruul is not going anywhere." },
      },
      choices = {
        { text = "What happened to your tribe's shamans when the madness came?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Can magic do anything for the Thistlefur?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Where do the Thistlefur keep their stores and their keys?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Something must have driven your tribe mad.", next = "madness" },
        { text = "You must have somewhere to go if you're freed.", next = "ruul" },
        { text = "Why trust the Horde?", next = "horde" },
        { text = "My people remember the furbolgs kindly.", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll come back for you, Ruul.", next = "END" },
        { text = "Will your tribe fight us when we leave, Ruul?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "The Thistlefur must have hunted well, before they went mad.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What made the Thistlefur turn, Ruul?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
      },
    },
    madness = {
      lines = {
        { id = "madness_default", text = "Something in the forest, or in the water, Ruul does not know which. The red-eyed ones say a voice in the ground speaks to them, and Ruul hears only the wind, which is how Ruul knows he is still Ruul." },
      },
      choices = {
        { text = "Can they be saved?", next = "madness2" },
      },
    },
    madness2 = {
      lines = {
        { id = "madness2_default", text = "Ruul hopes so, every night, but Ruul has seen them kill their own cubs. The Horde wants their land, and the elves want them gone, and nobody asks what the furbolgs want." },
      },
      choices = {
        { text = "They should be healed, not hunted.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "If they kill cubs, they're beyond saving.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    ruul = {
      lines = {
        { id = "ruul_default", text = "East, to the Timbermaw if they will have Ruul, for they are still themselves. Ruul has no tribe now, and a furbolg without a tribe is only half a furbolg." },
      },
      choices = {
        { text = "I hope they take you in.", next = "BACK" },
      },
    },
    horde = {
      lines = {
        { id = "horde_default", text = "Ruul trusts the one standing at the cage, not the banner behind them. You came to talk before you came to kill, and that is a thing Ruul notices." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "tauren_default", text = "Then the Earth Mother has not forgotten Ruul's people either. When you are home, tell the elders that one Thistlefur kept his mind." },
      },
      choices = {
        { text = "I will. Something else?", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Ruul is a Thistlefur, the last one with clear eyes." } },
    _none = { { id = "tp_none", text = "Ruul does not know that, friend. Ruul knows trees and cages, mostly." } },
  },
}
