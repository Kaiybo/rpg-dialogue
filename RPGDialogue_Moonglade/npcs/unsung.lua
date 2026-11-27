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
  notices = { "race", "weary", "lock_soulstone" },
  impression = {
    first = "She believes Moonglade's peace rubs off on anyone who stays long enough.",
    third = "{name} met Daeolyn Summerleaf, who keeps Nighthaven's general store open to all.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Welcome back, dear friend. Nighthaven feels a little warmer whenever you walk in from the path." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "You are a guest of the Circle here, as anyone is. I trust you will remember what that asks of you." },
    { id = "g_default", text = "Welcome to Nighthaven. However you came here, and whoever you came with, you're a guest of the grove now." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the grove. It does that to people; they always come back." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Welcome, friend of the Earth Mother. Your people's druids have made Nighthaven a little louder and a good deal warmer, and I'm glad of both." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You've come through Felwood, haven't you? Everyone who does looks like that. Rest here for a while; nothing in the grove will trouble you." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "Someone has bound your soul in a stone, and the lake went quiet when you came down the path. I don't pretend to understand it, but I hope the one who holds it loves you, because that's a great deal to carry." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They never say, and I never ask. But they always leave a little quieter than they came, and I'd like to think the grove does that for everyone." } },
      choices = {
        { text = "The grove's peace is worth carrying home.", next = "BACK", reply = "Then carry it gently, and it'll keep longer than you'd think. I've had customers write from Stormwind to say they still dream of the lake.", fx = { align = { light = 1 } } },
        { text = "Peace is for groves. The world needs fighters.", next = "BACK", reply = "It does, and I'm glad there are fighters in it, truly. But even fighters must rest somewhere, and the grove doesn't mind who.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They never quite tell me, but they always come back calmer. I think the spirits here are kinder than in most places, since nobody's fought over Moonglade in a long, long time, and that kind of peace leaves a mark on the land as surely as a war does." } },
      choices = {
        { text = "I'll sit by the lake and listen, then.", next = "BACK", reply = "Do, and stay as long as you like. I'll bring you some bread around noon, because everyone forgets to eat by the lake.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Peace like this is rare. It won't last forever.", next = "BACK", reply = "Nothing does, I know, but it's lasted a good long while already. I'd rather enjoy it than worry about its ending.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not many, but the ones who come tend to stay a day longer than they meant, because the grove is quieter than any temple. I've a theory that the peace here rubs off on anyone who stays long enough, and I've watched a few stern knights leave smiling, so I'd say it holds." } },
      choices = {
        { text = "A little peace would do me good, Daeolyn.", next = "BACK", reply = "Then you've come to the right grove. Stay the extra day, as the others did, and I'll find you a bench with a view of the water.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Peace makes a warrior soft. I'll not linger.", next = "BACK", reply = "Soft? Perhaps, but the ones who rested here always seemed to fight better when they left. Go well, all the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A few, on their way to Winterspring or back from Felwood, and they always look a little lost here, as if they keep waiting for something to attack them. I tell them to sit by the lake for a day, and some of them do, and they leave looking ten years younger." } },
      choices = {
        { text = "A disciplined warrior rests when there's time. I'll sit a while.", next = "BACK", reply = "Then sit, and I'll fetch you a cup of water from the spring. The grove will keep watch while you rest.", fx = { align = { order = 1 } } },
        { text = "Sitting still makes me restless. I'll be on my way.", next = "BACK", reply = "I understand, and I won't keep you, but the bench will be here when you're ready for it. Go carefully.", fx = { align = { order = -1 } } },
        { text = "Something else, Daeolyn.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Warm clothes for Winterspring and clean water for Felwood, because you can't drink anything in that forest, and arrows for both. The road south runs through the Timbermaw tunnels, so keep on good terms with the furbolgs, or you'll be walking a long way around." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Warm clothes for Winterspring, clean water for Felwood, and something for {pet}, of course! I keep dried meat for travellers' beasts, and they always look at me as if I'm the kindest person in Kalimdor." },
      },
      choices = {
        { text = "I'll go through the tunnels and keep the Timbermaw's trust.", next = "BACK", reply = "That's the wise road, and the Timbermaw will remember your manners. They don't forget a polite guest.", fx = { align = { honor = 1 } } },
        { text = "I'll slip through the tunnels whether the furbolgs like it or not.", next = "BACK", reply = "Oh, please don't, for they're friends to Moonglade and their memories are very long. The tunnels are safer for everyone when we're polite.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "On most of them, if they stay long enough, and priests seem to catch it quickest of all. I sold a Forsaken priest a bag last spring, and he sat by the lake for three days and left without a word, but he was smiling, or near enough." } },
      choices = {
        { text = "Then I'll stay a while, and let the peace take hold.", next = "BACK", reply = "Then the lake will be glad of you, and so will I. That Forsaken priest took the bench by the willow, if you'd like to try his luck.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Peace is a luxury. I'll keep my edge, thank you.", next = "BACK", reply = "That's your choice, and I'll not argue with it. But the edge will still be there when you leave, I promise.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not for trouble, anyway, because the grove sees to that. I've had rogues come in wound tight as a bowstring and leave whistling, and I like to think a quiet bag of supplies from me had a little to do with it." } },
      choices = {
        { text = "Then I'll let myself unwind a little.", next = "BACK", reply = "Good! You'll find it's easier than it sounds here. Start by taking your hand off that dagger, and the rest follows.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll stay wound tight. Peace doesn't last outside.", next = "BACK", reply = "I understand, and you may be right about the world outside. But you're not outside yet, are you?", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Only the arcane kind, and only because of the Highborne, which was a very long time ago, though you'd never know it from how they talk. Be gentle with your spells and kind to the trees, and they'll warm to you, slowly." } },
      choices = {
        { text = "Gentle spells and kind words. I can manage that.", next = "BACK", reply = "That's all anyone asks of you here. Do it for a week, and Malvor might even let you near his silverleaf.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I won't tiptoe around ancient grudges, Daeolyn.", next = "BACK", reply = "I'd not ask you to, only to be kind about it. Ten thousand years is a long time to hold a grudge, and they've gotten very good at it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Anyone who comes in peace, and the Keeper knows the difference better than any of us. I don't pretend to like the fel, but I've seen warlocks sit by the lake as quietly as any druid, so I judge the person before the craft." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Anyone who comes in peace, and the Keeper knows the difference better than any of us. I don't pretend to like your servant, which is watching the lake very strangely, but I've seen warlocks sit by the water as quietly as any druid, so I judge the person before the craft." },
      },
      choices = {
        { text = "Then judge me by my peace. I'll keep it here.", next = "BACK", reply = "I will, and gladly. Just leave your companion outside, if you would, because it still frightens the moths.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Judge me how you like. What serves me, serves me well.", next = "BACK", reply = "Then I hope it serves you outside the grove, and never inside it. The Keeper watches very closely.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A few, and fewer every season, since the road through the Timbermaw tunnels is long. I like the strangers; druids talk about the Dream and the balance all day long, and a traveler will tell me what bread costs in Stormwind or Orgrimmar, which is a nice change." } },
      choices = {
        { text = "Moonglade should stay hidden. The fewer strangers, the safer.", next = "BACK", reply = "There's sense in that, and the Keeper keeps it hidden for good reason. Still, I like a new face now and then.", fx = { align = { order = 1 } } },
        { text = "Let strangers come. Moonglade could teach them a great deal.", next = "BACK", reply = "I think so too, and I'm glad to hear a druid say it. A little peace could go a long way out there.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Daeolyn.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_grown", when = { metBefore = true, levelsSince = 10 }, text = "You've grown since you last came through Nighthaven, and not only in your gear; you stand like someone the world has tested. The grove is glad to see you back." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" },
          text = "A shaman, welcome to Nighthaven! The grove's quieter than anywhere on the Barrens, and I've seen shamans sit by the lake for hours, just listening." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, welcome to Nighthaven! You'll want supplies for the road, I expect, and I've plenty, along with a quiet corner by the lake if you'd like to set down that heavy armour a while." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, welcome! You'll want a few bags, I'd guess, because warriors always carry more than they need and never have anywhere to put it." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, welcome! You'll want arrows and food for your companion, I expect, and I keep both, though Narianna's arrows are better than mine." },
        { id = "h_default", text = "I am Daeolyn Summerleaf, and I keep the general goods for Nighthaven: water, thread, bags and the small things that travellers run short of. Most who come here are druids, but anyone the grove lets in may buy from me, as it has always been." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, welcome to Nighthaven! The grove is quieter than any temple, and I've seen priests of every sort stay a day longer than they meant to." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, welcome! You needn't skulk here, because nobody in Nighthaven is looking for anyone, and that's the whole charm of the place." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! The druids get a bit prickly about magic, but I've always thought a mage's company makes the evenings shorter, and Nighthaven's evenings are very long." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "You're welcome to my wares like anyone else the grove lets in, though I'd thank you to keep your companion outside, because it frightens the moths." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, home in Nighthaven. The grove's always a little brighter when one of the Circle comes back from the road, and I'll see you have what you need for the next one." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman, welcome to Nighthaven! I've seen shamans sit by the lake for hours, just listening, but never one from Ironforge." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? The grove is in no hurry." },
        { id = "h_again2", text = "Ask what you like. Peace makes for long conversations." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Horde and Alliance both trade here?", next = "both" },
        { text = "You don't seem like a druid yourself.", next = "came" },
        { text = "Does the peace here really rub off on travellers?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Nobody in Nighthaven is looking for anyone? Truly?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "The druids do seem prickly about magic.", next = "xmage", when = { class = "MAGE" } },
        { text = "Does the grove let in just anyone?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do many warriors come through Nighthaven?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What does a hunter need for the roads out of Moonglade?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you get many travelers who aren't druids?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do many paladins stay here?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the shamans hear by the lake?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "What do the shamans hear by the lake?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "If peace works here, it can work anywhere.", next = "BACK", reply = "I hope you're right, with all my heart. I'd like to sell water to a tauren and an elf in Astranaar one day and have nobody stare.", fx = { align = { honor = 1 }, affinity = 1, learn = { "cenarion_circle" } } },
        { text = "Peace only lasts where someone enforces it.", next = "BACK", reply = "Perhaps, and the Keeper does enforce it, I'll not deny that. But I like to think we'd keep it even if he didn't.", fx = { align = { honor = -1 }, learn = { "cenarion_circle" } } },
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
    background = { { id = "tp_bg", text = "I sell supplies in Nighthaven. I came chasing a druid, he took up with a bear, and I stayed anyway." } },
    advice = { { id = "tp_ad", text = "If you take the road through Felwood, keep to the Timbermaw tunnels and say nothing rude to the furbolgs." } },
    timbermaw = { { id = "tp_timbermaw", text = "I came in through the Timbermaw tunnels the first time, chasing a druid. The furbolgs found it very funny, and they still laugh when they see me." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "My druid fell asleep for a week once and came back talking about the Dream. Then he took up with a bear, and I stopped asking about his dreams." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I'd go to the Darkmoon Faire if I weren't stuck selling rope in a druid glade. Some days I think about it very seriously." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. Rabine Saturna might; he knows most things that happen in the grove, and has for centuries." } },
  },
}

-- Malvor: herbalist in Nighthaven (his Classic title; he trains herbalism).
P:NPC {
  key = "malvor", id = TODO_NPC("Malvor"), name = "Malvor", title = "Herbalist",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "nighthaven" }, temper = { "dreamy", "gentle" }, values = { "nature", "wonder" },
  notices = { "craft", "form", "lock_shadow" },
  impression = {
    first = "He is gentle, and a little hard to bring back to earth.",
    third = "{name} met Malvor, Nighthaven's dreamy herbalist.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Oh, it's you. Come, step lightly, and I'll show you where the best silverleaf hides. Not everyone gets told." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Step lightly, please, and stay on the path. The herbs don't know you, and I'm not certain I do either." },
    { id = "g_default", text = "Shh, step lightly. The silverleaf by the lake is just opening." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. The grove remembers your footsteps, and so do I." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You carry a satchel of herbs from places I've never been. May I look? I promise not to keep anything." },
    { id = "n_tree", cat = "form", when = { form = { "bear", "cat", "moonkin" } },
      text = "Please watch where you put those feet. The young plants here grow slowly, and they have very little patience for paws." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The moonpetals closed up as you came in, every one of them, and they only do that when the clouds come. There aren't any clouds, so I think it must be you, and I think they'll open again once you've gone." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I think they dream, which is nearly the same thing, and the closer they grow to the lake, the deeper their dreams seem. A shaman might hear them better than I can, so if you ever do, I'd love to know what a mageroyal dreams about, because I suspect it's something sweet." } },
      choices = {
        { text = "I'll listen for you, Malvor, and tell you what I hear.", next = "BACK", reply = "Would you? Oh, I'd be so grateful! I've wondered for years, and the druids only smile at me when I ask. Tell me even if it's strange.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Herbs are for gathering. Spirits are a different matter.", next = "BACK", reply = "Perhaps, but I've never been able to tell them apart here, not truly. The whole grove seems half spirit and half leaf to me.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I think so, though I've no proof but a feeling. The silverleaf droops when the guards march past and lifts again when the druids walk by, and I've always wondered what a plant would make of the Light, which is a different sort of brightness than the moon's." } },
      choices = {
        { text = "I'll walk lightly among them, then, and not disturb them.", next = "BACK", reply = "Thank you. Watch the silverleaf as you pass and see if it doesn't lift a little behind you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Plants don't notice anything. They're just plants.", next = "BACK", reply = "Perhaps, but you'd be surprised what a plant can notice, if you watch it long enough. I've spent years watching.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I believe so, though I can't prove it, because they grow a little differently each night, as if they'd been somewhere and come back changed. A warrior who walks gently here might find the plants lean toward them, and I've seen it happen." } },
      choices = {
        { text = "Then I'll walk gently here. A warrior can be careful.", next = "BACK", reply = "Then you'll find the herbs grow a little greener behind you. I'll watch for it, and tell you if they do.", fx = { align = { order = 1 } } },
        { text = "Plants are plants. I'll walk where I like.", next = "BACK", reply = "Of course, and they'll grow back, as they always do. But I'll walk behind you and straighten them, if you don't mind.", fx = { align = { order = -1 } } },
        { text = "Something else, Malvor.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only the ones they need, which is the strange thing, because a deer here will pass a whole bed of herbs and nibble only one leaf. I think they know what's dreaming and what's awake, and leave the dreaming ones alone." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Only the ones they need, and {pet} sniffs only at the peacebloom, I see, the most wakeful of them all. Your beast has good taste, friend." },
      },
      choices = {
        { text = "Then the beasts should be left to their grazing. I'll respect that.", next = "BACK", reply = "Thank you, that's a kind thought. The old doe by the lake would bow to you if she knew, though she bows to no one.", fx = { align = { light = 1 } } },
        { text = "If the beasts can eat them, so can I. Herbs are herbs.", next = "BACK", reply = "They are, and you're welcome to some, but pick the way the deer do, just one leaf. Take a whole plant, and I'll be standing behind you looking sorrowful.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Not with ears, but they lean toward a kind voice the way they lean toward the moon, I'm sure of it. A troll priest once prayed over my peacebloom, and it flowered twice that season, though I suppose it might have been the rain." } },
      choices = {
        { text = "Then I'll tend them as patiently as you do.", next = "BACK", reply = "Then they'll lean toward you too, I'm sure of it. Talk to them while you weed; I do, and nobody has stopped me yet.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd sooner pick them than pray to them, Malvor.", next = "BACK", reply = "Pick them, then, and gently, and that's prayer enough for them, I think. They don't ask for much.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "None that grow here willingly, for the grove sits so near the Dream that everything in it wants to heal. Take the same seed to Felwood and it might come up bitter, and the fault would be Felwood's, not the seed's." } },
      choices = {
        { text = "Then I'll leave Moonglade's herbs to their healing.", next = "BACK", reply = "That's kind, and they'll go on healing for it. Felwood has enough bitter things already.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bitter seeds have their uses too, Malvor.", next = "BACK", reply = "I suppose they do, and I'll not pretend otherwise. But I'd rather not grow them here, if you don't mind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Wake it, I suspect, and not gently. The Emerald Dream is a quiet place by all accounts and the arcane is a very loud magic, so I like to keep the two well apart, the way you'd keep a lantern away from straw." } },
      choices = {
        { text = "Then I'll keep my magic far from the herbs.", next = "BACK", reply = "Thank you, and I think the Dream thanks you too. The silverleaf certainly will.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some things ought to be woken, Malvor.", next = "BACK", reply = "Perhaps, but I'd rather the druids did the waking, and gently. I've seen what a startled sleeper does, and the druids sleep very deep.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They do, as surely as a hand pulls back from a flame. The plants of Felwood didn't have the choice, and look at them now, all twisted and glowing, which I think is why these ones remember to flinch." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They do, as surely as a hand pulls back from a flame, and you can watch them curl away from your demon this very moment. The plants of Felwood didn't have the choice, and look at them now, all twisted and glowing, which I think is why these ones remember to flinch." },
      },
      choices = {
        { text = "Then I'll stand back and let them grow.", next = "BACK", reply = "Thank you. I'll tell them it was your idea, and they'll grow a little straighter for it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Plants that flinch from power won't survive the world.", next = "BACK", reply = "They've survived ten thousand years, so I think they'll manage. Felwood didn't survive power, after all.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I ask myself that each season. They heal better than any herb in Kalimdor, and I hate to keep them from the wounded, but some of what grows near the Dream should never be crushed into a potion. So I sell what grows freely and leave the rest, and I'll trust the Circle to tell me if I'm wrong." } },
      choices = {
        { text = "Sell what heals. Hoarding medicine helps no one.", next = "BACK", reply = "You may be right, and I'll think on it again this season. I hate to keep healing from anyone who needs it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Keep the rarest ones here. Some things shouldn't leave the glade.", next = "BACK", reply = "That's what I lean toward too, most nights. The Dream gave them to us, and I'd not see them scattered carelessly.", fx = { align = { order = 1 } } },
        { text = "Something else, Malvor.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, among the herbs! You'll know better than I whether plants have spirits, since you speak with the elements, and I've wondered for years." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, here among the herbs. Do step carefully, because the plants of Moonglade grow so close to the Dream that I swear they notice when someone in armour walks past." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, among my herbs. Do step carefully, please, because the plants here dream, and I think heavy boots give them nightmares." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, among my herbs. You'll know the wild plants, I expect, the ones that grow by the trails, and you'll know which ones the beasts eat." },
        { id = "h_default", text = "I am Malvor, and I tend the herbs of Moonglade and teach those who wish to learn herbalism. Everything here grows a little differently, because the grove sits so close to the Dream." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, here among the herbs. Moonglade's plants grow so close to the Dream that some say they listen to prayers, so do keep yours gentle." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, among my herbs. You'll know your poisons, I expect, and I'm afraid Moonglade's plants are too sleepy and too gentle to give you any." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Do be careful casting near the herb beds, because the plants here dream, I think, and I'd hate to see what the arcane does to their dreams." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "The herbs pull away from you a little, can you see it? I don't think they mean any offence, because they're only very sensitive to fel." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, among the herbs. You'll feel it too, I think, how close the Dream lies to the soil here, and how the plants grow as if they're listening." },
      },
      again = {
        { id = "h_again", text = "Is there another herb on your mind, or something else entirely?" },
        { id = "h_again2", text = "Go on. I was only listening to the leaves." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "What grows differently here?", next = "grows" },
        { text = "I don't follow what you mean about the Dream.", next = "dream" },
        { text = "Do Moonglade's herbs really listen to prayers?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "There's no poison growing anywhere in Moonglade?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What would the arcane do to a dreaming plant?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do your herbs really shrink from me?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do the herbs here really dream?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the beasts of Moonglade eat your herbs?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Should Moonglade's herbs be sold to anyone who asks?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do the plants really notice who walks by?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you think the herbs here have spirits?", next = "xhsham", when = { class = "SHAMAN" } },
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
        { text = "It sounds dangerous, being so close.", next = "dream2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream2 = {
      lines = {
        { id = "dr2_default", text = "The Keeper doesn't seem to think so, and I trust him. But I've heard the druids speak quietly about sleepers who don't wake, and I don't ask them more than they want to say." },
      },
      choices = {
        { text = "Some mysteries are better left alone.", next = "BACK", reply = "Perhaps, and I'll not pry further than the druids want. I only water the herbs and keep my own dreams to myself.", fx = { align = { order = 1 }, trait = { cautious = 1 }, learn = { "malfurion" } } },
        { text = "If something's wrong, someone should find out.", next = "BACK", reply = "I've thought that too, more than once. If you find something out, I'd be glad to hear it.", fx = { align = { order = -1 }, trait = { curious = 1 }, learn = { "malfurion" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    malfurion = { { id = "tp_mal", text = "The Shan'do sleeps in the Dream, they say. I hope his dreams are gentler than mine." } },
    background = { { id = "tp_bg", text = "I tend the herbs of Nighthaven. I came to study them, and they've been studying me ever since." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The herbs here grow as though the Dream were just below the soil. I'm beginning to suspect it is." } },
    fel_moss = { { id = "tp_fel_moss", text = "Felwood's moss creeps toward the passes now and then, and I burn every patch I find. The glade will not have it." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw know the herbs of Felwood better than anyone alive. They've traded me seeds I couldn't find in any book." } },
    _none = { { id = "tp_none", text = "I don't know, but if you ask the plants, perhaps they'll tell you. They tell me things sometimes." } },
  },
}

-- Narianna: bowyer in Nighthaven.
P:NPC {
  key = "narianna", id = TODO_NPC("Narianna"), name = "Narianna", title = "Bowyer",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "practical", "dry" }, values = { "readiness", "honesty" },
  notices = { "class", "lock_steed" },
  impression = {
    first = "She sees no contradiction in selling bows in so peaceful a place.",
    third = "{name} met Narianna, the practical bowyer of Nighthaven.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Back again? Good. I've a yew stave I've been saving for someone who knows what they're doing, and you might." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Bows are on the wall. Prices are on the bows. That's the whole of the conversation, I think." },
    { id = "g_default", text = "Yes, a bowyer in a sanctuary. You aren't the first to look surprised, and you won't be the last." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Run out of arrows in Winterspring, did you?" },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Your beast won't need to hunt here, so let it rest while you shop." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Your horse has scorched three patches in the grass outside, and the druids will notice before you've finished shopping. Tie it on the far side of the hills, and I'll keep your bowstrings ready when you come back." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because Felwood's spirits are sick, and sick things don't always answer. I've heard tauren say they called to the earth there and got nothing back but a moan, so I'd carry something with an edge, just in case the elements are having a bad day." } },
      choices = {
        { text = "The spirits won't fail me. I trust them.", next = "BACK", reply = "Trust them, then, but trust a sharp blade too, in Felwood. The spirits there are sick, and sick things forget their friends.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Good advice. I'll carry a blade as well.", next = "BACK", reply = "Good, because I've seen too many come back without one, or not come back at all.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because it's peaceful here, and nowhere else is, and the travellers who leave have to cross Felwood to get home. I'd rather sell a bow to someone who never uses it than bury someone who needed one, and I've done more of the second than I'd like." } },
      choices = {
        { text = "A sensible choice. Peace needs protecting too.", next = "BACK", reply = "It does. The best bow I ever sold came back to me unstrung after a year, with a note saying it had never once been needed.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Weapons in a sanctuary? It seems a betrayal of the place.", next = "BACK", reply = "I'd agree, if the grove were all there was. But every traveller has to leave, and Felwood is waiting.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a satyr in Felwood will throw fel fire from the trees, and a warrior who has to run thirty paces to reach it arrives half-burnt. A bow won't make you a hunter, but it'll make the satyr come down to you." } },
      choices = {
        { text = "A warrior closes the distance and faces the enemy. No bow.", next = "BACK", reply = "Brave, and I'll admire it from here, warrior. Only don't come crying to me with your eyebrows burnt off.", fx = { align = { honor = 1 } } },
        { text = "A bow from cover suits me fine. Let them come to me.", next = "BACK", reply = "Good, then you've learned something already. The satyrs will curse you from the treetops, and you can smile and nock another.", fx = { align = { honor = -1 } } },
        { text = "Something else, Narianna.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Moonglade's wood, which grows slow and close to the Dream and doesn't warp in the cold, and that matters when you're on your way to Winterspring. I won't cut a living tree, so I use what the storms bring down, which is why I never have more than a dozen to sell." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Moonglade's wood, which doesn't warp in the cold, and {pet} deserves a hunter who doesn't miss, so take your time choosing. A good bow is a kindness to your beast as much as to you." },
      },
      choices = {
        { text = "A bow from fallen wood is the only honest kind.", next = "BACK", reply = "It is, and it shoots straighter too, I think, out of gratitude. Don't tell the druids I said that; they'll want to bless it.", fx = { align = { light = 1 } } },
        { text = "Living wood makes a better bow. I'd cut it myself.", next = "BACK", reply = "Then you'll cut it somewhere else, because nobody cuts a living tree in Moonglade. The Keeper would have something to say about that.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "A good prayer can mend the hole an arrow leaves, but it's a poor shield before it lands. Every traveller who leaves this grove meets furbolgs and worse on the road, so take a friend with a bow, if you won't take one yourself." } },
      choices = {
        { text = "I'll travel with friends and watch their backs.", next = "BACK", reply = "That's the wisest thing a priest has said to me all year. Keep them close, and keep your head below the ferns in Felwood.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll let others take the arrows first.", next = "BACK", reply = "Practical, I suppose, though your friends might not thank you for it. Still, I'd rather bury none of you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I sell to travellers, and what they do on the road is between them and whoever they meet there. Inside the grove nobody fights, and outside it the Deadwood and the Winterfall don't ask whether you're a rogue or a saint before they attack." } },
      choices = {
        { text = "My arrows are for honest fights, Narianna.", next = "BACK", reply = "Good, then we'll get along. I'll even throw in a spare string, since you asked so nicely.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Best not to ask, then. I won't tell.", next = "BACK", reply = "I wasn't going to, and you've made it easy. Just keep your arrows out of the grove.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Better is a strong word, and cheaper and quieter is fairer. The druids don't love the arcane flying around these hills, so a spell on the road out is fine, but in the grove you'll find a bow draws far fewer frowns." } },
      choices = {
        { text = "I'll respect the grove's ways while I'm here.", next = "BACK", reply = "Thank you. The druids will notice, and they'll take about a century to tell you so.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Frowns don't trouble me. I'll cast as I need.", next = "BACK", reply = "They might, though they won't say so to your face. Just keep it out of the grove.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They dislike anything that comes into the world from somewhere it shouldn't, and a demon fits that rather well. I'm a practical woman, so I'll say it plainly: keep your pets on the far side of the hills, and nobody here will trouble you." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They dislike anything that comes into the world from somewhere it shouldn't, and the one beside you came from very much somewhere it shouldn't. I'm a practical woman, so I'll say it plainly: send it back over the hills, and nobody here will trouble you." },
      },
      choices = {
        { text = "Then my little friend waits beyond the hills, sulking.", next = "BACK", reply = "Good. Sulking on the far side of the hills is the best place for it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "What's mine goes where I go. Practical, as you say.", next = "BACK", reply = "Practical, yes, but the druids may not see it that way. Keep it close and quiet, at least.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some do, and not a few. The Sentinels taught many of us before the Circle took us in, and a druid on the Felwood road who can shoot a satyr from a distance lives longer than one who can't. Your claws are good, but an arrow reaches further." } },
      choices = {
        { text = "A druid should fight with the land's gifts, not with bows.", next = "BACK", reply = "That's the Circle's view, and I've heard it from wiser druids than you. But the satyrs don't care about the land's gifts.", fx = { align = { order = 1 } } },
        { text = "Use whatever keeps you alive. The satyrs won't fight fair.", next = "BACK", reply = "Exactly, and that's why I keep the shop open. Take the yew; it's light enough for a cat to carry, if you ever wonder.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Narianna.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman. You'll not want a bow, I imagine, but a bow doesn't need the spirits' permission to fire, and that's worth remembering in Felwood." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. You'll not want a bow, I imagine, but the roads out of Moonglade run through Felwood and Winterspring, and a hammer doesn't reach very far." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. You'll want a bow for when your enemies keep their distance, I'd say, and don't look at me like that, because even a warrior has to reach sometimes." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Then you'll know a good bow when you see one, and you'll know these aren't the cheap ones they sell in the cities." },
        { id = "h_default", text = "I'm Narianna, and I sell bows, arrows and quivers here in Nighthaven. Nobody fights inside the grove, but everyone who comes here has to leave again, and the roads out are not so kind." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. You'll not want a bow, I imagine, but the roads out of Moonglade run through Felwood and Winterspring, and a prayer can't stop an arrow." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll want a bow for when the dagger doesn't reach, and I'll not ask what you're aiming at, so long as it's outside the grove." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, at a bowyer's stall. You'll be telling me a fireball does the same work as an arrow, I expect, and you'd be right, but my arrows don't run out of mana." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "I've nothing to sell you, since you've never drawn a bow, though the druids would sooner see you try than call up whatever you keep." },
        { id = "h_soft", when = { npcFlagBefore = "narianna_soft" },
          text = "Ah, the tauren who told me off. Come and look at the bows; I've been keeping a spare string aside for you, which I'll deny if anyone asks." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You've claws and moonfire, so you'll not need a bow, I suppose, but the roads out of Moonglade are cruel ones, and I'd still feel better if you carried something." },
      },
      again = {
        { id = "h_again", text = "What else? Ask, and then mind the roads out; Felwood has not been kind since the Legion came." },
        { id = "h_again2", text = "Go on, ask. A sanctuary is a good place for questions, if not for bows." },
      },
      choices = {
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "Isn't selling bows here a bit odd?", next = "odd" },
        { text = "This must be a crossroads for travellers.", next = "roads" },
        { text = "The Circle welcomes Horde druids here. Does that sit well with you?", next = "circle" },
        { text = "I'm a tauren druid. You look at me like an enemy.", next = "xtauren", when = { race = "Tauren" } },
        { text = "You fought in Ashenvale. Do you still?", next = "circle_ash", when = { race = "NightElf" } },
        { text = "Still angry at the tauren, Narianna?", next = "xsoft", when = { npcFlagBefore = "narianna_soft" } },
        { text = "A prayer's really no match for an arrow?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "You'd sell to a rogue, knowing what they'll do?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "An arrow's no better than a spell.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the druids really hate what I keep that much?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why would a warrior need a bow?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What makes your bows better than a city bowyer's?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do the Circle's druids ever take up the bow?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why sell bows in the most peaceful place in Kalimdor?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why would the spirits refuse me in Felwood?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What arrows would you take to Winterspring?", next = "hnt_arrows", when = { class = "HUNTER" } },
        { text = "Do the Sentinels still string bows the old way?", next = "kal_bows", when = { race = "NightElf" } },
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
        { text = "True peace starts with laying weapons down.", next = "BACK", reply = "Perhaps it does, and I hope I live to see it. Until then, I'll keep a bow on the counter.", fx = { align = { light = 1 } } },
        { text = "Peace is kept by those ready to fight for it.", next = "BACK", reply = "That's my view too. I stood watch in Ashenvale for two hundred years so that places like this could stay quiet.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle = {
      big = true,
      lines = {
        { id = "ci_default", key = true,
          text = "Not well, and I'll say so plainly, since nobody else in Nighthaven will. The Circle teaches its oldest secrets to tauren druids, who go home to Thunder Bluff and sit at the same fires as the Warchief's orcs, and those orcs are cutting Ashenvale down while we speak." },
        { id = "ci_horde", when = { faction = "Horde" },
          text = "Not well, and since you asked, I'll tell you to your face. The Circle shares its oldest secrets with Horde druids, and the Horde's axes are in Ashenvale tonight, so you'll forgive me if I don't call it wisdom." },
        { id = "ci_tauren", when = { race = "Tauren" },
          text = "Since you ask, no. I have nothing against your people, who have never put an axe to a tree that I know of, but you sit at the Warchief's fire, and the Warchief's orcs are cutting Ashenvale down while the Circle teaches you its secrets." },
      },
      choices = {
        { text = "Who decided to share the Circle with the Horde?", next = "circle_who" },
        { text = "The tauren aren't the Warsong. Don't blame them for orcs.", next = "BACK",
          reply = "I don't, quite, and that's what makes it hard. But a secret told to a tauren is a secret told to the Horde, whatever the tauren intends.",
          fx = { align = { light = 1 }, opinion = { cenarion_circle = "trust" } } },
        { text = "You're right. The Circle is too trusting by half.", next = "BACK",
          reply = "Say it louder at the moonwell, then, and see how many druids look at their feet. Half of them agree with us and won't say it before the Keeper.",
          fx = { affinity = 1, align = { light = -1 }, opinion = { cenarion_circle = "distrust" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle_who = {
      lines = {
        { id = "cw_default", text = "Shan'do Stormrage himself, when Hamuul Runetotem came asking to learn the old ways, and Keeper Remulos keeps faith with that choice. I won't speak against the Keeper, but I've noticed that it's the druids who share the secrets and the Sentinels who pay for them." },
      },
      choices = {
        { text = "Do the druids ever answer that?", next = "circle_answer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle_answer = {
      lines = {
        { id = "ca_default", text = "Loganaar says that a tauren who learns to feel the forest will never let an orc burn one, and that the Circle is planting seeds in the Horde. It's a pretty idea, and I'll believe it the day I see a tauren druid standing between a Warsong axe and an ancient." },
      },
      choices = {
        { text = "Give the seeds time to grow.", next = "BACK", reply = "Time is the one thing my people have plenty of, I'm told. Ashenvale's trees don't, which is rather my point." },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle_ash = {
      lines = {
        { id = "cas_default", text = "Two hundred years I stood watch there, and the last eight of them against the orcs. I put down my bow for Moonglade because I was tired, not because I'd changed my mind, and every Horde druid who walks past this stall reminds me of the difference." },
      },
      choices = {
        { text = "Moonglade asks you to set Ashenvale aside here.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      lines = {
        { id = "xt_default", text = "Not like an enemy, exactly, more like someone I'd have had to watch in Ashenvale. I stood watch there for two hundred years, and I can't unlearn which side of a camp a person comes from just because the Keeper says the grass is neutral." },
      },
      choices = {
        { text = "Then watch me. I'll give you nothing to find.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your war isn't my war, and never has been.", next = "BACK", reply = "Perhaps not, but your Warchief's war is in my forest, and you share his banner. I'll sell you a bow, but don't ask me to like it.", fx = { align = { honor = -1 } } },
        { text = "I've never set foot in Ashenvale. Judge me, not the Warsong.", tag = "Persuade", next = "xtauren_soft",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "DRUID" }, { reputation = { faction = "Cenarion Circle", min = "honored" } } } } },
          fail = { next = "xtauren_fail", fx = { affinity = -1 } } },
      },
    },
    xtauren_soft = {
      lines = {
        { id = "xts_default", key = true, fx = { npcFlag = { set = { "narianna_soft" } } },
          text = "That's fair, and it stings to hear it from someone who walks the Circle's path as gently as you do. Very well: I'll keep my anger for the axes in Ashenvale and not for you, and if Loganaar hears of this, I'll never hear the end of it." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren_fail = {
      lines = {
        { id = "xtf_default", text = "A fine speech, and I've heard it from Horde envoys who came to Astranaar under a white flag. Come back when the Circle speaks for you, and I'll listen more kindly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Farewell, Narianna.", next = "END" },
      },
    },
    xsoft = {
      lines = {
        { id = "xso_default", text = "At the tauren, no, and you're to blame for that. At the Warsong, every day, but I've stopped taking it out on whoever happens to be standing at my stall." },
      },
      choices = {
        { text = "That's progress, Narianna.", next = "BACK", fx = { affinity = 1 } },
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
    hnt_arrows = {
      lines = { { id = "har_d", text = "Heavy ones, because the cold makes the light arrows flutter, and plenty of them, because the yeti up there take more than one. Wax your string before you leave and again at Everlook, or you'll hear it crack on the first frosty morning." } },
      choices = { { text = "Heavy arrows and wax. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    kal_bows = {
      lines = { { id = "kbo_d", text = "Some do, the old ones who learned before the Sundering, with sinew and moonwell-soaked yew, and they look down their noses at anything else. The younger Sentinels buy whatever shoots straight, and I don't blame them, because a war on two borders doesn't leave time for a hundred-year apprenticeship." } },
      choices = {
        { text = "The old ways are worth keeping.", next = "BACK", reply = "They are, and I keep a few old bows in the back for anyone who asks properly.", fx = { align = { order = 1 } } },
        { text = "A bow that shoots straight is all a soldier needs.", next = "BACK", reply = "Spoken like a Sentinel on the Warsong border, and I'll sell you one gladly.", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell bows in Nighthaven. I used to be a Sentinel, and I still like to see people leave well armed." } },
    advice = { { id = "tp_ad", text = "In Felwood, don't drink from anything green. You'll thank me." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle keeps the grove at peace, and I'm grateful. I'm less grateful that it teaches the Horde's druids everything we know.", next = "circle" } },
    thrall = { { id = "tp_thrall", text = "I fought orcs in Ashenvale when I was a Sentinel, and I don't forget the faces. Here, they're guests, and I sell them bows." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw use short bows, rough-cut but true. I've traded with them, and I'd trust their aim over mine." } },
    centaur = { { id = "tp_centaur", text = "Centaur bows are strong, I hear, and their archers stronger. I'd rather not find out from the wrong end." } },
    _none = { { id = "tp_none", text = "I don't know. I sell bows, as my mother did in Ashenvale before the Sundering, and that's my whole wisdom." } },
  },
}

---------------------------------------------------------------------------
-- Dargon
---------------------------------------------------------------------------
P:NPC {
  key = "dargon", id = TODO_NPC("Dargon"), name = "Dargon", title = "Food & Drink Merchant",
  bible = "bibles/unsung.md", role = "vendor", tier = "service", gender = "male",
  communities = { "nighthaven" }, temper = { "unhurried", "even-handed" }, values = { "hospitality", "balance" },
  notices = { "race", "class" },

  impression = {
    first = "Dargon sells food and drink at the inn in Nighthaven and serves a tauren and a night elf from the same pot without remark. He is unhurried, and he seems to regard a shared table as part of the Circle's work.",
    third = "{name} met Dargon, who sells food and drink at the Nighthaven inn.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Be welcome, friend. Sit near me tonight, if you like. The room has no sides, but it does have good company." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Sit where you like. No one here has a side of the room, though some folk make themselves hard to sit beside." },
    { id = "g_hello", text = "Be welcome in Nighthaven. Sit where you like; nobody here has a side of the room." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the Glade. The same table is free, if you were fond of it." },
    { id = "g_druid", when = { class = "DRUID" }, text = "A druid of the Circle. You will be hungry, then; the walk from the barrow dens always does it." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the plains. I keep a grain porridge your people ask for, though I am told I still make it too thin." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "One of the kaldorei. There is moonberry juice from Teldrassil in the cool jar, and I shall not tell you what I paid the hippogryph master to carry it." },
    { id = "n_other", cat = "race", when = { race = { "Human", "Dwarf", "Gnome", "Orc", "Troll", "Scourge" } },
      text = "You are neither tauren nor elf, and yet you have found your way to Moonglade. Then someone here thought you worth the road. That is enough for my table." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dargon, and I keep the inn's table in Nighthaven. Druids come to the Glade from Darnassus and from Thunder Bluff, and here they eat the same bread. I only see to it that there is bread." },
        { id = "h_druid", when = { class = "DRUID" }, text = "You are of the Circle, so this is your house as much as mine. Eat, and then go and pay your respects to Keeper Remulos, if you have not. He notices who comes." },
      },
      again = {
        { id = "h_again", text = "What else? There is no hurry in the Glade." },
        { id = "h_again2", text = "Ask. The pot will mind itself a while." },
        { id = "h_again3", text = "Something more? Sit, at least, while you ask it." },
      },
      choices = {
        { text = "Let me see your food and drink.", next = "BUSINESS" },
        { text = "Tauren and elves at one table. Is it always so easy?", next = "table" },
        { text = "Who comes through Nighthaven?", next = "comes" },
        { text = "What do you cook for two such different peoples?", next = "cook" },
        { text = "My kin in Darnassus would not sit so easily.", next = "xnelf", when = { race = "NightElf" } },
        { text = "In Thunder Bluff they still speak warily of elves.", next = "xtauren", when = { race = "Tauren" } },
        { text = "I'm no druid. Am I truly welcome here?", next = "xother", when = { race = { "Human", "Dwarf", "Gnome", "Orc", "Troll", "Scourge" } } },
        { text = "Has anyone ever started a fight at your table?", next = "w_fight" },
        { text = "Peace on your house, Dargon.", next = "END" },
      },
    },
    table = {
      lines = {
        { id = "table_default", text = "Not always, and never by accident. When the first tauren druids came, the two peoples sat at opposite walls and I carried bowls between them like an envoy. It was a season before one of each reached for the same loaf. I remember which loaf." },
      },
      choices = {
        { text = "What changed?", next = "table2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    table2 = {
      lines = {
        { id = "table2_default", text = "Loganaar set them to learn together, and it is hard to stay a stranger to someone who has watched you fail to become a bear. They laughed at each other, and after that at themselves. I have always held that a shared meal makes peace. I now think a shared embarrassment does it faster." },
      },
      choices = {
        { text = "If it can be done here, it can be done elsewhere.", next = "BACK", reply = "I should like to believe so. The Glade is small, but so is a seed.", fx = { align = { light = 1 } } },
        { text = "Moonglade is one valley. The war won't notice.", next = "BACK", reply = "Perhaps not. And yet the druids who eat here go home, and carry the taste with them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    comes = {
      lines = {
        { id = "comes_default", text = "Druids, first and last, of both peoples, come to learn from Loganaar or to answer Rabine Saturna's summons. Those the Circle sends on errands to Felwood and Winterspring, who arrive looking as if they had been dragged. And now and then a stranger whom the Timbermaw have let through their tunnel." },
      },
      choices = {
        { text = "What do the ones from Felwood say?", next = "comes2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    comes2 = {
      lines = {
        { id = "comes2_default", text = "Little, until they have eaten. Then that the forest there is rotting where it stands, and that the Circle's people at the Emerald Sanctuary are too few. I listen, and I fill the bowl again. Dendrite Starblaze hears them properly afterward, and he is the one who can act on it." },
      },
      choices = {
        { text = "A bowl first, then the telling. Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    cook = {
      lines = {
        { id = "cook_default", text = "What the Glade gives, cooked plainly. My'lanna brings fruit and bread across the water, and I do the hot dishes. The tauren want grain and roots and are polite about fish. The elves want fish and are polite about roots. I serve both to both, and politeness does the rest." },
      },
      choices = {
        { text = "No meat?", next = "cook2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cook2 = {
      lines = {
        { id = "cook2_default", text = "Rarely, and never hunted inside the Glade; Keeper Remulos would not have it, and nor would I. What comes in from outside, taken properly, I will cook. The tauren say a blessing over it that I have learned by heart. I say it now myself, when nobody is by." },
      },
      choices = {
        { text = "A good custom is worth borrowing.", next = "BACK", reply = "So I thought. They did not seem to mind my having it.", fx = { align = { order = -1 } } },
        { text = "Each people should keep to its own rites.", next = "BACK", reply = "Perhaps. But the stag, I think, does not ask who is thanking it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "No, and I do not blame them. Ten thousand years is a long time to believe one is the forest's only friend. I believed it. Then a tauren twice my height thanked my soup pot, quite seriously, for its service. One cannot go on feeling superior after that." },
      },
      choices = {
        { text = "I'll carry that tale home. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xtauren = {
      lines = {
        { id = "xtauren_default", text = "They have cause. We were not gracious, when your people first came to the Circle, and some of us are not yet. I can only say that at this table you are a druid and a guest before you are anything else, and that Bunthen Plainswind will tell you the same has held for him." },
      },
      choices = {
        { text = "Then I will sit, and be both. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xother = {
      lines = {
        { id = "xother_default", text = "You are standing in Nighthaven with your head still on, so someone has judged you so. The Wardens do not let harm past the lake. Eat, keep your blade sheathed, and speak quietly near the moonwell. That is all the Glade asks of anyone." },
      },
      choices = {
        { text = "Sheathed and quiet. Easily done. Something else.", next = "BACK" },
      },
    },
    w_fight = {
      lines = {
        { id = "w_fight_default", text = "Once, a dwarf and an orc over the last loaf, and they both stood up at the same moment, and I simply took the loaf and cut it in half and set the halves in front of them. Neither of them could think what to do next, so they sat down and ate." },
      },
      choices = {
        { text = "That simple?", next = "w_fight2" },
        { text = "Clever.", next = "w_fight2" },
      },
    },
    w_fight2 = {
      lines = {
        { id = "w_fight2_default", text = "Mostly that simple. People rarely fight over bread; they fight over who was disrespected. If you take the bread out of it, the rest often falls away. The orc came back the next year and asked for the dwarf, by name. They had been writing to each other." },
        { id = "w_fight2_w1", when = { race = "Dwarf" }, text = "One of your people, yes. If you are going to Ironforge, ask for a dwarf who eats with orcs. I believe he is quite famous now." },
      },
      choices = {
        { text = "Bread can make peace.", next = "BACK", fx = { align = { order = 1 } }, reply = "Bread and a quiet host. I like to think the Keeper helps a little." },
        { text = "They should have settled it outside.", next = "BACK", fx = { align = { order = -1 } }, reply = "Then they would have been carried out, and not written letters." },
        { text = "Something else, Dargon.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I keep the inn's table in Nighthaven. Elf and tauren eat from the same pot here, and I see that it is full." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The Circle is the one house I know where both peoples sit down together. I am proud to lay its table." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw keep the tunnel, and they let through whom they please. Those who arrive that way are always hungry and seldom talkative." } },
    advice = { { id = "tp_advice", text = "In the Glade, keep your weapon sheathed and your voice low. Everything else is forgiven." } },
    _none = { { id = "tp_none", text = "That is beyond my table. Ask Dendrite Starblaze; most of the Glade's news passes through his hands." } },
  },
}
