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
        { id = "ww_default", text = "A young man named in no book you'll find, who thought his voidwalker was fond of him. We burned what was left in the furnace upstairs, and Jarel has never once asked what we were burning." },
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
        { id = "pu_default", text = "Everything, eventually, and she sells none of it, which is why she's still alive. If you ever want to know who in the cellar has been careless, ask Ursula, and bring something better than coin." },
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
    background = { { id = "tp_bg", text = "Old enough to remember when the orcs' warlocks first came through the Portal, and wise enough to have studied them since.", next = "elder" } },
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
        { id = "h_lock", when = { class = "WARLOCK" }, text = "Sandahl, and you know why you've come down. Keep up with your training, {class}, or you'll find yourself in the fate you've been warned of, and I'd rather not have to sweep up after you." },
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
        { id = "cw_default", text = "Curse of Agony, for its honesty: it hurts a little, then a great deal, and there's nothing the victim can do but wait. I find there's a lesson in that for most people, not only my enemies." },
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
        { id = "po_default", text = "Turned a people of shamans into a horde of butchers, and it's still in the blood of every orc in the internment camps, by the look of them. I keep that in mind whenever a student tells me he can stop whenever he likes." },
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
        { id = "wc_default", text = "Its scraps, at least: cultists in Elwynn's caves and the hills of Duskwood, reading pages they stole from orcs who stole them from demons. Every one of them thinks he's the first to find the book, and every one of them is wrong in the same way." },
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
        { id = "xr_default", text = "Then you know what the Scourge does to a soul, and you've come to learn how to do it back. I won't pretend that's noble, but I understand it better than most reasons I'm given." },
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
    background = { { id = "tp_bg", text = "I've taught in this cellar a long while, and studied a great deal longer. That's as much of my life as I give to strangers." } },
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
        { id = "wh_default", text = "With the right materials and a great deal of quiet, and I'll teach the rest to a tailor who can pay for it. I'll tell you this much for free: it won't take in a room with a window, and that's why I'm in a cellar." },
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
        { id = "bp_default", text = "Ones who've walked the shadow and come back, and ones from Ironforge and the Cathedral both, and none of them would thank me for a name. Discretion is half of what they pay for, and the stitching is the other half." },
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
        { id = "c_default", text = "The warlocks are good customers and better neighbours than you'd think; they don't drop crumbs on the cloth and they never ask for credit. Demisette tolerates me, Gakin flirts badly, and Sandahl pays on time." },
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
    advice = { { id = "tp_ad", text = "Never rush a row. Cloth remembers haste." } },
    _none = { { id = "tp_none", text = "That's not woven into anything I know. Try someone with a window." } },
  },
}

