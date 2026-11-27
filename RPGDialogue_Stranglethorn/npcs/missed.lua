-- Stranglethorn folk a roster scan found missing: Corporal Kaleb (the Rebel Camp's cook), Cowardly
-- Crosby on the Wild Shore, Riggle Bassbait and Jang of the fishing contest, Jaxin Chong and McGavan in
-- Booty Bay, Knaz Blunderflame on his hill by the ogre mound, Krakk at Grom'gol and Maywiki of Zuldazar
-- on Yojamba Isle. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Jang: Riggle Bassbait's apprentice; buys tastyfish from anglers who didn't win.
P:NPC {
  key = "jang", id = TODO_NPC("Jang"), name = "Jang", title = "Fishmaster Apprentice", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "sharp", "dry" }, values = { "profit", "ambition" },
  notices = { "craft" },
  impression = {
    first = "Jang counts fish beside Riggle Bassbait on the Booty Bay dock and buys the catch of everyone who didn't win. She is quieter than her boss and a good deal more exact, and she plainly knows what his job is worth.",
    third = "{name} met Jang, the Fishmaster's apprentice at Booty Bay's fishing contest.",
  },
  greetings = {
    { id = "g_default", text = "Tastyfish in lots of five, pal, and I count 'em myself. Don't hand me four and a boot." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, you count honest, and that puts you ahead of half this dock." },
  },
  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You hold that pole like you've done it before. Keep it quiet, though, or the boss'll put you on a poster." },
  },
  start = "hello",
  nodes = {
    w8_fish = {
      lines = { { id = "w8_fish_a", text = "Fish? Pal, I count fish, I buy fish and I sell fish, and the one thing I don't do is stand in the water waitin' for one. The boss says an apprentice ought to know the rod, so I own one, and it's in the back with the price tag still on it." } },
      choices = {
        { text = "You might be good at it.", next = "w8_fish2" },
        { text = "Smart. The money's in the buying.", next = "w8_fish2" },
        { text = "Something else, Jang.", next = "BACK" },
      },
    },
    w8_fish2 = {
      lines = { { id = "w8_fish2_a", text = "Maybe, and maybe one Sunday I'll enter the contest and win it, and then who buys the losers' fish? Nobody, sweetheart, and that's a whole week's margin gone, so the rod stays in the back." } },
      choices = {
        { text = "Spoken like a true goblin.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    gt_price = {
      lines = { { id = "gt_price_l", text = "Fair coin for five, and no haggling on contest day, because I've got a line of anglers behind you. Bring 'em fresh, though, since the boss can smell a two-day fish from the docks." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gt_goblin = {
      lines = { { id = "gt_goblin_l", text = "Not often, pal, because our kind are too busy sellin' bait to the people fishin'. You and I both know where the money in this bay is, and it ain't in the trophy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", key = true, text = "Jang, Fishmaster's apprentice. The boss does the shoutin' and hands out the glory, and I buy up every tastyfish that didn't win, which is where the actual margin is." } },
      again = {
        { id = "h_again", text = "What else? I've got a tally runnin', so make it worth the lost count." },
        { id = "h_again2", text = "Go on, then. I can tally the master's catch and hear you out at the same time, and I'll not lose count." },
      },
      choices = {
        { text = "Why buy the losers' fish?", next = "buy" },
        { text = "What's it like working for Riggle?", next = "boss" },
        { text = "You sound like you want his job.", next = "job" },
        { text = "Who cheats worst on contest day?", next = "cheats" },
        { text = "I've hauled a few tastyfish myself. What do you pay?", next = "gt_price", when = { profession = "Fishing" } },
        { text = "Do goblins ever win the contest?", next = "gt_goblin", when = { race = "Goblin" } },
        { text = "Do you ever fish yourself, Jang?", next = "w8_fish" },
        { text = "Keep counting, Jang.", next = "END" },
      },
    },
    buy = {
      lines = { { id = "b_default", text = "Because one guy wins and three hundred don't, sweetheart, and every one of those three hundred is standin' on my dock with a sack of fish and a sour face. I take 'em five at a time for fair coin, they leave happy, and they come back next Sunday." } },
      choices = {
        { text = "And what happens to all that fish?", next = "fish" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish = {
      lines = { { id = "f_default", text = "The inn, the ships' cooks, and a fella in Ratchet who smokes 'em and won't say who buys it. By Monday mornin' I've sold every tail for more than I paid, and the boss still thinks the contest is the business." } },
      choices = {
        { text = "The contest is only the bait.", next = "bait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bait = {
      lines = { { id = "ba_default", text = "Now you're thinkin' like a goblin. Keep that under your hat, pal, because I've got another year on my contract and I'd like to finish it on good terms." } },
      choices = { { text = "Not a word from me. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    boss = {
      lines = { { id = "bo_default", text = "Loud, mostly. But he talked the Baron into lettin' strangers flood the town once a week, and nobody else on this wharf could've sold that, so I listen when he talks, and I write some of it down." } },
      choices = { { text = "He sounds worth studying. Something else.", next = "BACK" } },
    },
    job = {
      lines = { { id = "j_default", text = "Sure I do, and he knows it, and he'd think less of me if I didn't. That's what an apprentice is, friend: somebody who's learnin' your business so they can take it off you politely." } },
      choices = { { text = "Honest, in a goblin way. Something else.", next = "BACK" } },
    },
    cheats = {
      lines = { { id = "c_default", text = "It ain't the pirates, if you can believe that, because they just want to win. It's the respectable ones, who pad a lot of five with a mackerel in the middle and act hurt when I find it." } },
      choices = { { text = "It's always the respectable ones. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm apprenticed to the Fishmaster, on contract. I count the fish and I learn the trade, and both are goin' fine." } },
    _none = { { id = "tp_none", text = "Not my department, pal. If it don't come in lots of five, I can't price it." } },
  },
}

-- Maywiki of Zuldazar: Zandalari on Yojamba Isle who speaks for the tribe to druids and shaman.
P:NPC {
  key = "maywiki", id = TODO_NPC("Maywiki of Zuldazar"), name = "Maywiki of Zuldazar", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "serene", "sly" }, values = { "devout", "balance" },
  notices = { "race" },
  impression = {
    first = "Maywiki of Zuldazar sits a little apart on Yojamba Isle, and speaks for the Zandalar to those who walk with spirits and wild things. She laughed softly before she answered anything, as though she'd heard my questions on the wind already.",
    third = "{name} met Maywiki of Zuldazar, who speaks for the Zandalar tribe to druids and shaman on Yojamba Isle.",
  },
  greetings = {
    { id = "g_default", when = { ["not"] = { class = { "DRUID", "SHAMAN" } } }, text = "De spirits did not send you to Maywiki, {class}, but sit if you like. Dere be others on dis isle who trade wit' your kind." },
    { id = "g_wild", when = { class = { "DRUID", "SHAMAN" } }, text = "Ah, here be one de wind was whispering about. Come and sit, child of de wild, for Maywiki has been waiting on you." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and de jungle has not eaten you yet. Dat is good, and de spirits be pleased wit' it." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, far from de islands. Your tribe is young, little cousin, but de loa remember your name, and so does Maywiki." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "De big ones from de grasslands always walk softly here. Your Earth Mother and our loa would have much to say to each other, I think." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Your people and mine were old before de others learned to speak, and we have not always been kind to each other. Today we share an enemy, and dat is enough." },
  },
  start = "hello",
  nodes = {
    w8_hear = {
      lines = { { id = "w8_hear_a", text = "De same way as you, {class}, by sitting still in de wild until de wild forgot I was dere and started talking. On Zuldazar, de young ones are sent into de jungle for a moon wit' nothing, and some come back hearing, and some come back hungry." } },
      choices = {
        { text = "And some don't come back.", next = "w8_hear2" },
        { text = "That sounds like a hard way to learn.", next = "w8_hear2" },
        { text = "Something else, Maywiki.", next = "BACK" },
      },
    },
    w8_hear2 = {
      lines = { { id = "w8_hear2_a", text = "And some do not, yes, and de spirits keep dem, which is not de worst fate. Maywiki came back hearing and a little hungry both, and she has never once regretted it, though she still cannot look at a mango." } },
      choices = {
        { text = "I'll keep my mangoes away from you.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, when = { ["not"] = { class = { "DRUID", "SHAMAN" } } }, text = "I be Maywiki of Zuldazar. I listen to de spirits of dis jungle for my people, and I deal wit' those outsiders who can hear dem too, so you may ask, but my trade is not for you." },
        { id = "h_wild", when = { class = { "DRUID", "SHAMAN" } }, text = "I be Maywiki of Zuldazar. De king's speakers deal wit' warriors and priests, and I deal wit' your kind, because you can hear what is wrong in Zul'Gurub witout being told." },
      },
      again = {
        { id = "h_again", text = "Ask what else you will. De spirits be patient, and so is Maywiki." },
        { id = "h_again2", text = "Speak, and I will listen wit' both ears." },
      },
      choices = {
        { text = "What do the spirits say of Zul'Gurub?", next = "spirits" },
        { text = "Why do the Zandalar trust outsiders?", next = "outsiders" },
        { text = "What do you ask of my kind?", next = "ask", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "Tell me of Zuldazar.", next = "zuldazar" },
        { text = "The elements here are troubled.", next = "elements", when = { class = "SHAMAN" } },
        { text = "The wild things here are afraid.", next = "beasts", when = { class = "DRUID" } },
        { text = "How did you come to hear the spirits, Maywiki?", next = "w8_hear" },
        { text = "Spirits keep you, Maywiki.", next = "END" },
      },
    },
    spirits = {
      lines = { { id = "s_default", text = "Dey do not say, dey scream. De loa of dis land be bound by de priests of Hakkar, tiger and snake and bat and all de rest, and deir power is poured into de Blood God like water into a pit." } },
      choices = {
        { text = "Can a bound loa be freed?", next = "freed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    freed = {
      lines = { { id = "f_default", text = "When de priest dat holds it falls, de binding breaks, and de loa goes home angry. I would not wish to be standing in dat temple when it happens, but I would very much like someone to be." } },
      choices = {
        { text = "And you would like it to be me.", next = "me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    me = {
      lines = { { id = "m_default", text = "Maywiki would never say so. Maywiki only tells you where de door is, and what is behind it, and den she watches which way your feet point." } },
      choices = { { text = "A sly answer. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    outsiders = {
      lines = { { id = "o_default", text = "Trust is a big word, {class}. We be few on dis isle and de Gurubashi be many, and a wise hunter does not ask de spear what tribe its wood came from." } },
      choices = { { text = "Honest enough. Something else.", next = "BACK" } },
    },
    ask = {
      lines = { { id = "a_default", text = "De Hakkari carry tokens of deir god, coins and bijous and stranger things, and each one is a small piece of his strength. Bring dem out of de city and into Zandalari hands, and you weaken him while my people learn your worth." } },
      choices = {
        { text = "And what does your tribe give in return?", next = "reward" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reward = {
      lines = { { id = "r_default", text = "Dat is between you and de tribe, and it grows wit' de tribe's regard for you. Zandalari do not forget a friend, but we be slow to name one, so do de work first and ask de price after." } },
      choices = { { text = "Work first, then. Something else.", next = "BACK" } },
    },
    zuldazar = {
      lines = { { id = "z_default", text = "It is de first city of de first tribe, on an island far to de south, where King Rastakhan sits and de loa walk closer dan dey do here. Every troll people dere is came out of Zandalar once, and dat is why dis shame in Zul'Gurub is ours to mend." } },
      choices = { { text = "A long way from home. Something else.", next = "BACK" } },
    },
    elements = {
      lines = { { id = "e_default", text = "You feel it too, den. De water near de city tastes of iron and de wind will not go over de walls, and when de elements shun a place, a shaman should ask what dey know dat she does not." } },
      choices = { { text = "I mean to ask them. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    beasts = {
      lines = { { id = "b_default", text = "Dey are, and well dey should be. De tigers and de raptors near Zul'Gurub have gone lean and strange, for de Blood God drinks from everyting dat lives in his shadow, and de wild knows a sickness before we do." } },
      choices = { { text = "Then it must be cut out. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I be of Zuldazar, of de Zandalar, and I came nort' wit' my people to see Hakkar put down again. I speak wit' de ones who hear de spirits." } },
    _none = { { id = "tp_none", text = "De spirits be silent on dat, and so Maywiki is silent too. Ask Molthor, who knows de king's mind." } },
  },
}
