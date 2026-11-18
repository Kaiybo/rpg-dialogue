-- Darkspear Islands emissary (Forever): a Darkspear troll of the Darkspear Raiders who stands in
-- Orgrimmar, Undercity and Thunder Bluff and recruits for the fight against the Theramore
-- Expeditionary Force on the Darkspear trolls' old islands. Male and female versions share one
-- name, so no line says which. Voice: bibles/emissary_darkspear.md
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "emissary_darkspear", id = TODO_NPC("Darkspear Emissary"), name = "Darkspear Emissary",
  bible = "bibles/emissary_darkspear.md", role = "soldier", tier = "quest",
  temper = { "wry", "proud" }, values = { "loyal", "cunning" },
  notices = { "pvp", "race", "level" },

  impression = {
    first = "The jokes stopped whenever the islands came up.",
    third = "{name} met the Darkspear Emissary, a troll of the Darkspear Raiders who recruits for the fight against Theramore on the Darkspear Islands.",
  },

  greetings = {
    { id = "g_default", text = "Hey, mon, you got a strong arm and a free afternoon? The Darkspear Raiders be needing both on the old islands." },
    { id = "g_low", when = { maxLevel = 29 }, text = "Sorry, {class}, but you not experienced enough for the Darkspear Islands yet. Come back when the jungle won't swallow you whole." },
    { id = "g_back", when = { metBefore = true, minLevel = 30 }, text = "You came back! Either the islands didn't scare you, or you haven't been yet, and both be good news for me." },
    { id = "g_troll", when = { race = "Troll" }, text = "A Darkspear face, praise the loa! Come, sit a moment, and let me tell you how the old home be doing." },
    { id = "g_honored", when = { reputation = { faction = "Darkspear Trolls", min = "honored" } }, text = "Vol'jin's people know your name, friend, and that be no small thing. The Raiders would be glad to have you on the islands." },
  },

  notice = {
    { id = "n_rank", cat = "pvp", when = { pvpRank = 6 },
      text = "An officer of the Horde, I see. The young ones on the islands could use somebody who knows when to charge and when to hide in the trees." },
    { id = "n_troll", cat = "race", when = { race = "Troll" }, place = "before",
      text = "You got the old islands in your blood, even if you were born in Stranglethorn or on the Echo Isles. I can see it in how you stand." },
    { id = "n_young", cat = "level", when = { maxLevel = 15 },
      text = "So small, and already in the capital asking about wars? The loa like brave ones, but they like live ones better." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I speak for the Darkspear Raiders. Far over the sea be the islands where the Darkspear lived before the Horde found us, and Theramore's soldiers be walking on them now, so we need fighters to go and walk them back off." },
        { id = "h_low", when = { maxLevel = 29 },
          text = "I speak for the Darkspear Raiders, and I be sorry, {class}, but the islands be no place for you yet. Go and get some fights behind you, and then come and find me again." },
        { id = "h_og", when = { zone = "Orgrimmar" },
          text = "Vol'jin stands beside the Warchief in that big hall up the road, so it be right that the Raiders recruit here too. Far over the sea be the islands where the Darkspear lived before the Horde found us, and Theramore be sitting on them now." },
        { id = "h_uc", when = { zone = "Undercity" },
          text = "It be cold down here among the Forsaken, and there be no sun at all, but they fight hard and they don't mind a little rain. Far over the sea be the Darkspear's old islands, and Theramore be sitting on them now, so I came to ask the dead for help." },
        { id = "h_tb", when = { zone = "Thunder Bluff" },
          text = "The wind up on this mesa be fierce, and I miss the sea every day I stand here. But the tauren be strong and steady, and the Darkspear's old islands far over the water need fighters who don't run from the tide." },
        { id = "h_troll", when = { race = "Troll" },
          text = "Darkspear, listen to me. The islands where Sen'jin made his last stand be under Theramore's boots now, and the Raiders be going back for them, so I hope you be coming too." },
        { id = "h_honored", when = { reputation = { faction = "Darkspear Trolls", min = "exalted" } },
          text = "The whole tribe owes you, from Sen'jin Village to the Warchief's hall. Stand with me a while, and let me tell you about the place we came from." },
      },
      again = {
        { id = "h_again", text = "What else, mon? I got time, and stories to fill it." },
        { id = "h_again2", text = "Go on, ask. The boats don't leave without me." },
        { id = "h_again3", text = "Anything more? Talking about the old home be my favorite part of this job." },
      },
      choices = {
        { text = "Tell me about the Darkspear Islands.", next = "islands" },
        { text = "Who holds them now?", next = "theramore" },
        { text = "What's the fighting like there?", next = "ground" },
        { text = "What does Vol'jin say about all this?", next = "voljin" },
        { text = "Why recruit here, of all places?", next = "city" },
        { text = "Why should a Darkspear go back there?", next = "k_troll", when = { race = "Troll" } },
        { text = "Our Warchief landed on those islands, didn't he?", next = "k_orc", when = { race = "Orc" } },
        { text = "The tauren have no quarrel with Theramore.", next = "k_tauren", when = { race = "Tauren" } },
        { text = "Why should the dead care about troll islands?", next = "k_forsaken", when = { race = "Scourge" } },
        { text = "My people know something of losing islands.", next = "k_skyborne", when = { race = "Skyborne" } },
        { text = "Do the spirits still live on those islands?", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "What beasts roam the old islands?", next = "x_hunter", when = { class = "HUNTER" } },
        { text = "Send me to the islands.", next = "BUSINESS", when = { minLevel = 30 } },
        { text = "I'll think about it.", next = "END" },
      },
    },

    -- The history
    islands = {
      lines = {
        { id = "is_default", text = "A string of jungle islands, far over the sea, with a mountain of fire in the middle. The Darkspear fled there from Stranglethorn when the other tribes would have wiped us out, and we lived there for many years before the storm brought the Warchief's ships." },
      },
      choices = {
        { text = "What happened when the Warchief came?", next = "islands_senjin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    islands_senjin = {
      lines = {
        { id = "isj_default", text = "Sen'jin, Vol'jin's father, had seen the Warchief in a vision, so he greeted the orcs as friends. The humans of Kul Tiras were already on the islands, fighting us, and the orcs and the Darkspear fought them together, until the murlocs came out of the ground and took both sides prisoner." },
      },
      choices = {
        { text = "The murlocs? What did they want?", next = "islands_witch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    islands_witch = {
      lines = {
        { id = "iw_default", text = "To feed their prisoners to the sea witch they worshipped, down in the caves. The Warchief broke free, but Sen'jin was dying on the altar, and he told Thrall to lead the trolls away, and then the mountain woke and the sea witch cursed us as we sailed." },
      },
      choices = {
        { text = "Then why go back, after all that?", next = "stayed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stayed = {
      lines = {
        { id = "st_default", text = "Because not everybody left, mon. Some of our people stayed behind on the islands when the Horde sailed, and the Darkspear have graves there older than Orgrimmar's walls, and now there be strangers walking over all of it." },
      },
      choices = {
        { text = "What became of those who stayed?", next = "stayed_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stayed_who = {
      big = true,
      lines = {
        { id = "sw_default", text = "That be what the Raiders want to know. Some say we should bring them all to Durotar, where the Horde can keep them safe, and some say the islands be theirs and we should fight to let them stay. Which would you choose?" },
      },
      choices = {
        { text = "Bring them home to the Horde, where they're safe.", next = "BACK", reply = "Dat be the safe answer, and many of the elders say it too, though some of dem old ones would sooner die on the sand than live in a city of orcs.", fx = { align = { order = 1 } } },
        { text = "The islands are theirs. Fight so they can stay.", next = "BACK", reply = "Ah, you got the fire of Sen'jin in you, mon, and the Raiders be glad to hear it, because a tribe dat runs from every home never gets to keep one.", fx = { align = { order = -1 } } },
        { text = "Ask them first. It should be their choice.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },

    -- The enemy
    theramore = {
      lines = {
        { id = "th_default", text = "The Theramore Expeditionary Force, they call themselves, and they come from Jaina Proudmoore's city across the water from Durotar. Many of her people be Kul Tiran, and the Kul Tirans fought us on those same beaches once, so you can guess how glad we be to see them." },
      },
      choices = {
        { text = "What does Theramore want with the islands?", next = "theramore_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theramore_why = {
      lines = {
        { id = "tw_default", text = "I don't know, and they haven't sent anybody to tell us. Maybe they remember the old Kul Tiras outpost, or maybe somebody in Theramore thinks the islands be good for ships, but it don't matter much why, because they be there and we want them gone." },
      },
      choices = {
        { text = "Jaina keeps the peace with Thrall. Should we fight?", next = "theramore_peace" },
        { text = "Then why does it matter now, after so long?", next = "stayed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theramore_peace = {
      big = true,
      lines = {
        { id = "tp_default", text = "That be the question everybody in the Raiders argues over by the fire. The Warchief and the lady of Theramore keep their truce, and nobody wants to break it, but the soldiers on the islands be shooting at us all the same. How would you deal with them?" },
      },
      choices = {
        { text = "Fight only as hard as we must, and leave room for peace.", next = "BACK", reply = "Vol'jin would say the same, and he be wiser than me, so I'll pass your words along and hope the Theramore soldiers be listenin' too.", fx = { align = { light = 1 } } },
        { text = "They shot first. Drive them into the sea.", next = "BACK", reply = "Plenty of young Darkspear feel the way you do, and I can't blame dem, but if the truce breaks over dis, it be the whole Horde paying, not just the islands.", fx = { align = { light = -1 } } },
        { text = "I'll leave that to the Warchief.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    -- The battle
    ground = {
      lines = {
        { id = "gr_default", text = "Fifteen of ours against fifteen of theirs, fighting over the old tower, the ruins, the camp and a cove full of broken ships. You hold what you can, you take back what you lose, and you don't stop moving." },
      },
      choices = {
        { text = "A cove full of broken ships?", next = "ground_cove" },
        { text = "Any advice for the fight?", next = "ground_advice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ground_cove = {
      lines = {
        { id = "gc_default", text = "Shipwreck Cove, we call it, and the old ones say some of those wrecks be from the storm that brought the Warchief, or from the Kul Tiras ships that chased him. I can't promise that be true, but it makes a good story to tell before a fight." },
      },
      choices = {
        { text = "It's a good story, true or not.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ground_advice = {
      lines = {
        { id = "ga_default", text = "Learn the jungle paths, because the humans march on the open ground and we don't have to. And never follow anybody into the surf, because the tide on those islands be meaner than any soldier." },
        { id = "ga_rogue", when = { class = "ROGUE" }, text = "You already know the trick, I think. The humans march on the open ground and watch the beaches, so you take the jungle paths and come out where they least want to see you." },
      },
      choices = {
        { text = "I'll keep to the trees.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Vol'jin and the Echo Isles
    voljin = {
      lines = {
        { id = "vj_default", text = "Vol'jin was young when his father died on those islands, and he don't speak of it often. But the Raiders go with his blessing, and he says the Darkspear must never forget where we came from, even while we build a new home in Durotar." },
      },
      choices = {
        { text = "Isn't the Darkspear home the Echo Isles now?", next = "echo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    echo = {
      lines = {
        { id = "ec_default", text = "It should be, but Zalazane went mad and took the Echo Isles with his dark voodoo, so most of the tribe lives at Sen'jin Village on the coast. We lost one home to the sea witch and another to a traitor, and the Raiders don't mean to lose the old one to Theramore as well.", fx = { learn = { "echo_isles" } } },
      },
      choices = {
        { text = "Then the Darkspear have been unlucky.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Then it's time the Darkspear stopped losing.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },

    -- Why this city
    city = {
      lines = {
        { id = "ci_default", text = "Because the Darkspear be few, and the Horde be many, and the Raiders can't hold the islands alone. So I stand in the capitals and talk to anybody who'll listen, and I tell them the old home of the trolls be worth their blood." },
        { id = "ci_og", when = { zone = "Orgrimmar" }, text = "Because the Darkspear be few and the orcs be many, and the orcs owe us a little for the Warchief's welcome all those years ago. I don't say that to their faces too loudly, mind, but I think it." },
        { id = "ci_uc", when = { zone = "Undercity" }, text = "Because the Forsaken don't tire, don't sleep and don't get the fever that the jungle gives everybody else. A troll can't ask for better company on the islands, even if they do smell a little strange." },
        { id = "ci_tb", when = { zone = "Thunder Bluff" }, text = "Because the tauren hold the line like a cliff holds the wind, and the tide on the islands breaks a lot of lines. They also feed me very well up here, which I didn't expect and won't complain about." },
      },
      choices = {
        { text = "And has anyone listened?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who the player is
    k_troll = {
      big = true,
      lines = {
        { id = "kt_default", text = "Because Sen'jin's bones be there, and our grandparents' fires, and the first place the Darkspear were ever safe. Some trolls say leave the past in the sea, and others say a tribe without its old home be only half a tribe. What do you say, Darkspear?" },
      },
      choices = {
        { text = "We go back. The old home is part of us.", next = "BACK", reply = "Den the loa be smiling on you, cousin, because a troll who remembers where he come from be harder to drive off than any wall the Alliance can build.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Our home is with the Horde now. Look forward.", next = "BACK", reply = "Dat be Vol'jin's way too, and maybe it be right, but don't you forget the old fires, cousin, because the spirits don't forget dem.", fx = { align = { order = 1 } } },
        { text = "I'll go, but for the fight, not the past.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    k_orc = {
      lines = {
        { id = "ko_default", text = "He did, half drowned and chased by Kul Tiras ships, and Sen'jin took him in when he could have let the jungle have him. The Darkspear followed the Warchief to Kalimdor because of that day, and now we ask the orcs to follow us back." },
      },
      choices = {
        { text = "The orcs remember that debt.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_tauren = {
      lines = {
        { id = "kta_default", text = "No, and Cairne keeps a careful peace, I know. But the Horde stood with the tauren against the centaur when you needed it, and the Darkspear be part of that Horde, so now I ask the tauren to stand with the Darkspear." },
      },
      choices = {
        { text = "That's fair. I'll stand with you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "I'll think on it, troll.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    k_forsaken = {
      lines = {
        { id = "kf_default", text = "Maybe they don't, and I'd never say you owe us anything. But the humans of Theramore be the same humans who'd see your Undercity burned, and each one on my islands be one less marchin' on Lordaeron." },
      },
      choices = {
        { text = "That's a reason I can accept.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "The dead fight for themselves, troll.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    k_skyborne = {
      lines = {
        { id = "ks_default", text = "I've heard that your islands floated away in the sky, which be a stranger loss than ours, but a loss all the same. Then you know how it feels when the place your grandparents are buried belongs to somebody else." },
      },
      choices = {
        { text = "I know. I'll help you keep yours.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_shaman = {
      lines = {
        { id = "xs_default", text = "The old ones say the spirits there be angry since the mountain woke, and the water spirits most of all, after what the sea witch did. A shaman who walks those beaches gently might be able to calm them, and the Raiders would be glad of it." },
      },
      choices = {
        { text = "I'll listen to them when I go.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_hunter = {
      lines = {
        { id = "xh_default", text = "Big cats in the jungle, crabs as wide as a shield on the beaches, and birds that scream all night so nobody sleeps. Bring your beast, hunter, but keep it out of the surf." },
      },
      choices = {
        { text = "My beast and I will manage.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    echo_isles = { { id = "tp_echo", text = "The new home, off Durotar's coast, that Zalazane stole from us with his voodoo. One day the Darkspear will have it back, and then we'll have two homes to fight for instead of none." } },
    background = { { id = "tp_bg", text = "I be a Darkspear of the Raiders, and they sent me to the capitals because I talk better than I throw spears. That be all you need to know about me, mon." } },
    advice = { { id = "tp_ad", text = "Never turn your back on the sea. It took Sen'jin's islands once, and it be patient." } },
    _none = { { id = "tp_none", text = "I don't know about that, mon. Ask me about the islands, and I'll talk until the sun goes down." } },
  },
}
