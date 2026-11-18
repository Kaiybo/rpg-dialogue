-- Teldrassil, the folk we had missed: in Dolanaar, Sentinel Kyra Starsong (the Council of the Forest,
-- Seek Redemption!), Laurna Morninglight (priest trainer), Jannok Breezesong (rogue trainer, lovestruck)
-- and Seriadne (stable master); Sentinel Arynia Cloudsbreak at the Oracle Glade; Daryn Lightwind, the
-- historian of Rut'theran. Classic only (The Sisterhood of Elune is a 1.60 Forever quest).
-- Voice: bibles/teldrassil_folk.md
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Sentinel Kyra Starsong
---------------------------------------------------------------------------
P:NPC {
  key = "kyra_starsong", id = TODO_NPC("Sentinel Kyra Starsong"), name = "Sentinel Kyra Starsong",
  bible = "bibles/teldrassil_folk.md", role = "soldier", tier = "quest",
  communities = { "dolanaar" }, temper = { "stern", "precise" }, values = { "lawful", "dutiful" },
  notices = { "class", "race" },

  impression = {
    first = "Sentinel Kyra Starsong carries the Council of the Forest's orders to Dolanaar and delivers them as if reading from a scroll. She knows exactly who has helped the satyr Zenn Foulhoof, and she is not pleased about it.",
    third = "{name} met Sentinel Kyra Starsong in Dolanaar, who speaks for the Council of the Forest.",
  },

  greetings = {
    { id = "g_hello", text = "Halt a moment, {class}. The Council of the Forest has an eye on everyone who passes through Dolanaar." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I trust you've kept clear of satyrs since we last spoke." },
    { id = "g_zenn", when = { questDone = TODO_QUEST("Zenn's Bidding") },
      text = "The Council has heard that you aided Zenn Foulhoof, the satyr by the road. You'll want to hear what I have to say about that." },
    { id = "g_redeemed", when = { questDone = TODO_QUEST("Seek Redemption!") },
      text = "Foulhoof ate the cones, I hear, and the Council is satisfied. Consider your name clean, and keep it that way." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. The Council expects more of you than of most, because you of all people should know better than to help a satyr." },
    { id = "n_human", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "You're a guest on Teldrassil. The Council is patient with guests, but its patience has an end." },
  },

  start = "hello",
  nodes = {
    dd_tally = {
      lines = {
        { id = "ddt_default", text = "The Council keeps account of everyone who walks beneath Teldrassil, and Priestess Amara's report on the northern road now stands in yours. Keep giving them reasons to write such things, and you will find the forest's laws sit lightly on you." },
      },
      choices = {
        { text = "Good. A forest needs its laws kept.", next = "BACK", reply = "It does, and it is rare to hear a newcomer say so without being asked. I will remember it.", fx = { align = { order = 1 } } },
        { text = "I didn't clear that road for the Council's ledger.", next = "BACK", reply = "Nobody asked why you did it, {class}, only that it was done. The Council writes it down either way.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_road", when = { questDone = TODO_QUEST("The Road to Darnassus") }, text = "Priestess Amara reports that the northern road to Darnassus is clear of ambushers, and that you cleared it. The Council of the Forest has entered that in your favour, {class}." },
        { id = "h_dd_fall", when = { deathCause = "falling" }, text = "The healers say you have fallen from the high paths at least once. Teldrassil is a tall tree, {class}, and the Council will not build railings for the careless." },
        { id = "h_default", key = true,
          text = "I am Sentinel Kyra Starsong, and I pass on the orders of the Council of the Forest. Those who keep Teldrassil's laws have nothing to fear from me, and those who don't will find me very hard to avoid." },
        { id = "h_seek", tags = { "news" }, when = { questActive = TODO_QUEST("Seek Redemption!") },
          text = "Fel cones are corrupted seeds that fall from the trees and billow green smoke. Gather three and give them to Foulhoof, and he'll think you've brought him a harmless snack, which will teach him something about trusting strangers." },
        { id = "h_zenn", when = { questDone = TODO_QUEST("Zenn's Bidding") },
          text = "You killed nature's creatures for a satyr, and the Council has heard of it. You must redeem yourself in its eyes if you wish to remain a friend of Teldrassil." },
      },
      again = {
        { id = "h_again", text = "Anything else? Be brief; the Council's business is never finished." },
        { id = "h_again2", text = "Ask what you need to." },
      },
      choices = {
        { text = "Does the Council keep a tally of my deeds?", next = "dd_tally", when = { questDone = TODO_QUEST("The Road to Darnassus") } },
        { text = "What is the Council of the Forest?", next = "council" },
        { text = "What's wrong with helping Zenn?", next = "zenn" },
        { text = "How bad are things in Teldrassil?", next = "trouble" },
        { text = "I didn't know he was a satyr.", next = "excuse", when = { questDone = TODO_QUEST("Zenn's Bidding") } },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    council = {
      lines = { { id = "co_default", text = "Elders of the Sentinels and the druids, who see to the forest's laws while Darnassus sees to the city's. The Arch Druid and the High Priestess have the final word, but the Council has the first, and the first is the one most people hear." } },
      choices = {
        { text = "The forest needs its laws. I'll respect them.", next = "BACK", reply = "Good, and the Council will be glad of it. The forest has kept its own laws longer than any city.", fx = { align = { order = 1 } } },
        { text = "A forest has no use for councils.", next = "BACK", reply = "Then you have not been on Teldrassil very long, {class}. The forest has a great use for them, and so do the Sentinels.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    zenn = {
      lines = { { id = "ze_default", text = "Zenn Foulhoof is a satyr, and satyrs are the enemies of the forest, whatever charming story he tells. He has young adventurers kill nightsabers and webwood spiders for him, and nobody asks what he wants with the pieces." } },
      choices = {
        { text = "What does he want with them?", next = "zenn_want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zenn_want = {
      lines = { { id = "zw_default", text = "He says it's to be free of a curse and returned to his old shape. Perhaps that's even true, but a satyr who wants something badly enough to lie for it is a satyr worth watching." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "satyrs" } } } },
    },

    trouble = {
      lines = { { id = "tr_default", text = "The Gnarlpine furbolgs have turned savage, the grells breed in Shadowglen, and the harpies hold the glade around the Oracle Tree. Teldrassil is a young tree, and it seems everything wicked on it has noticed." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "teldrassil" } } } },
    },

    excuse = {
      lines = { { id = "ex_default", text = "Horns, hooves and a voice like honey poured over a knife, and you didn't know? The Council doesn't care what you knew, {class}, only what you'll do about it now." } },
      choices = {
        { text = "I'll make it right. I give you my word.", next = "BACK", reply = "See that you do, and the Council will hear of it from me. A satyr's favour is a debt you do not want.", fx = { align = { honor = 1 } } },
        { text = "A satyr's coin spends like any other.", next = "BACK", reply = "It spends, and it buys you nothing but the Council's attention. I would get rid of it before it gets rid of you.", fx = { align = { honor = -1 } } },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Sentinel Arynia Cloudsbreak
---------------------------------------------------------------------------
P:NPC {
  key = "arynia", id = TODO_NPC("Sentinel Arynia Cloudsbreak"), name = "Sentinel Arynia Cloudsbreak",
  bible = "bibles/teldrassil_folk.md", role = "soldier", tier = "quest",
  communities = { "teldrassil_wilds" }, temper = { "steady", "grim" }, values = { "dutiful", "protective" },
  notices = { "class" },

  impression = {
    first = "Sentinel Arynia Cloudsbreak guards the Oracle Tree with a handful of Sentinels and a growing list of harpies she'd like to see dead. She lost a runner to them and hasn't forgiven it.",
    third = "{name} met Sentinel Arynia Cloudsbreak, who guards the Oracle Tree's glade against the harpies.",
  },

  greetings = {
    { id = "g_hello", text = "Keep low and watch the branches. The harpies like to drop on you from above." },
    { id = "g_back", when = { metBefore = true }, text = "Back in the glade. Did you bring harpy belts, or only bruises?" },
    { id = "g_done", when = { questDone = TODO_QUEST("The Enchanted Glade") },
      text = "The nests are thinner since you came. The Oracle Tree is grateful, and so am I." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "WARRIOR" } },
      text = "Good; you look like you can handle yourself. Bloodfeathers fight in threes, so never let one get behind you." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_dd_kills", tags = { "news" }, when = { killed = { name = "Bloodfeather", min = 30 } }, text = "My Sentinels have stopped counting the Bloodfeather you have brought down, because the count had grown embarrassing for us. The glade is quieter than it has been since the harpies came." },
        { id = "h_default", key = true,
          text = "I am Sentinel Arynia Cloudsbreak. I was sent here with a few Sentinels to protect the Oracle Tree from the harpies that have nested all around this glade, and little by little we're pushing them back." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Enchanted Glade") },
          text = "The Bloodfeather harpies nest along the glade's edges. Bring me six of their belts as proof, and every one you bring is one less shrieking at the Oracle Tree's roots." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your eyes on the branches." },
        { id = "h_again2", text = "Ask, but stay alert." },
        { id = "h_again3", text = "Go on. I can listen and watch at once." },
      },
      choices = {
        { text = "What is the Oracle Tree?", next = "oracle" },
        { text = "What happened to the runner?", next = "runner" },
        { text = "Where did these harpies come from?", next = "harpies" },
        { text = "You can't have many Sentinels here.", next = "few" },
        { text = "The nests are thinner now. What next?", next = "after", when = { questDone = TODO_QUEST("The Enchanted Glade") } },
        { text = "I'd like to be a Sentinel one day.", next = "join", when = { race = "NightElf", gender = "female" } },
        { text = "I'll thin the nests.", next = "END" },
      },
    },

    oracle = {
      lines = { { id = "or_default", text = "An old and wise tree spirit, who sees further than most and sends word to Darnassus when it sees something worth telling. It can't move, and it can't fight, so it needs us." } },
      choices = {
        { text = "What does it see?", next = "oracle_sees" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oracle_sees = {
      lines = { { id = "os_default", text = "Weather before it comes, sickness in the roots, ships on the sea long before the lookouts spot them, or so the druids say. It speaks slowly, and only to those it trusts, which isn't me." } },
      choices = {
        { text = "Then why guard something that won't talk to you?", next = "oracle_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oracle_why = {
      lines = { { id = "ow_default", text = "Because I was told to, and because a forest that loses its eyes walks into every trap that's laid for it. I don't need it to like me to know it matters." } },
      choices = {
        { text = "Orders are orders. That's reason enough.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd want to know what I'm bleeding for.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    runner = {
      lines = { { id = "ru_default", text = "The Oracle Tree sent a runner to Darnassus with a report, and the harpies caught her on the road and tore her apart. We found her satchel, but not the report, and we still don't know what the Tree wanted to say." } },
      choices = {
        { text = "Then we make the harpies pay.", next = "BACK", reply = "They will, and Elune knows they have earned it. But do not let vengeance make you careless on that road.", fx = { align = { light = -1 } } },
        { text = "Protect the next runner. That matters more.", next = "BACK", reply = "It does, and you see more clearly than most of my Sentinels. Guard the next one well, and we will deal with the harpies after.", fx = { align = { light = 1 } } },
        { text = "Couldn't the Tree simply say it again?", next = "runner_again" },
        { text = "Something else.", next = "BACK" },
      },
    },
    runner_again = {
      lines = { { id = "ra_default", text = "It could, if it chose, but it's been silent since, and the druids think it's grieving in its own way. Trees don't forget a death under their branches the way we do." } },
      choices = {
        { text = "Is there no way to find the report?", next = "runner_search" },
        { text = "Something else.", next = "BACK" },
      },
    },
    runner_search = {
      lines = { { id = "rs_default", text = "If a harpy carried it off, it's lining a nest somewhere in this glade, chewed or soaked or both. If you find a scrap of parchment while you're about the nests, bring it to me before you read it." } },
      choices = { { text = "I'll keep an eye out. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    harpies = {
      lines = { { id = "ha_default", text = "From the mainland, I think, blown over on a storm or drawn by something we can't see. Whatever brought them, they like it here, and that worries me as much as their claws." } },
      choices = {
        { text = "How do they fight?", next = "harpies_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harpies_fight = {
      lines = { { id = "hf_default", text = "In threes, from above, and they go for the eyes and the throat. Bloodfeathers are cowards alone and vicious together, so break up a flock before it settles and they'll scatter screaming." } },
      choices = {
        { text = "Is there a leader among them?", next = "harpies_leader" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harpies_leader = {
      lines = { { id = "hl_default", text = "Their eldest females rule the flock, and they're larger and smarter and much harder to kill. Kill one and the rest go mad for a day, which is either very useful or very dangerous, depending on where you're standing." } },
      choices = { { text = "I'll pick my ground. Something else.", next = "BACK" } },
    },
    few = {
      lines = { { id = "fe_default", text = "Five, counting me, and two of those are still young enough to flinch. The best of us are in Ashenvale holding the line against the Warsong, and the glade gets what's left." } },
      choices = {
        { text = "The orcs are the real threat. Ashenvale comes first.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Home should come first. Bring some of them back.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    after = {
      lines = { { id = "af_default", text = "Now we hold what you've won, and I write to Darnassus asking for two more Sentinels, which they'll refuse. The harpies will come back in spring, but fewer, and you've bought the Oracle Tree some quiet." } },
      choices = { { text = "Glad to help. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    join = {
      lines = { { id = "jo_default", text = "Then go to Darnassus when you're ready and speak to the Sentinels on the Warrior's Terrace, and don't expect them to be gentle. Learn to stand a night watch without yawning first; that's harder than any glaive." } },
      choices = { { text = "I will. Something else.", next = "BACK", fx = { learn = { "sentinels" } } } },
    },
  },

  topics = {
    sentinels = { { id = "tp_sentinels", text = "We guard what the druids grow and the priestesses bless. Most of us are in Ashenvale now, and the rest are stretched thin." } },
    warsong = { { id = "tp_warsong", text = "Orcs cutting Ashenvale's trees for their war. They're the reason I have five Sentinels instead of fifteen." } },
    advice = { { id = "tp_ad", text = "Look up. Harpies, spiders and owlbeasts all come from above, and nobody looks up until it's too late." } },
    _none = { { id = "tp_none", text = "I don't know, and I haven't time to wonder. Ask in Darnassus." } },
  },
}

---------------------------------------------------------------------------
-- Laurna Morninglight (priest trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "laurna", id = TODO_NPC("Laurna Morninglight"), name = "Laurna Morninglight", title = "Priest Trainer",
  bible = "bibles/teldrassil_folk.md", role = "trainer", tier = "quest",
  communities = { "dolanaar" }, temper = { "warm", "earnest" }, values = { "devout", "kind" },
  notices = { "class" },

  impression = {
    first = "Laurna Morninglight trains Dolanaar's priests and would much rather be out tending the wounded than teaching. She sends her students to do the healing she can't leave to do herself.",
    third = "{name} met Laurna Morninglight, the priest trainer of Dolanaar.",
  },

  greetings = {
    { id = "g_hello", text = "Elune's blessing on you. Come in, come in, the moon's not up yet but the kettle is." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back, child of the Moon. How are your hands, steady?" },
    { id = "g_shaya", when = { questDone = TODO_QUEST("Garments of the Moon") },
      text = "Shaya came by to thank me, and I told her to thank you. She's back on her patrol already, the stubborn thing." },
  },

  notice = {
    { id = "n_pri", cat = "class", when = { class = "PRIEST" },
      text = "Shanda sent you down from Aldrassil, I can see it on you. She always sends me the gentle ones." },
  },

  start = "hello",
  nodes = {
    dd_deaths = {
      lines = {
        { id = "ddd_default", text = "Every time, Elune sends you back, and every time you come back a little less afraid. That is a gift, but it can become a carelessness if you let it, and I have buried Sentinels who mistook the one for the other." },
        { id = "ddd_ne", when = { race = "NightElf" }, text = "You have drifted as a wisp more often than most, I think, and found your way back to your body each time. That is Elune's mercy, child, and it can become a carelessness if you let it." },
      },
      choices = {
        { text = "I'll be more careful.", next = "BACK", fx = { affinity = 1 } },
        { text = "Fear of death never helped anyone fight.", next = "BACK", reply = "No, but a little of it has kept many alive. Think on it, at least." },
      },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_dd_deaths", when = { deaths = { min = 10 } }, text = "There is a stillness on you that the living don't usually carry, child, the kind that comes from walking back from the spirit healer too many times. Elune is patient, but you should learn to be careful." },
        { id = "h_default", key = true,
          text = "I am Laurna Morninglight, and I teach the priests of Elune who come down from Shadowglen. I'd rather be out on the roads with the Sentinels, but someone must train the next of us, and the Sisterhood chose me." },
        { id = "h_favor", when = { questActive = TODO_QUEST("In Favor of Elune") },
          text = "Shanda sent you. Good; then you're ready for your first real work, and for the garments that go with it." },
        { id = "h_garments", tags = { "news" }, when = { questActive = TODO_QUEST("Garments of the Moon") },
          text = "Sentinel Shaya is just south of Dolanaar, hurt on her patrol. Heal her, then grant her fortitude, and come back to me when you've done your duty to Elune." },
        { id = "h_sister", tags = { "news" }, when = { questActive = TODO_QUEST("The Sisterhood of Elune") },
          text = "Sister Aquinne awaits you in Darnassus. The Sisterhood has need of you, and I'm prouder than I can say that it's one of mine they've asked for." },
      },
      again = {
        { id = "h_again", text = "What else? The kettle's still warm." },
        { id = "h_again2", text = "Ask away, child." },
        { id = "h_again3", text = "Something more? Sit, sit, I'll pour while you think." },
      },
      choices = {
        { text = "I've died more often than I like to admit.", next = "dd_deaths", when = { deaths = { min = 10 } } },
        { text = "Teach me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What is the Sisterhood of Elune?", next = "sisterhood" },
        { text = "Who is Sentinel Shaya?", next = "shaya" },
        { text = "Why do you teach, if you'd rather heal?", next = "teach" },
        { text = "Can men serve Elune too?", next = "men", when = { gender = "male", class = "PRIEST" } },
        { text = "You always seem to have the kettle on.", next = "kettle" },
        { text = "Is a priest of the Light welcome here?", next = "light", when = { race = { "Human", "Dwarf" }, class = "PRIEST" } },
        { text = "Thank you, Laurna.", next = "END" },
      },
    },

    sisterhood = {
      lines = { { id = "si_default", text = "Before the Sundering, before the War of the Ancients, through the long vigil since, the Sisterhood has guided and healed our people. The High Priestess leads us now, as she led us at Hyjal, and every one of us would follow her into the dark." } },
      choices = {
        { text = "That's a long road to walk.", next = "BACK", fx = { learn = { "sisterhood_of_elune" } } },
        { text = "Tell me about the High Priestess.", next = "tyrande" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tyrande = {
      lines = { { id = "ty_default", text = "Tyrande Whisperwind has led us since before the Well of Eternity burst, and she's never once asked a priestess to stand where she wouldn't stand herself. I saw her at Hyjal with her bow drawn and the moon behind her, and I've never been afraid of the dark since." } },
      choices = {
        { text = "And Malfurion? Doesn't she miss him?", next = "tyrande_malf" },
        { text = "Something else.", next = "BACK", fx = { learn = { "tyrande" } } },
      },
    },
    tyrande_malf = {
      lines = { { id = "tm_default", text = "Every night, I think, though she'd never say so to the likes of me. He sleeps in the Dream while she keeps the city, and that's been their bargain for a very long time; it's not one I'd have the strength to make." } },
      choices = {
        { text = "Duty above love. That's the harder, better choice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "He should wake and stand beside her.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "malfurion" } } },
      },
    },
    shaya = {
      lines = { { id = "sh_default", text = "A young Sentinel who patrols the road south of town and refuses to come in when she's hurt, because she says a wound is no reason to leave a post. I send students to her because she won't come to me." } },
      choices = {
        { text = "Duty before comfort. She's right.", next = "BACK", reply = "She thinks so, and I admire her for it, even when it drives me to distraction. I only wish she would let me look at her arm.", fx = { align = { order = 1 } } },
        { text = "She should come in. Pride kills good soldiers.", next = "BACK", reply = "It does, and I have told her so many times. Perhaps she would listen to you.", fx = { align = { order = -1 } } },
        { text = "How does she keep getting hurt?", next = "shaya_hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaya_hurt = {
      lines = { { id = "shh_default", text = "The Gnarlpine, mostly, and the nightsabers that have turned mangy and cruel. The south road runs close to the furbolgs' dens, and they've grown bold enough to throw stones at Sentinels, which they never would have dared a year ago." } },
      choices = {
        { text = "What changed them?", next = "shaya_gnarl" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaya_gnarl = {
      lines = { { id = "sg_default", text = "Something they ate or drank, the druids think, though nobody's found it yet. Ask at the inn; Athridas Bearmantle has been watching the furbolgs closer than anyone." } },
      choices = { { text = "I'll ask him. Something else.", next = "BACK", fx = { learn = { "furbolgs" } } } },
    },
    teach = {
      lines = { { id = "te_default", text = "Because one healer can only be in one place, and a dozen healers I've trained can be in a dozen. It's a hard lesson for someone who'd rather do a thing than talk about doing it." } },
      choices = {
        { text = "Where would you go, if you could?", next = "teach_go" },
        { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    teach_go = {
      lines = { { id = "tg_default", text = "Ashenvale, to the Sentinel camps at Astranaar, where the wounded come in faster than the priestesses can see them. My students go there every season, and I pray for each of them by name until they write back." } },
      choices = { { text = "I'll write back. Something else.", next = "BACK", fx = { affinity = 1, learn = { "ashenvale" } } } },
    },
    men = {
      lines = { { id = "me_default", text = "Of course, though there have always been fewer of you, and the Sisterhood's name has never changed to suit. Elune hears a man's prayer as well as a woman's, whatever some of the old priestesses say." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kettle = {
      lines = { { id = "ke_default", text = "Always, because half my students come back from the Gnarlpine dens shaking, and a cup of moonberry tea does more for that than a prayer does. Don't tell Shanda I said so." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    light = {
      lines = { { id = "li_default", text = "Welcome, and needed, for wounds don't care which prayer closes them. I've no lessons for you in Elune's ways, but you may sit with my students, and I suspect they'll learn more from you than you will from them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "holy_light" } } } },
    },
  },

  topics = {
    sisterhood_of_elune = { { id = "tp_sisterhood", text = "The priestesses of the Moon. We heal, we guard and we keep the faith, and some of us make tea." } },
    tyrande = { { id = "tp_tyrande", text = "Our High Priestess, and the bravest soul I know. I'd follow her bow into any darkness you could name." } },
    advice = { { id = "tp_ad", text = "Heal the one in front of you first. The world can wait the length of a prayer." } },
    _none = { { id = "tp_none", text = "I don't know, child, but I'll pray you find someone who does." } },
  },
}

---------------------------------------------------------------------------
-- Jannok Breezesong (rogue trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "jannok", id = TODO_NPC("Jannok Breezesong"), name = "Jannok Breezesong", title = "Rogue Trainer",
  bible = "bibles/teldrassil_folk.md", role = "trainer", tier = "quest",
  communities = { "dolanaar" }, temper = { "jovial", "anxious" }, values = { "loving", "cunning" },
  notices = { "class" },

  impression = {
    first = "Jannok Breezesong trains Dolanaar's rogues between sighs. He is hopelessly in love with Syurna in Darnassus, who will not see him, and he seems to think that this is a perfectly normal way to live.",
    third = "{name} met Jannok Breezesong, Dolanaar's rogue trainer, who pines for Syurna in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Ah, a visitor. Forgive me, I was thinking about Syurna, which I'm told I do too often." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Have you been to Darnassus? Did you see Syurna?" },
    { id = "g_rose", when = { questDone = TODO_QUEST("The Apple Falls") },
      text = "You gave her the rose? What did she say? No, don't tell me, I can see it on your face, and it's all right." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue! Syurna only speaks to rogues, you know, so you might be my best hope yet." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Jannok Breezesong, and I teach rogues in Dolanaar when I'm not thinking of Syurna, the finest rogue in Darnassus. They say I'm lovestruck, and I suppose that's fair, given the paintings." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue, good, very good. I can teach you, and you can do me a small favour in Darnassus, since she won't talk to anyone who isn't a rogue." },
        { id = "h_apple", tags = { "news" }, when = { questActive = TODO_QUEST("The Apple Falls") },
          text = "You've got the rose? Keep it out of the sun, and don't forget to tell her it's from Jannok. Say it nicely, if you can." },
      },
      again = {
        { id = "h_again", text = "What else? Unless you want to hear about her eyes again." },
        { id = "h_again2", text = "Go on, I'm listening, mostly." },
        { id = "h_again3", text = "Sorry, where was I? Oh, you were asking me something. Go on." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Tell me about Syurna.", next = "syurna" },
        { text = "Paintings?", next = "paintings" },
        { text = "Have you ever actually spoken to her?", next = "spoken" },
        { text = "Why not go to Darnassus yourself?", next = "go" },
        { text = "How did someone like you become a rogue?", next = "rogue" },
        { text = "Is this how all elves go courting?", next = "court", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Good luck with that.", next = "END" },
      },
    },

    syurna = {
      lines = { { id = "sy_default", text = "She moves like a shadow that's learned to dance, and she trains the best rogues in the city, and she once looked straight through me as if I were a window. It was the best moment of my life." } },
      choices = {
        { text = "That doesn't sound like a good sign.", next = "sign" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sign = {
      lines = { { id = "si_default", text = "It's a sign she noticed me enough to ignore me, and that's a start. Love is patient, isn't it? I've got a few thousand years to wait." } },
      choices = {
        { text = "Then keep trying. Never give up on love.", next = "BACK", reply = "Thank you, friend, I knew you would understand! I have three new poems already, and one of them almost rhymes.", fx = { align = { order = -1 } } },
        { text = "She's said no. Respect it and move on.", next = "BACK", reply = "Perhaps you are right, though it is very hard to hear. I will think about it, after one more poem.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paintings = {
      lines = { { id = "pa_default", text = "A few. Thirty, perhaps, and some drawings, and a small statue that didn't come out well, so I keep it facing the wall. I don't eat much when I'm painting, and I paint a lot." } },
      choices = {
        { text = "Could I see one?", next = "paint_see" },
        { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    paint_see = {
      lines = { { id = "ps_default", text = "Oh, no, they're not ready, none of them are, and I'd only want to explain the brushwork. This one is her under the moonwell, though, if you squint, and that blue smudge is either her cloak or a nightsaber, I've never decided." } },
      choices = {
        { text = "And the statue facing the wall?", next = "paint_statue" },
        { text = "It's lovely. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    paint_statue = {
      lines = { { id = "pst_default", text = "Her face came out looking rather like Innkeeper Keldamyr, and I couldn't bear to break it, so it faces the wall and thinks about what it's done. Please don't mention it to Keldamyr." } },
      choices = { { text = "My lips are sealed. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    spoken = {
      lines = { { id = "sp_default", text = "Once, at length, about the weather, and she agreed with me that it was likely to rain. I've thought about that conversation every day since, and I'm fairly sure there was something more in it." } },
      choices = {
        { text = "I'm sure there was.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    go = {
      lines = { { id = "go_default", text = "I've walked to the gates of Darnassus four times, and four times I've turned round at the bridge. A rogue's courage is for dark corners, you see, and there's nothing dark about the way she looks at you." } },
      choices = {
        { text = "What are you afraid she'll say?", next = "go_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    go_fear = {
      lines = { { id = "gf_default", text = "Nothing, which would be worse than no. If I never ask, I can go on hoping for another thousand years, and that seems a fair bargain to a coward." } },
      choices = {
        { text = "Go and ask her. Hiding from it is beneath you.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then don't ask. Some hopes are kinder kept.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Someone like me? I'll take that kindly. I was the quietest child in Dolanaar, and the Sentinels found me useful for getting into the furbolgs' dens to count them, back when the Gnarlpine were friends." } },
      choices = {
        { text = "And now the Gnarlpine aren't friends.", next = "rogue_gnarl" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue_gnarl = {
      lines = { { id = "rg_default", text = "No, and I'd not go into those dens now without a blade in each hand. I send my students to Ban'ethil Barrow to practise moving quietly, and some of them come back telling me the furbolgs there have a look in their eyes I don't like." } },
      choices = { { text = "I'll watch myself. Something else.", next = "BACK", fx = { learn = { "furbolgs" } } } },
    },
    court = {
      lines = { { id = "co_default", text = "Not all of them, no, though my cousin once wrote a lady three hundred letters and married her in the end. I'm only on letter forty, so you can see there's every reason for hope." } },
      choices = { { text = "Every reason. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Never say what you feel to someone's face unless you're certain. That's a rogue's rule, and also, apparently, mine." } },
    furbolgs = { { id = "tp_furbolgs", text = "I used to count them for the Sentinels, sneaking about their dens. These days I'd count them from a good long way off." } },
    _none = { { id = "tp_none", text = "Hm? Sorry, I was thinking about something else. Someone else, really." } },
  },
}

---------------------------------------------------------------------------
-- Seriadne (stable master)
---------------------------------------------------------------------------
P:NPC {
  key = "seriadne", id = TODO_NPC("Seriadne"), name = "Seriadne", title = "Stable Master",
  bible = "bibles/teldrassil_folk.md", role = "stablemaster", tier = "service",
  communities = { "dolanaar" }, temper = { "cheerful", "gentle" }, values = { "kind", "patient" },
  notices = { "pet" },

  impression = {
    first = "Seriadne keeps the stables in Dolanaar and knows every animal by name, including the ones that only stay a night. She'd rather talk to your companion than to you.",
    third = "{name} met Seriadne, Dolanaar's stable master.",
  },

  greetings = {
    { id = "g_hello", text = "Hello, hello! And hello to whoever's with you, too." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Your companions ask after you, you know." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "Oh, {pet}! What a fine name. Did you choose it, or did it choose you?" },
  },

  start = "hello",
  nodes = {
    dd_sabers = {
      lines = {
        { id = "dds_default", text = "I know, and I know why. Some of them are sick and starving, and the Conservator would rather thin them than watch them waste away, but that doesn't mean I have to like it, and I don't." },
      },
      choices = {
        { text = "Next time I'll leave them be, if I can.", next = "BACK", reply = "Would you? Then I'll tell the sabers you said so, and they'll purr at you the next time you come by.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A beast that attacks me dies. That's the end of it.", next = "BACK", reply = "That's a hunter's answer, and a cold one. Go gently past my stalls, then, because these ones are mine.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_dd_sabers", when = { killed = { name = "Nightsaber", min = 20 } }, text = "You smell of nightsaber, friend, and not the tame sort. I know the wild ones in the hills have been thin and mean of late, but please tell me you took no joy in it." },
        { id = "h_dd_zenn", when = { questDone = TODO_QUEST("Zenn's Bidding") }, text = "Sentinel Kyra told me you gathered nightsaber claws for the satyr in the hills. My sabers can't know that, but I do, and it will take me a while to forget it." },
        { id = "h_default", key = true,
          text = "I'm Seriadne, and I keep the stables here in Dolanaar. Leave a companion with me and I'll feed it and brush it and tell it stories until you come back." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, and a companion with you, or soon to be! I'm Seriadne, and whatever you tame out there, I'll look after it here as if it were my own." },
      },
      again = {
        { id = "h_again", text = "Anything else? The sabers are napping, so we can talk." },
        { id = "h_again2", text = "What else?" },
        { id = "h_again3", text = "Go on, I've a brush in my hand but my ears are free." },
      },
      choices = {
        { text = "I've had to kill nightsabers out in the hills.", next = "dd_sabers", when = { killed = { name = "Nightsaber", min = 20 } } },
        { text = "I'd like to use the stables.", next = "BUSINESS" },
        { text = "What sort of stories do you tell them?", next = "stories" },
        { text = "Do the Gnarlpine trouble your animals?", next = "gnarlpine" },
        { text = "You seem to know every animal by name.", next = "names" },
        { text = "How should I look after my companion?", next = "care", when = { class = "HUNTER" } },
        { text = "Have you ever stabled a ram?", next = "rams", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Thank you.", next = "END" },
      },
    },
    stories = {
      lines = { { id = "st_default", text = "Old ones, about Cenarius and Aessina and the great spirit beasts who fought beside our people long ago. The wolves like the wolf stories best, and the bears pretend not to care which, which is very like a bear." } },
      choices = {
        { text = "Tell me one.", next = "story_one" },
        { text = "Something else.", next = "BACK" },
      },
    },
    story_one = {
      lines = { { id = "so_default", text = "All right, the boars' favourite. Agamaggan was the great boar of the Ancients, and when the demons came he charged straight into them and was cut down, and where his blood fell the thorny vines sprang up to guard the land he'd died for." } },
      choices = {
        { text = "That's a sad story for a boar.", next = "story_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    story_end = {
      lines = { { id = "se_default", text = "The boars don't think so. They think it's the bravest thing anyone ever did, and they sleep very soundly after it, so I suppose it depends on whether you're a boar." } },
      choices = {
        { text = "To die for your land is the best death there is.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Better to live and keep fighting.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnarlpine = {
      lines = { { id = "gn_default", text = "They didn't use to. The Gnarlpine were friends once, and now the animals smell them coming and hide in the back of the stalls. It breaks my heart a little every time." } },
      choices = {
        { text = "They may still be saved. Don't give up on them.", next = "BACK", reply = "I hope you are right, and so do the animals, I think. They still remember the Gnarlpine who were kind.", fx = { align = { light = 1 } } },
        { text = "Friends or not, they're a danger now.", next = "BACK", reply = "They are, and I have to keep the animals safe from them. But I will not stop hoping they come back to themselves.", fx = { align = { light = -1 } } },
        { text = "What do the animals smell on them?", next = "gn_smell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gn_smell = {
      lines = { { id = "gs_default", text = "Something sour and rotten, like fruit left too long in the sun, and it's worse on the ones from the barrow dens. My old saber Shalla won't go near the road south of town at all anymore." } },
      choices = {
        { text = "Have you told anyone?", next = "gn_told" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gn_told = {
      lines = { { id = "gt_default", text = "I told the druids, and they wrote it down very politely, and I told Athridas at the inn, who listened properly. If you're looking into the furbolgs, tell him the animals smell it too." } },
      choices = { { text = "I'll tell him. Something else.", next = "BACK", fx = { learn = { "furbolgs" } } } },
    },
    names = {
      lines = { { id = "na_default", text = "I do! Even the ones that only stay a night, because nobody likes to sleep in a strange place without someone saying their name. That saber over there is Moonpaw, and she's been waiting three weeks for her hunter to come back from Darkshore." } },
      choices = {
        { text = "Will they come back?", next = "names_wait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    names_wait = {
      lines = { { id = "nw_default", text = "Most do, and they're always sorry they were gone so long. The ones who don't, well, I keep them anyway, and nobody ever has to tell the animal why." } },
      choices = { { text = "That's kind of you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    care = {
      lines = { { id = "ca_default", text = "Feed it what it likes, not what's easiest to carry, and talk to it even when you've nothing to say. A companion that's spoken to fights for you, and one that's only ordered fights for itself." } },
      choices = {
        { text = "What do sabers like to eat?", next = "care_feed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    care_feed = {
      lines = { { id = "cf_default", text = "Meat, fresh as you can manage, and they'll turn their noses up at bread however hungry they are. Bears will eat anything, and so will boars, which makes them very easy to love and very hard to keep out of your pack." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    rams = {
      lines = { { id = "ra_default", text = "Once, a dwarf's, who'd brought it across on the boat from Auberdine, and it ate half my hay and butted the stable door until Moonpaw sat on it. I liked it very much, but I don't think it liked trees." } },
      choices = { { text = "Rams prefer mountains. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    furbolgs = { { id = "tp_furbolgs", text = "The Gnarlpine smell wrong lately, sour and rotten, and my animals hide when they come near the road." } },
    advice = { { id = "tp_ad", text = "Talk to your companion. It doesn't matter what you say, only that you say it." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that. Ask me about an animal instead!" } },
  },
}

---------------------------------------------------------------------------
-- Daryn Lightwind (Rut'theran)
---------------------------------------------------------------------------
P:NPC {
  key = "daryn", id = TODO_NPC("Daryn Lightwind"), name = "Daryn Lightwind", title = "Cenarion Lore Keeper",
  bible = "bibles/teldrassil_folk.md", role = "scholar", tier = "quest",
  communities = { "rutheran" }, temper = { "chatty", "precise" }, values = { "curious", "learned" },
  notices = { "class", "race" },

  impression = {
    first = "Daryn Lightwind keeps her books and her theories in Rut'theran Village and sends adventurers to every corner of Kalimdor to do the travelling she has no time for. She lends books reluctantly and talks about them freely.",
    third = "{name} met Daryn Lightwind, a historian in Rut'theran Village with an interest in everything from Feralas to giant turtles.",
  },

  greetings = {
    { id = "g_hello", text = "Oh, hello! Careful with that stack, it's in order, though I admit it doesn't look it." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Have you been somewhere interesting? Tell me everything." },
    { id = "g_book", when = { questDone = TODO_QUEST("Return to Troyas") },
      text = "You took my book to Feathermoon, and Troyas sent word he's treating it gently. You may borrow anything you like, within reason." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "PRIEST", "DRUID" } },
      text = "You've a reader's look about you. Have you read Feralas: A History? No one has, and that is exactly why I like it." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Do you know Greywhisker of the Explorers' League? We argue by letter about everything older than a thousand years, which is everything." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Daryn Lightwind, historian, and very busy, though always glad to talk. I study a great many things, and my latest fascination is the snapjaw turtles on the beaches of the Hinterlands, which I'll admit is a long way from Teldrassil." },
        { id = "h_feralas", tags = { "news" }, when = { questActive = TODO_QUEST("Feralas: A History") },
          text = "You want to borrow my book? For Troyas, at Feathermoon? Well, all right, but please take care of it, because it's the only copy I've ever seen." },
        { id = "h_borrower", tags = { "news" }, when = { questActive = TODO_QUEST("The Borrower") },
          text = "Take my letter to Curgle Cranklehop in Tanaris. She's made me a machine that captures a picture, a snapshot she calls it, and I want one of Gammerita, the great snapjaw." },
        { id = "h_starfall", tags = { "news" }, when = { questActive = TODO_QUEST("Starfall") },
          text = "Wynd Nightchaser spends most of his time at Starfall in Winterspring, and he knows the ruins there better than anyone. Tell him you're a student of mine, and he'll be kind to you." },
      },
      again = {
        { id = "h_again", text = "What else? I've three books open and no intention of closing any of them." },
        { id = "h_again2", text = "Ask! I love a question." },
      },
      choices = {
        { text = "Why turtles, of all things?", next = "turtles" },
        { text = "Why don't you travel yourself?", next = "travel" },
        { text = "What's in Feralas: A History?", next = "feralas" },
        { text = "What should I see in Winterspring?", next = "winterspring", when = { minLevel = 50 } },
        { text = "I'll let you read.", next = "END" },
      },
    },

    turtles = {
      lines = { { id = "tu_default", text = "Because they're old, and they remember things, in their way, longer than most of the people on this shore. A snapjaw as big as Gammerita has seen the beach change shape a dozen times, and I'd love to know what she thinks of it." } },
      choices = {
        { text = "Can a turtle really remember anything?", next = "turtle_mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    turtle_mind = {
      lines = { { id = "tm_default", text = "Not as we do, but she knows where the warm sand is and where the sharks wait, and she knew it before the humans built anything up there. That's a kind of history, even if it isn't written down." } },
      choices = {
        { text = "All life holds wisdom. That's worth studying.", next = "BACK", reply = "It is, and I am glad someone besides me thinks so. The turtle has seen more of the world than any of us.", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "History is what's written. The rest is guessing.", next = "BACK", reply = "Perhaps, but the turtle was there before anyone wrote anything. That seems worth guessing about.", fx = { align = { order = 1 } } },
      },
    },
    travel = {
      lines = { { id = "tr_default", text = "My studies keep me here, and my books don't travel well, and if I'm honest, I get seasick on the Moonspray just going to Auberdine. So I send people like you and read what they bring back." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    feralas = {
      lines = { { id = "fe_default", text = "The history of the ancient elven ruins there, from Dire Maul to the coast, written by someone who walked them long before the ogres moved in. Troyas at Feathermoon has wanted it for years, and I've wanted to keep it for just as long." } },
      choices = {
        { text = "Knowledge should be shared. Lend it freely.", next = "feralas_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feralas_stance = {
      lines = { { id = "fs_default", text = "Easy to say when it isn't your only copy. But you're right, I suppose, and Troyas will look after it, or I'll hear about it." } },
      choices = {
        { text = "Shared knowledge grows. Locked knowledge dies.", next = "BACK", reply = "It does, and you are right, though it still pains me to lend it. Troyas had better take good care of it.", fx = { align = { light = 1 } } },
        { text = "Keep it safe. Borrowers rarely return things.", next = "BACK", reply = "They do, and I will remind Troyas of that in every letter. Still, knowledge locked away does no one any good either.", fx = { align = { light = -1 } } },
      },
    },
    winterspring = {
      lines = { { id = "wi_default", text = "Starfall, and the old elven ruins in the snow, and Wynd Nightchaser, who'll tell you more than I could. It's a harsh land, but it holds secrets, and I haven't been able to go back for a very long time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}
