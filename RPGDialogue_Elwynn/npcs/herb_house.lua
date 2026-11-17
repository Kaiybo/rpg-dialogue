-- The hillside house east of Stormwind's gates: Alchemist Mallory and Herbalist Pomeroy.
-- (Forever: Camping 101: Alchemy and Camping 101: Herbalism.) Voice: bibles/herb_house.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Alchemist Mallory: alchemy trainer, always in the middle of something.
P:NPC {
  key = "mallory", id = TODO_NPC("Alchemist Mallory"), name = "Alchemist Mallory", title = "Alchemy Trainer",
  bible = "bibles/herb_house.md", role = "trainer", tier = "service",
  communities = {}, temper = { "intent" }, values = { "precision", "craft" },
  notices = { "craft", "class" },
  impression = {
    first = "Alchemist Mallory never once put down his stirring rod while we talked. He is courteous in a distracted way, and I suspect the potion had more of his attention than I did.",
    third = "{name} met Alchemist Mallory, who teaches alchemy from a hillside house east of Stormwind's gates.",
  },
  greetings = {
    { id = "g_default", text = "Good day to you. Forgive me if I keep stirring; it curdles if I stop." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Stand by the window, would you, where the fumes are kinder." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You've stained fingertips, so you've been at the mortar already. Yellow means earthroot, if I'm any judge, and you've been grinding it too hard." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. You'll be wanting to learn poisons one day, I expect, and I'll tell you now that I teach cures, not the other thing." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Somewhat, I'd say. We both use the elements, but I measure mine. Your spirits might not like measuring." } },
      choices = {
        { text = "Careful measurement is wisdom, Mallory. I respect it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The spirits don't measure. They just answer.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Constantly, because I'd blame half my failures on a sulky root if I could prove it. Pomeroy swears the peacebloom grows better when he hums, and I've stopped arguing, because the potions are better too." } },
      choices = {
        { text = "Herbs aren't sulky. Measure carefully and the potion follows.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Trust Pomeroy's humming. The plants know what they need.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Three, and drink the first when you're half done, not when you're nearly gone. Warriors save them like heirlooms and then fall over clutching a full flask, which is a waste of my afternoon." } },
      choices = {
        { text = "Three, then, and I'll drink when it's sensible.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll save them until I truly need them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Peacebloom and silverleaf, for a start, from the fields around Goldshire. Hunters see more of the ground than anyone, so if you pick as you go, you'll keep me in stock and yourself in potions." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And mind your {pet} doesn't eat the silverleaf. It gives a beast a terrible bellyache, and you'll smell it for days." },
      },
      choices = {
        { text = "I'll pick carefully and leave the roots.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll pull up the whole patch. It grows back.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a potion's a patient thing, and every mage who's tried to hurry one with a fireball has blown the lid off my best still. Pomeroy still finds bits of copper in the herb beds from the last one." } },
      choices = {
        { text = "Patience in the craft. I'll leave my spells out of it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If a spell does it faster, the risk is worth it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because a warlock's student from Goldshire once bought three ounces of it and told me it was for his garden, and I've never seen a garden that needed that much killing. I'll sell you healing draughts all day, but the poisons stay up there." } },
      choices = {
        { text = "That's a wise rule, Mallory. Keep the poisons high.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Nightshade has its uses. You're too careful by half.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They can, and they do, though the Brothers at the Abbey don't like to talk about it. A draught of peacebloom and silverleaf eases a man who can't be saved, and I'll brew it for anyone who asks, because I've seen the alternative." } },
      choices = {
        { text = "Easing suffering is holy work, Mallory.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Death should come when it comes, not out of a bottle.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Mallory.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More than they'd admit, because the Light doesn't always answer when you're tired and bleeding. I once sold a paladin a dozen healing potions and asked if he was going to war, and he said no, he was going to Westfall, which I suppose is much the same these days." } },
      choices = {
        { text = "Then I'll carry extra, for those who can't afford them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Potions are for me. Others can buy their own.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Your sort come through for healing potions before a long road, and I'm always glad to see you come back for more." },
        { id = "h_default", text = "Mallory, alchemist, and I'd offer you my hand if it weren't busy keeping this from boiling over. If you've come to learn the craft, you've found the right house; Pomeroy over there teaches you to gather, and I teach you what to do after." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Alchemy") },
          text = "Sam Sarsaparilla sent you up from the road, did he? He does like his campfires. Well, a camp is no use if nobody in it can mix a remedy, so let's see what you can do." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priest! Your prayers do quicker work than my potions, I'll grant, but a potion doesn't run dry when you're tired, so I like to think we're partners." },
        { id = "h_troll", when = { race = "Troll" }, text = "A troll, of all things, at my door! Your people's witch doctors know a great deal about herbs that I'd dearly love to learn, though I doubt they'd teach a human." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Your kind make the best alchemists, if only you'd stop trying to do everything with a spell." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You'll not be wanting anything off my top shelf, I hope, because I keep the nightshade up there for a reason." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want healing potions, and you'll want more than you think, because your sort always run short at the worst moment." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter at my door. You'll be gathering for me before long, I expect, since your sort walk where the herbs grow." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and you're looking at Pomeroy's herb beds with a very critical eye. Don't tell him, because he's sensitive about the peacebloom." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Hold on, I'm stirring. Do your spirits know alchemy? Fire, water, earth: they're all in my cauldron." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the green flask; it isn't finished." },
        { id = "h_again2", text = "Go on. I can stir and talk, though not always both well." },
      },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "What should a new alchemist make first?", next = "first" },
        { text = "Why work out here instead of the city?", next = "house" },
        { text = "What are you brewing now?", next = "brew" },
        { text = "Sam sent me about a camp.", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Alchemy") } },
        { text = "Why shouldn't a mage use spells in alchemy?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What reason would you have to keep nightshade high?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How many healing potions should a warrior carry?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What would an alchemist ask a hunter to bring?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Could your potions ease the dying, Mallory?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do paladins buy many potions from you, Mallory?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you ever wonder what the herbs think of your potions?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you think shamanism and alchemy are alike, Mallory?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "A minor healing potion: peacebloom, silverleaf and a clean vial, and nothing else. Every alchemist makes a hundred of them before making anything clever, and the ones who skip ahead poison themselves." } },
      choices = {
        { text = "Where do I find the herbs?", next = "first_herbs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_herbs = {
      lines = { { id = "fh_default", text = "All over Elwynn, along the roads and under the trees, but ask Pomeroy, not me. She'll tell you more about peacebloom than you'll ever want to know, and she'll be right about all of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    house = {
      lines = { { id = "h2_default", text = "Because the city's alchemists share a street, and my neighbours there complained about the smell every week. Out here there's only Pomeroy, the herbs grow up to the door, and the guards at the gate send their wounded to me when the Cathedral's too far." } },
      choices = {
        { text = "Do the guards pay you?", next = "house_guards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    house_guards = {
      big = true,
      lines = { { id = "hg_default", text = "When they remember, which isn't often. I won't turn a bleeding man away for want of silver, but I've a roof to keep, so I send the bill to the barracks and hope." } },
      choices = {
        { text = "Healing shouldn't wait on coin. You're right.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Your work has value. Make them pay first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brew = {
      lines = { { id = "b_default", text = "An elixir to steady a sword arm, for a sergeant at the gate who swears his hands shake only in the cold. I suspect it's the ale and not the cold, but he's paying, so I'm brewing." } },
      choices = {
        { text = "Will it help him?", next = "brew_help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brew_help = {
      lines = { { id = "bh_default", text = "It'll help him feel brave, which is half of what most elixirs do. The other half is earthroot and patience, and I've plenty of both." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    camp = {
      lines = { { id = "c_default", text = "Then learn to mix something simple over an open fire, without a proper bench, because that's what a camp gives you. It's harder than it sounds, and it teaches you which steps you can't skip." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I studied under an apothecary in Stormwind's Trade District and left when his street grew too crowded for two of us." } },
    advice = { { id = "tp_ad", text = "Taste nothing you've just brewed, friend. Let someone else be brave first." } },
    camping = { { id = "tp_camping", text = "Sam's campfires are fine for sausages. For anything finer, you want a steady flame and a good deal of patience." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, and I can't stop stirring to find out." } },
  },
}

-- Herbalist Pomeroy: herbalism trainer, beside Mallory in the same house.
P:NPC {
  key = "pomeroy", id = TODO_NPC("Herbalist Pomeroy"), name = "Herbalist Pomeroy", title = "Herbalism Trainer",
  bible = "bibles/herb_house.md", role = "trainer", tier = "service",
  communities = {}, temper = { "warm" }, values = { "nature", "patient" },
  notices = { "craft", "class" },
  impression = {
    first = "Herbalist Pomeroy keeps her boots muddy and her baskets full, and she spoke of Elwynn's hillsides as if each one were a friend. She seemed fond of Mallory and of teasing him.",
    third = "{name} met Herbalist Pomeroy, who teaches herbalism beside Alchemist Mallory east of Stormwind's gates.",
  },
  greetings = {
    { id = "g_default", text = "Wipe your boots, dear, or don't; the herbs won't mind the mud." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Have you brought me any earthroot, or only questions?" },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You've a gatherer's hands, I can tell; there's green under every nail. Good, because it's the only honest way to learn." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! You'll know half of what I teach already, and the other half you'll argue with, I expect. Your people talk to the plants, I'm told, and I've only ever talked at them." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd say they do, and kindly ones. Every herb grows where it's happy, and that's a kind of spirit, isn't it?" } },
      choices = {
        { text = "The hills deserve gentle hands, Pomeroy. You have them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Herbs are herbs. Gather them and move on.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They do, and they're picky about it, which I like in a customer. One of them asked me for something that grows only on graves, and I told him I don't gather in Duskwood and never will, and he went off looking disappointed." } },
      choices = {
        { text = "You're right not to gather there, Pomeroy.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Grave herbs have their uses. You're missing out.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Pomeroy.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Earthroot, chewed, for a bruise that won't settle, and bark of the silver birch for a sore head. Mallory will tell you a potion's better, and she's right, but a root in your pocket costs nothing." } },
      choices = {
        { text = "I'll carry the root. Every little help counts.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll leave the roots to farmers.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Peacebloom, along the roads, and silverleaf in the shade by the river. You'll find them where the deer have grazed and left the rest, and if your beast stops to sniff, it's usually found something." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has its nose to the ground already. Half my best patches were found by somebody's dog." },
      },
      choices = {
        { text = "I'll gather as I go and leave the patches whole.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take all I find. Another hunter would.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Peacebloom and silverleaf and earthroot, which mend more than they harm, and that's all I'll put in the ground. The Defias pay well for nastier things, I'm told, but they'll have to dig them up somewhere else." } },
      choices = {
        { text = "Mending herbs are worth more than poison. I respect that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Poison pays better, Pomeroy. You're leaving coin in the ground.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the best ones go to Mallory for the gate guards' draughts, and a guard on his feet is worth more than a spell on a page. You can have the second best, and they'll still write better than anything you'd buy in Stormwind." } },
      choices = {
        { text = "The guards come first. The second best will do me fine.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My research matters more than a guard's sore feet.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not the same way, but they go in the same direction, and I've never seen them quarrel. Whether you pray to the Light or the moon, a bit of peacebloom on a wound won't argue with you about it." } },
      choices = {
        { text = "All healing serves the same good. Both are gifts.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Herbs are for those without true faith, Pomeroy.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Pomeroy.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The gate guards, mostly, and the farmers who can't afford the Abbey's healers. Mallory brews and I gather, and between us we keep a lot of people on their feet who'd otherwise be on their backs." } },
      choices = {
        { text = "That's service, Pomeroy, as true as any oath.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They should pay the Abbey. Healing isn't free.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I've peacebloom and silverleaf, if you'd like to learn which herbs work alongside your prayers." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll not have time to learn herbs, I expect, with all your duties, but if you see silverleaf by the road, I'd be grateful if you picked it." },
        { id = "h_default", text = "Pomeroy, and I teach herbalism, which is a grand name for knowing where to look and when to pick. Mallory brews and I gather, and between us we keep half the gate guards on their feet." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Herbalism") },
          text = "Sam's sent you, has he? He wants every camp to have someone who can tell a healing leaf from a bellyache, and he's right about that, bless him." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "One of the kaldorei! I've heard your forests grow herbs I've never seen, and I'll confess I'm a little jealous of you for it." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "A hunter. You walk the woods anyway, so you might as well learn what you're stepping on, and I'll wager half of it's useful." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in an herb house. You'll be after something for your blades, I'd wager, and I'll tell you now I don't grow that sort of thing." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. You'll be wanting herbs for your inks, I suppose, and I can spare a few, though not the best ones." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior in the herb house. Stand still, now, because you've knocked my drying rack twice already." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! I've heard your sort pick certain herbs by moonlight, and I'd love to know which ones, if you're willing to tell." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! The hillsides here are friends of mine. Do your earth spirits know them?" },
      },
      again = {
        { id = "h_again", text = "What else, dear? I've roots drying and nowhere to be." },
        { id = "h_again2", text = "Ask whatever you like, dear; the roots on the rack won't mind waiting." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "What grows in Elwynn?", next = "herbs" },
        { text = "How do you and Mallory get along?", next = "mallory" },
        { text = "Is gathering ever dangerous?", next = "danger" },
        { text = "Sam sent me about a camp.", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Herbalism") } },
        { text = "What do you grow, if not something for blades?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why won't you spare the best herbs for a mage?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do any of your herbs help a warrior?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should a hunter learn to look for underfoot?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do herbs and prayer heal the same way, Pomeroy?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who in Elwynn needs your herbs most, Pomeroy?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do warlocks ever buy herbs from you, Pomeroy?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you think the hills here have spirits, Pomeroy?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day to you.", next = "END" },
      },
    },
    herbs = {
      lines = { { id = "h2_default", text = "Peacebloom in the open meadows, silverleaf in the shade under the trees, and earthroot along the hills, where the soil is rocky. Learn those three and you'll never want for work in Elwynn." } },
      choices = {
        { text = "And beyond Elwynn?", next = "herbs_far" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_far = {
      lines = { { id = "hf_default", text = "Mageroyal and briarthorn further afield, in Westfall's ditches and the Redridge hills. Duskwood has some lovely things too, but you'll not catch me picking among the dead to find them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mallory = {
      lines = { { id = "m_default", text = "Like an old married couple who were never married. He tells me my herbs are bruised, I tell him his potions smell like a wet dog, and then we have tea." } },
      choices = {
        { text = "Do his potions really smell that bad?", next = "mallory_smell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mallory_smell = {
      lines = { { id = "ms_default", text = "Worse, some days. But I've seen him sit up all night with a guard's wound, and I'll forgive a man a great deal of smell for that." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    danger = {
      big = true,
      lines = { { id = "d_default", text = "Wolves in the woods and kobolds near the mines, and lately the Defias, who don't like folk wandering near their camps. I've started taking the long way round, which means fewer herbs and longer days." } },
      choices = {
        { text = "The Guard should clear the woods for honest folk.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Carry a knife and pick where you please.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "Then pick what you can by the roadside, and learn which leaves keep and which spoil by morning. A camp herbalist is worth more than a camp cook, though don't tell Tomas I said so." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I grew up picking herbs for my grandmother's remedies, and I never saw a reason to stop." } },
    advice = { { id = "tp_ad", text = "Take the leaves and leave the root, dear, and the plant will be there for you next spring." } },
    camping = { { id = "tp_camping", text = "A campfire's a fine thing, but it's nothing without a few good leaves to put in the pot." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, dear. If it doesn't grow, I don't know much about it." } },
  },
}
