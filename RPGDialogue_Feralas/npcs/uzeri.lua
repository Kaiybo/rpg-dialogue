-- Witch Doctor Uzer'i, Camp Mojache's muisek-binder (0.72.0). Voice: bibles/uzeri.md
-- Darkspear witch doctor; bottles the spirits of beasts for Horde weapons, and enjoys it.
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "uzeri", id = TODO_NPC("Witch Doctor Uzer'i"), name = "Witch Doctor Uzer'i",
  bible = "bibles/uzeri.md", role = "questgiver", tier = "quest",
  communities = { "mojache" }, temper = { "sly", "eager" }, values = { "cunning", "ambitious" },
  notices = { "class", "pet" },
  impression = {
    first = "Witch Doctor Uzer'i catches the spirits of slain beasts in little vessels and means to bind them into weapons for the Horde. He talks about it with a grin, and he once paid for herbs with a dwarf's shrunken head.",
    third = "{name} met Witch Doctor Uzer'i, the Darkspear witch doctor at Camp Mojache who binds the muisek of beasts.",
  },

  greetings = {
    { id = "g_default", text = "Ah, you come to see da witch doctor. Mind da jars, mon, some of dem are still awake." },
    { id = "g_vessel", when = { questActive = TODO_QUEST("Testing the Vessel") }, text = "Shrink dem before da spirit run off, mon, or you be catchin' nothin' but a grudge." },
    { id = "g_done", when = { questDone = TODO_QUEST("Weapons of Spirit") }, text = "How dat weapon sit in your hand, mon? It remember every beast you caught for it." },
    { id = "g_away", when = { away = 14 }, text = "You been gone {away}, and da muisek in my jars been restless da whole time. Maybe dey missed you." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Da camp says you been useful, and Uzer'i has a use for useful people." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Da camp says you told somebody a story dat wasn't true. Careful, mon; da spirits hear lies too, and dey hold grudges." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. You talk to spirits nice, and I put dem in jars, so we not gonna agree on everything." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Dat {pet} got a strong muisek, I can feel it from here. Don't worry, mon, I'm only lookin'." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Uzer'i, witch doctor of da Darkspear. Da night elves been usin' da power in dis land's creatures for a long, long time, and now it be da Horde's turn." },
        { id = "h_before", when = { questBefore = TODO_QUEST("A Strange Request") },
          text = "Neeru Fireblade in Orgrimmar got a concoction I need, and I promised him somethin' for it. Take him dis, mon, and don't open da sack on da way." },
        { id = "h_return", when = { questDone = TODO_QUEST("A Strange Request"), questBefore = TODO_QUEST("Testing the Vessel") },
          text = "Da herbs are just what I needed, and da vessel is ready. Now we see if it work, and if you do." },
        { id = "h_vessel", tags = { "news" }, when = { questActive = TODO_QUEST("Testing the Vessel") },
          text = "Da wildkin in da Hinterlands, mon, da owlbeasts dat once belonged to da elves' moon goddess. Kill dem, then shrink dem with da vessel before da muisek escape." },
        { id = "h_hippo", tags = { "news" }, when = { questActive = TODO_QUEST("Hippogryph Muisek") },
          text = "Hippogryphs been loyal to da elves for a long time, and dere spirits are steady. Dat steadiness is what I want in a weapon." },
        { id = "h_mats", when = { questActive = TODO_QUEST("Natural Materials") },
          text = "Logs from da treants, minerals from da giants and dragons, sinew and metal bits from all of dem. You do it alongside da other work, mon, no need to make two trips." },
        { id = "h_weapons", tags = { "news" }, when = { questRecent = { TODO_QUEST("Weapons of Spirit"), days = 3 } },
          text = "Da muisek are sealed in now, forever. Use dat power well, because dey not gonna forgive you if you waste it." },
        { id = "h_troll", when = { race = "Troll" },
          text = "Ah, one of da Darkspear! Den you know da old ways got teeth, and I be sharpenin' dem." },
      },
      again = {
        { id = "h_again", text = "What else you want to know, mon? Da jars can wait." },
        { id = "h_again2", text = "Ask, ask. Uzer'i likes da curious ones." },
      },
      choices = {
        { text = "What is a muisek?", next = "muisek" },
        { text = "Whose head did you send to Neeru?", next = "head" },
        { text = "Why do the Horde need beast spirits?", next = "why" },
        { text = "How do you get on with the tauren here?", next = "tauren" },
        { text = "Binding spirits in jars is cruel, Uzer'i.", next = "shaman", when = { class = { "SHAMAN", "DRUID" } } },
        { text = "Is my companion's muisek safe from you?", next = "hunter", when = { class = "HUNTER" } },
        { text = "What work do you have?", next = "BUSINESS" },
        { text = "Later, witch doctor.", next = "END" },
      },
    },
    muisek = {
      lines = { { id = "m_default", text = "Da muisek is da spirit of a creature, mon, its strength and its anger together. When a beast die violent, da muisek may run off and take a bigger shape, and come back lookin' for whoever killed it." } },
      choices = {
        { text = "So you shrink the body first?", next = "muisek_shrink" },
        { text = "Something else.", next = "BACK" },
      },
    },
    muisek_shrink = {
      lines = { { id = "ms_default", text = "Dat's da trick! Shrink da creature into da vessel before its spirit get loose, and den it's ours to use as we please. No vengeance, no ghosts, just power in a jar." } },
      choices = {
        { text = "And then into a weapon?", next = "muisek_weapon" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    muisek_weapon = {
      lines = { { id = "mw_default", text = "Into a weapon, yes, with da right logs and stones and sinew to hold it. A blade with a hippogryph's loyalty, or a staff with a mountain giant's patience, dat's worth a few trips into da hills." } },
      choices = { { text = "Something else, Uzer'i.", next = "BACK" } },
    },
    head = {
      lines = { { id = "hd_default", text = "Some poor dwarf I came across in da forest, mon. He was lost, and now he's found, and Neeru was very pleased with him." } },
      choices = {
        { text = "That's ghoulish, even for a witch doctor.", next = "head_stance" },
        { text = "What was a dwarf doing in Feralas?", next = "head_stance" },
      },
    },
    head_stance = {
      big = true,
      lines = { { id = "hs_default", text = "Explorin', diggin', stealin' from da old elf ruins, who knows? Dat forest is full of people who don't belong in it, and da forest takes care of some of dem, and I take care of da rest." } },
      choices = {
        { text = "Intruders deserve what they get out there.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "A lost traveller deserved better than that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      big = true,
      lines = { { id = "w_default", text = "Because da elves got their moon and their dragons and their ancient trees, and dey been drawin' on dis land since before da Horde had a name. We not gonna win Kalimdor by bein' polite about it." } },
      choices = {
        { text = "The Horde should take what strength it can.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Some powers are better left alone.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "Da bulls are kind hosts, and dey watch my jars with long faces. Dey not say much, because Thunder Bluff and Sen'jin are friends, but I see dem wonderin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shaman = {
      big = true,
      lines = { { id = "sh_default", text = "Cruel? Da beast is dead already, mon, and its spirit would only come back angry. I give it a purpose instead of a grudge, and dat's kinder than leavin' it to haunt da hills." } },
      choices = {
        { text = "A spirit should go where it's meant to go.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Better a weapon than a haunting. I see that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Your beast is alive and loyal, and a loyal muisek don't run off, mon. I only catch da wild ones, and only when dey dead, so you and your friend sleep easy." } },
      choices = { { text = "I'll hold you to that.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Darkspear born, witch doctor trained, and sent out here to find what da land got to give. Dat's all you need, mon." } },
    advice = { { id = "tp_ad", text = "Never kill a big beast and walk away whistlin'. Somethin' might be followin' you home." } },
    cenarion_circle = { { id = "tp_cc", text = "Da druids would not like my jars, mon, so I don't invite dem over." } },
    _none = { { id = "tp_none", text = "Dat I don't know, and da spirits not tellin' me either." } },
  },
}
