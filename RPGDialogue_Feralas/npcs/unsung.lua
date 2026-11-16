-- Feralas folk with nothing to say until now: Feathermoon's hippogryph master and trader, and Camp Mojache's trainers and trader. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "fyldren", id = TODO_NPC("Fyldren Moonfeather"), name = "Fyldren Moonfeather",
  title = "Hippogryph Master",
  bible = "bibles/unsung.md", role = "flightmaster", tier = "service",
  communities = { "feathermoon" }, temper = { "calm", "watchful" }, values = { "loyal", "dutiful" },
  notices = { "race", "form" },

  impression = {
    first = "Fyldren Moonfeather keeps the hippogryphs of Feathermoon and speaks to them more gently than to any visitor. The birds are the isle's only quick road to the rest of Kalimdor, and Fyldren guards that road closely.",
    third = "{name} met Fyldren Moonfeather, the hippogryph master of Feathermoon Stronghold.",
  },

  greetings = {
    { id = "g_roost", text = "The hippogryphs are rested and the winds are fair. Where would you fly?" },
    { id = "g_back", when = { metBefore = true }, text = "You've returned to the isle. The birds remember you, and so do I." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah. It's good to see one of our own come so far south; most of our people never leave Teldrassil's shade now." },
    { id = "n_flight", cat = "form", when = { form = { "travel", "aquatic" } },
      text = "You came across the water in another shape, I see. The hippogryphs know a druid when they see one; they'll carry you all the same." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "They do, I think, for Feralas is wetter and the winds off the sea are rough. Still, they carry our letters and our wounded across the water, and the stronghold would wither without them." } },
      choices = {
        { text = "Then they serve the stronghold, and that is enough.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "They should fly free, not carry our letters.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Fyldren Moonfeather, and I keep the hippogryphs of Feathermoon. The isle is cut off from the mainland by water and the coast is thick with naga, so my birds are the stronghold's surest link to the rest of our lands." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You stand on a Sentinel isle, stranger, and you will find no mount here. Your people keep wind riders at Camp Mojache, to the east past the ogres, and I would go there quickly." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "Ah, a druid of the Circle. My hippogryphs can always tell your kind from the others, and they sit calmer for it, though I couldn't tell you why." },
      },
      again = {
        { id = "h_again", text = "Would you ask more of the roost, or of the isle?" },
        { id = "h_again2", text = "The birds can wait a little longer; what else is on your mind?" },
      },
      choices = {
        { text = "Do your birds miss the forests of Ashenvale?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me where I can fly.", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "Why build a stronghold on an island?", next = "island" },
        { text = "How do you keep the birds in this damp?", next = "birds" },
        { text = "Do the wild hippogryphs here trouble you?", next = "wild" },
        { text = "I've never ridden a hippogryph before.", next = "first", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Farewell.", next = "END" },
      },
    },
    island = {
      lines = {
        { id = "i_default", text = "Because the water is a wall the ogres cannot climb. The General chose Sardor Isle for the same reason a hunter chooses high ground, and the naga are the only ones who can reach us easily, which is why the archers watch the shore." },
      },
      choices = {
        { text = "The naga come right up to the isle?", next = "island_naga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    island_naga = {
      lines = {
        { id = "in_default", text = "They come out of the sea to the old ruins along the coast and call them theirs. My birds see them from above on every flight, more each season, and I tell General Feathermoon everything they see." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    birds = {
      lines = {
        { id = "b_default", text = "With care and patience, and with fish, which they love more than their own young. The damp gets into their feathers and makes them slow, so I brush them after every flight and keep them close to the fires at night." },
      },
      choices = {
        { text = "You clearly love them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wild = {
      lines = {
        { id = "w_default", text = "The Frayfeather flocks in the hills are wild, and they've grown fierce and wary of everyone. I wish no harm on them, but I'll not pretend they're tame, and travelers who wander too near their nests learn that quickly." },
      },
      choices = {
        { text = "They should be left alone.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "If they attack travelers, they should be culled.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = {
        { id = "f_default", text = "Then hold the harness, not the feathers, and lean with the bird rather than against it. They are gentler than they look, friend, and smarter than most of my passengers, and they will not let you fall." },
      },
      choices = {
        { text = "I'll trust the bird, then.", next = "BUSINESS", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I tended the hippogryphs in Ashenvale before I came south with the Sentinels. Their wings carried us here, and they'll carry us home." } },
    advice = { { id = "tp_ad", text = "Fly over the water, never over the hills. The ogres throw rocks at anything they see." } },
    _none = { { id = "tp_none", text = "I could not say. Ask the General's people; they hear more of the mainland than I do." } },
  },
}

P:NPC {
  key = "vivianna", id = TODO_NPC("Vivianna"), name = "Vivianna",
  title = "Trade Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "feathermoon" }, temper = { "gentle", "precise" }, values = { "practical", "loyal" },
  notices = { "craft" },

  impression = {
    first = "Vivianna keeps Feathermoon stocked with thread, salt and dye, and counts every bolt that comes off the boats. She speaks softly, but nothing on her shelves goes unrecorded.",
    third = "{name} met Vivianna, who sells trade supplies at Feathermoon Stronghold.",
  },

  greetings = {
    { id = "g_shop", text = "Thread, salt, dyes and flux, if the boats came in on time. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to Feathermoon. Your craft is going well, I hope?" },
  },

  notice = {
    { id = "n_crafter", cat = "craft", when = { profession = { "Tailoring", "Leatherworking" } },
      text = "You've the hands of someone who works cloth or leather; I can tell from the needle marks. Feralas is rich in both, if you're willing to walk among the yetis and the bears to find them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Vivianna, and I keep the stronghold's trade goods. Everything the Sentinels mend their cloaks and armor with comes across the water to me first, and I make sure none of it goes to waste." },
      },
      again = {
        { id = "h_again", text = "Is there anything else you need from the stores?" },
        { id = "h_again2", text = "Ask, and I'll answer as best I can." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "How do goods reach the isle?", next = "boats" },
        { text = "What does Feralas offer a crafter?", next = "feralas" },
        { text = "Do the Sentinels need anything I could bring?", next = "need" },
        { text = "Goodbye.", next = "END" },
      },
    },
    boats = {
      lines = {
        { id = "b_default", text = "By boat from the mainland coast, and by hippogryph when it's light enough to carry. Fyldren grumbles every time I ask to load a bird with salt, but salt is lighter than arrows, and the archers need both." },
      },
      choices = {
        { text = "Does the supply ever run short?", next = "boats_short" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boats_short = {
      lines = {
        { id = "bs_default", text = "When the naga are bold on the coast, the boats wait, and so does everything else. Last season we went a month without dye, and the Sentinels wore their cloaks faded until the boats came back." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    feralas = {
      lines = {
        { id = "f_default", text = "Thick hides from the ironfur bears, heavy fur from the yetis in the hills, and cloth from the ogres and the gnolls, if you take it from them. The forest is generous, friend, but it doesn't give anything away freely." },
      },
      choices = {
        { text = "Where do the yetis live?", next = "feralas_yetis" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feralas_yetis = {
      lines = {
        { id = "fy_default", text = "In caves in the hills, where it's cooler, and they don't welcome visitors. The Rage Scar yetis are well named, friend, so walk softly if you go looking for them." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    need = {
      lines = {
        { id = "n_default", text = "Always, friend. Bring cloth you've taken from the ogres and hides you've skinned yourself, and sell them to the merchants, and some of it finds its way to the Sentinels in the end. Every little bit makes the next month easier." },
      },
      choices = {
        { text = "I'm glad to help the Sentinels.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll sell where the price is best.", next = "BACK", fx = { align = { order = -1 }, trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I traded goods in Auberdine before I came here. It's quieter, and the wind smells of the sea instead of fish." } },
    advice = { { id = "tp_ad", text = "Always carry a spare spool of thread. A torn cloak in the rain is a miserable thing." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, friend. Ask Shandris's people; they hear everything." } },
  },
}

P:NPC {
  key = "ruw", id = TODO_NPC("Ruw"), name = "Ruw",
  title = "Herbalism Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "mojache" }, temper = { "slow", "warm" }, values = { "wise", "kind" },
  notices = { "craft", "race" },

  impression = {
    first = "Ruw teaches herbalism at Camp Mojache and speaks of every plant as a gift from the Earth Mother. The lessons come slowly and patiently, the way roots grow.",
    third = "{name} met Ruw, the herbalism trainer of Camp Mojache.",
  },

  greetings = {
    { id = "g_camp", text = "The Earth Mother's gardens are wide here, little one. Come and learn their names." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to learn more. The plants are glad of it, and so am I." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "Your hands smell of Sungrass, little one; you've been picking along the roads. Gently, always gently, and leave a little root for next year." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Ah, one of the shu'halo, come so far from Mulgore. The grass here is taller than at home and the trees taller still, but the Earth Mother speaks the same way." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Less than it did, because the Gordunni strip the groves near their camps and the Grimtotem take whatever they please. I've seen whole hillsides of herbs pulled up by the roots, and they won't grow back for years." } },
      choices = {
        { text = "Then the Grimtotem must answer for it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let the land rest. Anger won't regrow a single root.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Ruw, and I teach the gathering of herbs at Camp Mojache. Feralas is old and green and full of things the Earth Mother grew long before any of us came here, and I can teach you how to take them without harming the land." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Then you know already what I teach the others, that the Earth Mother gives freely only to those who take with care." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The herbs of Feralas grow under spirits older than ours, and you'll feel them if you walk softly." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "You are a priest, and the herbs of Feralas will help your healing as much as any prayer. Come and learn the leaves before you need them." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. Some of the herbs here drink in old magic, from the elves who walked these woods, and you may feel it more than I do." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "There is a shadow on you, and the plants know it before I do, I think, for they wilt a little where you stand. I will still teach you, if you will learn gently." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You know already how to walk without crushing the grass, which is the first lesson I teach. Some of my students take weeks to learn it." },
      },
      again = {
        { id = "h_again", text = "What else would you know, little one?" },
        { id = "h_again2", text = "Speak; I am listening, as the grass listens to the wind." },
      },
      choices = {
        { text = "Does the forest here still give freely, Ruw?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Whose spirits are older than ours here, Ruw?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the herbs here hold any magic of their own?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Is anyone taking more from this forest than they should?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Teach me what you can.", next = "BUSINESS" },
        { text = "What grows in Feralas?", next = "grows" },
        { text = "How do you take without harming the land?", next = "harm" },
        { text = "Is the forest safe for gathering?", next = "safe" },
        { text = "Farewell.", next = "END" },
      },
    },
    grows = {
      lines = {
        { id = "g_default", text = "Sungrass in the open places where the light reaches the ground, and Goldthorn on the hillsides, which pricks the careless. There are rarer things deeper in the forest, near the old elven ruins, though the ogres there do not care for gatherers." },
      },
      choices = {
        { text = "The elven ruins?", next = "grows_ruins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grows_ruins = {
      lines = {
        { id = "gr_default", text = "A great city of the night elves stood there long ago, and the ogres have made a home in its bones. Old magic seeps into the ground around it, and some plants grow strangely there, so I would not eat anything I found near its walls." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    harm = {
      lines = {
        { id = "h_harm", text = "Take the leaf and the flower, but leave a portion of the root, so the plant can grow again. Never strip a hillside bare, and thank the Earth Mother when you go, because she notices those who do not." },
      },
      choices = {
        { text = "That's a good way to live.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "The land will grow back regardless.", next = "BACK", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = {
        { id = "s_default", text = "Nothing in Feralas is safe, little one. The Woodpaw gnolls roam the south and the Gordunni ogres hold the hills, so keep your eyes up when your hands are down." },
      },
      choices = {
        { text = "Where do the ogres keep to?", next = "safe_ogres" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_ogres = {
      lines = {
        { id = "sg_default", text = "Around the old elven city to the north of camp, and in the hills beyond it. They are strong and not as foolish as they look, so gather in their country only with a friend watching your back." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Some do, near the old ruins especially, where the night elves' magic soaked into the soil long ago. I gather those slowly and with a prayer, because I do not know what they remember." } },
      choices = {
        { text = "Then I'll gather them with care, as you do.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Magic in the soil is power. I'd take all I can.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "The ogres trample, the gnolls burn, and some traders come through who pull whole plants up by the roots to sell them. I cannot stop them all, but I tell the elders, and the elders tell the braves." } },
      choices = {
        { text = "I'll watch for them and bring word to the elders.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll deal with them myself. The elders are too slow.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The night elves walked these forests long before the tauren came, and their old cities lie broken among the trees, at Dire Maul and elsewhere. The spirits there remember them, and I think some remember them unkindly, so I gather carefully." } },
      choices = {
        { text = "Then we tread with respect, and take only what's needed.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Old grudges aren't ours. We take what the forest offers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I gathered herbs in Mulgore since I was a calf. Feralas called to me with its old green, and I came." } },
    advice = { { id = "tp_ad", text = "Leave a little root, little one. Always leave a little root." } },
    _none = { { id = "tp_none", text = "I do not know that, little one. The grass does not tell me everything." } },
  },
}

P:NPC {
  key = "kulleg", id = TODO_NPC("Kulleg Stonehorn"), name = "Kulleg Stonehorn",
  title = "Skinning Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "mojache" }, temper = { "blunt", "steady" }, values = { "practical", "honest" },
  notices = { "craft", "pet" },

  impression = {
    first = "Kulleg Stonehorn teaches skinning at Camp Mojache and has no patience for waste. He believes a beast's death must be made worth something, and says so plainly.",
    third = "{name} met Kulleg Stonehorn, the skinning trainer of Camp Mojache.",
  },

  greetings = {
    { id = "g_camp", text = "You want to learn the knife, then watch me first and cut second." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Let me see if your cuts have improved." },
  },

  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "Your knife's been busy, I can see the stains. Wipe it after each cut, or the blade rusts and the next skin tears." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "beast" } },
      text = "Your companion watches my knife very closely. Tell it not to worry; I only skin what's already dead." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kulleg Stonehorn. I teach skinning here, and I teach it the old way: when a beast dies, you take everything it can give, and you waste nothing, because a waste dishonors the hunt." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll know the hunt is sacred, so you'll understand why I'm hard on anyone who wastes a skin." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. When a hunt goes badly it's your sort who closes the wounds, and I respect that, because it means you know what a kill costs." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. Mind what your fire does to a hide, because a scorched pelt is a waste, and I don't teach waste." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. Your demons kill and leave the meat to rot, and that dishonors the hunt, so if you want my teaching, you'll skin what they kill." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You've quick hands and a sharp knife, I'd wager. Use them on a hide properly and you'll make a skinner, and I've no use for any other trick." },
      },
      again = {
        { id = "h_again", text = "What else? Speak plainly." },
        { id = "h_again2", text = "Ask. I'm listening." },
      },
      choices = {
        { text = "Teach me what you can.", next = "BUSINESS" },
        { text = "What beasts are worth skinning here?", next = "beasts" },
        { text = "Why does waste dishonor the hunt?", next = "waste" },
        { text = "Is skinning a cruel trade?", next = "cruel" },
        { text = "I'm a hunter. Any advice for me?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Do the spirits punish waste, Kulleg?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do spellcasters waste more of the hunt than warriors?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who's been hunting the Mojache grounds without leave?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Farewell.", next = "END" },
      },
    },
    beasts = {
      lines = {
        { id = "b_default", text = "The ironfur bears have the thickest hides in Feralas, and the yetis in the hills have fur that leatherworkers fight over. The wolves and the cats are common, but they're good practice for a young knife." },
      },
      choices = {
        { text = "Where do I find the bears?", next = "beasts_bears" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_bears = {
      lines = {
        { id = "bb_default", text = "Everywhere the forest is thick, and they find you before you find them. Bring a friend and a sharp blade, and don't run, because a bear runs faster than you ever will." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    waste = {
      lines = {
        { id = "w_default", text = "Because the beast gave its life, whether it wanted to or not. If you take its hide and leave its meat to rot, you've taken without thanks, and the Earth Mother remembers that, even if the beast doesn't." },
      },
      choices = {
        { text = "I'll use everything I can.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I take what's worth the gold.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cruel = {
      lines = {
        { id = "c_default", text = "Killing is cruel, sometimes; skinning is only what comes after. The beast feels nothing by then, and its hide keeps someone warm through a winter, which is more than it would do rotting in the grass." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = {
        { id = "h_hunter", text = "Kill clean, with one arrow if you can, and the hide comes away whole. A beast full of holes is a beast you've wasted, and your companion should never be the one doing the killing if you mean to skin it." },
      },
      choices = {
        { text = "A clean kill. I'll remember.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Some do, because fire takes the hide and frost spoils the meat, and they never stop to look at what they've ruined. A careful caster wastes less than a careless warrior, though, so it's the hand I judge and not the spell." } },
      choices = {
        { text = "Then I'll kill cleanly and take only what I use.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A kill is a kill. I don't stop to skin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "The Woodpaw, mostly, and a few strangers who leave carcasses half skinned on the trails. I'd like to know who they are, and I'd like them to answer to the camp for it." } },
      choices = {
        { text = "I'll find them and bring them before the camp.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll find them, and they won't hunt again.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not with lightning, if that's what you're asking, but a hunter who wastes the beast finds the next one harder to track. The Woodpaw gnolls waste everything they kill, and you'll notice how the forest treats them." } },
      choices = {
        { text = "Honor the hunt, and take everything the beast can give.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The spirits don't count skins. Take what's useful and move on.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "My father taught me the knife in Mulgore, and his father taught him. I came here because the beasts are bigger." } },
    advice = { { id = "tp_ad", text = "Keep your knife sharp. A dull knife tears, and a torn hide is worth nothing." } },
    _none = { { id = "tp_none", text = "I don't know. I know knives and hides, not that." } },
  },
}

P:NPC {
  key = "sheendra", id = TODO_NPC("Sheendra Tallgrass"), name = "Sheendra Tallgrass",
  title = "Trade Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "mojache" }, temper = { "friendly", "practical" }, values = { "practical", "kind" },
  notices = { "craft", "race" },

  impression = {
    first = "Sheendra Tallgrass sells trade supplies at Camp Mojache and keeps a sharp eye on every caravan that comes in. She talks of the long road from Thunder Bluff the way others talk of old enemies.",
    third = "{name} met Sheendra Tallgrass, who sells trade supplies at Camp Mojache.",
  },

  greetings = {
    { id = "g_camp", text = "Welcome to Mojache. Thread, salt and dyes, if the caravan made it through." },
    { id = "g_back", when = { metBefore = true }, text = "You return! The caravan came in yesterday, so the shelves are full." },
  },

  notice = {
    { id = "n_crafter", cat = "craft", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing" } },
      text = "A crafter, good; I sell more to you than to anyone else. The hides in Feralas are fine, and the ogre cloth is better than you'd think, once you wash it." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, so far from Durotar! The jungle must seem strange after the desert, but you'll grow used to the rain, as we all have." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Sheendra Tallgrass, and I keep the camp's trade goods. Everything comes the long way from Thunder Bluff, by kodo through Thousand Needles, so I count every spool twice and charge a little more than you'd like." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! If you could ask the spirits to keep the kodo caravans dry through Thousand Needles, I'd stop charging extra for damp thread." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Bless my caravans if you've a mind to, because every one that arrives whole feels like an answered prayer." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage! I don't suppose you can conjure thread? No, I didn't think so, so you'll pay what everyone pays." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. I'll sell to you like anyone else, but I'll count my spools after you leave, and I hope you won't take that personally." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You've the look of someone who knows what a spool weighs without picking it up. I count twice for a reason, so let's both keep that in mind." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Ask what you like; I'm only counting." },
      },
      choices = {
        { text = "Is the road from Thunder Bluff really that dangerous, Sheendra?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What threatens the caravans on the road here?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Do your goods ever go missing before they reach you?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "How do the caravans get through?", next = "caravans" },
        { text = "What's Camp Mojache for, out here?", next = "camp" },
        { text = "Who else trades here?", next = "trade" },
        { text = "Goodbye.", next = "END" },
      },
    },
    caravans = {
      lines = {
        { id = "c_default", text = "Slowly, and with guards, because the road through the Needles is steep and the centaur watch it. Once they reach Feralas, the gnolls and the ogres have their turn, so every caravan that arrives whole is a small miracle." },
      },
      choices = {
        { text = "Do they ever fail to arrive?", next = "caravans_fail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caravans_fail = {
      lines = {
        { id = "cf_default", text = "Twice since I've been here, and both times I went without dye for a month and the warriors went without new leather. The camp makes do, but making do gets very tiresome." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    camp = {
      lines = {
        { id = "cm_default", text = "To hold a place for the Horde in Feralas, so the Alliance on their island don't have the forest to themselves. And to watch the ogres in the old elven city, because whatever they're doing there is no good for anyone." },
      },
      choices = {
        { text = "The Horde has every right to be here.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "The night elves were here first.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = {
        { id = "t_default", text = "Hunters bring hides, the warriors bring cloth from the ogres they've fought, and goblins come through now and again with goods from Gadgetzan. We take what comes, and we're glad of it." },
      },
      choices = {
        { text = "Goblins come all this way?", next = "trade_gnolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_gnolls = {
      lines = {
        { id = "tg_default", text = "Goblins go anywhere there's a coin to be made, friend, and a camp at the edge of the world pays well for anything new. I haggle hard with them, and they respect me for it, or at least they pretend to." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Centaur in the Needles, the Grimtotem watching from their pinnacle, and ogres once the road reaches Feralas. A spellcaster riding alongside would do more good than another spear, and the drivers would sleep easier for it." } },
      choices = {
        { text = "I'll ride with the next caravan, then.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Caravans are traders' business. I have my own.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Now and then a bolt of cloth comes up short, and the drivers swear it was the centaur, though centaur don't steal half a bolt. I have my suspicions, and I've kept them to myself so far." } },
      choices = {
        { text = "Tell the camp. Thieves should answer for it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let it go. Drivers need a little extra too.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Long and wet and full of centaur, and the Grimtotem watch from their pinnacle the whole way through the Needles. Every caravan that arrives whole is a small miracle, and I don't trust miracles, so I count the spools twice." } },
      choices = {
        { text = "Then the caravans need better guards, sent by the bluff.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then trade with whoever's closer, and forget the long road.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I traded in Thunder Bluff before I came here. The work's harder, but the people are kinder." } },
    advice = { { id = "tp_ad", text = "Never leave your goods unwatched at night. The gnolls steal anything that isn't tied down." } },
    _none = { { id = "tp_none", text = "That's beyond my shelves, friend. Hadoken hears more of the forest than I do, so ask him." } },
  },
}
