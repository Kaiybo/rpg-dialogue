-- Freewind Post's and the Mirage Raceway's quiet hands (0.39.0): the wind rider master, the stable master,
-- and the gnome who sells engineering supplies at the raceway. Voice: bibles/thousandneedles.md ("Quiet hands")
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "nyse", id = TODO_NPC("Nyse"), name = "Nyse", title = "Wind Rider Master",
  bible = "bibles/thousandneedles.md", role = "flightmaster", tier = "service",
  communities = { "freewind" }, temper = { "calm" }, values = { "dutiful", "nature" },
  notices = { "race" },

  impression = {
    first = "She talks about the mesas as if they were old friends.",
    third = "{name} met Nyse, the tauren wind rider master at Freewind Post.",
  },

  greetings = {
    { id = "o_cent_war", when = { gossip = { topic = "centaur", stance = "war" } }, text = "I hear you've no mercy left for the Galak. From up here you can see their fires every night, so I can't say I blame you." },
    { id = "g_default", text = "The wind is good today, and the riders are eager to be off the mesa. Where are you bound?" },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "My wind riders don't carry the Alliance, stranger. You'll have to find your way down the lift and out of the canyons on foot." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Welcome, child of the Earth Mother. You can feel it up here, can't you? The wind off the needles is the closest thing to flying without wings." },
  },

  start = "hello",
  nodes = {
    dd_falling = {
      lines = {
        { id = "dd_fa_default", text = "They are, and the wind makes them worse, pushing at your back when you least expect it. Our people have lived on these heights for a long time, and even we lose someone to the canyon every few seasons. Were you trying to take a shortcut, or did the wind take you?" },
      },
      choices = {
        { text = "A shortcut. The lifts are too slow.", next = "BACK", reply = "Then you're like every young brave who thinks the canyon is a friend. It isn't, so next time, take the lift, or take a wind rider.", fx = { align = { order = -1 } } },
        { text = "The wind. I'll respect it more now.", next = "BACK", reply = "Good, because the wind deserves respect, and it rewards those who give it. May the Earth Mother catch you next time, if you fall again.", fx = { align = { order = 1 } } },
        { text = "Something else, Nyse.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They smell death and they see the Light, and they can't decide which to trust. They'll fly you all the same, because the mesas have taught them that strange things often turn out to be friends." } },
      choices = {
        { text = "They'll fly because they're bid to, same as the rest of us.", next = "BACK", reply = "They fly when bid, yes, but a wind rider bid against its heart flies badly, and I would not want you aboard that flight.", fx = { align = { order = 1 } } },
        { text = "Let them decide in their own time. I'll wait.", next = "BACK", reply = "Then they will come to you, as the rain comes to dry grass, slowly and then all at once.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They did in the wars on this continent, so the orcs tell me, and they would again if the Warchief asked it. But a wind rider sent into battle is one I may not get back, and I want them carrying soldiers home, not carrying them off to die." } },
      choices = {
        { text = "If the Warchief calls, they fly. That's duty.", next = "BACK", reply = "If Thrall calls, they will fly, and I will send them, but I will grieve every empty roost when they do not return.", fx = { align = { order = 1 } } },
        { text = "Keep them home. No order is worth a wind rider.", next = "BACK", reply = "My heart says the same, but I owe the Horde too much to keep them from it forever, so I will pray the call never comes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Many have, and most came away with bites to show for it, because a wind rider chooses its rider or chooses no one. The young ones from Highperch are the wildest, and I wouldn't let anyone near them without me standing beside them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Many have tried, and {pet} looks as if it would like to try too, the way it eyes the roost. Keep it on the ground, friend, because my riders have sharp tails and short tempers." },
      },
      choices = {
        { text = "A wild creature should choose its rider freely.", next = "BACK", reply = "You speak as a tauren speaks, and the young ones of Highperch would like you for it, if they ever let you close.", fx = { align = { light = 1 } } },
        { text = "Any beast can be tamed, with enough patience and will.", next = "BACK", reply = "Perhaps, but I have the scars of the ones who disagreed, and I would show you, if you have the stomach for it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Over the Galak, often, and over the Grimtotem when Cliffwatcher asks it. A rider who doesn't frighten the beast can see everything from up high, and the mesas hide no secrets from the sky." } },
      choices = {
        { text = "The skies belong to the Horde. Watch everything.", next = "BACK", reply = "The sky sees everything, that is true, and Longhorn is glad of it, though I would rather my riders were looking at sunsets.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Spying from the sky is cowardly.", next = "BACK", reply = "It is not courage or cowardice, only seeing, and the Galak would do the same to us if they had wings.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not at all, because teleporting is a fine trick, but you miss the view. Flying over the Needles at sunset is something no spell can give you, and I'd say that's worth the fare by itself." } },
      choices = {
        { text = "The journey matters as much as arriving.", next = "BACK", reply = "Then you will love flying, and I will see you in the saddle at sunset, when the mesas turn red.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I just need to get there fast.", next = "BACK", reply = "Then my riders will get you there fast, but I hope you will look down once, because the Needles are worth seeing.", fx = { align = { order = 1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not the ones who know you, and most of mine have carried druids since they were young. It's when someone shifts into a bear on the landing platform that they get skittish, so please wait until you're down off the mesa." } },
      choices = {
        { text = "Respect the wind riders. They carry us freely.", next = "BACK", reply = "They do, and they know who respects them. Old Greycrest still nuzzles the brave who brought her a fish after a storm, and that was four summers ago.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're beasts of burden. They'll carry what they're told.", next = "BACK", reply = "Tell them that, and see how far they carry you before they set you down on the salt flats to walk home.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_falling", when = { deathCause = "falling" },
          text = "You've stepped off the edge of a mesa recently, I can see it in your face. The Needles are tall and the canyon floor is hard, and my wind riders are much gentler than the ground, if you'll let them carry you down." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. My wind riders will carry you, but they don't love the weight of armor, so sit still and don't fight them in the air." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. Wind riders are beasts too, though they don't take kindly to taming, and they've never once let a hunter forget it." },
        { id = "h_default", key = true,
          text = "I am Nyse, and I keep the wind riders of Freewind Post. From the top of this mesa they'll carry you to Thunder Bluff, to the Crossroads, or south over the salt flats to Gadgetzan." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The wind riders always fly smoother with one of you aboard, and I've stopped asking why." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. If you'd like to say a prayer before your flight, the top of the mesa is a fine place for it, and I won't tell anyone." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "The wind riders are shying already; they smell something on you. Let me calm them first, and keep whatever walks with you well back from the roost." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You'd make a good rider, quiet as you are. The wind riders don't like noise, and they don't like sudden moves, and you seem to know both." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage! You could teleport to Orgrimmar or Undercity, but you'll still need my wind riders to reach anywhere out here, because no mage I know has a spell for the Needles." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID", faction = "Horde" }, text = "A tauren druid! The wind riders know your scent from Thunder Bluff, and they fly calmer for it, I've always found." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin at the top of my mesa. The riders don't know what to make of you, so stand still and let them look." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The wind is changing, and the riders feel it in their wings before I do." },
        { id = "h_again2", text = "Speak, friend. The riders can wait a little longer; they're sunning themselves anyway." },
      },
      choices = {
        { text = "I fell off a mesa, Nyse. The edges are treacherous.", next = "dd_falling", when = { deathCause = "falling" } },
        { text = "Do the wind riders mind carrying a druid?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do the air spirits watch over the wind riders, Nyse?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Spellcasters seem to make the wind riders uneasy.", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "Why build a post on top of a mesa?", next = "mesa" },
        { text = "Is it hard flying between the needles?", next = "flying" },
        { text = "Wind riders must carry scouts over enemy ground.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do you resent mages for teleporting, Nyse?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do wind riders ever carry warriors into battle, Nyse?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "I'd guess hunters have tried to tame a wind rider, Nyse.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do the riders make of a Forsaken paladin, Nyse?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    mesa = {
      lines = { { id = "m_default", text = "Because the centaur can't climb it, and the Galak have hated our people for as long as anyone remembers. Up here, with the lifts drawn and the bridges watched, we can sleep at night." } },
      choices = {
        { text = "Can there ever be peace with the centaur?", next = "mesa_centaur" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mesa_centaur = {
      lines = { { id = "mc_default", text = "I don't know. Cliffwatcher Longhorn doesn't think so, and he's buried more of our people than I have, but I'd like to think the Earth Mother wants something better for us all." } },
      choices = {
        { text = "Peace is worth hoping for.", next = "BACK", reply = "Then we hope together, and perhaps the Earth Mother hears two voices louder than one.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The centaur only understand the spear.", next = "BACK", reply = "Longhorn says the same, and he has earned the right to say it, but I will keep hoping all the same.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    flying = {
      lines = { { id = "f_default", text = "Only if you fight the wind. The riders know how the air moves around the needles, and they ride the gusts like a river, so sit still, let them work, and try not to lose your breakfast over Freewind." } },
      choices = {
        { text = "Do the harpies ever bother them?", next = "flying_harpy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flying_harpy = {
      lines = { { id = "fh_default", text = "They screech and they follow, but they don't dare come close to a wind rider. The riders would tear them out of the sky, and the harpies know it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Some do, because they smell the magic on you the way they smell a storm coming. I talk to them before you climb on, and so far no one has been dropped over the salt flats, which is how I like it." } },
      choices = {
        { text = "I'll wait until they're calm. They know best.", next = "BACK", reply = "Then they will love you for it, and you will fly smoother than any who come rushing up the ramp.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They'll get used to me. I won't be waiting.", next = "BACK", reply = "They will, eventually, but you may find the first few flights a little bumpier than you would like.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I think they do, because I've never lost a rider over the salt flats, and the gusts up here could knock a kodo off its feet. I leave a little offering at the roost every morning, and I don't tell the riders, in case it stops working." } },
      choices = {
        { text = "Keep the offerings. The old ways look after us.", next = "BACK", reply = "They do, and my riders come home, so I will keep leaving them until I am too old to climb the roost.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your riders' skill keeps them aloft, not offerings.", next = "BACK", reply = "Skill keeps them aloft, yes, and the offerings keep the wind kind, so I see no reason to stop either.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I've kept wind riders on these mesas for many seasons. That's my life, and I'm content with it." } },
    advice = { { id = "tp_ad", text = "Stay off the canyon floor at night, friend. That's when the centaur ride, and they ride without torches." } },
    cairne = { { id = "tp_cairne", text = "Cairne flew from here once, and he said the drop made his stomach turn. I've never heard a chieftain admit that before, and I liked him better for it." } },
    centaur = { { id = "tp_centaur", text = "The Galak shoot at my riders when they fly low, but they never hit. A wind rider climbs faster than any centaur can aim." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "The flight to Gadgetzan is long and hot, and my riders hate it. I send them anyway, because the goblins pay well." } },
    _none = { { id = "tp_none", text = "I don't know, friend. The wind carries many things past this mesa, but not that, and the Earth Mother keeps what the wind doesn't." } },
  },
}

P:NPC {
  key = "awenasa", id = TODO_NPC("Awenasa"), name = "Awenasa", title = "Stable Master",
  bible = "bibles/thousandneedles.md", role = "stablemaster", tier = "service",
  communities = { "freewind" }, temper = { "warm" }, values = { "kind", "nature" },
  notices = { "pet", "lock_shadow" },

  impression = {
    first = "She seems to know every hunter by their pet's name.",
    third = "{name} met Awenasa, the tauren stable master at Freewind Post.",
  },

  greetings = {
    { id = "g_default", text = "Welcome, friend. The beasts are calm today, which means the wind is kind. Have you brought me someone to look after?" },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Oh, your {pet} has climbed a long way to get up here. Let it rest by the water a moment, the climb is hard on four legs." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "My kodos turned their backs to you all at once, the way they do before a storm comes over the mesa. They'll calm in a moment, I think, but I'd stand downwind of them if I were you." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Some do, and some only fear what they don't know. I speak to them gently, as I speak to everyone, and I think if you stood here long enough, they'd learn you the way they learn every hunter's voice." } },
      choices = {
        { text = "Gentleness wins more than fear. I'll be patient.", next = "BACK", reply = "Patience is a good thing, and the beasts will see it in you long before you see it in them.", fx = { align = { light = 1 } } },
        { text = "Fear keeps a beast in line. Let them fear me.", next = "BACK", reply = "Fear keeps a beast in line until the day it doesn't, and then you will find out how a kodo answers.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not the good ones, because a warrior at peace with their strength moves gently, and the animals feel it. It's the angry ones they shy from, and I've seen a kodo back itself into a corner rather than stand near someone carrying a grudge." } },
      choices = {
        { text = "Strength should be calm. I keep my anger leashed.", next = "BACK", reply = "Then the beasts will know you, and you will find even the shyest kodo comes to your hand.", fx = { align = { order = 1 } } },
        { text = "Anger is a warrior's fire. The beasts will learn.", next = "BACK", reply = "They will learn to fear it, and a frightened beast is the most dangerous thing on this mesa.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Most are, though the cats pace at night when the Galak drums start below. I sit with them until it stops, which is not a stable master's work, but what else can I do?" } },
      choices = {
        { text = "That's kindness, and kindness is never wasted.", next = "BACK", reply = "Thank you. The little one in the far stall jumps at every drumbeat, and she has only just started letting me hold her head while they play.", fx = { align = { light = 1 } } },
        { text = "Leave them be. They'll get used to the drums.", next = "BACK", reply = "They may, in time, but I would rather they learned with a friend nearby than alone in the dark.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "That's a mercy for both of us, I think. The animals here are gentle, and they've done nothing to deserve the fear your servants bring, so keep them on your side of the mesa and we'll stay friends." }, { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "That's a mercy for both of us, I think, though look, the mesa's gone quiet since your servant came up the path. The animals here are gentle and have done nothing to deserve that fear, so keep it on your side of the mesa and we'll stay friends." } },
      choices = {
        { text = "Your beasts are safe. I'll keep my distance.", next = "BACK", reply = "Then we are friends, and I will keep a pail of water for you whenever you come up the lift.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "What serves me goes where I go. That's final.", next = "BACK", reply = "Then you will have to wait at the edge of the mesa, because my beasts were here first and they have done no wrong.", fx = { align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Then you'll know they can smell a lie as well as I can hear one. Come and scratch the kodo's ears if you like, and I'll think better of rogues for it." } },
      choices = {
        { text = "Animals are better company than most people.", next = "BACK", reply = "You are right, I think, and the kodo would agree, so come and scratch his ears, and we will both be in good company.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I don't have time for beasts.", next = "BACK", reply = "Then the beasts will not have time for you either, and that is a lonely way to walk the plains.", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_harpies", when = { killed = { name = "Screeching", min = 20 } },
          text = "The harpies' screeching has gone quieter in the canyons since you went among them, and my beasts are grateful for it. A wolf who hears harpies all night doesn't sleep, and a wolf who doesn't sleep bites the stablemaster." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. The animals always settle when a warrior comes in, I've noticed, because they can tell you'd stand between them and anything with teeth." },
        { id = "h_default", key = true,
          text = "I am Awenasa, and I keep the stables of Freewind Post. Hunters leave their companions with me, and I keep them fed and watered, and away from the edge of the mesa." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! The animals settle when your kind walks in, as if they know you would understand them." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The animals settle when your kind come into the stables, and I'd love to learn how you do it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. My animals heal faster when someone kind is near them, I think, so stay a while and keep them company." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. My cats don't care for the smell of the arcane, so let them come to you, and they will, eventually." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "The beasts went quiet the moment you stepped off the lift, stranger. Whatever you keep, keep it away from them, because they can feel it, and it frightens them." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue, and you've no pet with you, which means you've no business in my stables. But you're welcome to visit the animals, if you're gentle." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. Your charger would be welcome in my stable, if you keep one, and you would be welcome to rest beside it." },
      },
      again = {
        { id = "h_again", text = "Is there more you would like to know about the stables?" },
        { id = "h_again2", text = "Take your time; the animals aren't going anywhere, and the Earth Mother made them patient." },
      },
      choices = {
        { text = "Are the beasts content up here on the mesa?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'd like to see my stabled pets.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Why do the animals settle around shamans, Awenasa?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does magic frighten the animals you keep?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "How do you get animals up a mesa?", next = "lift" },
        { text = "Hunters must tame all sorts of beasts around here.", next = "tame" },
        { text = "What walks with me needs no stable, Awenasa.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I like animals, Awenasa.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do the stabled beasts ever fear warriors, Awenasa?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do the beasts in your stables fear the dead, Awenasa?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    lift = {
      lines = { { id = "l_default", text = "On the lifts, very slowly, with a lot of soft words. The cats hate it and the wolves don't mind, and I once had a hunter's bear refuse to step off at the top for most of an afternoon." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    tame = {
      lines = { { id = "t_default", text = "Wind serpents, sometimes, from the dens below the cliffs, though they're hard to calm. Most hunters bring cats or wolves from the Barrens and leave the needles' creatures where they belong." },
        { id = "t_hunter", when = { class = "HUNTER" }, text = "Some of you try the wind serpents from the dens below the cliffs. I'll board one if you tame it, but it'll crackle with lightning at night and keep the others awake." } },
      choices = {
        { text = "Wild things should stay wild.", next = "BACK", reply = "You speak as the elders speak, and the needles' creatures are better left where the Earth Mother set them.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "A good hunter can tame anything.", next = "BACK", reply = "Perhaps, but a wind serpent tamed is a wind serpent that never sees its den again, so think on that before you try.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Fire frightens them, of course, and anything that crackles, but a gentle hand matters more to them than any spell. I watch how they take to a stranger, and they're very seldom wrong." } },
      choices = {
        { text = "Then I'll be gentle with them, spell or no spell.", next = "BACK", reply = "Then they will trust you, and you will find a gentle hand opens more doors than any spell.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Animals are tools. They'll do what they're told.", next = "BACK", reply = "They will, perhaps, but they will never love you, and a beast that does not love you will never die for you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Perhaps they hear the spirits around you, the way they hear thunder long before we do. My cats are calmest with shamans and my wolves are calmest with orcs, and I've stopped trying to explain it to the hunters." } },
      choices = {
        { text = "Animals know who means them no harm. Trust their judgment.", next = "BACK", reply = "I have always thought so, and they have never once been wrong about a visitor, so I listen to them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Animals sense power, and they fear it. That's all it is.", next = "BACK", reply = "Perhaps it is only that, but I think they also know kindness, because they come to some and flee from others.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I've always been better with animals than with people, and Freewind needed someone with patience." } },
    advice = { { id = "tp_ad", text = "Keep your companion close on the rope bridges, because a frightened animal doesn't look where it's stepping." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made every beast, and she made them to be loved. I love every one that comes through my stables, and they know it." } },
    centaur = { { id = "tp_centaur", text = "The centaur ride their own bodies, and they don't need stables. I find that a little sad, though I wouldn't say so to a centaur." } },
    cairne = { { id = "tp_cairne", text = "Cairne has a kodo that he's ridden for twenty years, and he still calls it by name. That's the kind of chieftain I trust." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. Ask me about the animals, though, and I'll tell you everything, from the kodo calves to the wind riders." } },
  },
}

P:NPC {
  key = "jinky", id = TODO_NPC("Jinky Twizzlefixxit"), name = "Jinky Twizzlefixxit", title = "Engineering Supplies",
  bible = "bibles/thousandneedles.md", role = "vendor", tier = "service",
  communities = { "mirage_raceway" }, temper = { "eager" }, values = { "craft", "profit" },
  notices = { "craft", "race", "lock_steed" },

  impression = {
    first = "She keeps a cheerful tally of which racing team buys more bolts.",
    third = "{name} met Jinky Twizzlefixxit, the gnome who sells engineering supplies at the Mirage Raceway.",
  },

  greetings = {
    { id = "o_gn_admire", when = { gossip = { topic = "gnomes", stance = "admire" } }, text = "Pozzik, the goblin team's boss, is sulking because somebody called gnomes brilliant engineers, and I hear it was you! I haven't enjoyed a goblin's face that much all season." },
    { id = "g_default", text = "Bolts, tubes, blasting powder and gears! Both teams buy from me, and both teams think the other one's cheating." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! You'll want to see my parts, then, and you'll want to see them before the pit crews buy them all." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome! Don't let the goblins hear you cheering for Fizzle, though; I have to sell to them too, and I'd like to keep the peace." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Is that a felsteed? Look at the heat coming off those hooves! I'd clock it on the Flats if you'd let me, though I suppose it'd melt the timing gear." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only every other heat, and usually over who borrowed whose spanner without asking. I sell to both teams, so I stand behind the counter and let the goblins and the gnomes shout until somebody remembers there's a race on." } },
      choices = {
        { text = "Somebody should keep the peace before it turns nasty.", next = "BACK", reply = "I've tried, I have, but the moment I step out from behind the counter, someone throws a spanner and I duck back in.", fx = { align = { order = 1 } } },
        { text = "A good brawl clears the air. Let them settle it.", next = "BACK", reply = "It does clear the air, though it also clears my shelves, so I'd prefer they settled it somewhere with fewer bolts.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Tortoises with shells that shine like brass, vultures that circle every crash, and scorpids that like the shade under the parked cars. The vultures are the ones that bother me, because they always seem to know which car's going to blow up before the drivers do." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Tortoises, vultures and scorpids, mostly, and they all know to keep clear of the fuel barrels, so please keep {pet} clear of them too. Those barrels don't need much encouragement." },
      },
      choices = {
        { text = "The flats were here first. The racers should mind the beasts.", next = "BACK", reply = "Oh, I agree, I really do, and I've put up three signs about the tortoises, though the goblins used two for kindling.", fx = { align = { honor = 1 } } },
        { text = "If a beast can't dodge a car, that's its lookout.", next = "BACK", reply = "That's what the goblins say, but the vultures don't seem to mind either way, which is the creepy part.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Oh, gnomes love mages, back home in Ironforge and all, but out here on the Flats we're engineers first. Magic's lovely when it works, but when a bolt doesn't fit, I'd rather have a wrench than a spell." } },
      choices = {
        { text = "Engineering's more honest than magic.", next = "BACK", reply = "More honest, more measurable and much more repairable, which is three for three, and I'll take that score any day.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Magic can do things no wrench can.", next = "BACK", reply = "True, and I'd love a spell that tightens bolts, but until somebody writes one, I'll keep my wrench close.", fx = { align = { order = -1 } } },
        { text = "Something else, Jinky.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Then you're the first rogue this month who isn't! Both crews pay well for a little sabotage, and I keep my best bolts locked up, so even if you were, you'd find slim pickings." } },
      choices = {
        { text = "Sabotage is cheating. I won't touch it.", next = "BACK", reply = "Oh, good, that's a relief, because I'd hate to lock up the bolts again, it takes me twenty minutes every night.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sabotage is just another way to race.", next = "BACK", reply = "Well, it's certainly popular, and I'll admit the sabotaged cars make for better parts sales, but please, not on my stock.", fx = { align = { honor = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Often enough that I keep bandages next to the bolts, and I sell more of them on race days. Gnome or goblin, they all come limping back to my stall with a scorched beard and a story, and most of them are back on the track by morning." } },
      choices = {
        { text = "Somebody should set proper safety rules for that track.", next = "BACK", reply = "I've drawn up seventeen, actually, but the crews keep using the drafts as napkins, so I'm on version eighteen.", fx = { align = { order = 1 } } },
        { text = "Let them race. A little danger makes it worth watching.", next = "BACK", reply = "It does make for a lively afternoon, and good sales, though I'd like everyone to still have their beards by sundown.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The flats were dead long before the first engine came, friend, all salt and sun and nothing growing. We spill a little oil now and then, but the sun bakes it off by noon, and nobody's complained except the gnomes." } },
      choices = {
        { text = "Dead land is fair use. Race on.", next = "BACK", reply = "That's my view too, mostly, though I've drawn up a little cleaning schedule, just in case the druids come back.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Clean up your spills. Dead land still deserves care.", next = "BACK", reply = "You're right, of course, and I'll add it to my list, which is long, but I promise it's in there near the top.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "All the time, and that's why the parts sell! A crash means a new axle, and a new axle means coin for Jinky, though I'll admit I flinch every time one of them comes off the track in a ball of fire." } },
      choices = {
        { text = "Profiting from crashes isn't right, Jinky.", next = "BACK", reply = "I know, I know, and I flinch every time, but the axles have to come from somewhere, and I'd rather they came from me.", fx = { align = { light = 1 } } },
        { text = "Crashes are part of the sport. Sell the axles.", next = "BACK", reply = "Exactly, and I'll keep a spare on the shelf for you too, just in case you ever take a turn too fast.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "More than the drivers, sometimes. The salt flats bake by noon, and the heat warps the axles, and when a storm comes in from the Needles it's like driving on glass. I sell more parts after a bad weather day than a whole month of clean racing." } },
      choices = {
        { text = "I'll leave the winds be. The racers deserve a fair track.", next = "BACK", reply = "That's very sporting of you, and I'll tell the crews, though they'll probably blame the weather anyway.", fx = { align = { order = 1 } } },
        { text = "A little weather makes the races interesting.", next = "BACK", reply = "Interesting for the crowd, maybe, but very expensive for me, and very confusing for my inventory.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Why not? An imp would never fit, but a felhunter's got legs on it, and a voidwalker never gets tired. I tried pitching it to Pozzik and he told me to get out of his garage, but I still think it'd sell tickets." }, { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Why not? Your {pet}'s right here and I'm already measuring it for the seat, so hold it still a second. Pozzik told me to get out of his garage last time I pitched it, but one look at that thing on the starting line and the tickets would sell themselves." } },
      choices = {
        { text = "Demons don't belong on a race track. Forget it.", next = "BACK", reply = "Oh, fine, fine, but I still think a voidwalker would make a marvellous pit crew, it never gets tired or complains.", fx = { align = { order = 1 } } },
        { text = "I'd lend you my demon for a cut of the purse.", next = "BACK", reply = "Ooh, now that's a business proposal, and I'll draw up a contract tonight, though Pozzik will still throw me out.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Once a day, give or take, and some days twice. Most walk away with a sore head and a bent fender, but the Flats are hard as stone when you hit them fast, and I've seen a few carried off on boards." } },
      choices = {
        { text = "I'll tend the injured, whatever team they race for.", next = "BACK", reply = "Oh, that's wonderful, because the crews won't tend each other, and I've run out of bandages twice this week.", fx = { align = { light = 1 } } },
        { text = "They chose to race. The risk is theirs to carry.", next = "BACK", reply = "They did, and they'll keep choosing it, so I'll keep the bandages near the bolts and hope for a quiet day.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You don't look much like an engineer, but if you need a wrench swung hard, I know two racing crews who'd hire you this afternoon." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Mind your step out on the flats, because the tortoises bask right on the track and the racers have stopped swerving for them." },
        { id = "h_default", key = true,
          text = "Jinky Twizzlefixxit, engineering supplies, right here on the Shimmering Flats! The racers burn through parts faster than they burn through fuel, so I'm never short of customers." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Don't go casting near my stock, friend, because the last mage who sneezed in here set off a crate of fuses and Pozzik's crew still blames me for the delay." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! Are you working for the goblins or the gnomes? Because I've noticed the parts go missing whenever someone like you visits the track." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Say a little prayer over the racers if you've got one spare, because they fly off that track at speeds the Light never had in mind." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid on the Flats! You're the first one I've seen who didn't stare at the cars like they killed somebody's grandmother." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll be wanting a cog, a gear or a spare tire, I'd bet, because even holy warriors need something to sit on between races." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Don't go stirring up the wind on race day, because a crosswind on the Flats has blown more cars off the track than all the sabotage put together." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now that's interesting, because I've always wondered whether a demon could pull a race car, and nobody's let me try." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Good, because if anyone crashes while you're standing there, you'll be on the clock for free, and we've got two races before supper." },
      },
      again = {
        { id = "h_again", text = "Anything else? The next race starts in roughly eleven minutes, give or take a flaming wheel!" },
        { id = "h_again2", text = "Ask away! I can talk and count gears at the same time." },
      },
      choices = {
        { text = "Do the races harm the salt flats?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You sell to both teams?", next = "both" },
        { text = "One team must be the favourite.", next = "winner" },
        { text = "Do gnomes and mages often clash?", next = "xmage", when = { class = "MAGE" } },
        { text = "I'm not here to steal parts, Jinky.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "The racers must get hurt often, Jinky.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the racing crews ever come to blows, Jinky?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Something must live out on the salt flats, Jinky.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do the racers ever get hurt, Jinky?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the weather really matter so much to the races, Jinky?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You want a demon to pull a race car, Jinky? Mine bites.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "How often do the racers crash, Jinky?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Goodbye.", next = "END" },
      },
    },
    both = {
      lines = { { id = "b_default", text = "Of course I do! A gnome car and a goblin car both need bolts, and both of them break down about as often. If I only sold to the gnomes, I'd be half as rich and twice as bored." } },
      choices = {
        { text = "That's smart. Trade with everyone.", next = "BACK", reply = "Exactly, and both sides tip, which is the best part, though the goblins tip in bent coins.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A gnome should stand with the gnomes.", next = "BACK", reply = "I do stand with them, in my heart, but my ledger stands with everyone, and the ledger pays for my workshop.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    winner = {
      lines = { { id = "w_default", text = "Fizzle's car is cleverer and Pozzik's car is faster, so it depends on whether the race is long or short. I don't bet, but if I did, I'd bet on whoever bought the most parts from me that week." } },
      choices = {
        { text = "Someone must be buying more.", next = "winner_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    winner_more = {
      lines = { { id = "wm_default", text = "Someone is, and I'm not telling who, because a merchant who talks about her customers' orders soon has no customers. Ask Kravel Koalbeard, if you want rumors; he always seems to know." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I sell parts. Wherever there are engineers breaking things, there's somebody like me selling them the bits to fix it." } },
    advice = { { id = "tp_ad", text = "Always carry a spare tube, because the one you need is always the one you didn't bring." } },
    mirage_raceway = { { id = "tp_race", text = "The best place in Kalimdor to watch things explode at speed, and the best place to sell bolts." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Gnomeregan's lost, and I'm not going to talk about it, except to say that we'll get it back one day. Until then, I sell bolts to everyone, because bolts don't care where you're from." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's the best engineering town in Kalimdor, and I'll admit that even though it's full of goblins. They buy my bolts and I buy their gears, and nobody gets hurt, mostly." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel's neutral, and so am I, so I sell to gnomes and goblins both. A sprocket doesn't care whose car it ends up in, and frankly, after the third crash, neither do I." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's a goblin port, but they've got a few gnome engineers working the cranes. I hear they're paid better than the goblins, though nobody will admit it." } },
    _none = { { id = "tp_none", text = "Oh, I don't know about that, but I'd be happy to sell you a sprocket that's eighty percent likely to help!" } },
  },
}
