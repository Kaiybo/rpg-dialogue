-- Booty Bay: the Steamwheedle Cartel's port, kept by the Blackwater Raiders. Voice: bibles/stranglethorn.md
-- Neutral ground: both factions talk to everyone here.
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "revilgaz", id = TODO_NPC("Baron Revilgaz"), name = "Baron Revilgaz",
  bible = "bibles/stranglethorn.md", role = "noble", tier = "major",
  communities = { "booty_bay" }, temper = { "shrewd" }, values = { "ambitious", "proud" },
  notices = { "purse", "kit" },

  greetings = {
    { id = "g_balcony", text = "From this balcony I can count every ship in the cove and most of the coins coming off them. State your business." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good. Repeat business is the only kind I trust." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde colors on my balcony. Doesn't trouble me. Gold doesn't wear a tabard." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "You jingle when you walk. Booty Bay is fond of people who jingle. Try not to do it near the docks after dark." },
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "Empty pockets, in my town? Dangerous. People here assume you mean to fill them from theirs." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something out there chewed on you. There's a smith along the boardwalk who takes coin and asks no questions." },
  },

  react = {
    { id = "r_cat", on = "form", when = { form = "cat" }, text = "A cat on my balcony. If you're after the parrot, it bites, and it's worth more than you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Baron Revilgaz. This port belongs to the Steamwheedle Cartel, and I keep it for them. The Blackwater Raiders hold the water, the Bruisers hold the peace, and I hold the books." },
        { id = "h_bloodsail", tags = { "news" }, when = { questActive = TODO_QUEST("The Bloodsail Buccaneers") },
          text = "Seahorn says the Bloodsail are planning something against my town. They've hated us for years. Planning is new, and I don't like new." },
        { id = "h_isle", when = { questActive = TODO_QUEST("The Haunted Isle") },
          text = "There's an island off the coast the captains won't go near anymore. Something there scares sailors, and scared sailors don't carry cargo. Find out what it is." },
        { id = "h_tides", when = { any = { { questActive = TODO_QUEST("Water Elementals") }, { questActive = TODO_QUEST("The Curse of the Tides") }, { questActive = TODO_QUEST("The Stone of the Tides") } } },
          text = "This business with the tides. I don't pretend to understand the magic. I understand exactly what it's costing me." },
        { id = "h_ledger", when = { metBefore = true }, text = "Eleven ships in, nine out, and two the Bloodsail will want to know about. The ledger never sleeps. Neither do I, much." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Lanterns on every deck. Music on every pier. Somebody's about to fall in. Every night, the same. I'd miss it." },
      },
      again = {
        { id = "h_again", text = "Go on. Every minute on this balcony is a minute I'm not counting something." },
        { id = "h_again2", text = "Something more? I bill by the question. Joking. Mostly." },
        { id = "h_again3", when = { townStanding = { town = "booty_bay", min = 30 } }, text = "Ask. You've earned a little of my time; this town says so." },
      },
      choices = {
        { text = "Who are the Bloodsail?", next = "bloodsail" },
        { text = "What does the Cartel want with a jungle?", next = "cartel" },
        { text = "How do you keep the peace between Alliance and Horde here?", next = "peace" },
        { text = "What's your opinion of me, Baron?", next = "ledger", when = { metBefore = true } },
        { text = "Stormwind could use a port like this.", next = "stormwind", when = { faction = "Alliance" } },
        { text = "The Horde's ships dock here too. Do you trust them?", next = "horde", when = { faction = "Horde" } },
        { text = "Good day, Baron.", next = "END" },
      },
    },

    bloodsail = {
      big = true,
      lines = {
        { id = "b_default", text = "Pirates. Not our sort of pirate, the sort who pays dues. They raid anything that floats and they've never forgiven us for doing well. If you're fighting them, I'm paying." },
      },
      choices = {
        { text = "Then I'm fighting them.", next = "BACK", fx = { affinity = 2, standing = { booty_bay = 1 }, learn = { "bloodsail" } } },
        { text = "What's the difference between them and your Raiders?", next = "bloodsail_diff", fx = { trait = { skeptical = 1 } } },
        { text = "Just asking.", next = "BACK", fx = { learn = { "bloodsail" } } },
      },
    },
    bloodsail_diff = {
      lines = {
        { id = "bd_default", text = "Receipts. My Raiders take what they're owed and write it down. The Bloodsail take everything and burn the paper. Civilization is mostly receipts." },
      },
      choices = {
        { text = "That's a thin line.", next = "bloodsail_line", fx = { align = { honor = 1 } } },
        { text = "I like the receipts.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    bloodsail_line = {
      lines = { { id = "bl_default", text = "It's a line with a town on one side and a burning ship on the other. Thin is fine. I can count it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    cartel = {
      lines = {
        { id = "c_default", text = "Goblins took this cove from the trolls before anyone here had heard the word orc. We built a town in a shark's mouth and made it pay. Everyone's welcome as long as they spend." },
      },
      choices = {
        { text = "Hard to argue with that.", next = "BACK", fx = { affinity = 1, learn = { "steamwheedle" } } },
        { text = "And the trolls you took it from?", next = "cartel_trolls" },
        { text = "Who do you answer to?", next = "cartel_boss", fx = { trait = { curious = 1 } } },
      },
    },
    cartel_trolls = {
      lines = {
        { id = "ct_default", text = "Are still out there, still angry, and still bad at accounting. I don't lose sleep over it. I lose sleep over the Bloodsail." },
      },
      choices = {
        { text = "That's cold.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } },
      },
    },
    cartel_boss = {
      lines = {
        { id = "cb_default", text = "The Cartel's trade princes, in principle. In practice, to the number at the bottom of the quarterly report. If it's good, nobody visits. I prefer it when nobody visits." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },

    peace = {
      lines = {
        { id = "p_default", text = "Simple. Anybody who draws steel on my boardwalk meets the Bruisers. Nobody likes meeting the Bruisers. The war stays outside the shark's teeth." },
      },
      choices = {
        { text = "And if a war comes through those teeth anyway?", next = "peace_war" },
        { text = "Neutral ground. I like it.", next = "BACK", fx = { affinity = 1, opinion = { peace = "for" } } },
      },
    },
    peace_war = {
      lines = {
        { id = "pw_default", text = "Then I'll sell both sides the boats to leave in. Neutral doesn't mean blind. It means I keep the receipts for everyone." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ledger = {
      lines = {
        { id = "l_default", text = "You're a line item. Small, for now. Pay your tab, don't start fights, and the line gets longer." },
        { id = "l_liked", when = { townStanding = { town = "booty_bay", min = 30 } },
          text = "My Bruisers nod when you pass. Skindle doesn't water your rum. That's about as high as anyone gets in my ledger without owning a ship." },
        { id = "l_disliked", when = { townStanding = { town = "booty_bay", max = -20 } },
          text = "In red ink. People talk about you on my docks, and not the way that's good for business. Fix it." },
      },
      choices = {
        { text = "I'll keep paying my tab.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'm not a number, Baron.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },

    stormwind = {
      lines = {
        { id = "s_default", text = "Stormwind could use a lot of things. A treasury, for one. Their ships dock here, they pay, and they leave. That's the arrangement. It's the best one they'll get." },
      },
      choices = {
        { text = "Stormwind pays its debts.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = {
        { id = "hd_default", text = "I trust their coin. Their sailors drink, fight, and pay for the damage. That's more than I can say for some of the Alliance ones." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    bloodsail = { { id = "tp_bloodsail", text = "They want my town. They've wanted it since before you were born. They can keep wanting." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel takes its cut and leaves me to run things. That's the best arrangement a goblin can ask for." } },
    _none = { { id = "tp_none", text = "If it doesn't touch my port, I don't keep track of it. Krazek does. Ask him." } },
  },
}

P:NPC {
  key = "seahorn", id = TODO_NPC("Fleet Master Seahorn"), name = "Fleet Master Seahorn",
  bible = "bibles/stranglethorn.md", role = "soldier", tier = "major",
  communities = { "booty_bay" }, temper = { "boisterous" }, values = { "brave", "loyal" },
  notices = { "race", "kit" },

  greetings = {
    { id = "g_deck", text = "Up the stairs and still breathing! Good start. I've watched orcs come down those stairs headfirst." },
    { id = "g_back", when = { metBefore = true }, text = "The tide's brought you back! I like a sailor who can find the way home." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the herd, this far from the plains! I traded the grass for the sea long ago. Never regretted it. Well. Once, in a storm." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like you've been keelhauled twice and dried in the sun. Get that armor patched before the Bloodsail notice." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "A bear on my top floor! Ha! I've sailed with worse crews. Mind the rum." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Fleet Master Seahorn, of the Blackwater Raiders! The fleet answers to me, I answer to the Baron, and the Baron answers to his ledger." },
        { id = "h_bloodsail", tags = { "news" }, when = { questActive = TODO_QUEST("The Bloodsail Buccaneers") },
          text = "The Bloodsail are scheming against the town. Their camp's up the Wild Shore. Raid it, bring me their letters, and we'll see whose name is on the plan." },
        { id = "h_treasure", when = { questActive = TODO_QUEST("Sunken Treasure") },
          text = "A treasure under the waves, and somebody wants me to have the best of it? Bring that gem straight here, and don't let it near a Bloodsail." },
        { id = "h_storm", when = { metBefore = true }, text = "Smell that? Storm by morning. My knees know before the sky does. Old sailor's curse." },
        { id = "h_crazz", when = { heardLine = "crazz.h_default" }, text = "Crazz has been at you about the Bloodsail? Good lad. Too eager. I was too, once. It got me a fleet." },
      },
      again = {
        { id = "h_again", text = "Ha! More? Out with it, before the tide turns." },
        { id = "h_again2", text = "Ask away. I've rum, time and opinions, and only the rum runs out." },
      },
      choices = {
        { text = "Why does a tauren go to sea?", next = "why" },
        { text = "Tell me about the Bloodsail.", next = "bloodsail" },
        { text = "What's it like, working for a goblin?", next = "baron" },
        { text = "Got a sea story for me?", next = "story" },
        { text = "Do you miss the plains, ever?", next = "plains", when = { race = "Tauren" } },
        { text = "I've never been on a ship.", next = "landlubber", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Fair winds, Fleet Master.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "w_default", text = "Everyone asks! My people wander the plains. I found a bigger plain. Flatter, wetter, and the centaur can't follow." },
      },
      choices = {
        { text = "Ha. Fair enough.", next = "BACK", fx = { affinity = 2 } },
        { text = "What did your family say?", next = "why_family" },
      },
    },
    why_family = {
      lines = { { id = "wf_default", text = "Something about the Earth Mother not owning a boat. I sent them a shell. They didn't write back. Tauren are very good at disapproving quietly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    bloodsail = {
      big = true,
      lines = {
        { id = "b_default", text = "Cutthroats with a fleet. We're cutthroats with a town, and that's the whole difference. It matters more than you'd think." },
      },
      choices = {
        { text = "I'll help you sink them.", next = "BACK", fx = { affinity = 2, standing = { booty_bay = 1 }, learn = { "bloodsail" } } },
        { text = "Who leads them?", next = "bloodsail_lead" },
        { text = "Why do they hate this town so much?", next = "bloodsail_why" },
      },
    },
    bloodsail_lead = {
      lines = { { id = "bl_default", text = "A fleet master of their own, with a grudge for every one of my ships. He'd dearly love my horns over his door. I'd love to see him try." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },
    bloodsail_why = {
      lines = { { id = "bw_default", text = "Because we did what they wanted to: found a cove, made it rich, and kept it. Nothing makes a pirate angrier than another pirate who settled down." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },

    baron = {
      lines = {
        { id = "bn_default", text = "The Baron? He counts my cannonballs. Every one. But when the Bloodsail came for him, I was the one at his door, and he hasn't forgotten it. Neither have I." },
      },
      choices = {
        { text = "They came for him?", next = "baron_attempt" },
        { text = "Sounds like friendship.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    baron_attempt = {
      lines = { { id = "ba_default", text = "For both of us. They tried a knife in the dark. They got a tauren in the dark instead. Bad trade for them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "bloodsail" } } } },
    },

    story = {
      lines = {
        { id = "st_default", text = "Once I sailed through a storm so thick the gulls walked. Lost the mast, the cook and my hat. Found the hat. Still miss the hat more than the mast." },
      },
      choices = {
        { text = "And the cook?", next = "story_cook" },
        { text = "That's not true.", next = "BACK", fx = { trait = { skeptical = 1 }, affinity = 1 } },
      },
    },
    story_cook = {
      lines = { { id = "sc_default", text = "Washed up in Ratchet a month later, furious. Runs a chowder stall now. Won't serve me. Fair." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },

    plains = {
      lines = {
        { id = "pl_default", text = "On calm nights. The water goes flat and silver and I think: grass. Then a wave slaps the hull and I remember why I left. You came a long way from the plains yourself." },
      },
      choices = {
        { text = "The Earth Mother walks with me here too.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "I miss it every day.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    landlubber = {
      lines = {
        { id = "ll_default", text = "Never! Then the sea's waiting to make a fool of you. Sit in the middle of the boat, look at the horizon, and don't eat the cook's eggs." },
      },
      choices = { { text = "Noted.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    bloodsail = { { id = "tp_bloodsail", text = "Their fleet master would dearly love my horns on his wall. He'll have to get in line." } },
    _none = { { id = "tp_none", text = "That's a landlubber's question. Ask somebody with dry boots." } },
  },
}

P:NPC {
  key = "krazek", id = TODO_NPC("Krazek"), name = "Krazek",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "chatty" }, values = { "cunning", "ambitious" },
  notices = { "craft", "purse" },

  greetings = {
    { id = "g_desk", text = "Busy, busy, busy. Never too busy for a customer, though. You are a customer?" },
    { id = "g_back", when = { metBefore = true }, text = "Already? I said you'd return. I'm rarely wrong." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = "Mining" },
      text = "A miner! The Baron's always short of good ore, and I'm always short of favors owed. We should talk." },
    { id = "n_poor", cat = "purse", when = { money = { max = 1000 } },
      text = "Lean times? I can find you work. Finding work is a service. Services cost. We'll sort it out." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Krazek, secretary to Baron Revilgaz. Prices, pirates, who owes whom in this jungle: ask me. If I don't know it, it hasn't happened yet." },
        { id = "h_cousin", when = { heardLine = "tranrek.h_default" },
          text = "You met my cousin in Gadgetzan! Did he tell you what he does? No? He never does. That's how he stays rich." },
        { id = "h_thorsen", when = { questActive = TODO_QUEST("Supplies to Private Thorsen") },
          text = "Private Thorsen's out near the rebels' camp, waiting on those supplies. Keep your head down. Kurzen's men don't sign for deliveries." },
        { id = "h_isle", when = { questActive = TODO_QUEST("The Haunted Isle") },
          text = "That island the Baron frets about? The crews swear they hear things out there at night. I swear I don't believe them. I'm also not going." },
        { id = "h_rumor", when = { questActive = TODO_QUEST("The Rumormonger") },
          text = "Information's my trade, and I'm trusting you with a little of it. Rumors spoil faster than fish. Run." },
        { id = "h_tranrek", when = { questActive = TODO_QUEST("Tran'rek") },
          text = "Tran'rek, in Gadgetzan. He pays well for the right sort of help. Tell him Krazek sent you; it can't hurt." },
        { id = "h_gossip", when = { metBefore = true }, text = "Three new rumors since you left. One's about you. Don't worry. It's flattering. Mostly." },
        { id = "h_smotts", when = { heardLine = "smotts.h_default" }, text = "Smotts told you about the giants? He tells everyone. I think the giants have heard it by now too." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, quick, the Baron rings that bell every four minutes." },
        { id = "h_again2", text = "More? I love a customer with questions. Questions are inventory." },
      },
      choices = {
        { text = "What's the word in the jungle?", next = "word" },
        { text = "Do you really know everything?", next = "brag" },
        { text = "What's the Baron like to work for?", next = "baron" },
        { text = "What's the rumor about me?", next = "about_me", when = { metBefore = true } },
        { text = "How are the rebels up north holding out?", next = "rebels", when = { faction = "Alliance" } },
        { text = "Thanks, Krazek.", next = "END" },
      },
    },

    word = {
      lines = {
        { id = "w_default", text = "The Venture Company's cutting up the north. Kurzen's men have gone strange. The trolls are trolls. Same as ever: dangerous, and good for business." },
      },
      choices = {
        { text = "Good for business?", next = "bandages" },
        { text = "Strange how? Kurzen's men.", next = "word_kurzen" },
        { text = "And the Venture Company?", next = "word_venture" },
        { text = "I'll keep my eyes open.", next = "BACK", fx = { affinity = 1, learn = { "kurzen" } } },
      },
    },
    bandages = {
      lines = { { id = "bd_default", text = "Somebody has to sell the bandages. Might as well be somebody who knows where you're bleeding." } },
      choices = { { text = "That's grim, Krazek.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    word_kurzen = {
      lines = { { id = "wk_default", text = "They stopped buying. Soldiers always buy: boots, rum, letters home. When soldiers stop wanting letters home, something's gone wrong in their heads." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "kurzen" } } } },
    },
    word_venture = {
      lines = { { id = "wv_default", text = "Big saws, small ethics. They're digging up something in the hills that sings. Ask Crank downstairs. Don't believe the first price." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } } },
    },

    brag = {
      lines = { { id = "br_default", text = "Everything worth knowing, and a fair bit that isn't. The second part's cheaper." } },
      choices = {
        { text = "Prove it. What's Seahorn's weakness?", next = "brag_prove", fx = { trait = { curious = 1 } } },
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    brag_prove = {
      lines = { { id = "bp_default", text = "Rum. Storms. A hat he lost years ago and still talks about. That one's free; everyone knows it. The real one costs more than you have." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    baron = {
      lines = {
        { id = "bn_default", text = "Wonderful. Demanding, suspicious, generous when it suits him. Like working for a very rich parrot. Don't repeat that. He has a parrot." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What's it worth to you if I don't repeat it?", next = "baron_deal", fx = { align = { honor = -2 }, trait = { greedy = 1 } } },
      },
    },
    baron_deal = {
      lines = { { id = "bdl_default", text = "Ha! Now you're talking my language. A discount on rumors. Which I'll decide the value of. Which is zero. Nice try, though; I like you more now." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    about_me = {
      lines = {
        { id = "am_default", text = "That you're new, armed and asking questions. Which describes half the docks. I'll make you a better one, if you give me something to work with." },
        { id = "am_liked", when = { townStanding = { town = "booty_bay", min = 30 } },
          text = "That you pay what you owe and the Bloodsail don't like you. In Booty Bay, that's a love song." },
        { id = "am_king", when = { questDone = TODO_QUEST("Big Game Hunter") },
          text = "That Nesingwary has a new head on his wall and it's partly your fault. Nobody's talking about anything else at the bar." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    rebels = {
      lines = {
        { id = "rb_default", text = "Thin. They buy roots and pay in Stormwind silver, which is the last thing Stormwind's sent them. I send what I can. At a fair price. Fairish." },
      },
      choices = {
        { text = "Give them a better price.", next = "rebels_price", fx = { align = { light = 1 }, trait = { generous = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "kurzen" } } },
      },
    },
    rebels_price = {
      lines = { { id = "rp_default", text = "A better price. From a goblin. In the Baron's town. You're either very kind or very new. I'll knock a copper off the next crate. Don't tell anyone; it'll ruin me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    kurzen = { { id = "tp_kurzen", text = "The rebels up north buy from me. Kurzen's lot stopped buying anything a while back. That's never a good sign." } },
    bloodsail = { { id = "tp_bloodsail", text = "Bad for shipping, bad for business, bad for my nerves. The Baron pays well to make them less of all three." } },
    _none = { { id = "tp_none", text = "That, I don't know. Come back tomorrow and I will." } },
  },
}

P:NPC {
  key = "mackinley", id = TODO_NPC("\"Sea Wolf\" MacKinley"), name = "\"Sea Wolf\" MacKinley",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "menacing" }, values = { "cunning", "practical" },
  notices = { "purse", "drink" },

  greetings = {
    { id = "g_crate", text = "Pull up a crate. Any good at knucklebones? Doesn't matter. I'm better." },
    { id = "g_back", when = { metBefore = true }, text = "Look who it is. You don't owe me a thing. Yet." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "A full purse and a friendly face. Two things that go missing in this town. Hold on to both." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "You're three sheets gone. Sit down before you bet something you'll miss in the morning." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "They call me the Sea Wolf. Folk borrow, folk forget, and I remind them. Dying doesn't get you out of a debt with me. I've proved it." },
        { id = "h_seen_stoley", when = { heardLine = "stoley.h_default" },
          text = "You've seen Stoley? Still breathing, is he? Good. Breathing men can pay." },
        { id = "h_voodoo", when = { questActive = TODO_QUEST("Voodoo Dues") },
          text = "There's a debt out among the trees with a bit of voodoo wrapped round it. Doesn't matter. Magic doesn't cancel what's owed." },
        { id = "h_maury", when = { questActive = TODO_QUEST("Cracking Maury's Foot") },
          text = "Maury's dead, and he still owes me. Death is no excuse. Bring me what he's got." },
        { id = "h_stoley", when = { questActive = TODO_QUEST("Stoley's Debt") },
          text = "Stoley's been dodging me long enough. Go and see him. Be friendly. At first." },
        { id = "h_knuckle", when = { metBefore = true }, text = "Won three hands of knucklebones this morning. Lost one. The one I lost, I'll be collecting on." },
      },
      again = {
        { id = "h_again", text = "Still here? Then talk. Talking's free. For now." },
        { id = "h_again2", text = "Go on. I'm shuffling." },
      },
      choices = {
        { text = "[Persuade] Deal me in. One game.", tag = "Persuade", next = "game",
          check = { pass = { money = { min = 100000 } } },
          fail = { next = "broke" } },
        { text = "What do people owe you for?", next = "owe" },
        { text = "How do you collect from a dead man?", next = "dead" },
        { text = "Shaky Phillipe is terrified of you.", next = "shaky", when = { heardLine = "shaky.h_default" } },
        { text = "Undead pay their debts too, then?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'll keep my purse closed, thanks.", next = "END" },
      },
    },

    game = {
      lines = { { id = "gm_default", text = "Coin and nerve. Fine, you'll get your game. Not now; I'm working. But I'll remember your face, and I never forget a face that can pay." } },
      choices = { { text = "I'll be back for it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    broke = {
      lines = { { id = "bk_default", text = "With that purse? Come back when it weighs more than your mouth does." } },
      choices = { { text = "Fair.", next = "BACK" } },
    },

    owe = {
      lines = { { id = "o_default", text = "Cards. Boats. Ale. Bad ideas, mostly. Bad ideas are always on credit." } },
      choices = {
        { text = "And if someone simply can't pay?", next = "owe_cant" },
        { text = "Ha. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    owe_cant = {
      big = true,
      lines = { { id = "oc_default", text = "Everybody can pay. It's a question of what with. Coin, work, a favor. Fear, at the very bottom. I don't like the bottom. It takes longer." } },
      choices = {
        { text = "Fear's a poor collector.", next = "BACK", fx = { align = { light = 2 }, affinity = -1 } },
        { text = "Sometimes fear is the only thing that works.", next = "BACK", fx = { align = { light = -2 }, trait = { cruel = 1 }, affinity = 1 } },
        { text = "A debt's a debt. Fair's fair.", next = "BACK", fx = { align = { honor = 2 }, affinity = 1 } },
      },
    },

    dead = {
      lines = {
        { id = "d_default", text = "Dead men leave things. Teeth, rings, a foot with a secret in it. A debt doesn't die. It just changes address." },
      },
      choices = {
        { text = "A foot?", next = "dead_foot" },
        { text = "That's ghoulish.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
      },
    },
    dead_foot = {
      lines = { { id = "df_default", text = "Maury kept his savings in it. Wooden, before you ask. Mostly wooden. Don't ask about the rest." } },
      choices = { { text = "I won't.", next = "BACK", fx = { affinity = 1 } } },
    },

    shaky = {
      lines = {
        { id = "sk_default", text = "Good. Fear is a fine savings plan. He'll pay. They always pay when they're shaking enough. Tell him I asked after him. Kindly. He'll know what kindly means." },
      },
      choices = {
        { text = "Go easy on him. He's harmless.", next = "BACK", fx = { align = { light = 2 }, trait = { kind = 1 } } },
        { text = "I'll tell him. Kindly.", next = "BACK", fx = { align = { light = -1 }, trait = { cruel = 1 }, affinity = 1 } },
      },
    },

    forsaken = {
      lines = {
        { id = "fs_default", text = "Pay better than the living, mostly. They've nothing left to spend it on and a long memory for who's owed. You'll fit right in at the table." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Does it owe me money? Then I don't care about it." } },
  },
}

P:NPC {
  key = "kebok", id = TODO_NPC("Kebok"), name = "Kebok",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "slick" }, values = { "ambitious", "cunning" },
  notices = { "purse" },

  greetings = {
    { id = "g_pitch", text = "You've the look of somebody who'd like to be rich. I can help with that. For a fee. A small fee. Medium." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite contractor! Don't tell the others." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Oh, you've done well for yourself. Ever thought about investing? I have opportunities. Several. Some of them legal." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kebok. I move goods out of Stranglethorn to places that pay for them. Trouble is, the trolls keep killing my agents. I need someone harder to kill." },
        { id = "h_ears", when = { questActive = TODO_QUEST("Bloodscalp Ears") },
          text = "Bloodscalp ears. Bring me a bundle and I can count how many fewer trolls are bothering my people. Business by subtraction." },
        { id = "h_tusks", when = { questActive = TODO_QUEST("Skullsplitter Tusks") },
          text = "Skullsplitter tusks. Don't ask what for. All right, ask: polished up, nobody on the southern islands can tell them from a tiger's fang." },
        { id = "h_takeover", when = { questActive = TODO_QUEST("Hostile Takeover") },
          text = "That job I gave you: quietly, quickly, and my name stays off it. Some deals are best closed in the dark." },
        { id = "h_agents", when = { metBefore = true }, text = "Lost another agent to the trolls last week. Good man. Terrible at running. I'm hiring faster runners now." },
      },
      again = {
        { id = "h_again", text = "Still interested? Excellent. Interest compounds." },
        { id = "h_again2", text = "What else? Time is money, and you're spending mine." },
      },
      choices = {
        { text = "What exactly is the business?", next = "trade" },
        { text = "Troll tusks sold as tiger fangs? That's fraud.", next = "fraud" },
        { text = "What happened to your agents?", next = "agents" },
        { text = "I'm a troll, Kebok.", next = "troll", when = { race = "Troll" } },
        { text = "Not interested.", next = "END" },
      },
    },

    trade = {
      lines = { { id = "t_default", text = "Buy low in the jungle, sell high over the sea. The sea's the expensive part. Pirates." } },
      choices = {
        { text = "Sounds risky.", next = "BACK", fx = { affinity = 1, learn = { "bloodsail" } } },
        { text = "Who buys over the sea?", next = "trade_who" },
      },
    },
    trade_who = {
      lines = { { id = "tw_default", text = "Island folk to the south who want a tiger's fang over the door and have never met a tiger. I'd hate to disappoint them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    fraud = {
      big = true,
      lines = {
        { id = "f_default", text = "Fraud is a strong word. I prefer 'creative sourcing'. Nobody's hurt. Except the trolls, and they started it." },
      },
      choices = {
        { text = "Fine by me. What pays best?", next = "BACK", fx = { align = { honor = -2 }, trait = { greedy = 1 }, affinity = 2 } },
        { text = "I'll do the work. Not the lying.", next = "BACK", fx = { align = { honor = 2 }, affinity = 1 } },
        { text = "I'll be telling the Baron.", next = "fraud_baron", fx = { align = { order = 1 }, affinity = -2 } },
      },
    },
    fraud_baron = {
      lines = { { id = "fb_default", text = "Please do. He takes ten percent of it. He'll be very interested to hear you're worried about his ten percent." } },
      choices = { { text = "...Something else.", next = "BACK" } },
    },

    agents = {
      lines = {
        { id = "a_default", text = "Ambushed on the jungle roads. The Bloodscalp don't negotiate, and I've tried. I sent a goblin with a very good contract. They sent back the contract." },
      },
      choices = {
        { text = "Just the contract?", next = "agents_contract" },
        { text = "I'm sorry for your people.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    agents_contract = {
      lines = { { id = "ac_default", text = "Signed. In something that wasn't ink. I've had it framed. Reminds me to hire tougher people." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    troll = {
      lines = {
        { id = "tr_default", text = "Darkspear, by the look. Not Bloodscalp. Not Skullsplitter. Different tribe, different tusks, different ledger. We're fine. We're absolutely fine. Aren't we?" },
      },
      choices = {
        { text = "For now.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "The Bloodscalp aren't my people. Hunt them.", next = "BACK", fx = { affinity = 2 } },
      },
    },
  },

  topics = {
    bloodsail = { { id = "tp_bloodsail", text = "Every crate they take is a crate I paid for twice. Once to buy it, once to cry about it." } },
    _none = { { id = "tp_none", text = "Is there money in it? No? Then I wasn't listening." } },
  },
}

P:NPC {
  key = "skindle", id = TODO_NPC("Innkeeper Skindle"), name = "Innkeeper Skindle",
  bible = "bibles/stranglethorn.md", role = "innkeeper", tier = "service",
  communities = { "booty_bay" }, temper = { "wry" }, values = { "practical" },
  notices = { "drink", "guest" },

  greetings = {
    { id = "g_inn", text = "In you come, out of the sun. Stools by the windows get the breeze, and the sea air covers the smell of the fish." },
    { id = "g_home", when = { homeInn = { "Booty Bay", "The Salty Sailor Tavern" } }, text = "Your room's as you left it. Mostly. The parrots got in again." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy there. Pirates drink like that and fall off the pier. Then I have to fish them out, and I charge for it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The Salty Sailor. Rooms upstairs, rum down here, and the Baron up top over all of it. Keep your voice down near the stairs." },
        { id = "h_brawl", when = { metBefore = true }, text = "Two pirates fought over a parrot last night. The parrot won. It's upstairs now. Paying rent, somehow." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night in Booty Bay: lanterns on the water, music on every deck, and somebody falling off a pier. Every night. Like clockwork." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've three tabs to chase and one of them's armed." },
        { id = "h_again2", text = "More? Lean on the bar, then. Not that bit. That bit's sticky." },
      },
      choices = {
        { text = "Heard anything interesting?", next = "gossip" },
        { text = "What's it like with the Baron living upstairs?", next = "baron" },
        { text = "Who drinks here?", next = "regulars" },
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "Just passing through.", next = "END" },
      },
    },
    gossip = {
      lines = { { id = "gs_default", text = "In this tavern? Everything, and none of it true. Want the Bloodsail rumor or the haunted island? Same price." } },
      choices = {
        { text = "The Bloodsail.", next = "gossip_bloodsail" },
        { text = "The island.", next = "gossip_isle" },
        { text = "I'll pass.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    gossip_bloodsail = {
      lines = { { id = "gb_default", text = "Red bandanas drinking in my corner, pretending to be fishermen. Fishermen don't tip. These do. That's how I know." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },
    gossip_isle = {
      lines = { { id = "gi_default", text = "Captains won't go near it. One swore he heard his dead mother calling from the beach. His mother runs a fish stall in Ratchet. I've met her." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    baron = {
      lines = { { id = "bn_default", text = "Quiet, mostly. He stamps when the music's too loud and sends Krazek down when it's too quiet. Too quiet means nobody's buying." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    regulars = {
      lines = {
        { id = "rg_default", text = "Whiskey Slim, who toasts everyone and threatens their fingers. Crank, who'll sell you a deal. MacKinley, who'll sell you a debt. Pick your poison; I sell that too." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask whoever's drinking the most; they always have a theory." } },
  },
}

-- More of Booty Bay: the sea giants' victim, the debtor, the first mate, the schemer, the tavern owner, the leathercrafter.
P:NPC {
  key = "smotts", id = TODO_NPC("Captain Hecklebury Smotts"), name = "Captain Hecklebury Smotts",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "vengeful" }, values = { "proud", "stubborn" },
  notices = { "kit" },

  greetings = {
    { id = "g_giants", text = "Sea giants. Three of 'em. Ask me about them. No, don't. I'll tell you anyway." },
    { id = "g_back", when = { metBefore = true }, text = "Back, are you? Got anything of mine? A chest? A cutlass? A sash? No? Then sit and listen again." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Looks like the sea's had a go at you too. Welcome to the club. Membership's terrible." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Captain Hecklebury Smotts. Had a ship, a crew and a fortune. Three sea giants took the lot: Gorlash, Negolash and Mok'rash. I bought another ship to hunt them. They sank that one too." },
        { id = "h_cutlass", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Captain's Cutlass") }, { questActive = TODO_QUEST("Facing Negolash") } } },
          text = "Negolash has my cutlass. Took it right out of my hand. Bring a crew; he's bigger than he looks, and he looks enormous." },
        { id = "h_sash", when = { questActive = TODO_QUEST("The Monogrammed Sash") },
          text = "Mok'rash has my sash. Monogrammed. My mother stitched it. Get it back and I'll forgive the ocean. Partly." },
        { id = "h_sprogger", when = { metBefore = true },
          text = "Only the cook survived the second ship. Sprogger. Of everyone aboard, the cook. I've never once complained about his stew since. Out loud." },
        { id = "h_negolash_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Facing Negolash"), days = 3 } },
          text = "Negolash is gone. I keep waiting to feel lighter. I feel exactly as heavy, just with a cutlass." },
      },
      again = {
        { id = "h_again", text = "Aye? Something else? I've nowhere to be. Nowhere at all." },
        { id = "h_again2", text = "Go on. Ask. Then I'll tell you about the giants again." },
      },
      choices = {
        { text = "Why not give up?", next = "giveup" },
        { text = "What happened, that first time?", next = "first" },
        { text = "Tell me about your crew.", next = "crew" },
        { text = "Will you ever sail again?", next = "sail" },
        { text = "I lost people too. Everyone I grew up with.", next = "lost",
          when = { origin = { "human_lordaeron_refugee", "gnome_gnomeregan_refugee", "nightelf_hyjal_survivor" } } },
        { text = "Negolash is dead. How does it feel?", next = "after", when = { questDone = TODO_QUEST("Facing Negolash") } },
        { text = "I'll get your things back.", next = "END", fx = { affinity = 2, standing = { booty_bay = 1 } } },
        { text = "I'll leave you to it, Captain.", next = "END" },
      },
    },
    giveup = {
      big = true,
      lines = {
        { id = "gu_default", text = "Give up? Two crews are at the bottom of that bay. If I give up, they drowned for nothing. I'm a stubborn man. It's all I've got left." },
      },
      choices = {
        { text = "Then I'll help.", next = "BACK", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "They'd want you to live, not to hunt.", next = "giveup_live", fx = { align = { light = 2 }, trait = { kind = 1 } } },
        { text = "Revenge won't bring them up.", next = "giveup_live", fx = { trait = { stern = 1 } } },
      },
    },
    giveup_live = {
      lines = { { id = "gl_default", text = "You didn't know them. Half of them would've hunted those giants with a rowboat and a spoon. I'm the sensible one. Think about that." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    first = {
      lines = {
        { id = "f_default", text = "Calm sea, full hold, good wind. Then the water stood up. That's the only way I can say it. The water stood up and it had a face." },
      },
      choices = {
        { text = "How did you get away?", next = "first_away" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_away = {
      lines = { { id = "fa_default", text = "Clung to a hatch cover for a day and a night. A Blackwater sloop fished me out. I paid them back. I pay everyone back." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    crew = {
      lines = {
        { id = "c_default", text = "Good sailors. Loud singers. Terrible at cards. I can name every one of them and I do, most nights, out loud. The innkeeper's asked me to stop." },
      },
      choices = {
        { text = "Name one for me.", next = "crew_name", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew_name = {
      lines = { { id = "cn_default", text = "My bosun. Laughed at storms, cried at weddings. That's all you're getting. The rest are mine." } },
      choices = { { text = "Thank you, Captain.", next = "BACK", fx = { affinity = 2 } } },
    },
    sail = {
      lines = {
        { id = "s_default", text = "When the giants are gone. I've no ship and no crew, so it's a promise that costs me nothing. But I make it every morning anyway." },
        { id = "s_done", when = { questDone = TODO_QUEST("Facing Negolash") },
          text = "One giant down. Maybe. If I find a crew mad enough. Sprogger says he'll cook. Sprogger says that like it's a threat." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lost = {
      big = true,
      lines = {
        { id = "lo_default", text = "Then you know nobody tells you what to do with your hands afterwards. I bought a ship. What did you do with yours?" },
      },
      choices = {
        { text = "Picked up a sword.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Kept walking. Still am.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "I'd rather not say.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    after = {
      lines = {
        { id = "af_default", text = "Like holding my own cutlass for the first time in a year. Heavier than I remembered. Two more of them out there, mind." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Is it a sea giant? No? Then it isn't my problem." } },
  },
}

P:NPC {
  key = "shaky", id = TODO_NPC("\"Shaky\" Phillipe"), name = "\"Shaky\" Phillipe",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "nervous" }, values = { "cautious" },
  notices = { "kit" },

  greetings = {
    { id = "g_jump", text = "Ah! Oh. Oh, it's only you. I thought you were... nobody. Nobody in particular. Hello." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Is that blood? Is that yours? Don't tell me. Don't come closer either, please." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "They call me Shaky. I can't think why. Ha. Ha. Listen, has a big man with a gambling habit been asking about me? You'd tell me if he had. Wouldn't you?" },
        { id = "h_mackinley", when = { heardLine = "mackinley.h_default" },
          text = "You've talked to MacKinley. I can tell. You've got that look. The look of someone who knows what I owe. I'll pay! Soon! Tell him soon!" },
        { id = "h_scared", when = { questDone = TODO_QUEST("Scaring Shaky") },
          text = "I paid. Every coin. I'm never playing knucklebones again. I'm never looking at meat again, either." },
      },
      again = {
        { id = "h_again", text = "What? What else? Is someone behind me? Don't look. Tell me." },
        { id = "h_again2", text = "Still here? That's nice. That's... is that nice? I can't tell." },
      },
      choices = {
        { text = "How much do you owe him?", next = "debt" },
        { text = "How did you get into this?", next = "how" },
        { text = "Why not just leave Booty Bay?", next = "leave" },
        { text = "MacKinley asked me to check on you.", next = "panic", when = { heardLine = "mackinley.h_default" } },
        { text = "Want me to teach you to hide properly?", next = "hide", when = { class = "ROGUE" } },
        { text = "Your secret's safe. For now.", next = "END", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Calm down. Nobody's after you.", next = "END", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    debt = {
      lines = {
        { id = "d_default", text = "A number. A big number. A number that grows when I'm asleep. I've stopped sleeping. That should slow it down, shouldn't it?" },
        { id = "d_paid", when = { questDone = TODO_QUEST("Scaring Shaky") },
          text = "Nothing! Nothing, now. I check every morning. I still check." },
      },
      choices = {
        { text = "I could talk to MacKinley for you.", next = "debt_talk", fx = { trait = { generous = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    debt_talk = {
      lines = { { id = "dt_default", text = "No! He'll know I sent you! He knows everything! Don't. Please. Unless it'd work. Would it work? No. Don't." } },
      choices = {
        { text = "All right. I won't.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll be subtle.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    how = {
      lines = { { id = "h2_default", text = "One game. One friendly game. I won the first hand. That's how they get you. They let you win the first hand." } },
      choices = {
        { text = "Who taught you that?", next = "how_who" },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    how_who = {
      lines = { { id = "hw_default", text = "MacKinley! After I lost! He explained it very kindly. That was the worst part." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leave = {
      lines = { { id = "l_default", text = "Where? Out there? With the trolls and the tigers and the things that eat trolls and tigers? At least MacKinley only wants money." } },
      choices = {
        { text = "Fair point.", next = "BACK" },
        { text = "Ratchet's nice this time of year.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
      },
    },
    panic = {
      lines = {
        { id = "pa_default", text = "He did? He asked? What did he say? What was his face doing? Was it the smiling face? Don't tell me if it was the smiling face." },
      },
      choices = {
        { text = "It was the smiling face.", next = "BACK", fx = { align = { light = -1 }, trait = { cruel = 1 } } },
        { text = "I'm joking. He didn't say a thing.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Pay him, Phillipe. It'll stop.", next = "BACK", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
      },
    },
    hide = {
      lines = {
        { id = "hi_default", text = "Hide? I've been hiding for weeks! Behind barrels. In barrels. He always finds me. Is there a trick? There's a trick, isn't there?" },
      },
      choices = {
        { text = "Stop shaking. That's the whole trick.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Pay your debts. Then there's nothing to hide from.", next = "BACK", fx = { align = { honor = 1 } } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know anything! About anything! Is this about money?" } },
  },
}

P:NPC {
  key = "crazz", id = TODO_NPC("First Mate Crazz"), name = "First Mate Crazz",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay", "blackwater" }, temper = { "eager" }, values = { "loyal", "fierce" },
  notices = { "race" },

  greetings = {
    { id = "g_bloodsail", text = "If you've seen a red bandana on the coast, tell me where. I've been wanting a reason all week." },
  },

  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "Another goblin! Good. You know the sea's just money with waves on it. The Bloodsail want our money. They can have the waves." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "First Mate Crazz, Blackwater Raiders. The Bloodsail Buccaneers are scum, and they're up to something on our coast. I want to know what. Then I want to sink it." },
        { id = "h_buccaneers", tags = { "news" }, when = { questActive = TODO_QUEST("The Bloodsail Buccaneers") },
          text = "Their camp on the Wild Shore. Their letters, their orders, their whole plan. Bring me paper, and I'll bring the Fleet Master a war." },
        { id = "h_watch", when = { metBefore = true },
          text = "Spotted a sail on the horizon last night. Red. Gone by morning. They're watching us. Good. Let them watch us coming." },
      },
      again = {
        { id = "h_again", text = "What else? Make it about the Bloodsail, if you can." },
        { id = "h_again2", text = "Yeah? Talk fast. I've a coast to watch." },
      },
      choices = {
        { text = "Why do you hate them so much?", next = "hate" },
        { text = "How do you know they're planning something?", next = "proof" },
        { text = "What's the Fleet Master like?", next = "seahorn" },
        { text = "Stormwind's navy could help against them.", next = "navy", when = { faction = "Alliance" } },
        { text = "The Horde has no love for the Bloodsail either.", next = "horde", when = { faction = "Horde" } },
        { text = "A goblin pirate who hates pirates?", next = "goblin", when = { race = "Goblin" } },
        { text = "I'll find their plan.", next = "END", fx = { affinity = 2, standing = { booty_bay = 1 }, learn = { "bloodsail" } } },
        { text = "Later, Crazz.", next = "END" },
      },
    },
    hate = {
      big = true,
      lines = {
        { id = "ha_default", text = "Because they make the rest of us look bad. We're pirates with rules. They're pirates with knives and no rules. When folk say 'pirate', they think of them, and then they think of me." },
      },
      choices = {
        { text = "Pirates with rules. I can respect that.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "A pirate's a pirate.", next = "hate_pirate", fx = { affinity = -1 } },
      },
    },
    hate_pirate = {
      lines = { { id = "hp_default", text = "Say that on the docks and see how many friends you have by supper. Go on. I'll watch." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    proof = {
      lines = {
        { id = "pr_default", text = "They've stopped raiding small. Small raids are hunger. Stopping is planning. Somebody's saving them up for something big." },
      },
      choices = {
        { text = "That's a guess.", next = "proof_guess", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } },
      },
    },
    proof_guess = {
      lines = { { id = "pg_default", text = "It's a guess that's kept me alive four years. Bring me their letters and it won't be a guess any more." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    seahorn = {
      lines = {
        { id = "sh_default", text = "Best captain on the South Seas. Laughs at cannon fire. Pays on time. Tells the same storm story every night and I'll punch anyone who yawns." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    navy = {
      lines = {
        { id = "nv_default", text = "Stormwind's navy has lovely ships and very slow letters. By the time they decided to help, we'd have sunk the Bloodsail ourselves. Twice." },
      },
      choices = {
        { text = "Fair. Something else.", next = "BACK" },
        { text = "Don't underestimate Stormwind.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
      },
    },
    horde = {
      lines = {
        { id = "hz_default", text = "Good. Your people sail in, buy, drink, and go. The Bloodsail sail in and burn. I know which customers I'd rather keep." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    goblin = {
      lines = {
        { id = "gb_default", text = "Pirate's a job. Bloodsail's a disease. You'd not call a doctor a plague just because they both turn up at funerals." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
  },

  topics = {
    bloodsail = { { id = "tp_bloodsail", text = "Scum with sails. Every one of them. I'd sink their whole fleet for one good night's sleep." } },
    _none = { { id = "tp_none", text = "Not about the Bloodsail? Then I'm not listening." } },
  },
}

P:NPC {
  key = "fizzlebub", id = TODO_NPC("Crank Fizzlebub"), name = "Crank Fizzlebub",
  bible = "bibles/stranglethorn.md", role = "questgiver", tier = "quest",
  communities = { "booty_bay" }, temper = { "shifty" }, values = { "greedy", "clever" },
  notices = { "purse" },

  greetings = {
    { id = "g_profit", text = "Psst. You. Yes, you. Want to make some money? Course you do. Everybody does. Lean in." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Oh, you're doing well. I can always tell. It's a gift. Let's talk about doing better." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Crank Fizzlebub. Entrepreneur. Opportunist. Friend to anyone with a strong arm and a short memory. Standing still never made anyone a copper." },
        { id = "h_shards", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Singing Blue Shards") }, { questActive = TODO_QUEST("Venture Company Mining") } } },
          text = "The Venture Company's digging up crystals that sing. Singing crystals! Do you know what people pay for things that sing? Bring me some. Don't ask the Venture Company first." },
        { id = "h_zanzil", when = { any = { { questActive = TODO_QUEST("Zanzil's Secret") }, { questActive = TODO_QUEST("Fool's Stout") }, { questActive = TODO_QUEST("Zanzil's Mixture and a Fool's Stout") } } },
          text = "Zanzil's mixture, a fool's stout, and a friend at a racetrack who'd like a few rivals to slow down. Don't ask me which friend. You'll meet him." },
        { id = "h_kravel", when = { heardLine = "kravel.h_default" },
          text = "You know Kravel? At the Raceway? Lovely fellow. Very competitive. We have an arrangement. You didn't hear that from me." },
      },
      again = {
        { id = "h_again", text = "Still here? Good sign. Means you smell opportunity too." },
        { id = "h_again2", text = "Psst. More? Closer. Closer. That's too close." },
      },
      choices = {
        { text = "Is any of this legal?", next = "legal" },
        { text = "What do singing crystals actually do?", next = "crystals" },
        { text = "What's your arrangement with Kravel?", next = "kravel", when = { any = { { heardLine = "kravel.h_default" }, { topicKnown = "mirage_raceway" } } } },
        { text = "I'm a gnome. I know a scheme when I see one.", next = "gnome", when = { race = "Gnome" } },
        { text = "What's the job?", next = "END", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Not today, Crank.", next = "END" },
      },
    },
    legal = {
      lines = {
        { id = "l_default", text = "Legal? This is Booty Bay! The Baron takes his cut, the Bruisers keep the peace, and everything else is negotiation. You're negotiating right now. Badly." },
      },
      choices = {
        { text = "Fine. What's the job?", next = "END", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Then I'll negotiate better. What's my cut?", next = "legal_cut", fx = { trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    legal_cut = {
      lines = { { id = "lc_default", text = "Your cut is not getting caught. It's a very generous cut. Most people don't get it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    crystals = {
      lines = {
        { id = "c_default", text = "Hum. Glow. Make rich people feel special. Do they do anything else? Probably. I don't care. The Venture Company cares, which is why they'll pay to get them back." },
      },
      choices = {
        { text = "You'd sell them back to the people you stole them from?", next = "crystals_back" },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },
    crystals_back = {
      lines = { { id = "cb_default", text = "Stole is a strong word. Liberated. And yes. Twice, if I can manage it. That's called a supply chain." } },
      choices = {
        { text = "That's brilliant.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "That's theft with extra steps.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
      },
    },
    kravel = {
      big = true,
      lines = {
        { id = "k_default", text = "Arrangement is such a dull word. Let's say Kravel would like certain racers to be a little slower, and I know a troll recipe that does exactly that. Everybody wins. Except the slow ones." },
      },
      choices = {
        { text = "You're rigging the races.", next = "kravel_rig", fx = { learn = { "mirage_raceway" } } },
        { text = "Count me in.", next = "BACK", fx = { align = { honor = -2 }, affinity = 2 } },
      },
    },
    kravel_rig = {
      lines = { { id = "kr_default", text = "Rigging, adjusting, encouraging. If you tell Pozzik or that gnome, I'll deny it, and Kravel will cry. He's very convincing when he cries." } },
      choices = {
        { text = "Maybe I'll tell them.", next = "BACK", fx = { align = { honor = 2 }, affinity = -2 } },
        { text = "Your secret's safe.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
      },
    },
    gnome = {
      lines = {
        { id = "g_default", text = "Then you'll appreciate a well-built one! Look at it: no moving parts, no witnesses, high yield. If it had gears you'd be weeping." },
      },
      choices = { { text = "It's a bit crude.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    venture_company = { { id = "tp_venture", text = "Rivals. Rich, careless rivals. My favourite kind." } },
    _none = { { id = "tp_none", text = "Is there money in it? No? Then why are we talking?" } },
  },
}

P:NPC {
  key = "whiskeyslim", id = TODO_NPC("Whiskey Slim"), name = "Whiskey Slim",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "jovial" }, values = { "generous", "touchy" },
  notices = { "drink" },

  greetings = {
    { id = "g_toast", text = "A toast! To you, stranger, and to whatever brought you here. Unless it was trouble. Then to you anyway." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! You've been enjoying yourself. Good. Don't spill. I mean it. Don't spill." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Whiskey Slim, at your service! I've tasted every drink between here and Ironforge, and I've a cask of the finest port you'll ever... had. Had. I lost it." },
        { id = "h_grog", tags = { "news" }, when = { questActive = TODO_QUEST("Whiskey Slim's Lost Grog") },
          text = "My Pupellyverbos Port. Lost in the Hinterlands, of all the miserable places. Find it, and I'll toast your name every night for a year." },
        { id = "h_toast", when = { metBefore = true },
          text = "To friends who come back! And to friends who don't, may they come back soon! And to anyone who touches my glass: may they lose a finger." },
        { id = "h_grog_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Whiskey Slim's Lost Grog"), days = 3 } },
          text = "To {name}, who brought back my port! I've had a glass. I've had another. I'll toast you properly as soon as the room stops leaning." },
      },
      again = {
        { id = "h_again", text = "A toast! To more questions! Ask away." },
        { id = "h_again2", text = "More? To curiosity! May it never kill anybody I like." },
      },
      choices = {
        { text = "How do you lose a whole cask?", next = "lost" },
        { text = "What makes this port so special?", next = "port" },
        { text = "Toast me, then.", next = "toast" },
        { text = "A gnome who drinks like a dwarf?", next = "gnome", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Cheers.", next = "END", fx = { affinity = 1 } },
      },
    },
    lost = {
      lines = {
        { id = "l_default", text = "Bandits, a cart, a hill and a very unfortunate trade involving a troll. The details are hazy. That's the port's fault, partly." },
      },
      choices = {
        { text = "The Hinterlands are dangerous.", next = "lost_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost_danger = {
      lines = { { id = "ld_default", text = "Dangerous! It's full of trolls with axes and gryphons with opinions. To the Hinterlands: may they choke on my port." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    port = {
      lines = {
        { id = "p_default", text = "Aged in a barrel that once held something I won't name, rolled down a mountain on purpose, and blessed by a priest who didn't know he was doing it. Taste of it makes you forgive your enemies. Briefly." },
      },
      choices = {
        { text = "That sounds made up.", next = "port_made", fx = { trait = { skeptical = 1 } } },
        { text = "I'd like a glass.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    port_made = {
      lines = { { id = "pm_default", text = "All the best things are! To made-up things! And to you, who'll never get a drop for saying so." } },
      choices = { { text = "Fair.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    toast = {
      lines = {
        { id = "t_default", text = "To you! May your boots stay dry, your blade stay sharp, and your enemies trip on something embarrassing. And if you ever cheat me, may your teeth rot. Cheers!" },
        { id = "t_drunk", when = { drunk = { min = 2 } },
          text = "To you, who's already had a few! Ha! A kindred spirit! May you find the door on the first try." },
      },
      choices = {
        { text = "To you too, Slim.", next = "BACK", fx = { affinity = 2 } },
        { text = "Why the threat at the end?", next = "toast_threat" },
      },
    },
    toast_threat = {
      lines = { { id = "tt_default", text = "Every toast needs a little salt! It's a gnomish tradition. Probably. My grandfather did it. He had very few friends but they never cheated him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = {
        { id = "g_default", text = "Like a dwarf! I drink like three dwarves stacked in a coat. Ironforge taught me, and Ironforge regretted it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Don't know, don't care! Drink?" } },
  },
}

P:NPC {
  key = "drizzlik", id = TODO_NPC("Drizzlik"), name = "Drizzlik",
  bible = "bibles/stranglethorn.md", role = "vendor", tier = "service",
  communities = { "booty_bay" }, temper = { "boastful" }, values = { "proud", "greedy" },
  notices = { "craft" },

  greetings = {
    { id = "g_emporium", text = "Welcome to Drizzlik's Emporium! The finest leather in the South Seas! The finest leather anywhere, if you ask me. You're asking me." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = { "Leatherworking", "Skinning" } },
      text = "A leatherworker! You've got good hands, I can tell. Not as good as mine. Close, though. Ish." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Drizzlik! Finest leathercrafter of the South Seas and every world old or new. Crocolisk, raptor, panther: if it has a hide, I've made it into something gorgeous." },
        { id = "h_supply", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Supply and Demand") }, { questActive = TODO_QUEST("Some Assembly Required") } } },
          text = "I need hides. Good ones. The jungle's full of them, still attached to things with teeth. That's where you come in." },
        { id = "h_boots", when = { metBefore = true },
          text = "Somebody ordered a pair of boots from me yesterday and paid in advance. In advance! I almost fainted. I'm making them extra gorgeous out of pure shock." },
      },
      again = {
        { id = "h_again", text = "More? Touch nothing. Ask anything." },
        { id = "h_again2", text = "Something else? Make it quick; that raptor hide won't stretch itself." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "What's the best hide in the jungle?", next = "hides" },
        { text = "Who taught you the trade?", next = "teacher" },
        { text = "Got any advice for a leatherworker?", next = "advice", when = { profession = { "Leatherworking", "Skinning" } } },
        { text = "Later.", next = "END" },
      },
    },
    hides = {
      lines = {
        { id = "hd_default", text = "Crocolisk for boots, raptor for belts, panther for anything you want to be admired in. Tiger, if Nesingwary's people leave any. They never leave any." },
      },
      choices = {
        { text = "I'll bring you some.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teacher = {
      lines = {
        { id = "t_default", text = "Taught? Me? I was born knowing! Fine. An old goblin in Ratchet who said I'd never be any good. I keep a pair of his boots to remind me he was wrong." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    advice = {
      lines = {
        { id = "a_default", text = "Cut with the grain, cure in the shade, and never let a customer tell you the color's wrong. The color is never wrong. The customer is." },
      },
      choices = {
        { text = "Thanks, Drizzlik.", next = "BACK", fx = { affinity = 2 } },
        { text = "Sometimes the customer's right.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Is it leather? No? Then it's beneath me." } },
  },
}

P:NPC {
  key = "sprogger", id = TODO_NPC("Sprogger"), name = "Sprogger",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "haunted" }, values = { "loyal" },
  notices = { "drink" },

  greetings = {
    { id = "g_cook", text = "You hungry? I can cook. I'm a cook. I was a cook. On a ship. Two ships, actually." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy on the grog. The water's closer than you think from these docks. I'd know." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sprogger. I cooked for Captain Smotts on the Smotts' Revenge. The giants came up out of the water and that was the end of her. Everyone went down but the Captain and me." },
        { id = "h_negolash", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Captain's Cutlass") }, { questActive = TODO_QUEST("Facing Negolash") } } },
          text = "Negolash. I can still see him, coming over the rail. Bring friends. Lots of friends. Then come back and tell me he's gone. I'd like to sleep again." },
        { id = "h_why", when = { metBefore = true },
          text = "People ask why I lived. I was in the galley, under a pot. A big pot. That's the whole secret. It isn't a good story, but it's mine." },
        { id = "h_gone", tags = { "news" }, when = { questRecent = { TODO_QUEST("Facing Negolash"), days = 3 } },
          text = "Is it true? He's gone? Then I'm going to sleep tonight. All night. You can wake me if the sea comes up, but it won't. It won't now." },
      },
      again = {
        { id = "h_again", text = "Something else? I can do a stew while we talk. I always do a stew." },
        { id = "h_again2", text = "Ask. I'll stir." },
      },
      choices = {
        { text = "What was the Captain like, at sea?", next = "captain" },
        { text = "What did you see that night?", next = "night" },
        { text = "What do you cook?", next = "cook" },
        { text = "Would you sail with him again?", next = "again" },
        { text = "Shall I say a prayer for the crew?", next = "pray", when = { class = { "PRIEST", "PALADIN", "SHAMAN", "DRUID" } } },
        { text = "I'm glad you made it.", next = "END", fx = { affinity = 2 } },
      },
    },
    captain = {
      lines = {
        { id = "c_default", text = "Loud. Fair. Knew every man's name and every man's mother's name. Sang badly at the wheel. He doesn't sing now." },
      },
      choices = {
        { text = "Maybe he will again.", next = "BACK", fx = { trait = { kind = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    night = {
      big = true,
      lines = {
        { id = "n_default", text = "Nothing, mostly. The pot. The dark. Noise like the world tearing. Then quiet, and water up to my knees, and the Captain shouting names." },
      },
      choices = {
        { text = "You don't have to say more.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Did anyone else call back?", next = "night_names" },
      },
    },
    night_names = {
      lines = { { id = "nn_default", text = "Just me. He kept shouting anyway. Nobody's told him to stop. I don't think anybody should." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cook = {
      lines = {
        { id = "ck_default", text = "Stew. Fish stew, crab stew, stew stew. The Captain says it's terrible. He has two bowls. I've learned to take that as a yes." },
      },
      choices = {
        { text = "I'd try a bowl.", next = "BACK", fx = { affinity = 2 } },
        { text = "Ever thought of cooking something else?", next = "cook_else" },
      },
    },
    cook_else = {
      lines = { { id = "ce_default", text = "Once. A pie. That was the night of the second ship. I haven't made a pie since. I'm not superstitious. I'm just not making pies." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    again = {
      lines = {
        { id = "a_default", text = "He'll ask. He'll find a ship and stand on that dock and ask, and I'll say yes. I'll hate it. I'll say yes." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { align = { honor = 1 } } } },
    },
    pray = {
      lines = {
        { id = "pr_default", text = "Would you? Nobody's said anything over them. There wasn't anything to say it over. Just water." },
        { id = "pr_shaman", when = { class = { "SHAMAN", "DRUID" } },
          text = "To the water? The water took them. Tell it to keep them gentle, if it's listening. You'd know if it's listening." },
      },
      choices = {
        { text = "Then the water will do.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, trait = { pious = 1 } } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I only know cooking and sea giants. Mostly cooking. Too much sea giants." } },
  },
}

P:NPC {
  key = "fin", id = TODO_NPC("Fin Fizracket"), name = "Fin Fizracket",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay", "blackwater" }, temper = { "miserable" }, values = { "hopeful" },
  notices = { "kit" },

  greetings = {
    { id = "g_sick", text = "Don't come too close. Or do. I don't know if it's catching. Nobody knows anything. Ugh." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Fin Fizracket, Blackwater Raiders. Or I was, before the Stranglethorn Fever got me. Sweats, shakes, and a taste in my mouth like old boots. Don't get sick in the jungle." },
        { id = "h_fever", tags = { "news" }, when = { questActive = TODO_QUEST("Stranglethorn Fever") },
          text = "There's a cure. Supposedly. A gorilla's heart. A particular gorilla, a big angry one called Mokk. I can't believe I'm hoping somebody kills a gorilla for me." },
        { id = "h_cured", when = { questDone = TODO_QUEST("Stranglethorn Fever") },
          text = "I'm better! Look at me. Standing! The heart tasted awful. I'd eat ten more. Actually no. Never again. But I'd think about it." },
      },
      again = {
        { id = "h_again", text = "Something else? Talk loud. My ears are ringing." },
        { id = "h_again2", text = "Ugh. Yes? Go on." },
      },
      choices = {
        { text = "How did you catch it?", next = "caught" },
        { text = "A gorilla's heart? Who says that works?", next = "cure" },
        { text = "Let me look at you.", next = "healer", when = { class = { "PRIEST", "SHAMAN", "DRUID", "PALADIN" } } },
        { text = "What'll you do when you're well?", next = "after" },
        { text = "Feel better.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    caught = {
      lines = {
        { id = "c_default", text = "Shore leave. Swam in a pond up the coast. Everyone said don't swim in the pond. I'm a sailor. I didn't think a pond could beat me." },
      },
      choices = {
        { text = "Never trust a jungle pond.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cure = {
      lines = {
        { id = "cu_default", text = "A troll witch doctor, through a friend of a friend of a cousin. Is it real? I don't know. Do I care? I'm sweating through my second shirt today." },
      },
      choices = {
        { text = "Then I'll get it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Sounds like a troll joke at your expense.", next = "cure_joke", fx = { trait = { skeptical = 1 } } },
      },
    },
    cure_joke = {
      lines = { { id = "cj_default", text = "Then it's a very good joke and I'll laugh when I'm dead. Get the heart anyway. Please." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    healer = {
      lines = {
        { id = "hl_default", text = "You're a healer? Go on, then. Do the glowy thing. Anything. I'm not proud." },
        { id = "hl_cured", when = { questDone = TODO_QUEST("Stranglethorn Fever") },
          text = "Too late, friend, I'm cured! But you can look. I like being looked at by people who aren't worried." },
      },
      choices = {
        { text = "This is beyond what I can mend. Hold on.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "It'll pass. Rest and water.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    after = {
      lines = {
        { id = "a_default", text = "Back on a ship. Blackwater ship. Bloodsail in sight. Cannons. And never, ever a pond." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Can't think. Fever. Ask somebody healthy." } },
  },
}

P:NPC {
  key = "lozgil", id = TODO_NPC("Wharfmaster Lozgil"), name = "Wharfmaster Lozgil",
  bible = "bibles/stranglethorn.md", role = "worker", tier = "quest",
  communities = { "booty_bay" }, temper = { "watchful" }, values = { "careful", "practical" },
  notices = { "race" },

  greetings = {
    { id = "g_docks", text = "Watch your step on the boards, and your purse on the docks. Not necessarily in that order." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = { "Orc", "Troll" } },
      text = "Horde, eh? There's a crate of axes with your name on it. Well. Your Warchief's name. Been sitting there for days." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Wharfmaster Lozgil. Everything that comes off a boat in Booty Bay comes past me first. You'd be amazed who comes and goes here. You'd be amazed who I'd rather didn't." },
        { id = "h_warsong", tags = { "news" }, when = { questActive = TODO_QUEST("Warsong Supplies") },
          text = "The Warsong crate. Axes, by the weight of it. It's been sitting on my dock for days. Haul it off, please, before somebody else decides it's theirs." },
        { id = "h_sponsor", when = { questActive = TODO_QUEST("Goblin Sponsorship") },
          text = "The Cartel likes to know who it's investing in. Show me you're worth the gold, and the gold will find you." },
        { id = "h_watch", when = { metBefore = true },
          text = "Saw a sailor slip a letter to a fishmonger this morning. Fishmongers don't read. I've made a note." },
      },
      again = {
        { id = "h_again", text = "Yes? Keep one eye on the water while you ask." },
        { id = "h_again2", text = "More? Fine. Stand there; you're blocking the view of the green boat." },
      },
      choices = {
        { text = "Who comes and goes that you'd rather didn't?", next = "who" },
        { text = "What happened with the fishmonger?", next = "fish", when = { metBefore = true } },
        { text = "Any ships to Stormwind or Menethil?", next = "ships", when = { faction = "Alliance" } },
        { text = "What's in the Horde crate?", next = "crate", when = { faction = "Horde" } },
        { text = "How do you know who to trust?", next = "trust" },
        { text = "I'll watch my purse.", next = "END", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    who = {
      lines = {
        { id = "w_default", text = "Sailors with clean hands. Fishermen who don't smell of fish. Anyone in a red scarf who suddenly isn't wearing one. I write them all down." },
      },
      choices = {
        { text = "And then what?", next = "who_then" },
        { text = "Something else.", next = "BACK", fx = { learn = { "bloodsail" } } },
      },
    },
    who_then = {
      lines = { { id = "wt_default", text = "Then I give the list to Krazek, who gives it to the Baron, who does nothing until someone dies. Then he asks why I didn't tell him sooner." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fish = {
      lines = {
        { id = "f_default", text = "The fishmonger's gone. Stall empty, nets left behind. The letter went with him. I've told the Bruisers. They told me fishmongers come and go." },
      },
      choices = {
        { text = "You think he was Bloodsail.", next = "BACK", fx = { learn = { "bloodsail" }, trait = { curious = 1 } } },
        { text = "Fishmongers do come and go.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    ships = {
      lines = {
        { id = "s_default", text = "Not from here. The boat to Ratchet goes from the end of the pier. Stormwind's a long way round. Menethil further. Bring a book." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crate = {
      lines = {
        { id = "c_default", text = "Axes, nails and a smell. Warsong stamp on the side. It's been on my dock long enough that the dock thinks it lives here." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trust = {
      lines = {
        { id = "tr_default", text = "I don't. I trust cargo manifests, tide tables and my own eyes. Two of those three have lied to me." },
      },
      choices = {
        { text = "Which one hasn't?", next = "trust_which" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust_which = {
      lines = { { id = "tw_default", text = "The tide tables. The sea's the most honest thing in this town. It'll drown you, but it tells you when." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    bloodsail = { { id = "tp_bloodsail", text = "Some of the faces on my docks wear red when nobody's looking. I can't prove it. Yet." } },
    _none = { { id = "tp_none", text = "If it didn't come off a boat, I don't know it." } },
  },
}
