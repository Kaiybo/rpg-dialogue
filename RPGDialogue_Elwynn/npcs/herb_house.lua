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
    hello = {
      lines = {
        { id = "h_default", text = "Mallory, alchemist, and I'd offer you my hand if it weren't busy keeping this from boiling over. If you've come to learn the craft, you've found the right house; Pomeroy over there teaches you to gather, and I teach you what to do after." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Alchemy") },
          text = "Sam Sarsaparilla sent you up from the road, did he? He does like his campfires. Well, a camp is no use if nobody in it can mix a remedy, so let's see what you can do." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priest! Your prayers do quicker work than my potions, I'll grant, but a potion doesn't run dry when you're tired, so I like to think we're partners." },
        { id = "h_troll", when = { race = "Troll" }, text = "A troll, of all things, at my door! Your people's witch doctors know a great deal about herbs that I'd dearly love to learn, though I doubt they'd teach a human." },
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
    hello = {
      lines = {
        { id = "h_default", text = "Pomeroy, and I teach herbalism, which is a grand name for knowing where to look and when to pick. Mallory brews and I gather, and between us we keep half the gate guards on their feet." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Herbalism") },
          text = "Sam's sent you, has he? He wants every camp to have someone who can tell a healing leaf from a bellyache, and he's right about that, bless him." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "One of the kaldorei! I've heard your forests grow herbs I've never seen, and I'll confess I'm a little jealous of you for it." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "A hunter. You walk the woods anyway, so you might as well learn what you're stepping on, and I'll wager half of it's useful." },
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
