-- The hillside house east of Stormwind's gates: Alchemist Mallory and Herbalist Pomeroy.
-- (Forever: Camping 101: Alchemy and Camping 101: Herbalism.) Voice: bibles/herb_house.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Alchemist Mallory: alchemy trainer, always in the middle of something.
P:NPC {
  key = "mallory", id = TODO_NPC("Alchemist Mallory"), name = "Alchemist Mallory", title = "Alchemy Trainer",
  bible = "bibles/herb_house.md", role = "trainer", tier = "service",
  communities = {}, temper = { "intent" }, values = { "precision", "craft" },
  notices = { "craft", "class", "lock_stones" },
  impression = {
    first = "His potion had more of his attention than I did.",
    third = "{name} met Alchemist Mallory, who teaches alchemy from a hillside house east of Stormwind's gates.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, there you are. Come in; I'll teach you gladly, for you've earned it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll teach you, since it's my duty, but I'll not waste kind words on you." },
    { id = "g_default", text = "Good day to you. Pardon the stirring; it curdles if I stop." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Stand by the window, would you, where the fumes are kinder." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You've stained fingertips, so you've been at the mortar already. Yellow means earthroot, if I'm any judge, and you've been grinding it too hard." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. You'll be wanting to learn poisons one day, I expect, and I'll tell you now that I teach cures, not the other thing." },
    { id = "n_lock_stone", cat = "lock_stones", when = { ["not"] = { class = "WARLOCK" }, carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "Who gave you that healthstone? It's no draught of mine, and it glows the wrong green for anything brewed honestly, so I'd like to know which of the cellar folk is handing them out." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Somewhat, I'd say, for we both use the elements, but I measure mine, and your spirits might not like measuring." } },
      choices = {
        { text = "Skill should be earned honestly, through hard work.", next = "BACK", reply = "That's the only kind that lasts, in my experience.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Any trick that wins the fight is a good trick.", next = "BACK", reply = "It'll win you a fight or two, but it won't make you a master.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Careful measurement is wisdom, Mallory. I respect it.", next = "BACK", reply = "That's kind, and rarer than you'd think from someone who talks to the wind. I'll measure out a little respect for the spirits in return.", fx = { align = { order = 1 } } },
        { text = "The spirits don't measure. They just answer.", next = "BACK", reply = "Which is exactly why I'd never let one near my still. An answer without a measure is how you lose your eyebrows.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Constantly, because I'd blame half my failures on a sulky root if I could prove it. Pomeroy swears the peacebloom grows better when she hums, and I've stopped arguing, because the potions are better too." } },
      choices = {
        { text = "Herbs aren't sulky. Measure carefully and the potion follows.", next = "BACK", reply = "Finally, somebody on my side of the bench! I'll tell Pomeroy you said so, and she'll hum at me for a week out of spite.", fx = { align = { order = 1 } } },
        { text = "Trust Pomeroy's humming. The plants know what they need.", next = "BACK", reply = "Oh, don't encourage her, she'll start humming at the silverleaf too. Still, I suppose I can't argue with a better potion.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Three, and drink the first when you're half done, not when you're nearly gone. Warriors save them like heirlooms and then fall over clutching a full flask, which is a waste of my afternoon." } },
      choices = {
        { text = "Three, then, and I'll drink when it's sensible.", next = "BACK", reply = "Good, because I'd rather sell you a fourth than hear you fell over with three full flasks. Drink early and you'll drink again.", fx = { align = { order = 1 } } },
        { text = "I'll keep them back for when I'm bleeding properly.", next = "BACK", reply = "Every warrior says that, and every warrior ends up on Brother Paxton's table clutching an unopened flask. Do me a kindness and prove me wrong.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Peacebloom and silverleaf, for a start, from the fields around Goldshire. Hunters see more of the ground than anyone, so if you pick as you go, you'll keep me in stock and yourself in potions." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Peacebloom and silverleaf, for a start, from the fields around Goldshire. Mind your {pet} doesn't eat the silverleaf, though, because it gives a beast a terrible bellyache." },
      },
      choices = {
        { text = "I'll pick carefully and leave the roots.", next = "BACK", reply = "Bless you, that's how a patch lasts for years. Pomeroy will love you for it, and so will my stock.", fx = { align = { honor = 1 } } },
        { text = "I'll pull up the whole patch. It grows back.", next = "BACK", reply = "It grows back if you leave the root, and not otherwise, so you'll be pulling up bare dirt by next spring. Leave a little, please, for both our sakes.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a potion's a patient thing, and every mage who's tried to hurry one with a fireball has blown the lid off my best still. Pomeroy still finds bits of copper in the herb beds from the last one." } },
      choices = {
        { text = "Patience in the craft. I'll leave my spells out of it.", next = "BACK", reply = "Thank you, truly, because the still is only just repaired. A potion rewards patience the way a fireball never will.", fx = { align = { order = 1 } } },
        { text = "If a spell does it faster, the risk is worth it.", next = "BACK", reply = "Then do it at your own bench, a long way from mine. I've only just got the soot off the ceiling.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because one of the cellar students from Goldshire once bought three ounces of it and told me it was for his garden, and I've never seen a garden that needed that much killing. I'll sell you healing draughts all day, but the poisons stay up there." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because a warlock's student from Goldshire once bought three ounces of it and told me it was for his garden, and I've never seen a garden that needed that much killing. Your servant has been reading my top shelf since you came in, which is exactly why the poisons stay up there." },
      },
      choices = {
        { text = "That's a wise rule, Mallory. Keep the poisons high.", next = "BACK", reply = "I'm glad you see it, because not everyone with your sort of books does. Healing draughts are on the low shelf, and you're welcome to them.", fx = { align = { light = 1 } } },
        { text = "Nightshade has its uses. You're too careful by half.", next = "BACK", reply = "Uses, yes, and I've seen most of them, which is exactly why it's out of reach. You'll find me careful by a whole shelf, not by half.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They can, and they do, though the Brothers at the Abbey don't like to talk about it. A draught of peacebloom and silverleaf eases a man who can't be saved, and I'll brew it for anyone who asks, because I've seen the alternative." } },
      choices = {
        { text = "Easing suffering is holy work, Mallory.", next = "BACK", reply = "I'd like to think so, though the Brothers wouldn't put it that way. Thank you for saying it, because I don't hear it often.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Death should come when it comes, not out of a bottle.", next = "BACK", reply = "It comes when it comes either way, and I've only ever made it gentler. You'll understand when you've sat with someone who wished it would hurry.", fx = { align = { light = -1 } } },
        { text = "Something else, Mallory.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More than they'd admit, because the Light doesn't always answer when you're tired and bleeding. I once sold a paladin a dozen healing potions and asked if he was going to war, and he said no, he was going to Westfall, which I suppose is much the same these days." } },
      choices = {
        { text = "Then I'll carry extra, for those who can't afford them.", next = "BACK", reply = "Then you're a better sort of paladin than most I've sold to. The farmers in Westfall could use every one of them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Potions are for me. Others can buy their own.", next = "BACK", reply = "They can, if they've the silver, and most of them haven't. Still, it's your coin, so I'll sell them to you and keep my opinions to myself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Your sort come through for healing potions before a hard march, and I'm always glad to see you come back for more." },
        { id = "h_default", text = "Mallory, alchemist, and I'd offer you my hand if it weren't busy keeping this from boiling over. If you've come to learn the craft, you've found the right house; Pomeroy over there teaches you to gather, and I teach you what to do after." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Alchemy") },
          text = "Sam Sarsaparilla sent you up from the road, did he? He does like his campfires. Well, a camp is no use if nobody in it can mix a remedy, so let's see what you can do." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priest! Your prayers do quicker work than my potions, I'll grant, but a potion doesn't run dry when you're tired, so I like to think we're partners." },
        { id = "h_troll", when = { race = "Troll" }, text = "A troll, of all things, at my door! Your people's witch doctors know things about herbs that I'd dearly love to learn, though I doubt they'd teach a human." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Your kind make the best alchemists, if only you'd stop trying to do everything with a spell." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You'll not be wanting anything off my top shelf, I hope, because I keep the nightshade up there for a reason." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want healing potions, and you'll want more than you think, because your sort always run short at the worst moment." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter at my door. You'll be gathering for me before long, I expect, since your sort walk where the herbs grow." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and you're looking at Pomeroy's herb beds with a very critical eye. Don't tell her, because she's sensitive about the peacebloom." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Hold on, I'm stirring. Fire, water and earth are all in my cauldron, so I'd guess your spirits know a little alchemy." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the green flask; it isn't finished." },
        { id = "h_again2", text = "Go on. I can stir and talk, though not always both well." },
      },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "What should a new alchemist make first?", next = "first" },
        { text = "I'd have thought an alchemist would work in the city.", next = "house" },
        { text = "Something's brewing on your bench.", next = "brew" },
        { text = "Sam Sarsaparilla sent me about a camp.", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Alchemy") } },
        { text = "Why shouldn't a mage use spells in alchemy?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What reason would you have to keep nightshade high?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How many healing potions should a warrior carry?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What would an alchemist ask a hunter to bring?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Your potions must ease the dying too, Mallory.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'd guess paladins buy more potions than they let on, Mallory.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you ever wonder what the herbs think of your potions?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Shamanism and alchemy seem alike in some ways, Mallory.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
      lines = { { id = "h2_default", text = "Not this one, because the city's alchemists share a street, and my neighbours there complained about the smell every week. Out here there's only Pomeroy, the herbs grow up to the door, and the guards at the gate send their wounded to me when the Cathedral's too far." } },
      choices = {
        { text = "I'd guess the guards don't always pay you.", next = "house_guards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    house_guards = {
      big = true,
      lines = { { id = "hg_default", text = "When they remember, which isn't often. I won't turn a bleeding man away for want of silver, but I've a roof to keep, so I send the bill to the barracks and hope." } },
      choices = {
        { text = "Healing shouldn't wait on coin. You're right.", next = "BACK", reply = "I'm glad you think so, though the barracks would prefer you didn't say it too loudly. A bleeding man doesn't carry a purse anyway.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Your work has value. Make them pay first.", next = "BACK", reply = "I'd love to, but you try asking a man with an arrow in his leg for silver first. The bill goes to the barracks and I keep hoping.", fx = { align = { light = -1 } } },
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
      lines = { { id = "bh_default", text = "It'll help him feel brave, which is most of what any elixir does. The rest is earthroot and patience, and I've plenty of both." } },
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
    camping = { { id = "tp_camping", text = "Sam Sarsaparilla's campfires are fine for sausages, but for anything finer, you want a steady flame and a good deal of patience." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, and I can't stop stirring to find out." } },
    scourge = { { id = "tp_scourge", text = "The plague that took Lordaeron was brewed, friend, not caught, and that frightens me more than any wolf. Somebody with training like mine did that, and I think of it every time I light the burner." } },
    dalaran = { { id = "tp_dalaran", text = "The alchemists of Dalaran had the finest stills in the world, and I've heard they're only now rebuilding them. I'd like to see one before I die, preferably not because of one." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire sells little vials of fizzing water and calls them elixirs, and every year somebody brings me one to ask what's in it. Water, mostly, and enough sugar to rot a horse's teeth." } },
    argent_dawn = { { id = "tp_argent_dawn", text = "The Argent Dawn buys healing potions by the cartload for the north, and I've sent them what I can spare. It's the one order I never haggle over." } },
  },
}

-- Herbalist Pomeroy: herbalism trainer, beside Mallory in the same house.
P:NPC {
  key = "pomeroy", id = TODO_NPC("Herbalist Pomeroy"), name = "Herbalist Pomeroy", title = "Herbalism Trainer",
  bible = "bibles/herb_house.md", role = "trainer", tier = "service",
  communities = {}, temper = { "warm" }, values = { "nature", "patient" },
  notices = { "craft", "class", "lock_taint" },
  impression = {
    first = "She speaks of Elwynn's hillsides as if each one were a friend.",
    third = "{name} met Herbalist Pomeroy, who teaches herbalism beside Alchemist Mallory east of Stormwind's gates.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, my student. You've the makings of something rare, and I mean that." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Speak your business. My patience with you is shorter than my lessons." },
    { id = "g_default", text = "Wipe your boots, dear, or don't; the herbs won't mind the mud." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Have you brought me any earthroot, or only questions?" },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You've a gatherer's hands, I can tell; there's green under every nail. Good, because it's the only honest way to learn." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! You'll know some of what I teach already and argue with the rest, I expect. Your people talk to the plants, I'm told, and I've only ever talked at them." },
    { id = "n_lock_taint", cat = "lock_taint", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "The mint on my counter has wilted since you came in, and you've a green sheen on your skin like Duskwood moss. Whatever you've been handling, it's soaked into you deeper than any herb I'd sell." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd say they do, and kindly ones. Every herb grows where it's happy and sulks where it isn't, and my mint sulks worse than my husband." } },
      choices = {
        { text = "Skill should be earned honestly, through hard work.", next = "BACK", reply = "That's the only kind that lasts, in my experience.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Any trick that wins the fight is a good trick.", next = "BACK", reply = "It'll win you a fight or two, but it won't make you a master.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "The hills deserve gentle hands, Pomeroy. You have them.", next = "BACK", reply = "That's sweet of you to say, and the mint will be pleased to hear it too. Come by in spring and I'll show you the beds.", fx = { align = { light = 1 } } },
        { text = "Herbs are herbs. Gather them and move on.", next = "BACK", reply = "That's the way of it for most folk, and why the hills keep getting barer. I'll keep humming, and you keep moving.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They do, and they're picky about it, which I like in a customer. One of them asked me for something that grows only on graves, and I told him I don't gather in Duskwood and never will, and he went off looking disappointed." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They do, and they're picky about it, which I like in a customer, though they usually leave their company outside. Your {pet} keeps leaning over my peacebloom, and two pots have wilted already, so I'd be grateful if it waited by the door." },
      },
      choices = {
        { text = "You're right not to gather there, Pomeroy.", next = "BACK", reply = "I'm glad you agree, because I've no wish to be digging among the dead. The living grow plenty to keep me busy.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Grave herbs have their uses. You're missing out.", next = "BACK", reply = "Maybe I am, but I'll sleep better for it. Let that lot dig in Duskwood themselves if they need it that badly.", fx = { align = { light = -1 } } },
        { text = "Something else, Pomeroy.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Earthroot, chewed, for a bruise that won't settle, and bark of the silver birch for a sore head. Mallory will tell you a potion's better, and he's right, but a root in your pocket costs nothing." } },
      choices = {
        { text = "I'll carry the root. Every little help counts.", next = "BACK", reply = "It does, and it's a lot cheaper than a trip to the Abbey. Chew it slowly, mind, because it tastes like a cellar.", fx = { align = { order = 1 } } },
        { text = "I'll leave the roots to farmers.", next = "BACK", reply = "Suit yourself, though the farmers walk home on their own two feet more often than the warriors do. Mallory's potions will do you, I suppose.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Peacebloom, along the roads, and silverleaf in the shade by the river. You'll find them where the deer have grazed and left the rest, and if your beast stops to sniff, it's usually found something." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Peacebloom along the roads, and silverleaf in the shade by the river. Your {pet} has its nose to the ground already, and half my best patches were found by somebody's dog." },
      },
      choices = {
        { text = "I'll gather as I go and leave the patches whole.", next = "BACK", reply = "Bless you for that, because the patches are thinning as it is. Your beast will make a fine herbalist with a bit of practice.", fx = { align = { honor = 1 } } },
        { text = "I'll take all I find. Another hunter would.", next = "BACK", reply = "Another hunter might, and the hills are the poorer for it. Leave a little, please, or there'll be nothing for anybody next year.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Peacebloom and silverleaf and earthroot, which mend more than they harm, and that's all I'll put in the ground. The Defias pay well for nastier things, I'm told, but they'll have to dig them up somewhere else." } },
      choices = {
        { text = "Better you brew for mending than for poison. I respect that.", next = "BACK", reply = "Thank you, it's good to hear that from someone in your line. I'd sooner keep my conscience than fill my purse.", fx = { align = { light = 1 } } },
        { text = "Poison pays better, Pomeroy. You're leaving coin in the ground.", next = "BACK", reply = "It might, but I'd have to sleep next to it, and I sleep badly enough as it is. Let the Defias pay someone else.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the best ones go to Mallory for the gate guards' draughts, and a guard on his feet does more good than a spell on a page. You can have the second best, and they'll still write better than anything you'd buy in Stormwind." } },
      choices = {
        { text = "The guards come first. The second best will do me fine.", next = "BACK", reply = "That's a generous view from a mage, and I'll pick you the best of the second best. The guards will be grateful, even if they never know it.", fx = { align = { order = 1 } } },
        { text = "My research matters more than a guard's sore feet.", next = "BACK", reply = "Then I hope your research keeps the gate shut when the wolves come. Second best is still what you're getting, friend.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not the same way, but they go in the same direction, and I've never seen them quarrel. Whether you pray to the Light or the moon, a bit of peacebloom on a wound won't argue with you about it." } },
      choices = {
        { text = "All healing serves the same good. Both are gifts.", next = "BACK", reply = "That's how I've always seen it, though the Brothers don't always agree. Bless you for saying it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Herbs are for those without true faith, Pomeroy.", next = "BACK", reply = "There's many a faithful man been glad of a poultice, I can tell you. I'll not argue with your faith, but I'll keep picking.", fx = { align = { light = -1 } } },
        { text = "Something else, Pomeroy.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The gate guards, mostly, and the farmers who can't afford the Abbey's healers. Mallory brews and I gather, and between us we keep a lot of people on their feet who'd otherwise be on their backs." } },
      choices = {
        { text = "That's service, Pomeroy, as true as any oath.", next = "BACK", reply = "That's a kind thing to say, and I'll tell Mallory you said it. He'll pretend not to be pleased.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They should pay the Abbey. Healing isn't free.", next = "BACK", reply = "They should, and the Abbey should take them, but neither's going to happen any time soon, so Mallory and I make do.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I've peacebloom and silverleaf, if you'd like to learn which herbs work alongside your prayers." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll not have time to learn herbs, I expect, with all your duties, but if you see silverleaf by the road, I'd be grateful if you picked it." },
        { id = "h_default", text = "I'm Pomeroy, and I teach herbalism, which is a grand name for knowing where to look and when to pick. Mallory brews and I gather, and between us we keep half the gate guards on their feet." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Herbalism") },
          text = "Sam Sarsaparilla's sent you, has he? He wants every camp to have someone who can tell a healing leaf from a bellyache, and he's right about that, bless him." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "One of the kaldorei! I've heard your forests grow herbs I've never seen, and I'll confess I'm a little jealous of you for it." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "A hunter. You walk the woods anyway, so you might as well learn what you're stepping on, and I'll wager half of it's useful." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in an herb house. You'll be after something for your blades, I'd wager, and I'll tell you now I don't grow that sort of thing." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. You'll be wanting herbs for your inks, I suppose, and I can spare a few, though not the best ones." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior in the herb house. Stand still, now, because you've knocked my drying rack twice already." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Ink on your fingers and sulphur on your cloak! I've heard some folk pick certain herbs by moonlight, and I'd love to know which ones, if you're willing to tell." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! The hillsides here are friends of mine, so I wonder if your earth spirits know them too." },
      },
      again = {
        { id = "h_again", text = "What else, dear? I've roots drying and nowhere to be." },
        { id = "h_again2", text = "Ask whatever you like, dear; the roots on the rack won't mind waiting." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "What grows in Elwynn?", next = "herbs" },
        { text = "You and Mallory seem to get on well.", next = "mallory" },
        { text = "Gathering must be dangerous these days.", next = "danger" },
        { text = "Sam Sarsaparilla sent me about a camp.", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Herbalism") } },
        { text = "What do you grow, if not something for blades?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why won't you spare the best herbs for a mage?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do any of your herbs help a warrior?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should a hunter learn to look for underfoot?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do herbs and prayer heal the same way, Pomeroy?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who in Elwynn needs your herbs most, Pomeroy?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'd guess some of your customers want stranger herbs, Pomeroy.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The hills here seem to have spirits of their own, Pomeroy.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "His potions can't smell that bad.", next = "mallory_smell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mallory_smell = {
      lines = { { id = "ms_default", text = "Worse, some days. But I've seen him sit up all night with a guard's wound, and I'll forgive a man a good deal of smell for that." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    danger = {
      big = true,
      lines = { { id = "d_default", text = "Wolves in the woods and kobolds near the mines, and lately the Defias, who don't like folk wandering near their camps. I've started taking the long way round, which means fewer herbs and longer days." } },
      choices = {
        { text = "The Guard should clear the woods for honest folk.", next = "BACK", reply = "They should, and I'd be first to thank them. Until then I'll keep to the long way round.", fx = { align = { order = 1 } } },
        { text = "Carry a knife and pick where you please.", next = "BACK", reply = "A knife won't stop a Defias arrow, friend, and I'm a herbalist, not a soldier. I'll take my long way and my sore feet.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "Then pick what you can by the roadside, and learn which leaves keep and which spoil by morning. A camp herbalist earns her keep before a camp cook does, though don't tell Tomas, the cook at the Lion's Pride, I said so, because he already salts the stew out of spite." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I grew up picking herbs for my grandmother's remedies, and I never saw a reason to stop." } },
    advice = { { id = "tp_ad", text = "Take the leaves and leave the root, dear, and the plant will be there for you next spring." } },
    camping = { { id = "tp_camping", text = "A campfire's a fine thing, but it's nothing without a few good leaves to put in the pot." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, dear. If it doesn't grow, I don't know much about it." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's fortune teller buys my dried lavender for her tent, dear, and says it brings the spirits closer. I think it just makes the tent smell nicer, and that's enough for me." } },
    holy_light = { { id = "tp_holy_light", text = "My grandmother said the Light grows in every green thing, and I've never found a reason to doubt her. You can feel it on a spring morning if you kneel in the mint." } },
    scourge = { { id = "tp_scourge", text = "I've heard the very earth goes sick where the plague has walked, dear, and nothing will grow there but blight. I can't think of anything sadder for an herbalist to hear." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "There are druids, dear, the Cenarion Circle, who look after whole forests the way I look after my garden. I'd love to sit down with one of them and talk about roots." } },
  },
}
