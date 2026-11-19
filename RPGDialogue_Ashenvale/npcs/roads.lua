-- Ashenvale between the towns (0.38.0): Forest Song, a bowyer's roadside camp, Zoram'gar, and Ruul Snowhoof, a tauren druid caged at Thistlefur Hold. Voice: bibles/ashenvale.md
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "kayneth", id = TODO_NPC("Kayneth Stillwind"), name = "Kayneth Stillwind", title = "",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "forest_song" }, temper = { "tense" }, values = { "dutiful", "protective" },
  impression = {
    first = "He speaks like a man counting arrows.",
    third = "{name} met Kayneth Stillwind, who keeps watch at Forest Song in eastern Ashenvale.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Forest Song, {class}, the last kind word you'll hear before Felwood." },
    { id = "g_back", when = { metBefore = true }, text = "You're back in the east, then, and in one piece. The Forsaken's last messenger came back in several." },
  },

  notice = {
    { id = "n_lock_taint", cat = "lock_taint", when = { taint = { min = 30 } },
      text = "There is green in your eyes that was not there when you first came through Forest Song, or perhaps I never looked properly. You have been down where Felwood bleeds into this forest, I think, and it has followed you back." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "The Forsaken have dug in to the east, and the Horde lets them do as they please. You've met them, likely, so tell me what you make of the Forsaken." },
      },
      choices = {
        { text = "Corpses that walk. They should be put back in the ground.", next = "op_r1", fx = { align = { light = -1 }, trait = { stern = 1 }, opinion = { forsaken = "hate" } } },
        { text = "They were people once. Some still are, inside.", next = "op_r2", fx = { align = { light = 1 }, trait = { kind = 1 }, opinion = { forsaken = "pity" } } },
        { text = "Sylvanas is the danger. Watch her, not her soldiers.", next = "op_r3", fx = { affinity = 1, trait = { cautious = 1 }, opinion = { sylvanas = "distrust" } } },
        { text = "I am Forsaken, elf. Judge me by my deeds.", next = "op_r4", fx = { trait = { proud = 1 }, opinion = { forsaken = "proud" } }, when = { race = "Scourge" } },
        { text = "I'd rather not judge.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Many of the Sentinels would agree with you, and quickly. I only wish the Forsaken were the worst thing walking in the east." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Perhaps, though I've smelled what they brew in their camps, and pity is hard to hold onto with that in the air." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "A sharp eye. A banshee who leads the dead does not want peace, whatever she tells Thrall." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Then do your good deeds where my archers can see them, and you may find Forest Song fairer than you expect." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If we have enough arrows and enough hands. Your spirits are welcome on the walls." } },
      choices = {
        { text = "Then count me among your hands, Kayneth.", next = "BACK", reply = "Then I'll count you gladly, and the walls will hold a little longer. Elune bless your storms.", fx = { align = { order = 1 } } },
        { text = "Forest Song is lost. Retreat.", next = "BACK", reply = "Not while I can still draw a bow, it isn't. Go if you must, but Forest Song stands.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Less than I feared, so far, though the deer near their camps have begun to waste and the streams there smell wrong. I can count arrows and Forsaken, but I can't count what a sickness does under the soil, and that is why I need your kind." } },
      choices = {
        { text = "Heal the woods first. Vengeance on the Forsaken can wait.", next = "BACK", reply = "That's the Circle's view, and I'll not fight it. Heal what you can, and I'll watch the Forsaken.", fx = { align = { honor = 1 } } },
        { text = "Burn out the sick ground and their camps before it spreads.", next = "BACK", reply = "It may come to that, and I'll not stop you. But be very sure of what you're burning.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The satyrs of Satyrnaar would be my answer on most days, but the Forsaken and their diseases worry me more, because I don't know what they want. A blade will answer the satyrs, but against the Forsaken I need eyes before I need blades." } },
      choices = {
        { text = "Then I'll watch before I strike.", next = "BACK", reply = "Wise, and rarer than you'd think in a warrior. Watching has kept Forest Song alive.", fx = { align = { order = 1 } } },
        { text = "I'd strike the Forsaken before they strike us.", next = "BACK", reply = "That may be where this ends, but I'd like to know what we're fighting first. Bring me proof, at least.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I don't know yet, and that's the trouble, because sick beasts wander and I can't tell what they carry. If you find carcasses near their camps, look closely, and bring back what you can without touching it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I don't know yet, and that's the trouble, because sick beasts wander and I can't tell what they carry. Keep your {pet} away from anything dead in those woods, I beg you, and bring back what you can without touching it." },
      },
      choices = {
        { text = "I'll investigate carefully and report back.", next = "BACK", reply = "Thank you, hunter. Careful eyes are what I need most.", fx = { align = { order = 1 } } },
        { text = "I'll burn their camps and be done with it.", next = "BACK", reply = "That would be quick, I'll grant, but I'd still want to know what was in them. Bring me something first.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "You could, and you'd learn more in one night than my Sentinels have in a month, because the Forsaken know our footsteps by now. Bring me what they're brewing and who's brewing it, and don't touch anything with your bare hands." } },
      choices = {
        { text = "I'll bring you proof, and spill no blood doing it.", next = "BACK", reply = "Good. A quiet proof is worth more to me than a dozen dead Forsaken.", fx = { align = { honor = 1 } } },
        { text = "I'll bring proof, and leave their brewers dead in the mist.", next = "BACK", reply = "Then bring me the proof first and the rest after, if you must. I want to know what they're brewing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The druids would rather you didn't try, because the last ones who thought they could master Felwood's sickness were the Shadow Council at Jaedenar, and you can see what it made of them. Help me learn what the Forsaken are brewing, and leave the soil to those who can listen to it." } },
      choices = {
        { text = "I'll leave it to the druids, as you ask.", next = "BACK", reply = "Thank you, mage. Felwood is warning enough for any of us.", fx = { align = { order = 1 } } },
        { text = "If the druids can't cleanse it, someone else should try.", next = "BACK", reply = "Perhaps, but someone else tried once already, and look at Jaedenar. I'd ask you to be careful.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It has sickened some beasts, from what I hear, though we haven't yet learned what it does to the people who handle them. If you see the signs, burn what you can and pray, because I don't know what else to tell you." } },
      choices = {
        { text = "I'll pray, and watch for the signs everywhere.", next = "BACK", reply = "Thank you, and I'll do the same. Prayer and watchfulness both.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burning is surer than prayer. I'll burn it.", next = "BACK", reply = "Burn it, then, and pray after. Either way, don't touch it bare-handed.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That's my instinct, though I'd rather learn what they're doing first, because a dead spy tells us nothing. If you find one, bring me something to read before you finish them." } },
      choices = {
        { text = "I'll learn what I can before I strike.", next = "BACK", reply = "Thank you. A dead spy is a closed book, and I want to read it first.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every one of them dies the moment I see them.", next = "BACK", reply = "They'll be just as dead after I've read them, outsider. Bring me something, at least.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "It's full of demons, and the satyrs who worship them, and the bones of the Legion's march through these woods. I've watched warlocks go down into that canyon for their own reasons, and I've never asked what they found there, because I'd rather not know." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "It's full of demons, and the satyrs who worship them, and the bones of the Legion's march through these woods. Your demon is looking down the road toward it like a hound that smells home, and I've never asked what warlocks find in that canyon, because I'd rather not know." },
      },
      choices = {
        { text = "Something should be done about them. I'll thin their numbers.", next = "BACK", reply = "Then thin them, and gladly, and come back to tell me. The canyon has too many already.", fx = { align = { light = 1 } } },
        { text = "I go down there to learn. That's my own business.", next = "BACK", reply = "It is, warlock, but my Sentinels will watch you go down, and come up. Mind what you learn.", fx = { align = { light = -1 } } },
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
        { text = "What do you make of the Forsaken to the east?", next = "op_ask" },
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
        { text = "Burn the camps. Plague is plague, whoever carries it.", next = "BACK", reply = "Some of my people say the same, and I can't blame them. But the Horde would call it war.", fx = { align = { order = -1 }, trait = { stern = 1 } } },
        { text = "Get proof first. A war needs more than suspicion.", next = "BACK", reply = "That's my leaning, and I'll stand by it. A war started on suspicion has no end.", fx = { align = { order = 1 }, trait = { patient = 1 } } },
      },
    },
    east = {
      lines = {
        { id = "east_default", text = "Felwood lies that way, where the demons' corruption sits in the soil, and Azshara beyond, which is mostly ghosts and naga. We guard the road so the rot stays on that side of the hills." },
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
    background = { { id = "tp_bg", text = "I'm a druid who ended up commanding a post, and Forest Song is the post nobody else wanted." } },
    warsong = { { id = "tp_warsong", text = "Forest Song sits closest to the Warsong lumber camps of anything we hold. I hear their saws every morning, and I count the trees I can see from my post." } },
    thrall = { { id = "tp_thrall", text = "Thrall is far away in Orgrimmar, and his Warsong are right here. I deal with what's right here." } },
    burning_legion = { { id = "tp_burning_legion", text = "There's a demon taint at the edge of this forest, near Felwood. If the Legion sends anything through, Forest Song will see it first." } },
    centaur = { { id = "tp_centaur", text = "Not much centaur trouble this far east, which is the only luck this post has. I'll take it." } },
    _none = { { id = "tp_none", text = "I couldn't say, and out here, so close to Felwood, I've learned not to guess." } },
  },
}

P:NPC {
  key = "bhaldaran", id = TODO_NPC("Bhaldaran Ravenshade"), name = "Bhaldaran Ravenshade", title = "Bowyer",
  bible = "bibles/ashenvale.md", role = "vendor", tier = "service",
  communities = { "ashenvale_road" }, temper = { "dry" }, values = { "craft", "private" },
  impression = {
    first = "He judges how you hold a bow before he hears a word.",
    third = "{name} met Bhaldaran Ravenshade, a bowyer who keeps a camp off the road in Ashenvale.",
  },

  greetings = {
    { id = "g_default", text = "Show me how you hold a bow before you ask the price of one." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still holding that thing wrong, I see. Come in, then." },
  },

  notice = {
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "Stand back from the drying rack, if you would, because the yew has gone dark along the grain where your shadow fell. I'll have to split that stave for kindling now, and it was a good one." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Every hunter of the forest needs one, shaman or not. Your spirits might guide you, but a good bow answers truer." } },
      choices = {
        { text = "Then I'll learn the bow properly, Bhaldaran.", next = "BACK", reply = "Then you'll be the first shaman I've taught, and I'll make you a good one. Come back in a week.", fx = { align = { honor = 1 } } },
        { text = "My spirits are enough. Keep your bows.", next = "BACK", reply = "Fair enough, though spirits make poor arrows. Good luck to you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only fallen wood, and only from trees the storms brought down, because I learned long ago that a bow cut from a living tree never sits right in the hand. The orcs cut living wood by the cartload, and it shows in everything they make." } },
      choices = {
        { text = "A good rule. The forest gives enough without cutting.", next = "BACK", reply = "It is, and it's served me well. This stave came off a limb the storm dropped last spring, and it'll outshoot anything cut green.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A bow's a bow. The wood doesn't care how it fell.", next = "BACK", reply = "The wood cares, friend, whether you do or not. Try a living-cut bow and you'll see.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I'll make you one, but I'll make it heavy, because you'll treat it roughly and a light bow would snap. Learn to draw it smooth instead of yanking it, and it'll outlast a dozen of the bows you'd break." } },
      choices = {
        { text = "I'll learn to draw it properly.", next = "BACK", reply = "Good. A warrior who learns patience is a dangerous thing, and I'll make your bow accordingly.", fx = { align = { order = 1 } } },
        { text = "As long as it shoots, I don't care how.", next = "BACK", reply = "Then it'll snap in a season, and you'll be back. I'll be here.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Nothing, if you mean to shoot a man across a tavern, which I suppose is what your sort do. A bow wants a long draw and patient wood, and a rogue wants to be gone before the arrow lands, so we've never got on." } },
      choices = {
        { text = "I'd rather face a man than shoot him from hiding.", next = "BACK", reply = "Then you're not much of a rogue, and I like you better for it. I'll make you a proper bow.", fx = { align = { honor = 1 } } },
        { text = "Gone before it lands is the whole point.", next = "BACK", reply = "Then buy a crossbow from a dwarf, friend. My bows want patience.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because Astranaar's Sentinels stare at anyone who smells of the arcane, and I don't stare, since I've no opinion on it worth the breath. Sit by the fire if you like, but don't warm it with a spell, because my staves season badly near magic." } },
      choices = {
        { text = "I'll mind your staves and sit by the plain fire.", next = "BACK", reply = "Thank you. The staves are drying, and they're fussy about magic.", fx = { align = { order = 1 } } },
        { text = "One small spell won't hurt your precious staves.", next = "BACK", reply = "It will, friend, and I'll know. Sit by the plain fire, please.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not often, but the woods have been louder lately, and I'd not mind a prayer for the trees the Warsong cut down by the river. A bow can't put them back, and neither can I." } },
      choices = {
        { text = "I'll say a prayer for the fallen trees.", next = "BACK", reply = "Thank you, priest. I'll say one too, quietly, in my own way.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Trees don't need prayer. They need guarding.", next = "BACK", reply = "They need both, and I'll do the guarding. But a prayer couldn't hurt.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because the walls are only as good as the people behind them, and the woods have kept me alive longer. I'll not hide behind someone else's hammer, though I'll thank you for swinging it." } },
      choices = {
        { text = "Then I'll swing it for anyone who needs it.", next = "BACK", reply = "Then the woods are lucky to have you, and so am I. Thank you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everyone fights their own battles out here.", next = "BACK", reply = "They do, and I prefer it that way. I'll watch my own back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because the wood takes on whatever's near it while it dries, and I won't have a bow that smells of the Burning Legion. Laugh if you like, but a good bow knows things, and I've broken the ones that learned the wrong things over my knee." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because the wood takes on whatever's near it while it dries, and your servant is standing right beside my drying rack. If one stave of mine comes away smelling of the Burning Legion, I'll break it over my knee and send you the bill, so walk it downwind." },
      },
      choices = {
        { text = "I'll keep it well away. Your craft deserves that.", next = "BACK", reply = "Thank you. You'll get a better bow for it, I promise you.", fx = { align = { honor = 1 } } },
        { text = "Wood is wood. You're superstitious, bowyer.", next = "BACK", reply = "Superstitious, yes, and alive. I'll keep my staves away from your servant.", fx = { align = { honor = -1 } } },
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
    centaur = { { id = "tp_centaur", text = "Centaur horn bows are strong, I've heard, though I've never held one. I'd like to, and I'd like the centaur not to be attached to it." } },
    warsong = { { id = "tp_warsong", text = "Orc bows are crude and heavy, and their archers aren't much better. My bows keep the Sentinels ahead of them, and that's what matters." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw make a fine short bow, rough but true. I traded for one once, and I still think about it." } },
    _none = { { id = "tp_none", text = "Don't know, and I can't say I'm curious. After a few centuries you learn which questions are worth asking." } },
  },
}

P:NPC {
  key = "karang", id = TODO_NPC("Karang Amakkar"), name = "Karang Amakkar", title = "",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "zoramgar" }, temper = { "watchful" }, values = { "loyal", "practical" },
  impression = {
    first = "He has learned to wait for his chances.",
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
        { text = "I'll study the water first, then strike the naga where it matters.", next = "BACK", reply = "Good, and the shaman will be glad of you. Know the water, then strike.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Why read the water? Kill the naga and the shore will settle.", next = "BACK", reply = "Maybe it would, and I'd be glad of the heads. But I'd like to know what they're doing first.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Someone to keep the naga off the beach when they crawl up at night, and to remind the elves in the trees that we're still here. Blackfathom Deeps lies out in the bay as well, and one day we'll go in after whatever lives there." } },
      choices = {
        { text = "I'll hold the beach. Zoram'gar won't fall.", next = "BACK", reply = "Good. Lok'tar, and the beach will hold.", fx = { align = { honor = 1 } } },
        { text = "Let the naga come. I'll take their heads as trophies.", next = "BACK", reply = "Take them, and gladly, but bring me word of what they're doing. Trophies don't tell me much.", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Crabs and murlocs on the sand and wolves in the trees, but it's the Wrathtail naga who hunt us. Kill their scouts before they reach the camp, and bring me word of anything bigger moving in the water." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Crabs and murlocs on the sand and wolves in the trees, but it's the Wrathtail naga who hunt us. Your {pet} smells them already, I can see its hackles up, and a beast that knows its enemy is worth two warriors who don't." },
      },
      choices = {
        { text = "I'll hunt the naga scouts and bring you word.", next = "BACK", reply = "Good. Bring me their numbers and which way they swim, and I'll pass it to the shaman.", fx = { align = { order = 1 } } },
        { text = "I'll hunt what I like. The naga can wait.", next = "BACK", reply = "Then hunt it, and come back when you've finished. The naga will still be there.", fx = { align = { order = -1 } } },
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
        { text = "I'll ward your beach. Your grunts deserve to sleep.", next = "BACK", reply = "Thank you. My grunts will be glad of it, and so will I.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Spells cost. I'll name my price before I cast anything.", next = "BACK", reply = "Name it, then, and I'll see what I can manage. Zoram'gar isn't rich.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Sentinels from the elves' posts up the coast, and they're patient about it, the way only elves can afford to be. I'd like to know how many there are and when they change their watch, though I won't ask you to cut throats to learn it." } },
      choices = {
        { text = "I'll count them and come back without a drop spilled.", next = "BACK", reply = "Good. Numbers and silence are worth more than blood out here.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If a throat's in the way, I'll cut it.", next = "BACK", reply = "Do what you must, but bring me the numbers first. Dead Sentinels make for angrier elves.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Dead fish in heaps, storms out of a clear sky, and once a water elemental that walked up the beach and went back without a word. Something in Blackfathom Deeps is poisoning more than the naga, and I'd like to know what it is before it comes ashore as well." } },
      choices = {
        { text = "Hold the shore, Karang, and I'll find out what stirs below.", next = "BACK", reply = "Good, shaman. I'll hold the shore as long as I'm breathing.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let the elves and the naga bleed each other. It's their bay.", next = "BACK", reply = "Maybe it is their bay, but the poison doesn't care whose water it is. I'll hold the shore anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_bfd = {
      big = true,
      lines = {
        { id = "xcl_bfd_default", text = "Then the Twilight's Hammer have lost whatever beast they were feeding in the dark, and the naga will have to choose between a new master and the open sea. I've sent warriors into that cave who never came back, so I'll remember your face, whatever else the Horde forgets." },
      },
      choices = {
        { text = "Remember your dead, Karang, not me. They went first.", next = "BACK", reply = "I do, every night, and I'll remember you with them. Lok'tar.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Remember me well. I'll want that favour back someday.", next = "BACK", reply = "You'll have it, if I'm still standing. Zoram'gar remembers.", fx = { align = { honor = -1 } } },
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
        { text = "Talk first. The Horde needs peace more than wood.", next = "BACK", reply = "Some say so, and I'd not argue. But the Warchief decides, and I hold the shore.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The axe, then. They started this when they hunted us.", next = "BACK", reply = "Maybe they did, and maybe we did, and nobody remembers which. The axe it is, then.", fx = { align = { order = -1 }, trait = { fierce = 1 } } },
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
    thrall = {
      { id = "tp_thrall", text = "Thrall freed my people from the camps and gave us a homeland, and I'd follow him anywhere. He sent me here, so here I am." },
      { id = "tp_thrall2", when = { faction = "Alliance" }, text = "You serve the Alliance and you ask about my warchief? He freed his people, and that's all you need to know of him." },
    },
    tyrande = { { id = "tp_tyrande", text = "She's the elves' high priestess, the one who sends her Sentinels against our camps. She's a fierce enemy, and I'll not say otherwise." } },
    blackfathom = { { id = "tp_blackfathom", text = "Blackfathom's down the coast from Zoram'gar, and the nagas and cultists there trouble us as much as anything. They don't care whose side we're on." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin's trolls are good allies, and many serve at Zoram'gar. They've a long memory and a sharp spear." } },
    _none = { { id = "tp_none", text = "I don't know. Ask someone who stays indoors more; an orc's work is out here with the blade." } },
  },
}

P:NPC {
  key = "ruul", id = TODO_NPC("Ruul Snowhoof"), name = "Ruul Snowhoof", title = "",
  bible = "bibles/ashenvale.md", role = "questgiver", tier = "quest",
  communities = { "splintertree" }, temper = { "gentle", "calm" }, values = { "kind", "family" },
  impression = {
    first = "He speaks of the furbolgs who starved him without any anger.",
    third = "{name} met Ruul Snowhoof, Yama's brother, a tauren druid held captive by the Thistlefur furbolgs in Ashenvale.",
  },

  greetings = {
    { id = "g_default", text = "Peace, stranger. You are not Thistlefur, and you have not come with a club, so the Earth Mother has sent me better company than I have had in many days." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to this cage. I hoped you would, though I tried not to count on it." },
    { id = "g_active", when = { questActive = TODO_QUEST("Freedom to Ruul") }, text = "When you are ready, open the door and walk beside me. I am slow now, and the Thistlefur will not let me go quietly." },
    { id = "g_done", when = { questDone = TODO_QUEST("Freedom to Ruul") }, text = "You walked me out of the dark once already. My sister will have fed you twice over by now, if I know her." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A sickness that comes down from Felwood, carried in the roots and the water. The Thistlefur drank it before they knew it was there. I would see them healed and not killed, though I know that may be too much to ask of this forest." } },
      choices = {
        { text = "Then I'll spare them when I can, for your sake.", next = "BACK", reply = "Thank you. Every one you spare is one the Earth Mother may yet call back to herself.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If they're too far gone, kindness means a quick end.", next = "BACK", reply = "Perhaps you are right, and it grieves me. If it must be done, then do it cleanly.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They will, because they think you are stealing their bear. They are not wicked, only sick and frightened. If they come at us, you must fight them, and I will not hold that against you." } },
      choices = {
        { text = "I'll spare any I can, for your sake.", next = "BACK", reply = "Then you fight the way my father taught me to. The herd remembers that kind of warrior.", fx = { align = { honor = 1 } } },
        { text = "They'll come, and they'll die. That's the way of it.", next = "BACK", reply = "That is the way of it, as you say. I will still ask the Earth Mother to receive them.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Once they hunted only what they needed and thanked the trees afterward, as my own people thank the plains. Now they kill in anger and leave the bodies to rot, and that tells me how sick they are." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Once they hunted only what they needed and thanked the trees afterward, as my own people thank the plains. Now they kill in anger and leave the bodies to rot, but your {pet} sits easy near this cage, and that comforts me." },
      },
      choices = {
        { text = "Then I'll hunt as they once did, with thanks.", next = "BACK", reply = "Good. The Earth Mother gives to those who remember to thank her.", fx = { align = { light = 1 } } },
        { text = "Anger's as good a reason to hunt as any.", next = "BACK", reply = "I hope you learn otherwise. Anger is the door the sickness walked through.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = {
        { id = "xhcast_lock", when = { class = "WARLOCK" }, text = "You would know the taint better than I do, I think, because it smells of the same fire you carry. I ask only that you do not listen to it as long as the Thistlefur did, because I have seen where that ends." },
        { id = "xhcast_default", text = "I have wondered that every night in this cage. The sickness is not a wound you can close; it lives in the land and in the mind together. I do not know if a spell can quiet it, but I would like someone to try before the Sentinels and the Horde kill them all." },
      },
      choices = {
        { text = "I'll look for a cure before anyone draws a blade.", next = "BACK", reply = "Thank you. There may not be one, but I am glad someone will look.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A quick death is the only mercy left for them.", next = "BACK", reply = "It may be so, and it weighs on me. If you must, make it quick.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Their chieftain keeps the cage key on a cord, and their stores are piled at the back of the hold. I would not have you rob them on my account, but I confess I would like to leave this cage." } },
      choices = {
        { text = "I'll take only the key. They keep the rest.", next = "BACK", reply = "Thank you. They will need those stores, if they ever wake from this.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever they've hoarded is fair game now.", next = "BACK", reply = "I will not argue with you here. Only take what you need, and no more.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The spirits here are quiet, and the earth beneath this hold feels bruised. The Thistlefur shamans listened hardest, so I think they fell first, when something that was not the forest answered them." } },
      choices = {
        { text = "The Thistlefur can still be healed. I believe that.", next = "BACK", reply = "So do I, most days. It is good to hear another voice say it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The mad ones are lost. Think of yourself, Ruul.", next = "BACK", reply = "I am thinking of myself, friend. I would not want to be left to the sickness either.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You walk with the spirits. Then you can feel how quiet they have gone in this place, and how wrong the earth sounds under the hold." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "You carry prayers with you, I think. Will you say one for the Thistlefur, even the ones who caged me? They need it more than I do." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "Your hands crackle like the air before a storm on the plains. I do not know your kind of magic, but I hope very much that it can open a cage." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "There is a smell on you like the one that came south into this forest before the furbolgs turned. I will not judge you for it yet, but I will watch your hands." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You came so quietly that even the guards did not hear you, and they hear everything now. I hope you are a friend, because I am in no shape to argue." },
        { id = "h_done", when = { questDone = TODO_QUEST("Freedom to Ruul") }, text = "I am Ruul Snowhoof, and I owe you my life. I came back to the edge of this place to listen to it again, because the Thistlefur are still sick, and someone should still care." },
        { id = "h_default", text = "I am Ruul Snowhoof, a druid of the tauren. I came into this forest in the bear's shape to listen to its sickness, and the Thistlefur caught me and took me for a bear. They have been starving me since. If you open this cage, walk with me, because I am weak and they will follow." },
        { id = "h_cond", when = { race = "Tauren" }, text = "One of the herd, here of all places! The Earth Mother has a gentle sense of humor. Did my sister Yama send you?" },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "You carry a blade, and you are not Thistlefur. I hope that blade is for the way out and not for me." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "You walk the way the beasts walk, quiet and watchful. I can rest a little easier with you here." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A child of Cenarius, like me. Then you have felt it too, the sickness under the roots, and perhaps you can see what has made the Thistlefur this way." },
      },
      again = {
        { id = "h_again1", text = "Ask what you like, friend. I have had no one to talk to but the bars." },
        { id = "h_again2", text = "I am listening. I am not going anywhere, not yet." },
      },
      choices = {
        { text = "What do the spirits tell you about this place?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Can magic do anything for the Thistlefur?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Where do the Thistlefur keep their stores and their keys?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "What drove the Thistlefur mad?", next = "madness" },
        { text = "Where will you go if you're freed?", next = "ruul" },
        { text = "Why did they take you for a bear?", next = "horde" },
        { text = "Yama is waiting for you at Splintertree.", next = "tauren", when = { faction = "Horde" } },
        { text = "I'll come back for you, Ruul.", next = "END" },
        { text = "Will the Thistlefur fight us when we leave?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "The Thistlefur must have hunted well, before this.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What made the Thistlefur turn, Ruul?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
      },
    },
    madness = {
      lines = {
        { id = "madness_default", text = "A sickness from the north, from Felwood, where the trees are dying and the water runs foul. It creeps south through the roots a little more each season. The Thistlefur live closest to its path, and they breathed it in before anyone thought to warn them." },
      },
      choices = {
        { text = "Can they be saved?", next = "madness2" },
      },
    },
    madness2 = {
      lines = {
        { id = "madness2_default", text = "I hope so. Furbolgs were wise once, and friends to my people's druids, and the Timbermaw in the north still are. But the Horde wants this forest's wood, and the elves want the furbolgs gone, and no one asks what the forest wants." },
      },
      choices = {
        { text = "They should be healed, not hunted.", next = "BACK", reply = "That is what I believe as well. It is good to hear it from someone outside a cage.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "If they kill on sight, they're beyond saving.", next = "BACK", reply = "I cannot argue with what you have seen. Still, I will keep hoping, slowly.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    ruul = {
      lines = {
        { id = "ruul_default", text = "Home to Splintertree, to my sister Yama, who will scold me and then feed me, in that order. When I have my strength back, I will keep listening to this forest. The herd's way is long, and one cage does not end it." },
      },
      choices = {
        { text = "I hope she feeds you first.", next = "BACK" },
      },
    },
    horde = {
      lines = {
        { id = "horde_default", text = "Because I wore the bear's shape when they found me, and I was too tired to change back. I did not fight them, and I think that confused them. Do not blame them too much for it; sick minds see what they fear." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "tauren_default", text = "Then my sister is still waiting, as she always waits for me. Get me out of here, and I will walk as fast as these old legs allow. She will want to thank you herself." },
      },
      choices = {
        { text = "Then let's get you home. Something else first?", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am a tauren druid, Yama's brother. I came to Ashenvale to listen to the forest's sickness, and the Thistlefur caged me for a bear." } },
    yama = { { id = "tp_yama", text = "My sister Yama keeps house for me at Splintertree Post. She worries more than she lets anyone see, and I give her too many reasons." } },
    thistlefur = { { id = "tp_thistlefur", text = "They starved me and they caged me, and still I do not blame them. The sickness took their minds before it took anything else." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw in the north have kept their minds, I am told. If the Thistlefur can be healed, perhaps their cousins will show us how." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "Cenarius taught our druids to walk the Dream, and its green should be strong here. In this hold I have not dreamed green once." } },
    burning_legion = { { id = "tp_burning_legion", text = "The sickness in Felwood smells of old fire, from a war long before my people came to this forest. I do not know its whole story, but I know it is evil." } },
    _none = { { id = "tp_none", text = "I do not know that, friend. I know the forest, the plains, and lately this cage." } },
  },
}
