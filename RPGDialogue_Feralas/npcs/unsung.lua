-- Feralas folk with nothing to say until now: Feathermoon's hippogryph master and trader, and Camp Mojache's trainers and trader. Voice: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "fyldren", id = TODO_NPC("Fyldren Moonfeather"), name = "Fyldren Moonfeather",
  title = "Hippogryph Master",
  bible = "bibles/unsung.md", role = "flightmaster", tier = "service",
  communities = { "feathermoon" }, temper = { "calm", "watchful" }, values = { "loyal", "dutiful" },
  notices = { "race", "form", "lock_steed" },

  impression = {
    first = "The hippogryphs get gentler words than any visitor does.",
    third = "{name} met Fyldren Moonfeather, the hippogryph master of Feathermoon Stronghold.",
  },

  greetings = {
    { id = "g_roost", text = "Ishnu-alah. The hippogryphs are rested and the winds are fair, and Elune's light is on the water. Where would you fly?" },
    { id = "g_back", when = { metBefore = true }, text = "You've returned to the isle. The birds remember you, and so do I." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah. It's good to see one of our own come so far south; most of our people never leave Teldrassil's shade now." },
    { id = "n_flight", cat = "form", when = { form = { "travel", "aquatic" } },
      text = "You came across the water in another shape, I see. The hippogryphs know a druid when they see one; they'll carry you all the same." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Do not bring that burning horse any closer to the roost. The hippogryphs can smell its hooves from the beach, and I will not have them taking to the sea in a panic." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They sense the storms over the sea, and they sense the naga long before we do. If they're watching you, it's because you smell of the wind, and they trust the wind above any rider." } },
      choices = {
        { text = "I'll treat your birds as gently as a fair wind.", next = "BACK", reply = "Then they will know it before you have taken the reins. Hippogryphs read hands the way Sentinels read tracks.", fx = { align = { light = 1 } } },
        { text = "The wind isn't gentle. Your birds should learn that.", next = "BACK", reply = "They learned it long ago over the open sea, and they bear the scars. Look at the grey one's wing, if you doubt me, and then tell me what else they need to learn.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not skittish, only wise, for many of them flew wild over Feralas before they came to us, and they remember the ogres' clubs. They learn to trust a warrior who moves slowly, and to carry him, but they never forget the sound of a blade." } },
      choices = {
        { text = "I'll respect the roost's rules. The birds come first here.", next = "BACK", reply = "Then you will be welcome at the roost, and the birds will carry you as gently as they carry our wounded.", fx = { align = { order = 1 } } },
        { text = "A warrior goes armed. The birds will have to adjust.", next = "BACK", reply = "Then you will walk to the mainland, warrior. I will not force a frightened bird into the air for anyone's pride.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They judge it by its stillness, mostly, for a beast that waits calmly beneath the roost is no threat, and one that stares upward is a hunter. The wild hippogryphs of the mainland learned that from the yetis, and they taught it to mine." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They judge it by its stillness, mostly, for a beast that waits calmly beneath the roost is no threat. Your {pet} has the right manner, I think; it does not look up at them, and so they have stopped looking down at it." },
      },
      choices = {
        { text = "Every creature deserves a chance to earn trust.", next = "BACK", reply = "That is the way of Cenarius, and the hippogryphs would agree, for they gave us their trust slowly too.", fx = { align = { light = 1 } } },
        { text = "Wild beasts are wild. Trusting them is foolish.", next = "BACK", reply = "Perhaps, but the birds were wild once, and they trusted us in the end, so I would not call it foolish.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They do, I think, for Feralas is wetter and the winds off the sea are rough. Still, they carry our letters and our wounded across the water, and the stronghold would wither without them." } },
      choices = {
        { text = "Then they serve the stronghold, and that's enough.", next = "BACK", reply = "It is, and they seem to know it, for they come back to the roost every evening of their own will.", fx = { align = { order = 1 } } },
        { text = "They should fly free, not carry our letters.", next = "BACK", reply = "They do fly free. Every evening I leave the roost open, and every evening they come back, which is more than I can say for some Sentinels.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They'll carry you, because the Alliance asks it of them, but they'll not like it, and neither will I. Keep whatever walks with you on the ground and your hands still on the saddle, and we'll both get through the flight with our dignity." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They'll carry you, because the Alliance asks it of them, but they'll not like it, and I can hear them stamping already at the smell of your servant. Send it back to wherever you keep it before you mount, and keep your hands still on the saddle, and we'll both get through the flight with our dignity." },
      },
      choices = {
        { text = "Then I'll ask the birds' pardon and ride carefully.", next = "BACK", reply = "That is all I ask. They will feel it in your hands.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast should carry whoever it's told to carry.", next = "BACK", reply = "They carry whom they choose, and they choose to carry you because I ask it, so do not test their patience.", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Often, and quietly, when the Hatecrest naga move along the shore. A bird that lands without being seen is the best message I could send, and a rider who keeps her mouth shut is the next best." } },
      choices = {
        { text = "Spying on the naga keeps the island safe.", next = "BACK", reply = "It does, and the birds do it better than any scout on foot, so I keep them flying low and silent.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Better to strike first than to spy.", next = "BACK", reply = "Strike first, and the naga will strike back twice as hard, and it is my birds who will feel it.", fx = { align = { order = -1 } } },
        { text = "Something else, Fyldren.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not the Light, I think, but the clank of plate and the smell of the forge on it. They were raised for silent Sentinels in soft boots, and a paladin in full armor walks like a storm coming up the path." } },
      choices = {
        { text = "Then I'll walk softly. Their ways come first here.", next = "BACK", reply = "Thank you. I would also ask you to take off your helm near the roost; it shines, and they remember what shining metal meant in the old wars.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They'll learn. The Alliance is more than Sentinels now.", next = "BACK", reply = "They will, slowly, as they learned the Sentinels, but I would ask you to be patient while they do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Too often, since the naga began shooting at anything that flies low over the coast. I tend their wings myself, and the Sentinel priestesses pray over the worst, though I have learned that a bird mends best when it is allowed to rest and not hurried back to the sky." } },
      choices = {
        { text = "Let them rest as long as they need. They've earned it.", next = "BACK", reply = "They have earned it. As long as I keep this roost, no wounded bird flies before it is ready, whatever the scouts' captain says.", fx = { align = { light = 1 } } },
        { text = "The Sentinels need scouts. The birds must fly when called.", next = "BACK", reply = "They will fly when called, as they always have, but a bird that flies wounded may not come back.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They were Cenarius's own creatures, raised wild in the forests, and they remember the Sundering in their blood if not in their minds. The old Highborne ruins across the water make them restless even now, and they never fly over Eldre'Thalas if I let them choose." } },
      choices = {
        { text = "I'll keep my magic away from them, then.", next = "BACK", reply = "Thank you, and the birds will be grateful, though they will still flinch a little when you pass.", fx = { align = { order = 1 } } },
        { text = "They'll have to get used to it. Magic isn't going anywhere.", next = "BACK", reply = "Perhaps not, but they remember the Sundering in their bones, and I will not ask them to forget it for you.", fx = { align = { order = -1 } } },
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
          text = "Stay back from the birds, stranger. Hippogryphs can feel something on you, and I've already seen two of them rear up and nearly break their tethers since you landed." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You walk softly enough that the hippogryphs didn't even turn their heads, and that's rare. They don't startle at a Sentinel's step either, so you've been trained well by someone." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. My hippogryphs have never carried one of your order, and they're watching that hammer of yours very carefully, so move slowly near the roosts." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. Keep your weapon sheathed near the roost, if you would; my birds startle at drawn steel, and a startled hippogryph is a dangerous thing." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. My birds have already marked your companion, and they are deciding whether it is a friend of the roost." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest of the Light. The hippogryphs do not know your faith, but they know a calm hand, and I think they will take to you." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Keep your spells quiet near the roost, if you would, because my birds can smell the arcane and they do not care for it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who speaks to the winds! My hippogryphs are restless around you, but I think it's curiosity, not fear." },
      },
      again = {
        { id = "h_again", text = "Would you ask more of the roost, or of the isle?" },
        { id = "h_again2", text = "The birds can wait a little longer; they have waited on our people since before the Sundering. What else is on your mind?" },
      },
      choices = {
        { text = "Do your birds miss the forests of Ashenvale?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me where I can fly.", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "Why build a stronghold on an island?", next = "island" },
        { text = "Keeping birds in this damp can't be easy.", next = "birds" },
        { text = "The wild hippogryphs here must trouble you.", next = "wild" },
        { text = "I've never ridden a hippogryph before.", next = "first", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Will your hippogryphs carry someone like me at all?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do your hippogryphs carry scouts across the coast?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Are your hippogryphs uneasy around the Light?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Are hippogryphs really that skittish around warriors, Fyldren?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Your hippogryphs seem to judge other beasts carefully, Fyldren.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your hippogryphs ever come back hurt, Fyldren?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why do hippogryphs dislike the arcane, Fyldren?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do your hippogryphs sense the spirits, Fyldren?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    island = {
      lines = {
        { id = "i_default", text = "Because the water is a wall the ogres cannot climb. The General chose Sardor Isle for the same reason a hunter chooses high ground, and only the naga can reach us easily, so the archers watch the shore." },
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
        { id = "b_default", text = "It takes care and patience, and fish, which they love more than their own young. The damp gets into their feathers and makes them slow, so I brush them after every flight and keep them close to the fires at night." },
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
        { text = "Leave them alone, I'd say.", next = "BACK", reply = "That is my wish too, and I keep my riders' paths well away from the hills where they nest.", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "If they attack travellers, they should be culled.", next = "BACK", reply = "Perhaps, but they were here before the travellers, and I would rather we kept to the road.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
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
    advice = { { id = "tp_ad", text = "Fly over the water, never over the hills. The ogres throw rocks at anything that moves in the sky, and they are better at it than you'd think." } },
    teldrassil = { { id = "tp_teldrassil", text = "My birds fly from here to Teldrassil and back, over the whole long coast of Kalimdor. They know the way better than I do, and they never complain of the rain." } },
    elune = { { id = "tp_elune", text = "The hippogryphs were Elune's gift to our people, or so my grandmother told me, and I see no reason to doubt her. Look at them and tell me otherwise." } },
    tyrande = { { id = "tp_tyrande", text = "High Priestess Tyrande rode a hippogryph into battle once, in the old war, and the birds remember. I like to think they remember." } },
    dire_maul = { { id = "tp_dire_maul", text = "I fly my birds well clear of Dire Maul, because the ogres throw rocks and the old elves throw worse. A frightened hippogryph is a dangerous passenger." } },
    _none = { { id = "tp_none", text = "I could not say. Ask the General's people; they hear more of the mainland than I do, and they remember it longer than most." } },
  },
}

P:NPC {
  key = "vivianna", id = TODO_NPC("Vivianna"), name = "Vivianna",
  title = "Trade Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "feathermoon" }, temper = { "gentle", "precise" }, values = { "practical", "loyal" },
  notices = { "craft", "lock_shards" },

  impression = {
    first = "She speaks softly, but nothing on her shelves goes unrecorded.",
    third = "{name} met Vivianna, who sells trade supplies at Feathermoon Stronghold.",
  },

  greetings = {
    { id = "g_shop", text = "Thread, salt, dyes and flux, if the boats came in on time. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to Feathermoon, and Elune's blessing on you. Your craft is going well, I hope?" },
  },

  notice = {
    { id = "n_crafter", cat = "craft", when = { profession = { "Tailoring", "Leatherworking" } },
      text = "You've the hands of someone who works cloth or leather; I can tell from the needle marks. Feralas is rich in both, if you're willing to walk among the yetis and the bears to find them." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 5 } },
      text = "I can feel the souls in your bag from behind the counter, cold as the water off Sardor Isle. The satyrs collect souls too, across the water, and I would rather not stand so near to the reminder." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I hope not, because everything I sell has been through the ground or the sea before it reaches my shelves. If the spirits have objections, they've kept them from me so far." } },
      choices = {
        { text = "Use what the land gives, but count it and waste nothing.", next = "BACK", reply = "That is how I have always worked. My mother kept the stores at Auberdine the same way, and she never once ran short of thread.", fx = { align = { order = 1 } } },
        { text = "The land's gifts are free. Take what you need.", next = "BACK", reply = "Free from the land, perhaps, but never free from the boatmen who bring them, so I will keep counting.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because everything comes across the water from the mainland, and every boat risks the naga to bring it. A warrior who wastes a strap wastes a boatman's courage, and I'll not have that on my shelves." } },
      choices = {
        { text = "Careful records keep a stronghold alive. You're right.", next = "BACK", reply = "They do. My sisters tease me for counting, but they come to me first when the arrows run low.", fx = { align = { order = 1 } } },
        { text = "In battle nobody counts straps. Supplies are for using.", next = "BACK", reply = "Then use them, but use them well, because I cannot promise there will be another boat before the next fight.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bear and wolf for the cloaks, and anything thick enough to turn an ogre's club for the armor, though the hunters rarely bring enough. The rain ruins half of what comes over, so a hunter who keeps the hides dry is a hunter I remember." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Bear and wolf for the cloaks, and anything thick enough to turn an ogre's club, brought in dry. And keep {pet} away from the stacked hides, please, because a beast that smells fresh leather tends to want to taste it." },
      },
      choices = {
        { text = "Take only what the land can spare.", next = "BACK", reply = "That is the old way, and the right one. My shelves will be emptier for it, but I would rather explain an empty shelf than an empty forest.", fx = { align = { honor = 1 } } },
        { text = "The woods are full of beasts. Take all you can carry.", next = "BACK", reply = "Then carry them back dry, at least, because a wet hide is no use to anyone on this isle.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I sell to whoever the Alliance sends across the water, and I keep a record of every bolt that leaves my shelves. My sisters look twice at a mage on the isle, but cloth is cloth, and a mage in a dry robe is better company than one in a wet one." } },
      choices = {
        { text = "Trade should be free to all of the Alliance.", next = "BACK", reply = "It should be, and it is, but I keep my ledger all the same, because the boats are not free.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Records are wise. Trust, but keep watch.", next = "BACK", reply = "Exactly. I am glad a newcomer sees it; it took the Stronghold three bad winters to learn.", fx = { align = { order = 1 } } },
        { text = "Something else, Vivianna.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I think nothing of the sort, but the boats bring all kinds to Feathermoon, and some of them have quick hands. I keep my ledger in good order, and if anything goes missing, the Sentinels know where to look first, which is the safest place for an honest rogue to be." } },
      choices = {
        { text = "Stealing from allies is beneath me.", next = "BACK", reply = "I believe you, and I am glad to hear it, because I would rather not trouble the Sentinels.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your ledger won't stop a real thief.", next = "BACK", reply = "Perhaps not, but the Sentinels will, and they are far less patient than my ledger.", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Everything comes across the water from the mainland or up the coast by boat, and the naga have made both harder this season. I keep a careful count because a missing bolt of cloth means a Sentinel goes out with a torn cloak, and that is how scouts are seen." } },
      choices = {
        { text = "Then I'll take only what I need and leave the rest.", next = "BACK", reply = "Thank you. The night watch on the north wall will be warmer for it, though they will never know whom to thank.", fx = { align = { order = 1 } } },
        { text = "Sentinels can mend their own cloaks. I'll buy what I want.", next = "BACK", reply = "Then buy what you want, but know that each bolt you take is a cloak someone else must wait for.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The scouts who return from the mainland, always. The Sentinels come back from the ruins with wounds that close slowly, and the priestesses ask me for more linen than the boats can bring, so I ration it, though I hate to." } },
      choices = {
        { text = "Ration it to the worst hurt first. That's only fair.", next = "BACK", reply = "That is how I do it, and it is harder than it sounds, because every wound looks worst to the one who bears it.", fx = { align = { light = 1 } } },
        { text = "Give it to those who'll fight again soonest.", next = "BACK", reply = "That is the Sentinels' counsel, and perhaps it is wiser, but I cannot look at a wounded scout and turn away.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because across the water stand the ruins of Eldre'Thalas, and the satyrs that walk there were once my people. They traded what they were for power, and I can smell that same trade on you." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because across the water stand the ruins of Eldre'Thalas, and the satyrs that walk there were once my people. They traded what they were for power, and when I look at the thing beside you, I see the bargain that made them, so forgive me if I don't believe yours will end better." },
      },
      choices = {
        { text = "I understand. I'll prove my bargain is different.", next = "BACK", reply = "Then prove it, and I will be glad to be wrong, because I would like to believe a bargain can end well.", fx = { align = { order = 1 } } },
        { text = "My bargains are my own affair, Vivianna.", next = "BACK", reply = "They are, until they come back to haunt the rest of us, and then they become everyone's affair.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Thread for their healing pouches, mostly, and dried herbs from Ashenvale, because the rain here spoils anything grown on the isle before it dries. I think they also come to see a friendly face before they go into the woods, though they'd never say so." } },
      choices = {
        { text = "A friendly face matters. Thank you for keeping it.", next = "BACK", reply = "You are kind to say so, and I will keep smiling for them, because the mainland is not kind to anyone.", fx = { align = { light = 1 } } },
        { text = "Druids should live off the land, not off your stores.", next = "BACK", reply = "They do, mostly, but even a druid needs thread, and I am not too proud to give it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. If you've come for leather to mend your straps, I'll need it counted out and signed for, because the Sentinels' stores are not a charity." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. If you bring me hides from the mainland I'll take them gladly, but bring them dry, because wet leather is worth half." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. If you need your plate mended, I can sell you the oil and the rivets, but the Sentinels' smith works only for the Sentinels, so you'll do the work yourself." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest of the Light. I've candles and linen for bandages, if you've come for those, and I'd be glad to see them go to someone who will use them well." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I'll sell you what's on my shelves, because Darnassus says I must. But there's a cold about you that I don't care for, so make your purchase quickly and keep your hands where I can see them." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Circle. I keep a store of herbs for your kind, because the Circle's people come through often, and they always seem to need something I've just run out of." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. You'll want leather that can stand the rain, I'd guess, and I'll want to know whether your spirits object to dyes." },
      },
      again = {
        { id = "h_again", text = "Is there anything else you need from the stores?" },
        { id = "h_again2", text = "Ask, and I'll answer as best I can; a few centuries of keeping stores teaches patience." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "How do goods reach the isle?", next = "boats" },
        { text = "Feralas must offer plenty to a crafter.", next = "feralas" },
        { text = "Do the Sentinels need anything I could bring?", next = "need" },
        { text = "Do the Sentinels trust you to sell to mages?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "You think I'd steal from the Sentinels?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why count every strap so carefully, Vivianna?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What hides do the Sentinels need most, Vivianna?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Supplies seem tight on the isle, Vivianna.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Who on the isle needs bandages most, Vivianna?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why are you so wary of me, Vivianna? I've bought nothing yet.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The Circle's people must need something here, Vivianna.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the spirits mind your dyes, Vivianna?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "The yetis must live somewhere in these hills.", next = "feralas_yetis" },
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
        { id = "n_default", text = "Always, friend. Bring cloth you've taken from the ogres and hides you've skinned yourself, and sell them to the merchants, and some of it finds its way to the Sentinels sooner or later. Every little bit makes the next month easier." },
      },
      choices = {
        { text = "I'm glad to help the Sentinels.", next = "BACK", reply = "Thank you. The Sentinels will thank you too, in their own quiet way, which is mostly nodding.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll sell wherever the price is best.", next = "BACK", reply = "That is your right, and I will not begrudge you it, though I hope some of it finds its way here.", fx = { align = { order = -1 }, trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I traded goods in Auberdine before I came here. It's quieter, and the wind smells of the sea instead of fish." } },
    advice = { { id = "tp_ad", text = "Always carry a spare spool of thread. A torn cloak in the Feralas rain is a miserable thing, and the rain here does not stop for anyone's mending." } },
    teldrassil = { { id = "tp_teldrassil", text = "Everything on my shelves comes on the boats from Teldrassil or Auberdine, and I count it twice. Salt rots in this damp if you look away." } },
    booty_bay = { { id = "tp_booty_bay", text = "Goblin traders from Booty Bay sometimes sail in with dyes, and I buy them because I must, and I count my change three times because I must." } },
    elune = { { id = "tp_elune", text = "I keep a moonstone on the counter for Elune's blessing on trade. The Sentinels tease me about it, and then they touch it on the way out." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "A Faire with fortune-tellers and games, you say? I would want to see their ledgers before I believed they made a fair copper." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, friend. Ask Shandris's people; the Sentinels hear everything, and forget very little." } },
  },
}

P:NPC {
  key = "ruw", id = TODO_NPC("Ruw"), name = "Ruw",
  title = "Herbalism Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "mojache" }, temper = { "slow", "warm" }, values = { "wise", "kind" },
  notices = { "craft", "race", "lock_taint" },

  impression = {
    first = "The lessons come slowly and patiently, the way roots grow.",
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
    { id = "n_lock_taint", cat = "lock_taint", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "The fel is in you deeper than your hands, and my herbs can smell it on you. Walk the long way round the garden, please, because the roots remember even a short visit." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Anyone can learn it who listens. You were taken from the earth and given back, and few herbalists know the soil so closely, so I think the land would not mind your hands, as long as they are gentle." } },
      choices = {
        { text = "I'll be gentle. The land deserves that.", next = "BACK", reply = "Then the land will welcome you, and you will find its gifts come easier to a gentle hand.", fx = { align = { light = 1 } } },
        { text = "The land gives what I take. That's what it's for.", next = "BACK", reply = "It gives, yes. But I have watched hands that take without thanks, and every season they come back from the same hillside with less.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Patience, which few warriors learn, and healing, which they all need sooner or later. The best herbs of Feralas grow slowly in the shade, and a warrior who learns to wait for them learns also to wait for the right moment to strike." } },
      choices = {
        { text = "Patience before the strike. That's how battles are won.", next = "BACK", reply = "You understand, then, and I am glad, because the herbs teach the same lesson the battlefield does.", fx = { align = { order = 1 } } },
        { text = "The right moment is now. Waiting gets braves killed.", next = "BACK", reply = "Sometimes it does, and I have buried braves who waited too long, but I have buried more who did not wait at all.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Better than any map, for the beasts of Feralas know which leaves heal and which poison, and they graze accordingly. Watch what the wild things eat after a fight, and you will learn half of what I teach." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Better than any map, for the beasts of Feralas know which leaves heal and which poison. Watch {pet} when it noses at the ground, for the Earth Mother speaks more plainly to beasts than to us." },
      },
      choices = {
        { text = "The beasts are our teachers. We should learn from them.", next = "BACK", reply = "They are. A deer showed me where the mageroyal grows when I was a calf, and I have been following beasts to herbs ever since.", fx = { align = { light = 1 } } },
        { text = "Beasts eat what's in front of them. There's no wisdom in it.", next = "BACK", reply = "Watch more closely, then, and you will see that what is in front of them is never there by chance.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Less than it did, because the Gordunni strip the groves near their camps and the Grimtotem take whatever they please. I've seen whole hillsides of herbs pulled up by the roots, and they won't grow back for years." } },
      choices = {
        { text = "Then the Grimtotem must answer for it.", next = "BACK", reply = "They must, and Cairne will hear of it, but I fear the land will be slower to forgive than the elders.", fx = { align = { honor = 1 } } },
        { text = "Let the land rest. Anger won't regrow a single root.", next = "BACK", reply = "You speak with an elder's wisdom, and I will try to listen to it, though my heart is still angry.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "There is a sickness in what you carry, and the land knows it the way a body knows a fever. You are of the Horde, and so you are welcome at Mojache, but I would ask that you walk gently in my gardens, and let the roots keep their health." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "The fel is a sickness, and the land knows it the way a body knows a fever, and the leaves near your demon are curling already. You are of the Horde, and so you are welcome at Mojache, but I would ask that it wait outside my gardens, and let the roots keep their health." },
      },
      choices = {
        { text = "I'll walk gently. The land deserves that much.", next = "BACK", reply = "Thank you. Stay to the deer paths; they know where the roots run shallow.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The plants will just have to endure it.", next = "BACK", reply = "They will, because they must, but you will find my gardens less generous to you than to others.", fx = { align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Patience, first, because nothing grows faster for being shouted at. Then that the land has its own magic, older than any spell, and it gives freely to those who ask it with respect." } },
      choices = {
        { text = "The land's magic should be studied and understood.", next = "BACK", reply = "Studied, perhaps, but with respect, and never by tearing it apart to see how it works.", fx = { align = { order = -1 } } },
        { text = "Some magic is meant to be respected, not studied.", next = "BACK", reply = "That is the wiser answer, and the Earth Mother would smile at it, as I do.", fx = { affinity = 1, align = { order = 1 } } },
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
          text = "The plants turn from you, child. I have seen it before, in the travelers who come from Felwood, and it saddens me, because the Earth Mother grows them for everyone." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage. You know your books, little one, and books are useful, but there are things in the soil that no book in Undercity or anywhere else has written down." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. You walk heavily, and the herbs bend beneath you, but they will rise again, as you will after the ogres strike." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. Your beast will find herbs before you do, for it knows the smell of the earth better than any student I've had." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken with the Light in your hands. The Earth Mother's plants grow back after the frost, and perhaps you have grown back in your own way." },
      },
      again = {
        { id = "h_again", text = "What else would you know, little one? The Earth Mother's gardens are wide." },
        { id = "h_again2", text = "Speak; I am listening, as the grass listens to the wind." },
      },
      choices = {
        { text = "Does the forest here still give freely, Ruw?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I've heard there are spirits older than ours here, Ruw.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the herbs here hold any magic of their own?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Is anyone taking more from this forest than they should?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Teach me what you can.", next = "BUSINESS" },
        { text = "Something good must grow in Feralas.", next = "grows" },
        { text = "How do you take without harming the land?", next = "harm" },
        { text = "Is the forest safe for gathering?", next = "safe" },
        { text = "Is it something I carry that makes them wither?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What can the soil teach a mage, Ruw?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do herbs have anything to teach a warrior, Ruw?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "My beast seems to sniff out herbs on its own, Ruw.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Can a Forsaken paladin learn to gather without harm, Ruw?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
        { text = "That's a good way to live, Ruw.", next = "BACK", reply = "It is, and it was my mother's way, and her mother's before her, and I hope it will be yours.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "The land will grow back regardless.", next = "BACK", reply = "Perhaps, but more slowly each time. There is a hill above the Grimtotem camp that was stripped three summers running, and nothing grows on it now but thorns.", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
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
        { text = "Then I'll gather them with care, as you do.", next = "BACK", reply = "Then the land will thank you, and those herbs will remember you kindly, whatever they remember of the elves.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Magic in the soil is power. I'd take all I can.", next = "BACK", reply = "Take all you can, and you will find there is less each year, and one year there will be nothing at all.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "The ogres trample, the gnolls burn, and some traders come through who pull whole plants up by the roots to sell them. I cannot stop them all, but I tell the elders, and the elders tell the braves." } },
      choices = {
        { text = "I'll watch for them and bring word to the elders.", next = "BACK", reply = "Thank you, and the elders will be glad, because they cannot watch every grove in Feralas.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll deal with them myself. The elders are too slow.", next = "BACK", reply = "Then go gently, because the elders are slow for a reason, and anger leaves its own marks on the land.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The night elves walked these forests long before the tauren came, and their old cities lie broken among the trees, at Dire Maul and elsewhere. The spirits there remember them, and I think some remember them unkindly, so I gather carefully." } },
      choices = {
        { text = "Then we tread with respect and take only what's needed.", next = "BACK", reply = "That is the right way, and the spirits will know you for it, and perhaps they will forgive us.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Old grudges aren't ours. We take what the forest offers.", next = "BACK", reply = "They are not ours, but they are the forest's, and the forest remembers who walks in it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I gathered herbs in Mulgore since I was a calf. Feralas called to me with its old green, and I came." } },
    advice = { { id = "tp_ad", text = "Leave a little root, little one. Always leave a little root." } },
    earth_mother = { { id = "tp_earth_mother", text = "Every herb I teach you to pick is a gift from the Earth Mother, and a gift is not taken greedily. Leave the roots, and she will give again next spring." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof is old and wise, and he still walks among his people on the high mesas. When I was a calf he stopped to ask me the name of a flower, and he listened to the answer." } },
    green_dragons = { { id = "tp_green_dragons", text = "The green dragons sleep beneath the great trees of this land, where the Dream touches the world. The herbs grow strange there, and I do not pick them." } },
    dire_maul = { { id = "tp_dire_maul", text = "The herbs that grow in the courtyards of Dire Maul are old and strong, planted by elves who are long gone. I would not risk my life for them, though some students do." } },
    _none = { { id = "tp_none", text = "I do not know that, little one. The grass does not tell me everything." } },
  },
}

P:NPC {
  key = "kulleg", id = TODO_NPC("Kulleg Stonehorn"), name = "Kulleg Stonehorn",
  title = "Skinning Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "mojache" }, temper = { "blunt", "steady" }, values = { "practical", "honest" },
  notices = { "craft", "pet", "lock_armor" },

  impression = {
    first = "He believes a beast's death must be made worth something.",
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
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That dark hide you wear was never skinned off anything the Earth Mother made, and I have skinned most of them. It moves when you breathe, and a hide that has stopped living should not do that." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I think nothing is given without a purpose, beast or person. The hunt honors the beast by using all of it, and if the Light took you back, then it means to use all of you, so be ready for that." } },
      choices = {
        { text = "Then let it use me. I'm ready.", next = "BACK", reply = "Then you will be ready when the purpose comes, and that is all any hunter can ask of himself.", fx = { align = { order = 1 } } },
        { text = "I'm no beast to be used. I choose my own purpose.", next = "BACK", reply = "Then choose well, and use all of yourself in the choosing, as a good hunter uses all of the beast.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a death that feeds nothing is a wasted death, and waste dishonors the beast and the one who killed it. The Gordunni kill and leave the bodies to rot, and that, more than their clubs, is why I hate them." } },
      choices = {
        { text = "Every kill should feed someone. I'll take what I can.", next = "BACK", reply = "Good, then you understand the hunt, and the beasts of Feralas will not grudge you your kills.", fx = { align = { honor = 1 } } },
        { text = "A warrior kills. What comes after is someone else's work.", next = "BACK", reply = "Then someone else will waste it, and the waste will still be yours, because the kill was yours.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A hide is a tool too, but I take it after the beast is gone, and I take it to make something that keeps a hunter warm. What you take, you take so that nothing of the beast goes back to the Earth Mother, and that is waste of the worst kind." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "A hide is a tool too, but I take it after the beast is gone, and I take it to keep a hunter warm. What you take, you feed to that thing at your side, so that nothing of the beast goes back to the Earth Mother, and I find it hard to look at while it stands here." },
      },
      choices = {
        { text = "I do what I must to grow stronger.", next = "BACK", reply = "We all do, but there is surviving and there is taking, and the Earth Mother knows the difference.", fx = { align = { light = -1 } } },
        { text = "Perhaps you're right. I'll think on it.", next = "BACK", reply = "That is all I ask, and more than most give me. Come back when you have thought, and bring a hide, and we will see if your hands agree with your head.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A quick cut in a fight, yes, but not at the skinning. When you rush it, you tear the hide and waste the beast, and that dishonors both the hunter and the hunted." } },
      choices = {
        { text = "Patience honours the hunt. I'll learn it.", next = "BACK", reply = "Then you will make a fine skinner, and the beasts will thank you by giving you their best hides.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I've no time to waste on hides.", next = "BACK", reply = "Then leave the hides to those who have the time, and the beasts will thank them instead of you.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Respect, and an end that's quick and clean. The Earth Mother gave us the beasts to feed and clothe us, but she didn't give them to us to waste, and I've seen too many hides left to rot in Feralas by hunters who only wanted the trophy." } },
      choices = {
        { text = "Then I'll waste nothing, and take only what I need.", next = "BACK", reply = "Then you hunt as the Earth Mother wishes. Bring me your first ironfur pelt and I will show you how to get a cloak and a pair of boots from the same beast.", fx = { align = { light = 1 } } },
        { text = "A hunt is a hunt. The beasts don't care what's taken.", next = "BACK", reply = "They may not, but the Earth Mother does, and she will remember you when the hunting grows lean.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
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
          text = "You take souls, I think, and I take hides. One of those honors the beast, and one of them does not, and I think you know which." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue. You'll know how to take a hide quickly and cleanly, because your knives are sharp, but I hope you take your time with them too." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. You kill many beasts, I think, but do you take anything from them, or do you leave them for the crows?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You walk in the shapes of beasts, so you'll know better than most what a hunt costs them, and I'll expect you to honor it." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The plague wasted you once, I think, and something gave you back, so perhaps you understand why I waste nothing." },
      },
      again = {
        { id = "h_again", text = "What else? Speak plainly, the way the hunt speaks." },
        { id = "h_again2", text = "Ask. I'm listening, and the ancestors who taught me this knife are listening too." },
      },
      choices = {
        { text = "Teach me what you can.", next = "BUSINESS" },
        { text = "What beasts are worth skinning here?", next = "beasts" },
        { text = "Why does waste dishonor the hunt?", next = "waste" },
        { text = "Skinning seems a cruel trade to me.", next = "cruel" },
        { text = "I'm a hunter. Any advice for me?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Do the spirits punish waste, Kulleg?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do spellcasters waste more of the hunt than warriors?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "What I take is a tool too, Kulleg.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "A quick cut is the best cut, Kulleg.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why should a warrior care what's left behind after a kill?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What does a druid owe the beasts we hunt, Kulleg?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "The Light gave me back for a reason, I'd like to think.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    beasts = {
      lines = {
        { id = "b_default", text = "The ironfur bears have the thickest hides in Feralas, and the yetis in the hills have fur that leatherworkers fight over. The wolves and the cats are common, but they're good practice for a young knife." },
      },
      choices = {
        { text = "There must be bears around here somewhere.", next = "beasts_bears" },
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
        { text = "I'll use everything I can.", next = "BACK", reply = "Then you will be a good hunter, and the land will feed you well for it.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I take what's worth the gold.", next = "BACK", reply = "Then you will be rich for a season and hungry for the rest, because the land remembers greed.", fx = { align = { honor = -1 }, affinity = -1 } },
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
        { text = "A clean kill. I'll remember that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Some do, because fire takes the hide and frost spoils the meat, and they never stop to look at what they've ruined. A careful caster wastes less than a careless warrior, though, so it's the hand I judge and not the spell." } },
      choices = {
        { text = "Then I'll kill cleanly, and take only what I use.", next = "BACK", reply = "Then you hunt as a tauren hunts, whatever your race, and you will always be welcome at my rack.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A kill is a kill. I don't stop to skin.", next = "BACK", reply = "Then the hide rots, and the kill is wasted, and I hope you are the last to hunt that way in Feralas.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not with lightning, if that's what you're asking, but a hunter who wastes the beast finds the next one harder to track. The Woodpaw gnolls waste everything they kill, and you'll notice how the forest treats them." } },
      choices = {
        { text = "Honour the hunt, and take everything the beast can give.", next = "BACK", reply = "That is the old way, and the spirits honour it, and so do I, for whatever an old skinner's honour is worth.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The spirits don't count skins. Take what's useful and move on.", next = "BACK", reply = "Perhaps they don't, but I do, and I have seen the wolves leave a valley where hunters left the carcasses to rot. You will see it too, if you hunt here long enough.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "My father taught me the knife in Mulgore, and his father taught him. I came here because the beasts are bigger." } },
    advice = { { id = "tp_ad", text = "Keep your knife sharp, little one. A dull knife tears, and a torn hide is worth nothing to anyone but the flies." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gives us the beast, and we owe her for every hide we take. A wasted pelt is a debt unpaid." } },
    cairne = { { id = "tp_cairne", text = "Cairne taught our people to hunt with respect and to waste nothing, and I teach what he taught me. I have been at it forty summers, and I still learn something from every hide." } },
    grimtotem = { { id = "tp_grimtotem", text = "The Grimtotem skin for sport and leave the meat to rot, and it shames every tauren who sees it. They are no kin of mine." } },
    dire_maul = { { id = "tp_dire_maul", text = "The beasts that roam near Dire Maul are fat on the ogres' scraps, and their hides are thick. Go carefully, and come back with something worth the walk." } },
    _none = { { id = "tp_none", text = "I don't know. I know knives and hides, and the thanks owed to the beast, not that." } },
  },
}

P:NPC {
  key = "sheendra", id = TODO_NPC("Sheendra Tallgrass"), name = "Sheendra Tallgrass",
  title = "Trade Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "mojache" }, temper = { "friendly", "practical" }, values = { "practical", "kind" },
  notices = { "craft", "race" },

  impression = {
    first = "She talks of the road from Thunder Bluff like an old enemy.",
    third = "{name} met Sheendra Tallgrass, who sells trade supplies at Camp Mojache.",
  },

  greetings = {
    { id = "g_camp", text = "Welcome to Mojache. Thread, salt and dyes, if the caravan made it through." },
    { id = "g_back", when = { metBefore = true }, text = "You return! The caravan came in yesterday, so the shelves are full." },
  },

  notice = {
    { id = "n_crafter", cat = "craft", when = { profession = { "Tailoring", "Leatherworking", "Blacksmithing" } },
      text = "A crafter, good; I sell more to you than to anyone else. The hides in Feralas are fine, and the ogre cloth is surprisingly sturdy, once you wash the smell out." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, so far from Durotar! The jungle must seem strange after the desert, but you'll grow used to the rain, as we all have." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I trade with anyone who pays, and I count their coin twice, whatever they pray to. You're stranger than most who come down the kodo road, but your coin spends the same, so let's not make more of it than that." } },
      choices = {
        { text = "Count it twice. I'll pay fairly.", next = "BACK", reply = "Then we will get along very well, because a customer who pays fairly is worth twice what one who haggles is.", fx = { align = { honor = 1 } } },
        { text = "I'll haggle hard. Your prices are robbery.", next = "BACK", reply = "Robbery is the road from Thunder Bluff, friend, not my prices, but haggle if you like and I will listen.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Grimtotem in the Needles, centaur on the edge of the Barrens, and ogres once we're back under the trees, all of them wanting kodo and cloth. A warrior who stays by the wagons is worth more to me than ten who chase off after every raider." } },
      choices = {
        { text = "A guard stays with the wagons. Chasing raiders is foolish.", next = "BACK", reply = "That is the kind of guard I want, and you will find my wagons a good place to stand.", fx = { align = { order = 1 } } },
        { text = "Kill the raiders before they ever reach the wagons.", next = "BACK", reply = "Kill them if you can, but if you do not come back, my wagons will be the ones without a guard.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Badly, and every lame kodo means a caravan delayed and a trader overcharging. I'd value a hunter who knows beasts well enough to tell me which of my kodos will make the road and which won't." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Badly, and every lame kodo means a caravan delayed. Your {pet} looks well kept, which tells me you know what a beast needs on a long trail, so I'd trust your eye over my drovers' to tell me which kodos will make the road." },
      },
      choices = {
        { text = "Work the beasts fairly. A broken kodo serves no one.", next = "BACK", reply = "That is how I see it too. Old Thunderhide has pulled my wagons from Thunder Bluff for eleven years, and she has never once been driven to lameness.", fx = { align = { honor = 1 } } },
        { text = "Kodos are cargo. Drive them hard and replace the lame.", next = "BACK", reply = "Then you will pay for new kodos every season, and I would rather pay for good feed and careful drivers.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "No, I can't, and I don't blame them, but I count anyway. The caravans from Thunder Bluff come the long way through the Needles, and every missing spool is one that some kodo walked a hundred miles to bring me." } },
      choices = {
        { text = "Count away. I respect a careful trader.", next = "BACK", reply = "Thank you, and I will count your coin with a little less suspicion than the others.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your caution insults honest customers.", next = "BACK", reply = "Perhaps it does, but honest customers rarely mind, and the dishonest ones mind very much.", fx = { align = { order = -1 } } },
        { text = "Never mind that.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's what I like to hear, though the price is the price, and I'll not pretend otherwise. The road from Thunder Bluff is long, and the Grimtotem and the Galak make it longer, so every bolt here has earned its cost." } },
      choices = {
        { text = "A fair price for a hard road. I'll pay it.", next = "BACK", reply = "Thank you, and the kodo that carried it will thank you too, in its own slow way.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "You'd charge a starving man for water.", next = "BACK", reply = "I would charge him what the water cost me to bring here, and then I would give him the second cup free.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They think they do, and then I have three of them sick in their tents with purple tongues. The plants here aren't like the ones in Mulgore, and the caravans only bring so much food, so we have to learn the forest or go hungry." } },
      choices = {
        { text = "I'll teach them which plants to trust. The forest provides.", next = "BACK", reply = "Thank you, they would be very grateful, though they would never say so, because they are braves.", fx = { align = { light = 1 } } },
        { text = "Let them get bitten. It's how I learned.", next = "BACK", reply = "Perhaps that is how you learned, but my braves are worth more to me than a lesson in purple tongues.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Sheendra Tallgrass, and I keep the camp's trade goods. Everything comes the long way from Thunder Bluff, by kodo through Thousand Needles, so I count every spool twice and charge a little more than you'd like." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! If you could ask the spirits to keep the kodo caravans dry through Thousand Needles, I'd stop charging extra for damp thread." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Bless my caravans if you've a mind to, because every one that arrives whole feels like an answered prayer." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "I'll sell to you like anyone else, but you have the look of someone who takes things, so I'll count my spools after you leave. I hope you won't take that personally." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue! Then you'll understand why I count every spool twice, because I've had a few of your sort pass through and I'm still short three bolts of mageweave." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage, and you'll want cloth for robes, I suppose. The caravans bring good wool from Mulgore, but you mages always want something finer, and finer costs more to haul." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. Good, the next caravan from Thunder Bluff needs guarding through the Needles, and the last guards spent more time drinking than guarding." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. You'll have come down through the Needles, then, and seen what that road does to a kodo's feet." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! I'll sell you herbs and cloth like anyone, but if you could tell me which of the plants out here are safe to eat, I'd count that a fair trade." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin, all the way out here. Everything comes the long way to Mojache, and it seems the Light does too." },
      },
      again = {
        { id = "h_again", text = "What else, friend? The Earth Mother's roads are long, so I'm in no hurry." },
        { id = "h_again2", text = "Ask what you like; I'm only counting, and a tauren can count and listen at once." },
      },
      choices = {
        { text = "Is the road from Thunder Bluff really that dangerous, Sheendra?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The caravans on this road must have trouble.", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "How do the caravans get through?", next = "caravans" },
        { text = "What's Camp Mojache for, out here?", next = "camp" },
        { text = "Others must trade here too.", next = "trade" },
        { text = "You can't blame every rogue for one thief.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I'd pay well for good cloth, Sheendra.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "The road from Thunder Bluff must be a dangerous one.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How do the kodos hold up on the long road, Sheendra?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do the braves not know which plants are safe, Sheendra?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Will you trade with a Forsaken paladin, Sheendra?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
        { text = "The Horde has every right to be here.", next = "BACK", reply = "It does, and I am glad you think so, because the night elves would have us think otherwise.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "The night elves were here first.", next = "BACK", reply = "They were, and I do not deny it, but the forest is wide, and the Horde needs a place to stand.", fx = { align = { order = 1 }, affinity = -1 } },
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
        { text = "I'll ride with the next caravan, then.", next = "BACK", reply = "Then the drivers will be glad of you, and so will I, because a caravan with a caster comes home whole.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Caravans are traders' business. I've my own.", next = "BACK", reply = "That is your choice, and I will not argue, but the road is long and a little help goes a long way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Long and wet and full of centaur, and the Grimtotem watch from their pinnacle the whole way through the Needles. Every caravan that arrives whole is a small miracle, and I don't trust miracles, so I count the spools twice." } },
      choices = {
        { text = "Then the bluff should send better guards for the caravans.", next = "BACK", reply = "I have written to the bluff twice, and they tell me the guards are needed elsewhere, as they always are.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then trade with whoever's closer, and forget the long road.", next = "BACK", reply = "There is nobody closer, friend, unless you count the ogres, and they do not take coin.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I traded in Thunder Bluff before I came here. The work's harder, but the people are kinder." } },
    advice = { { id = "tp_ad", text = "Never leave your goods unwatched at night. The Woodpaw gnolls will steal anything that isn't tied down, and they will chew through the rope if it is." } },
    cairne = { { id = "tp_cairne", text = "Cairne's caravans make the long walk from Thunder Bluff to Mojache, and they always arrive a little lighter than they left. The road takes its toll, and so do the centaur." } },
    centaur = { { id = "tp_centaur", text = "The centaur of Desolace raid the road between here and Thunder Bluff, and I count the caravans that don't come in. The count is too high this season." } },
    thrall = { { id = "tp_thrall", text = "The Warchief keeps the roads open for us, as much as anyone can. He sends grunts to guard the worst stretches, and they eat everything I sell." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Goblin traders come up from Gadgetzan and charge me for sand in the bottom of every sack. I pay, because nobody else sells what they sell." } },
    _none = { { id = "tp_none", text = "That's beyond my shelves, friend. Hadoken Swiftstrider hears more of the forest than I do, so ask him." } },
  },
}
