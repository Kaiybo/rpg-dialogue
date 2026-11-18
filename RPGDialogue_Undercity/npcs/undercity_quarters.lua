-- The Undercity's quarters: Michael Garrett the bat handler, Anastasia Hartwell in the Magic Quarter, Apothecary Zinge in the Apothecarium. Voice: bibles/undercity.md
-- Zinge's own quests are not referenced (unsure of them); she speaks only of the Apothecarium's work in general.
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "garrett", id = TODO_NPC("Michael Garrett"), name = "Michael Garrett",
  bible = "bibles/undercity.md", role = "flightmaster", tier = "service",
  communities = { "undercity" }, temper = { "dry", "calm" }, values = { "practical" },
  notices = { "race", "class" },

  impression = {
    first = "He shows his bats more warmth than most living things.",
    third = "{name} met Michael Garrett, the bat handler of the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "The bats are hungry and restless, which means they're ready to fly. Where to?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The bats remember you, which is either a compliment or a warning." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, are you? The bats remembered you before I did, and I'd rather not dwell on what that says about me." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Folk in the city say you've been doing them good turns. The bats can't stand most people, but they've stopped hissing at you, so perhaps it's catching." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "A living rider. The bats can smell your blood, so don't take it personally if they lick their lips." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Keep your pet away from the roost, hunter. My bats are fond of a snack." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Not yours, at any rate, though I'd keep it dimmed in the saddle, because a bat that sees a flash of holy light over Brill is going to assume the Crusade has found it. Fly quiet and pray quiet, {class}, and you'll both land in one piece." } },
      choices = {
        { text = "The Light doesn't need to shout. I'll keep it quiet.", next = "BACK", reply = "Good. A quiet Light is still Light, and my bats will thank you for it, {class}.", fx = { align = { order = 1 } } },
        { text = "I won't hide the Light for anyone, bats included.", next = "BACK", reply = "Then you'll be flying with a terrified bat, and I'll be scraping you off the road to Tarren Mill. Your choice, {class}.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They carry anyone with the coin and the stomach for it, priest or rogue, alive or otherwise. I'd say a prayer before you climb on, though, because they've a habit of diving when they spot a moth, and nobody's prayers have ever stopped them." } },
      choices = {
        { text = "I'll trust your bats, Michael, and pray anyway.", next = "BACK", reply = "That's the right balance, and the bats will appreciate both. Hold the strap tight.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayer won't keep me in the saddle. I'll hold on tight.", next = "BACK", reply = "Tight is good, and tighter is better. Mind the moths.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Heavy riders, and fidgety ones, because they don't like sitting still while something else does the work. Hold the harness, keep your shield off the bat's wing, and you'll reach the Sepulcher with your dignity and most of your armour." } },
      choices = {
        { text = "I'll sit still and trust the bat, Garrett.", next = "BACK", reply = "Good, and the bat will thank you for it by not tipping you into the river. Off you go.", fx = { align = { order = 1 } } },
        { text = "I'd rather walk. I like my feet on the ground.", next = "BACK", reply = "Then you'll get there by Tuesday, warrior, and your feet will hate you. The bats are faster.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They mind it, but they'll do it, so long as the beast doesn't try to bite the wing that's holding it up. Most hunters send their companions off for the flight, and I'd recommend it, for everyone's peace of mind." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They'll tolerate {pet}, though they'd rather it didn't eye them like supper. Most hunters send their companions off for the flight, and I'd recommend it, for everyone's peace of mind." },
      },
      choices = {
        { text = "I'll keep my beast calm for the flight, Garrett.", next = "BACK", reply = "Calm is all I ask, and the bat will be grateful. Mind its wings.", fx = { align = { order = 1 } } },
        { text = "My beast goes as it pleases, Garrett.", next = "BACK", reply = "Then it may find itself flying alone, and so might you. A word of warning, that's all.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because your teleport only brings you here, and the bats take you to the Sepulcher or Tarren Mill without complaint. Be kind to them and they'll be kind to you, and you'll find that rarer in this city than you'd hope." },
      },
      choices = {
        { text = "I'll be kind to them, Garrett.", next = "BACK", reply = "Kind to them, and they'll be kind to you. That's how it works with bats.", fx = { align = { light = 1 } } },
        { text = "They're beasts of burden. They'll carry me.", next = "BACK", reply = "They will, and they'll remember how you treated them, so don't be surprised if the landing's rough.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_peacepc", tags = { "news" }, when = { gossip = { topic = "peace", stance = "peace" } }, text = "Innkeeper Norman says you're for peace with the humans. My bats won't carry you to Southshore all the same, so don't get your hopes up." },
        { id = "h_default", key = true,
          text = "Michael Garrett, bat handler to the Dark Lady's city. The bats carry riders to Tarren Mill and the Sepulcher and wherever else the Forsaken have planted a flag, and they don't mind the dead on their backs, which is more than horses can say." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The bats don't like the smell of lightning, so mind what you're carrying before you climb on." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You can run like a cat, I'm told, but there's no running across Lordamere Lake, so you'll want a bat." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The bats carry armour well enough, {class}, though they'll complain about the weight the whole way to Tarren Mill." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The bats don't love your beasts, but they've learned to put up with them, which is more than the beasts manage in return." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, at the bat roost. They won't mind you, the bats, but they'll want to know if you've got anything to eat, which is about all they want from anyone." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. The bats don't care about magic, but they do dislike being frozen, so I'd avoid that." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, and the bats don't mind you a bit, and they've a better nose for the Scarlets than any tabard could give me. They hate the Crusade's torches, but whatever you're carrying, they seem to think it's harmless." },
        { id = "h_dd_falling", when = { deathCause = "falling" },
          text = "Fell from somewhere high, did you? You've the crumpled look of it, and my bats would have set you down gently for a few coins, you know." },
      },
      again = {
        { id = "h_again", text = "What else? The bats are waiting, and one of them has started chewing on a saddle." },
        { id = "h_again2", text = "Anything more?" },
      },
      choices = {
        { text = "Do the bats ever carry priests, Michael?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do your bats fear the storm, Garrett?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the bats mind a living rider, Garrett?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'd have expected wyverns, not bats.", next = "bats" },
        { text = "You've the look of an old handler.", next = "life" },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Can a bat drop me somewhere quiet, Garrett?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Your bats flinch whenever I come near, Garrett.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I'd guess warriors make poor bat riders, Garrett.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do your bats mind carrying a hunter's beast, Garrett?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why would a mage fly your bats, Garrett?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the bats really not mind the Light, Garrett?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not now.", next = "END" },
      },
    },
    bats = {
      lines = {
        { id = "ba_default", text = "Bats don't shy from the dead, and they fly well in the dark, which suits us. The wind riders the orcs keep won't let a Forsaken near them, and I can't blame them, but a bat doesn't care." },
      },
      choices = {
        { text = "Do the bats care for you?", next = "bats_care" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bats_care = {
      lines = {
        { id = "bc_default", text = "As much as a bat cares for anything, which is to say they care for whoever feeds them. I feed them well, and I've not been bitten in a month, so I count that as love." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    life = {
      lines = {
        { id = "li_default", text = "I kept horses in Lordaeron, before the plague, and I was good at it. The horses wouldn't have me when I came back, so the Dark Lady gave me bats, and I've found I like them better." },
      },
      choices = {
        { text = "The past is better left buried.", next = "BACK", reply = "It is, mostly, though I miss the smell of hay. The bats don't smell nearly as nice.", fx = { align = { light = -1 } } },
        { text = "It's good you remember who you were.", next = "BACK", reply = "Thank you, and I suppose I do. The horses would be glad to hear it, if they'd ever listen.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They fear thunder, mostly, and I can't blame them, since it's the only thing louder than they are. I've flown a few shamans to Tarren Mill and they all kept the storm packed away for the flight, and the bats were grateful, and so was I." } },
      choices = {
        { text = "I'll keep the storm packed away for the flight.", next = "BACK", reply = "Thank you, shaman, and the bats will be much obliged. Storms are for after you land.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The bats will have to get used to it, Garrett.", next = "BACK", reply = "They will, eventually, and so will you, when you land in a tree. I'd not risk it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "They mind the smell of your blood, but they'll carry you, and they'll be good about it. A bat's not like a horse, because a horse remembers who it used to belong to, and a bat only remembers who fed it last." } },
      choices = {
        { text = "Then I'll feed them myself before I fly.", next = "BACK", reply = "Good, and they'll like you for it. A bat that's been fed by the rider is a bat that doesn't drop him.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A mount is a mount. Feeding it is your job.", next = "BACK", reply = "It is, and I do it, but a friendly hand never hurts. Suit yourself, druid.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The bats fly to the Sepulcher and Tarren Mill and nowhere in between, so if you want somewhere quiet you'll have to walk from there. They shriek when they land, besides, so get your quiet in after they've gone." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "The bats fly their routes and nowhere else, and the deathstalkers have been asking me for years to change that. Walk from the Sepulcher or Tarren Mill like everyone else, and you'll get your quiet soon enough." },
      },
      choices = {
        { text = "I'll walk the last stretch unseen.", next = "BACK", reply = "Good, and the Scarlets won't know you've arrived until it's far too late.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll land loudly and let them come to me.", next = "BACK", reply = "Bold, rogue, and loud. The bats will approve; they like an audience.", fx = { align = { honor = 1 } } },
        { text = "I'd have expected wyverns, not bats.", next = "bats" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They flinch because they can smell what you keep company with, and bats are more sensible than most folk about that sort of thing. Send the demon away before you ride, and they'll settle soon enough." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "They flinch at orcs anyway, since you smell of wolf, and the demon makes it twice as bad. Send it away before you ride, and they'll settle soon enough." },
      },
      choices = {
        { text = "I'll dismiss it before I ride.", next = "BACK", reply = "Thank you, and the bats will be grateful. They're more sensible than people.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They'll get used to it, Garrett.", next = "BACK", reply = "They might, given years. I'd send it away all the same.", fx = { align = { order = -1 } } },
        { text = "You've the look of an old handler.", next = "life" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I keep bats. That's what I do, and I do it well, so don't ask for a life story." } },
    advice = { { id = "tp_ad", text = "Hold on tight when the bat dives. They don't warn you, and the ground is a long way down." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken have the bats, and the orcs have their wind riders, and I'd say we got the better beasts. Bats don't complain, and they don't eat my lunch." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's people send their wind riders up to Tirisfal, and the bats don't care for them. I can't say I blame the bats." } },
    lordaeron = { { id = "tp_lordaeron", text = "The bats know every road in Lordaeron better than any map. They'll fly you over the ruins if you like, but don't look down too long." } },
    scourge = { { id = "tp_scourge", text = "The Scourge has its own winged horrors, gargoyles and the like, and the bats are terrified of them. So am I, if I'm honest." } },
    _none = { { id = "tp_none", text = "I don't know. Ask a bat; they hear everything from up in the rafters." } },
  },
}

P:NPC {
  key = "hartwell", id = TODO_NPC("Anastasia Hartwell"), name = "Anastasia Hartwell",
  bible = "bibles/undercity.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "cold", "precise" }, values = { "ambitious" },
  notices = { "class", "race" },

  impression = {
    first = "She has lost none of her impatience with fools.",
    third = "{name} met Anastasia Hartwell, a mage trainer in the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "If you've come to learn, then listen. If you've come to waste my time, the door is behind you." },
    { id = "g_back", when = { metBefore = true }, text = "So, you've come back down to the sewers and the candlelight. Tell me your spellwork has grown sharper since last time." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Good, at least you'll understand what I'm saying." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Death has left your mind intact, I see, so use it before it rots." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Faith is foolish when it's lazy, and I suspect yours isn't, since the Light makes you pay for every prayer. I'd still trust a spell I can measure over a blessing I can't, but I'll admit you're evidence I can't easily explain away." } },
      choices = {
        { text = "Some things can't be measured. The Light is one of them.", next = "BACK", reply = "Perhaps not, though I'll keep trying, because that's what scholars are for. You're a stubborn sort of evidence.", fx = { align = { light = 1 } } },
        { text = "Call it will, not faith, and you'll understand it better.", next = "BACK", reply = "Will, not faith? Now that's a definition I could almost work with. Do go on.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The Light certainly was imprecise, because it promised everything and explained nothing, and then it let us die. The shadow priests at least talk of will and discipline, which is closer to a method, and I'll grant them that much grudgingly." } },
      choices = {
        { text = "Faith isn't a method, Anastasia. It's something more.", next = "BACK", reply = "Something more, it seems, and impossible to explain. I'll keep my methods, thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Will and discipline are what matter. I agree.", next = "BACK", reply = "Good, then we agree, and I'll have one less argument this week. That's a rare pleasure.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Some of them do, and they're fools, because every mage who ever lived has owed their life to someone with a shield standing in front of them. I'd trade a lesser student for one steady warrior on a bad day, and I've had a great many bad days." } },
      choices = {
        { text = "I'll stand in front. That's what warriors are for.", next = "BACK", reply = "Good. I'll make sure my students know whose back they hide behind.", fx = { align = { order = 1 } } },
        { text = "Let the mages hold their own line for once.", next = "BACK", reply = "They'd fail, and you'd watch them fall, and I'd lose a student or two. Stand in front anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Anastasia Hartwell, of the Magic Quarter. I teach the arcane to those of the Forsaken with the wit to learn it, and to the Dark Lady's allies, when they behave." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in the Magic Quarter. Your elements are crude and loud, but I'll grant they're effective, and effective is all I ask of anyone." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. I read your Cenarion Circle's writings, the few that reached Dalaran before it fell, and I thought them sentimental." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, in the Magic Quarter. Do try not to break anything, {class}, because the furniture is older than you are, and so am I." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, in the Magic Quarter. I teach mages to think precisely, and in my experience priests prefer to feel things rather than think them, so do prove me wrong." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, in the Magic Quarter. I was taught that the Light was faith and the arcane was reason, and I'd be interested to hear what a dead paladin believes, since I assume you can't simply take things on faith anymore." },
      },
      again = {
        { id = "h_again", text = "Something else? Ask it plainly; I have apprentices to correct and little patience left." },
        { id = "h_again2", text = "Anything further?" },
      },
      choices = {
        { text = "Faith can't be as imprecise as you make out, Anastasia.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Crude, you say? Have you ever stood in a storm, Anastasia?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Sentimental how, Anastasia?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Do the mages ever look down on hunters, Anastasia?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Death must have changed your magic.", next = "death" },
        { text = "What do you think of Dalaran?", next = "dalaran" },
        { text = "Teach me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Warlocks study too, Anastasia. Why the contempt?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Mages and rogues both deal in secrets, Anastasia.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I'd guess the mages look down on warriors too, Anastasia.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Is faith foolish for the dead, Anastasia?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    death = {
      lines = {
        { id = "de_default", text = "It made it colder, and clearer. The living worry about their bodies, but I have no such distractions, so I study, and I've learned more in death than I did in life." },
      },
      choices = {
        { text = "Is that worth the price?", next = "death_price" },
        { text = "Something else.", next = "BACK" },
      },
    },
    death_price = {
      lines = {
        { id = "dp_default", text = "I didn't choose the price, so I'll take what came with it. The Scourge took my life, and I'll take my knowledge back from them a spell at a time." },
      },
      choices = {
        { text = "Knowledge is worth any cost.", next = "BACK", reply = "Exactly so, and I've paid it already, so I may as well collect. Every spell is a little interest.", fx = { align = { light = -1 } } },
        { text = "Some knowledge shouldn't be taken.", next = "BACK", reply = "Perhaps, but I've yet to meet the knowledge that agreed. I'll take it anyway.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "Constantly, and they're wrong to. A hunter knows the land and reads the weather, and a hunter's arrow has never once blown up in its owner's face, whereas my students manage it weekly." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Constantly, and they're wrong to, because {pet} shows more discipline than most of my students. A beast that comes when called has never once blown up in its owner's face, and my students can't say the same." },
      },
      choices = {
        { text = "Every trade has its use to the Forsaken.", next = "BACK", reply = "It does, and I'll remind my students of that the next time they sneer. Your arrow is welcome here.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them sneer. I answer to nobody's opinion.", next = "BACK", reply = "Good, then you'll go far, and they'll keep sneering. You'll outlast them all.", fx = { align = { order = -1 } } },
      },
    },
    dalaran = {
      lines = {
        { id = "da_default", text = "Dalaran fell to the Legion, and its mages scattered like frightened birds. They wouldn't have me now anyway, so I don't waste my thoughts on them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I have, and I've called one, which is rather different from asking for one politely. The arcane doesn't care whether you're dead or living or troll, and I find that fairness restful, whereas your spirits seem to have opinions about everyone." } },
      choices = {
        { text = "Spirits with opinions keep a shaman honest.", next = "BACK", reply = "Honest, yes, and also slow. I'll keep my arcane and you can keep your conversations.", fx = { align = { honor = 1 } } },
        { text = "You're right. Power shouldn't need permission.", next = "BACK", reply = "Exactly. A spell that needs permission is a spell that might be refused.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "They write about balance as though the world wants it, when the world wants nothing at all. The Scourge took my life and the Legion took Dalaran, and I've seen no sign that anything out there keeps the scales even, so I keep my own." } },
      choices = {
        { text = "Balance is real, Anastasia. Someone has to keep it.", next = "BACK", reply = "Then keep it, druid, but don't ask me to believe in it. The world will do as it likes.", fx = { align = { light = 1 } } },
        { text = "Then keep your own scales. I'll keep mine.", next = "BACK", reply = "Fair enough, and I'll keep mine balanced on whatever's to hand. We'll both be fine.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Because the arcane asks you to understand the world, and your craft asks you to make deals with things that would eat it. I share a quarter with the warlocks and I'm civil to them, but civil isn't the same as respect." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "Kel'Thuzad was a scholar of the Kirin Tor before he was anything else, and he went from study to necromancy one small bargain at a time. So I watch every warlock in this quarter with that in mind." },
      },
      choices = {
        { text = "Fair. I'll keep my bargains careful and few.", next = "BACK", reply = "Careful and few, that's all I ask. I'll be civil to you, and perhaps a little more.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Power doesn't care how it's earned, Anastasia.", next = "BACK", reply = "It doesn't, but it remembers, and it'll want something back. I'd keep that in mind.", fx = { align = { order = -1 } } },
        { text = "Death must have changed your magic.", next = "death" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Yes, but mages write theirs down and rogues sell them, so I keep my notes locked in a chest and never let it out of sight. If you want secrets from the Magic Quarter, you'll find most of them are dull equations." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "Dalaran's libraries lost more to cutpurses than to the Scourge, if you count the years before the plague, and I spent a long time chasing missing folios. Leave my notes alone, and we'll get along." },
      },
      choices = {
        { text = "I'll leave your notes alone, Anastasia.", next = "BACK", reply = "Good, and the chest thanks you. I'd hate to have to burn a rogue.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Dull equations sell well enough, Anastasia.", next = "BACK", reply = "Then you'll have to find something better than my notes, because they're very dull indeed. I'll keep them locked.", fx = { align = { order = -1 } } },
        { text = "What do you think of Dalaran?", next = "dalaran" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I studied magic in life, and I study it still. Death interrupted me, but it didn't stop me." } },
    advice = { { id = "tp_ad", text = "Know your spells before you need them. Learning in the middle of a fight is how you die twice." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran was the finest school of magic in the world, and I studied there long enough to learn that most of its masters were fools. The rebuilt city will have fools in it too." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor hold their secrets as if they were the only ones clever enough to use them. They are wrong, and many of the dead are proof of it." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad was the sort of mage the Kirin Tor feared most, one who would do whatever his studies demanded. He proved them right, which I suspect he enjoyed." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken make better mages than the living, because we don't fear death and we don't waste time on ethics. I find it very freeing." } },
    _none = { { id = "tp_none", text = "I don't concern myself with that. Ask someone with fewer things to do." } },
  },
}

P:NPC {
  key = "zinge", id = TODO_NPC("Apothecary Zinge"), name = "Apothecary Zinge",
  bible = "bibles/undercity.md", role = "questgiver", tier = "service",
  communities = { "undercity" }, temper = { "clinical", "busy" }, values = { "ambitious" },
  notices = { "class", "race" },

  impression = {
    first = "She talks about her experiments the way others talk about weather.",
    third = "{name} met Apothecary Zinge in the Undercity's Apothecarium.",
  },

  greetings = {
    { id = "g_default", text = "Don't touch anything on the tables. Some of it bites, and some of it does worse." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still alive, I see, which means you've been careful." },
    { id = "g_xcult", when = { origin = "forsaken_cult_remnant" }, text = "Cult of the Damned, before you died? Then you know more about plague than half my apprentices, and I'll expect you to stop pretending otherwise while you're in my Apothecarium." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and nothing on these tables got any safer while you were away. Don't touch anything." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear someone took one of your stories for truth. Clever of you, and careless of them, which is how most of my experiments end." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "A living one. Stand back from the vats, please, because some of these vapors are not kind to lungs that still work." },
    { id = "n_alchemist", cat = "class", when = { profession = "Alchemy" },
      text = "You've the stained fingers of an alchemist. Then you'll understand why I don't like being disturbed." },
  },

  start = "hello",
  nodes = {
    op_new_plague = {
      big = true,
      lines = {
        { id = "opnp_default", text = "Object? Everyone objects, and then they ask for a vial to throw at the Scourge. You've seen what we brew down here, so be honest: should the Society be making the new plague at all?" },
      },
      choices = {
        { text = "Something that strong will get loose one day.", next = "op_new_plague_r1", fx = { affinity = -1, align = { light = 1 }, trait = { cautious = 1 }, opinion = { new_plague = "dangerous" } } },
        { text = "Make it. The Scourge deserves every drop.", next = "op_new_plague_r2", fx = { affinity = 1, align = { light = -1 }, opinion = { new_plague = "necessary" } } },
        { text = "The Horde didn't take you in to brew plagues, Zinge.", next = "op_new_plague_r3", fx = { trait = { stern = 1 }, opinion = { new_plague = "wrong" } }, when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "It's a tool. Point it the right way and I won't complain.", next = "op_new_plague_r4", fx = { trait = { practical = 1 }, opinion = { new_plague = "useful" } }, when = { race = "Scourge" } },
        { text = "I'd rather not say, Zinge.", next = "BACK" },
      },
    },
    op_new_plague_r1 = {
      lines = { { id = "opnp_r1", text = "You sound like Master Faranell after a bad week. Things do get loose, which is exactly why we keep them in very good jars." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_new_plague_r2 = {
      lines = { { id = "opnp_r2", text = "That's the spirit! Well, it's the spirit the Society likes, anyway, and I'll tell the Master we've a believer in the field." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_new_plague_r3 = {
      lines = { { id = "opnp_r3", text = "The Horde took us in to fight the Scourge, and this is how we fight it. Your Warchief doesn't ask what's in the jars, and I'd advise you not to either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_new_plague_r4 = {
      lines = { { id = "opnp_r4", text = "A tool, yes! I'll write that on the label, just under the skull." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Not on purpose, and the Master Apothecary would very much like to, so don't let him hear you ask. My own guess is that it hurts you because it's trying to finish what the plague started, and you're too stubborn to let it." } },
      choices = {
        { text = "The Light isn't finishing me. It's keeping me.", next = "BACK", reply = "Keeping you? Then perhaps it's more patient with us than I gave it credit for. I'll note that.", fx = { align = { light = 1 } } },
        { text = "Perhaps it is, and I hold it anyway, out of spite.", next = "BACK", reply = "Spite! Now that's a reagent I understand. Hold it, and tell me how it goes.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "It did, or something in the room did, and the priest who blessed it swore it was coincidence. I've kept the vial and labelled it, and one day I'll know which of us was right, though I suspect neither of us will like the answer." } },
      choices = {
        { text = "Some things aren't meant to be measured, Zinge.", next = "BACK", reply = "Perhaps not, but I'll keep the vial anyway. Something in me still wants to know.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Test it properly, Zinge. Faith can bear scrutiny.", next = "BACK", reply = "Exactly what I think, and the Master Apothecary would agree. I'll fetch my notes.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Rats, mostly, and the occasional bear when the Master Apothecary is feeling generous. If you bring in a wolf from Silverpine that's been drinking from the wrong stream, though, I'd be very interested in what's in its blood." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not yours, so you needn't hold {pet} so close. Rats, mostly, and the occasional bear, though a wolf from Silverpine that's been drinking from the wrong stream would make a very interesting afternoon." },
      },
      choices = {
        { text = "I won't bring living beasts to your cages, Zinge.", next = "BACK", reply = "A pity, but I'll find my rats elsewhere, and they're less trouble anyway.", fx = { align = { honor = 1 } } },
        { text = "A sick wolf's no loss. I'll bring you one.", next = "BACK", reply = "Splendid! A sick one, mind, from the right stream. I'll keep a cage ready.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The Master Apothecary sometimes needs samples from places the Scarlets won't let us walk into, and rogues are good at that. Ask him, not me, and don't touch anything on my bench, because some of it is still alive." },
      },
      choices = {
        { text = "I'll bring back whatever the Society needs.", next = "BACK", reply = "Good. The Master Apothecary will be glad of you, and I'll be glad of the samples.", fx = { align = { order = 1 } } },
        { text = "I'll bring back samples, if the price is right.", next = "BACK", reply = "Then you'll have to discuss that with the Master Apothecary. I only pay in gratitude.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_udimprove", tags = { "news" }, when = { gossip = { topic = "undeath", stance = "improvement" } }, text = "Master Faranell tells everyone you called undeath an improvement. He's been unbearable about it all week, so thank you very much." },
        { id = "h_default", key = true,
          text = "Apothecary Zinge, of the Royal Apothecary Society. We work for the Dark Lady, and the Master Apothecary oversees all of it, so if you've business here, it's his business first." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Don't call anything up in here, please, because I've three mixtures reducing and lightning is not a variable I've accounted for." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, and living. Stand away from the vats, please, because those vapours aren't kind to lungs that still work, and they're less kind to anything with fur." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your beasts look healthier than my prisoners, {class}, and I'll admit I've wondered why." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Don't touch anything on this bench, please, and don't bless it either, because I've had a vial go cloudy after a blessing and I've not worked out why." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. If you're here to steal reagents, the last one who tried is in a jar." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin. Don't touch the green vials, and please don't pray near them either, because I've no idea what the Light does to that mixture and I don't care to learn with my face over the bench." },
        { id = "h_dd_recipe", when = { questDone = TODO_QUEST("A Recipe For Death") },
          text = "Master Faranell has stopped shouting at me quite so much since your work for Renferrel's recipe came in. I'm not saying I'm grateful, because grateful isn't a word we use in the Apothecarium, but I'm noticing it." },
      },
      again = {
        { id = "h_again", text = "What else? My mixture is reducing." },
        { id = "h_again2", text = "Ask, and quickly." },
      },
      choices = {
        { text = "Did a blessing really cloud your vial, Zinge?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What do your mixtures do to the earth, Zinge?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What are those vapours made for, Zinge?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who do you test your work on, Zinge?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "What do you work on here?", next = "work" },
        { text = "Faranell seems a hard master.", next = "faranell" },
        { text = "Could the arcane speed up your experiments, Zinge?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Does the Society test anything on demons, Zinge?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Your experiments must need a good many beasts, Zinge.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do you have work for a rogue, Zinge?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Has the Society ever studied what the Light does to the dead?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Never mind.", next = "END" },
      },
    },
    work = {
      lines = {
        { id = "wo_default", text = "Cures for the living, poisons for the dead, and sometimes the other way round, as the Society requires. The Scourge has its plague, and we mean to know it better than its makers do." },
      },
      choices = {
        { text = "That sounds dangerous.", next = "work_danger" },
        { text = "Does anyone object to your work, Zinge?", next = "op_new_plague" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_danger = {
      lines = {
        { id = "wd_default", text = "Everything worth doing is dangerous, and what we do here is more dangerous than most, and more useful. If an apothecary or two is lost to an accident, the Society carries on, as it always has." },
      },
      choices = {
        { text = "Results matter more than the risk.", next = "BACK", reply = "Precisely, and I'm glad you understand the work. Losses are regrettable, but necessary.", fx = { align = { light = -1 } } },
        { text = "No one should die for an experiment.", next = "BACK", reply = "Nobody should, but somebody always does. I'd rather it were for something useful.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "On prisoners, on rats, and once, regrettably, on my assistant. A warrior like you understands that victories cost something, and I simply pay the cost earlier than most." } },
      choices = {
        { text = "Even the dead should have limits, Zinge.", next = "BACK", reply = "Limits are for people who aren't trying to save their city, warrior. I'll consider yours.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The war demands it. I won't judge you.", next = "BACK", reply = "Then you understand, which is more than my assistant did. Victories cost what they cost.", fx = { align = { light = -1 } } },
      },
    },
    faranell = {
      lines = {
        { id = "fa_default", text = "Brilliant, demanding, and never satisfied, which is what a Master Apothecary ought to be. I report to him, and he reports to the Dark Lady, and disappointing either of them is a short career." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Nothing the Scourge hasn't already done to it, I should think. Your spirits may complain, but spirits don't fund research and the Dark Lady does, so they can take it up with the Master Apothecary." } },
      choices = {
        { text = "The earth's suffering matters too, Zinge.", next = "BACK", reply = "It does, and I'll tell the Master Apothecary you said so. He'll ignore it, but I'll have told him.", fx = { align = { light = 1 } } },
        { text = "Results come first. The earth will recover.", next = "BACK", reply = "Exactly, and the earth has recovered from worse than us. I'll carry on, then.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "For the Scourge, as the Society requires, and for nothing else I'm prepared to discuss. Your nose is better than mine, I'd imagine, so if it tells you something in here is wrong, do me the courtesy of keeping it to yourself." } },
      choices = {
        { text = "Your secrets are your own. I'll keep quiet.", next = "BACK", reply = "Very wise, and very rare. Keep that nose of yours pointed elsewhere.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My nose says enough. I'll be watching the Society.", next = "BACK", reply = "Watch all you like, but from the doorway, please. My bench has opinions about visitors.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "It could speed up the explosions, which is the opposite of what I want. Master Faranell let a mage hasten a reaction once, and we're still scraping the result off the ceiling." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Dalaran's people always think a spell will make chemistry behave, and it never does. Master Faranell let one try once, and we're still scraping the result off the ceiling." },
      },
      choices = {
        { text = "Then I'll stay patient and follow your method.", next = "BACK", reply = "Good, and the ceiling thanks you. The last apprentice who rushed a distillation is still being scraped off it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Risk is how anyone learns anything, Zinge.", next = "BACK", reply = "It is, and I've the scars to prove it. Still, I'd rather not learn it from the ceiling.", fx = { align = { order = -1 } } },
        { text = "What do you work on here?", next = "work" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "We tried once, but the imp kept setting the notes on fire, and Master Faranell decided the results weren't reproducible. Prisoners are tidier, if you must know, and they don't argue with the method." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "We tried once, and the imp set the notes on fire, so we went back to prisoners. I'd keep your demon well clear of my bench, unless you'd like it to become a footnote." },
      },
      choices = {
        { text = "Prisoners or not, it's needed work, Zinge.", next = "BACK", reply = "It is, and someone has to do it. I'm glad not everyone looks at me sideways for it.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Testing on prisoners is beneath us, Zinge.", next = "BACK", reply = "Beneath us? We're beneath the ground, warlock, and so are they. The work carries on.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Faranell seems a hard master.", next = "faranell" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm an apothecary, and I serve the Society. Anything I was before doesn't matter now." } },
    advice = { { id = "tp_ad", text = "Don't drink anything you find in the Apothecarium. I mean that most sincerely." } },
    new_plague = { { id = "tp_new_plague", text = "It's coming along, and it's none of your business beyond that. Hand me that flask, and don't touch the green one." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken need clever minds as much as strong arms. I'm one of the clever ones, and I'd thank you to stop distracting me." } },
    scourge = { { id = "tp_scourge", text = "The Scourge's plague is old work, and we're improving on it. That's all you need to know." } },
    _none = { { id = "tp_none", text = "I haven't time for that. Try the Master Apothecary, if you dare." } },
  },
}
