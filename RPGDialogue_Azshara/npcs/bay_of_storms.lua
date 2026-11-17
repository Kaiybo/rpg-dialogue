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
    xcl_mc = {
      big = true,
      lines = { { id = "xcl_mc_default", text = "Won? You have smothered one flame, the greatest of them, but fire does not die, it waits. The Firelord will gather himself again in time, and when he does I want the Waterlords standing over the place he returns to." } },
      choices = {
        { text = "Then we drown every ember he left. No mercy for fire.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Fire has its place. Banish it, but don't unmake it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Why do the Waterlords hate fire so?", next = "xcl_mc2" },
      },
    },
    xcl_mc2 = {
      lines = { { id = "xcl_mc2_default", text = "Fire boils us, mortal, and turns our substance into steam that drifts away without a mind. Every elemental lord makes war on the others, but only fire makes war by unmaking, and I will not forgive Ragnaros for the servants I lost beneath Blackrock." } },
      choices = {
        { text = "Understood, Duke. Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "What I would have of anyone: that you go where I send you and break what I tell you to break. The servants of Ragnaros burn in the Molten Core beneath Blackrock, and your Light will not quench them, but your hammer may, if your faith is as stubborn as the sea." } },
      choices = {
        { text = "I'll break them, Duke, but I serve the Light, not you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Command me, then. Fire's servants must be put down.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The servants of fire, stone and wind do not reason, mortal, so they must be broken, and a warrior breaks things willingly. Every elemental you extinguish weakens the lords who command them, and the Waterlords remember who served." } },
      choices = {
        { text = "I'll fight your war openly, Duke, and stand by what I've done.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll fight it for the reward, and keep my own counsel.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Duke.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The Waterlords do not hunt, mortal; we drown, and patience is our whole art. A hunter who can wait for the right moment understands the tide better than any warrior, and is a little more useful to me for it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} does not like the smell of salt, I see. Keep it from the water's edge, because what lives in the bay does not distinguish between a beast and a meal." },
      },
      choices = {
        { text = "Patience and an honest shot. That's the whole of the hunter's art.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Patience, yes, and a trap the prey never sees.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage_hy = {
      big = true,
      lines = {
        { id = "mhy_default", text = "It makes you a mortal playing with a spark of my enemy's essence, which is a very different thing from being him. Your fire is borrowed and small, and it goes out; his does not, and that is why the Waterlords make war on it." },
      },
      choices = {
        { text = "Then I'll turn my fire on his servants.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Fire's a tool. I'll use what serves me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who is your enemy, Duke?", next = "war" },
      },
    },
    dwarf_hy = {
      lines = {
        { id = "dhy_default", text = "Then you know who woke the Firelord, mortal, and you know what they've become in his service. The Dark Iron dwarves called him into this world, and every flame beneath Blackrock Mountain is their debt; I would see it paid." },
      },
      choices = {
        { text = "So would I. Point me at them.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, learn = { "blackrock_depths" } } },
        { text = "Not every dwarf of that mountain chose it.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    druid_hy = {
      lines = {
        { id = "dyh_default", text = "Your Circle says so, and I don't dispute it, but balance is a word the land-folk use when they mean peace. The sea has never been at peace, druid; it is a war that has learned to look calm from the shore." },
      },
      choices = {
        { text = "Balance needs both calm and storm.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Then the Circle must keep the storm in check.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because your demons burn as the Firelord's servants burn, and they foul any water they touch. The Waterlords have no quarrel with you, warlock, so long as your fire serves my war against Ragnaros and not your own appetite." } },
      choices = {
        { text = "I'll turn my fire against the Firelord, then.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My fire serves me first, Duke.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll keep my servant out of sight.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The servants of fire and earth are strong but they are not watchful, and a quiet blade can reach the lieutenants who order them. Strike where they do not look, and the pure waters will remember the service, though I will not pretend to love the method." } },
      choices = {
        { text = "A quiet blade wins wars. I'll strike where they don't look.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather face them openly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The tide and I will see.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "By ending the servants of fire who befoul the deep places of this world, as any other mortal might. Your prayers are nothing to the sea, but your will is a tool like any other, and the Waterlords reward tools that do not break." } },
      choices = {
        { text = "Then I'll serve, and see the fire's servants ended.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'm no one's tool, Duke. I choose my own fights.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_mc", tags = { "news" }, when = { cleared = "Molten Core" }, text = "Ragnaros has been driven back into the burning deep, and the Firelord's heat has left the waters near Blackrock. You did that, mortal, and I acknowledge it, which is not a thing I say lightly." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. You bring the Light to my island, mortal, and the tide does not care for it, but it cares even less for fire, and I have heard your kind can be relentless." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. You strike as a wave strikes, mortal, all at once and without subtlety, and I have broken many such waves on this rock." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. You stalk your prey from a distance, mortal, as the current stalks a ship, and I find that less tiresome than charging." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock. You command creatures of fire and shadow, mortal, and the pure waters recoil from them, so keep your servant out of my sight while we speak." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue. The tide moves quietly too, mortal, and it wears down mountains, so perhaps there is a use in you that your size hides." },
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
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. Your gods do not command the tides, mortal, but your hands may still serve the Waterlords, if you are willing to be useful." },
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
        { text = "I wield fire, Duke. Does that make me your enemy?", next = "mage_hy", when = { class = "MAGE" } },
        { text = "My people have fought the Dark Irons for centuries.", next = "dwarf_hy", when = { race = "Dwarf" } },
        { text = "The tides are part of the balance I serve.", next = "druid_hy", when = { class = "DRUID" } },
        { text = "Your war is with fire. Why scorn shadow too?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What use would a Waterlord have for a rogue?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "How could a priest serve the Waterlords, Duke?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What use is a warrior to the Waterlords?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the Waterlords value a hunter's patience?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What would the Waterlords have of a paladin, Duke?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Ragnaros is banished, Duke. Is your war won?", next = "xcl_mc", when = { cleared = "Molten Core" } },
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
    xcl_dm = {
      big = true,
      lines = { { id = "xcl_dm_default", text = "I know Prince Tortheldrin, by name and by crime, and the pylons that keep a creature of the Nether chained in the city's heart so the Shen'dralar can drink from it. That is the sickness of the Highborne in one sentence: they would rather leash a horror than live without its power." } },
      choices = {
        { text = "Leashing a demon is still serving it. Their power must end.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If the leash holds, I'd use the power.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Are any of the Highborne in Dire Maul worth saving?", next = "xcl_dm2" },
      },
    },
    xcl_dm2 = {
      lines = { { id = "xcl_dm2_default", text = "A few of them keep books, and books are not sins, though they lead to one often enough. I spent my youth among people like that, and I left before the worst of it, which is the only wisdom I can boast of." } },
      choices = {
        { text = "Then you chose well. Something else, Loramus.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Some do, the small ones, the ones that remember being burned. The greater ones only grow curious, and curiosity is worse, because it makes them patient. Your Light is a fine weapon, paladin, but it is not a shield against what you cannot see, and I see a great deal." } },
      choices = {
        { text = "Then lend me your eyes, and I'll lend you my hammer.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I've faced demons before without a hunter's tricks.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "He trusts someone who can see, and he swings where he's told, and he doesn't argue. My hounds smell the Legion's servants long before your eyes would find them, and what Galvan forges for you will put an edge on your steel that demons feel." } },
      choices = {
        { text = "Then I'll trust your eyes and strike where you tell me.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll trust my own blade. I don't take orders from anyone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Loramus.", next = "BACK" },
      },
    },
    hunter_lo = {
      lines = {
        { id = "hlo_default", text = "Honest, yes, and it will die the first time it meets what my hounds were bred to hunt. A beast sees with its eyes; mine see with what was burned into them, and I trust them over any honest creature on this coast." },
      },
      choices = {
        { text = "I'd rather trust a friend than a weapon.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Fair. Use what sees the enemy.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    sky_lo = {
      big = true,
      lines = {
        { id = "slo_default", text = "Tortheldrin, yes; I know the name, and the crystals, and what they drank from. Your rebels left before the worst of it, which was wise, but don't imagine the Nether forgot the city because your people stopped looking at it." },
      },
      choices = {
        { text = "We remember what it cost. We won't touch it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Power like that could be turned against demons.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Ruins, bones and debts, mortal. The Highborne opened this land to demons ten thousand years ago, and something of that door still lingers around Eldarath and the old palaces. Your spirits feel it as a wrongness and look away, while I look straight at it, and that is the whole difference between us." } },
      choices = {
        { text = "Then I'll look at it too, whatever my elders say.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Spirits keep their distance for a reason. That's wisdom, not fear.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I blame the Highborne, and I blame Queen Azshara, and I watch every mage I meet for the same hunger. Most of you are fools who light candles, but some of you are not, and those are the ones I hunt eventually." } },
      choices = {
        { text = "I'll never seek that kind of power. You have my word.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear of knowledge is how wars are lost.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll remember the warning.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Shades of demons slain long ago, and some not slain at all, waiting for the veil to thin. You could stand beside one and never know it, rogue, which is why I live here and you are only visiting." } },
      choices = {
        { text = "I'd want to know. Show me how to see them.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some things are better left unseen.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll watch my back, then.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Touch them, yes, and feed them too, if you're careless. The Highborne who sank under these waves thought they could hold the dark at arm's length, priest, and I have spent a very long time cleaning up after that mistake." } },
      choices = {
        { text = "Then I'll hold to healing and leave demons to you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Shadow is my weapon, and I'll use it as I see fit.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Felhound tracks under the Highborne ruins, and the rot the satyrs leave wherever they dance. Your Circle would heal this land with patience and seeds, but you cannot plant a garden over a nest of demons, druid; first they burn, and then you may grow what you like." } },
      choices = {
        { text = "Then burn them. The healing can wait until they're gone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Burn the demons, not the forest. The land has suffered enough.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_dm", tags = { "news" }, when = { cleared = "Dire Maul" }, text = "You've been through Eldre'Thalas, which your people call Dire Maul, and come back with the Nether still clinging to you. The Highborne who stayed in that city have fed on it for ten thousand years, mortal, and I wonder how much of them you left." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. You glow like a lamp to my eyes, and the things at the tide line can see it too, so stand behind me if you'd rather they didn't come for you first." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. You'd swing your blade at a demon if you saw one, I suppose, and that's the trouble, mortal, because you won't see one until it's already behind you." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, listening to rocks and rivers. You'd hear more if you listened to what lies under them, because Azshara is thick with the Legion's leavings and your spirits are too polite to mention it." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Your kind opened the door to the Legion once, at the Well of Eternity, and you still dabble at the threshold as if nothing happened." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue. You hide from the eyes of mortals, but not from mine, and certainly not from the things that walk unseen along this shore." },
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
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Do you see them, the shapes at the tide? No, your prayers don't open your eyes, they only steady your hands, which is something, I suppose." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You hear the forest well enough, I'll grant you, but you're as blind to the demons hiding in it as any other mortal." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick; the tide is turning, and what it brings in does not wait." },
        { id = "h_again2", text = "Ask, mortal. My hounds are patient, and so, today, am I." },
      },
      choices = {
        { text = "What has the Legion left in Azshara's earth?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who are you, Loramus?", next = "who" },
        { text = "What do you see that I can't?", next = "see" },
        { text = "Tell me about Razelikh.", next = "razelikh" },
        { text = "Your hounds are demons themselves.", next = "hounds" },
        { text = "The Light can stand against any demon.", next = "priest", when = { class = "PRIEST" } },
        { text = "I command demons too, demon hunter.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Our people cast out demon hunters.", next = "nelf", when = { race = "NightElf" } },
        { text = "Your hounds are demons. My beast is honest.", next = "hunter_lo", when = { class = "HUNTER" } },
        { text = "My forebears in Eldre'Thalas fought a prince who drank the Nether.", next = "sky_lo", when = { race = "Skyborne" } },
        { text = "Do you blame all mages for the Legion's coming?", next = "xmage", when = { class = "MAGE" } },
        { text = "What walks unseen along the shore?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Can a priest's shadow touch the demons you hunt, Loramus?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "How does a warrior fight what he can't see?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What do you see in Azshara's woods that I can't?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do demons fear a paladin's Light, Loramus?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I've been through Dire Maul, Loramus. What do you know of it?", next = "xcl_dm", when = { cleared = "Dire Maul" } },
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
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the hydra that slew the one's sons was quiet too, until it was not. A small thing that strikes from the dark could strike the hydra where it sleeps, and the one would not care how it died, only that it did." } },
      choices = {
        { text = "I'll strike it in its sleep, and gladly.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll face it awake. Your sons deserve an honest vengeance.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The makrura pray, and the one answers, and that is what a god is, small thing. The one does not ask whether your god is real; the one asks only whether it would have saved the one's sons from the hydra, and it did not, and so the one has no use for it." } },
      choices = {
        { text = "A god isn't measured by favours. Faith asks nothing back.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then I'll do what no god did, and avenge your sons.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The one thinks so, if the warrior is foolish enough to stand before it and strong enough to keep standing. The one's sons were strong and stood before it, and still the deep took them, so the little warrior must be stronger, or cleverer." } },
      choices = {
        { text = "Then I'll face it head on, for your sons.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then I'll be cleverer. Strength alone is what killed your sons.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The makrura hunt the shallows and the murlocs hunt the reefs, and all of them bring the best of the catch to the one. A hunter who brings the one what the one asks will be remembered in the songs of the deep folk, which are very long." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And the small beast, {pet}, is it yours, or is it the one's now? Everything that comes into the temple's waters belongs to the one, little hunter, but Arkkoroc will make an exception." },
      },
      choices = {
        { text = "I'll do what you ask and honour the deep folk's ways.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your songs mean nothing to me. I hunt for my own reasons.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll_ar = {
      lines = {
        { id = "tar_default", text = "The one has heard of the loa, the spirits your little islands feed. They are hungry gods; the one is a patient god, and the makrura have never once starved for want of the one's favour." },
      },
      choices = {
        { text = "Patience is easy when you live under water.", next = "BACK", fx = { trait = { witty = 1 }, affinity = -1 } },
        { text = "I'll remember the one's name.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The bay obeys no one, not even the one, though it is fond of Arkkoroc, and that is nearly the same. The Waterlords on their island think the tides belong to them, and the naga think the deep belongs to them, and the one lets them think it. A hydra has been killing the one's sons and the sea did nothing to stop it, so you see even a god's waters have their limits." } },
      choices = {
        { text = "The waters should have a lord. Better you than the naga.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The sea is free. No god or duke commands it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They sing of the night the waters closed over Zin-Azshari, and the one has heard that song more times than there are shells on this shore. The makrura say the drowned city still lies beneath the waves, and the one would not have mortals with magic in their hands disturbing what sleeps there." } },
      choices = {
        { text = "Then I'll leave the drowned city in peace.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Its secrets should be found, not left to rot.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll keep my spells away from the sea.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They poisoned the land above, and the rivers carried their poison down into the one's waters, and the deep folk sickened for it. Bring no demon to this temple, small one, or the one's grief for his sons will find a new target." } },
      choices = {
        { text = "I'll bring no demon here. You've suffered enough.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My demons go where I choose, god or no god.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll keep it away.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They bow, and they bring the one pearls, and they sing the one's name to the tides, so the one is a god by any measure that matters. Yet the one's sons are dead to a hydra all the same, and no worship brings them back, which the one suspects your gods know something about." } },
      choices = {
        { text = "Grief humbles every god. I'm sorry for your sons.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Worship is power. Keep them singing, Arkkoroc.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The deep folk welcome nothing that walks on land and pretends to swim. Yet the hydra that took the one's sons is no creature of the sea, druid; it is a wrong thing, and if your kind would hunt it beside the makrura, the one would call that a fair shape to wear." } },
      choices = {
        { text = "I'll hunt it. A wrong thing has no place in the sea.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your sons are your affair. I keep to my own waters.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Lord Arkkoroc.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A small quiet thing slips into the temple of the one. The one sees you anyway, small thing, but the one admires the effort." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A small thing in shining shell comes to the temple of the one. Your god is bright, small one, but is it near, and does it answer, as the one answers the deep folk?" },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A small one with a sword stands before Arkkoroc. The beast that killed the one's sons was greater than any sword, little warrior, and the one's sons were not small." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A small one with a bow and a beast. The deep folk hunt with nets and spears, little hunter, but Arkkoroc has watched your kind shoot the gulls from the sky." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, who speaks to water as though the water would answer. The sea answers Arkkoroc, little one, but you may listen if you are quiet." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A small one who bends the tides of magic. The deep folk sing of the Highborne, who did the same, and the sea took their city for it." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Arkkoroc smells the burning ones on you, small one. The sea quenches fire, and the one would quench yours if you brought it near the temple's waters." },
        { id = "h_default", key = true,
          text = "Arkkoroc is the one who rules these waters, the god of the deep folk and the lord of this temple. The makrura bow to the one, the murlocs sing to the one, and the sea itself remembers the one's name." },
        { id = "h_name", when = { questActive = TODO_QUEST("The Name of the Beast") },
          text = "A demon lord, the demon hunter says? The one knows the name you seek, and will give it, but first you must do something for the one." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest comes before Arkkoroc. The one is a god to the deep folk, and the one wonders whether your gods ever answer you as the makrura answer the one." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A shape-changer comes to the temple of Arkkoroc. The one has seen your kind take the shape of the seal and the shark, and the one is not impressed, but the one is curious." },
      },
      again = {
        { id = "h_again", text = "What else does the small thing want of the one?" },
        { id = "h_again2", text = "Speak, small thing. The tide is slow; the one is patient, for now." },
      },
      choices = {
        { text = "Do the waters of this bay obey you, great one?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Are you truly a god?", next = "god" },
        { text = "Who threatens your children?", next = "sons" },
        { text = "This was a temple of Elune, once.", next = "temple" },
        { text = "I seek the name of a demon lord.", next = "name", when = { questActive = TODO_QUEST("The Name of the Beast") } },
        { text = "My people know gods too. The loa.", next = "troll_ar", when = { race = "Troll" } },
        { text = "What do the deep folk sing of the Highborne?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the burning ones trouble the sea?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do the deep folk truly worship you, Arkkoroc?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could a warrior kill the beast that slew your sons?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the deep folk hunt as I do, Arkkoroc?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Would the deep folk welcome a druid in the water?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do you truly think yourself a god, Arkkoroc?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why does Arkkoroc admire a sneaking small thing?", next = "xrogue", when = { class = "ROGUE" } },
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