-- Jarel Moor: bartender of the Slaughtered Lamb; knows exactly what's under his floor.
P:NPC {
  key = "jarel_moor", id = TODO_NPC("Jarel Moor"), name = "Jarel Moor", title = "Bartender",
  bible = "bibles/stormwind_more.md", role = "innkeeper", tier = "service",
  communities = { "stormwind" }, temper = { "steady", "dry" }, values = { "discreet", "practical" },
  notices = { "drink", "cellar" },

  impression = {
    first = "Jarel Moor tends bar at the Slaughtered Lamb, polishes the same cup for a very long time, and told me twice to stay away from the shadows, as if that were a sensible thing to say in a tavern with a warlock cellar under it.",
    third = "{name} met Jarel Moor, bartender of the Slaughtered Lamb in Stormwind's Mage Quarter.",
  },

  greetings = {
    { id = "g_default", text = "What'll it be? And stay away from the shadows, friend, if you know what's good for you." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Same as last time, or are you feeling brave?" },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Going down? Wipe your feet on the way back up; whatever's on the cellar floor, I don't want it on mine." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late for a drink, but not late for this place. Pull up a stool and keep your back to the wall." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Heard your name spoken kindly across the Quarter. That's rarer in here than an honest dice game." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true }, place = "replace",
      text = "You've had enough, friend, and I say that as a man who makes his living from the opposite. Sit a while and let the floor stop moving before you try those stairs." },
    { id = "n_cellar", cat = "cellar", when = { origin = "human_lamb_cellar" }, place = "before",
      text = "I know your face from the stairs, and I've never once said so to anyone. I'll keep on not saying it, so long as you keep tipping." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", text = "Jarel Moor, and this is the Slaughtered Lamb, and the drinks are honest even if the clientele aren't. I'll pour you something if you like, but stay away from the shadows; that's free advice and the best thing I sell." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "Another one for downstairs, is it? I don't ask and I don't tell, and I'd take it kindly if you didn't bring anything back up with you that wasn't there when you went down." },
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
        { text = "Do the warlocks treat you well?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Thunderbrew, you said? Prove it.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Pour me something.", next = "BUSINESS" },
        { text = "I'll be going.", next = "END" },
      },
    },

    drink = {
      lines = {
        { id = "d_default", text = "Ale from the Elwynn brewers, wine that's honest about being cheap, and Moonberry Juice for the ones who've an appointment downstairs and need a clear head. Nobody comes to the Lamb for the drink, friend, but nobody's died of it either." },
      },
      choices = {
        { text = "Moonberry Juice? For warlocks?", next = "drink_house" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink_house = {
      lines = {
        { id = "dh_default", text = "You'd be surprised how many of them don't touch a drop; a slip of the tongue down there can cost more than a slip of the hand. Ursula drinks it by the jug, and I've never once seen her merry." },
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
        { id = "xl_default", text = "Well enough; they pay on time and they never start fights, which is more than I can say for the mages. I'd only ask your friends below to stop borrowing my furnace without telling me what goes in it." },
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
      text = "There's something on you I don't like, and I suspect you know exactly what it is. You're in a house of the Light, so mind yourself while you're under its roof." },
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
        { id = "h_lock", when = { class = "WARLOCK" }, text = "I'm Katherine, and you'll forgive me if I don't offer my hand. The Light shelters everyone under this roof, even you, so long as you give it no reason to stop." },
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
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Light be with you. I'll admit you're not my usual sort of customer, but flash powder is flash powder, and I'd rather sell it here than have you buy it from someone in Old Town." },
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
        { text = "You admire him a great deal.", next = "benedictus_view" },
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
        { id = "xm_default", text = "Because the sisters bless the feathers, and a mage who falls slowly falls better with a blessing, or so I tell them. Truly, the Mage Quarter's vendors charge twice what I do, and your masters are all rather careful with coin." },
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
        { id = "xr_default", text = "I know, I know, and Bishop Farthing raised an eyebrow so high I worried for it. But a rogue who can vanish is a rogue who can walk away from a fight, and I'd rather sell a way out than see one more body carried up the nave." },
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
    background = { { id = "tp_bg", text = "A candle-seller's son who delivered a box to the Cathedral and never left.", next = "vow" } },
    trade = { { id = "tp_tr", text = "Reagents, blessed and counted. Ask me about any of them, and I'll tell you more than you wanted.", next = "wares" } },
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
        { id = "lf_default", text = "Very little, after the first year, and then a great deal when they found out what I knew about my uncle's debts. We get on wonderfully now, I'm pleased to say, because they're all a little afraid of me." },
      },
      choices = {
        { text = "Blackmailing your own family? That's low.", next = "lord_choice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lord_choice = {
      big = true,
      lines = {
        { id = "lc_default", text = "Low is where the useful things are kept, friend. I never asked them for a copper, mind you; I only made sure they'd never ask me to be anyone but myself again." },
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
        { id = "ss_default", text = "Quiet, patient and a very poor card player, because he never takes a risk he hasn't already measured. I like him a great deal, and I'd never turn my back on him, and I think he'd say the same of me." },
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
        { id = "d_default", text = "Masons who were cheated, then thieves who were organised, and now something with more money than either should have. Someone's paying them, and it isn't the farmers of Westfall.",
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
    background = { { id = "tp_bg", text = "A younger son who preferred cards to court. The rest you'll have to steal.", next = "lord" } },
    advice = { { id = "tp_ad", text = "Never play fair, and never tell anyone you didn't." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. Ask me again when you've something to trade for it." } },
  },
}
