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
    { id = "g_default", text = "Greetings, friend. Speak gently here; the Sentinels are listening, and so am I." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the border. The Earthmother keeps you, it seems." },
    { id = "g_helped", when = { questDone = TODO_QUEST("Spiritual Unrest") }, text = "The shrine is quieter since you went there. I sleep better for it, and so do the Sentinels." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The ghosts walk further from the shrine after dark. Stay near the fire, friend." },
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
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They trust me a little more each season, I think, because I keep my promise and bring no trouble. A warlock will find it harder, for they have seen what demons did to this land, and I cannot say they are wrong to fear it." } },
      choices = {
        { text = "Their fear is fair. I'll earn their trust.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear is their weakness, not my problem.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll keep my demon quiet.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They clung to their magic when the world broke, and now it clings to them, so they cannot rest. I pray over each one I free, and I write to the elders of Thunder Bluff about what I learn, though I am never sure they understand." } },
      choices = {
        { text = "They deserve to rest. I'll help free them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They made their choice. Let them linger.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "That's a sad fate.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, here among the Sentinels? You are braver than I was, friend, or less careful, because the elves watch even a quiet tauren closely." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. The Highborne ghosts at the Shadowsong Shrine were mages too, and they still cling to this land, so I wonder whether you feel them more keenly than I do." },
        { id = "h_default", key = true,
          text = "I am Loh'atu. The Sentinels let me share their camp so long as I bring no trouble with me, and I have kept that promise for longer than they expected. I came to learn what is wrong with this land, and I have learned a great deal of it." },
        { id = "h_satyr", when = { questActive = TODO_QUEST("A Land Filled with Hatred") },
          text = "The Haldarr clan is to the northeast, among the broken stones. Strike at them hard, friend, because they will not stop on their own." },
        { id = "h_spirits", when = { questActive = TODO_QUEST("Spiritual Unrest") },
          text = "The spirits gather at the Shadowsong Shrine, just across the way. Release as many as you can; they have waited ten thousand years for someone to do it." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Sit with me a while, friend. You have done more good on this border than most who pass over that bridge, and I would rather talk with you than with the ghosts." },
        { id = "h_cool", when = { disposition = { max = 34 } },
          text = "I keep my promises to the Sentinels, and I would ask you to keep yours to me. Say what you need, and then let us both go about our work." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I have time; the land does not hurry, and neither do I." },
        { id = "h_again2", text = "Ask, friend. A guest learns to listen, and I have had a great deal of practice." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Go on. The fire is warm and the Sentinels are pretending not to listen." },
      },
      choices = {
        { text = "Why would a tauren live in a night elf camp?", next = "guest" },
        { text = "What is wrong with this land?", next = "land" },
        { text = "Who was Azshara?", next = "queen" },
        { text = "What else is there to see in Azshara?", next = "places" },
        { text = "I can help lay the Highborne spirits to rest.", next = "priest", when = { class = "PRIEST" } },
        { text = "These ruins belonged to my people, long ago.", next = "elf", when = { race = "NightElf" } },
        { text = "The Earthmother sent you a long way from home.", next = "kin", when = { race = "Tauren" } },
        { text = "My ancestors were Highborne, as it happens.", next = "skyborne", when = { all = { { race = "Skyborne" }, { faction = "Alliance" } } } },
        { text = "Do the Sentinels trust you after all this time?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Why do the Highborne ghosts remain?", next = "xmage", when = { class = "MAGE" } },
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
        { text = "The Alliance and Horde could learn from that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Peace that needs watching isn't peace at all.", next = "BACK", fx = { trait = { skeptical = 1 }, align = { order = -1 } } },
        { text = "Do they truly trust you, Loh'atu?", tag = "Persuade", next = "trust",
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
      choices = { { text = "Fair enough.", next = "BACK" } },
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
        { text = "They chose demons. They get no mercy from me.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Even satyr were elves once. I'd pity them.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 } } },
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
        { text = "Then the arcane itself is the danger.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Magic isn't evil. Greed is.", next = "BACK", fx = { align = { order = -1 }, trait = { skeptical = 1 } } },
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
        { text = "And the land is named for her?", next = "queen_name" },
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
        { text = "What happened to the furbolgs?", next = "places_furbolg" },
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
        { text = "They deserve pity, not arrows.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A hostile furbolg is still hostile.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
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
        { text = "I'll pray over each one as I release it.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, standing = { talrendis_point = 1 } },
          journal = { first = "Loh'atu asked me to free the Highborne ghosts at the Shadowsong Shrine. I promised to pray over each one as it went.",
                      third = "{name} promised Loh'atu to pray over each Highborne spirit freed at the Shadowsong Shrine." } },
        { text = "They brought this on themselves. I'll free them, not mourn them.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "The Highborne were not my people. They were our ruin.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "They were kaldorei, whatever they did. I mourn them.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 }, affinity = 1 } },
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

  topics = {
    knows = {
      { id = "tp_knows", text = "I know a little of this land, mostly from walking it and listening. Ask what you will, and you will have it honestly, as I learned it." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you, friend, I will tell everything I know, and say plainly where my knowing runs out." },
    },
    background = {
      { id = "tp_bg", text = "A tauren of Mulgore who made a promise to the Earthmother and followed it all the way to the elves' border.", next = "guest" },
    },
    advice = { { id = "tp_ad", text = "Keep to the road, keep your voice low near the shrine, and never draw a weapon inside a camp that has given you its fire." } },
    rumors = { { id = "tp_rum", text = "The Sentinels say the naga dig at Eldarath every night, and that whatever they want has been buried there since before the sea came in." } },
    sentinels = { { id = "tp_sent", text = "Good hosts, if watchful ones. They keep the bridge to Ashenvale, and they keep an eye on me, and I think they do both well." } },
    satyrs = { { id = "tp_satyr", text = "The Haldarr are the closest of them, to the northeast. The elves say they were kin once, which is why the Sentinels hunt them so hard.", next = "land_satyr" } },
    highborne = { { id = "tp_hb", text = "The proudest mages the elves ever had, and now the saddest ghosts in Azshara.", next = "land_spirits" } },
    queen_azshara = { { id = "tp_queen", text = "The elves' old queen, whose hunger for magic broke the world. I know only the little they will say of her.", next = "queen" } },
    furbolgs = { { id = "tp_furb", text = "A gentle people once, struck down from every side. I grieve for them more than I fear them.", next = "places_furbolg" } },
    xylem = { { id = "tp_xylem", text = "The human mage in the tower to the north. I have never met him, and I am content to keep it so." } },
    eldarath = { { id = "tp_eld", text = "The great ruin east along the road, and the naga's now. Go there with friends, or not at all." } },
    cenarion_circle = { { id = "tp_circle", text = "Druids of my people and the elves together, working to heal what the demons broke. I wish there were more of them here." } },
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
    { id = "g_default", text = "Ishnu-alah. If you need to fly, the hippogryphs are rested." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the Point, and the hippogryphs lift their heads at your step. They choose their friends carefully." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "A sister or brother of the kaldorei, out on the cursed coast. Elune keep you; the hippogryphs will be glad of a familiar voice." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because things move on the water after dark that I would rather not see, and my birds feel them before I do. A rogue might call that superstition, but I have kept these hippogryphs alive by listening to them." } },
      choices = {
        { text = "Your birds know best. I'd trust them too.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fear of the dark is no way to live.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll fly by day, then.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Keep your demon unsummoned while you are near the roost, and do not linger. The cursed coast has seen enough of the Legion's fire, and I will not have my birds frightened by more of it." } },
      choices = {
        { text = "I'll respect your wishes. Your birds come first.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll do as I please, birdkeeper.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Understood.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The Horde at Valormok by day, and the naga and the Highborne ghosts by night, and the second fear runs deeper. My people lived in this land before the Sundering, and some nights the ruins seem to remember them." } },
      choices = {
        { text = "The dead deserve peace, and the Light can give it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Highborne earned their unrest. Let them wander.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Bitter enough, because Valormok sits on land my people have mourned for ten thousand years, and the orcs walk it as if it were empty. Still, the Sentinels say the orcs at least fight in the open, which is more than the naga do." } },
      choices = {
        { text = "Then meet them in the open, with honour, as they do.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then strike first, before they ever see you coming.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The Horde at Valormok by day, and the naga and the Highborne ghosts by night, and the second fear runs deeper. My people lived in this land before the Sundering, and some nights the ruins seem to remember them." } },
      choices = {
        { text = "The dead deserve peace, and the Light can give it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Highborne earned their unrest. Let them wander.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Bitter enough, because Valormok sits on land my people have mourned for ten thousand years, and the orcs walk it as if it were empty. Still, the Sentinels say the orcs at least fight in the open, which is more than the naga do." } },
      choices = {
        { text = "Then meet them in the open, with honour, as they do.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then strike first, before they ever see you coming.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The Horde at Valormok by day, and the naga and the Highborne ghosts by night, and the second fear runs deeper. My people lived in this land before the Sundering, and some nights the ruins seem to remember them." } },
      choices = {
        { text = "The dead deserve peace, and the Light can give it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Highborne earned their unrest. Let them wander.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Bitter enough, because Valormok sits on land my people have mourned for ten thousand years, and the orcs walk it as if it were empty. Still, the Sentinels say the orcs at least fight in the open, which is more than the naga do." } },
      choices = {
        { text = "Then meet them in the open, with honour, as they do.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then strike first, before they ever see you coming.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue. You will find no work for your skills at Talrendis Point, for the Sentinels watch every shadow, and so do my hippogryphs." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, at Talrendis Point. I will fly you where the Alliance permits, but my hippogryphs do not care for your kind, and neither, in truth, do I." },
        { id = "h_default", key = true,
          text = "Jarrodenus, keeper of the hippogryphs at Talrendis Point. They will carry you to Auberdine or Astranaar, to Talonbranch Glade or Everlook, or south to Ratchet and Theramore, if your business takes you so far." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "I fly them west and south after dark, never out over the bay. Something in the water watches the sky at night, and the birds feel it." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. The Sentinels pray to Elune before every watch here, and the bay gives them reason to, so you'll find Talrendis Point no stranger to prayer." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin of the Alliance. My hippogryphs have never carried so much steel, so forgive them if they grumble when you climb aboard." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. The Sentinels pray to Elune before every watch here, and the bay gives them reason to, so you'll find Talrendis Point no stranger to prayer." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin of the Alliance. My hippogryphs have never carried so much steel, so forgive them if they grumble when you climb aboard." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. The Sentinels pray to Elune before every watch here, and the bay gives them reason to, so you'll find Talrendis Point no stranger to prayer." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin of the Alliance. My hippogryphs have never carried so much steel, so forgive them if they grumble when you climb aboard." },
      },
      again = { { id = "h_again", text = "Is there more, or shall I call a hippogryph for the flight back to Ashenvale?" } },
      choices = {
        { text = "Why not fly over the bay?", next = "bay" },
        { text = "How do the hippogryphs like Azshara?", next = "birds" },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Why won't you fly over the bay at night?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is there anything I can do to ease your mistrust?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do the Sentinels fear most at Talrendis Point?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is the quarrel with Valormok as bitter as they say?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the Sentinels fear most at Talrendis Point?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is the quarrel with Valormok as bitter as they say?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the Sentinels fear most at Talrendis Point?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is the quarrel with Valormok as bitter as they say?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Not today.", next = "END" },
      },
    },
    bay = {
      lines = { { id = "b_default", text = "Naga below, storms above, and the old ruins between, where the Highborne's ghosts still walk the cliffs. The hippogryphs will not settle over that water, and I have learned to trust them." } },
      choices = {
        { text = "What lives in the water?", next = "bay_water" },
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
    advice = { { id = "tp_ad", text = "Fly in daylight when you can. Azshara's storms come up fast, and the sea does not give back what it takes." } },
    sentinels = { { id = "tp_sent", text = "My sisters keep the bridge, and I keep the birds that bring them help. It is a fair division of labour." } },
    _none = { { id = "tp_none", text = "I keep birds, not secrets. Ask the Sentinels, or the tauren by the fire." } },
  },
}
