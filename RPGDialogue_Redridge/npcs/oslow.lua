-- Foreman Oslow, at the Everstill Bridge. Voice: bibles/oslow.md
-- On schedule, under budget, and with no tools.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "oslow", id = TODO_NPC("Foreman Oslow"), name = "Foreman Oslow",
  prejudice = { race = "Gnome", amount = 8, why = "A mason's scorn for gnomish engineering; blames Gnomeregan's fall on building it wrong." },
  bible = "bibles/oslow.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "proud" }, values = { "ambitious", "honest" },
  notices = { "craft", "swim" },

  impression = {
    first = "Foreman Oslow told me to keep walking unless I carried a hammer. His bridge was meant to be finished before the rains, and the orcs have taken that personally.",
    third = "{name} met Foreman Oslow, who is rebuilding the Everstill Bridge at Lakeshire despite the orcs' interference.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "A gnome. If you're from the Tinker Town office with another plan for a bridge that folds up and walks away, the answer's still no, and I'll thank you not to measure anything." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Ah, it's you. I was wrong about gnomes, or about one of them at least, and I've told my lads to stop calling the leaning post 'the Gnomeregan'." },
    { id = "g_busy", text = "Unless you're carrying a hammer, keep walking." },
    { id = "g_tools", when = { questActive = TODO_QUEST("The Lost Tools") }, text = "My toolbox? Have you got my toolbox? Then why on earth are you dry?" },
    { id = "g_after", when = { questDone = TODO_QUEST("The Everstill Bridge") }, text = "Look at that span, go on, look at it. That's craftsmanship, that is." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away} and the bridge still isn't finished, though I suppose that's hardly your fault. Unless you've brought a hammer, of course." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've built yourself up since you went diving for my tools, I'll say that. Good sturdy work, like a proper span." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked someone in town round to your way of thinking. Come and talk the Crown into paying for my bridge, if you're so clever." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { any = { { profession = "Blacksmithing" }, { profession = "Engineering" }, { profession = "Mining" } } },
      text = "You've a tradesman's hands. If you ever want honest work that isn't stabbing things, I'm hiring; I'm always hiring, because nobody stays." },
    { id = "n_wet", cat = "swim", when = { questReady = TODO_QUEST("The Lost Tools") },
      text = "You're dripping on my plans! Never mind that; is that my box? That's my box!" },
  },

  start = "hello",
  nodes = {
    prej = {
      big = true,
      lines = { { id = "prej_default", text = "I trust stone, mortar and an honest plumb line. Gnomes trust gears and steam and their own cleverness, and look what happened to their city, gassed and flooded under their own feet." } },
      choices = {
        { text = "Gnomeregan fell to treachery, not to bad engineering.", next = "prej_a", fx = { align = { order = -1 } } },
        { text = "Stone is stone. Nobody ever went wrong building with it.", next = "prej_b", fx = { align = { order = 1 } } },
        { text = "I'd like to see how a mason builds, Foreman.", next = "prej_calm", fx = { affinity = 1 } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    prej_a = {
      lines = { { id = "prej_a_default", text = "Treachery, they say, and maybe so, but a city you can poison from the inside was never built right. You'll not talk me round on that one." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_b = {
      lines = { { id = "prej_b_default", text = "Now you're talking sense! Stone doesn't blow up, stone doesn't need oiling, and stone doesn't sit in a workshop three weeks waiting on a part from Ironforge." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_calm = {
      lines = { { id = "prej_calm_default", text = "Would you, now? Then come by the bridge any morning and I'll show you a keystone set properly. You might take it home to your people, for all the good it'll do." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Not if the orcs keep interfering. They've taken it personally, it seems. Your spirits might help, if they're willing." } },
      choices = {
        { text = "Then let's finish it, Oslow. I'll help.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget the bridge. Defend the town.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Guarding the crew while they work, because every time I turn my back the gnolls make off with another load of tools. I'd finish this bridge before the rains if I had one good fighter at the far end." } },
      choices = {
        { text = "I'll guard your crew. The bridge needs finishing.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll go after the gnolls, not stand around watching masons.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Foreman.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The gnolls' dogs do, digging under the stone piles, and a great boar knocked over two scaffolds last week as though they were made of straw. I'd pay a hunter in thanks, which is all I've got, to keep them off." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks better behaved than the gnolls' dogs, {class}, but I'd still rather it stayed off my scaffolding." },
      },
      choices = {
        { text = "I'll keep the beasts away from your bridge.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your scaffolding's your problem. I've bigger game.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Foreman.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "No, they didn't, and I've a fair idea the gnolls had them, but if you think one of my lads is skimming, you'd best bring proof. I trust my crew the way I trust a good keystone." } },
      choices = {
        { text = "I'll find the thief, whoever it turns out to be.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Pinch them back and say nothing. Simpler.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Where did you lose them?", next = "tools_where" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "A wizard could drop my bridge in the lake in a week, more like, and I've met the sort who'd do it for a laugh. Stone is laid by hand and checked by eye, and that's how bridges stay up." } },
      choices = {
        { text = "Craft and rules. I respect that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Bridges fall either way. Mine would be faster.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Can I see your plans?", next = "plans" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "And frighten my crew into the bargain, and the fish, and every boat on the lake. If you want to frighten orcs, go across and do it there, because this side of the water stays clean while I'm foreman." } },
      choices = {
        { text = "Clean it stays. I'll take it across.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear works on both banks, Oslow.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Why build the bridge at all?", next = "why" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They ask for their wages, on time, and they get them, and that's the only blessing I can promise. But we cut the names of the lost into the first pier, and if you'd say something over that stone, I'd not stop you." } },
      choices = {
        { text = "I'll say the words over that stone, Foreman.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Pay them and work them, Oslow. Prayer won't raise stone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Foreman.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every one, and I'd tell their mothers so to their faces, because without that bridge Lakeshire is an island the Blackrock can starve at leisure. I don't build bridges for the beauty of them; I build them so people can run." } },
      choices = {
        { text = "Then I'll guard it until the last stone is set.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Bridges come and go, Oslow. I won't bleed for one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Oslow.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Strong enough to stand, aye, but nothing's strong enough against catapults when nobody's guarding the far end. Give me a company of soldiers and one dry month, and I'll give Lakeshire a bridge that outlasts us all." } },
      choices = {
        { text = "The Marshal should send soldiers. Your crew shouldn't stand alone.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget soldiers. Build it quick, and rebuild when it falls.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Oslow's the name. I'm rebuilding the Everstill Bridge on schedule and under budget, before the rains, or that was the plan until the orcs had opinions." },
        { id = "h_tools", when = { questBefore = TODO_QUEST("The Lost Tools") },
          text = "My tools came across the lake by boat, and a catapult put the boat at the bottom. They're down there with it, my good hammer and all." },
        { id = "h_tools_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Lost Tools") },
          text = "Off the end of the wreck, at the bottom. Hold your breath, mind the murlocs, and don't drop it on the way up." },
        { id = "h_tools_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Lost Tools"), days = 3 } },
          text = "Rusted shut, but they're mine, and every one has my mark on the handle. Back to work, then." },
        { id = "h_supplies", when = { questActive = TODO_QUEST("The Everstill Bridge") },
          text = "Gnolls ran off with my iron from Stormwind, pikes and rivets both. What does a gnoll want with rivets, when they don't even build?" },
        { id = "h_rains", when = { questDone = TODO_QUEST("The Everstill Bridge") },
          text = "The rains are coming, and the bridge will be done before they do. Write that down somewhere I can point at later." },
        { id = "h_ink", tags = { "news" }, when = { questActive = TODO_QUEST("Ink Supplies") },
          text = "A librarian wants ore, for ink, while I've got a town to fortify. Northshire has a funny idea of what matters this month." },
        { id = "h_rethban", when = { questActive = TODO_QUEST("Rethban Ore") },
          text = "Rethban Caverns, north of town. The gnolls are digging the seam out themselves now, so take it off them and carry it to Paxton yourself." },
        { id = "h_bridge", when = { metBefore = true }, text = "Laid another span yesterday, straight as a ruler, and I stood on it a while. Don't tell the crew, or they'll think I've gone soft about bridges." },
        { id = "h_stonemason", when = { origin = "human_stonemason_child" },
          text = "Your hands say you grew up around a mason's yard. Then you'll know I pay my crew every week, on time, because I've seen what happens in this kingdom when the masons don't get paid." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Unless you're carrying a hammer, keep walking, but if you're carrying a sword, stop, because I've a job for one." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Keep that beast off my scaffolding, because the last dog that climbed it brought down a whole morning's work." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Unless you're carrying a hammer, keep walking, but if you're carrying a blessing, I'll take it for the crew." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Unless you're carrying a hammer, keep walking, though I'll make an exception for one who keeps orcs off my scaffolding." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Unless you can turn into something that carries stone, keep walking, because I've no time for sightseers, even tall ones." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Keep walking unless you've a hammer. Oh, a shaman. Can your earth spirits finish this bridge?" },
      },
      again = {
        { id = "h_again", text = "Something else? Ask, by all means; the measuring line won't run off." },
        { id = "h_again2", text = "Go on. The bridge isn't going anywhere, which is rather the problem." },
      },
      choices = {
        { text = "You don't trust gnomish engineering, do you, Foreman?", next = "prej", when = { prejudiced = true } },
        { text = "Why does the bridge matter so much?", next = "why" },
        { text = "What happened to your tools?", next = "tools" },
        { text = "Where are your building supplies?", next = "supplies" },
        { text = "Brother Paxton needs Rethban ore for his ink.", next = "paxton", when = { questActive = TODO_QUEST("Ink Supplies") } },
        { text = "Northshire's library writes with your ore, I hear.", next = "novice", when = { origin = "human_abbey_novice" } },
        { text = "I know my way around a forge. Show me the plans.", next = "plans", when = { profession = "Blacksmithing" } },
        { text = "Dwarven masons could have that bridge up in a month.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Your missing tools didn't walk off on their own, Foreman.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "A wizard could finish your bridge in a week.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What job do you have for a warrior, Foreman?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do beasts trouble your building site, Foreman?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I could put something in the water to frighten the orcs.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does your crew ever ask for a blessing before work, Foreman?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is the bridge worth the lives it's cost, Foreman?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Will the new bridge be strong enough to stand against the orcs?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Will your bridge be done before the rains, Oslow?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "My father helped rebuild Stormwind and never saw his wages.", next = "xorig_mason", when = { origin = "human_stonemason_child" } },
        { text = "Good luck with the rains.", next = "END" },
      },
    },
    xorig_mason = {
      lines = {
        { id = "xom_default", text = "Him and a hundred others, and I knew a good few of them by their mark on the stone. Some went west in masks when the House of Nobles laughed at the bill, and some, like me, swallowed it and took the Crown's next job, because a bridge doesn't care who's owed." },
      },
      choices = {
        { text = "The ones in masks had a point, Foreman.", next = "xorig_mason2", fx = { align = { order = -1 }, trait = { skeptical = 1 } } },
        { text = "Masks and murder don't settle a debt.", next = "xorig_mason2", fx = { align = { order = 1 } } },
        { text = "Did you ever see any of them again?", next = "xorig_mason2" },
      },
    },
    xorig_mason2 = {
      lines = {
        { id = "xom2_default", text = "I see their work sometimes, in a wall or an arch, and I know whose hands set it. That's the trouble with masons, friend, because the stone outlasts the grudge and the grudge outlasts the man." },
      },
      choices = {
        { text = "My father's still angry about it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Foreman.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "w_default", text = "Without it, every guard, every wagon, every sack of grain goes the long way round the lake. A bridge is just a town's way of not being alone." },
      },
      choices = {
        { text = "I'll help you finish it.", next = "BACK", fx = { affinity = 2, learn = { "everstill_bridge" } } },
        { text = "Pretty speech for a builder.", next = "speech", fx = { trait = { witty = 1 } } },
        { text = "How did it come down?", next = "collapse" },
      },
    },
    speech = {
      lines = { { id = "sp_default", text = "I had it carved on the last bridge. The orcs knocked that one down too." } },
      choices = { { text = "Ha. Fair.", next = "BACK" } },
    },
    collapse = {
      big = true,
      lines = {
        { id = "c_default", text = "The Blackrock hit the town so hard the bridge went with it, blown out in a single afternoon. Putting it back takes a season, if nobody sinks my tools." },
      },
      choices = {
        { text = "Will it hold this time?", next = "collapse_hold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    collapse_hold = {
      lines = { { id = "ch_default", text = "I build bridges to hold, but nobody builds them to hold against orcs with catapults. Somebody should, and give me ten years and it might be me." } },
      choices = {
        { text = "I believe it.", next = "BACK", fx = { affinity = 2 } },
        { text = "Ten years? Lakeshire doesn't have ten weeks.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "Honestly, Oslow. Will it be done before the rains?", tag = "Persuade", next = "collapse_honest",
          check = { pass = { any = { { disposition = { min = 62 } }, { profession = "Blacksmithing" }, { questDone = TODO_QUEST("The Everstill Bridge") } } } },
          fail = { next = "collapse_schedule", fx = { affinity = -1 } } },
      },
    },

    tools = {
      lines = {
        { id = "t_default", text = "Shipped by wagon from Goldshire. The bridge was out, so we loaded them on a boat, and the orcs put a catapult stone through it. Toolbox went to the bottom, my good hammer with it." },
        { id = "t_done", when = { questDone = TODO_QUEST("The Lost Tools") },
          text = "Back on my bench now, thanks to you. I still look across the lake before I put anything in a boat." },
      },
      choices = {
        { text = "Where exactly did it sink?", next = "tools_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tools_where = {
      lines = { { id = "tw_default", text = "The deepest water east of the bridge, with murlocs on the way down and something big out there the fishermen call the Lake Thresher. Ask Baren about it, then swim fast." } },
      choices = {
        { text = "I'll fetch your toolbox.", next = "BUSINESS", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "everstill_bridge" } } },
      },
    },

    supplies = {
      lines = {
        { id = "su_default", text = "We smelted our own iron into swords and shot during the last attack. I sent to Stormwind for more. Redridge gnolls took the whole caravan into the hills behind town.",
          fx = { learn = { "redridge_gnolls" } } },
      },
      choices = {
        { text = "What do you need back?", next = "supplies_need" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies_need = {
      lines = { { id = "sn_default", text = "Iron pikes and iron rivets. A bridge is mostly the bits nobody looks at. Take them off the gnolls and I'll have a span up before the rains." } },
      choices = {
        { text = "Consider it done.", next = "BUSINESS", fx = { affinity = 1, standing = { lakeshire = 1 } } },
        { text = "Gnolls with good iron. Verner must be furious.", next = "supplies_verner" },
      },
    },
    supplies_verner = {
      lines = { { id = "sv_default", text = "He's begging for iron to shoe horses, and a gnoll's using a pike as a back-scratcher. Don't mention it near his forge; he's got hammers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    paxton = {
      lines = { { id = "px_default", text = "Paxton's my usual buyer, and a decent man. But I've walls to raise. If Northshire wants Rethban ore this month, Northshire can dig it." } },
      choices = {
        { text = "Where would I dig?", next = "rethban" },
        { text = "Fair. Something else.", next = "BACK" },
      },
    },
    rethban = {
      lines = { { id = "rb_default", text = "Rethban Caverns, north of town. Bart Rethban found the seam: soft for iron, but it smelts dark and flat, and scribes love it. Redridge gnolls dig there now." } },
      choices = {
        { text = "Then I'll take it off them.", next = "BUSINESS", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    novice = {
      lines = { { id = "nv_default", text = "Northshire? Then you've copied your prayers in my ore and never known it, because Paxton makes his ink from it. Tell him the price went up; it hasn't, but tell him anyway." } },
      choices = {
        { text = "Ha. I'll tell him.", next = "BACK", fx = { affinity = 2 } },
        { text = "Ore makes ink?", next = "rethban" },
      },
    },
    plans = {
      lines = { { id = "pl_default", text = "A tradesman! Look here: new piers on the old footings, iron where the stone gave out. What would you change?" } },
      choices = {
        { text = "Nothing. It's sound.", next = "BACK", fx = { affinity = 1 } },
        { text = "Deeper piers. The lake will find any weakness.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "Build it faster.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },
    collapse_honest = {
      lines = {
        { id = "co_default", text = "Honestly? No, it won't, not with the iron I've got and the crew I've got, and I've known it since the caravan went into the hills. I'll have the main span up, and the rest will be planks and prayer until spring." },
        { id = "co_after", text = "But I'll keep saying before the rains, because the crew works faster for a schedule than for the truth, and so does the town. Don't you go telling Solomon, or he'll write it down." },
      },
      choices = {
        { text = "Your secret's safe, Oslow.", next = "BACK", fx = { affinity = 2 } },
        { text = "Then let's get you more iron.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    collapse_schedule = {
      lines = {
        { id = "cs_default", text = "Before the rains, I said, and I meant it. A foreman who says otherwise had better start looking for another trade." },
        { id = "cs_default2", text = "You sound like the Magistrate. The bridge will be done when I say it'll be done, which is before the rains, which is soon." },
      },
      choices = {
        { text = "If you say so.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "In a month, with dwarven stone and dwarven wages and a dwarven foreman telling me I'm doing it wrong. I've worked with Ironforge crews, and they're the best there is and they never once let me forget it." } },
      choices = {
        { text = "Because they are the best.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
        { text = "Your bridge looks sound to me.", next = "BACK", fx = { affinity = 2 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A foreman hears plenty from a crew on a long shift, and most of it's about the lake. Ask me about any of this, and mind the measuring line." },
    },
    background = { { id = "tp_bg", text = "Every job on time and under budget. That's my whole story, and I mean to keep it true.", next = "why" },
                   { id = "tp_bg2", text = "I'm a foreman: bridges, mostly, and lately this one, again." } },
    advice = { { id = "tp_ad", text = "Measure twice, then look up for catapults." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "Thieves, the lot of them. They took my iron, and now they're digging Rethban's seam; next they'll want my job." } },
    everstill_bridge = { { id = "tp_bridge", text = "Before the rains, and that's not a hope, that's a schedule." } },
    blackrock = { { id = "tp_blackrock", text = "They knock down what I build, and I build it again. One of us is going to get tired, and it isn't me." } },
    _none = { { id = "tp_none", text = "Is it load-bearing? If not, I don't care." } },
  },
}
