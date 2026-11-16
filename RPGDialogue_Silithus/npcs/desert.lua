-- The rest of the desert: Valor's Rest at the top of the Un'Goro road, a deserter's cave in the eastern hills, and Bronzebeard's Encampment in the south. Voice: bibles/silithus.md
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "layo", id = TODO_NPC("Layo Starstrike"), name = "Layo Starstrike", title = "The Cenarion Circle",
  bible = "bibles/silithus.md", role = "questgiver", tier = "major",
  communities = { "valors_rest" }, temper = { "gentle", "steady" }, values = { "kind", "wise", "devout" },
  notices = { "class", "race", "status" },

  impression = {
    first = "Layo Starstrike keeps Valor's Rest, a graveyard at the edge of Silithus, and speaks of the dead with more tenderness than most people spare the living. He warned me not to wake the past.",
    third = "{name} met Layo Starstrike, the Cenarion Circle's agent at Valor's Rest, who tends the graves of those who fell in the wastes.",
  },

  greetings = {
    { id = "g_default", text = "Walk softly here, friend, for this is a resting place, and the wastes outside are loud enough." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and in one piece. That isn't nothing, out here." },
    { id = "g_freed", when = { questDone = TODO_QUEST("The Spirits of Southwind") }, text = "Southwind is quieter since you went there. I walk the ruins some nights just to hear it." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, at Valor's Rest. The dead here have waited a very long time for someone to say the words over them." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid of the Circle. Then you'll feel how thin the ground is here, between what was and what is." },
    { id = "n_horde", cat = "status", when = { faction = "Horde" },
      text = "Horde colours, at a night elf graveyard. Don't look so wary; the dead don't care, and neither do I." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because they fell fighting in this desert's wars, old and new, and the sands still carry the hum of what they fought. I think they feel the hives stirring as surely as I do, and they cannot rest while the living stand guard without them." } },
      choices = {
        { text = "The dead deserve peace. Help them rest.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let them stay restless. The living may need them yet.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They died badly, when the silithid came up out of the sand, and nobody buried them properly. I tend their graves and pray over them, and some nights I think they hear me, though I cannot be sure." } },
      choices = {
        { text = "Your care honors them. I'll tread lightly.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead are dead. They don't need prayers.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll be quiet here.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not yet, but the Twilight's Hammer pass close by on their way west, and I do not trust what they might want with the dead. So I keep my watch, and I pray that it is enough." } },
      choices = {
        { text = "Grave robbers deserve worse than a chase.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The dead can't miss what they don't have.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll keep my hands to myself.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman comes to Valor's Rest. The spirits of the fallen here are restless, {class}, and perhaps they would speak more easily to you than to me." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, at Valor's Rest. The dead here were soldiers and farmers, not spellcasters, but they rest uneasily all the same, and I would ask you to tread quietly." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, among the graves. I hope you are not here to rob them, because there is nothing left to take, and the dead have suffered enough." },
        { id = "h_default", key = true,
          text = "The past lives in these wastes, {class}, and we must be careful not to wake it. I am Layo Starstrike, and I keep watch here at Valor's Rest for the Cenarion Circle, over the graves and over the desert beyond them." },
        { id = "h_wasteland", tags = { "news" }, when = { questActive = TODO_QUEST("Wasteland") },
          text = "Rabine sent you, did he? Then you're welcome here, as much as this desolate place can welcome anyone." },
        { id = "h_spirits", tags = { "news" }, when = { questActive = TODO_QUEST("The Spirits of Southwind") },
          text = "The ruins of Southwind lie to the southwest. The spirits there wander without rest, druids and sentinels both; free them, and be gentle about it, if you can." },
        { id = "h_tower", tags = { "news" }, when = { questActive = TODO_QUEST("Hive in the Tower") },
          text = "The hive in Southwind's tower answers to the dead's wailing, so it will answer to you. Climb, stir it up, and bring back anything strange you find, but come back first." },
        { id = "h_object", tags = { "news" }, when = { questRecent = { TODO_QUEST("Hive in the Tower"), days = 5 } },
          text = "I keep turning that thing you found over in my hands. It's crusted with chitin like a beetle's shell, but there's a book underneath, I'd swear it, and a book from Southwind would be a window into the past." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "It does me good to see you, {name}. Sit a while among the stones; they're better company than you'd think." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The graves are patient." },
        { id = "h_again2", text = "Go on. I don't get many visitors who want to talk." },
      },
      choices = {
        { text = "Why do the dead of Valor's Rest not sleep?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What is Valor's Rest?", next = "rest" },
        { text = "What happened at Southwind?", next = "southwind" },
        { text = "Why does the Circle watch Silithus?", next = "watch" },
        { text = "Who is this Umber you want me to see?", next = "umber", when = { questDone = TODO_QUEST("Hive in the Tower") } },
        { text = "Let me say the words over the dead of Southwind.", next = "priest", when = { class = "PRIEST" } },
        { text = "The land here is wounded. Can it heal?", next = "druid", when = { class = "DRUID" } },
        { text = "Does the Circle mind the Horde here?", next = "horde", when = { faction = "Horde" } },
        { text = "Rabine Saturna sends his regards.", next = "rabine", when = { questDone = TODO_QUEST("Wasteland") } },
        { text = "Would you free my soul too, druid?", next = "x_forsaken", when = { race = "Scourge" } },
        { text = "I bind souls, druid. Does that trouble you?", next = "x_warlock", when = { class = "WARLOCK" } },
        { text = "Why do the dead of Southwind rest uneasily?", next = "xmage", when = { class = "MAGE" } },
        { text = "Has anyone tried robbing the graves?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Elune keep you, Layo.", next = "END", fx = { affinity = 1 } },
      },
    },

    rest = {
      lines = { { id = "r_default", fx = { learn = { "cenarion_circle" } },
        text = "The last resting place of those who fall in the wastes, whoever they were. The Circle cut the road down into Un'Goro so our supplies could reach us, and the graveyard grew beside it, one stone at a time." } },
      choices = {
        { text = "Who tends the graves?", next = "rest_names" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rest_names = {
      lines = { { id = "rn_default", text = "I do, when there's time. I don't know all their names, which troubles me more than it should; I say what I know over the ones I don't, and hope it counts." } },
      choices = {
        { text = "It counts, Layo.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    southwind = {
      big = true,
      lines = {
        { id = "s_default", key = true, fx = { learn = { "southwind" } },
          text = "Southwind Village was a base of our people in Silithus, long ago, and the hives overran it. I can only imagine how it ended, and I try not to, because the dead there still remember, and they haven't stopped screaming." },
        { id = "s_freed", when = { questDone = TODO_QUEST("The Spirits of Southwind") },
          text = "You've freed many of them, and you learned what I feared: the great hive beside the village is what destroyed it, and it's still there, waiting for anyone who comes too close." },
      },
      choices = {
        { text = "Who are the spirits there?", next = "southwind_spirits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    southwind_spirits = {
      lines = { { id = "ss_default", text = "Druids and sentinels, tortured and wandering, unable to leave the place where they fell. Alliance or Horde, it makes no difference: no one deserves to be trapped in the world like that." } },
      choices = {
        { text = "Is there something you're not telling me?", tag = "Persuade", next = "layo_fear",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = { "PRIEST", "DRUID" } }, { questDone = TODO_QUEST("The Spirits of Southwind") } } } },
          fail = { next = "southwind_wait", fx = { affinity = -1 } } },
        { text = "Then I'll set them free.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    layo_fear = {
      big = true,
      lines = { { id = "lf_default", text = "There is. I don't believe the bugs did all of it alone. The hives are sensitive to everything around them, and something stirred that one into the village, as surely as you stirred the tower, and I'm afraid someone opened a door for them, and may be opening others now." } },
      choices = {
        { text = "The cult in the west?", next = "BACK", fx = { trait = { curious = 1 }, learn = { "twilights_hammer" } } },
        { text = "Then I'll watch for open doors.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
      },
    },
    southwind_wait = {
      lines = { { id = "sw_default", text = "Nothing I'm ready to say aloud, I'm afraid. Free the spirits first, and then perhaps I'll be braver." } },
      choices = { { text = "I understand.", next = "BACK" } },
    },

    watch = {
      big = true,
      lines = { { id = "w_default", key = true, fx = { learn = { "ahn_qiraj", "silithid" } },
        text = "Because few know that our ancestors fought a war here, against something alien and malign, and sealed it away behind the Scarab Wall. Now the hives are swelling and something is stirring them, and the Circle means to end a threat that should have died generations ago." } },
      choices = {
        { text = "Were you here for that war?", next = "watch_young" },
        { text = "Some things should stay buried, sealed or not.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then let's dig it up and finish it properly.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_young = {
      lines = { { id = "wy_default", text = "No, I'm young, as our people count it, and I was born long after the wall went up. But parts of this desert look like pictures of that forgotten time, and I've learned to walk through them quietly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    umber = {
      lines = { { id = "u_default", text = "The Circle's archivist in Nighthaven. Touched, I'll grant you, and he talks more than a flock of starlings, but brilliant; he's rescued books in worse shape than that shell. If anyone can open it without destroying what's inside, he can." } },
      choices = {
        { text = "Touched?", next = "umber_touched" },
        { text = "Something else.", next = "BACK" },
      },
    },
    umber_touched = {
      lines = { { id = "ut_default", text = "He'll tell you exactly how you smell when you walk in, and he won't mean it unkindly. Take it in good grace; he's the best friend a ruined book ever had." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    priest = {
      lines = { { id = "p_default", text = "Would you? I've no prayers of my own that reach them, only Elune's, and they don't seem to hear her any more. Say what you like over them; it's the kindness that matters, not the words." } },
      choices = {
        { text = "I'll pray them to rest, not cut them down.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, standing = { valors_rest = 2 } },
          journal = { first = "At Valor's Rest I prayed over the restless dead of Southwind, and Layo Starstrike stood beside me with his head bowed.",
                      third = "{name} prayed over the restless dead of Southwind at Valor's Rest, with Layo Starstrike beside them." } },
        { text = "If prayer fails, the blade will free them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = { { id = "d_default", text = "Slowly, if at all. The land here was scarred by a war before our grandmothers were born, and the hives keep the scars open. But I've seen grass come back around the graves, a little each spring, and that's what keeps me here." } },
      choices = {
        { text = "Then we'll tend it, a little at a time.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = { { id = "ho_default", text = "Not in the least. The Circle has tauren in it as well as kaldorei, and the bugs don't read banners. Free one tortured spirit at Southwind and you've done more for my people than any treaty." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    rabine = {
      lines = {
        { id = "ra_default", text = "Rabine has a long memory and a short way of saying things, and he trusts very few people. If he trusted you with his letter, I'll trust you with this desert." },
        { id = "ra_reliquary", when = { questDone = TODO_QUEST("A Reliquary of Purity") },
          text = "He sent you to Southwind for that reliquary, I hear, the one he'd kept secret all this while. I don't blame him for keeping it quiet; in Silithus, the less the enemy knows, the longer we live." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_forsaken = {
      lines = {
        { id = "xf_default", text = "I believe every soul deserves its rest, whatever banner it fell under, but I would not presume to tell you that yours is restless. You walk, you speak and you chose to come here, and that is more freedom than the dead of Southwind were ever given." },
      },
      choices = {
        { text = "I'm free enough as I am. Leave my soul be.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Perhaps one day I'll ask you for that rest.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Something else, Layo.", next = "BACK" },
      },
    },
    x_warlock = {
      lines = {
        { id = "xwl_default", text = "It does, and I would be lying if I said otherwise, here among graves I have sworn to keep. But you came to Valor's Rest and told me plainly, and I would rather speak with an honest warlock than a dishonest priest." },
      },
      choices = {
        { text = "The souls I take belong to my enemies.", next = "x_warlock_enemies" },
        { text = "Power is power, druid.", next = "BACK", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_warlock_enemies = {
      lines = { { id = "xwe_default", text = "So the Twilight's Hammer would have said of the druids and sentinels they tortured at Southwind. I do not say you are like them, only that the reasoning sounds the same, and I hope you will think on it." } },
      choices = {
        { text = "I'll think on it, Layo.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Their reasoning isn't my concern. My enemies are.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know the graves, the ruins and the roads between them. Ask about any of these." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you, I'll even speak of the things I usually keep to myself. Which would you hear?" },
    },
    background = { { id = "tp_bg", text = "A druid of the Circle, younger than I look, sent here because someone had to keep watch and I was foolish enough to volunteer." } },
    advice = { { id = "tp_ad", text = "If you hear weeping in the ruins, don't follow it. Mark the place, and come and tell me." } },
    southwind = { { id = "tp_southwind", text = "Our old village to the southwest. Its dead are my charge now.", next = "southwind" } },
    ahn_qiraj = { { id = "tp_aq", text = "The city behind the Scarab Wall. I've seen the wall from a distance, and that was close enough." } },
    cenarion_circle = { { id = "tp_circle", text = "We argue, between Darnassus and Moonglade, but out here the Circle is one thing: the people who stayed." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. Cenarion Hold might; it's down the road, in the heart of the desert." } },
  },
}

P:NPC {
  key = "ortell", id = TODO_NPC("Hermit Ortell"), name = "Hermit Ortell",
  bible = "bibles/silithus.md", role = "questgiver", tier = "major",
  temper = { "cowardly", "sharp" }, values = { "cunning", "curious" },
  notices = { "class", "race" },

  impression = {
    first = "Hermit Ortell deserted the Twilight's Hammer and now hides in a cave, jumping at shadows and very pleased with his own cleverness. He told the cult he's in Westfall, and he's proud of it.",
    third = "{name} met Hermit Ortell, a deserter from the Twilight's Hammer hiding in the hills of Silithus.",
  },

  greetings = {
    { id = "g_default", text = "Stay right where you are, stranger, and tell me who sent you." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you, back already. Come in, come in, and keep away from the cave mouth." },
    { id = "g_purpose", when = { questDone = TODO_QUEST("A Terrible Purpose") }, text = "Any word from the Circle? Have they burned the camps yet? I've been sleeping better, a little." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! Don't stand there glowing at me; the cult used to make us spit when your sort was mentioned, and the habit's hard to break." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human face, out here. Don't tell me you're from the cult, because I've had a long week and I haven't the strength to run." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Summoned things, mostly, and read from books that made my head hurt just to look at them. I was never one of the clever ones, you understand, but I heard the screaming at night, and that's when I knew it was time to leave." } },
      choices = {
        { text = "You did right to leave. That took courage.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You were part of it. Cook or not.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "That's a dark story.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Robes, a medallion, and the patience to chant at nothing for hours on end, which is more than I ever had. Get the words wrong once and they'll know you, so a rogue had best be a quick study." } },
      choices = {
        { text = "A good disguise is worth a hundred swords.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather face them openly than chant for them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll leave the chanting to them.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! The Hammer had plenty of those, and they were the worst of the lot, always muttering about the Old Gods and drawing circles in the sand." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You'd make a fine spy among the Hammer, you would, if you could stand the chanting, which I couldn't, and that's why I'm here." },
        { id = "h_default", key = true,
          text = "I've no business with strangers, so if you've come to drag me back to my brothers in the Hammer, you'll find I bite. If you haven't, well, an enemy of theirs is a friend of mine, so talk quickly." },
        { id = "h_deserter", tags = { "news" }, when = { questActive = TODO_QUEST("The Deserter") },
          text = "The dwarf at the Hold sent you? The one with all the rocks? Show me what you've brought, then, and keep your voice down." },
        { id = "h_lexicon", tags = { "news" }, when = { questActive = TODO_QUEST("The Twilight Lexicon") },
          text = "Three chapters, held by three Twilight Keepers in three camps, because the Hammer trusts nobody, not even itself. Bring me all three and I'll make that tablet sing." },
        { id = "h_believers", when = { questActive = TODO_QUEST("True Believers") },
          text = "Any encrypted texts yet? I'm dying to read this month's True Believer; it's the only way I'll know if they've stopped looking for me." },
        { id = "h_purpose", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Terrible Purpose"), days = 7 } },
          text = "Did the Commander read it? Did he understand it? Of course he did; I translated it beautifully, once I'd worked out which chapter went first." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, before someone sees your shadow at the door." },
        { id = "h_again2", text = "Go on, go on. I've had nobody to talk to for months but my own echo." },
      },
      choices = {
        { text = "Larksbane sent me. I mean you no harm.", next = "peace", when = { questActive = TODO_QUEST("The Deserter") } },
        { text = "Why does the cult hunt you?", next = "hunted" },
        { text = "What is the Twilight's Hammer, really?", next = "cult" },
        { text = "How does their code work?", next = "code", when = { any = { { questActive = TODO_QUEST("The Twilight Lexicon") }, { questDone = TODO_QUEST("The Twilight Lexicon") } } } },
        { text = "What's in this True Believer of theirs?", next = "bulletin", when = { any = { { questActive = TODO_QUEST("True Believers") }, { questDone = TODO_QUEST("True Believers") } } } },
        { text = "The cult hates the Light, doesn't it?", next = "priest", when = { class = "PRIEST" } },
        { text = "Another human, hiding in a desert cave?", next = "human", when = { race = "Human" } },
        { text = "Would the cult have welcomed someone like me?", next = "x_warlock", when = { class = "WARLOCK" } },
        { text = "The cult worships the elements. My people respect them.", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "What did the Twilight's Hammer mages do?", next = "xmage", when = { class = "MAGE" } },
        { text = "What would a spy need to fool the Hammer?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I'll leave you to your hiding.", next = "END" },
      },
    },

    peace = {
      lines = { { id = "pe_default", text = "The dwarf. Fine, fine, then you're a friend, or near enough. Come in, and don't touch the scrolls; they're in an order, even if it doesn't look like it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    hunted = {
      big = true,
      lines = { { id = "hu_default", text = "Because the Twilight's Hammer doesn't let anyone leave. They've hunted me from camp to camp like a beast, and I'd be dead by now if I weren't cleverer than every one of them put together." } },
      choices = {
        { text = "How have you stayed hidden?", next = "hunted_westfall" },
        { text = "Why did you join them in the first place?", tag = "Intimidate", next = "ort_why",
          check = { pass = { any = { { power = { "above", "far_above" } }, { trait = "stern" }, { class = { "WARRIOR", "PALADIN" } } } } },
          fail = { next = "ort_out", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunted_westfall = {
      lines = { { id = "hw_default", text = "Ha! They think I'm hiding in a cave in Westfall, of all places, because that's what I let them overhear. Somewhere in Westfall there's a very confused band of cultists searching a very empty cave, and I hope it's raining." } },
      choices = {
        { text = "Your secret's safe with me, hermit.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A secret like that is worth coin. Remember it.", next = "BACK", fx = { affinity = -2, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ort_why = {
      big = true,
      lines = { { id = "ow_default", text = "Put that look away! I'd had bad luck all my life, and they told me the end of the world would make sense of it. Then I watched them give a man to the elementals for asking one question too many, and I ran that night and haven't stopped." } },
      choices = {
        { text = "Running took courage, Ortell.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Joining took foolishness.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ort_out = {
      lines = { { id = "oo_default", text = "That's my business and nobody else's. Ask me something useful or go and stand somewhere else; you're blocking my light." } },
      choices = { { text = "As you like.", next = "BACK" } },
    },

    cult = {
      big = true,
      lines = { { id = "cu_default", key = true, fx = { learn = { "twilights_hammer" } },
        text = "A cult that wants the world broken, and believes it'll be rewarded for helping. Here in Silithus they camp around wind stones and serve elemental masters who speak through them, and above those masters, they whisper about older ones they don't dare name." } },
      choices = {
        { text = "What do they mean to do here?", next = "cult_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult_end = {
      lines = {
        { id = "ce_default", text = "Help whatever's in this desert wake up, and be standing close by when it does, so it'll know them. That's the plan, as far as anyone below the officers knows it." },
        { id = "ce_purpose", when = { questDone = TODO_QUEST("A Terrible Purpose") },
          text = "You've read what was on that tablet, or the Commander has, so you know more than most of the cult does. I'd sleep with a candle lit, if I were you." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    code = {
      lines = { { id = "co_default", text = "The Twilight Lexicon: the book their scribes use to hide their messages, split in three chapters so no one keeper can read everything. You swap words from one chapter with words from another in a pattern, and out comes sense." } },
      choices = {
        { text = "What pattern?", next = "code_muddle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    code_muddle = {
      lines = { { id = "cm_default", text = "Every third word from the second chapter, then every other word from the first, or possibly the other way round. I get there in the end, so don't look at me like that." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    bulletin = {
      lines = { { id = "b_default", text = "The True Believer, a little coded bulletin the cult passes round every month. If they find me or give up looking, it'll say so, and the rest is full of things a clever person can use; send me their texts, and I'll post you anything worth having." } },
      choices = {
        { text = "You post letters? From here?", next = "bulletin_post" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bulletin_post = {
      lines = { { id = "bp_default", text = "Months of hiding in a desert make a man very good at not being seen, and the Hold's mailbox is only a little walk at night. Nobody suspects the hermit; that's the whole point of being one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "pr_default", text = "Hates it? They laugh at it, which is worse. They say the Light's a candle in a storm, and they're waiting for the storm, and they used to make the new ones say so aloud." } },
      choices = {
        { text = "The Light forgives those who turn back, Ortell.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Forgiveness is earned, and you've earned none yet.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    human = {
      lines = { { id = "hm_default", text = "We do get everywhere, don't we? Like rats, and cultists. I'd go home if I had one left that the Hammer didn't know about." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_warlock = {
      lines = {
        { id = "xw_default", text = "Welcomed you? They'd have handed you a robe and a candle and a seat near the front, and then they'd have watched you very closely indeed. The Hammer loves anyone who can talk to things that shouldn't be talked to, right up until you start asking what those things are saying back." },
      },
      choices = {
        { text = "I'd have taken the robe and robbed them blind.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd never kneel to madmen like that.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_shaman = {
      lines = {
        { id = "xs_default", text = "Respect, yes, and that's the whole difference, isn't it? The cult doesn't listen to the wind or the stone; it wants the great lords of fire and air to come and end everything, and it thinks kneeling low enough will earn it mercy." },
      },
      choices = {
        { text = "The elemental lords won't spare anyone.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Maybe the spirits were listening and chose not to answer.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know the cult from the inside, which is more than anyone else in this desert can say. Ask, and keep your voice down." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you, I'll even tell you the things I'm ashamed of knowing. Pick one." },
    },
    background = { { id = "tp_bg", text = "A man who made one very bad choice and one very good one, in that order. The rest isn't worth hearing." } },
    advice = { { id = "tp_ad", text = "Never let anyone overhear where you're really going. Let them overhear somewhere else entirely." } },
    twilights_hammer = { { id = "tp_hammer", text = "My old family, and they want me back, in pieces.", next = "cult" } },
    abyssal_council = { { id = "tp_council", text = "The voices in the wind stones. I never heard one myself, thank the stars; only the officers do." } },
    ortell = { { id = "tp_ortell", text = "That's me. Don't say it so loudly." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I make a point of hearing about everything." } },
  },
}

P:NPC {
  key = "rutgar", id = TODO_NPC("Rutgar Glyphshaper"), name = "Rutgar Glyphshaper",
  bible = "bibles/silithus.md", role = "scholar", tier = "quest",
  communities = { "bronzebeard_camp" }, temper = { "gruff", "proud" }, values = { "brave", "curious" },
  notices = { "race", "status" },

  impression = {
    first = "Rutgar Glyphshaper runs Bronzebeard's Encampment while Brann is off getting lost again. He's gruff, impatient, and certain they're onto something huge that Ironforge won't send an army for.",
    third = "{name} met Rutgar Glyphshaper, the Explorers' League dwarf who holds Bronzebeard's Encampment in the south of Silithus.",
  },

  greetings = {
    { id = "g_default", text = "Bronzebeard's gone missing again, if you're looking for him. If ye're not, welcome." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Grab a crate, mind the monkey." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Now there's a proper face! Tell me ye've come with a letter from Ironforge saying the army's on its way, though I can see from your face ye haven't." },
    { id = "n_alliance", cat = "status", when = { faction = "Alliance" },
      text = "Alliance! Good, maybe ye can tell your lords we're still out here, since they've stopped reading our letters." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Glyphs, mostly, carved by hands that weren't troll nor elf, and stonework that runs deeper than any shaft we've sunk. Whatever built under Silithus built big, and I'll wager my beard that's what the bugs are guarding." } },
      choices = {
        { text = "Some things are buried for good reason. Leave them be.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Dig deeper. Whatever's down there should see daylight.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Ruins older than Ironforge, an' carvings that say there's somethin' big under the Scarab Wall, bigger than anyone's guessed. Brann'd know more, if he'd stay put long enough tae tell me, but he's off chasin' some new lead as usual." } },
      choices = {
        { text = "This should be shared with Ironforge, quickly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Keep it quiet until you know more.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Brann always finds trouble.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Tablets, carvings, an' maybe somethin' that'll explain what the Qiraji are plannin'. The bugs don't care for scholars, so a rogue who can slip in an' out would save us a lot o' trouble an' a few dwarves." } },
      choices = {
        { text = "I'll get you those tablets, quietly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll get them if the price is right.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll think about it.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Old ruins half under the sand, an' carvings on 'em that nae dwarf can read yet, which is the best kind. Ironforge won't send us so much as a pickaxe, so I'm prayin' it's somethin' grand enough tae make them sorry." } },
      choices = {
        { text = "Some ruins are better left buried, Rutgar.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Dig deep. The past belongs to whoever uncovers it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every few nights, an' always from below, which is the worst of it, because a dwarf likes tae see what's comin'. We've lost tents, pack mules an' one very good cook, an' the Hold's too busy with its own war tae lend us a hand." } },
      choices = {
        { text = "The Hold and the League must stand together out here.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then don't wait on the Hold. Dig in and fend for yourselves.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Old ruins half under the sand, an' carvings on 'em that nae dwarf can read yet, which is the best kind. Ironforge won't send us so much as a pickaxe, so I'm prayin' it's somethin' grand enough tae make them sorry." } },
      choices = {
        { text = "Some ruins are better left buried, Rutgar.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Dig deep. The past belongs to whoever uncovers it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every few nights, an' always from below, which is the worst of it, because a dwarf likes tae see what's comin'. We've lost tents, pack mules an' one very good cook, an' the Hold's too busy with its own war tae lend us a hand." } },
      choices = {
        { text = "The Hold and the League must stand together out here.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then don't wait on the Hold. Dig in and fend for yourselves.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Old ruins half under the sand, an' carvings on 'em that nae dwarf can read yet, which is the best kind. Ironforge won't send us so much as a pickaxe, so I'm prayin' it's somethin' grand enough tae make them sorry." } },
      choices = {
        { text = "Some ruins are better left buried, Rutgar.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Dig deep. The past belongs to whoever uncovers it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every few nights, an' always from below, which is the worst of it, because a dwarf likes tae see what's comin'. We've lost tents, pack mules an' one very good cook, an' the Hold's too busy with its own war tae lend us a hand." } },
      choices = {
        { text = "The Hold and the League must stand together out here.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then don't wait on the Hold. Dig in and fend for yourselves.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, eh? Ye'd not be the first Horde sort to wander into camp, and as long as ye keep yer hands off the finds, I'll not ask what ye're doing here." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Are ye daft, wanderin' out here in robes? The sand gets in everywhere, an' I mean everywhere, so mind yer spellbooks." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, eh? We could use someone wi' light fingers tae get into the ruins the bugs are guardin', an' I'll not ask how ye do it." },
        { id = "h_default", key = true,
          text = "Rutgar Glyphshaper, holding this camp for the Explorers' League while Brann's off somewhere getting himself into trouble. That dwarf didn't get a scrap of his brothers' good sense, and we're onto something huge down here." },
        { id = "h_natalia", tags = { "news" }, when = { questActive = TODO_QUEST("Dearest Natalia") },
          text = "The Commander sent ye about his wife, eh? Have a seat, then; this is going to be a long one." },
        { id = "h_glyphs", when = { questActive = TODO_QUEST("Glyph Chasing") },
          text = "Rubbings from all three hives, mind, not two. And if ye find a crazy night elf lass in one of them, give her a kick from us." },
        { id = "h_prism", when = { questDone = TODO_QUEST("Unraveling the Mystery") },
          text = "Larksbane says the glyphs aren't a code at all, just a lock that turns. I've been reading locks wrong most of my life, apparently." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, out here? Weel, say a word for Brann while ye're at it, because wherever he's wandered off tae, he'll be needin' it more than the rest of us." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Ye'll fit right in, if ye can stand the heat in that plate, because what we need out here is someone who'll stand still when the bugs come boilin' out o' the sand." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, out here? Weel, say a word for Brann while ye're at it, because wherever he's wandered off tae, he'll be needin' it more than the rest of us." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Ye'll fit right in, if ye can stand the heat in that plate, because what we need out here is someone who'll stand still when the bugs come boilin' out o' the sand." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, out here? Weel, say a word for Brann while ye're at it, because wherever he's wandered off tae, he'll be needin' it more than the rest of us." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Ye'll fit right in, if ye can stand the heat in that plate, because what we need out here is someone who'll stand still when the bugs come boilin' out o' the sand." },
      },
      again = {
        { id = "h_again", text = "What else? I've got rubbings to sort." },
        { id = "h_again2", text = "Spit it out, then." },
      },
      choices = {
        { text = "The ground here hums. What have your digs found under it?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What happened to Natalia Mar'alith?", next = "natalia" },
        { text = "Where's Brann Bronzebeard?", next = "brann" },
        { text = "What are you digging for?", next = "dig" },
        { text = "Why won't Ironforge send help?", next = "ironforge" },
        { text = "Who's the monkey?", next = "monkey" },
        { text = "I'll carry word to Ironforge myself.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Did the rubbings make any sense?", next = "glyphs", when = { questDone = TODO_QUEST("Glyph Chasing") } },
        { text = "A gnome could help with those glyphs, Rutgar.", next = "x_gnome", when = { race = "Gnome" } },
        { text = "What has the Explorers' League found here?", next = "xmage", when = { class = "MAGE" } },
        { text = "What's in the ruins the silithid guard?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What are you digging for out here, Rutgar?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the silithid trouble the camp often?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What are you digging for out here, Rutgar?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the silithid trouble the camp often?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What are you digging for out here, Rutgar?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the silithid trouble the camp often?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    natalia = {
      big = true,
      lines = { { id = "n_default", fx = { learn = { "natalia" } },
        text = "She was the first of the elves from the Hold to join us when we started going into the hives after artifacts. Dangerous work, but she had a nose for it, and everything was fine until we found a glyphed crystal in Hive'Regal." } },
      choices = {
        { text = "What happened at the crystal?", next = "nat_crystal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nat_crystal = {
      lines = { { id = "nc_default", text = "She went to it like a moth to a lamp, pressed her cheek against it and went stiff as a post, eyes open and nobody home. We carried her out of there quick as we could and took her to the Commander, and his druids woke her up." } },
      choices = {
        { text = "And then?", next = "nat_return" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nat_return = {
      lines = { { id = "nr_default", text = "Then weeks of nothing, and then she walks into camp out of nowhere, demanding we go back to Hive'Regal that minute. Brann said not without an army, and she went mad, and the four of us barely fought her off. Ask Frankal for the rest; he tells it with more shouting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brann = {
      lines = { { id = "b_default", fx = { learn = { "explorers_league" } },
        text = "Wandered off, as he does, after something shiny he'd read about. Back when he was here we had a bit of order; now it's me, Frankal and a monkey, and the monkey's in charge on Tuesdays." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    dig = {
      lines = { { id = "d_default", fx = { learn = { "silithid_hives" } },
        text = "Whatever the Qiraji left lying about, and they left plenty. Those crystals in the hives are covered in glyphs nobody's seen before, and the bugs have tripled since we first went in, which tells me we've poked something that didn't want poking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ironforge = {
      lines = { { id = "i_default", text = "Because we're stretched too thin protecting the realm, or some such nonsense, according to the last three letters. A camp of explorers in a desert full of bugs isn't anybody's idea of a front line, until it is." } },
      choices = {
        { text = "Ironforge has wars of its own. Be patient.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget Ironforge. Find your own army.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Would ye? Then tell the Hall of Explorers we've found glyphs nobody in Ironforge has ever seen, and tell them the bugs have tripled. One of those two ought to get their attention." } },
      choices = {
        { text = "I'll make them listen.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    glyphs = {
      lines = { { id = "gl_default", text = "Not a scrap, and that's what bothers me. I've read glyphs from Uldaman to the Badlands, and these ones don't read like writing at all; they read like a lock waiting for a key." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    monkey = {
      lines = { { id = "m_default", text = "Glibb. Don't ask; he's a monkey, and he saved all our hides when Natalia went wild, so he eats first now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_gnome = {
      lines = {
        { id = "xg_default", text = "Could ye, now? We've got a heap of languages between us in this camp and not one of them makes these glyphs sit still, but I've seen a gnome read a broken gear like a storybook, so maybe ye'll have better luck. Mind the monkey; he's got opinions about small folk." },
      },
      choices = {
        { text = "Let me have a look at them.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Glyphs aren't gears, Rutgar.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Glyphs, hives and Bronzebeards. Pick one, and be quick." } },
    background = { { id = "tp_bg", text = "Explorers' League, born and bred, and never been ignored like this. Ask me again when I've calmed down." } },
    advice = { { id = "tp_ad", text = "Never touch a glowing rock with your face. Should be obvious, but here we are." } },
    explorers_league = { { id = "tp_league", text = "The finest scholars in Ironforge, and the worst letter-answerers." } },
    natalia = { { id = "tp_natalia", text = "Poor lass. She wasn't herself, at the end.", next = "natalia" } },
    _none = { { id = "tp_none", text = "Ask Frankal. He likes talking." } },
  },
}

P:NPC {
  key = "frankal", id = TODO_NPC("Frankal Stonebridge"), name = "Frankal Stonebridge",
  bible = "bibles/silithus.md", role = "scholar", tier = "quest",
  communities = { "bronzebeard_camp" }, temper = { "gruff", "jovial" }, values = { "curious", "honest" },
  notices = { "class", "race" },

  impression = {
    first = "Frankal Stonebridge watches the sky over Silithus for dragons and tells the story of Natalia's madness with great relish and greater volume. He thinks the monkey deserves a medal.",
    third = "{name} met Frankal Stonebridge, a talkative dwarf of Bronzebeard's Encampment who saw Natalia Mar'alith go mad.",
  },

  greetings = {
    { id = "g_default", text = "Look up there, friend, higher than that, over the dunes! Ah, ye've gone and missed it." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again. Sit down, then, before I start shouting at the sky." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, eh? Do me a favour and keep your hands where I can see them. The last priestess who visited this camp did things to my head I'm still not over." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Can ye read Qiraji, then? I thought not, so you're no better than the rest of us, and we've thirty-eight languages between us." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Trouble them? Every time one passes over, friend, the sand lifts and the air goes tight like before a storm, and then nothing, not a drop of rain! Whatever they are, they're watching the hives, and if a dragon's worried, I'm worried twice over." } },
      choices = {
        { text = "If dragons are watching, we should watch with them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Dragons scheme. Trust them as far as you can throw one.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The best in the desert, an' a hero besides, because he kept his head when Natalia lost hers an' saved the lot of us. So if he helps himself tae yer lunch, ye'll let him, same as the rest of us do." } },
      choices = {
        { text = "Sounds like a born thief. I like it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Stealing's no joke, even for a monkey.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "That's quite a monkey.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because they've never come near Silithus before, not in all the history we've read, an' now they're circlin' like vultures. Somethin's drawin' them here, an' I'd like tae know what before it draws them down on our heads." } },
      choices = {
        { text = "The dragons should be watched. You're right to worry.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Dragons are trouble. Let them be.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll keep an eye on the sky.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Then look up with me, friend, and tell me if ye feel it in the wind, because there's dragons over this desert and I'll not have it said Frankal Stonebridge was the only one who noticed!" },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! Ye'd get on wi' Glibb, I reckon, because that monkey can lift a sandwich out of yer hand before ye know it's gone." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock! The dragons overhead don't like yer sort, I'll wager, an' neither do the bugs, so keep yer demon close while ye're in my camp." },
        { id = "h_default", key = true,
          text = "Look up at the sky, friend! There are dragons over this desert, when not one of the flights has come near Silithus in a thousand years, so the Qiraji are up to something, mark my words." },
        { id = "h_natalia", tags = { "news" }, when = { questActive = TODO_QUEST("Dearest Natalia") },
          text = "Not this again! Fine, sit down; Rutgar's told ye the boring part, so I'll skip straight to the bit with the screaming." },
        { id = "h_brains", when = { questActive = TODO_QUEST("Breaking the Code") },
          text = "Brains, friend, one from each hive! The elixir won't brew itself, and I'm not going in there." },
      },
      again = {
        { id = "h_again", text = "What else? The sky's not going anywhere." },
        { id = "h_again2", text = "Go on, then, I do like an audience." },
      },
      choices = {
        { text = "Do the dragons over Silithus trouble the winds?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What happened to Natalia, in the end?", next = "natalia" },
        { text = "Dragons? Over Silithus?", next = "skies" },
        { text = "How many languages did you say?", next = "languages" },
        { text = "What do you want with silithid brains?", next = "brains", when = { any = { { questActive = TODO_QUEST("Breaking the Code") }, { questDone = TODO_QUEST("Breaking the Code") } } } },
        { text = "Those spells she used... I know them.", next = "priest", when = { class = "PRIEST" } },
        { text = "Natalia's magic: was it arcane at all?", next = "x_mage", when = { class = "MAGE" } },
        { text = "Is Glibb really a thief?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why do you watch the dragons so closely?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll let you watch your sky.", next = "END" },
      },
    },

    natalia = {
      big = true,
      lines = { { id = "n_default", fx = { learn = { "natalia" } },
        text = "She came back for a second go at the hives, and Brann told her no, and before anyone threw a punch she started talking to someone who wasn't there. Then she chanted in a tongue none of us had ever heard, and nodded, as if somebody had answered her, and came at us." } },
      choices = {
        { text = "You couldn't handle one priestess?", next = "nat_spells" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nat_spells = {
      lines = { { id = "ns_default", text = "Listen here, whatever came at us was no priestess. Her eyes were glowing, she screamed so we all ran off in different directions, and then she went into our heads one at a time, words of shadow ringing in my skull while the others dropped like sacks." } },
      choices = {
        { text = "How did you survive?", next = "nat_hive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    nat_hive = {
      lines = { { id = "nh_default", text = "The monkey. Glibb saw Brann fall face-first into the sand and went berserk, pounding her head till she ran. Straight into Hive'Regal she went, and not one bug touched her, like she'd been their friend for centuries." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    skies = {
      lines = { { id = "s_default", fx = { learn = { "bronze_dragonflight" } },
        text = "Aye, bronze ones, high up, catching the sun. The old stories say the bronze dragonflight fought here with the elves, back when the wall went up, and then left and never came back, until now." } },
      choices = {
        { text = "That's a good sign, surely.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Dragons never come back for nothing.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    languages = {
      lines = { { id = "l_default", text = "Thirty-eight, between Brann, Rutgar, me and the monkey, and that's counting a bit of Titan, both kinds. And still none of us knew what Natalia was chanting, which ought to tell ye something." } },
      choices = {
        { text = "The monkey speaks languages?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brains = {
      lines = { { id = "b_default", text = "An elixir that'll let us read the glyphs and the Qiraji tongue more easily, or so I hope. One brain from each kind of silithid, from each hive, and Rutgar's work might be worth something after all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "p_default", text = "Ye do? The scream, the words in the head, the way she healed herself every time we hurt her? Then you tell me, since nobody else can: is that something a priestess learns, or something that gets into her?" } },
      choices = {
        { text = "It can be learned. Shadow isn't madness on its own.", next = "BACK", fx = { align = { light = -1 }, trait = { curious = 1 } } },
        { text = "Something got into her. No priestess of the Light does that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_mage = {
      lines = {
        { id = "xm_default", text = "Arcane? Not like any spell I've seen a mage throw, and I've seen a few in my day, mostly aimed at me. She talked to someone who wasn't there, and when she turned on us it was our heads that hurt, not our skin, so ye tell me what kind of magic that is." },
      },
      choices = {
        { text = "That sounds like shadow, not arcane.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else, Frankal.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Ask me anything ye like, and remember we've thirty-eight languages in this camp." } },
    background = { { id = "tp_bg", text = "Explorers' League, like Rutgar, only better company. I came for the ruins and stayed for the screaming." } },
    advice = { { id = "tp_ad", text = "Keep a monkey about the place, and ye'll thank me one day." } },
    bronze_dragonflight = { { id = "tp_bronze", text = "They fought here once, the stories say. If they're back, something's coming.", next = "skies" } },
    natalia = { { id = "tp_natalia", text = "Don't get me started. Too late, you've got me started.", next = "natalia" } },
    _none = { { id = "tp_none", text = "Not a clue, and that's rare. Ask Rutgar; he'll pretend he knows." } },
  },
}
