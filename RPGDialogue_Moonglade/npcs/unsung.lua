-- Nighthaven's shopkeepers (0.39.0): Daeolyn Summerleaf's general goods, Malvor the herbalist and
-- Narianna the bowyer. Moonglade is neutral ground, so nobody assumes the player's faction.
-- Voices: bibles/unsung.md.
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC = P.TODO_NPC

-- Daeolyn Summerleaf: general goods in Nighthaven.
P:NPC {
  key = "daeolyn", id = TODO_NPC("Daeolyn Summerleaf"), name = "Daeolyn Summerleaf", title = "General Goods",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "serene", "welcoming" }, values = { "peace", "hospitality" },
  notices = { "race", "weary" },
  impression = {
    first = "Daeolyn Summerleaf sells supplies in Nighthaven and treats every traveler, Horde or Alliance, as a guest of the grove. She seems to believe the peace of Moonglade can rub off on anyone who stays long enough.",
    third = "{name} met Daeolyn Summerleaf, who keeps Nighthaven's general store open to all.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Nighthaven. However you came here, and whoever you came with, you're a guest of the grove now." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the grove. It does that to people; they always come back." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Welcome, friend of the Earth Mother. Your people's druids have made Nighthaven a little louder and a good deal warmer, and I'm glad of both." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You've come through Felwood, haven't you? Everyone who does looks like that. Rest here for a while; nothing in the grove will trouble you." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A few, on their way to Winterspring or back from Felwood, and they always look a little lost here, as if they keep waiting for something to attack them. I tell them to sit by the lake for a day, and some of them do, and they leave looking ten years younger." } },
      choices = {
        { text = "A disciplined warrior rests when there's time. I'll sit a while.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sitting still makes me restless. I'll be on my way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Daeolyn.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Warm clothes for Winterspring and clean water for Felwood, because you can't drink anything in that forest, and arrows for both. The road south runs through the Timbermaw tunnels, so keep on good terms with the furbolgs, or you'll be walking a long way around." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And something for {pet}, of course! I keep dried meat for the travelers' beasts, and they always look at me as if I'm the kindest person in Kalimdor." },
      },
      choices = {
        { text = "I'll go through the tunnels and keep the Timbermaw's trust.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll slip through the tunnels whether the furbolgs like it or not.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "On most of them, if they stay long enough, and priests seem to catch it quickest of all. I sold a Forsaken priest a bag last spring, and he sat by the lake for three days and left without a word, but he was smiling, or near enough." } },
      choices = {
        { text = "Then I'll stay a while, and let the peace take hold.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Peace is a luxury. I'll keep my edge, thank you.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not for trouble, anyway, because the grove sees to that. I've had rogues come in wound tight as a bowstring and leave whistling, and I like to think a quiet bag of supplies from me had a little to do with it." } },
      choices = {
        { text = "Then I'll let myself unwind a little.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll stay wound tight. Peace doesn't last outside.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Only the arcane kind, and only because of the Highborne, which was a very long time ago, though you'd never know it from how they talk. Be gentle with your spells and kind to the trees, and they'll warm to you, slowly." } },
      choices = {
        { text = "Gentle spells and kind words. I can manage that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I won't tiptoe around ancient grudges, Daeolyn.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Anyone who comes in peace, and the Keeper knows the difference better than any of us. I don't pretend to like the fel, but I've seen warlocks sit by the lake as quietly as any druid, and I'd rather judge the person than the craft." } },
      choices = {
        { text = "Then judge me by my peace. I'll keep it here.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Judge me how you like. The fel serves me well.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, welcome! You'll want a few bags, I'd guess, because warriors always carry more than they need and never have anywhere to put it." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, welcome! You'll want arrows and food for your companion, I expect, and I keep both, though Narianna's arrows are better than mine." },
        { id = "h_default", text = "I'm Daeolyn Summerleaf, and I keep the general goods for Nighthaven: water, thread, bags and the small things that travelers run short of. Most who come here are druids, but anyone the grove lets in may buy from me." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, welcome to Nighthaven! The grove is quieter than any temple, and I've seen priests of every sort stay a day longer than they meant to." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, welcome! You needn't keep to the shadows here, because nobody in Nighthaven is looking for anyone, and that's the whole charm of the place." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! The druids get a bit prickly about magic, but I've always thought a mage's company makes the evenings shorter, and Nighthaven's evenings are very long." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. You're welcome to my wares like anyone else the grove lets in, though I'd thank you to keep your companion outside, because it frightens the moths." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? The grove is in no hurry." },
        { id = "h_again2", text = "Ask what you like. Peace makes for long conversations." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Horde and Alliance both trade here?", next = "both" },
        { text = "How did you come to live in Moonglade?", next = "came" },
        { text = "Does Moonglade's peace really rub off on travellers, Daeolyn?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is no one in Nighthaven ever looking for anyone, Daeolyn?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Are the druids truly prickly about magic, Daeolyn?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does the grove truly let in anyone at all, Daeolyn?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do many warriors come through Nighthaven, Daeolyn?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What does a hunter need for the roads out of Moonglade?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Farewell, Daeolyn.", next = "END" },
      },
    },
    both = {
      lines = {
        { id = "bo_default", text = "They do, and nobody draws a blade, because the Keeper won't allow it and the Circle would be ashamed of it. A tauren druid and a night elf druid will stand at this counter side by side, and some days they even talk to each other." },
      },
      choices = {
        { text = "Do you think that peace could spread?", next = "both2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    both2 = {
      lines = {
        { id = "bo2_default", text = "I'd like to believe it could, but Moonglade has Remulos, and Ashenvale doesn't. Out there it's axes and arrows, and in here it's only two travelers buying water." },
      },
      choices = {
        { text = "If peace works here, it can work anywhere.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1, learn = { "cenarion_circle" } } },
        { text = "Peace only lasts where someone enforces it.", next = "BACK", fx = { align = { honor = -1 }, learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    came = {
      lines = {
        { id = "ca_default", text = "I followed a druid here, a long time ago, and stayed after he went into the Dream. Someone had to keep the bread coming while the druids were busy being wise." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_cc", text = "The Circle keeps Moonglade for every druid, whoever they march with outside. I only keep the shop." } },
    background = { { id = "tp_bg", text = "I sell supplies in Nighthaven. I came for a druid and stayed for the quiet." } },
    advice = { { id = "tp_ad", text = "If you take the road through Felwood, keep to the Timbermaw tunnels and say nothing rude to the furbolgs." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. Rabine Saturna might; he knows most things that happen in the grove." } },
  },
}

-- Malvor: herbalist in Nighthaven (his Classic title; he trains herbalism).
P:NPC {
  key = "malvor", id = TODO_NPC("Malvor"), name = "Malvor", title = "Herbalist",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "nighthaven" }, temper = { "dreamy", "gentle" }, values = { "nature", "wonder" },
  notices = { "craft", "form" },
  impression = {
    first = "Malvor teaches herbalism in Nighthaven and speaks of the plants of Moonglade as though they were half asleep and dreaming. He is gentle, and a little hard to bring back to earth.",
    third = "{name} met Malvor, Nighthaven's dreamy herbalist.",
  },

  greetings = {
    { id = "g_default", text = "Shh, step lightly. The silverleaf by the lake is just opening." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. The grove remembers your footsteps, and so do I." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You carry a satchel of herbs from places I've never been. May I look? I promise not to keep anything." },
    { id = "n_tree", cat = "form", when = { form = { "bear", "cat", "moonkin" } },
      text = "Please watch where you put those feet. The young plants here grow slowly, and they have very little patience for paws." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I believe so, though I can't prove it, because they grow a little differently each night, as if they'd been somewhere and come back changed. A warrior who walks gently here might find the plants lean toward them, and I've seen it happen." } },
      choices = {
        { text = "Then I'll walk gently here. A warrior can be careful.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Plants are plants. I'll walk where I like.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Malvor.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only the ones they need, which is the strange thing, because a deer here will pass a whole bed of herbs and nibble only one leaf. I think they know what's dreaming and what's awake, and leave the dreaming ones alone." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} sniffs only at the peacebloom, I see, the most wakeful of them all. Your beast has good taste, friend." },
      },
      choices = {
        { text = "Then the beasts should be left to their grazing. I'll respect that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If the beasts can eat them, so can I. Herbs are herbs.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Not with ears, but they lean toward a kind voice the way they lean toward the moon, I'm sure of it. A troll priest once prayed over my peacebloom, and it flowered twice that season, though I suppose it might have been the rain." } },
      choices = {
        { text = "Then I'll tend them as patiently as you do.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd sooner pick them than pray to them, Malvor.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "None that grow here willingly, for the grove sits so near the Dream that everything in it wants to heal. Take the same seed to Felwood and it might come up bitter, which tells you more about Felwood than about the seed." } },
      choices = {
        { text = "Then I'll leave Moonglade's herbs to their healing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bitter seeds have their uses too, Malvor.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Wake it, I suspect, and not gently. The Emerald Dream is a quiet place by all accounts and the arcane is a very loud magic, so I like to keep the two well apart, the way you'd keep a lantern away from straw." } },
      choices = {
        { text = "Then I'll keep my magic far from the herbs.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some things ought to be woken, Malvor.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They do, as surely as a hand pulls back from a flame. The plants of Felwood didn't have the choice, and look at them now, all twisted and glowing, which I think is why these ones remember to flinch." } },
      choices = {
        { text = "Then I'll stand back and let them grow.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Plants that flinch from power won't survive the world.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, among my herbs. Do step carefully, please, because the plants here dream, and I think heavy boots give them nightmares." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, among my herbs. You'll know the wild plants, I expect, the ones that grow by the trails, and you'll know which ones the beasts eat." },
        { id = "h_default", text = "I am Malvor, and I tend the herbs of Moonglade and teach those who wish to learn herbalism. Everything here grows a little differently, because the grove sits so close to the Dream." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, here among the herbs. Moonglade's plants grow so close to the Dream that some say they listen to prayers, so do keep yours gentle." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, among my herbs. You'll know your poisons, I expect, and I'm afraid Moonglade's plants are too sleepy and too gentle to give you any." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Do be careful casting near the herb beds, because the plants here dream, I think, and I'd hate to see what the arcane does to their dreams." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. The herbs pull away from you a little, can you see it? I don't think they mean any offence, because they're only very sensitive to fel." },
      },
      again = {
        { id = "h_again", text = "Is there another herb on your mind, or something else entirely?" },
        { id = "h_again2", text = "Go on. I was only listening to the leaves." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "What grows differently here?", next = "grows" },
        { text = "What do you mean, close to the Dream?", next = "dream" },
        { text = "Do Moonglade's herbs truly listen to prayers, Malvor?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Are there truly no poisons growing in Moonglade, Malvor?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What would the arcane do to a dreaming plant, Malvor?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do Moonglade's herbs really shrink from the fel, Malvor?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do the herbs of Moonglade really dream, Malvor?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the beasts of Moonglade eat your herbs?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Farewell, Malvor.", next = "END" },
      },
    },
    grows = {
      lines = {
        { id = "gr_default", text = "The silverleaf by the lake glows faintly at night, and the peacebloom opens before sunrise rather than after. Picked here, they're no stronger than anywhere else, but I like to think they remember where they came from." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dream = {
      lines = {
        { id = "dr_default", text = "The druids say Moonglade lies near the Emerald Dream, closer than anywhere else in the world, and that's why they come here to sleep and study. I'm no druid, but even I dream more clearly in Nighthaven." },
      },
      choices = {
        { text = "Is it dangerous, to be so close?", next = "dream2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream2 = {
      lines = {
        { id = "dr2_default", text = "The Keeper doesn't seem to think so, and I trust him. But I've heard the druids speak quietly about sleepers who don't wake, and I don't ask them more than they want to say." },
      },
      choices = {
        { text = "Some mysteries are better left alone.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 }, learn = { "malfurion" } } },
        { text = "If something's wrong, someone should find out.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 }, learn = { "malfurion" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    malfurion = { { id = "tp_mal", text = "The Shan'do sleeps in the Dream, they say. I hope his dreams are gentler than mine." } },
    background = { { id = "tp_bg", text = "I tend the herbs of Nighthaven. I came to study them, and they've been studying me ever since." } },
    _none = { { id = "tp_none", text = "I don't know, but if you ask the plants, perhaps they'll tell you. They tell me things sometimes." } },
  },
}

-- Narianna: bowyer in Nighthaven.
P:NPC {
  key = "narianna", id = TODO_NPC("Narianna"), name = "Narianna", title = "Bowyer",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "practical", "dry" }, values = { "readiness", "honesty" },
  notices = { "class" },
  impression = {
    first = "Narianna sells bows in Nighthaven and sees no contradiction in arming travelers in the most peaceful place in Kalimdor. She is dry and practical about it.",
    third = "{name} met Narianna, the practical bowyer of Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Yes, a bowyer in a sanctuary. You aren't the first to look surprised, and you won't be the last." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Run out of arrows in Winterspring, did you?" },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Your beast won't need to hunt here, so let it rest while you shop." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a satyr in Felwood will throw fel fire from the trees, and a warrior who has to run thirty paces to reach it arrives half-burnt. A bow won't make you a hunter, but it'll make the satyr come down to you." } },
      choices = {
        { text = "A warrior closes the distance and faces the enemy. No bow.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A bow from cover suits me fine. Let them come to me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Narianna.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Moonglade's wood, which grows slow and close to the Dream and doesn't warp in the cold, and that matters when you're on your way to Winterspring. I won't cut a living tree, so I use what the storms bring down, which is why I never have more than a dozen to sell." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} deserves a hunter who doesn't miss, so take your time choosing. A good bow is a kindness to your beast as much as to you." },
      },
      choices = {
        { text = "A bow from fallen wood is the only honest kind.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Living wood makes a better bow. I'd cut it myself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "A good prayer can mend the hole an arrow leaves, I'll grant you, but it's a poor shield before it lands. Every traveller who leaves this grove meets furbolgs and worse on the road, so take a friend with a bow, if you won't take one yourself." } },
      choices = {
        { text = "I'll travel with friends and watch their backs.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll let others take the arrows first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I sell to travellers, and what they do on the road is between them and whoever they meet there. Inside the grove nobody fights, and outside it the Deadwood and the Winterfall don't ask whether you're a rogue or a saint before they attack." } },
      choices = {
        { text = "My arrows are for honest fights, Narianna.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Best not to ask, then. I won't tell.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Better is a strong word, and cheaper and quieter is fairer. The druids don't love the arcane flying around these hills, so a spell on the road out is fine, but in the grove you'll find a bow draws far fewer frowns." } },
      choices = {
        { text = "I'll respect the grove's ways while I'm here.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Frowns don't trouble me. I'll cast as I need.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They dislike anything that comes into the world from somewhere it shouldn't, and a demon fits that rather well. I'm a practical woman, so I'll say it plainly: keep your pets on the far side of the hills, and nobody here will trouble you." } },
      choices = {
        { text = "Fair enough. I'll leave my demons beyond the hills.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My demons go where I go. Practical, as you say.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. You'll want a bow for when your enemies keep their distance, I'd say, and don't look at me like that, because even a warrior has to reach sometimes." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Then you'll know a good bow when you see one, and you'll know these aren't the cheap ones they sell in the cities." },
        { id = "h_default", text = "I'm Narianna, and I sell bows, arrows and quivers here in Nighthaven. Nobody fights inside the grove, but everyone who comes here has to leave again, and the roads out are not so kind." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. You'll not want a bow, I imagine, but the roads out of Moonglade run through Felwood and Winterspring, and a prayer can't stop an arrow." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll want a bow for when the dagger doesn't reach, and I'll not ask what you're aiming at, so long as it's outside the grove." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, at a bowyer's stall. You'll be telling me a fireball does the same work as an arrow, I expect, and you'd be right, but my arrows don't run out of mana." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. I've nothing to sell you, since you can't draw a bow, though I'd say the druids would sooner see you try than summon something." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Go on, ask." },
      },
      choices = {
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "Isn't selling bows here a bit odd?", next = "odd" },
        { text = "Where do people go from here?", next = "roads" },
        { text = "Is a prayer truly no match for an arrow, Narianna?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you sell to rogues knowing what they'll do, Narianna?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is an arrow truly better than a spell, Narianna?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the druids really dislike summoning so much, Narianna?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why would a warrior need a bow, Narianna?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What makes your bows better than a city bowyer's?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Farewell, Narianna.", next = "END" },
      },
    },
    odd = {
      lines = {
        { id = "od_default", text = "Only if you think peace means nobody's armed. Peace here means nobody draws, and the Keeper doesn't care what's on your back, as long as it stays there." },
      },
      choices = {
        { text = "A real peace would need no weapons at all.", next = "odd2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    odd2 = {
      lines = {
        { id = "od2_default", text = "Perhaps, and when the world outside agrees with you, I'll start selling flowers. Until then, every druid who walks to Felwood comes back alive more often with a bow than without one." },
      },
      choices = {
        { text = "True peace starts with laying weapons down.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Peace is kept by those ready to fight for it.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads = {
      lines = {
        { id = "ro_default", text = "South through the furbolg tunnels to Felwood, or north into the snows of Winterspring. Druids can fly from the hippogryph and wind rider posts here, but everyone else walks, and both roads are rough." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell bows in Nighthaven. I used to be a Sentinel, and I still like to see people leave well armed." } },
    advice = { { id = "tp_ad", text = "In Felwood, don't drink from anything green. You'll thank me." } },
    _none = { { id = "tp_none", text = "I don't know. I sell bows; that's my whole wisdom." } },
  },
}
