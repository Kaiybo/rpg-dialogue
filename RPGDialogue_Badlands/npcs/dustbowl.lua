-- Out in the Badlands: the dwarves' dig and a gnome's camp in the Dustbowl. Voice: bibles/badlands.md
local P = RPGDialogueAPI:Pack("rpgd.badlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ryedol", id = TODO_NPC("Prospector Ryedol"), name = "Prospector Ryedol",
  bible = "bibles/badlands.md", role = "questgiver", tier = "quest",
  communities = { "explorers_league" }, temper = { "weary" }, values = { "loyal", "curious" },
  notices = { "race" },

  greetings = {
    { id = "g_hill", text = "Easy, easy. Ye're no' a troll or an ogre or a Dark Iron? Good. That's three things off my list." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' our own, out in this wasteland! Sit a moment. I've not heard an Ironforge voice in weeks." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Prospector Ryedol, Explorers' League. We came out here to dig for the past. The past dug back. My partner, Hammertoe, went into the digsite an' didn't come out." },
        { id = "h_tools", tags = { "news" }, when = { questActive = TODO_QUEST("A Dwarf and His Tools") },
          text = "I left my pack behind when we ran. Every tool I own's in it. A prospector without his tools is just a dwarf standin' in the dirt." },
        { id = "h_hope", when = { any = { { questActive = TODO_QUEST("A Sign of Hope") }, { questActive = TODO_QUEST("Prospect of Faith") } } },
          text = "Hammertoe's notes. He found somethin' before the end. Uldaman, he thought. Take it tae Ironforge. Somebody there will know what it means." },
      },
      again = { { id = "h_again", text = "Aye? I'm listenin'. Not much else tae do out here but listen an' dig." } },
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
        { id = "u_default", text = "Old. Older than Ironforge. A vault the titans may have built, if ye believe the scholars. Hammertoe believed. Look where it got him." },
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
      lines = { { id = "h2_default", text = "Best digger I ever knew. Worst cook. He'd talk tae the rock like it was listenin'. Some days I think it was." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    chased = {
      lines = { { id = "c_default", text = "Troggs, out o' the deep places, more than we'd ever seen. An' things made o' stone that shouldnae move. We ran. Hammertoe didnae run fast enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    league = {
      lines = { { id = "l_default", text = "Are ye now! Then ye know: we don't leave our own in the dirt. When ye go in, bring back somethin' o' his. Anythin'. A pick. A page." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 3, align = { honor = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Ironforge born, Explorers' League sworn, an' now a dwarf in the Badlands without his partner.", next = "hammertoe" } },
    advice = { { id = "tp_ad", text = "Mark yer way in, so ye can find yer way out. Hammertoe never did." } },
    uldaman = { { id = "tp_uldaman", text = "If the League's right, the answer tae where we dwarves came from is under these hills. Worth a few bruises. Maybe no' worth Hammertoe." } },
    _none = { { id = "tp_none", text = "Couldnae say. I'm a digger, no' a sage." } },
  },
}

P:NPC {
  key = "lotwil", id = TODO_NPC("Lotwil Veriatus"), name = "Lotwil Veriatus",
  bible = "bibles/badlands.md", role = "scholar", tier = "quest",
  communities = { "badlands_camp" }, temper = { "distracted" }, values = { "curious", "inventive" },
  notices = { "race", "class" },

  greetings = {
    { id = "g_camp", text = "Hm? Oh! A visitor. Mind Servo, he's harmless. Mostly. And don't touch anything glowing. Or humming. Or warm." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome, out here in all this rock! We should compare notes. Do you have notes? I have a great many notes." },
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } },
      text = "Oh, the Horde! Wonderful. Knowledge has no banner, you know. Or it shouldn't. Come in, come in." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! You talk to the elements. I take them apart. We should be friends." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lotwil Veriatus, founding member of the Enlightened Assembly of Arcanology, Alchemy and Engineering Sciences. That's the short name. I study the elements. Rock, mostly. There's a great deal of it here." },
        { id = "h_rock", tags = { "news" }, when = { questActive = TODO_QUEST("Study of the Elements: Rock") },
          text = "Rock elementals! They wander the Dustbowl like they own it. Perhaps they do. Bring me what's left of a few, would you? For science." },
        { id = "h_hard", when = { questActive = TODO_QUEST("This Is Going to Be Hard") },
          text = "This is going to be hard. That's not a warning, that's my working title. Lucien thinks it's funny. Lucien's my assistant." },
        { id = "h_machines", when = { questActive = TODO_QUEST("The Rise of the Machines") },
          text = "The Hierophant sent you? About golems? Oh, I've wanted to see a Dark Iron golem up close for years. Ideally not too close." },
      },
      again = { { id = "h_again", text = "More? Wonderful. Mind the sample tray." } },
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
        { id = "a_default", text = "A school! Or the beginning of one. Arcane, alchemy, engineering: all one study, really, if you squint. One day every thinking people in Azeroth could learn side by side. Gnomes, dwarves, orcs, trolls. Why not? The rocks don't care who studies them." },
      },
      choices = {
        { text = "That's a big dream.", next = "BACK", fx = { affinity = 3 } },
        { text = "Orcs and gnomes, side by side? Never.", next = "assembly_never", fx = { trait = { skeptical = 1 } } },
      },
    },
    assembly_never = {
      lines = { { id = "an_default", text = "Never is just a deadline nobody's met yet. I've seen a dwarf and a goblin share a cart. Anything's possible." } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } } },
    },
    lucien = {
      lines = { { id = "l_default", text = "My assistant. Patient, practical, and convinced I'll explode one day. He's not wrong to be convinced. He's just early." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rock = {
      lines = { { id = "r_default", text = "Because it's honest! Fire lies about how hot it is. Water won't hold still. Air's never where you left it. Rock just sits there being exactly what it is." } },
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
    _none = { { id = "tp_none", text = "Fascinating! I know nothing about it. Tell me everything." } },
  },
}
