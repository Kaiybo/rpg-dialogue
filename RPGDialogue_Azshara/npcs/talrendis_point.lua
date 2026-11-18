-- Talrendis Point: a small Sentinel camp on the Ashenvale border, and the tauren they let stay. Voice: bibles/azshara.md
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "lohatu", id = TODO_NPC("Loh'atu"), name = "Loh'atu",
  bible = "bibles/azshara.md", role = "questgiver", tier = "major",
  communities = { "talrendis_point" }, temper = { "steady", "gentle" }, values = { "kind", "cautious" },
  notices = { "race", "class", "faction" },

  impression = {
    first = "Loh'atu is a tauren living as a guest among the Sentinels at Talrendis Point, on a promise of no trouble. He speaks softly, keeps his word, and grieves for elven ghosts that aren't his own.",
    third = "{name} met Loh'atu, a tauren who keeps the peace as a guest of the Sentinels at Talrendis Point.",
  },

  greetings = {
    { id = "g_default", text = "Greetings, friend, and may the Earthmother walk with you. Speak gently here; the Sentinels are listening, and so am I." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the border. The Earthmother keeps you, it seems." },
    { id = "g_helped", when = { questDone = TODO_QUEST("Spiritual Unrest") }, text = "The shrine is quieter since you went there. I sleep better for it, and so do the Sentinels." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The ghosts walk further from the shrine after dark. Stay near the fire, friend." },
    { id = "g_away", when = { away = 14 }, text = "You have been away from the border {away}, friend, and the ghosts have walked further from the shrine in that time. I am glad the Earthmother brought you back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have grown stronger since we last spoke, and I can feel it the way the earth feels a heavier step. Walk gently here all the same, for the Sentinels notice such things too." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "The Sentinels say one of their own caught you in a lie, friend, and here a guest lives on his promises. I would mend that quickly, for both our sakes." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I hear you spoke kindly to someone at the Point, and they have been easier since, and that is how a guest earns his place, friend." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Another of the Earthmother's children, this far from Mulgore! Mind your temper in this camp, cousin, for both our sakes." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "You walk among your own people's ruins, kaldorei. I hope the land is gentler to you than it has been to me, though I doubt it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Good; the dead here are restless, and I think they would listen to you sooner than to an old bull with a staff." },
    { id = "n_horde", cat = "faction", when = { faction = "Horde" },
      text = "You wear the Horde's colours in a Sentinel camp. They will let you be if you let them be, so keep your hands from your weapons." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "That the elves broke this land long ago and it has not forgiven them. You and I are both guests here, friend, so we must listen more than we speak." } },
      choices = {
        { text = "We'll listen, and help where we can.", next = "BACK", reply = "That is the way, friend, and the land will notice it. Walk with the Earth Mother.", fx = { align = { light = 1 } } },
        { text = "Guest or not, I'll take what this land owes me.", next = "BACK", reply = "This land owes nothing to anyone, friend, least of all to guests. I hope you will think on that.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They tolerate me because I keep my promise, and I think they would tolerate you for the same reason, though they'd sooner trust a ghost from these ruins. Bring no trouble, and they'll leave you be, and so will I." } },
      choices = {
        { text = "I'll keep your promise, Loh'atu, as if it were mine.", next = "BACK", reply = "Thank you, friend. The Sentinels will see it, and they will trust us both a little more.", fx = { align = { order = 1 } } },
        { text = "The Sentinels don't own this forest. I'll walk where I please.", next = "BACK", reply = "They do not, but they guard it, and I keep my promise to them. I would ask you to walk carefully.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They weep for the elves who died here, though those elves were never mine to mourn. The Haldarr satyrs have soured the earth, and the water spirits in the bay are restless, and I think they would welcome a shaman's voice, if you would lend it to them." } },
      choices = {
        { text = "I'll speak to the spirits and ease what I can.", next = "BACK", reply = "Then the spirits will be grateful, and so will I. They have wept a long time.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The spirits will have to wait. The satyrs come first.", next = "BACK", reply = "The satyrs are the cause, I know, and I will not stop you. But the spirits will still be weeping when you return.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because I am the stranger in their camp, and when something goes wrong, the stranger is always the first to be looked at. I do not hold it against them, since they have lost much to the satyrs, but I would ask you not to give them a reason to look at me again." } },
      choices = {
        { text = "I'll walk openly, then, for your sake.", next = "BACK", reply = "Thank you, friend. That is a kindness to me and to them both.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They'll never know I was here. That's the point.", next = "BACK", reply = "That is the point, I know, and it is what worries them. I would ask you to be seen, here.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because the satyrs do not care whose banner flies over this land, and neither do I. I swore to the Earth Mother that I would help drive the corruption out, and your Light, I think, burns as hot against the satyrs as any spirit's fire does." } },
      choices = {
        { text = "Then I'll fight beside you, whatever our banners say.", next = "BACK", reply = "Then the satyrs will meet both of us, friend, and the Earth Mother will smile. Banners mean little here.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The Sentinels' trust must be earned. I'll respect it.", next = "BACK", reply = "It must, and I am glad you see it. Patience is the only road to their trust.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Then show them by keeping your blade for the Haldarr satyrs and the ghosts that will not rest, and by never drawing it near the camp. I have kept my promise to them for a long while, and I've learned that the elves remember every kept promise and every broken one." } },
      choices = {
        { text = "Then I'll keep my promises here, as you've kept yours.", next = "BACK", reply = "Then you will find them gentler than you expect, in time. They already ask after you when you are gone.", fx = { align = { honor = 1 } } },
        { text = "Promises to the elves? I'll do as I please, so long as nobody sees.", next = "BACK", reply = "Someone always sees, friend, and the Sentinels see more than most. I would not test them.", fx = { align = { honor = -1 } } },
        { text = "Something else, Loh'atu.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I believe so, for the coursers and the hippogryphs will not go near the shrine, and the deer flee from it at dusk without anything chasing them. My people say a beast's eyes see what ours cannot, and I have never seen a reason to doubt it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I believe so, for the coursers and the hippogryphs will not go near the shrine, and the deer flee from it at dusk without anything chasing them. Your {pet} has been looking toward the shrine since you sat down. You see, friend, it knows something is there." },
      },
      choices = {
        { text = "Then the spirits deserve to be set free. I'll help.", next = "BACK", reply = "Thank you, and the beasts will thank you too, in their own way. You will see it in how they look at you.", fx = { align = { light = 1 } } },
        { text = "Ghosts don't trouble me. I'll hunt where the game is.", next = "BACK", reply = "The game will not go near it either, friend, and you will find it hungry hunting. But it is your choice.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They trust me a little more each season, I think, because I keep my promise and bring no trouble. A warlock will find it harder, for they have seen what demons did to this land, and I cannot say they are wrong to fear it." } },
      choices = {
        { text = "Their fear is fair. I'll earn their trust.", next = "BACK", reply = "Then you are wise, and they will see it, slowly. Patience is the warlock's hardest lesson, I think.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear is their weakness, not my problem.", next = "BACK", reply = "It is their wound, friend, and wounds make anyone fearful. I would not call it weakness.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll keep my demon quiet.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They clung to their magic when the world broke, and now it clings to them, so they cannot rest. I pray over each one I free, and I write to the elders of Thunder Bluff about what I learn, though I am never sure they understand." } },
      choices = {
        { text = "They deserve to rest. I'll help free them.", next = "BACK", reply = "Then the Earth Mother will thank you, and the elders of Thunder Bluff will hear of it. They have lingered too long.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They made their choice. Let them linger.", next = "BACK", reply = "Perhaps they did, but they have suffered for it longer than anyone should. I will free them all the same.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "That's a sad fate.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Coldly, at first, and then with a watchful sort of courtesy that I have come to value. They watch the ruins for Highborne ghosts and I watch with them, and a quiet guest who keeps his word is worth more here than any warrior." } },
      choices = {
        { text = "Then I'll keep the peace, as you have.", next = "BACK", reply = "Then you will be a welcome guest, friend, and the Sentinels will remember it. Sit by my fire tonight, and see how quiet a camp can be.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Courtesy's a mask. I'd watch them just as closely.", next = "BACK", reply = "It may be, but I have found it honest enough. I would watch kindly, if I were you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That it is not one wound but many. The Highborne cut into the land with their magic long ago, and the satyrs keep the cut open, and the naga drink from it along the shore. A druid of either people could tend it for a lifetime and only slow it, but slowing it is still a good thing to do." } },
      choices = {
        { text = "Then I'll tend it, even if I only slow it.", next = "BACK", reply = "Then you will be doing the Earth Mother's work, and she will remember it. Slowing it is more than most do.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Better to burn out the satyrs first. Tending can wait.", next = "BACK", reply = "The satyrs keep the wound open, I know, and the tending must wait for them. Burn carefully, friend.", fx = { align = { order = -1 } } },
        { text = "Something else, Loh'atu.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Haldarr", min = 30 } },
          text = "The Haldarr are fewer in the woods, friend, and the Sentinels have noticed whose hand did it. They watch me a little less closely now, and I have you to thank for that." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" },
          text = "A shaman, here among the Sentinels! Sit with me a moment, friend, for it has been long since I spoke with someone who hears the spirits as I do." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue. You slipped past the Sentinels more quietly than I ever could, friend, and I hope they do not notice, for they would blame me for it." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" },
          text = "A paladin of the Alliance, here at Talrendis Point. Walk softly, friend, for the Sentinels let me stay on a promise of no trouble, and I would like that promise to hold." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. The Sentinels will watch you as they watch me, friend, because a blade in this camp is a promise of trouble unless you show them otherwise." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. The beasts of Azshara are restless, friend, and I think they feel the ghosts at the Shadowsong Shrine as much as I do." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, here among the Sentinels? You are braver than I was, friend, or less careful, because the elves watch even a quiet tauren closely." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. The Highborne ghosts at the Shadowsong Shrine were mages too, and they still cling to this land, so I wonder whether you feel them more keenly than I do." },
        { id = "h_default", key = true,
          text = "I am Loh'atu. The Sentinels let me share their camp so long as I bring no trouble with me, and I have kept that promise for longer than they expected. I came to learn what is wrong with this land, and I have learned more of it than I wished." },
        { id = "h_satyr", when = { questActive = TODO_QUEST("A Land Filled with Hatred") },
          text = "The Haldarr clan is to the northeast, among the broken stones. Strike at them hard, friend, because they will not stop on their own." },
        { id = "h_spirits", when = { questActive = TODO_QUEST("Spiritual Unrest") },
          text = "The spirits gather at the Shadowsong Shrine, just across the way. Release as many as you can; they have waited ten thousand years for someone to do it." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Sit with me a while, friend. You have done more good on this border than most who pass over that bridge, and I would rather talk with you than with the ghosts." },
        { id = "h_cool", when = { disposition = { max = 34 } },
          text = "I keep my promises to the Sentinels, and I would ask you to keep yours to me. Say what you need, and then let us both go about our work." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, here at Talrendis Point. Walk softly, friend, for the Sentinels let me stay on a promise of no trouble, and I would like that promise to hold." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. I have walked these woods for a long while, trying to hear what is wrong with them, and perhaps you will hear it more clearly than I can." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Horde, here at Talrendis Point, and one of the Forsaken at that. Walk softly, friend, because the Sentinels already watch me, and they'll watch you twice as closely." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who hears the spirits! I did not think to meet one in my life, and I am glad of it, for the Sentinels do not hear them as you and I do." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I have time; the land does not hurry, and neither do I." },
        { id = "h_again2", text = "Ask, friend. A guest learns to listen, and I have had many moons of practice." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Go on. The fire is warm and the Sentinels are pretending not to listen." },
      },
      choices = {
        { text = "Why would a tauren live in a night elf camp?", next = "guest" },
        { text = "What is wrong with this land?", next = "land" },
        { text = "I know little of Azshara.", next = "queen" },
        { text = "What else is there to see in Azshara?", next = "places" },
        { text = "I can help lay the Highborne spirits to rest.", next = "priest", when = { class = "PRIEST" } },
        { text = "These ruins belonged to my people, long ago.", next = "elf", when = { race = "NightElf" } },
        { text = "The Earthmother sent you a long way from home.", next = "kin", when = { race = "Tauren" } },
        { text = "My ancestors were Highborne, as it happens.", next = "skyborne", when = { all = { { race = "Skyborne" }, { faction = "Alliance" } } } },
        { text = "The Sentinels must trust you by now.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why do the Highborne ghosts remain?", next = "xmage", when = { class = "MAGE" } },
        { text = "How do the Sentinels treat a Horde guest, Loh'atu?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "I'd like to show the Sentinels I mean no trouble.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the beasts here feel the restless spirits?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "You must have learned something of this land's sickness.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why do you stay among the Alliance, Loh'atu?", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "Why would the Sentinels blame you for me, Loh'atu?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What do the spirits say of this land, Loh'atu?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Will the Sentinels tolerate a Forsaken paladin, Loh'atu?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "What do the spirits tell you of Azshara, Loh'atu?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll keep the peace here, Loh'atu.", next = "END", fx = { affinity = 1, standing = { talrendis_point = 1 } } },
      },
    },

    guest = {
      lines = {
        { id = "gu_default", fx = { learn = { "sentinels" } },
          text = "Because the land does not care whose banner flies over it, and neither do the satyr. I swore to the Earthmother that I would help the elves drive the corruption out of the places Cenarius once walked, and this camp is the closest place to that corruption with a fire and a roof." },
      },
      choices = {
        { text = "And the Sentinels accept that?", next = "guest_sentinels" },
        { text = "A promise like that is worth keeping.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else, Loh'atu.", next = "BACK" },
      },
    },
    guest_sentinels = {
      lines = {
        { id = "gs_default", text = "They accept that I am useful, which is not quite the same thing. They watch me as they watch the bridge, and I watch them back, and between us there has been no trouble at all." },
      },
      choices = {
        { text = "The Alliance and Horde could learn from that.", next = "BACK", reply = "They could, if they would only stand still long enough to try. Perhaps one day they will.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Peace that needs watching isn't peace at all.", next = "BACK", reply = "Perhaps not, but peace that nobody watches does not last a season out here. I will take a watched peace over an honest war, and so, I think, would the bridge.", fx = { trait = { skeptical = 1 }, align = { order = -1 } } },
        { text = "Do they really trust you, Loh'atu?", tag = "Persuade", next = "trust",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Tauren" }, { questDone = TODO_QUEST("Spiritual Unrest") } } } },
          fail = { next = "trust_fail", fx = { affinity = -1 } } },
      },
    },
    trust = {
      big = true,
      lines = {
        { id = "tr_default", text = "No, and I have never asked them to. I write to the elders of Thunder Bluff about everything I see here, and I let the Sentinels read every letter before it goes. That is why I am still welcome, friend: not trust, only nothing hidden." },
      },
      choices = {
        { text = "That's wiser than trust.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust_fail = {
      lines = { { id = "tf_default", text = "That is between me and my hosts, friend. A guest who speaks about the house behind its back does not stay a guest for long." } },
      choices = { { text = "I understand.", next = "BACK" } },
    },

    land = {
      big = true,
      lines = {
        { id = "la_default", fx = { learn = { "satyrs", "highborne" } },
          text = "Two sicknesses, old and older. The satyr of the Haldarr clan, who were elves once and gave themselves to demons, are spreading their filth through the woods to the northeast; and the dead of the Highborne still haunt the ruins they were too proud to leave." },
        { id = "la_done", when = { questDone = TODO_QUEST("A Land Filled with Hatred") },
          text = "You have thinned the Haldarr, and I can feel the difference in the soil, small as it is. But the dead of the Highborne still walk, and they are the older wound." },
      },
      choices = {
        { text = "Tell me about the satyr.", next = "land_satyr" },
        { text = "Why do the Highborne dead linger?", next = "land_spirits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    land_satyr = {
      lines = {
        { id = "ls_default", text = "I cannot speak for the elves about what the satyr have done to them; that grief belongs to them. I can only tell you that where the satyr camp, the trees sicken and the beasts go mad, and that I have sworn to help push them back." },
      },
      choices = {
        { text = "Then I'll help you push.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 }, standing = { talrendis_point = 1 } } },
        { text = "They chose demons. They get no mercy from me.", next = "BACK", reply = "They chose, I know, and the trees have paid for their choice. I will not ask you for mercy.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Even satyr were elves once. I'd pity them.", next = "BACK", reply = "They were, and the elves remember it more painfully than anyone. Pity them, friend, and fight them all the same.", fx = { align = { light = 1 }, trait = { kind = 1 } } },
      },
    },
    land_spirits = {
      lines = {
        { id = "lsp_default", text = "Because they still want what they wanted in life, I think, which was magic, and more of it. The Shadowsong Shrine across the way is full of them, and I promised the Sentinels I would release any spirit I found." },
      },
      choices = {
        { text = "What harm do they do?", next = "spirits_hunger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits_hunger = {
      lines = {
        { id = "sh_default", text = "Their hunger for the arcane is a door left open, and you know what came through that door the last time. Every spirit put to rest is one less voice calling into the dark, friend, and the elves would say the same if they spoke of it at all." },
      },
      choices = {
        { text = "Then the arcane itself is the danger.", next = "BACK", reply = "It may be, or only the hunger for it. I would rather not find out the hard way.", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Magic isn't evil. Greed is.", next = "BACK", reply = "Perhaps you are right, friend, and greed was the door. But the arcane was the key.", fx = { align = { order = -1 }, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    queen = {
      lines = {
        { id = "q_default", fx = { learn = { "queen_azshara" } },
          text = "I know only what the elves tell, and they do not tell it often. Long ago, when their people still held the arcane sacred, their queen was the most beautiful and the most gifted of them all, and her hunger for magic is what broke the world." },
      },
      choices = {
        { text = "What became of her?", next = "queen_fate" },
        { text = "So the land is named for her.", next = "queen_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    queen_fate = {
      lines = {
        { id = "qf_default", text = "Some say she drowned with her palace, and some say the sea changed her into something terrible that waits below. The Sentinels will not say which they believe, and I have learned not to ask them twice." },
      },
      choices = {
        { text = "The naga in the bay might know.", next = "BACK", fx = { trait = { curious = 1 }, learn = { "spitelash" } } },
        { text = "Some stories should stay untold.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    queen_name = {
      lines = {
        { id = "qn_default", text = "The survivors named this coast for her, so that no one would forget what pride had cost them. My people would have named it for the dead instead, but I am a guest, and it is not my place to rename their sorrows." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    places = {
      lines = {
        { id = "p_default", fx = { learn = { "eldarath" } },
          text = "Ruins, mostly, and none of them empty. Eldarath is the great one, east along the road, and the naga have claimed it; there is a human mage in a tower to the north; the furbolgs keep to the mountains; and blue dragonkin guard something by a lake to the south." },
      },
      choices = {
        { text = "Who is the mage?", next = "places_mage" },
        { text = "Something has happened to the furbolgs.", next = "places_furbolg" },
        { text = "Blue dragonkin, here?", next = "places_dragons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    places_mage = {
      lines = {
        { id = "pm_default", fx = { learn = { "xylem" } },
          text = "A powerful one, they say, who watches over this land for reasons he keeps to himself. I have not climbed to his tower, but travellers say he welcomes visitors who are willing to run his errands." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    places_furbolg = {
      lines = {
        { id = "pf_default", fx = { learn = { "furbolgs" } },
          text = "They were struck on every side these last years, and now most of them strike back at anyone they see. Whether it is the same sickness that took Felwood or only anger at what was done to them, I cannot tell you, and I grieve it either way." },
        { id = "pf_ogtinc", when = { heardLine = "ogtinc.h_default" },
          text = "You have met Ogtinc, on the cliff above the ruins. He is the proof that not all of them are lost, and I would like to believe there are others like him." },
      },
      choices = {
        { text = "They deserve pity, not arrows.", next = "BACK", reply = "They do, and I am glad you see it. The furbolgs here were friends to everyone once.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A hostile furbolg is still hostile.", next = "BACK", reply = "It is, and I will not ask you to stand still before it. Only remember what it was.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    places_dragons = {
      lines = {
        { id = "pd_default", text = "Not the great dragons themselves, only their servants, and the servants of Malygos's flight do not guard empty places. Wherever the blue dragons go you will find arcane magic, and I suspect the Highborne left something behind that they would rather no one found." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    priest = {
      big = true,
      lines = {
        { id = "pr_default", text = "Then you are an answer to a promise I made, friend. The spirits at the shrine are not wicked, only lost and hungry, and I think the Light would reach them more gently than my staff does." },
      },
      choices = {
        { text = "I'll pray over each one as I release it.", next = "BACK", reply = "Thank you, friend, and the spirits will thank you too. Your prayers will reach them where my words cannot.", fx = { affinity = 3, align = { light = 2 }, standing = { talrendis_point = 1 } },
          journal = { first = "Loh'atu asked me to free the Highborne ghosts at the Shadowsong Shrine. I promised to pray over each one as it went.",
                      third = "{name} promised Loh'atu to pray over each Highborne spirit freed at the Shadowsong Shrine." } },
        { text = "They brought this on themselves. I'll free them, not mourn them.", next = "BACK", reply = "Free them, then, and I will do the mourning for both of us. They have earned that much, at least.", fx = { align = { light = -1 } } },
        { text = "Do you pray to the Earthmother for them?", next = "priest_earth" },
      },
    },
    priest_earth = {
      lines = { { id = "pe_default", text = "I do, though they were never hers. The Earthmother is generous with strangers, and I think your Light is too, or else you would not have offered." } },
      choices = {
        { text = "Then we pray together.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    elf = {
      lines = { { id = "el_default", text = "Then forgive an outsider for walking through your people's grief with muddy hooves. I have tried to tread lightly here, and I would rather hear the story from you than from the ghosts." } },
      choices = {
        { text = "The Highborne were not my people. They were our ruin.", next = "BACK", reply = "Then you carry a hard truth, and I honour you for saying it. I am sorry for your people's grief.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "They were kaldorei, whatever they did. I mourn them.", next = "BACK", reply = "Then I mourn with you, friend, and I am glad to know someone does. They suffered a very long time.", fx = { align = { order = -1 }, trait = { kind = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "ki_default", text = "She did, and she was right to. The land does not stop at Mulgore's edge, cousin, and a wound here is a wound to all of it, whether the elves wish our help or not." } },
      choices = {
        { text = "Then I'll help where I can.", next = "BACK", fx = { affinity = 2, standing = { talrendis_point = 1 } } },
        { text = "Let the elves heal their own land.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
    skyborne = {
      lines = { { id = "sk_default", text = "Then the spirits at the shrine may know your blood better than I do, friend. I would go carefully there; the dead are hungry for magic, and you carry more of it than most." } },
      choices = {
        { text = "I seek their knowledge, not their hunger.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "I'll be careful. Thank you.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Those are warm words, friend, and I have had few of them since I came to the border. May the Earthmother return the kindness to you on your road." },
        { id = "s2", text = "You honour an old bull more than he has earned, and still I find I am glad to hear it. I will tell the Sentinels that not every traveller arrives with a hard face." },
        { id = "s3", when = { race = "Tauren" }, text = "It does my heart good to hear such words in the voice of the plains, cousin. I have missed Mulgore more than I say, and you have brought a little of it with you." },
      },
      fail = {
        { id = "f1", text = "You are generous, friend, but I have lived long enough among watchful people to know when words are being spent to buy something. Ask plainly, and I will answer you plainly." },
        { id = "f2", text = "I am a guest here, and I own nothing worth flattering me for. Let us speak as honest travellers do, and leave the sweet grass off the top." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha, you have some of the bull in you, friend, to prod an old one and stand there smiling. I take no hurt from it, and I think the Sentinels could do with being teased so now and then." },
        { id = "s2", text = "I have been called worse across this fire, and by people with bows in their hands. You have spirit, and the Earthmother made room in the world for that as well." },
      },
      fail = {
        { id = "f1", text = "I made a promise to bring no trouble to this camp, friend, and I will not break it to answer you. I would ask that you speak more gently, because the Sentinels are listening to us both." },
        { id = "f2", text = "That was not well said, and I think you know it. I will let it pass like wind over the grass, but I will remember which way it blew." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Peace, friend, peace. I can see that you are not one to be crossed, and I have no wish to cross you, here of all places, where I live on my good behaviour." },
        { id = "s2", text = "You stand very heavily on the earth just now, and I feel it. I will give way, because I promised these people no trouble, though I hope you will set that weight down before you go among them." },
      },
      fail = {
        { id = "f1", text = "I am a guest among archers who watch my every step, friend, and I have learned not to startle easily. Put your anger away, before the Sentinels decide it is their business." },
        { id = "f2", text = "The Earthmother's children are slow to anger and slower to fear, and I am older than I look. Sit, and breathe, and tell me what truly troubles you." },
      },
    },
  },

  topics = {
    _gated = {
      { id = "gt1", text = "Forgive me, friend, but I do not speak of that with those I hardly know. A guest must be careful what he says, and to whom." },
      { id = "gt2", text = "I would rather keep that to myself for now. When we know each other better, ask me again, and I will not turn you away." },
    },
    knows = {
      { id = "tp_knows", text = "I know a little of this land, mostly from walking it and listening. Ask what you will, and you will have it plainly, as I learned it." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you, friend, I will tell everything I know, and say plainly where my knowing runs out." },
    },
    background = {
      { id = "tp_bg", text = "A tauren of Mulgore who made a promise to the Earthmother and followed it all the way to the elves' border.", next = "guest" },
    },
    advice = { { id = "tp_ad", text = "Keep to the road, keep your voice low near the shrine, and never draw a weapon inside a camp that has given you its fire." } },
    rumors = { { id = "tp_rum", text = "The Sentinels say the naga dig at Eldarath every night, and that whatever they want has been buried there since before the sea came in." } },
    sentinels = { { id = "tp_sent", text = "Good hosts, if watchful ones. They keep the bridge to Ashenvale, and they keep an eye on me, and I think they do both well." } },
    satyrs = { { id = "tp_satyr", text = "The Haldarr are the closest of them, to the northeast. The elves say they were kin once, and perhaps that is why the Sentinels hunt them so hard.", next = "land_satyr" } },
    highborne = { { id = "tp_hb", text = "The proudest mages the elves ever had, and now the saddest ghosts in Azshara.", next = "land_spirits" } },
    queen_azshara = { { id = "tp_queen", text = "The elves' old queen, whose hunger for magic broke the world. I know only the little they will say of her.", next = "queen" } },
    furbolgs = { { id = "tp_furb", text = "A gentle people once, struck down from every side. I grieve for them more than I fear them.", next = "places_furbolg" } },
    xylem = { { id = "tp_xylem", text = "The human mage in the tower to the north. I have never met him, and I am content to keep it so." } },
    eldarath = { { id = "tp_eld", text = "The great ruin east along the road, and the naga's now. Go there with friends, or not at all." } },
    cenarion_circle = { { id = "tp_circle", text = "Druids of my people and the elves together, working to heal what the demons broke. I wish there were more of them here." } },
    cairne = { { id = "tp_cairne", text = "Cairne is the father of my people and a friend to all who walk with an open hand. I would like him to see what I see here, elves and a tauren sharing bread." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother loves the night elves too, I think, though they call her by the moon's name. I would not say so in front of them, out of courtesy." } },
    elune = { { id = "tp_elune", text = "The Sentinels pray to Elune at dusk, and I sit with them, and I find their quiet very much like ours. A prayer is a prayer, whatever the sky is called." } },
    loramus = { { id = "tp_loramus", text = "The hermit on the island across the bay was once an elf of great honor, they say, before he took demons into himself. I grieve for what he lost, even if he does not." } },
    arkkoroc = { { id = "tp_arkkoroc", text = "A sea giant lives in a drowned temple and calls himself a god. I do not argue with gods, real or otherwise." } },
    thrall = { { id = "tp_thrall", text = "The Warchief keeps a peace with the humans, and I keep a smaller peace here with the elves. I hope his is easier than mine." } },
    _none = { { id = "tp_none", text = "That I do not know, friend, and I would rather say so than guess. The Sentinels might, if you ask them kindly." } },
  },
}

P:NPC {
  key = "jarrodenus", id = TODO_NPC("Jarrodenus"), name = "Jarrodenus",
  bible = "bibles/azshara.md", role = "flightmaster", tier = "service",
  communities = { "talrendis_point" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Jarrodenus keeps the hippogryphs at Talrendis Point, and won't fly them over the bay after dark. He talked about his birds the way some people talk about their children.",
    third = "{name} met Jarrodenus, the hippogryph master at Talrendis Point.",
  },

  greetings = {
    { id = "g_op_orcs", when = { gossip = { topic = "orcs", stance = "hate" } }, text = "Brinna says you'd drive the orcs out of Azshara. My birds would thank you, since the orcs' wind riders frighten them, though I'd not say the same about the orcs themselves." },
    { id = "g_default", text = "Ishnu-alah. If you need to fly, the hippogryphs are rested. Don't offer them bread, though; the Sentinels have spoiled them rotten." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the Point, and the hippogryphs lift their heads at your step. They choose their friends carefully." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "A sister or brother of the kaldorei, out on the cursed coast. Elune keep you; the hippogryphs will be glad of a familiar voice." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The water there hides something old and angry, and even the winds seem unwilling to carry my birds over it. I think the elements of Azshara remember the Highborne better than we do." } },
      choices = {
        { text = "I'll respect the bay's warning, Jarrodenus.", next = "BACK", reply = "Thank you, and the birds will thank you too. The bay keeps its secrets for a reason.", fx = { align = { order = 1 } } },
        { text = "I'll find out what's down there myself.", next = "BACK", reply = "Then go carefully, and do not take my birds with you. Whatever waits down there is very old.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the naga are full of it, and the old Highborne ruins along the coast still crackle with it at night. The birds remember every time they've been shot at with a frostbolt, so they don't trust anyone who smells like one, however polite." } },
      choices = {
        { text = "I'll wait downwind until they trust me.", next = "BACK", reply = "Thank you, and they will learn in time. Patience earns a hippogryph's trust.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They'll get used to me. I won't be stopped by birds.", next = "BACK", reply = "Then they will not fly for you, and you will walk. Birds are stubborner than mages.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They fight with fel fire and cruelty, and a warrior who charges them alone does not come back to my roost. The Sentinels go out in threes, and I'd ask you to do the same, because I'm tired of saddling birds for riders who never return." } },
      choices = {
        { text = "Then I'll go with others and come back. Discipline keeps warriors alive.", next = "BACK", reply = "Then you will come back to my roost, and I will be glad of it. Threes are the Sentinels' way.", fx = { align = { order = 1 } } },
        { text = "I fight alone. Fewer people to slow me down.", next = "BACK", reply = "Then you will not come back, and I will mourn you with the rest. I hope you prove me wrong.", fx = { align = { order = -1 } } },
        { text = "Something else, Jarrodenus.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because the wild hippogryphs of Azshara are hunted by the satyrs and the naga both, and my birds remember it. A beast that sits still beside its hunter tells them it's no threat, and yours is sitting very still." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because the wild hippogryphs of Azshara are hunted by the satyrs and the naga both, and my birds remember it. Your {pet} hasn't so much as twitched at my birds. Bring it round more often and they'll come to think of it as one of the flock." },
      },
      choices = {
        { text = "A well-trained beast keeps the peace. That's a hunter's duty.", next = "BACK", reply = "It is, and my birds will thank you for it. The last hunter's cat had them shrieking for a week.", fx = { align = { order = 1 } } },
        { text = "My beast does as it likes. It's not one of your birds.", next = "BACK", reply = "Then keep it well away from my roost, please. My birds have enough to fear.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because things move on the water after dark that I would rather not see, and my birds feel them before I do. A rogue might call that superstition, but I have kept these hippogryphs alive by listening to them." } },
      choices = {
        { text = "Your birds know best. I'd trust them too.", next = "BACK", reply = "Thank you, and they will be glad of it. They have kept me alive many times.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fear of the dark is no way to live.", next = "BACK", reply = "Perhaps, but it is a good way to stay alive here. The dark on this coast is not empty.", fx = { align = { order = -1 } } },
        { text = "I'll fly by day, then.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Keep your demon unsummoned while you are near the roost, and do not linger. The cursed coast has seen enough of the Legion's fire, and I will not have my birds frightened by more of it." } },
      choices = {
        { text = "I'll respect your wishes. Your birds come first.", next = "BACK", reply = "Thank you, and the birds will feel it. The coast has seen enough fire.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll do as I please, birdkeeper.", next = "BACK", reply = "Then you will not linger at my roost, and that is the end of it. I keep my birds as I please, too.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Understood.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The Horde at Valormok by day, and the naga and the Highborne ghosts by night, and the second fear runs deeper. My people lived in this land before the Sundering, and some nights the ruins seem to remember them." } },
      choices = {
        { text = "The dead deserve peace, and the Light can give it.", next = "BACK", reply = "Then I am glad you are here, priest. Many of them have wandered too long.", fx = { align = { light = 1 } } },
        { text = "The Highborne earned their unrest. Let them wander.", next = "BACK", reply = "Perhaps they did, but they were my people, and I cannot help pitying them. Ten thousand years is long enough.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Bitter enough, because Valormok sits on land my people have mourned for ten thousand years, and the orcs walk it as if it were empty. Still, the Sentinels say the orcs at least fight in the open, which is more than the naga do." } },
      choices = {
        { text = "Then meet them in the open, with honour, as they do.", next = "BACK", reply = "That is the way of the Sentinels, and I am glad you see it. Honour is all we have left here.", fx = { align = { honor = 1 } } },
        { text = "Then strike first, before they ever see you coming.", next = "BACK", reply = "That is not our way, but I will not pretend I have never thought it. The ruins make bitter hearts.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Poorly. They will not eat the grass past the ridge, and one of them sickened after drinking from the stream below the Legashi camp. I keep them on water carried up from the sea, and I ask Elune each night to make the Sentinels' work go quicker." } },
      choices = {
        { text = "Drive the satyrs back and the land will mend. That's our work.", next = "BACK", reply = "It is, and I am glad you will help with it. The land remembers who healed it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Move the roost somewhere safer. The beasts come first.", next = "BACK", reply = "Perhaps, but where? Azshara is wounded everywhere. I will stay and carry the water.", fx = { align = { honor = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_drown", when = { deathCause = "drowning" },
          text = "I heard the bay took you, and the tide gave you back, which it doesn't often do. That's why my birds don't fly over that water after dark, friend, and now you know why I'm so stubborn about it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage of the Alliance, at Talrendis Point. My hippogryphs dislike the smell of arcane magic, so I'll ask you to stand downwind until they're used to you." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior of the Alliance. My hippogryphs have carried many of your kind to Talrendis, friend, and too few of them back again, because the Haldarr are fierce." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter of the Alliance. The birds like your beast, friend, which is rare, because a hippogryph hates most things with claws." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. You will find no work for your skills at Talrendis Point, for the Sentinels watch every shadow, and so do my hippogryphs." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, at Talrendis Point. I will fly you where the Alliance permits, but my hippogryphs do not care for your kind, and neither, in truth, do I." },
        { id = "h_default", key = true,
          text = "I am Jarrodenus, keeper of the hippogryphs at Talrendis Point. They will carry you to Auberdine or Astranaar, to Talonbranch Glade or Everlook, or south to Ratchet and Theramore, over lands my people walked long before the Sundering." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "I fly them west and south after dark, never out over the bay. Something in the water watches the sky at night, and the birds feel it." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. The Sentinels pray to Elune before every watch here, and the bay gives them reason to, so you'll find Talrendis Point no stranger to prayer." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin of the Alliance. My hippogryphs have never carried so much steel, so forgive them if they grumble when you climb aboard." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the Circle, at Talrendis Point. My hippogryphs know your scent, and they settle when you come near, which is more than they do for the Sentinels." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who speaks to the winds. My hippogryphs will not fly over the bay after dark, and if you know why, I'd be glad to hear it." },
      },
      again = { { id = "h_again", text = "Is there more, or shall I call a hippogryph for the flight back to Ashenvale? Elune's light will see you home." } },
      choices = {
        { text = "Why not fly over the bay?", next = "bay" },
        { text = "The hippogryphs don't seem to like Azshara.", next = "birds" },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Why won't you fly over the bay at night?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is there anything I can do to ease your mistrust?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do the Sentinels fear most at Talrendis Point?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "They say the quarrel with Valormok is a bitter one.", next = "xapala", when = { class = "PALADIN" } },
        { text = "The Haldarr satyrs must be dangerous, Jarrodenus.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why do your hippogryphs dislike other beasts?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "How do the hippogryphs fare so near the satyrs?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why do your hippogryphs fear arcane magic, Jarrodenus?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why won't your hippogryphs fly the bay at night?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not today.", next = "END" },
      },
    },
    bay = {
      lines = { { id = "b_default", text = "Naga below, storms above, and the old ruins between, where the Highborne's ghosts still walk the cliffs. The hippogryphs will not settle over that water, and I have learned to trust them." } },
      choices = {
        { text = "Something lives in that water.", next = "bay_water" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bay_water = {
      lines = { { id = "bw_default", fx = { learn = { "spitelash" } },
        text = "The Spitelash naga, mostly, and older things that the naga leave alone. I don't ask which is worse; I only keep my birds high and my route long." } },
      choices = { { text = "A wise rule.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    birds = {
      lines = { { id = "bi_default", text = "They love the autumn trees and hate the salt wind, as I do. They were hatched in Ashenvale's quiet, and every storm off the bay sets them complaining like children at bedtime." } },
      choices = {
        { text = "They're beautiful creatures.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the hippogryphs of Talrendis Point and see that they come home. There is little else to my story." } },
    advice = { { id = "tp_ad", text = "Fly in daylight when you can. Azshara's storms come up fast, and I've already fished two soaked Sentinels out of the bay this season." } },
    sentinels = { { id = "tp_sent", text = "My sisters keep the bridge, and I keep the birds that bring them help. It is a fair division of labour." } },
    elune = { { id = "tp_elune", text = "Elune watches over my birds at night, and the birds know it, because they sleep sound when she is full. On dark moons they fret, and so do I." } },
    loramus = { { id = "tp_loramus", text = "There is a hermit on an island in the bay, and my hippogryphs will not fly over him. I have never asked them why." } },
    teldrassil = { { id = "tp_teldrassil", text = "My birds came from Teldrassil, raised in the branches, and they miss it, I think. This coast is too salty for them." } },
    tyrande = { { id = "tp_tyrande", text = "High Priestess Tyrande rode a hippogryph into battle in the old wars, and the birds remember it in their blood. I am certain of that." } },
    _none = { { id = "tp_none", text = "I keep birds, not secrets. Ask the Sentinels, or Loh'atu, the tauren by the fire; he has listened to this land almost as long as we have." } },
  },
}
