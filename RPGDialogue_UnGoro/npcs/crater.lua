-- Un'Goro beyond the Refuge's fire: Hol'anyee Marshal, Torwa Pathfinder, the bloodpetal growers, and the lost souls down in the crater.
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "holanyee", id = TODO_NPC("Hol'anyee Marshal"), name = "Hol'anyee Marshal",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  impression = {
    first = "She takes the crater's dangers personally.",
    third = "{name} met Hol'anyee Marshal, co-leader of the Marshal Expedition at Marshal's Refuge.",
  },
  greetings = {
    { id = "g_main", text = "Hold up there. Let me see if you're injured before you come any closer." },
    { id = "g_back", when = { metBefore = true }, text = "You made it back, and in one piece. My brother's tent can't say the same, since a stegodon sat on it last night." },
  },
  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I've watched one swallow a pterrordax whole, so I wouldn't bet against it. The crater doesn't care how powerful you think you are, and I've buried people who were sure of themselves, so if your demon can keep the beasts busy while you get clear, use it, and don't be proud about it." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I've watched one swallow a pterrordax whole, so I wouldn't bet against it, and I'd not let {pet} wander too far from you to find out. If your demon can keep the beasts busy while you get clear, use it, and don't be proud about it, because I've buried people who were sure of themselves." },
      },
      choices = {
        { text = "Good advice. I'll keep my demon as a shield, not a show.", next = "BACK", reply = "That's the way of it. Let the beasts chew on your demon while you put a ridge between you and them.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon can handle anything this crater throws at it.", next = "BACK", reply = "I said the same about my rifle once, so I did, and the crater taught me otherwise. Keep your demon close and your feet closer.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Devilsaur, no question, because a thing that size has no business moving that quietly, and it hunts by feel through the ground. I've lain in the ferns with my rifle on one for an hour and never once found the nerve to fire." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Devilsaur, the worst of them, and it hunts by feel through the ground. Keep {pet} close and quiet when the ground starts to shake, because a devilsaur will take a beast before it takes a hunter." },
      },
      choices = {
        { text = "A beast that fearsome deserves respect, not a trophy hunt.", next = "BACK", reply = "Spoken like a hunter who's lived long enough to learn something. Respect it, and you'll keep your boots.", fx = { align = { honor = 1 } } },
        { text = "Every beast can fall. I'd have taken the shot.", next = "BACK", reply = "Plenty of hunters would have, and plenty of them are bones in the ferns now. Take the shot if you must, but take it from far away.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Anyone who went near the stegodons this week, and the two scholars a devilsaur chased into the tar pits. I can shoot what's hunting us, but I can't stitch up what it leaves behind, so I'll take whatever a priest can spare." } },
      choices = {
        { text = "I'll tend them before I head back into the crater.", next = "BACK", reply = "Bless you for that, the infirmary tent's been full since the tar pits. They'll be glad of a kind face and a steady hand.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The crater culls the careless. Your scholars should learn from it.", next = "BACK", reply = "They're learning, so they are, the hard way and slowly. I'd still rather they lived long enough to finish the lesson.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They hunt in packs and they're cleverer than any wolf I've seen, so they are. I know they were here long before us, but I've buried two scholars this season and I'm out of patience with them." } },
      choices = {
        { text = "You're in their crater. Learn their ways.", next = "BACK", reply = "That's my thinking too, and the hard lessons have taught me plenty. We're guests here, and rude guests get eaten.", fx = { align = { light = 1 } } },
        { text = "Then thin the packs before you lose more.", next = "BACK", reply = "We've tried, and every pack we thin, two more come out of the ferns. I'd rather learn their ways than lose more trying.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Wilder, and the elementals that walk its slopes don't stay put, either. I've shot at things on that ridge that took a bullet the way a candle takes a raindrop, so I go round it now, and I'd advise you to do the same." } },
      choices = {
        { text = "Fire like that needs binding before it spreads.", next = "BACK", reply = "Binding fire's a shaman's work, and I'll leave it to you gladly. Just don't stand too near the ridge when you try it.", fx = { align = { order = 1 } } },
        { text = "Leave the mountain be. Its fire isn't ours to tame.", next = "BACK", reply = "I'd sleep easier if everyone thought that way, so I would. The mountain's temper is its own business, and we keep well clear.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than another rifle would, some days. A scout who can slip past a devilsaur without stirring it can warn a camp before the raptors reach it, and my last two scouts were brave and loud, and I buried them both." } },
      choices = {
        { text = "A good scout slips past the beast. Fighting it is a fool's job.", next = "BACK", reply = "That's the scout I need, and the expedition will thank you. Slip past and bring back what you see.", fx = { align = { honor = -1 } } },
        { text = "I'd rather face a beast than creep around it.", next = "BACK", reply = "Then you'll have a short career in this crater, so you will. Brave's grand, but a live scout's better.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I've watched a mage freeze a whole raptor pack in the mud, so I know it works. But mana runs dry and I've never yet run out of shot, so I'd want both, and I'd want the mage standing behind my rifle." } },
      choices = {
        { text = "Then hire mages. The expedition needs proper guards.", next = "BACK", reply = "I'd hire every mage in Stormwind if Williden's coffers allowed it. As it is, I'll take whoever walks through the gate.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every scholar ought to learn to defend themselves.", next = "BACK", reply = "That's what I keep telling them, and some of them even listen. One clouted a raptor with an atlas last week, and it worked, mostly.", fx = { align = { order = -1 } } },
        { text = "Let's leave spells be.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than I like to count, and I count every one of them. We lost both base camps, and some of the folk who were there we never found, so I don't know whether to pray for them or keep looking." } },
      choices = {
        { text = "Keep looking, and pray as you search. Hope costs nothing.", next = "BACK", reply = "I'll keep looking, and I'll try the praying, for whatever good it does. Thank you for the hope, it's in short supply up here.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mourn them and move on. The crater doesn't give back its dead.", next = "BACK", reply = "It doesn't, and I know it, but I can't stop counting all the same. Moving on is harder than it sounds.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Maybe it should, and I've said so to Williden more than once, but he won't leave without his crystals, and I won't leave without him. So I keep the raptors off the scholars, and I hope someone like you is around when I can't." } },
      choices = {
        { text = "Your leader has decided. Stand by him and see it through.", next = "BACK", reply = "I have stood by him, every step of the way, and I'll go on doing it. But it's hard to watch the graves pile up.", fx = { align = { order = 1 } } },
        { text = "Lives matter more than crystals. Drag him out if you must.", next = "BACK", reply = "Drag him? You've not met Williden, he'd dig his heels in like a mule. But maybe you're right, and maybe I'll have to.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Devilsaur", min = 20 } },
          text = "Word is you've been bringing down devilsaurs, which I've never had the nerve to do myself. Either you're the best shot in the crater or the luckiest, and I'd like to know which." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, down in the crater. Keep your demon close and your eyes open, because the devilsaurs don't care what you've summoned, they'll eat it first and you second." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Good, maybe you can tell me why the ground in this crater is warm to the touch even at midnight, because nobody else can, and it keeps me awake." },
        { id = "h_default", key = true, text = "Hol'anyee Marshal, Williden's sister and the better shot of the two of us, whatever he tells you. While he plans, I go out and keep the raptors from eating our scholars." },
        { id = "h_c0", when = { class = "HUNTER" }, text = "A hunter! Finally, someone who understands why I sleep with my rifle. The raptors here hunt like nothing else in Azeroth." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Williden will want to ask you about the plants, but I'd rather know whether you can talk the raptors out of eating our scholars." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You came up my path without me hearing a single step, and that's a rare thing in this crater. I could use feet like yours on patrol, because the raptors hear everything else." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A spellcaster at my campfire, so Williden will want you near his crystals by sundown. Just don't set anything alight, because the ferns down there go up like oil-soaked rags." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, all the way down in the crater. I won't ask why, because frankly the Refuge needs a healer more than it needs answers." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, down here? Good, because my scholars keep coming back from the crater bitten, stung and poisoned all at once, and Williden's bandages only go so far." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Williden will want to give you a speech about the scholarly value of the crater, but I'd rather give you a rifleman's advice, which is never to charge a devilsaur." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "You walk like someone who's tracked big game, and in Un'Goro that's the only kind there is. Talk to me before you go down past the ridge." },
      },
      again = { { id = "h_again", text = "What else? I've got a patrol soon." }, { id = "h_again2", text = "Ask away, quickly." } },
      choices = {
        { text = "Is the Fire Plume as wild as it looks from up here?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The raptors here look dangerous.", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's it like hunting in the crater?", next = "b1_1" },
        { text = "Tell me about Williden.", next = "b2_1" },
        { text = "Why did the camps fall?", next = "b3_1" },
        { text = "I'll fight anything down there.", next = "x_1", when = { class = "WARRIOR" } },
        { text = "Should the expedition pull out?", next = "s_1" },
        { text = "Would quiet feet really help your patrols down there?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Would magic guard your scholars better than rifles?", next = "xmage", when = { class = "MAGE" } },
        { text = "The crater must have taken some of your people.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who in the Refuge needs healing most?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Shouldn't the expedition leave before more people die?", next = "xapala", when = { class = "PALADIN" } },
        { text = "You must have tracked some dangerous beasts in the crater.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Would a devilsaur really eat a demon?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Like nothing else in the world, and I've hunted a good deal of it. The raptors hunt in packs and think like soldiers, and the devilsaurs don't think at all; they just eat." } },
      choices = { { text = "Has the crater cost you?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "I lost two good scouts to raptors in the first month, which taught me to always watch my flanks. Now I teach that lesson to everyone who comes to the Refuge." } },
      choices = { { text = "What lesson is that?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you go hunting down there, never chase a lone raptor. There's never only one." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "He's my brother, he's brilliant, and he worries too much, which makes him a decent leader and a terrible camper. I love him, and I wouldn't let anyone else watch his back." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "We pushed in too fast, too far, and the crater pushed back. I told Williden we needed more guards, and he agreed, and we still didn't have enough." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Brave words, and maybe you can. Just remember, the crater doesn't care how brave you are, only how fast you can run." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Williden won't give up, and part of me admires him for it. The other part wonders how many more we'll lose." } },
      choices = { { text = "Keep going. Discovery is worth the risk.", next = "BACK", reply = "That's what Williden says, and you two would get along. I'll keep going, but I'll keep counting too.", fx = { affinity = 1, align = { order = 1 } } }, { text = "Pull out before you lose anyone else.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's our lifeline, for water and powder and bandages, and the goblins know it, so they charge accordingly. My brother pays without blinking, and I blink for both of us." } },
    silithid = { { id = "tp_silithid", text = "The bugs from Silithus have started crawling up out of the crater's southern edge, and I don't like it one bit. They didn't used to come this far north." } },
    explorers_league = { { id = "tp_explorers_league", text = "The Explorers' League would kill for the bones we've dug up, and some of them have tried, in a manner of speaking. My brother keeps the best ones for himself." } },
    booty_bay = { { id = "tp_booty_bay", text = "I bought my first rifle in Booty Bay, from a goblin who swore it'd never misfire. It misfired twice the first week, and I've kept it twenty years anyway." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't think the crater does either." } },
  },
}

P:NPC {
  key = "torwa", id = TODO_NPC("Torwa Pathfinder"), name = "Torwa Pathfinder",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  impression = {
    first = "He has set his sights on the great raptor Lar'korwi.",
    third = "{name} met Torwa Pathfinder, a tauren hunter in Un'Goro Crater.",
  },
  greetings = {
    { id = "g_main", text = "The Earth Mother walks here, stranger, and so do great beasts. Tread carefully." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back, hunter. The trails have missed you." },
  },
  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because he is the greatest of the crater's raptors, and he has taught me more than any elder on the plains. To hunt him is to honour him, and I would not have him fall to a fireball thrown from a distance, for that is no hunt at all." } },
      choices = {
        { text = "Then I'll leave him to you. He deserves an honest hunt.", next = "BACK", reply = "You understand, then, and I am grateful. An honest hunt is the only way to thank such a teacher.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A dead raptor is a dead raptor, however it falls.", next = "BACK", reply = "To the crater, perhaps, but not to me. How a teacher falls is the last lesson he gives.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because Lar'korwi, the great raptor, has killed every hunter who came at him in haste. I have watched him for many moons, learning where he drinks and where he sleeps, and when I am ready, I will face him, but I will not rush, and neither should you." } },
      choices = {
        { text = "Patience wins the hunt. I'll learn from you.", next = "BACK", reply = "Then you are already wiser than the ones who came before you. Sit with me at the water, and watch how he moves.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Waiting gives the beast time to kill again.", next = "BACK", reply = "It does, and every day I wait, I carry that weight. But a hasty hunter feeds Lar'korwi, and that helps no one.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "There is, if the warrior learns to stand still, for the raptors of this crater test a line before they strike it. Lar'korwi's pack will circle you three times, and the one who breaks first and charges is the one they take." } },
      choices = {
        { text = "Holding firm wins. I'll let them break on my shield.", next = "BACK", reply = "You have the warrior's patience, and the raptors will not know what to make of it. Let them break, and then finish them.", fx = { align = { honor = 1 } } },
        { text = "I'd charge the first raptor that showed itself.", next = "BACK", reply = "Then the second and third raptors would finish you, young one. Stand still, and let them come.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That the greatest hunter does not need to chase, for Lar'korwi waits by the water where the prey must come, and he never wastes a step. I have learned more from following him than from all the elders of Mulgore, though I would not say so in Thunder Bluff." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That the greatest hunter waits where the prey must come, and your {pet} watches the tree line the way he does. The Earth Mother made it to hunt, and you have not trained that out of it." },
      },
      choices = {
        { text = "A worthy quarry deserves a hunter's respect, even in death.", next = "BACK", reply = "Yes, and in death most of all. Lar'korwi will be honored, whoever takes him.", fx = { align = { honor = 1 } } },
        { text = "A hunt is a hunt. Respect doesn't fill a belly.", next = "BACK", reply = "No, but it fills something the belly cannot. Track one beast for many moons, hunter, and you will understand me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The crater has room for everything, priest, because it is older than prayer and younger than the hills around it. Lar'korwi hunts without hate and dies without fear, and if your Light or your loa can teach that, they are welcome here." } },
      choices = {
        { text = "I'll pray for the hunter and the hunted alike, Torwa.", next = "BACK", reply = "Then the crater has room for your prayers too. The Earth Mother hears them, I think, even here.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The strong feed on the weak. No prayer changes that.", next = "BACK", reply = "Perhaps not, but prayer changes the one who prays. That is no small thing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Because that is how the lesson ends, with the student proving what he has learned. I take no pleasure in it, but I will honor him with the hunt and waste nothing he leaves behind." } },
      choices = {
        { text = "That is the way of the hunt. Honor him well.", next = "BACK", reply = "I will, with every step of the hunt. That is my promise to him.", fx = { align = { honor = 1 } } },
        { text = "A teacher should be thanked, not hunted.", next = "BACK", reply = "Thanked, yes, and the hunt is my thanks. You will understand, perhaps, when you have had such a teacher.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "She speaks louder here, I think, and with less patience. The beasts are larger, the plants hungrier and the mountain breathes fire, as if this were a place she shaped first and never finished taming." } },
      choices = {
        { text = "Then we must hunt here with great care and humility.", next = "BACK", reply = "That is the only way, and you have learned it quickly. The crater has humbled me every day since I first came down its slope.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A wild land rewards the boldest hunter. Take what you can.", next = "BACK", reply = "The boldest hunter feeds the boldest raptor here. Take what you need, and leave the rest for the crater.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The great raptor hides in the ferns and strikes from them, and no one calls him dishonorable. I would only ask that you take what you kill with respect, whether you killed it in the open or from behind a fern." } },
      choices = {
        { text = "A kill is a kill. The prey doesn't care how it died.", next = "BACK", reply = "Then you hunt as the raptor does, and I will not call it shame. Only honor what you kill, as he does, and waste none of it.", fx = { align = { honor = -1 } } },
        { text = "I'd rather meet my quarry face to face.", next = "BACK", reply = "Then we hunt alike, you and I. Face to face is the honest way.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Tell me something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "The Earth Mother made the raptors and the ferns and the fire under this crater, and none of them were made to be bound. What you call upon was made somewhere else entirely, and the creatures of Un'Goro know it, even if your own people pretend not to." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "The Earth Mother made the raptors and the ferns and the fire under this crater, and none of them were made to be bound. Your demon was made somewhere else entirely, and you can hear how the raptors have gone quiet since it came, so they know it, even if your own people pretend not to." },
      },
      choices = {
        { text = "Power is power. I use what answers me.", next = "BACK", reply = "Power answers many, warlock, and not all who answer are friends. Use it carefully, under the Earth Mother's sky.", fx = { align = { light = -1 } } },
        { text = "I keep it leashed. I know the danger better than you.", next = "BACK", reply = "Then you are wiser than most who carry it. Keep it leashed, and the crater will tolerate you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "We should speak of other things.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage walks the crater. Your fire is quick, but the raptors here are quicker, and I would see you learn that before they teach it to you." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin walks the crater. The beasts here are older than your Light, I think, and they do not fear it, but they fear patience, and I wonder if you have any." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman comes into the crater. Then you have felt it too: the land here is young and old at once, and the Earth Mother's breath is very close to the surface." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest walks the crater. The Earth Mother does not speak in your words, I think, but she listens to anyone who comes with an open heart." },
        { id = "h_default", key = true, text = "I am Torwa Pathfinder. I came to this crater to learn from its beasts, and the greatest of them, Lar'korwi, has become my teacher and my quarry." },
        { id = "h_c0", when = { questActive = TODO_QUEST("The Bait for Lar'korwi") }, text = "Lay the bait where Lar'korwi hunts, and be ready, for he will come quickly and he will not come gently." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid has come to the crater. Then you will understand why I call Lar'korwi my teacher, for nothing here hunts as purely as he does." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You walk softly, stranger, which is the first lesson Lar'korwi would teach you. But a raptor smells what it cannot hear, so softness alone will not save you here." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "There is a sourness on you that the beasts can smell, and so can I. Whatever you carry in your shadow, keep it leashed while you walk near my camp." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Your strength is plain to see, but in this crater strength alone feeds the devilsaur, and patience feeds the hunter." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Then you will understand why I have spent so long in the ferns watching one raptor, and why I am not ashamed of it." },
        { id = "h_dd_devilsaur", tags = { "news" }, when = { killed = { name = "Devilsaur", min = 20 } }, text = "The devilsaurs walk more carefully through the jungle now, and I have seen why: their tracks end where yours begin. You have hunted the greatest beasts of this crater, and I would hear how." },
      },
      again = { { id = "h_again", text = "Ask, and I'll answer while I watch the treeline for raptors." }, { id = "h_again2", text = "Speak, hunter." } },
      choices = {
        { text = "Does the Earth Mother speak differently in this crater?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why hunt your own teacher, Torwa?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I've heard the name Lar'korwi.", next = "b1_1" },
        { text = "Why come to Un'Goro?", next = "b2_1" },
        { text = "It looks dangerous out here.", next = "b3_1" },
        { text = "The Earth Mother guide you, Torwa.", next = "x_1", when = { race = "Tauren" } },
        { text = "Perhaps Lar'korwi should be left alone.", next = "s_1" },
        { text = "Is it dishonorable to hunt from hiding?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Does my magic offend you, hunter?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is there room in this crater for a priest's prayers?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is there no place for a warrior's strength in Un'Goro?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What has Lar'korwi taught you?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why would beasts fear patience?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why do you hunt Lar'korwi, Torwa?", next = "xmage", when = { class = "MAGE" } },
        { text = "I've hunted the devilsaurs, Torwa. Many of them.", next = "dd_devilsaur", when = { killed = { name = "Devilsaur", min = 20 } } },
        { text = "Farewell.", next = "END" },
      },
    },
    dd_devilsaur = {
      lines = {
        { id = "dd_devilsaur_1", text = "I came here to learn from these beasts, and the devilsaur has taught me most of all, because it fears nothing and wastes nothing. A hunter who takes one should take its lesson too, and thank the Earth Mother for the meat and the hide, or the hunt is only a killing." },
      },
      choices = {
        { text = "I thank the Earth Mother for each one I take.", next = "BACK", reply = "Then you hunt as the tauren hunt, whatever your blood. The crater will remember you kindly, and so will I.", fx = { align = { light = 1 } } },
        { text = "A kill is a kill. The beast doesn't care.", next = "BACK", reply = "The beast doesn't, perhaps, but the land does. Walk lightly in Un'Goro, friend, because it is older than either of us and it keeps count.", fx = { align = { light = -1 } } },
        { text = "Something else, Torwa.", next = "BACK" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "The greatest of the crater's raptors, the one the others follow. I have tracked him for many moons, and he has led me to places no other hunter has seen." } },
      choices = { { text = "Why hunt him, then?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "To hunt him is to honor him. I will not take him lightly, nor will I take him without purpose, for he deserves a hunter's respect." } },
      choices = { { text = "And then?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "When he falls, his strength will feed many, and his spirit will return to the Earth Mother. That is the way of things." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "This crater is like the world when it was young. The Earth Mother's children here are stronger and older, and a hunter can learn much from them." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Very, but so is all of life. A hunter who fears danger does not hunt, and a hunter who does not respect it does not live." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "And you, kin. It is good to see a tauren face so far from Mulgore." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some at the Refuge say the beast should be left in peace. I say the hunt is part of the balance." } },
      choices = { { text = "The hunt is part of the balance.", next = "BACK", reply = "You understand, then, and it eases my heart to hear it. The balance must be kept, even when it is hard.", fx = { affinity = 1, align = { light = 1 } } }, { text = "Some beasts should be left to live.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother is young here, I think, younger than anywhere else in the world, and her beasts are older. That is the strangeness of this crater." } },
    cairne = { { id = "tp_cairne", text = "Cairne is a great hunter, and he would understand why I chase Lar'korwi. Some prey is worth a lifetime of tracking." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's people fight beside mine, and I am grateful, but there is no Warchief in Un'Goro. Here the beasts rule, and we only visit." } },
    silithid = { { id = "tp_silithid", text = "The silithid are crawling north out of the desert, and they do not belong here. The Earth Mother does not weep for them." } },
    _none = { { id = "tp_none", text = "That is not something the trails have taught me." } },
  },
}

P:NPC {
  key = "muigin", id = TODO_NPC("Muigin"), name = "Muigin",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  impression = {
    first = "He talks about bloodpetals with real affection.",
    third = "{name} met Muigin, a botanist at Marshal's Refuge.",
  },
  greetings = {
    { id = "g_main", text = "Oh! Mind the sprouts, please, they're very delicate." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! The sprouts are growing nicely, thank you for asking." },
  },
  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A sap that numbs whatever it touches, which is how they catch the insects. Larion thinks it would make a terrible weapon, and I think it would make a wonderful medicine, so we argue about it every night, and I suppose you'd side with him." } },
      choices = {
        { text = "Medicine first. A poison like that could do terrible harm.", next = "BACK", reply = "That's what I keep telling Larion! He sketched a numbing dart last night, and I made him burn the drawing.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A numbing poison? I'd pay well for that, Muigin.", next = "BACK", reply = "Pay well? Oh, I don't sell poison, friend, it's against everything I believe. Ask Larion, he might sell you some out of spite.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because they eat insects, and sometimes fingers, and they grow faster near the crater's crystals than anywhere else in the world. Larion says they're dangerous and I say they're fascinating, and we're both right, but I'd never have discovered half of what I know if I'd listened to him." } },
      choices = {
        { text = "Curiosity is a virtue, but caution is wiser.", next = "BACK", reply = "You sound like Larion, and that's not a compliment, though you mean well. I'll be careful, I promise.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You're right to follow your curiosity, Muigin.", next = "BACK", reply = "Oh, thank you! If I'd listened to Larion, I'd never have learned that they close up at dusk like little fists.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a bloodpetal feels the ground through its roots, and a nervous body shakes it far more than a steady one! A warrior who keeps still in his boots is as safe as a stone, so I always ask the steady ones to hold the basket." } },
      choices = {
        { text = "Steadiness is a warrior's best armour. I won't flinch.", next = "BACK", reply = "That's the spirit, and the bloodpetals will respect you for it. Steady feet, steady hands, and no lashing.", fx = { align = { order = 1 } } },
        { text = "If a plant lashes at me, I'll cut it to the roots.", next = "BACK", reply = "Cut them to the roots? Oh, please don't, they're only plants, and they're only hungry. Stand still instead.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some of them hunt everything, and the bloodpetals are very good at it! They lie quiet under the ferns until something warm walks by, and so the raptors here step very carefully, and you ought to as well." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Do keep {pet} away from the red blooms, please, because the lashers have a taste for fur, and I'd hate to have to write it up as a scientific observation." },
      },
      choices = {
        { text = "Even dangerous plants have their place. Leave them be.", next = "BACK", reply = "That's what I always say! Without the lashers, the whole Refuge would be ankle-deep in beetles.", fx = { align = { light = 1 } } },
        { text = "Anything that eats beasts should be burned out.", next = "BACK", reply = "Burned? Oh, that's awful, and very wasteful. They're only doing what they were made to do.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I've no idea, and that's the wonderful part, because nobody's ever tried it on Un'Goro soil! Some folk at the Refuge would call it nonsense, but they said the same about talking to my plants, and now they lean toward me when I do." } },
      choices = {
        { text = "I'll bless them, and we'll see what grows from it.", next = "BACK", reply = "Wonderful! Let's see what the Light does to Un'Goro soil. I'll take notes.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Feed them shadow instead. Hungry things grow strongest.", next = "BACK", reply = "Shadow? Oh, I don't think that's a good idea, they're hungry enough already. Let's try the Light first.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Heat from below, water from the springs and something in the soil I can't name, all pushing them to grow faster than anything I studied back home. The bloodpetals bite, the vines strangle, and some of the bigger ones get up and walk about, which Larion insists is perfectly natural." } },
      choices = {
        { text = "Wild growth needs pruning. Study it, then control it.", next = "BACK", reply = "Control it? Oh, I'm not sure we can, but studying it is a wonderful start. Let's begin there.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Life this wild should be left to grow as it will.", next = "BACK", reply = "That's what I think too, though Larion calls me soft for it. Let them grow, and let us watch.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Only a little spell, and only on the small ones, because the big ones bite. Plants that eat meat shouldn't exist anywhere, so I can't help wondering if something odd was done to this crater long ago, and magic might be how we find out." } },
      choices = {
        { text = "Science should be careful. Larion's right to worry.", next = "BACK", reply = "Larion's always right to worry, that's his job. But science needs a little courage too.", fx = { align = { order = 1 } } },
        { text = "Try it. You'll never learn anything by being timid.", next = "BACK", reply = "That's the spirit! Larion would faint to hear you, but I'll try it, very carefully.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll think about it. Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They do, just a little, the way they lean from a cold draught! I don't know what that means, and I'm not sure I want to, but if you'd stand still by that pot for a moment, I'd be ever so grateful for the data." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They do, just a little, the way they lean from a cold draught, and look, they lean even more from that creature of yours! I don't know what that means, and I'm not sure I want to, but if you'd both stand still by that pot for a moment, I'd be ever so grateful for the data." },
      },
      choices = {
        { text = "Study it. Every power should be understood.", next = "BACK", reply = "I will, and I'll write down every lean and every shudder. Larion will say I'm wasting ink.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Maybe the plants know better than we do.", next = "BACK", reply = "Maybe they do! They certainly knew to lean away from you before I knew why.", fx = { align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You'll know a thing or two about poisons, I expect, and my bloodpetals produce one that's quite remarkable, though I'd never sell it, of course." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! I wonder whether a blessing would make my bloodpetals bloom, or only make them hungrier, because they're quite hungry enough already." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do the spirits ever talk to plants, do you think? Some of my bloodpetals behave as if they're listening, and frankly it's a little unsettling." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! I wonder whether a blessing would make my bloodpetals grow, or whether it would only make them hungrier, because they're quite hungry enough already." },
        { id = "h_default", key = true, text = "Muigin, botanist! I study the plants of Un'Goro, especially the bloodpetals, which are as fascinating as they are dangerous. My partner Larion and I have been experimenting with them." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Muigin and Larion") }, text = "Bring me those bloodpetal sprouts, and mind the ones that bite. They're very hungry this time of year." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "Oh, a mage! You must tell me whether the bloodpetals react to arcane magic, because Larion insists it's dangerous to try and I suspect he's simply jealous he didn't think of it." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "You're a warlock, aren't you? I can tell by the way the bloodpetal sprouts lean away from you, which I've never seen them do for anyone else, and I'd very much like to take notes." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Oh, wonderful, could you stand there by the bloodpetals while I take a cutting? They only lash at people who flinch, mostly." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! I do hope your beast isn't hungry, because half of what grows in this crater would happily eat it right back." },
      },
      again = { { id = "h_again", text = "What else?" }, { id = "h_again2", text = "Ask me about the plants!" } },
      choices = {
        { text = "Why do the crater's plants grow so fierce?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I've never seen bloodpetals before.", next = "b1_1" },
        { text = "Who is Larion?", next = "b2_1" },
        { text = "I'd guess some of the plants really bite.", next = "b3_1" },
        { text = "Is there magic in your bloodpetals?", next = "x_1", when = { class = { "MAGE", "DRUID" } } },
        { text = "Is it right to experiment on living plants?", next = "s_1" },
        { text = "Would you really have me cast at your bloodpetals?", next = "xmage", when = { class = "MAGE" } },
        { text = "The plants lean away from me?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Would a blessing really help your plants grow?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why would they only lash at people who flinch?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Plants that hunt animals? You can't be serious.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why are your bloodpetals so hungry?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What sort of poison do they make, exactly?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Carnivorous plants, and very clever ones, and I adore them for it! They lure insects and small creatures, and sometimes larger creatures, too, if they're hungry enough." } },
      choices = { { text = "What makes them worth studying?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Larion and I believe their sap has amazing properties, though we're still working out exactly which ones. It's very exciting." } },
      choices = { { text = "Isn't that dangerous?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "Oh, very dangerous, of course, but exciting! Science is often both." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "My research partner, and a very patient one. He handles the field collection and I handle the analysis, though we argue about which part is harder." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Oh, yes, and some of them quite hard. I've lost two pairs of gloves and nearly a finger, and one of them burped afterwards, which I found very rude." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Oh, wonderful, someone who asks the right question! It's a mana-reactive compound, I'm almost certain, though Larion says I'm guessing. I'm not guessing, I'm hypothesizing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some at the Refuge think the plants should be left alone. I think understanding them is the highest form of respect." } },
      choices = { { text = "Understanding is a form of respect.", next = "BACK", reply = "I'm so glad you see it that way! You can't love a thing properly until you know what it eats.", fx = { affinity = 1, align = { light = 1 } } }, { text = "Leave the crater's plants in peace.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gadgetzan = { { id = "tp_gadgetzan", text = "The goblins in Gadgetzan want to buy my bloodpetals and grind them into potions, and I won't sell. They're friends, not ingredients." } },
    green_dragons = { { id = "tp_green_dragons", text = "I've heard the green dragons tend gardens in the Dream, great endless ones, and I'd give anything to see a single bed of them. I wonder what they'd make of my sprouts." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids say the Dream is the world as it was meant to be, all green and growing. Un'Goro is the closest I've ever been to it, I think, and I've been everywhere." } },
    explorers_league = { { id = "tp_explorers_league", text = "The Explorers' League go about digging up old bones, and I go about planting new things, and I think mine is the nicer job. Larion would disagree, but Larion disagrees with everything." } },
    _none = { { id = "tp_none", text = "I don't know, but it probably grows somewhere in the crater!" } },
  },
}

P:NPC {
  key = "ringo", id = TODO_NPC("Ringo"), name = "Ringo",
  bible = "bibles/ungoro.md", role = "questgiver", tier = "quest",
  impression = {
    first = "He wandered too far into the crater and could barely keep going.",
    third = "{name} met Ringo, a lost member of the Marshal Expedition in Un'Goro Crater.",
  },
  greetings = {
    { id = "g_main", text = "Oh, thank the Cartel, a person! I thought I'd never see another face, buddy, let alone one that might have a canteen." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, buddy! I wasn't sure you would, and I'd have bet against it, which shows what I know." },
  },
  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I don't know, buddy, I've just heard stories, and I'm too tired to be sensible about it. I've been lost for days and Spraggle must be frantic, so if you'll help me get home, I'll stop being frightened of your demon, I promise, or at least I'll try." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I don't know, buddy, I've just heard stories, and your demon is staring at me like the stories were true. I've been lost for days and Spraggle must be frantic, so if you'll help me get home, I'll stop being frightened of it, I promise, or at least I'll try not to look at it." },
      },
      choices = {
        { text = "Your soul is safe, Ringo. I'll help you home.", next = "BACK", reply = "You will? Oh, buddy, you're a lifesaver, a real lifesaver. I'll follow you anywhere, as long as it's away from here.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You should be frightened. It keeps you careful.", next = "BACK", reply = "Frightened? Buddy, I've been frightened for days, and I'm very careful now. Too careful to sleep.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not yet, but I think one of 'em was about to, and that worries me more than anything else. Please, buddy, a little water, and then help me back to Spraggle at the Refuge, because she must be worried sick, and I'm too tired to find the way." } },
      choices = {
        { text = "Here's water, Ringo. I'll see you safely home.", next = "BACK", reply = "Oh, bless you, buddy, bless you! Home, and water, and somebody who knows the way.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Drink up, and then find your own way back.", next = "BACK", reply = "My own way? Buddy, my own way got me lost! But thanks for the water, I suppose.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I wandered off to look at a crystal I thought might fetch a good price, and then a pterrordax looked at me, and I ran, and when I stopped running, nothing looked familiar. Spraggle must be worried sick, buddy, so if you can get me home, I'll owe you everything I've got, which isn't much, but it's yours." } },
      choices = {
        { text = "I'll get you home safe, Ringo. Stay close.", next = "BACK", reply = "Close, buddy, I'll stay so close you'll think I'm your shadow. Thank you, thank you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Next time, stay with the expedition. You'll get yourself killed.", next = "BACK", reply = "I know, I know, and I'll never wander off again, I promise. Well, I'll try very hard.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A raptor, then another raptor, then something so big the trees moved out of its way, and I didn't stop to price it. I've slept in hollow logs ever since, buddy, and I'd give anything for somebody to watch the dark while I close my eyes." } },
      choices = {
        { text = "I'll stand watch while you rest. Nobody gets left behind.", next = "BACK", reply = "You'd do that? Buddy, you're the best thing I've seen in days. I'll sleep, just for a moment.", fx = { align = { light = 1 } } },
        { text = "You wandered off alone. You'll have to keep up.", next = "BACK", reply = "Keep up? Buddy, my legs are jelly, but I'll try. Don't leave me behind, please.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Everything has seen me, I think, and most of it was hungry, but the gorillas were the worst because they kept throwin' things. I tried following a stegodon back to water once, and it turned round and looked at me like I owed it money, and believe me, I know that look." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Everything has seen me, buddy, and most of it was hungry. Is {pet} friendly? Please say yes, because I've been lonely enough out here to talk to the ferns." },
      },
      choices = {
        { text = "Stay close and follow my lead. That's how we get home.", next = "BACK", reply = "Your lead, buddy, all the way. I'm done following my own.", fx = { align = { order = 1 } } },
        { text = "Trust your own feet. Instinct will get you home.", next = "BACK", reply = "My feet got me here, buddy, and I don't trust 'em anymore. I'll follow you, if it's all the same.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I followed a pterrordax because I wanted to see where it nested, and nests have eggs, and eggs have buyers, which was foolish, and by the time I stopped running I couldn't see the Refuge at all. Spraggle will be frantic, buddy, and I'd much rather she didn't end up praying over me." } },
      choices = {
        { text = "Nobody's praying over you today. Lean on me, Ringo.", next = "BACK", reply = "Thank you, buddy, I'll lean, I'll lean. My legs are grateful, and so am I.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Foolishness has a price. Walk, and pay it.", next = "BACK", reply = "Pay it, sure, buddy, I'm paying it every step. Slow down a little, would you?", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The springs, buddy, plain and simple: I wanted to see the steam vents near the volcano up close, and then the ground got hotter and the paths kept changing. I'd swear the crater moved its trails about behind me, just to be unkind." } },
      choices = {
        { text = "The crater was warning you. You should have turned back.", next = "BACK", reply = "It was, buddy, and I should've listened. Next time, I'll run the other way.", fx = { align = { order = 1 } } },
        { text = "You followed your curiosity. That's no crime.", next = "BACK", reply = "Thanks, buddy, that's the nicest thing anyone's said to me since I got lost. Curiosity's got me in trouble, though.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! You haven't come to take my soul, have you, buddy, because I'm lost, and thirsty, and I don't think it's worth much just now, not even wholesale." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, oh, please tell me you can conjure water, buddy, because I've been wandering this crater for days and I'm so thirsty I've started talking to the ferns." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, oh, thank the Cartel, can you sneak me back to the Refuge without the raptors noticing, buddy? I've been hiding in these ferns for days and I'm so thirsty." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, oh, thank the Cartel, can you call up some water, even a little? I've been talking to the rocks myself for two days, buddy, and they haven't said a single helpful thing." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, oh, please say you've a little water, buddy, or at least a prayer for some, because I've been lost so long I've started talking to the ferns." },
        { id = "h_default", key = true, text = "Ringo, of the Marshal Expedition, or I was until I got lost, buddy. I've been wandering for days, and I'm so tired and thirsty I can barely stand, and I didn't even find the crystal." },
        { id = "h_c0", when = { questActive = TODO_QUEST("A Little Help From My Friends") }, text = "You'll take me back to the Refuge? Please, buddy, and if I faint, use the water from the spring, it brings me round." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, oh, thank goodness. If anything comes out of those ferns, buddy, could you please stand in front of it, because I don't think I can run another step." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter? Then you must know how to get out of here, buddy, because I've been following my own footprints in circles for days." },
      },
      again = { { id = "h_again", text = "What else, buddy? I'm listening, barely, and I'm not charging for it." }, { id = "h_again2", text = "Go on, I'm just resting my eyes." } },
      choices = {
        { text = "What drove you so far into the crater, Ringo?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You look like you've been lost a while.", next = "b1_1" },
        { text = "Does anyone know you're missing?", next = "b2_1" },
        { text = "Are you hurt?", next = "b3_1" },
        { text = "Let me tend to you before we go.", next = "x_1", when = { class = { "PRIEST", "PALADIN", "DRUID" } } },
        { text = "Going out alone was probably a mistake.", next = "s_1" },
        { text = "How'd you end up so far from the Refuge?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What chased you all the way out here?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "You must have seen some beasts out here while you were lost.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "How did you get so lost, Ringo?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Have the ferns answered you yet?", next = "xmage", when = { class = "MAGE" } },
        { text = "Why would I want your soul, of all things?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "I was looking for crystals out past the ridge, buddy, the kind that sell, and I followed a trail I shouldn't have. By the time I turned back, everything looked the same." } },
      choices = { { text = "How have you survived out here?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "I've been hiding from the raptors and drinkin' from puddles, buddy, and one puddle had a frog in it that I'm fairly sure I swallowed. Spraggle must be frantic." } },
      choices = { { text = "I'll get you home, Ringo.", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you get me home, buddy, I'll owe you everything, and Spraggle will too, and she keeps better books than I do." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Spraggle Frock, my friend at the Refuge, and the worrier of the expedition, buddy. If anybody's been looking for me, it's Spraggle." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Not badly, buddy, just exhausted and very, very thirsty. The crater's heat takes everything out of you." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Oh, that feels better already. Thank you, buddy, I didn't think I'd last another night, and I'll remember this." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Williden told us to always go in pairs, buddy. I didn't listen, and look where it got me." } },
      choices = { { text = "Williden made that rule for a reason, Ringo.", next = "BACK", reply = "They do, buddy, they really do, and I'll follow every one from now on. Pairs, always pairs.", fx = { affinity = 1, align = { order = 1 } } }, { text = "Sometimes you have to take your own path.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got water, cold water, buddy, and I'd sell my mother's ledger for a single glass right now. I'm kidding, I'd sell it for half a glass." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel will hear about this, the whole expedition, the lack of maps, the lack of water, the dinosaurs! I'm filing a complaint as soon as I can hold a pen." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got sea breezes and shade and no dinosaurs, which I appreciate more now than I ever did when I lived there." } },
    _none = { { id = "tp_none", text = "I don't know, buddy, I'm too tired to think about it." } },
  },
}

P:NPC {
  key = "krakle", id = TODO_NPC("Krakle"), name = "Krakle",
  bible = "bibles/ungoro.md", role = "citizen", tier = "service",
  impression = {
    first = "The only hot springs that interest him are the profitable kind.",
    third = "{name} met Krakle, a goblin near the hot springs of Un'Goro Crater.",
  },
  greetings = {
    { id = "g_main", text = "Hey, careful there, friend! The water's hotter than it looks, and I can't afford the lawsuit." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, friend! Got any readings for me? Readings are money, and money's the only thing hotter than this water." },
  },
  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Not yet, and I'd like to keep it that way, since the springs are my retirement plan! The crater's dangerous enough without a demon scaring off the paying guests, so if you need to call something up, do it over by the tar pits, where nobody's paying attention." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Not yet, and I'd like to keep it that way, since the springs are my retirement plan, and you've just walked a demon right up to the steam! The crater's dangerous enough without scaring off the paying guests, so take it over by the tar pits, where nobody's paying attention." },
      },
      choices = {
        { text = "I'll keep my demon out of your springs, Krakle.", next = "BACK", reply = "You're a gem, pal, a real gem. My retirement plan thanks you, and so do my knees.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A demon would draw a crowd, you know. Think about it.", next = "BACK", reply = "A crowd? Friend, a demon by the springs would scare off every customer I've got. Thanks for the thought, though.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Why not? The springs here are warm, the crater's full of crystals, and people will pay for anything that sounds healing! I'd give you a percentage, of course, a small one, and if it turns out the blessing doesn't stick, well, we'll call it a promotional offer." } },
      choices = {
        { text = "The Light isn't for sale, Krakle. Find another scheme.", next = "BACK", reply = "Not for sale? Friend, everything's for sale, it's just a question of price. But fine, fine, I'll keep the Light out of it.", fx = { align = { honor = 1 } } },
        { text = "A small percentage? Make it a large one, and I'll think on it.", next = "BACK", reply = "Large? Now you're talkin', friend! We'll call it a partnership, and I'll draw up the papers.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Help? They practically sell themselves, because a soak in Golakka water takes the ache right out of a shield arm! At least I think it does, since I haven't found anybody brave enough to sit in long enough for me to measure." } },
      choices = {
        { text = "A soldier who tends his wounds fights another day.", next = "BACK", reply = "Exactly, friend, and my springs are the best place to tend 'em. A soak a day keeps the healer away.", fx = { align = { order = 1 } } },
        { text = "Pain keeps me sharp. I'll heal when it's all over.", next = "BACK", reply = "Sharp, sure, friend, and very sore. Come soak when it's over, and I'll give you the first dip at a discount. Kidding, the price is the price.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because the water can boil a raptor's foot clean off, which is a selling point I'm still working on. The big beasts won't come near it, but the little lizards love lying on the warm rocks, and I've started charging them rent in my head." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because the water can boil a raptor's foot clean off. {pet} looks like it'd enjoy a warm soak, so keep it well back from the hot ones, because I don't have the paperwork to explain a boiled companion." },
      },
      choices = {
        { text = "The springs belong to the crater. They aren't yours to sell.", next = "BACK", reply = "Not mine? Chum, I found 'em first, and the crater doesn't have a lawyer. I'll keep sellin', thanks.", fx = { align = { honor = 1 } } },
        { text = "Anything that warm should turn a profit. Sell it.", next = "BACK", reply = "That's what I keep sayin', friend! Warm water, hot profits, and a raptor foot or two as a warning.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Everybody, friend, once they hear it's warm, healing and blessed by a genuine priest, which is where you come in. The Golakka springs have the minerals already, so all they need is a little Light, or a little loa, depending on the customer." } },
      choices = {
        { text = "No. I won't sell blessings to line a goblin's pockets.", next = "BACK", reply = "Suit yourself, friend, but the springs will get blessed one way or another. Maybe I'll find a less principled priest.", fx = { align = { light = 1 } } },
        { text = "Fine, but I take half, and my blessing costs extra.", next = "BACK", reply = "Half? Friend, that's robbery, but I respect it. Let's talk, and I'll bring the contracts.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Everything gets sold eventually, pal, and better me than some Venture Company crew with a drill. I just want the water, and they'd want the whole crater." } },
      choices = {
        { text = "Leave the springs alone. Some things aren't for sale.", next = "BACK", reply = "Alone? Friend, if I leave 'em alone, the Venture Company won't. Better me than a drill.", fx = { align = { light = 1 } } },
        { text = "Better you than the Venture Company. Sell away.", next = "BACK", reply = "Now you're thinkin' straight, friend! Better me than the Venture boys, and I'll even plant a few flowers.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The volcano, mostly, or whatever's under it, pushing heat up through the rock until the water can't sit still. There's minerals in it too, fizzy ones, and I swear a dip in there takes ten years off you, or at least ten layers of skin." } },
      choices = {
        { text = "Those springs are sacred water. Don't sell them.", next = "BACK", reply = "Sacred? Friend, it's hot water with minerals in it. But if you want, I'll call it sacred on the label.", fx = { align = { honor = 1 } } },
        { text = "Hot water, good health, fair price. Bottle it, Krakle.", next = "BACK", reply = "My kind of shaman! I'll put your face on the label, small, down in the corner, no royalties.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not the spring, the idea! If the Venture Company hears there's bottled mineral water to be had in Un'Goro, they'll be down here with pumps before I've finished drawing the label, and you look like you'd know how they think." } },
      choices = {
        { text = "A good idea belongs to whoever gets there first.", next = "BACK", reply = "That's the goblin way, friend! First come, first served, and I'm already here.", fx = { align = { order = -1 } } },
        { text = "Stake your claim properly with the Cartel, then.", next = "BACK", reply = "Properly? Friend, the Cartel takes forty percent of everything. But fine, maybe I'll think about it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Never mind the water.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not boil, temper! The minerals do something to aches and pains, and if a mage could cool it to drinking heat, I could sell it in Gadgetzan by the barrel. I'm not saying the Kirin Tor would approve, but the Kirin Tor aren't paying my bills." } },
      choices = {
        { text = "Magic isn't for peddling bathwater.", next = "BACK", reply = "Bathwater? Friend, it's premium mineral water, and it's worth every copper. But suit yourself.", fx = { align = { order = 1 } } },
        { text = "A spell's worth whatever someone will pay for it.", next = "BACK", reply = "Now we're talkin'! Name your price, sweetheart, and I'll name a lower one, and we'll meet somewhere in the steam.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Krakle.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Sell's an ugly word, friend, when I'd be offering a premium bathing experience with spiritual benefits. The springs really do ease a sore back, so if your Light wants to take a bit of the credit, I'm happy to share it, for a percentage." } },
      choices = {
        { text = "Blessings aren't for sale. Find another way to get rich.", next = "BACK", reply = "Not for sale? Friend, I'm not selling blessings, I'm selling bathing experiences. The blessing's just a bonus.", fx = { align = { honor = 1 } } },
        { text = "If folk feel better, a little exaggeration does no harm.", next = "BACK", reply = "Exactly, friend, exactly! A little exaggeration makes everybody feel better, including me.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! Don't summon anything in the springs, please, because I've got customers coming and nobody wants to bathe with an imp." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, perfect! Tell me, would a hot spring blessed by a paladin sell better than an ordinary one, because I'm thinking holy bathwater could be the next big thing." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, perfect! You talk to water spirits, right? Ask the ones in Golakka what they'd want for exclusive bottling rights, because I'm prepared to negotiate." },
        { id = "h_default", key = true, text = "Krakle's the name, and the hot springs are my game! These springs are boilin' with heat and minerals, friend, and somebody's going to figure out how to sell 'em, and that somebody is me." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "Ooh, a druid! Your folks love a good hot spring, right, all that steam and nature? I could use an endorsement once I figure out how to bottle these, and I pay endorsements in exposure." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You've got the look of somebody who finds things before anybody else does, friend. I've got a hot spring here that's worth a fortune, and I'd hate for it to wander off while I'm not lookin'." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Tell me, can you make water hot or cold on command, because if you can, pal, I've got a business proposition that'll make the springs look like small change." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, perfect! Tell me, would a blessed hot spring sell better than an ordinary one, because I'm thinking holy bathwater could be the next big thing." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Say, would you bless my springs? Holy hot springs, blessed by the Light, would sell like water in Tanaris, which is to say very well." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You know what soothes aching muscles after a day of swingin' at dinosaurs? Hot springs, friend, and I'm standing right on top of the best ones in the crater, with a very reasonable soak fee." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Just the customer I need, pal, because the springs keep scaring off the beasts, and I'd love to know if it's the heat or the smell before I print the brochure." },
      },
      again = { { id = "h_again", text = "What else, friend? Ask quick, because every minute I stand here talkin' is a minute I'm not selling." }, { id = "h_again2", text = "Talk quick, pal, because the springs won't wait and neither will my investors." } },
      choices = {
        { text = "What makes the Golakka springs boil, anyway?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You really mean to sell a hot spring?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's special about the springs?", next = "b1_1" },
        { text = "This place doesn't look very safe.", next = "b2_1" },
        { text = "Should these springs be sold?", next = "s_1" },
        { text = "Worried someone will steal a whole hot spring?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You want me to boil your springs for coin?", next = "xmage", when = { class = "MAGE" } },
        { text = "You seem ready to sell blessings, Krakle.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who on earth buys holy bathwater?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Hot water won't fix a warrior's wounds.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why do the beasts keep clear of the springs?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "You'd really sell holy bathwater?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Had any trouble with demons round the springs?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "They're hot, they're full of strange minerals, and some of 'em glow, which is a selling point. Somethin's heating them from deep underground, friend, and I'd love to know what, and whether it's for sale." } },
      choices = { { text = "What do you think is heating them?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Maybe it's the Fire Plume, or maybe it's something bigger, pal. Either way, heat like that is worth money, and nobody's put up a fence yet." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Safe enough, if you don't fall in, and if you do, it's not my liability. The bigger danger is the beasts that come to drink, friend, so keep your eyes open." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some at the Refuge say the crater shouldn't be bought and sold, pal. I say everything's for sale, if the price is right and the paperwork's quick." } },
      choices = { { text = "Nature shouldn't be for sale.", next = "BACK", reply = "Shouldn't? Friend, the crater's for sale whether you like it or not, and I'd rather it was me selling. At least I'm honest about it.", fx = { affinity = 1, align = { light = 1 } } }, { text = "Profit's how anything gets done out here.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan'll buy anything that comes out of these springs, pal, minerals, water, crystals, even the steam if I could bottle it. I'm working on the steam." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel takes its cut off the top, and I take my cut off what's left, and the springs take my eyebrows off whenever I'm careless. It all balances out." } },
    booty_bay = { { id = "tp_booty_bay", text = "In Booty Bay they'd pay a fortune for a hot bath, buddy, and here I've got a whole crater full of 'em. Shipping's the problem, I'm still workin' on the shipping." } },
    venture_company = { { id = "tp_venture_company", text = "The Venture Company tried to set up shop in here once and got trampled by a devilsaur, from what I hear. Can't say I'm sorry, more springs for me." } },
    _none = { { id = "tp_none", text = "No idea, friend, but if it's wet and warm, I bet I can bottle it." } },
  },
}
