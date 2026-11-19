-- Talonbranch Glade: the Alliance's only post in Felwood, around its moonwell. Voice: bibles/felwood.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "golhine", id = TODO_NPC("Golhine the Hooded"), name = "Golhine the Hooded", title = "Druid Trainer",
  bible = "bibles/felwood.md", role = "trainer", tier = "service",
  communities = { "talonbranch" }, temper = { "quiet" }, values = { "wise", "patient" },
  prejudice = { class = "WARLOCK", amount = 11, why = "Druid who watched Felwood rot from fel; guards the last clean moonwell." },
  notices = { "class", "form", "lock_shadow" },

  impression = {
    first = "He says the hood only keeps the ash off.",
    third = "{name} met Golhine the Hooded, the quiet druid trainer at Talonbranch Glade.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "This forest was green when I was young, before the demons' servants poisoned it. Keep your fire away from my moonwell." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "The moonwell stays clear when you visit now. I still don't like what you carry, but I'll hear you." },
    { id = "g_druid", when = { class = "DRUID" }, text = "You've come far to train in a sick forest, which is good. Sit by the well." },
    { id = "g_other", when = { ["not"] = { class = "DRUID" } }, text = "The moonwell is clean, though little else here is. Rest a moment, if you need to." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Careful in that shape out there; the bears of Felwood are sick, and they'll take you for kin, and then for food." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The saplings in the glade turned their leaves away from you, and they have only done that once before, when the corruption was close. I teach druids to listen to them, so I will listen now and keep my distance." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "We both listen first, and that is most of it. Felwood is screaming, and anyone who can hear it is welcome at this moonwell." } },
      choices = {
        { text = "Then I'll listen, and help heal what I can.", next = "BACK", reply = "Then you are welcome at the moonwell, and Felwood will be glad of another pair of ears. Sit with me at dusk; it's quietest then.", fx = { align = { light = 1 } } },
        { text = "Listening won't cure this. The corruption must be burned out.", next = "BACK", reply = "Burning is how this forest began to die, when the Legion came with fire. I would rather you listened a while longer.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Satyrs in the trees, cultists at Jaedenar, and things in the corrupted streams that were once fish. A druid learns to walk without being heard here, and I'd guess you learned that long ago, so you'll fare better than most of my students." } },
      choices = {
        { text = "Then I'll watch your students' backs while I'm here.", next = "BACK", reply = "Thank you, and they'll be safer for it, though they'll never know you were there. I'll know, and that will do.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll look after myself. Your students can manage.", next = "BACK", reply = "Perhaps they can, and perhaps not, but I'm glad you'll at least come home. Felwood takes the careless first.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because a druid who only knows healthy places hasn't learned much. Your Light has seen the Scourge, I'd guess, so you already know what sickness looks like, and the forest punishes anyone who comes here expecting kindness." } },
      choices = {
        { text = "Hard lessons make strong hearts. You're right.", next = "BACK", reply = "They do, though I wish the lessons were gentler. Two of my students cried for a week after their first trip to the river.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A sick forest is no place to teach the young.", next = "BACK", reply = "I've thought that too, more often than I'd admit. But the young ones who learn here will be the ones who mend it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I teach druids, not warriors, but I've watched warriors learn this forest anyway, and they learn it faster than the young druids, because they don't expect it to be kind. A druid comes here hoping, a warrior comes here ready, and the forest punishes hope first." } },
      choices = {
        { text = "Hope isn't weakness. I fight because there's still something to save.", next = "BACK", reply = "Then you're the rarest kind of warrior, and the forest needs you. Felwood will try to take that hope from you, so guard it.", fx = { align = { light = 1 } } },
        { text = "Then I'll expect nothing from this forest and spare nothing in it.", next = "BACK", reply = "Then you'll survive it, I suppose, but you'll leave it worse than you found it. I'd ask you to spare what you can.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Sometimes, if the sickness hasn't gone deep, and I've seen a wolf from the south recover after a week of drinking here. But the water has little to spare, and if every hunter brought every sick beast in Felwood to it, it would be gone by summer." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Sometimes, if the sickness hasn't gone deep, and I've seen a wolf from the south recover after a week of drinking here. Let {pet} drink first, before you, so it knows the taste of clean water. It may need to remember it out there." },
      },
      choices = {
        { text = "Then I'll bring only the ones worth saving, and quietly.", next = "BACK", reply = "Thank you, and quietly is the right word. If the Sentinels see a line of hunters at the well, they'll close it.", fx = { align = { order = 1 } } },
        { text = "If it heals beasts, it should be used, not hoarded.", next = "BACK", reply = "It is used, every day, by the forest that's left. If it runs dry, there'll be nothing to share at all.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson = {
      lines = {
        { id = "le_default", text = "How a forest sounds when it's dying, which is not how it sounds when it sleeps. Moonglade will teach you the healthy song, and Felwood will teach you the other one, and you need both before you can call yourself a healer of anything." },
      },
      choices = {
        { text = "I'd rather learn it from a book.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'll listen, then.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because everything outside this glade was green once, and fel made it otherwise. I teach druids to heal the land, and you were taught to burn it, so we start a long way apart, and I would rather not pretend we don't." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because everything outside this glade was green once, and fel made it otherwise, and you have brought some of it to the very edge of my moonwell. I teach druids to heal the land, and you were taught to burn it, so we start a long way apart, and that creature only makes the distance longer." },
      },
      choices = {
        { text = "Then I'll prove myself by keeping my distance.", next = "BACK", reply = "Then I'll watch, and I'll hope you do. Stay on the far side of the well, and my students will stop staring.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burning is the only thing demons understand.", next = "BACK", reply = "Perhaps, but you were taught to call them, too, and that's where Felwood's sickness started. Burn carefully.", fx = { align = { light = -1 } } },
        { text = "Then I'll be on my way.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The Highborne thought the arcane could do anything, and the sea that swallowed their city is answer enough to that. Elune keeps this water clean, and I would rather trust her than a spell." } },
      choices = {
        { text = "Elune's way is the right one here.", next = "BACK", reply = "It is, and I'm glad you see it. The arcane demanded everything from the Highborne, and Elune has only ever asked us to listen.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Highborne failed. That doesn't mean all mages will.", next = "BACK", reply = "No, it doesn't, and I hope you're the one who proves it. But the sea is a long memory.", fx = { align = { order = -1 } } },
        { text = "I'll leave the well alone.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Holy is a priest's word, and I'm no priest, but the water remembers what the forest was before the demons came. I trust that memory more than any blessing I could give, and every year it's fainter." } },
      choices = {
        { text = "Then it should be guarded above everything else here.", next = "BACK", reply = "It is, and the Sentinels guard it as closely as they guard Darnassus. Its memory is all we have left.", fx = { align = { order = 1 } } },
        { text = "Then pour it on the forest now, before it fades.", next = "BACK", reply = "If it were enough, I would, and gladly. But the well would be gone in a day, and the forest would forget it ever was.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_purified = {
      lines = {
        { id = "ddp_default", text = "I remember it before the Legion's filth soaked into the soil, when it was simply the northern edge of Ashenvale. Healed, yes, but not quickly, and not by any one hand; it will take the Emerald Circle centuries, and it will take people like you to keep the satyrs from undoing the work." },
        { id = "ddp_druid", when = { class = "DRUID" }, text = "You have felt the sickness in the soil yourself, so you know how deep it goes. Healed, yes, but over centuries, and by druids who keep coming back to tend it when it would be easier to leave." },
      },
      choices = {
        { text = "Then I'll keep coming back to tend it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_purified", tags = { "news" }, when = { questDone = TODO_QUEST("Purified!") }, text = "Eridan Bluewind sent word from the Sanctuary that you helped him cleanse the Jadefire's corruption, and that something green has begun to grow where it fell. I have waited a long time to hear that, so forgive an old druid for being moved by it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, by the moonwell. You came in quietly, which I approve of, since this forest is full of things that listen." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" },
          text = "A paladin, here by the moonwell. I teach druids, not paladins, but your Light is welcome beside the only clean water in this forest." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. Lean your shield where you like, but don't foul the moonwell; it's the only clean water for a day's walk." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, at the last clean moonwell. Let your beast drink, if it will." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "I've watched Felwood rot from the fel your kind trades in. Say your piece quietly, and stay clear of the well." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "Back again, and the well still clean. Speak, then." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "The last clean moonwell in Felwood rippled when you came near it. Keep your fire to yourself, please." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. You're welcome to the shade, but don't draw on the moonwell for your spells; it has little enough to spare." },
        { id = "h_default", text = "I am Golhine, and I teach the druids who come this far north, though few do, and fewer stay once they've smelled the river. I remember Felwood when it was still Ashenvale, and I stay for that." },
        { id = "h_human", when = { race = "Human" },
          text = "A human, at the last clean moonwell in Felwood. Drink if you must, and forgive me if I don't rise; the last time your people's wars reached this forest, it never recovered." },
        { id = "h_soft", when = { npcFlagBefore = "golhine_soft" },
          text = "You again, the one who reminded an old druid that a plague has more than one set of victims. Sit by the well; I've kept the bench clear." },
        { id = "h_hood", when = { metBefore = true },
          text = "You're wondering about the hood, as everyone does. It keeps the ash off, and that's all, though people prefer a better story." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The moonwell is brightest now, so look at it, and then look at the trees; that's the difference we're fighting for." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, at the last clean moonwell. Whether you pray to Elune or the Light, your prayers are welcome here, so long as you say them quietly." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and a dwarf. I teach druids to heal what is broken, and I'd wager the earth teaches you the same lesson in a rougher voice." },
      },
      again = { { id = "h_again", text = "What else? Ask, and I'll answer, though the moonwell has been my only company for a long while." } },
      choices = {
        { text = "Can Felwood really be healed, Golhine?", next = "dd_purified", when = { questDone = TODO_QUEST("Purified!") } },
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Why teach here?", next = "why" },
        { text = "Talonbranch Glade seems to have held out well.", next = "glade" },
        { text = "You remember Felwood green. What happened to it?", next = "before" },
        { text = "You speak of my people as if we poisoned this forest.", next = "xhuman", when = { race = "Human" } },
        { text = "You've softened toward humans, Golhine.", next = "xsoft", when = { npcFlagBefore = "golhine_soft" } },
        { text = "What does a druid learn here that she can't at home?", next = "lesson", when = { class = "DRUID" } },
        { text = "I mean the moonwell no harm. Why so wary?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Could the arcane help keep the moonwell clean?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is the moonwell's water holy, the way a blessing is?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does a warrior learn in a forest like this, Golhine?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The moonwell's water might heal a sick beast.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why teach druids in a sick forest, Golhine?", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "Something always seems to be listening in Felwood, Golhine.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do druids and shamans heal the land the same way?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because a forest this sick needs druids who aren't afraid of it. I can't make the young ones unafraid, but I can make them used to it." },
      },
      choices = {
        { text = "That's a hard lesson.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Do many of them stay?", next = "why_stay" },
      },
    },
    why_stay = {
      lines = {
        { id = "ws_default", text = "Two in five, perhaps, and the ones who leave aren't worse druids for it. Some go back to Moonglade and some go to the Emerald Sanctuary, where the work is harder still, and I don't ask which they chose until they're ready to say." },
      },
      choices = {
        { text = "And the ones who stay?", next = "why_young" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_young = {
      big = true,
      lines = {
        { id = "wy_default", text = "They learn to hear the forest without weeping at it, which takes most of a year. I'm never sure whether I've taught them strength or only taught them to stop feeling." },
      },
      choices = {
        { text = "A healer has to bear the pain. That is strength.", next = "BACK", reply = "Thank you, that's the answer I hope for on my better nights. I'll tell the young ones you said it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them weep. A druid who stops feeling is lost.", next = "BACK", reply = "That's my fear too, and I'll keep your words in mind. I'd rather have a student in tears than one who's stopped noticing.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = {
        { id = "be_default", key = true, fx = { hear = "humans_brought_the_war" },
          text = "The Legion's servants happened to it, and the orcs before them, and both came to Kalimdor out of the humans' war. The humans fought the Horde for a generation and penned it in camps, then lost their own kingdom to the plague, and every piece of that quarrel crossed the sea and fell on my forest." },
        { id = "be_nelf", when = { race = "NightElf" }, fx = { hear = "humans_brought_the_war" },
          text = "The humans' war happened to it, {g:brother|sister}. They fought the orcs for a generation and lost their kingdom to the plague, and the orcs, the dead and the demons who drove them all crossed the sea after them and came down on Ashenvale's northern woods." },
      },
      choices = {
        { text = "So you blame the Alliance for Felwood?", next = "before_alliance" },
        { text = "The humans didn't summon the Legion. The Highborne did.", next = "before_highborne" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before_alliance = {
      big = true,
      lines = {
        { id = "ba_default", key = true,
          text = "I blame them for not keeping their wars at home, and now the High Priestess has bound us to their Alliance, so their next war will be ours as well. My people stood alone for ten thousand years, and I would sooner we stood alone again than bleed for kings who will be dust before this moonwell runs clear." },
        { id = "ba_horde", when = { faction = "Horde" },
          text = "I blame the war that brought your people west, and the Alliance that fought it, and I've no great love for either banner. My people stood alone for ten thousand years, and I'd sooner we did again than be dragged into the next round of a quarrel that began across the sea." },
      },
      choices = {
        { text = "Standing alone is how Felwood fell. Allies held Hyjal.", next = "BACK",
          reply = "Allies held Hyjal, and Felwood was the price of the road there, which is a hard sum to call a victory. Still, I'll grant that we did not hold it alone.",
          fx = { align = { order = 1 }, opinion = { alliance = "necessary" } } },
        { text = "Then stand alone. Let the humans fight their own wars.", next = "BACK",
          reply = "That's what I'd tell the High Priestess, if she ever came this far north to ask. She won't, and I'll keep teaching druids in the meantime.",
          fx = { affinity = 1, align = { order = -1 }, opinion = { alliance = "distrust" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before_highborne = {
      lines = {
        { id = "bh_default", fx = { expose = "humans_brought_the_war" },
          text = "That is true, and it is what the priestesses tell me whenever I say this aloud. But the Highborne are ten thousand years drowned, and the humans are in Auberdine buying passage on our ships, so forgive an old druid for aiming at the target he can still see." },
      },
      choices = {
        { text = "That's not fair, and you know it.", next = "BACK", reply = "I know it, and I'll go on saying it all the same, because the forest needs someone to be angry for it. Fairness I leave to the Sanctuary.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = {
        { id = "xh_default", text = "Not you, and not by your own hand, but your kingdom's war came here and never left. You're welcome to the shade of the moonwell, but I'll not pretend I'm glad your people found their way west." },
      },
      choices = {
        { text = "Then judge me by what I do for Felwood.", next = "BACK", reply = "That I can do, and the forest will judge with me. Bring something green back from the south and we'll speak again.", fx = { align = { honor = 1 } } },
        { text = "Your grudge is your own business. I'll drink and go.", next = "BACK", reply = "Then drink, and mind the edge of the well. Honest dislike is easier to live beside than false welcome.", fx = { align = { honor = -1 } } },
        { text = "The plague took Lordaeron from my people too. We both lost to it.", tag = "Persuade", next = "xhuman_soft",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Purified!") }, { class = { "PALADIN", "PRIEST" } } } } },
          fail = { next = "xhuman_fail", fx = { affinity = -1 } } },
      },
    },
    xhuman_soft = {
      lines = {
        { id = "xs_default", key = true, fx = { npcFlag = { set = { "golhine_soft" } } },
          text = "It did, didn't it, and I've spent so long counting what came west that I never counted what was left behind in Lordaeron. Very well; I'll keep my anger for the war, and not for those who fled it." },
      },
      choices = {
        { text = "That's all I ask.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman_fail = {
      lines = {
        { id = "xf_default", text = "Victims, perhaps, but you went home again and the forest didn't. Come back when you've done something for Felwood, and I'll listen more kindly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Farewell, then.", next = "END" },
      },
    },
    xsoft = {
      lines = {
        { id = "xso_default", text = "Toward you, at least, and that's further than I meant to go in this lifetime. I still curse the war every time the river stinks, but I've stopped cursing everyone who came out of it." },
      },
      choices = {
        { text = "That's a start.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    glade = {
      lines = { { id = "g_default", text = "It's a clearing that's held out longer than most, and the moonwell keeps it clean, mostly. We guard the well, and the well guards us." } },
      choices = {
        { text = "Who else keeps the glade?", next = "glade_folk" },
        { text = "What threatens it?", next = "glade_threat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    glade_folk = {
      lines = {
        { id = "gf_default", text = "Mishellena and her hippogryphs, who carry everything we eat, and Malygen, who sells reagents and fusses about the damp. Taronn Redfeather studies the wildkin of Winterspring and talks about them to anyone who sits still, so don't sit still near him unless you have an afternoon to give." },
      },
      choices = {
        { text = "I'll keep moving, then.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    glade_threat = {
      lines = {
        { id = "gt_default", text = "The Deadwood to the north, the satyrs to the south, and the slow rot of the streams, which is the worst of them because it never sleeps. The Sentinels keep the first two off, and the moonwell keeps the third, for now." },
      },
      choices = {
        { text = "For now?", next = "glade_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    glade_now = {
      big = true,
      lines = {
        { id = "gn_default", text = "Each year the moonwell's light reaches a step less far into the trees. One day it will reach only the water's edge, and then we'll have to choose whether to stay and keep it, or carry what we can south and let the forest have the glade." },
      },
      choices = {
        { text = "Stay. Abandoning the well is giving Felwood to the demons.", next = "BACK", reply = "That's what my heart says, and I'll likely listen to it. I've kept this well three hundred years, and I'm not ready to hand it to the satyrs.", fx = { align = { honor = 1 } } },
        { text = "Go south. A druid alive does more good than a dead one.", next = "BACK", reply = "My head says the same, and it's a hard thing to hear. Perhaps when the light reaches only the water, I'll know.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm a teacher of druids, and the rest is under the hood, where it stays." } },
    advice = { { id = "tp_ad", text = "Learn the sick places as well as the healthy ones. A healer who only knows health is no healer." } },
    cenarion_circle = { { id = "tp_circle", text = "The Emerald Circle heals the south of the forest and we hold the north, but the middle belongs to the demons, for now." } },
    emerald_dream = {
      { id = "tp_emerald_dream", text = "Every druid I teach finds the Dream sooner or later, and I tell them not to stay too long. The waking world needs us more." },
      { id = "tp_emerald_dream2", when = { class = "DRUID" }, text = "You've touched the Dream, I think, so I'll say it plainly. It is beautiful and it is not yours, so come back each time." },
    },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are the oldest furbolgs, and the wisest. I'd send any druid to learn from them if they'd allow it." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil is our oldest tree, and Felwood was its forest. I teach here because I'd like to see it green again." } },
    _none = { { id = "tp_none", text = "I don't know, and I've lived long enough not to pretend otherwise." } },
  },
}
