-- The Bay of Storms: a duke of the Waterlords on his island, a demon hunter on his, and a sea giant in a drowned temple. Voice: bibles/azshara.md
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hydraxis", id = TODO_NPC("Duke Hydraxis"), name = "Duke Hydraxis",
  bible = "bibles/azshara.md", role = "questgiver", tier = "major",
  communities = { "bay_of_storms" }, temper = { "proud", "steady" }, values = { "brave", "proud" },
  likesTone = "polite",
  notices = { "class", "race", "reputation", "lock_breath", "lock_stones" },

  impression = {
    first = "He judged me as a tool and found me barely adequate.",
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
      text = "You reek of the wind, elf, like a cheap perfume. The servants of the wind are not friends of the Waterlords; remember that, while you stand on my shore." },
    { id = "n_rep", cat = "reputation", when = { reputation = { faction = "Hydraxian Waterlords", min = "friendly" } },
      text = "The Waterlords know your name now, and remember it, which is more than we do for most of your kind." },
    { id = "n_lock_breath", cat = "lock_breath", when = { class = "WARLOCK", aura = { 5697 } },
      text = "You breathe my waters as if they were air, warlock, which is a mortal's trick and an impertinent one. Still, it means you can go where my servants fight, and I can think of uses for a fire that does not drown." },
    { id = "n_lock_stones", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5522, 13602, 13603, 1254, 13699, 13700, 13701 } },
      text = "There is a stone of fire in your pack, and the sea around my island hissed when you came ashore. Ragnaros's children carry their flame the same way, so do not mistake my patience for welcome." },
  },

  start = "hello",
  nodes = {
    op_darkiron = {
      lines = {
        { id = "opd_default", text = "Forgiven? Water does not forgive or condemn, mortal; it only wears away what is in its path. But your kind trades in such words, so tell me how you would judge them." },
      },
      choices = {
        { text = "Their grandsires did it. The living can still choose better.", next = "op_di_forgive", fx = { align = { light = 1 }, opinion = { dark_iron = "redeemable" } } },
        { text = "They woke a god of fire. Every one must answer for it.", next = "op_di_answer", fx = { affinity = 1, align = { light = -1 }, opinion = { dark_iron = "hate" } } },
        { text = "They're our kin, Duke, and they're our shame.", next = "op_di_kin", fx = { opinion = { dark_iron = "mixed", dwarves = "ashamed" } }, when = { race = "Dwarf" } },
        { text = "I'll leave judgment to the tides.", next = "BACK" },
      },
    },
    op_di_forgive = {
      lines = {
        { id = "opdf_default", text = "You say they can choose better, and yet they kneel to Ragnaros still, and stoke his fires, and call it worship. Choose as you like, mortal, but bring me his lieutenants all the same." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_di_answer = {
      lines = {
        { id = "opda_default", text = "Then we are agreed, though not for your reasons. Their choices do not interest me, only the fire they feed, and I would see it quenched." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_di_kin = {
      lines = {
        { id = "opdk_default", text = "Shame is a thing for those who stay dry. Use it as you will, little dwarf, and use it against the fire if you can." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xcl_mc = {
      big = true,
      lines = { { id = "xcl_mc_default", text = "Won? You have smothered one flame, the greatest of them, but fire does not die, it waits. The Firelord will gather himself again in time, and when he does I want the Waterlords standing over the place he returns to." } },
      choices = {
        { text = "Then we drown every ember he left. No mercy for fire.", next = "BACK", reply = "Good. You speak like a tide, mortal, and the Waterlords will remember it. Drown every ember, and the Firelord will wake to ash.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Fire has its place. Banish it, but don't unmake it.", next = "BACK", reply = "Its place is beneath the sea, extinguished, and nowhere else. You are soft, mortal, but you will learn.", fx = { align = { light = 1 } } },
        { text = "Why do the Waterlords hate fire so?", next = "xcl_mc2" },
      },
    },
    xcl_mc2 = {
      lines = { { id = "xcl_mc2_default", text = "Fire boils us, mortal, and turns our substance into steam that drifts away without a mind. Every elemental lord makes war on the others, but only fire makes war by unmaking, and I will not forgive Ragnaros for the servants I lost beneath Blackrock." } },
      choices = {
        { text = "Understood, Duke.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "What I would have of anyone: that you go where I send you and break what I tell you to break. The servants of Ragnaros burn in the Molten Core beneath Blackrock, and your Light will not quench them, but your hammer may, if your faith is as stubborn as the sea." } },
      choices = {
        { text = "I'll break them, Duke, but I serve the Light, not you.", next = "BACK", reply = "Serve whatever you like, so long as you break what I point at. The Light and the sea can share an enemy.", fx = { align = { order = -1 } } },
        { text = "Command me, then. Fire's servants must be put down.", next = "BACK", reply = "Good. That is the only answer I wished to hear, and I will remember who gave it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The servants of fire, stone and wind do not reason, mortal, so they must be broken, and a warrior breaks things willingly. Every elemental you extinguish weakens the lords who command them, and the Waterlords remember who served." } },
      choices = {
        { text = "I'll fight your war openly, Duke, and stand by what I've done.", next = "BACK", reply = "Stand by it, then, and the sea will stand by you. Honesty is rare among land-folk.", fx = { align = { honor = 1 } } },
        { text = "I'll fight it for the reward, and keep my own counsel.", next = "BACK", reply = "Keep your counsel, mortal, and I will keep my rewards. That is a fair trade.", fx = { align = { honor = -1 } } },
        { text = "Something else, Duke.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The Waterlords do not hunt, mortal; we drown, and patience is our whole art. A hunter who can wait for the right moment understands the tide better than any warrior, and is a little more useful to me for it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The Waterlords do not hunt, mortal; we drown, and patience is our whole art. Your {pet} does not like the smell of salt, I see. Keep it from the water's edge, because what lives in the bay does not distinguish between a beast and a meal." },
      },
      choices = {
        { text = "Patience and an honest shot. That's the whole of the hunter's art.", next = "BACK", reply = "An honest shot, yes, and the tide will reward it. You understand more than most.", fx = { align = { honor = 1 } } },
        { text = "Patience, yes, and a trap the prey never sees.", next = "BACK", reply = "A trap the prey never sees is a drowning, mortal. You would make a fine Waterlord.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage_hy = {
      big = true,
      lines = {
        { id = "mhy_default", text = "It makes you a mortal playing with a spark of my enemy's essence, which is a very different thing from being him. Your fire is borrowed and small, and it goes out; his does not, and that is why the Waterlords make war on it." },
      },
      choices = {
        { text = "Then I'll turn my fire on his servants.", next = "BACK", reply = "Good. Turn it there, and watch it go out against them. That is the best use of a borrowed flame.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Fire's a tool. I'll use what serves me.", next = "BACK", reply = "Use it, then, mortal, and pray it never turns on you. Fire has no loyalty, not even to itself.", fx = { align = { order = -1 } } },
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
        { text = "Balance needs both calm and storm.", next = "BACK", reply = "Both, yes, and the sea is both at once. Perhaps the Circle is wiser than I thought.", fx = { align = { order = -1 } } },
        { text = "Then the Circle must keep the storm in check.", next = "BACK", reply = "The Circle may try, druid, and the storm will laugh. But I would watch them try.", fx = { align = { order = 1 } } },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because your demons burn as the Firelord's servants burn, and they foul any water they touch. The Waterlords have no quarrel with you so long as your fire serves my war against Ragnaros and not your own appetite." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because your demons burn as the Firelord's servants burn, and that one fouls the very spray around it as it stands there. The Waterlords have no quarrel with you, warlock, so long as your fire serves my war against Ragnaros, so point it at the Firelord's minions and keep it out of my waters." },
      },
      choices = {
        { text = "I'll turn my fire against the Firelord, then.", next = "BACK", reply = "Good. Then we have no quarrel, and the sea will tolerate you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My fire serves me first, Duke.", next = "BACK", reply = "First, last, it is the same to me, so long as it burns my enemies. Do not foul my waters.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll keep my servant out of sight.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The servants of fire and earth are strong but they are not watchful, and a quiet blade can reach the lieutenants who order them. Strike where they do not look, and the pure waters will remember the service, though I will not pretend to love the method." } },
      choices = {
        { text = "A quiet blade wins wars. I'll strike where they don't look.", next = "BACK", reply = "Good. The tide rises where no one is looking, and so should you.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather face them openly.", next = "BACK", reply = "Then you will be burned, mortal, as they burn all who face them openly. But I will honour you for it.", fx = { align = { honor = 1 } } },
        { text = "The tide and I will see.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "By ending the servants of fire who befoul the deep places of this world, as any other mortal might. Your prayers are nothing to the sea, but your will is a tool like any other, and the Waterlords reward tools that do not break." } },
      choices = {
        { text = "Then I'll serve, and see the fire's servants ended.", next = "BACK", reply = "Good. Serve, and the sea will remember your name when the fire is ended.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'm no one's tool, Duke. I choose my own fights.", next = "BACK", reply = "Then choose this one, mortal, and choose well. The Firelord will choose for you otherwise.", fx = { align = { order = -1 } } },
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
          text = "You command creatures of fire and shadow, mortal, and the pure waters recoil from them, so keep your servant out of my sight while we speak." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue. The tide moves quietly too, mortal, and it wears down mountains, so perhaps there is a use in you that your size hides." },
        { id = "h_default", key = true,
          text = "I am Hydraxis, Duke of the Waterlords. Your kind were not born of the deep, mortal, and our war is beyond you, but a mortal may still be useful to it, and be rewarded for it." },
        { id = "h_poison", when = { questActive = TODO_QUEST("Poisoned Water") },
          text = "Plague has fouled my scouts in the east. Use the aspect of Neptulon to drive it out of them, destroy the madness that remains, and bring me their bracers; I will not suffer that affront to our purity any longer." },
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
        { text = "You speak as though you wage a war, Duke.", next = "war" },
        { text = "What do you want from mortals?", next = "mortals" },
        { text = "Something happened to your scouts in the east.", next = "plague" },
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
        { text = "A hunter's patience should suit the Waterlords.", next = "xhuntcl", when = { class = "HUNTER" } },
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
        { text = "You speak as if you broke this land.", next = "lords_broke" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lords_neptulon = {
      lines = { { id = "ln_default", text = "The Lord of the Tides, master of every deep. He does not come to mortals, and you should pray he never has reason to. I speak for him here, and that is as near as you will ever stand to him." } },
      choices = {
        { text = "I'd stand nearer, given the chance.", next = "BACK", reply = "Bold words from so small a vessel, mortal, and the tide has drowned bolder ones. Should the Lord of the Tides ever turn his gaze upon you, you will wish you had kept them to yourself.", fx = { trait = { brave = 1 }, align = { order = -1 } } },
        { text = "I'll keep my distance, Duke.", next = "BACK", reply = "Wisdom, at last, from a creature of the dry lands. Keep to the shallows of his notice, and you may live long enough to be of use to us.", fx = { trait = { cautious = 1 }, align = { order = 1 } } },
      },
    },
    lords_broke = {
      lines = { { id = "lb_default", text = "The sea came in when the elves' great well tore itself apart, and the sea is ours. We did not break the land, mortal; we only took what fell to us, and a whole kingdom fell." } },
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
        { text = "Should the Dark Iron be forgiven for waking him?", next = "op_darkiron" },
        { text = "Then I'll fight fire for you.", next = "BACK", reply = "Then you are a better tool than most, mortal, for courage is rarer than greed on these shores. Ragnaros has burned unchecked for too long, and the deep remembers those who stood against him.", fx = { affinity = 1, trait = { brave = 1 }, align = { honor = 1 } } },
        { text = "I'll fight fire when it pays, Duke.", next = "BACK", reply = "Pay it shall, mortal, for the Waterlords reward their tools generously. Bring me ashes, and you will have your due.", fx = { align = { honor = -1 } } },
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
        { text = "An honest bargain, then.", next = "BACK", reply = "Honest it is. Break it, mortal, and you will learn that the sea collects its debts with interest.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll use you better than you use me.", next = "BACK", reply = "Try, mortal, and I will enjoy watching you. The tide always wins in the end.", fx = { align = { honor = -1 }, trait = { proud = 1 } } },
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
          text = "My scouts went east, into the dead lands of Lordaeron, and the sickness there crept into their waters and twisted them. Water carries everything that is put into it, mortal, and the dead have poured their plague into those rivers." },
        { id = "pl_done", when = { questDone = TODO_QUEST("Poisoned Water") },
          text = "My scouts are cured, those who could be, and their madness is ended. Our strength is in our purity; you have restored a little of it, and the Waterlords remember." },
      },
      choices = {
        { text = "I didn't know the plague could touch elementals.", next = "plague_how" },
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
        { text = "All four elements must stand in balance.", next = "BACK", reply = "Balance, you say, as the land-folk say, and the sea laughs. Listen longer, shaman, and you will hear.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Water has my respect, Duke, above the rest.", next = "BACK", reply = "Good. Few shamans say so, and fewer mean it. Speak to the water in your prayers, and it may yet answer you.", fx = { affinity = 2, align = { order = -1 } } },
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

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "You speak as one should on the shore of the Waterlords, mortal, and the tide carries such words a long way. I will remember that you knew how to address a duke of the deep." },
        { id = "s2", text = "It is fitting that you see what water is, when so many of your kind see only something to drink. Speak on, little rain, for you have my ear." },
        { id = "s3", when = { class = "SHAMAN" }, text = "A shaman who gives water its due before the other three. You are wiser than most who bargain with the elements, and I will not forget it." },
      },
      fail = {
        { id = "f1", text = "Your praise runs off me like rain off a stone, mortal. The Waterlords are moved by deeds against fire, and you have brought me only words." },
        { id = "f2", text = "Do not pour sweet water into the sea and expect the sea to grow sweeter. I have heard courtiers before, and I value all of them below a single dead servant of the Firelord." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "You splash at the tide, little rain, and you do not flinch when it rises. There is some storm in you after all, and I had not expected it." },
        { id = "s2", text = "Those are bold words to speak to me on my own rock. The Waterlords have use for mortals who do not go still when a lord of the deep looks at them." },
      },
      fail = {
        { id = "f1", text = "You mock the sea from its own shore, which is how mortals drown. Speak with respect, as I told you, or do not speak at all." },
        { id = "f2", text = "A puddle may say what it likes about the ocean, and the ocean does not answer. Do not try my patience further, for it is deep, but it has a floor." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "You press upon me as though you were a storm front, mortal, and for a moment the water at my feet believed it. I am not moved, yet I see that fire would have cause to fear you, and that pleases me." },
        { id = "s2", text = "Few who stand on this shore would dare so much. I yield you nothing, but I will speak to you as I speak to one who matters, since you have shown me that you may." },
      },
      fail = {
        { id = "f1", text = "You cannot frighten the tide, mortal. It has worn down mountains that were greater than you, and it did not hurry." },
        { id = "f2", text = "You threaten water with a raised hand, and the water closes over the hand. Lower it, and remember whose shore this is." },
      },
    },
  },

  blurts = {
    { id = "bl1", text = "The runes of fire in the Molten Core feed the Firelord's lieutenants, and only water from my court will douse them. Do it, and his Majordomo must come out to face you." },
    { id = "bl2", text = "Ragnaros was torn into this world by the Dark Iron sorcerer Thaurissan, and every fire elemental under Blackrock answers to him. Do not imagine you are fighting strays." },
  },
  topics = {
    grievance = {
      { id = "gv1", text = "You were given work and treated it as a favour you might grant. I do not tolerate such presumption from my instruments." },
      { id = "gv_tone", when = { grudge = "tone" }, text = "You address a lord of the Waterlords as if he sold fish on a pier. The tide has drowned prouder things than you." },
      { id = "gv_wronge", when = { grudge = "wronged" }, text = "I measured you and found you wanting, and you answered with insolence. Water remembers every stone thrown into it." },
    },
    amends = {
      { id = "am1", text = "Carry my war into the Firelord's halls and come back alive. Deeds wash words away, and nothing else does." },
      { id = "am_tone", when = { grudge = "tone" }, text = "Speak with the courtesy owed to a duke of the elemental courts, and I may hear you again." },
    },
    spite = {
      { id = "sp1", text = "I think you are a pebble that believes itself a mountain. The sea is very patient with such pebbles, and very thorough." },
      { id = "sp_tone", when = { grudge = "tone" }, text = "I think you were raised among people who never learned to bow. The Firelord's servants will teach you, and they are less kind than I am." },
    },
    _gated = {
      { id = "gt1", text = "The deeper waters are not opened to every mortal who wades in. Serve the Waterlords against fire, and then ask me again." },
      { id = "gt2", text = "I will not speak of that to one whose name the tide has not yet troubled to carry. Earn my regard first, mortal." },
    },
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
    arkkoroc = { { id = "tp_arkkoroc", text = "The sea giant in the drowned temple calls himself a god, and the tides find this very funny. He is useful against the naga, and so I tolerate his opinions." } },
    loramus = { { id = "tp_loramus", text = "The elf on the island hunts the demon in his own blood, and the water there smells of brimstone. I do not care what he hunts, so long as he hunts it far from my rock." } },
    onyxia = { { id = "tp_onyxia", text = "The black dragon serves fire, as her father does, and so she is my enemy whether she knows my name or not. I would drown her in her own swamp." } },
    the_elements = { { id = "tp_the_elements", text = "The shamans speak of balance among the elements, as if water ever wished for balance with fire. We wish for fire to be put out, and that is the only balance the Waterlords respect." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Iron dwarves kneel to the Firelord in their mountain, and they would drown very easily if I had my way. Bring me their dead and I will think better of you." } },
    thrall = { { id = "tp_thrall", text = "The orc shaman who leads the Horde speaks to the elements as a friend, I am told. The water does not need friends, mortal; it needs servants." } },
    _none = { { id = "tp_none", text = "That is a matter for dry land, mortal, and of no interest to the Waterlords." } },
  },
}

P:NPC {
  key = "loramus", id = TODO_NPC("Loramus Thalipedes"), name = "Loramus Thalipedes",
  bible = "bibles/azshara.md", role = "questgiver", tier = "major",
  communities = { "bay_of_storms" }, temper = { "sharp", "steady" }, values = { "brave", "stern" },
  private = { "elune" },
  notices = { "class", "race", "fel" },

  impression = {
    first = "He mocks me for the demons I can't see, yet he helps.",
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
      text = "You hold a demon on a leash and believe the leash is yours. I have watched a great many of your kind learn otherwise." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "One of my own people, and you look at me the way they all do, as if I were already one of the things I hunt. Look all you like." },
    { id = "n_fel", cat = "fel", when = { class = "WARLOCK", pet = true },
      text = "Keep your creature close, warlock. My hounds know its smell, and they are not fond of rivals." },
  },

  start = "hello",
  nodes = {
    op_demons = {
      lines = {
        { id = "opd_default", text = "That is the question my own people answered for me, by sending me away. They decided the price was too high. I would hear what a mortal decides, since you will live with the consequences longer than they will." },
      },
      choices = {
        { text = "To beat a demon, you must know one. You chose rightly.", next = "op_dem_right", fx = { affinity = 1, align = { light = -1 }, opinion = { demons = "necessary" } } },
        { text = "Some power is too tainted to touch, whatever the cause.", next = "op_dem_wrong", fx = { affinity = -1, align = { light = 1 }, opinion = { demons = "hate" } } },
        { text = "Our people cast you out. They were wrong to.", next = "op_dem_right", fx = { affinity = 2, opinion = { demon_hunters = "respect" } }, when = { race = "NightElf" } },
        { text = "I'm not the one to judge that.", next = "BACK" },
      },
    },
    op_dem_right = {
      lines = {
        { id = "opdr_default", text = "Rightly, perhaps, and I have paid for being right every day since. Do not envy it, {race}; there are easier truths to carry." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_dem_wrong = {
      lines = {
        { id = "opdw_default", text = "Then you sound like the priestesses, and they at least had the courage to say it to my face. Keep your clean hands, mortal, while there are still people like me to dirty theirs for you." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_loramus = {
      big = true,
      lines = { { id = "xpt_loramus_default", text = "Dangerous to everyone but the demons, who are the only ones who always profit from the bargain. I have hunted demons since before your kingdoms had names, and I've never met a warlock who believed they'd be the one to slip, so watch yours closely." } },
      choices = {
        { text = "Fel magic should be burned out, whoever uses it.", next = "BACK", reply = "Burned out, yes, and the hands that use it with it, if they will not let go. You are wiser than most of your kind.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A strong warlock keeps the demons leashed. Power is power.", next = "BACK", reply = "Every warlock says so, right up to the moment the leash snaps. I have buried many strong ones.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_dm = {
      big = true,
      lines = { { id = "xcl_dm_default", text = "I know Prince Tortheldrin, by name and by crime, and the pylons that keep a creature of the Nether chained in the city's heart so the Shen'dralar can drink from it. That is the sickness of the Highborne in one sentence: they would rather leash a horror than live without its power." } },
      choices = {
        { text = "Leashing a demon is still serving it. Their power must end.", next = "BACK", reply = "You speak like a hunter, and I'm glad of it. Tortheldrin's leash will snap one day, and I'd rather it were cut first.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If the leash holds, I'd use the power.", next = "BACK", reply = "So did he, and look at what he's become. I would not stand near you when the leash fails.", fx = { align = { light = -1 } } },
        { text = "Are any of the Highborne in Dire Maul worth saving?", next = "xcl_dm2" },
      },
    },
    xcl_dm2 = {
      lines = { { id = "xcl_dm2_default", text = "A few of them keep books, and books are not sins, though they lead to one often enough. I spent my youth among people like that, and I left before the worst of it, which is the only wisdom I can boast of." } },
      choices = {
        { text = "Then you chose well, Loramus.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Some do, the small ones, the ones that remember being burned. The greater ones only grow curious, and curiosity is worse, because it makes them patient. Your Light is a fine weapon, paladin, but it is not a shield against what you cannot see, and my eyes were opened long ago." } },
      choices = {
        { text = "Then lend me your eyes, and I'll lend you my hammer.", next = "BACK", reply = "Gladly, paladin, and between us we'll see a great many things the Legion would rather hide. Keep your hammer close.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I've faced demons before without a hunter's tricks.", next = "BACK", reply = "Before, perhaps, but not the ones that hide. Your Light is bright, but it is not eyes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "He trusts someone who can see, and he swings where he's told, and he doesn't argue. My hounds smell the Legion's servants long before your eyes would find them, and the felbane steel that Galvan the Ancient forges will put an edge on yours that demons feel." } },
      choices = {
        { text = "Then I'll trust your eyes and strike where you tell me.", next = "BACK", reply = "Then you'll live, warrior, and the Legion's servants won't. That is all I ask.", fx = { align = { order = 1 } } },
        { text = "I'll trust my own blade. I don't take orders from anyone.", next = "BACK", reply = "Then your blade will swing at shadows while the real thing stands behind you. Your choice.", fx = { align = { order = -1 } } },
        { text = "Something else, Loramus.", next = "BACK" },
      },
    },
    hunter_lo = {
      lines = {
        { id = "hlo_default", text = "Honest, yes, and it will die the first time it meets what my hounds were bred to hunt. A beast sees with its eyes; mine see with what was burned into them, and I trust them over any honest creature on this coast." },
      },
      choices = {
        { text = "I'd rather trust a friend than a weapon.", next = "BACK", reply = "A noble sentiment, and a short-lived one. Friends die, hunter, and the Legion is very patient.", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Fair. Use what sees the enemy.", next = "BACK", reply = "Exactly, hunter, and you'll live longer for it. My hounds see what yours never will.", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    sky_lo = {
      big = true,
      lines = {
        { id = "slo_default", text = "Tortheldrin, yes; I know the name, and the crystals, and what they drank from. Your rebels left before the worst of it, which was wise, but don't imagine the Nether forgot the city because your people stopped looking at it." },
      },
      choices = {
        { text = "We remember what it cost. We won't touch it.", next = "BACK", reply = "Then you'll live longer than the Shen'dralar will, I think. The Nether forgets nothing.", fx = { align = { light = 1 } } },
        { text = "Power like that could be turned against demons.", next = "BACK", reply = "It could, for a while, and then it would turn. I have seen it turn many times.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Ruins, bones and debts, mortal. The Highborne opened this land to demons ten thousand years ago, and something of that door still hangs open around Eldarath and the old palaces. Your spirits feel it as a wrongness and look away, while I look straight at it, and that is the whole difference between us." } },
      choices = {
        { text = "Then I'll look at it too, whatever my spirits prefer.", next = "BACK", reply = "Look carefully, then, shaman, and never alone. What hangs open there has eyes.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Spirits keep their distance for a reason. That's wisdom, not fear.", next = "BACK", reply = "Wisdom, perhaps, and I'll not mock it. But someone has to look, and I've been looking a long time.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I blame the Highborne, and I blame Queen Azshara, and I watch every mage I meet for the same hunger. Most of you are fools who light candles, but some of you are not, and those are the ones I hunt eventually." } },
      choices = {
        { text = "I'll never seek that kind of power. You have my word.", next = "BACK", reply = "Then keep it, mage, for I will be watching. Your word is the only thing standing between you and Azshara's road.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear of knowledge is how wars are lost.", next = "BACK", reply = "And hunger for it is how worlds are lost. I'll be watching you all the same.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll remember the warning.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Shades of demons slain long ago, and some not slain at all, waiting for the veil to thin. You could stand beside one and never know it, rogue, and that is why I keep watch here while you only pass through." } },
      choices = {
        { text = "I'd want to know. Show me how to see them.", next = "BACK", reply = "You'd want to know until you knew, rogue. Some sight costs more than it gives.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some things are better left unseen.", next = "BACK", reply = "Wise, and rarer than you think. Leave the seeing to me.", fx = { align = { order = 1 } } },
        { text = "I'll watch my back, then.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Touch them, yes, and feed them too, if you're careless. The Highborne who sank under these waves thought they could hold the dark at arm's length, priest, and I have spent a very long time cleaning up after that mistake." } },
      choices = {
        { text = "Then I'll hold to healing and leave demons to you.", next = "BACK", reply = "Good, priest, and you'll sleep better for it. I've had my fill of priests who thought otherwise.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Shadow is my weapon, and I'll use it as I see fit.", next = "BACK", reply = "Then I'll watch your shadow as closely as I watch theirs. The Highborne said the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Felhound tracks under the Highborne ruins, and the rot the satyrs leave wherever they dance. Your Circle would heal this land with patience and seeds, but you cannot plant a garden over a nest of demons, druid; first they burn, and then you may grow what you like." } },
      choices = {
        { text = "Then burn them. The healing can wait until they're gone.", next = "BACK", reply = "Spoken like a hunter, druid. Burn them first, and the seeds can come later.", fx = { align = { light = -1 } } },
        { text = "Burn the demons, not the forest. The land has suffered enough.", next = "BACK", reply = "Precisely, and the Circle will thank you for the distinction. The land is not the enemy.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_loramus", tags = { "news" }, when = { party = { class = "WARLOCK" } },
          text = "You travel with a warlock. I can smell the fel on {companion} from across the water, and I'll tell you what I tell all of their kind, that the demons are patient and the warlock never is." },
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
          text = "Can you see them, mortal? The shapes at the edge of the tide, the shapes that cast no shadow? No; I thought not. Your kind have eyes and see nothing with them, which spares you many sleepless nights, and leaves the watching to me." },
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
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You hear the forest well enough, druid, but you're as blind to the demons hiding in it as any other mortal." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick; the tide is turning, and what it brings in does not wait." },
        { id = "h_again2", text = "Ask, mortal. My hounds are patient, and so, today, am I." },
      },
      choices = {
        { text = "What has the Legion left in Azshara's earth?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You don't look like any night elf I've met, Loramus.", next = "who" },
        { text = "What do you see that I can't?", next = "see" },
        { text = "Which demon do you hunt, Loramus?", next = "razelikh" },
        { text = "Your hounds are demons themselves.", next = "hounds" },
        { text = "The Light can stand against any demon.", next = "priest", when = { class = "PRIEST" } },
        { text = "I command demons too, hunter. Mine simply kneel faster.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Our people cast out demon hunters.", next = "nelf", when = { race = "NightElf" } },
        { text = "Your hounds are demons. My beast is honest.", next = "hunter_lo", when = { class = "HUNTER" } },
        { text = "My forebears in Eldre'Thalas fought a prince who drank the Nether.", next = "sky_lo", when = { race = "Skyborne" } },
        { text = "You seem to blame all mages for the Legion's coming.", next = "xmage", when = { class = "MAGE" } },
        { text = "What walks unseen along the shore?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Can a priest's shadow touch the demons you hunt, Loramus?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "A warrior can't fight what he can't see.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What do you see in Azshara's woods that I can't?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do demons fear a paladin's Light, Loramus?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I've been through Dire Maul, Loramus. What do you know of it?", next = "xcl_dm", when = { cleared = "Dire Maul" } },
        { text = "Is a warlock really so dangerous to travel with, Loramus?", next = "xpt_loramus", when = { party = { class = "WARLOCK" } } },
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
      choices = {
        { text = "Was it worth it, using the enemy's power against him?", next = "op_demons" },
        { text = "Something else.", next = "BACK" },
      },
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
        { text = "Then I'll trust your eyes.", next = "BACK", reply = "Good. Stay at my shoulder, then, and strike only when I say.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather see for myself, whatever it costs.", next = "BACK", reply = "Then you are a fool, and I've known many. Few of them lived long enough to regret it.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },

    razelikh = {
      big = true,
      lines = {
        { id = "ra_default", fx = { learn = { "loramus" } },
          text = "Razelikh the Defiler, the cruellest of Kazzak's lieutenants in the old war. Kazzak lost that war and crawled away to lick his wounds, and he set Razelikh to hold the Blasted Lands for him, which he has done while your kingdoms quarrelled over fields and borders." },
      },
      choices = {
        { text = "He's held them a long time, it seems.", next = "razelikh_triad" },
        { text = "Why don't you kill him yourself?", next = "razelikh_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    razelikh_triad = {
      lines = { { id = "rt_default", text = "He has, through three servants: Sevine of the Shadowsworn, Allistarj, and the ogre Grol. He gave them and their followers deathless lives, and bound those lives to the Blasted Lands, so that they can never leave and never fall, and never stop serving him." } },
      choices = {
        { text = "Then how can they be beaten?", next = "razelikh_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    razelikh_name = {
      lines = { { id = "rn_default", text = "With a weapon that bears his true name. Forge such a thing, and he and all who serve him become as mortal as you. Finding the name will cost you years, mortal; forging it is merely difficult." } },
      choices = {
        { text = "Then I'll find it.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "And then I'll face him in his lair.", next = "razelikh_laugh" },
      },
    },
    razelikh_laugh = {
      lines = { { id = "rl_default", text = "You will. You are foolhardy, {race}, and I find I admire it, the way one admires a moth that flies at a bonfire with great determination." } },
      choices = {
        { text = "Courage is never foolish.", next = "BACK", reply = "Courage is never foolish, only fatal. Go and prove me wrong, {race}.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll strike from the dark, not charge.", next = "BACK", reply = "Wiser, and less amusing. Strike well, and come back alive.", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    razelikh_why = {
      lines = { { id = "rw_default", text = "Because I watch more than one door, and if I leave this one, something will come through it. So I teach, and arm, and send others, and I count the ones who come back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hounds = {
      lines = { { id = "ho_default", text = "Raytaf, Shahiar and Zaman. Yes, they are felhounds, and yes, they are demons, and they are mine, because a hunter uses the best hounds he can find. They eat what I hunt, which keeps them loyal and keeps the island tidy." } },
      choices = {
        { text = "Using demons to fight demons is dangerous.", next = "BACK", reply = "Dangerous, yes, and I've lived with that danger for ten thousand years. My hounds have never once turned on me.", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "Any weapon is fair against the Legion.", next = "BACK", reply = "Exactly, and the Legion uses every weapon against us. I'll not be less clever than they are.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      lines = { { id = "pri_default", text = "It can, priest, if the one who carries it does not flinch. Most do; the Light is bright, and what it shows you in the dark is not always what you wished to see. Keep your lamp, and keep it high, and do not be surprised by what it reveals." } },
      choices = {
        { text = "My faith will not flinch.", next = "BACK", reply = "Then you'll see what you must, priest, and that is rarer than you know. Keep it steady.", fx = { affinity = 1, align = { light = 2 } } },
        { text = "Faith alone won't win this. I'll learn your ways too.", next = "BACK", reply = "A wise answer, and I'll teach what can be taught. The rest you must learn by bleeding.", fx = { affinity = 1, align = { light = -1 } } },
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
        { text = "My will is stronger than any demon.", next = "BACK", reply = "So said every warlock I have ever hunted. Keep your will close; I will be keeping mine closer.", fx = { align = { light = -1 }, trait = { proud = 1 } } },
        { text = "You're right. I keep watch on myself.", next = "BACK", reply = "Good. Watch yourself as closely as I'll watch you, and you might live.", fx = { affinity = 1, align = { light = 1 }, trait = { cautious = 1 } } },
      },
    },
    nelf = {
      lines = { { id = "ne_default", text = "They did, and they were right to fear us, and wrong to send us away. The kaldorei would rather close their eyes than see what still waits under this sea; I would rather lose mine." } },
      choices = {
        { text = "Our people did what they had to.", next = "BACK", reply = "They did, and they were not entirely wrong. But they were not entirely right either.", fx = { align = { order = 1 } } },
        { text = "They were wrong to cast you out.", next = "BACK", reply = "Perhaps, and I've waited a long time to hear a kaldorei say it. It means more than you know.", fx = { affinity = 2, align = { order = -1 } } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "You admire a thing my own people cast out, and I hear no pity in it, which is rarer still. I had forgotten that anyone might speak so to me and mean it." },
        { id = "s2", text = "Those are kind words to bring to this island, where I am used to the sea and the growling of my hounds. I will take them, stranger, though I do not promise to know what to do with them." },
      },
      fail = {
        { id = "f1", text = "Demons flatter, mortal, and they do it far better than you. I learned long ago to listen for what the sweet voice wants." },
        { id = "f2", text = "Save your honey for the priestesses, who still care what is said of them. I gave up my eyes and my good name, and I did not do it to be praised by a passer-by." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! You bait a demon hunter in front of his felhounds, and your voice does not shake. Perhaps you are worth more than a meal after all." },
        { id = "s2", text = "You have teeth, then, and I am glad of it, because the thing I hunt would swallow a meek {class} whole. Keep that edge, and bring it with you when the time comes." },
      },
      fail = {
        { id = "f1", text = "I have been mocked by dreadlords in voices I once loved, and you are a poor second to them. Mind your tongue, or my hounds will mind it for you." },
        { id = "f2", text = "You mistake me for someone with patience to spare. Say what you came to say, and say it civilly, while I still care to listen." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "My hounds have gone quiet, and they do not do that for many. I see well enough what stands in front of me, mortal, and I will own that I should not like to be the demon you come for." },
        { id = "s2", text = "There is a weight in you that I had not marked before, and I mark such things for my living. I do not frighten, but I do take note, and you have my notice." },
      },
      fail = {
        { id = "f1", text = "I have stood in the dark with things that would unmake your mind for sport, and I walked out again. You will have to do a great deal better than that." },
        { id = "f2", text = "You threaten a blind elf on a rock, and you think it bold. I see the fire in every living thing, mortal, and yours burns no hotter than my hounds' supper." },
      },
    },
  },

  blurts = {
    { id = "bl1", text = "Razelikh the Defiler draws his protection from an amulet, and its pieces are held by his servants scattered across the Blasted Lands. Gather them, and he can be reached." },
    { id = "bl2", text = "Lord Kazzak himself still walks the Tainted Scar, gathering what is left of the old armies. Your kingdoms sleep very soundly for people with such a neighbour." },
  },
  topics = {
    grievance = {
      { id = "gv1", text = "You came to my island and wasted my time. Demons waste enough of it without your help." },
      { id = "gv_values", when = { grudge = "values" }, text = "You flinch from what must be done, and a hunter who flinches is a meal. I have no patience for meals." },
      { id = "gv_wronge", when = { grudge = "wronged" }, text = "I told you plainly what hunts in the dark, and you answered with mockery. I have outlived better jesters than you." },
      { id = "gv_temper", when = { grudge = { worst = "temper" } }, text = "Do not flatter yourself. I dislike everyone who has not watched a demon wear a friend's face, and that is nearly everyone." },
    },
    amends = {
      { id = "am1", text = "Kill Razelikh's servants in the Blasted Lands and bring me proof of it. Respect is earned in demon blood here." },
      { id = "am_wronge", when = { grudge = "wronged" }, text = "Come back when you have learned to listen. I am old, and I can wait longer than you can live." },
    },
    spite = {
      { id = "sp1", text = "I think you are exactly what the Legion loves best: clever, proud and certain that nothing can touch you. They will enjoy you." },
      { id = "sp_values", when = { grudge = "values" }, text = "I think you would bargain with a dreadlord the first time one smiled at you. I have watched it happen to better elves than you." },
    },
    _gated = {
      { id = "gt1", text = "That is mine to keep, and I do not share it with strangers who wander onto my island. Prove that you are something more than that." },
      { id = "gt2", text = "No. I have told you what a demon is, and the rest I tell only to those I have reason to trust." },
    },
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
    waterlords = { { id = "tp_waterlords", text = "The duke on his rock thinks the whole world is fire waiting to be put out, and he thinks I am a candle. He is not entirely wrong." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande's priestesses think a demon hunter is half a demon, and I have given them no reason to change their minds. She was a brave girl in the old war, and I hear she is a hard woman now, which is the same thing grown up." } },
    elune = { { id = "tp_elune", text = "Elune turned her face from me when I took the demon's fire into my body. I do not blame her, but I do still pray, out of habit." } },
    dark_portal = { { id = "tp_dark_portal", text = "The orcs opened a door the Legion was waiting at, and you mortals closed it with more luck than you deserved. The Legion was waiting on the other side, as it always is." } },
    _none = { { id = "tp_none", text = "That is not a demon, so it does not concern me." } },
  },
}

P:NPC {
  key = "arkkoroc", id = TODO_NPC("Lord Arkkoroc"), name = "Lord Arkkoroc",
  bible = "bibles/azshara.md", role = "questgiver", tier = "quest",
  communities = { "bay_of_storms" }, temper = { "proud", "steady" }, values = { "proud", "brave" },
  notices = { "race", "class", "lock_shards" },

  impression = {
    first = "He calls himself a god and grieves the sons a hydra killed.",
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
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 5 } },
      text = "Small one, I hear souls in your bag, faint and cold, like the drowned singing at the bottom of the bay. The one has heard enough of that song, so do not open it here." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the hydra that slew the one's sons was quiet too, until it was not. A small thing that strikes from the dark could strike the hydra where it sleeps, and the one would not care how it died, only that it did." } },
      choices = {
        { text = "I'll strike it in its sleep, and gladly.", next = "BACK", reply = "Then the one will remember you, small thing, and sing your name in the deep. Strike it where it sleeps.", fx = { align = { honor = -1 } } },
        { text = "I'll face it awake. Your sons deserve an honest vengeance.", next = "BACK", reply = "Honest, and brave, and foolish, and the one's sons were all three. The one will mourn you if you fall.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The makrura pray, and the one answers, and that is what a god is, small thing. The one does not ask whether your god is real; the one asks only whether it would have saved the one's sons from the hydra, and it did not, and so the one has no use for it." } },
      choices = {
        { text = "A god isn't measured by favours. Faith asks nothing back.", next = "BACK", reply = "Faith that asks nothing is strange to the one, small thing. The one will think on it.", fx = { align = { light = 1 } } },
        { text = "Then I'll do what no god did, and avenge your sons.", next = "BACK", reply = "Then the one will call you friend, small thing, and the deep folk will sing it. Avenge them.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The one thinks so, if the warrior is foolish enough to stand before it and strong enough to keep standing. The one's sons were strong and stood before it, and still the deep took them, so the little warrior must be stronger, or cleverer." } },
      choices = {
        { text = "Then I'll face it head on, for your sons.", next = "BACK", reply = "Then the one will honour you, small thing, whatever happens. Stand, and keep standing.", fx = { align = { honor = 1 } } },
        { text = "Then I'll be cleverer. Strength alone is what killed your sons.", next = "BACK", reply = "Cleverer, yes, and the one's sons were not. The one likes you, small thing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The makrura hunt the shallows and the murlocs hunt the reefs, and all of them bring the best of the catch to the one. A hunter who brings the one what the one asks will be remembered in the songs of the deep folk, which are very long." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The makrura hunt the shallows and the murlocs hunt the reefs, and all of them bring the best of the catch to the one. And the small beast, {pet}, is it yours, or is it the one's now? Everything that comes into the temple's waters belongs to the one, little hunter, but Arkkoroc will make an exception." },
      },
      choices = {
        { text = "I'll do what you ask and honour the deep folk's ways.", next = "BACK", reply = "Then the deep folk will welcome you, and the one will remember. Bring them fish, small thing; they like fish.", fx = { align = { order = 1 } } },
        { text = "Your songs mean nothing to me. I hunt for my own reasons.", next = "BACK", reply = "Then hunt for your own reasons, small thing, and the one will not sing of you. That is your loss.", fx = { align = { order = -1 } } },
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
        { text = "The waters should have a lord. Better you than the naga.", next = "BACK", reply = "The one agrees, and the one is glad the land-folk see it. The naga are a poison in the tide.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The sea is free. No god or duke commands it.", next = "BACK", reply = "The sea is free, yes, and so is the one. The Waterlords will learn that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They sing of the night the waters closed over Zin-Azshari, and the one has heard that song more times than there are shells on this shore. The makrura say the drowned city still lies beneath the waves, and the one would not have mortals with magic in their hands disturbing what sleeps there." } },
      choices = {
        { text = "Then I'll leave the drowned city in peace.", next = "BACK", reply = "Then the one is glad, small thing, and the drowned dead are too. Some songs should not be answered.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Its secrets should be found, not left to rot.", next = "BACK", reply = "Then you will drown, small thing, as the ones who left it did. The one will sing of you, too.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll keep my spells away from the sea.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They poisoned the land above, and the rivers carried their poison down into the one's waters, and the deep folk sickened for it. Bring no demon to this temple, small one, or the one's grief for his sons will find a new target." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They poisoned the land above, and the rivers carried their poison down into the one's waters, and the deep folk sickened for it. You were told to bring no demon to this temple, small one, and yet here it stands, so take it out before the one's grief for his sons finds a new target." },
      },
      choices = {
        { text = "I'll bring no demon here. You've suffered enough.", next = "BACK", reply = "Then the one thanks you, small thing. The deep folk remember who spared them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My demons go where I choose, god or no god.", next = "BACK", reply = "Then you will not come to this temple, small thing. The one does not argue twice.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll keep it away.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They bow, and they bring the one pearls, and they sing the one's name to the tides, so the one is a god by any measure that matters. Yet the one's sons are dead to a hydra all the same, and no worship brings them back, which the one suspects your gods know something about." } },
      choices = {
        { text = "Grief humbles every god. I'm sorry for your sons.", next = "BACK", reply = "Grief does, small thing, and the one is grateful for your words. The one's sons would have liked you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Worship is power. Keep them singing, Arkkoroc.", next = "BACK", reply = "They will sing, small thing, as long as the one is god. But songs do not bring back sons.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The deep folk welcome nothing that walks on land and pretends to swim. Yet the hydra that took the one's sons is no creature of the sea, druid; it is a wrong thing, and if your kind would hunt it beside the makrura, the one would call that a fair shape to wear." } },
      choices = {
        { text = "I'll hunt it. A wrong thing has no place in the sea.", next = "BACK", reply = "Then the one will remember you, druid, and the deep folk will too. Hunt it well.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your sons are your affair. I keep to my own waters.", next = "BACK", reply = "Then keep to them, druid, and the one will keep to the one's. The tide remembers who stayed.", fx = { align = { honor = -1 } } },
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
        { text = "The deep folk seem to worship you as a god.", next = "god" },
        { text = "Does anything in the sea threaten you?", next = "sons" },
        { text = "This was a temple of Elune, once.", next = "temple" },
        { text = "I seek the name of a demon lord.", next = "name", when = { questActive = TODO_QUEST("The Name of the Beast") } },
        { text = "My people know gods too. The loa.", next = "troll_ar", when = { race = "Troll" } },
        { text = "The deep folk must sing of the Highborne.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the burning ones trouble the sea?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do the deep folk really worship you, Arkkoroc?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "A warrior might kill the beast that slew your sons.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the deep folk hunt as I do, Arkkoroc?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Would the deep folk welcome a druid in the water?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do you really think yourself a god, Arkkoroc?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why does Arkkoroc admire a sneaking small thing?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I'll go, great one.", next = "END", fx = { affinity = 1 } },
      },
    },
    god = {
      lines = { { id = "go_default", fx = { learn = { "arkkoroc" } },
        text = "The deep folk worship the one, and the one answers them, and few gods of the surface can boast as much. Call it what you like, small thing; Arkkoroc does not need your word for it." } },
      choices = {
        { text = "Then you are a god, great one.", next = "BACK", fx = { affinity = 2 } },
        { text = "You're a giant, not a god.", next = "god_insult" },
        { text = "Something else.", next = "BACK" },
      },
    },
    god_insult = {
      lines = { { id = "gi_default", text = "Bold, for something the one could crush in one hand. The one will let it pass, this once, because the one is gracious; say it again and learn how gracious the sea can be." } },
      choices = {
        { text = "I speak the truth, whatever it costs.", next = "BACK", reply = "Then the one will remember it, and the one will be watching. Truth is a dangerous gift to give a god.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Forgive me, great one.", next = "BACK", reply = "Forgiven, small thing, this once. The one is gracious, as the one said.", fx = { affinity = 1, align = { honor = -1 } } },
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
        { text = "Elune never left.", next = "BACK", reply = "Then where is she, small thing? The one has waited, and the moon has not come down.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Well, she isn't using it.", next = "BACK", reply = "Exactly, small thing, and the one is a good tenant. The one keeps the house very clean.", fx = { affinity = 1, align = { light = -1 }, trait = { witty = 1 } } },
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
    waterlords = { { id = "tp_waterlords", text = "The water lord on his rock thinks he is greater than the one, because he is made of the sea. The one is a god of the sea, and the water lord is merely wet." } },
    onyxia = { { id = "tp_onyxia", text = "The one hears of a black dragon in the swamps to the south, and the one is not afraid of dragons. The one would like to see a dragon swim, which the one thinks it would do badly." } },
    queen_azshara = { { id = "tp_queen_azshara", text = "The naga sing of their queen beneath the waves, and they do not sing of the one, which the one finds very rude. The one will be remembered longer than her." } },
    highborne = { { id = "tp_highborne", text = "The small elves who built this temple are dead, and the one lives in it now. This is how gods and tenants work, small thing." } },
    _none = { { id = "tp_none", text = "The one does not concern itself with the doings of the dry land." } },
  },
}
