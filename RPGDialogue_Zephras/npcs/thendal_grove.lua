-- Thendal Grove: Yala Windwatcher at the standing stones, two more Rangers of Thendal Grove
-- (Elatrell Featherlight and Valreaa Valewind), and Dalia the Collector of windstones.
-- Voices: bibles/zep_yala.md, bibles/zep_elatrell.md, bibles/zep_valreaa.md, bibles/zep_dalia.md
-- Facts from warcraft.wiki.gg (Zephras Isle storyline); see bibles/zephras.md for the zone.
local P = RPGDialogueAPI:Pack("rpgd.zephras")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Yala Windwatcher, Rorian's apprentice, watching the standing stones
---------------------------------------------------------------------------
P:NPC {
  key = "zep_yala", id = TODO_NPC("Yala Windwatcher"), name = "Yala Windwatcher",
  bible = "bibles/zep_yala.md", role = "questgiver", tier = "quest",
  communities = { "zephras_isle" }, temper = { "calm", "earnest" }, values = { "dutiful", "patient" },
  notices = { "class", "kin" },

  impression = {
    first = "Yala Windwatcher is Rorian's apprentice, sent to watch the agitated sprites at the standing stones, and she takes the work very seriously. It hurts her that the cure meant shedding shen'dorei blood.",
    third = "{name} met Yala Windwatcher, Rorian's apprentice, who watches the troubled winds at Thendal Grove's standing stones.",
  },

  greetings = {
    { id = "g_default", text = "Careful near the stones. The winds here are neither kind nor gentle any more." },
    { id = "g_rorian", when = { questActive = TODO_QUEST("Elemental Unrest") }, text = "Rorian sent you? Good. I could use another pair of hands." },
    { id = "g_agit", when = { questActive = TODO_QUEST("Agitators") }, text = "Is it done? The winds are still restless; I can feel them." },
    { id = "g_after", when = { questDone = TODO_QUEST("Agitators") }, text = "The stones are quieter now. I wish the price had been smaller." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the stones have had their moods since. Gale's greetings, all the same." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown strong since the day Rorian sent you to me. The winds would think twice about you now." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Rorian heard you were caught in a lie, and so I've heard it too. Please don't make me tell him I trusted you anyway." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You're learning from Boro, aren't you? Then you'll feel it as I do, that there's nothing here to answer us, only echoes." },
    { id = "n_young", cat = "kin", when = { race = "Skyborne", maxLevel = 4 },
      text = "You still have the smell of the great tree on you, child. Stay close to the paths, because the sprites here don't know a friend from a cultist." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Yala Windwatcher, and Rorian sent me to watch the winds at these stones. The wind spirits have left us, and what remains here are only mindless echoes, and lately those echoes have turned angry." },
        { id = "h_unrest", tags = { "news" }, when = { questActive = TODO_QUEST("Elemental Unrest") },
          text = "Rorian sent you to me? Good; I could use your help. I've watched long enough to know what's stirring the sprites, and it isn't the weather." },
        { id = "h_agit", when = { questActive = TODO_QUEST("Agitators") },
          text = "Disperse the roiling winds before they hurt someone, and drive the Al'Aketh converts out of the grove. They need to know they are not welcome here." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Agitators"), days = 2 } },
          text = "It pains me to shed shen'dorei blood here in the grove, but we did what we had to. Go back to Rorian and tell him what we found; he'll want to hear it from you." },
        { id = "h_outsider", when = { ["not"] = { race = "Skyborne" } },
          text = "You're from below the clouds, aren't you? Then you may know winds that still talk back. Ours stopped some years ago, and I've never heard what they sounded like." },
      },
      again = {
        { id = "h_again", text = "What else? I'll keep one eye on the stones while we talk." },
        { id = "h_again2", text = "Go on. The sprites are calm for the moment." },
      },
      choices = {
        { text = "What are these sprites?", next = "sprites" },
        { text = "Someone seems to be stirring them up.", next = "cult" },
        { text = "Does Rorian keep you busy?", next = "rorian" },
        { text = "Do you think the true spirits will return?", next = "spirits" },
        { text = "The spirits still answer me, Yala.", next = "xshaman", when = { class = "SHAMAN", ["not"] = { race = "Skyborne" } } },
        { text = "Winds guide you, Yala.", next = "END" },
      },
    },
    sprites = {
      lines = {
        { id = "s_default", text = "Little manifestations of the wind, not aware the way the old spirits were. They answer whatever moves around them, fear or calm or anger, the way water takes the shape of a cup." },
      },
      choices = {
        { text = "So someone filled the cup with anger.", next = "cult" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult = {
      lines = {
        { id = "c_default", text = "The Al'Aketh, I'm sure of it. I've seen their converts among the stones, praying and shouting into the wind, and every time they come the sprites grow wilder." },
      },
      choices = {
        { text = "What do the Al'Aketh want?", next = "cult_want", fx = { learn = { "al_aketh" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult_want = {
      lines = {
        { id = "cw_default", text = "To serve Al'Akir, whom they call the ruler of Skywall, and to make the rest of us bow as well. Rorian says many of them only joined because they were afraid, and I believe him, which makes this harder." },
      },
      choices = {
        { text = "Then what should be done with them?", next = "cult_do" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult_do = {
      big = true,
      lines = {
        { id = "cd_default", text = "I wish I knew. They are our cousins, and some of them are frightened children, but they're turning our own winds against our homes, and that can't go unanswered." },
      },
      choices = {
        { text = "Show them mercy where we can. They're still shen'dorei.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They chose the cult. They answer for it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rorian = {
      lines = {
        { id = "r_default", text = "Quiet, mostly, and long hours of watching. He says a Windwatcher who can't sit still for a day will never notice anything worth noticing, and he's usually right, though I'd never tell him so." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    spirits = {
      lines = {
        { id = "sp_default", text = "I don't know, and nobody does. Some say they were called away, and some say they're angry with us, and the High Order says we never needed them as much as we believed." },
      },
      choices = {
        { text = "What do you believe?", next = "spirits_believe", fx = { learn = { "two_orders" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits_believe = {
      big = true,
      lines = {
        { id = "sb_default", text = "That we owe them, whatever the High Order says. The pylons and the windstones were their gifts, and a debt doesn't vanish because the one you owe has gone quiet." },
      },
      choices = {
        { text = "The debt is real. We should keep faith with them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "They left us. We owe them nothing now.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      lines = {
        { id = "xs_default", text = "They do? Then I envy you more than I can say. Will you listen here, by the stones, and tell me if you hear anything besides the echoes?" },
      },
      choices = {
        { text = "Only echoes here, Yala. I'm sorry.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Rorian's apprentice, and I watch the winds. One day, he says, I'll know what I'm watching for." } },
    advice = { { id = "tp_ad", text = "Go calmly among the stones. The sprites give back whatever you bring them." } },
    al_aketh = { { id = "tp_alak", text = "Grey robes and shaved heads, shouting at the sky. They've made the winds in our own grove hate us." } },
    windstones = { { id = "tp_ws", text = "The winds' last gift to us, and we're spending them faster than I like. Ask Dalia; she counts every one." } },
    the_elements = { { id = "tp_the_elements", text = "The sprites aren't wicked, they only feel what's near them, and something near them has been angry. Rorian says I must learn to tell the anger that's theirs from the anger that's ours." } },
    highborne = { { id = "tp_highborne", text = "The Highborne used magic without asking anything first, Rorian says, and the sprites remember that kind of carelessness. I try very hard to ask first." } },
    elune = { { id = "tp_elune", text = "I've never prayed to the moon, but I sometimes thank it when it lights my way back from the stones. I don't think it minds." } },
    _none = { { id = "tp_none", text = "I don't know. Rorian might; he knows most things eventually, the way the wind finds every gap in a wall." } },
  },
}

---------------------------------------------------------------------------
-- Elatrell Featherlight, Rangers of Thendal Grove
---------------------------------------------------------------------------
P:NPC {
  key = "zep_elatrell", id = TODO_NPC("Elatrell Featherlight"), name = "Elatrell Featherlight", title = "Rangers of Thendal Grove",
  bible = "bibles/zep_elatrell.md", role = "questgiver", tier = "quest",
  communities = { "zephras_isle" }, temper = { "brisk", "dry" }, values = { "practical", "dutiful" },
  notices = { "class", "kit" },

  impression = {
    first = "Elatrell Featherlight is a ranger with no patience for pests, and he sends the young out after cirrusflies with a dry joke and a warning. He thinks I'd make a fine ranger, if the other thing doesn't work out.",
    third = "{name} met Elatrell Featherlight, a dry-humored Ranger of Thendal Grove at war with the cirrusflies.",
  },

  greetings = {
    { id = "g_default", text = "Pests, everywhere pests, riding every draught through the grove. Gale's greetings, and what can I do for you?" },
    { id = "g_infest", when = { questActive = TODO_QUEST("Infestation Investigation") }, text = "The eastern end of the grove. Don't let the swarm grow, and don't let them land on you." },
    { id = "g_queen", when = { questActive = TODO_QUEST("The Cirrusfly Queen") }, text = "Watch the big ones. The bigger they are, the meaner they get." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Cirrusfly Queen") }, text = "The grove's quieter without that queen. One less problem to think about." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the cirrusflies didn't miss you. I did, a little, though I'd not say so in front of the other rangers." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've come a long way from bug duty. The rangers notice that sort of thing." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word is you've been helping around the village. Good; we've more work than rangers." },
  },

  notice = {
    { id = "n_guts", cat = "kit", when = { killed = { name = "Cirrusfly", min = 8 } },
      text = "Judging by the bug entrails all over you, that infestation was worse than I was told. Go and wash before Rorian sees you." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, is it? Tai'ree will be pleased, and so am I, since your sort actually enjoys this work." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Elatrell Featherlight, Rangers of Thendal Grove. One of our rangers reported cirrusflies in the grove, and if a swarm like that grows too large it stops being a nuisance and starts being dangerous." },
        { id = "h_infest", tags = { "news" }, when = { questRecent = { TODO_QUEST("Infestation Investigation"), days = 2 } },
          text = "Judging by the state of you, it's quite the infestation. Killing the workers won't be enough, I'm afraid; we'll have to go after the one making them." },
        { id = "h_queen", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Cirrusfly Queen"), days = 2 } },
          text = "Excellent work. You'd make a fine ranger, if this whole adventurer business doesn't work out for you, and I don't say that to everyone." },
        { id = "h_ranger", when = { origin = "skyborne_thendal_ranger" },
          text = "Back from the paths, and still in one piece. Halaan says you were the only one of your year who could find a nest by smell." },
        { id = "h_outsider", when = { ["not"] = { race = "Skyborne" } },
          text = "A visitor from below, out among the bugs. You didn't come all this way for cirrusflies, I'd hope, but since you're here, I won't turn down help." },
      },
      again = {
        { id = "h_again", text = "Anything else? The bugs won't wait." },
        { id = "h_again2", text = "Go on, then. Quickly." },
      },
      choices = {
        { text = "What are cirrusflies?", next = "flies" },
        { text = "Is something leading the swarm?", next = "queen" },
        { text = "The rangers must have their hands full out here.", next = "rangers" },
        { text = "I hunt for a living. Bugs included.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Winds be with you, Elatrell.", next = "END" },
      },
    },
    flies = {
      lines = {
        { id = "f_default", text = "Insects, about the size of your hand, that drift on the wind and bite when they land. One or two are a nuisance, but a swarm can strip a grove bare, and they've been breeding at the eastern end." },
      },
      choices = {
        { text = "There seem to be far more of them now.", next = "flies_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flies_why = {
      lines = {
        { id = "fw_default", text = "I'm a ranger, not a Windshaper, so I'll not pretend to know. Every creature on this island has been strange lately, the vuldren and the ursera and now the bugs, and I'd guess it's all one trouble with many faces." },
      },
      choices = {
        { text = "Then we should find the cause.", next = "flies_cause" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flies_cause = {
      big = true,
      lines = {
        { id = "fc_default", text = "That's for the elders and their orders to argue about. My work is keeping the village standing until they've finished arguing, which could be some time." },
      },
      choices = {
        { text = "The elders should act, not argue.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Do your duty and trust the elders.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    queen = {
      lines = {
        { id = "q_default", text = "Deeper in the forest, near the hive, and surrounded by soldiers bigger and nastier than the workers. Put her down, and the swarm will dwindle on its own." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rangers = {
      lines = {
        { id = "r_default", text = "We keep the beasts away from the village and the village away from the edges, and we watch for anything the elders ought to hear about. Halaan sees farthest, Myriaal jokes loudest, and I mostly deal with bugs." },
      },
      choices = {
        { text = "Bug work can't be anyone's favourite duty.", next = "rangers_mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rangers_mind = {
      lines = {
        { id = "rm_default", text = "Someone has to, and I'm good at it. There's no glory in it, but a boy can play at the foot of the elder tree without being stung, and I'll take that over a song any day." },
      },
      choices = {
        { text = "That's a fine way to see it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = {
        { id = "xh_default", text = "Then you'll understand that it's not the small ones you watch, it's the big ones, because the bigger they are, the meaner. Take Tai'ree's beast-sense out there with you and you'll do fine." },
      },
      choices = {
        { text = "I'll mind the big ones.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Thendal born, ranger by trade, and bug-catcher by misfortune, which is not a heirloom anyone hopes to inherit." } },
    advice = { { id = "tp_ad", text = "Watch the big ones. It's good advice for bugs and better advice for people." } },
    the_elements = { { id = "tp_the_elements", text = "The winds used to keep the pests down, and now the cirrusflies breed unchecked. When the spirits come back, I hope they bring a swatter." } },
    highborne = { { id = "tp_highborne", text = "The High Order keeps telling me I'm Highborne, as if I'd misplaced it. I'm a ranger, and that's a perfectly good thing to be." } },
    elune = { { id = "tp_elune", text = "The rangers pray to the winds before a hunt and to nothing after. A few of the young ones have taken to the moon, and they shoot no straighter for it." } },
    _none = { { id = "tp_none", text = "Not my department. Ask Rorian, or Aetheen, if you've the nerve to interrupt an elder reading the winds." } },
  },
}

---------------------------------------------------------------------------
-- Valreaa Valewind, Rangers of Thendal Grove
---------------------------------------------------------------------------
P:NPC {
  key = "zep_valreaa", id = TODO_NPC("Valreaa Valewind"), name = "Valreaa Valewind", title = "Rangers of Thendal Grove",
  bible = "bibles/zep_valreaa.md", role = "questgiver", tier = "quest",
  communities = { "zephras_isle" }, temper = { "steady", "earnest" }, values = { "protective", "dutiful" },
  notices = { "class", "kin" },

  impression = {
    first = "Valreaa Valewind is a ranger who can't stop thinking about the boy the ursera nearly killed by the elder tree. She does what has to be done, and keeps wondering why it had to be done at all.",
    third = "{name} met Valreaa Valewind, a Ranger of Thendal Grove worried about the ursera growing bold.",
  },

  greetings = {
    { id = "g_default", text = "Keep clear of the southwest paths if you can. The ursera are restless, and the winds carry our scent straight to their den." },
    { id = "g_active", when = { questActive = TODO_QUEST("Aggressive Encroachment") }, text = "The scrawny ones, outside the den. Bring me their claws." },
    { id = "g_done", when = { questDone = TODO_QUEST("Aggressive Encroachment") }, text = "The Rangers of the Grove are in your debt, and I mean that as surely as I mean the winds be with you." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}. The ursera haven't quieted, but I'm glad you're back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown into your weapons since you first stood here, and I'm glad to see it." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone in the village is angry with you. It's a small grove on a small isle, and our people have carried enough old grudges across the ages already, so please mend it." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID", form = { "bear" } },
      text = "Please don't wander toward the den looking like that. The ursera might take you for one of their own, or worse, for a rival." },
    { id = "n_young", cat = "kin", when = { race = "Skyborne", maxLevel = 4 },
      text = "You're barely older than the boy the ursera went for. Be careful out there, and come back with all your fingers." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Valreaa Valewind, Rangers of Thendal Grove. The ursera den to the southwest is becoming a problem; just last week we had to kill a young one that came too close and went for a boy playing at the foot of the elder tree." },
        { id = "h_active", when = { questActive = TODO_QUEST("Aggressive Encroachment") },
          text = "The scrawniest of them are the hungriest, and the hungriest are the ones that come near the village. They're outside the den, not inside it, so don't go deeper than you must." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Aggressive Encroachment"), days = 2 } },
          text = "Well done. The Rangers of the Grove are in your debt, and the children can play by the tree again, at least for a while." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid. Xyton would say the ursera are only doing what hunger tells them, and he's right, but hunger doesn't care whose child is in the way." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask. I've a moment before my watch." },
      },
      choices = {
        { text = "What happened to the boy?", next = "boy" },
        { text = "The ursera have grown very bold.", next = "why" },
        { text = "Is killing them the only answer?", next = "kill" },
        { text = "Couldn't a druid calm the ursera?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Winds be with you, Valreaa.", next = "END" },
      },
    },
    boy = {
      lines = {
        { id = "b_default", text = "He escaped with his life, by luck and by a ranger who was close enough to draw. He's back at play already, the way children are, but his mother hasn't let him out of her sight since." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Hunger and desperation, I think, though I keep asking what changed to make them so hungry. They've grown far more aggressive of late, and beasts don't change their habits for no reason." },
      },
      choices = {
        { text = "Any guesses?", next = "why_guess" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_guess = {
      lines = {
        { id = "wg_default", text = "The island's getting smaller, a little at a time, as the edges fall away. Less land means less food, and the ursera don't know why, only that they're hungry and we live near the berries." },
      },
      choices = {
        { text = "Then the island itself is the problem.", next = "why_island" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_island = {
      big = true,
      lines = {
        { id = "wi_default", text = "That's the fear nobody likes to say aloud. The pylons hold us together, and they're fading, and whatever the orders argue about, the ursera are already feeling it." },
      },
      choices = {
        { text = "The orders should stop arguing and save the island.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The elders will find a way. We hold the line meanwhile.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kill = {
      big = true,
      lines = {
        { id = "k_default", text = "For now it is, and I hate it. If we cull the hungriest, the rest may keep away, but I'd rather we fed them than buried them, if we had food enough for both." },
      },
      choices = {
        { text = "The village comes first. Cull them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Then we should find them another way to live.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      lines = {
        { id = "xd_default", text = "Maybe, if you can speak to a beast that's starving. Xyton tried, I think, and came back with claw marks and a very thoughtful look." },
      },
      choices = {
        { text = "I'll try, carefully.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the southwest paths, and the children off them. That's my whole story, and on an isle that has lost so much, it's enough." } },
    advice = { { id = "tp_ad", text = "A hungry beast is more dangerous than an angry one. Remember that, wherever you go." } },
    the_elements = { { id = "tp_the_elements", text = "When the winds were with us, the beasts were calmer, I'm certain of it. The ursera came to the elder tree out of hunger, and I think the island is hungry too." } },
    elune = { { id = "tp_elune", text = "I've started speaking to the moon at night, after the ursera. I don't know whether I believe, but I need to speak to someone who won't tell me it was necessary." } },
    highborne = { { id = "tp_highborne", text = "The Highborne were said to command beasts with a word. I'd have traded my bow for a word that would have turned that ursera aside." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Ask Aetheen; she reads the grove's winds better than anyone on the Council." } },
  },
}

---------------------------------------------------------------------------
-- Dalia the Collector, who gathers windstones
---------------------------------------------------------------------------
P:NPC {
  key = "zep_dalia", id = TODO_NPC("Dalia the Collector"), name = "Dalia the Collector",
  bible = "bibles/zep_dalia.md", role = "questgiver", tier = "quest",
  communities = { "zephras_isle" }, temper = { "cheerful", "brisk" }, values = { "practical", "careful" },
  notices = { "craft", "arcane" },

  impression = {
    first = "Dalia the Collector gathers windstones from all over Thendal Grove and counts every one, because the island's magic is fading and the stones are what's left. She is cheerful about it in the way of someone determined not to be frightened.",
    third = "{name} met Dalia the Collector, who gathers the precious windstones of Thendal Grove.",
  },

  greetings = {
    { id = "g_default", text = "Hello there, and winds be with you! Have you seen any blue crystals lying about?" },
    { id = "g_active", when = { questActive = TODO_QUEST("Harvesting Windstones") }, text = "The raw windstones are all over the grove; you can't miss them, they glow." },
    { id = "g_done", when = { questDone = TODO_QUEST("Harvesting Windstones") }, text = "Thank you again for those stones. Every one matters now, with the pylons failing and the isle's magic thinning year by year." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}? You didn't bring me any windstones, I suppose. No, I didn't think so." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since you went crystal-hunting for me. I hope you kept one of those manuals." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "People in the village speak well of you. I'd trade a windstone for that, very nearly." },
  },

  notice = {
    { id = "n_mine", cat = "craft", when = { profession = "Mining" },
      text = "A miner! Then you'll know how to get a stone out of the ground without cracking it, and half the young ones I send out still can't." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "You're a student of the High Order, aren't you? Don't drain the stones to practice your spells, please; Dorii's apprentices tried that once." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Dalia, and they call me the Collector, because I collect windstones. They hold the raw, concentrated energy of the winds themselves, and since the wind elementals left us, they've become very precious indeed." },
        { id = "h_active", when = { questActive = TODO_QUEST("Harvesting Windstones") },
          text = "The raw windstones are blue crystals, scattered all around the grove, and each one holds a few clusters. Bring me as many as you can, and mind you don't crack them." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Harvesting Windstones"), days = 2 } },
          text = "Thank you very much for these. As elves we all have a deep bond with magic, and these stones grow more precious the more the anchor pylons fade. Windstones aren't the only thing worth harvesting, though, and that's what the manual is for." },
        { id = "h_outsider", when = { ["not"] = { race = "Skyborne" } },
          text = "You're from the mainland? Then perhaps you have stones like these where you come from. I'd dearly like to know." },
      },
      again = {
        { id = "h_again", text = "What else? I'm counting, but I can count and talk." },
        { id = "h_again2", text = "Go on, ask. The stones will keep." },
      },
      choices = {
        { text = "What exactly is a windstone?", next = "stones" },
        { text = "The island's magic seems to be fading.", next = "fading" },
        { text = "What happens to the stones you collect?", next = "use" },
        { text = "I'd like to study a windstone's magic.", next = "xmage", when = { class = "MAGE" } },
        { text = "I carried windstones between Valanaar and Shen'dramar, Dalia. Quietly.", next = "xorig_runner", when = { origin = "skyborne_windstone_runner" } },
        { text = "Winds guide you, Dalia.", next = "END" },
      },
    },
    xorig_runner = {
      big = true,
      lines = {
        { id = "xru_default", text = "Quietly, you say, which means past the Council's counters, which means some of the stones I've been counting all season might have gone through your hands first! Oh, don't look like that; I'm not cross, only curious. Where did they all end up?" },
      },
      choices = {
        { text = "With people who needed them more than the Council did.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Somewhere they shouldn't. I'd like to put that right.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stones = {
      lines = {
        { id = "s_default", text = "A piece of the wind made solid, more or less, left behind where the elementals used to gather. They're not without their limits, but they're a reliable source of power, and nothing else on Zephras is reliable any more." },
      },
      choices = {
        { text = "Surely they'll run out one day.", next = "stones_out", fx = { learn = { "windstones" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stones_out = {
      lines = {
        { id = "so_default", text = "Not this year, nor next. But no new ones have formed since the elementals left, as far as anyone can tell, so every stone we use is one fewer for our grandchildren." },
      },
      choices = {
        { text = "Then they should be rationed.", next = "stones_ration" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stones_ration = {
      big = true,
      lines = {
        { id = "sr_default", text = "That's what I keep telling the elders, and they keep telling me the village needs them now. They're both right, which is the worst kind of argument." },
      },
      choices = {
        { text = "Save them for the future. The village will manage.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The living need them now. Use them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fading = {
      lines = {
        { id = "f_default", text = "The wind elementals who lived here with us vanished a number of years ago, and the magic that keeps the island aloft has been fading ever since. The great anchor pylons still hold, but they hold a little less each season." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    use = {
      lines = {
        { id = "u_default", text = "Some go to the village, for light and warmth and the little workings that keep Thendal comfortable. The rest I keep, carefully, for whatever comes next, because something always does." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xm_default", text = "You may look at one, but please don't drain it to see what happens. The High Order's apprentices are always curious, and curiosity has cost me three good stones this season." },
      },
      choices = {
        { text = "I'll only look, Dalia.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I collect windstones. Before that I collected other things, but nothing that mattered as much." } },
    advice = { { id = "tp_ad", text = "Learn to gather from the land, whatever you gather. The island won't always provide as it once did." } },
    windstones = { { id = "tp_ws", text = "The winds' own energy, made solid. I could talk about them all day, and some days I do." } },
    the_elements = { { id = "tp_the_elements", text = "The windstones are what the winds left behind, and I count every one, because nobody's seen a new one form since the spirits went quiet. As far as anyone can tell, that is." } },
    highborne = { { id = "tp_highborne", text = "The High Order's apprentices drain a windstone a week practicing Highborne spells, and I've told the elders so. They don't count, so I count for them." } },
    elune = { { id = "tp_elune", text = "The moon doesn't make windstones, so I've no professional interest in her. Personally, I think she's lovely." } },
    _none = { { id = "tp_none", text = "That's not a thing I collect, I'm afraid, and my shelves are full of the things I do collect. Ask Rorian." } },
  },
}
