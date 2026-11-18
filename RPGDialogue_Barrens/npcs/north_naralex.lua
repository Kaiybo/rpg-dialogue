-- The Wailing Caverns: the Disciples of Naralex keeping vigil in the hillside cave above the
-- entrance (Ebru, Nalpak), Falla Sagewind waiting for word of the dream, and the Disciple of
-- Naralex who walks the caverns trying to wake his master.
-- Voices: bibles/ebru.md, bibles/nalpak.md, bibles/falla.md, bibles/naralex_disciple.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Ebru: a Disciple of Naralex who wants the deviate beasts in the caverns thinned out.
---------------------------------------------------------------------------
P:NPC {
  key = "ebru", id = TODO_NPC("Ebru"), name = "Ebru", title = "Disciple of Naralex",
  bible = "bibles/ebru.md", role = "questgiver", tier = "quest",
  temper = { "grim", "earnest" }, values = { "dutiful", "faithful" },
  notices = { "class", "form" },
  impression = {
    first = "Ebru keeps watch in the cave above the Wailing Caverns and speaks of the twisted beasts below as a sickness to be cut out. There is grief under the hard words, for the friends who went down and turned.",
    third = "{name} met Ebru, one of the Disciples of Naralex keeping vigil above the Wailing Caverns.",
  },

  greetings = {
    { id = "g_default", text = "Quietly, please. The caverns breathe, and sometimes what's below hears us up here." },
    { id = "g_erad", when = { questActive = TODO_QUEST("Deviate Eradication") }, text = "Have you been down? Every ravager and viper you kill is one less thing the nightmare can send up into the Barrens." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Then you understand what was lost down there better than most, and I'm sorry you have to see it." },
    { id = "n_form", cat = "form", when = { form = { "bear", "cat" } },
      text = "Please take your own shape while we talk. The last thing I saw walking on four legs out of those caves had no mind left in it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ebru, of the Disciples of Naralex. We followed him here to heal the Barrens, and now we keep watch at the mouth of the caverns while the beasts he meant to save grow stranger every season." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid of the Circle, or near enough. Then you'll know what Naralex hoped to do here, and you'll be able to see for yourself how badly it went." },
        { id = "h_erad_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Deviate Eradication"), days = 3 } }, text = "The caverns are quieter, and I thank you. It won't last, because the nightmare breeds them faster than we can thin them, but quiet is a gift down here." },
      },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Ask, but keep your voice down." },
      },
      choices = {
        { text = "What happened to Naralex?", next = "naralex" },
        { text = "The beasts near the caverns look wrong, somehow.", next = "deviates" },
        { text = "Did any of your order fall to the dream?", next = "fang" },
        { text = "I've walked the Emerald Dream myself, a little.", next = "dream", when = { class = "DRUID" } },
        { text = "What do you need done?", next = "BUSINESS" },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    naralex = {
      lines = { { id = "n_default", text = "He went into the Emerald Dream to call the green back into the Barrens, and something in the Dream took hold of him instead. He sleeps somewhere deep in the caverns, and his dreams have turned to nightmares that seep into the water and the stone." } },
      choices = {
        { text = "Can he be woken?", next = "woken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    woken = {
      lines = { { id = "w_default", text = "One of us believes so, and he's gone down to try. If someone strong enough walks with him past the Druids of the Fang and the beasts, he says he can call Naralex back, though I've buried enough hope in those caves not to count on it." } },
      choices = {
        { text = "Then I'll help him try.", next = "BACK", fx = { align = { light = 1 }, learn = { "naralex" } } },
        { text = "Some sleepers are better left alone.", next = "BACK", fx = { align = { light = -1 }, learn = { "naralex" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "naralex" } } },
      },
    },
    deviates = {
      lines = { { id = "d_default", text = "Raptors, serpents, plants and stranger things, all drinking from water fouled by the nightmare. They grow too large and too vicious, and they've started coming up into the Barrens to hunt." } },
      choices = {
        { text = "Surely they could be healed.", next = "healed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    healed = {
      lines = { { id = "hd_default", text = "I tried, for a year, and I lost two friends to it. Whatever the nightmare did to them goes deeper than the flesh, and the kindest thing left is to end them cleanly and give the land back its quiet." } },
      choices = {
        { text = "A clean end is a mercy. I'll give it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Killing them is giving up. Keep trying.", next = "BACK", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fang = {
      lines = { { id = "f_default", text = "They were our brothers and sisters once, the ones who went down first to help him. The dream took them too, and now they call themselves the Druids of the Fang and guard his sleep like jailers." } },
      choices = {
        { text = "You speak of them like old friends.", next = "knew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    knew = {
      lines = { { id = "k_default", text = "I shared a fire with Cobrahn for three winters, and Anacondra taught me the names of every herb in Ashenvale. If you meet them below, don't hesitate on my account, because whoever they were is already gone." } },
      choices = {
        { text = "I'm sorry for your loss.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream = {
      lines = { { id = "dr_default", text = "Then be careful, druid, more careful than Naralex was. The Dream is beautiful and vast, and somewhere in it something has learned to wear that beauty like a mask." } },
      choices = {
        { text = "I'll keep that warning close.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    naralex = { { id = "tp_nar", text = "Naralex is our teacher, a night elf of the Cenarion Circle, asleep in the caverns below and dreaming badly.", next = "naralex" } },
    wailing_caverns = { { id = "tp_wc", text = "The caverns lie below us, wet and winding and full of things that used to be gentle." } },
    _none = { { id = "tp_none", text = "I'm sorry, but my thoughts are with the caverns. I can't help you with that." } },
  },
}

---------------------------------------------------------------------------
-- Nalpak: a Disciple of Naralex with a practical streak, who wants deviate hides to study.
---------------------------------------------------------------------------
P:NPC {
  key = "nalpak", id = TODO_NPC("Nalpak"), name = "Nalpak", title = "Disciple of Naralex",
  bible = "bibles/nalpak.md", role = "questgiver", tier = "quest",
  temper = { "curious", "dry" }, values = { "wise", "practical" },
  notices = { "craft", "class" },
  impression = {
    first = "Nalpak studies the deviate beasts of the Wailing Caverns through their hides, hoping to learn what the nightmare is doing to the living. He is drier and more practical than his fellow disciples, and less hopeful.",
    third = "{name} met Nalpak, a Disciple of Naralex studying the twisted beasts of the Wailing Caverns.",
  },

  greetings = {
    { id = "g_default", text = "Mind the hides drying by the wall, {class}. They stink, but they're the most useful things in this cave." },
    { id = "g_hides", when = { questActive = TODO_QUEST("Deviate Hides") }, text = "Any hides yet? I'd take them torn, scorched or bloody, as long as they came off something deviate." },
  },

  notice = {
    { id = "n_skin", cat = "craft", when = { profession = { "Skinning", "Leatherworking" } },
      text = "A skinner, by your hands. Then you'll be gentler with the hides than most, and I'll thank you for it." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Keep your beast away from anything in the caverns, because I've seen what the nightmare does to an animal that eats there." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Nalpak, of the Disciples. While the others pray for Naralex, I study what his dreams are doing to the beasts below, because you can't cure a sickness you don't understand." },
        { id = "h_hides_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Deviate Hides"), days = 3 } }, text = "The hides you brought are fascinating, and horrible. The scales have grown through the fur in places, as if the beast couldn't decide what it was meant to be." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've hides to scrape." },
        { id = "h_again2", text = "What else, {class}?" },
      },
      choices = {
        { text = "What do the hides tell you?", next = "hides" },
        { text = "Naralex might still be saved.", next = "saved" },
        { text = "How did you come to follow Naralex?", next = "follow" },
        { text = "I'm a skinner. What should I look for?", next = "skinner", when = { profession = { "Skinning", "Leatherworking" } } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Good luck with your studies.", next = "END" },
      },
    },
    hides = {
      lines = { { id = "hd_default", text = "That the change comes from inside, through the water they drink. The beasts closest to the deep pools are the most twisted, and the ones near the entrance are only a little wrong, so the nightmare spreads from the center outward." } },
      choices = {
        { text = "I'd guess it could spread beyond the caverns.", next = "spread" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spread = {
      lines = { { id = "sp_default", text = "It already has. The oases to the south are going bad, and the tauren druids at the Crossroads are seeing the same sickness in the water there, so the caverns aren't keeping their secret to themselves." } },
      choices = {
        { text = "Then the caverns must be cleansed, whatever it costs.", next = "BACK", fx = { align = { order = -1 }, learn = { "oases" } } },
        { text = "Study first. Rushing in made all this worse.", next = "BACK", fx = { align = { order = 1 }, learn = { "oases" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "oases" } } },
      },
    },
    saved = {
      lines = { { id = "sv_default", text = "I believe he's still alive, which isn't the same thing. Whether there's enough of him left to wake is a question the hides can't answer, and I've stopped asking them to." } },
      choices = {
        { text = "You've lost faith, then.", next = "faith" },
        { text = "Something else.", next = "BACK" },
      },
    },
    faith = {
      lines = { { id = "fa_default", text = "I've traded it for patience, which lasts longer. Ebru has faith enough for the both of us, and the disciple who went below has more than is good for him." } },
      choices = {
        { text = "Patience will see him home.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    follow = {
      lines = { { id = "fo_default", text = "He promised the Barrens could bloom again, and I'd spent enough years watching it bake to want that badly. I still want it, which is why I'm still here with a cave full of stinking hides." } },
      choices = {
        { text = "That's a worthy thing to want.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    skinner = {
      lines = { { id = "sk_default", text = "Look at the underside, where the hide is thinnest. If the veins show green through it, the beast drank from the deep pools, and I'll want that one most of all." } },
      choices = {
        { text = "I'll bring you the green ones.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    oases = { { id = "tp_oasis", text = "The oases are being fouled from below, because the caverns' sickness rises through the water. I'm nearly sure of it." } },
    _none = { { id = "tp_none", text = "Not my study, I'm afraid. Ask me about hides." } },
  },
}

---------------------------------------------------------------------------
-- Falla Sagewind: a tauren druid on the hill above the caverns, who receives the glowing
-- shard that adventurers bring up from Naralex's chamber.
---------------------------------------------------------------------------
P:NPC {
  key = "falla", id = TODO_NPC("Falla Sagewind"), name = "Falla Sagewind",
  bible = "bibles/falla.md", role = "questgiver", tier = "quest",
  temper = { "gentle", "thoughtful" }, values = { "faithful", "wise" },
  notices = { "race", "class" },
  impression = {
    first = "Falla Sagewind waits on the hill above the Wailing Caverns for any sign from the dream below. She is gentle and slow to speak, and she listens to the wind before she answers.",
    third = "{name} met Falla Sagewind, a tauren druid keeping watch over the Wailing Caverns.",
  },

  greetings = {
    { id = "g_default", text = "Walk softly, little one. The ground here remembers when it was green." },
    { id = "g_shard", when = { questActive = TODO_QUEST("The Glowing Shard") }, text = "You carry something from below, I can feel it. Show me, please." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Shu'halo, so far from Mulgore. The Earthmother walks with you here too, though she weeps a little in this place." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Then you can feel it too, the wrongness under the grass, like a fever in the ground." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Falla Sagewind. I wait here for word from the caverns, because Naralex's dream reaches up through the land, and sometimes it sends us a sign." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A child of the Earthmother. I am Falla Sagewind, and I keep watch here, because what sleeps below the Barrens troubles the land our people walk." },
        { id = "h_shard_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Glowing Shard") }, text = "The shard you brought up still glows when I hold it, though dimmer each day. I take that as a sign that Naralex still dreams, and still fights." },
      },
      again = {
        { id = "h_again", text = "Is there more, little one?" },
        { id = "h_again2", text = "The wind is patient, and so am I. Ask." },
      },
      choices = {
        { text = "What signs come from the caverns?", next = "signs" },
        { text = "How do tauren see Naralex's mistake?", next = "tauren" },
        { text = "What lies beneath the Barrens?", next = "beneath" },
        { text = "I've reached the depths of the caverns.", next = "depths", when = { cleared = "Wailing Caverns" } },
        { text = "I have something for you.", next = "BUSINESS" },
        { text = "Earthmother keep you.", next = "END" },
      },
    },
    signs = {
      lines = { { id = "s_default", text = "Crystals that glow with his dreaming, carried up by those who go deep enough. When they shine, I know he still lives, and when they dim, I know the nightmare has pressed closer." } },
      choices = {
        { text = "What do you do with them?", next = "shards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shards = {
      lines = { { id = "sh_default", text = "I hold them, and I listen, and I send word to Thunder Bluff when I hear something the Archdruid should know. It's slow work, but the earth is slow, and it doesn't reward impatience." } },
      choices = {
        { text = "I'll bring you any I find.", next = "BACK", fx = { affinity = 1, learn = { "naralex" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "naralex" } } },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "Some of the elders say a night elf had no right to reshape our land, even to heal it. I say he loved the land as we do and tried too hard, which is a gentler kind of wrong." } },
      choices = {
        { text = "Good intentions don't excuse the harm done.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "He meant well. That counts for something.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beneath = {
      lines = { { id = "b_default", text = "Water, long tunnels and the roots of very old things. The Wailing Caverns are named for the wind that moans through them, and the tauren have heard that moan for as long as we've walked the Barrens." } },
      choices = {
        { text = "You speak as if the wailing has changed.", next = "changed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    changed = {
      lines = { { id = "c_default", text = "It has. It used to sound like wind, and now on some nights it sounds like weeping, and the kodo won't graze within a mile of the entrance." } },
      choices = {
        { text = "Then something must be done.", next = "BACK", fx = { learn = { "wailing_caverns" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "wailing_caverns" } } },
      },
    },
    depths = {
      lines = { { id = "d_default", text = "Then you have seen him, or seen where he sleeps. Did the land feel any different when you came out, lighter perhaps? I would like to believe it did." } },
      choices = {
        { text = "It felt lighter. Something changed.", next = "BACK", fx = { affinity = 2 } },
        { text = "It felt the same. I'm sorry.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    naralex = { { id = "tp_nar", text = "Naralex is a night elf who dreamed of a green Barrens and found a nightmare instead. He still sleeps below us." } },
    wailing_caverns = { { id = "tp_wc", text = "The Wailing Caverns are the caves beneath us, where the wind weeps and the beasts grow strange." } },
    _none = { { id = "tp_none", text = "The wind hasn't told me about that, little one." } },
  },
}

---------------------------------------------------------------------------
-- Disciple of Naralex: the night elf who waits inside the caverns for someone strong enough
-- to escort him to his master's side for the awakening.
---------------------------------------------------------------------------
P:NPC {
  key = "naralex_disciple", id = TODO_NPC("Disciple of Naralex"), name = "Disciple of Naralex",
  bible = "bibles/naralex_disciple.md", role = "questgiver", tier = "quest",
  temper = { "earnest", "weary" }, values = { "faithful", "loyal" },
  notices = { "class", "race" },
  impression = {
    first = "The Disciple of Naralex has been waiting in the caverns for someone strong enough to walk him to his master's side. He is tired almost past speaking, and holds on to the hope of the awakening anyway.",
    third = "{name} met the Disciple of Naralex in the Wailing Caverns, the last follower still trying to wake his master.",
  },

  greetings = {
    { id = "g_default", text = "You made it this far, stranger. Then perhaps, Elune willing, you can make it further, with me." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. If anything goes wrong during the ritual, I'll need your help to hold the nightmare back." },
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "One of the Horde, come to help a night elf in the dark. Naralex would be glad of that, I think." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am a disciple of Naralex, the last of us who still walks these caverns with a clear mind. I have the means to wake him, but not the strength to fight my way to him alone, and my shan'do has slept too long already." },
        { id = "h_cleared", when = { cleared = "Wailing Caverns" }, text = "You came back. I feel him stirring more each time someone reaches his chamber, as if the nightmare loosens a little with every blow struck against it." },
      },
      again = {
        { id = "h_again", text = "What else? We should not wait long; even the kaldorei cannot outlast a nightmare." },
        { id = "h_again2", text = "Ask quickly. The nightmare stirs." },
      },
      choices = {
        { text = "How will you wake him?", next = "wake" },
        { text = "What happened to the other disciples?", next = "others" },
        { text = "Why did you stay?", next = "stay" },
        { text = "The Fang leaders are dead.", next = "leaders", when = { cleared = "Wailing Caverns" } },
        { text = "Let's begin.", next = "BUSINESS" },
        { text = "Not yet.", next = "END" },
      },
    },
    wake = {
      lines = { { id = "w_default", text = "A ritual of awakening, sung at his side, with the Fang's leaders slain so their dream gems no longer hold him down. Walk with me and keep the beasts from me while I sing, and we may yet bring him home." } },
      choices = {
        { text = "What might go wrong?", next = "wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "wr_default", text = "The nightmare will fight back, and I don't know what form it will take. Something has fed on his dreams for years, something the Emerald Dream itself should never have held, and it won't like being driven out." } },
      choices = {
        { text = "Whatever comes, I'll face it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it gets bad, I'm leaving you.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "The leaders became the Druids of the Fang, and they guard him now like a prize. The rest fled up into the sunlight and keep watch at the cave mouth, praying for news I hope to bring them." } },
      choices = {
        { text = "You must blame the Fang for this.", next = "blame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blame = {
      lines = { { id = "b_default", text = "I blame what got into them. They went down for love of him, as I did, and the only difference between us is that the dream chose them first." } },
      choices = {
        { text = "Then they deserve pity.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They chose to stay. They deserve what's coming.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "s_default", text = "Because he would have stayed for me. He brought us here to heal a land that wasn't even ours, and if I left him to rot in his own dream, I'd be no disciple at all." } },
      choices = {
        { text = "Then let's get him out.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    leaders = {
      lines = { { id = "l_default", text = "Then their hold on him is broken, and the way is open. I owe you more than I can say, so stay close when we begin, because the hardest part is still ahead." } },
      choices = {
        { text = "I'll stay close.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    naralex = { { id = "tp_nar", text = "Naralex is my teacher. He sleeps below, and I mean to wake him.", next = "wake" } },
    _none = { { id = "tp_none", text = "I can't think of that now. Naralex is all that matters, and Elune grant I reach him in time." } },
  },
}
