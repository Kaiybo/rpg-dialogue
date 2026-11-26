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
    first = "The nickname, I noticed, was earned honestly.",
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
    first = "He blames Vimes, the marsh and Reethe, roughly in that order.",
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
        { text = "Do you blame Lady Proudmoore, like Reethe does?", next = "kt_jaina" },
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
    kt_jaina = {
      big = true,
      lines = { { id = "ktj_default", text = "Not like Reethe, no, because Reethe blames everyone but himself. I loved the Admiral, though, and when I heard how he died I wanted to throw my tabard into the sea. I didn't, and I served her for years after, but I never once looked at her without seeing him." } },
      choices = {
        { text = "You were right to want to throw it.", next = "BACK", reply = "Maybe, but I kept it, and look where it got me anyway. That's the joke, friend.", fx = { align = { light = -1 }, opinion = { jaina = "traitor" } } },
        { text = "She was right to stop him. He'd have ruined Kalimdor.", next = "BACK", reply = "Aye, I know it in my head. It's the rest of me that never caught up.", fx = { align = { light = 1 }, opinion = { jaina = "admire" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    jaina = { { id = "tp_ktjaina", text = "I served her for years, and every day I saw her father in her face." } },
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
    first = "He treats every stranger as either a courier or a nuisance.",
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
    first = "He sells only to humans and those Stormwind trusts, apologetic but firm.",
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
  notices = { "pet" , "class" },
  impression = {
    first = "He likes the animals more than their owners and doesn't hide it.",
    third = "{name} met Michael, the stable master outside the Theramore inn.",
  },
  greetings = {
    { id = "g_default", text = "Need a pen for a beast? I've room, and I've a brush for the mud." },
    { id = "g_back", when = { metBefore = true }, text = "Back for your animal, or leaving another with me? Either way, it's been well fed." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} has been in the marsh, I can tell, and it's carrying half of it in its coat. Leave it with me a night and I'll have it clean." },
    { id = "n_b1", cat = "pet", when = { pet = { family = "Crocolisk" } },
      text = "A crocolisk! I'd ask you to keep it clear of the buckets, if it's all the same to you." },
    { id = "n_b2", cat = "class", when = { class = "DRUID" },
      text = "The animals have all turned to look at you, and they don't do that for me. I'd give a month's wages to know what they see." },
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
        { id = "h_again_b1", text = "Something more? The beasts aren't going anywhere, and neither am I." },
        { id = "h_again_b2", text = "Ask away, while this one finishes her supper." },
      },
      choices = {
        { text = "I need to stable a companion.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What do people leave with you?", next = "beasts" },
        { text = "How do you keep animals clean in this marsh?", next = "mud" },
        { text = "You seem fonder of the beasts than their owners.", next = "fond" },
        { text = "There's a Theramore warhorse in your end stall.", next = "warhorse" },
        { text = "Does the marsh ever send you its own beasts?", next = "wild" },
        { text = "Which marsh herbs do you burn against the flies?", next = "herbs", when = { profession = { "Herbalism", "Alchemy" } } },
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
    warhorse = {
      lines = {
        { id = "b_warhorse_default", text = "That's one of Gregor MacVince's, in for a strained hock. He breeds the garrison's horses out past the gate, and he sends me the ones that need quiet more than they need exercise." },
      },
      choices = {
        { text = "Do horses take to the marsh?", next = "warhorse_marsh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    warhorse_marsh = {
      lines = {
        { id = "b_warhorse_marsh_default", text = "Not gladly. The ground gives under them and the crocolisks take them for a meal, so the patrols mostly go on foot and the horses stay on the isle." },
      },
      choices = {
        { text = "No wonder the guards look so tired.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wild = {
      lines = {
        { id = "b_wild_default", text = "Now and then. A guard brought in a marsh raptor chick last spring, no longer than my forearm, and it bit everyone in the stable before it left." },
      },
      choices = {
        { text = "What became of it?", next = "wild_raptor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wild_raptor = {
      lines = {
        { id = "b_wild_raptor_default", text = "A hunter off the Menethil boat took a liking to it, and it took a liking to her, which surprised us both. I'm told it's the size of a pony now and still bites." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs = {
      lines = {
        { id = "b_herbs_default", text = "Bogbean leaf, mostly, with a little swamp moss to make it smoulder. Morgan Stern at the inn showed me the mix, though he uses his for cooking, and I'd not eat anything that smells like mine." },
      },
      choices = {
        { text = "I'll remember the bogbean.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've always been better with animals than people. Theramore needed a stable master, and here I am." } },
    advice = { { id = "tp_ad", text = "Keep your companion off the low ground at night, and check it for leeches." } },
    theramore = { { id = "tp_b_theramore", text = "It's damp and it's crowded, but folk here look after one another. The animals feel that, and they settle quicker than you'd think." } },
    rumors = { { id = "tp_b_rumors", text = "The guards say a horse came back from the north road last week with no rider and claw marks on the saddle. It's in my back stall, and it still won't stand still." } },
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
    first = "He judges a weapon by how hard it hits, not its looks.",
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
    { id = "n_b1", cat = "class", when = { class = "HUNTER" },
      text = "Hunter carries a bow. Zulrg does not sell bows, because bows are for hitting from far away, so go and see the orc Zanara for those." },
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
        { id = "h_again_b1", text = "More talk? Zulrg can count and talk at the same time, mostly." },
        { id = "h_again_b2", text = "Ask. Axes do not go anywhere." },
      },
      choices = {
        { text = "Let me see your weapons.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "Which weapon would you choose?", next = "choose" },
        { text = "Where do the weapons come from?", next = "source" },
        { text = "How do the Stonemaul like living with orcs?", next = "orcs" },
        { text = "That club is taller than you are, Zulrg.", next = "club" },
        { text = "Who else trades in Brackenwall?", next = "traders" },
        { text = "What do the Stonemaul think of the dragons?", next = "dragons", when = { class = { "WARRIOR", "SHAMAN" }, faction = "Horde" } },
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
    club = {
      lines = {
        { id = "b_club_default", text = "This one was Zulrg's father's, and his father's before. It has hit centaur and orcs and one very surprised dragon whelp, and it is not for sale, so do not ask." },
      },
      choices = {
        { text = "What happened to the whelp?", next = "club_whelp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    club_whelp = {
      lines = {
        { id = "b_club_whelp_default", text = "It went flat. Then its mother came, and she was not a whelp, and Zulrg learned that even a very good club is no use against something that breathes fire from the sky." },
      },
      choices = {
        { text = "That's when you lost the old village.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    traders = {
      lines = {
        { id = "b_traders_default", text = "Krak sells the armor, and Krak is Zulrg's friend, because a customer who buys an axe needs a shield after. The orc Zanara sells bows, and Ogg'marr sells meat, and the troll Balai sells little bottles." },
      },
      choices = {
        { text = "Do the ogres and the orcs share customers?", next = "traders_share" },
        { text = "Something else.", next = "BACK" },
      },
    },
    traders_share = {
      lines = {
        { id = "b_traders_share_default", text = "Orcs buy from orcs first, and then they come to Zulrg when they want something big. Zulrg does not mind being second, because the big weapons cost more." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dragons = {
      lines = {
        { id = "b_dragons_default", text = "Stonemaul hate the dragons, and hate is good, but Mok'Morokk says wait and wait. Tharg says a chief who waits is not a chief, and Zulrg sells Tharg his axes and says nothing." },
      },
      choices = {
        { text = "Tharg sounds like he has a point.", next = "BACK", reply = "Zulrg did not say that. Zulrg only sells axes, and maybe Zulrg sharpens Tharg's a little better." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Zulrg is Stonemaul and Zulrg sells weapons, and that is the whole of Zulrg." } },
    advice = { { id = "tp_ad", text = "Buy the heavy one. Light weapons are for small hands." } },
    onyxia = { { id = "tp_b_onyxia", text = "Zulrg has heard the name. The black dragons in the south serve a big one, and Zulrg does not have an axe big enough for her." } },
    thrall = { { id = "tp_b_thrall", text = "The orc chief sent help when the Stonemaul had no home. Zulrg remembers who helps, and Zulrg sells to them first." } },
    _none = { { id = "tp_none", text = "Zulrg does not know that thing. Zulrg knows axes, so ask about axes." } },
  },
}

---------------------------------------------------------------------------
-- Guard Byron (Theramore: They Call Him Smiling Jim)
---------------------------------------------------------------------------
P:NPC {
  key = "byron", id = TODO_NPC("Guard Byron"), name = "Guard Byron",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "theramore" }, temper = { "sympathetic", "plain" }, values = { "duty", "kind" },
  notices = { "class", "race" },
  impression = {
    first = "Guard Byron stands his watch in Theramore and worries about a neighbour while he does it. He talks about the burned inn on the north road as a man talks about something that happened to a friend.",
    third = "{name} met Guard Byron of Theramore, who worries over the innkeeper they call Smiling Jim.",
  },
  greetings = {
    { id = "g_default", text = "Afternoon. Mind how you go on the planks, they're slick after the rain, and it's always after the rain." },
    { id = "g_2", when = { metBefore = true }, text = "Hello again. Still dry inside your boots, I hope? There's nothing else in Theramore that is." },
    { id = "g_3", when = { questActive = TODO_QUEST("They Call Him Smiling Jim") }, text = "Have you spoken to Clerk Lendry yet? He keeps the records, and he'll know more about poor Jim than I do." },
    { id = "g_4", when = { questDone = TODO_QUEST("They Call Him Smiling Jim") }, text = "Thank you for asking after Jim. Hardly anyone does now, and I think that's the worst part of it." },
  },
  notice = {
    { id = "n_1", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You're of the Light, aren't you? There's a man in this town who could use a kind word from your sort, if he'd only hear it." },
    { id = "n_2", cat = "race", when = { race = "NightElf" },
      text = "We don't see many of your folk on the isle. You're welcome here, and the Lady would say the same." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I'm Guard Byron, and I walk this stretch between the inn and the docks. It's a quiet beat, most days, and that leaves me a good deal of time to think about things I can't mend." },
        { id = "hello_2", when = { questBefore = TODO_QUEST("They Call Him Smiling Jim") }, text = "You'll have seen the man who wanders by the inn, laughing at nothing. That's James Hyal, and they call him Smiling Jim now, and it's a shame what happened to him. Clerk Lendry has the whole story, if you care to hear it." },
        { id = "hello_3", when = { questActive = TODO_QUEST("They Call Him Smiling Jim") }, text = "Clerk Lendry's in the citadel, with the town's papers. Ask him about James Hyal and the Shady Rest Inn, and be gentle if Jim himself wanders past while you do." },
        { id = "hello_4", when = { questDone = TODO_QUEST("They Call Him Smiling Jim") }, text = "So now you know as much as any of us do. I only hope that Captain Vimes finds whoever lit that fire, for Jim's sake." },
      },
      again = {
        { id = "hello_again1", text = "Anything else? I've an hour before the watch changes." },
        { id = "hello_again2", text = "Go on, I'm listening. It makes the beat go quicker." },
        { id = "hello_again3", text = "Ask away, friend." },
      },
      choices = {
        { text = "Who is Smiling Jim?", next = "jim" },
        { text = "Your beat looks quiet enough.", next = "beat" },
        { text = "What do the guards make of the peace with the Horde?", next = "peace" },
        { text = "Can nothing be done for him?", next = "healing", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Where were you before Theramore?", next = "before", when = { race = "Human" } },
        { text = "Is there something I can do?", next = "BUSINESS" },
        { text = "Stay dry, Byron.", next = "END" },
      },
    },
    jim = {
      lines = {
        { id = "jim_default", text = "James Hyal kept the Shady Rest Inn, out on the road north through the marsh. He was a cheerful sort who'd stand a tired guard a drink, and that's where the name came from, back when it was a kind one." },
      },
      choices = {
        { text = "What happened to the inn?", next = "jim_inn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jim_inn = {
      lines = {
        { id = "jim_inn_default", text = "It was burned to the ground one night, with his wife and his little one inside it. Jim was away, and he came home to find it still smoking. He hasn't been right since, and now he smiles at everything, because I think it's all he has left." },
      },
      choices = {
        { text = "Who would burn a roadside inn?", next = "jim_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jim_who = {
      narr = "He glances up the street toward the citadel before he answers.",
      lines = {
        { id = "jim_who_default", text = "That's what Captain Vimes is trying to find out. Half the garrison says it was the Horde, and they say it loudly. I've heard no proof, mind, and I'll not hang a crime on anyone for the sake of having a name." },
      },
      choices = {
        { text = "Wait for proof. Blame without it starts wars.", next = "BACK", reply = "That's what I tell the lads in the barracks. They don't always thank me for it, but it wants saying.", fx = { align = { order = 1 } } },
        { text = "It was the Horde. Nobody else is out there.", next = "BACK", reply = "Maybe so, and you've plenty of company in thinking it. I'd still rather know than guess.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beat = {
      lines = {
        { id = "beat_default", text = "It is, and I'm glad of it. The lads on the towers get the raptors and the spiders, and I get drunken sailors and the odd lost chicken." },
      },
      choices = {
        { text = "Do the sailors give you trouble?", next = "beat_sailors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beat_sailors = {
      lines = {
        { id = "beat_sailors_default", text = "Only on the nights the Menethil boat comes in late. Bartender Lillian sends them out to me when they've had enough, and I walk them down to the docks and point them at the right ship." },
      },
      choices = {
        { text = "And the wrong ship?", next = "beat_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beat_wrong = {
      lines = {
        { id = "beat_wrong_default", text = "Once. He woke up halfway to Ratchet, and I'm told he liked it there and stayed. So I count that a service to the man." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      lines = {
        { id = "peace_default", text = "We do as the Lady says, and most of us are glad to. I buried enough friends in Lordaeron, and I've no wish to bury more over a swamp." },
      },
      choices = {
        { text = "Not every guard feels that way.", next = "peace_others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    peace_others = {
      lines = {
        { id = "peace_others_default", text = "No, and you'll hear them say so in the inn of an evening. Some of the old Kul Tiras men never forgave what happened to the Admiral, and they've started slipping away from the towers. Commander Samaul's none too pleased about it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    healing = {
      lines = {
        { id = "healing_default", text = "Doctor VanHowzen has tried, and so has the chaplain. They say there's nothing wrong with his body, and that the rest of him is somewhere they can't reach. A prayer wouldn't hurt, though, if you've one to spare." },
      },
      choices = {
        { text = "I'll say one for him and his family.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = {
        { id = "before_default", text = "I was a farmhand outside Andorhal, and after that I was a footman, for a short and ugly time. I came over on the Lady's ships with nothing but a borrowed sword, and Theramore gave me a wage and a dry bunk, more or less dry." },
      },
      choices = {
        { text = "You've done well by it.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    knows = { { id = "tp_knows", text = "I know this street, and who walks it, and who's stopped walking it. Ask, and I'll tell you what I can." } },
    background = { { id = "tp_background", text = "I'm one of the Theramore Guard, on the town watch. It's not glorious work, and that suits me well enough." } },
    theramore = { { id = "tp_theramore", text = "It's a hard little town full of folk who've lost everything once already. We look after one another because nobody else is going to." } },
    jaina = { { id = "tp_jaina", text = "The Lady knows every guard by name, mine included. I'd not have believed that of a ruler before I came here." } },
    rumors = { { id = "tp_rumors", text = "They found hoofprints in the ash at the Shady Rest, or so the scouts say. I don't know what to make of it, and neither does the captain." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, friend. I just walk the beat." } },
  },
}

---------------------------------------------------------------------------
-- Captain Evencane (Foothold Citadel, warrior trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "evencane", id = TODO_NPC("Captain Evencane"), name = "Captain Evencane", title = "Warrior Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "theramore" }, temper = { "stern", "exact" }, values = { "duty", "strength" },
  notices = { "class", "kit" , "race" },
  impression = {
    first = "Captain Evencane drills Theramore's soldiers in Foothold Citadel and watches a stranger's footwork before he looks at their face. He has no praise to spare for flourishes.",
    third = "{name} met Captain Evencane, who trains warriors in Theramore's Foothold Citadel.",
  },
  greetings = {
    { id = "g_default", text = "Stand straight when you come into my yard, and then tell me what you want." },
    { id = "g_2", when = { metBefore = true }, text = "You're back, so let me see your guard, and I'll know in a moment whether you've practised." },
  },
  notice = {
    { id = "n_1", cat = "class", when = { class = "WARRIOR" },
      text = "Your weight sits too far forward, so you'll win quickly that way or you'll lose quickly, and I train soldiers to do neither." },
    { id = "n_2", cat = "kit", when = { class = { "ROGUE", "HUNTER" } },
      text = "You're no line soldier, and I can see it from here. That's no insult, but stay off my drill square while the men are working." },
    { id = "n_b1", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. Your people fight from behind a shield wall and they don't break, and I've tried for years to teach these lads the second half of that." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Captain Evencane, and I train the warriors of the Theramore Guard. Every soldier on these walls has stood in my yard until his arms shook, and every one of them is still alive, and those two facts are related." },
        { id = "hello_2", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good, because I've little patience for anyone else today. Show me your stance, and then we'll talk about what it's costing you." },
        { id = "hello_berserk", when = { class = "WARRIOR", faction = "Alliance", minLevel = 30, maxLevel = 44 }, text = "You've come down from Fray Island, by the look of you, and you're still standing like Klannoc's ring is under your feet. Ease off it, soldier, because this is a citadel, not an arena." },
        { id = "hello_old", when = { class = "WARRIOR", faction = "Alliance", minLevel = 50 }, text = "A soldier who's outgrown every yard in the Alliance, standing in mine. I'll not pretend I've much left to teach you, but I'd take it kindly if you let the recruits watch you train." },
        { id = "hello_3", when = { faction = "Horde" }, text = "You've some nerve, walking into the citadel. The Lady's peace covers you, so keep your hands still and be brief." },
      },
      again = {
        { id = "hello_again1", text = "Is there more? The recruits are getting comfortable, and I can't allow that." },
        { id = "hello_again2", text = "Ask your question, and then I've a drill to run." },
        { id = "hello_again3", text = "Go on, but keep it short, because the tide's coming in over the drill square." },
      },
      choices = {
        { text = "I'm here to train.", next = "BUSINESS", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How do you train men to fight in a swamp?", next = "swamp" },
        { text = "Your recruits look young.", next = "young" },
        { text = "Drill is for parades. Real fights are chaos.", next = "drill" },
        { text = "What's the commonest mistake you see?", next = "mistake", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Who's your best soldier?", next = "best" },
        { text = "Klannoc's ring taught me Berserker Stance, Captain.", next = "ev_berserk", when = { class = "WARRIOR", faction = "Alliance", minLevel = 30 } },
        { text = "Plate in a swamp seems like madness.", next = "ev_plate", when = { class = "WARRIOR", minLevel = 40 } },
        { text = "I served under Lordaeron's banner too.", next = "ev_lordaeron", when = { origin = "human_lordaeron_refugee", class = { "WARRIOR", "PALADIN" } } },
        { text = "I'll leave you to your drill, Captain.", next = "END" },
      },
    },
    ev_berserk = {
      big = true,
      lines = { { id = "evb_default", text = "Did it, now? Klannoc has his uses, and I've sent him a soldier or two, but I've never put a berserker on these walls. A wall wants men who stay where they're put, and a berserker goes wherever the blood is." } },
      choices = {
        { text = "On a wall, I'd stay where I'm put.", next = "BACK", reply = "Then you'd be welcome on mine. Know which stance is for which day.", fx = { align = { order = 1 } } },
        { text = "Some fights need a man who goes where the blood is.", next = "BACK", reply = "They do, and those men don't usually see the end of them. I've seen it.", fx = { align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    ev_plate = {
      lines = { { id = "evp_default", text = "It is, and every soldier in Theramore wears it anyway, because the crocolisks bite through mail and the Brackenwall orcs bring axes. Oil it every night, or the marsh will rust your joints before the Horde gets a chance at them." } },
      choices = {
        { text = "Oil every night. I'll remember.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "I'd rather be quick than armoured here.", next = "BACK", reply = "Quick sinks just as fast as slow in this mud. Wear the plate.", fx = { trait = { brave = 1 } } },
      },
    },
    ev_lordaeron = {
      lines = { { id = "evl_default", text = "Then you know why I drill them till their arms shake, because you saw what happened to the ones who weren't ready when the plague came. Which garrison were you, or would you rather not say?" } },
      choices = {
        { text = "I'd rather not say, Captain.", next = "BACK", reply = "Fair enough. Most of us would rather not. Welcome to Theramore, soldier.", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Andorhal, before it fell.", next = "BACK", reply = "Light keep you. I'll not ask more than that, and I'll not forget it.", fx = { affinity = 2 } },
      },
    },
    swamp = {
      lines = {
        { id = "swamp_default", text = "I make them drill in the shallows north of the gate, in full mail, until they stop looking at their feet. A man who watches his footing in the marsh doesn't see the crocolisk, and a man who watches for the crocolisk falls on his face, so he must learn to do both at once." },
      },
      choices = {
        { text = "How long does that take?", next = "swamp_long" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swamp_long = {
      lines = {
        { id = "swamp_long_default", text = "A month for a good recruit, three for a poor one. A few never learn it at all, and Commander Samaul puts those on the docks, where the ground stays where it's put." },
      },
      choices = {
        { text = "That's a kindness, in its way.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    young = {
      lines = {
        { id = "young_default", text = "They are, for most were children when Lordaeron fell, and they grew up on this rock hearing about a war they don't remember. They want one of their own, and that's the most dangerous thing about them." },
      },
      choices = {
        { text = "What do you tell them?", next = "young_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    young_tell = {
      lines = {
        { id = "young_tell_default", text = "I tell them that I've had mine, and that they're welcome to it, and then I run them round the walls until they're too tired to want anything except their supper." },
      },
      choices = {
        { text = "Does it work?", next = "young_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    young_work = {
      lines = {
        { id = "young_work_default", text = "It works until the next morning, and then I run them again, because that's what peacetime soldiering is, and nobody writes songs about it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    drill = {
      big = true,
      lines = {
        { id = "drill_default", text = "I've heard that from every brawler who ever picked up a sword. Chaos is exactly when a man does what his body has done a thousand times before, and so I decide beforehand what that will be." },
      },
      choices = {
        { text = "You're right. Discipline holds when courage runs out.", next = "BACK", reply = "It does. I've watched it hold, with nothing else left standing.", fx = { align = { order = 1 } } },
        { text = "Instinct wins fights. Drill only makes men predictable.", next = "BACK", reply = "Then I hope your instincts are very good. I've buried a great many who trusted theirs.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mistake = {
      lines = {
        { id = "mistake_default", text = "They swing with the arm and not with the hips, and then they wonder why they're spent after five strokes. Power comes up from the ground, through the legs, and anyone who tells you otherwise has never fought past noon." },
      },
      choices = {
        { text = "From the ground. I'll work on it.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = {
        { id = "b_best_default", text = "I don't name them, because it goes to their heads. I'll say that the ones on Captain Vimes's gate watch were all mine, and that he has never once sent one back." },
      },
      choices = {
        { text = "And your worst?", next = "best_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best_worst = {
      lines = {
        { id = "b_best_worst_default", text = "He deserted last month from Sentry Point, and I've asked myself since what I failed to teach him. A soldier who runs was badly trained or badly led, and I trained him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I was a sergeant under Lordaeron's banner and I've been a captain under the Lady's. The uniform changed, and the work didn't." } },
    advice = { { id = "tp_advice", text = "Sleep when you can and eat when you can, because a battle never waits for you to do either." } },
    lordaeron = { { id = "tp_lordaeron", text = "I trained men there too, and most of them are dead, and I see their mistakes in every recruit, which is why I'm hard on these ones." } },
    theramore = { { id = "tp_b_theramore", text = "It's a fortress first and a town second, and that's how it has stayed alive. I mean to keep it that way." } },
    jaina = { { id = "tp_b_jaina", text = "She asked me once what the Guard needed most, and I said time. She has bought us four years of it, and I don't waste a day." } },
    _none = { { id = "tp_none", text = "That's no concern of the drill yard, so ask someone with time to gossip, which isn't me." } },
  },
}

---------------------------------------------------------------------------
-- Brother Karman (Theramore, paladin trainer by the training dummies)
---------------------------------------------------------------------------
P:NPC {
  key = "karman", id = TODO_NPC("Brother Karman"), name = "Brother Karman", title = "Paladin Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "theramore" }, temper = { "grave", "kind" }, values = { "faith", "duty" },
  notices = { "class", "light" },
  impression = {
    first = "Brother Karman teaches Theramore's paladins beside the training dummies outside the citadel. He speaks of the Light as something to be carried rather than something to be shown off.",
    third = "{name} met Brother Karman, the paladin trainer of Theramore Isle.",
  },
  greetings = {
    { id = "g_default", text = "Light be with you, friend. Come out of the wet, such as it is, and tell me what you need." },
    { id = "g_2", when = { metBefore = true }, text = "Well met again. You look a little steadier than when I saw you last, and I'm glad of it." },
  },
  notice = {
    { id = "n_1", cat = "class", when = { class = "PALADIN" },
      text = "You carry a libram, and you carry it where you can reach it. Good, because too many of the young ones pack it under their rations." },
    { id = "n_2", cat = "light", when = { class = "PRIEST" },
      text = "A priest. We serve the same Light, you and I, though you mend what I can only stand guard over." },
    { id = "n_3", cat = "class", when = { class = "WARLOCK" },
      text = "I can smell brimstone on you, and I won't pretend otherwise. The Lady's peace holds for you as it does for anyone, so we'll both keep it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Brother Karman, and I teach the Light's knights on this isle. The Silver Hand fell with Lordaeron, but a paladin's oath was never made to a kingdom, and so here we still are." },
        { id = "hello_2", when = { class = "PALADIN", faction = "Alliance" }, text = "A knight of the Light, and one who's seen some road. Kneel a moment if you wish to, and then we'll see what I can teach you." },
      },
      again = {
        { id = "hello_again1", text = "Is there more on your mind? I've time, and I'll have it until evening prayer." },
        { id = "hello_again2", text = "Ask freely. A question has never offended the Light." },
        { id = "hello_again3", text = "Go on, friend." },
      },
      choices = {
        { text = "I've come for training.", next = "BUSINESS", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "What became of the Silver Hand here?", next = "hand" },
        { text = "You teach beside the practice dummies, not in a chapel.", next = "yard" },
        { text = "The Light didn't save Lordaeron.", next = "doubt" },
        { text = "How do you keep faith in a place like this?", next = "faith", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Light keep you, Brother.", next = "END" },
      },
    },
    hand = {
      lines = {
        { id = "hand_default", text = "A handful of us sailed west with the Lady, and we've trained a few more since. We've no grand master and no chapter house, only a corner of a drill yard and whoever comes to it." },
      },
      choices = {
        { text = "Is that enough to keep an order alive?", next = "hand_enough" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hand_enough = {
      lines = {
        { id = "hand_enough_default", text = "An order is an oath that people keep, friend. So long as one knight on this rock keeps it honestly, the Silver Hand is alive, and I've counted eleven." },
      },
      choices = {
        { text = "Eleven is more than I expected.", next = "hand_eleven" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hand_eleven = {
      lines = {
        { id = "hand_eleven_default", text = "It's more than I expected myself, the day we landed. Three of them were born on this isle and have never seen a cathedral, and they're as true as any I knew in the old days." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yard = {
      lines = {
        { id = "yard_default", text = "Captain Evencane lends me the corner, and in exchange I patch up his recruits when they've hit one another too hard. A paladin who learns only in a chapel is surprised by his first battle, and I'd sooner they were surprised here." },
      },
      choices = {
        { text = "Do you and the captain get on?", next = "yard_captain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yard_captain = {
      lines = {
        { id = "yard_captain_default", text = "He thinks I'm soft on them, and I think he's hard on them, and between the two of us they turn out about right. I'd not tell him that, for he'd only run them harder." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    doubt = {
      big = true,
      lines = {
        { id = "doubt_default", text = "No, it didn't. I was there, and I prayed as hard as any man living, and the dead got up all the same. I've had a good many nights to think about why." },
      },
      choices = {
        { text = "The Light works through people. People failed, not the Light.", next = "BACK", reply = "That's where I came to rest as well, after a long while. It's a harder creed than the one I was taught, and I trust it more.", fx = { align = { light = 1 } } },
        { text = "Then faith is no shield. Only strength is.", next = "BACK", reply = "I'll not argue with what you've seen. I'll only say that the strong fell there too, and they fell just as fast.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    faith = {
      lines = {
        { id = "faith_default", text = "I keep it small. I don't ask the Light for victories any more, only for enough to help the next person who's standing in front of me. It has never refused me that much." },
      },
      choices = {
        { text = "That's a prayer I can use.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I was a brother of the Silver Hand in Lordaeron, and I'm one still. I followed the Lady because she was saving people while others argued." } },
    advice = { { id = "tp_advice", text = "Rest when you're wounded. The Light can mend flesh, but it doesn't mend foolishness." } },
    silver_hand = { { id = "tp_silver_hand", text = "It's scattered, and not ended. Wherever one of us keeps the oath, there it is." } },
    holy_light = { { id = "tp_holy_light", text = "I've stopped trying to explain it. I only try to be of use, and I find that the Light is there when I do." } },
    scourge = { { id = "tp_scourge", text = "I'll not speak lightly of them. Every one was somebody's kin, and that is the cruelty of it." } },
    _none = { { id = "tp_none", text = "I've no wisdom on that, I'm afraid. Ask me something nearer to my calling." } },
  },
}

---------------------------------------------------------------------------
-- Alchemist Narett (Theramore, alchemy trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "narett", id = TODO_NPC("Alchemist Narett"), name = "Alchemist Narett", title = "Alchemy Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "theramore" }, temper = { "fussy", "curious" }, values = { "craft", "careful" },
  notices = { "craft", "class" },
  impression = {
    first = "Alchemist Narett teaches alchemy in Theramore and regards the surrounding marsh as a vast, badly labelled storeroom. He talks to his glassware under his breath.",
    third = "{name} met Alchemist Narett, the alchemy trainer of Theramore Isle.",
  },
  greetings = {
    { id = "g_default", text = "Don't breathe too deeply by that retort, if you please. It won't harm you, but it does linger." },
    { id = "g_2", when = { metBefore = true }, text = "Ah, it's you. I've had a thought since you were last here, and it very nearly worked." },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Alchemy" },
      text = "Those are an alchemist's sleeves if ever I saw them. Tell me, do you rinse your vials with marsh water? Please say that you don't." },
    { id = "n_2", cat = "craft", when = { profession = "Herbalism" },
      text = "You've been picking in the marsh, I think. If there's any fresh liferoot in that bag, Uma Bartulm will take it, and I'll have it from her by supper." },
    { id = "n_3", cat = "class", when = { class = "MAGE" },
      text = "One of the Lady's sort. Archmage Tervosh borrows my alembics and returns them cleaner than he found them, which I find suspicious." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Narett, alchemist to the garrison, and I teach the craft to anyone careful enough to learn it. Dustwallow is a foul place to live and a wonderful place to gather, and I've made my peace with both." },
        { id = "hello_2", when = { profession = "Alchemy" }, text = "A fellow of the craft! Come in, come in, and mind the floor, because I spilled something this morning and it hasn't quite decided what it is." },
      },
      again = {
        { id = "hello_again1", text = "Something more? Ask it while this settles." },
        { id = "hello_again2", text = "Go on. I've a quarter of an hour before the next stage." },
        { id = "hello_again3", text = "Yes, yes, what is it?" },
      },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "What does the marsh give an alchemist?", next = "marsh" },
        { text = "Who drinks all these potions?", next = "who" },
        { text = "Alchemy is just cooking with worse smells.", next = "cooking" },
        { text = "What's the oddest thing you've brewed from the marsh?", next = "oddest", when = { profession = { "Alchemy", "Herbalism" } } },
        { text = "Good luck with your work, Narett.", next = "END" },
      },
    },
    marsh = {
      lines = {
        { id = "marsh_default", text = "Liferoot and fadeleaf along the banks, kingsblood on the drier ground, and bogbean nearly everywhere. Half of what grows here will cure you and the other half will kill you, and a good many do one or the other depending on the dose." },
      },
      choices = {
        { text = "How do you tell which is which?", next = "marsh_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marsh_tell = {
      lines = {
        { id = "marsh_tell_default", text = "By reading, and testing, and one regrettable afternoon in my first year. Doctor VanHowzen has asked me not to test on myself any longer, and I've agreed in principle." },
      },
      choices = {
        { text = "In principle?", next = "marsh_principle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marsh_principle = {
      lines = {
        { id = "marsh_principle_default", text = "Well, somebody must be the first to taste a thing. I take a great deal less than I used to, and I leave notes on the bench in case I'm found asleep." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = {
        { id = "who_default", text = "The Guard, chiefly. Every patrol that goes up the north road takes healing draughts and something against fever, and Commander Samaul sends back the empties with a count of how many worked." },
      },
      choices = {
        { text = "How many do work?", next = "who_count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_count = {
      lines = {
        { id = "who_count_default", text = "All of the draughts, and most of the fever cures. The marsh breeds a new sickness every wet season, and I'm always one season behind it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cooking = {
      big = true,
      lines = {
        { id = "cooking_default", text = "Morgan Stern says exactly the same, and he means it as a compliment. The difference is that when his stew goes wrong somebody has a bad night, and when my draught goes wrong somebody doesn't wake up." },
      },
      choices = {
        { text = "That's why your craft needs rules, and plenty of them.", next = "BACK", reply = "Quite so! I've a list of forty on the wall, and I add to it whenever something surprises me.", fx = { align = { order = 1 } } },
        { text = "Rules never discovered anything. Experiment more.", next = "BACK", reply = "Oh, don't tempt me. That's just what I say to myself shortly before the regrettable afternoons.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    oddest = {
      lines = {
        { id = "oddest_default", text = "A tonic from crocolisk bile and bogbean that was meant to settle the stomach. It turned the drinker's tongue bright green for a week, and it did settle the stomach, so I've called it a success." },
      },
      choices = {
        { text = "I'd take the green tongue.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I trained in Dalaran, among people who never left their towers. I came west with the Lady and found that I rather like mud." } },
    advice = { { id = "tp_advice", text = "Label everything, and date it. Your memory is not as good as you believe it to be." } },
    dalaran = { { id = "tp_dalaran", text = "It's a fine city for theory. For practice, give me a swamp and a strong stomach." } },
    theramore = { { id = "tp_theramore", text = "It's a town that needs a great many healing draughts, and so it's a good town for an alchemist, sad as that is." } },
    _none = { { id = "tp_none", text = "That's outside my field. If it bubbles, bring it to me." } },
  },
}

---------------------------------------------------------------------------
-- Brant Jasperbloom (Theramore, herbalism trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "jasperbloom", id = TODO_NPC("Brant Jasperbloom"), name = "Brant Jasperbloom", title = "Herbalism Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "theramore" }, temper = { "gentle", "wry" }, values = { "nature", "patient" },
  notices = { "craft", "weary" , "class" },
  impression = {
    first = "Brant Jasperbloom teaches herbalism in Theramore and goes into the marsh more often than the guards think wise. He names every plant on the isle as a neighbour might name the people in his street.",
    third = "{name} met Brant Jasperbloom, the herbalism trainer of Theramore Isle.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you. Mind the pots by the door, for they're seedlings, and they're sulking about the salt air." },
    { id = "g_2", when = { metBefore = true }, text = "Back again, and with mud to the knee. You've been out picking, haven't you?" },
  },
  notice = {
    { id = "n_1", cat = "craft", when = { profession = "Herbalism" },
      text = "There's green under your nails, friend, and you have a gatherer's stoop. I'd guess you know your way around a root." },
    { id = "n_2", cat = "weary", when = { durability = { max = 0.35 } },
      text = "The marsh has had a go at you, I see. Sit down a moment, because nothing grows faster for being picked by a tired hand." },
    { id = "n_b1", cat = "class", when = { class = "DRUID" },
      text = "A druid! Then you can tell me whether the cypress by the north gate is sickening or only sulking, because I can't decide." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I'm Brant Jasperbloom, and I teach folk to gather without killing what they gather from. Dustwallow looks like rot and ruin, but there's more growing in one acre of it than in the whole of Elwynn." },
        { id = "hello_2", when = { profession = "Herbalism" }, text = "A fellow gatherer! Then you'll have seen what the marsh keeps. Tell me that you take the leaf and leave the root, and we'll be friends." },
      },
      again = {
        { id = "hello_again1", text = "What else can I tell you? The seedlings won't mind." },
        { id = "hello_again2", text = "Ask away. I talk to plants all day, so a person makes a nice change." },
        { id = "hello_again3", text = "Go on, friend." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "What's worth picking in the marsh?", next = "picking" },
        { text = "The guards say you go out alone.", next = "alone" },
        { text = "A weed's a weed. Pull it and move on.", next = "weed" },
        { text = "Where does the best liferoot grow?", next = "liferoot", when = { profession = { "Herbalism", "Alchemy" } } },
        { text = "What's in the pots by your door?", next = "pots" },
        { text = "Good growing to you, Brant.", next = "END" },
      },
    },
    picking = {
      lines = {
        { id = "picking_default", text = "Liferoot by the water, fadeleaf in the shade of the big cypress, and goldthorn up on the dry ridges toward the Barrens. And bogbean, of course, which Morgan Stern at the inn wants by the basket for some recipe he won't describe." },
      },
      choices = {
        { text = "What does he do with bogbean?", next = "picking_bogbean" },
        { text = "Something else.", next = "BACK" },
      },
    },
    picking_bogbean = {
      lines = {
        { id = "picking_bogbean_default", text = "He won't say, and I've given up asking. He sent young Ignatz out past North Point Tower to gather more of it, with the raptors about, so it must be a remarkable dish." },
      },
      choices = {
        { text = "Is the lad safe out there?", next = "picking_ignatz" },
        { text = "Something else.", next = "BACK" },
      },
    },
    picking_ignatz = {
      lines = {
        { id = "picking_ignatz_default", text = "As safe as anyone is who talks that much near raptors. He's quick on his feet, I'll give him that, and the soldiers at the tower keep half an eye on him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = {
        { id = "alone_default", text = "I do, and Captain Vimes has had words with me about it. But six soldiers in mail frighten off everything, the herbs included, I sometimes think, and one quiet man with a basket walks past a great deal." },
      },
      choices = {
        { text = "Has the marsh ever caught you out?", next = "alone_caught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone_caught = {
      lines = {
        { id = "alone_caught_default", text = "A spider the size of a cart dropped onto my basket once, near the Darkmist Cavern. I left the basket and kept my legs, and I've not picked on that side since." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    weed = {
      big = true,
      lines = {
        { id = "weed_default", text = "There are folk who'd burn the whole marsh for pasture, and some of them sit on the town council. I tell them that the fever cure in their cupboard grew in the very bog they'd like to drain." },
      },
      choices = {
        { text = "Leave the marsh be. It gives more than it takes.", next = "BACK", reply = "That's my whole sermon, said shorter than I've ever managed it.", fx = { align = { light = 1 } } },
        { text = "People need dry land more than they need herbs.", next = "BACK", reply = "Then I hope they'll remember where the medicine came from, once it's all gone under the plough.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    liferoot = {
      lines = {
        { id = "liferoot_default", text = "Along the banks south of the Witch Hill road, where the water runs slowly. Take every third plant and leave the rest, and it'll be there for you again in a month." },
      },
      choices = {
        { text = "Every third plant. I'll keep to that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pots = {
      lines = {
        { id = "b_pots_default", text = "Peacebloom and silverleaf from Elwynn, which have no business growing here. I brought the seed across the sea in a twist of paper, and I've been coaxing them along ever since." },
      },
      choices = {
        { text = "Why grow them, if the marsh has so much?", next = "pots_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pots_why = {
      lines = {
        { id = "b_pots_why_default", text = "Because the children born on this isle have never seen a meadow flower. I give one to each of them at midsummer, and they look at it as if I'd handed them a jewel." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I kept a herb garden in Lordaeron before the plague. Nothing grows there now that I'd care to pick, so I garden here." } },
    advice = { { id = "tp_advice", text = "Cut cleanly, and never pull. A torn stem is a dead plant." } },
    theramore = { { id = "tp_theramore", text = "It's all stone and salt, and so I grow what I can in pots. The Lady lets me keep a bed behind the citadel, which is kind of her." } },
    jaina = { { id = "tp_b_jaina", text = "The Lady comes by for mageroyal now and then, and she always asks after the seedlings by name. I named one for her, and I've not had the nerve to say so." } },
    rumors = { { id = "tp_b_rumors", text = "Folk say that the plants near Witch Hill grow in spirals now. I've not been to look, and I don't believe that I shall." } },
    _none = { { id = "tp_none", text = "I couldn't say. I know leaves and roots, and not a great deal else." } },
  },
}

---------------------------------------------------------------------------
-- Bartender Lillian (Theramore inn, drinks)
---------------------------------------------------------------------------
P:NPC {
  key = "lillian", id = TODO_NPC("Bartender Lillian"), name = "Bartender Lillian", title = "Bartender",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "theramore" }, temper = { "brisk", "sharp" }, values = { "practical", "kind" },
  notices = { "drink", "class" },
  impression = {
    first = "Bartender Lillian pours the drinks at Theramore's inn and knows, by the second cup, who ought not to have a third. Very little is said in that taproom that she doesn't hear.",
    third = "{name} met Bartender Lillian, who keeps the bar at Theramore's inn.",
  },
  greetings = {
    { id = "g_default", text = "What'll it be? And wipe your boots, please, because I've only just swept the marsh out." },
    { id = "g_2", when = { metBefore = true }, text = "Back again. The usual, or have you got brave since last time?" },
  },
  notice = {
    { id = "n_1", cat = "drink", when = { race = "Dwarf" },
      text = "A dwarf! Now I'll hear what's wrong with my ale. Go on, I've heard it all and I've poured it anyway." },
    { id = "n_2", cat = "class", when = { class = "ROGUE" },
      text = "I saw you count the doors as you came in. There are three, love, and the guards know about all of them." },
    { id = "n_b1", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You've a soldier's way of sitting, back to the wall and eyes on the door. Half my regulars do the same, love, so you'll fit right in." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I'm Lillian, and this is my bar, whatever Janene says about whose inn it is. Soldiers, sailors and strays all end up on those stools sooner or later, and I pour for the lot of them." },
        { id = "hello_2", when = { faction = "Horde" }, text = "Well, now, that's not a face we often see in here. I've no quarrel with you, but half this room does, so I'd drink up quickly if I were you." },
      },
      again = {
        { id = "hello_again1", text = "Something else, love? I can talk and pour at once." },
        { id = "hello_again2", text = "Go on, then. It's a slow hour." },
        { id = "hello_again3", text = "Yes? Ask before the watch changes and the rush comes in." },
      },
      choices = {
        { text = "Pour me something.", next = "BUSINESS" },
        { text = "What do the soldiers talk about in here?", next = "talk" },
        { text = "That man by the door keeps smiling at nothing.", next = "jim" },
        { text = "A barkeep shouldn't repeat what she hears.", next = "confide" },
        { text = "Do you serve anything from back home?", next = "home", when = { race = { "Human", "Dwarf" } } },
        { text = "Who are your regulars?", next = "regulars" },
        { text = "Thanks, Lillian.", next = "END" },
      },
    },
    talk = {
      lines = {
        { id = "talk_default", text = "The damp, their feet, their sergeants, and lately the Shady Rest. There's not a table in here that hasn't decided who burned it, and no two tables agree." },
      },
      choices = {
        { text = "What do most of them think?", next = "talk_think" },
        { text = "Something else.", next = "BACK" },
      },
    },
    talk_think = {
      lines = {
        { id = "talk_think_default", text = "The Horde, mostly, and the more they drink the surer they get. A few of the old hands say it was done too neatly for a raiding party, and those ones don't raise their voices." },
      },
      choices = {
        { text = "Which ones do you believe?", next = "talk_believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    talk_believe = {
      lines = {
        { id = "talk_believe_default", text = "The quiet ones, love, every time. I've stood behind this bar long enough to know that the truth is hardly ever what's being shouted." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    jim = {
      lines = {
        { id = "jim_default", text = "That's James Hyal, and you'll leave him be. He lost his wife and child when the Shady Rest burned, and he's not been himself since. He comes in for the noise, I think, and I never charge him." },
      },
      choices = {
        { text = "That's kind of you.", next = "jim_kind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jim_kind = {
      lines = {
        { id = "jim_kind_default", text = "It's not kindness, it's manners. He kept an inn himself, and he'd have done the same for any of us. Guard Byron walks him home when it gets late." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    confide = {
      big = true,
      lines = {
        { id = "confide_default", text = "No, she shouldn't, and mostly I don't. But if a man sits on that stool and says he's had enough of standing guard over orcs, and next week he's missing from his tower, I've a choice to make." },
      },
      choices = {
        { text = "Tell the commander. A deserter endangers everyone.", next = "BACK", reply = "That's what I did, in the end. I didn't enjoy it, and I'd do it again.", fx = { align = { order = 1 } } },
        { text = "Keep his confidence. A bar should be safe ground.", next = "BACK", reply = "I used to say the same. Then I thought about who'd be standing that watch in his place, and I changed my mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = {
        { id = "home_default", text = "I've a few bottles of Stormwind red that come over by way of Menethil, and a dwarven stout that I keep for when Torq Ironblast is in a mood. It's not cheap, but then homesickness never is." },
      },
      choices = {
        { text = "I'll remember the stout.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars = {
      lines = {
        { id = "b_regulars_default", text = "The off-watch from the gate, a few dock hands, and Morgan Stern, who comes in to argue with Craig Nollward about seasoning. Those two have had the same quarrel every night for a year." },
      },
      choices = {
        { text = "Who's winning?", next = "regulars_winning" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars_winning = {
      lines = {
        { id = "b_regulars_winning_default", text = "Nobody, love, and that's rather the point of it. If either of them ever won, they'd have nothing to come in for, and I'd lose two tabs." },
      },
      choices = {
        { text = "Does the innkeeper mind you running things?", next = "janene" },
        { text = "Something else.", next = "BACK" },
      },
    },
    janene = {
      lines = {
        { id = "b_janene_default", text = "Janene keeps the beds and the books and I keep the taps, and we've each agreed that the other one's in charge. It works so long as nobody asks us both on the same day." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I poured in a tavern on the Lordaeron coast before all this. It's the same trade and the same sorts of people, only with more mud." } },
    advice = { { id = "tp_advice", text = "Don't drink the well water without boiling it. Ale's a good deal safer, and I'd say so even if I didn't sell it." } },
    rumors = { { id = "tp_rumors", text = "A sailor swore to me that he'd seen lights out at Alcaz Island, where nobody's meant to be. He was three cups in, mind you." } },
    theramore = { { id = "tp_theramore", text = "Everyone here has lost somebody, and that's why nobody asks. It makes for a quiet taproom, most nights." } },
    jaina = { { id = "tp_b_jaina", text = "She came in once, in a plain cloak, and sat in the corner for an hour. Nobody knew her but me, and I didn't let on. She left a very fair tip." } },
    lordaeron = { { id = "tp_b_lordaeron", text = "I don't talk about it at the bar, love. Every soul in here has a story from there, and none of them improve an evening." } },
    _none = { { id = "tp_none", text = "That's never come up at the bar, love, and nearly everything does." } },
  },
}

---------------------------------------------------------------------------
-- Balai Lok'Wein (Brackenwall Village, potions, scrolls and reagents)
---------------------------------------------------------------------------
P:NPC {
  key = "balai", id = TODO_NPC("Balai Lok'Wein"), name = "Balai Lok'Wein", title = "Potions, Scrolls and Reagents",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "brackenwall" }, temper = { "sly", "easy" }, values = { "spirits", "practical" },
  notices = { "class", "race" },
  impression = {
    first = "Balai Lok'Wein sells potions and scrolls among the ogres of Brackenwall and seems amused to find herself there. She watches the marsh as though it might tell her something worth knowing.",
    third = "{name} met the troll Balai Lok'Wein, who sells potions and reagents in Brackenwall Village.",
  },
  greetings = {
    { id = "g_default", text = "Come close, mon. Balai got what ya need, and a few tings ya don't know ya need yet." },
    { id = "g_2", when = { metBefore = true }, text = "Ya come back to Balai. De spirits said ya would, though dey didn't say when." },
  },
  notice = {
    { id = "n_1", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "Ya walk with de spirits, I can see dem crowdin' round ya. Dis marsh be full of dem, so mind who ya listen to." },
    { id = "n_2", cat = "race", when = { race = "Troll" },
      text = "Ah, one of me own, here in de mud with de big ones! Sit, {g:brother|sister}, and tell me how de Echo Isles be lookin'." },
    { id = "n_b1", cat = "class", when = { class = "HUNTER" },
      text = "Ya beast be sniffin' at me herb bags, mon. Dat one be clever, because dere's swamp fever medicine in dere and it knows it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I be Balai Lok'Wein, and I keep de potions and de scrolls for dis village. De ogres got strong arms and bad stomachs, mon, so dey need me more dan dey like to say." },
        { id = "hello_2", when = { faction = "Alliance" }, text = "Ya not Horde, and de big ones don't like ya standin' here. Balai don't sell to ya, but she'll talk a little, since talk be free." },
      },
      again = {
        { id = "hello_again1", text = "Someting more, mon? Balai got time." },
        { id = "hello_again2", text = "Ask. De marsh not goin' anywhere." },
        { id = "hello_again3", text = "Speak up. De frogs be loud today." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "How does a troll end up among ogres?", next = "ogres" },
        { text = "You keep looking out at the marsh.", next = "marsh" },
        { text = "Spirits are for the weak. Potions do the real work.", next = "spirits" },
        { text = "What haunts this swamp?", next = "haunts", when = { class = { "SHAMAN", "PRIEST", "WARLOCK" } } },
        { text = "What do the ogres buy from you?", next = "buy" },
        { text = "Spirits be with you, Balai.", next = "END" },
      },
    },
    ogres = {
      lines = {
        { id = "ogres_default", text = "De Warchief sent help when de black dragons burned de Stonemaul out of dere old home, and someone had to bring de medicine. Balai lost de draw, mon, and den she found out she liked it here." },
      },
      choices = {
        { text = "What's to like about Brackenwall?", next = "ogres_like" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ogres_like = {
      lines = {
        { id = "ogres_like_default", text = "Nobody here lies to ya. An ogre who don't like ya says so and hits ya, and one who likes ya shares his meat. After Orgrimmar, where everybody be smilin' and plottin', dat's restful." },
      },
      choices = {
        { text = "And Mok'Morokk?", next = "ogres_mok" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ogres_mok = {
      lines = {
        { id = "ogres_mok_default", text = "De Overlord be loud and he be scared, and de village know it. Tharg buys a lot of healin' potions for an ogre who's supposed to be stayin' home, so ya can tink on dat." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    marsh = {
      lines = {
        { id = "marsh_default", text = "Dere's old tings in it, mon. Witch Hill to de north be bad ground, and de dead walk at de old wrecks on de shore. I don't sleep facin' dat way." },
      },
      choices = {
        { text = "What makes Witch Hill bad ground?", next = "marsh_hill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marsh_hill = {
      lines = {
        { id = "marsh_hill_default", text = "Folk died dere wrong, long ago, and nobody put dem down proper. Draz'Zilb says it's superstition, and Draz'Zilb be very clever, but I notice he don't walk dere after dark either." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits = {
      big = true,
      lines = {
        { id = "spirits_default", text = "De orcs say dat to me sometimes. Den dey get de marsh fever, and I give dem de potion and say de words over it as well, and dey don't ask me to leave de words out." },
      },
      choices = {
        { text = "Respect the spirits. They were here before us.", next = "BACK", reply = "Dat's right, mon. Ya be a guest in dis swamp, same as Balai.", fx = { align = { light = 1 } } },
        { text = "Words are wind. The potion cured them.", next = "BACK", reply = "Maybe so. Ya be welcome to try de marsh widout de words, and tell me how it goes.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    haunts = {
      lines = {
        { id = "haunts_default", text = "Drowned sailors on de coast, and someting older under de mud dat don't have a name I know. De loa don't like to talk about dat one, and when de loa go quiet, Balai goes quiet too." },
      },
      choices = {
        { text = "Then I'll tread lightly.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buy = {
      lines = {
        { id = "b_buy_default", text = "Belly potions, mon, by de crate. An ogre will eat a ting dat's been dead a week and den come to Balai lookin' sorry. And scrolls, for de few who can read dem." },
      },
      choices = {
        { text = "Ogres read scrolls?", next = "buy_scrolls" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buy_scrolls = {
      lines = {
        { id = "b_buy_scrolls_default", text = "Draz'Zilb reads better dan I do, and he don't let me forget it. De rest hold dem upside down and nod, and I don't say a word, because dey paid." },
      },
      choices = {
        { text = "Do you ever miss the sea?", next = "sea" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sea = {
      lines = {
        { id = "b_sea_default", text = "Every day, mon. I can smell de salt when de wind comes from de east, and den it turns and all I smell be mud and ogre. Still, de sea be only a day's walk, and dat's enough to know." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "Balai be Darkspear, from de islands. De Warchief asked for healers for de ogres, and here I am, knee deep in it." } },
    advice = { { id = "tp_advice", text = "Boil de water, wear ya boots, and don't follow any light ya see in de marsh at night." } },
    darkspear = { { id = "tp_darkspear", text = "We be a small tribe and we be owin' de orcs a big debt. So we go where we're asked, even to de mud." } },
    thrall = { { id = "tp_thrall", text = "He keeps his word to de small tribes as well as de big ones. Dat's why Balai don't complain too loud." } },
    voljin = { { id = "tp_b_voljin", text = "Vol'jin sent word dat de tribe had need of healers in de marsh. When he asks, a Darkspear don't say no." } },
    rumors = { { id = "tp_b_rumors", text = "De orcs be whisperin' about a burned inn up de road, and a shield somebody left behind in de ashes. Balai tinks someone wanted it found." } },
    _none = { { id = "tp_none", text = "Balai don't know dat one, mon. De spirits didn't mention it." } },
  },
}

---------------------------------------------------------------------------
-- Krak (Brackenwall Village, armorer)
---------------------------------------------------------------------------
P:NPC {
  key = "krak", id = TODO_NPC("Krak"), name = "Krak", title = "Armorer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "brackenwall" }, temper = { "jolly", "simple" }, values = { "strong", "loyal" },
  notices = { "class", "race" },
  impression = {
    first = "Krak sells armor in Brackenwall Village and tests each piece by hitting it. He is cheerfully certain that whatever survives Krak will survive anything.",
    third = "{name} met the ogre Krak, who sells armor in Brackenwall Village.",
  },
  greetings = {
    { id = "g_default", text = "Krak has armor! Good armor, strong armor. Krak hit it himself, and it did not break." },
    { id = "g_2", when = { metBefore = true }, text = "You are back, and you are not dead. See? Krak's armor works." },
  },
  notice = {
    { id = "n_1", cat = "class", when = { class = { "WARRIOR", "PALADIN", "SHAMAN" } },
      text = "You wear metal. Good! Krak likes a customer who knows that skin is not enough." },
    { id = "n_2", cat = "race", when = { race = "Orc" },
      text = "Orc! Krak has orc sizes now. Krak did not have orc sizes before, and orcs laughed, so Krak learned." },
    { id = "n_b1", cat = "class", when = { class = "HUNTER" },
      text = "Little one has a beast. Krak has no armor for beasts, but Krak thinks that it is a good idea, and Krak will ask the orcs." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "This is Krak's armor, and Krak is Krak. The Stonemaul did not wear much armor before, but then the dragons came with fire, and now the Stonemaul think that armor is a good idea." },
        { id = "hello_2", when = { faction = "Alliance" }, text = "You are not Horde, so Krak cannot sell to you. Krak can still talk, though, because Krak likes talking and nobody here listens." },
      },
      again = {
        { id = "hello_again1", text = "More talk? Good. Krak likes talk." },
        { id = "hello_again2", text = "Ask Krak. Krak is not busy." },
        { id = "hello_again3", text = "What else? Krak will wait." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "How do you test your armor?", next = "test" },
        { text = "Where does an ogre get armor to sell?", next = "get" },
        { text = "Armor is for cowards. The strong don't need it.", next = "coward" },
        { text = "Which piece matters most?", next = "piece", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Is Zulrg really your friend?", next = "zulrg" },
        { text = "Farewell, Krak.", next = "END" },
      },
    },
    test = {
      lines = {
        { id = "test_default", text = "Krak puts it on a post and hits it with the big club. If it bends, Krak sells it cheap, and if it breaks, Krak gives it to Zulrg to hit people with." },
      },
      choices = {
        { text = "What if it doesn't bend at all?", next = "test_none" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test_none = {
      lines = {
        { id = "test_none_default", text = "Then Krak hits it again, harder. Nothing does not bend, little one. But the good ones bend only a little, and Krak sells those to friends." },
      },
      choices = {
        { text = "Am I a friend?", next = "test_friend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    test_friend = {
      lines = {
        { id = "test_friend_default", text = "You are talking to Krak, and you did not call Krak stupid. So yes, Krak thinks you are a friend." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    get = {
      lines = {
        { id = "get_default", text = "Orcs bring it from the big orc city, in boxes, on the flying beasts. Some Krak finds on the road, where the Theramore men fought the spiders and lost. Krak washes those ones first." },
      },
      choices = {
        { text = "Do the orcs treat the Stonemaul fairly?", next = "get_fair" },
        { text = "Something else.", next = "BACK" },
      },
    },
    get_fair = {
      lines = {
        { id = "get_fair_default", text = "Orcs pay, and orcs do not cheat on the count. Krog is a good orc, and he asks Krak what the village needs before he writes his letters. The Overlord never asks Krak anything." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    coward = {
      big = true,
      lines = {
        { id = "coward_default", text = "Mok'Morokk says this! He says that a real ogre needs only fists. Then the dragon fire came, and many real ogres are dead now, and Mok'Morokk ran very fast." },
      },
      choices = {
        { text = "Armor is good sense. A dead warrior wins nothing.", next = "BACK", reply = "Yes! That is what Krak says, and Krak is alive, so Krak is right.", fx = { align = { order = 1 } } },
        { text = "Mok'Morokk's right. Fists and courage are an ogre's armor.", next = "BACK", reply = "Then you can go and fight the dragons with fists. Krak will keep your armor safe here while you are gone.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    piece = {
      lines = {
        { id = "piece_default", text = "The hat. Krak has been hit in every place, and the head is the place where it matters. An ogre has two heads sometimes, but you have only the one." },
      },
      choices = {
        { text = "I'll look after it.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zulrg = {
      lines = {
        { id = "b_zulrg_default", text = "Zulrg is Krak's best friend. Zulrg sells the thing that hits, and Krak sells the thing that stops the hit, and so every customer needs both of us. That is what Zulrg calls business." },
      },
      choices = {
        { text = "Do you two ever test his weapons on your armor?", next = "zulrg_test" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zulrg_test = {
      lines = {
        { id = "b_zulrg_test_default", text = "Every night, behind the big hut! Zulrg swings, and Krak holds the shield. Sometimes Zulrg wins and sometimes Krak wins, and then Ogg'marr brings meat and nobody remembers who won." },
      },
      choices = {
        { text = "What was the old village like?", next = "old" },
        { text = "Something else.", next = "BACK" },
      },
    },
    old = {
      lines = {
        { id = "b_old_default", text = "It was big, and it had stone walls, and Krak's hut had a door. Then the black dragons came. Krak does not have a door now, and Krak thinks about that door a lot." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "Krak was a smasher. Then Krak's leg got burned by a dragon, and now Krak sells armor so that other legs do not get burned." } },
    advice = { { id = "tp_advice", text = "Wear the hat. Always wear the hat." } },
    onyxia = { { id = "tp_onyxia", text = "Krak does not know that name. Krak knows that the black dragons took the old home, and Krak wants it back." } },
    thrall = { { id = "tp_b_thrall", text = "The orc chief sent Krog and the boxes of armor. Krak has not met the orc chief, but Krak would shake his hand, carefully." } },
    rumors = { { id = "tp_b_rumors", text = "Tharg talks quietly with the big ogres at night. Krak is not supposed to hear, and so Krak did not hear, and Krak hopes Tharg wins." } },
    _none = { { id = "tp_none", text = "Krak does not know. Krak knows armor, and how hard to hit it." } },
  },
}

---------------------------------------------------------------------------
-- Zanara (Brackenwall Village, bowyer)
---------------------------------------------------------------------------
P:NPC {
  key = "zanara", id = TODO_NPC("Zanara"), name = "Zanara", title = "Bowyer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "brackenwall" }, temper = { "blunt", "proud" }, values = { "honor", "craft" },
  notices = { "class", "kit" , "race" },
  impression = {
    first = "Zanara sells bows in a village of ogres who have no use for them, and she has made her peace with it. She keeps her stock oiled against the damp with a soldier's stubbornness.",
    third = "{name} met the orc Zanara, who sells bows in Brackenwall Village.",
  },
  greetings = {
    { id = "g_default", text = "Bows, arrows, and strings that the marsh has not rotted. Look them over, and be quick about it." },
    { id = "g_2", when = { metBefore = true }, text = "You return. Good, for the last one who bought from me came back too, and that is the best thing a bowyer can hear." },
  },
  notice = {
    { id = "n_1", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. At last, a customer who will not ask me which end the arrow goes in." },
    { id = "n_2", cat = "kit", when = { class = { "WARRIOR", "ROGUE" } },
      text = "You could use something that reaches further than your arm. The spiders here spit, and they do not wait for you to close with them." },
    { id = "n_b1", cat = "race", when = { race = "Troll" },
      text = "A troll. Your kind throw axes where mine draw bows, and I have seen both do the work. You are welcome at my rack." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "hello_default", key = true, text = "I am Zanara. I sell bows to the Horde's hunters in this marsh, and I try to sell them to ogres, who snap them like twigs and ask for something heavier." },
        { id = "hello_2", when = { faction = "Alliance" }, text = "I do not sell to the Alliance. You may look, and then you may leave, and that is more courtesy than Theramore would show me." },
      },
      again = {
        { id = "hello_again1", text = "What else? Speak while I oil this stave." },
        { id = "hello_again2", text = "Ask, then. The damp never rests, but I can." },
        { id = "hello_again3", text = "Go on." },
      },
      choices = {
        { text = "Show me your bows.", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "Why sell bows to ogres at all?", next = "ogres" },
        { text = "How do you keep a bow sound in this damp?", next = "damp" },
        { text = "A bow is a coward's weapon.", next = "coward" },
        { text = "What's worth hunting out there?", next = "hunting", when = { class = "HUNTER" } },
        { text = "What do the scouts report from Theramore's road?", next = "scouts" },
        { text = "Strength and honor, Zanara.", next = "END" },
      },
    },
    ogres = {
      lines = {
        { id = "ogres_default", text = "Because Krog asked for a bowyer for the outpost, and I am a soldier who goes where she is sent. The ogres are not the customers, they are only the neighbours. The customers are the scouts who watch Theramore." },
      },
      choices = {
        { text = "Do the ogres give you trouble?", next = "ogres_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ogres_trouble = {
      lines = {
        { id = "ogres_trouble_default", text = "One of them sat on a crate of my arrows in the first week. He was sorry, and he brought me a boar to make up for it, which is more than most orcs would do. I have liked them since." },
      },
      choices = {
        { text = "Even Mok'Morokk?", next = "ogres_mok" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ogres_mok = {
      lines = {
        { id = "ogres_mok_default", text = "I said the ogres, and I did not say their Overlord. He shouts at those weaker than he is, and he bows to anyone stronger. I have known orcs like that, and none of them were worth following." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    damp = {
      lines = {
        { id = "damp_default", text = "Oil, wax, and never leaving one strung overnight. I lost a third of my first shipment to rot before I learned it. Now I keep them wrapped in oiled hide, up off the ground." },
      },
      choices = {
        { text = "That's hard-won knowledge.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coward = {
      big = true,
      lines = {
        { id = "coward_default", text = "I have heard that from warriors who have never been shot at. My mother put an arrow through a human knight's visor at eighty paces in the Second War, and he had no time to call her anything at all." },
      },
      choices = {
        { text = "Skill at any range is still skill. I was wrong.", next = "BACK", reply = "You were, and it takes some honour to say so. Most do not.", fx = { align = { honor = 1 } } },
        { text = "Honour means facing your enemy up close.", next = "BACK", reply = "Then face them, and I will be on the hill behind you, keeping you alive. We shall see whom the songs remember.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunting = {
      lines = {
        { id = "hunting_default", text = "There are raptors to the north, and crocolisks in every pool, and those are good for the meat. The big spiders near Darkmist are worth nothing at all, but killing them is good practice and a service to the village." },
      },
      choices = {
        { text = "Raptors, then.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scouts = {
      lines = {
        { id = "b_scouts_default", text = "More patrols than last season, and jumpier ones. Something has frightened the humans, and frightened soldiers loose arrows at shadows. I tell our scouts to keep to the high ground and to give them no shadow to shoot at." },
      },
      choices = {
        { text = "What frightened them?", next = "scouts_fright" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scouts_fright = {
      lines = {
        { id = "b_scouts_fright_default", text = "An inn of theirs was burned on the north road, and they think that we did it. Krog swears that no order was given, and I believe him, because Krog is too tired to lie." },
      },
      choices = {
        { text = "Who made these bows, if not you?", next = "maker" },
        { text = "Something else.", next = "BACK" },
      },
    },
    maker = {
      lines = {
        { id = "b_maker_default", text = "Some I made, and the best came from a bowyer in Orgrimmar who learned her craft before the camps. I can match her tiller now, but I cannot yet match her finish, and I know it each time I string one." },
      },
      choices = {
        { text = "That's an honest thing to admit.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_background", text = "I carried a bow for the Horde before I ever sold them. An old wound keeps me from the front, and so I arm those who can still go." } },
    advice = { { id = "tp_advice", text = "Check your string before every hunt. It will break only on the day that you did not." } },
    thrall = { { id = "tp_thrall", text = "He has given the Horde a home worth guarding, and I would stand in a worse swamp than this one to guard it." } },
    internment = { { id = "tp_internment", text = "I was a child in the camps. I remember that the grown orcs did not look up at anything, and I have looked up ever since." } },
    onyxia = { { id = "tp_b_onyxia", text = "The ogres speak of a black dragon brood in the south that took their old home. I would like to see what one of my arrows does to a whelp." } },
    rumors = { { id = "tp_b_rumors", text = "A scout swears that he saw Grimtotem tauren near the burned inn, well before the humans found it. I told him to tell Krog, and not to tell anyone else." } },
    _none = { { id = "tp_none", text = "That is not my concern. Ask Krog, for he is paid to know such things." } },
  },
}

-- Sully "The Pickle" McLeary: a dwarf SI:7 agent, rifleman and fixer of other people's machines, sent to
-- Dustwallow on a vital mission at Alcaz Prison (Forever). He won't say what the mission is. Quests not captured yet.
P:NPC {
  key = "dw_sully_mcleary", id = TODO_NPC("Sully \"The Pickle\" McLeary"), name = "Sully \"The Pickle\" McLeary", title = "SI:7", gender = "male",
  role = "scout", tier = "quest",
  temper = { "hearty", "sly" }, values = { "loyal", "practical" },
  notices = { "race", "class", "craft" },
  impression = {
    first = "A dwarf with a rifle across his knees and a pocketful of screws, who goes quiet the moment you mention Alcaz.",
    third = "{name} met Sully \"The Pickle\" McLeary, an SI:7 dwarf in Dustwallow Marsh on some business at Alcaz Prison he won't explain.",
  },
  greetings = {
    { id = "g_default", text = "Keep yer voice down, would ye? I'm no' here, officially, an' I'd like tae keep it that way." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you again. Still no' here, mind, but I'll make an exception." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Keep walkin', and keep yer hands where I can see them, for I've a rifle an' nae patience." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A fellow son o' Khaz Modan, out in this muck! Ye'll understand, then, why I'd trade my rifle for one dry pair o' boots." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE", faction = "Alliance" },
      text = "Ye walk like one o' Shaw's lot. Dinnae tell me who sent ye, an' I'll no' tell ye who sent me." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Is that a blasting-powder burn on yer glove? Ha! Ye're an engineer, then, an' a proper one, by the scorch." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      narr = "He has a half-mended gnomish gadget open on his knee, and he closes it as you approach.",
      lines = {
        { id = "h_default", key = true, text = "Sully McLeary, of the Stormwind lads who dinnae officially exist, an' I'm out here on a wee errand for king an' country. It concerns Alcaz, and that's as much as ye'll get out o' me without a great deal of ale." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "Sully McLeary, lad, SI:7, an' it's a rare treat tae hear a proper accent in this swamp. I'm here on business out at Alcaz, an' it's the kind o' business I cannae talk about, even tae kin." },
      },
      again = {
        { id = "h_again", text = "What else, then? Quick, before the mosquitoes carry me off." },
        { id = "h_again2", text = "Ask away, though I'll no' promise tae answer." },
      },
      choices = {
        { text = "What's at Alcaz Prison?", next = "alcaz" },
        { text = "Why do they call you \"The Pickle\"?", next = "pickle" },
        { text = "SI:7 sends a dwarf? I thought they were all humans.", next = "si7" },
        { text = "That gadget on your knee is gnomish.", next = "gadget" },
        { text = "That rifle's seen some miles.", next = "rifle" },
        { text = "What do you make of Theramore's peace with the Horde?", next = "peace" },
        { text = "What's the worst of this swamp?", next = "swamp" },
        { text = "Any news from Ironforge, cousin?", next = "ironforge", when = { race = "Dwarf" } },
        { text = "I'm a gnome. Those springs were load-bearing, you know.", next = "gnome", when = { race = "Gnome" } },
        { text = "I've done some quiet work for Shaw myself.", next = "rogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'll leave you to your errand.", next = "END" },
      },
    },
    alcaz = {
      lines = { { id = "a_default", text = "A prison, on an island, in a swamp, which is three good reasons tae stay away from it. What's inside it is the Crown's business, an' I'd thank ye tae forget ye asked, for yer own sake as much as mine." } },
      choices = {
        { text = "Secrets keep soldiers alive. I won't pry.", next = "BACK", reply = "Good on ye. If more folk thought like that, my job would be a great deal shorter.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Secrets in a prison usually mean someone's hiding something ugly.", next = "BACK", reply = "Aye, sometimes they do, an' sometimes the ugly thing's what's locked up. Either way, I'm no' sayin'.", fx = { align = { order = -1 } } },
        { text = "Does Theramore know you're here?", next = "theramore" },
      },
    },
    theramore = {
      lines = { { id = "t_default", text = "Lady Proudmoore's people know what they need tae know, an' they've been decent hosts, which is more than I can say for the crocolisks. Theramore's a fine wee town, though it smells o' fish an' wet wool." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pickle = {
      lines = { { id = "p_default", text = "Ha! Because I'm forever in one, {g:lad|lass}, or so Shaw's lot say, an' because I once kept a jar o' them in my pack through a whole job an' fed half a garrison with it. I was a cook before I was a spy, an' I've never seen why a man cannae be both." } },
      choices = {
        { text = "A cook and a spy? Sounds like a fine cover.", next = "cook" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cook = {
      lines = { { id = "c_default", text = "The best, for naebody suspects the man with the ladle. Ye'd be amazed what an officer tells ye when ye've just handed him a hot bowl o' stew on a cold night." } },
      choices = { { text = "I'll remember that trick. Something else.", next = "BACK" } },
    },
    si7 = {
      lines = { { id = "s_default", text = "Mostly, aye, but they need someone who can fix a rifle an' a cannon an' a gnome's flyin' contraption without readin' the manual, an' that's me. Shaw sends me wherever somethin's broken an' somethin' else needs watchin'." } },
      choices = {
        { text = "Who is Shaw?", next = "shaw" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaw = {
      lines = { { id = "sh_default", text = "Mathias Shaw, an' if ye've no' met him, ye've probably walked past him in Old Town without noticin'. That's rather the point of him, an' it's why I'll say nae more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gadget = {
      lines = { { id = "g_default", text = "Aye, a gnome built it, an' a gnome would've built it twice as complicated as it needed tae be. I've taken out four springs an' it works better than it ever did, though I'll no' tell the gnome." } },
      choices = {
        { text = "Simple beats clever every time.", next = "BACK", reply = "Spoken like a dwarf, an' I'll drink tae it, when I've somethin' tae drink.", fx = { align = { order = 1 } } },
        { text = "The gnomes might know something you don't.", next = "BACK", reply = "Aye, they might, an' they'd tell ye at great length, too. Still, my way, it doesnae explode.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rifle = {
      lines = { { id = "ri_default", text = "Made in Ironforge by my uncle, who swore it'd outlive me, an' it's tried its best tae prove him right. It's been dropped off a gryphon, buried in a bog, an' once used as a spit for roastin' a boar, an' it still shoots straight." } },
      choices = {
        { text = "A spit? You really were a cook.", next = "rifle_cook" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rifle_cook = {
      lines = { { id = "rc_default", text = "Still am, when the job allows. Out here I've been eatin' marsh crab an' worse, an' I'd give a month's pay for a proper Dun Morogh sausage an' a mug o' Thunderbrew. Dinnae tell Shaw I said that, he'll dock me the month." } },
      choices = {
        { text = "How did a cook end up in SI:7?", next = "rifle_recruit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rifle_recruit = {
      lines = { { id = "rr_default", text = "I fixed a jammed cannon on a Stormwind ship while the cook's fire was still goin', an' someone important noticed both. A week later a quiet man asked if I'd like tae see the world, an' I said aye before I thought tae ask which bits." } },
      choices = { { text = "Mostly the damp bits, it seems. Something else.", next = "BACK" } },
    },
    peace = {
      big = true,
      lines = { { id = "pe_default", text = "Lady Proudmoore keeps the peace with the orcs at Durotar, an' plenty in Stormwind grumble about it. I've my own view, but I'm a servant o' the Crown, so I'll hear yers first." } },
      choices = {
        { text = "The peace keeps folk alive. Proudmoore is right.", next = "BACK", reply = "Aye, it does, an' I've seen what the alternative looks like. I'll keep my rifle loaded all the same.", fx = { align = { honor = 1 } } },
        { text = "You can't make peace with orcs. It won't last.", next = "BACK", reply = "Plenty agree wi' ye, back in Stormwind. Maybe ye're right, an' maybe that's why they keep sendin' me places.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    swamp = {
      lines = { { id = "sw_default", text = "Crocolisks, mosquitoes the size o' sparrows, an' the black dragonkin in the south, around the Wyrmbog, that nobody likes tae talk about. There's somethin' bigger down there than the whelps, an' I'd stay well clear o' the place." } },
      choices = {
        { text = "Something bigger? Like what?", next = "swamp_big" },
        { text = "Something else.", next = "BACK" },
      },
    },
    swamp_big = {
      lines = { { id = "sb_default", text = "If I knew, I'd say so, an' I'm glad I dinnae. Theramore's scouts go quiet when ye ask, an' that's enough for me tae keep my boots out o' the Wyrmbog." } },
      choices = { { text = "Sound advice. Something else.", next = "BACK" } },
    },
    ironforge = {
      lines = { { id = "if_default", text = "Ha, I've been in this bog so long I'd no' know if the king had shaved his beard. Last I heard, the Dark Irons were stirrin' again in the Searing Gorge, an' Thunderbrew raised his prices, an' I'm no' sure which news hurt more." } },
      choices = { { text = "The prices, surely. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Load-bearin', were they? Then why does it work better without 'em? <He tilts the gadget toward you.> Go on, then, show me what I took out, an' I'll put one back if ye can prove it." } },
      choices = {
        { text = "<Point to the spring that stops it overheating.>", next = "BACK", reply = "Ah. Well. That one, aye, I'll be puttin' that one back now. Dinnae look so smug.", fx = { affinity = 1 } },
        { text = "Never mind. Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Have ye, now? Then ye'll know better than tae say so out loud, in an open swamp, tae a man ye've just met. Lesson one, {g:lad|lass}, an' I'll no' charge ye for it." } },
      choices = { { text = "Fair point. Something else.", next = "BACK" } },
    },
  },
  topics = {
    alcaz = { { id = "tp_alcaz", text = "An island prison. That's all ye'll get from me, an' it's more than I should've said." } },
    shaw = { { id = "tp_shaw", text = "Ye'll never see him comin'. That's all I'll say." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, even if I knew, an' I'm no' sayin' I do." } },
  },
}
