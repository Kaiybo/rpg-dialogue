-- The Bay of Storms: a duke of the Waterlords on his island, a demon hunter on his, and a sea giant in a drowned temple. Voice: bibles/azshara.md
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hydraxis", id = TODO_NPC("Duke Hydraxis"), name = "Duke Hydraxis",
  bible = "bibles/azshara.md", role = "questgiver", tier = "major",
  communities = { "bay_of_storms" }, temper = { "proud", "steady" }, values = { "brave", "proud" },
  notices = { "class", "race", "reputation" },

  impression = {
    first = "Duke Hydraxis of the Waterlords is a water elemental who rules a rock in the Bay of Storms and wages war on fire, earth and air. He judged me as a tool, honestly, and seemed to find me barely adequate.",
    third = "{name} met Duke Hydraxis, lord of the Hydraxian Waterlords, on his island in the Bay of Storms.",
  },

  greetings = {
    { id = "g_default", text = "Mortal. You stand on the shore of the Waterlords; speak with respect, or not at all." },
    { id = "g_back", when = { metBefore = true }, text = "You return, little rain. Have you grown any stronger?" },
    { id = "g_ally", when = { reputation = { faction = "Hydraxian Waterlords", min = "honored" } }, text = "A valued ally of the Waterlords stands before me. Speak, and be heard." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. You bargain with every element as though they were equals; they are not, and in time you will learn which of us is worth your devotion." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You make water out of nothing, mage, and drink it, and think nothing of it. That is a thin echo of us, poured into a cup." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "You carry the air about you like a perfume, elf. The servants of the wind are not friends of the Waterlords; remember that, while you stand on my shore." },
    { id = "n_rep", cat = "reputation", when = { reputation = { faction = "Hydraxian Waterlords", min = "friendly" } },
      text = "The Waterlords know your name now, and remember it, which is more than we do for most of your kind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Hydraxis, Duke of the Waterlords. Your kind were not born of the deep, mortal, and our war is beyond you, but a mortal may still be useful to it, and be rewarded for it." },
        { id = "h_poison", when = { questActive = TODO_QUEST("Poisoned Water") },
          text = "The aspect of Neptulon will drive the plague from my scouts, and the struggle will drive them mad. Defeat the madness and bring me their bracers; I will not suffer that affront to our purity any longer." },
        { id = "h_silithus", when = { questActive = TODO_QUEST("Stormers and Rumblers") },
          text = "In the Crystal Vale of Silithus, the wind's creatures and the stone's stand guard over things they keep from your kind. Go there, prove your conviction, and break them." },
        { id = "h_ember", when = { questActive = TODO_QUEST("Eye of the Emberseer") },
          text = "The orcs of Blackrock Spire hold a servant of fire in chains, high in their fortress. Free it only to destroy it, and bring me its eye; then I will know your strength." },
        { id = "h_proved", tags = { "news" }, when = { questRecent = { TODO_QUEST("Eye of the Emberseer"), days = 7 } },
          text = "The Emberseer's eye still smoulders in my keeping, and it hisses whenever the tide touches it. You have cunning as well as strength, mortal; that is rarer than you know." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "You again, and welcome. Of all the mortals who have come to this rock, you have been the least disappointing, and from me that is praise." },
        { id = "h_cool", when = { disposition = { max = 34 } },
          text = "Speak quickly. The tide is turning, and it is more interesting than you." },
      },
      again = {
        { id = "h_again", text = "What more? The tide waits for no one, but it will wait a little for an ally." },
        { id = "h_again2", text = "Ask. I have time; I have had ten thousand years of it." },
        { id = "h_again3", when = { disposition = { min = 70 } }, text = "Speak freely. You have earned that much." },
      },
      choices = {
        { text = "Who are the Waterlords?", next = "lords" },
        { text = "What war do you wage, Duke?", next = "war" },
        { text = "What do you want from mortals?", next = "mortals" },
        { text = "What happened to your scouts in the east?", next = "plague" },
        { text = "The elements speak to me as well, Duke.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "The wind spirits sheltered my people once.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "The Emberseer is ash, Duke.", next = "emberseer", when = { questDone = TODO_QUEST("Eye of the Emberseer") } },
        { text = "I'll take my leave, Duke.", next = "END" },
      },
    },

    lords = {
      big = true,
      lines = {
        { id = "lo_default", fx = { learn = { "waterlords" } },
          text = "The Waterlords are the pure waters of this world, the servants of Neptulon the Tidehunter, and I am the first among them on this shore. We are the sea that broke this land, and the rain that wears down mountains, and we do not forget." },
      },
      choices = {
        { text = "Who is Neptulon?", next = "lords_neptulon" },
        { text = "You broke this land?", next = "lords_broke" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lords_neptulon = {
      lines = { { id = "ln_default", text = "The Lord of the Tides, master of every deep. He does not come to mortals, and you should pray he never has reason to. I speak for him here, and that is as near as you will ever stand to him." } },
      choices = {
        { text = "I'd stand nearer, given the chance.", next = "BACK", fx = { trait = { brave = 1 }, align = { order = -1 } } },
        { text = "I'll keep my distance, Duke.", next = "BACK", fx = { trait = { cautious = 1 }, align = { order = 1 } } },
      },
    },
    lords_broke = {
      lines = { { id = "lb_default", text = "The sea came in when the elves' great well tore itself apart, and the sea is ours. We did not break the land, mortal; we only took what fell to us, and a great deal fell." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    war = {
      big = true,
      lines = {
        { id = "wa_default", text = "Water is at war with the lesser elements: earth that hoards, air that scatters, and fire, above all, which devours. Fire is the oldest of our enemies, and its lord sleeps in a mountain in the east, where no water can follow him." },
      },
      choices = {
        { text = "You mean Ragnaros.", next = "war_fire" },
        { text = "Why fight air and earth too?", next = "war_others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_fire = {
      lines = {
        { id = "wf_default", fx = { learn = { "blackrock_depths" } },
          text = "The Firelord. The dwarves of the Dark Iron called him up out of the deep places, and now he burns beneath their mountain and they serve him. They fear us, I am told, those Dark Irons who drink in his halls, and they are right to." },
      },
      choices = {
        { text = "Then I'll fight fire for you.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 }, align = { honor = 1 } } },
        { text = "I'll fight fire when it pays, Duke.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_others = {
      lines = { { id = "wo_default", text = "Because they would do the same to us, given the chance. In the deserts of Silithus, air and earth stand together guarding things from your kind, and I do not know why, and anything I do not know, I mistrust." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    mortals = {
      lines = {
        { id = "mo_default", text = "Your hands, your blades and your short, stubborn lives. Mortals are like rain: each drop is nothing, but enough of them, falling long enough, will wear down a mountain. Prove you are worth the falling, and you will be rewarded." },
      },
      choices = {
        { text = "Why do the Waterlords need us at all?", tag = "Persuade", next = "why_mortals",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "SHAMAN" }, { reputation = { faction = "Hydraxian Waterlords", min = "friendly" } }, { questDone = TODO_QUEST("Stormers and Rumblers") } } } },
          fail = { next = "why_fail", fx = { affinity = -1 } } },
        { text = "And if we prove unworthy?", next = "mortals_fail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_mortals = {
      big = true,
      lines = {
        { id = "wm_default", text = "Because water cannot go where fire is strongest and remain itself. My soldiers would boil away in the Firelord's halls before they reached him, and I will not spend them on a death that gains nothing. You can walk where we cannot, and Neptulon expects results, not excuses." },
      },
      choices = {
        { text = "Then we need each other.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "You're using us, Duke.", next = "why_using" },
      },
    },
    why_using = {
      lines = { { id = "wu_default", text = "Of course I am, and I tell you so, which is more honesty than you will find in most of your own kings. Use me in return, mortal; that is what an alliance is." } },
      choices = {
        { text = "An honest bargain, then.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll use you better than you use me.", next = "BACK", fx = { align = { honor = -1 }, trait = { proud = 1 } } },
      },
    },
    why_fail = {
      lines = { { id = "wf2_default", text = "That is not your concern, mortal. You were not made to understand the tides, only to swim in them." } },
      choices = { { text = "As you say.", next = "BACK" } },
    },
    mortals_fail = {
      lines = { { id = "mf_default", text = "Then you will be forgotten, as most rain is. The Waterlords have no use for cowards, but neither do we waste anger on them." } },
      choices = { { text = "I won't be forgotten.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    plague = {
      lines = {
        { id = "pl_default", fx = { learn = { "new_plague" } },
          text = "My scouts went east, into the dead lands of Lordaeron, and the sickness there crept into their waters and twisted them. Water carries everything that is put into it, mortal, and the dead have put a great deal of filth into those rivers." },
        { id = "pl_done", when = { questDone = TODO_QUEST("Poisoned Water") },
          text = "My scouts are cured, those who could be, and their madness is ended. Our strength is in our purity; you have restored a little of it, and the Waterlords remember." },
      },
      choices = {
        { text = "The plague touches even elementals?", next = "plague_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plague_how = {
      lines = { { id = "ph_default", text = "It touches everything that flows. That is why the dead's masters chose it, I think: a sickness that rides the rivers can reach every corner of a land. I do not know who made it, but I know I would drown them gladly." } },
      choices = {
        { text = "So would I.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    shaman = {
      lines = { { id = "sh_default", text = "They speak to you because you listen to all of them at once, like a child among quarrelling parents. Listen longer to water, shaman, and you will hear that the others are only noise." } },
      choices = {
        { text = "All four elements must stand in balance.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Water has my respect, Duke, above the rest.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    skyborne = {
      lines = { { id = "sk_default", text = "Then you owe a debt to the wind, and the wind is no friend of mine. I will deal with you fairly, elf, for your deeds and not your debts, but do not expect me to forget whose breath carried you here." } },
      choices = {
        { text = "My deeds will speak for me.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    emberseer = {
      lines = { { id = "em_default", text = "So it is, and the orcs of the Spire have lost their prisoner and their pride together. You are a valued ally to the Waterlords now, and I may yet have tasks more fitting of one." } },
      choices = { { text = "I'll be ready.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The waters carry news to me from every shore. Ask, mortal, and I will tell you what the tide has brought." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For an ally, I will open the deeper waters. Choose." },
    },
    background = { { id = "tp_bg", text = "I am Hydraxis, Duke of the Waterlords and servant of Neptulon. That is all of me that concerns you.", next = "lords" } },
    advice = { { id = "tp_ad", text = "Never stand between water and the sea. Sooner or later, everything returns to the deep." } },
    waterlords = { { id = "tp_wl", text = "The pure waters, servants of Neptulon. I lead them on this shore.", next = "lords" } },
    blackrock_depths = { { id = "tp_brd", text = "The Dark Irons' city, where fire's servants drink and boast. They fear that we will tip the scales against them, and they are wise to fear it.", next = "war_fire" } },
    blackrock_spire = { { id = "tp_brs", text = "The orcs' fortress above the Firelord's mountain. They chain fire there and think they own it." } },
    new_plague = { { id = "tp_plague", text = "A filth in the rivers of the east. It twisted my scouts, and I have not forgiven it.", next = "plague" } },
    spitelash = { { id = "tp_spite", text = "The naga swim in my waters by my leave, and they forget that more often than they should." } },
    _none = { { id = "tp_none", text = "That is a matter for dry land, mortal, and of no interest to the Waterlords." } },
  },
}

P:NPC {
  key = "loramus", id = TODO_NPC("Loramus Thalipedes"), name = "Loramus Thalipedes",
  bible = "bibles/azshara.md", role = "questgiver", tier = "major",
  communities = { "bay_of_storms" }, temper = { "sharp", "steady" }, values = { "brave", "stern" },
  notices = { "class", "race", "fel" },

  impression = {
    first = "Loramus Thalipedes is a night elf demon hunter living on an island in the Bay of Storms with three felhounds. He sees demons I can't, mocks me for it, and still agreed to help me hunt one.",
    third = "{name} met Loramus Thalipedes, a demon hunter who keeps watch from his island in the Bay of Storms.",
  },

  greetings = {
    { id = "g_default", text = "Stand still, stranger. My hounds are deciding whether you are worth eating." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and alive. Astonishing; I had wagered against it." },
    { id = "g_named", when = { questDone = TODO_QUEST("The Name of the Beast") }, text = "You carry the beast's name now. Do not speak it lightly, even here." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. You carry a lamp into a very dark house, and you think the lamp makes the house safe. It does not, but it may let you see what kills you." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. You hold a demon on a leash and believe the leash is yours. I have watched a great many of your kind learn otherwise." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "One of my own people, and you look at me the way they all do, as if I were already one of the things I hunt. Look all you like." },
    { id = "n_fel", cat = "fel", when = { class = "WARLOCK", pet = true },
      text = "Keep your creature close, warlock. My hounds know its smell, and they are not fond of rivals." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Can you see them, mortal? The shapes at the edge of the tide, the shadows that are not shadows? No; I thought not. Your kind have eyes and see nothing with them, which spares you a great deal, and is why I live here and you are only visiting." },
        { id = "h_story", when = { questActive = TODO_QUEST("Loramus") },
          text = "So you wish to fight demons. Then sit, and hear what you are fighting, and do not interrupt me, {race}; I tell this only once." },
        { id = "h_ward", when = { questActive = TODO_QUEST("Breaking the Ward") },
          text = "Be still. The ritual must not be broken, and what it shows me will shape the weapons you need." },
        { id = "h_beast", when = { questActive = TODO_QUEST("The Name of the Beast") },
          text = "Seek the sea giant Arkkoroc in his temple on the northern shore. He calls himself a god, and his servants will kill you if they find you, so do not let them." },
        { id = "h_azsharite", when = { questActive = TODO_QUEST("Azsharite") },
          text = "The cliff giants of the south eat stone and leave crystal behind them. Bring me twenty pieces, and let my hound sniff out the ones they've hidden; evil does not rest, and neither will you." },
        { id = "h_felbane", when = { questActive = TODO_QUEST("The Formation of Felbane") },
          text = "Galvan the Ancient will forge the rest, in his camp near Zul'Gurub. He can work fel energy into steel, which very few smiths in this world can do, and fewer would admit to." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "You again, and I find I am glad of it. Of all the mortals who have stumbled onto this island, you are the one I would least like to see die, so try not to." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick; the tide is turning, and what it brings in does not wait." },
        { id = "h_again2", text = "Ask, mortal. My hounds are patient, and so, today, am I." },
      },
      choices = {
        { text = "Who are you, Loramus?", next = "who" },
        { text = "What do you see that I can't?", next = "see" },
        { text = "Tell me about Razelikh.", next = "razelikh" },
        { text = "Your hounds are demons themselves.", next = "hounds" },
        { text = "The Light can stand against any demon.", next = "priest", when = { class = "PRIEST" } },
        { text = "I command demons too, demon hunter.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Our people cast out demon hunters.", next = "nelf", when = { race = "NightElf" } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },

    who = {
      big = true,
      lines = {
        { id = "wh_default", fx = { learn = { "loramus" } },
          text = "A demon hunter, which is to say a kaldorei who looked too long at the enemy and took some of it into himself to hunt it better. I live here because the bay is quiet, and because no one comes to visit except the desperate." },
      },
      choices = {
        { text = "What did it cost you to see them?", tag = "Persuade", next = "price",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "NightElf" }, { questDone = TODO_QUEST("Azsharite") } } } },
          fail = { next = "price_fail", fx = { affinity = -1 } } },
        { text = "Why live alone?", next = "who_alone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    price = {
      big = true,
      lines = { { id = "pr2_default", text = "More than you have, mortal, and I will not name it. Only this: it cannot be given back, and if it were offered to me again today, knowing all I know, I would pay it again without a moment's thought." } },
      choices = {
        { text = "That's a terrible devotion.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "I hope it was worth it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    price_fail = {
      lines = { { id = "pf_default", text = "That is not a question you have earned. Hunt something first; then perhaps I will tell you what hunting costs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who_alone = {
      lines = { { id = "wa_default", text = "Because my own people look at me as if I were the thing I hunt, and other peoples look at me as if I were mad. My hounds look at me as if I were their master, which is restful, and almost true." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    see = {
      lines = {
        { id = "se_default", text = "Demons, mortal. Not all of them were driven out when the Well fell; some of them sleep, and some of them watch, and some of them walk among you wearing faces you trust. I see them, and you do not, and that is the whole of the difference between us." },
      },
      choices = {
        { text = "Show me how to see them.", next = "see_how" },
        { text = "You see demons everywhere.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    see_how = {
      lines = { { id = "sh_default", text = "No. It is not a lesson; it is a wound, and I would not give it to you even if you begged. Be content to be blind, mortal, and let those of us who are not do the seeing." } },
      choices = {
        { text = "Then I'll trust your eyes.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather see for myself, whatever it costs.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },

    razelikh = {
      big = true,
      lines = {
        { id = "ra_default", fx = { learn = { "loramus" } },
          text = "Razelikh the Defiler, the cruellest of Kazzak's lieutenants in the old war. Kazzak lost that war and crawled away to lick his wounds, and he set Razelikh to hold the Blasted Lands for him, which he has done while your kingdoms quarrelled over fields and borders." },
      },
      choices = {
        { text = "How has he held them?", next = "razelikh_triad" },
        { text = "Why don't you kill him yourself?", next = "razelikh_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    razelikh_triad = {
      lines = { { id = "rt_default", text = "With three servants: Sevine of the Shadowsworn, Allistarj, and the ogre Grol. He gave them and their followers deathless lives, and bound those lives to the Blasted Lands, so that they can never leave and never fall, and never stop serving him." } },
      choices = {
        { text = "Then how can they be beaten?", next = "razelikh_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    razelikh_name = {
      lines = { { id = "rn_default", text = "With a weapon that bears his true name. Forge such a thing, and he and all who serve him become as mortal as you. Finding the name is the hard part, mortal; forging it is merely difficult." } },
      choices = {
        { text = "Then I'll find it.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "And then I'll face him in his lair.", next = "razelikh_laugh" },
      },
    },
    razelikh_laugh = {
      lines = { { id = "rl_default", text = "You will. You are foolhardy, {race}, and I find I admire it, the way one admires a moth that flies at a bonfire with great determination." } },
      choices = {
        { text = "Courage is never foolish.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll strike from the dark, not charge.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    razelikh_why = {
      lines = { { id = "rw_default", text = "Because I watch more than one door, and if I leave this one, something will come through it. So I teach, and arm, and send others, and I count the ones who come back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hounds = {
      lines = { { id = "ho_default", text = "Raytaf, Shahiar and Zaman. Yes, they are felhounds, and yes, they are demons, and they are mine, because a hunter uses the best hounds he can find. They eat what I hunt, which keeps them loyal and keeps the island tidy." } },
      choices = {
        { text = "Using demons to fight demons is dangerous.", next = "BACK", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "Any weapon is fair against the Legion.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      lines = { { id = "pri_default", text = "It can, priest, if the one who carries it does not flinch. Most do; the Light is bright, and what it shows you in the dark is not always what you wished to see. Keep your lamp, and keep it high, and do not be surprised by what it reveals." } },
      choices = {
        { text = "My faith will not flinch.", next = "BACK", fx = { affinity = 1, align = { light = 2 } } },
        { text = "Faith alone won't win this. I'll learn your ways too.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Have you ever prayed, Loramus?", next = "priest_pray" },
      },
    },
    priest_pray = {
      lines = { { id = "pp_default", text = "To Elune, once, long ago. She did not answer, and so I went looking for answers elsewhere, and found them. Do not pity me for it, priest; pity the demons." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warlock = {
      lines = { { id = "wl_default", text = "You command them as a child commands a fire, by feeding it. One day the fire will be hungrier than you are generous, warlock, and I would rather not be standing near you on that day." } },
      choices = {
        { text = "My will is stronger than any demon.", next = "BACK", fx = { align = { light = -1 }, trait = { proud = 1 } } },
        { text = "You're right. I keep watch on myself.", next = "BACK", fx = { affinity = 1, align = { light = 1 }, trait = { cautious = 1 } } },
      },
    },
    nelf = {
      lines = { { id = "ne_default", text = "They did, and they were right to fear us, and wrong to send us away. The kaldorei would rather close their eyes than see what still waits under this sea; I would rather lose mine." } },
      choices = {
        { text = "Our people did what they had to.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "They were wrong to cast you out.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know demons, mortal, and the things that serve them. Little else is worth knowing." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you, I will speak plainly, which I rarely do. Ask." },
    },
    background = { { id = "tp_bg", text = "A hunter of demons, and the last thing many of them saw. That is all you need to know.", next = "who" } },
    advice = { { id = "tp_ad", text = "Never speak a demon's true name near the demon. And never trust a quiet sea." } },
    loramus = { { id = "tp_self", text = "You ask me about myself? Bold. I am what you see, and a great deal that you do not.", next = "who" } },
    arkkoroc = { { id = "tp_ark", text = "A sea giant who calls himself a god. A lesser one, perhaps; he knows things, and he will want payment for them." } },
    satyrs = { { id = "tp_satyr", text = "Elves who sold themselves to demons and got horns and hooves in exchange. A poor bargain; I've made better." } },
    highborne = { { id = "tp_hb", text = "The fools who opened the door. Their ghosts still hunger for magic, which is how the door stays open." } },
    queen_azshara = { { id = "tp_queen", text = "She is not dead, mortal. I would stake my hounds on it. Something waits under this sea." } },
    burning_legion = { { id = "tp_legion", text = "They were beaten, not destroyed, and they remember every insult. I have spent my life making sure they remember me too." } },
    tainted_scar = { { id = "tp_scar", text = "Where Kazzak licks his wounds and Razelikh keeps his master's house. I will not go there, and neither should you, until you carry the name.", next = "razelikh" } },
    _none = { { id = "tp_none", text = "That is not a demon, so it does not concern me." } },
  },
}

P:NPC {
  key = "arkkoroc", id = TODO_NPC("Lord Arkkoroc"), name = "Lord Arkkoroc",
  bible = "bibles/azshara.md", role = "questgiver", tier = "quest",
  communities = { "bay_of_storms" }, temper = { "proud", "steady" }, values = { "proud", "brave" },
  notices = { "race", "class" },

  impression = {
    first = "Lord Arkkoroc is a sea giant who lives in a drowned temple and calls himself a god. He grieves the sons a hydra has killed, and he paid me exactly what he promised.",
    third = "{name} met Lord Arkkoroc, the sea giant who rules the Temple of Arkkoran on Azshara's northern shore.",
  },

  greetings = {
    { id = "g_default", text = "A small thing climbs into the temple of the one. Speak, small thing, before the one grows bored." },
    { id = "g_back", when = { metBefore = true }, text = "The small thing returns to the temple, and the one remembers it." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Name of the Beast") }, text = "The hydra-slayer returns to the one. Come, come; my sons will not touch you now." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "An elf. Your people built this house for their moon goddess. She left; the one stayed. Draw your own conclusions about gods." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest of some small light. Kneel to the one, if you like; Arkkoroc does not mind a little worship." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Arkkoroc is the one who rules these waters, the god of the deep folk and the lord of this temple. The makrura bow to the one, the murlocs sing to the one, and the sea itself remembers the one's name." },
        { id = "h_name", when = { questActive = TODO_QUEST("The Name of the Beast") },
          text = "A demon lord, the demon hunter says? The one knows the name you seek, and will give it, but first you must do something for the one." },
      },
      again = {
        { id = "h_again", text = "What else does the small thing want of the one?" },
        { id = "h_again2", text = "Speak, small thing. The tide is slow; the one is patient, for now." },
      },
      choices = {
        { text = "Are you truly a god?", next = "god" },
        { text = "Who threatens your children?", next = "sons" },
        { text = "This was a temple of Elune, once.", next = "temple" },
        { text = "I seek the name of a demon lord.", next = "name", when = { questActive = TODO_QUEST("The Name of the Beast") } },
        { text = "I'll go, great one.", next = "END", fx = { affinity = 1 } },
      },
    },
    god = {
      lines = { { id = "go_default", fx = { learn = { "arkkoroc" } },
        text = "The deep folk worship the one, and the one answers them, which is more than most gods do. Call it what you like, small thing; Arkkoroc does not need your word for it." } },
      choices = {
        { text = "Then you are a god, great one.", next = "BACK", fx = { affinity = 2 } },
        { text = "You're a giant, not a god.", next = "god_insult" },
        { text = "Something else.", next = "BACK" },
      },
    },
    god_insult = {
      lines = { { id = "gi_default", text = "Bold, for something the one could crush in one hand. The one will let it pass, this once, because the one is gracious; say it again and learn how gracious the sea can be." } },
      choices = {
        { text = "I speak the truth, whatever it costs.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Forgive me, great one.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    sons = {
      big = true,
      lines = { { id = "so_default", text = "Hetaera. She kills the one's children and names herself queen of all the seas, a false god with too many heads and too little sense. She roams the clutch to the southwest, and the one counts fewer sons with every tide." } },
      choices = {
        { text = "I'll bring you her heads.", next = "sons_vow" },
        { text = "How many sons have you lost?", next = "sons_count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sons_vow = {
      lines = { { id = "sv_default", text = "All of them, small thing. Every head, or the one will not believe she is dead, because she has fooled the one before." } },
      choices = { { text = "Every head. I swear it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    sons_count = {
      lines = { { id = "sc_default", text = "The one counts them every tide, and the number grows smaller, and the one does not say it aloud. A god should not grieve where the makrura can see." } },
      choices = {
        { text = "Even gods may grieve.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    temple = {
      lines = { { id = "te_default", text = "The elves built it for their moon, and the sea took it, and the one took it from the sea. Their goddess left her house empty; a god does not leave a good house empty." } },
      choices = {
        { text = "Elune never left.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Well, she isn't using it.", next = "BACK", fx = { affinity = 1, align = { light = -1 }, trait = { witty = 1 } } },
      },
    },
    name = {
      lines = { { id = "na_default", text = "The one laughs. A demon lord, sending small things to the one's door! The one will give you the name, small thing, and something of equal worth besides, but first you will do something for the one." } },
      choices = {
        { text = "Name your price.", next = "sons" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "The one is Arkkoroc, lord of the deep folk. There is nothing more you need to know.", next = "god" } },
    advice = { { id = "tp_ad", text = "Do not swim in the clutch, small thing. Hetaera eats small things." } },
    arkkoroc = { { id = "tp_self", text = "The one, the lord, the god of these waters. Arkkoroc.", next = "god" } },
    loramus = { { id = "tp_lor", text = "The demon hunter on his little island. He sends small things to the one, and the one sends them back with names." } },
    _none = { { id = "tp_none", text = "The one does not concern itself with the doings of the dry land." } },
  },
}
