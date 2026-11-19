-- Sentinel Velene Starstrike of Silverwind Refuge, and the befouled elementals of Mystral Lake (0.72.0). Voice: bibles/velene.md
-- Classic: Elemental Bracers, Mage Summoner (Sarilus Foulborne at Dreadmist Peak in the Barrens).
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "velene", id = TODO_NPC("Sentinel Velene Starstrike"), name = "Sentinel Velene Starstrike",
  bible = "bibles/velene.md", role = "soldier", tier = "quest",
  communities = { "silverwind_refuge" }, temper = { "sharp", "impatient" }, values = { "duty", "pride" },
  notices = { "arcane", "race" },
  impression = {
    first = "She takes the mage's smugness more personally than his magic.",
    third = "{name} met Sentinel Velene Starstrike at Silverwind Refuge, who wanted the summoner of Mystral Lake's befouled water elementals found and destroyed.",
  },

  greetings = {
    { id = "g_hu_prej", when = { race = "Human" }, priority = 5,
      text = "A human, in Ashenvale. Speak quickly; the orcs your kings set loose are still cutting our trees, and I have work." },
    { id = "g_hu_soft", when = { race = "Human", npcFlagBefore = "velene_human_soft" }, priority = 10,
      text = "You again, human. Good; you've proven useful, and that is more than I can say for most of your kind." },
    { id = "g_hello", text = "Ishnu-alah. Have you seen the elementals in our lake? It is a sorry sight, and I mean to know who put them there." },
    { id = "g_bracers", when = { questActive = TODO_QUEST("Elemental Bracers") }, text = "The bracers, {class}. Pry them off the elementals in the lake, and we'll learn who's pulling their strings." },
    { id = "g_sarilus", when = { questActive = TODO_QUEST("Mage Summoner") }, text = "Dreadmist Peak, in the Barrens, and mind the Horde on the way. Bring me that smirking head." },
    { id = "g_done", when = { questDone = TODO_QUEST("Mage Summoner") }, text = "The lake runs clearer every day, and nobody is laughing at me from the Barrens any longer. I sleep well, {class}." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, {class}. The lake has missed you, and so have I, a little." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You were barely ready for Dreadmist Peak when I sent you, and look at you now. I chose well." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "There's talk you've been telling tales around the forest. I have no patience for liars, {class}, so don't bring that to Silverwind." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage. I will be watching your hands, because the last mage I heard of fouled my whole lake." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken, here? You walk like Sarilus must walk, and you'll understand why that does you no favours at Silverwind." },
  },

  start = "hello",
  nodes = {
    -- Humans (human patch): bitter view of humans; Persuade softener sets velene_human_soft.
    hu_view = {
      lines = {
        { id = "huv_default", key = true,
          text = "I make of them what Ashenvale makes of them. The orcs who cut our trees came across the sea because the humans had caged them and lost their grip on them, and now Theramore sits in the marsh on land we never gave and calls itself our ally." },
        { id = "huv_human", when = { race = "Human" },
          text = "I make of your people what Ashenvale makes of you. The orcs who cut our trees came across the sea because your kingdoms couldn't keep them caged." },
      },
      choices = {
        { text = "Theramore fought beside you at Hyjal.", next = "hu_view2" },
        { text = "You sound like you've thought about this a long time.", next = "hu_view2" },
        { text = "Something else, Sentinel.", next = "BACK" },
      },
    },
    hu_view2 = {
      big = true,
      lines = {
        { id = "huv2_default",
          text = "They did, and I do not forget it, though I will not pretend that a battle buys a nation's land. Their settlers cut the Dustwallow forests for their walls, their captains sign treaties with the Warchief who burns Ashenvale, and Proudmoore calls it peace." },
      },
      choices = {
        { text = "Theramore's treaty with the orcs betrays every Sentinel.", next = "BACK",
          reply = "That is how many of my sisters see it, and I've stopped arguing with them.",
          fx = { align = { order = 1 }, opinion = { humans = "distrust" } } },
        { text = "Peace with the orcs spares Ashenvale too. Proudmoore is right.", next = "BACK",
          reply = "Perhaps, if the Warsong honoured it, but they don't. Still, I'll grant you she means well.",
          fx = { align = { order = -1 }, opinion = { humans = "respect" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_x = {
      lines = {
        { id = "hux_default", key = true,
          text = "Not you, perhaps, but your kind. Your kings caged the orcs, lost the camps, and the orcs sailed to Kalimdor, and when we fight them, Theramore sends envoys to the Warchief instead of soldiers to us." },
      },
      choices = {
        { text = "Then let me fight the Warsong beside you.", tag = "Persuade", next = "hu_x_soft",
          check = { pass = { any = { { disposition = { min = 55 } }, { class = { "WARRIOR", "HUNTER", "PALADIN" } } } } },
          fail = { next = "hu_x_fail", fx = { affinity = -1 } } },
        { text = "Your Sentinels lose ground every season. Perhaps blame yourselves.", next = "BACK",
          reply = "Get out of my sight before I forget we are allies.", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_x_soft = {
      lines = {
        { id = "huxs_default", key = true, fx = { npcFlag = { set = { "velene_human_soft" } } },
          text = "Fight beside us? Then go to Mystral Lake and prove it, and if you come back with the summoner's blood on your blade, I'll tell my sisters a human stood with Ashenvale." },
      },
      choices = {
        { text = "I'll go to Mystral Lake.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_x_fail = {
      lines = {
        { id = "huxf_default", text = "Words. Every human who comes here has words. Bring me deeds, and we'll speak again." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Farewell, Sentinel.", next = "END" },
      },
    },
    hello = {
      lines = {
        { id = "h_hu_prej", when = { race = "Human", ["not"] = { npcFlagBefore = "velene_human_soft" } },
          text = "Sentinel Velene Starstrike. Your people let the orcs loose on the world, and Ashenvale is still paying for it, so do not expect a warm welcome here." },
        { id = "h_hu_soft", when = { race = "Human", npcFlagBefore = "velene_human_soft" },
          text = "Back again. I've told the Sentinels at the Refuge that not every human is Theramore, and they're listening, if not agreeing." },
        { id = "h_default", key = true,
          text = "I am Velene Starstrike of the Sentinels, and I hold Silverwind Refuge above Mystral Lake. Something has fouled the water elementals in our lake, and before anything else we must learn who controls them." },
        { id = "h_bracers_before", when = { questBefore = TODO_QUEST("Elemental Bracers") },
          text = "The elementals wear bracers, bound to them by whoever called them up. Bring me a few, and with a little divination I think we can read the name of the one who bound them." },
        { id = "h_bracers_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Elemental Bracers"), days = 3 } },
          text = "The bracers have told us their maker, and I am not surprised in the least. It is Sarilus Foulborne, an undead mage of the Barrens, and exactly as foolish as I feared." },
        { id = "h_sarilus", tags = { "news" }, when = { questActive = TODO_QUEST("Mage Summoner") },
          text = "There's only one undead mage in the Barrens capable of defiling this many elementals, and only one fool enough to try. He's probably sitting atop Dreadmist Peak laughing at me, so go and stop the laughter." },
        { id = "h_sarilus_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Mage Summoner"), days = 3 } },
          text = "Now that repugnant smile is gone from the world forever, and you've done very well. Drink the Light of Elune when all seems lost, {class}, and may it save you, Goddess willing." },
        { id = "h_young", when = { maxLevel = 20 },
          text = "You're young for the work I have, {class}. Come back when you've a few more scars, and I'll put you to use." },
      },
      again = {
        { id = "h_again", text = "What else? Speak quickly; I'm watching the lake." },
        { id = "h_again2", text = "Go on, {class}. The elementals aren't going anywhere, more's the pity." },
      },
      choices = {
        { text = "What's wrong with the elementals?", next = "elementals" },
        { text = "I've never heard of Sarilus Foulborne.", next = "sarilus", when = { any = { { questDone = TODO_QUEST("Elemental Bracers") }, { questActive = TODO_QUEST("Mage Summoner") } } } },
        { text = "Tell me about Silverwind Refuge.", next = "refuge" },
        { text = "Could my magic cleanse the elementals?", next = "mage_v", when = { class = { "MAGE", "SHAMAN" } } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "What do you make of humans, Sentinel?", next = "hu_view" },
        { text = "You blame me for the Warsong, Sentinel?", next = "hu_x", when = { race = "Human", ["not"] = { npcFlagBefore = "velene_human_soft" } } },
        { text = "Goodbye, Sentinel.", next = "END" },
      },
    },

    elementals = {
      lines = {
        { id = "el_default", text = "Water spirits, twisted into something murky and spiteful, rising out of Mystral Lake and dragging at anyone who comes to drink. Elementals don't do that on their own; somebody called them and soured them." },
      },
      choices = {
        { text = "How can you be sure someone called them?", next = "elementals_sure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elementals_sure = {
      lines = {
        { id = "es_default", text = "Because they wear bracers, {class}, and water doesn't forge its own jewellery. Whoever bound them left his mark on every one, and a mark can be read." },
      },
      choices = {
        { text = "And once you've read the mark?", next = "elementals_then" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elementals_then = {
      big = true,
      lines = {
        { id = "et_default", text = "And then I find the one who made them and I end him, so that no one is foolish enough to try it again. The Sentinels can't guard every lake, but they can make an example." },
      },
      choices = {
        { text = "An example is exactly what's needed.", next = "BACK", reply = "Good. You understand what the Sentinels are for, which is more than most outsiders do.", fx = { align = { light = -1 } } },
        { text = "Justice, yes, but not a show of it.", next = "BACK", reply = "A show is what keeps the next fool at home, outsider. I'll make it quick, but I'll make it seen.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sarilus = {
      lines = {
        { id = "sa_default", text = "He's a Forsaken mage who has set himself up at Dreadmist Peak in the Barrens, and fancies himself clever. He is the only undead mage out there with the skill to do this, and the only one with so little sense." },
      },
      choices = {
        { text = "Why would he foul a lake so far from him?", next = "sarilus_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sarilus_why = {
      big = true,
      lines = {
        { id = "sw_default", text = "To vex us, I think, or to see if he could. I have had enough of his idiocy, and we must show him what happens to those who annoy the Sentinels." },
      },
      choices = {
        { text = "Then he'll learn, and I'll teach him.", next = "BACK", reply = "Good. Then go, and make sure he remembers who sent you.", fx = { align = { order = -1 } } },
        { text = "Going into the Barrens risks open war.", next = "BACK", reply = "It risks a great deal, and I've weighed it. Sarilus has risked more by vexing us, and he'll learn it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    refuge = {
      lines = {
        { id = "re_default", text = "A small post above the lake, at the edge of the Horde's reach. We watch the roads south and east, and lately we spend more time watching the water than the roads." },
      },
      choices = {
        { text = "Are you well supplied out here?", next = "refuge_supply" },
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
    refuge_supply = {
      lines = {
        { id = "rs_default", text = "Well enough, if you count arrows and patience. What we're short of is clean water, which is a ridiculous thing to be short of beside a lake." },
      },
      choices = {
        { text = "I'll help you clear it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Goodbye, Sentinel.", next = "END" },
      },
    },
    mage_v = {
      lines = {
        { id = "mv_default", text = "Perhaps, if you can find the binding in them and break it, though I'd sooner you broke the one who bound them. Cleanse one, and he will only call another." },
      },
      choices = {
        { text = "Then I'll go to the source.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am a Sentinel, {class}. I hold a post and I don't leave it, and that's the whole of my story worth telling." } },
    advice = { { id = "tp_ad", text = "Don't drink from Mystral Lake, and don't trust anyone who tells you it's safe." } },
    sentinels = { { id = "tp_sentinels", text = "We hold more ground than we have warriors for. It's a habit of ours." } },
    blackfathom = { { id = "tp_blackfathom", text = "Blackfathom's naga fill the coast like crabs, and the Twilight's Hammer feed them. I hold my post and I count every one I see." } },
    centaur = { { id = "tp_centaur", text = "Centaur ride up from the Barrens sometimes, past Silverwind. I've learned to hear the hooves before I see the dust." } },
    thrall = {
      { id = "tp_thrall", text = "The Horde's warchief keeps his orcs at war with us in Ashenvale, so his name is an enemy's name to me. I don't need more than that." },
      { id = "tp_thrall2", when = { faction = "Horde" }, text = "Your warchief's orcs cut our trees, {class}, so I'll keep my bow ready while we talk." },
    },
    elune = { { id = "tp_elune", text = "Elune watches Silverwind at night, and I watch it by day. Between us we miss very little." } },
    _none = { { id = "tp_none", text = "I don't know, and I haven't time to find out. Ask in Astranaar, where the Sentinels gather." } },
  },
}
