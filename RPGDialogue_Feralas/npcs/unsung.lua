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
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They'll carry you, because the Alliance asks it of them, but they'll not like it, and neither will I. Keep your demon on the ground and your hands still on the saddle, and we'll both get through the flight with our dignity." } },
      choices = {
        { text = "Then I'll ask the birds' pardon and ride carefully.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast should carry whoever it's told to carry.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Often, and quietly, when the Hatecrest naga move along the shore. A bird that lands without being seen is worth more than any message I could send, and a rider who keeps silent is worth just as much." } },
      choices = {
        { text = "Spying on the naga keeps the island safe.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Better to strike first than to spy.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Fyldren.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not the Light, I think, but the clank of plate and the smell of the forge on it. They were raised for silent Sentinels in soft boots, and a paladin in full armor walks like a storm coming up the path." } },
      choices = {
        { text = "Then I'll walk softly. Their ways come first here.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They'll learn. The Alliance is more than Sentinels now.", next = "BACK", fx = { align = { order = -1 } } },
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
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Stay back from the birds, warlock. Hippogryphs can feel the fel on you, and I've already seen two of them rear up and nearly break their tethers since you landed." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You walk softly enough that the hippogryphs didn't even turn their heads, and that's rare. They don't startle at a Sentinel's step either, so you've been trained well by someone." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. My hippogryphs have never carried one of your order, and they're watching that hammer of yours very carefully, so move slowly near the roosts." },
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
        { text = "Will your hippogryphs carry a warlock at all?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do your hippogryphs carry scouts across the coast?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Are your hippogryphs uneasy around the Light?", next = "xapala", when = { class = "PALADIN" } },
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
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I sell to whoever the Alliance sends across the water, and I keep a record of every bolt that leaves my shelves. My sisters look twice at a mage on the isle, but cloth is cloth, and a mage in a dry robe is better company than one in a wet one." } },
      choices = {
        { text = "Trade should be free to all of the Alliance.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Records are wise. Trust, but keep watch.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Vivianna.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I think nothing of the sort, but the boats bring all kinds to Feathermoon, and some of them have quick hands. I keep my ledger in good order, and if anything goes missing, the Sentinels know where to look first, which is the safest place for an honest rogue to be." } },
      choices = {
        { text = "Stealing from allies is beneath me.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your ledger won't stop a real thief.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Vivianna, and I keep the stronghold's trade goods. Everything the Sentinels mend their cloaks and armor with comes across the water to me first, and I make sure none of it goes to waste." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and you'll be wanting runecloth and thread, I'd expect, because your robes don't survive the rain here any better than anyone's. I keep some at the back, where the damp can't reach it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You've a quiet way of standing near my shelves, friend, and I've a quiet way of counting them. Between the two of us, I think we'll stay on good terms." },
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
        { text = "Do the Sentinels trust you to sell to mages?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "You think I'd steal from the Sentinels?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
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
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The fel is a sickness, and the land knows it the way a body knows a fever. You are of the Horde, and so you are welcome at Mojache, but I would ask that you walk gently in my gardens, and let the roots keep their health." } },
      choices = {
        { text = "I'll walk gently. The land deserves that much.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The plants will just have to endure it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Patience, first, because nothing grows faster for being shouted at. Then that the land has its own magic, older than any spell, and it gives freely to those who ask it with respect." } },
      choices = {
        { text = "The land's magic should be studied and understood.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Some magic is meant to be respected, not studied.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, Ruw.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Ruw, and I teach the gathering of herbs at Camp Mojache. Feralas is old and green and full of things the Earth Mother grew long before any of us came here, and I can teach you how to take them without harming the land." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Then you know already what I teach the others, that the Earth Mother gives freely only to those who take with care." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The herbs of Feralas grow under spirits older than ours, and you'll feel them if you walk softly." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "You are a priest, and the herbs of Feralas will help your healing as much as any prayer. Come and learn the leaves before you need them." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You know already how to walk without crushing the grass, which is the first lesson I teach. Some of my students take weeks to learn it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "The plants turn from you, warlock. I have seen it before, in the travelers who come from Felwood, and it saddens me, because the Earth Mother grows them for everyone." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage. You know your books, little one, and books are useful, but there are things in the soil that no book in Undercity or anywhere else has written down." },
      },
      again = {
        { id = "h_again", text = "What else would you know, little one?" },
        { id = "h_again2", text = "Speak; I am listening, as the grass listens to the wind." },
      },
      choices = {
        { text = "Does the forest here still give freely, Ruw?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Whose spirits are older than ours here, Ruw?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the herbs here hold any magic of their own?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Is anyone taking more from this forest than they should?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Teach me what you can.", next = "BUSINESS" },
        { text = "What grows in Feralas?", next = "grows" },
        { text = "How do you take without harming the land?", next = "harm" },
        { text = "Is the forest safe for gathering?", next = "safe" },
        { text = "Is it the fel that makes them wither?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What can the soil teach a mage, Ruw?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
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
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A hide is a tool too, but I take it after the beast is gone, and I take it to make something that keeps a hunter warm. What you take, you take so that nothing of the beast goes back to the Earth Mother, and that is waste of the worst kind." } },
      choices = {
        { text = "I do what I must to survive.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Perhaps you're right. I'll think on it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A quick cut in a fight, yes, but not at the skinning. When you rush it, you tear the hide and waste half the beast, and that dishonors both the hunter and the hunted." } },
      choices = {
        { text = "Patience honors the hunt. I'll learn it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I've no time to waste on hides.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kulleg Stonehorn. I teach skinning here, and I teach it the old way: when a beast dies, you take everything it can give, and you waste nothing, because a waste dishonors the hunt." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll know the hunt is sacred, so you'll understand why I'm hard on anyone who wastes a skin." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. When a hunt goes badly it's your sort who closes the wounds, and I respect that, because it means you know what a kill costs." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. Mind what your fire does to a hide, because a scorched pelt is a waste, and I don't teach waste." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "You take souls, warlock, and I take hides. One of those honors the beast, and one of them does not, and I think you know which." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue. You'll know how to take a hide quickly and cleanly, because your knives are sharp, but I hope you take your time with them too." },
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
        { text = "Do spellcasters waste more of the hunt than warriors?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "A soul shard is a tool, Kulleg.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "A quick cut is the best cut, Kulleg.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
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
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "No, I can't, and I don't, but I count anyway. The caravans from Thunder Bluff come the long way through the Needles, and every missing spool is one that some kodo walked a hundred miles to bring me." } },
      choices = {
        { text = "Count away. I respect a careful trader.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your caution insults honest customers.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Never mind that.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's what I like to hear, though the price is the price, and I'll not pretend otherwise. The road from Thunder Bluff is long, and the Grimtotem and the Galak make it longer, so every bolt here has earned its cost." } },
      choices = {
        { text = "A fair price for a hard road. I'll pay it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "You'd charge a starving man for water.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Sheendra Tallgrass, and I keep the camp's trade goods. Everything comes the long way from Thunder Bluff, by kodo through Thousand Needles, so I count every spool twice and charge a little more than you'd like." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! If you could ask the spirits to keep the kodo caravans dry through Thousand Needles, I'd stop charging extra for damp thread." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Bless my caravans if you've a mind to, because every one that arrives whole feels like an answered prayer." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. I'll sell to you like anyone else, but I'll count my spools after you leave, and I hope you won't take that personally." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue! Then you'll understand why I count every spool twice, because I've had a few of your sort pass through and I'm still short three bolts of mageweave." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage, and you'll want cloth for robes, I suppose. The caravans bring good wool from Mulgore, but you mages always want something finer, and finer costs more to haul." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Ask what you like; I'm only counting." },
      },
      choices = {
        { text = "Is the road from Thunder Bluff really that dangerous, Sheendra?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What threatens the caravans on the road here?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "How do the caravans get through?", next = "caravans" },
        { text = "What's Camp Mojache for, out here?", next = "camp" },
        { text = "Who else trades here?", next = "trade" },
        { text = "You can't blame every rogue for one thief.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I'd pay well for good cloth, Sheendra.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
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
