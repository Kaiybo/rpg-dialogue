-- Winterspring between Everlook and the hold (0.38.0): the saber trainers, the Timbermaw at the tunnel, an Altar priestess, a blue dragon, a repentant satyr, and Everlook's cook. Voice: bibles/winterspring.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "rivern", id = TODO_NPC("Rivern Frostwind"), name = "Rivern Frostwind", title = "Wintersaber Trainers",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "frostsaber_rock" }, temper = { "reserved" }, values = { "patient", "proud" },
  impression = {
    first = "Rivern Frostwind raises the white frostsabers of Winterspring, the finest mounts the Kaldorei know. She expects a rider to earn one with seasons of work, and she means seasons.",
    third = "{name} met Rivern Frostwind of the Wintersaber Trainers in Winterspring.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah. Keep your voice low near the cubs, {class}, for they remember a loud stranger for a long time, as all of Elune's sabers do." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and the cubs didn't hiss at you this time. That's a start." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "A frostsaber accepts no one easily, and I judge riders by years of work. If the spirits of the snow favour you, that is a start, but only a start." } },
      choices = {
        { text = "I'll earn it with years of work, then.", next = "BACK", reply = "Then come back each season, and the sabers will learn your scent long before they learn your name. That is how every rider here began.", fx = { align = { order = 1 } } },
        { text = "The spirits' favour should count for more than years.", next = "BACK", reply = "The spirits may favour you, shaman, but the sabers keep their own counsel. They have never once asked my opinion of who deserves them, nor anyone else's.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The sabers have long memories, and their mothers remember Felwood and what crawled out of it. I won't turn you away, since the Wintersaber Trainers need every hand against the Winterfall, but I'll ask you to work on the far side of the rock, and I won't ask twice." } },
      choices = {
        { text = "I'll keep my demon away. The cubs come first.", next = "BACK", reply = "That is kindly said, and the mothers will notice it before I do. Keep it far from the dens, and you'll find us grateful.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear is no reason to be shunned. My demon stays with me.", next = "BACK", reply = "I did not say shunned, I said wary, and the sabers decide their own wariness. Bring it close to the cubs and you'll learn the difference quickly.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The same way anyone does: by staying through the hard seasons and helping when the Winterfall raid the pens. The sabers don't care what you pray to, only whether you came back after the first winter, and very few do." } },
      choices = {
        { text = "I'll stay the seasons. Patient work is worth doing.", next = "BACK", reply = "Then you'll be welcome here, and the sabers will know your step before the snow melts. Ishnu-alah, friend.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I've no time for seasons. Give me the hard tasks now.", next = "BACK", reply = "The hard tasks come with the seasons, not before them. A saber that is rushed is a saber that bolts.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A warrior who earns one could, though the saber decides how much it carries and how far it will charge. They are not warhorses, and a rider who drives a frostsaber into a fight it doesn't want will be thrown into the snow." } },
      choices = {
        { text = "Then I'll earn the saber's trust before I ask it to fight.", next = "BACK", reply = "That is the right order of things, and the sabers will sense it. Trust first, then the charge, and never the other way.", fx = { align = { order = 1 } } },
        { text = "A mount is a mount. It'll charge when I tell it to.", next = "BACK", reply = "Then you'll find yourself thrown into a snowbank with the Winterfall laughing at you. A frostsaber is not a mount, warrior; it is a partner.", fx = { align = { order = -1 } } },
        { text = "Something else, Rivern.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some do, and some never will, for a frostsaber is jealous of its territory and has no patience for a rival. The cubs are curious, though, and they've learned more from the hunters' cats than from anything I could teach them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has kept still since you came in, and the old sabers have noticed it. That's a good sign, and a rare one." },
      },
      choices = {
        { text = "A good beast obeys. I train mine as carefully as you train yours.", next = "BACK", reply = "Careful training is a kind of respect, and I won't fault it. But a frostsaber will test that obedience the first day you bring it near.", fx = { align = { order = 1 } } },
        { text = "My beast follows me by choice. I've never trained it to obey.", next = "BACK", reply = "Then your beast and our sabers may understand each other, in time. Choice is the only bond a frostsaber honours.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "We don't keep them, druid, we earn them, and the bond goes both ways or not at all. The Winterfall would kill them for their pelts, so I'd rather they stand beside us than lie in a furbolg's hut." } },
      choices = {
        { text = "Then the bond is honest. Keep earning it.", next = "BACK", reply = "I will, and so will the sabers, for as long as there are trainers on Frostsaber Rock. Elune keep the bond honest.", fx = { align = { order = 1 } } },
        { text = "A saber should run free in the snow.", next = "BACK", reply = "Many do, druid, and the Winterfall hunt those ones for their pelts. I'd rather keep a few close and safe than lose them all to freedom.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They do already, and better than any rogue I have known, since they have lived by stealth in these mountains since before the Sundering. A rider earns their trust over seasons, though, not by slinking about the pens, so walk openly if you want them to know you." } },
      choices = {
        { text = "I'll walk openly, then. Trust should be earned.", next = "BACK", reply = "Then you've understood the first lesson already, and the sabers will notice. They respect what does not hide from them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Stealth suits me better than patience.", next = "BACK", reply = "Then you'll find the sabers watching you from the snow long before you see them. They've been better at it than you for ten thousand years.", fx = { align = { honor = -1 } } },
        { text = "I'll keep my distance from the pens.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They were here before the Highborne, and they remember the Sundering in the way beasts remember things, as a fear without a name. The Kaldorei put aside the arcane after that, and I prefer to honour the cats by doing the same around them." } },
      choices = {
        { text = "Then I'll honour their wishes too.", next = "BACK", reply = "Then you'll find the sabers calmer than you expected. They know who honours the old fears.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fear won't stop me using my gift.", next = "BACK", reply = "Then keep your gift far from the dens, mage, or the mothers will teach you what fear means. The Sundering taught us all something.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll keep my spells away.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Patience, seasons of it, culling the Winterfall and the Frostmaul giants and hunting meat for the cubs until the sabers know your scent. Some riders tire of it and leave, and I let them go, because a saber that is rushed will throw you into the first snowdrift it finds." } },
      choices = {
        { text = "Earned slowly is earned honestly. I'll do the work.", next = "BACK", reply = "Then you'll earn more than a saber, and I'll be glad to call you rider. Patience is the first gift Elune gave us.", fx = { align = { honor = 1 } } },
        { text = "There must be a quicker way to win a saber over.", next = "BACK", reply = "There is not, and those who look for one leave without a saber. The rock has seen a hundred shortcuts, and none of them led anywhere.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, here, among the sabers. Keep whatever you've bound far from the pens, because the cubs will not eat for days if they catch its scent, and I've no cubs to spare." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, at Frostsaber Rock. The sabers grow restless when the Winterfall come close, and a calm voice at night does them more good than you would think, so you're welcome by the pens." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior of the Alliance. The Sentinels who train beside me fight much as you do, with blade and shield, though they've learned to fight from the saddle as well." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter of the Alliance. The sabers watch your beast before they watch you, and they'll judge you both by how well it obeys." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. A wintersaber can hear a rogue's step from the far side of the valley, so do not think to sneak up on mine, because they will think you are prey." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. My frostsabers are calm, but they have no love for the arcane, so cast nothing near the pens, please." },
        { id = "h_default", text = "I am Rivern Frostwind, and the Wintersaber Trainers raise the frostsabers of this valley, as our people have raised sabers since before Darnassus was a dream. The Winterfall furbolgs and the cold give us trouble enough, and we don't hand a saber to anyone who hasn't helped us with both." },
        { id = "h_cond", when = { race = "NightElf" }, text = "A child of Elune, so you'll know what a wintersaber means to our people. They are not horses, and we do not sell them as horses." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid of the Circle, here in the frostsaber valley. The cubs know your kind by scent, I think, and they come to you more readily than to the Sentinels who train beside me." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, clad in steel, at the saber pens. My cats think you are a very strange sort of bear, so walk slowly until they know your scent." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. The frostsabers are restless, which means they've caught your scent and can't decide what you are, and in all my centuries they've rarely been wrong." },
      },
      again = {
        { id = "h_again1", text = "What else? The cubs need feeding, and they are as patient as any kaldorei, which is to say not when they're hungry." },
        { id = "h_again2", text = "Ask, then, and quietly." },
      },
      choices = {
        { text = "Is it right to keep the wintersabers, Rivern?", next = "druid_q", when = { class = "DRUID" } },
        { text = "A wintersaber must be hard to earn.", next = "sabers" },
        { text = "What trouble do the Winterfall make?", next = "winterfall" },
        { text = "I don't know how you bear the cold.", next = "cold" },
        { text = "My family rode sabers in the old days.", next = "elf", when = { race = "NightElf" } },
        { text = "Could a wintersaber be trained to hunt quietly?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why do the frostsabers distrust the arcane?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What does it take to earn a frostsaber's trust?", next = "xapala", when = { class = "PALADIN" } },
        { text = "A warrior could learn a lot from a frostsaber, Rivern.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your frostsabers accept a hunter's beast?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "How does a priest earn a place at Frostsaber Rock?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is a demon's scent really so dangerous to the cubs, Rivern?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Would a frostsaber accept a dwarf shaman, Rivern?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to your cats.", next = "END" },
      },
    },
    sabers = {
      lines = {
        { id = "sabers_default", text = "It is, and it is earned by feeding the cubs, by driving the Winterfall back from our grounds, and by coming back day after day until we know your face. Many riders give up long before the trainers are satisfied." },
      },
      choices = {
        { text = "That sounds like a very long road.", next = "sabers2" },
      },
    },
    sabers2 = {
      lines = {
        { id = "sabers2_default", text = "It is meant to be, because a saber that is earned is a saber that's honoured. Some think the trainers are too proud and ought to share with every Sentinel, and some think we give them away too easily as it is." },
      },
      choices = {
        { text = "You're right to be strict. Earned is honoured.", next = "BACK", reply = "Thank you, and I'll carry that to the other trainers, who doubt themselves more than they say. A gift given to everyone is honoured by no one.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Every Sentinel deserves a good mount, earned or not.", next = "BACK", reply = "Every Sentinel deserves a fine mount, I'll grant you, and the sabers grant nothing. If the trainers gave them away, they would stop being ours to give.", fx = { align = { order = -1 }, trait = { generous = 1 } } },
      },
    },
    winterfall = {
      lines = {
        { id = "winterfall_default", text = "They've gone wild like their cousins to the south, drinking some foul brew, and they raid our grounds for meat. The Timbermaw say the corruption came from Felwood, and I've no reason to doubt them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    cold = {
      lines = {
        { id = "cold_default", text = "The same way the sabers do, by not complaining about it. You learn to love the snow here or you go home to Darnassus, and I've never wanted to go home." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    elf = {
      lines = {
        { id = "elf_default", text = "Then they'd tell you the same thing I do: be patient, and the cat will choose you. Come back tomorrow, and the day after, and we'll see." },
      },
      choices = {
        { text = "I will.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I raise frostsabers, and I have done for longer than most humans live." } },
    elune = { { id = "tp_elune", text = "Elune blesses the frostsabers of Winterspring, and they're the finest mounts the Kaldorei know. A rider who earns one earns her blessing too." } },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess rides a frostsaber of her own, and every rider in Kalimdor wants one like it. I tell them it takes seasons of work, and I mean seasons." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels ride the cats of Ashenvale and Darnassus, but the best of them ride mine. I'm proud of every one of them." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw leave my cats alone, and I leave their tunnels alone. It's a fair arrangement, and it's lasted many years." } },
    _none = { { id = "tp_none", text = "I don't know. The cubs might, but they're not telling, and frostsabers keep their secrets well." } },
  },
}

P:NPC {
  key = "salfa", id = TODO_NPC("Salfa"), name = "Salfa", title = "",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_winterspring" }, temper = { "steady" }, values = { "loyal", "protective" },
  impression = {
    first = "Salfa guards the Winterspring end of Timbermaw Hold's tunnels. Like the rest of his tribe he is wary of outsiders, and he's fair about it.",
    third = "{name} met Salfa, the Timbermaw furbolg who guards the Winterspring mouth of Timbermaw Hold.",
  },

  greetings = {
    { id = "g_default", text = "You come out of the tunnel alive, so the Timbermaw have let you pass. Salfa will not argue with that." },
    { id = "g_back", when = { metBefore = true }, text = "Salfa sees you again. The snow has not frozen you yet, which is good." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "A little. They were Timbermaw kin once, and now something else wears their faces, though they are not dead, only lost. You are dead and not lost, which Salfa thinks is better, though he would not want either for himself." } },
      choices = {
        { text = "The lost can be brought back. I'm proof of it.", next = "BACK", reply = "Salfa is glad to hear it, and gladder to see it walking and talking. If you came back, maybe the Winterfall can too.", fx = { align = { light = 1 } } },
        { text = "The Winterfall chose their madness. Stop them.", next = "BACK", reply = "Salfa knows they must be stopped, yes, but chose is a hard word. Salfa does not think they chose, only drank.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Something that does not belong in the snow, sweet and rotten at once, like the ground in Felwood. Salfa does not know magic well, but he knows that the Winterfall were never cruel until somebody began bringing them barrels, and those barrels came from the south." } },
      choices = {
        { text = "I'll trace those barrels back to whoever sent them.", next = "BACK", reply = "Good, and Salfa will be grateful, and the elders will hear of it. Find the hand that pours the barrel.", fx = { align = { order = 1 } } },
        { text = "Whoever sent them, the Winterfall chose to drink.", next = "BACK", reply = "They drank, yes, but they did not know what they drank. Salfa would not blame a cub for eating bad berries.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Salfa would have you remember they were our kin, before the firewater. The Timbermaw cannot save all of them, and some must fall so the rest do not tear the valley apart, but Salfa asks that you strike them as you would a sick friend, and not as you would an enemy." } },
      choices = {
        { text = "I'll fight them with sorrow, not hatred. You have my word.", next = "BACK", reply = "Salfa thanks you, and Salfa will tell the elders what you said. Sorrow is the right thing to carry into a Winterfall camp.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A maddened furbolg is a threat. I'll treat it as one.", next = "BACK", reply = "It is a threat, Salfa knows, and Salfa does not ask you to let it hurt you. Only remember, when it falls, that it was someone's brother.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Timbermaw welcome deeds, not words, and a warrior's deeds are easy to count. Bring Salfa the beads the Winterfall wear, and every bead will tell the elders that you have stood against the madness for us." } },
      choices = {
        { text = "I'll fight the Winterfall and earn the Timbermaw's trust honestly.", next = "BACK", reply = "Salfa will count every bead and every deed, and the elders will hear. Honest work makes the Timbermaw remember you kindly.", fx = { align = { honor = 1 } } },
        { text = "I'll take the beads however I can. Deeds are deeds.", next = "BACK", reply = "Deeds are deeds, yes, but how you do them matters to Salfa and to the elders. Do not make Salfa sorry he asked.", fx = { align = { honor = -1 } } },
        { text = "Something else, Salfa.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "To Winterfall Village in the east, and to their camps on the ridges, and always back to wherever the firewater is kept. Salfa has followed them himself, and the tracks of a furbolg who drinks it wander like a sick wolf's." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} smells the tunnels behind Salfa and is not afraid, which is good. Many beasts will not come near the Timbermaw's door." },
      },
      choices = {
        { text = "The Winterfall were your kin. I'll hunt them only as needed.", next = "BACK", reply = "Salfa is grateful, and the spirits are too, Salfa thinks. Only as needed is the right measure for kin.", fx = { align = { light = 1 } } },
        { text = "Mad beasts get put down. I'll hunt every one I find.", next = "BACK", reply = "Salfa understands, and Salfa cannot stop you, but Salfa will grieve each one you bring down. Some of them were Salfa's friends.", fx = { align = { light = -1 } } },
        { text = "Something else, Salfa.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The young ones, perhaps, if the firewater is taken from them before it takes them. The old shamans who pour it are lost, Salfa thinks, and a druid who tries to save them will only be bitten." } },
      choices = {
        { text = "I'll try to cleanse even the shamans.", next = "BACK", reply = "Then the spirits go with you, druid, and Salfa hopes you find a door Salfa could not. Be careful, because the shamans fight hardest of all.", fx = { align = { light = 1 } } },
        { text = "The shamans chose this. They must die.", next = "BACK", reply = "Salfa thinks so too, though it hurts to say it. Do it quickly, and do not let them drink while they die.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Something poisons them, the way the Deadwood were poisoned in Felwood, and Salfa does not know if it is the firewater or something worse. If you are a friend of the Timbermaw, prove it on the Winterfall, and Salfa will judge you by your deeds and not by your stink." } },
      choices = {
        { text = "Judge me by my deeds. I'll prove myself.", next = "BACK", reply = "Salfa will watch, and Salfa will remember what you do. The Timbermaw judge slowly, but fairly.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I don't need furbolg approval.", next = "BACK", reply = "Then Salfa will not give it, and the tunnels will stay closed to you. The Timbermaw do not beg for friends.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll think about it.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Winterfall hide their totems deep in their camps, and a quiet walker might reach them before the shamans raise the alarm. Do this, and Salfa will tell the elders you are a friend, but steal from the Timbermaw, and every furbolg on this mountain will know your face." } },
      choices = {
        { text = "I'll help the Timbermaw and keep faith with them.", next = "BACK", reply = "Good, and Salfa will tell the elders your name before the moon turns. Keeping faith is the Timbermaw way.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll help if there's something in it for me.", next = "BACK", reply = "Salfa hears you, and the elders will remember that you asked. A friend who must be paid is only half a friend.", fx = { align = { honor = -1 } } },
        { text = "I'll keep that in mind.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Firewater, and whatever poison is brewed into it, and the Winterfall drink it gladly because it makes them strong. Salfa remembers when they sang at the springs in the thaw, and now they only howl, and Salfa does not know which hurts more to hear." } },
      choices = {
        { text = "Then pray they remember the songs. I'll pray with you.", next = "BACK", reply = "Salfa would like that, very much, and Salfa will sing them softly so they might hear. Perhaps the spirits will carry the song.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Memories won't stop claws. The mad ones must be put down.", next = "BACK", reply = "They must, Salfa knows, but Salfa will remember the songs anyway. Someone has to, when the claws are done.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Salfa's people need the Winterfall stopped before their madness reaches the tunnels, and they need outsiders who keep their word. A priest who heals Timbermaw and Horde alike would be remembered by the elders, but one who breaks faith would be remembered longer." } },
      choices = {
        { text = "I keep my word. The elders can count on that.", next = "BACK", reply = "Then the elders will count on it, and Salfa will tell them. Your word is a good gift to bring to Timbermaw Hold.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep my word while it suits me, Salfa.", next = "BACK", reply = "Salfa hears the honesty in that, at least, and will tell the elders the same. A word kept only while it suits is not a word the Timbermaw trust.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Winterfall", min = 40 } },
          text = "Salfa hears the Winterfall howl less at night, and he knows whose work that is. He thanks you, and he grieves, and both are true." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Salfa smells the arcane on you, and it is cleaner than what he smells on the Winterfall, though not by so much as you might like." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" },
          text = "A paladin. Salfa sees the light on you, and he has heard that your kind fight the dead in the east, so he wonders what you think of the Winterfall, who are not dead, only lost." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Salfa sees the calluses on your hands, outsider, and he would rather you used them on the Winterfall than on the Timbermaw." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Salfa watches you read the snow, outsider, and he thinks you see the Winterfall tracks as clearly as he does." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Salfa smells the demon on you, outsider. The Winterfall stink of something like it now, and Salfa is slow to trust anyone who carries that stink near our door." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You walk quietly, outsider, and Salfa does not like a quiet walker near his tunnels. Speak plainly, and Salfa will listen." },
        { id = "h_default", text = "I am Salfa, and I watch this end of the tunnel for the Timbermaw. The Winterfall furbolgs of this valley have gone the way of the Deadwood, and Salfa would see them stopped before the madness spreads further north." },
        { id = "h_cond", when = { class = "SHAMAN" }, text = "A shaman. The spirits here are cold and angry, and Salfa thinks you can feel it too." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "Salfa sees a druid, and Salfa is glad. The Cenarion Circle and the Timbermaw once spoke often, and Salfa thinks they should speak again now that the Winterfall have fallen." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "You carry a healer's calm, outsider, the kind Salfa knows from our own shamans. The Winterfall have no healers left, only madness, and Salfa would see that end." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, come through the tunnels. Salfa has seen your kind tend the wounded, and he hopes you are the sort who does not ask whose wounds they are." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, and one of the dead. Salfa has heard your kind fight the dead in the east, and here you are, dead and fighting, so Salfa does not know which side of the tunnel you belong on." },
      },
      again = {
        { id = "h_again1", text = "Speak. Salfa is listening." },
        { id = "h_again2", text = "What else?" },
      },
      choices = {
        { text = "Can the Winterfall be cleansed, Salfa?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Something has gone wrong with the Winterfall.", next = "winterfall" },
        { text = "Where does the tunnel lead?", next = "tunnel" },
        { text = "The Timbermaw must trade with Everlook now and then.", next = "everlook" },
        { text = "I feel the spirits' anger here.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Do you think the Winterfall are tainted by demons?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is there anything a quiet walker could do for the Timbermaw?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What drove the Winterfall to madness, Salfa?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do the Timbermaw need from a priest, Salfa?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Would the Timbermaw welcome a warrior's help, Salfa?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "The Winterfall tracks must lead somewhere, Salfa.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What would you have a paladin do for the Winterfall, Salfa?", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "You can smell something on the Winterfall, Salfa.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the Winterfall remind you of the Forsaken, Salfa?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Stay warm, Salfa.", next = "END" },
      },
    },
    winterfall = {
      lines = {
        { id = "winterfall_default", text = "Firewater, Salfa thinks, a brew that came into the valley from the south, and the satyrs' whispers in it. They drink it and lose themselves, and the more they drink the less of them remains." },
      },
      choices = {
        { text = "Can anyone stop it?", next = "winterfall2" },
      },
    },
    winterfall2 = {
      lines = {
        { id = "winterfall2_default", text = "Find where the brew comes from and break it, and kill the shamans who pour it. Some Timbermaw want to save the young ones who have not drunk deeply yet, and some say the whole tribe is lost." },
      },
      choices = {
        { text = "Save the young ones. They had no choice.", next = "BACK", reply = "Salfa thinks so too, and the young ones will thank you when they wake. Bring them home, and Salfa will look after them.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Lost is lost. Don't risk more lives on them.", next = "BACK", reply = "Salfa understands, and some elders say the same. But Salfa will still try, when no one is looking.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    tunnel = {
      lines = {
        { id = "tunnel_default", text = "Under the mountains to Felwood, through the heart of our hold. Only friends of the Timbermaw walk it safely, so be thankful you walked it at all." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    everlook = {
      lines = {
        { id = "everlook_default", text = "A little, for the goblins will trade with anyone and the Timbermaw need iron. Salfa does not like their noise, but their coin is honest enough." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    shaman = {
      lines = {
        { id = "shaman_default", text = "Then listen to them, and do not let them make you angry too. That is how the Winterfall began, Salfa thinks, by listening to the wrong voices." },
      },
      choices = {
        { text = "Wise words. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Salfa is Timbermaw, and Salfa keeps the cold door." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are the last furbolgs who remember the old ways. We guard our tunnels, and we're fair to those who earn it." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids taught our people of the Dream, long ago. Now the Winterfall forget the old teachings, and it grieves us." } },
    satyrs = { { id = "tp_satyrs", text = "The satyrs of the south are a sickness on the land, and the Timbermaw fight them wherever we find them. Your kind should do the same." } },
    nordrassil = { { id = "tp_nordrassil", text = "The World Tree stands on Hyjal, and the Timbermaw have guarded its slopes since before your kind came to this land. We remember." } },
    _none = { { id = "tp_none", text = "Salfa does not know. Salfa watches tunnels, not the world." } },
  },
}

P:NPC {
  key = "ranshalla", id = TODO_NPC("Ranshalla"), name = "Ranshalla", title = "Priestess of Elune",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "earnest" }, values = { "devout", "brave" },
  impression = {
    first = "Ranshalla is a priestess of Elune who means to relight the old altars of Winterspring, whatever waits around them. She is braver than she is careful.",
    third = "{name} met Ranshalla, a priestess of Elune seeking the old altars of Winterspring.",
  },

  greetings = {
    { id = "g_default", text = "Elune's light on you, traveller. Have you come to walk with me to the altar?" },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I hoped you would, because the road to the altar is no safer than it was." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I think so, though the furbolgs' sickness has made them harder to hear. Walk with me to the altars, and if you hear the earth stir, tell me before the ice does." } },
      choices = {
        { text = "I'll guard the altars with you, Ranshalla.", next = "BACK", reply = "Thank you, and Elune be with us both on the road. Two pairs of ears are better than one when the ice is listening.", fx = { align = { honor = 1 } } },
        { text = "Elune's altars are your concern, not mine.", next = "BACK", reply = "I understand, and I won't press you. But if you hear the earth stir anyway, I hope you'll tell someone.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I would, so long as your demon stays behind you and never in front. The altars were dark for a reason, and whatever put them out may come back when the torches are lit, so I'll need someone who knows what darkness looks like when it moves." } },
      choices = {
        { text = "I'll keep my demon behind me. You have my word.", next = "BACK", reply = "Thank you, truly, and I'll trust you with it. I'll light each torch faster knowing you're behind me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon goes where it's needed, priestess, front or back.", next = "BACK", reply = "Then please, at least don't let it near the flame. The altars are older than either of us.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I don't know, and the elder priestesses would scold me for saying it. But both kindle a flame in the dark, and that's all I'm trying to do at the altars, so if you come with me and stand guard while I light the torches, I won't ask whose name you whisper." } },
      choices = {
        { text = "I'll stand guard, whatever names we pray to.", next = "BACK", reply = "Then we'll have two flames against the dark, and that's more than I had this morning. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll guard you, but my faith is my own, priestess.", next = "BACK", reply = "Of course it is, and I'd never ask you to change it. I'm just glad of your company on the road.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Someone who stays beside me when I stop to light the torches, because I can't light them and run at the same time, and I've tried. The Winterfall and the wild things come quickly once the flames catch, and I need to know they'll meet steel before they meet me." } },
      choices = {
        { text = "I'll stand beside you until every torch is lit, Ranshalla.", next = "BACK", reply = "Oh, thank you, I'll feel so much braver with someone at my back. I'll light them as quickly as I can, I promise.", fx = { align = { honor = 1 } } },
        { text = "I'll go ahead and ambush whatever's waiting before it ambushes us.", next = "BACK", reply = "That's brave of you, though I'd rather you stayed near enough to hear me call. Don't go too far ahead, please.", fx = { align = { honor = -1 } } },
        { text = "Something else, Ranshalla.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Owlbeasts, mostly, the moontouched ones, who nest near the old stones because the moonlight still gathers there. I can't bring myself to hate them for it, since they love Elune's light as much as I do, but they do not share." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} can walk ahead of us, if it likes. I think the owlbeasts will be slower to attack a creature that doesn't fear them." },
      },
      choices = {
        { text = "Then I'll drive the owlbeasts off rather than kill them.", next = "BACK", reply = "Oh, would you? I'd be so grateful, because they're only defending what they love. Elune bless you for it.", fx = { align = { light = 1 } } },
        { text = "If they guard the altars, they'll have to die. Simple as that.", next = "BACK", reply = "I understand, and I'll pray for them all the same. Please make it quick, if you must.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Something, I think, because the beasts gather near them as though they remember the light. When I light the torches they grow restless, and I can't tell whether they're angry or only waking." } },
      choices = {
        { text = "Light them. The old ways should return.", next = "BACK", reply = "I hope so, and I think Elune does too. Each torch I light is a little prayer that someone will remember.", fx = { align = { order = 1 } } },
        { text = "Perhaps the beasts guard them for a reason.", next = "BACK", reply = "You might be right, and I'll watch them closely when I light the flame. I'd not want to wake something the beasts were keeping asleep.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I think they do, though I'm a priestess and not a shaman, so I feel it as Elune's light and you'll feel it as something else. The ground around each altar stays a little warmer, and the wild things gather there even when they're dangerous to us. Whatever lives in these hills remembers that the altars once meant something." } },
      choices = {
        { text = "Sacred places deserve protecting, whoever raised them.", next = "BACK", reply = "They do, and I'm glad to hear a shaman say it. Elune's places and the spirits' places aren't so far apart, I think.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Elune's altars are no concern of the Horde's.", next = "BACK", reply = "Perhaps not, but the dark that put them out doesn't care whose altars they are. I'd be glad of your help either way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Ghosts of the Highborne, I'm told, and creatures drawn to the old magic that still clings there. Elune's light will hold them back, I'm sure of it, but a friend with fire in their hands would be a comfort all the same." } },
      choices = {
        { text = "Elune's light and my fire will see you through.", next = "BACK", reply = "Thank you, and I'll feel safer with both. Between us we'll light every torch before the ghosts know we've come.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You're braver than you are wise, priestess.", next = "BACK", reply = "Maybe I am, but someone has to light them, and I'd rather it was me than no one. You're welcome to come and keep me wise.", fx = { align = { light = -1 } } },
        { text = "I'll be ready.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the altars of Elune were dark too long, and someone must relight them, and I am the one standing here. I'd rather go with a friend who watches the trees, but I'll go alone if I must, and I think you know that." } },
      choices = {
        { text = "I'll watch your back. You shouldn't go alone.", next = "BACK", reply = "Oh, thank you, I hoped you would say that! Watch the trees, and I'll watch the altars, and Elune will watch us both.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your courage will get you killed.", next = "BACK", reply = "It might, and I know it, but I'd rather die lighting a torch than live in the dark. Elune asks courage of her priestesses, not caution.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll think about it.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock. That doesn't sit easily with a priestess of Elune, but the hills are dangerous, and I'd rather walk to the altars beside you than alone." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, here in the hills! I've heard that your Light and Elune's grace are not so far apart, and I'd be glad of a shield and a steady heart when I go to the altars." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Oh, good, because I'm no fighter, as you'll see, and the things around the altars don't care much how kind I am." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You'll see the trail to the altars before I do, and the eyes watching it, which I'll confess I usually notice far too late." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman of the Horde? I didn't think one of you would come to an altar of Elune, but the spirits and the Mother Moon both watch these hills, so perhaps you belong here more than I thought." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! You'll be useful when we reach the altars, I think, because whatever lurks in those old places will not expect a spell from behind me." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue. Good, you'll see the danger before I do, because I tend to walk straight into it, and everyone keeps telling me so." },
        { id = "h_default", text = "I am Ranshalla, a priestess of Elune, and there are old altars in these hills that have been dark for far too long. I mean to light their torches again, but the wild things guard them now, and I can't go alone." },
        { id = "h_cond", when = { class = "PRIEST" }, text = "A priest! Then you'll feel it too, when we reach the altar, the way the Mother Moon still listens there." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! The altars I mean to light were raised before the Sundering, and I think the Circle would be glad to see them burning again." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman at an altar of Elune? The spirits and the Mother Moon both watch these hills, as they have since before the Sundering, so perhaps you belong here more than I thought." },
      },
      again = {
        { id = "h_again1", text = "What else, friend? Speak, and Elune will hear it as well." },
        { id = "h_again2", text = "Speak, the moon is patient tonight." },
      },
      choices = {
        { text = "Do the old altars still draw the land's spirits?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "What do the altars mean to the wild things, Ranshalla?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Something must wait at the altar.", next = "altar" },
        { text = "Why do the altars matter to Elune?", next = "elune" },
        { text = "Something must guard the altars now.", next = "danger" },
        { text = "I'd be honoured to pray at the altar with you.", next = "priest", when = { class = "PRIEST" } },
        { text = "What lurks around the old altars?", next = "xmage", when = { class = "MAGE" } },
        { text = "Why go to the altars if they're so dangerous?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You'll want a guard at the altars.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What watches the trail to the altars, Ranshalla?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you think the Light and Elune are so alike, Ranshalla?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would Elune's priestess really walk with a warlock?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do the old altars still draw the land's spirits?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Elune keep you, Ranshalla.", next = "END" },
      },
    },
    altar = {
      lines = {
        { id = "altar_default", text = "A shrine our people built before the Sundering, and the guardians who were bound to it, and a door I can only open with every torch lit. I don't know all that lies beyond it, and that frightens me a little." },
      },
      choices = {
        { text = "Then why open it at all?", next = "altar2" },
      },
    },
    altar2 = {
      lines = {
        { id = "altar2_default", text = "Because what we've forgotten can't protect us, and Winterspring is full of forgotten things. My sisters in Darnassus say some doors were closed for good reasons, but I think they're only afraid." },
      },
      choices = {
        { text = "Open it. Knowledge lost is strength lost.", next = "BACK", reply = "That's what I've always believed, and it's good to hear it said by someone who isn't me. I'll open it gently, though, just in case.", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Your sisters may be right. Some doors stay closed.", next = "BACK", reply = "They may be, and I'll go carefully because of it. But I'd like to know why a door was closed before I agree to leave it shut forever.", fx = { align = { order = 1 }, trait = { careful = 1 } } },
      },
    },
    elune = {
      lines = {
        { id = "elune_default", text = "Every altar is a place where the Mother Moon was asked to watch over us, and she doesn't forget a promise. When they go dark, I think the watching goes dim too." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = {
        { id = "danger_default", text = "Wild beasts mostly, and the Winterfall furbolgs, and sometimes worse things drawn to old magic. I'll do my part with prayers if you'll do yours with steel." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    priest = {
      lines = {
        { id = "priest_default", text = "Then we'll light the last torch together, and Elune will hear two voices instead of one. That's how the old priestesses did it, you know, always in pairs." },
      },
      choices = {
        { text = "I'll be ready.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a priestess of the Temple of the Moon, though I've spent more time in the snow than in the temple lately." } },
    elune = { { id = "tp_elune", text = "Elune's light still shines on the old altars of Winterspring, if you know how to wake them. I mean to light every one of them, whatever waits around them." } },
    sisterhood_of_elune = { { id = "tp_sisterhood_of_elune", text = "The Sisterhood serves Elune in Darnassus and in every corner of Kalimdor. I'm one of them, though I've wandered further than most." } },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess sent me north to see what remains of the old shrines. I'd like to bring her good news." } },
    highborne = { { id = "tp_highborne", text = "The Highborne built the altars I'm lighting, before they fell to their pride. I try not to think about that too much." } },
    _none = { { id = "tp_none", text = "I don't know that one, but I'll ask Elune tonight, if you like. She has answered stranger questions over ten thousand years." } },
  },
}

P:NPC {
  key = "haleh", id = TODO_NPC("Haleh"), name = "Haleh", title = "",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "mazthoril" }, temper = { "cold" }, values = { "wise", "proud" },
  impression = {
    first = "Haleh is a blue dragon who keeps watch in the icy caves of Mazthoril. She speaks to mortals as if she is not sure they deserve it, and she is fairly sure they don't.",
    third = "{name} met Haleh, a blue dragon who keeps watch in Mazthoril in Winterspring.",
  },

  greetings = {
    { id = "g_default", text = "A mortal, in Mazthoril. You must be either brave or lost, and I suspect it's the second." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the caves, little one. Malygos's children remember those who come twice." },
  },

  start = "hello",
  nodes = {
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The Light is old, mortal, older than your kingdoms, and my flight does not mock what is old. What we distrust is the way your kind seize a power and declare that it has chosen them, as if the cold had chosen these caves, when the caves were simply here first." } },
      choices = {
        { text = "The Light chose no one. We choose to serve it.", next = "BACK", reply = "A humbler answer than most of your kind give, mortal, and I will remember it. Serve it well, then, and never mistake service for ownership.", fx = { align = { light = 1 } } },
        { text = "Power answers whoever is strong enough to hold it.", next = "BACK", reply = "So said the Highborne, and so said every mortal who ever called the Legion. You will learn otherwise, as they did, though I hope less painfully.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than a fool's spellbook, I grant you. Steel does not tear holes in the world or call the Legion through them, and if every mortal had kept to it, my flight would have far less to guard." } },
      choices = {
        { text = "Then steel is enough for me. Let the dragons keep the magic.", next = "BACK", reply = "A wise choice, and a rarer one than you know, warrior. Keep to your steel, and my flight will have one less mortal to watch.", fx = { align = { order = 1 } } },
        { text = "Steel serves me now, but I'll take power wherever I find it.", next = "BACK", reply = "Then you are like all the rest, and the blue flight will be watching when you reach for it. Choose carefully what you take.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They try, and they boast of it, and a few even succeed against whelps who have not yet learned to fear them. The blue flight remembers every scale taken, mortal, and the ones who took them are not forgotten either." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has the sense to keep its head low in my presence, which is more sense than most mortals show." },
      },
      choices = {
        { text = "I hunt beasts, not dragons. I'll leave your flight in peace.", next = "BACK", reply = "Then we have no quarrel, hunter, and you may walk these snows freely. Keep to beasts, and my kin will keep to their caves.", fx = { align = { light = 1 } } },
        { text = "Any beast can be hunted, Haleh, and a dragon is no different.", next = "BACK", reply = "Then you will learn how different, mortal, and you will learn it only once. My kin are not beasts, and they do not forget.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The ice was here long before us, mortal, for Winterspring has always been cold. We chose these caves because the frost keeps out the curious and keeps in what we guard. If the spirits of the ice speak to you, they will tell you they tolerate us, which is more than they offer you." } },
      choices = {
        { text = "Every power needs a keeper. The ice is in good hands.", next = "BACK", reply = "A respectful answer, shaman, and the ice will remember your manners. We guard it well, and we guard it long.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No flight owns the ice, Haleh, nor the magic.", next = "BACK", reply = "No flight owns it, true, but some must keep it from those who would misuse it. You may thank us when your world is still whole.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Every flight did, in the War of the Ancients, and some of them paid dearly for it. Your demons are scraps of that same Legion, bound by mortals who think they understand what they hold, and I find that more amusing than you would like." } },
      choices = {
        { text = "The Legion must never return. I'll see to that.", next = "BACK", reply = "Brave words, and I hope you hold to them, for the Legion counts on mortals who forget. My flight remembers, warlock, always.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Scraps or not, they serve me well enough.", next = "BACK", reply = "Well enough, until they don't, and then the world pays for your confidence. The blue flight has cleaned up after many warlocks.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll mind my demons, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A dragon has use for anything that keeps its secrets, and a rogue sometimes does. But if you think to steal from Mazthoril, mortal, know that others have tried, and none of them ever left." } },
      choices = {
        { text = "I'll keep your secrets, dragon.", next = "BACK", reply = "Good, and see that you keep them well. A rogue who keeps his word is worth more to a dragon than a vault of gold.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every vault has a weakness.", next = "BACK", reply = "Every vault but Mazthoril, mortal, and those who sought its weakness are part of its walls now. Do not test me.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll keep my hands to myself.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Little, as a rule, though your healing is less reckless than the arcane, and that counts for something. Shadow is another matter, priest, for the blue flight has watched too many mortals swear they could master a darkness they barely understood." } },
      choices = {
        { text = "Then I'll keep my craft to healing.", next = "BACK", reply = "Wise, priest, and I'll think the better of you for it. Healing mends what the arcane breaks, and that is no small work.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I understand my shadow well enough, dragon.", next = "BACK", reply = "So did every mortal who fell to it, priest, until the moment they didn't. I will be watching, as my flight always watches.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Things that mortals should not touch, and that is all you need to know. Your Cenarion Circle understands that some power is meant to sleep, which is more wisdom than your mages have ever shown, so do not disappoint me by asking more than you should." } },
      choices = {
        { text = "I won't pry. Some power is meant to sleep.", next = "BACK", reply = "Then you have more sense than most who reach these caves, druid. The Circle taught you well.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Knowledge hoarded by dragons helps no one. Mortals deserve to know.", next = "BACK", reply = "They deserve to know, perhaps, but they rarely deserve to hold. Mortals with knowledge tore this world apart once already.", fx = { align = { order = -1 } } },
        { text = "Something else, Haleh.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, in Mazthoril. You carry your Light as if it were a banner, mortal, and the ice in these caves has outlasted every banner your kind ever raised." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. You trust in steel and muscle, mortal, which at least has the virtue of honesty, since you have never pretended to understand magic." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, in Mazthoril. You track beasts through the snow, mortal, and I suppose you think yourself a hunter of dragons too, as the young ones always do." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You at least bargain with the powers you use instead of stealing them, which puts you a step above the mages, though not a large one." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, in Mazthoril. You trade with the Legion's creatures, mortal, and my flight remembers what the Burning Legion did to this world, even if your kind have forgotten." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue in my caves. You think yourself unseen, but my flight sees through every veil you could draw, and some you have not yet thought of." },
        { id = "h_default", text = "I am Haleh of the blue dragonflight, and these caves are ours to guard. Magic has been stolen and misused across this world, and the blue flight does not forgive those who play with what they don't understand." },
        { id = "h_cond", when = { class = "MAGE" }, text = "A mage. You wield a power that belongs to my flight, you know, and you wield it like a child with a lantern." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, here in Mazthoril. Your power at least does not belong to my flight, mortal, which makes you a little less tiresome than a mage." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. Your kind learned from Cenarius and walk in the Dream that the Green Aspect guards, so perhaps you will speak to me with a little less foolishness than the others." },
      },
      again = {
        { id = "h_again1", text = "What else would you ask the blue flight?" },
        { id = "h_again2", text = "Speak, and be brief." },
      },
      choices = {
        { text = "Is the ice of Mazthoril the blue flight's doing?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The blue flight must guard something precious.", next = "magic" },
        { text = "What is Mazthoril?", next = "mazthoril" },
        { text = "Who leads your flight?", next = "malygos" },
        { text = "Then teach me to wield it properly.", next = "mage", when = { class = "MAGE" } },
        { text = "I didn't know the blue dragonflight fought the Legion.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do dragons have any use for rogues?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What does the blue flight think of priests, Haleh?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is a warrior's steel worth anything to a blue dragon?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do mortals hunt your kind, Haleh?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Your flight guards something in these caves.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does the blue flight have any respect for the Light, Haleh?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    magic = {
      lines = {
        { id = "magic_default", text = "Magic itself, little one, the arcane that runs beneath the world. The Highborne nearly ended everything with it, and the Legion came through the door they opened." },
      },
      choices = {
        { text = "Mortals use magic every day now.", next = "magic2" },
      },
    },
    magic2 = {
      lines = {
        { id = "magic2_default", text = "They do, and they are rarely wise about it, which is why we watch. Some of my kin would take it from mortals entirely, and some say you must be allowed to learn from your own mistakes." },
      },
      choices = {
        { text = "Mortals must learn on their own, mistakes and all.", next = "BACK", reply = "A kindly view, and some of my kin share it. I only hope your mistakes are smaller than the last ones.", fx = { align = { order = -1 }, trait = { independent = 1 } } },
        { text = "Some power is too dangerous. Guard it closely.", next = "BACK", reply = "You speak as my flight speaks, and I am glad of it. Power left lying about is power waiting for the wrong hand.", fx = { align = { order = 1 }, trait = { careful = 1 } } },
      },
    },
    mazthoril = {
      lines = {
        { id = "mazthoril_default", text = "A warren of ice caves beneath the snow, full of creatures the cold has kept alive since before your kingdoms. It suits a dragon who does not wish to be disturbed." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    malygos = {
      lines = {
        { id = "malygos_default", text = "Malygos, the Spell-Weaver, who was wounded long ago in ways mortals would not understand. We do not speak of him lightly, and neither should you." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK" },
      },
    },
    mage = {
      lines = {
        { id = "mage_default", text = "A dragon does not teach children, she watches them, and corrects them if they set the house on fire. Prove yourself careful first, and perhaps one day we will speak again." },
      },
      choices = {
        { text = "Fair. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am of the blue flight, and older than your oldest city." } },
    dalaran = { { id = "tp_dalaran", text = "The mortal mages of Dalaran play with the arcane like children with fire. They are rebuilding their city now, and they will doubtless burn it down again." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor call themselves the masters of magic, and the blue flight finds that very amusing. They have mastered nothing, except perhaps their own conceit." } },
    highborne = { { id = "tp_highborne", text = "The Highborne meddled with the Well of Eternity and brought ruin on the world. My kind remembers, and we watch the mortals who would follow them." } },
    _none = { { id = "tp_none", text = "That is not a question worth a dragon's breath, little one." } },
  },
}

P:NPC {
  key = "lorax", id = TODO_NPC("Lorax"), name = "Lorax", title = "",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "bitter" }, values = { "regretful", "cunning" },
  impression = {
    first = "Lorax is a satyr living alone in Winterspring, cast out or fled from his own kind, and full of regret for the bargain that made him what he is. He has a tale to tell, and wants a hero to finish it.",
    third = "{name} met Lorax, a lonely satyr in Winterspring with a tale of a demon's bargain.",
  },

  greetings = {
    { id = "g_default", text = "Don't draw your blade, mortal, I'm no friend to the satyrs you've been killing. Sit, and hear what Lorax has to say." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to hear more of Lorax's tale. Few would." },
  },

  start = "hello",
  nodes = {
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I think I would understand it, which is not the same thing. I made a bargain with the Legion long ago and became this, and the demon who holds my contract still lives in these hills, so if your Light wants something to destroy, I can point you to a better target than me." } },
      choices = {
        { text = "Every soul deserves a chance at redemption, even yours.", next = "BACK", reply = "A generous thought, and more than I deserve, but I'll take it gladly. Perhaps you'll prove the Light right about me, and me wrong.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll deal with your demon, but I won't forget what you are.", next = "BACK", reply = "Fair enough, mortal, and I'd think you a fool to forget it. Only free me from that contract, and I'll remember you kindly.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not his hold, no, for that is written and sealed in fel. But demons are proud, and if you cut down enough of his servants he will come himself to see who dares, and then your steel may do what my bargaining never could." } },
      choices = {
        { text = "Then I'll call him out openly and face him myself.", next = "BACK", reply = "Then you are braver than any satyr in these hills, and he will respect it, though not enough to spare you. Strike true when he comes.", fx = { align = { honor = 1 } } },
        { text = "Then I'll let him come to me and strike while he gloats.", next = "BACK", reply = "Clever, and demons are vain enough to fall for it. Only do not gloat back, for they hear every word.", fx = { align = { honor = -1 } } },
        { text = "Something else, Lorax.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "With a promise of power, as they snare everyone, and I walked to it gladly because I thought I was the hunter. The satyrs in these hills were all taken the same way, and every one of them still believes, somewhere, that he made a good bargain." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks at me as though it smells something rotten, and it is right to. Beasts know what we are long before mortals do." },
      },
      choices = {
        { text = "Then you were snared, Lorax, and the snared can still be freed.", next = "BACK", reply = "Perhaps they can, and I've hoped as much for longer than you've been alive. Help me cut the line, and we'll see.", fx = { align = { light = 1 } } },
        { text = "Then you walked into the snare yourself. You got what you chose.", next = "BACK", reply = "I did, and I won't pretend otherwise. But even a snared beast struggles, and I am struggling still.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Less than Felwood, but it reached. Demons still keep to Darkwhisper Gorge in the south of this valley, and the snow around it is never quite clean. I could tell you the spirits fled, shaman, but I think they simply turned their backs, which is what anyone sensible does with a satyr." } },
      choices = {
        { text = "Spirits forgive more than you'd think, if you make amends.", next = "BACK", reply = "Then I'll make what amends I can, and pray the spirits are as forgiving as you say. The gorge still owes me some.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "You chose your bargain. Your debts are your own.", next = "BACK", reply = "They are, and I carry them every day in this cold. I only ask for a chance to pay them back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Our queen's court showed the way, and many of us followed, thinking the Legion's gifts were a reward for our devotion. The Legion gave power, as it always does, and took everything that made us kaldorei, and I have had ten thousand years to regret it." } },
      choices = {
        { text = "Then I'll never follow such a path.", next = "BACK", reply = "Then you'll be wiser than I was, and I'd be glad of it. The Legion never asks twice, and never needs to.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Perhaps you just weren't strong enough to control it.", next = "BACK", reply = "That is exactly what I told myself, mortal, and look what I became. Strength had nothing to do with it.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "That's a grim tale.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I want it destroyed, and with it the hold that demon has on me, but stealing comes first. If you could take back what I foolishly gave, I would owe you more than a satyr has words for." } },
      choices = {
        { text = "I'll help you break free. You deserve a chance.", next = "BACK", reply = "Then you have my gratitude, which is all a satyr can give. Strike that demon well, and I'll be free to start again.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You made your bargain. Live with it.", next = "BACK", reply = "I have, every day, for ten thousand years. I only hoped someone might help me stop.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll consider it.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I bargained my soul to the Legion for power, and the Legion keeps its bargains far better than any god keeps a promise. If there's redemption for me, it lies in striking back at the demon who holds my debt, and I can't do that alone." } },
      choices = {
        { text = "Then I'll help you strike back, and pray it's enough.", next = "BACK", reply = "Thank you, and pray loudly, for I'm sure no god has heard my voice in a long age. Together we might still do some good.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some bargains can't be broken, Lorax. You made yours.", next = "BACK", reply = "Perhaps, and I know it better than you. But I'll strike back all the same, and see what breaks.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every day, in this cold. I traded the forest for power, as so many of my kind did, and the power was real, but so was the price. A druid might think there's a way back for one like me, but there is not, so do not waste your pity, only finish the tale I've started." } },
      choices = {
        { text = "Regret is a beginning. Even you can still do some good.", next = "BACK", reply = "A beginning, yes, and I've been beginning a long time. Perhaps with your help I'll finally get somewhere.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You chose your bargain, satyr. Live with it.", next = "BACK", reply = "I am living with it, druid, which is the cruellest part. But I'll keep trying all the same.", fx = { align = { light = -1 } } },
        { text = "Something else, Lorax.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. I expected you to strike me where I stand, for that is what your kind does to satyrs, and I find I am almost disappointed you haven't." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. The demon who holds my contract fears steel more than he lets on, for the Legion's lieutenants are proud, and pride bleeds as well as anything." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. You know how a snare works, then, how the beast walks into it of its own accord because something sweet lies waiting. I was that beast, once." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The spirits must loathe me, I suppose, and I would in their place, for I gave away everything they would have given me freely." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. The Highborne were mages once, before the demons came, and look what I became when I followed them, so mind the books you open." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue. You might be useful to me, I think, for the demon I bargained with keeps a contract, and contracts can be stolen." },
        { id = "h_default", text = "I am Lorax, and once I was something better than this, before I bargained my soul away to the Legion. Now I want only to strike back at the demon who holds my debt, and I can't do it alone." },
        { id = "h_cond", when = { class = "WARLOCK" }, text = "A warlock, of all things. Then you know already how a demon's bargain works, and how it always ends." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, here, with me? Then perhaps you can tell me whether any god would still hear a satyr, because I stopped expecting it long ago." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You look at me the way the night elves always did, as though you can smell the forest I betrayed, and perhaps you can." },
      },
      again = {
        { id = "h_again1", text = "There is more of the tale, if you have the stomach for it." },
        { id = "h_again2", text = "Ask. Lorax has nothing but time." },
      },
      choices = {
        { text = "Did the Legion's touch reach Winterspring's land too?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Tell me your tale, then.", next = "tale" },
        { text = "The other satyrs here seem less sorry than you.", next = "satyrs" },
        { text = "Why hide in Winterspring?", next = "winterspring" },
        { text = "Every bargain has a loophole.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "How did a Highborne mage become a satyr?", next = "xmage", when = { class = "MAGE" } },
        { text = "You want me to steal your contract from a demon?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is there no redemption left for a satyr, Lorax?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could a warrior break your demon's hold, Lorax?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "How did the Legion snare you, Lorax?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "You seem to regret becoming a satyr, Lorax.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do you think a paladin should strike you down, Lorax?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'll think on your tale.", next = "END" },
      },
    },
    tale = {
      lines = {
        { id = "tale_default", text = "I was Highborne once, and I wanted power, and the Legion gave it to me with horns and hooves attached. The demon who holds my soul has grown careless, and with the right help I could make him pay." },
      },
      choices = {
        { text = "I don't see why I should trust a satyr.", next = "tale2" },
      },
    },
    tale2 = {
      lines = {
        { id = "tale2_default", text = "You shouldn't, and I'd think less of you if you did. But a satyr who regrets is rarer than a dragon's tooth, and some would say I deserve a second chance, while others would say I deserve the blade." },
      },
      choices = {
        { text = "Everyone deserves a chance to set things right.", next = "BACK", reply = "That's a kinder world than I've seen, but I'd like to live in it. Help me, and we'll see if it's real.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "You chose this. Your debt is yours to pay.", next = "BACK", reply = "It is, and I've never said otherwise. I only want to pay it, and stop owing.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    satyrs = {
      lines = {
        { id = "satyrs_default", text = "They chose their masters and they're happy in their chains, and they'd kill me if they found me. Lorax keeps to his cave and keeps his head down." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    winterspring = {
      lines = {
        { id = "winterspring_default", text = "Because demons hate the cold nearly as much as I do, and the snow covers tracks. It's a miserable place, and that's the best thing I can say for it." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    warlock = {
      lines = {
        { id = "warlock_default", text = "Every bargain has one, yes, and the demons write them in for themselves. Find mine for me, warlock, and Lorax will owe you more than a satyr can repay." },
      },
      choices = {
        { text = "We'll see.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was Highborne, once, and a fool. Now I'm only the fool." } },
    satyrs = { { id = "tp_satyrs", text = "The satyrs were Highborne once, in the old days, and every one of us made a bargain to become what we are. I regret mine every day, and I've no one to blame but myself." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Burning Legion promised us power, and gave us horns and hooves instead. Never make a bargain with a demon, mortal, because they always win." } },
    highborne = { { id = "tp_highborne", text = "The Highborne were the finest of the Kaldorei, and the proudest. They fell because of their pride, and I followed their example far too closely." } },
    queen_azshara = { { id = "tp_queen_azshara", text = "Azshara led the Highborne to ruin in the old days, and they say she was the most beautiful being in the world. I've learned that beauty and ruin keep very close company." } },
    _none = { { id = "tp_none", text = "Lorax doesn't know, and Lorax has stopped pretending to." } },
  },
}

P:NPC {
  key = "himmik", id = TODO_NPC("Himmik"), name = "Himmik", title = "Food & Drink",
  bible = "bibles/winterspring.md", role = "vendor", tier = "service",
  communities = { "everlook" }, temper = { "cheerful" }, values = { "comfort", "practical" },
  impression = {
    first = "Himmik is a goblin who sells hot food and drink in Everlook, which in Winterspring is the next best thing to sunshine. He talks up his soup like it's a war hero.",
    third = "{name} met Himmik, the goblin food vendor in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Hot food, hot drink, hotter than anywhere north of Felwood, guaranteed, chum! Well, mostly guaranteed, read the small print, and the bits floating in it are mostly turnip." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more, eh, chum? Nobody leaves Himmik's hungry, or at least not for long, and never with a full purse." },
  },

  start = "hello",
  nodes = {
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Double soup and a loaf, every time, and they eat it standing up because they can't sit down in all that armour! The last one tried to pay me in prayers, and I told him I'd take the prayers and the silver both, thank you very much, because prayers don't keep the stove lit." } },
      choices = {
        { text = "Here's my silver, and a prayer for the stove besides.", next = "BACK", reply = "Ha! A blessing for the stove, now that's a first, friend, and I'll take both. The stove could use all the help it can get.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Prayers should be worth something, Himmik. You're a cynic.", next = "BACK", reply = "A cynic? Pal, I'm a cook, and prayers don't come with gravy. But I'll take your silver and say one for you anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Meat, and more meat, and a heel of bread to push it around with, because a warrior on an empty stomach is a warrior who loses to a Winterfall. I bring the salt meat over the pass from Felwood, mind, though none of it ever grew there, because nobody should eat anything that grew in that forest." } },
      choices = {
        { text = "I'll pay full price. A warrior shouldn't cheat the cook.", next = "BACK", reply = "You're a gem, friend, and I wish all my warriors thought like you. Eat hearty, and go knock some furbolg heads.", fx = { align = { honor = 1 } } },
        { text = "I'll eat now and settle up after the next furbolg camp.", next = "BACK", reply = "After? I've heard that one, chum, and half of 'em never came back from the camp. Silver first, then soup.", fx = { align = { honor = -1 } } },
        { text = "Something else, Himmik.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A little, I'll admit, like eating a snowball with gristle in it, but the customers love it because it's local. Mind you, local in Winterspring means something that tried to freeze you first, so I charge extra for the danger." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Is {pet} hungry? Don't answer that, chum, I can see it is, and I can see it looking at my soup pot like an old friend who owes it money." },
      },
      choices = {
        { text = "I'll sell you only what I kill cleanly and quickly.", next = "BACK", reply = "Now that's a hunter I'll do business with, friend. Clean meat makes clean soup, and my customers can tell.", fx = { align = { light = 1 } } },
        { text = "I'll sell you whatever I find dead in the snow. Nobody would know.", next = "BACK", reply = "They'd know, friend, believe me, one bite and they'd know. Bring me fresh or bring me nothing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Spoil them? It keeps them, friend, it's the best larder in Kalimdor! The trouble is getting the stores here at all, through the tunnels or over the pass, and the snow shuts one or the other every week. The way I see it, the frost spirits and I have a deal: they keep my meat cold, and I don't complain about the wind." } },
      choices = {
        { text = "That's a fair bargain. Keep your word to the frost.", next = "BACK", reply = "I always do, friend, and the frost's never once let me down. I just wish it'd let the caravans through more often.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No bargain binds the wind. It'll take what it likes.", next = "BACK", reply = "Probably not, but it's held for me so far, and I'm not about to stop asking nicely. You'd be surprised what the wind likes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They eat in the corner with their backs to the wall, and they tip better than anybody, probably because they don't want to be remembered, and I've got a terrible memory for a good tipper. The Cartel says no fighting in Everlook, chum, so you can eat in peace here." } },
      choices = {
        { text = "Neutral ground is worth keeping.", next = "BACK", reply = "Exactly what I always say, chum, and the bruisers agree with me. Everybody eats, nobody fights, and the soup stays hot.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules are only as good as the bruisers enforcing them.", next = "BACK", reply = "Sure, but the bruisers are very good at their jobs, friend. Nobody's tested 'em in my corner yet.", fx = { align = { order = -1 } } },
        { text = "I'll take the corner seat.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I wouldn't know, chum, and I'm not letting it near my pots to find out. Last time someone fed an imp my stew, it set fire to the bench, and I'm still finding scorch marks under the counter and still waiting on the fella to pay for 'em." } },
      choices = {
        { text = "I'll keep my imp out of your kitchen.", next = "BACK", reply = "Bless you, chum, and the bench thanks you too. I'll save a scrap of bread for the little fella, outside.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My imp eats what it likes.", next = "BACK", reply = "Not my stew, it doesn't, chum, not unless it pays like everybody else. And I charge double for fire damage.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Just soup for me, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "You could try, but I'd charge you for the pot if it cracked, and my soup's hot enough already. Here, I'll heat it the old-fashioned way, and you can save your mana for the yetis." } },
      choices = {
        { text = "Old ways are often the best ways.", next = "BACK", reply = "Exactly, friend, and the old ways don't crack my pots. Save your sparks for the yetis.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Magic makes everything easier. Try it sometime.", next = "BACK", reply = "Maybe I will, friend, the day magic learns how to wash up. Until then, I've got a stove.", fx = { align = { order = -1 } } },
        { text = "Just a bowl, thanks.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than you'd think, half frozen and wearing the wrong boots, and I feed them first and ask for coin after, which my cousin says is no way to run a business. But nobody's buying soup if they're dead, are they, so I call it planning ahead." } },
      choices = {
        { text = "That's kindness, Himmik, whatever you like to call it.", next = "BACK", reply = "Ha! Don't let my cousin hear you say that, friend, or he'll make me charge double. But thanks, really.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Smart planning. Charity's just an investment that pays later.", next = "BACK", reply = "Ha! You've got a goblin's head on you, friend, and I won't argue. Half my regulars started as frozen strays.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "It's warmed more frozen adventurers back to life than any priest in Kalimdor, and I say that with all respect to your trade. The secret's a good stock and a little goblin ingenuity, and the price is on the board, honest as the day." } },
      choices = {
        { text = "Honest soup is its own kind of blessing, Himmik.", next = "BACK", reply = "That it is, friend, and it's the only blessing I'm qualified to give. Here, have a bowl and see for yourself.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll call it a miracle to everyone, for a free bowl.", next = "BACK", reply = "Ha! You'd make a fine salesman, friend, but I charge for miracles same as anything else. Silver on the counter, please.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Everyone who walks through that door, friend, Horde or Alliance or druid or dwarf. Winterspring doesn't care what you are, it'll freeze you all the same, and I'd rather fill a stranger's bowl than find them stiff in the snow the next morning." } },
      choices = {
        { text = "That's a kindness, Himmik. Everlook's lucky to have you.", next = "BACK", reply = "That's sweet of you, friend, and I'll take it. A full belly does more for peace than any treaty.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Kind, but costly. Charge them proper, or you'll go broke.", next = "BACK", reply = "You sound like my cousin, friend, and he's richer than me and twice as cold. I'll keep my rates and my customers.", fx = { align = { light = -1 } } },
        { text = "Never mind the stew.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Sit down, sit down, chum, because nobody marches through Winterspring in a full suit of plate without wanting a hot bowl of soup, and mine's practically blessed already, which is why it costs a little extra." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You'll want a double helping, I can tell, because nobody empties a bowl faster than someone who's been swinging an axe at furbolgs all day." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You don't bring me meat, do you, chum? Because I'd pay good coin for chimaera steaks, and the last hunter who sold me some swore they don't taste of frost, and he was lyin', but they sold anyway." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You'll be wanting somethin' hot, I'll bet, chum, because no spirit I ever heard of can make a stew in this cold, and none of 'em work for my wages." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You look like you've been crouching in a snowbank all day, so let me get you a bowl of something hot before your fingers freeze to your daggers." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! You want soup? Good, because your little friend looks hungry too, though I'm not sure what imps eat and I'd rather not find out." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Can you warm a pot with a spell, chum? Everyone asks, and I keep forgetting to ask a mage myself, and think what I'd save on firewood." },
        { id = "h_default", text = "Himmik's the name, food and drink's the game, and in Everlook that's the most important trade there is, chum. Everything I sell has to come over the pass or through the tunnels, so believe me, at these prices I'm practically robbing myself." },
        { id = "h_cond", when = { race = "Dwarf" }, text = "A dwarf! You'll want somethin' that sticks to the ribs, chum, and I've got a stew that'll hold up a mine shaft, and costs less than the timber." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Say a little grace over the soup, would you, chum? Business has been slow, and I'll take any blessing I can get on the pot, especially the kind that brings in customers." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Sit down, sit down, because anyone who's been praying out in the snow needs soup more than most, and mine's practically a miracle itself." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You'll want something hearty too, I'd say, because turning into a bear in this weather must take a lot out of you." },
        { id = "h_winterfall_resolved", when = { thread = { id = "winterfall_firewater", state = "resolved" } },
          text = "The dwarf at the springs came through here sayin' the Winterfall are patients and not bandits, chum, and I said fine, cure 'em, and I'll sell 'em soup. A sober furbolg's a customer, see, and a drunk one's a liability." },
        { id = "h_winterfall_soured", when = { thread = { id = "winterfall_firewater", state = "soured" } },
          text = "Everlook's hired bruisers for the road, chum, and guess who's feedin' 'em at cost? It's safer for my carts, I'll grant you, but I've done the sums and a bruiser eats twice what he saves me." },
      },
      again = {
        { id = "h_again1", text = "What else, chum? The soup's getting cold, and cold soup don't sell." },
        { id = "h_again2", text = "Anything else for you, chum, a bowl, a loaf, a second bowl?" },
      },
      choices = {
        { text = "Does the cold up here ever spoil your stores, Himmik?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's cooking?", next = "BUSINESS" },
        { text = "Something smells good today.", next = "food" },
        { text = "How's business in Everlook?", next = "everlook" },
        { text = "I'll try that stew.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Rogues must eat at your counter now and then.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Does your soup feed demons, too?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Could I really warm your soup with magic?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do many come down off the mountain needing help?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "They say your soup is a miracle, Himmik.", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What do you feed a warrior in Winterspring, Himmik?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do chimaera steaks really taste of frost, Himmik?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you feed the travelers who come in from the wilds?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What does a paladin usually order from you, Himmik?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Keep the soup warm.", next = "END" },
      },
    },
    food = {
      lines = {
        { id = "food_default", text = "The bread's fresh, the cheese is aged, and the meat, well, it was walking last week, which is about as fresh as Winterspring gets, chum. Everything tastes better in the cold, that's what I always say, and it sells better too." },
      },
      choices = {
        { text = "I'll take your word for it.", next = "BACK" },
      },
    },
    everlook = {
      lines = {
        { id = "everlook_default", text = "Booming, friend, booming! Every adventurer chasing furbolgs and frostsabers comes through here cold and starving, and the Steamwheedle Cartel don't care if you're Horde or Alliance so long as your coin's real." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = {
        { id = "dwarf_default", text = "Now there's a dwarf with sense, and if it doesn't warm you through I'll eat my hat, and it's a very nice hat, so you see how sure I am." },
      },
      choices = {
        { text = "I'll hold you to the hat.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Steamwheedle through and through, chum, and I feed Everlook at a modest profit, which is the best kind." } },
    everlook = { { id = "tp_everlook", text = "Everlook's the coldest town in the world, pal, and my soup is the warmest thing in it. One bowl, and you'll forget you ever had feet." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got good cooks, but they've never had to cook for the cold. Try my soup, and you'll know the difference." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's hot enough to cook an egg on the sand, which is no use to anybody up here. I'll take the snow and a full pot every time." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw love my soup, though they never pay in coin. I've got enough fur in the back to make a coat." } },
    _none = { { id = "tp_none", text = "No idea, chum, but have you tried the soup? Because that I can sell you." } },
  },
}
