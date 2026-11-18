-- Around the Ruins of Eldarath: the furbolg of the Cenarion Circle on the cliff, a leatherworker's camp, a cheated goblin, a shipwrecked captain and a pilot on call. Voice: bibles/azshara.md
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ogtinc", id = TODO_NPC("Ogtinc"), name = "Ogtinc",
  bible = "bibles/azshara.md", role = "questgiver", tier = "major",
  communities = { "eldarath_cliffs" }, temper = { "steady", "gentle" }, values = { "kind", "patient" },
  notices = { "class", "race", "pet" },

  impression = {
    first = "Ogtinc is a furbolg hunter who left his people to serve the Cenarion Circle, and he keeps watch over the Ruins of Eldarath from his cliff. He grieves every courser he asks someone to kill.",
    third = "{name} met Ogtinc, a furbolg of the Cenarion Circle keeping watch on the cliff above the Ruins of Eldarath.",
  },

  greetings = {
    { id = "g_default", text = "You have climbed far. Rest; the cliff is quiet, and the ruins below are not." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The divine path keeps bringing you to my fire." },
    { id = "g_salve", when = { questDone = TODO_QUEST("The Ichor of Undeath") }, text = "The salve is nearly whole, thanks to you. Felwood may yet remember what clean water tastes like." },
    { id = "g_cold", when = { reputation = { faction = "Timbermaw Hold", max = "unfriendly" } }, text = "You smell of my people's blood. Speak, but do not come closer." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. The Circle hoped one of your kind would come, and here you stand, so I will not ask how you found me, only whether you will help." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid of the Circle! Then you know the work I do here, and why I do it so far from Moonglade." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Good; I am one also. We will understand each other, I think, if you understand the prey as well as the kill." },
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Your companion walks well beside you. {pet} trusts you, and beasts do not trust lightly here." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Perhaps you, of all who come, would know how. The Highborne ghosts walk the paths they walked before the sea took their city, and you walked back from death yourself, so Ogtinc hopes you understand what they want." } },
      choices = {
        { text = "I'll grant them rest. They've wandered long enough.", next = "BACK", reply = "Ogtinc thanks you, and Ogtinc thinks they will thank you too, in whatever way ghosts can. They have walked those paths too long.", fx = { align = { light = 1 } } },
        { text = "Some ghosts don't want rest. I'll let them be.", next = "BACK", reply = "Perhaps some do not, and Ogtinc will not argue. But Ogtinc hopes you will look at them gently as you pass.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because Ogtinc has seen what their magic did to this land, and it did not end well for them, or for the land. The Circle watches the ruins, and Ogtinc watches the Circle's fire, and he would rather you came back to it alive than walked into the ruins looking for power." } },
      choices = {
        { text = "Knowledge isn't evil. I'll study it, but carefully.", next = "BACK", reply = "Carefully is the right word, and Ogtinc is glad you said it. The Highborne were careful too, at the start.", fx = { align = { order = -1 } } },
        { text = "I'll leave the ruins be. The Circle knows best here.", next = "BACK", reply = "Ogtinc is glad, and the Circle will be too. The ruins have done enough harm.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Old magic, Ogtinc thinks, the Highborne's magic that went wrong and never went quiet. The ghosts walk the same paths they walked before the sea took their city, and Ogtinc does not know whether they suffer, but he hopes your Light might grant them rest, if anything can." } },
      choices = {
        { text = "I'll grant them rest. They've suffered long enough.", next = "BACK", reply = "Thank you, and Ogtinc will say their names to the wind with yours. They have suffered a very long time.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead are the Circle's business, not mine.", next = "BACK", reply = "The Circle cannot reach them all, and Ogtinc had hoped you might. But Ogtinc understands.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The lingering Highborne, who are dead already and only too stubborn to know it, and the naga, who would drown this whole coast if they could. The coursers and the wavethrashers are only what the land made them, and Ogtinc asks you to take from them only what the Circle needs." } },
      choices = {
        { text = "Then I'll strike only what must be struck.", next = "BACK", reply = "That is the wise way, and the coursers will thank you for it. Not everything here is an enemy.", fx = { align = { light = 1 } } },
        { text = "In a fight, I won't stop to ask which ones deserve it.", next = "BACK", reply = "Ogtinc understands, but Ogtinc hopes you will look before you swing. Some of them were beautiful once.", fx = { align = { light = -1 } } },
        { text = "Something else, Ogtinc.", next = "BACK" },
      },
    },
    tauren_og = {
      lines = {
        { id = "tog_default", text = "Kin in spirit, perhaps, for we both honour the land and the old ways. The tauren druids I've met walk gently and speak little, which is the highest praise a furbolg can give, and the Circle is better for them." },
      },
      choices = {
        { text = "The Earth Mother watches over us both.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Healthier than Felwood's, but the ruins below hold old magic and older ghosts, and the earth around them is restless. The coursers still run and the trees still grow, so I tell myself the land is only sleeping badly. The Circle hopes to keep it from waking into something worse." } },
      choices = {
        { text = "The Circle is wise. Leave the old ruins sealed.", next = "BACK", reply = "Ogtinc agrees, and Ogtinc is glad a shaman sees it. The earth there is restless enough.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Old ruins hide power. Someone ought to open them.", next = "BACK", reply = "Someone has opened them before, and the sea took their city for it. Ogtinc would not.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Ogtinc does not know, but the divine path asks that we try to mend what we have broken. If you really wish to help, gather what the Circle needs and use your power only against those who would sicken the land further." } },
      choices = {
        { text = "I'll use my power only to protect the land.", next = "BACK", reply = "Then Ogtinc is glad of you, and the land will be too. That is how mending begins.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll use my power as I see fit.", next = "BACK", reply = "Ogtinc cannot stop you, but Ogtinc hopes you will think of Felwood when you do.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll think on the divine path.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Circle needs what is in their blood for its work in Felwood, and Ogtinc grieves each one, for they are beautiful and did nothing to deserve it. Kill them swiftly and cleanly, and they suffer less, which is the only mercy Ogtinc can give." } },
      choices = {
        { text = "I'll make it swift and clean.", next = "BACK", reply = "Ogtinc thanks you, and Ogtinc will name each one tonight. Swift and clean is a kindness.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're just beasts. Let them suffer.", next = "BACK", reply = "Ogtinc will not give you the work, then. The coursers deserve better than that.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll keep it in mind.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Very little that a healer can give, I fear, for the Highborne ghosts there do not want healing. But Felwood still waits for the Circle's medicines, and every herb gathered here goes south to the sick woods." } },
      choices = {
        { text = "Then I'll gather for Felwood, and pray it helps.", next = "BACK", reply = "Then Felwood will be grateful, and so will Ogtinc. Prayer and gathering both help.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Felwood isn't my concern. Let it fend for itself.", next = "BACK", reply = "Ogtinc understands the strong survive, but Ogtinc cannot watch them suffer. Leave them, then, but gently.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Ogtinc smells the arcane on you, as he smells it on the ruins, and he hopes you will not go poking at what the Highborne left behind." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" },
          text = "A paladin. Ogtinc has seen your kind fight the dead, and he is glad, for the Highborne ghosts in the ruins below are restless, and they do not rest for Ogtinc's words." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Ogtinc sees how heavy your blade is, and how often it is used, and he hopes you know that not every creature in these ruins must die." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, and welcome. My people had shamans before the corruption, and you remind me of the elders who taught me to hear the forest." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "You walk with a demon's shadow, warlock, and the spirits of this cliff go quiet when you come near. Ogtinc does not turn away anyone who would help the land, but he asks you to remember what fel has done to it." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue moves like a hunter, quiet and patient, and Ogtinc respects that. The coursers of these ruins are hard to approach, and quiet feet would serve you well among them." },
        { id = "h_default", key = true,
          text = "I am Ogtinc, and I serve the Cenarion Circle. I keep watch on this cliff over the Ruins of Eldarath, and I gather what the Circle needs to heal the lands the demons left sick." },
        { id = "h_aid", when = { questActive = TODO_QUEST("Cenarion Aid") },
          text = "You have come, and I breathe easier for it. The Circle has a need, and it is the kind a priest understands; there is much to do." },
        { id = "h_coursers", when = { questActive = TODO_QUEST("Of Coursers We Know") },
          text = "The mosshoof coursers graze south and east of here. Take only what is needed, and take it quickly, so that they do not suffer." },
        { id = "h_ichor", when = { questActive = TODO_QUEST("The Ichor of Undeath") },
          text = "The lingering Highborne below carry the ichor in them, green and foul. I need only one; do not take more of that evil than you must." },
        { id = "h_morphaz", tags = { "news" }, when = { questActive = TODO_QUEST("Blood of Morphaz") },
          text = "A courier has taken the rest to the Circle. Only the drake's blood is missing now, and it waits for you in the drowned temple in the Swamp of Sorrows, with the drake still around it." },
        { id = "h_antlers", when = { questActive = TODO_QUEST("Courser Antlers") },
          text = "Perfect antlers, whole and unbroken, are rare as a quiet night here. Watch the coursers a long while before you choose." },
        { id = "h_waves", when = { questActive = TODO_QUEST("Wavethrashing") },
          text = "The wavethrashers live on the eastern shore, half in the water and half out of it. Fight them on the sand, never in the surf." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Friend. Sit by the fire; I have saved you the dry stone. It is good to see a face I trust on this cliff." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. The Circle does not ask which gods you pray to, only that you help the land heal, and I am glad of any healer on this cliff." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, but one of the dead ones. Ogtinc has seen your kind fight the dead, but never the dead fight with the Light, and Ogtinc does not know what to think." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The ruins will wait; they have waited a long time." },
        { id = "h_again2", text = "Speak. I listen better than I talk, my brothers used to say." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask. The ghosts below are loud tonight, and I would rather hear you." },
      },
      choices = {
        { text = "Are the spirits of Azshara still healthy, Ogtinc?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "A furbolg in the Cenarion Circle?", next = "who" },
        { text = "Tell me about the coursers.", next = "coursers" },
        { text = "The Circle must want something from this place.", next = "circle" },
        { text = "Something must wait in the ruins below.", next = "ruins" },
        { text = "The Circle asked for a priest's help.", next = "priest", when = { class = "PRIEST" } },
        { text = "I've come to earn the hunter's charm.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Cenarius guide your hunt, brother.", next = "druid", when = { class = "DRUID" } },
        { text = "The Timbermaw call me friend.", next = "timbermaw", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } } },
        { text = "My people are kin to yours, I've heard.", next = "tauren_og", when = { race = "Tauren" } },
        { text = "Can someone who uses fel help heal the land?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why hunt the coursers at all?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What do the Ruins of Eldarath need from a healer, Ogtinc?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Some creatures here must deserve the blade, Ogtinc.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "The ghosts in the ruins seem troubled, Ogtinc.", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "Why shouldn't I study what the Highborne left, Ogtinc?", next = "xmage", when = { class = "MAGE" } },
        { text = "Could my Light grant the ghosts in the ruins rest, Ogtinc?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Walk the divine path, Ogtinc.", next = "END", fx = { affinity = 1 } },
      },
    },

    who = {
      big = true,
      lines = {
        { id = "w_default", fx = { learn = { "furbolgs", "cenarion_circle" } },
          text = "Yes. I left my tribe to serve the Circle, because the Circle is fighting the sickness that took my people. The druids did not ask what I had been, only what I would do, and I have been answering that question ever since." },
      },
      choices = {
        { text = "Why did you leave your tribe?", tag = "Persuade", next = "tribe",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = { "DRUID", "PRIEST" } }, { reputation = { faction = "Timbermaw Hold", min = "friendly" } } } } },
          fail = { next = "tribe_fail", fx = { affinity = -1 } } },
        { text = "What sickness took your people?", next = "who_sickness" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe = {
      big = true,
      lines = {
        { id = "tr_default", text = "Because they went angry and sick, one by one, and the ones who did not were told to hunt the ones who did. I would not hunt my brothers, and I could not watch them hunted. The Circle gave me a third way: to fight the sickness itself, so that one day there would be nothing left to hunt." },
      },
      choices = {
        { text = "That took courage.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then I'll help you fight it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
      },
    },
    tribe_fail = {
      lines = { { id = "tf_default", text = "That is a wound, and I do not open it for strangers. Perhaps when we have walked further together." } },
      choices = { { text = "I understand.", next = "BACK" } },
    },
    who_sickness = {
      lines = { { id = "ws_default", text = "The same that rots Felwood, I think, or its cousin. It came from the demons' leavings and it crept into the dens, and now my people strike at everything that moves in the northern mountains, even the things that come to help." } },
      choices = {
        { text = "Can they be saved?", next = "who_saved" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_saved = {
      lines = { { id = "wsv_default", text = "The Timbermaw in Felwood kept their minds, so it is not hopeless. I tell myself that every morning, and most mornings I believe it." } },
      choices = {
        { text = "Hold on to that hope.", next = "BACK", reply = "Ogtinc will, and Ogtinc is glad of your company in it. Hope is easier with two.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hope won't save them. Steel might.", next = "BACK", reply = "Perhaps, but steel alone made the Deadwood what they are. Ogtinc will hope a little longer.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },

    coursers = {
      lines = {
        { id = "co_default", text = "The mosshoof coursers are the finest beasts in Azshara. They lived in Felwood once, and when the corruption came they did not sicken; they resisted it, and in their wisdom they simply walked away from that poisoned place and came here." },
      },
      choices = {
        { text = "Then why hunt them?", next = "coursers_why" },
        { text = "Wiser than most people.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    coursers_why = {
      lines = { { id = "cw_default", text = "Because what lets them resist the poison lives in their blood and glands, and that is the cure Felwood needs. It grieves me; the Circle holds the courser sacred, and each one we kill weakens its spirit a little." } },
      choices = {
        { text = "Is there no other way?", next = "coursers_names" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coursers_names = {
      lines = { { id = "cn_default", text = "If there were, I would have found it. So I give each one I must take a name, and say it to the wind at night, so that something remembers them besides the salve." } },
      choices = {
        { text = "The needs of the many come first.", next = "BACK", reply = "They do, and Ogtinc knows it, and Ogtinc still names them. The many are made of ones.", fx = { affinity = -1, align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Then I'll take only what we need.", next = "BACK", reply = "Ogtinc thanks you, and the coursers would thank you if they could. Only what we need.", fx = { affinity = 2, align = { order = -1 }, trait = { kind = 1 } } },
      },
    },

    circle = {
      lines = {
        { id = "ci_default", text = "A restorative salve for Felwood, made by the old formula: one part poison and two parts cure. The coursers give the first cure, the Highborne dead give the poison, and the last cure is the hardest of all to win." },
      },
      choices = {
        { text = "Why use poison at all?", next = "circle_poison" },
        { text = "There must be one cure left to find.", next = "circle_drake" },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle_poison = {
      lines = { { id = "cp_default", text = "Because a cure that has never met the sickness does not know how to fight it. The ichor of undeath is a wretched thing to hold, and I wash my paws twice after, but the salve is stronger for it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    circle_drake = {
      lines = { { id = "cd_default", fx = { learn = { "morphaz" } },
        text = "The blood of a green drake called Morphaz, who lairs in the drowned troll temple in the Swamp of Sorrows. No poison or sickness touches him, and many druids died to learn that much." } },
      choices = {
        { text = "The Archmage on the cliff hates that drake.", next = "BACK", fx = { trait = { curious = 1 } }, when = { heardLine = "xylem.h_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ruins = {
      lines = {
        { id = "ru_default", fx = { learn = { "eldarath", "spitelash", "highborne" } },
          text = "Eldarath, a city of the elves before the sea broke the land. The naga dig there now, and the Highborne who never left walk among them, and on the southern cliffs a blue dragon guards something that he will not share." },
      },
      choices = {
        { text = "What are the naga looking for?", next = "ruins_naga" },
        { text = "The dead Highborne seem to be talking.", next = "ruins_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins_naga = {
      lines = { { id = "rn_default", text = "Old magic, as everyone here does. I watch them from this cliff, and I have seen them carry stones with writing on them down into the water. What they want with them, I cannot say." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ruins_dead = {
      lines = { { id = "rd_default", text = "They whisper, but not to us. They are still talking to each other about spells and rank and their queen, as if the sea had never come. I think that is the saddest thing on this coast." } },
      choices = {
        { text = "They should be laid to rest.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      big = true,
      lines = {
        { id = "pr_default", text = "It did, and I am glad of it. Your beliefs do not stand in the way of this work; the divine helps those in need, and the land of Felwood is in very great need. The how does not matter, priest, only the why." },
      },
      choices = {
        { text = "The Light heals all wounds, even the land's.", next = "BACK", reply = "Ogtinc would like to believe it, and perhaps it does. The land will not mind whose light mends it.", fx = { affinity = 2, align = { light = 2 } } },
        { text = "I'll help, but this is the Circle's work, not the Light's.", next = "BACK", reply = "It is, and Ogtinc thanks you all the same. The work does not care who claims it.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Why does the Circle need a priest?", next = "priest_why" },
        { text = "I'm ready to begin, Ogtinc.", next = "priest_path" },
      },
    },
    priest_why = {
      lines = { { id = "pw_default", text = "Because some of what we must gather is undead, and a priest walks among the dead with less harm than a druid does. And because the Circle believes that whoever heals, heals; the name of the power is less important than the hands." } },
      choices = { { text = "Then count on my hands.", next = "BACK", fx = { affinity = 2 } } },
    },
    priest_path = {
      lines = { { id = "pp_default", text = "Then walk the divine path with me. The coursers first, then the ichor, then the drake; it will take you from this cliff to the swamps of the east, and the salve will remember every step." } },
      choices = {
        { text = "I'm ready.", next = "BACK", fx = { affinity = 1 },
          journal = { first = "Ogtinc of the Cenarion Circle asked a priest's help to make a salve for Felwood. I agreed to walk the path with him.",
                      third = "{name} agreed to help Ogtinc of the Cenarion Circle make a salve to heal Felwood." } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Then you will hunt as a hunter should. The courser's perfect antlers for its confidence, the wavethrasher's scales for its strength, and at the end, a drake. Each prey teaches you something the last one could not." } },
      choices = {
        { text = "I hunt to learn.", next = "BACK", fx = { affinity = 2, trait = { patient = 1 } } },
        { text = "I hunt for the trophy, Ogtinc.", next = "BACK", fx = { affinity = -1, trait = { proud = 1 } } },
      },
    },
    druid = {
      lines = { { id = "dr_default", text = "And yours, brother. The Circle is thin on this coast; you are the first of us I have seen in a season. Tell them at Nighthaven that Ogtinc still keeps his watch." } },
      choices = { { text = "I'll tell them.", next = "BACK", fx = { affinity = 2 } } },
    },
    timbermaw = {
      lines = { { id = "tm_default", text = "They do? Then you have done something few have done, and I owe you thanks I cannot pay. If the Timbermaw can keep their minds, perhaps the others can find theirs again." } },
      choices = {
        { text = "They'll be glad to hear of you.", next = "BACK", fx = { affinity = 3 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "You speak kindly to a furbolg, and not many do in these days. Ogtinc thanks you, and he will remember the warmth of it when the cliff is cold." },
        { id = "s2", text = "Those are good words, friend, and Ogtinc thinks you mean them. The Circle taught me that kindness is a kind of healing, and I feel a little healed." },
      },
      fail = {
        { id = "f1", text = "Ogtinc is only a hunter on a cliff, friend, and such large words do not fit him. I would sooner you spoke plainly, as the beasts do." },
        { id = "f2", text = "My people heard sweet words too, before the sickness took them, and I have been wary of sweetness since. Say what you need of me, and we will leave the praise aside." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Hrr. You poke at the bear to see whether he still has claws, and that is a hunter's trick, so Ogtinc is not angry. He still has them, friend, and he is glad you asked boldly." },
        { id = "s2", text = "Ogtinc has been called worse by his own kin, and they meant it more. You have a strong heart to tease a furbolg at his own fire, and I think the path may have need of it." },
      },
      fail = {
        { id = "f1", text = "That was not kindly said, and Ogtinc does not know what he did to earn it. I left my tribe to get away from anger, so do not bring it up my cliff." },
        { id = "f2", text = "Ogtinc does not answer mockery, because nothing good grows from it. Sit quietly a while, or go down to the ruins, where the ghosts may enjoy a quarrel more than I do." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", narr = "Ogtinc takes one slow step back from the fire.", text = "You are stronger than Ogtinc, and you want him to know it, and now he knows it. I ask only that you remember I am not your enemy, and that this cliff has seen enough fear." },
        { id = "s2", text = "Ogtinc has seen that look on the faces of his own people, before they stopped knowing him. I will give you what you ask, friend, but I am sorry that you asked it so." },
      },
      fail = {
        { id = "f1", text = "Ogtinc watched his tribe go mad around him, and he walked out through them alone. You do not frighten him, friend, and he wishes you would not try." },
        { id = "f2", text = "The divine path does not bend because someone raises a voice at it, and neither does Ogtinc. Sit down by the fire, and we will speak as two hunters should." },
      },
    },
  },

  topics = {
    _gated = {
      { id = "gt1", text = "Ogtinc does not know you well enough yet to speak of that. Walk gently on this coast a while, and then ask me again." },
      { id = "gt2", text = "That is a thing I keep close, friend, and I am not ready to give it to you. A furbolg learns to be slow with his trust." },
    },
    knows = {
      { id = "tp_knows", text = "I know the beasts of this coast, and the ruins below, and a little of the Circle's work. Ask what you need." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "Friend, I will tell you all that I know. It is not so much, but it is honest." },
    },
    background = { { id = "tp_bg", text = "A furbolg who left his tribe and found the Circle. That is enough of my story for now.", next = "who" } },
    advice = { { id = "tp_ad", text = "Watch a beast before you hunt it. If you cannot tell what it fears, you are not ready to kill it." } },
    cenarion_circle = { { id = "tp_circle", text = "The druids who heal what the demons broke. I serve them, and they have been kind to a furbolg who had nowhere else to go.", next = "circle" } },
    furbolgs = { { id = "tp_furb", text = "My people. Sick, angry and frightened, most of them. I pray for them on this cliff.", next = "who_sickness" } },
    morphaz = { { id = "tp_morph", text = "A green drake whom poison does not touch. His blood is the last cure the salve needs.", next = "circle_drake" } },
    eldarath = { { id = "tp_eld", text = "The city below, the naga's now. Go carefully; the ruins are full of things that remember being powerful.", next = "ruins" } },
    highborne = { { id = "tp_hb", text = "The proud dead of the elves, still whispering about magic. Their ichor is part of my salve, and I am not proud of that." } },
    new_plague = { { id = "tp_plague", text = "Sickness on sickness, in the east. The Circle has enough to heal here, but I fear we will be called there too." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are my cousins, far to the north in Felwood, and they still keep their minds whole. I pray they stay that way, with the forest so sick around them." } },
    elune = { { id = "tp_elune", text = "The night elves pray to the moon, and I honor that, though the furbolgs speak more to the earth and the trees. Ogtinc thinks they listen to the same mother in different voices." } },
    green_dragons = { { id = "tp_green_dragons", text = "The green dragons sleep where the Dream touches the world, and Ogtinc has seen one in the north. They are sad creatures, beautiful and sad." } },
    queen_azshara = { { id = "tp_queen_azshara", text = "This land is named for a queen who drowned, and her ruins are everywhere. The trees here do not forget her, and Ogtinc does not like what they remember." } },
    loramus = { { id = "tp_loramus", text = "The elf on the island across the bay smells of demons, and the coursers will not swim near him. Ogtinc keeps his distance too." } },
    _none = { { id = "tp_none", text = "I do not know that, and I will not pretend to. Ask Loh'atu at the elves' camp; he walks further than I do." } },
  },
}

P:NPC {
  key = "peter_galen", id = TODO_NPC("Peter Galen"), name = "Peter Galen",
  bible = "bibles/azshara.md", role = "trainer", tier = "service",
  communities = { "eldarath_cliffs" }, temper = { "steady" }, values = { "practical" },
  notices = { "profession" },

  impression = {
    first = "Peter Galen teaches dragonscale leatherworking from a camp in the ruins, and offers his condolences to anyone who goes hunting dragons. He keeps a list of customers who never came back.",
    third = "{name} met Peter Galen, the dragonscale leatherworker camped in the Ruins of Eldarath.",
  },

  greetings = {
    { id = "g_default", text = "Here to hunt dragons? Leave me a name to send the condolences to." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive! I'll keep your name off the list by the fire a while longer, then." },
  },

  notice = {
    { id = "n_lw", cat = "profession", when = { profession = "Leatherworking" },
      text = "Ah, a leatherworker. You've got the hands for it, I can tell, and I can teach them to work scale, if you're brave enough to bring me some." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd guess they hate them, since the blue flight fought the Legion long before any of us were born, or so I'm told. I don't ask what a customer does with my scales once they leave, but I do keep a list of names who didn't come back, and you'd be surprised how many were warlocks." } },
      choices = {
        { text = "Then I'll keep my demon out of the dragons' sight.", next = "BACK", reply = "Good idea, and I'd like to keep my list short. Dragons have long memories and short tempers.", fx = { align = { order = 1 } } },
        { text = "Let them come. My demon could use the practice.", next = "BACK", reply = "Then I'll start your line on the list now, friend, and save myself the ink later. Good luck.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because I keep a list of customers who went looking for dragonscale and didn't come back, and it's longer than I'd like. The blue dragons over the ruins don't care what your spirits say about it, so you'd best ask your elements for luck before you ask them for anything else." } },
      choices = {
        { text = "The spirits will guide me. I'll be careful with the dragons.", next = "BACK", reply = "Good, and I hope they guide you well, because the dragons won't. I'll keep your name off the list if I can.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll take what scales I need and come back for more.", next = "BACK", reply = "More? You'll be lucky to get the first lot. I'll have the ink ready.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because your kind walk up to the dragon and hit it, and the dragon breathes, and then I add a name to my list. The ones who come back are the ones who brought a dozen friends and a priest, and even they come back singed." } },
      choices = {
        { text = "Then I'll go with friends and a plan. Bravery isn't foolishness.", next = "BACK", reply = "There's a warrior who'll come back, and I'm glad of it. Bring the friends by the shop after, and we'll see about those scales.", fx = { align = { order = 1 } } },
        { text = "I'll take my chances alone. Glory doesn't share well.", next = "BACK", reply = "Then I'll write your name now and save myself the trouble. Glory doesn't skin dragons, friend.", fx = { align = { order = -1 } } },
        { text = "Something else, Peter.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A few, and they're the only customers whose names I've never had to put on the list. They watch the whelps and the drakes for days, learn which way they fly, and strike when the beast is tired, and that's the only sane way to go after anything with wings and teeth." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A few, and they're the only customers whose names I've never had to put on the list. Keep {pet} back from the dragon, though, because a beast charges in without thinking, and I've seen a hunter come home with dragonscale and without his wolf." },
      },
      choices = {
        { text = "I'll face the drake openly when I take its scales.", next = "BACK", reply = "Brave, and I'll respect it, but bring friends. Openly is how most of my list got there.", fx = { align = { honor = 1 } } },
        { text = "Then I'll wait until it's tired and wounded, and strike.", next = "BACK", reply = "That's how the ones who come back do it, so I'll not argue. A tired dragon is still a dragon, mind.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Steal, no; scales don't come off a living dragon unless it wants them to, and it never does. But you can get close enough to see where the weak plates are, and I'll teach you to work them once they're off a corpse, so condolences in advance." } },
      choices = {
        { text = "I'll fight for my scales, fair and square.", next = "BACK", reply = "Fair and square, then, and I'll teach you where the weak plates are. Come back with the scales and your skin.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll strike while the dragon sleeps.", next = "BACK", reply = "I don't teach that, and I won't work scale taken that way. Find another leatherworker, friend.", fx = { align = { honor = -1 } } },
        { text = "Keep the condolences handy.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Every last one, and the list is longer than I'd like, though shorter than my competitor's in Stormwind. Leatherworking is a trade for the living, so I'll teach you what you need and hope your name never goes on that parchment." } },
      choices = {
        { text = "I'll be careful. I don't want to be on that list.", next = "BACK", reply = "Good, because I'd hate to add a mage; they always look so surprised. Bring a friend who can take a hit.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good mage doesn't die to dragons.", next = "BACK", reply = "That's what the last three said, friend. Their names are on the second page.", fx = { align = { order = -1 } } },
        { text = "I'll take my chances.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every name, every night, and I'm not a praying man, so I hope the Light makes allowances for a leatherworker who mumbles. Most of them knew the risk and went anyway, which is either brave or daft, and I've never settled which." } },
      choices = {
        { text = "Brave. They chose the danger knowing what it cost.", next = "BACK", reply = "They did, and that's what I tell myself when I say the names. Brave is the kindest word I've got.", fx = { align = { honor = 1 } } },
        { text = "Daft. Courage without cunning just fills your list.", next = "BACK", reply = "Some did, and I'll not argue. But I say their names all the same, every night.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Honourable's a big word for a man who cuts up hides for a living, but I don't teach anyone to hunt the young or the sleeping, and I won't work scale from those who do. A dragon can fight back, and that's as close to fair as my trade gets." } },
      choices = {
        { text = "A fair fight is all honour asks. Your rule is sound.", next = "BACK", reply = "Thank you, and it's held for me this long. A fair fight makes for honest leather.", fx = { align = { honor = 1 } } },
        { text = "A sleeping dragon is a safe one. Fairness gets people killed.", next = "BACK", reply = "Maybe it is, but not for my shop. I'll not work scale taken from a sleeping thing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Only for the names on my list, and the list grows every season. I'm a Stormwind man and I was raised to the Light, but if your loa, or whatever the Forsaken pray to, will take a few of those names off my hands, I won't argue." } },
      choices = {
        { text = "Give me the names, and I'll say the words.", next = "BACK", reply = "Thank you, friend, truly. I'll write them out for you, and you can say them however your people say them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fools who hunt dragons dig their own graves.", next = "BACK", reply = "They do, and I tell them so before they go. But someone should say their names, all the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not a bit, because the dragons I work were trying to eat somebody when they died. Your Circle might say every creature has its place, and I'll grant that the blue ones up the coast are clever enough to talk, but scale's scale once it's off the beast, and it'll turn a blade like nothing else in Azeroth." } },
      choices = {
        { text = "Dead is dead. A hide is a hide once the beast is gone.", next = "BACK", reply = "That's how I see it, and I'm glad a druid agrees. A hide doesn't remember what it was.", fx = { align = { light = -1 } } },
        { text = "Some of those dragons think and speak. Work their scales with care.", next = "BACK", reply = "Fair enough, and I'll mind it. The blue ones up north I'd never touch, I promise you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Never mind the scales.", next = "BACK" },
      },
    },
    dd_dragons = {
      lines = {
        { id = "dd_dragons_1",
          text = "I keep a list of customers who went after dragonscale and never came back to pay for the lesson. It's a long list, and I read it some nights to remind myself why I teach the trade from a camp, not a cave." },
        { id = "dd_dragons_2",
          text = "The blue dragonkin guard something up there, and they guard it well. If you keep going back, bring the scales to me, and bring yourself back with them." },
      },
      choices = {
        { text = "I'll bring the scales. Leave my name off.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If I die, I die. Write me in.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Peter.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_dragons", when = { killed = { name = { "Dragonspawn", "Scalebane", "Magelord" }, min = 20 } },
          text = "You've been fighting the blue dragonkin up near the Ruins of Eldarath, and you're still alive. I'll take you off the list I keep, then, at least for this week." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, in my camp. You'll want dragonscale like the rest of them, I expect, though I'll warn you now that dragons don't care for demons any more than they care for me." },
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, in my camp! Dragons don't care about the spirits any more than they care about banners, but you're welcome all the same, and I'll offer my condolences before you go hunting anything with scales." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. You'll want dragonscale, I expect, and I'll teach you to work it, though I'd rather you didn't go and fetch it yourself." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Now there's someone who might bring me dragonscale without burning, since you can shoot the beast from further off than it can breathe, mostly." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue. You'll want to sneak past a dragon, I expect, rather than fight one, and I'd call that the most sensible plan anyone's brought me this month." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Dragons can feel magic, so the blues say, and every customer of mine who went hunting with spells in their hands is on my list of the departed." },
        { id = "h_default", key = true,
          text = "Peter Galen, of Stormwind, master of dragonscale leather. I work the scales of the most dangerous prey there is, and I teach anyone who's daft enough to go and get them." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, good, because my students come back from the dragons needing one, when they come back at all. The list is by the fire, if you've the stomach for it." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! You'll want dragonscale, I suppose, though plate's more your style; still, if you mean to go hunting dragons, I'd rather you went in armour than in hope." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, in my camp! Well, dragons don't care about banners and neither do I, so welcome, though I'll offer my condolences before you go hunting anything with scales." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, eh? You'll be the one to ask, then: does it sting, wearing dragonscale when you can turn into a bear and grow your own hide?" },
      },
      again = { { id = "h_again", text = "What else? I've a hide soaking, so make it quick." },
                { id = "h_again2", text = "Go on, I'm listening, and so's the dragon whelp up on the ridge, probably." } },
      choices = {
        { text = "You really keep a list of the dead?", next = "dd_dragons", when = { killed = { name = { "Dragonspawn", "Scalebane", "Magelord" }, min = 20 } } },
        { text = "Why work out here, of all places?", next = "why" },
        { text = "Is dragonscale worth the danger?", next = "scale" },
        { text = "Show me what you teach.", next = "BUSINESS" },
        { text = "Can a rogue really steal a dragon's scales?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you really keep a list of dead customers?", next = "xmage", when = { class = "MAGE" } },
        { text = "You must pray for the names on your list.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is hunting dragons for their scales an honourable trade?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does a dragonscale craftsman ever pray, Peter?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why shouldn't a warrior hunt dragons, Peter?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Have hunters brought you dragonscale before?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Does it trouble you, working the hides of dragons?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why offer condolences to a shaman, Peter?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The dragons can't think much of demons, Peter.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Farewell, Peter.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the dragonkin are near, the scales are fresh, and nobody in Stormwind wants a tannery next door. The blue dragons' servants guard the lake south of here, and the green ones are never far away, so I've plenty of material." } },
      choices = {
        { text = "Don't they come for you?", next = "why_list" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_list = {
      lines = { { id = "wl_default", text = "Not yet. I keep a list, though, of the hunters who never came back for the armour I made them. It's a longer list than I'd like, and I read it every winter." } },
      choices = {
        { text = "I'll try to stay off it.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scale = {
      lines = { { id = "s_default", text = "Dragonscale turns a blade and shrugs off fire and frost better than anything you'll find in a shop. Whether it's worth dying for is a question for the dead, and they're not very talkative." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Stormwind leatherworker with a taste for impossible materials. That's all there is to me." } },
    advice = { { id = "tp_ad", text = "Skin the beast quickly, before the scale hardens, and never do it where its mother can see." } },
    eldarath = { { id = "tp_eld", text = "Ruins all around me and naga below. I keep to my camp and let the old stones keep their secrets." } },
    onyxia = { { id = "tp_onyxia", text = "Onyxia is the queen of black dragonscale, so to speak, and I've never met anyone who's brought me her hide. I've met a great many who went looking." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The best black dragonscale comes out of Blackrock Spire, where the whelps nest by the hundred. My condolences in advance, if you're going." } },
    horizon_scout = { { id = "tp_horizon_scout", text = "The captain of the Horizon Scout keeps to the ruins and drinks too little to sleep and too much to work. Her crew buy my oils for their wounds, and they don't even haggle, so things must be grim out there." } },
    booty_bay = { { id = "tp_booty_bay", text = "I trained in Booty Bay under a goblin who charged me for every needle I broke. I broke a great many, and I still owe him for some of them." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. I know leather, and I know dragons, and that's my lot." } },
  },
}

P:NPC {
  key = "kimjael", id = TODO_NPC("Kim'jael"), name = "Kim'jael",
  bible = "bibles/azshara.md", role = "questgiver", tier = "quest",
  communities = { "legash" }, temper = { "cowardly", "sharp" }, values = { "greedy" },
  notices = { "race", "purse" },

  impression = {
    first = "Kim'jael is a goblin the elves hired and then tried to kill, and he's furious about the nickname more than the knives. He paid me fairly and then immediately renegotiated.",
    third = "{name} met Kim'jael, a goblin scout double-crossed by Magus Rimtori's elves on the northern cliffs.",
  },

  greetings = {
    { id = "g_default", text = "Psst! Over here, partner, before the elves see you, because I've got a business opportunity with your name on it and only a small administrative fee attached!" },
    { id = "g_back", when = { metBefore = true }, text = "My favourite employee! Back for more profitable danger? Mostly profitable for me, but you get to keep your limbs, usually." },
  },

  notice = {
    { id = "n_elf", cat = "race", when = { race = { "NightElf", "Skyborne" } },
      text = "Whoa, whoa, an elf! You're not one of Magus Rimtori's crowd, right? You don't look stuck-up enough, partner, and no offence, which is free." },
    { id = "n_purse", cat = "purse", when = { money = { min = 1000000 } },
      text = "Now there's somebody who knows what a gold coin's for! Let's talk, partner, let's talk." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Frighten, chase, chew on, I'm not picky, so long as I get my equipment back! They thought they could knife a loyal goblin partner and keep his gear, and I'd like them to learn otherwise, so name your price, and I'll pay half of it." } },
      choices = {
        { text = "Half? I'll do it for the full price, goblin.", next = "BACK", reply = "Full price? Partner, you drive a hard bargain, and I respect that in a business associate. Fine, full price, but no chewing on the gear.", fx = { align = { honor = -1 } } },
        { text = "I'll help you, but no demon chews on anyone.", next = "BACK", reply = "No chewing? Fine, fine, you're a stickler, but I can work with a stickler. Just bring back my stuff.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They hired me as a scout, and then they turned on me with knives, and then they kept my equipment, the thieves! I'm not asking you to smite them, exactly, although I wouldn't mind, but I'd very much like my gear back before someone else claims it." } },
      choices = {
        { text = "I'll recover your gear, but the elves deserve justice, not revenge.", next = "BACK", reply = "Justice, revenge, compensation, it all comes out the same on the ledger, partner. Bring the gear, and do what you like with the elves.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll take back your gear, and teach them not to steal.", next = "BACK", reply = "Now that's the kind of service I like, partner! A lesson and a refund, both at once.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because Kim'jael is a goblin of business, not a goblin of punching, and also because they had swords and I had a stuffed chicken. You have a sword, so you see how this works out better for everybody, especially me." } },
      choices = {
        { text = "I'll get it back because it's right, not for your coin.", next = "BACK", reply = "Not for coin? Partner, you're a terrible businessman, and I love you for it. I'll owe you one, which is a very rare thing.", fx = { align = { honor = 1 } } },
        { text = "I'll get it back, but the price just went up.", next = "BACK", reply = "Of course it did, of course it did, everybody's a businessman when Kim'jael's in trouble. Fine, fine, name your price.", fx = { align = { honor = -1 } } },
        { text = "Something else, Kim'jael.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The elves hired me to find a rune, then decided they didn't need to pay me, then decided to stab me, and I ran, which I'm very good at. They kept my compass, my scope, my wizzlegoober and my chicken, and I want them all back, especially the chicken." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The elves hired me to find a rune, then decided they didn't need to pay me, then decided to stab me, and I ran, which I'm very good at. And that {pet} of yours, can it sniff out a stuffed chicken? If it can, Kim'jael will be very grateful, and if it eats the chicken, Kim'jael will be very upset." },
      },
      choices = {
        { text = "I'll bring your things back as they were, chicken included.", next = "BACK", reply = "The chicken too? Partner, I could kiss you, but I won't, because you've got a sword. Every last bit of it, please.", fx = { align = { honor = 1 } } },
        { text = "Finders keepers, Kim'jael. Make me a better offer.", next = "BACK", reply = "Finders keepers? That's my line, you can't use my line! Fine, fine, better offer, I'm working on it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome_kj = {
      lines = {
        { id = "gkj_default", text = "Oh, laugh it up, gnome! You lot lost a whole city to troggs and radiation, so don't you go lecturing Kim'jael about bad business partners. Now are you going to help me get my gear back or just stand there being short?" },
      },
      choices = {
        { text = "Fine. I'll help. Partly out of pity.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "I'll stand here being short, thanks.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Both, and the curse is the elves' fault as far as I'm concerned! The old ones built all this, blew it up and left it full of ghosts and satyrs, and then their cousins come along and hire me to dig through it. If your spirits want to be useful, they can find my equipment before the satyrs at Legash do." } },
      choices = {
        { text = "For a fair cut, I'll find your gear myself.", next = "BACK", reply = "A fair cut, partner, now we're talking business! I'll draw you a map and a contract, in that order.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The spirits don't fetch goods, Kim'jael. Show some respect.", next = "BACK", reply = "Respect, respect, I respect everybody, I just respect my gear more. Fine, I'll ask the spirits nicely.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Stole it, scattered it, and left me for the naga, and called me little rat while they did it! I need my gear back, every crate of it, and a rogue knows how to find things that aren't where they should be." } },
      choices = {
        { text = "I'll get it back. That's only fair.", next = "BACK", reply = "Fair, {g:he|she} says, a rogue who believes in fair! I'll take it, partner, and I'll owe you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll get it back, for a cut.", next = "BACK", reply = "A cut, of course, of course, and I'd do the same. Ten percent, and not a copper more.", fx = { align = { honor = -1 } } },
        { text = "Little rat, eh?", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A goblin to haul their crates and dig through ruins, that's what, and then they decided they'd rather not pay him. Those runes they were after are worth plenty to the right buyer, and Kim'jael means to find that buyer before anyone else does." } },
      choices = {
        { text = "Those runes belong to whoever uncovered them.", next = "BACK", reply = "Exactly, and that's me, partner, I uncovered them! Bring 'em back and we'll split the profits.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Those runes are dangerous. Leave them in the ruins.", next = "BACK", reply = "Dangerous? Valuable, you mean, and I'd say so too if I were a mage who wanted 'em for himself. Bring back my gear, at least.", fx = { align = { order = 1 } } },
        { text = "Good luck with that.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Because my equipment's still out there, partner, and a goblin doesn't walk away from that much good gear just because somebody pointed a knife at him, not on my mother's ledger. Besides, I've been stabbed at by better than a few sulky elves, though I'll admit I can't remember when." } },
      choices = {
        { text = "Then I'll help you get it back, fair and square.", next = "BACK", reply = "Fair and square, partner, that's my favourite way. Well, my second favourite, after profitable.", fx = { align = { honor = 1 } } },
        { text = "Take back twice what they took. They owe you that.", next = "BACK", reply = "Now you're speaking my language, partner! Twice back, interest included.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Vengeance is bad business, so no, I want compensation, which is vengeance with a ledger. They hired me, they named me and they tried to stick a knife in me, and somebody ought to pay for all three, preferably in gold." } },
      choices = {
        { text = "Let it go. Grudges cost more than gold.", next = "BACK", reply = "Cost more than gold? Partner, nothing costs more than gold, that's what gold is for. But I'll think about it.", fx = { align = { light = 1 } } },
        { text = "Make them pay twice. They'd do the same to you.", next = "BACK", reply = "They would, they absolutely would, and that's what I keep saying! Twice it is, partner.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Worse, much worse! The elves dug at the Highborne stones and poured something nasty into the ground, and everywhere they stepped the grass went grey. Kim'jael just counted crates and kept his head down, but a druid would've cried, I think, if a druid had seen it." } },
      choices = {
        { text = "You took their coin and looked away. That was wrong, Kim'jael.", next = "BACK", reply = "Looked away? I looked at my ledger, partner, which is very different. But fine, maybe I looked a little away.", fx = { align = { honor = 1 } } },
        { text = "You stayed alive with bullies around you. That's no crime.", next = "BACK", reply = "Exactly, exactly, and you put it so nicely! Staying alive is the best business there is.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! Now there's a useful sort, because those elves who called me little rat are mages, and nothing frightens a mage like a demon at the door." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Good, very good, valuable even, because those elves who called me little rat will have a much harder time knifing me with a shiny holy fellow standing right there." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Good, very good, valuable employee, because Kim'jael needs his equipment back and the elves who took it are big, and mean, and very rude." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You track things, yes? Then track Kim'jael's equipment, because those elves hid it all over their camp, and I swear they did it to spite me." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Good, you can tell me if this place is cursed, partner, because I've been robbed, stabbed at and called a rat, and I'm starting to take it personally and itemize it." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! Now you're the sort who knows the value of an employee's equipment, and how easily it goes missing." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Don't tell me, you work for one of those pointy-eared mages too, and you're here to finish what they started. No? Good, because Kim'jael is fresh out of patience for spellcasters." },
        { id = "h_default", key = true,
          text = "They call me Kim'jael, and oh, Kim'jael indeed! It's elvish for little rat, near enough, and those bullies called me that the whole time they were paying me." },
        { id = "h_gear", when = { questActive = TODO_QUEST("Kim'jael Indeed!") },
          text = "My compass, my scope, my stuffed chicken and my wizzlegoober, all sitting in that elf camp. Get them back, and you'll be paid, just like we said." },
        { id = "h_rune", when = { questActive = TODO_QUEST("Kim'jael's \"Missing\" Equipment") },
          text = "The rune, the rune! The naga have it, down in Eldarath, and the elves wanted it badly. Find it, valuable employee, and we'll both be rich, or at least I will." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Would you say something holy over my equipment, once it's back? The elves who hired me said a few words over it too, and each word was a curse." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, and Horde at that! Good, maybe you can put a curse on those elves who called me little rat, or a blessing on me, whichever's cheaper." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "Oh, a druid! You've got that leafy look about you, which I like, because leaves don't shout at Kim'jael or call him little rat." },
      },
      again = {
        { id = "h_again", text = "Something more? Talk fast, partner, because every minute here costs me a little and I'm keeping count." },
        { id = "h_again2", text = "Go on, go on. I'm all ears, and the ears are worth a fortune." },
      },
      choices = {
        { text = "Is Azshara cursed, Kim'jael, or just unlucky for you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Someone must have hired you to come out here.", next = "hired" },
        { text = "What did the elves want here?", next = "treasure" },
        { text = "I'd have left Azshara long ago, in your place.", next = "leave" },
        { text = "What's a wizzlegoober?", next = "wizzle" },
        { text = "Funny. A goblin hired by elves, robbed by elves.", next = "gnome_kj", when = { race = "Gnome" } },
        { text = "Did the elves steal your equipment?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "The elf mages seem to have wanted something from you.", next = "xmage", when = { class = "MAGE" } },
        { text = "Why stay in Azshara after the elves turned on you?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you want vengeance on the elves, Kim'jael?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why didn't you fight the elves yourself, Kim'jael?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "How did you lose all your equipment, Kim'jael?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Did the elves treat the land as badly as they treated you?", next = "xdruid", when = { class = "DRUID" } },
        { text = "The elves did something to you, Kim'jael.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you want my demon to frighten the elves, Kim'jael?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Later, Kim'jael.", next = "END" },
      },
    },
    hired = {
      big = true,
      lines = { { id = "hi_default", fx = { learn = { "rimtori" } },
        text = "Magus Rimtori and her Thalassian crowd. They wanted a scout for treasure, and I signed up the second I heard the word, and the price. Then the knives came out, for me, their loyal goblin partner, and they kept my equipment!" } },
      choices = {
        { text = "That's outrageous.", next = "hired_rage" },
        { text = "You'd have done the same.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hired_rage = {
      lines = { { id = "hr_default", text = "Isn't it? You can't trust an elf, partner, I always say, I said it before and I'll say it again. Well, I said it after, mostly, but that's when it counts, and that's when the invoice goes out." } },
      choices = {
        { text = "Betrayal deserves payback.", next = "BACK", reply = "It does, partner, it does, and Kim'jael is just the goblin to collect. With your help, of course, at reasonable rates.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "A bargain's a bargain. They should've paid.", next = "BACK", reply = "They should've, and I'll tell 'em so, from a safe distance. A contract's a contract, partner.", fx = { affinity = 1, align = { honor = 1 } } },
      },
    },
    treasure = {
      lines = { { id = "t_default", text = "Some rune the naga dragged off into the ruins. The elves wanted it so badly they were willing to murder a goblin for it, which means it's worth something, which means I want it." } },
      choices = {
        { text = "What will you do with the rune?", next = "rune_plan" },
        { text = "Tell me the truth, or I walk.", tag = "Intimidate", next = "rune_truth",
          check = { pass = { any = { { power = { "above", "far_above" } }, { trait = "stern" }, { questDone = TODO_QUEST("Kim'jael's \"Missing\" Equipment") } } } },
          fail = { next = "rune_bluster", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rune_plan = {
      lines = { { id = "rp_default", text = "Oh, study it! Figure out what it's for! A purely scholarly interest, partner, purely scholarly." } },
      choices = { { text = "Of course it is.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    rune_truth = {
      big = true,
      lines = { { id = "rt_default", text = "All right, all right, put the scowl away! I'm going to sell it, to whoever pays most, and if that's Rimtori's people again, well, a rat's got to eat. Don't look at me like that; it's just business." } },
      choices = {
        { text = "At least you're honest now.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rune_bluster = {
      lines = { { id = "rb_default", text = "Walk, then! There are plenty of employees in the sea, and some of them don't make threats. Well, they do, but they're naga, so it's expected." } },
      choices = { { text = "Fine.", next = "BACK" } },
    },
    leave = {
      lines = { { id = "l_default", text = "And go back to Booty Bay with nothing but a story about elves? The Baron would laugh me off the pier. No, I leave Azshara richer than I came, or I don't leave at all." } },
      choices = {
        { text = "That's the spirit.", next = "BACK", reply = "That's the spirit, partner! Kim'jael is a goblin of his word, mostly, and his word is profit.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "That's how goblins end up dead.", next = "BACK", reply = "Dead goblins don't pay debts, partner, but they don't owe any either. I'll take my chances.", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
      },
    },
    wizzle = {
      lines = { { id = "w_default", text = "It's a... well, it goobles the wizzles, obviously. Very technical, very expensive, very mine. Don't ask an engineer to explain an engineer's tools, partner; we'd be here all week." } },
      choices = { { text = "Ha. Point taken.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Information costs money, partner, but for you, a free sample. Here's what I've got." } },
    background = { { id = "tp_bg", text = "A Booty Bay goblin with an eye for treasure, a head for figures and terrible taste in employers.", next = "hired" } },
    advice = { { id = "tp_ad", text = "Get paid half up front, and then get the other half up front too, if you can." } },
    rimtori = { { id = "tp_rimtori", text = "She hired me, she cheated me, she tried to have me killed. I'd write her a bad reference if anyone asked.", next = "hired" } },
    eldarath = { { id = "tp_eld", text = "Naga, ghosts and treasure, partner, and two out of three of those I could do without, unless the ghosts are selling." } },
    horizon_scout = { { id = "tp_horizon_scout", text = "The Horizon Scout? Pal, that ship sank with a hold full of goods I'd have bought cheap, which is a tragedy for everybody, but mostly for my margins." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's my kind of town, partner, everybody's crooked and everybody admits it. Out here the elves are crooked and pretend they're noble, which costs extra." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel's got a lovely clause in my contract about not being stabbed by the client, and the elves didn't read it. I'm filing a complaint, in triplicate." } },
    venture_company = { { id = "tp_venture_company", text = "The Venture Company would strip this coast in a month if the naga let them, and they'd sell the ruins to the Kirin Tor by the brick. I'd do it in a year and charge more." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran mages pay through the nose for anything with Highborne writing on it. If you ever find yourself in that city, mention my name, and charge more." } },
    _none = { { id = "tp_none", text = "Never heard of it, and if it's not for sale, I don't care." } },
  },
}

P:NPC {
  key = "beltis", id = TODO_NPC("Captain Vanessa Beltis"), name = "Captain Vanessa Beltis",
  bible = "bibles/azshara.md", role = "questgiver", tier = "quest",
  communities = { "ruined_reaches" }, temper = { "steady", "proud" }, values = { "brave", "dutiful" },
  notices = { "class", "kit" },

  impression = {
    first = "Captain Vanessa Beltis lost her ship, the Horizon Scout, to the naga off Azshara and holds a nook in the Ruined Reaches with what's left of her crew. She blames herself for every drowned sailor.",
    third = "{name} met Captain Vanessa Beltis, whose ship the Horizon Scout lies at the bottom of the sea off Azshara.",
  },

  greetings = {
    { id = "g_default", text = "Ahoy, {name}. Not a pretty sight, is it?" },
    { id = "g_back", when = { metBefore = true }, text = "You came back. Most people who see this cove don't." },
    { id = "g_held", when = { questDone = TODO_QUEST("A Crew Under Fire") }, text = "There's the one who held the barricade with us! The crew still talks about you." },
  },

  notice = {
    { id = "n_healer", cat = "class", when = { class = { "PRIEST", "PALADIN", "DRUID", "SHAMAN" } },
      text = "A healer, thank the Light! We had a priest among the passengers, but she's worn to the bone, and most of my crew need mending." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like you've been through a wreck yourself. Sit down a moment before the naga come back." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because they watched the Horizon Scout go down with half our crew aboard, and they still hear the naga singing at night. They're good men, but they've seen enough monsters for one lifetime, and they'd rather not wake to see a demon sitting by the fire." } },
      choices = {
        { text = "I'll keep my demon away from your crew, Captain.", next = "BACK", reply = "Thank you, and they'll thank you too, though they won't say it. They've had enough of monsters.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your crew should get used to it. The naga are worse.", next = "BACK", reply = "They're getting used to the naga, warlock, which is plenty. Keep it close, please.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Better than my crew, I'd wager, because you'd see the naga coming through the surf before my lookouts did. They come at dusk, mostly, sliding up out of the water, and if someone could thin them before they reach the barricade, I'd lose fewer sailors." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Better than my crew, I'd wager, because you'd see the naga coming through the surf before my lookouts did. And bring {pet} up to the barricade with you. My sailors have been jumpy since the wreck, and a beast with sharp ears is worth two lookouts." },
      },
      choices = {
        { text = "I'll stand at the barricade with your crew until the naga break.", next = "BACK", reply = "Then the Light bless you, and we'll stand together. My crew could use a steady arm at the barricade.", fx = { align = { honor = 1 } } },
        { text = "I'll pick them off from the cliffs. Your crew can hold the line.", next = "BACK", reply = "That'll do nicely, and my lookouts will be glad of it. Every naga down before the surf is one less at the barricade.", fx = { align = { honor = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    warrior_bl = {
      lines = {
        { id = "wbl_default", text = "Gladly, and I'll put my bosun beside you, because he's the only one of my crew who can still swing an axe straight. The naga come up out of the surf at night, so stand with your back to the fire and your eyes on the waves." },
      },
      choices = {
        { text = "I'll hold until your crew is safe.", next = "BACK", reply = "Then you'll have my thanks and my bosun's. We'll hold together until dawn.", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "Better to strike their camp before they come.", next = "BACK", reply = "Bold, and maybe right, but I can't spare the crew for it. If you go, go with my blessing.", fx = { align = { honor = -1 } } },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Food and water would be a blessing, and a fireball for the next naga raid would be better still. My sailors are tough, but they're tired, and every hand that helps us is one less lamp I have to light." } },
      choices = {
        { text = "I'll help your crew however I can.", next = "BACK", reply = "Thank you, and the crew will remember it. Every hand helps us get home.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your crew is your responsibility, Captain.", next = "BACK", reply = "They are, and I carry them every hour. But I'd hoped for a little help, all the same.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll see what I can do.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Passengers' goods, mostly, and some crates I'm not at liberty to discuss. The naga don't know what they've got, and I'd like it back before they figure it out, so a quiet hand would serve better than a loud one." } },
      choices = {
        { text = "I'll get it back quietly.", next = "BACK", reply = "Thank you, and quietly is best. The passengers will be grateful, and so will I.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "What's in those crates you won't discuss?", next = "BACK" },
        { text = "Tell your passengers they owe me.", next = "BACK", reply = "They do, and I'll tell them so, though I can't promise they'll pay. Most of them lost everything.", fx = { align = { order = -1 } } },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Every hour, because I chose the course that brought us past the naga, and I light a lamp for every sailor who didn't make it ashore. A priest of any faith could tell me it wasn't my fault, and I still wouldn't believe it." } },
      choices = {
        { text = "Grief is a burden we can share. Let me help.", next = "BACK", reply = "Thank you, and I'll take that kindness gladly. I haven't said their names aloud since the wreck.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then carry it. Guilt keeps a captain sharp.", next = "BACK", reply = "It does, and I'll carry it. But it's a heavy thing, and some nights I'd like to set it down.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Spitelash", min = 40 } },
          text = "My lads say the Spitelash don't sing on the beach at night anymore, and they've slept better than they have since the Horizon Scout went down. I've a fair idea who to thank." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, on my beach. I've sailors here who'd jump at their own shadows after what the naga did, so keep that creature quiet and close, and we'll get along fine." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, ahoy! Can you shoot naga from the barricade? My sailors can barely shoot straight on a calm sea, never mind with the naga coming up the beach." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, ahoy! If you can conjure fresh water, my crew will love you for it, because we've been rationing what we saved from the Horizon Scout." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, is it? The naga keep my scattered cargo in their camps up the shore, and I want it fetched quietly, not fought over." },
        { id = "h_default", key = true,
          text = "Captain Vanessa Beltis, of the Horizon Scout, or I was, before she went to the bottom. My crew's in shambles, our cargo and passengers are scattered along this beach, and the naga aren't finished with us yet." },
        { id = "h_fight", when = { questActive = TODO_QUEST("A Crew Under Fire") },
          text = "My scouts are watching the mouth of the valley. When they shout, the naga are coming, and we fight at the barricade or we don't fight at all." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Horde or not, I'd hoped for one, because I've sailors on this beach who need more than bandages, and prayers are all I've got left to offer them." },
      },
      again = {
        { id = "h_again", text = "What else? Keep one eye on the valley while we talk." },
        { id = "h_again2", text = "Go on. Talking keeps the crew's spirits up, even if it's only me doing it." },
      },
      choices = {
        { text = "What happened to your ship?", next = "wreck" },
        { text = "The naga seem to want something from that wreck.", next = "naga" },
        { text = "Who were your passengers?", next = "passengers" },
        { text = "Let me tend your wounded.", next = "heal", when = { class = { "PRIEST", "PALADIN", "DRUID", "SHAMAN" } } },
        { text = "Put me on the line facing the water.", next = "warrior_bl", when = { class = "WARRIOR" } },
        { text = "I could help your crew with my magic.", next = "xmage", when = { class = "MAGE" } },
        { text = "What cargo did the naga take?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You seem to blame yourself for the Horizon Scout, Captain.", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could a hunter help hold your barricade, Captain?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why are your sailors so afraid, Captain?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll stand with your crew if they come.", next = "END", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    wreck = {
      big = true,
      lines = { { id = "w_default", fx = { learn = { "horizon_scout" } },
        text = "We were hunting along this coast for somewhere to drop anchor, and the sun was barely down when they came up out of the water. They tore the Scout open below the waterline, and the reef finished what the naga started." } },
      choices = {
        { text = "It wasn't your fault, Captain.", next = "wreck_fault" },
        { text = "How many did you lose?", next = "wreck_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wreck_fault = {
      lines = { { id = "wf_default", text = "It's always the captain's fault, {name}; that's what the word means. I chose this coast, I chose the hour, and I'll carry it whether you forgive me or not." } },
      choices = {
        { text = "Then carry it well, Captain.", next = "BACK", reply = "I will, as best I can. Thank you for not pretending it was anyone else's.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Blame is for the living. Grieve them and move on.", next = "BACK", reply = "Easier said than done, {name}. But I'll try, for the crew's sake.", fx = { affinity = 1, align = { order = -1 } } },
      },
    },
    wreck_lost = {
      lines = { { id = "wl_default", text = "Too many to say without my voice going. I light a lamp at the water's edge each night, one for every name, so they can find the shore if they're looking." } },
      choices = {
        { text = "That's a fine thing to do.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga = {
      lines = { { id = "n_default", fx = { learn = { "spitelash" } },
        text = "I wish I knew. They went through the wreck like thieves through a purse, and whatever they wanted wasn't there, or they wouldn't keep coming back for us." } },
      choices = {
        { text = "Something aboard, then.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    passengers = {
      lines = { { id = "p_default", text = "A paladin, a priest and a mage, among others, each with business in Azshara they didn't care to share with a ship's captain. I didn't ask; you don't, when they pay in advance." } },
      choices = {
        { text = "Some business must have brought them here.", next = "passengers_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    passengers_why = {
      lines = { { id = "pw_default", text = "Ruins, I'd guess, like everyone. Talk to them if they'll talk to you; they might have a request or two, once they've stopped shaking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    heal = {
      lines = { { id = "he_default", text = "Light bless you. Start with the second mate on the point; she's been watching the wreck since dawn and won't admit she's bleeding." } },
      choices = {
        { text = "I'll see to all of them.", next = "BACK", reply = "Bless you, and start with her, please, before she bleeds out pretending. The crew will thank you.", fx = { affinity = 3, align = { light = 1 } },
          journal = { first = "I tended the wounded crew of the Horizon Scout, wrecked off Azshara. Their captain lights a lamp for each of her dead.",
                      third = "{name} tended the wounded survivors of the Horizon Scout on Azshara's shore." } },
        { text = "I'll do what I can, but the fighters first.", next = "BACK", reply = "That's fair, and they'll need to be on their feet when the naga come. Just don't forget the second mate.", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know ships, the sea and this cursed bit of shore. Ask what you like." } },
    background = { { id = "tp_bg", text = "Captain of the Horizon Scout, out of Theramore. I'll be a captain again when I have a ship.", next = "wreck" } },
    advice = { { id = "tp_ad", text = "Never anchor off Azshara after dark. If I'd known that a week ago, I'd still have a ship, and my cabin boy would still have both his boots." } },
    horizon_scout = { { id = "tp_scout", text = "My ship, and the best on the coast, until the reef and the naga had her.", next = "wreck" } },
    spitelash = { { id = "tp_spite", text = "They came out of the water in the dark and took my ship. I'll not forget their faces, if you can call them faces." } },
    waterlords = { { id = "tp_waterlords", text = "There's a water lord on a rock in the bay, a living wave who thinks every ship is a toy. He didn't sink us, but he didn't lift a finger to save us either." } },
    theramore = { { id = "tp_theramore", text = "The Horizon Scout sailed out of Theramore with a good crew and a fair wind, and I'd give anything to sail back with even half of them." } },
    booty_bay = {
      { id = "tp_booty_bay", text = "I put in at Booty Bay once and lost two sailors to the pirates and one to a card game. I'd take those odds again, after this place." },
      { id = "tp_booty_bay2", when = { disposition = { min = 70 } }, text = "Some of my crew were Booty Bay men, and they're the ones who kept their heads when the naga came over the rail. I owe them more than I can ever pay." },
    },
    jaina = { { id = "tp_jaina", text = "Lady Proudmoore gave me the commission and trusted me with the ship, and I failed her. I'll have to look her in the eye someday and tell her so." } },
    _none = { { id = "tp_none", text = "Can't help you there; I know the sea, not the land." } },
  },
}

P:NPC {
  key = "xiggs", id = TODO_NPC("Pilot Xiggs Fuselighter"), name = "Pilot Xiggs Fuselighter",
  bible = "bibles/azshara.md", role = "questgiver", tier = "quest",
  communities = { "ruined_reaches" }, temper = { "jovial", "steady" }, values = { "brave", "loyal" },
  notices = { "race", "craft" },

  impression = {
    first = "Pilot Xiggs Fuselighter dropped out of the sky onto a tiny helipad off Azshara's coast because I fired a flare. He's flying rubbings to Ironforge as a favour to a friend, and seems to love every minute.",
    third = "{name} met Pilot Xiggs Fuselighter, who flies the Explorers' League's rubbings out of Azshara.",
  },

  greetings = {
    { id = "g_default", text = "Been waitin' on ye! Hop to it; the engine doesn't like idlin'." },
    { id = "g_back", when = { metBefore = true }, text = "Back on my helipad, eh? Finest bit of flat rock in Azshara." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Ye'll appreciate a proper flyin' machine, unlike some elves I've met who call it a noisy box." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Don't touch the fuel line, don't touch the rotor, and don't tell me how ye'd have built it better." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The League knows about everythin' an' agrees on nothin'. Some o' them say the stone remembers the Titans, an' the rest say spirits are orc business. I just fly the rubbings." } },
      choices = {
        { text = "The stone remembers. I've heard it myself.", next = "BACK", reply = "Do ye now? Then ye're a better listener than me, an' I'm glad of it. Tell the League, they'll want tae know.", fx = { align = { order = -1 } } },
        { text = "I keep Ironforge's ways. The spirits only lend a hand.", next = "BACK", reply = "That's the way, an' Ironforge will be proud o' ye. The spirits can help, but the stone's the stone.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Once, an' once was plenty! An imp got into the engine an' I thought she'd catch fire over the sea, an' I swear it laughed the whole way down. So keep it on a short leash, if ye please, while I'm flyin' these rubbings north." } },
      choices = {
        { text = "A short leash it is. Your flyer's safe with me.", next = "BACK", reply = "Bless ye, an' my flyer thanks ye too. She's still got scorch marks from the last one.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My imp goes where it pleases. You'll manage.", next = "BACK", reply = "I'll manage, an' so will she, but if she catches fire, ye're walkin' home. Fair warnin'.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Naga, mostly, an' the ghosts o' the Highborne, who don't take kindly tae folk rubbin' their walls wi' charcoal. A warrior's handy, because when they come at ye there's no time for spells, only for standin' yer ground." } },
      choices = {
        { text = "I'll guard whoever takes the rubbings and keep to the job.", next = "BACK", reply = "That's a proper job well done, an' Tymor will be glad o' it. Keep the scholar breathin' an' I'll fly ye both home.", fx = { align = { order = 1 } } },
        { text = "I'll go in swinging and take the rubbings myself after.", next = "BACK", reply = "Ha! That's the dwarven way, an' I'll not argue. Just don't smudge the charcoal, ye great lump.", fx = { align = { order = -1 } } },
        { text = "Something else, Xiggs.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than I'd like. From up there ye can see every naga camp along the shore, an' there's somethin' big sleepin' in the bay that I've seen twice now an' have no wish tae see again. The hippogryphs at Talrendis won't fly over the water after dark either, an' I'm startin' tae think they're right." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "More than I'd like. From up there ye can see every naga camp along the shore, an' ye can bring {pet} along some day to see them too, if it doesn't mind heights." },
      },
      choices = {
        { text = "I'll find the camps on foot and face them head-on.", next = "BACK", reply = "Brave, an' I'll respect it, but mind the big thing in the bay. Ye'll not want tae meet it on foot.", fx = { align = { honor = 1 } } },
        { text = "I'll mark them from the air and strike while they sleep.", next = "BACK", reply = "Smart, an' I'll fly ye over 'em myself. A sleepin' naga's the best kind.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome_xg = {
      lines = {
        { id = "gxg_default", text = "Ha! A gnome designed her, a dwarf built her an' I flew her, an' that's how she's still in one piece. Yer people draw the best plans in the world, but ye can't be trusted near a wrench when ye're excited." },
      },
      choices = {
        { text = "Without our plans, you'd be walking.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Fair enough.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Tymor's a mage in Ironforge, and he reckons these Highborne runes have somethin' tae teach the Mystic Ward. I fly 'em home, he reads 'em, and I'm none the wiser, which suits me fine as long as he pays the fuel." } },
      choices = {
        { text = "Knowledge like that should be studied carefully.", next = "BACK", reply = "Aye, an' Tymor's the man for it. Carefully's the only way he does anythin'.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Old runes are best left in the ruins.", next = "BACK", reply = "Mebbe so, but Tymor's payin' me tae fly 'em, so I'll fly 'em. Ye can argue wi' him in Ironforge.", fx = { align = { order = -1 } } },
        { text = "Fly safe, Xiggs.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The naga and the ghosts don't like visitors, and a dwarf on a helipad can only watch from the sky. A rogue could slip in, take the rubbings, and slip out again, and I'd fly ye home a hero." } },
      choices = {
        { text = "I'll slip in quietly and get them.", next = "BACK", reply = "That's the spirit, an' I'll keep the engine runnin'. In an' out, quiet as a mouse.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll fight my way in if I have to.", next = "BACK", reply = "Ha! A rogue wi' a dwarf's heart, I like it. Just bring the rubbings back in one piece.", fx = { align = { honor = 1 } } },
        { text = "I'll think about it.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Fear's a strong word for a dwarf, but I'll admit I fly higher over the Spitelash than I'd like anyone in Ironforge tae hear about. They've sorceresses down there throwin' spells at anythin' that moves, an' a gyrocopter's no' built tae dodge." } },
      choices = {
        { text = "Fly low and proud. Show them Ironforge isn't afraid.", next = "BACK", reply = "Ha! Easy for ye tae say, wi' yer feet on the ground. I'll fly as low as my nerves allow, which isnae very.", fx = { align = { honor = 1 } } },
        { text = "Stay high and let them waste their spells on empty sky.", next = "BACK", reply = "That's what I do, an' I'll keep doin' it. Let 'em throw their spells at the clouds.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Tymor reckons the old elves wrote down things nobody else remembers, an' these ruins are covered in it, so every rubbing I fly home is a page the world forgot. Some say it's history best left forgotten, mind, given what the Highborne got up tae." } },
      choices = {
        { text = "What the Highborne knew should stay buried with them.", next = "BACK", reply = "Mebbe so, an' some in the League would agree wi' ye. But Tymor's paid for the rubbings, so I'll fly 'em.", fx = { align = { order = 1 } } },
        { text = "History belongs to everyone. Bring every rubbing home.", next = "BACK", reply = "That's the Explorers' League motto near enough, an' I'll drink tae it. Every rubbing, every page.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Knowledge, {g:lad|lass}, and maybe a few relics for the Hall o' Explorers. Tymor reckons the Highborne wrote down what they did before yer people's world broke, and if the rubbings tell us how they did it, maybe we'll know better than to try it again, which yer Circle would like, I'd think." } },
      choices = {
        { text = "Leave the Highborne stones alone. Some knowledge deserves burying.", next = "BACK", reply = "Mebbe they do, but buried things have a way o' gettin' dug up by the wrong folk. Better us than the naga.", fx = { align = { order = 1 } } },
        { text = "Better to learn from their mistakes than repeat them. Keep digging.", next = "BACK", reply = "That's the spirit, an' Tymor would shake yer hand for it. He's got crates o' rubbings already, an' he still wants more.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Never mind the rubbings.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_crew", when = { questDone = TODO_QUEST("A Crew Under Fire") },
          text = "Beltis says ye fought the naga off her crew in the Ruined Reaches, an' I saw it from up top on my rounds. Ye looked like a wee hero from up there, an' I'll tell 'em so in Ironforge." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, wantin' a lift? Fine by me, so long as yer wee beastie doesn't chew the fuel line, because I'll not be explainin' that tae Ironforge." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior, eh? Well, the gyrocopter's a wee thing, but if ye leave the shield on the ground I can just about manage ye, an' the naga'll never see us comin'." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! Ye'll be wantin' tae see the coast from the air, I'll bet, because from up there ye can spot every naga camp along the shore." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, eh? Tymor of the Mystic Ward'll want tae hear about ye, since he's the one sendin' me after these rubbings in the first place." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue! Ye'll be quiet in the ruins, then, which is more than the last lot managed, wi' all their clankin' armour." },
        { id = "h_default", key = true,
          text = "Pilot Xiggs Fuselighter, at yer service. Tymor of the Mystic Ward's got me runnin' rubbings off this coast for the Explorers' League, and I patrol the skies here besides, so if ye've got somethin' for Ironforge, I'm yer dwarf." },
        { id = "h_runes", when = { questActive = TODO_QUEST("Arcane Runes") },
          text = "Got the rubbings? All four runes, Beth'Amara, Jin'yael, Markri and Sael'hai? Good {g:lad|lass}; hand 'em over and I'll have 'em to Tymor before his tea's cold." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, out on the cliffs! Say a word for the gyrocopter, would ye, because the wind off this coast has opinions, an' so do the naga below." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! I'd offer ye a ride, but the gyrocopter's a wee thing, an' all that plate would put the both of us in the bay." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid o' the Circle, flyin' with me over this coast? I've seen yer kind sprout feathers and keep pace wi' me gyrocopter, and I'll not pretend I wasn't jealous." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! Now there's a sight! Keep the lightning away from my flyin' machine, mind, or Tymor'll be pickin' bits o' me out o' the sea." },
      },
      again = { { id = "h_again", text = "Anythin' else, before the naga notice the noise?" } },
      choices = {
        { text = "Why does Tymor want rubbings?", next = "tymor" },
        { text = "Aren't the naga a danger here?", next = "naga" },
        { text = "Tell me about your flying machine.", next = "machine" },
        { text = "She must be running on something powerful, Xiggs.", next = "machine_eng", when = { profession = "Engineering" } },
        { text = "Did a gnome build your flying machine?", next = "gnome_xg", when = { race = "Gnome" } },
        { text = "Who is Tymor, and what does he want with rubbings?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Are the ruins dangerous for the rubbings?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Flying low over the naga must be unnerving.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why does the Explorers' League care about this cursed coast?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The Ruins of Eldarath must be dangerous, Xiggs.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Have you seen much from the air over Azshara?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What does the Explorers' League want with these ruins?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'd guess you've had trouble with demons in your flyer, Xiggs.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the Explorers' League know about dwarf shamans, Xiggs?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Safe flight, Xiggs.", next = "END" },
      },
    },
    tymor = {
      lines = { { id = "t_default", fx = { learn = { "highborne" } },
        text = "The Highborne left runes all over Eldarath, with their rules for magic carved right into the stone for anyone to read. Tymor's mad for the stuff, the League wants to know what the old elves knew, and I owe Tymor a favour, so here I am." } },
      choices = {
        { text = "Why do you owe him a favour?", next = "tymor_favour" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tymor_favour = {
      lines = { { id = "tf_default", text = "Now that's between me, Tymor and a very embarrassin' night in the Stonefire Tavern. Let's say he got me out of a scrape, and leave it there." } },
      choices = { { text = "I'll take your word on that.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    naga = {
      lines = { { id = "n_default", text = "Not to me, they're not. They swim, I fly, and so far the coast's been quiet from up there, which might just mean they keep their heads under the water. The sea's somebody else's watch; mine's the sky." } },
      choices = {
        { text = "That's convenient.", next = "naga_job" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_job = {
      lines = { { id = "nj_default", text = "Convenient's the best kind of job there is, {g:lad|lass}. Ye'll understand when ye're older and yer knees creak in the cold." } },
      choices = {
        { text = "Someone should deal with the naga, though.", next = "BACK", reply = "Aye, someone should, an' I'm sure someone will, eventually. I'll fly 'em there, at least.", fx = { align = { order = 1 } } },
        { text = "Can't argue with that.", next = "BACK", reply = "Ha! Ye've a sensible head on ye, {g:lad|lass}. Ye'll go far, an' slowly.", fx = { affinity = 1, align = { order = -1 } } },
      },
    },
    machine_eng = {
      lines = { { id = "me_default", text = "Ha! Somebody who knows a good engine at last. Thorium coils, a gnomish rotor I'll swear blind I built myself, and enough blasting powder in the tank to see me to Ironforge, or to the moon, dependin' on the weather." } },
      choices = {
        { text = "That's a lot of powder, Xiggs.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Sounds like a fine machine.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    machine = {
      lines = { { id = "m_default", text = "Ironforge's finest, built in the Military Ward's hangar and patched by me in a dozen fields since. She's loud, she's ugly, and she's never once dropped me in the sea, an' no gryphon I ever rode can claim that." } },
      choices = {
        { text = "She's beautiful, Xiggs.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I see a lot from up there, {g:lad|lass}. Ask away." } },
    background = { { id = "tp_bg", text = "A pilot out of Ironforge's Military Ward, flyin' favours for friends and patrols for the King." } },
    advice = { { id = "tp_ad", text = "Stand in the middle of the helipad when ye fire that flare, or I'll fly right past ye." } },
    highborne = { { id = "tp_hb", text = "Old elf wizards with a lot to say on stone. Tymor reads it; I just fly it." } },
    horizon_scout = { { id = "tp_horizon_scout", text = "Saw the wreck of the Horizon Scout from the air, poor lass, broken across the rocks like a toy. Her captain's a brave one, ye'd not catch me sailin' this coast." } },
    magni = { { id = "tp_magni", text = "King Magni's the finest dwarf in all the mountain, and I've flown his letters from one end of Khaz Modan to the other. He tips in ale, which is the proper way." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer fly gryphons and think a machine is an insult, and I fly a machine and think a gryphon's a bird with opinions. We still drink together, which is the important thing." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The gnomes taught me half of what I know about engines, and they lost their whole city to radiation and troggs. Breaks my heart to think of it, it does." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay goblins sold me a gyrocopter part once that exploded on the first test flight. Ye learn a lot about trust when yer beard's on fire." } },
    _none = { { id = "tp_none", text = "Couldn't say. I'm a pilot, not a professor." } },
  },
}
