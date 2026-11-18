-- More of Dustwallow Marsh: "Stinky" Ignatz (bogbean leaves for Morgan Stern), Balos Jacken (the deserters at
-- Lost Point), Privateer Groy (akiris reed at the Theramore docks), Gregor MacVince (horse breeder), Michael
-- (stable master) and Zulrg (Brackenwall's weaponsmith). Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- "Stinky" Ignatz
---------------------------------------------------------------------------
P:NPC {
  key = "stinky", id = TODO_NPC("\"Stinky\" Ignatz"), name = "\"Stinky\" Ignatz",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  temper = { "nervous", "cheerful" }, values = { "practical", "loyal" },
  notices = { "weary", "pet" },
  impression = {
    first = "\"Stinky\" Ignatz was picking bogbean leaves for a cook in Theramore with raptors circling him, and he greeted me like a long-lost brother. The nickname, I noticed, was earned honestly.",
    third = "{name} met \"Stinky\" Ignatz, a nervous leaf-gatherer surrounded by raptors north of North Point Tower.",
  },
  greetings = {
    { id = "g_default", text = "Oh, thank goodness, something that doesn't want to eat me! Stay close, would you? The raptors keep circling." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I don't suppose you'd stand between me and the reeds again? They've got teeth in them, those reeds." },
    { id = "g_active", when = { questActive = TODO_QUEST("Stinky's Escape") }, text = "Ready when you are, and the sooner the better. Just don't let me out of your sight, and shout if anything moves." },
    { id = "g_done", when = { questDone = TODO_QUEST("Stinky's Escape") }, text = "My rescuer! I still have all my fingers, and I count them every morning, and I think of you every time." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You look like the raptors got a few bites in already. Maybe sit a moment before we go, because I'd hate to escort you instead." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Is your {pet} friendly? Only it's sniffing at me the way the raptors do, and I've had about all the sniffing I can stand for one day." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "The name's Ignatz, though everyone calls me Stinky, and after a week in this bog you can probably guess why. The cook Morgan Stern sent me out for bogbean leaves, and the raptors have had me pinned here since noon." },
        { id = "h_active", when = { questActive = TODO_QUEST("Stinky's Escape") },
          text = "Right, the plan is that I pick and you keep the teeth off me, and then we both walk out of here alive. I'm very fond of that last part." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Stinky's Escape") },
          text = "I got the leaves home, every last one, and I owe you for that. I've stopped coming this far north alone, I'll tell you, and I've started whistling so the raptors know I'm coming." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Oh! You're Horde, but you're not trying to eat me, so you're the best company I've had all day. I pick for whoever pays, friend, and Mebok Mizzyrix down in Ratchet pays as well as anybody." },
      },
      again = {
        { id = "h_again", text = "Anything else? Talk quietly, though, because I think they can hear us." },
        { id = "h_again2", text = "Go on, I'm listening, and watching the reeds while I do it." },
      },
      choices = {
        { text = "What are bogbean leaves good for?", next = "leaves" },
        { text = "How did the raptors get you cornered?", next = "raptors" },
        { text = "I'll guess the nickname has nothing to do with the bog.", next = "name" },
        { text = "I'll get you out of here. Stay behind me.", next = "escort", when = { questBefore = TODO_QUEST("Stinky's Escape") } },
        { text = "You'd be safer travelling with a hunter, Ignatz.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Stay put. I've other business first.", next = "END" },
      },
    },
    leaves = {
      lines = {
        { id = "le_default", text = "Soup, I think, or a sauce, or something Morgan swears will make the whole garrison stand up straighter. He's working on a new recipe, and he says the leaves only grow up here where the ground stays wet." },
        { id = "le_horde", when = { faction = "Horde" }, text = "For cooking, mostly, though the goblins in Ratchet buy them for things I'd rather not ask about. Theramore's cook pays me in soup and Ratchet pays me in silver, and I'm a man who likes both." },
      },
      choices = {
        { text = "Morgan Stern's soup is worth a raptor or two?", next = "leaves_morgan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leaves_morgan = {
      lines = { { id = "lm_default", text = "You haven't tasted it, then! He's got family who cook in Stormwind, at a fancy place I could never afford, and he says the leaves will make his name. I just want to see the bowl before the raptors see me." } },
      choices = {
        { text = "Then let's get his leaves home.", next = "escort", when = { questBefore = TODO_QUEST("Stinky's Escape") } },
        { text = "A fine reason to risk your neck.", next = "BACK" },
      },
    },
    raptors = {
      lines = { { id = "ra_default", text = "I went a bit further north than I meant to, because the best patches are always just a little further on. Then one raptor turned into three, and three turned into the whole pack, and I've been standing very still ever since." } },
      choices = {
        { text = "Why not just run for North Point Tower?", next = "raptors_run" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raptors_run = {
      big = true,
      lines = { { id = "rr_default", text = "Have you seen how fast they are? I'd make it about ten steps. Some of the soldiers say the raptors should be cleared out of the north marsh altogether, and right now I'm inclined to agree with them." },
      },
      choices = {
        { text = "Clear them out. The road should be safe for honest folk.", next = "BACK", reply = "You'd have my thanks, and so would every leaf-picker in the marsh, all three of us. Just start with the ones that know my scent.", fx = { align = { order = 1 } } },
        { text = "It's their marsh. Pick somewhere they aren't.", next = "BACK", reply = "Fair, fair, I'm the one who wandered in. But the leaves grow where they grow, friend, and the raptors happen to like the same spots.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "Ha! You're quicker than the soldiers at North Point, and they named me. It's the bog, mostly, and the leaves, which smell worse than they taste, and maybe a little bit me, if I'm honest." } },
      choices = {
        { text = "Well, I've smelled worse.", next = "BACK", reply = "That's the kindest thing anyone's said to me all month. I'll tell Morgan you said so.", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Stand downwind, then.", next = "BACK", reply = "I've been standing downwind of everyone for a year. The raptors still find me, so I don't think it's working.", fx = { trait = { witty = 1 } } },
      },
    },
    escort = {
      lines = { { id = "es_default", text = "You will? Oh, bless you! I'll need a few minutes at each patch, so keep the critters busy while I pick, and once I've got enough we head straight back south." } },
      choices = {
        { text = "Pick fast, and don't wander off.", next = "END" },
        { text = "Wait, tell me something first.", next = "BACK" },
      },
    },
    hunter = {
      lines = { { id = "hu_default", text = "You know, I've thought about it, but hunters keep wanting to tame the raptors instead of chasing them off. Can you tame one that'll carry leaves? Because I'd pay for that." } },
      choices = {
        { text = "Raptors don't carry baskets, Ignatz.", next = "BACK" },
        { text = "I'll think on it.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I pick things for people who'd rather not get their boots wet. It doesn't pay much, but it's honest, and it smells." } },
    advice = { { id = "tp_ad", text = "Never go a little further on for a better patch. That's how I got here." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, friend. I mostly know leaves, and where the raptors sleep." } },
  },
}

---------------------------------------------------------------------------
-- Balos Jacken
---------------------------------------------------------------------------
P:NPC {
  key = "balos", id = TODO_NPC("Balos Jacken"), name = "Balos Jacken",
  bible = "bibles/more_folk.md", role = "soldier", tier = "quest",
  temper = { "bitter", "weary" }, values = { "practical", "loyal" },
  notices = { "soldier", "class" },
  impression = {
    first = "Balos Jacken leads the deserters squatting in the old tower at Lost Point, and he surrendered with very bad grace. He blames Vimes, the marsh and one man named Reethe, roughly in that order.",
    third = "{name} met Balos Jacken, the deserter lieutenant holed up at Lost Point.",
  },
  greetings = {
    { id = "g_default", text = "Put that away, will you? I said we'd cooperate, and I meant it, more or less." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Vimes must have run out of errands for the rest of his lackeys." },
    { id = "g_active", when = { questActive = TODO_QUEST("The Deserters") }, text = "Did Vimes send you? Couldn't do his dirty work himself, could he?" },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = "WARRIOR", faction = "Alliance" },
      text = "You carry yourself like a soldier. Give it a year in this swamp on half rations, and see how straight you're standing then." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, come to judge me? Get in line behind the captain and my own conscience, friend." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Balos Jacken, once of the Theramore Guard, and before that of Kul Tiras, and now of this leaking tower. Ask what you came to ask, and then leave us to the mosquitoes." },
        { id = "h_active", when = { questActive = TODO_QUEST("The Deserters") },
          text = "You want Reethe, I suppose. Everyone wants Reethe, and nobody wanted him when he was ours." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Deserters") },
          text = "So Vimes is sending Caldwell after us. Well, Caldwell will find an empty tower if he takes his time about it, and I suspect he will." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde, out here? We've no quarrel with you, whatever Theramore says, and I'd rather keep it that way. What do you want with a handful of deserters?" },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, before the lads lose their nerve." },
        { id = "h_again2", text = "Go on. I've nowhere to be, and that's rather the problem." },
      },
      choices = {
        { text = "Tell me about Paval Reethe.", next = "reethe" },
        { text = "Why did you leave the Guard?", next = "why" },
        { text = "You wear Theramore's tabard but you're Kul Tiran.", next = "kultiras" },
        { text = "Captain Vimes wants answers from you.", next = "vimes", when = { faction = "Alliance" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    reethe = {
      lines = { { id = "re_default", text = "Reethe? That coward wouldn't stop raiding the ogres' stores up at Brackenwall, and we're not so many that we can stand against the Stonemaul if they come looking. He crossed the line once too often, so we threw him out to fend for himself." } },
      choices = {
        { text = "Where would he go?", next = "reethe_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reethe_where = {
      lines = { { id = "rw_default", text = "Somewhere he thinks nobody's looking, and in this marsh that's anywhere. The marsh isn't so big that Vimes can't find him, though, if he puts a man on it who actually wants to." } },
      choices = {
        { text = "You think someone doesn't want him found?", next = "reethe_hint" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reethe_hint = {
      lines = { { id = "rh_default", text = "I think a lot of things after dark, friend, and most of them I keep to myself. Reethe talked big about a burned inn and a black shield before we threw him out, and I didn't care to hear the end of it." } },
      choices = {
        { text = "That's worth telling Vimes.", next = "BACK" },
        { text = "You're hiding something.", next = "BACK", reply = "Everybody out here is hiding something. I'm just honest enough to say so.", fx = { trait = { skeptical = 1 } } },
      },
    },
    why = {
      big = true,
      lines = { { id = "wh_default", text = "Theramore built towers all over this marsh and then couldn't spare the men to hold them. We sat at Lost Point for months on half rations, watching the fog, and one morning we stopped waiting for relief and just stayed." } },
      choices = {
        { text = "An oath is an oath. You should have held.", next = "BACK", reply = "Spoken like someone who's never eaten swamp turtle three meals running. Still, you're right, and that's the worst of it.", fx = { align = { order = 1 } } },
        { text = "Theramore abandoned you first. I don't blame you.", next = "BACK", reply = "You'd be the first who doesn't. Don't say that too loudly in Theramore, though, or they'll find you a tower of your own.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kultiras = {
      lines = { { id = "kt_default", text = "Most of us came over with the Lady's fleet, back when she brought the refugees across the sea. Kul Tiras is a long way off, and nobody there will thank a man who walked away from Theramore's colours." } },
      choices = {
        { text = "Then you've nowhere to go.", next = "kultiras_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kultiras_home = {
      lines = { { id = "kh_default", text = "Nowhere at all, which is why we're squatting in a tower Theramore forgot it owned. Some of the lads talk about Booty Bay, where nobody asks questions, but they've been talking about it for a long time." } },
      choices = {
        { text = "Booty Bay asks plenty of questions. About coin.", next = "BACK" },
        { text = "Go home and face it. It's better than this.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    vimes = {
      lines = { { id = "vi_default", text = "Then Vimes can come and ask me himself. He was always a fair man, I'll give him that, but a fair man still hangs deserters if the law says so." } },
      choices = {
        { text = "He's sending Caldwell, not a hangman.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Sailor, soldier, deserter. That's the short of it, and the long of it isn't any prettier." } },
    advice = { { id = "tp_ad", text = "Never take a post nobody's coming to relieve." } },
    _none = { { id = "tp_none", text = "I've been in a tower in a swamp for months, friend. I know fog, and not much else." } },
  },
}

---------------------------------------------------------------------------
-- Privateer Groy
---------------------------------------------------------------------------
P:NPC {
  key = "groy", id = TODO_NPC("Privateer Groy"), name = "Privateer Groy",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "theramore" }, temper = { "sharp", "gruff" }, values = { "profit", "practical" },
  notices = { "purse", "stealth" },
  impression = {
    first = "Privateer Groy loiters by Theramore's docks shouting about late shipments, and he sells akiris reed to a client he won't name. He treats every stranger as either a courier or a nuisance.",
    third = "{name} met Privateer Groy, an impatient reed dealer on the Theramore docks.",
  },
  greetings = {
    { id = "g_default", text = "What? I've got better things to do than talk to the likes of you, so make it worth my while." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Unless you've got a bundle under your arm, I'm busy." },
    { id = "g_active", when = { questActive = TODO_QUEST("Akiris by the Bundle") }, text = "Bloads sent ya, did he? Well, whaddaya got for me?" },
    { id = "g_done", when = { questDone = TODO_QUEST("Akiris by the Bundle") }, text = "Not bad, not bad at all. Another bundle like that and my client'll be a happy man." },
  },
  notice = {
    { id = "n_purse", cat = "purse", when = { money = { min = 1000000 } },
      text = "Your purse is heavy enough to hear from here. Careful on these docks, friend, because not everyone's as honest as me." },
    { id = "n_stealth", cat = "stealth", when = { class = "ROGUE" },
      text = "You walk like you've done a bit of smuggling yourself. Don't get ideas about my crates." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Groy, privateer, and I'm waiting on a shipment that should've been here days ago. Orcs are smarter than the couriers I get, and I've half a mind to hire an orc next time." },
        { id = "h_active", when = { questActive = TODO_QUEST("Akiris by the Bundle") },
          text = "Huh, Bloads sent ya? He's got sense after all. Hand it over and let's see if it's the good stuff." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Akiris by the Bundle") },
          text = "My client was pleased, and when he's pleased I'm pleased, and that's rare enough you should treasure it. If Bloads has more, you know where I stand." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde in Theramore, and on my dock? You've got nerve, I'll give you that. Say what you want quick, before the Guard notices you." },
      },
      again = {
        { id = "h_again", text = "What else? I'm watching the water, not you." },
        { id = "h_again2", text = "Speak up, and make it worth the breath." },
      },
      choices = {
        { text = "What shipment are you waiting on?", next = "akiris" },
        { text = "Who's this client of yours?", next = "client" },
        { text = "Privateer? On a Theramore dock?", next = "privateer" },
        { text = "I've come from Bloads in Booty Bay.", next = "bloads", when = { questActive = TODO_QUEST("Akiris by the Bundle") } },
        { text = "I'll leave you to your waiting.", next = "END" },
      },
    },
    akiris = {
      lines = { { id = "ak_default", text = "Akiris reed, from the coast down south, and it sells here for more than you'd think a bundle of weeds could fetch. Bloads in Booty Bay gathers it, I sell it, and the couriers in between are the reason I'm going grey." } },
      choices = {
        { text = "Why does a weed sell so well?", next = "akiris_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    akiris_why = {
      lines = { { id = "aw_default", text = "Because folk who know what to do with it can't get it anywhere else north of Stranglethorn. I don't ask what they do with it, and they don't ask what I pay for it, and that's what I call a healthy market." } },
      choices = {
        { text = "And the Guard doesn't ask either?", next = "guard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guard = {
      big = true,
      lines = { { id = "gu_default", text = "The Guard asks what's in the crate, and I tell 'em reeds, and they look at the reeds and go away bored. It's all perfectly legal, mostly, and the rest of it isn't their business." } },
      choices = {
        { text = "Mostly legal isn't legal. Keep it clean, Groy.", next = "BACK", reply = "Clean as a whistle, friend, and twice as noisy when I'm cheated. Go tell the Guard if it makes you feel better.", fx = { align = { order = 1 } } },
        { text = "What the Guard doesn't see can't hurt them.", next = "BACK", reply = "Now there's someone who understands commerce. Keep thinking like that and you'll do well on the docks.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    client = {
      lines = { { id = "cl_default", text = "A man who pays on time, which is more than I can say for the sea. You don't need his name, and if I gave it to you, I'd have to find a new client." } },
      choices = {
        { text = "Fair enough. Your business is your business.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    privateer = {
      lines = { { id = "pr_default", text = "I sailed with a letter once, and a letter makes a pirate a privateer, near enough. Now I sell to Theramore folk and keep my boots on dry boards, and I'll thank you not to ask whose letter it was." } },
      choices = {
        { text = "Does Bloads still sail with a letter?", next = "bloads" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bloads = {
      lines = { { id = "bl_default", text = "Bloads? He sits in Booty Bay drinking rum and gathering reeds, and some weeks I couldn't tell you which he's better at. He's reliable, though, and in my trade that's worth more than a good ship." } },
      choices = {
        { text = "I'll tell him you said so.", next = "BACK", reply = "Don't you dare. He'll raise his prices.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I sailed, I stopped sailing, and now I sell reeds. Don't make it more than it is." } },
    advice = { { id = "tp_ad", text = "Never pay a courier before he's delivered. Never." } },
    _none = { { id = "tp_none", text = "Is it akiris reed? No? Then I don't care about it." } },
  },
}

---------------------------------------------------------------------------
-- Gregor MacVince
---------------------------------------------------------------------------
P:NPC {
  key = "macvince", id = TODO_NPC("Gregor MacVince"), name = "Gregor MacVince", title = "Horse Breeder",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "theramore" }, temper = { "warm", "proud" }, values = { "craft", "loyal" },
  notices = { "mount", "race" },
  impression = {
    first = "Gregor MacVince breeds horses on an island in a swamp, and he talks about them as companions for the ages. He only sells to humans and to those Stormwind trusts, and he is apologetic but firm about it.",
    third = "{name} met Gregor MacVince, the horse breeder on Theramore Isle.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you! Come and see the finest horses this side of the sea, and mind the mud by the fence." },
    { id = "g_back", when = { metBefore = true }, text = "Back to look at the horses again? I don't blame you, friend, they're worth a second look." },
  },
  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Now that's a fine animal under you! Let me see the hooves, though, because this marsh rots a hoof faster than anything." },
    { id = "n_race", cat = "race", when = { race = "Human" },
      text = "One of Stormwind's own, I'd wager. The horses will know it too, because they're bred from good Elwynn stock." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gregor MacVince, horse breeder. Years of careful breeding went into every one of these steeds, and a horse is a companion for life, so take your time choosing." },
        { id = "h_notallowed", when = { reputation = { faction = "Stormwind", max = "revered" }, race = { "Dwarf", "Gnome", "NightElf" } },
          text = "I'm sorry, friend, but I can't sell horses to anyone Stormwind doesn't hold in the highest regard, and I'm afraid that isn't you yet. Earn the kingdom's trust, and then we'll do business." },
        { id = "h_exalted", when = { reputation = { faction = "Stormwind", min = "exalted" }, race = { "Dwarf", "Gnome", "NightElf" } },
          text = "Stormwind speaks very highly of you, and that's good enough for me. Come and choose, and don't let anyone tell you a horse isn't for your sort." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "I've nothing for you, I'm afraid, and the Guard will be along any moment to ask why you're here. These horses stay with the Alliance." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I could talk horses all day." },
        { id = "h_again2", text = "Go on, ask. The grey's listening too." },
      },
      choices = {
        { text = "Show me the horses.", next = "BUSINESS" },
        { text = "How do you keep horses healthy in a swamp?", next = "swamp" },
        { text = "Why only sell to Stormwind's friends?", next = "rule" },
        { text = "Where do these horses come from?", next = "stock" },
        { text = "A horse is only a beast. I'll pick any.", next = "beast" },
        { text = "Good day.", next = "END" },
      },
    },
    swamp = {
      lines = { { id = "sw_default", text = "With great difficulty, friend! I keep them on the high ground of the isle, I dry their hooves every evening, and I check them for leeches twice a day. The marsh wants everything it touches, and I don't let it touch my horses." } },
      choices = {
        { text = "Leeches on a horse?", next = "swamp_leech" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swamp_leech = {
      lines = { { id = "sl_default", text = "Big as your thumb and twice as greedy. The soldiers laugh at me with my little pail of salt, but not one of my horses has gone lame since I came to Theramore." } },
      choices = {
        { text = "Then you've earned the right to laugh back.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rule = {
      big = true,
      lines = { { id = "ru_default", text = "These are the finest steeds you'll find anywhere, and we wouldn't want them in the hands of our enemies. I'm not saying you're an enemy, of course, only that Stormwind decides who's a friend, and I abide by it." } },
      choices = {
        { text = "That's a sound rule. Trust should be earned.", next = "BACK", reply = "I think so too, though I hate turning away a good rider. Earn their trust, and come back to me.", fx = { align = { order = 1 } } },
        { text = "A horse should go to whoever treats it best.", next = "BACK", reply = "My heart says yes, friend, but the kingdom's rules say otherwise. I'll keep to the rules and hope they're right.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock = {
      lines = { { id = "st_default", text = "Elwynn bloodlines, brought over by ship and bred here with great patience. The chestnut mare's grandsire pulled carts in Goldshire, and now look at her, the proudest beast on the isle." } },
      choices = {
        { text = "Do you miss Elwynn?", next = "stock_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock_home = {
      lines = { { id = "sh_default", text = "Every spring, when I know the meadows are turning green there. But the Lady needed folk to build her city, and a city needs horses, so here I am, salting leeches." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    beast = {
      lines = { { id = "be_default", text = "Only a beast? A horse will carry you out of a fight you can't win and wait for you outside a tavern you shouldn't have gone into. Pick carefully, friend, because it'll be choosing you as well." } },
      choices = {
        { text = "Fair point. I'll choose carefully.", next = "BACK", fx = { affinity = 1 } },
        { text = "Let's see them.", next = "BUSINESS" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've bred horses all my life, first in Elwynn, now here. They're better company than most people." } },
    advice = { { id = "tp_ad", text = "Dry your horse's hooves every night in this marsh, or you'll be walking." } },
    _none = { { id = "tp_none", text = "I couldn't say, friend. Ask me about horses and I'll talk till dusk." } },
  },
}

---------------------------------------------------------------------------
-- Michael (stable master)
---------------------------------------------------------------------------
P:NPC {
  key = "michael_stable", id = TODO_NPC("Michael"), name = "Michael", title = "Stable Master",
  bible = "bibles/more_folk.md", role = "stablemaster", tier = "service",
  communities = { "theramore" }, temper = { "calm", "gentle" }, values = { "duty", "craft" },
  notices = { "pet" },
  impression = {
    first = "Michael keeps the stables outside Theramore's inn and spends half his day brushing mud out of animals that don't belong to him. He seemed to like them more than their owners, and didn't hide it.",
    third = "{name} met Michael, the stable master outside the Theramore inn.",
  },
  greetings = {
    { id = "g_default", text = "Need a pen for a beast? I've room, and I've a brush for the mud." },
    { id = "g_back", when = { metBefore = true }, text = "Back for your animal, or leaving another with me? Either way, it's been well fed." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} has been in the marsh, I can tell, and it's carrying half of it in its coat. Leave it with me a night and I'll have it clean." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Michael, stable master. I look after the animals of folk staying at the inn, and of hunters who've more companions than they can keep at heel." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter. I'll keep whatever you leave with me fed, dry and out of the mud, which is more than the marsh will do for it." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a cat in the back that needs brushing." },
        { id = "h_again2", text = "Go on. The animals don't mind if we talk." },
      },
      choices = {
        { text = "I need to stable a companion.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What do people leave with you?", next = "beasts" },
        { text = "How do you keep animals clean in this marsh?", next = "mud" },
        { text = "You seem fonder of the beasts than their owners.", next = "fond" },
        { text = "That's all.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "bs_default", text = "Cats from Ashenvale, bears from Loch Modan, once a crocolisk that ate a bucket. Most of them come off the boat from Menethil with sea legs and sour tempers, and it takes a day before they'll let me near them." } },
      choices = {
        { text = "A crocolisk ate a bucket?", next = "bucket" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bucket = {
      lines = { { id = "bu_default", text = "Handle and all, and it looked very pleased with itself afterwards. Its owner paid for the bucket and never asked for it back, which I thought was fair." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mud = {
      lines = { { id = "mu_default", text = "I don't, mostly, I just move it about. The trick is to keep them off the low ground at night, because that's when the flies come up out of the bog." } },
      choices = {
        { text = "The flies are bad?", next = "flies" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flies = {
      lines = { { id = "fl_default", text = "Bad enough that I burn a pot of marsh herbs by the pens every evening. It smells awful, but the animals sleep, and so do I." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fond = {
      big = true,
      lines = { { id = "fo_default", text = "A beast never lies about how it feels, and it doesn't leave without paying. Some owners treat their companions like baggage, though, and those I could do without." } },
      choices = {
        { text = "A companion deserves the same care as a friend.", next = "BACK", reply = "That's how I see it. You'd be welcome at my stables any day.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A beast is a tool. Feed it and use it.", next = "BACK", reply = "Then I'll feed it for you, and use a bit more care than you would. That's my job, I suppose.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've always been better with animals than people. Theramore needed a stable master, and here I am." } },
    advice = { { id = "tp_ad", text = "Keep your companion off the low ground at night, and check it for leeches." } },
    _none = { { id = "tp_none", text = "I wouldn't know. Ask me about animals, though." } },
  },
}

---------------------------------------------------------------------------
-- Zulrg (Brackenwall weaponsmith)
---------------------------------------------------------------------------
P:NPC {
  key = "zulrg", id = TODO_NPC("Zulrg"), name = "Zulrg", title = "Weaponsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "brackenwall" }, temper = { "gruff", "proud" }, values = { "proud", "craft" },
  notices = { "class", "race" },
  impression = {
    first = "Zulrg sells weapons in Brackenwall, and he judges each one by how hard it hits rather than how it looks. He speaks of himself by name and seems a little proud that he can count his stock.",
    third = "{name} met Zulrg, the Stonemaul ogre who sells weapons in Brackenwall Village.",
  },
  greetings = {
    { id = "g_default", text = "Zulrg has axes, swords and big sticks. You want to hit things, Zulrg has the thing to hit with." },
    { id = "g_back", when = { metBefore = true }, text = "You come back. Did the last weapon break? Zulrg has more." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You are a fighter, Zulrg can tell, because you look at the axes before you look at Zulrg. That is the right order." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Big one! Zulrg likes selling to tauren, because tauren can lift the big weapons and do not complain about weight." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Zulrg sells weapons for the Stonemaul and for the Horde. Zulrg does not make them, but Zulrg knows which ones break and which ones break heads." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You are not Horde. Zulrg does not sell to you, and the orcs will be cross if Zulrg talks too long, so be quick." },
      },
      again = {
        { id = "h_again", text = "What else? Zulrg is counting axes." },
        { id = "h_again2", text = "Ask Zulrg. Zulrg knows weapons." },
      },
      choices = {
        { text = "Let me see your weapons.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "Which weapon would you choose?", next = "choose" },
        { text = "Where do the weapons come from?", next = "source" },
        { text = "How do the Stonemaul like living with orcs?", next = "orcs" },
        { text = "Farewell, Zulrg.", next = "END" },
      },
    },
    choose = {
      lines = { { id = "ch_default", text = "The big stick, always. A sword is clever and an axe is sharp, but a big stick never gets dull, and if it breaks you find another tree." } },
      choices = {
        { text = "A sword needs skill. That's its strength.", next = "choose_skill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose_skill = {
      big = true,
      lines = { { id = "cs_default", text = "Orcs say this too. Orcs say ogres only smash and do not think. Zulrg thinks the thinking is for before the fight and the smashing is for during, so which is better?" } },
      choices = {
        { text = "Thinking. A clever fighter wins the long fight.", next = "BACK", reply = "Hmm. Zulrg will think about this, which proves you are right a little. Do not tell the orcs.", fx = { align = { order = 1 } } },
        { text = "Smashing. Hit hard and the fight is short.", next = "BACK", reply = "Ha! You talk like a Stonemaul. Zulrg will sell you the biggest stick.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = { { id = "so_default", text = "Some come from Orgrimmar on the wind riders, and some come off dead Theramore soldiers, and some Zulrg finds in the marsh. Zulrg cleans them all, so you cannot tell which is which." } },
      choices = {
        { text = "You sell weapons taken from the dead?", next = "source_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    source_dead = {
      lines = { { id = "sd_default", text = "Dead men do not need axes. Overlord Mok'Morokk says the Stonemaul must waste nothing since the black dragons took the old village, so Zulrg wastes nothing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "or_default", text = "Orcs talk a lot and they look at ogres like ogres are slow. But orcs helped when the dragons came, and orcs bring good steel, so Zulrg sells to orcs and says nothing." } },
      choices = {
        { text = "You don't seem slow to me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Zulrg is Stonemaul and Zulrg sells weapons, and that is the whole of Zulrg." } },
    advice = { { id = "tp_ad", text = "Buy the heavy one. Light weapons are for small hands." } },
    _none = { { id = "tp_none", text = "Zulrg does not know that thing. Zulrg knows axes, so ask about axes." } },
  },
}
