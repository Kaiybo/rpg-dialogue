-- Melor Stonehoof, elder hunter on Hunter Rise. Voice: bibles/melor.md
-- A grave teacher who thinks every hunt should mean something, and sets a hunt that is a cleansing rather than a meal.
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "melor", id = TODO_NPC("Melor Stonehoof"), name = "Melor Stonehoof",
  bible = "bibles/melor.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "wise", "nature" },
  notices = { "pet", "class" },
  impression = {
    first = "Some of his hunts only rid the land of beasts gone wrong.",
    third = "{name} met Melor Stonehoof on Hunter Rise, the elder hunter who sets young tauren hunts with lessons in them.",
  },

  greetings = {
    { id = "g_rise", text = "Walk quietly on this rise, {class}. Hunters can hear a careless hoof from the far end of it." },
    { id = "g_steelsnap", when = { questActive = TODO_QUEST("Steelsnap") }, text = "Steelsnap roams Thousand Needles, south of the Barrens. Find him, and remember why you're hunting him." },
    { id = "g_done", when = { questDone = TODO_QUEST("Steelsnap") }, text = "The Needles are cleaner without Steelsnap. That was your lesson, and you learned it well." },
    { id = "g_away", when = { away = 14 }, text = "{away} away, and you come back with the dust of the plains on your hide. Good. That's how a hunter should come home." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You walk like a hunter now, not like someone who's been told about hunting. I can always tell the difference." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your companion watches me as closely as you do. Good. A beast that trusts its hunter too easily hasn't been taught well." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Then you've already learned that the kill is the smallest part of the hunt." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Melor Stonehoof. At times we hunt for food, at times for honor, and at times to earn the Earth Mother's teachings, and I set the young of Thunder Bluff on all three. Some hunts are none of those, though, like the one for the hyena Steelsnap in Thousand Needles." },
        { id = "h_sergra", key = true, when = { questActive = TODO_QUEST("Sergra Darkthorn") },
          text = "Your path leads to the Barrens, and Sergra Darkthorn at the Crossroads will be your first guide there. The beasts of the Barrens are strong-willed and fierce, and you will learn much from them." },
        { id = "h_sends", when = { questActive = TODO_QUEST("Melor Sends Word") },
          text = "So, {name}, you have come. Now, are you prepared to journey through distant lands? Then listen." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Steelsnap") },
          text = "The hunt I set you now is none of the three kinds I teach. It is to slay a creature outside the Earth Mother's blessing, the hyena Steelsnap, who gathers other hyenas to him in the Needles and spreads fear and blood among gentler beasts." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Steelsnap"), days = 3 } },
          text = "In defeating Steelsnap, you've cleansed Thousand Needles of a terrible taint. That is the lesson, {name}: some hunts are not taking, but giving back." },
      },
      again = {
        { id = "h_again", text = "What else would you know of the hunt, young one?" },
        { id = "h_again2", text = "Ask, and I'll answer as a hunter would, slowly and with the wind in mind." },
      },
      choices = {
        { text = "Tell me about the three kinds of hunt.", next = "three" },
        { text = "What made Steelsnap different?", next = "steelsnap" },
        { text = "Tell me of the great hunts beyond Mulgore.", next = "m_hunts", when = { class = "HUNTER" } },
        { text = "Who is Sergra Darkthorn?", next = "sergra", when = { heardLine = "melor.h_sergra" } },
        { text = "Teach me something about hunting with a companion.", next = "pet", when = { class = "HUNTER" } },
        { text = "What hunt do you have for me?", next = "BUSINESS" },
        { text = "Good hunting, Melor.", next = "END" },
      },
    },
    three = {
      lines = { { id = "t_default", text = "For food, you take only what you need and thank the beast. For honor, you choose a worthy foe and face it fairly. For teaching, you hunt to learn the land, and the beast is your elder." } },
      choices = {
        { text = "Which matters most?", next = "most" },
        { text = "Something else, Melor.", next = "BACK" },
      },
    },
    most = {
      lines = { { id = "m_default", text = "The one you're on. Young hunters always want to rank them, because they want to know which kill to be proudest of, and the answer is that you shouldn't be proud of any kill at all." } },
      choices = {
        { text = "Not proud of any kill? Then what?", next = "most_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    most_end = {
      big = true,
      lines = { { id = "me_default", text = "Grateful, or sorry, or satisfied that a thing was done that needed doing. Pride belongs to the beast that ran well, and the hunter should leave it with the carcass." } },
      choices = {
        { text = "Gratitude, not pride. I'll remember that, Melor.", next = "BACK", reply = "Remember it on the trail, when the hunt has gone your way and your blood is still singing. That is the moment it matters, and the moment it is hardest.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A good kill should be celebrated.", next = "BACK", reply = "Celebrate the meat on the fire and the hides for the winter, and I will sit beside you. But the beast died, young one, and that is not a thing to cheer.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    steelsnap = {
      lines = { { id = "s_default", text = "A hyena who kills for the pleasure of it, and teaches others to do the same. The Needles have enough cruelty in them already without a beast like that leading packs through the canyons." } },
      choices = {
        { text = "I didn't think a beast could be cruel.", next = "cruel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cruel = {
      lines = { { id = "c_default", text = "Most can't, and that's why the Earth Mother blesses them. A beast that kills more than it eats, and leaves the bodies to rot, has stepped outside that blessing, and it's for hunters to return it to the earth." } },
      choices = {
        { text = "Then the hunt is a mercy.", next = "BACK", reply = "A mercy to the land, and maybe to the beast as well, if it suffers what it has become. Go gently in your heart, even if your arrows must not.", fx = { align = { light = 1 } } },
        { text = "Then the hunt is a punishment.", next = "BACK", reply = "That is how the young see it, and I saw it so once. But we are not judges of beasts, only hands that give back to the Earth Mother what has gone astray.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sergra = {
      lines = { { id = "se_default", text = "An orc hunter at the Crossroads, and a good teacher, though she'd laugh to hear me say it. She takes the young out into the Barrens and teaches them there's more to hunting than finding and killing." } },
      choices = { { text = "I'll seek her out.", next = "BACK", fx = { affinity = 1 } } },
    },
    m_hunts = {
      hub = true,
      narr = "He unrolls a hide marked with charcoal, the edges of Kalimdor and the lands beyond drawn in a careful, old-fashioned hand.",
      lines = {
        { id = "mh_default", text = "The great hunts of our people do not stay on the plains, young one. I send hunters wherever a beast has stepped outside the Earth Mother's blessing, and every one of those hunts teaches something the Barrens could not." },
        { id = "mh_low", when = { maxLevel = 24 }, text = "You are young for the great hunts, and I would rather send you to Sergra and to Jorn a while longer. Still, ask, and know what waits for you when you are ready." },
        { id = "mh_high", when = { minLevel = 45 }, text = "You have walked many of my hunts already, I think, for I see the cold of Alterac and the mud of Dustwallow on you. Ask, and tell me how the land fared after." },
      },
      again = {
        { id = "mh_again", text = "Which hunt would you hear of next? The hide is long." },
        { id = "mh_again2", text = "Ask on. I would rather you knew the beast before you met it." },
      },
      choices = {
        { text = "Why must the young go first to Sergra?", next = "m_way" },
        { text = "What lives in the swamps of Dustwallow?", next = "m_deadmire", when = { minLevel = 30 } },
        { text = "Tell me of the yeti Frostmaw.", next = "m_frostmaw", when = { minLevel = 30 } },
        { text = "Do the great hunts ever end?", next = "m_end", when = { minLevel = 50 } },
        { text = "I hunted with the Darkspear before I came here.", next = "m_troll", when = { race = "Troll" } },
        { text = "Enough of the hunts, Melor.", next = "BACK" },
      },
    },
    m_way = {
      lines = {
        { id = "mw_default", text = "Because the hunter's way begins with the beasts that feed us, and Sergra Darkthorn knows them better than any orc I have met. She will teach you the plainstrider and the zhevra and the great white cat, and Jorn Skyseer at Taurajo will teach you the four elders of the Barrens. Only after that do I send you farther." },
        { id = "mw_done", when = { questDone = TODO_QUEST("The Hunter's Way") }, text = "You have walked the hunter's way already, so you know why. A hunter who has not learned the beasts that feed us cannot be trusted to judge the beasts that have gone astray." },
      },
      choices = { { text = "Back to the hunts.", next = "m_hunts" } },
    },
    m_deadmire = {
      lines = {
        { id = "md_default", text = "Deadmire, a crocolisk older than any hunter living, who lies in the black water and takes whatever comes to drink, beast or traveler. He does not eat half of what he takes, and that is how I know he has gone wrong." },
        { id = "md_done", when = { questDone = TODO_QUEST("Deadmire") }, text = "You brought me Deadmire's tooth, and the folk who draw water in that swamp sleep easier. Did you thank him, at the end? He was very old, and he had once been a good beast." },
      },
      choices = { { text = "Back to the hunts.", next = "m_hunts" } },
    },
    m_frostmaw = {
      lines = {
        { id = "mf_default", text = "Frostmaw is a great yeti in the mountains of Alterac, far to the north across the sea, where the snow never leaves the peaks. He has killed hunters who went to test themselves on him, and the snow keeps their bones, and I would not send you if I thought you would join them." },
        { id = "mf_done", when = { questDone = TODO_QUEST("Frostmaw") }, text = "You went into the cold and came back with Frostmaw's mane, which is more than three hunters before you managed. Sit by the fire a while; I can still see the snow in your fur." },
      },
      choices = {
        { text = "Why send a tauren so far from the Earth Mother's plains?", next = "m_far" },
        { text = "Back to the hunts.", next = "m_hunts" },
      },
    },
    m_far = {
      big = true,
      lines = { { id = "mfa_default", text = "The Earth Mother's plains run beneath every land, young one, even under the snow and the human kingdoms. The Grimtotem say the tauren should stay in Mulgore and let the world rot, and Cairne says we are part of the world, and I send my hunters where Cairne would." } },
      choices = {
        { text = "Cairne is right. Every land is hers.", next = "m_hunts", reply = "Then go into the snow with an easy heart, and come home with stories.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Our own land needs us more than distant ones.", next = "m_hunts", reply = "That is fairly said, and there are elders who agree. But a beast gone wrong is a wound anywhere, and wounds spread.", fx = { align = { order = -1 } } },
        { text = "Back to the hunts.", next = "m_hunts" },
      },
    },
    m_end = {
      lines = { { id = "me2_default", text = "No, for the land always makes another beast that loses its way. But a hunter's part in them ends, and the best of us finish by teaching. When you are done, come back to this rise and sit where I sit, and send the young ones out, and you will understand why I am so slow." } },
      choices = {
        { text = "I'll come back and teach, Melor.", next = "m_hunts", fx = { affinity = 1 } },
        { text = "Back to the hunts.", next = "m_hunts" },
      },
    },
    m_troll = {
      lines = { { id = "mt_default", text = "Then you know already that some beasts must be hunted for the good of the rest. Your people hunted the Echo Isles with care, I am told, for an island hunted bare does not grow back. Tell me, do the Darkspear thank the beast, as we do?" } },
      choices = {
        { text = "We thank the loa who sent it.", next = "m_hunts", reply = "Then the thanks goes where it is due, I think. The Earth Mother and the loa must know each other well by now.", fx = { affinity = 1 } },
        { text = "We thank it by wasting nothing.", next = "m_hunts", reply = "That is the best thanks of all, and the one most hunters forget. Hunt well, friend.", fx = { trait = { practical = 1 } } },
      },
    },
    pet = {
      lines = { { id = "p_default", text = "Feed it before you feed yourself, and never ask it to fight something you wouldn't. A companion follows you because it trusts you, and the Earth Mother gave you that trust to keep, not to spend." } },
      choices = { { text = "I'll keep its trust.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A hunter, for longer than I care to count. The beasts have taught me more than any elder." } },
    advice = { { id = "tp_ad", text = "Know why you're hunting before you draw. A hunter without a reason is only a killer with a bow." } },
    centaur = { { id = "tp_centaur", text = "The centaur were the first hunt my father ever sent me on, and I failed it. I have hunted them since, and I have not failed again." } },
    quilboar = { { id = "tp_quilboar", text = "The quilboar kill for pleasure as much as for food, and that is why I hunt them. A beast that kills for pleasure has gone wrong." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made the beasts, and she made them to be hunted, but only with respect. Thank the beast before you skin it, and waste nothing you take." } },
    cairne = { { id = "tp_cairne", text = "Cairne is the greatest hunter of our people, and he taught me that every hunt must teach something. I try to live up to that." } },
    _none = { { id = "tp_none", text = "That's no trail I know. Ask among the elders, or at the Crossroads, and may the Earth Mother guide your tracking." } },
  },
}
