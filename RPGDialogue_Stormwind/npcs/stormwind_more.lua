-- More Stormwind City people the pack lacked: the Slaughtered Lamb's cellar (Demisette Cloyce,
-- Sandahl, Jalane Ayrole, Jarel Moor), the Cathedral (Katherine the Pure, Brother Cassius),
-- Old Town (Lord Tony Romano, Bryan Cross, Lieutenant Karter), the Trade District (Lina Stover),
-- the Dwarven District (Kathrum Axehand), the Mage Quarter (Darian Singh), and the Valley of
-- Heroes (Major Mattingly, Field Marshal Afrasiabi). Voice: bibles/stormwind_more.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local DIVINITY = TODO_QUEST("The Tome of Divinity")
local ONY_VICTORY = TODO_QUEST("Victory for the Alliance")
local ONY_CELEBRATE = TODO_QUEST("Celebrating Good Times")
local NEF = TODO_QUEST("The Lord of Blackrock")
local MASQUERADE = TODO_QUEST("The Great Masquerade")

-- Demisette Cloyce: eldest of the Slaughtered Lamb coven; warlock trainer; cold to outsiders.
P:NPC {
  key = "demisette_cloyce", id = TODO_NPC("Demisette Cloyce"), name = "Demisette Cloyce", title = "Warlock Trainer",
  bible = "bibles/stormwind_more.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "sharp", "proud" }, values = { "ambitious", "cunning" },
  notices = { "fel", "light", "weakness" },

  impression = {
    first = "Demisette Cloyce is the eldest of the coven under the Slaughtered Lamb, and she let me know it without saying so: she looked at me the way a jeweller looks at a stone she hasn't decided to buy.",
    third = "{name} met Demisette Cloyce, the eldest and most respected warlock of the Slaughtered Lamb's cellar.",
  },

  greetings = {
    { id = "g_default", text = "Speak, if you have something worth the breath; the candles down here are dear, and so is my patience." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Back again, and still in one piece. Good, for the weak ones rarely come back twice." },
    { id = "g_other", when = { ["not"] = { class = "WARLOCK" } }, text = "You've taken a wrong turn at the top of the stairs. The ale is above us, and so is the door." },
    { id = "g_back", when = { metBefore = true, class = "WARLOCK" }, text = "I remember you. I remember everyone who comes down those stairs, which is a thing worth remembering yourself." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8, class = "WARLOCK" }, text = "You've grown stronger since you last stood here, and nothing has eaten you yet. I'll allow myself to be pleased." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Word travels down stairs as easily as up them, and the word is that you've made enemies. Make them carefully." },
  },

  notice = {
    { id = "n_paladin", cat = "light", when = { class = "PALADIN" }, place = "before",
      text = "You carry the Cathedral's stink on your armour, paladin, all incense and certainty. Say what you came to say, and then take it back up the stairs." },
    { id = "n_lock_low", cat = "weakness", when = { class = "WARLOCK", maxLevel = 15 }, place = "before",
      text = "Your hands are shaking, child, and the imp can feel it even if you can't. A demon that smells fear starts to bargain, so steady them before you speak to me." },
    { id = "n_lock_high", cat = "fel", when = { class = "WARLOCK", minLevel = 50 }, place = "after",
      text = "There's a weight on you now that I last felt on Gakin, in his better years. Don't let it make you careless; it made him careless, once." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "I am Demisette Cloyce, and I have taught in this cellar since before most of the coven could hold a candle steady. If you mean to learn, then learn, and if you mean to gawk, go and gawk at the fountain." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "Another student of the dark, come to the oldest teacher in the cellar. Good. The young ones run to Gakin for demons and to Ursula for gossip, and they come to me when they want to survive." },
        { id = "h_other", when = { ["not"] = { class = "WARLOCK" } }, text = "The darkness does not embrace you, and I have no lessons for those it passes over. Still, you've come down a long flight of stairs, so ask your question before you climb back up." },
        { id = "h_cellar", when = { origin = "human_lamb_cellar" }, text = "The curious one, who came down the stairs once to look and kept on coming. I've had my eye on you since the first night, whether you knew it or not." },
      },
      again = {
        { id = "h_again", text = "Something more? Be quick about it." },
        { id = "h_again2", text = "Go on. The candles are burning either way." },
        { id = "h_again3", text = "Ask, then. I'll decide whether it's worth answering." },
      },
      choices = {
        { text = "They say you're the eldest of the coven.", next = "elder" },
        { text = "What happens to the weak, down here?", next = "weak" },
        { text = "How does a coven stay hidden under a tavern?", next = "hidden" },
        { text = "Tell me about Gakin and Ursula.", next = "peers" },
        { text = "What should I be mastering next?", next = "training", when = { class = "WARLOCK" } },
        { text = "I came down once to look. I kept coming back.", next = "xcellar", when = { origin = "human_lamb_cellar" } },
        { text = "I'm no warlock. I only wanted to see.", next = "xoutsider", when = { ["not"] = { class = "WARLOCK" } } },
        { text = "The Light will find this cellar one day.", next = "xpal", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Mages and warlocks aren't so different, surely.", next = "xmage", when = { class = "MAGE" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "I'll leave you to the dark.", next = "END" },
      },
    },

    elder = {
      lines = {
        { id = "e_default", text = "Eldest, and the most respected, which is not the same as the most loved. I've buried three rivals and outlived two masters, and I did it by never once believing I was safe." },
      },
      choices = {
        { text = "How long have you been teaching here?", next = "elder_old" },
        { text = "Never safe sounds like a miserable way to live.", next = "elder_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elder_old = {
      lines = {
        { id = "eo_default", text = "Since the orcs still had their warlocks, and every one of us down here knew what the Horde's dark magic had done to their own world. We studied it so we'd never be caught as blind as Stormwind was when the Dark Portal opened." },
      },
      choices = {
        { text = "You learned from the enemy's ruin.", next = "elder_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elder_fear = {
      big = true,
      lines = {
        { id = "ef_default", text = "Miserable? It's the only way to live with a demon on a leash. The day you think you own the thing is the day it starts to own you, and I've watched it happen to better students than you." },
      },
      choices = {
        { text = "Then the price is too high. Some doors stay shut.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Power always costs. I'll pay it with my eyes open.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    weak = {
      lines = {
        { id = "w_default", text = "The arcane only corrupts those who are weak, and the fel is far less patient than the arcane. A weak warlock lasts a season before his own servant tears out his throat, and I've stopped mourning them." },
        { id = "w_lock", when = { class = "WARLOCK" }, text = "They die, {class}, or worse, they live and serve. Keep up your training or you may find yourself on the wrong side of the summoning circle." },
      },
      choices = {
        { text = "You speak as if you've seen it.", next = "weak_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weak_who = {
      lines = {
        { id = "ww_default", text = "A young man named in no book you'll find, who thought his voidwalker was fond of him. We burned what was left in the furnace upstairs, and Jarel, the barman, has never once asked what we were burning." },
      },
      choices = {
        { text = "That's cruel, to let a student walk into that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A hard lesson, but the cellar's stronger for it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Jarel knows more than he lets on, then.", next = "BACK" },
      },
    },

    hidden = {
      lines = {
        { id = "hd_default", text = "We don't stay hidden, not really. Everyone in the Mage Quarter knows what goes on below the Lamb, and the city has decided it would rather have its warlocks where it can find them." },
      },
      choices = {
        { text = "Why would Stormwind allow it?", next = "hidden_city" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hidden_city = {
      lines = {
        { id = "hc_default", text = "Because the Horde had warlocks, and the Scourge has necromancers, and someone ought to know how such things are done. The Crown doesn't thank us, but it doesn't send the guard down these stairs either, and we keep our end of that silence." },
      },
      choices = {
        { text = "The city's right. Better to know the enemy's tools.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A coven shouldn't need the Crown's blessing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    peers = {
      lines = {
        { id = "p_default", text = "Gakin the Darkbinder handles the binding of new servants, and he's very good at it, which he will tell you. Ursula Deline teaches beside me and hears every whisper in the cellar, which she will not tell you." },
      },
      choices = {
        { text = "Gakin seems proud of his work.", next = "peers_gakin" },
        { text = "What does Ursula hear?", next = "peers_ursula" },
        { text = "Something else.", next = "BACK" },
      },
    },
    peers_gakin = {
      lines = {
        { id = "pg_default", text = "Proud, and he has earned it, though pride is how he lost two fingers' worth of feeling in his left hand. He sends the young ones out to fetch things for their bindings and calls it character, and I call it sensible." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    peers_ursula = {
      lines = {
        { id = "pu_default", text = "Everything, eventually, and she sells none of it, and that silence has kept her breathing longer than any ward. If you ever want to know who in the cellar has been careless, ask Ursula, and bring something better than coin." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    training = {
      lines = {
        { id = "t_default", text = "Your servants first, and your own will second, though most of you get it backwards. A warlock who can't hold an imp in line will never hold a succubus, and a warlock who can't hold a succubus had better not try anything larger." },
        { id = "t_high", when = { minLevel = 40 }, text = "You're ready for a steed of your own, if you've the gold for the ritual, and you'll ride it out of the city with half of Stormwind making the sign of the Light behind you. Get used to that." },
      },
      choices = {
        { text = "Tell me more about the servants.", next = "training_pet" },
        { text = "What lies beyond the felsteed?", next = "training_steed", when = { minLevel = 50 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    training_pet = {
      lines = {
        { id = "tp_default", text = "Every demon you bind is a bargain, whatever Gakin calls it, and each one is looking for the clause you forgot. Feed them what they're owed, never more, and never let them see you tired." },
      },
      choices = {
        { text = "I treat mine as tools, nothing more.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Mine respect me. That's worth more than chains.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    training_steed = {
      lines = {
        { id = "ts_default", text = "There are older steeds than the felsteed, bound in older fire, and the ones who know how to call them aren't in this cellar. I'll say only that the Burning Steppes are not empty of warlocks, and that some of them would trade with one of ours." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    xcellar = {
      lines = {
        { id = "xc_default", text = "Curiosity brought you down, and appetite kept you here, and there's no shame in either down here. Tell me plainly, though: do you go up those stairs at night and pretend you're someone else?" },
      },
      choices = {
        { text = "Yes. Upstairs I'm just another face.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "No. I don't hide what I am.", next = "BACK", fx = { align = { honor = 1 } } },
      },
    },
    xoutsider = {
      lines = {
        { id = "xo_default", text = "Then you've seen it: candles, a cellar and an old woman who would like you gone. Tell the Mage Quarter whatever you like about us, for they've heard worse and believed most of it." },
      },
      choices = {
        { text = "I'll keep what I saw to myself.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I think the guard should know about this.", next = "END", fx = { affinity = -2, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpal = {
      lines = {
        { id = "xp_default", text = "It found Lordaeron, didn't it, and Lordaeron's paladins with it, and none of them knew how to fight what came out of the plague. When the Light fails you again, and it will, you'll be glad someone down here kept notes." },
      },
      choices = {
        { text = "The Light didn't fail Lordaeron. Men did.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Perhaps. I'd rather know your notes than burn them.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    xmage = {
      lines = {
        { id = "xm_default", text = "Not so different, no, though your masters upstairs would choke on hearing it. You borrow power from the world and we borrow it from things beyond it, and both of us pay interest sooner or later." },
      },
      choices = {
        { text = "The arcane is ours to shape. Demons aren't.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Borrowed power is power all the same.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm old enough to remember when the orcs' warlocks first came through the Portal, and wise enough to have studied them since.", next = "elder" } },
    advice = { { id = "tp_ad", text = "Never let your servant see you tired. Everything else is detail." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't care to. Ask someone who still finds the world interesting." } },
  },
}

-- Sandahl: warlock trainer in the Slaughtered Lamb's cellar; quiet, exacting, interested in souls.
P:NPC {
  key = "sandahl", id = TODO_NPC("Sandahl"), name = "Sandahl", title = "Warlock Trainer",
  bible = "bibles/stormwind_more.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "calm", "sharp" }, values = { "cunning", "careful" },
  notices = { "fel", "souls" },

  impression = {
    first = "Sandahl teaches warlocks in the cellar under the Slaughtered Lamb, and he speaks so softly that I leaned in to hear him, which I suspect was the point. He weighs every word as though it cost him a soul shard.",
    third = "{name} met Sandahl, a soft-spoken and exacting warlock trainer in the Slaughtered Lamb's cellar.",
  },

  greetings = {
    { id = "g_default", text = "Lower your voice, please; sound carries down here, and so do names." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Ah, a student. Come closer to the light, such as it is, and let me see how far you've come." },
    { id = "g_other", when = { ["not"] = { class = "WARLOCK" } }, text = "You're not one of ours, which means you're either lost or very curious, and curiosity is the more dangerous of the two." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Sit, if you like; I'll be counting shards while you talk, so don't take offence." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear you told someone upstairs a lie and they believed it. Well done, though you might try not to be caught in the telling of it." },
  },

  notice = {
    { id = "n_shards", cat = "souls", when = { class = "WARLOCK", minLevel = 20 }, place = "after",
      text = "You're carrying a good many shards, I think, by the way your pack hangs. Don't let them rattle together; the ones inside don't care for it." },
    { id = "n_gnome", cat = "fel", when = { race = "Gnome", class = "WARLOCK" }, place = "before",
      text = "A gnome warlock is still a rare sight in this cellar, and your people have a way of treating demons like broken machines. That works, I'm told, right up until it doesn't." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "I am Sandahl, and I teach here, beneath the Slaughtered Lamb, when the students are worth teaching. The arcane only corrupts those who are weak, and I'd ask you to keep that in mind while we speak." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "Sandahl, and you know why you've come down. Keep up with your training, {class}, or you'll find yourself in the fate you've been warned of, and I'm too old to be sweeping a student off these flagstones." },
        { id = "h_low", when = { class = "WARLOCK", maxLevel = 12 }, text = "Gakin sent you, I expect, or Ursula, and they both forgot to tell you to stand up straight. A demon reads posture before it reads anything else, so straighten your back and we'll begin." },
      },
      again = {
        { id = "h_again", text = "Go on. Softly." },
        { id = "h_again2", text = "Something else? I'm still counting." },
        { id = "h_again3", text = "Ask. I'll answer what I can say aloud." },
      },
      choices = {
        { text = "What are soul shards, really?", next = "shards" },
        { text = "Which curses do you favour?", next = "curses" },
        { text = "You and Demisette don't seem close.", next = "demisette" },
        { text = "Where does fel power come from?", next = "portal" },
        { text = "Why teach at all, if most students fail?", next = "why" },
        { text = "I'm a gnome, and I treat my imp like a machine.", next = "xgnome", when = { race = "Gnome", class = "WARLOCK" } },
        { text = "I lost my home to the plague. That's why I'm here.", next = "xrefugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "You trade in souls. How do you sleep?", next = "xpriest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "I'll go.", next = "END" },
      },
    },

    shards = {
      lines = {
        { id = "s_default", text = "A piece of something's life, pulled out as it dies and pressed into a stone small enough to carry. Demons are bound with them and healthstones are made with them, and people upstairs would rather not know any more than that." },
      },
      choices = {
        { text = "How is it done?", next = "shards_how" },
        { text = "Pulling out a soul sounds like murder twice.", next = "shards_use" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shards_how = {
      lines = {
        { id = "sh_default", text = "You drain the creature as it falls, and the shadow takes what's left and holds it for you. It's quicker to do than to explain, and it's quicker still if you don't stop to think about it." },
      },
      choices = {
        { text = "That sounds like advice you've given before.", next = "shards_use" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shards_use = {
      big = true,
      lines = {
        { id = "su_default", text = "I've heard that before, usually from priests, and once from a student who changed her mind very quickly once she'd seen a Defias cutthroat up close. Whatever you take was going to the grave anyway, and the grave does nothing useful with it." },
      },
      choices = {
        { text = "Some things should go to the grave whole.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Waste not. The dead don't need it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    curses = {
      lines = {
        { id = "c_default", text = "The slow ones, always, for they work while you're busy with something else. A good curse is like a debt that grows while its owner sleeps, and it's the shape of all our best work." },
        { id = "c_lock", when = { class = "WARLOCK", minLevel = 20 }, text = "You've been leaning on Shadow Bolt, I can tell, because the young ones always do. Learn to let your curses do the work and you'll last twice as long against anything with a sword." },
      },
      choices = {
        { text = "Which one's your favourite?", next = "curses_which" },
        { text = "Something else.", next = "BACK" },
      },
    },
    curses_which = {
      lines = {
        { id = "cw_default", text = "Curse of Agony, for its honesty: it hurts a little, then far worse, and there's nothing the victim can do but wait. I find there's a lesson in that for most people, not only my enemies." },
      },
      choices = {
        { text = "A quick, clean kill is the better way.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A slow death teaches the onlookers too.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    demisette = {
      lines = {
        { id = "d_default", text = "Demisette is the eldest of us and I respect her for it, which is a different thing from agreeing with her. She teaches students to fear their demons, and I teach them to understand theirs, and the cellar is big enough for both, most nights." },
      },
      choices = {
        { text = "Which way is right?", next = "demisette_rival" },
        { text = "Something else.", next = "BACK" },
      },
    },
    demisette_rival = {
      lines = {
        { id = "dr_default", text = "Hers keeps more students alive, and mine makes the ones who live more useful, and I've never decided which matters more. Ask her the same question; she'll answer quicker than I did, and with less doubt." },
      },
      choices = {
        { text = "Fear keeps you alive. She's right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Understanding beats fear. You're right.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    portal = {
      lines = {
        { id = "pt_default", text = "From the Twisting Nether, beyond the world, where the demons live and the Burning Legion musters. The orcs drank it before they ever came to Azeroth, and you can still feel it seeping out of the Dark Portal's ruins in the Blasted Lands." },
      },
      choices = {
        { text = "You've been to the Blasted Lands?", next = "portal_nether" },
        { text = "Something else.", next = "BACK" },
      },
    },
    portal_nether = {
      lines = {
        { id = "pn_default", text = "Once, when I was young and stupid, and the soldiers at Nethergarde Keep very nearly hanged me. The air there tastes of iron and something sweeter, and I'll admit I've wanted to go back every year since." },
      },
      choices = {
        { text = "The orcs drank it, you said. What did it do?", next = "portal_orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    portal_orcs = {
      lines = {
        { id = "po_default", text = "Turned a people of shamans into a horde of butchers, and it's still in the blood of the orcs who survived, by all accounts. I keep that in mind whenever a student tells me he can stop whenever he likes." },
      },
      choices = {
        { text = "That's a warning you should give every student.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The orcs were weak. We won't make their mistakes.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wy_default", text = "Because the ones who succeed are worth the ones who don't, and because someone will teach them whether I do or not. Better a teacher in a Stormwind cellar than some Shadow Council fool in a cave with a book he can't read." },
      },
      choices = {
        { text = "Then you're doing the kingdom a service.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You're doing it for the power. Admit it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What makes a student worth it?", next = "why_students" },
        { text = "The Shadow Council? Here, in Stormwind's lands?", next = "why_council" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_students = {
      lines = {
        { id = "ws_default", text = "Patience, mostly, and a dislike of being told what to do, held in the right balance. The bright ones burn out and the obedient ones get eaten, and the ones I keep are the ones who listen carefully and then do as they please." },
        { id = "ws_lock", when = { class = "WARLOCK", minLevel = 30 }, text = "You'll do, I think, if you don't mind my saying so. You've lasted long enough that the demons have started to take you seriously, which is the first real examination." },
      },
      choices = {
        { text = "And the ones who fail?", next = "weak_sandahl" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weak_sandahl = {
      lines = {
        { id = "wk_default", text = "They go home to their farms, if they're lucky, and they don't come back down the stairs. The unlucky ones Demisette will tell you about, at length, because she likes to frighten the new ones." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    why_council = {
      lines = {
        { id = "wc_default", text = "Its scraps, at least: cultists in Elwynn's caves and the hills of Duskwood, reading pages they stole from orcs who stole them from demons. Each cultist thinks he's the first to find the book, and they all make the same mistake on the same page." },
      },
      choices = {
        { text = "Then they should be hunted down.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them blunder. They'll eat each other.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xgnome = {
      lines = {
        { id = "xg_default", text = "Then you've found a way to love the mechanism and not the creature, which is safer than most. Only remember that a machine doesn't remember the things you did to it, and an imp remembers everything." },
      },
      choices = {
        { text = "I'll keep better records than my imp does.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrefugee = {
      lines = {
        { id = "xr_default", text = "Then you know what the Scourge does to a soul, and you've come to learn how to do it back. That isn't noble, but I understand it better than most reasons I'm given." },
      },
      choices = {
        { text = "It isn't noble. It's justice, and I'll take it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll use it to protect people, not for revenge.", next = "BACK", fx = { align = { honor = 1 } } },
      },
    },
    xpriest = {
      lines = {
        { id = "xp_default", text = "Very well, thank you, and with a clear conscience, for I've never taken a soul that wasn't already leaving. Your Cathedral raises the dead in the Light's name; we only keep what's left over." },
      },
      choices = {
        { text = "There's no comparison. We restore; you steal.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fair. The line is thinner than we admit.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've taught in this cellar a long while, and studied in darker rooms than this one before that. That's as much of my life as I give to strangers." } },
    advice = { { id = "tp_ad", text = "Let the curse work. Don't stand there admiring it." } },
    _none = { { id = "tp_none", text = "I don't know that, and I don't like to guess aloud. Guesses carry, down here." } },
  },
}

-- Jalane Ayrole: Shadoweave tailoring trainer in the Slaughtered Lamb's cellar.
P:NPC {
  key = "jalane_ayrole", id = TODO_NPC("Jalane Ayrole"), name = "Jalane Ayrole", title = "Shadoweave Tailoring Trainer",
  bible = "bibles/stormwind_more.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "calm", "dry" }, values = { "craft", "cunning" },
  notices = { "cloth", "shadow" },

  impression = {
    first = "Jalane Ayrole sews in the cellar of the Slaughtered Lamb by one candle, and the cloth on her table seems to drink the light. She spoke of shadow the way other tailors speak of silk.",
    third = "{name} met Jalane Ayrole, who teaches the weaving of Shadoweave cloth beneath the Slaughtered Lamb.",
  },

  greetings = {
    { id = "g_default", text = "Mind the bolt by your foot; it doesn't like to be trodden on, and neither do I." },
    { id = "g_tailor", when = { profession = { name = "Tailoring", min = 200 } }, text = "A tailor with steady hands, come down at last. Sit, and I'll show you what the shadow does to a thread." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and you've found your way in the dark without a lantern. You're learning." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night upstairs, is it? It's always night down here, which is very good for the work." },
  },

  notice = {
    { id = "n_shadowweave", cat = "cloth", when = { profession = { name = "Tailoring", min = 150 } }, place = "after",
      text = "Your stitching's tight and even; I can see it on your own sleeves. Most tailors who find their way down here sew like they're mending sacks." },
    { id = "n_priest", cat = "shadow", when = { class = "PRIEST" }, place = "before",
      text = "A priest, and you didn't flinch at the stairs. There are priests of your order who wear my robes under their vestments, and you'd be surprised which ones." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "Between the light and the dark, there is shadow, and those shadows have powers you have yet to see. I'm Jalane Ayrole, and I teach tailors how to weave them into cloth." },
        { id = "h_tailor", when = { profession = { name = "Tailoring", min = 200 } }, text = "You've the hands for it now, I think. Shadoweave is unforgiving, and it will unpick itself out of spite if you rush a single row, but there's no finer cloth for those who live in the shade." },
        { id = "h_none", when = { ["not"] = { profession = { name = "Tailoring" } } }, text = "Jalane Ayrole. You're no tailor, by your hands, so you've come down for the warlocks or the gossip, and I've a little of the second to spare." },
      },
      again = {
        { id = "h_again", text = "Something else? My needle's waiting." },
        { id = "h_again2", text = "Ask. The shadow's patient, and so am I." },
      },
      choices = {
        { text = "What do you mean, between the light and the dark?", next = "shadow" },
        { text = "What is Shadoweave, exactly?", next = "weave" },
        { text = "Who buys cloth like that?", next = "buyers" },
        { text = "Why sew down here, with the warlocks?", next = "coven" },
        { text = "What do the tailors upstairs think of you?", next = "upstairs" },
        { text = "I'm a tailor. What would it take to learn?", next = "xtailor", when = { profession = { name = "Tailoring", min = 1 } } },
        { text = "I walk in shadow too. I'm a priest.", next = "xpriest", when = { class = "PRIEST" } },
        { text = "I'm a warlock. Would your robes suit me?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is there more to the craft than Shadoweave?", next = "craft" },
        { text = "Show me what you teach.", next = "BUSINESS" },
        { text = "I'll let you work.", next = "END" },
      },
    },

    shadow = {
      lines = {
        { id = "sh_default", text = "The Cathedral will tell you there's only the Light and whatever opposes it, and the warlocks will tell you there's only power. I think there's a third thing, the shade a lamp throws, and it's neither good nor wicked, only useful." },
      },
      choices = {
        { text = "So you think the shadow is neutral?", next = "shadow_between" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadow_between = {
      big = true,
      lines = {
        { id = "sb_default", text = "As neutral as a knife, which is to say it depends on whose hand it's in. A shadow priest wears my robes to heal as often as to harm, and a warlock wears them because he likes how they hang." },
      },
      choices = {
        { text = "Nothing that drinks the light can be neutral.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You're right. It's the hand, not the cloth.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    weave = {
      lines = {
        { id = "w_default", text = "Ordinary cloth, steeped and woven with a little shadow caught in every thread, so the garment holds it the way a sponge holds water. The robe, the pants, the gloves, the shoulders and the boots, if you've the patience for all five." },
      },
      choices = {
        { text = "How do you catch shadow in a thread?", next = "weave_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weave_how = {
      lines = {
        { id = "wh_default", text = "With the right materials and a room no one walks through, and I'll teach the rest to a tailor who can pay for it. I'll tell you this much for free: it won't take in a room with a window, and that's why I'm in a cellar." },
      },
      choices = {
        { text = "I thought it was because of the company.", next = "coven" },
        { text = "What does it do for whoever wears it?", next = "weave_power" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weave_power = {
      lines = {
        { id = "wp_default", text = "It lends a little weight to every shadow spell they cast, the way a good hilt lends weight to a blow. The warlocks swear by it, and the priests swear at it, usually while wearing it." },
        { id = "wp_lock", when = { class = { "WARLOCK", "PRIEST" } }, text = "You'd feel it in your first Shadow Bolt or your first Mind Blast, {class}: the spell comes out of you a little darker and a little easier, as if the cloth were pushing it along." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    buyers = {
      lines = {
        { id = "b_default", text = "Warlocks, mostly, who like the look of it as much as what it does for their spells, and priests who'd rather not say where their robes came from. Now and then a mage buys a pair of gloves and pretends it was for a friend." },
      },
      choices = {
        { text = "Which priests?", next = "buyers_priests" },
        { text = "Do the warlocks ever try to cheat you?", next = "buyers_cheat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_priests = {
      lines = {
        { id = "bp_default", text = "Ones who've walked the shadow and come back, and ones from Ironforge and the Cathedral both, and none of them would thank me for a name. They pay for my silence as much as my stitching, and they get both." },
      },
      choices = {
        { text = "Discretion's worth paying for. Keep it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Secrets in the Cathedral fester. They should be told.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    buyers_cheat = {
      lines = {
        { id = "bc_default", text = "Once, a young man who thought an imp would frighten me into a discount. I told Demisette, and he paid twice the price the next morning, with a very polite note and a look on his face I still think about fondly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    craft = {
      lines = {
        { id = "cr_default", text = "There's always more. Runecloth from the north, where the Scourge has left nothing but bandits and bolts of it, and felcloth from the satyrs in Felwood, which I've handled twice and won't touch a third time." },
      },
      choices = {
        { text = "Why won't you touch felcloth?", next = "craft_fel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_fel = {
      lines = {
        { id = "cf_default", text = "Shadow is quiet, and fel is not; it hums against your fingers like something hungry, and the thread wants to go its own way. Some of my old pupils work it gladly, and I wish them luck and very clean hands." },
      },
      choices = {
        { text = "Fel's too far. You're right to refuse it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Cloth is cloth. A master works whatever comes.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    coven = {
      lines = {
        { id = "c_default", text = "The warlocks are good customers and quieter neighbours than the drinkers upstairs; they don't drop crumbs on the cloth and they never ask for credit. Demisette tolerates me, Gakin flirts badly, and Sandahl pays on time." },
      },
      choices = {
        { text = "Do you share their craft as well?", next = "coven_craft" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coven_craft = {
      lines = {
        { id = "cc_default", text = "No, and I've never wanted to. I make the robe and they decide what to do inside it, and I sleep very well knowing which half of that bargain is mine." },
      },
      choices = {
        { text = "You sell to them. That's sharing their craft.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A tailor's not to blame for the wearer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    upstairs = {
      lines = {
        { id = "u_default", text = "Duncan Cullen pretends I don't exist, and the Schneiders send me their best students and pretend they didn't. Every tailor in Stormwind gets curious once they've mastered mageweave, and the curious ones come down here." },
      },
      choices = {
        { text = "So you take their best pupils.", next = "upstairs_pupils" },
        { text = "Something else.", next = "BACK" },
      },
    },
    upstairs_pupils = {
      lines = {
        { id = "up_default", text = "They come to me, which isn't the same as taking them. I've never once climbed those stairs to poach anyone, and I've never once had to." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    xtailor = {
      lines = {
        { id = "xt_default", text = "Skill first, and a good deal of it; I'll not waste shadow on hands that can't hold a straight seam. Come back when the Schneiders have taught you everything they know, and then you'll be ready for what they don't." },
        { id = "xt_high", when = { profession = { name = "Tailoring", min = 210 } }, text = "You're ready now, or near enough. Shadoweave first, the pants, and then the robe, and then we'll see if you have the patience for the rest." },
      },
      choices = {
        { text = "I'll learn it properly, every pattern.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      lines = {
        { id = "xp_default", text = "Then you'll understand my work better than any warlock does, for you've felt both sides of the lamp. Does your order still frown on it, or have they learned to look the other way like the rest of the city?" },
      },
      choices = {
        { text = "They frown, and they're right to.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "They look away. I don't wait for permission.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xlock = {
      lines = {
        { id = "xl_default", text = "They'd suit you very well, and they'd suit Gakin's opinion of you better still; he judges students by their sleeves. Bring me a tailor who'll sew for you, or learn it yourself, and keep the robe out of your felhunter's reach." },
      },
      choices = {
        { text = "I'll learn to sew it myself.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I learned to sew upstairs like everyone else, and then I learned the rest down here. Which half do you want to hear about?", next = "upstairs" } },
    advice = { { id = "tp_ad", text = "Never rush a row, because cloth remembers haste and shadoweave never forgives it." } },
    _none = { { id = "tp_none", text = "That's not woven into anything I know. Try someone with a window." } },
  },
}

-- Jarel Moor: bartender of the Slaughtered Lamb; knows exactly what's under his floor.
P:NPC {
  key = "jarel_moor", id = TODO_NPC("Jarel Moor"), name = "Jarel Moor", title = "Bartender", gender = "male",
  bible = "bibles/stormwind_more.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "steady", "dry" }, values = { "discreet", "practical" },
  notices = { "drink", "cellar", "class" },

  impression = {
    first = "Jarel Moor tends bar at the Slaughtered Lamb, polishes the same cup for a very long time, and told me twice to stay away from the shadows, as if that were a sensible thing to say in a tavern with a warlock cellar under it.",
    third = "{name} met Jarel Moor, bartender of the Slaughtered Lamb in Stormwind's Mage Quarter.",
  },

  greetings = {
    { id = "g_default", text = "What'll it be? And stay away from the shadows, friend, if you know what's good for you." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Same as last time, or are you feeling brave?" },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Going down? Wipe your feet on the way back up; whatever's on the cellar floor, I don't want it on mine." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late for a drink, but not late for this place. Pull up a stool and keep your back to the wall." },
    { id = "g_fl_dry", when = { flirt = true, chance = 0.4 },
      text = "Evening. I'd tell you to stay away from the shadows, but I suspect the shadows would be on their best behaviour around you." },
    { id = "g_fl_back", when = { flirt = true, npcFlagBefore = "fl_warm" }, cooldown = "3d",
      text = "You came back. I've been polishing your cup on the off chance, and I'll deny that if anyone in this room asks." },
    { id = "g_fl_cool", when = { flirt = true, npcFlagBefore = "fl_cool" }, once = true,
      text = "Evening, friend. Same as before, and no speeches from me this time; you have a bartender's word on it, for what that's worth." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Heard your name spoken kindly across the Quarter. That's rarer in here than an honest dice game." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true }, place = "replace",
      text = "You've had enough, friend, and I say that as a man who makes his living from the opposite. Sit a while and let the floor stop moving before you try those stairs." },
    { id = "n_cellar", cat = "cellar", when = { origin = "human_lamb_cellar" }, place = "before",
      text = "I know your face from the stairs, and I've never once said so to anyone. I'll keep on not saying it, so long as you keep tipping." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" }, place = "before",
      text = "Every cowl in the room just turned your way, friend, and that's your armour doing it. Sit with your back to the stairs, if you'd be so kind, and nobody needs to have a bad night." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" }, place = "before",
      text = "A priest in the Lamb. I'll not ask if you've come to drink or to pray over the place, but if it's the second, do it quietly." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Jarel Moor, and this is the Slaughtered Lamb, and the drinks are honest even if the clientele aren't. I'll pour you something if you like, but stay away from the shadows; that's free advice and the best thing I sell." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "Another one for downstairs, is it? I don't ask and I don't tell, and I'd take it kindly if you didn't bring anything back up with you that wasn't there when you went down." },
        { id = "h_refugee", when = { origin = "human_lordaeron_refugee" }, text = "You've a northern way of holding a cup, friend, as if somebody might take it off you. I keep a little Lordaeron Lambic behind the bar for folk like you, and I don't charge what it's worth." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A robe from up the hill, slumming it with the rest of us. Your masters drink at the Recluse, but I'll wager you'll find the company more honest in here, if not the company's intentions." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf in the Lamb, and you're welcome; your kind drinks honest and pays honest, which is more than I get from the robes. I've a keg of Thunderbrew in the back, if you'll keep it quiet." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend?" },
        { id = "h_again2", text = "Another question, or another drink?" },
        { id = "h_again3", text = "Go on. I'm only polishing cups." },
      },
      choices = {
        { text = "What's good to drink here?", next = "drink" },
        { text = "Why should I stay away from the shadows?", next = "shadows" },
        { text = "You know what's in your cellar, don't you?", next = "cellar" },
        { text = "Who drinks here, besides warlocks?", next = "regulars" },
        { text = "How does this place compare to the Blue Recluse?", next = "recluse" },
        { text = "I've been down those stairs, Jarel.", next = "xcellar", when = { origin = "human_lamb_cellar" } },
        { text = "I served in the City Watch. We knew about this place.", next = "xguard", when = { origin = "human_city_guard" } },
        { text = "How long have you kept this bar?", next = "years" },
        { text = "Why call a tavern the Slaughtered Lamb?", next = "name" },
        { text = "What brought you behind a bar like this?", next = "self" },
        { text = "Lordaeron Lambic? I haven't tasted that since home.", next = "drink_lambic", when = { origin = "human_lordaeron_refugee" } },
        { text = "I've worked the canals. I know the corner trade.", next = "xrogue", when = { origin = "human_canal_pickpocket" } },
        { text = "A place like this needs the Light, I'd say.", next = "xlight", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Do the warlocks treat you well?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Thunderbrew, you said? Prove it.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Pour me something.", next = "BUSINESS" },
        { text = "You've polished that cup since I walked in, Jarel.", next = "fl_cup", when = { flirt = true } },
        { text = "I'll be going.", next = "END" },
      },
    },
    fl_cup = {
      lines = {
        { id = "fl_cup_default", text = "Have I? I suppose I have. A man in my trade learns to keep his hands busy when there's something in the room more worth watching than the door, and tonight there is." },
      },
      choices = {
        { text = "Then keep polishing, Jarel. I don't mind being watched.", next = "fl_cup2",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "fl_warm" } } } },
        { text = "Careful, Jarel. I know what lives in those shadows.", next = "fl_cup2", when = { class = "WARLOCK" },
          reply = "I've no doubt you do, and I find I don't mind nearly as much as I ought to.",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "fl_warm" } } } },
        { text = "Watch the door instead. It's safer for us both.", next = "BACK",
          reply = "Fair enough. The door's never once disappointed me, though I'll grant it's never once smiled at me either.",
          fx = { trait = { reserved = 1 }, npcFlag = { set = { "fl_cool" } } } },
        { text = "Save it for the next lass at the bar.", next = "BACK",
          reply = "There isn't one, which was rather my point, but I'll take the hint along with the empty cup.",
          fx = { affinity = -1, npcFlag = { set = { "fl_cool" } } } },
      },
    },
    fl_cup2 = {
      lines = {
        { id = "fl_cup2_default", text = "Then I'll take the Dalaran Noir down off the good shelf for you, which I don't do for the robes or the cellar crowd, and we'll say no more about it. A bartender who talks too much loses his customers, and I'd rather not lose this one." },
      },
      choices = {
        { text = "Pour it, then. I'll be back for another.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    drink = {
      lines = {
        { id = "d_default", text = "Stormwind Tawny for the locals, Foote Tripel for those who like it thick, mead and stout for the dwarves, and Badlands Bourbon for anyone who's lost a bet. Then there's the good shelf: Dalaran Noir, Hearthglen Ambrosia and Lordaeron Lambic, and every bottle on it is a bottle nobody's making any more." },
      },
      choices = {
        { text = "Why won't anyone make them any more?", next = "drink_shelf" },
        { text = "Badlands Bourbon. Is it as bad as it sounds?", next = "drink_bourbon" },
        { text = "Do the folk downstairs drink much?", next = "drink_house" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink_shelf = {
      lines = {
        { id = "dsh_default", text = "Because the vineyards round Dalaran are behind the Violet Citadel's walls or under them, and the orchards at Hearthglen belong to men in red tabards who don't sell to the likes of me. As for Lordaeron, nobody's brewing anything there now but trouble." },
      },
      choices = {
        { text = "Tell me about the Lambic.", next = "drink_lambic" },
        { text = "Who are the men in red tabards?", next = "drink_ambrosia" },
        { text = "Dalaran Noir. Is it any good?", next = "drink_noir" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink_lambic = {
      lines = {
        { id = "dl_default", text = "A sour northern beer, brewed with wild yeast in open vats outside Lordaeron's walls. I bought eleven casks off a refugee cart the year the plague came south, and I'm down to the last two. When they're gone, there won't be any more in the world, so far as I know." },
        { id = "dl_refugee", when = { origin = "human_lordaeron_refugee" }, text = "Then you'll know it better than I do. I bought eleven casks off a cart of folk like you, the year the plague came south, and I'm down to the last two. Have a cup on me; I'd rather it went to somebody who remembers the taste.",
          fx = { learn = { "lordaeron" } } },
      },
      choices = {
        { text = "Sell the last casks. Someone ought to enjoy them.", next = "drink_lambic_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink_lambic_stance = {
      lines = {
        { id = "dls_default", text = "That's the question I ask myself every night when I lock up. Pour it and it's gone, or keep it and it's only a barrel in the dark." },
      },
      choices = {
        { text = "Pour it. Things are meant to be used.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Keep it. Some things should be saved.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink_ambrosia = {
      lines = {
        { id = "da_default", text = "The Scarlet Crusade, they call themselves, and they hold Hearthglen and its orchards now. They purge anything that might be plague-touched, which in their eyes is most things, and the ambrosia's stopped coming. A man came in last spring trying to recruit at my bar, and I poured his drink on the floor.",
          fx = { learn = { "scarlet_crusade" } } },
      },
      choices = {
        { text = "The north needs men willing to fight the plague.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Zealots. You were right to send him off.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink_noir = {
      lines = {
        { id = "dn_default", text = "Dark as a warlock's hood and twice as dear, and the mages who come in order it just to look at the label. I've six bottles left, and I sell one a year, to whoever asks most politely.",
          fx = { learn = { "dalaran" } } },
        { id = "dn_mage", when = { class = "MAGE" }, text = "You'd know it better than me, I'd think, if your masters ever let you near their cellars. I've six bottles left. A Kirin Tor man in a plain cloak tried to buy all six once, and cried when I told him no.",
          fx = { learn = { "dalaran" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    drink_bourbon = {
      lines = {
        { id = "db_default", text = "Worse. A dwarf from the Badlands swore it was the finest thing ever distilled, and then he drank half a jug and tried to fight the stairs. I keep it for wagers and for warlocks who've had a bad night below." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    drink_house = {
      lines = {
        { id = "dh_default", text = "You'd be surprised how many of them don't touch a drop; a slip of the tongue down there can cost more than a slip of the hand. Ursula takes a jug of water down every evening, and I've never once seen her merry." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    shadows = {
      lines = {
        { id = "s_default", text = "Because a tavern in the Mage Quarter collects strange folk the way a dog collects fleas, and the ones who stand in the dark corners are the ones you don't want to meet. I say it to everyone who comes in, and I've buried fewer regulars than most barmen." },
      },
      choices = {
        { text = "Who's in the corners?", next = "shadows_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadows_why = {
      lines = {
        { id = "sw_default", text = "Cutpurses from the canals, Defias men passing messages, the odd fellow with a cowl who orders nothing and leaves a silver on the bar anyway. I don't ask their business, and the night they started talking to me, I'd sell the place." },
      },
      choices = {
        { text = "You should tell the guard about the Defias.", next = "shadows_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadows_stance = {
      big = true,
      lines = {
        { id = "ss_default", text = "And have my windows broken by Tuesday and my throat cut by Thursday? The guard comes in here now and then for a drink and a look round, and they know as much as I do, so I don't see what more I'd add." },
      },
      choices = {
        { text = "Then you're protecting criminals, Jarel.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Fair enough. A man's got to live here.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    cellar = {
      lines = {
        { id = "c_default", text = "I know there's a cellar, and I know the people who go down there pay for their drinks on the way, and I know not to go down myself. That's three things, which is about two more than I'd like." },
      },
      choices = {
        { text = "You never hear anything from down there?", next = "cellar_noise" },
        { text = "Has anyone ever not come back up?", next = "cellar_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cellar_noise = {
      lines = {
        { id = "cn_default", text = "Chanting, some nights, and once a sound like a man being sick into a bucket for an hour, and once nothing at all for three days, which was worse. Now and then they ask me for the key to the furnace, and I give it to them and go and count the till." },
      },
      choices = {
        { text = "It's no business of yours. You're right to stay out.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You've seen enough to know it's wrong.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    regulars = {
      lines = {
        { id = "r_default", text = "Apprentices from the towers who can't afford the Blue Recluse, a few dock hands from the canals, and the folk who like a dark room and no questions. The mages call it a den, but they drink here on the quiet when their masters aren't looking." },
      },
      choices = {
        { text = "Any of them worth knowing?", next = "regulars_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regulars_who = {
      lines = {
        { id = "rw_default", text = "Jalane, downstairs, who sews like an angel and tips like a dwarf. Everyone else I'd keep at arm's length, and the ones I'd keep at two arms you'd find in the corners." },
      },
      choices = {
        { text = "Tell me about the mages who sneak in.", next = "regulars_mages" },
        { text = "Something else.", next = "BACK" },
      },
    },

    regulars_mages = {
      lines = {
        { id = "rm_default", text = "Apprentices, mostly, come to drink where their masters won't see, and one or two older ones in plain cloaks who think I don't know a Kirin Tor ring when I see one. They tip well and argue louder than dwarves about things I can't follow." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    years = {
      lines = {
        { id = "y_default", text = "Since the rebuilding after the Second War, when the Quarter was half scaffolding and the Lamb was the only roof on this street with no holes in it. I poured for the masons in those days, and now I pour for whoever's left." },
      },
      choices = {
        { text = "The masons? The ones the Crown never paid?", next = "years_masons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    years_masons = {
      lines = {
        { id = "ym_default", text = "The same, and good men, most of them, who built half this city with their hands and went west with nothing in them. A few of their faces turn up in my corners now and then, wearing red kerchiefs and pretending I don't know them.",
          fx = { learn = { "stonemasons" } } },
      },
      choices = {
        { text = "They were cheated. I understand their anger.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Cheated or not, they're outlaws now.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    recluse = {
      lines = {
        { id = "rc_default", text = "The Blue Recluse has Angus Stern in the kitchen and prices to match, and they've a fellow out in the street shouting about free drinks that never seem to be free. We've no cook and no crier, and we're never empty." },
      },
      choices = {
        { text = "Do you resent them?", next = "recluse_rival" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recluse_rival = {
      lines = {
        { id = "rr_default", text = "Not a bit; a man who wants a fancy plate goes there, and a man who wants to be left alone comes here, and the Quarter's big enough for both. I'll admit I'd like to try Stern's stew once, though, if he'd ever lower himself to sell me a bowl." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    name = {
      lines = {
        { id = "nm_default", text = "It was the Slaughtered Lamb when I bought it, and a man doesn't change a tavern's name without changing its luck. The old owner told me it was named for a lamb that wandered in off the street and never came out again, and then he laughed, and then he left town rather quickly." },
      },
      choices = {
        { text = "Do you believe him?", next = "name_believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_believe = {
      lines = {
        { id = "nb_default", text = "I believe the cellar was dug before I came, and I believe the man who sold it to me wasn't asking enough for it. Whatever the name means, I've decided it's a joke, and I'd thank you to let me go on thinking so." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    self = {
      lines = {
        { id = "sf_default", text = "I was a footman in the Second War, and I came home with two good arms and a head that didn't want any more marching. A barman sees as much of the world as a soldier, friend, only it comes to him, and it pays for its own drinks." },
      },
      choices = {
        { text = "Where did you serve?", next = "self_war" },
        { text = "Is there anyone waiting for you at home?", next = "self_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    self_war = {
      lines = {
        { id = "sw2_default", text = "Hillsbrad, under Lord Lothar's banners, mostly holding bridges and digging latrines. I saw the orcs once, from a long way off, and that was close enough. Lothar shook my hand once; he had a grip like a vice and he remembered my name, which I've never forgotten.",
          fx = { learn = { "second_war" } } },
      },
      choices = {
        { text = "You did your part. That's worth something.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    self_home = {
      lines = {
        { id = "sh_default", text = "A sister in Goldshire who thinks I keep a respectable inn, and I've never had the heart to correct her. If you're ever at the Lion's Pride and a sharp woman called Edna asks after her brother, tell her the Lamb is doing very well and leave it there." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } },
        { text = "You ought to tell her the truth.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some lies are kindness. Keep it.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    cellar_worst = {
      lines = {
        { id = "cw_default", text = "Two winters back, a young fellow went down with Gakin's lot, bright lad, always said thank you. He never came back up, and the next night Gakin paid his tab without my asking. I've not let myself wonder about it since, and I'd thank you not to ask me to start." },
      },
      choices = {
        { text = "Someone should answer for that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "He chose to go down. That's on him.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xrogue = {
      lines = {
        { id = "xr_default", text = "Then you know the rules: nothing lifted in my room, nothing sold at my bar, and nobody leaves bleeding. Keep to those and you're as welcome as anyone. Break one and I've a cudgel under the counter I haven't used in a year." },
      },
      choices = {
        { text = "Fair rules. I'll keep them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Who's working your corners now?", next = "shadows_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlight = {
      lines = {
        { id = "xli_default", text = "Maybe it does, and maybe I'd sleep better if somebody blessed the stairs. But I'll tell you plainly: the last priest who tried to preach in here went home with his robe on fire, and I had to pay for the curtains." },
      },
      choices = {
        { text = "Then the Cathedral should shut this place down.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Light doesn't need to kick down every door.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xcellar = {
      lines = {
        { id = "xc_default", text = "I know you have, friend, and I've never said a word about it, and I'll not start now. Just tell me one thing: is it worth it, whatever it is they do down there?" },
      },
      choices = {
        { text = "It's worth it. Power has a price.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I don't know anymore. Sometimes I wonder.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    xguard = {
      lines = {
        { id = "xg_default", text = "Then you'll know the watch never once came down those stairs, and you'll know why better than I do. Was it orders from the Keep, or just nobody brave enough to go first?" },
      },
      choices = {
        { text = "Orders. Someone high up wants them left alone.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fear. Nobody wanted to be the first one down.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xlock = {
      lines = {
        { id = "xl_default", text = "Well enough; they pay on time and they never start fights, while the mages set my curtains alight twice last winter. I'd only ask your friends below to stop borrowing my furnace without telling me what goes in it." },
      },
      choices = {
        { text = "Better you don't know, Jarel.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = {
        { id = "xd_default", text = "Real as your beard, friend, two kegs a month by way of a carter from Ironforge who drives through the Dwarven District at dawn. Drink it slow; I've no more till the next moon, and I'd hate to have to tell the next dwarf that." },
      },
      choices = {
        { text = "Pour me one, then, and keep the rest hid.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've tended this bar longer than I like to count, and I've learned to see nothing in all that time." } },
    advice = { { id = "tp_ad", text = "Stay away from the shadows. I'll keep saying it till somebody listens." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "The Scarlet Crusade hold Hearthglen now, so there's no more ambrosia, and when one of them tried to recruit at my bar, I poured his drink on the floor.", next = "drink_ambrosia" } },
    lordaeron = { { id = "tp_lordaeron", text = "I've two casks of Lordaeron Lambic left, and when they're gone, so is the last of it.", next = "drink_lambic" } },
    defias = { { id = "tp_defias", text = "The Defias wear red kerchiefs, and I see one in my corners now and then, or rather I don't, if you take my meaning.", next = "shadows_why" } },
    stonemasons = { { id = "tp_stonemasons", text = "I poured for the stonemasons while they built this city, and they were good men, badly paid.", next = "years_masons" } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend, and I'd be suspicious of any barman who could." } },
  },
}

-- Katherine the Pure: paladin trainer in the Cathedral of Light, beside Grayson and Arthur.
P:NPC {
  key = "katherine_the_pure", id = TODO_NPC("Katherine the Pure"), name = "Katherine the Pure", title = "Paladin Trainer",
  bible = "bibles/stormwind_more.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "stern", "steady" }, values = { "pious", "dutiful" },
  notices = { "light", "fel", "squire" },

  impression = {
    first = "Katherine the Pure trains paladins in the Cathedral of Light, beside Lord Grayson and Arthur the Faithful. She corrects your stance before she says hello, and she means both kindly.",
    third = "{name} met Katherine the Pure, a paladin of the Silver Hand who trains young paladins in Stormwind's Cathedral.",
  },

  greetings = {
    { id = "g_default", text = "The Light be with you. Stand straight, if you would; the Cathedral's floor deserves better than a slouch." },
    { id = "g_pal", when = { class = "PALADIN" }, text = "Come in, {class}. Your shield arm is dropping again, but we can fix that while we talk." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. I've been told I'm hard on my students, and I've decided to take it as praise." },
    { id = "g_tome", when = { questDone = DIVINITY, class = "PALADIN" }, text = "Duthorian tells me you finished the Tome of Divinity well. I expected nothing less, though I'm glad to hear it all the same." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 10, class = "PALADIN" }, text = "You carry yourself like a knight now, not a squire. I'd say I'm proud, but Grayson says I mustn't spoil you." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The brothers say you helped someone in need this week, and didn't ask for thanks. That is the whole of our order, in one deed." },
  },

  notice = {
    { id = "n_lock", cat = "fel", when = { class = "WARLOCK" }, place = "before",
      text = "There's something on you I don't like, and I suspect you know exactly what it is. You're in a house of the Light, so keep your hands where I can see them while you're under its roof." },
    { id = "n_squire", cat = "squire", when = { origin = "human_paladin_squire" }, place = "after",
      text = "You hold your sword like a squire who spent too long polishing someone else's, and I mean that fondly. Whose armour did you carry?" },
    { id = "n_dwarf", cat = "light", when = { race = "Dwarf", class = "PALADIN" }, place = "before",
      text = "A dwarf of the Hand, and you came all the way from Ironforge to hear an old human woman lecture you. Your people swing a hammer as though it were a prayer, and I've always admired it." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "I am Katherine, and they call me the Pure, which I have never once asked them to do. I train the paladins of this Cathedral with Lord Grayson and Arthur, and between the three of us, nobody leaves here without knowing how to hold a shield." },
        { id = "h_pal", when = { class = "PALADIN" }, text = "A paladin of the Silver Hand, or one who means to be, and the Hand has need of every one of you now. Tell me what you've learned since we last spoke, and I'll tell you what you've got wrong." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "I'm Katherine, and I'll keep my hand on my hilt, not out for you to shake. The Light shelters everyone under this roof, even you, so long as you give it no reason to stop." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? Stand straight while you think." },
        { id = "h_again2", text = "Go on. I've time, and the Light has more." },
        { id = "h_again3", text = "Speak, then. I'm listening." },
      },
      choices = {
        { text = "Why do they call you the Pure?", next = "name" },
        { text = "What is the Silver Hand now that Uther's gone?", next = "silverhand" },
        { text = "What do you make of the Scarlet Crusade?", next = "scarlet" },
        { text = "Tell me about Grayson and Arthur.", next = "trio" },
        { text = "What should a paladin master next?", next = "training", when = { class = "PALADIN" } },
        { text = "I finished the Tome of Divinity.", next = "xtome", when = { questDone = DIVINITY } },
        { text = "I squired for a knight of the Hand.", next = "xsquire", when = { origin = { "human_paladin_squire", "dwarf_silver_hand" } } },
        { text = "Do dwarven paladins measure up, in your eyes?", next = "xdwarf", when = { race = "Dwarf", class = "PALADIN" } },
        { text = "You don't trust me. That's plain.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Priests and paladins serve the same Light, surely.", next = "xpriest", when = { class = "PRIEST" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "Light be with you.", next = "END" },
      },
    },

    name = {
      lines = {
        { id = "n_default", text = "My brothers in the Hand gave it to me in Lordaeron, as a jest, because I wouldn't drink with them after vespers. The jest outlived most of them, and so did the name, and I've kept it for their sake." },
      },
      choices = {
        { text = "You lost many of them?", next = "name_earned" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_earned = {
      lines = {
        { id = "ne_default", text = "To the plague, to the Scourge, and to the prince who came home from Northrend a stranger. Some I buried and some I could not, and I pray for those last ones most of all." },
      },
      choices = {
        { text = "You mean Arthas.", next = "silverhand_uther" },
        { text = "Something else.", next = "BACK" },
      },
    },

    silverhand = {
      lines = {
        { id = "s_default", text = "Scattered, but not broken, whatever you hear in the taverns. Some of us came south to Stormwind, some went to Ironforge, and some put on Scarlet tabards and forgot what we swore.",
          fx = { learn = { "silver_hand" } } },
      },
      choices = {
        { text = "Tell me about Uther.", next = "silverhand_uther" },
        { text = "Can the order be rebuilt?", next = "silverhand_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silverhand_uther = {
      lines = {
        { id = "su_default", text = "Uther the Lightbringer founded our order and trained Arthas himself, and it was Arthas who struck him down. I don't think any of us has quite understood that yet, and I'm not sure we ought to." },
      },
      choices = {
        { text = "Can the order be rebuilt after that?", next = "silverhand_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silverhand_now = {
      big = true,
      lines = {
        { id = "sn_default", text = "It is being rebuilt, one paladin at a time, in this very room. The question is whether we rebuild it as it was, with lords and banners, or as something humbler that a prince can't turn against itself." },
      },
      choices = {
        { text = "As it was. The order needs its old discipline.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Humbler. No more lords and banners.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    scarlet = {
      lines = {
        { id = "sc_default", text = "Some of them were my brothers once, and some of them still believe they're doing the Light's work. They burn the sick with the dead now, I'm told, and call it purity, and that word in their mouths makes me ashamed of my own name.",
          fx = { learn = { "scarlet_crusade" } } },
      },
      choices = {
        { text = "They're fighting the Scourge. That counts for something.", next = "scarlet_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scarlet_stance = {
      lines = {
        { id = "ss_default", text = "It counts, and I'll not pretend it doesn't, for they hold ground in Lordaeron that nobody else will. But a sword that can't tell a plague victim from the Scourge has stopped being a paladin's sword." },
      },
      choices = {
        { text = "They've gone too far. They're lost.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "In a war like that, mercy gets people killed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    trio = {
      lines = {
        { id = "t_default", text = "Lord Grayson tests you, Arthur prays with you, and I correct you, and that's the whole method. Grayson is the finest swordsman in the Cathedral, and Arthur is the kindest man, and I'm the one who notices your feet." },
      },
      choices = {
        { text = "Arthur seems gentle for a paladin.", next = "trio_arthur" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trio_arthur = {
      lines = {
        { id = "ta_default", text = "Gentle, and stronger than either of us, because he's never once been tempted to think the Light was his own. When I'm sharp with a student, Arthur sits with them afterwards, and I've never asked what he says." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    training = {
      lines = {
        { id = "tr_default", text = "Your seals and your blessings, and the judgement to know which a moment needs. A paladin who blesses everything is a priest with a hammer, and one who only fights is a soldier with a prayer." },
        { id = "tr_high", when = { minLevel = 30 }, text = "You're ready for harder lessons, {class}: when to lay on hands, and when to keep that last mercy back for someone who needs it more than you." },
      },
      choices = {
        { text = "Tell me about seals.", next = "training_seals" },
        { text = "What do I need for Divine Intervention?", next = "training_symbol", when = { minLevel = 30 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    training_seals = {
      lines = {
        { id = "ts_default", text = "A seal is a promise you make your weapon, and judgement is the moment you keep it. The young ones forget to renew them, and I can always tell, because they hit like farmers." },
      },
      choices = {
        { text = "I'd rather trust my arm than a promise.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Then I'll keep my promises. Every one.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    training_symbol = {
      lines = {
        { id = "ty_default", text = "A Symbol of Divinity, from Brother Cassius down the hall, and the will to give your own life so that another's is spared. The symbol is the cheap part, I promise you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    xtome = {
      lines = {
        { id = "xt_default", text = "Then you've read what the first paladins wrote, and done what they asked of you, which is more than reading. Tell me, what did you take from it?" },
      },
      choices = {
        { text = "That the Light asks for service, not glory.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "That results matter more than the rules.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    xsquire = {
      lines = {
        { id = "xq_default", text = "Then you know the order from the stable up, which is the right way to know it. Is your knight still living, or did you come south carrying his name with you?" },
      },
      choices = {
        { text = "Living, and I mean to do him proud.", next = "BACK", fx = { affinity = 1 } },
        { text = "Fallen. I carry his name.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    xdwarf = {
      lines = {
        { id = "xd_default", text = "Better than measure up; your people never stopped training paladins when ours were scattered, and half of what's left of the Hand owes Ironforge a debt. I only wish you'd learn to bow without looking as though it hurt." },
      },
      choices = {
        { text = "It does hurt. My back's made of stone.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      lines = {
        { id = "xl_default", text = "Plain enough, and I'll not lie to you in this house. But I've been wrong about people before, and if you give me reason to be wrong about you, I'll be glad of it." },
      },
      choices = {
        { text = "Then I'll give you reason.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I don't need your approval, paladin.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
    xpriest = {
      lines = {
        { id = "xp_default", text = "The same Light, served differently: you hold it up for others to see by, and we carry it into places too dark for a candle. High Priestess Laurena says I'm unkind to priests, and she's right, though not as right as she thinks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A knight of the Silver Hand from Lordaeron, come south with what was left of us. That's all the history I like to tell.", next = "name" } },
    advice = { { id = "tp_ad", text = "Renew your seals, and keep your shield arm up. Everything else follows." } },
    silver_hand = { { id = "tp_silver_hand", text = "My order, scattered but not broken, and being rebuilt in this very room.", next = "silverhand" } },
    scarlet_crusade = { { id = "tp_scarlet_crusade", text = "Some of them were my brothers once, and what they've become is not a thing I discuss in this hall.", next = "scarlet" } },
    _none = { { id = "tp_none", text = "I don't know, and I'll not guess in the Light's house. Ask Brother Joshua; he reads more than I do." } },
  },
}

-- Brother Cassius: reagent vendor in the Cathedral of Light's east wing.
P:NPC {
  key = "brother_cassius", id = TODO_NPC("Brother Cassius"), name = "Brother Cassius", title = "Reagents",
  bible = "bibles/stormwind_more.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "gentle", "fussy" }, values = { "pious", "practical" },
  notices = { "reagents", "light" },

  impression = {
    first = "Brother Cassius sells candles, feathers and holy symbols from a side room of the Cathedral, and he sorts them with the care of a man who once dropped a crate of Light Feathers down the nave and has never quite recovered.",
    third = "{name} met Brother Cassius, the Cathedral of Light's careful and apologetic reagent seller.",
  },

  greetings = {
    { id = "g_default", text = "Light be with you. Mind the candle boxes, please; the sacred ones are on top and I've only just stacked them." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've come back! Running short of something, I expect, for everyone always is." },
    { id = "g_mage", when = { class = "MAGE" }, text = "Feathers or powder, {class}? I keep the arcane things on the left shelf, away from the incense, after the incident." },
    { id = "g_pal", when = { class = "PALADIN", minLevel = 30 }, text = "A Symbol of Divinity, is it? I keep them polished, though I pray you never need one." },
  },

  notice = {
    { id = "n_druid", cat = "reagents", when = { class = "DRUID" }, place = "after",
      text = "I've a few wild berries and thornroot put by for druids, though I confess I never know quite which you'll want. The last kaldorei who came in laughed at me, very kindly." },
    { id = "n_novice", cat = "light", when = { origin = { "human_abbey_novice", "gnome_cathedral_pupil" } }, place = "before",
      text = "I know your face from the novices' benches, I'm almost sure of it. You used to fall asleep during the long readings, and I never once told the Bishop." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "Brother Cassius, and these are the Cathedral's reagents: holy candles, feathers, symbols, powders and a few things for the druids I don't fully understand. Everyone who serves the Light needs something from this room sooner or later." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priest! Then you'll want candles, I expect, holy or sacred, for your prayers of fortitude. I've lit a few myself, just to be sure they burn properly, which Brother Kristoff says is wasteful." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Light be with you. I'll admit you're not my usual sort of customer, but flash powder is flash powder, and better you buy it here, blessed, than off a cart in Old Town cut with chalk." },
      },
      again = {
        { id = "h_again", text = "Anything else I can help you find?" },
        { id = "h_again2", text = "Is there more? I'm only counting feathers." },
        { id = "h_again3", text = "Go on, please. I like a little conversation." },
      },
      choices = {
        { text = "What do you sell, exactly?", next = "wares" },
        { text = "Isn't it strange, selling things in a cathedral?", next = "selling" },
        { text = "What's life like in the Cathedral?", next = "cathedral" },
        { text = "What's the Archbishop like?", next = "benedictus" },
        { text = "How did you come to take your vows?", next = "vow" },
        { text = "Why do mages buy feathers from a priest?", next = "xmage", when = { class = "MAGE" } },
        { text = "I studied here as a novice, Brother.", next = "xnovice", when = { origin = { "human_abbey_novice", "gnome_cathedral_pupil" } } },
        { text = "What do druids buy from you?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Flash powder, from a Brother of the Light?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I may need one of those Symbols someday.", next = "xpal", when = { class = "PALADIN", minLevel = 30 } },
        { text = "Let me see your reagents.", next = "BUSINESS" },
        { text = "Light be with you, Brother.", next = "END" },
      },
    },

    wares = {
      lines = {
        { id = "w_default", text = "Candles for the priests, Symbols of Divinity for the paladins, Light Feathers and Arcane Powder and runes for the mages, and flash powder for people I'd rather not ask about. A reagent is a small thing that a great spell needs, and I've always liked that about them." },
      },
      choices = {
        { text = "Tell me about the candles.", next = "wares_candles" },
        { text = "What's a Symbol of Divinity for?", next = "wares_symbol" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wares_candles = {
      lines = {
        { id = "wc_default", text = "Holy candles and sacred candles, poured by the sisters in the crypt and blessed before they come up to me. A priest burns one and a whole company is strengthened, so I try very hard not to sell any with crooked wicks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    wares_symbol = {
      lines = {
        { id = "ws_default", text = "A paladin who gives up his own life to save another's needs one in his hand when he does it, and it goes with him. I sell perhaps six a year, and I pray over every one, though Katherine says they work perfectly well without me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    selling = {
      lines = {
        { id = "s_default", text = "The Light doesn't need coin, but candles do, and the sisters who pour them do, and the orphans down the street most of all. Every copper from this room goes back into the Cathedral, and I keep the ledger very neat." },
      },
      choices = {
        { text = "The Church shouldn't put a price on the Light.", next = "selling_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    selling_stance = {
      big = true,
      lines = {
        { id = "ss_default", text = "I've thought that myself, on bad nights, and then I've remembered the winter we couldn't afford wood for the orphanage. I don't sell the Light, only the wax, and I'd sooner have the wax paid for than the children cold." },
      },
      choices = {
        { text = "Fair enough. Someone has to pay for the wax.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then give it free, and trust the Light to provide.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    cathedral = {
      lines = {
        { id = "c_default", text = "Busy, holy and draughty, in that order. There are prayers before dawn, pilgrims all day, and since the plague came to Lordaeron there have been refugees sleeping in the side chapels more nights than not." },
      },
      choices = {
        { text = "The refugees are still here?", next = "cathedral_refugees" },
        { text = "Who runs things day to day?", next = "cathedral_life" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cathedral_life = {
      lines = {
        { id = "cl_default", text = "The Archbishop rules, Bishop Farthing manages, and High Priestess Laurena trains the priests and frightens the rest of us. I sell candles and try not to be noticed, which suits me very well." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cathedral_refugees = {
      lines = {
        { id = "cr_default", text = "Fewer than there were, though more than the city would like, and some of the nobles have started asking when the Church means to send them on. The Archbishop says the Cathedral's doors stay open, and I've never been prouder of him." },
      },
      choices = {
        { text = "The doors should stay open. Always.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The city can't feed every refugee forever.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    benedictus = {
      lines = {
        { id = "b_default", text = "Kind, wise and very busy, and he remembers the name of every brother in the Cathedral, even mine. He came to bless this room when I first took it over, and he stayed to help me sort the feathers." },
      },
      choices = {
        { text = "You speak of him with real admiration.", next = "benedictus_view" },
        { text = "Something else.", next = "BACK" },
      },
    },
    benedictus_view = {
      lines = {
        { id = "bv_default", text = "Everyone does, I think, and he never seems to want it. If the Light has a voice in Stormwind, I'd like to think it sounds something like his, though I'd never say so to his face." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    vow = {
      lines = {
        { id = "v_default", text = "My mother sold candles in the Trade District, and I went to deliver a box to the Cathedral when I was twelve and never quite left. The brothers say I chose the Light, but I think the Light just liked my handwriting." },
      },
      choices = {
        { text = "Do you ever wish for a different life?", next = "vow_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vow_why = {
      lines = {
        { id = "vw_default", text = "Now and then, when the adventurers come through with their swords and their stories. Then one of them comes back on a stretcher and I'm very glad of my candles." },
      },
      choices = {
        { text = "There's courage in a quiet life too.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xmage = {
      lines = {
        { id = "xm_default", text = "Because the sisters bless the feathers, and a mage who falls slowly falls better with a blessing, or so I tell them. Besides, the Mage Quarter's vendors charge twice what I do, and your masters are all rather careful with coin." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xnovice = {
      lines = {
        { id = "xn_default", text = "I knew it! You've grown, and you look as though you've seen a good deal of the world since the benches. Did the Light go with you, out there, or did you have to go looking for it?" },
      },
      choices = {
        { text = "It went with me, every step.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I had to find my own way, apart from it.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    xrogue = {
      lines = {
        { id = "xr_default", text = "I know, I know, and Bishop Farthing raised an eyebrow so high I worried for it. But a rogue who can vanish is a rogue who can walk away from a fight, and a pinch of powder costs less than one more body carried up the nave." },
      },
      choices = {
        { text = "That's a generous way to see it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpal = {
      lines = {
        { id = "xa_default", text = "I hope you never do, and I'll sell you one all the same, and pray over it twice. Would you truly give your life for another's, if it came to it?" },
      },
      choices = {
        { text = "Without a second thought. That's the oath.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Only if it wins the fight. A dead paladin heals no one.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    xdruid = {
      lines = {
        { id = "xd_default", text = "Wild berries and thornroot, for a blessing of the wild that covers a whole company at once. I've no idea where the sisters get them, and I suspect a night elf in the park is involved." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a candle-seller's son who delivered a box to the Cathedral and never left.", next = "vow" } },
    trade = { { id = "tp_tr", text = "I sell reagents, blessed and counted. Ask me about any of them, and I'll tell you more than you wanted.", next = "wares" } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know that, I'm afraid. I hardly leave this room except for prayers." } },
  },
}

-- Lord Tony Romano: senior rogue trainer in Old Town; a lord who found cards and knives more interesting.
P:NPC {
  key = "tony_romano", id = TODO_NPC("Lord Tony Romano"), name = "Lord Tony Romano", title = "Rogue Trainer",
  bible = "bibles/stormwind_more.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "smooth", "sharp" }, values = { "cunning", "ambitious" },
  notices = { "stealth", "noble" },

  impression = {
    first = "Lord Tony Romano trains rogues in Old Town and wears his title like a borrowed coat: well cut, slightly ironic, and ready to be shrugged off the moment someone needs stabbing.",
    third = "{name} met Lord Tony Romano, a nobleman turned rogue trainer in Stormwind's Old Town.",
  },

  greetings = {
    { id = "g_default", text = "Well, look who found the door. Most people walk past it three times first." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah, one of mine. Come in and shut that; the draught carries voices, and we've a lot of voices in Old Town." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and I didn't hear you on the stairs. You're learning, or I'm getting old." },
    { id = "g_stealth", when = { stealthed = true }, text = "Nice try, friend. The third board from the door creaks, and I put it there on purpose." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "Heard you leaned on someone this week. Lean softer next time; it carries further." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true }, place = "before",
      text = "I can hear you breathing, friend, and you're standing on my creaky board. Come out and talk like a gentleman, or at least like a professional." },
    { id = "n_noble", cat = "noble", when = { origin = "human_minor_noble" }, place = "after",
      text = "You've a noble's way of standing, as if you expect someone to bring you a chair. I had the same habit once; it took two broken fingers to cure." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "Lord Tony Romano, at your service, and I mean that more literally than most lords would. I teach the city's rogues their trade, and I'll tell you the first lesson for free: nobody ever won a war by playing fair." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Another blade for the shadows, and a sharp one by the look of you. Let's see what you've learned on the road, and let's see what the road's taught you wrong." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin, in Old Town, and in my rooms. I'll assume you're lost, and I'll be charming about it, because you're carrying a very large hammer." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend? Speak low." },
        { id = "h_again2", text = "Go on. I've a moment, and a knife to sharpen." },
        { id = "h_again3", text = "Something more? Make it interesting." },
      },
      choices = {
        { text = "A lord, teaching rogues? How did that happen?", next = "lord" },
        { text = "Nobody wins by playing fair? Explain that.", next = "fair" },
        { text = "What's your connection to SI:7?", next = "si7" },
        { text = "What do you make of the Defias?", next = "defias" },
        { text = "The nobles in this city seem crooked to me.", next = "nobles" },
        { text = "What should I learn next?", next = "training", when = { class = "ROGUE" } },
        { text = "I learned my trade picking pockets in the canals.", next = "xpickpocket", when = { origin = "human_canal_pickpocket" } },
        { text = "I'm of noble birth too, my lord.", next = "xnoble", when = { origin = "human_minor_noble" } },
        { text = "Night elves walk unseen. We didn't need lessons.", next = "xnelf", when = { race = "NightElf", class = "ROGUE" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    lord = {
      lines = {
        { id = "l_default", text = "Slowly, and then all at once. I was a younger son of a house with more history than money, and I discovered I was far better at cards, locks and other people's secrets than at anything my tutors had in mind." },
      },
      choices = {
        { text = "What did your family say?", next = "lord_family" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lord_family = {
      lines = {
        { id = "lf_default", text = "Very little, after the first year, and then quite suddenly a lot, once they found out what I knew about my uncle's debts. We get on wonderfully now, I'm pleased to say, because they're all a little afraid of me." },
      },
      choices = {
        { text = "Blackmailing your own family? That's low.", next = "lord_choice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lord_choice = {
      big = true,
      lines = {
        { id = "lc_default", text = "Low is where the useful things are kept, friend. I never asked them for a copper, you understand; I only made sure they'd never ask me to be anyone but myself again." },
      },
      choices = {
        { text = "Family deserves honesty, not leverage.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Clever. Leverage beats pleading every time.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    fair = {
      lines = {
        { id = "f_default", text = "The orcs didn't play fair when they burned this city, and the Defias aren't playing fair now. A soldier stands in a line and dies honourably, and a rogue goes around the line and makes sure the soldier gets home." },
      },
      choices = {
        { text = "There's honor in standing in the line.", next = "fair_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fair_stance = {
      lines = {
        { id = "fs_default", text = "There is, and I've buried a few honourable men who'd agree with you if they could. I'd rather have the soldiers alive and dishonoured, though I don't often say that in front of the Highlord." },
      },
      choices = {
        { text = "Honor's what makes us better than the Horde.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Winning's what keeps us alive. Honor's a luxury.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    si7 = {
      lines = {
        { id = "s_default", text = "Connection is a strong word, and in Old Town strong words get people noticed. Let's say Master Shaw's people and my students drink in the same taverns, and sometimes one becomes the other." },
      },
      choices = {
        { text = "What's Shaw like?", next = "si7_shaw" },
        { text = "What sort of work does SI:7 do?", next = "si7_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    si7_shaw = {
      lines = {
        { id = "ss_default", text = "Quiet, patient and a very poor card player, because he never takes a risk he hasn't already measured. I'm fond of him, and I'd never turn my back on him, and I think he'd say the same of me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    si7_work = {
      lines = {
        { id = "sw_default", text = "The kingdom's quiet business: who's selling secrets to whom, which lord is meeting which stranger, and what the Defias are planning in Westfall. If you hear about it in a tavern, SI:7 heard about it a week before." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    defias = {
      lines = {
        { id = "d_default", text = "The Defias were masons who were cheated, then thieves who were organised, and now something with more money than either should have. Someone's paying them, and it isn't the farmers of Westfall.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "Who's paying them?", next = "defias_view" },
        { text = "Something else.", next = "BACK" },
      },
    },
    defias_view = {
      lines = {
        { id = "dv_default", text = "If I knew for certain, I'd be a richer man or a dead one. Look at who profits when Westfall burns and the roads go unsafe, friend, and then look at who sits closest to the throne." },
      },
      choices = {
        { text = "Then hang the traitors, whoever they are.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The masons were robbed first. I can't blame them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    nobles = {
      lines = {
        { id = "n_default", text = "Crooked is a harsh word for people who've only ever done what their grandfathers did, which is take what they could and call it tradition. Some are better than others, and a few are very much worse." },
      },
      choices = {
        { text = "Which ones are worse?", next = "nobles_lescovar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nobles_lescovar = {
      lines = {
        { id = "nl_default", text = "I'd never name a lord in my own rooms; the walls would sell it by morning. I'll say only that some of them keep very odd company in the Keep's gardens after dark, and that a good rogue notices who walks there." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    training = {
      lines = {
        { id = "t_default", text = "Your feet first, your hands second and your mouth last, because the mouth is what gets most rogues killed. Learn to wait in a shadow longer than is comfortable, and you'll outlive everyone who can't." },
        { id = "t_high", when = { minLevel = 30 }, text = "You're past the basics, so learn to pick the fight you want and refuse the rest. Vanish costs a pinch of flash powder; running away costs nothing, and pride has buried more rogues than poison." },
      },
      choices = {
        { text = "Who else trains rogues in Old Town?", next = "training_osborne" },
        { text = "Something else.", next = "BACK" },
      },
    },
    training_osborne = {
      lines = {
        { id = "to_default", text = "Osborne, the Night Man, who teaches the same trade without any of my charm. He's a good teacher, and he thinks I'm a fop, and he's right about one of those things." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    xpickpocket = {
      lines = {
        { id = "xp_default", text = "The canals, eh? Then you learned with an empty stomach, which teaches faster than any tutor I ever had. Do you still steal, now that you don't have to?" },
      },
      choices = {
        { text = "Only from those who've earned it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Habit's habit. A loose purse is a gift.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    xnoble = {
      lines = {
        { id = "xn_default", text = "Then you know the game we were raised to play, and you've chosen to play a better one. Tell me, do you still use the title, or do you leave it at the door like I try to?" },
      },
      choices = {
        { text = "I use it. A title opens doors.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I left it behind. It was a cage.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xnelf = {
      lines = {
        { id = "xe_default", text = "Your people walk unseen in a forest, and I don't doubt it. A city's different, friend; here the shadows have owners, and the owners charge rent." },
      },
      choices = {
        { text = "Then teach me who owns them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a younger son who preferred cards to court. The rest you'll have to steal.", next = "lord" } },
    advice = { { id = "tp_ad", text = "Never play fair, and never tell anyone you didn't." } },
    defias = { { id = "tp_defias", text = "Someone's paying them, friend, and it isn't Westfall's farmers.", next = "defias" } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. Ask me again when you've something to trade for it." } },
  },
}

-- Lina Stover: bow and gun merchant at the Empty Quiver, Trade District; Frederick Stover's sister (authored).
P:NPC {
  key = "lina_stover", id = TODO_NPC("Lina Stover"), name = "Lina Stover", title = "Bow & Gun Merchant",
  bible = "bibles/stormwind_more.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "brisk", "cheerful" }, values = { "practical", "family" },
  notices = { "ranged", "hunter" },

  impression = {
    first = "Lina Stover sells bows and guns just inside the Empty Quiver, and where her brother Frederick talks about yew, she talks about powder, barrels and how many paces a dwarf rifle will carry.",
    third = "{name} met Lina Stover, who sells bows and guns at the Empty Quiver in Stormwind's Trade District.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to the Empty Quiver! Bows on the left, guns on the right, and don't point either at my brother, however tempting." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did the last one shoot straight, or have you come to complain?" },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, and you've the look of someone who's been sleeping in ditches. What are you shooting with these days?" },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A dwarf! Come and tell me my Ironforge stock is rubbish, because every dwarf does, and then buy it anyway." },
  },

  notice = {
    { id = "n_hunter_pet", cat = "hunter", when = { class = "HUNTER", pet = { named = true } }, place = "after",
      text = "Keep {pet} away from the arrow barrel, would you? The last hunter's cat ate the fletching off a whole bundle, and Frederick wept." },
    { id = "n_engineer", cat = "ranged", when = { profession = { name = "Engineering", min = 50 } }, place = "before",
      text = "You've powder burns on your fingers, the honest kind you only get from a workbench. Are you an engineer, then, or just very careless?" },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "Lina Stover, and this is the Empty Quiver, though it's never empty if I can help it. My brother Frederick makes the bows and fletches the arrows, and I sell the guns, and we argue about which is better from breakfast to supper." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "A hunter always knows what they want, which makes you my favourite sort of customer. Bow or gun, friend, and don't say both, because Frederick's listening and he'll sulk." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've barrels to count." },
        { id = "h_again2", text = "Go on, ask. I like talking shop." },
        { id = "h_again3", text = "What else can I tell you?" },
      },
      choices = {
        { text = "Where do your guns come from?", next = "guns" },
        { text = "You and Frederick really argue that much?", next = "frederick" },
        { text = "Why call the shop the Empty Quiver?", next = "shop" },
        { text = "Who buys from you, mostly?", next = "customers" },
        { text = "Is trade hard these days?", next = "roads" },
        { text = "Ironforge makes the finest guns in the world, lass.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "I could build you a better rifle than these.", next = "xgnome", when = { race = "Gnome" } },
        { text = "My people have no need of guns.", next = "xnelf", when = { race = "NightElf" } },
        { text = "I learned to shoot in Eastvale's woods.", next = "xwoodsman", when = { origin = "human_eastvale_woodsman" } },
        { text = "I'm an engineer. I make my own guns.", next = "xengineer", when = { profession = { name = "Engineering", min = 1 } } },
        { text = "Bow or gun, for a hunter? Your real answer.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Good day, Lina.", next = "END" },
      },
    },

    guns = {
      lines = {
        { id = "gu_default", text = "Ironforge, mostly, by cart down through the Loch and the Wetlands road, and now and then a gnomish piece that's either brilliant or about to explode. The dwarves have made guns since before my grandmother was born, and they still won't sell me their best ones." },
      },
      choices = {
        { text = "Why won't they sell you the best?", next = "guns_source" },
        { text = "Are guns really better than bows?", next = "guns_vs_bows" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guns_source = {
      lines = {
        { id = "gs_default", text = "Because the best go to the Ironforge mountaineers first, and then to their cousins, and then to any dwarf who asks nicely in a proper accent. I get what's left, which is still better than anything a human smith can bore." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    guns_vs_bows = {
      big = true,
      lines = {
        { id = "gb_default", text = "A gun hits harder and a bow shoots faster, and a gun needs powder and a bow needs nothing but a tree. I sell guns because the world's changing, friend, and Frederick sells bows because he's afraid it is." },
      },
      choices = {
        { text = "The old ways last. Give me a good bow.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right. Powder's the future.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    frederick = {
      lines = {
        { id = "f_default", text = "Only on days ending in a sunset. He's my older brother and the best bowyer in the Trade District, and he thinks guns are noisy, smelly and rude, which is true, but so is he before his breakfast." },
      },
      choices = {
        { text = "Is it a real rivalry?", next = "frederick_rivalry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    frederick_rivalry = {
      lines = {
        { id = "fr_default", text = "We keep a tally on the back wall of who sold more each week, and he's ahead this year, but only because the night elves have come to town. Nobody else gets to say a word against him, though, so don't you try it either." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    shop = {
      lines = {
        { id = "s_default", text = "Our father named it, as a joke, because he said a quiver should always be empty by the end of a good day's trade. He'd be glad to see the place busy, and furious to see the guns." },
      },
      choices = {
        { text = "What happened to your father?", next = "shop_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop_name = {
      lines = {
        { id = "sn_default", text = "He went out with the archers when the orcs came in the First War, and he didn't come back. Frederick was old enough to remember him, and all I have of him is the shop and the name, so I sweep the one and polish the other." },
      },
      choices = {
        { text = "I'm sorry. He'd be proud of you both.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    customers = {
      lines = {
        { id = "c_default", text = "Hunters, of course, and warriors who want something to throw before they close, and rogues who buy a cheap crossbow and look embarrassed. Lately it's adventurers, buying arrows by the thousand on their way to Duskwood or Redridge or somewhere worse." },
      },
      choices = {
        { text = "Where are they all going?", next = "customers_hunters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers_hunters = {
      lines = {
        { id = "ch_default", text = "Westfall, Redridge, Duskwood, wherever the Crown's not looking, and some of them come back for more arrows and some don't. I've learned not to ask a customer's name until the third visit." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    roads = {
      lines = {
        { id = "r_default", text = "Harder than it was; the Wetlands road has trolls and raptors, and the carts that come by Westfall get stopped by men in red kerchiefs. I lost a whole crate of Ironforge rifles last spring, and I'd dearly like to know whose hands they're in." },
      },
      choices = {
        { text = "The Defias have your guns?", next = "roads_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads_stance = {
      lines = {
        { id = "rs_default", text = "Someone does, and the Defias are the likeliest. I asked the guard to look into it and they wrote it in a book, which is where Stormwind keeps everything it means to forget." },
      },
      choices = {
        { text = "The guard has bigger troubles. Be patient.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then hire someone and take them back yourself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdwarf = {
      lines = {
        { id = "xd_default", text = "They do, and I'll say so to anyone, so long as you'll tell your cousins in Ironforge to sell me a few. Which clan's gunsmiths do you swear by, then?" },
      },
      choices = {
        { text = "Bronzebeard's own. There's none finer.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "I don't doubt you could, and I don't doubt it'd do something remarkable the first time I fired it. Bring me a design, and if it doesn't take off my eyebrows I'll put it in the window." },
      },
      choices = {
        { text = "Eyebrows are a reasonable risk.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = {
        { id = "xn_default", text = "So Frederick tells me, every time one of you buys a bow from him instead. Your people move so quietly I'd wonder you need either, though I'd hate to be the deer." },
      },
      choices = {
        { text = "Guns are loud and crude. The forest hates them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Perhaps it's time my people learned new tools.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xwoodsman = {
      lines = {
        { id = "xw_default", text = "Eastvale! Then you learned on a bow and a wolf's trail, and you'll be Frederick's customer, I suppose. I'll make you a deal: try one of my rifles in the yard, and if you don't grin, I'll never mention it again." },
      },
      choices = {
        { text = "All right. One shot.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xengineer = {
      lines = {
        { id = "xe_default", text = "Then you're either my best customer or my worst rival, and I've not decided which. If you ever make more than you need, bring them by, and I'll give you an honest price for them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = {
        { id = "xh_default", text = "A bow while you're young and need to keep moving, and a gun once you've learned to stand still and let your pet do the running. Don't tell Frederick I said the first half." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born over this shop, raised behind its counter, and I'll likely die arguing in it.", next = "shop" } },
    trade = { { id = "tp_tr", text = "Guns from Ironforge, bows from my brother, and arrows by the bundle. What more does anyone need?", next = "guns" } },
    _none = { { id = "tp_none", text = "No idea, friend. If it doesn't shoot, I don't follow it." } },
  },
}

-- Kathrum Axehand: Wildhammer dwarf, axe merchant in the Dwarven District.
P:NPC {
  key = "kathrum_axehand", id = TODO_NPC("Kathrum Axehand"), name = "Kathrum Axehand", title = "Axe Merchant",
  bible = "bibles/stormwind_more.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "gruff", "proud" }, values = { "proud", "craft" },
  notices = { "axe", "wildhammer" },

  impression = {
    first = "Kathrum Axehand is a Wildhammer dwarf with tattoos up both arms who sells axes in Stormwind's Dwarven District and talks about gryphons the way a homesick man talks about his mother.",
    third = "{name} met Kathrum Axehand, a tattooed Wildhammer dwarf who sells axes in Stormwind's Dwarven District.",
  },

  greetings = {
    { id = "g_default", text = "Axes, axes and more axes. If ye want a sword, the humans have plenty, and they'll bend on ye too." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, eh? Either that axe broke, or ye've finally learned to appreciate a proper blade." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "A warrior! Come here, {g:lad|lass}, and lift this one; tell me it doesn't sing in yer hands." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "Well met, cousin, Ironforge or no. Mind ye don't stare at the tattoos; it's rude, even among our kind." },
  },

  notice = {
    { id = "n_wild", cat = "wildhammer", when = { origin = { "dwarf_wildhammer_kin", "dwarf_wildhammer_shaman" } }, place = "before",
      text = "Ye've the smell of the Hinterlands on ye, cousin, all pine and gryphon. By my beard, it's good to see a face from home in this stone city." },
    { id = "n_axe", cat = "axe", when = { class = { "WARRIOR", "PALADIN" }, minLevel = 20 }, place = "after",
      text = "That edge on yer weapon's been ground by someone who hates it. Bring it here before ye go, and I'll tell ye who to blame." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "Kathrum Axehand, of the Wildhammer clan, and I sell the finest axes in this human city, which is nae a hard contest. Ye'll find a hand axe for a farmer, a war axe for a soldier, and a few throwing blades for anyone with a good eye." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "A dwarf of Ironforge, by yer braids, come to buy an axe from a Wildhammer. I'll sell ye one, cousin, and I'll not even charge ye extra for the War of the Three Hammers." },
        { id = "h_human", when = { race = "Human" }, text = "Kathrum Axehand, Wildhammer, and before ye ask, aye, the tattoos go all the way up. Yer people fought beside mine in the Second War, so I'll give ye my honest axes and save the cheap ones for the gnomes." },
      },
      again = {
        { id = "h_again", text = "Aye? What else?" },
        { id = "h_again2", text = "Ask away. I've axes to oil." },
        { id = "h_again3", text = "Go on, then. My ears work fine." },
      },
      choices = {
        { text = "Why axes, and not swords?", next = "axes" },
        { text = "Where do the Wildhammer live?", next = "aerie" },
        { text = "Wildhammer and Ironforge don't get along?", next = "hammers" },
        { text = "How does a Wildhammer end up in Stormwind?", next = "city" },
        { text = "What do the tattoos mean?", next = "tattoos" },
        { text = "I'm Wildhammer too, cousin. From the Peak.", next = "xwild", when = { origin = { "dwarf_wildhammer_kin", "dwarf_wildhammer_shaman" } } },
        { text = "Ironforge forged me. Don't speak ill of it.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Which axe would you give a warrior?", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "Your people live close to nature, like mine.", next = "xnelf", when = { race = "NightElf" } },
        { text = "Cheap ones for the gnomes? I heard that.", next = "xgnome", when = { race = "Gnome" } },
        { text = "Show me your axes.", next = "BUSINESS" },
        { text = "Farewell, Kathrum.", next = "END" },
      },
    },

    axes = {
      lines = {
        { id = "a_default", text = "A sword's for a duel, and an axe is for anything, a door, a tree, a troll's thick head. My father said ye could judge a dwarf by the axe on his wall, and I've never met a sword that would chop me any firewood." },
      },
      choices = {
        { text = "What about throwing axes?", next = "axes_throw" },
        { text = "Something else.", next = "BACK" },
      },
    },
    axes_throw = {
      lines = {
        { id = "at_default", text = "Ah, now ye're talking Wildhammer. We throw hammers from gryphon-back, the storm hammers, and an axe thrown right does nearly the same work from the ground. Most humans throw like they're tossing a cat, mind." },
      },
      choices = {
        { text = "Fighting from a distance isn't real fighting.", next = "axes_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    axes_stance = {
      big = true,
      lines = {
        { id = "as_default", text = "Ha! Tell that to a troll with my hammer in his skull before he's seen me coming. Close or far, a dwarf fights to win, and I'll leave the fair fights to the paladins." },
      },
      choices = {
        { text = "Face to face is the honest way. I'll stand by that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fair enough. Win first, boast later.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    aerie = {
      lines = {
        { id = "ae_default", text = "Aerie Peak, in the Hinterlands, high up where the gryphons nest and the air's so clean it hurts. We ride the beasts and they ride the wind, and I've nae seen a sky so wide anywhere else in the world." },
      },
      choices = {
        { text = "You ride gryphons yourself?", next = "aerie_gryphons" },
        { text = "Then why leave?", next = "aerie_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    aerie_gryphons = {
      lines = {
        { id = "ag_default", text = "Every Wildhammer does, or did; mine was called Stormclaw and she bit everyone but me. Ye don't tame a gryphon, ye earn it, and the humans who fly from the Dwarven District on their trained birds don't know what they're missing." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    aerie_why = {
      lines = {
        { id = "aw_default", text = "The trolls of the Hinterlands, mostly, and the Witherbark and the Vilebranch getting bolder every year, and a bit of a quarrel with a chieftain I'll nae name. Stormwind pays well for axes, and a dwarf can always go home again." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    hammers = {
      lines = {
        { id = "hm_default", text = "We get along fine, so long as nobody mentions the War of the Three Hammers. Bronzebeard, Wildhammer and Dark Iron, all fighting over who'd sit the throne, and when it was done the Dark Irons were cursed, Ironforge kept the mountain, and we took the sky." },
      },
      choices = {
        { text = "And Grim Batol?", next = "hammers_stance" },
        { text = "And the Dark Irons?", next = "hammers_dark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hammers_stance = {
      lines = {
        { id = "hs_default", text = "Grim Batol was ours, our old hold, until Thaurissan's sorcery poisoned it and the orcs made a dragon pen of it in the Second War. Nobody goes there now, and I'll drink to the day a Wildhammer does.",
          fx = { learn = { "grim_batol" } } },
      },
      choices = {
        { text = "Then take it back, when the time's right.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Some places are best left to the dead.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hammers_dark = {
      lines = {
        { id = "hk_default", text = "Cursed, and they deserve every inch of it, for they called up the fire that made the Burning Steppes out of good green land. They're under Blackrock Mountain now, digging and plotting and selling their axes to orcs, and a Wildhammer spits when he says their name.",
          fx = { learn = { "dark_iron" } } },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    city = {
      lines = {
        { id = "c_default", text = "By gryphon, then by cart, then by being too stubborn to go home after the first winter. The Dwarven District's half Ironforge folk, and they treat me like an uncle who drinks too much, which is fair." },
      },
      choices = {
        { text = "The Ironforge dwarves here treat you well?", next = "city_bronze" },
        { text = "Something else.", next = "BACK" },
      },
    },
    city_bronze = {
      lines = {
        { id = "cb_default", text = "Well enough. Their smiths are the best I know, and their ale's the second best, and they talk about Magni as if the man hung the moon. I'll give them that their king is a fine one, though I'll nae say so in their tavern." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    tattoos = {
      lines = {
        { id = "t_default", text = "Each one's a story: the first gryphon I rode, the first troll I killed, my clan's mark, and my mother's name in the old runes. Ironforge dwarves grow their stories in their beards, and we wear ours on our skin." },
      },
      choices = {
        { text = "A good way to keep your history.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xwild = {
      lines = {
        { id = "xw_default", text = "From the Peak! By the stone, cousin, sit and tell me, are the nests still full, and is old Falstad still shouting at everyone? I've been gone three winters and I miss even the shouting." },
      },
      choices = {
        { text = "The nests are full, and Falstad still shouts.", next = "BACK", fx = { affinity = 2 } },
        { text = "The trolls press hard. You'd be needed there.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    xdwarf = {
      lines = {
        { id = "xd_default", text = "I'll speak ill of nae dwarf's home, cousin, so long as he speaks none of mine. We're all of the same stone, whatever the old wars say, and the Dark Irons are enemy enough for both of us." },
      },
      choices = {
        { text = "Agreed. Let the old feud lie.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some grudges are worth keeping, Wildhammer.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    xwarrior = {
      lines = {
        { id = "xa_default", text = "A two-handed axe, if ye've the shoulders for it, because nothing clears a crowd of gnolls quite like a good wide swing. If ye fight with a shield, then a hand axe, and keep the edge sharp enough to shave with." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = {
        { id = "xn_default", text = "Aye, we've that in common: wind and trees and creatures that fly. Ye'd not cut down a tree for firewood without asking it first, I'm told, and I'd not take an axe to one without a reason, so we're close enough." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "Ha! A jest, wee one, and a poor one, I'll grant. Truth be told, ye gnomes buy the best of my stock, because ye're the only ones who measure the balance before ye pay." },
      },
      choices = {
        { text = "Balance is everything. I measure twice.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Wildhammer, born at Aerie Peak, raised on gryphon-back, and stuck in a city with nae sky to speak of.", next = "aerie" } },
    trade = { { id = "tp_tr", text = "Axes, every size, every sort. If it chops, I sell it.", next = "axes" } },
    grim_batol = { { id = "tp_grim_batol", text = "Grim Batol was our old hold, and it's our old grief. Ask me properly and I'll tell ye.", next = "hammers_stance" } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons are cursed, and welcome to it, every last one of them.", next = "hammers_dark" } },
    _none = { { id = "tp_none", text = "Couldn't tell ye, cousin. Ask a human; they know all sorts of useless things." } },
  },
}

-- Bryan Cross: shield merchant in Old Town, near the barracks.
P:NPC {
  key = "bryan_cross", id = TODO_NPC("Bryan Cross"), name = "Bryan Cross", title = "Shield Merchant",
  bible = "bibles/stormwind_more.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "steady", "gruff" }, values = { "practical", "loyal" },
  notices = { "shield", "guard" },

  impression = {
    first = "Bryan Cross sells shields in Old Town, a stone's throw from the barracks, and he raps on every one with his knuckles before he lets it go, as though listening for a lie.",
    third = "{name} met Bryan Cross, a plain-spoken shield merchant in Stormwind's Old Town.",
  },

  greetings = {
    { id = "g_default", text = "Shields, friend. Wood, iron and steel, and I've rapped on each one to be sure it'll take a hit you couldn't." },
    { id = "g_back", when = { metBefore = true }, text = "Back already? Let's see the shield; I can tell a lot about a fighter from the dents." },
    { id = "g_warrior", when = { class = { "WARRIOR", "PALADIN" } }, text = "Ah, someone who'll actually use one. Come in, and mind the rack; it bites." },
    { id = "g_cloth", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "Lost, are you? Shields are for people who get hit, and your sort tends to be standing at the back." },
  },

  notice = {
    { id = "n_broken", cat = "shield", when = { durability = { max = 0.3 } }, place = "before",
      text = "Light's sake, friend, your gear's held together by habit. Get it to a smith before you take one more blow, or you'll be buying a shield and a coffin." },
    { id = "n_guard", cat = "guard", when = { origin = "human_city_guard" }, place = "after",
      text = "You stand like a watchman, feet apart and eyes on the door. I've sold round shields to the City Watch by the cartload, so I may have sold you your first one." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "Bryan Cross, shield merchant, and Old Town's been my corner since the city was rebuilt. A sword wins the fight, but a shield gets you home to eat supper, and I sleep better selling the second." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior, and you've been using that shield hard, by the look of the rim. I'll sell you a new one, but come and tell me what's been hitting the old one first." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "One of the Cathedral's knights, are you? Your lot always want them blessed, and I always tell you the Light doesn't care what the shield's made of, only who's behind it." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend?" },
        { id = "h_again2", text = "Go on. I'll keep rapping on these while you think." },
        { id = "h_again3", text = "What else, then?" },
      },
      choices = {
        { text = "What makes a good shield?", next = "shields" },
        { text = "What's Old Town like these days?", next = "oldtown" },
        { text = "Who buys from you, mostly?", next = "customers" },
        { text = "Who makes these shields?", next = "craft" },
        { text = "You've been here since the rebuilding?", next = "war" },
        { text = "I served in the Watch. You may have armed me.", next = "xguard", when = { origin = "human_city_guard" } },
        { text = "What shield for someone who fights in the front line?", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "The Light protects me better than any shield.", next = "xpaladin", when = { class = "PALADIN" } },
        { text = "I don't need a shield. I have spells.", next = "xcloth", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "Dwarves make the best shields, surely.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Let's see your shields.", next = "BUSINESS" },
        { text = "Good day, Bryan.", next = "END" },
      },
    },

    shields = {
      lines = {
        { id = "s_default", text = "Weight you can carry all day, a rim that won't split, and a grip that doesn't twist when something heavy hits it. Most folk buy for the pretty face on the front, and I tell them the back is what matters." },
      },
      choices = {
        { text = "What kinds do you sell?", next = "shields_kinds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shields_kinds = {
      lines = {
        { id = "sk_default", text = "Bucklers for those who need a hand free, round shields for the common soldier, and kite shields for anyone mounted or anyone who likes being a wall. A heater shield, now, that's a knight's shield, and they pay a knight's price for it." },
      },
      choices = {
        { text = "A shield's no use if you never attack.", next = "shields_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shields_stance = {
      big = true,
      lines = {
        { id = "ss_default", text = "Tell that to the men at the gate when the orcs came in the First War; the ones who held their shields lived, and the ones who charged didn't. A shield's not cowardice, friend; it's the reason there's anyone left to fight tomorrow." },
      },
      choices = {
        { text = "You're right. Holding the line wins wars.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Wars are won by striking first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    oldtown = {
      lines = {
        { id = "o_default", text = "Rough, honest and loud, which is how I like it. You've the barracks, the Pig and Whistle, and a building down the way where nobody goes in or out by the front door, and nobody asks about it." },
      },
      choices = {
        { text = "Any trouble around here?", next = "oldtown_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oldtown_trouble = {
      lines = {
        { id = "ot_default", text = "Brawls on paydays, cutpurses on market days, and the Stockade just over the canal full of Defias who'd riot if you looked at them sideways. The guard keeps a lid on it, mostly.",
          fx = { learn = { "the_stockade" } } },
      },
      choices = {
        { text = "The Stockade? Inside the city walls?", next = "oldtown_stockade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    oldtown_stockade = {
      lines = {
        { id = "os_default", text = "Aye, right in the middle of the canals, and fuller than it's ever been since the Defias started up. Some say the city should hang the lot and be done, and some say half of them were only masons who wanted their wages." },
      },
      choices = {
        { text = "Hang them. Mercy's wasted on traitors.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Pay the masons. Most of them were wronged.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    customers = {
      lines = {
        { id = "c_default", text = "The guard, first and always; the Crown buys round shields from me by the hundred and pays by the half-hundred. Then adventurers, then the odd nobleman who wants something shiny to hang over his fire." },
      },
      choices = {
        { text = "The Crown pays slow?", next = "customers_guard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers_guard = {
      lines = {
        { id = "cg_default", text = "The Crown pays eventually, which in Stormwind is meant to be a comfort. The masons learned what eventually means, and I don't mean to learn it the same way, so I keep half my trade with folk who pay in coin on the counter." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    craft = {
      lines = {
        { id = "cr_default", text = "I build the wooden ones myself, glued and bound in the back room, and the iron and steel come from smiths in the Dwarven District. I rap on every one before it leaves, and if it rings wrong it goes back." },
      },
      choices = {
        { text = "Which smiths do you trust?", next = "craft_smiths" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_smiths = {
      lines = {
        { id = "cs_default", text = "The Deepforges, mostly, Therum and Kaita, who've never once sold me a bad boss. Dwarves bicker over price like it's a sport, but their steel doesn't lie." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    war = {
      lines = {
        { id = "w_default", text = "Since before it, if you want the truth; I was a shield-boy in the old garrison when the Horde came over the walls. Most of the men I carried shields for didn't come out of that day, and the ones who did were the ones who kept them up." },
      },
      choices = {
        { text = "What happened to you, after?", next = "war_story" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_story = {
      lines = {
        { id = "ws_default", text = "I went to Lordaeron with the refugees, like everyone, and came back when the city was rebuilt with a trade and a grudge. I sold the grudge long ago, but I've kept the trade." },
      },
      choices = {
        { text = "Some grudges against the Horde should be kept.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Letting it go took more strength than holding it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xguard = {
      lines = {
        { id = "xg_default", text = "Likely I did, and I hope it served you. Tell me true: does the Watch still use the round ones with the lion painted crooked, or did someone finally fix the stencil?" },
      },
      choices = {
        { text = "Still crooked. We were proud of it.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarrior = {
      lines = {
        { id = "xw_default", text = "A kite shield, steel-faced, and the heaviest you can carry without your arm going numb by noon. Learn to bash with the rim, too; a shield's a weapon if you're not too proud to use it like one." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpaladin = {
      lines = {
        { id = "xp_default", text = "Maybe it does, but the Light didn't stop an orc axe at the gate that day, and a shield did. Carry both, I say, and thank whichever one you like after." },
      },
      choices = {
        { text = "Faith first. The shield's only a tool.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fair. I'll trust the steel as much as the Light.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    xcloth = {
      lines = {
        { id = "xc_default", text = "So did the court wizard's apprentices, and I sold them shields all the same after the first winter in the field. If you ever change your mind, I've a little buckler that won't spoil your casting." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = {
        { id = "xd_default", text = "The metal ones, aye, and I'll not argue with a dwarf about steel. The wooden ones, though, the light ones a soldier can march with, are mine, and I'll put them against any in Ironforge." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a shield-boy in the old garrison, a refugee after, and a merchant since the rebuilding.", next = "war" } },
    trade = { { id = "tp_tr", text = "Shields, friend. Keep it up and you'll keep breathing.", next = "shields" } },
    the_stockade = { { id = "tp_the_stockade", text = "The Stockade's over the canal and full of Defias, and one bad day from a riot. I sell the guards there their shields.", next = "oldtown_stockade" } },
    _none = { { id = "tp_none", text = "Couldn't say. Ask at the barracks; somebody there always thinks they know." } },
  },
}

-- Darian Singh: fireworks and arcane gear vendor at the Pyrotechnics shop, Mage Quarter.
P:NPC {
  key = "darian_singh", id = TODO_NPC("Darian Singh"), name = "Darian Singh", title = "Fireworks Vendor",
  bible = "bibles/stormwind_more.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "cheerful", "chatty" }, values = { "craft", "trade" },
  notices = { "arcane", "explosive" },

  impression = {
    first = "Darian Singh sells fireworks and arcane goods in the Mage Quarter, smells faintly of saltpetre, and lights up talking about rockets the way his rockets light up the sky.",
    third = "{name} met Darian Singh, the cheerful fireworks seller of Stormwind's Mage Quarter.",
  },

  greetings = {
    { id = "g_default", text = "Welcome, welcome! Mind the red crate, please; it's not dangerous, but it's sensitive." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more, are you? I knew it. Nobody buys just one rocket." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "A gnome! Please don't touch anything until we've discussed it, and please do tell me afterwards what you'd have improved." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night already? Perfect weather for my wares, if you've a roof and a good excuse." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" }, place = "after",
      text = "Your fingertips are singed at the ends, {class}, which means you've been practising fire. My fireworks are tame by comparison, but they're much prettier." },
    { id = "n_engineer", cat = "explosive", when = { profession = { name = "Engineering", min = 75 } }, place = "before",
      text = "You've black powder under your nails, friend, and I'd know it anywhere. You're an engineer, aren't you? Then you'll understand my prices." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "Darian Singh, and I sell only the finest arcane gear and fireworks, made by the crafters and mages here in the city of Stormwind. Since the fall of Dalaran it's been hard work keeping these shelves full, but I manage." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage! I sell a few things for your trade as well as for festivals, though I'll warn you now that Archmage Malin's students have already bought all the good candles." },
      },
      again = {
        { id = "h_again", text = "What else can I show you?" },
        { id = "h_again2", text = "Anything more? I love to talk shop." },
        { id = "h_again3", text = "Go on, I'm listening, and nothing's lit." },
      },
      choices = {
        { text = "Tell me about the fireworks.", next = "fireworks" },
        { text = "Why has trade been hard since Dalaran fell?", next = "dalaran" },
        { text = "Who makes your goods now?", next = "lucan" },
        { text = "When do people buy fireworks?", next = "festivals" },
        { text = "Don't your neighbours mind the bangs?", next = "neighbors" },
        { text = "Can a mage use anything you sell?", next = "xmage", when = { class = "MAGE" } },
        { text = "I could improve these rockets, you know.", next = "xgnome", when = { race = "Gnome" } },
        { text = "I make my own explosives.", next = "xengineer", when = { profession = { name = "Engineering", min = 1 } } },
        { text = "I lived in Dalaran before it fell.", next = "xdalaran", when = { origin = "human_dalaran_stray" } },
        { text = "Dwarves invented black powder, you know.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Good day.", next = "END" },
      },
    },

    fireworks = {
      lines = {
        { id = "f_default", text = "Rockets in red, blue and green, and a cluster or two for the grand occasions, each one packed by hand and blessed by nobody, because the priests won't come near the shop. A good rocket goes up quiet and comes down loud, and leaves everyone gasping at once." },
      },
      choices = {
        { text = "How are they made?", next = "fireworks_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fireworks_how = {
      lines = {
        { id = "fh_default", text = "Powder, paper, a little alchemy for the colours and a pinch of arcane dust to make the shape hold, which is the secret I'll take to my grave. The gnomes do it with gears, and the dwarves do it with too much powder, and I do it with care." },
      },
      choices = {
        { text = "Selling explosives in a crowded city is reckless.", next = "fireworks_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fireworks_stance = {
      big = true,
      lines = {
        { id = "fs_default", text = "Reckless? I've been doing this for twenty years and I've only set fire to the awning twice. People need something to look up at, friend, after all the war and plague, and I think a little danger is worth a lot of wonder." },
      },
      choices = {
        { text = "It's a risk the city shouldn't take.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right. People need some wonder.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dalaran = {
      lines = {
        { id = "d_default", text = "Dalaran's workshops made most of the arcane goods in the Alliance, and the elves of Quel'Thalas made the rest. Then the Scourge came, and Archimonde knocked Dalaran down, and Quel'Thalas burned, and my suppliers went with them." },
      },
      choices = {
        { text = "What happened to your old suppliers?", next = "dalaran_supply" },
        { text = "Quel'Thalas is gone?", next = "quel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran_supply = {
      lines = {
        { id = "ds_default", text = "Dead, or scattered, or so busy rebuilding they've no time for fireworks, and I don't blame them. I had a man in Dalaran who could make a rocket write your name in the sky, and I've had no letter from him since the summer it fell." },
      },
      choices = {
        { text = "I'm sorry. Perhaps he got out.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quel = {
      lines = {
        { id = "q_default", text = "So they say; the Scourge went through it on their way to Dalaran, and the Sunwell with it, though I'm no scholar of such things. The few elves you see in the city now don't talk about it, and I've learned not to ask." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    lucan = {
      lines = {
        { id = "l_default", text = "Lucan Cordell and some of our other tradesmen have been doing a fine job of filling my orders, I'm happy to say. Lucan does the enchanted things, the alchemists in the Quarter mix my colours, and I pack the rockets myself." },
      },
      choices = {
        { text = "Is Lucan as good as your Dalaran man?", next = "lucan_view" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lucan_view = {
      lines = {
        { id = "lv_default", text = "Not yet, but he's young and careful, which is better than old and brilliant in my trade. Give him ten years and he'll make a rocket write your name, and in the meantime he can make one spell it nearly right." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    festivals = {
      lines = {
        { id = "fe_default", text = "At midsummer when the fires burn, at the new year when everyone counts down, and whenever a lord marries or a hero comes home. The rest of the year I sell them to apprentices who want to impress somebody and to children who want to frighten their mothers." },
      },
      choices = {
        { text = "Do you work the festivals yourself?", next = "festivals_lillian" },
        { text = "Something else.", next = "BACK" },
      },
    },
    festivals_lillian = {
      lines = {
        { id = "fl_default", text = "My daughter Lillian does, now, and she's better at it than I ever was, with a louder voice and steadier hands. She'll tell you we're the best firework makers Stormwind has ever seen, and she's only half exaggerating." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    neighbors = {
      lines = {
        { id = "n_default", text = "The mages blow up far more than I do, believe me, and they don't even make it pretty. The only one who complains is the old gentleman across the street, and he complains about the birds, too." },
      },
      choices = {
        { text = "Some people just want a quiet life.", next = "neighbors_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbors_stance = {
      lines = {
        { id = "ns_default", text = "They do, and they chose to live in the Mage Quarter, which was their first mistake. I test my rockets out past the city gates now, out of respect, and I only test the small ones in the yard." },
      },
      choices = {
        { text = "That's fair. A city has to keep its peace.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Test them wherever you like. Life should be loud.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xmage = {
      lines = {
        { id = "xm_default", text = "A few things, yes, though you'll find better from the Quarter's trainers and less fun. I'll say this, {class}: nothing teaches control of fire like packing a rocket, so come and try it if you ever get bored of fireballs." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "I don't doubt it, but every gnome who says so improves them until they go sideways. Bring me a design, written down, and I'll test it far from anything I love." },
      },
      choices = {
        { text = "Sideways is still a direction.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xengineer = {
      lines = {
        { id = "xe_default", text = "Then you'll know how fine a line it is between a celebration and a crater. Engineers buy my rockets to take apart, and I've come to take it as flattery." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdalaran = {
      lines = {
        { id = "xd_default", text = "Then you'll have seen the sky over the Violet Citadel on the festival nights, and you'll know what I'm trying to do with my little rockets. Tell me, did you ever see a shop on the north side, with a green door?" },
      },
      choices = {
        { text = "I did. It burned with the rest.", next = "BACK", fx = { affinity = 1 } },
        { text = "I don't remember. I left in a hurry.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = {
        { id = "xw_default", text = "So every dwarf tells me, and I've never once won the argument, so I've stopped having it. I'll say only that your powder's for blowing up mountains, and mine's for making people smile." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Twenty years of rockets and only two awnings lost. I call that a career.", next = "fireworks" } },
    trade = { { id = "tp_tr", text = "Fireworks and arcane gear, made right here in Stormwind since Dalaran fell.", next = "dalaran" } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, friend, but I could set off a rocket while you think about it." } },
  },
}

-- Major Mattingly: veteran of the Stormwind Army in the Valley of Heroes; hangs Onyxia's head.
P:NPC {
  key = "major_mattingly", id = TODO_NPC("Major Mattingly"), name = "Major Mattingly",
  bible = "bibles/stormwind_more.md", role = "soldier", tier = "quest",
  communities = { "stormwind" }, temper = { "steady", "gruff" }, values = { "loyal", "dutiful" },
  notices = { "soldier", "dragon" },

  impression = {
    first = "Major Mattingly stands in the Valley of Heroes with his longsword and a face lined by long service, and he watches the gate as if the Horde might come over it again before supper.",
    third = "{name} met Major Mattingly, a veteran officer of the Stormwind Army who keeps watch in the Valley of Heroes.",
  },

  greetings = {
    { id = "g_default", text = "Move along, citizen, unless you've business with the army. The Valley's for heroes and for those of us who guard them." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still in one piece, I see, and I can't say that for every face I've waved through this gate." },
    { id = "g_soldier", when = { class = { "WARRIOR", "PALADIN" } }, text = "Stand easy, soldier. Or don't; I like a fighter who keeps their guard up." },
    { id = "g_onyxia", tags = { "news" }, when = { questDone = ONY_VICTORY }, text = "There's the one who brought down the Black Dragon! Every time I look up at that gate, I think of you." },
    { id = "g_masq", when = { questDone = MASQUERADE, ["not"] = { questDone = ONY_VICTORY } }, text = "I heard what happened in the throne room. Light help us, she sat beside the king's own son, and none of us saw it." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Your name's been mentioned at the barracks, and favourably. Don't let it go to your head." },
  },

  notice = {
    { id = "n_guard", cat = "soldier", when = { origin = { "human_city_guard", "dwarf_military_ward" } }, place = "after",
      text = "You stand like you've drilled on Stormwind's cobbles. Who was your sergeant? No, don't tell me; I'll only feel sorry for you." },
    { id = "n_onyxia", cat = "dragon", when = { cleared = "Onyxia's Lair", faction = "Alliance" }, place = "before",
      text = "You've the look of someone who's stood in a dragon's breath and walked out again. There's a scorch on your armour I'd know anywhere now." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "Major Mattingly, Stormwind Army. I've stood guard on this valley since the city was rebuilt, and I'll stand here until they carry me out of it, which won't be soon if I've any say in it." },
        { id = "h_low", when = { maxLevel = 20 }, text = "Major Mattingly, and you're young to be wandering the Valley of Heroes. Read the statues, recruit, and remember that every one of those men and women started out just as green as you." },
        { id = "h_onyxia", tags = { "news" }, when = { questDone = ONY_VICTORY }, text = "Citizens and allies of Stormwind, I told them, on this day history has been made. I said it from the gate with your trophy over my head, and I've never been prouder to wear this uniform." },
        { id = "h_masq", tags = { "news" }, when = { questDone = MASQUERADE, ["not"] = { questDone = ONY_VICTORY } }, text = "Lady Prestor, a dragon, in our own Keep, and she very nearly had the Highlord fooled. If you've any part in hunting her down, soldier, you'll have every blade in this valley behind you." },
      },
      again = {
        { id = "h_again", text = "Anything else, soldier?" },
        { id = "h_again2", text = "Go on. The gate's not going anywhere." },
        { id = "h_again3", text = "Speak up. I've had a lot of cannon fire in my ears." },
      },
      choices = {
        { text = "What exactly do you guard here?", next = "post" },
        { text = "Who are the heroes in the statues?", next = "valley" },
        { text = "What news of King Varian?", next = "king" },
        { text = "You fought in the Second War?", next = "war" },
        { text = "What threatens Stormwind most, now?", next = "dragons" },
        { text = "About Onyxia's head, Major.", next = "head", when = { questDone = ONY_VICTORY } },
        { text = "I was there when Prestor was unmasked.", next = "xmasq", when = { questDone = MASQUERADE } },
        { text = "I served in the City Watch, Major.", next = "xguard", when = { origin = { "human_city_guard", "dwarf_military_ward" } } },
        { text = "Any advice for a warrior, from an old soldier?", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "Ironforge's soldiers would hold this gate too.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Do you have anything for me?", next = "BUSINESS", when = { questDone = ONY_VICTORY } },
        { text = "Carry on, Major.", next = "END" },
      },
    },

    post = {
      lines = {
        { id = "p_default", text = "The main gate of Stormwind, the bridge, and the Valley between them, which is the first thing every visitor sees and the last thing every soldier sees on the way out. If it's going to come into this city with a sword, it has to come past me first." },
      },
      choices = {
        { text = "Has anything come through, lately?", next = "post_gate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_gate = {
      lines = {
        { id = "pg_default", text = "Refugees from Lordaeron, Westfall farmers with nothing left, and adventurers like you, more every week. The army's stretched thin, and some days I wonder whether we're guarding the city or just counting who comes in." },
      },
      choices = {
        { text = "The gate should be closed to refugees. We can't feed them.", next = "post_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_stance = {
      big = true,
      lines = {
        { id = "ps_default", text = "I've heard nobles say that, and I've heard it in the barracks too, from men with families to feed. My orders are to keep the gate open to anyone who comes in peace, and I'd follow those orders even if I weren't told to." },
      },
      choices = {
        { text = "Good. Stormwind should shelter those who need it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mercy won't feed a city. Close the gate.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    valley = {
      lines = {
        { id = "v_default", text = "The heroes of the Second War, who went through the Dark Portal after the Horde and never came back: Turalyon, Alleria, Khadgar, Danath and Kurdran. We put them in stone so we'd never forget what they gave up for us.",
          fx = { learn = { "valley_of_heroes" } } },
      },
      choices = {
        { text = "Did you know any of them?", next = "valley_statues" },
        { text = "Are they dead, then?", next = "valley_sons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    valley_statues = {
      lines = {
        { id = "vs_default", text = "I served under Danath Trollbane once, for a season, when I was a corporal with more nerve than sense. He was the hardest man I ever met, and he'd share his last ration with a recruit." },
      },
      choices = {
        { text = "Are they dead?", next = "valley_sons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    valley_sons = {
      lines = {
        { id = "vn_default", text = "Nobody knows, and that's the worst of it. The Portal closed behind them and that was that, and some say they gave their lives to close it and some say they're still fighting on the other side." },
      },
      choices = {
        { text = "They're still fighting. I believe it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "They're gone. Hope won't bring them back.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    king = {
      lines = {
        { id = "k_default", text = "None that I'm allowed to share, and none I'd share if I had it. The king went on a diplomatic voyage and didn't come back, and the young prince sits the throne with Highlord Bolvar beside him, and the army does as it's told." },
      },
      choices = {
        { text = "And Lady Prestor? She's always at court.", next = "king_prestor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    king_prestor = {
      lines = {
        { id = "kp_default", text = "She is, and she's a noblewoman of Alterac, and a soldier doesn't speak against his betters. I'll say only that the army's budget has been short since she started advising on it, and that the Highlord listens to her more than I'd like." },
        { id = "kp_masq", when = { questDone = MASQUERADE }, text = "Prestor was a dragon, as you well know, sitting at the boy's side all that time. I said it was odd that the budget was always short, and I never once thought to say it louder." },
      },
      choices = {
        { text = "The army should speak up, whatever their rank.", next = "king_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    king_stance = {
      lines = {
        { id = "ks_default", text = "Easy to say for someone who doesn't answer to a court. A major who speaks against the regency's advisers ends up a sergeant in Darkshire, and then who guards the gate?" },
      },
      choices = {
        { text = "A soldier follows orders. That's how it should be.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some orders deserve to be questioned, Major.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    war = {
      lines = {
        { id = "w_default", text = "I did, from the fields of Hillsbrad to the gates of Blackrock, and I was at the Burning of Stormwind in the First War as a boy. That's two wars, and I'd not wish a third on the city, though I expect I'll see one." },
      },
      choices = {
        { text = "What do you remember of the Burning?", next = "war_scar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_scar = {
      lines = {
        { id = "wc_default", text = "Smoke, mostly, and my mother's hand pulling me down to the docks, and the orcs on the walls with torches. When Lothar led us north to Lordaeron I swore I'd come home with a sword, and I did." },
      },
      choices = {
        { text = "Now the orcs live in a land of their own.", next = "war_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_stance = {
      lines = {
        { id = "wz_default", text = "Kalimdor, they tell me, under a new warchief, and some at court say we should leave them be. I've seen too much fire to trust a peace with orcs, but I'll confess they've not come over this gate since the internment camps emptied." },
      },
      choices = {
        { text = "Leave them be, unless they strike first.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Strike them first, while they're still weak.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dragons = {
      lines = {
        { id = "d_default", text = "The Blackrock orcs and the Black Dragonflight, holed up in Blackrock Mountain with the Dark Irons beneath them. The army can't spare the men to root them out, so they'll keep raiding Redridge and the Burning Steppes until someone braver does.",
          fx = { learn = { "blackrock" } } },
      },
      choices = {
        { text = "Who leads them?", next = "dragons_spire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dragons_spire = {
      lines = {
        { id = "ds_default", text = "Rend Blackhand claims to be warchief of the orcs in the spire, and there's a dragon above him called Nefarian, if the reports are true. And Onyxia, who's said to be the Black Dragon's daughter, in her lair in the marshes south of Theramore." },
        { id = "ds_done", when = { questDone = ONY_VICTORY }, text = "Rend and his orcs, and Nefarian above them, who'll be in a fine temper now his sister's head is on our gate. If you go after him, soldier, go with the best fighters this kingdom has." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    head = {
      lines = {
        { id = "hd_default", text = "It's hung at the city gate, where every citizen walking in can see it, and every spy can carry the news back to her kin. I've had a dozen children ask me if it's real, and I've told every one that a hero brought it home." },
      },
      choices = {
        { text = "What did the city do when you announced it?", next = "head_hang" },
        { text = "Something else.", next = "BACK" },
      },
    },
    head_hang = {
      lines = {
        { id = "hh_default", text = "Cheered, wept and drank the Pig and Whistle dry, and I saw the Highlord himself smile, which I've not seen since the king went missing. For a day or two the whole city remembered why it was worth defending." },
      },
      choices = {
        { text = "It should stay there forever, as a warning.", next = "head_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    head_stance = {
      lines = {
        { id = "hs_default", text = "It'll stay as long as the Highlord orders, and then it'll rot, as heads do. The question is whether we hang trophies to warn our enemies or to comfort ourselves, and I've never been sure." },
      },
      choices = {
        { text = "To warn them. Let the dragons see it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Take it down soon. Victory needs no gloating.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xmasq = {
      lines = {
        { id = "xm_default", text = "Then you saw more than I ever will, and I envy you it. Did she look surprised, at the end, when she knew she'd been found out?" },
      },
      choices = {
        { text = "Not surprised. Angry, and very old.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'd rather not speak of it, Major.", next = "BACK" },
      },
    },
    xguard = {
      lines = {
        { id = "xg_default", text = "Then you know the long nights and the short pay as well as I do. The Watch keeps the streets and the army keeps the walls, and both of us keep the kingdom standing, whatever the nobles say." },
      },
      choices = {
        { text = "I miss it sometimes. The order of it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I don't. The road's more honest than the Watch.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xwarrior = {
      lines = {
        { id = "xw_default", text = "Keep your feet under you, your shield up and your mouth shut until the fighting's done. And never charge a line you haven't counted, because the last man you didn't count is the one who kills you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = {
        { id = "xd_default", text = "They would, and they did, in the Second War, when your mountaineers stood beside us at the Thandol Span. If Ironforge ever needs a gate held, there's a major in Stormwind who'd hold it gladly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've had two wars, one gate and thirty years of standing in the same place.", next = "war" } },
    advice = { { id = "tp_ad", text = "Count the enemy before you charge. Then count again." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "The Valley of Heroes is my post and my pride, and every statue in it is someone who did more than I ever will.", next = "valley" } },
    _none = { { id = "tp_none", text = "Not my business, soldier. Ask at the Keep, and good luck getting an answer." } },
  },
}

-- Field Marshal Afrasiabi: Valley of Heroes; closes the Lord of Blackrock; loves plans and steam-engine siege history.
P:NPC {
  key = "field_marshal_afrasiabi", id = TODO_NPC("Field Marshal Afrasiabi"), name = "Field Marshal Afrasiabi",
  bible = "bibles/stormwind_more.md", role = "soldier", tier = "quest",
  communities = { "stormwind" }, temper = { "proud", "precise" }, values = { "order", "dutiful" },
  notices = { "soldier", "dragon", "siege" },

  impression = {
    first = "Field Marshal Afrasiabi stands under an arch in the Valley of Heroes with a sheaf of plans under his arm, and he warned me twice that he does not care for plans that go off track. Then he told me about steam-engine siege tactics for a quarter of an hour.",
    third = "{name} met Field Marshal Afrasiabi, a precise and talkative officer of the Stormwind Army in the Valley of Heroes.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a visitor. Do you have an appointment? No? Well, I'll make an exception, but write it down for next time." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, exactly as I'd anticipated. I do like it when things go according to plan." },
    { id = "g_nef", tags = { "news" }, when = { questDone = NEF }, text = "The slayer of Nefarian! Stand there, if you please, so the recruits can see what a properly executed operation looks like." },
    { id = "g_gnome", when = { race = "Gnome" }, text = "A gnome! Splendid. Have you a moment to discuss the steam tank? I've several questions and a diagram." },
  },

  notice = {
    { id = "n_nef", cat = "dragon", when = { cleared = "Blackwing Lair", faction = "Alliance" }, place = "before",
      text = "You've been to the top of Blackrock Spire and come down again, I can tell; nobody stands quite that straight unless they've survived something dreadful. Was it as badly fortified as my reports suggest?" },
    { id = "n_siege", cat = "siege", when = { profession = { name = "Engineering", min = 150 } }, place = "after",
      text = "You've an engineer's hands, I see, all burns and calluses. We simply must discuss boiler pressures some time, at length." },
    { id = "n_soldier", cat = "soldier", when = { pvpRank = 6 }, place = "after",
      text = "You wear a knight's rank from the Champions' Hall, I see. It's good to see the battlegrounds producing officers and not only scars." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "Field Marshal Afrasiabi, Stormwind Army. I plan campaigns, review fortifications and, when I can find a willing ear, explain the fascinating history of steam-engine siege tactics, which nobody ever lets me finish." },
        { id = "h_low", when = { maxLevel = 40 }, text = "Field Marshal Afrasiabi. You're a long way from the sort of campaign I plan, but I admire anyone who walks into the Valley of Heroes with that much confidence. Have you thought of a career in the army?" },
        { id = "h_nef", tags = { "news" }, when = { questDone = NEF }, text = "Citizens of the Alliance, I told them from the Valley, the Lord of Blackrock is slain! I'd rehearsed that for six years in case the day came, and you gave me the chance to say it, so thank you." },
        { id = "h_nef_before", when = { cleared = "Onyxia's Lair", faction = "Alliance", ["not"] = { questDone = NEF } }, text = "You've slain Onyxia, and the Black Dragon's son still sits in his lair above Blackrock Spire. If you mean to finish the family, I have reports on Blackwing Lair, and I'd be delighted to share them." },
      },
      again = {
        { id = "h_again", text = "Next item on the agenda?" },
        { id = "h_again2", text = "Anything further? I've a whole afternoon blocked out." },
        { id = "h_again3", text = "Go on, please. I'm taking notes." },
      },
      choices = {
        { text = "You don't like plans going off track?", next = "plans" },
        { text = "Steam-engine siege tactics? Tell me.", next = "siege" },
        { text = "What do we know of Blackrock Spire?", next = "spire" },
        { text = "How is the Stormwind Army faring?", next = "army" },
        { text = "Nefarian is dead, Field Marshal.", next = "nefdone", when = { questDone = NEF } },
        { text = "Onyxia was Nefarian's sister. Did you know?", next = "xmasq", when = { questDone = MASQUERADE } },
        { text = "I've ridden in a steam tank, actually.", next = "xgnome", when = { race = "Gnome" } },
        { text = "The Dark Irons hold the mountain beneath the spire.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "What do you think of the battlegrounds?", next = "xbattle", when = { pvpRank = 1 } },
        { text = "Do you have something for me?", next = "BUSINESS", when = { questDone = NEF } },
        { text = "I must be going.", next = "END" },
      },
    },

    plans = {
      lines = {
        { id = "p_default", text = "Not in the least, no. A plan is a promise you make to your soldiers that you've thought about their lives before you spent them, and when it goes off track it's usually because someone didn't read it." },
      },
      choices = {
        { text = "What happened when one did go off track?", next = "plans_offtrack" },
        { text = "What are you planning at the moment?", next = "plans_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plans_offtrack = {
      lines = {
        { id = "po_default", text = "Grim Batol, in the Second War, when a gnomish battery arrived on the wrong side of a river because someone had copied the map backwards. We lost a day, a bridge and the battery, and I've personally checked every map since." },
      },
      choices = {
        { text = "War never goes to plan. You have to adapt.", next = "plans_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plans_stance = {
      big = true,
      lines = {
        { id = "ps_default", text = "Adapting is what you do when your plan was bad, and I've known commanders who made a career of it. In fairness, the enemy rarely reads my plans, which is inconsiderate of them." },
      },
      choices = {
        { text = "A good plan and discipline win wars.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Instinct wins wars. Plans are for clerks.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    plans_now = {
      lines = {
        { id = "pn_default", text = "Seven things, in order of urgency, beginning with Blackrock and the Westfall garrison and ending with a better drainage scheme for the barracks, and three I'm not permitted to discuss in the open air. The drainage is going best, sadly." },
        { id = "pn_nef", when = { questDone = NEF }, text = "The aftermath of your work at Blackrock, mostly, and a better drainage scheme for the barracks. I'll confess the drainage is the one I'm enjoying." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    siege = {
      lines = {
        { id = "s_default", text = "Oh, splendid, nobody ever asks! In the Second War the gnomes of Gnomeregan gave the Alliance its first steam-driven engines, and it changed how we besieged a fortress forever. Before that, it was rams and ladders and a great many funerals." },
      },
      choices = {
        { text = "How did the steam engines change things?", next = "siege_history" },
        { text = "Something else.", next = "BACK" },
      },
    },
    siege_history = {
      lines = {
        { id = "sh_default", text = "Weight, mostly. A steam engine could carry armour no horse could and push a ram no team of men could, and it didn't panic when the orcs started screaming. The trouble was the boilers, which had a tendency to, well, I'll come to the boilers." },
      },
      choices = {
        { text = "What about the boilers?", next = "siege_more" },
        { text = "Fascinating. Something else, perhaps?", next = "BACK" },
      },
    },
    siege_more = {
      lines = {
        { id = "sm_default", text = "There's a whole chapter on the boilers, and I'll spare you the pressures and the rivet counts, which is a sacrifice on my part. The short of it is that a gnomish engine wins a siege beautifully, provided you stand well behind it." },
      },
      choices = {
        { text = "Machines will win the next war, not soldiers.", next = "siege_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    siege_stance = {
      lines = {
        { id = "ss_default", text = "Machines will help, but a machine has no courage, and it doesn't hold a line when the boiler goes cold. You need both, and the officer who forgets either one ends up with a very expensive pile of scrap." },
      },
      choices = {
        { text = "Then trust the soldiers first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then build better machines and fewer graves.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    spire = {
      lines = {
        { id = "sp_default", text = "A fortress on top of a mountain on top of another fortress, which is the worst possible siege a man could plan. The Dark Irons hold the depths, the Blackrock orcs hold the spire, and the Black Dragonflight holds whatever's above that.",
          fx = { learn = { "blackrock" } } },
      },
      choices = {
        { text = "Who leads the orcs up there?", next = "spire_rend" },
        { text = "And the dragons?", next = "spire_nef" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spire_rend = {
      lines = {
        { id = "sr_default", text = "Rend Blackhand, who calls himself Warchief of the Horde and has never been forgiven for it by the other orcs. He's cruel, he's vain and he's kept in power by something larger than him, which is the part that worries me." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    spire_nef = {
      lines = {
        { id = "sn_default", text = "Nefarian, son of Deathwing, if my reports are true, and they're usually true by the third copy. He's making something up there, the scouts say, dragons of every colour bound together, and that is not a plan I would ever like to see succeed." },
      },
      choices = {
        { text = "Then the army should march on him.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then send a small band to kill him quietly.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    army = {
      lines = {
        { id = "a_default", text = "Stretched, and I say so plainly in every report. We've soldiers in Westfall, in Redridge, in Duskwood, in the Wetlands and at Nethergarde, and not one of those garrisons has what it asked for." },
      },
      choices = {
        { text = "Why so thin?", next = "army_thin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    army_thin = {
      lines = {
        { id = "at_default", text = "The king is missing, the treasury is careful, and the House of Nobles argues over every copper while the garrisons go hungry. Adventurers fill the gaps, and I'll admit I'm grateful, though it does play havoc with my planning." },
        { id = "at_masq", when = { questDone = MASQUERADE }, text = "Partly because a dragon sat at court and whispered against every budget we sent up, as it turns out. I've reread three years of rejected requests in a new light, and I was not pleased." },
      },
      choices = {
        { text = "Adventurers should be under the army's command.", next = "army_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    army_stance = {
      lines = {
        { id = "as_default", text = "I've proposed it four times, with diagrams, and the Highlord says free folk fight harder than conscripts. He may be right, though it makes my maps very untidy." },
      },
      choices = {
        { text = "The Highlord's right. Leave adventurers free.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "You're right. Untidy forces lose battles.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    nefdone = {
      lines = {
        { id = "nd_default", text = "Slain, and his head on our gate beside his sister's, which I'd not have dared write into any plan. I read your account three times over; I wanted to be sure I wasn't dreaming it." },
      },
      choices = {
        { text = "What happens to Blackrock now?", next = "nefdone_hang" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nefdone_hang = {
      lines = {
        { id = "nh_default", text = "The orcs will squabble, the Dark Irons will dig deeper, and Redridge will have a quiet summer for the first time in years. I've already drafted three plans for the aftermath, and none of them will survive contact with the House of Nobles." },
      },
      choices = {
        { text = "Then strike the mountain now, while they're weak.", next = "nefdone_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nefdone_stance = {
      lines = {
        { id = "ns_default", text = "That is the fourth plan, and the Highlord says the army can't spare the soldiers. You've given us the chance, and I hate to see a chance wasted, but I'll not send men up a mountain without enough of them." },
      },
      choices = {
        { text = "Wait, then. A careless strike wastes the victory.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Strike anyway. Show them no rest and no mercy.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xmasq = {
      lines = {
        { id = "xm_default", text = "I knew there was a pattern in the rejected requests, but I'd never have guessed a dragon. Two children of Deathwing, one in the court and one in the mountain; it was a better plan than any of mine, and I'm told I should be ashamed to admire it." },
      },
      choices = {
        { text = "You should be. They nearly destroyed us.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Admire it. Then learn from it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "You have? Inside it, while it was running? Tell me everything, starting with the boiler pressure and ending with whether you still have both eyebrows." },
      },
      choices = {
        { text = "One eyebrow. The left one.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Perhaps another time, Field Marshal.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = {
        { id = "xd_default", text = "They do, and every map I have of Blackrock Depths came from an Ironforge scout who didn't come back the second time. I'd value your people's advice on that mountain above anyone's." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xbattle = {
      lines = {
        { id = "xb_default", text = "Alterac, Warsong and Arathi are teaching a generation of soldiers to fight the Horde, and that's useful. They're also teaching them to forget the Scourge and the dragons, which is less so, and I've written a memorandum on it." },
      },
      choices = {
        { text = "The Horde is the real enemy. They're right to fight.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "You're right. The Scourge matters more.", next = "BACK", fx = { align = { honor = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a career officer with a fondness for maps, plans and steam. The rest is in my file, which is very well organised." , next = "plans" } },
    advice = { { id = "tp_ad", text = "Read the plan. Then read it again. Then stand well behind the steam engine." } },
    blackrock = { { id = "tp_blackrock", text = "Blackrock is a fortress on a fortress, with dragons on top, and I have a folder on it whose folders have folders.", next = "spire" } },
    _none = { { id = "tp_none", text = "That's not in any report I've seen, and I've seen most of them. Put it in writing and I'll look into it." } },
  },
}

-- Lieutenant Karter: war mount quartermaster outside the Champions' Hall, Old Town.
P:NPC {
  key = "lieutenant_karter", id = TODO_NPC("Lieutenant Karter"), name = "Lieutenant Karter", title = "War Mount Quartermaster",
  bible = "bibles/stormwind_more.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "brisk", "sharp" }, values = { "dutiful", "proud" },
  notices = { "rank", "mount" },

  impression = {
    first = "Lieutenant Karter keeps the war mounts outside the Champions' Hall in Old Town and judges every rider by the rank on their collar before she looks at their face, which she admits is a bad habit and refuses to break.",
    third = "{name} met Lieutenant Karter, who sells war mounts to the Alliance's highest-ranked soldiers outside Stormwind's Champions' Hall.",
  },

  greetings = {
    { id = "g_default", text = "Champions' Hall is behind me, and the war mounts are beside me, and both are for officers. What can I do for you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Let's see if that rank has moved since last time." },
    { id = "g_commander", when = { pvpRank = 11 }, text = "Commander! Stand easy, sir; you've earned the right to choose your mount, and I've a beauty waiting." },
    { id = "g_none", when = { pvpRank = false }, text = "No rank on you that I can see. The battlegrounds are calling, soldier, if you've the stomach for them." },
  },

  notice = {
    { id = "n_rank", cat = "rank", when = { pvpRank = { min = 6, max = 10 } }, place = "after",
      text = "You're closing on Commander, I can see it in the stripes. Keep at it; the mounts will still be here, and I'll make sure the best of them waits." },
    { id = "n_mount", cat = "mount", when = { mounted = true }, place = "before",
      text = "That's a fine animal you're on, but it's a parade horse, not a war mount. Ride it into Alterac and you'll see the difference by the second charge." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "Lieutenant Karter, war mount quartermaster to the Alliance. I keep the finest battle-trained beasts in the kingdom for those who've earned a Commander's rank, and I keep them away from everyone else." },
        { id = "h_commander", when = { pvpRank = 11 }, text = "A Commander of the Alliance, at my stall, and not before time. The steed, the ram, the battlestrider or the tiger, sir, and don't let anyone tell you the choice doesn't matter." },
      },
      again = {
        { id = "h_again", text = "Anything else, soldier?" },
        { id = "h_again2", text = "Go on. I'm only grooming." },
        { id = "h_again3", text = "Next question. Quickly, please." },
      },
      choices = {
        { text = "What makes a war mount different?", next = "mounts" },
        { text = "Where is the fighting, these days?", next = "fronts" },
        { text = "Tell me about the Champions' Hall.", next = "hall" },
        { text = "How does one earn rank?", next = "rank" },
        { text = "I'm a Commander now. I'm ready.", next = "xcommander", when = { pvpRank = 11 } },
        { text = "I've no rank. Is that a problem?", next = "xunranked", when = { pvpRank = false } },
        { text = "Do you keep a war tiger for night elves?", next = "xnelf", when = { race = "NightElf" } },
        { text = "A war ram? For a dwarf?", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "A battlestrider? Gnomish engineering at its finest.", next = "xgnome", when = { race = "Gnome" } },
        { text = "I prefer my charger. The Light gave it to me.", next = "xpaladin", when = { class = "PALADIN", minLevel = 60 } },
        { text = "Show me the mounts.", next = "BUSINESS" },
        { text = "Good day, Lieutenant.", next = "END" },
      },
    },

    mounts = {
      lines = {
        { id = "m_default", text = "Armour, training and temper. A war mount wears plate, doesn't flinch at fire or steel, and will go through a line of grunts rather than around it. Any farmer can sell you a horse, but only the Alliance can sell you one that's been to war." },
      },
      choices = {
        { text = "What breeds do you keep?", next = "mounts_breeds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mounts_breeds = {
      lines = {
        { id = "mb_default", text = "Black war steeds from the Stormwind stables, black war rams from Ironforge, battlestriders from the gnomes, and war tigers from Darnassus, each trained for the battlegrounds. They're bred and broken for one thing, and they're very good at it." },
      },
      choices = {
        { text = "Breeding animals only for war is cruel.", next = "mounts_stance" },
        { text = "Who looks after them?", next = "mounts_care" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mounts_stance = {
      big = true,
      lines = {
        { id = "ms_default", text = "Is it crueller than sending soldiers on a horse that panics at the first fireball? I've seen what happens when they do, and a beast that's been trained under fire is a kindness to horse and rider both." },
      },
      choices = {
        { text = "Fair. A ready beast saves lives on both sides.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Still cruel. War shouldn't be bred into anything.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mounts_care = {
      lines = {
        { id = "mc_default", text = "I do, with two grooms and a farrier who drinks, and the tiger has a Sentinel who comes on her rest days to brush it. I was cavalry before I was a quartermaster, and I'd still rather muck out a stall than sign a requisition." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    fronts = {
      lines = {
        { id = "f_default", text = "Alterac Valley, where the Stormpike Guard fights the Frostwolf orcs; Warsong Gulch, where the Silverwing Sentinels fight over Ashenvale's timber; and Arathi Basin, where the League of Arathor fights for the old Stromgarde farms. The Horde's on all three, and it doesn't give ground easily." },
      },
      choices = {
        { text = "Which front matters most?", next = "fronts_valley" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fronts_valley = {
      lines = {
        { id = "fv_default", text = "Alterac, if you ask me, because whoever holds it holds the road between Lordaeron and the south. The others are skirmishes for timber and grain, and the Horde would say the same thing about our skirmishes." },
      },
      choices = {
        { text = "The Horde forces us to fight. They started this.", next = "fronts_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fronts_stance = {
      lines = {
        { id = "fs_default", text = "Some say they did and some say we did, and the Frostwolves will tell you they were there first. I sell war mounts, soldier; I don't settle quarrels between the Stormpikes and the orcs." },
      },
      choices = {
        { text = "Then let's finish it. No quarter to the Horde.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "There might be peace, if anyone tried.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hall = {
      lines = {
        { id = "h2_default", text = "The Champions' Hall, where the Alliance honours those who've fought hardest against the Horde, and where the quartermasters keep their best gear. Sergeant Major Clate keeps the armour, and he's a dwarf, so don't argue prices with him." },
      },
      choices = {
        { text = "Tell me about Clate.", next = "hall_clate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall_clate = {
      lines = {
        { id = "hc_default", text = "A good soldier and a terrible card player, and he'll measure you for armour as though you were going to a wedding. He keeps the officers' plate and the commanders' tabards, and he makes sure nobody wears what they haven't earned." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    rank = {
      lines = {
        { id = "r_default", text = "Honour, earned in battle against the Horde, and counted every week by clerks who've never held a sword. Private first, then Corporal, and so on up through the Knights to Commander and beyond, and every step is harder than the last." },
      },
      choices = {
        { text = "Is it worth it, all that fighting for a title?", next = "rank_worth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rank_worth = {
      lines = {
        { id = "rw_default", text = "For a war mount, a seat in the Hall and the respect of every soldier in Stormwind, I'd say so. But I've seen good folk spend a year in the battlegrounds and come out of it with nothing but a rank and a temper." },
      },
      choices = {
        { text = "Glory's worth the price. Rank means something.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A title's nothing. I fight for my own reasons.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xcommander = {
      lines = {
        { id = "xc_default", text = "So you are, sir, and it's been a pleasure watching the stripes come in. Take your pick, and ride it into Alterac first, so the Frostwolves know who they're dealing with." },
      },
      choices = {
        { text = "I'll ride it there tomorrow.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xunranked = {
      lines = {
        { id = "xu_default", text = "Not a problem, only a fact. You can still look, and I'll even let you pat the ram, but you'll need to earn the rest in Alterac or Warsong or Arathi like everyone else." },
      },
      choices = {
        { text = "Then I'll earn it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = {
        { id = "xn_default", text = "I do, for the Sentinels' sake, and it was trained in Ashenvale before it came here. It doesn't like me, it likes your people, and I've stopped taking it personally." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdwarf = {
      lines = {
        { id = "xd_default", text = "A black war ram, armoured from horn to hoof, and the most stubborn creature I've ever shod. You'll get on wonderfully." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgnome = {
      lines = {
        { id = "xg_default", text = "Finest is one word for it, and loudest is another. It never tires, never bolts and never eats, and it threw a cog into my lap last week, so I'll leave the maintenance to you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpaladin = {
      lines = {
        { id = "xp_default", text = "A paladin's charger is a fine beast, and I'll not say a word against a gift of the Light. But it's never been trained to charge a line of Frostwolf riders, and mine have." },
      },
      choices = {
        { text = "The Light's charger answers to no one but me.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fair point. I'd ride whichever wins.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Cavalry first, then quartermaster, then this stall. I miss the cavalry, but the mounts here are better." } },
    trade = { { id = "tp_tr", text = "I sell war mounts to Commanders and above. Earn the rank and we'll talk.", next = "mounts" } },
    _none = { { id = "tp_none", text = "Not my department, soldier. Ask a clerk; they've nothing else to do." } },
  },
}
