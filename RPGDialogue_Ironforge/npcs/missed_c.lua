-- Ironforge folk the first passes missed, part three: Cenarion Emissary Jademoon at the Great Forge
-- (the wiki files her under Stormwind, where she stands in a later age). Voice: bibles/missed_c.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Cenarion Emissary Jademoon: the Cenarion Circle's voice in Ironforge.
P:NPC {
  key = "emissary_jademoon", id = TODO_NPC("Cenarion Emissary Jademoon"), name = "Cenarion Emissary Jademoon", gender = "female",
  bible = "bibles/missed_c.md", role = "emissary", tier = "quest",
  communities = { "ironforge" }, temper = { "calm", "remote" }, values = { "balance", "patient" },
  notices = { "class", "race" },
  impression = {
    first = "Cenarion Emissary Jademoon stands beside the Great Forge in the plain leathers of the Circle, a night elf who keeps very still amid the hammering. She has come to ask the dwarves for help, and she seems prepared to wait a century for their answer.",
    third = "{name} met Cenarion Emissary Jademoon, who speaks for the Cenarion Circle in Ironforge.",
  },
  greetings = {
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "Ishnu-alah, my friend. Even here among the anvils, it gladdens me to see you." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Speak, and be brief; the forge is loud enough without your noise." },
    { id = "g_default", text = "Ishnu-alah, {class}. The Cenarion Circle has need of willing hands, if you can hear me over the anvils." },
    { id = "g_back", when = { metBefore = true }, text = "We meet again, and the forge is no quieter for it. Neither, I regret to say, is the desert." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Taking Back Silithus") }, text = "You have not yet gone south, I see. The Circle's hold in Silithus will be watching the road for you." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, and far from any grove. Then you and I are the only two in this mountain who miss the sound of leaves." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One of the mountain's own children. Your people have been courteous to me, {g:master|mistress} dwarf, in their loud fashion." },
  },
  start = "hello",
  nodes = {
    w2_treat = {
      lines = {
        { id = "w2_treat_l0", text = "With more kindness than I expected and less understanding than I hoped. The smiths bring me ale I do not drink, and the children ask whether I can turn into a bear, and nobody asks what the Circle has seen in the south." },
      },
      choices = {
        { text = "Can you turn into a bear?", next = "w2_treat_bear" },
        { text = "Dwarves listen better when they're shown, not told.", next = "BACK" },
      },
    },
    w2_treat_bear = {
      narr = "Her mouth moves in what might be the beginning of a smile.",
      lines = {
        { id = "w2_treat_bear_l0", text = "Not here, among the anvils. The mountain would not care for it, and neither would the guards. I tell the children that a bear is a promise the forest keeps, and they seem content with that." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ej_druid = {
      lines = { { id = "ejd_default", text = "Then you know Nighthaven, and you know how slow the Circle's councils are to move. In Silithus they cannot afford to be slow, and a druid who can fight would be worth ten who can only listen." } },
      choices = { { text = "Then I'll go south. Something else.", next = "BACK" } },
    },
    ej_elf = {
      lines = { { id = "eje_default", text = "Many of our people say so, and I once said it too. But Cenarius taught them as he taught us, and in the desert the silithid do not ask which of us has hooves." } },
      choices = {
        { text = "Then I'll stand beside them.", next = "BACK", reply = "Good, for they will stand beside you.", fx = { align = { order = 1 } } },
        { text = "Our forests are ours, whatever Cenarius taught.", next = "BACK", reply = "Then keep them, but do not ask the desert to wait for your pride.", fx = { align = { order = -1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_druid", when = { class = "DRUID" }, text = "I am Jademoon, emissary of the Cenarion Circle. You answer to the same teachers as I, so I will be plain with you: the Circle is stretched thin in Silithus, and I have been sent to ask the Alliance for aid." },
        { id = "h_default", text = "I am Jademoon, and I speak in Ironforge for the Cenarion Circle. We are druids, night elf and tauren together, and we tend the land where it is wounded, which of late means the desert of Silithus." },
      },
      again = {
        { id = "h_again", text = "Ask what you will. The Circle sent me here to answer, as much as to listen." },
        { id = "h_again2", text = "Ask it, {class}. I have learned patience from older things than this mountain, though the hammers test it." },
      },
      choices = {
        { text = "What is happening in Silithus?", next = "silithus" },
        { text = "Night elves and tauren, working together?", next = "together" },
        { text = "How can I help the Circle?", next = "BUSINESS" },
        { text = "A forge is a strange place for a druid.", next = "forge" },
        { text = "Why bring this to the dwarves?", next = "dwarves" },
        { text = "I have walked the paths of Moonglade.", next = "ej_druid", when = { class = "DRUID" } },
        { text = "I've never trusted the Circle's tauren.", next = "ej_elf", when = { race = "NightElf" } },
        { text = "How do the dwarves treat you here?", next = "w2_treat" },
        { text = "Elune light your path, Emissary.", next = "END" },
      },
    },
    silithus = {
      lines = { { id = "s_default", text = "The silithid are stirring there, great insects that tunnel beneath the sand and strip bare whatever lies near their hives. The Circle keeps a hold in the desert to watch them, and the watchers are too few for what they see.", fx = { learn = { "silithid" } } } },
      choices = {
        { text = "Where do the silithid come from?", next = "from" },
        { text = "I've seen such hives outside the desert.", next = "elsewhere" },
        { text = "Something else, Emissary.", next = "BACK" },
      },
    },
    from = {
      lines = {
        { id = "f_nightelf", when = { race = "NightElf" }, text = "From the south of the desert, behind the wall our people raised there long ago. You will have heard as little of it from your elders as I have from mine, and I have learned not to press them." },
        { id = "f_default", text = "From the far south of the desert, behind a great wall that my people raised long ago. Those among us who remember its raising do not speak of it, and I was not yet born to see it." },
      },
      choices = {
        { text = "Your elders' silence would worry me.", next = "silence" },
        { text = "Another question.", next = "BACK" },
      },
    },
    silence = {
      lines = { { id = "si_default", text = "It worries me also, though I would not say so before the Circle. When those who have lived ten thousand years will not name a thing, {class}, it is seldom because they have forgotten it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elsewhere = {
      lines = { { id = "e_default", text = "Then you have travelled widely, for they have dug into Tanaris, Feralas and the Thousand Needles as well. A single hive is a wound, but many hives so far apart are a sickness in the land, and that is why the Circle will wait no longer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    together = {
      lines = { { id = "t_default", text = "In Moonglade and in the Circle's camps we do, though seldom anywhere else. The tauren came late to the druid's path and walk it with care, and Blackhoof, who carries this same plea to Orgrimmar, has stood the desert watch beside me." } },
      choices = {
        { text = "The Horde is no friend to your people.", next = "horde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = { { id = "ho_default", text = "It is not, and I have kin in Ashenvale who would be ashamed to hear me speak well of any who march under that banner. Yet the silithid do not ask whose forest they devour, and so the Circle does not ask whose hands defend it." } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    forge = {
      lines = {
        { id = "fg_druid", when = { class = "DRUID" }, text = "You feel it too, I think, the weight of so much stone and not one living root in it. I remind myself that fire is also a part of the balance, and that the dwarves at least keep theirs where it belongs." },
        { id = "fg_default", text = "It is, and I will not pretend the heat and the hammering sit easily with me. But this is where the dwarves pass by, and Gryth Thurden's gryphons beside me are restful company, for they at least remember the sky." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarves = {
      lines = {
        { id = "d_dwarf", when = { race = "Dwarf" }, text = "Because your people know better than any what it is to find something unwelcome when one digs. The silithid are tunnellers, and I had hoped a mountain of miners would understand that danger without my explaining it." },
        { id = "d_default", text = "Because the dwarves are stubborn, well armed and not easily frightened by what lives underground. I would sooner ask for their help while the trouble is still in the desert than beg for it when it has reached greener country." },
      },
      choices = { { text = "Something else, Emissary.", next = "BACK" } },
    },
  },
  topics = {
    regard = {
      { id = "dp_rg", text = "You walk lightly even in a city of stone, and the Circle values that more than you might think." },
    },
    grievance = {
      { id = "dp_gv", text = "You have been careless with the balance, and the Circle notices such things." },
    },
    background = { { id = "tp_bg", text = "I kept a grove in Ashenvale for longer than this city's king has lived. The Circle asked me to leave it and speak for them, and so I did." } },
    silithid = { { id = "tp_sil", text = "They are many and patient, and they do not tire. The Circle watches them from its hold in Silithus." } },
    _none = { { id = "tp_none", text = "That lies outside what the Circle sent me to speak of. Ask among the dwarves, whose mountain this is." } },
  },
}
