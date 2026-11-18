-- Darnassus, the folk we had missed: Darnath Bladesinger (warrior trainer, Warrior's Terrace), Silvaria
-- (pet trainer) and Alassin (stable master) in the Cenarion Enclave, Elissa Dumas (the human portal
-- trainer in the Temple of the Moon), Lairn (banker) and Landria (bows and arrows, Tradesmen's Terrace).
-- Classic only. Voice: bibles/darnassus_folk.md
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Darnath Bladesinger (warrior trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "darnath", id = TODO_NPC("Darnath Bladesinger"), name = "Darnath Bladesinger", title = "Warrior Trainer",
  bible = "bibles/darnassus_folk.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "proud", "steady" }, values = { "honorable", "brave" },
  notices = { "class", "race", "kit" },

  impression = {
    first = "He sends his best students beyond Teldrassil to be tested by strangers.",
    third = "{name} met Darnath Bladesinger, a warrior trainer on Darnassus's Warrior's Terrace.",
  },

  greetings = {
    { id = "g_hello", text = "Stand where I can see your stance, {class}. Ah, yes, I see the work it needs." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned to the Terrace. Your stance is better; your guard is still lazy." },
    { id = "g_yorus", when = { questDone = TODO_QUEST("Yorus Barleybrew") },
      text = "You went to Redridge and passed the dwarf's trial, I'm told. Good; a warrior should be tested by strangers as well as by friends." },
    { id = "g_spirit", when = { questDone = TODO_QUEST("A Troubled Spirit") },
      text = "You spoke with the fallen hero in the Blasted Lands. Then you know what I meant when I said honor outlives the body." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor has done its duty and then some. Let it rest at a smith's before you ask any more of it." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf on the Terrace! Your people fight as if the ground owed them a debt, and I mean that as praise." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Darnath Bladesinger, and I train warriors on this terrace, kaldorei and allies alike. Arias'ta will tell you about our history; I'd rather show you where your feet go." },
        { id = "h_war", when = { class = "WARRIOR" },
          text = "A warrior of the Alliance. Good; I've lessons for you, and when you've outgrown them, I've trials for you in lands far from here." },
        { id = "h_yorus", tags = { "news" }, when = { questActive = TODO_QUEST("Yorus Barleybrew") },
          text = "Yorus Barleybrew waits at the Lakeshire inn in Redridge, and he's challenged every able warrior of the Alliance. Go and see what his trial is, and don't drink anything he hands you without asking first." },
        { id = "h_spirit", tags = { "news" }, when = { questActive = TODO_QUEST("A Troubled Spirit") },
          text = "There's a spirit at the entrance to the Blasted Lands, once a great hero of the Horde. A warrior's honor doesn't die with the body, and I think it would serve you well to speak with him." },
      },
      again = {
        { id = "h_again", text = "What else? Ask, then raise your guard." },
        { id = "h_again2", text = "Speak. The terrace isn't going anywhere." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What is a warrior's honor?", next = "honor" },
        { text = "Why send students to a Horde ghost?", next = "ghost" },
        { text = "Do you train many men here?", next = "men" },
        { text = "What do you think of human warriors?", next = "humans", when = { race = "Human" } },
        { text = "Farewell.", next = "END" },
      },
    },

    honor = {
      lines = { { id = "ho_default", text = "It's what you do when the fight's already lost and nobody's watching. Anyone can be brave in front of an army; a warrior is the one who's brave alone, and keeps faith with the dead." } },
      choices = {
        { text = "Honor is everything. I'll fight by it.", next = "BACK", reply = "Then fight by it when no one is looking, and I will believe you. Every recruit says it in the training yard, and very few say it at the end.", fx = { align = { honor = 1 } } },
        { text = "Honor's fine, but winning is better.", next = "BACK", reply = "Winning is fine, until you see what some will do to win. I have fought the ones who stopped caring about honour, and they did not stop anywhere.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ghost = {
      lines = { { id = "gh_default", text = "Because his honor was real, whatever banner he fought under, and you'll learn more from a true enemy than from a false friend. Warriors on both sides understand each other better than our leaders would like." } },
      choices = {
        { text = "An orc is still an orc.", next = "ghost_orc" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ghost_orc = {
      lines = { { id = "go_default", text = "So he is, and he still died well, and so may you, one day. Go and hear him, then tell me whether you still think it's that simple." } },
      choices = {
        { text = "Respect for a worthy foe costs nothing. I'll go.", next = "BACK", reply = "Good, and listen more than you speak while you are there. An enemy who died well has things to teach that no trainer can.", fx = { align = { light = 1 } } },
        { text = "I'll go, but I'll keep my blade ready.", next = "BACK", reply = "Keep it ready, then, and keep your ears open as well. A ghost cannot hurt you, but what he says just might.", fx = { align = { light = -1 } } },
      },
    },

    men = {
      lines = { { id = "me_default", text = "Plenty. The Sentinels are the Sisterhood's and they're mostly women, but the terrace is anyone's who'll pick up a blade, and the men of Darnassus have found a place here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    humans = {
      lines = { { id = "hu_default", text = "Quick to learn and quick to forget, and braver than they've any right to be with such short lives. The ones who came to Hyjal fought beside us when they could have fled, and I haven't forgotten it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
}

---------------------------------------------------------------------------
-- Silvaria (pet trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "silvaria", id = TODO_NPC("Silvaria"), name = "Silvaria", title = "Pet Trainer",
  bible = "bibles/darnassus_folk.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "gentle", "calm" }, values = { "nature", "patient" },
  notices = { "pet", "class" },

  impression = {
    first = "She speaks to the beasts first and their hunters second.",
    third = "{name} met Silvaria, the pet trainer in the Cenarion Enclave.",
  },

  greetings = {
    { id = "g_hello", text = "Bring your companion closer, please. I'd like to meet it properly." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Your companion looks prouder than last time." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "{pet} has learned much from you, I can see it. Some of it is even good." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I am Silvaria, and I teach your companions what they're ready to learn. A beast can learn as much as a student, if you're patient, and much more if you're kind." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, and your companion with you. Let's see what it's ready for, and what you're ready to let it do." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Ask; your companion is listening too." },
        { id = "h_again3", text = "Go on. I'll keep scratching behind this one's ears while you think." },
      },
      choices = {
        { text = "Train my companion.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How do you know what a beast needs?", next = "know" },
        { text = "Is a pet a weapon or a friend?", next = "friend" },
        { text = "What can a beast learn, really?", next = "tricks" },
        { text = "You greeted my companion before me.", next = "first" },
        { text = "My companion never listens to me.", next = "stubborn", when = { class = "HUNTER", pet = true } },
        { text = "Do druids learn from beasts as you do?", next = "druid", when = { class = "DRUID" } },
        { text = "Thank you.", next = "END" },
      },
    },
    know = {
      lines = { { id = "kn_default", text = "You watch it, for a long time, without wanting anything from it. Most hunters watch their pets only when they need them, and the beasts know that very well." } },
      choices = {
        { text = "What should I be watching for?", next = "know_watch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    know_watch = {
      lines = { { id = "kw_default", text = "The ears first, then the tail, then where it chooses to lie down when you make camp. A beast that lies with its back to you trusts you, and one that lies facing you is still deciding." } },
      choices = {
        { text = "And if it lies far away?", next = "know_far" },
        { text = "Something else.", next = "BACK" },
      },
    },
    know_far = {
      lines = { { id = "kf_default", text = "Then it's unhappy, and you'll have done something to make it so, most likely by forgetting to feed it or by asking too much of it in a fight. Feed it something it loves and sit nearby without speaking, and it will come back to you." } },
      choices = {
        { text = "A beast must learn to obey, happy or not.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then I'll earn it back, not order it back.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    friend = {
      lines = { { id = "fr_default", text = "Whichever you make of it, and it will make the same of you. I've seen hunters lose a companion and grieve like a sister, and I've seen others buy a new one the same afternoon." } },
      choices = {
        { text = "A friend, and I'd grieve mine.", next = "BACK", reply = "Then you have already chosen well, and your companion will know it before you do. I once saw a cat drag her wounded hunter half a league, because he had sat up all night with her when she was a cub.", fx = { align = { light = 1 } } },
        { text = "A tool, and a good one. Tools can be replaced.", next = "BACK", reply = "Many hunters think so, until the day they cannot replace one. I hope you never learn it the way they did.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tricks = {
      lines = { { id = "tr_default", text = "A harder bite, a thicker hide, a growl that draws the enemy's eye away from you, and more besides as it grows. But it can only learn as much as it trusts you, so a loyal beast learns more than a clever one." } },
      choices = {
        { text = "How do I earn that loyalty?", next = "tricks_loyal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tricks_loyal = {
      lines = { { id = "tl_default", text = "Time and food and fights you both survive, and nothing else will do it. Dorion's wolf Shadow has been at his side longer than the tree has stood, and she'd walk into fire if he asked, though he never would." } },
      choices = { { text = "I'll be patient with it. Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    first = {
      lines = { { id = "fi_default", text = "Of course I did; it was the one who'd walked further to get here. You came because you chose to, and it came because it trusts you, and I think that deserves a hello first." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    stubborn = {
      lines = { { id = "st_default", text = "{pet} listens very well, I think, only not to the words you're saying. Watch what you do just before it disobeys you, and I expect you'll find you've been telling it two things at once." } },
      choices = { { text = "I'll watch myself, then. Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "dr_default", text = "You learn to be them, and I learn to be beside them, which is a different lesson and not a lesser one. Come and sit with the hunters' beasts sometime; you may find they talk to you more freely than to me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Feed your companion before you eat, and it will fight for you before it runs." } },
    background = { { id = "tp_bg", text = "I teach beasts in the Enclave. I've always found them easier company than most people, and kinder." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. Ask me about a beast, and I'll do better." } },
  },
}

---------------------------------------------------------------------------
-- Alassin (stable master)
---------------------------------------------------------------------------
P:NPC {
  key = "alassin", id = TODO_NPC("Alassin"), name = "Alassin", title = "Stable Master",
  bible = "bibles/darnassus_folk.md", role = "stablemaster", tier = "service",
  communities = { "darnassus" }, temper = { "dry", "steady" }, values = { "practical", "patient" },
  notices = { "pet" },

  impression = {
    first = "He has never lost an animal and is quietly proud of it.",
    third = "{name} met Alassin, the stable master in the Cenarion Enclave.",
  },

  greetings = {
    { id = "g_hello", text = "Leaving one, or taking one? I can do either, but not both at once." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you. Your beasts are well, and they'd like you to visit more often." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "That one's been eating well. Too well, perhaps, but I'll not tell it so." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I am Alassin, and I keep the stables of the Enclave. Every beast in my care is fed, brushed and spoken to every day, which is more than some of their hunters can say for themselves." },
        { id = "h_hunter", when = { class = "HUNTER", pet = true },
          text = "I am Alassin, keeper of the Enclave's stables, and that one at your heel looks as though it's been sleeping on rocks. If you leave it with me, it'll have straw for a change." },
      },
      again = {
        { id = "h_again", text = "Something else?" },
        { id = "h_again2", text = "What else can I do?" },
        { id = "h_again3", text = "Go on, the sabers aren't due their supper for an hour yet." },
      },
      choices = {
        { text = "I'd like to use the stables.", next = "BUSINESS" },
        { text = "What's the strangest beast you've kept?", next = "strange" },
        { text = "Do the druids help with the animals?", next = "druids" },
        { text = "Have you really never lost an animal?", next = "lost" },
        { text = "Your stables are spotless.", next = "spotless" },
        { text = "How long do hunters leave their beasts?", next = "long", when = { class = "HUNTER" } },
        { text = "Would you stable a ram?", next = "ram", when = { race = "Dwarf" } },
        { text = "Thank you.", next = "END" },
      },
    },
    strange = {
      lines = { { id = "st_default", text = "A crab from the coast of Darkshore, if you can believe it, that a dwarf hunter swore was the bravest companion he'd ever had. It pinched me every morning for a month, and I grew rather fond of it." } },
      choices = {
        { text = "What became of it?", next = "strange_crab" },
        { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    strange_crab = {
      lines = { { id = "sc_default", text = "The dwarf came back for it, sunburnt and very apologetic, and the crab pinched him too, which pleased me more than it should have. I hear they're in the Barrens now, frightening centaur." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    druids = {
      lines = { { id = "dr_default", text = "When they're not arguing about something in the Arch Druid's tree, yes. A druid in cat's shape can calm a nervous saber faster than I can, and I'm not too proud to ask." } },
      choices = {
        { text = "The druids' wisdom keeps this city whole.", next = "BACK", reply = "They do, though they would be the first to remind you of it. Even so, the city stands on their patience as much as on its roots.", fx = { align = { order = 1 } } },
        { text = "A good stable master needs no druid's help.", next = "BACK", reply = "Pride is a poor saddle, friend, and I have been thrown from it before. I will take help from anyone who can calm a frightened cat.", fx = { align = { order = -1 } } },
        { text = "What do they argue about?", next = "druids_argue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    druids_argue = {
      lines = { { id = "da_default", text = "Whether Teldrassil is growing as it should, mostly, and whether to say so out loud. I keep beasts, not opinions, but I'll tell you that the sabers sleep badly on the nights the Circle argues longest." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "teldrassil" } } } },
    },
    lost = {
      lines = { { id = "lo_default", text = "Never, though I came close once, and I still think about it. A young bear slipped her collar in the night and I found her at dawn halfway up the Temple steps, eating the priestesses' moonberries." } },
      choices = {
        { text = "What did the priestesses say?", next = "lost_priest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost_priest = {
      lines = { { id = "lp_default", text = "Nothing at all, which was far worse than shouting. The next morning there was a basket of moonberries on my stable door with a very short note, and I've double-buckled every collar since." } },
      choices = {
        { text = "What did the note say?", next = "lost_note" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost_note = {
      lines = { { id = "ln_default", text = "\"For the bear, so she needn't climb.\" I've never been so thoroughly scolded in my life, and Elune's priestesses did it in seven words." } },
      choices = {
        { text = "A gentle rebuke is still a rebuke. Fair enough.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The bear earned those berries. Let her climb.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spotless = {
      lines = { { id = "sp_default", text = "They'd better be, with the Cenarion Circle walking past every hour. The druids notice a dirty stall the way a smith notices a bent nail, and they say nothing just as loudly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    long = {
      lines = { { id = "lg_default", text = "A night, a season, sometimes years. Hunters go to Ashenvale or Feralas and forget there's a wolf in Darnassus who still listens for their step every evening." } },
      choices = {
        { text = "Do the beasts forget them in turn?", next = "long_forget" },
        { text = "Something else.", next = "BACK" },
      },
    },
    long_forget = {
      lines = { { id = "lf_default", text = "Never. That's the part that troubles me, and why I talk to every one of them every day, so that at least somebody does." } },
      choices = { { text = "I won't leave mine too long. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ram = {
      lines = { { id = "ra_default", text = "I'd stable a ram if a hunter tamed one, though I'd want a wall of good stone for it, and Darnassus hasn't much stone. Your riding rams go to the stables in Ironforge, I'm afraid; mine are for hunters' companions." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Visit your beasts. They don't count the days, but they feel every one." } },
    teldrassil = { { id = "tp_teldrassil", text = "The tree we live on, and the druids' constant worry. My sabers don't care, so long as it keeps the rain off." } },
    _none = { { id = "tp_none", text = "I keep beasts, not gossip. Ask someone with fewer stalls to muck." } },
  },
}

---------------------------------------------------------------------------
-- Elissa Dumas (portal trainer)
---------------------------------------------------------------------------
P:NPC {
  key = "elissa_dumas", id = TODO_NPC("Elissa Dumas"), name = "Elissa Dumas", title = "Portal Trainer",
  bible = "bibles/darnassus_folk.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "brisk", "wry" }, values = { "learned", "practical" },
  notices = { "class", "race" },

  impression = {
    first = "She guards her tongue only while the priestesses are in earshot.",
    third = "{name} met Elissa Dumas, the human mage who teaches Portal: Darnassus in the Temple of the Moon.",
  },

  greetings = {
    { id = "g_hello", text = "Oh, hello. Speak quietly, the priestesses frown at anything louder than a prayer." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Still in one piece, I see, which is a good start for anyone studying portals." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! You've no idea how nice it is to see a fellow student of the arcane in a city that thinks we're one step from a satyr." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Another human! Where are you from? I'm Stormwind born, though I've been here long enough that I've started to sleep through the day." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Elissa Dumas. I teach mages to open a portal to Darnassus, which is a useful thing to know and a difficult thing to learn. If you're not a mage, I'm afraid I can't do much for you except talk." },
        { id = "h_mage_low", when = { class = "MAGE", maxLevel = 39 },
          text = "A mage, but a young one. Come back when you've more power in your hands, and I'll teach you to fold the world between here and wherever you're standing." },
        { id = "h_mage", when = { class = "MAGE", minLevel = 40 },
          text = "A mage, and seasoned enough. Portals are a matter of precision, so if your mind wanders while you cast, you'll end up somewhere you'd rather not." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Ask, quietly." },
        { id = "h_again3", text = "Go on; I don't get many visitors who want to talk about anything but the moon." },
      },
      choices = {
        { text = "Teach me the portal.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Why does a human mage live here?", next = "why" },
        { text = "How do the elves treat a mage?", next = "elves" },
        { text = "How does a portal actually work?", next = "portal" },
        { text = "The priestesses keep a close eye on you.", next = "watched" },
        { text = "Where does a mage train in this city?", next = "train", when = { class = "MAGE" } },
        { text = "I'm Stormwind born as well.", next = "stormwind", when = { race = "Human" } },
        { text = "Thank you.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "The Alliance needs its mages able to reach every capital, and the kaldorei won't teach the arcane, so someone had to come. I volunteered before I understood how quiet it would be." } },
      choices = {
        { text = "Do you regret it?", next = "why_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_regret = {
      lines = { { id = "wr_default", text = "On the long nights, a little, when there's no one to argue theory with but the owls. But the city is beautiful in a way Stormwind never tried to be, and I've learned more about patience here than in ten years of study." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    elves = {
      lines = { { id = "el_default", text = "Politely, and with great care, the way you'd treat a guest who's brought a lit torch to a library. After what their own mages did to them long ago, I can't really blame them." } },
      choices = {
        { text = "They're right to be wary of the arcane.", next = "BACK", reply = "I am glad someone understands. I came here to learn the gateways, not to repeat my forebears' arrogance, and they remember far better than I do.", fx = { align = { order = 1 } } },
        { text = "The arcane is a tool. Their fear is old superstition.", next = "BACK", reply = "Careful saying that too loudly in this city. Their fear has ten thousand years behind it and a whole sunken continent to show for it.", fx = { align = { order = -1 } } },
        { text = "What did their mages do?", next = "elves_highborne" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves_highborne = {
      lines = { { id = "eh_default", text = "Their Highborne drew on the Well of Eternity until they called the Burning Legion into the world, and when the Well was destroyed it tore their continent apart. So when I light a candle with a cantrip, you'll understand why the room goes quiet." } },
      choices = {
        { text = "And yet you still practise it here.", next = "elves_still" },
        { text = "Something else.", next = "BACK", fx = { learn = { "highborne" } } },
      },
    },
    elves_still = {
      lines = { { id = "es_default", text = "Carefully, and only what I'm here to teach, and never after dark when the priestesses are at prayer. Dalaran would call that timid; I call it being a good guest in a house that's already burned down once." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dalaran" } } } },
    },
    portal = {
      lines = { { id = "po_default", text = "You hold two places in your mind at once, very precisely, and persuade the world that the distance between them is a mistake. The world is stubborn about distance, which is why it takes so long to learn." } },
      choices = {
        { text = "What happens if you get it wrong?", next = "portal_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    portal_wrong = {
      lines = { { id = "pw_default", text = "Usually nothing, and you're left standing in a circle of sparks feeling foolish. Occasionally you arrive somewhere close to where you meant, like the bottom of the moonwell, and the priestesses never quite forget it." } },
      choices = {
        { text = "That sounds like experience talking.", next = "portal_well" },
        { text = "Something else.", next = "BACK" },
      },
    },
    portal_well = {
      lines = { { id = "pwe_default", text = "I'm not going to answer that, and I'd thank you not to ask anyone else either. The water was very cold, and very holy, and I was very sorry." } },
      choices = { { text = "Your secret's safe with me. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    watched = {
      lines = { { id = "wa_default", text = "They do, and I don't hold it against them; I'd watch me too. One of the older sisters prays every time I pass her, and I've decided to take it as a blessing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    train = {
      lines = { { id = "tr_default", text = "Nowhere, except with me, and I only teach the one spell. For everything else you'll want Stormwind's Mage Quarter or the gnomes in Ironforge, and the boat from Auberdine will carry you to Menethil if you don't mind the long way round." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stormwind = {
      lines = { { id = "sw_default", text = "Are you! Then tell me the canals still smell the same and the Mage Quarter's still arguing with the Cathedral, and don't tell me anything sad. I've heard there's still no word of the king, and that's enough sadness for one letter home." } },
      choices = {
        { text = "Stormwind's strong. Bolvar holds it well.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "It's rotting from within, if you ask me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "bolvar" } } },
      },
    },
  },

  topics = {
    highborne = { { id = "tp_highborne", text = "The kaldorei mages who brought the Legion down on the world. Every elf in this city remembers it when they look at me." } },
    dalaran = { { id = "tp_dalaran", text = "Where the real mages train, or trained, before the north went bad. I'd give a great deal to see its libraries again." } },
    advice = { { id = "tp_ad", text = "Know exactly where you mean to arrive before you leave. It's good advice for portals and for most other things." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. I've been in this temple so long I've lost track of the world outside it." } },
  },
}

---------------------------------------------------------------------------
-- Lairn (banker)
---------------------------------------------------------------------------
P:NPC {
  key = "lairn", id = TODO_NPC("Lairn"), name = "Lairn", title = "Banker",
  bible = "bibles/darnassus_folk.md", role = "banker", tier = "service",
  communities = { "darnassus" }, temper = { "precise", "calm" }, values = { "careful", "honest" },
  notices = { "purse" },

  impression = {
    first = "A shield with an orc's axe in it still unsettles him.",
    third = "{name} met Lairn, a banker of Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Welcome to the vaults. Your belongings will be safe here for as long as you like." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Your vault is exactly as you left it." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "Your purse hangs heavy, friend, and Darnassus has thieves of its own. I'd suggest leaving some of it in our vault." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I am Lairn, a keeper of the vaults. What you leave in the vaults of the Temple Gardens stays exactly where you put it, and no one but you will ever lay a hand on it." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "I am Lairn, a keeper of the vaults, and I notice you looked at the locks before you looked at me. They're very good locks, and I'd rather you didn't test them." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "What else may I do for you?" },
        { id = "h_again3", text = "Take your time. I'll finish this column while you think." },
      },
      choices = {
        { text = "I'd like to see my vault.", next = "BUSINESS" },
        { text = "What do the kaldorei keep in vaults?", next = "keep" },
        { text = "Is anything in the vaults ever trouble?", next = "name" },
        { text = "You count very slowly.", next = "slow" },
        { text = "What use is gold to the kaldorei?", next = "gold" },
        { text = "Has anyone ever tried to rob you?", next = "robbed", when = { class = "ROGUE" } },
        { text = "Do you deal with the banks of Ironforge?", next = "ironforge", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Thank you.", next = "END" },
      },
    },
    keep = {
      lines = { { id = "ke_default", text = "Less gold than the humans do, and more memories: a letter from someone lost at Hyjal, a glaive from the War of the Ancients, seeds from a tree that no longer grows. Those are the things I'm most careful with." } },
      choices = {
        { text = "Memories are worth more than gold.", next = "BACK", reply = "Then you understand my trade better than most who come to my counter. I will keep yours as carefully as my own.", fx = { align = { light = 1 } } },
        { text = "Gold buys new memories. I'll keep the coin.", next = "BACK", reply = "As you wish, and your coin will be safe with me. Only do not be surprised one day when you find you wish you had kept something else.", fx = { align = { light = -1 } } },
        { text = "Do the owners ever come back for them?", next = "keep_return" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep_return = {
      lines = { { id = "kr_default", text = "Some come every year on the same night, open the box, look, and close it again without taking anything. Others haven't come in centuries, and I keep their boxes dusted all the same." } },
      choices = {
        { text = "And the seeds? Couldn't the druids plant them?", next = "keep_seeds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep_seeds = {
      lines = { { id = "ks_default", text = "The druids have asked, very politely, more than once. The owner says they're to be planted when there's somewhere fit to plant them, and she hasn't decided that Teldrassil is that place yet." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "teldrassil" } } } },
    },
    name = {
      lines = { { id = "na_default", text = "Magical things, mostly, deposited unwrapped by people in a hurry. I once sat up all night watching a wand hum in its box, and Garryeth, who keeps the vaults with me, still tells the story at every opportunity." } },
      choices = {
        { text = "What else does Garryeth say about you?", next = "name_garryeth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_garryeth = {
      lines = { { id = "ng_default", text = "That I'm unsettled by a shield with an orc's axe still stuck in it, which is true, and that I talk to it, which is a lie. I only told it to stay where it was, once, very quietly." } },
      choices = {
        { text = "Why does that shield trouble you?", next = "name_shield" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_shield = {
      lines = { { id = "ns_default", text = "Because someone held that shield while the axe went into it, and I don't know if they lived. The owner wanted it kept exactly as it was, and I understand why, but I'd rather the vault held gold than that." } },
      choices = {
        { text = "It should be kept. Let it remind us of the war.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Pull the axe out and let it be forgotten.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    slow = {
      lines = { { id = "sl_default", text = "I do, and I've never once been wrong, which Idriana cannot say however quickly she counts. A banker who is quick is only a banker who will be counting again tomorrow." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    gold = {
      lines = { { id = "go_default", text = "More each year, since the Alliance came and the dwarves and humans brought their markets with them. We traded in favours and service for a very long time, and some of the older kaldorei still find coin a little vulgar." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    robbed = {
      lines = { { id = "ro_default", text = "Once, a long time ago, and the Sentinels found him before he'd reached the bridge. The vaults are guarded by more than locks, and I'll leave you to wonder what the rest is." } },
      choices = { { text = "I wasn't asking for a reason. Something else.", next = "BACK" } },
    },
    ironforge = {
      lines = { { id = "if_default", text = "By letter, and very carefully, for their bankers count even more slowly than I do, which I had not thought possible. What you leave in Ironforge's vaults you can reach from mine, so long as you're patient." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Leave what you can't afford to lose with us before you go to Ashenvale. The orcs don't return what they take." } },
    background = { { id = "tp_bg", text = "I keep the vaults with Garryeth and Idriana. I count slowly and I'm never wrong, and that's all a banker should be." } },
    _none = { { id = "tp_none", text = "That isn't in any ledger of mine, I'm afraid." } },
  },
}

---------------------------------------------------------------------------
-- Landria (bow merchant)
---------------------------------------------------------------------------
P:NPC {
  key = "landria", id = TODO_NPC("Landria"), name = "Landria", title = "Bow Merchant",
  bible = "bibles/darnassus_folk.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "cheerful", "proud" }, values = { "craft", "practical" },
  notices = { "class" },

  impression = {
    first = "She judges customers by how they hold a bowstring.",
    third = "{name} met Landria, who sells bows and arrows in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Come, come, try the draw on any of them. You'll know the right one when it fights back a little." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did the last bow treat you well?" },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "WARRIOR", "ROGUE" } },
      text = "You've calluses where an archer has them. Good; then I can show you the better stock." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Landria, and these are the finest bows in Darnassus, though Jeena in Dolanaar would argue that. Every one is cut from wood the forest gave up freely, and every one shoots true." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter! Then you'll want to try the long yew at the end of the rack, and then you'll want to tell me why it's wrong for you, and then we'll find the right one." },
      },
      again = {
        { id = "h_again", text = "Anything else? Try another bow while you think." },
        { id = "h_again2", text = "What else?" },
        { id = "h_again3", text = "Go on, and string that one properly while you ask." },
      },
      choices = {
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "Wood the forest gave up freely?", next = "wood" },
        { text = "Bow or gun, which is better?", next = "guns" },
        { text = "Who's this Jeena?", next = "jeena" },
        { text = "You're watching how I hold the bow.", next = "judge" },
        { text = "What arrows for a long hunt?", next = "arrows", when = { class = "HUNTER" } },
        { text = "I'll keep my gun, thanks.", next = "dwarf", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Thank you.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "wo_default", text = "Fallen limbs, and branches the druids say the trees can spare, and never a living trunk. It makes for fewer bows than I'd like, but I sleep well, and so do the trees." } },
      choices = {
        { text = "How do the druids decide?", next = "wood_druids" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_druids = {
      lines = { { id = "wd_default", text = "They walk the groves after a storm and listen, and then they tie a ribbon round the branches I may take. Sometimes I wait a whole season for a single ribbon, and sometimes a gale gives me a year's wood in a night." } },
      choices = {
        { text = "Couldn't you simply cut what you need?", next = "wood_cut" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_cut = {
      lines = { { id = "wc_default", text = "I could, and I'd have twice the stock and half the customers, because every kaldorei who bought from me would know. That's how the orcs in Ashenvale get their wood, and look what it's made of them." } },
      choices = {
        { text = "Then wait for the ribbons. It's the right way.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A bow in hand defends the forest. Cut what you need.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    guns = {
      lines = { { id = "gu_default", text = "Ask a dwarf and you'll hear one answer, ask me and you'll hear another. A gun is loud and a bow is quiet, and in a forest at war, quiet keeps you alive." } },
      choices = {
        { text = "A bow, then. Silence is a weapon.", next = "BACK", reply = "Then you have a Sentinel's sense, and I will see you fitted with a bow worth trusting. Let the enemy wonder where the arrows come from.", fx = { align = { order = 1 } } },
        { text = "Give me the gun. Let them hear me coming.", next = "BACK", reply = "Then you will need to be quick as well as loud, friend. In Ashenvale, whatever hears you coming usually gets there first.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jeena = {
      lines = { { id = "je_default", text = "Jeena Featherbow sells bows in Dolanaar to the young ones fresh out of Shadowglen, and she's very good, for a village bowyer. She'd say I'm very good for a city one, so we're even." } },
      choices = {
        { text = "So which of you is better?", next = "jeena_better" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jeena_better = {
      lines = { { id = "jb_default", text = "I am, obviously, and she'd say the same of herself with exactly as much conviction. We send each other one bow every year to criticise, and I spend most of the spring writing my letter." } },
      choices = { { text = "That's a friendly rivalry. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    judge = {
      lines = { { id = "ju_default", text = "Of course I am! The way someone holds a bowstring tells me more than anything they could say, whether they're patient, whether they flinch, and whether they've been taught by somebody who didn't know what they were doing." } },
      choices = {
        { text = "And what does mine tell you?", next = "judge_mine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    judge_mine = {
      lines = {
        { id = "jm_default", text = "That you pull with your shoulder, not your back, and you'll feel it by evening. Draw from here, between the blades, and let the string go as if you'd forgotten you were holding it." },
        { id = "jm_hunter", when = { class = "HUNTER" }, text = "That you've shot a good deal and been corrected very little. You've a fine eye and a lazy elbow, and the elbow's the easier one to fix." },
      },
      choices = { { text = "I'll practise, I promise. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    arrows = {
      lines = { { id = "ar_default", text = "Sharp ones, and a great many of them, since you'll lose half to the brush and break a quarter on bone. Carry twice what you think you'll need and you'll come home with a few to spare." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Then I'll sell you the shot for it and say nothing about the noise, which costs me a great deal. If you ever want to try a bow, the short ash on the left is forgiving, even to a rifleman." } },
      choices = { { text = "Maybe one day, Landria. Something else.", next = "BACK" } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Draw from your back, not your arm, and carry more arrows than you think. Everything else is practice." } },
    background = { { id = "tp_bg", text = "I make and sell bows on the Tradesmen's Terrace, from wood the forest can spare. Jeena in Dolanaar thinks hers are better, and she's wrong." } },
    _none = { { id = "tp_none", text = "If it doesn't have a string, I'm the wrong one to ask." } },
  },
}
