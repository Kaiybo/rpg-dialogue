-- Southshore, the rest of the town: Dalaran's emissary, the town historian, the barkeep, a
-- former Kirin Tor mage chasing a new plague, the stablehand, the cook, the horse breeder and
-- the fishing trainer. Voice: bibles/southshore_more.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "jacques", id = TODO_NPC("Emissary Jacques"), name = "Emissary Jacques",
  bible = "bibles/southshore_more.md", role = "noble", tier = "quest",
  communities = { "southshore" }, temper = { "formal" }, values = { "dutiful", "proud" },
  notices = { "class", "arcane" },

  impression = {
    first = "Emissary Jacques came down from Dalaran to ask the Alliance for help, and it plainly costs him something to ask. He is polite, careful with his words, and more frightened than he lets on.",
    third = "{name} met Emissary Jacques of the Kirin Tor, who came to Southshore seeking aid for the troubled city of Dalaran.",
  },

  greetings = {
    { id = "g_default", text = "Well met, traveller. I wish I came to Southshore bearing better news." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Good; there are fewer of you willing to listen than I'd hoped." },
    { id = "g_sent", when = { questDone = TODO_QUEST("An Alarming Request") }, text = "Modera tells me you answered. The Kirin Tor won't say thank you aloud, so I'll say it for them." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "You've studied the arcane; I can feel it on you like static. Then you'll understand what it means when a city's ley lines turn against it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Dalaran has never been comfortable asking the Light for help, but we're past comfortable now." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some would, and with the best intentions, because the magi have long thought of the elements as forces to be measured rather than spirits to be asked. Dalaran needs friends just now more than it needs curiosities, so if anyone in a violet robe asks to take notes, remember that I warned you kindly." } },
      choices = {
        { text = "Knowledge shared helps everyone. Let them take their notes.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The elements aren't for measuring. Dalaran can keep its notes.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because the Syndicate and the ogres don't care which of us they hurt, and the forests around Alterac suffer as much as our walls. I know the kaldorei mistrust magic, and I don't blame them, but I'd ask you to judge us by what we do now." } },
      choices = {
        { text = "Then I'll judge Dalaran by its deeds, and nothing else.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Mages broke the world once. I won't help them again.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Emissary.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Hold the roads around Dalaran, chiefly, because the Syndicate camp on them and the Kirin Tor will not leave their towers to drive them off. I'm not permitted to say how few guards we have left, which I suppose tells you, so please don't repeat it." } },
      choices = {
        { text = "Dalaran's walls are worth defending. I'd stand on them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Dalaran hid behind its dome for years. Let mages guard mages.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Emissary.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "If you find him, or what's left of him, I'd be grateful, though I fear the Syndicate found him first. He carried letters for the Magistrate, and if those letters reached Durnholde, someone there knows more about Dalaran's plans than I do." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a fine nose, I imagine, and it might find a trail where an apprentice with a map would not. Please be careful, though, because the Syndicate shoot animals for sport." },
      },
      choices = {
        { text = "If he's alive, I'll bring him home. He comes first.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The letters matter more. I'll find those and leave the rest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because whatever threatens Dalaran threatens what's left of the northern kingdoms, and the Alliance can't afford another fallen city. The Kirin Tor weren't always good friends to your order, I know, but I'd ask you to be a better friend to us than we were to you." } },
      choices = {
        { text = "The Alliance stands together or it falls. I'll help.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Dalaran made its own troubles. Let it mend them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I'm not permitted to say much, but the city lost a great many of its people when Archimonde came, and not all of them have been laid to rest. The Kirin Tor are proud and won't ask priests for help, so I'm asking quietly on their behalf." } },
      choices = {
        { text = "Proud or not, they'll have the Light's peace from me.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If the Kirin Tor won't ask, the burden is theirs.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I'm certain of it, though I can't prove it, which is the trouble with being spied on by experts. They want to know what the Kirin Tor will do about Alterac, and frankly, so do I, because nobody has told me yet." } },
      choices = {
        { text = "Let me find their spies. Dalaran's business is its own.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Maybe the Syndicate just wants the same answers you do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Emissary.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarven shaman, here in Southshore. The Kirin Tor would pay handsomely to study you, {class}, though I'd advise you never to let them, for they rarely give anything back." },
        { id = "h_default", key = true,
          text = "I am Jacques, emissary of the Kirin Tor. Dalaran needs the aid of the Alliance's kingdoms, and I've been sent to ask for it quietly, which is harder than it sounds in a town this size." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("An Alarming Request") },
          text = "Archmage Modera's image waits near the city, beside Lordamere Lake. Go to her and she'll tell you more than I'm permitted to." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("An Alarming Request"), days = 7 } },
          text = "You've been inside the walls, then, and seen what we've been hiding. I'd ask you to keep it to yourself, but I suspect it's far too late for that." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You're very quiet, and I've learned to notice quiet people, because the Syndicate keeps sending them to listen at the door when I speak to the Magistrate." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. I find it a comfort to see one in Southshore, I'll admit, because Dalaran's troubles are the sort that magic made and prayer might help to mend." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! The Kirin Tor and the Silver Hand never sat easily together, I'll confess, but I hope you'll judge Dalaran by its need and not by its pride." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Forgive me for staring, but I've spent weeks asking the Alliance for soldiers, and you're the first who has walked through the door without being sent." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll have walked the Alterac hills, then, and I'd be grateful for any word of the roads, because the last courier from Dalaran never arrived." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Circle, here on Kirin Tor business? No, I suspect you're on your own business, which is fine, though Dalaran would welcome a friend among your people." },
      },
      again = {
        { id = "h_again", text = "Is there more? Ask it quietly, if you would." },
        { id = "h_again2", text = "Go on. I've learned to listen in this town; it's the speaking I find difficult." },
      },
      choices = {
        { text = "What's happened in Dalaran?", next = "trouble" },
        { text = "Why keep it quiet?", next = "secret" },
        { text = "Someone in Dalaran must have sent you.", next = "modera" },
        { text = "I'd heard Dalaran was in ruins.", next = "ruins" },
        { text = "I trained in Dalaran's ways. Tell me plainly.", next = "mage", when = { class = "MAGE" } },
        { text = "My order came to the Kirin Tor from the sky.", next = "xskyborne", when = { race = "Skyborne" } },
        { text = "Does Dalaran have room for a warlock's help?", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "The Syndicate must be spying on Dalaran's envoy, Emissary.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What troubles in Dalaran need the Light's help, Emissary?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why should a paladin help the Kirin Tor, Emissary?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would Dalaran do with soldiers, Emissary?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I could look for your missing courier on the Alterac roads.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why should the Circle help Dalaran, Emissary?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would Dalaran's mages really want to study me?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll think on it, Emissary.", next = "END" },
      },
    },

    trouble = {
      lines = {
        { id = "t_default", text = "Something has disrupted the ley lines beneath the city, and the constructs that serve us have turned erratic and destructive. We don't yet know the cause, only that the city is being overrun while the council debates." },
      },
      choices = {
        { text = "Constructs? What kind?", next = "trouble_constructs" },
        { text = "I'll go.", next = "BACK", when = { questBefore = TODO_QUEST("An Alarming Request") }, fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_constructs = {
      lines = {
        { id = "tc_default", text = "Guardians, servants, things we built to sweep floors and guard doors. A broom that attacks you is funny exactly once, and then it is very much not." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    secret = {
      big = true,
      lines = {
        { id = "s_default", text = "The high council fears the shame of it. Dalaran was the Alliance's pride once, and to admit we can't keep our own house in order, so soon after the war, would be a blow to the order's name." },
      },
      choices = {
        { text = "Pride is killing your city. Tell everyone.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Some secrets protect people. Keep it quiet.", next = "BACK", fx = { align = { honor = -1 }, affinity = 2 } },
        { text = "And you? What do you think?", next = "secret_you" },
      },
    },
    secret_you = {
      lines = {
        { id = "sy_default", text = "I think we can't keep up the charade forever, and that I'm standing in a town hall in Southshore asking strangers for help. That should tell you what I think." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    modera = {
      lines = {
        { id = "m_default", fx = { learn = { "alterac" } },
          text = "Archmage Modera dispatched me, and she's sent her image to wait near the city, by Lordamere Lake. It isn't strictly permitted, what she's doing, but she won't let pride turn away allies when we need them most." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ruins = {
      lines = {
        { id = "r_default", text = "Much of it, yes, since the Legion's lord burned it in the war. The Kirin Tor have been rebuilding behind our wards ever since, and the rebuilding is exactly where the trouble started." },
      },
      choices = {
        { text = "Did the war leave something behind?", next = "ruins_war" },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_legion" } } },
      },
    },
    ruins_war = {
      lines = {
        { id = "rw_default", text = "That's one of the theories, and not the most comforting. I'm an emissary, not a scholar of ley lines, so I write the questions down and leave the answering to cleverer people." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    mage = {
      lines = {
        { id = "ma_default", text = "Then plainly: the ley lines are wrong, the wards are failing in places, and senior magi are being sent to their rooms by their own furniture. If you can hold a shield spell, Modera wants you." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xskyborne = {
      lines = { { id = "xsk_default", text = "Yes, I've heard of the High Order, though only what's said in the corridors. Archmage Runeweaver speaks well of your people, and I confess I'd hoped to meet one before I was sent so far south." } },
      choices = {
        { text = "What do they say in the corridors?", next = "xskyborne_say" },
        { text = "Then you've met one. Ask your favour.", next = "trouble", fx = { affinity = 1 } },
      },
    },
    xskyborne_say = {
      lines = { { id = "xss_default", text = "That you came looking for what your ancestors lost, and that you've ten thousand years of the world to catch up on. Mostly they wonder, which in Dalaran is the highest compliment there is." } },
      choices = {
        { text = "Let them wonder.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = { { id = "xwl_default", text = "Dalaran has a long memory where your arts are concerned, and its walls have wards against them for good reason. I'd be grateful for your help, and I'd also be grateful if you never mentioned it to anyone in the Violet Citadel." } },
      choices = {
        { text = "Dalaran's wards keep out the wrong things.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Discretion it is. Dalaran's rules are Dalaran's rules.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what the council permits me to say, and a little more besides. Choose carefully, and I'll answer as fully as I dare." } },
    background = { { id = "tp_bg", text = "I serve the Kirin Tor as a voice rather than a wand, which suits me; I was never much good with the wand." } },
    advice = { { id = "tp_ad", text = "If a construct in Dalaran stops to look at you, don't wait to see what it decides." } },
    alterac = { { id = "tp_alterac", text = "Dalaran's walls look down on what's left of Alterac. Neither is the neighbour it once was." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran is rebuilding, and the Kirin Tor need allies, and that is why I am here asking for them. It costs me something to ask, but it would cost us more not to." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor are the finest mages in the world, and we are fewer now than we were. I serve the council, and I am proud of it, even when I'm asked to come begging." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad was one of us, a member of the council, and we let him walk away with our secrets. I don't like to say his name aloud, and I'll thank you not to make me." } },
    scourge = { { id = "tp_scourge", text = "The Scourge came within sight of Dalaran's walls, and the Burning Legion broke them, and we are still counting what was lost. Every mage in the city lost someone." } },
    _none = { { id = "tp_none", text = "That's beyond my brief, I'm afraid." } },
  },
}

P:NPC {
  key = "kundric", id = TODO_NPC("Kundric Zanden"), name = "Kundric Zanden",
  bible = "bibles/southshore_more.md", role = "scholar", tier = "quest",
  communities = { "southshore" }, temper = { "chatty" }, values = { "curious", "careful" },
  notices = { "lore", "race" },

  impression = {
    first = "Kundric Zanden is Southshore's historian, and he seems to regard the present mainly as material for later. He remembers the town's every flood, war and refugee boat, and expects me to as well.",
    third = "{name} met Kundric Zanden, Southshore's town historian.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a visitor! Sit, sit, you'll be history someday, and I'd like your side of it first." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I've added you to my notes; nothing flattering yet, but there's time." },
    { id = "g_strahn", when = { questDone = TODO_QUEST("Strahnbrad Mystery") }, text = "There's my Strahnbrad correspondent! I've been through it all twice, and I'm still writing." },
  },

  notice = {
    { id = "n_lore", cat = "lore", when = { class = { "MAGE", "PRIEST" } },
      text = "You've the look of someone who reads. Good; nobody in this town reads, and I'm tired of explaining what a century is." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Dun Garok's just up the road, you know, and your people's part in Southshore's history is badly underwritten. By me, mostly." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "That a dwarf came through talking to the wind, and that the town didn't know what to make of it, which is the most honest sentence a historian can write. The last shamans Hillsbrad saw came with the Horde in the Second War, so you'll forgive the old folk if they look twice." } },
      choices = {
        { text = "Write that I came in peace and kept it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Write what you like. History belongs to the winners anyway.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That they came out of the forests to fight the Legion on Hyjal, from what the few Lordaeron men who came back from Kalimdor told me, and then went back in and shut the door. A historian hates a shut door, but I suppose your people had their reasons." } },
      choices = {
        { text = "Some doors should stay shut. Not every history wants telling.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Write it all down. Secrets have cost us too much.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Fishermen with boat hooks, mostly, and a company of Lordaeron's footmen who came down the coast road when the Horde burned the Hillsbrad farms. I have the captain's name somewhere, though the page got wet in the flood the year after, and now he's either Harlow or Harrow." } },
      choices = {
        { text = "Write his name as best you can. The fallen deserve remembering.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Names don't matter. Southshore stood, and that's history enough.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Kundric.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That the lions came down out of Alterac after the war, when the ogres drove them from the high meadows, and the farmers have hated them ever since. Before that, my grandfather wrote, a wolf was the worst thing in the hills, and now it's barely worth a line." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Would you mind if I wrote down {pet}'s name? A hunter's companion in Southshore during the Forsaken troubles is exactly the sort of detail historians a hundred years from now will thank me for." },
      },
      choices = {
        { text = "Record it all. Someone should keep the town's memory straight.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let the past go. Southshore needs hunters, not historians.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Badly, I'd say, for it's hard to write kindly of an order when the man who broke it was a prince it had trained. Uther died at Arthas's hand, and the knights who were left scattered to Hearthglen and Stratholme and worse, and I can't find a gentle way to write any of it." } },
      choices = {
        { text = "Write it plainly. The truth honours the knights who fell.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Write it kindly. Some truths only wound the living.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Hillsbrad's own bell rang for burials every day that autumn, and then one morning it didn't ring at all, which is how Southshore knew the plague had taken the town. I wrote down the date because someone had to, and I've never been able to cross it out." } },
      choices = {
        { text = "Southshore should ring a bell for them every year.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let that date fade, Kundric. The town has to look forward.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Oh, plenty, from the smugglers who ran Alterac's wine past the old customs house to the Syndicate scouts who stole the town charter the year after the war. We got the charter back, rather damp, and I wrote down every word of how." } },
      choices = {
        { text = "A good history should name the thieves. They're part of it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Better to write about the people who stopped them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, Kundric.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "One says Archimonde shattered the walls with a single blow, another says it took hours, and the third, from a mage who was there, says he was hiding in a cellar and only heard it. I trust the third, because he's the only one honest enough to admit what he didn't see." } },
      choices = {
        { text = "History should be honest, even if it's dull.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A grand story inspires people more than a cellar ever could.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "That the orcs brought them, mostly, and the Horde's warlocks blackened whole hillsides in the Second War before Durnholde's camps took the orcs in. But there are older pages about Alterac's court magi dabbling where they shouldn't, and those I keep under the floorboards, because nobody in Southshore wants to read that their grandparents' lords were no better." } },
      choices = {
        { text = "Write it all down, Kundric. The truth should be kept.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some pages are better burned than kept, Kundric.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! I'll have to note the date, {class}, because in all my years of writing down Southshore's history, I've never once had cause to put those words together." },
        { id = "h_default", text = "Kundric Zanden, historian of Southshore. Everyone else in town fishes, farms or fights, and someone has to write down what happened while they were doing it." },
        { id = "h_strahn_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Strahnbrad Mystery"), days = 7 } },
          text = "What you brought me from Strahnbrad has kept me up two nights running. Alterac's old roads still have stories in them, and the Syndicate would rather they stayed buried." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You have the look of someone who's taken a few things that weren't written down anywhere, and as a historian, I find that both troubling and fascinating." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Then you'll appreciate that I have three accounts of Dalaran's fall, and they disagree on nearly everything except that it was very loud." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! I keep a record of every chapel bell in Hillsbrad and when it last rang, and I'm afraid most of the entries end in the plague year." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! I've three chapters on the founding of the Silver Hand and none on its ending, because nobody who saw it end will sit still long enough to tell me." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Stand still a moment while I note your arms, because my records of Southshore's defenders are very thin, and I've had to guess at the sword sizes." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Excellent, because the town records have a gap where the beasts of Hillsbrad ought to be, and nobody who knows about them has ever stood still long enough." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the kaldorei! I've a whole shelf of guesses about your people and not one proper source, so if you've an hour, I've a quill." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now that's a thing I've not had the chance to write down properly. Hillsbrad's histories are full of your kind, mostly as the reason something burned." },
      },
      again = {
        { id = "h_again", text = "What else? I'll keep writing while you think." },
        { id = "h_again2", text = "Go on. Every question's a footnote, and I love a footnote." },
      },
      choices = {
        { text = "Tell me Southshore's history.", next = "history" },
        { text = "What's happening up in the Alterac foothills?", next = "strahnbrad" },
        { text = "Alterac seems to have fallen a long way.", next = "alterac" },
        { text = "What about Tarren Mill?", next = "tarren" },
        { text = "Why does history matter, out here?", next = "matter" },
        { text = "Dwarves fought over these hills in the Second War too.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Southshore's history must have a thief or two worth writing about.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "How do the accounts of Dalaran's fall disagree, Kundric?", next = "xmage", when = { class = "MAGE" } },
        { text = "When did Hillsbrad's chapel bells stop ringing, Kundric?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How should the Silver Hand's ending be written, Kundric?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Someone must have defended Southshore in the Second War, Kundric.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What do the Southshore records say about the beasts here?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What would you write about the druids, historian?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What do Hillsbrad's histories say about warlocks, Kundric?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What would you write about me, Kundric?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to your notes.", next = "END" },
      },
    },

    history = {
      lines = {
        { id = "hi_default", text = "A fishing village, until the boats came from Stormwind full of refugees, with Lothar and his young mage on the first one. A seaport in the Second War, and now one of the last human towns standing in Lordaeron." },
      },
      choices = {
        { text = "Who remembers the boats?", next = "history_boats" },
        { text = "Something else.", next = "BACK" },
      },
    },
    history_boats = {
      lines = {
        { id = "hb_default", text = "Marshal Redpath, for one; he was headman then. I've asked him to tell it a dozen times, and he tells it the same way every time, which in a historian's eyes makes him either honest or rehearsed." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    strahnbrad = {
      lines = {
        { id = "st_default", text = "A town in the Alterac foothills, once, and now a nest of the Syndicate, who are Alterac's old nobility gone to banditry. Whatever's turned up there, I want to know about it, and I'll pay in gratitude." },
        { id = "st_done", when = { questDone = TODO_QUEST("Strahnbrad Mystery") },
          text = "You know as much about it now as I do, and you were there, which is more than I'll ever manage. I'm writing it up as we speak." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "syndicate" } } } },
    },

    alterac = {
      big = true,
      lines = {
        { id = "al_default", fx = { learn = { "alterac" } },
          text = "Its king, Perenolde, sold the Alliance to the Horde in the Second War, and Lordaeron took his kingdom apart for it. His nobles became the Syndicate, and some folk here still say Alterac's people paid for one man's treachery." },
      },
      choices = {
        { text = "Treason must be answered. Lordaeron was right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Punishing a kingdom for its king was wrong.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tarren = {
      lines = {
        { id = "ta_default", text = "Our neighbour up the valley, before the plague. We shared the river, the fields and a good many marriages, and now the Forsaken live in it, which makes for an awkward chapter." },
      },
      choices = {
        { text = "I'd guess you write about the Forsaken too.", next = "tarren_forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tarren_forsaken = {
      lines = {
        { id = "tf_default", text = "Carefully. Some of them were Tarren Mill folk once, and a few might remember being written about. I'd hate to be wrong about someone who could come and correct me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    matter = {
      lines = {
        { id = "m_default", text = "Because everyone forgets, and then they make the same mistakes with fresh faces. Southshore took in refugees once; I'd like it to remember that the next time strangers come to its door." },
      },
      choices = {
        { text = "A good reason.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = {
        { id = "xdw_default", text = "They did, and the Wildhammer gryphon riders are in my notes more than any king, since they came down out of the Hinterlands when nobody had asked them yet. I wrote it all down, of course, for later." },
        { id = "xdw_kin", when = { origin = "dwarf_wildhammer_kin" },
          text = "You'll have heard the tale from the other side, then, with Aerie Peak kin as you have. I'd dearly like to compare your family's version with mine." },
      },
      choices = {
        { text = "Ironforge fought here too. Write that down.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Tell me the Second War here.", next = "history" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know a shelf's worth that nobody's asked about in years. Please, ask about any of it." } },
    background = { { id = "tp_bg", text = "I write down Southshore; that's the whole of it, and more interesting than it sounds." } },
    advice = { { id = "tp_ad", text = "Keep a journal. Nobody remembers anything properly, least of all heroes." } },
    alterac = { { id = "tp_alterac", text = "A kingdom undone by its own king. I've three shelves on it and none of them are cheerful.", next = "alterac" } },
    syndicate = { { id = "tp_syndicate", text = "Nobles in masks. They have long family trees and short tempers." } },
    lordaeron = { { id = "tp_lordaeron", text = "I wrote the history of Lordaeron's fall as it happened, from refugee reports and old soldiers' tales. It is the saddest book I've ever written, and I'm not finished yet." } },
    second_war = { { id = "tp_second_war", text = "The Horde came over these hills in the Second War, and Southshore held, barely. I've written that chapter so many times I can recite it, and I'll do so if you're not careful." } },
    internment = { { id = "tp_internment", text = "The internment camp at Durnholde was ten miles from here, and the young orc who broke it out now leads the Horde. History has a sense of humour, and it isn't a kind one." } },
    thrall = { { id = "tp_thrall", text = "Thrall was raised in Durnholde by Lord Blackmoore, of all people, and he escaped and built a nation. I've written three chapters on him, and Southshore's folk don't much like any of them." } },
    _none = { { id = "tp_none", text = "I've nothing on that, and a gap in my notes keeps me up at night." } },
  },
}

P:NPC {
  key = "kelly", id = TODO_NPC("Barkeep Kelly"), name = "Barkeep Kelly",
  bible = "bibles/southshore_more.md", role = "vendor", tier = "quest",
  communities = { "southshore" }, temper = { "jovial" }, values = { "friendly", "practical" },
  notices = { "drink", "class" },

  impression = {
    first = "Barkeep Kelly pours at the Southshore inn and seems to know every rumour in town before the town does. He trades in gossip the way Bilger trades in brew.",
    third = "{name} met Barkeep Kelly, who tends the bar at Southshore's inn.",
  },

  greetings = {
    { id = "g_default", text = "What'll it be, friend? The ale's Bilger's and the gossip's mine, and both are free with a coin." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Same as before, or are you feeling brave?" },
    { id = "g_talk", when = { questActive = TODO_QUEST("Talk of the Town") }, text = "Still on that little matter I asked about? No hurry, but don't let it go cold." },
    { id = "g_away", when = { away = 14 }, text = "Look who's back after {away} away! Sit down, because you've missed a pile of gossip, and I've kept every bit of it warm for you." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The whole bar's been talking about you, friend, and in a good way, since somebody went home grinning after a word with you." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Careful who you sit by tonight, because somebody in town's got a real grudge after talking with you. I only mention it because I like my chairs in one piece." },
    { id = "g_word_scared", when = { word = "intimidated" }, text = "I had it from {source} that you leaned hard on somebody in town. Can't say I blame you, but go easy on my regulars." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Somebody found the cellar before the bar! Was it Bilger's moonshine? Don't answer; I can tell by the eyes." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin! Bilger will want to talk to you, or hide from you, depending on his mood." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Bilger says you're a sign the world's gone strange, the fishermen want to know if you can call up a good wind, and somebody at the back swears you're an orc in a false beard. I've told them all you're a paying customer, which in this inn outranks everything else." } },
      choices = {
        { text = "Tell them the truth. I've nothing to hide.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let them guess. A good rumour does more work than the truth.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That you're tall, quiet and polite, and you tip in silver, which makes you better than most. The fishermen think you can call the fish, and the soldiers think you can't hold a line, and I think both of them are drunk." } },
      choices = {
        { text = "Let them think what they like. Rumor's harmless enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Set them straight, Kelly. Rumors grow into grudges.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every young fool with a sword and a grudge, and half of them come back with a Deathguard's arrow in the shoulder and a story twice as long as it should be. The Marshal pretends he doesn't know, and I pretend I didn't sell them the courage." } },
      choices = {
        { text = "Raids without orders get men killed. The Marshal should stop them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Good on them. Somebody has to hit back at the Forsaken.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kelly.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That the lions are bolder, the Syndicate are hungrier, and something's been dragging sheep from the farms near Durnholde and leaving tracks nobody can name. Malvew swears it's a lion, but Malvew swears everything's a lion." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And what's {pet} drinking? I'm joking, of course, though the last hunter's cat lapped up half a mug of Bilger's stout and slept under the Lieutenant's chair, which is a story I still tell." },
      },
      choices = {
        { text = "I'll tell you only what I've seen, not what I've guessed.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll trade you a good rumour, true or not.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "He says he rode with the Silver Hand once, and on a good night he's proud of it, and on a bad night he can't say Uther's name. I just pour, and I don't tell anyone which sort of night it was." } },
      choices = {
        { text = "He should be proud. The order's honour was real.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Honour didn't save the order. He's right to grieve.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not one that stays, more's the pity, for the last went north to tend the soldiers in the Plaguelands and the soldiers kept him. So folk bring their troubles to me instead, and I'm a fine listener but a poor confessor." } },
      choices = {
        { text = "A town needs a priest more than a barkeep. Ask for one.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A good barkeep does more good than most priests.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A few each week, and they gossip worse than fishermen, though they think they're being discreet. The latest is that the Kirin Tor are arguing about whether to help the Alliance in Alterac, and half of them want to stay out of it altogether." } },
      choices = {
        { text = "The Kirin Tor should stand with the Alliance. Simple as that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Dalaran has bled enough. Let them stay out of it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kelly.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "He did, and the warlock let him, which I thought showed good sense. Bilger hasn't lifted a sword in years, but he still remembers the old oaths, and I'd not want to be the one who tests them." } },
      choices = {
        { text = "The warlock was wise not to fight. Respect the old man.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I wouldn't have run. A broom doesn't scare me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! Half the bar will be talking about you before you've finished your first drink, {class}, so you may as well give them something worth repeating." },
        { id = "h_default", text = "Kelly's the name, and I keep the bar. Anderson keeps the beds, Bilger keeps the cellar, and I keep track of who's saying what about whom, which is the real business of any inn." },
        { id = "h_talk_done", when = { questDone = TODO_QUEST("Talk of the Town") },
          text = "You saw to that business of mine, and folk have been talking about you since, so you're part of the talk of the town now. Enjoy it while it lasts." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage at my bar, and you'll want something warm, I'd guess, since your lot never stop shivering after a ride down from Dalaran." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock at my bar? You're braver than most, because the last one who came in here was chased out by Bilger with a broom and a lot of shouting about the Silver Hand." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest at my bar! Folk will mind their language for an hour or so, which is a rest for my ears, and Bilger might even come up from the cellar." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, eh? Then I'll warn you that Bilger will want a word, and once he starts on the old days he doesn't stop till the barrel's dry." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and you'll want the strong stuff, I'd guess, and the latest on who's been picking fights with Tarren Mill. I've both behind the bar, and the second one's free." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter at my bar! Tell me what's moving in the hills, and I'll tell you what's moving in the town, and we'll both come out ahead." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid at my bar. Word is you lot can talk to animals, so I'll warn you, the cat in the cellar knows everything and tells nothing." },
      },
      again = {
        { id = "h_again", text = "What else? I've been wiping this same mug since noon and it's no cleaner, so I'm free." },
        { id = "h_again2", text = "Go on. Nobody's listening, and if they are, they'll tell me later anyway." },
      },
      choices = {
        { text = "Show me your drinks.", next = "BUSINESS" },
        { text = "The whole town seems to be talking about something.", next = "gossip" },
        { text = "Tell me about Bilger.", next = "bilger" },
        { text = "Who drinks here?", next = "regulars" },
        { text = "Gossip seems a strange way to run an inn.", next = "gossip_right" },
        { text = "Gossip's my trade too. Want to compare notes?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do many mages come down from Dalaran to drink, Kelly?", next = "xmage", when = { class = "MAGE" } },
        { text = "I heard Bilger chased a warlock out with a broom, Kelly.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Does Southshore have a priest of its own, Kelly?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does Bilger say about the old days, Kelly?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Who's been picking fights with Tarren Mill, then?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What's the town saying about the hills these days, Kelly?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What does Southshore say about my people, Kelly?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "The town must be talking about me already, Kelly.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just passing through.", next = "END" },
      },
    },

    gossip = {
      lines = {
        { id = "go_default", fx = { learn = { "syndicate" } },
          text = "The Syndicate, mostly, and who's been robbed this week, and whether the magistrate's shutters are bolted. The rest is fish prices and who's courting whom, and you're welcome to that too." },
        { id = "go_dalaran", when = { questDone = TODO_QUEST("An Alarming Request") },
          text = "Folk say something's gone wrong up in Dalaran, and that the fellow in the town hall in purple is begging for help. I don't believe half of what I hear, but I'm starting to believe that half." },
      },
      choices = {
        { text = "Anything about Tarren Mill?", next = "gossip_mill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gossip_mill = {
      lines = {
        { id = "gm_default", text = "Only that the Forsaken are up to something with all those herbs and frogs. Phin Odelic's been asking about strange beasts, and Phin doesn't ask about anything without a reason." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "new_plague" } } } },
    },

    bilger = {
      lines = {
        { id = "b_default", text = "Best brewer north of Ironforge, and the worst at staying out of his own barrels. He was something grander once, they say, and we're all careful not to ask." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    regulars = {
      lines = {
        { id = "r_default", text = "Fishermen at dawn, guards at dusk, and Lieutenant Farren any time he can slip away from the beach. He drinks like a man trying to forget the murlocs, which he is." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    gossip_right = {
      big = true,
      lines = {
        { id = "gr_default", text = "It's the only way to run an inn. A barkeep who knows what's said can stop a fight before it starts, warn a man his horse is about to go missing, and keep the guards honest, more or less." },
      },
      choices = {
        { text = "Loose talk ruins people. Keep your counsel.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Knowledge is armour. Keep listening.", next = "BACK", fx = { align = { honor = -1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Compare notes with a stranger who walks that quietly? I'll tell you what everyone knows and keep what only I know, and you'll do the same, and we'll both feel very clever about it." } },
      choices = {
        { text = "Fair trade. What does everyone know?", next = "gossip" },
        { text = "I'll keep my notes, then.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "You've come to the right man; I hear everything said in this town, eventually. What do you want to know?" } },
    background = { { id = "tp_bg", text = "I've poured drinks in Southshore longer than I'll admit, and I've no plans to stop." } },
    advice = { { id = "tp_ad", text = "Lock up your horse at night. The Syndicate love a good horse more than they love money." } },
    syndicate = { { id = "tp_syndicate", text = "Nobles in masks, thieving horses and murdering magistrates. They don't drink here, or if they do, they tip badly." } },
    forsaken = { { id = "tp_forsaken", text = "The dead up the hill drink nothing, but they do talk, and I hear more from their scouts than I'd like. They want Southshore, and they're patient about it." } },
    ravenholdt = { { id = "tp_ravenholdt", text = "Ravenholdt's people drink here now and then, and they pay well, and they tip better. I don't ask, and they don't tell, and the beer flows." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's rumors come in with the sailors, and they're all about pirates and gold and goblins who'll cut your throat for a copper. Most of them are true." } },
    _none = { { id = "tp_none", text = "Haven't heard a thing about it, and that's saying something." } },
  },
}

P:NPC {
  key = "phin", id = TODO_NPC("Phin Odelic"), name = "Phin Odelic",
  bible = "bibles/southshore_more.md", role = "questgiver", tier = "quest",
  communities = { "southshore" }, temper = { "sharp" }, values = { "curious", "loyal" },
  notices = { "arcane", "class" },

  impression = {
    first = "Phin Odelic used to be Kirin Tor and now leads a little band chasing odd happenings around Hillsbrad. He's sure the Forsaken are brewing something, and he worries about his friends more than he admits.",
    third = "{name} met Phin Odelic, a former Kirin Tor mage in Southshore who suspects the Forsaken of brewing a new plague.",
  },

  greetings = {
    { id = "g_default", text = "Hail, and well met. Got a moment for a man who sees plots in dead dogs?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Any news of my troublemakers?" },
    { id = "g_active", when = { questActive = TODO_QUEST("Hints of a New Plague?") }, text = "Quae and Kinelory, Go'Shek Farm, Arathi. Please hurry; it's been days." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage! You'll forgive me for staring; I don't meet many colleagues since I left the Kirin Tor, and fewer who'd admit to knowing me." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Good; if this is the plague I think it is, we'll need your sort, and plenty of you." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They might, if the earth around Tarren Mill feels as wrong to you as their cauldrons look to me. My band has been chasing rumours of a new plague with nothing but spyglasses and good intentions, so a dwarf who can ask the ground what's buried in it would be worth a dozen of my notes." } },
      choices = {
        { text = "Then I'll help you stop it. The living must be protected.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the Forsaken poison their own hill. It's not my fight.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Spiders bigger than they've any right to be in the Alterac foothills, and wolves that hunt by day near Dalaran's walls. My thought is the magic is souring something, but I've no proof, and a druid's eye might settle it." } },
      choices = {
        { text = "Then we kill the sick beasts before they spread it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Find the cause first. The beasts are victims too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, Phin.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Desperately, though I'd never put it that way in front of Quae and Kinelory, because they'd be offended. They've gone up to the Highlands to watch a Forsaken farm, and I keep thinking that if anything goes wrong, nobody with a shield will be there." } },
      choices = {
        { text = "I'll stand in front of your friends. That's what warriors do.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll go if it pays. Shields aren't free, Phin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Phin.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Dead animals in places where nothing killed them, mainly, and water the deer won't drink. The apothecaries test their brews on whatever wanders past, and the beasts always know before we do." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Watch {pet} closely up there, please, because if a beast won't drink from a stream, I'd take that as a warning, and I don't want anyone's companion lost to the Forsaken's experiments." },
      },
      choices = {
        { text = "The Forsaken must be stopped before their plague spreads.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them poison their own hills. It's not our fight yet.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Watch, mostly, and be ready, because I can't prove what the Forsaken are brewing and Southshore can't afford to start a war on a guess. If it turns out I'm right, though, I'd rather a knight of the Light was the first to know." } },
      choices = {
        { text = "Then I'll watch and wait for proof, Phin.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "They're walking dead. That's proof enough to ride.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The priests stopped nothing the first time, and I don't say that as a slight, because the grain was in every bread oven before anyone knew. This time we might see it coming, and if we do, I want healers ready before the apothecaries have finished their notes." } },
      choices = {
        { text = "The Light will hold. We must trust it this time.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Prayers failed once. Burn their brews before they're finished.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "What they're brewing, mostly, since the apothecaries at Tarren Mill have been very busy and very secretive lately. I'm worried it's a new plague, and I mean to find out before it's poured into Southshore's wells." } },
      choices = {
        { text = "I'll slip into Tarren Mill and find out for you.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "This is the Alliance's business. Report it to the Marshal.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Phin.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because after Dalaran fell, they cared more about rebuilding their towers than about the people who'd lost everything in the war. I wanted to do something useful with what I'd learned, and my friends and I seemed a better place to start." } },
      choices = {
        { text = "People matter more than towers. You chose rightly.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Kirin Tor's power protects everyone. You abandoned them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, of all things, {class}, and a dwarf at that, which is a pairing I'd have bet against before today. Tell me, can the spirits smell what the Forsaken are brewing up the hill?" },
        { id = "h_default", key = true,
          text = "Phin Odelic. I lead a small group of adventurers looking into odd happenings around Hillsbrad, and lately there have been more odd happenings than I'm comfortable with. My cousin Ray's dog Stanley grew to a monstrous size, and two of my band, Quae and Kinelory, have gone quiet in Arathi." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Hints of a New Plague?") },
          text = "My cousin Ray had to put down his dog Stanley. The poor beast grew to an unnatural size and went for anyone who came near, and I don't believe for a moment that happened on its own." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Hints of a New Plague?"), days = 7 } },
          text = "So my two troublemakers are alive after all! Ha! Those two are irreplaceable, as friends and as company on the road, and I owe you for both of them." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! Good, because my little band has plenty of curiosity and no stealth at all, and the Forsaken up at Tarren Mill always see us coming." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. I left the Kirin Tor partly because they were too quick to judge people by their schools of magic, so I'll give you a fair chance, but please keep your demon away from my friends." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! If the Forsaken really are brewing a new plague up at Tarren Mill, you're exactly who I'd want standing behind me when we find it." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Good, because my little band are brave enough, but none of us can stand in front of a Forsaken and simply refuse to fall, which I gather is your speciality." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! My little band is all scholars and nerves, and we could badly use someone who stands in front when the Forsaken start shooting." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll notice things in the hills that my friends would walk straight past, so tell me if anything near Tarren Mill smells wrong, because I'm sure something does." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Good, because most of the odd happenings I chase involve something that bites, and I'd value someone who knows what it's thinking." },
      },
      again = {
        { id = "h_again", text = "What else? I'm sorting Quae's notes, and her handwriting needs a translator." },
        { id = "h_again2", text = "Go on. Thinking out loud helps, and you're a better audience than the wall." },
      },
      choices = {
        { text = "Folk keep mentioning a dog called Stanley.", next = "stanley" },
        { text = "Who are Quae and Kinelory?", next = "friends" },
        { text = "The Forsaken are clearly up to something at Tarren Mill.", next = "plague" },
        { text = "What did you do before all this?", next = "kirintor" },
        { text = "What should be done about Tarren Mill?", next = "mill" },
        { text = "I studied the arcane too. Why leave the Kirin Tor?", next = "xmage", when = { class = "MAGE" } },
        { text = "What are you trying to learn about the Forsaken, Phin?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why did you really leave the Kirin Tor, Phin?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Could the Light stop a Forsaken plague, Phin?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you have a paladin do at Tarren Mill?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Your band could use someone to stand in front, Phin.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should I watch for near Tarren Mill, Phin?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What odd happenings have you seen in Hillsbrad?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "The elements might help your investigation, Phin.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good hunting, Phin.", next = "END" },
      },
    },

    stanley = {
      lines = {
        { id = "s_default", text = "A farm dog, friendly as anything, until he suddenly grew huge and savage and Ray had no choice. Something was put in that animal, and I mean to find out what, and who." },
      },
      choices = {
        { text = "It sounds like he was poisoned.", next = "stanley_poison" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stanley_poison = {
      lines = {
        { id = "sp_default", text = "Poisoned, or tested on, which is worse. Dogs don't swell like that from bad meat, and the Forsaken have an apothecary up the valley with an awful lot of jars." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "new_plague" } } } },
    },

    friends = {
      lines = {
        { id = "f_default", text = "Two of my best, gone to the Go'Shek Farm in the Arathi Highlands to watch the orcs and anything the Forsaken bring them. They haven't checked in for days, and they always check in, if only to complain." },
        { id = "f_done", when = { questDone = TODO_QUEST("Hints of a New Plague?") },
          text = "Staying on at the farm a while longer, in case of reprisals, and sending me notes. Kinelory looks worse after a night in the tavern, Quae says, which I'll take as good news." },
      },
      choices = {
        { text = "I'll find them.", next = "BACK", when = { questBefore = TODO_QUEST("Hints of a New Plague?") }, fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    plague = {
      big = true,
      lines = {
        { id = "p_default", fx = { learn = { "new_plague" } },
          text = "Making a new plague, their own, to finish what the Scourge started. I've no proof yet, only a giant dog and a farm in Arathi where orcs and Forsaken keep strange company, but I'd stake my old robes on it." },
      },
      choices = {
        { text = "Then strike Tarren Mill before it's finished.", next = "BACK", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Find proof first. We can't act on suspicion.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Why would they do it?", next = "plague_why" },
      },
    },
    plague_why = {
      lines = {
        { id = "pw_default", text = "Revenge on the living, I'd guess, or a weapon nobody else has. The Forsaken remember what was done to them, and some of them seem to want to share it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    kirintor = {
      lines = {
        { id = "k_default", text = "I liked the questions more than the committees, and the Kirin Tor are mostly committees. Out here I chase a mystery for a week and nobody asks me to fill in a form about it." },
        { id = "k_jacques", when = { questDone = TODO_QUEST("An Alarming Request") },
          text = "And now the Kirin Tor send an emissary to Southshore to ask for help. If they're asking strangers, it's worse up there than Jacques is allowed to say." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    mill = {
      lines = {
        { id = "mi_default", text = "Watch it, and learn what they're doing before anyone does anything foolish. Southshore and Tarren Mill trade blows every week; one more raid won't stop a plague, but the right piece of knowledge might." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xmage = {
      lines = { { id = "xma_default", text = "You'll understand, then. The Kirin Tor wanted me reading in a tower while the plague was being brewed a day's ride from Southshore, and I'd rather be wrong out here than right up there." } },
      choices = {
        { text = "Knowledge matters more than one village.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "You chose right. Theory never stopped a plague.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "What's being brewed?", next = "plague" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I collect odd happenings the way other men collect stamps. Pick one, and I'll tell you what I've pieced together." } },
    background = { { id = "tp_bg", text = "Dalaran trained me, the committees bored me, and Hillsbrad's mysteries kept me." } },
    advice = { { id = "tp_ad", text = "If an animal starts growing for no good reason, leave and tell someone." } },
    new_plague = { { id = "tp_plague", text = "I can't prove it, so call it a hunch with evidence. The Forsaken are brewing something.", next = "plague" } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are brewing something up at Tarren Mill, and I've seen the vials to prove it. I'm sure of it, though nobody will listen." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "I was Kirin Tor once, before I left to chase odd happenings around Hillsbrad. They'd have me back, I think, though they'd want to know why I left first." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's dome is down, and the city's reopening, and I'm not sure I'd want to go back. Too many old faces, and too many I'll never see again." } },
    _none = { { id = "tp_none", text = "Interesting, but not my mystery, I'm afraid." } },
  },
}

P:NPC {
  key = "malvew", id = TODO_NPC("Darren Malvew"), name = "Darren Malvew",
  bible = "bibles/southshore_more.md", role = "questgiver", tier = "quest",
  communities = { "southshore" }, temper = { "gruff" }, values = { "hardworking", "loyal" },
  notices = { "mount", "animal" },

  impression = {
    first = "Darren Malvew is the stablehand in Southshore, and he loves his horses more than most people love anything. He swears on his granddaddy's grave that mountain lions are the worst of Hillsbrad's thieves.",
    third = "{name} met Darren Malvew, Southshore's stablehand, who blames the Alterac mountain lions for his lost horses.",
  },

  greetings = {
    { id = "g_default", text = "Ain't got time to jaw, friend, them horses won't brush themselves." },
    { id = "g_back", when = { metBefore = true }, text = "You again? Well, at least you ain't a mountain lion." },
    { id = "g_active", when = { questActive = TODO_QUEST("Costly Menace") }, text = "Well? Less jawin', more huntin', hero." },
  },

  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Now that's a fine animal under you! Treat it right, and keep it away from them hills." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I would, and if they don't listen, you can let 'em have one of those lightning bolts, because they've had foals off me this season and I've had nothin' but grief. I swear on my granddaddy's grave they're the worst thieves in Hillsbrad, worse than the Syndicate, and the Syndicate's pretty bad." } },
      choices = {
        { text = "They're hungry beasts, Darren. I'll drive them off, not slaughter them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A lion that takes foals gets a lightning bolt. Simple.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I've one or two big enough, though I'll not part with 'em lightly, 'cause plate an' a heavy rider wear a horse down quicker than anythin'. Merideth's the one who sells, an' she'll want to know you'll treat the beast right before she even names a price." } },
      choices = {
        { text = "A good horse deserves care. I'd tend it like a comrade.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A horse is a tool. I'll ride it as hard as I need.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Darren.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every spring, regular as rain, on their way north an' back again. Ain't seen a column of 'em since the plague, an' half my stalls have stood empty since, though I'd muck out every one o' them twice to hear 'em clatter in again." } },
      choices = {
        { text = "The Silver Hand will ride again. I'm proof of that.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Those days are gone, Darren. Better to let them lie.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I reckon it would, 'cause my granddaddy always said the Light made every creature that walks, an' a good horse is about the best of 'em. Barley carried refugees down from the north in the bad year, an' he never once threw anybody." } },
      choices = {
        { text = "Every faithful creature has a place in the Light.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers are for people, Darren. Barley was a horse.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The Forsaken took the high pastures and the Syndicate took the woods, so I suppose the lions got pushed down onto us like everybody else. That don't make me like 'em any better, though, not when it's my horses they're after." } },
      choices = {
        { text = "They're hungry, not wicked. Spare them where you can.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A lion that takes horses has to be put down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "All the time, an' the Syndicate's the worst of 'em, comin' down from the hills on moonless nights to take whatever they can lead away. I've started sleepin' in the loft, an' my back ain't happy about it." } },
      choices = {
        { text = "I'll help you guard the stables. Those horses deserve it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A horse is just a horse. Let the thieves have one.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Darren.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "'Cause my horses can smell it a mile off, an' they'd kick the stalls to splinters tryin' to get away. A horse knows what's natural an' what ain't, an' I'll trust a horse's nose over anybody's word." } },
      choices = {
        { text = "Understood. My horse can sleep well clear of your stables.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your horses will learn to share. Times are changing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I asked one o' your lot that very thing last spring, an' he put a glowin' ward round the paddock that spooked every horse I own an' didn't bother the lions one bit. Took me a week to calm 'em down, so I'll stick to good timber an' a sharp eye, thank you kindly." } },
      choices = {
        { text = "Timber and a sharp eye. That's honest work, Darren.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A better mage would have done it right. Try again.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Somethin' else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman, well I'll be! My granddaddy said a shaman could talk to beasts, {class}, so you tell these mountain lions to leave my horses be, and I'll think kindly of you forever." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Now you're the one I want to talk to, because those mountain lions have been at my horses again, and I reckon you know what goes on in a lion's head." },
        { id = "h_default", key = true,
          text = "Darren Malvew, stablehand. Ain't nothin' irks me more than losin' these beautiful horses, and we've lost a heap to the undead, the Syndicate and every scoundrel in the hills. But the mountain lions are worse than all of 'em." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Costly Menace"), days = 5 } },
          text = "Now ain't that fine news! Should've found me a proper war hero from the start, and saved myself a dozen good horses." },
        { id = "h_later", when = { questDone = TODO_QUEST("Costly Menace") },
          text = "Ain't lost a single foal since you went up them hills. The horses are sleepin' easier, and so am I." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Now don't you go eyein' my horses, friend, 'cause I count 'em every night an' I'd know if one went missin'." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, eh? Now, I heard tell your kind can call up a horse made o' fire, an' I'll tell you right now, it ain't welcome in my stable." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Say, would you say a word over my old gelding Barley? The lions got him last week, an' I buried him up the hill, but it don't feel finished somehow." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "Well, a paladin! My granddaddy shod horses for the Silver Hand, back when the knights still rode through Southshore, an' he said you could tell a paladin's mount by how calm it stood." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "Now there's a warrior, an' I can tell by how you stand, 'cause you plant your feet like a draft horse. I mean that kindly, I swear on my granddaddy's grave." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, eh? You Dalaran folk can conjure up a whole feast, I hear, so maybe you can conjure me a fence the mountain lions can't jump." },
      },
      again = {
        { id = "h_again", text = "Something more? You can talk while I brush; the mare won't mind." },
        { id = "h_again2", text = "Go on, the horses don't mind listenin'. Mind where ye step, though, for I've not mucked the end stall since Tuesday." },
      },
      choices = {
        { text = "Why do you think the lions have grown so bold?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You seem to have it in for the mountain lions.", next = "lions" },
        { text = "I'd guess lions aren't the only ones taking your horses.", next = "thieves" },
        { text = "Tell me about your horses.", next = "horses" },
        { text = "Should we hunt every lion in Alterac?", next = "hunt" },
        { text = "I could tame one of those lions instead of killing it.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Do horse thieves still come after Southshore's stables, Darren?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why not let a fiery horse in your stable, Darren?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Would the Light hear a prayer for a horse, Darren?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Did many Silver Hand knights ride through Southshore, Darren?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Have you a horse that could carry a warrior in full plate?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Magic could keep the lions off your horses, Darren.", next = "xmage", when = { class = "MAGE" } },
        { text = "Would you really have me talk to the mountain lions?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll keep an eye out.", next = "END" },
      },
    },

    lions = {
      lines = {
        { id = "l_default", text = "They come down from Alterac every night, bold as you like, and take a foal right out from under its mother's nose. The undead and the Syndicate only steal horses; the lions eat 'em." },
      },
      choices = {
        { text = "I'll thin them out.", next = "BACK", when = { questBefore = TODO_QUEST("Costly Menace") }, fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    thieves = {
      lines = {
        { id = "t_default", fx = { learn = { "syndicate" } },
          text = "Syndicate riders out of Durnholde, mostly, and the dead from up the valley when they get a mind to. I lock the stable every night, and some mornings it's still open." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    horses = {
      lines = {
        { id = "h2_default", text = "Best stock in Lordaeron, every one of 'em, and Merideth won't sell a one of 'em to anyone she don't trust. I just feed 'em, brush 'em and fret over 'em." },
      },
      choices = {
        { text = "Merideth breeds them?", next = "horses_merideth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horses_merideth = {
      lines = {
        { id = "hm_default", text = "That she does, and she's sharp as a pitchfork and twice as pointy. Folk say she's a bit mad, and I say she knows horses better than any of 'em, so I don't mind." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hunt = {
      big = true,
      lines = {
        { id = "hu_default", text = "Every last one? I'd say yes on a bad night. On a good one, I reckon they're just hungry, same as anything else up there." },
      },
      choices = {
        { text = "The town's horses come first. Thin them hard.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Leave the hills wild. Build a better fence.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = { { id = "xhu_default", text = "Tame one? I swear on my granddaddy's grave, you'd be the first person in Hillsbrad to make one of those thieves useful. Just don't bring it near my stalls, because the horses won't care that it's tame." } },
      choices = {
        { text = "It'll stay outside. Promise.", next = "BACK", fx = { affinity = 2 } },
        { text = "A tame lion's better than a dead one.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know horses and the things that take 'em, and that's about it, friend. What you want?" } },
    background = { { id = "tp_bg", text = "I brush horses in Southshore and swear at lions; my granddaddy did the same." } },
    advice = { { id = "tp_ad", text = "Don't leave your horse tied by the road overnight, not round here." } },
    syndicate = { { id = "tp_syndicate", text = "Horse thieves with fancy names. I'd as soon see 'em eaten by lions." } },
    forsaken = { { id = "tp_forsaken", text = "The dead up the hill ride skeletal horses, and it breaks my heart every time I see one. A horse deserves to rest, even when its rider doesn't." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's got horses that do tricks, and I've told Silas Darkmoon himself that his horses are underfed. He didn't listen, but he did buy me a drink." } },
    scourge = { { id = "tp_scourge", text = "I heard the Scourge eat horses, or worse, raise them. I keep my best ones in the stable at night, and I sleep there too, if I'm honest." } },
    _none = { { id = "tp_none", text = "Don't know nothin' about that, friend." } },
  },
}

P:NPC {
  key = "jessen", id = TODO_NPC("Chef Jessen"), name = "Chef Jessen",
  bible = "bibles/southshore_more.md", role = "vendor", tier = "quest",
  communities = { "southshore" }, temper = { "proud" }, values = { "proud", "generous" },
  notices = { "craft", "hunger" },

  impression = {
    first = "Chef Jessen claims Southshore has the best cooking north of Stormwind and that folk came from Darkshire for his turtle bisque. He hasn't made it in a while, and it pains him to say why.",
    third = "{name} met Chef Jessen, Southshore's cook, famous for his Soothing Turtle Bisque.",
  },

  greetings = {
    { id = "g_default", text = "Hungry? Course you are. Everyone's hungry who smells my kitchen." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more, are you? Good, I like a customer who knows what's what." },
    { id = "g_active", when = { questActive = TODO_QUEST("Soothing Turtle Bisque") }, text = "Any turtle meat yet? The pot's waiting, and so is half of Southshore." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! I can tell by the burns. We'll talk, you and I, but you're not getting my bisque recipe." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They do, or so I believe, for the murlocs eat everything that crawls up the beach, and the turtles have more sense than to come where they're eaten. If a shaman can't call them back, perhaps you can thin out the murlocs, and then the sea might forgive us for my bisque." } },
      choices = {
        { text = "I'll clear the shore properly, so it stays safe.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the sea sort itself out, Jessen. It always does.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The murlocs and the naga have pushed them up the coast, I think, and the ones that are left are snappish and tough. I could hunt the last of them, I suppose, but then there'd be no turtles at all, and no bisque next year either." } },
      choices = {
        { text = "Leave them be, Chef. Let the turtles recover first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Cook what you can now. Next year may never come.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Meat, and plenty of it, and a good thick stew with bread to wipe the bowl. The soldiers who march to Tarren Mill on my cooking come back, and the ones who march on Anderson's porridge come back grumbling, if they come back at all." } },
      choices = {
        { text = "Feed the men who fight before anyone else, Chef.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll pay for the best cut. The rest can have porridge.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Chef.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A captain of the order ate here once on his way north, and he swore my bisque was the best thing he'd tasted since Stormwind. He rode on to Stratholme after that, and I never heard what became of him, though I've a fair guess." } },
      choices = {
        { text = "He did his duty. That's the best end a knight can ask.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Duty buried too many good men at Stratholme.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every wake in town, aye, and there's been more of those than weddings these last few years. A good bowl of something hot doesn't mend anything, but it gets folk sitting at the same table, and that's where the mending starts." } },
      choices = {
        { text = "That's the Light's work as surely as any prayer.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Soup's a kindness, Jessen, but it isn't holy work.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the turtles in Lordamere Lake have got scarce, and the ones left are too tough to eat. I suspect the Forsaken have been fouling the water, but nobody listens to a cook, so I just keep my pots warm and hope." } },
      choices = {
        { text = "Then let me find out what's fouling the water.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Cook something else. Mourning a soup won't change the lake.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Jessen.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "He swore he was keeping it fresh for the evening, and I swore back at him for a good long while. The fishermen still call it the coldest meal in Southshore, and they don't mean it kindly." } },
      choices = {
        { text = "Some things should be left to the cook. I'd never interfere.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fresh is fresh. The mage was only being practical.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I cook for anyone who pays and doesn't complain, and you'd be surprised how short that list is in Southshore. A good meal doesn't ask where you learned your trade, it only asks you to sit down and eat it hot, and I'd say the same to a Forsaken if one ever sat at my table without frightening the soldiers." } },
      choices = {
        { text = "Good food for all who pay. That's a fair kitchen.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Forsaken at your table? They'd poison the soup.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Chef.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! I don't suppose you can ask the sea to send the turtles back, {class}, because my bisque hasn't been the same since the murlocs took the shore." },
        { id = "h_default", key = true,
          text = "Chef Jessen. If there's one thing you'll learn in Southshore, it's that we cook better here than anywhere north of Stormwind, and my turtle bisque is the proof; folk used to come all the way from Darkshire for it. Or they did, when I could make it." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Soothing Turtle Bisque"), days = 5 } },
          text = "The bisque is back on the menu! Folk were queuing round the inn last night, and one old fisherman wept into his bowl, and I didn't charge him." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue in my kitchen? Fine, but if you're after the turtle bisque recipe, it's in my head, and I don't sleep with my mouth open." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! I won't be asking you to cook, because the last mage who tried turned my good stew into a bowl of ice." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! You'll bless the bisque, I hope, because it's the closest thing Southshore has to a holy relic, and folk certainly pray for it." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! You'll be hungry, then, because I've never fed a knight yet who didn't ask for seconds and then thirds." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Now you'll eat properly, I hope, because a fighting man can't live on hardtack, and Southshore has the best cooking north of Stormwind, whatever Darkshire says." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Perhaps you can tell me what's happened to the turtles, for my bisque has been ruined by their absence." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock in my kitchen? Fine, but if that imp of yours so much as breathes on my stock pot, I'll cook it, and I'll serve it to Bilger, and he won't notice." },
      },
      again = {
        { id = "h_again", text = "Something more? Mind the steam, and talk while I stir." },
        { id = "h_again2", text = "The bisque needs another hour, and the cat's already been at the crab shells, so I'm yours till it's done." },
      },
      choices = {
        { text = "Show me what you're selling.", next = "BUSINESS" },
        { text = "Why can't you make the bisque?", next = "bisque" },
        { text = "That bisque must have something special in it.", next = "recipe" },
        { text = "Do folk really come from Darkshire?", next = "darkshire" },
        { text = "Good cooking hardly seems worth risking lives for.", next = "worth" },
        { text = "I hunt. Where are the turtles you need?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Why haven't you made your turtle bisque lately, Jessen?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I heard a mage froze your stew, Jessen.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you cook for Southshore's mourners too, Jessen?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Did the Silver Hand ever eat at your table, Jessen?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What does a warrior need to eat, Chef?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What has happened to the turtles here?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you really cook for anyone, Jessen, even warlocks?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I doubt the murlocs alone keep the turtles away.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Smells good. Goodbye.", next = "END" },
      },
    },

    bisque = {
      lines = {
        { id = "b_default", text = "I used to go up past Dalaran to Lordamere Lake myself and hunt the snapjaws for the meat. It's too dangerous now, with the unrest in the hills, and a cook with an arrow in him makes poor soup." },
      },
      choices = {
        { text = "I'll bring you turtle meat.", next = "BACK", when = { questBefore = TODO_QUEST("Soothing Turtle Bisque") }, fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    recipe = {
      lines = {
        { id = "r_default", text = "Turtle, and the rest is a secret I'll take to my grave. I'll tell you this much: it's soothing, it's in the name, and a bowl of it makes even Farren stop complaining for a quarter hour." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    darkshire = {
      lines = {
        { id = "d_default", text = "I've known folk to come all that way for a bowl, and I'd come from Darkshire too if I lived there; I'd come from anywhere to get away from Darkshire. Maybe the bisque was only part of it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    worth = {
      big = true,
      lines = {
        { id = "w_default", text = "Now you sound like my mother. A town that can't eat well forgets why it bothers fighting at all, but no bowl of soup's worth a life, not even mine." },
      },
      choices = {
        { text = "A good meal is worth fighting for.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Soup's soup. Stay home and stay alive.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = { { id = "xhu_default", text = "Along the coast north of here, where the murlocs have made themselves at home, more's the pity. A hunter who can bring me turtle meat without bringing home a murloc spear in the leg would be the finest friend this kitchen ever had." } },
      choices = {
        { text = "I'll bring you turtle.", next = "BACK", fx = { affinity = 2 } },
        { text = "Why is the bisque so important?", next = "bisque" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know food, and who in Southshore eats what, and who doesn't pay. Ask away." } },
    background = { { id = "tp_bg", text = "I cook in Southshore, and I'm the best at it, and that's my story." } },
    advice = { { id = "tp_ad", text = "Eat before you go up into Alterac; the ogres won't feed you." } },
    forsaken = { { id = "tp_forsaken", text = "The dead up the hill eat nothing, and I've never understood a soul who doesn't like a good bisque. I pity them, truth be told." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's spices come through Southshore sometimes, and I'll pay any price for them. A good bisque needs a good pinch of something from the south." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's food is a crime against cookery, and I've told Silas Darkmoon so. He laughed and offered me a funnel cake, and I'm ashamed to say it was quite good." } },
    _none = { { id = "tp_none", text = "Can't help you there, friend, unless it's about soup." } },
  },
}

P:NPC {
  key = "merideth", id = TODO_NPC("Merideth Carlson"), name = "Merideth Carlson",
  bible = "bibles/southshore_more.md", role = "vendor", tier = "quest",
  communities = { "southshore" }, temper = { "proud" }, values = { "proud", "stubborn" },
  notices = { "class", "mount" },

  impression = {
    first = "Merideth Carlson breeds Southshore's horses and won't sell them to just anyone. The Silver Hand once called her mad, and she has not forgiven them, or the rest of the world, for it.",
    third = "{name} met Merideth Carlson, Southshore's horse breeder, who once claimed she could feed a spirit horse.",
  },

  greetings = {
    { id = "g_default", text = "These are the finest horses in Lordaeron, so look, but don't touch." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Have you come to buy, or only to admire?" },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A PALADIN. Of course. Come to call me mad as well, have you?" },
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Hm, that beast you're riding could use a good feed and a better rider. Well, the feed I can help with." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "My steeds go to Stormwind's people and to those Stormwind trusts, and you'd be the first of your kind to ask, which I'll admit makes me hesitate. But a rider who can hear the wind will hear a horse well enough, I expect, and that counts for more with me than whatever the paladins would say." } },
      choices = {
        { text = "Rules are rules, Merideth. I'd not ask you to bend yours.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules be hanged. A good horse knows a good rider.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Hard enough to make them ready for war, which is what Stormwind pays for. I'll not pretend they love the work, but they're fed better than half of Southshore, and they've the sea air." } },
      choices = {
        { text = "War horses earn their keep. That's the bargain.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Be gentle with them. They didn't choose this war.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "One that won't bolt when the shouting starts, and that takes years to train, not weeks, whatever the quartermasters think. I'll sell you a steady animal if you swear to bring it home, because I've buried more of my horses than I care to count." } },
      choices = {
        { text = "I swear it. A warhorse is a comrade, not a tool.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "In battle, the horse goes where I need it. No promises.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Merideth.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A horse is bred for trust over generations, and your beast is wild trust given once and kept, which I'll admit is rarer. The Silver Hand never understood either kind, and they rode my horses as if a horse were a cart with legs." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} hasn't spooked a single horse in the paddock, and that's a beast that's been well loved. I'd sell to you on the strength of that alone, if you were buying." },
      },
      choices = {
        { text = "Breeding and training make a sound animal. That's the right way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The wild makes the best companions. No pedigree needed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Because I said the Light could touch a beast as surely as a knight, and that a horse fed on blessed grain might carry its rider past death itself. They laughed at me, and the paladins laughed louder, and now they come to my door with gold and long faces." } },
      choices = {
        { text = "The Light touches every creature. You were right.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bold claims deserve doubt until they're proven.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I've seen it done, by smooth-talking men with Stormwind papers that turned out to be forged by the Syndicate. I check every buyer now, and if that makes me mad, the Silver Hand were right about me after all." } },
      choices = {
        { text = "You're right to be careful. Trust is earned.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A horse sold is a horse sold. You can't control the rest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Merideth.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They offend every horse I've ever bred, which is worse. A good horse is trained, loved and trusted over years, and a summoned beast is just bound, and I'd rather ride the first to my grave than the second to glory." } },
      choices = {
        { text = "A beast that chooses you won't bolt. I agree.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A steed is a steed. Mine never tires or dies.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not mine, because I train them from foals with every sort of noise and flash I can make, and a crackle of frost is nothing to a Carlson horse. The Silver Hand's grooms called that mad as well, but their chargers bolted at the first Scourge bonfire, and mine never did." } },
      choices = {
        { text = "Patience in the training shows. You were right, Merideth.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A steady horse is less use than a fast one.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Merideth.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who talks to spirits, is it? The Silver Hand called me mad for talking to my horses, {class}, so I'll not be the one to call you strange." },
        { id = "h_default", key = true,
          text = "Merideth Carlson, horse breeder. My steeds go to the people of Stormwind, and to those Stormwind trusts completely, and to no one else, because I won't see them in an enemy's hands, whatever the Silver Hand used to say about my wits." },
        { id = "h_human", when = { race = "Human" },
          text = "One of Stormwind's own, I see, so you may buy if you can afford it. A horse is a companion for years, so choose with your head, not your eyes." },
        { id = "h_exalted", when = { reputation = { faction = "Stormwind", min = "exalted" } },
          text = "Stormwind trusts you completely, I'm told, and so I'll trust you a little. Take your time choosing." },
        { id = "h_feed", tags = { "news" }, when = { questActive = TODO_QUEST("Manna-Enriched Horse Feed") },
          text = "Have you got the biscuits, and the gold? Yes, the gold, all of it, because I've earned every coin of it in misery." },
        { id = "h_feed_done", when = { questDone = TODO_QUEST("Manna-Enriched Horse Feed") },
          text = "You paid me for wrongs you didn't commit, paladin. I misjudged you, and I don't say that often, but I'm keeping the money." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You're a rogue, and I'll say this plainly: I don't sell horses to those who'd sell them on, and you look like you know exactly what my horses would fetch in Alterac." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, and you'll not need one of my horses, I suppose, since you've got your own fiery beast that doesn't need feeding or brushing." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. You'll not call me mad, I hope, since your Cathedral was as quick as the Silver Hand to think it, though at least it was quieter about it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and you'll want a warhorse, I suppose, which is what the Silver Hand always wanted. They rode my stock to war and called me mad for asking where the horses went." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll know what it is to trust an animal, then, and most who come through that gate only know how to spur one." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid among my horses! They're shy of the cat-folk, I find, so I'd ask you to stay on two legs while you're in the paddock." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. You'll want a horse that won't bolt the first time you set your sleeves on fire, I expect, and I breed them steady, but only for Stormwind's own." },
      },
      again = {
        { id = "h_again", text = "Anything else? The horses are watching you, and so am I." },
        { id = "h_again2", text = "Go on, then, but don't spook the mares." },
      },
      choices = {
        { text = "Let me see your horses.", next = "BUSINESS", when = { any = { { race = "Human" }, { reputation = { faction = "Stormwind", min = "exalted" } } } } },
        { text = "Why won't you sell to everyone?", next = "trust" },
        { text = "Why did the Silver Hand call you mad?", next = "mad" },
        { text = "I need feed for a spirit horse.", next = "feed", when = { class = "PALADIN", minLevel = 60 } },
        { text = "The Silver Hand seems to have been wrong about you.", next = "silverhand" },
        { text = "My people ride nightsabers. Why horses?", next = "xnightelf", when = { race = "NightElf" } },
        { text = "Do you think rogues would really sell your horses, Merideth?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I'd guess warlocks' steeds offend you, Merideth.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why did the Cathedral think you mad, Merideth?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What sort of horse would you sell a warrior, Merideth?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is a hunter's beast so different from one of your horses?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "You work your horses hard, Merideth.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do your horses mind a mage on their backs, Merideth?", next = "xmage", when = { class = "MAGE" } },
        { text = "I doubt you'd trust a dwarf shaman with one of your horses.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Fine horses. Good day.", next = "END" },
      },
    },

    trust = {
      lines = {
        { id = "t_default", text = "Because a good horse is a weapon, as surely as a sword, and I'll not arm the Syndicate or the dead. Earn Stormwind's trust and come back; I'll sell to you then, gladly." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    mad = {
      lines = {
        { id = "m_default", text = "Because I said I could make a feed to nourish spirit horses, the kind paladins call to them. They laughed, every one, and some called me worse things than mad." },
      },
      choices = {
        { text = "Can you?", next = "mad_can" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mad_can = {
      lines = {
        { id = "mc_default", text = "Of course I can! It takes manna biscuits that only the Argent Dawn sell, and a whole winter of patience. Some day a paladin will come asking, and then we'll see who's mad." },
        { id = "mc_done", when = { questDone = TODO_QUEST("Manna-Enriched Horse Feed") },
          text = "And now I have, and the horse ate it, and I was right all along. You've no idea how good that feels." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } } },
    },

    feed = {
      lines = {
        { id = "f_default", text = "Oh, so NOW the Silver Hand needs me? Bring me twenty enriched manna biscuits from the Argent Dawn, and gold, a good deal of it, for my ruffled feelings. Show me the sacrifice you all talk about so much." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "silver_hand" } } } },
    },

    silverhand = {
      big = true,
      lines = {
        { id = "sh_default", text = "Wrong? They were cruel, which is worse. Proud men, the lot of them, so sure the Light only spoke through them that they couldn't hear a horse breeder from Southshore." },
      },
      choices = {
        { text = "They were wrong. You deserve an apology.", next = "BACK", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "Grudges are poison. Let it go.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnightelf = {
      lines = { { id = "xne_default", text = "Because a horse doesn't eat its rider when the oats run short, and I've heard what a saber costs to feed. I'll not sell you one of mine, since you didn't ask, but I'll admit your cats are handsome beasts." } },
      choices = {
        { text = "Sabers are loyal. More loyal than people.", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } },
        { text = "Fair. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Horses, feed, and the faults of the Silver Hand; I know them all very well. Which?" } },
    background = { { id = "tp_bg", text = "I breed horses, and I was right about the feed, and those are the important things." } },
    advice = { { id = "tp_ad", text = "Never buy a horse that won't look you in the eye." } },
    silver_hand = { { id = "tp_silverhand", text = "Laughed at me, all of them, and now they'll come to me for feed. I'll remember every name.", next = "silverhand" } },
    scourge = { { id = "tp_scourge", text = "The Scourge took good horses from the north, and turned them into something I won't describe. I'd breed them all again, if I could, just to spite the plague." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken ride dead horses, and I've seen them up close, and once was plenty. A horse deserves better than that." } },
    holy_light = { { id = "tp_holy_light", text = "The Light called me mad once, through the mouths of the Silver Hand, and I've not forgiven it. I believe in my horses now, and they've never once let me down." } },
    _none = { { id = "tp_none", text = "If it isn't about horses, then I'm not interested." } },
  },
}

P:NPC {
  key = "rabonne", id = TODO_NPC("Donald Rabonne"), name = "Donald Rabonne",
  bible = "bibles/southshore_more.md", role = "trainer", tier = "service",
  communities = { "southshore" }, temper = { "calm" }, values = { "patient", "practical" },
  notices = { "craft", "race" },

  impression = {
    first = "Donald Rabonne teaches fishing from the Southshore docks and treats the bay as his parish. He's seen murlocs, naga and refugee boats come in on the same tide and judges none of them by their fins.",
    third = "{name} met Donald Rabonne, who teaches fishing on the Southshore docks.",
  },

  greetings = {
    { id = "g_default", text = "Easy on the boards, friend, fish can hear you walking." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The tide's good, so let's get you casting." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "A fisher, good! Lindea's got the bait, I've got the lessons, and the bay's got everything else." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Not in words, but every fisherman learns to hear it in the tide and the gulls, and I'd guess that's a small cousin of what you do. The difference is that I only ask it for fish, and I suspect a shaman asks it for rather more." } },
      choices = {
        { text = "Ask the sea for what you need, and no more.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The sea's there to be used. Take all it gives.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Patience, mostly, and knowing when to strike, which I'm told matters on a battlefield as much as on the bay. The best soldier I ever taught fished off this dock every morning before his patrol, and he never once lost his temper with a murloc." } },
      choices = {
        { text = "Patience and control win fights. Rage only wastes strength.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fury wins fights. Patience is for fishermen.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Donald.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not so different, except the fish can't see you coming and the lions can. Hunters make fine anglers, in my experience, though they keep looking over their shoulders, as if a trout might sneak up on them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} keeps eyeing my bucket, and I'll let it have the small ones, since the bay gives more than I need. Don't tell Lindea, though, because she counts the bait." },
      },
      choices = {
        { text = "Take only what you need, from the bay or the hills.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Take all you can. The bay won't miss a few fish.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That most of the work is waiting, and that you don't get to choose what comes up on the line. The Silver Hand rode out to save every town in Lordaeron at once, and I think they'd have done better to watch the water longer before they cast." } },
      choices = {
        { text = "Wise words. Better to wait for sure orders than rush in.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Waiting costs lives. A knight must act at once.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Boats and men, and once a whole refugee barge that came down from the north overloaded and turned over in a squall within sight of the docks. We pulled out who we could and the bay kept the rest, so I say a word for them every time I cast." } },
      choices = {
        { text = "Then the Light's blessing on every boat that sails.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The bay keeps what it keeps. Prayers won't calm a squall.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Less than it did, with the murlocs crowding the shallows and the town's young men off soldiering instead of fishing. The bay's patient, though, and so am I, and between us we'll outlast the lot of them." } },
      choices = {
        { text = "Clear the murlocs out so honest folk can fish.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Take what you need and let the bay keep the rest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Quite a lot, because both need patience, a good eye and the sense to know when to strike. The difference is that the bay forgives a bad cast, and I don't suppose your marks are so generous." } },
      choices = {
        { text = "Patience serves me best. I strike only when I must.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Patience is for fishermen. I make my own moments.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Donald.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the bay gives what it gives, and taking more than your share leaves nothing for the next tide. The murlocs found that out when the cod ran thin two winters back, and I'd hate to have to teach it to a mage." } },
      choices = {
        { text = "The bay deserves respect. I'll fish the honest way.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The bay is endless. Take what you can.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "That you can't make a fish bite, no matter what you've got whispering at your shoulder, and some of your kind find that a hard lesson. The bay takes its own time, and the ones who learn to sit easy with that tend to come back calmer, which can only be good for a person in your line of work." } },
      choices = {
        { text = "Patience is a discipline. I'll learn it gladly, Donald.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I don't wait on fish. I'll find another way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Donald.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman on my docks! The bay's seen murlocs, naga and refugees come in on the same tide, {class}, so it'll not mind you, and neither will I." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, eh? I hear some of your folk can take the shape of a sea lion and swim like one, and I'd trade my best net for a lesson in that, if it could be taught." },
        { id = "h_default", text = "Donald Rabonne. I teach fishing, and Lindea there sells the gear, and the bay pays both of us if we're patient. It's been a fishing town longer than anything else, Southshore, and it'll be one after." },
        { id = "h_coast", when = { questDone = TODO_QUEST("Down the Coast") },
          text = "Someone cleared the Torn Fin off the Western Strand, and the fishermen got their nets back. I thought it'd be the lieutenant, but he's still sulking at the inn." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You've the patient look of someone who waits for the right moment, and that's half of fishing, so maybe you'd be good at it, if you ever put down the daggers." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, and you'll be the sort who could freeze a fish out of the water without ever casting a line, I suppose. That's no way to fish, though I'll admit it's quick." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest on my docks! The fishermen will want you to bless the boats, and I'd not say no to it myself, for the bay's taken more than fish these last years." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! You'll not want fishing lessons, I'd guess, but sit a while anyway, because a man in heavy armour learns patience fast on a dock." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, all steel and impatience, I'd guess. Fishing might do you good, for there's no line in the world that'll bite faster because you glared at it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Then we're in the same trade, more or less, since you wait for the beast and I wait for the fish, and we've both got the cold feet to show for it." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. You'll find fishing a strange trade after yours, I expect, because there's nothing to bind and nothing to command, only the line and the water and the waiting." },
      },
      again = {
        { id = "h_again", text = "The line's in the water, so I've all the time in the world. Ask away." },
        { id = "h_again2", text = "Go on, softly now, for the bay's been stingy all week and I still owe Lindea for the line." },
      },
      choices = {
        { text = "Is the bay still giving up its fish, Donald?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "The bay looks good for fishing.", next = "bay" },
        { text = "You and Lindea seem to know each other well.", next = "lindea" },
        { text = "What about the murlocs on the coast?", next = "murlocs" },
        { text = "Is fishing really so much like my trade, Donald?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why not use magic to fish, Donald?", next = "xmage", when = { class = "MAGE" } },
        { text = "What has the bay taken, Donald?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What can a knight learn from a fisherman, Donald?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I doubt fishing has much to teach a warrior, Donald.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is fishing the bay so different from hunting the hills?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Can a warlock learn anything from fishing, Donald?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The bay must speak to you, Donald, after all these years.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Tight lines.", next = "END" },
      },
    },

    bay = {
      lines = {
        { id = "b_default", text = "Good, if you stay close in. Murlocs further down the strand, naga out past the point, and ships that come in looking ragged. The fish don't care about any of it, which I admire." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    lindea = {
      lines = {
        { id = "l_default", text = "We've worked these docks side by side so long that folk stopped asking how we're related. I don't tell them, and neither does she, and it keeps them guessing." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    murlocs = {
      big = true,
      lines = {
        { id = "m_default", text = "They fish the same water we do, and they're better at it, which I could live with. But they've started taking nets, and then fishermen, and that I can't forgive." },
      },
      choices = {
        { text = "Drive them off the strand for good.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leave them the strand. Fish the bay.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the bay, the tides and the murlocs' bad habits. Pick one." } },
    background = { { id = "tp_bg", text = "Southshore fisherman, Southshore teacher; that's the beginning and the end." } },
    advice = { { id = "tp_ad", text = "Fish the turning tide, and keep one eye on the strand." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's fishing is the best in the world, and I'd go there if I didn't love this bay so much. They catch sharks in the harbour, I'm told, and sometimes the sharks catch them." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's docks are fine for fishing, if you don't mind goblins watching you and offering to buy your catch. I've never been, but I've heard enough." } },
    forsaken = { { id = "tp_forsaken", text = "The dead come down to the shore sometimes, at night, and just stand there looking at the water. I don't know what they're looking for, and I don't ask." } },
    _none = { { id = "tp_none", text = "Couldn't say. Ask me about tides." } },
  },
}
