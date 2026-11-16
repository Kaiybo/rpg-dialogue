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
      text = "A priest. The Circle prayed that one of your kind would come, and here you stand. The how does not matter, only the why." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid of the Circle! Then you know the work I do here, and why I do it so far from the moonglade." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Good; I am one also. We will understand each other, I think, if you understand the prey as well as the kill." },
    { id = "n_pet", cat = "pet", when = { pet = true },
      text = "Your companion walks well beside you. {pet} trusts you, and beasts do not trust lightly here." },
  },

  start = "hello",
  nodes = {
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
        { text = "The Circle is wise. Leave the old ruins sealed.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Old ruins hide power. Someone ought to open them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Ogtinc does not know, but the divine path asks that we try to mend what we have broken. If you truly wish to help, gather what the Circle needs and use your power only against those who would sicken the land further." } },
      choices = {
        { text = "I'll use my power only to protect the land.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll use my power as I see fit.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll think on the divine path.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Circle needs their hearts for its work in Felwood, and Ogtinc grieves each one, for they were beautiful before the corruption touched them. Kill them swiftly and cleanly, and they suffer less, which is the only mercy Ogtinc can give." } },
      choices = {
        { text = "I'll make it swift and clean.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're just beasts. Let them suffer.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll keep it in mind.", next = "BACK" },
      },
    },
    hello = {
      lines = {
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
          text = "A courier has taken the rest to the Circle. Only the drake's blood is missing now, and it waits for you in the drowned temple, with the drake still around it." },
        { id = "h_antlers", when = { questActive = TODO_QUEST("Courser Antlers") },
          text = "Perfect antlers, whole and unbroken, are rare as a quiet night here. Watch the coursers a long while before you choose." },
        { id = "h_waves", when = { questActive = TODO_QUEST("Wavethrashing") },
          text = "The wavethrashers live on the eastern shore, half in the water and half out of it. Fight them on the sand, never in the surf." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Friend. Sit by the fire; I have saved you the dry stone. It is good to see a face I trust on this cliff." },
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
        { text = "What does the Circle want here?", next = "circle" },
        { text = "What waits in the ruins below?", next = "ruins" },
        { text = "The Circle asked for a priest's help.", next = "priest", when = { class = "PRIEST" } },
        { text = "I've come to earn the hunter's charm.", next = "hunter", when = { class = "HUNTER" } },
        { text = "Cenarius guide your hunt, brother.", next = "druid", when = { class = "DRUID" } },
        { text = "The Timbermaw call me friend.", next = "timbermaw", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } } },
        { text = "My people are kin to yours, I've heard.", next = "tauren_og", when = { race = "Tauren" } },
        { text = "Can someone who uses fel help heal the land?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why hunt the coursers at all?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Walk the divine path, Ogtinc.", next = "END", fx = { affinity = 1 } },
      },
    },

    who = {
      big = true,
      lines = {
        { id = "w_default", fx = { learn = { "furbolgs", "cenarion_circle" } },
          text = "Yes. I left my tribe to serve the Circle, because the Circle is fighting the sickness that has been taken from my people. The druids did not ask what I had been, only what I would do, and I have been answering that question ever since." },
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
        { text = "Hold on to that hope.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hope won't save them. Steel might.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
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
        { text = "The needs of the many come first.", next = "BACK", fx = { affinity = -1, align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Then I'll take only what we need.", next = "BACK", fx = { affinity = 2, align = { order = -1 }, trait = { kind = 1 } } },
      },
    },

    circle = {
      lines = {
        { id = "ci_default", text = "A restorative salve for Felwood, made by the old formula: one part poison and two parts cure. The coursers give the first cure, the Highborne dead give the poison, and the last cure is the hardest of all to win." },
      },
      choices = {
        { text = "Why use poison at all?", next = "circle_poison" },
        { text = "What is the last cure?", next = "circle_drake" },
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
        { text = "Do the dead Highborne speak?", next = "ruins_dead" },
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
        { text = "The Light heals all wounds, even the land's.", next = "BACK", fx = { affinity = 2, align = { light = 2 } } },
        { text = "I'll help, but this is the Circle's work, not the Light's.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Why does the Circle need a priest?", next = "priest_why" },
        { text = "Where do we begin?", next = "priest_path" },
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

  topics = {
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
    { id = "g_back", when = { metBefore = true }, text = "Still alive! That's more than most of my customers can say." },
  },

  notice = {
    { id = "n_lw", cat = "profession", when = { profession = "Leatherworking" },
      text = "Ah, a leatherworker. You've got the hands for it, I can tell, and I can teach them to work scale, if you're brave enough to bring me some." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Steal, no; scales don't come off a living dragon unless it wants them to, and it never does. But you can get close enough to see where the weak plates are, and I'll teach you to work them once they're off a corpse, so condolences in advance." } },
      choices = {
        { text = "I'll fight for my scales, fair and square.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll strike while the dragon sleeps.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Keep the condolences handy.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Every one of them, and the list is longer than I'd like, though shorter than my competitor's in Stormwind. Leatherworking is a trade for the living, so I'll teach you what you need and hope your name never goes on that parchment." } },
      choices = {
        { text = "I'll be careful. I don't want to be on that list.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A good mage doesn't die to dragons.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll take my chances.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every name, every night, and I'm not a praying man, so I hope the Light makes allowances for a leatherworker who mumbles. Most of them knew the risk and went anyway, which is either brave or daft, and I've never settled which." } },
      choices = {
        { text = "Brave. They chose the danger knowing what it cost.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Daft. Courage without cunning just fills your list.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Honourable's a big word for a man who cuts up hides for a living, but I don't teach anyone to hunt the young or the sleeping, and I won't work scale from those who do. A dragon can fight back, and that's as close to fair as my trade gets." } },
      choices = {
        { text = "A fair fight is all honour asks. Your rule is sound.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A sleeping dragon is a safe one. Fairness gets people killed.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue. You'll want to sneak past a dragon, I expect, rather than fight one, and I'd call that the most sensible plan anyone's brought me this month." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Dragons can feel magic, so the blues say, and every customer of mine who went hunting with spells in their hands is on my list of the departed." },
        { id = "h_default", key = true,
          text = "Peter Galen, of Stormwind, master of dragonscale leather. I work the scales of the most dangerous prey there is, and I teach anyone who's daft enough to go and get them." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, good, because half my students come back from the dragons needing one, and the other half don't come back at all. The list is by the fire, if you've the stomach for it." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! You'll want dragonscale, I suppose, though plate's more your style; still, if you mean to go hunting dragons, I'd rather you went in armour than in hope." },
      },
      again = { { id = "h_again", text = "What else? I've a hide soaking, so make it quick." },
                { id = "h_again2", text = "Go on, I'm listening, and so's the dragon whelp up on the ridge, probably." } },
      choices = {
        { text = "Why work out here, of all places?", next = "why" },
        { text = "Is dragonscale worth the danger?", next = "scale" },
        { text = "Show me what you teach.", next = "BUSINESS" },
        { text = "Can a rogue really steal a dragon's scales?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you really keep a list of dead customers?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you ever pray for the names on your list?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is hunting dragons for their scales an honourable trade?", next = "xapala", when = { class = "PALADIN" } },
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
    { id = "g_default", text = "Psst! Over here, before the elves see you; I've got a business opportunity with your name on it!" },
    { id = "g_back", when = { metBefore = true }, text = "My favourite employee! Back for more profitable danger?" },
  },

  notice = {
    { id = "n_elf", cat = "race", when = { race = { "NightElf", "Skyborne" } },
      text = "Whoa, an elf! You're not one of Rimtori's, right? You don't look stuck-up enough. No offence." },
    { id = "n_purse", cat = "purse", when = { money = { min = 1000000 } },
      text = "Now there's somebody who knows what a gold coin's for! Let's talk, partner, let's talk." },
  },

  start = "hello",
  nodes = {
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
        { text = "For a fair cut, I'll find your gear myself.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The spirits don't fetch goods, Kim'jael. Show some respect.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Stole it, scattered it, and left me for the naga, and called me little rat while they did it! I need my gear back, every crate of it, and a rogue knows how to find things that aren't where they should be." } },
      choices = {
        { text = "I'll get it back. That's only fair.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll get it back, for a cut.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Little rat, eh?", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A goblin to haul their crates and dig through ruins, that's what, and then they decided they'd rather not pay him. Those runes they were after are worth plenty to the right buyer, and Kim'jael means to find that buyer before anyone else does." } },
      choices = {
        { text = "Those runes belong to whoever uncovered them.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Those runes are dangerous. Leave them in the ruins.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Good luck with that.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Because my equipment's still out there, and a goblin doesn't walk away from that much good gear just because somebody pointed a knife at him. Besides, I've been stabbed at by better than a few sulky elves, though I'll admit I can't remember when." } },
      choices = {
        { text = "Then I'll help you get it back, fair and square.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Take back twice what they took. They owe you that.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Good, you can tell me if this place is cursed, because I've been robbed, stabbed at and called a rat, and I'm starting to take it personally." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! Kim'jael indeed, a rogue! Now you're the sort who knows the value of an employee's equipment, and how easily it goes missing." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Don't tell me, you work for one of those pointy-eared mages too, and you're here to finish what they started. No? Good, because Kim'jael is fresh out of patience for spellcasters." },
        { id = "h_default", key = true,
          text = "They call me Kim'jael, and oh, Kim'jael indeed! It's elvish for little rat, near enough, and those bullies called me that the whole time they were paying me." },
        { id = "h_gear", when = { questActive = TODO_QUEST("Kim'jael Indeed!") },
          text = "My compass, my scope, my stuffed chicken and my wizzlegoober, all sitting in that elf camp. Get them back, and you'll be paid, just like we said." },
        { id = "h_rune", when = { questActive = TODO_QUEST("Kim'jael's \"Missing\" Equipment") },
          text = "The rune, the rune! The naga have it, down in Eldarath, and the elves wanted it badly. Find it, valuable employee, and we'll both be rich, or at least I will." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Would you say something holy over my equipment, once it's back? The elves who hired me said a few words over it too, and every one of them was a curse." },
      },
      again = {
        { id = "h_again", text = "Something more? Talk fast, friend; every minute here costs me a little." },
        { id = "h_again2", text = "Go on, go on. I'm all ears, and the ears are worth a fortune." },
      },
      choices = {
        { text = "Is Azshara cursed, Kim'jael, or just unlucky for you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who hired you?", next = "hired" },
        { text = "What did the elves want here?", next = "treasure" },
        { text = "Why not leave Azshara?", next = "leave" },
        { text = "What's a wizzlegoober?", next = "wizzle" },
        { text = "Funny. A goblin hired by elves, robbed by elves.", next = "gnome_kj", when = { race = "Gnome" } },
        { text = "Did the elves steal your equipment?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What did the elf mages want with you?", next = "xmage", when = { class = "MAGE" } },
        { text = "Why stay in Azshara after the elves turned on you?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
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
      lines = { { id = "hr_default", text = "Isn't it? You can't trust an elf, I always say, I said it before and I'll say it again. Well, I said it after, mostly, but that's when it counts." } },
      choices = {
        { text = "Betrayal deserves payback.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "A bargain's a bargain. They should've paid.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
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
      choices = { { text = "Fine. Something else.", next = "BACK" } },
    },
    leave = {
      lines = { { id = "l_default", text = "And go back to Booty Bay with nothing but a story about elves? The Baron would laugh me off the pier. No, I leave Azshara richer than I came, or I don't leave at all." } },
      choices = {
        { text = "That's the spirit.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "That's how goblins end up dead.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
      },
    },
    wizzle = {
      lines = { { id = "w_default", text = "It's a... well, it goobles the wizzles, obviously. Very technical, very expensive, very mine. Don't ask an engineer to explain an engineer's tools, partner; we'd be here all week." } },
      choices = { { text = "Fair enough.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Information costs money, partner, but for you, a free sample. Here's what I've got." } },
    background = { { id = "tp_bg", text = "A Booty Bay goblin with an eye for treasure and terrible taste in employers.", next = "hired" } },
    advice = { { id = "tp_ad", text = "Get paid half up front. Then get the other half up front too, if you can." } },
    rimtori = { { id = "tp_rimtori", text = "She hired me, she cheated me, she tried to have me killed. I'd write her a bad reference if anyone asked.", next = "hired" } },
    eldarath = { { id = "tp_eld", text = "Naga, ghosts and treasure. Two out of three of those I could do without." } },
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
      text = "A healer, thank the Light! We had a priest among the passengers, but she's worn to the bone, and half the crew needs mending." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like you've been through a wreck yourself. Sit down a moment before the naga come back." },
  },

  start = "hello",
  nodes = {
    warrior_bl = {
      lines = {
        { id = "wbl_default", text = "Gladly, and I'll put my bosun beside you, because he's the only one of my crew who can still swing an axe straight. The naga come up out of the surf at night, so stand with your back to the fire and your eyes on the waves." },
      },
      choices = {
        { text = "I'll hold until your crew is safe.", next = "BACK", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "Better to strike their camp before they come.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Food and water would be a blessing, and a fireball for the next naga raid would be better still. My sailors are tough, but they're tired, and every hand that helps us is one less lamp I have to light." } },
      choices = {
        { text = "I'll help your crew however I can.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your crew is your responsibility, Captain.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll see what I can do.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Passengers' goods, mostly, and some crates I'm not at liberty to discuss. The naga don't know what they've got, and I'd like it back before they figure it out, so a quiet hand would serve better than a loud one." } },
      choices = {
        { text = "I'll get it back quietly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "What's in those crates you won't discuss?", next = "BACK" },
        { text = "Tell your passengers they owe me.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, ahoy! If you can conjure fresh water, my crew will love you for it, because we've been rationing what we saved from the Horizon Scout." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, is it? The naga keep my scattered cargo in their camps up the shore, and I'd rather it was fetched quietly than fought over." },
        { id = "h_default", key = true,
          text = "Captain Vanessa Beltis, of the Horizon Scout, or I was, before she went to the bottom. My crew's in shambles, our cargo and passengers are scattered along this beach, and the naga aren't finished with us yet." },
        { id = "h_fight", when = { questActive = TODO_QUEST("A Crew Under Fire") },
          text = "My scouts are watching the mouth of the valley. When they shout, the naga are coming, and we fight at the barricade or we don't fight at all." },
      },
      again = {
        { id = "h_again", text = "What else? Keep one eye on the valley while we talk." },
        { id = "h_again2", text = "Go on. Talking keeps the crew's spirits up, even if it's only me doing it." },
      },
      choices = {
        { text = "What happened to your ship?", next = "wreck" },
        { text = "What do the naga want?", next = "naga" },
        { text = "Who were your passengers?", next = "passengers" },
        { text = "Let me tend your wounded.", next = "heal", when = { class = { "PRIEST", "PALADIN", "DRUID", "SHAMAN" } } },
        { text = "Put me on the line facing the water.", next = "warrior_bl", when = { class = "WARRIOR" } },
        { text = "Could I help your crew with my magic?", next = "xmage", when = { class = "MAGE" } },
        { text = "What cargo did the naga take?", next = "xrogue", when = { class = "ROGUE" } },
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
        { text = "Then carry it well, Captain.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Blame is for the living. Grieve them and move on.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
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
        { text = "What business could bring them here?", next = "passengers_why" },
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
        { text = "I'll see to all of them.", next = "BACK", fx = { affinity = 3, align = { light = 1 } },
          journal = { first = "I tended the wounded crew of the Horizon Scout, wrecked off Azshara. Their captain lights a lamp for each of her dead.",
                      third = "{name} tended the wounded survivors of the Horizon Scout on Azshara's shore." } },
        { text = "I'll do what I can, but the fighters first.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know ships, the sea and this cursed bit of shore. Ask what you like." } },
    background = { { id = "tp_bg", text = "Captain of the Horizon Scout, out of Stormwind's waters. I'll be a captain again when I have a ship.", next = "wreck" } },
    advice = { { id = "tp_ad", text = "Never anchor off Azshara after dark. If I'd known that a week ago, I'd still have a ship." } },
    horizon_scout = { { id = "tp_scout", text = "My ship, and the best on the coast, until the reef and the naga had her.", next = "wreck" } },
    spitelash = { { id = "tp_spite", text = "They came out of the water in the dark and took my ship. I'll not forget their faces, if you can call them faces." } },
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
    gnome_xg = {
      lines = {
        { id = "gxg_default", text = "Ha! A gnome designed her, a dwarf built her an' I flew her, which is why she's still in one piece. Yer people draw the best plans in the world, but ye can't be trusted near a wrench when ye're excited." },
      },
      choices = {
        { text = "Without our plans, you'd be walking.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Fair. Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Tymor's a mage in Ironforge, and he reckons these Highborne runes have somethin' tae teach the Mystic Ward. I fly 'em home, he reads 'em, and I'm none the wiser, which suits me fine as long as he pays the fuel." } },
      choices = {
        { text = "Knowledge like that should be studied carefully.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Old runes are best left in the ruins.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Fly safe, Xiggs.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The naga and the ghosts don't like visitors, and a dwarf on a helipad can only watch from the sky. A rogue could slip in, take the rubbings, and slip out again, and I'd fly ye home a hero." } },
      choices = {
        { text = "I'll slip in quietly and get them.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll fight my way in if I have to.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll think about it.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Fear's a strong word for a dwarf, but I'll admit I fly higher over the Spitelash than I'd like anyone in Ironforge tae hear about. They've sorceresses down there throwin' spells at anythin' that moves, an' a gyrocopter's no' built tae dodge." } },
      choices = {
        { text = "Fly low and proud. Show them Ironforge isn't afraid.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Stay high and let them waste their spells on empty sky.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Tymor reckons the old elves wrote down things nobody else remembers, an' these ruins are covered in it, so every rubbing I fly home is a page the world forgot. Some say it's history best left forgotten, mind, given what the Highborne got up tae." } },
      choices = {
        { text = "What the Highborne knew should stay buried with them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "History belongs to everyone. Bring every rubbing home.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, eh, lad or lass? Tymor of the Mystic Ward'll want tae hear about ye, since he's the one sendin' me after these rubbings in the first place." },
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
      },
      again = { { id = "h_again", text = "Anythin' else, before the naga notice the noise?" } },
      choices = {
        { text = "Why does Tymor want rubbings?", next = "tymor" },
        { text = "Aren't the naga a danger here?", next = "naga" },
        { text = "Tell me about your flying machine.", next = "machine" },
        { text = "What's she running on, Xiggs?", next = "machine_eng", when = { profession = "Engineering" } },
        { text = "Did a gnome build your flying machine?", next = "gnome_xg", when = { race = "Gnome" } },
        { text = "Who is Tymor, and what does he want with rubbings?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Are the ruins dangerous for the rubbings?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you fear the naga when you fly low?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why does the Explorers' League care about this cursed coast?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Safe flight, Xiggs.", next = "END" },
      },
    },
    tymor = {
      lines = { { id = "t_default", fx = { learn = { "highborne" } },
        text = "The Highborne left runes all over Eldarath, with their rules for magic carved right into the stone for anyone to read. Tymor's mad for the stuff, and the League wants to know what the old elves knew, so here I am." } },
      choices = {
        { text = "Why do you owe him a favour?", next = "tymor_favour" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tymor_favour = {
      lines = { { id = "tf_default", text = "Now that's between me, Tymor and a very embarrassin' night in the Stonefire Tavern. Let's say he got me out of a scrape, and leave it there." } },
      choices = { { text = "Fair enough.", next = "BACK", fx = { trait = { witty = 1 } } } },
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
        { text = "Someone should deal with the naga, though.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Can't argue with that.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
      },
    },
    machine_eng = {
      lines = { { id = "me_default", text = "Ha! A proper question at last. Thorium coils, a gnomish rotor I'll swear blind I built myself, and enough blasting powder in the tank to see me to Ironforge, or to the moon, dependin' on the weather." } },
      choices = {
        { text = "That's a lot of powder, Xiggs.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Sounds like a fine machine.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    machine = {
      lines = { { id = "m_default", text = "Ironforge's finest, built in the Military Ward's hangar and patched by me in a dozen fields since. She's loud, she's ugly, and she's never once dropped me in the sea, which is more than I can say for gryphons." } },
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
    _none = { { id = "tp_none", text = "Couldn't say. I'm a pilot, not a professor." } },
  },
}
