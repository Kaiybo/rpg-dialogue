-- Out in the Badlands: the dwarves' dig and a gnome's camp in the Dustbowl. Voice: bibles/badlands.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ryedol", id = TODO_NPC("Prospector Ryedol"), name = "Prospector Ryedol",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "explorers_league" }, temper = { "weary" }, values = { "loyal", "curious" },
  notices = { "race" },

  impression = {
    first = "Prospector Ryedol checked that I wasn't a troll, an ogre or a Dark Iron before anything else. He is worn through with worry for his partner Hammertoe and tries hard not to show it.",
    third = "{name} met Prospector Ryedol of the Explorers' League, whose partner Hammertoe went into the Badlands digsite and never came out.",
  },

  greetings = {
    { id = "g_hill", text = "Easy, easy! Ye're no' a troll or an ogre or a Dark Iron? Good, that's three things off my list." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' our own, out in this wasteland! Sit a moment, for I've not heard an Ironforge voice in weeks." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "No' always, if the old ruins are anythin' tae go by, for nobody builds that grand in a desert. Somethin' dried it out long ago, an' the stones are the only ones left who remember what." } },
      choices = {
        { text = "Then dig it up and learn, Prospector.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let the land keep its own secrets.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Maybe, if ye're quiet an' patient, for the troggs are stupid but they're no' deaf. Hammertoe went in loud, singin', I shouldnae wonder, an' I'd give a lot for him tae have had yer sense." } },
      choices = {
        { text = "Anything of Hammertoe's comes back to you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Finders keepers, Prospector. Whatever's down there is mine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Never mind that for now.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Discs an' keepers an' a vault o' stone older than Ironforge, an' I cannae make sense o' half of it. The Explorers' League would give their beards for a mage who could, an' maybe they'll get one, if ye're willin'." } },
      choices = {
        { text = "Some old vaults should stay sealed, Prospector.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Whatever's sealed in Uldaman, I want to see it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's leave Uldaman for now.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! If ye can make heads or tails o' Hammertoe's scribbles before ye take 'em tae Ironforge, I'd be glad tae hear it, for they read like a fever dream tae me." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue, aye? Then ye'll be lighter on yer feet than Hammertoe ever was, an' that might be what it takes tae get in an' out o' that dig alive." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, out here in the Badlands? There's nae a green thing for miles, friend, unless ye count the lichen on Hammertoe's old pack, an' I'd not count it." },
        { id = "h_default", key = true,
          text = "Prospector Ryedol, Explorers' League. We came out here tae dig for the past, an' the past dug back; my partner, Hammertoe, went into the digsite an' didn't come out." },
        { id = "h_tools", tags = { "news" }, when = { questActive = TODO_QUEST("A Dwarf and His Tools") },
          text = "I left my pack behind when we ran, an' every tool I own's in it. A prospector without his tools is just a dwarf standin' in the dirt." },
        { id = "h_hope", when = { any = { { questActive = TODO_QUEST("A Sign of Hope") }, { questActive = TODO_QUEST("Prospect of Faith") } } },
          text = "These are Hammertoe's notes; he found somethin' before the end, an' he thought it was Uldaman. Take them tae Ironforge, where somebody will know what they mean." },
      },
      again = { { id = "h_again", text = "Aye? I'm listenin', for there's not much else tae do out here but listen an' dig." } },
      choices = {
        { text = "Was this land always so barren, Prospector?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's Uldaman?", next = "uldaman" },
        { text = "Tell me about Hammertoe.", next = "hammertoe" },
        { text = "What chased you out of the dig?", next = "chased" },
        { text = "I'm with the League too.", next = "league", when = { origin = "dwarf_explorers_league" } },
        { text = "I'll go in after Hammertoe. I'm a fighter.", next = "k_fighter", when = { class = { "WARRIOR", "PALADIN", "HUNTER" } } },
        { text = "Could I slip into the dig unseen?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What did Hammertoe write that troubles you?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'll help.", next = "END", fx = { affinity = 2 } },
      },
    },
    uldaman = {
      lines = {
        { id = "u_default", text = "Old, older than Ironforge, a vault the titans may have built, if ye believe the scholars. Hammertoe believed, an' look where it got him." },
      },
      choices = {
        { text = "I'm sorry about your partner.", next = "BACK", fx = { affinity = 3, learn = { "uldaman" } } },
        { text = "Is it worth it?", next = "uldaman_worth" },
      },
    },
    uldaman_worth = {
      lines = { { id = "uw_default", text = "Ask me when I've buried him properly. Then ask me again a year after. I'll have two different answers an' mean both." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } } },
    },
    hammertoe = {
      lines = { { id = "h2_default", text = "Best digger I ever knew, an' the worst cook. He'd talk tae the rock like it was listenin', an' some days I think it was." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    chased = {
      lines = { { id = "c_default", text = "Troggs, out o' the deep places, more than we'd ever seen, an' things made o' stone that shouldnae move. We ran, but Hammertoe didnae run fast enough." } },
      choices = {
        { text = "You blame yourself for it, don't you?", tag = "Persuade", next = "chased_blame",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { origin = "dwarf_explorers_league" } } } },
          fail = { next = "chased_dig", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    league = {
      lines = { { id = "l_default", text = "Are ye now! Then ye know we don't leave our own in the dirt. When ye go in, bring back somethin' o' his, anythin' at all, a pick or a page." } },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "If it's that dangerous, I'll leave the dead where they lie.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    chased_blame = {
      lines = {
        { id = "cb_default", text = "Aye, I do, an' I've no' said it aloud till now. I never looked back, no' once, all the way out o' that digsite, an' I've told maself a hundred times there was nothin' tae see, but a dwarf who doesnae look back can tell himself anythin'." },
      },
      choices = {
        { text = "Looking back would have killed you too.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then bring something of his home.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    chased_dig = {
      lines = {
        { id = "cd_default", text = "What I do or don't blame maself for is between me an' Hammertoe. Now, are ye here tae dig or tae preach?" },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_fighter = {
      lines = {
        { id = "xfi_default", text = "Then go in wi' yer eyes open, for there's Dark Iron an' troggs both in that dig, an' they've decided they like it better than we did. Hammertoe went in wi' a pick an' a lantern, an' I'd sooner ye went in wi' more." },
        { id = "xfi_hunter", when = { class = "HUNTER" },
          text = "Then take yer beast an' let it go first, for it'll smell the troggs before ye see them. Hammertoe went in wi' a pick an' a lantern, an' look what that got him." },
      },
      choices = {
        { text = "I'll bring him out, or what's left.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Why didn't you go in after him?", next = "chased" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've spent a good while diggin' out here, an' a dwarf learns a thing or two between shovelfuls. Ask me about any o' these." },
    },
    background = { { id = "tp_ba", text = "Ironforge born, Explorers' League sworn, an' now a dwarf in the Badlands without his partner.", next = "hammertoe" } },
    advice = { { id = "tp_ad", text = "Mark yer way in, so ye can find yer way out. Hammertoe never did." } },
    uldaman = { { id = "tp_uldaman", text = "If the League's right, the answer tae where we dwarves came from is under these hills, an' that's worth a few bruises. Maybe it's no' worth Hammertoe." } },
    _none = { { id = "tp_none", text = "Couldnae say; I'm a digger, no' a sage." } },
  },
}

P:NPC {
  key = "lotwil", id = TODO_NPC("Lotwil Veriatus"), name = "Lotwil Veriatus",
  bible = "bibles/badlands.md", role = "scholar", tier = "quest",
  communities = { "badlands_camp" }, temper = { "distracted" }, values = { "curious", "inventive" },
  notices = { "race", "class" },

  impression = {
    first = "Lotwil Veriatus warned me off anything glowing, humming or warm, which ruled out most of his camp. He is delighted by rock elementals in a way I'll never fully understand.",
    third = "{name} met Lotwil Veriatus, an absent-minded gnomish scholar who studies the elements in the Dustbowl.",
  },

  greetings = {
    { id = "g_camp", text = "Hm? Oh, a visitor! Mind Servo, he's harmless, mostly, and don't touch anything glowing, or humming, or warm." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome, out here in all this rock! We should compare notes, if you have notes; I have a great many notes." },
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } },
      text = "Oh, the Horde, wonderful! Knowledge has no banner, you know, or it shouldn't, so come in, come in." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! You talk to the elements and I take them apart, so we should be friends." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Suffer is a strong word for something made of granite, though I'll admit they do get rather cross. Science needs a few cross elementals, I'm afraid, and the Badlands have plenty to spare." } },
      choices = {
        { text = "Bind them without cruelty, or not at all.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A few cross elementals are a fair price for knowledge.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "You'd be amazed, because a bound elemental core sells for a fortune in Gadgetzan, and Lucien caught a goblin sniffing round the sample tray just last week. I've started labelling everything 'explosive', which is only partly true." } },
      choices = {
        { text = "Guard them well, then. Science deserves protecting.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sell them yourself. Why let the goblins profit?", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk science instead.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Oh! I didn't hear you come in, which is either very impressive or very worrying. You're not after my samples, are you?" },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Splendid, a fellow practitioner of the natural sciences, though you'd call them something prettier, I expect. Tell me, can you feel the elementals in these rocks the way I measure them?" },
        { id = "h_default", key = true,
          text = "Lotwil Veriatus, founding member of the Enlightened Assembly of Arcanology, Alchemy and Engineering Sciences, and that's the short name. I study the elements, rock mostly, since there's a great deal of it here." },
        { id = "h_rock", tags = { "news" }, when = { questActive = TODO_QUEST("Study of the Elements: Rock") },
          text = "Rock elementals! They wander the Dustbowl like they own it, and perhaps they do. Bring me what's left of a few, would you, for science?" },
        { id = "h_hard", when = { questActive = TODO_QUEST("This Is Going to Be Hard") },
          text = "This is going to be hard, and that's not a warning, that's my working title. Lucien thinks it's funny; Lucien's my assistant." },
        { id = "h_machines", when = { questActive = TODO_QUEST("The Rise of the Machines") },
          text = "The Hierophant sent you about golems? Oh, I've wanted to see a Dark Iron golem up close for years, though ideally not too close." },
      },
      again = { { id = "h_again", text = "More? Wonderful, but mind the sample tray." } },
      choices = {
        { text = "Do the elementals suffer under your experiments?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's the Assembly?", next = "assembly" },
        { text = "Who's Lucien?", next = "lucien" },
        { text = "Why rock?", next = "rock" },
        { text = "Engineer to engineer: what are you building?", next = "engineer", when = { profession = "Engineering" } },
        { text = "I study magic too, Lotwil.", next = "k_mage", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "The elements speak to me. You only measure them.", next = "k_shaman", when = { class = "SHAMAN" } },
        { text = "What would a thief want with rock elemental samples?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "For science.", next = "END", fx = { affinity = 2, trait = { curious = 1 } } },
      },
    },
    assembly = {
      big = true,
      lines = {
        { id = "a_default", text = "A school, or the beginning of one! Arcane, alchemy, engineering: it's all one study, really, if you squint, and one day every thinking people in Azeroth could learn side by side, gnomes, dwarves, orcs and trolls. Why not? The rocks don't care who studies them." },
      },
      choices = {
        { text = "That's a big dream.", next = "BACK", fx = { affinity = 3 } },
        { text = "Orcs and gnomes, side by side? Never.", next = "assembly_never", fx = { trait = { skeptical = 1 } } },
        { text = "I've heard great things about the Assembly's members.", tag = "Deceive", next = "assembly_members",
          check = { pass = { any = { { disposition = { min = 55 } }, { trait = "witty" }, { race = "Gnome" } } } },
          fail = { next = "assembly_caught", fx = { affinity = -1 } } },
      },
    },
    assembly_never = {
      lines = { { id = "an_default", text = "Never is just a deadline nobody's met yet! I've seen a dwarf and a goblin share a cart, so anything's possible." } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } } },
    },
    lucien = {
      lines = { { id = "l_default", text = "My assistant, patient, practical, and convinced I'll explode one day. He's not wrong to be convinced; he's just early." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rock = {
      lines = { { id = "r_default", text = "Because it's honest! Fire lies about how hot it is, water won't hold still and air's never where you left it, but rock just sits there being exactly what it is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    engineer = {
      lines = { { id = "e_default", text = "A device to read what an elemental was thinking when it fell apart. It doesn't work yet. When it does, it'll be the most interesting failure I've ever had." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    assembly_members = {
      lines = {
        { id = "am_default", text = "Have you really? How wonderful, and how strange, because between you and me, the Assembly has two members at present, and one of them is Lucien. He says that makes me a founding member of a very small club, and he's not wrong, but every great school started with someone talking to rocks." },
      },
      choices = {
        { text = "Then put my name down as a friend.", next = "BACK", fx = { affinity = 2 } },
        { text = "Two members is still a school.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    assembly_caught = {
      lines = {
        { id = "ac_default", text = "Great things? From whom, I wonder, since the only people who've heard of us are Lucien and Servo. That's very kind of you, but you needn't flatter a gnome to get a straight answer." },
      },
      choices = { { text = "Fair. Something else.", next = "BACK" } },
    },
    k_mage = {
      lines = {
        { id = "xmg_default", text = "Do you! Then you'll appreciate that my method is to bind an elemental in shackles of my own design and examine it, which the Kirin Tor considers terribly reckless. Would you like to see the shackles? They're mostly rock." },
        { id = "xmg_lock", when = { class = "WARLOCK" },
          text = "Do you! Well, binding is binding, whether it's a demon or a lump of animate rock, and I suspect we'd have a great deal to argue about. My shackles are sturdier than any circle you'll draw, I'll wager." },
      },
      choices = {
        { text = "Binding things is how we learn them.", next = "BACK", fx = { align = { order = 1 }, trait = { curious = 1 } } },
        { text = "Binding things is how they get angry.", next = "BACK", fx = { align = { order = -1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_shaman = {
      big = true,
      lines = {
        { id = "xsh_default", text = "Measure them is precisely what I do, and they've never once complained to me. Though you're the third shaman this month to look at my shackles as if I'd chained a puppy, so I'll ask: what does it say?" },
        { id = "xsh_dwarf", when = { race = "Dwarf" },
          text = "A dwarf shaman, at my camp! I'd heard of such a thing and assumed it was a misprint. You look at my shackles as if I'd chained a puppy, so do tell me what it says." },
      },
      choices = {
        { text = "It says let it go.", next = "BACK", fx = { align = { order = -1 }, affinity = -2 } },
        { text = "It's angry, but it will learn its place.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "What happens if it breaks free?", next = "k_shaman_free" },
      },
    },
    k_shaman_free = {
      lines = {
        { id = "xshf_default", text = "Then it goes back to being a rock with opinions, and I go back to my notes with a singed sleeve. I've a theory about why they get loose, which I'll publish when the Assembly reconvenes." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Oh, I know a great many things, and some of them are even about rocks! Ask me about any of these, and mind the sample tray." },
    },
    background = { { id = "tp_ba", text = "A scholar with too many subjects and one very patient assistant. The Assembly is the rest of my life's work, once it exists.", next = "assembly" } },
    advice = { { id = "tp_ad", text = "Never assume a rock is just a rock. Out here, about one in fifty is an elemental having a nap." } },
    _none = { { id = "tp_none", text = "Fascinating! I know nothing about it, so tell me everything." } },
  },
}
