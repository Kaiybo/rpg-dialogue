-- Astranaar, more of its people (0.37.0). Voice: bibles/ashenvale.md
-- Classic only: Sentinel Thenysil sends proven heroes on to Tyrande (Reception from Tyrande);
-- Daelyshia keeps the hippogryphs. No Silverwind Refuge, no Thenysil command (Cataclysm).
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thenysil", id = TODO_NPC("Sentinel Thenysil"), name = "Sentinel Thenysil",
  bible = "bibles/ashenvale.md", role = "soldier", tier = "quest",
  communities = { "astranaar" }, temper = { "measured" }, values = { "dutiful", "devout" },
  prejudice = { class = "WARLOCK", amount = 12, why = "Sentinel officer who has buried Sentinels to the demon-blooded Warsong." },
  notices = { "race", "class", "lock_shards" },
  impression = {
    first = "She says little, but what she says tends to reach Darnassus.",
    third = "{name} met Sentinel Thenysil of Astranaar, who sends word of proven heroes to Tyrande Whisperwind.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "Astranaar has buried enough Sentinels to the Warsong and their demon-blooded rage. I'll not shelter a demon-caller with a smile." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "My orders concerning your kind are written, and I read them twice this morning. Keep that creature leashed." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "My scouts report that your conduct here has been correct. Darnassus will hear that much, and nothing warmer." },
    { id = "g_watch", text = "Elune's light on you. Astranaar's gates are open to friends of the kaldorei, and the Sentinels decide who those are." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, and in one piece. That's a habit I like to see in the people I send out." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I had marked your name as unaccounted for. I'll strike that now, and you can tell me where the forest took you." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Your bearing has changed since I last sent you anywhere, and I notice such things for a living. You would hold a harder place on the line now, and I may ask you to." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word reached me that someone in Astranaar caught you in a lie, and the Sentinels remember such things. Speak plainly with me, and we will have no trouble." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "I'm told you leaned on one of our people until they gave way, so I'll say this only once. Astranaar's folk are under the Sentinels' protection, and that includes protection from our friends." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human, this deep in Ashenvale. The High Priestess once had harsh words for your people, and she has softer ones now, so earn them." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST", ["not"] = { race = "NightElf" } },
      text = "A priest of the Light. The Sisterhood would say we pray to the same dawn by different names, and some days I believe it." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "The cold off your pack tells me you have taken a great many souls lately, and I hope the satyrs of Satyrnaar gave up most of them. If so, you have done more for Ashenvale than half the travellers on this road." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I would post you where the Warsong are thickest, because their shamans call lightning and yours could answer it. Darnassus would hear of you." } },
      choices = {
        { text = "Post me where I'm needed, Sentinel.", next = "BACK", reply = "Then I'll post you east, and gladly, where the lightning is thickest. Elune guide your storms.", fx = { align = { order = 1 } } },
        { text = "I'll choose my own post.", next = "BACK", reply = "As you like, but choose well, and tell me where. A shaman unaccounted for is a shaman I worry about.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "We agree that the orcs must leave, and we disagree on nearly everything else, because the Circle would still sit and talk with the Horde's tauren while the Sisterhood would rather not. I send both views to Darnassus, and I let wiser heads decide." } },
      choices = {
        { text = "The Sisterhood holds this forest. The Circle should follow its lead.", next = "BACK", reply = "I'd be glad if the Circle thought so, but I'll not hold my breath. You speak like a Sentinel, druid.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The forest isn't the Sisterhood's to command. We answer to Cenarius.", next = "BACK", reply = "Cenarius would want the orcs gone too, I think. But I'll not argue theology with a druid.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "By holding when the Warsong come, and by not boasting of it afterward. I have sent many names to Darnassus, and every one belonged to someone who did their duty quietly." } },
      choices = {
        { text = "I'll do my duty and keep quiet about it.", next = "BACK", reply = "Then your name will reach Darnassus, and it will be one I'm proud to send. Quietly.", fx = { align = { order = 1 } } },
        { text = "If I earn glory, I'll let people know.", next = "BACK", reply = "Then you'll find Astranaar is not the place for it. We remember deeds, not boasts.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Always, for our nightsabers run beside the hunters' beasts and our bows answer theirs. A hunter who serves Ashenvale well will hear from Darnassus, and I would be the one who tells them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Always, for our nightsabers run beside the hunters' beasts and our bows answer theirs. Your {pet} has the discipline of a Sentinel's companion, and I do not note such things lightly." },
      },
      choices = {
        { text = "I'll ride with the Sentinels and serve Ashenvale.", next = "BACK", reply = "Then I'll be the one to tell Darnassus your name, and gladly. The nightsabers will be glad of you.", fx = { align = { order = 1 } } },
        { text = "I hunt alone. The Sentinels can manage.", next = "BACK", reply = "As you like, hunter. The forest will still be grateful, if you hunt the right things.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "We make use of them when they serve the kaldorei, because the Warsong scouts can't be caught by arrows alone. But a blade in the dark can serve anyone who pays for it, so I judge a rogue by whose coin they carry, and I watch them longer than most." } },
      choices = {
        { text = "My blade serves Ashenvale, not whoever pays most.", next = "BACK", reply = "Then you'll find Astranaar a friend, and I'll remember your face.", fx = { align = { honor = 1 } } },
        { text = "Coin is coin. I take the best offer.", next = "BACK", reply = "Then I'll be watching who pays you, rogue. The Sentinels keep careful lists.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because Queen Azshara and her Highborne drew on the Well of Eternity until the Legion heard them, and the Sundering that followed drowned half our homeland. The Sisterhood has never forgotten it, and the arcane has been forbidden among us ever since." } },
      choices = {
        { text = "Then your law was wise. I'll respect it here.", next = "BACK", reply = "Thank you. The law is old, but it was written in grief, and we keep it.", fx = { align = { order = 1 } } },
        { text = "Ten thousand years is long enough to forgive.", next = "BACK", reply = "For you, perhaps, who did not drown. For us it is yesterday.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "With respect, so long as they heal well and keep their word, for the Sisterhood judges deeds above names. Serve Astranaar's wounded faithfully and that will reach Darnassus, I promise you." } },
      choices = {
        { text = "I'll serve the wounded as faithfully as any sister.", next = "BACK", reply = "Then the Sisterhood will hear of it, and gladly. The wounded don't care whose priest you are.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I serve my own faith, not the Sisterhood's approval.", next = "BACK", reply = "Your faith is your own, and I'll not question it. Only serve well, and that's enough for me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "We guard the same forest against the same axes, which is enough for now. But a Sentinel obeys her captain without question, and I wonder whether a paladin answers first to orders or to conscience." } },
      choices = {
        { text = "Orders keep an army whole. I follow them.", next = "BACK", reply = "Then we understand each other, paladin. A Sentinel could ask for no better ally.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My conscience comes first, whatever my orders say.", next = "BACK", reply = "An honest answer, and one I'll remember. I hope your conscience and your orders rarely quarrel.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "To kill demons wherever they walk in Ashenvale, and the satyrs of Satyrnaar have given us plenty of practice. You are an ally of my people, so the order does not reach you, but if that thing slips its leash it will, and I will not be sorry." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "To kill them wherever they walk in Ashenvale, and the satyrs of Satyrnaar have given us plenty of practice. Your servant stands well within reach of my glaive, ally, so it had best remember whose leash it wears, because I will not be sorry if it forgets." },
      },
      choices = {
        { text = "Fair. If it ever slips, cut it down.", next = "BACK", reply = "Fair enough, and I'll hold you to it. The Sentinels will not hesitate.", fx = { align = { order = 1 } } },
        { text = "What I keep answers to me, not to your Sentinels.", next = "BACK", reply = "Then make sure it answers well. The Sentinels' patience is very thin for demons.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_honor = {
      lines = {
        { id = "ddh_default", text = "Then you know what they are like up close, which most of the city's elders do not. The orcs fight bravely, I will give them that, but every tree they fell at Warsong is older than their whole Horde, and they do not care." },
      },
      choices = {
        { text = "They're soldiers like us, following orders.", next = "BACK", reply = "Perhaps. It is still our forest they cut, whoever gives the orders. Keep your sympathy, but keep your blade sharp too.", fx = { align = { honor = 1 } } },
        { text = "Then we hit their camps before they hit ours.", next = "BACK", reply = "You think like Raene on a bad night. I would not say no to it, if Darnassus ever sends us the numbers.", fx = { align = { honor = -1 } } },
        { text = "Something else, Sentinel.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_honor", when = { honorKills = { min = 50 } }, text = "You have fought the Horde and lived, many times over by your bearing. The Sentinels at Warsong could use a blade like yours, and so could I, if the orcs push their lumber camps any further into our forest." },
        { id = "o_orcs_hate", tags = { "news" }, when = { opinion = { topic = "orcs", stance = "hate" } },
          text = "I hear you call the orcs beasts. I call them targets, which is shorter, and easier to aim at." },
        { id = "o_warsong_hate", tags = { "news" }, when = { gossip = { topic = "warsong", stance = "hate" } },
          text = "Raene Wolfrunner tells me you'd see every Warsong axe broken. Come back when you've broken a few, and we'll talk." },
        { id = "h_default", key = true,
          text = "I am Sentinel Thenysil. I keep watch over Astranaar for the Sisterhood, as my sisters have watched these woods since the War of the Ancients, and when someone proves themselves to the kaldorei, it is my task to see that Darnassus hears of it." },
        { id = "h_reception", tags = { "news" }, when = { questActive = TODO_QUEST("Reception from Tyrande") },
          text = "The High Priestess has heard your name, and she wishes to receive you in the Temple of the Moon. Go to Darnassus, and stand straight when you meet her, because she will be measuring you as I did." },
        { id = "h_stonetalon", when = { questDone = TODO_QUEST("Journey to Stonetalon Peak") },
          text = "Faldreas crossed you off his list with a smile, and Keeper Albagorm speaks well of you from Stonetalon Peak. The Sentinels keep a list of their own, and your name is on it now." },
        { id = "h_tyrande", when = { questDone = TODO_QUEST("Reception from Tyrande") },
          text = "You stood before the High Priestess, and she sent word back that she was not disappointed. From her that is high praise, so take it as such." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You walk like one of our Watchers, though I don't think the Sisterhood trained you. The Sentinels note who moves unseen in Astranaar, and now I've noted you." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "There's arcane on you, and I'm sure you know what the kaldorei think of that. You're an ally of my people, so I'll welcome you, though I'll keep an eye on what you do with it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Astranaar has need of steady blades, and I keep a list of those who prove steady." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The Sentinels value hunters above most, because the forest speaks to you as it speaks to us." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Whether you call on the Light or the Mother Moon, the High Priestess values those who mend the wounded." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I have heard your Silver Hand has its own discipline, and I would know if it matches ours." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Circle. The Sisterhood and the Circle answer to different voices in Darnassus, but here in Ashenvale we stand on the same ground." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "I know what you are, and so does every archer in Astranaar. Keep your hands where we can see them and your servant silent." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "Your record here is clean, so I'll speak plainly rather than coldly. What do you need?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Keep that creature leashed in Astranaar, stranger. My Sentinels have orders about such things, and those orders do not ask whom they belong to." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I weigh newcomers to decide where to post them, and I think your spirits might be useful on the roads." },
      },
      again = {
        { id = "h_again", text = "What else? The watch changes soon, as it has every night for ten thousand years." },
        { id = "h_again2", text = "Ask. A Sentinel listens even while she watches the trees." },
      },
      choices = {
        { text = "I've fought the Horde in Ashenvale often enough.", next = "dd_honor", when = { honorKills = { min = 50 } } },
        { text = "How do you judge who's proven themselves?", next = "proven" },
        { text = "The Sentinels must face a good deal here.", next = "warsong_t" },
        { text = "What is the High Priestess like?", next = "tyrande" },
        { text = "I trained as a Sentinel scout before I left.", next = "scout_t", when = { origin = "nightelf_sentinel_scout" } },
        { text = "Would Tyrande really receive a human?", next = "human_t", when = { race = "Human" } },
        { text = "What do the Sentinels make of rogues, Thenysil?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why do the kaldorei distrust arcane magic so deeply?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How does a warrior prove themselves to the Sentinels?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the Sentinels ride with hunters in Ashenvale?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "How does Tyrande regard priests who aren't of the Sisterhood?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "The Sentinels and the Silver Hand seem to serve the same cause.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the Sentinels and the Circle agree about the Warsong?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Your Sentinels must have orders about things like mine.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Where would you post a shaman, Thenysil?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "The druids are awake now. Do the Sentinels still lead?", next = "kal_lead", when = { race = "NightElf" } },
        { text = "Elune keep the watch.", next = "END", fx = { standing = { astranaar = 1 } } },
      },
    },
    proven = {
      lines = {
        { id = "pr_default", text = "By what they do when nobody is watching them, and that takes seasons to learn. Raene tells me who helps her scouts, Faldreas tells me who comes back, and Pelturas tells me who was kind to his daughter." },
      },
      choices = {
        { text = "So everyone here reports to you.", next = "proven2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    proven2 = {
      big = true,
      lines = {
        { id = "pr2_default", text = "They talk to me, which is not the same thing. A village at war has to know who it can trust, and I would rather learn it from neighbours than from graves." },
      },
      choices = {
        { text = "That's wise. Trust has to be earned.", next = "BACK", reply = "It is, and I'm glad you see it. Every newcomer gets watched for a season, and most never notice.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "It sounds like spying on your own people.", next = "BACK", reply = "It may sound so, and I'll not argue. But a village at war cannot afford blind trust.", fx = { align = { order = -1 }, affinity = -1 } },
      },
    },
    warsong_t = {
      lines = {
        { id = "w_default", text = "We face the Thistlefur in the north, who were our friends once, and the Warsong in the east, who never were. The orcs cut our trees for their war, and the furbolgs have gone mad, and Astranaar sits on its island between them." },
      },
      choices = {
        { text = "Can the Horde be reasoned with?", next = "warsong_t2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    warsong_t2 = {
      big = true,
      lines = {
        { id = "w2_default", text = "Their warchief signed a peace with the humans, and his axes keep falling in our forest all the same. I don't know whether he cannot stop them or will not, and from where I stand it hardly matters." },
      },
      choices = {
        { text = "Then they must be driven out of Ashenvale.", next = "BACK", reply = "That is my own belief, most days. Elune grant us the strength to do it.", fx = { align = { honor = -1 }, learn = { "warsong" } } },
        { text = "Some orcs keep their word. Find those ones.", next = "BACK", reply = "Perhaps there are, and I'd be glad to meet one. But they don't come to the lumber camps.", fx = { align = { honor = 1 }, learn = { "warsong" } } },
      },
    },
    tyrande = {
      lines = {
        { id = "ty_default", text = "She has led us alone since Malfurion went into the Dream, and she carries it as she carries everything, without complaint. She is gentle with the weak and very hard on the proud, so if you meet her, be the first and not the second." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1, learn = { "sentinels" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scout_t = {
      lines = {
        { id = "sc_default", text = "Then you know what we ask of our own, and why we ask it. Raene could use someone who already knows how to keep still in the brush, so tell her I sent you." },
      },
      choices = {
        { text = "I'll go to her.", next = "BACK", fx = { affinity = 2, standing = { astranaar = 1 } } },
        { text = "I left the Sentinels for a reason.", next = "BACK", fx = { affinity = -1, trait = { stubborn = 1 } } },
      },
    },
    human_t = {
      lines = {
        { id = "hu_default", text = "She stood beside Jaina Proudmoore at Hyjal, and she has not forgotten it, whatever her people grumble. If you have done enough for us, she will receive you as she would one of her own." },
      },
      choices = {
        { text = "Then I'll do enough.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kal_lead = {
      big = true,
      lines = { { id = "kle_d", text = "We lead where we have always led, on the borders, and the druids lead in the groves, and the High Priestess decides where the one ends and the other begins. For ten thousand years the men slept and we held Kalimdor, and some of the Circle forget that when they speak of how things ought to be." } },
      choices = {
        { text = "Then the Sentinels should keep command. They earned it.", next = "BACK", reply = "We did, and Tyrande will not give it up lightly. I am glad you see it.", fx = { align = { order = 1 }, standing = { astranaar = 1 } } },
        { text = "Both should share it. The old divisions don't serve us.", next = "BACK", reply = "Perhaps not, and the young say so more every year. I only ask that the druids learn to stand a watch first.", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Much of what happens in Astranaar reaches me sooner or later. Ask, and I'll tell you what a Sentinel may." },
    },
    background = { { id = "tp_bg", text = "I am a Sentinel of the Sisterhood, posted to Astranaar. My story is the watch, and the watch has no end." } },
    advice = { { id = "tp_ad", text = "Don't cross Lake Iris at night without a lantern, because the Sentinels on the bridge shoot first at shadows." } },
    sentinels = { { id = "tp_sent", text = "We answer to the High Priestess, and we stand where the forest needs us, which lately is everywhere." } },
    warsong = { { id = "tp_warsong", text = "The orcs' lumber camps are east of here, and every tree they fell is one we will not see grow again." } },
    thrall = { { id = "tp_thrall", text = "Thrall's orcs fought beside us at Hyjal, and now they cut our forest. I don't know what that makes them, but it doesn't make them friends." } },
    elune = { { id = "tp_elune", text = "Every Sentinel keeps a prayer to Elune ready before a watch. Mine is short and to the point, like me." } },
    blackfathom = { { id = "tp_blackfathom", text = "The drowned temple is cultist ground now, and naga ground. I've watched good Sentinels walk in there and fewer walk out." } },
    centaur = { { id = "tp_centaur", text = "The southern patrols meet centaur from the Barrens. They're fast and hard to frighten, and we don't try." } },
    _none = { { id = "tp_none", text = "That is not a Sentinel's business. Ask Raene, or the innkeeper; between them they hear everything." } },
  },
}

P:NPC {
  key = "daelyshia", id = TODO_NPC("Daelyshia"), name = "Daelyshia",
  title = "Hippogryph Master",
  bible = "bibles/ashenvale.md", role = "flightmaster", tier = "service",
  communities = { "astranaar" }, temper = { "wry" }, values = { "dutiful" },
  notices = { "race", "lock_pact" },
  impression = {
    first = "She flies her birds low over the trees and doesn't apologise.",
    third = "{name} met Daelyshia, the hippogryph master of Astranaar.",
  },

  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend! The birds are eager today. Fly before the wind turns, and fly well." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "The birds are ready. Pay and go. The wind will turn soon." },
    { id = "g_default", text = "Ishnu-alah. The birds are ready if you are, and I'd go before the wind turns." },
    { id = "g_back", when = { metBefore = true }, text = "You again! The birds remember you, which is more than they do for most." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Promise me you won't try to improve the harness. The last one of your folk who tried came down in Lake Iris." },
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "You have a fever-heat on you that the birds do not like, and I would guess an imp has put its pact in your blood. Sit still and let the wind cool you, and they will carry you all the same." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I watch for demons, mostly, and the smoke of orc fires. Your spirits might see what my birds cannot." } },
      choices = {
        { text = "Then keep watch, Daelyshia. We need eyes like yours.", next = "BACK", reply = "I will, and gladly, as long as the birds will fly. Thank you, shaman.", fx = { align = { order = 1 } } },
        { text = "Fly higher. Low is dangerous.", next = "BACK", reply = "Higher is where the arrows are, shaman. Low and fast keeps them alive.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not once you've settled into cat or bear, but they grow restless when a druid changes too close to the roost, because they smell the shift before they see it. I ask the Circle's folk to change beyond the bridge, and most of them are kind enough to listen." } },
      choices = {
        { text = "Your roost, your rules. I'll change beyond the bridge.", next = "BACK", reply = "Thank you, and the birds will be grateful. It's a small thing, but it matters to them.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My shape is my own. The birds will get used to it.", next = "BACK", reply = "They might, in a century or two. Until then, please, beyond the bridge.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because the Warsong keep archers at their lumber camps to the east, and a bird up high is a target while a bird down low is a blur. I've lost one already this season, and I don't mean to lose another." } },
      choices = {
        { text = "Fly as you must. I'll trust your judgment.", next = "BACK", reply = "Thank you, and the birds will thank you too. I'll send you over the lake; the Warsong never watch the water.", fx = { align = { order = 1 } } },
        { text = "If they shoot your birds, I'll go and stop them.", next = "BACK", reply = "That's brave, and I'll not stop you. Bring back the archers' bows, if you can.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not on purpose, because the Warsong archers would love nothing more than to shoot a bird out of the sky over their camp. If you want behind their lines you'll walk, and I'll pretend I never heard you ask." } },
      choices = {
        { text = "Fair. I won't put your birds in that danger.", next = "BACK", reply = "Thank you, truly. They've lost enough to the Warsong already.", fx = { align = { light = 1 } } },
        { text = "A bird or two is a fair price for good scouting.", next = "BACK", reply = "Not to me, and not to them. You'll walk, rogue.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They mind the smell of frost more than anything, because it reminds them of winter, and they'll sulk all the way to Auberdine if you cast on their backs. Keep your hands in your lap until you land and they'll forgive you anything." } },
      choices = {
        { text = "I'll keep my hands still. Your birds, your rules.", next = "BACK", reply = "Thank you, and they'll fly gentler for it. Frost is the last thing they need.", fx = { align = { order = 1 } } },
        { text = "If something attacks mid-air, I'm casting, sulk or not.", next = "BACK", reply = "Fair, I suppose, and they'll forgive you once you've landed. Just don't make a habit of it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Whenever we fly over Splintertree, so I fly them low over the canopy now, where the orcs can't see us coming. If one comes in hurt while you're here, I'd be grateful for your hands." } },
      choices = {
        { text = "I'll tend any bird that comes in wounded.", next = "BACK", reply = "Thank you, priest. I'll send for you if one comes in.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Birds heal on their own. I've people to tend.", next = "BACK", reply = "They do, mostly, but not all of them. I'll manage, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Maybe, though that's for Raene and the Sentinels to say, not a flight master. I'd only ask that if you go, you leave my birds out of it, because they don't know about wars." } },
      choices = {
        { text = "We should defend, not strike first.", next = "BACK", reply = "That's my leaning too, and the birds would agree. Defence keeps them out of it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Strike them now, before they cut another grove.", next = "BACK", reply = "Maybe, but leave my birds out of it, please. They don't know about war.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Not for you alone, but they'll throw anything that smells of the Legion, and your cloak reeks of it. Send that thing off on the ground and sit still, and they'll fly you to Auberdine as kindly as anyone." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Not for being a warlock, but they'll throw anything that smells of the Legion, and they've caught your servant's scent already. Hear them stamping in the roost? Dismiss it here on the ground and sit still, and they'll fly you to Auberdine as kindly as anyone." },
      },
      choices = {
        { text = "I'll send it off on the ground. The birds deserve that.", next = "BACK", reply = "Thank you, and they'll fly you gently for it. That's all I ask.", fx = { align = { honor = 1 } } },
        { text = "They'll carry me whether they like it or not.", next = "BACK", reply = "They won't, and you'll walk. I'll not force them.", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Daelyshia, and I keep Astranaar's hippogryphs. They fly low over the trees to Auberdine in the north, and to other roosts once you've walked the roads to find them." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "I'll fly them by night if you insist, but they don't like the dark over the eastern woods, where the Warsong's fires burn." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You've a light step, and the birds can always tell a light rider from a heavy one. They'll like you better than they liked that dwarf last week." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "You're a mage, so you'll be wondering why you should ride when you could teleport. The answer is that Astranaar has no portal, and my birds don't ask you for reagents." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Hold on with your knees and don't lean, because I fly low over the trees and the branches won't wait." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. My birds come back with arrow wounds more often than I'd like, so I keep a healer's name handy." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll be a heavy load, but my birds have flown worse over the eastern trees." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. You've no wings of your own, so you'll fly with mine like everyone else, and I promise the birds are gentler than they look." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "My hippogryphs can smell the Legion from the far end of the island, and they're stamping now. Send off whatever you keep until we're in the air, or they'll throw you." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I fly low over the trees and watch the eastern sky for Warsong smoke, so tell me, do your wind spirits fly low too?" },
      },
      again = {
        { id = "h_again", text = "Anything else, or are we flying? Ask quickly, because that one's been eyeing your hat." },
        { id = "h_again2", text = "Go on. The birds are in no hurry, even if you are." },
      },
      choices = {
        { text = "Astranaar needs the birds to keep its people safe.", next = "BACK", reply = "It does. Without them, we would be cut off.", fx = { align = { order = 1 } } },
        { text = "The hippogryphs could serve the Sentinels better in battle.", next = "BACK", reply = "They serve well enough by flying. Pay and go.", fx = { align = { order = -1 } } },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Why fly so low over the trees?", next = "low" },
        { text = "The birds seem at home in Ashenvale.", next = "birds" },
        { text = "Can a hunter's eye help you spot trouble?", next = "hunter_d", when = { class = "HUNTER" } },
        { text = "My home's a long way off. How far can they go?", next = "far_d", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Do you ever fly rogues behind the Warsong lines?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do your birds mind a mage on their backs?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why do you fly so low over the forest, Daelyshia?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The Warsong must shoot at your hippogryphs.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the Alliance strike Splintertree before they strike us?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the hippogryphs fear druids who change shape near them?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Will your birds really throw me, Daelyshia?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You keep watching the eastern sky, Daelyshia.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not today.", next = "END" },
      },
    },
    low = {
      lines = {
        { id = "lo_default", text = "Because the Horde has archers in the east, and a bird against the open sky is a target. Low over the canopy, the trees hide us, and the birds know every gap." },
      },
      choices = {
        { text = "Have the orcs ever brought one down?", next = "low2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    low2 = {
      lines = {
        { id = "lo2_default", text = "Not one of mine, and not for want of trying. I lost a saddle to an arrow last spring, and I keep it on the wall so the birds and I both remember." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } } },
    },
    birds = {
      lines = {
        { id = "bi_default", text = "This is their home, and they love it as we do. They are bred in these woods, and they'd sooner nest in a burning tree than leave it, which is more loyalty than some people manage." },
      },
      choices = {
        { text = "They sound like Sentinels.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter_d = {
      lines = {
        { id = "hd_default", text = "It can, and Raene's scouts already tell me where the Warsong are thickest. If you see smoke where there shouldn't be any, tell her first and me second, and I'll route the birds around it." },
      },
      choices = { { text = "I'll keep watch for smoke.", next = "BACK", fx = { affinity = 2, standing = { astranaar = 1 } } } },
    },
    far_d = {
      lines = {
        { id = "fd_default", text = "Not across the sea, I'm afraid; for that you'll want the Bravery out of Auberdine. But they'll get you to the boat faster than your own legs, and drier too." },
      },
      choices = { { text = "Faster and drier will do.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I raise hippogryphs and fly them where Astranaar needs them. That keeps me busy enough." } },
    advice = { { id = "tp_ad", text = "If you're flying east, keep your head down and let the bird do the thinking." } },
    theramore = { { id = "tp_theramore", text = "Theramore's too far for my birds, all the way across the Barrens. I send folk to the ships at Auberdine instead." } },
    nordrassil = { { id = "tp_nordrassil", text = "My birds still turn north toward Hyjal on clear days. They know where the first tree is, even if they've never seen it." } },
    everlook = { { id = "tp_everlook", text = "I've flown a druid to Everlook once, and my bird came back with ice in its feathers. Never again, I told her." } },
    _none = { { id = "tp_none", text = "I keep birds, not answers. Kimlya at the inn hears more than I do, and remembers it longer." } },
  },
}
