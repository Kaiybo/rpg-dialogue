-- The Tower of Azora's upper floors: Dawn Brightstar's arcane goods and Kitta Firewind,
-- who teaches enchanting. Voice: bibles/azora.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC = P.TODO_NPC

-- Dawn Brightstar: arcane goods on the tower's top floor.
P:NPC {
  key = "dawn", id = TODO_NPC("Dawn Brightstar"), name = "Dawn Brightstar", title = "Arcane Goods",
  bible = "bibles/azora.md", role = "vendor", tier = "service",
  communities = {}, temper = { "brisk" }, values = { "order", "curious" },
  notices = { "class" },
  impression = {
    first = "Dawn Brightstar sells vials and scrolls at the top of the Tower of Azora and keeps her shelves as tidy as a temple. She speaks of Theocritus with a mixture of respect and exasperation.",
    third = "{name} met Dawn Brightstar, who sells arcane goods at the top of the Tower of Azora.",
  },
  greetings = {
    { id = "g_default", text = "Vials and scrolls, all labelled. Please don't touch anything that's humming." },
    { id = "g_back", when = { metBefore = true }, text = "Back up all those stairs again? You must want something rather badly." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! You'll forgive me for watching your hands, since the last student who visited set a scroll alight just by reading it too eagerly." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Hm, there's a smell of brimstone about you. Master Theocritus has strong feelings about that sort of magic, so I'd keep it quiet on this floor." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Scrolls, mostly: a little strength or stamina, written into the page and spent in one breath. They're for the moment a gnoll has you pinned, not for showing off at the inn." } },
      choices = {
        { text = "I'll keep one for the hard moment and fight honestly until then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll read every one I can afford before a fight.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Scrolls of agility, mostly, and the odd flask for a long night in the hills. Hunters who come up here usually want something for the eye and the hand, and they never stay long enough to sit." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is sniffing at the reagent shelf, and I'd rather it didn't. Some of those powders make a nose very unhappy." },
      },
      choices = {
        { text = "A steady hand matters more than any scroll, I think.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Any edge in a hunt is worth buying, scroll or not.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because Morganth was a sorcerer of your sort once, and he's camped across the river in Redridge wanting this tower for his own. My master looks at every warlock and sees Morganth, which isn't fair to you, though I can't say it's unwise of him." } },
      choices = {
        { text = "He's right to be careful. I'd never bargain the way Morganth did.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Morganth's only crime was losing. Power goes to those who take it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not where Master Theocritus can hear, though I keep a little shelf of prayer books he pretends not to see. The gnomes say a word over their soup some nights, and I've caught myself listening, which surprised me more than it would you." } },
      choices = {
        { text = "Faith and learning belong under the same roof, Dawn.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayer won't keep a tower standing. Wards will.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Dawn.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More than Master Theocritus would ever admit, because Morganth's gnolls have been creeping about Redridge, and books don't stop spears. He calls your order 'the hammer school', but he says it the way you'd speak of weather you can't argue with." } },
      choices = {
        { text = "I'll stand between his books and those gnolls gladly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "His wards can stand without me. I'm nobody's doorman.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, up all those stairs in plate! Sit down a moment, because Theocritus won't offer you a chair, and I won't tell him I did." },
        { id = "h_default", text = "Dawn Brightstar. I keep the tower's stores and sell what we can spare to whoever climbs this far, which is mostly alchemists after empty vials and travellers after a scroll to see them home." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "Oh, a gnome who isn't carrying a tray! Forgive me; the tower's servants are your people, and I forget there are gnomes who aren't sweeping our stairs." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priest, up here among the scrolls? We don't get many of the Cathedral's people, though Master Theocritus would say the Light and the arcane are cousins who don't speak." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You've the smell of a cellar about you, and I don't mean the inn's ale. Theocritus won't want you near his books, so let's keep our business to the counter." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, all the way up our stairs in all that steel! Sit a moment, because Theocritus keeps the windows shut and the climb is warmer than it looks." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter in the tower! Mind the gnomes on the stairs, please, because they startle, and your beast startles them." },
      },
      again = {
        { id = "h_again", text = "What else can I help you with? I've a delivery list to finish." },
        { id = "h_again2", text = "Ask, please. It's very quiet up here most days." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "What's it like working for Theocritus?", next = "theo" },
        { text = "Who are the gnomes in the tower?", next = "gnomes" },
        { text = "What sells best?", next = "sales" },
        { text = "I'm a mage. What would you recommend?", next = "mage", when = { class = "MAGE" } },
        { text = "Why would Theocritus mind a warlock in his tower?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Is there anything in a mage's tower for a warrior?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What do hunters buy from a tower like this?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does anyone in this tower ever pray, Dawn?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does a mage's tower want with a paladin, Dawn?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Good day, Dawn.", next = "END" },
      },
    },
    theo = {
      lines = { { id = "t_default", text = "Quiet, until it isn't. He spends whole days at the top of the tower without speaking, and then he wants six things fetched from Stormwind by supper because he's thought of a new way to watch Morganth." } },
      choices = {
        { text = "Who is Morganth?", next = "theo_morganth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theo_morganth = {
      big = true,
      lines = { { id = "tm_default", fx = { learn = { "morganth" } }, text = "A mage who studied in Stormwind and was cast out for meddling with shadow. He sits in a tower in Redridge now, commanding gnolls, and Master Theocritus has made watching him his life's work." } },
      choices = {
        { text = "Watching isn't enough. Someone should end him.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Patience is wiser than charging into a mage's tower.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes = {
      lines = { { id = "gn_default", text = "The Servants of Azora, he calls them. They came to him after their city fell, and they cook, clean and carry in exchange for a roof and a quiet place to tinker, and I'd be lost without them." } },
      choices = {
        { text = "Are they happy here?", next = "gnomes_happy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes_happy = {
      lines = { { id = "gh_default", text = "They seem it, though they grumble about the stairs in their own tongue when they think I don't understand. I've learned enough of it to know they're not wrong." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },
    sales = {
      lines = { { id = "s_default", text = "Empty vials, by far. Every alchemist between here and Goldshire runs out of glass sooner than herbs, and Alchemist Mallory by the city gates sends for a crate nearly every month." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "m_default", text = "Buy scrolls you understand before scrolls you admire, and carry a spare vial for water you can trust. Kitta downstairs will tell you the same, though she'll take longer about it." } },
      choices = {
        { text = "Practical advice. Thank you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept accounts for a scribe in the Mage Quarter until Master Theocritus needed someone who could count and climb stairs." } },
    advice = { { id = "tp_ad", text = "Label everything, friend. An unlabelled vial is how apprentices end up with purple hair." } },
    morganth = { { id = "tp_morganth", text = "I've never seen him and I hope I never shall. Master Theocritus speaks of him the way sailors speak of storms.", next = "theo_morganth" } },
    _none = { { id = "tp_none", text = "That isn't in any of my ledgers, I'm afraid, so I couldn't tell you." } },
  },
}

-- Kitta Firewind: enchanting trainer on the tower's upper floor.
P:NPC {
  key = "kitta", id = TODO_NPC("Kitta Firewind"), name = "Kitta Firewind", title = "Enchanting Trainer",
  bible = "bibles/azora.md", role = "trainer", tier = "service",
  communities = {}, temper = { "eager" }, values = { "craft", "curious" },
  notices = { "class" },
  impression = {
    first = "Kitta Firewind teaches enchanting in the Tower of Azora and talks about it faster than I could follow. Whatever the city's mages think of her craft, she plainly loves it.",
    third = "{name} met Kitta Firewind, who teaches enchanting in the Tower of Azora.",
  },
  greetings = {
    { id = "g_default", text = "Oh, a visitor! What brings you all the way up the tower?" },
    { id = "g_back", when = { metBefore = true }, text = "You came back, and I can tell you've been practising, haven't you?" },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You're a mage, so you already feel the magic in things, don't you? Enchanting is only teaching it to stay where you put it, which is harder than it sounds." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Truly, with the right dust and a steady hand! Though I'll tell you what I tell every warrior: an enchantment can't swing the blade for you, and the gnolls won't wait while you admire the glow." } },
      choices = {
        { text = "Then I'll train the arm first and enchant the blade after.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take every glow I can buy, and let the arm catch up.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kitta.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Oh, all sorts, a sharper eye or a steadier string, though Theocritus says I'm too eager to try things on other people's weapons. Bring me one someday and we'll find out together." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet}! I wonder whether a collar could take an enchantment, though I suspect it would rather you didn't try." },
      },
      choices = {
        { text = "I'll trust my own aim before any enchantment.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it makes the shot surer, enchant whatever you like.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Every mage should at least try, because a spell lasts a moment but an enchantment lasts as long as the blade does. Theocritus says it's a craft for people who can't hold their concentration, which I think is exactly why he's never managed it." } },
      choices = {
        { text = "A disciplined mage should master the patient crafts too.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Spells are for living in the moment. Leave the runes to crafters.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It doesn't ruin the craft, but it changes it, and what it changes it into isn't anything the Kirin Tor would put their name to. I've seen a sword enchanted with something from your side of the line, and it hummed at night like it was hungry." } },
      choices = {
        { text = "Then I'll keep the fel well away from your bench.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A hungry blade sounds like a better blade to me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I've tried, honestly I have, and the dust goes dull every time, as though it knows it's being asked for something it can't give. Whatever you pray to, the Light or Elune, it seems to want to be asked by a person and not a rune, which I find rather lovely when I'm not finding it maddening." } },
      choices = {
        { text = "Some things should only come from the heart, not the dust.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then nobody understands blessings yet. Keep trying, Kitta.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Kitta.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "In a heartbeat, though I'd want you to tell me what it's for first, because a rune for smiting and a rune for showing off look very much alike to the dust. A noble's son once asked me for a glowing sword to wear to a wedding, and I said no, which is the proudest thing I've done all year." } },
      choices = {
        { text = "It would be for the wicked only. You have my word.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A glowing hammer cows a crowd. That's worth something too.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Have you ever wondered whether a blessing and an enchantment are really so different? I have, constantly, and nobody up here will discuss it with me." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I'd give a week's dust to enchant a hammer like yours, though I suspect it's already got something in it that I couldn't improve." },
        { id = "h_default", text = "Kitta Firewind, and I teach enchanting, which is the finest craft there is, whatever the blacksmiths say. If you've come to learn, you've climbed to exactly the right floor." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "A night elf! Your people never did care for our sort of magic, did they? I'd love to know what you think of it, honestly, even if you think it's dreadful." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior! You'll want your sword to cut a little deeper, I expect, and that's where an enchanter comes in, so you'll be glad you climbed the stairs." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and a young one! Enchanting comes easiest to your sort, because you already know what a rune wants before you've drawn it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I'd ask that you keep your imp away from my dust, because a spark in the wrong pouch costs me a week of work." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've always wanted to try enchanting a bow, and nobody ever brings me one, so you're very welcome." },
      },
      again = {
        { id = "h_again", text = "What else? I could talk about this all afternoon, and I usually do." },
        { id = "h_again2", text = "Go on, ask me anything. Well, anything about enchanting." },
      },
      choices = {
        { text = "Teach me enchanting.", next = "BUSINESS" },
        { text = "How does enchanting actually work?", next = "how" },
        { text = "Why teach in this tower?", next = "tower" },
        { text = "Where do I get the materials?", next = "dust" },
        { text = "Isn't the arcane dangerous to toy with?", next = "danger" },
        { text = "Should every mage learn enchanting, then?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is fel magic truly so dangerous to enchanting?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Could an enchantment truly make my sword cut deeper?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What would an enchanter do to a hunter's bow?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Could an enchanter's rune ever hold a blessing, Kitta?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you enchant a paladin's hammer, Kitta?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'll come back another time.", next = "END" },
      },
    },
    how = {
      lines = { { id = "h2_default", text = "You take something that already holds a little magic, like a charmed ring or a staff, and you unmake it into dust. Then you bind that dust to something else with a runed rod, and if you've done it right, the magic stays." } },
      choices = {
        { text = "So you destroy one thing to improve another?", next = "how_destroy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_destroy = {
      lines = { { id = "hd_default", text = "I prefer to say we free the magic from something nobody wanted. That ugly green ring you pulled off a kobold has a far better life as an enchantment on your boots." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    tower = {
      lines = { { id = "t_default", text = "Because Master Theocritus lets me, and because it's quiet, and because the city's mages look down their noses at a craft that makes boots better. Up here nobody laughs at me for it." } },
      choices = {
        { text = "Do the city's mages really look down on it?", next = "tower_city" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tower_city = {
      lines = { { id = "tc_default", text = "Some of them do, the ones who think magic should only be for great works. I think a farmer's knife that never dulls is a great work, if you're the farmer." } },
      choices = {
        { text = "Magic should serve ordinary people.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Some magic should stay with the trained few.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dust = {
      lines = { { id = "d_default", text = "From anything with a green or blue shimmer to it that you don't mean to keep. Bring me a few and I'll show you how to unmake them, and Dawn upstairs sells the vials and odds and ends you'll want later." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "da_default", text = "Only when people are careless or greedy, and enchanters can't afford to be either. The ones who reach too far end up like that Morganth in Redridge, and Master Theocritus spends his days watching him for that very reason." } },
      choices = {
        { text = "What did Morganth do?", next = "danger_morganth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_morganth = {
      lines = { { id = "dm_default", fx = { learn = { "morganth" } }, text = "He studied shadow magic he'd been told to leave alone, and Stormwind cast him out for it. Now he's in an old tower in Redridge with gnolls doing his bidding, which is what happens when a mage stops listening to anyone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was apprenticed in Stormwind, but I spent more time unmaking my master's spare rings than learning his spells, so we agreed I'd be happier here." } },
    advice = { { id = "tp_ad", text = "Never unmake anything you might want back. I learned that one with my grandmother's brooch." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that. Ask me about runes instead!" } },
  },
}
