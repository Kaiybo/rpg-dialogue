-- Out in the Badlands: the dwarves' dig and a gnome's camp in the Dustbowl. Voice: bibles/badlands.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ryedol", id = TODO_NPC("Prospector Ryedol"), name = "Prospector Ryedol",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "explorers_league" }, temper = { "weary" }, values = { "loyal", "curious" },
  notices = { "race" },

  greetings = {
    { id = "g_hill", text = "Easy, easy! Ye're no' a troll or an ogre or a Dark Iron? Good, that's three things off my list." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' our own, out in this wasteland! Sit a moment, for I've not heard an Ironforge voice in weeks." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Prospector Ryedol, Explorers' League. We came out here tae dig for the past, an' the past dug back; my partner, Hammertoe, went into the digsite an' didn't come out." },
        { id = "h_tools", tags = { "news" }, when = { questActive = TODO_QUEST("A Dwarf and His Tools") },
          text = "I left my pack behind when we ran, an' every tool I own's in it. A prospector without his tools is just a dwarf standin' in the dirt." },
        { id = "h_hope", when = { any = { { questActive = TODO_QUEST("A Sign of Hope") }, { questActive = TODO_QUEST("Prospect of Faith") } } },
          text = "These are Hammertoe's notes; he found somethin' before the end, an' he thought it was Uldaman. Take them tae Ironforge, where somebody will know what they mean." },
      },
      again = { { id = "h_again", text = "Aye? I'm listenin', for there's not much else tae do out here but listen an' dig." } },
      choices = {
        { text = "What's Uldaman?", next = "uldaman" },
        { text = "Tell me about Hammertoe.", next = "hammertoe" },
        { text = "What chased you out of the dig?", next = "chased" },
        { text = "I'm with the League too.", next = "league", when = { origin = "dwarf_explorers_league" } },
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
      choices = { { text = "Something else.", next = "BACK" } },
    },
    league = {
      lines = { { id = "l_default", text = "Are ye now! Then ye know we don't leave our own in the dirt. When ye go in, bring back somethin' o' his, anythin' at all, a pick or a page." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 3, align = { honor = 1 } } } },
    },
  },

  topics = {
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
    hello = {
      lines = {
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
        { text = "What's the Assembly?", next = "assembly" },
        { text = "Who's Lucien?", next = "lucien" },
        { text = "Why rock?", next = "rock" },
        { text = "Engineer to engineer: what are you building?", next = "engineer", when = { profession = "Engineering" } },
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
  },

  topics = {
    background = { { id = "tp_ba", text = "A scholar with too many subjects and one very patient assistant. The Assembly is the rest of my life's work, once it exists.", next = "assembly" } },
    advice = { { id = "tp_ad", text = "Never assume a rock is just a rock. Out here, about one in fifty is an elemental having a nap." } },
    _none = { { id = "tp_none", text = "Fascinating! I know nothing about it, so tell me everything." } },
  },
}
