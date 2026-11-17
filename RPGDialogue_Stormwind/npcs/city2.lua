-- More of Stormwind: the Cathedral's paladin trainers, the Dwarven District's master smith,
-- the Royal Library, and the cheesemonger who isn't only a cheesemonger.
-- Voices: bibles/city2.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Lord Grayson Shadowbreaker: a lord of the Silver Hand; demanding, methodical.
P:NPC {
  key = "grayson_sb", id = TODO_NPC("Lord Grayson Shadowbreaker"), name = "Lord Grayson Shadowbreaker", title = "Paladin Trainer",
  bible = "bibles/city2.md", role = "trainer", tier = "major",
  communities = { "stormwind" }, temper = { "proud" }, values = { "pious", "lawful", "stern" },
  spiritSensitive = true,
  notices = { "kit", "readiness" },
  impression = {
    first = "Lord Grayson Shadowbreaker of the Silver Hand is not easily satisfied, and he told me so himself. He seems to judge a person first by how they keep their gear.",
    third = "{name} met Lord Grayson Shadowbreaker of the Silver Hand, the Cathedral's exacting paladin trainer.",
  },

  greetings = {
    { id = "g_paladin", when = { class = "PALADIN" }, text = "The Light's protection on you today. Now, what have you learned since I saw you last?" },
    { id = "g_other", when = { ["not"] = { class = "PALADIN" } }, text = "The Light's protection on you. You'll find no lessons for your path here." },
    { id = "g_veteran", when = { class = "PALADIN", minLevel = 50 }, text = "You've come far. Far enough that we should speak about what comes next." },
  },

  notice = {
    { id = "n_kit", cat = "kit", place = "before", when = { class = "PALADIN", durability = { max = 0.3 } },
      text = "Your harness is neglected. A paladin who can't care for their own gear will not care for a charger. Remember that; you'll need it someday." },
    { id = "n_ready", cat = "readiness", when = { class = "PALADIN", minLevel = 40 },
      text = "You carry yourself like someone who's been tested, and that's good. The tests don't end; they only grow quieter, and harder." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Trust is earned by deeds and kept by discipline. Your people stood with us in the Second War, and that counts for more than what you whisper to." } },
      choices = {
        { text = "The Light and I want the same things, Lord Grayson.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Silver Hand doesn't own every virtue. I'll walk my own path.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "We fought beside them in the Second War, and Dalaran's mages bled as we did, so I'll not hear a word against them. But power without discipline led Kel'Thuzad down a dark road, and I'd have every mage remember that the Kirin Tor once trusted him too." },
      },
      choices = {
        { text = "Then I'll keep my discipline, my lord.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Discipline didn't save Lordaeron, my lord.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, my lord.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The Silver Hand counts its allies by their deeds, and the kaldorei have done well enough by us so far. I don't pretend to understand your goddess, but I understand a healer who stands in the line, and I don't need to understand more than that." } },
      choices = {
        { text = "I'll stand in your line, my lord, whenever you need me.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I fight for the forests, my lord, not for anyone's line.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The Silver Hand looks at what a person does, not the alleys they do it in, though I've seen more of the second than I'd like. Uther worked with men of your trade during the war, and he never once pretended to enjoy it." } },
      choices = {
        { text = "Then I'll give you no reason to doubt me, my lord.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The war was won with knives as much as hammers, my lord.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "There is a place for every soul who turns back, and I have seen a few do it, though not many and never easily. Until you do, I'll speak to you civilly, and I'll keep my hammer within reach." } },
      choices = {
        { text = "Perhaps one day, my lord, though it won't come easy.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I've no intention of turning back, my lord.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "We need scouts, and a hunter makes the best scout there is. Before the Second War, half of Uther's victories began with a ranger's report from the forests of Lordaeron, and I've never forgotten it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} of yours stands like a well-trained charger. You've cared for it properly, and I respect that in anyone." },
      },
      choices = {
        { text = "Then I'll scout for the Silver Hand with pride.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I scout for myself. The Hand can pay like everyone else.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Grayson Shadowbreaker, of the Silver Hand. I train the paladins who pass through this Cathedral, and I am not easily satisfied." },
        { id = "h_young", when = { class = "PALADIN", maxLevel = 20 },
          text = "Rall's student, are you? He'll teach you compassion and I'll teach you discipline, and you'll find you need both, usually on the same day." },
        { id = "h_charger", when = { class = "PALADIN", minLevel = 55 },
          text = "A charger isn't a horse with better armor but a bond with something beyond this world. The barding, the spirit and the rider must each be worthy." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Your people have no paladins, I'm told. No matter. The Cathedral's doors are as open to you as to anyone." },
        { id = "h_statuette", tags = { "news" }, when = { questActive = TODO_QUEST("A Friend of the Family") },
          text = "The Highlord wrote that you'd be bringing King Terenas's likeness, so hand it here, gently. The Light has settled in it like dust in an old chapel." },
        { id = "h_orinelle", when = { questActive = TODO_QUEST("The Shamed Lieutenant") },
          text = "Southshore. Lieutenant Orinelle. Go and hear what he has to say for himself, and judge him only after." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "The Cathedral's healers patch up my paladins more often than either of us admits. Consider yourself thanked on their behalf." },
        { id = "h_brandur", when = { race = "Dwarf", class = "PALADIN" },
          text = "Brandur Ironhammer's student. He sends me his best when Ironforge's halls have nothing left to teach them. Let's find out if he was right." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in the Cathedral's training hall. I'll assume you came in by the door, and I'll ask you to leave by it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You've brought the stink of the fel into this hall, and I'd be a fool not to notice. Say what you came to say." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You serve the kingdom from the treeline, and I'll not pretend the Silver Hand always remembers to thank you for it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in the Cathedral's training hall. I'll judge you as I judge anyone, by how you keep your gear, though I'm told yours changes when you do." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. You'll find nothing to learn here but discipline, and I'd wager the Quarter teaches little of that." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Keep your gear well and I'll judge you fairly. The Silver Hand fought the orcs and all their dark arts in the Second War, so forgive me if I look twice." },
      },
      again = {
        { id = "h_again", text = "What else? Speak plainly, and I'll answer the same way." },
        { id = "h_again2", text = "Go on. The Light is patient, though I am somewhat less so." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "What does the Silver Hand stand for now?", next = "hand" },
        { text = "What is a paladin's charger?", next = "charger" },
        { text = "Where is a paladin needed most?", next = "needed" },
        { text = "King Terenas's statuette seems an odd thing to keep here.", next = "terenas",
          when = { any = { { questActive = TODO_QUEST("A Friend of the Family") }, { questDone = TODO_QUEST("A Friend of the Family") } } } },
        { text = "Priests and paladins must serve the same Light.", next = "priest", when = { class = "PRIEST" } },
        { text = "I'm ready to practise whatever you set me, my lord.", next = "practise", when = { class = "PALADIN" } },
        { text = "The Light seems a weapon in your hands, my lord.", next = "weapon", when = { class = "PALADIN" } },
        { text = "Why does a dwarf need a human's Silver Hand?", next = "dwarf", when = { race = "Dwarf", class = "PALADIN" } },
        { text = "What does a paladin have that a warrior doesn't?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "The other trainers here seem a mixed lot.", next = "others" },
        { text = "Do the Silver Hand look down on rogues, my lord?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does the Silver Hand need hunters, Lord Shadowbreaker?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is there no place in the Light for a warlock, my lord?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the Silver Hand count druids among its allies, my lord?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does the Silver Hand respect the mages of Dalaran, my lord?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can the Silver Hand trust a dwarf who speaks to spirits?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "May the Light protect you too.", next = "END", fx = { affinity = 1 } },
      },
    },

    hand = {
      big = true,
      lines = { { id = "hd_default", key = true, text = "What it always did, with fewer of us to stand for it. Lordaeron took our best. The rest of us hold the line they left." } },
      choices = {
        { text = "Then I'll help hold it.", next = "BACK", fx = { affinity = 2, align = { light = 1, order = 1 } } },
        { text = "The line's not my burden, and I'll find my own fight.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Some say the Hand died with Uther.", next = "uther", fx = { trait = { skeptical = 1 } } },
        { text = "What does the Hand swear?", next = "hand_oath" },
      },
    },
    uther = {
      lines = { { id = "u_default", text = "Some say a great many things. The Hand is the people who keep its oaths. Count us, and decide for yourself." } },
      choices = {
        { text = "How many of you are left?", next = "uther_count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    uther_count = {
      lines = { { id = "uc_default", text = "Fewer than the oaths need, but enough that the oaths aren't empty. I count them every morning, and it doesn't take long." } },
      choices = {
        { text = "Count me, someday.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll keep my own oaths, not the Hand's.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hand_oath = {
      lines = { { id = "ho_default", text = "By blood and honour we serve. It's cut into the stone under Turalyon's statue in the valley. The rest of the oath is longer, and harder to keep." } },
      choices = {
        { text = "One part of it must be harder than the rest.", next = "hand_hardest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hand_hardest = {
      lines = { { id = "hh_default", text = "Mercy, to the ones who haven't earned it. Anyone can be brave. Ask the Scarlet Crusade; they're very brave." } },
      choices = {
        { text = "That's a hard word for them.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
        { text = "Mercy can get people killed.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Mercy is worth the risk, even for them.", next = "BACK", fx = { align = { light = 1 } } },
      },
    },

    charger = {
      lines = { { id = "ch_default", text = "Not bought, not bred. It answers a paladin who has proven worthy, and it must wear barding fit for the spirit realm as well as the road." } },
      choices = {
        { text = "Who makes such barding?", next = "charger_elmore" },
        { text = "I'm ready to begin.", next = "trials", when = { class = "PALADIN", minLevel = 60 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    charger_elmore = {
      lines = { { id = "ce_default", text = "Grimand Elmore, in the Dwarven District. He made mine years ago and it's held, and he'll remind you of that, and of his price." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trials = {
      big = true,
      lines = { { id = "tr_default", text = "Then begin with sacrifice. High Priest Rohan in Ironforge keeps an exorcism censer you'll need. Pay him well for it; his coin feeds Ironforge's poorest." } },
      choices = {
        { text = "The cost doesn't matter.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { generous = 1 } } },
        { text = "I'll pay what it's worth and not a copper more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    needed = {
      lines = { { id = "ne_default", text = "Where the dead walk. Commander Ashlam Valorfist holds Chillwind Point at the edge of the Western Plaguelands. When you're ready, he'll ask for you." } },
      choices = {
        { text = "And before I'm ready?", next = "needed_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    needed_now = {
      lines = { { id = "nn_default", text = "Then wherever you stand. Duskwood has its dead, Westfall its thieves, Redridge its orcs. The Light was never kept for the Plaguelands alone." } },
      choices = {
        { text = "Then I'll start where I stand.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go where I'm needed, not where I'm told.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    terenas = {
      lines = { { id = "te_default", text = "Terenas would have hated it. He never sat for a likeness if he could help it. That this one came through Lordaeron's fall is reason enough to keep it where people pray." } },
      choices = {
        { text = "I was there when Lordaeron fell.", next = "terenas_north", when = { origin = "human_lordaeron_refugee" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    terenas_north = {
      lines = { { id = "tn_default", text = "Then light a candle by it when you pass. He was your king before he was a statuette. The Light remembers that, even if the court forgets." } },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Terenas raised the son who killed him, so I'll save my candles.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },

    priest = {
      lines = { { id = "pr_default", text = "One Light. You carry it to the wounded after the fighting. We carry it into the fight and hope to walk out. Neither of us chose the easy half." } },
      choices = {
        { text = "Which half is harder?", next = "priest_harder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_harder = {
      lines = { { id = "ph_default", text = "Ask me before a battle and I'll say mine. Ask me after one and I'll say yours. Come and find me after one; I'd like to be honest." } },
      choices = { { text = "I'll find you.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } } },
    },
    practise = {
      lines = {
        { id = "practise_l", text = "Your seals, until you can change them without looking, and your judgement, until you can deliver it without enjoying it. Most young paladins have the first by spring and never get the second." },
        { id = "practise_old", when = { minLevel = 40 },
          text = "Your auras. You've learned to fight; now learn to stand among others so that they fight better for your being there. That's the half of the craft nobody notices until it's missing." },
      },
      choices = {
        { text = "Why shouldn't I enjoy it?", next = "practise_enjoy" },
        { text = "I'll practise until it's right.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    practise_enjoy = {
      lines = { { id = "practise_enjoy_l", text = "Because the Scarlet Crusade enjoys it, and look at them. Judge as a surgeon cuts, and wash your hands after." } },
      choices = { { text = "Something else, my lord.", next = "BACK", fx = { learn = { "scarlet_crusade" } } } },
    },
    weapon = {
      big = true,
      lines = { { id = "weapon_l", text = "It's whatever you make of it, which is exactly the danger. Uther used it as a shield more often than a hammer, and the ones who forget that are now burning villages in Tirisfal." } },
      choices = {
        { text = "Then I'll carry it as a shield.", next = "BACK", fx = { affinity = 1, align = { light = 2 } } },
        { text = "The undead don't need shielding. They need breaking.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Someone here must teach the other way.", next = "weapon_who" },
      },
    },
    weapon_who = {
      lines = { { id = "weapon_who_l", text = "Brother Crowley, downstairs, if you listen long enough, though he'd call it zeal. I let him recruit because the Archbishop asks me to, not because I agree." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dwarf_l", text = "You don't, strictly. Ironforge has its own priests and its own fire. But Uther took dwarves into the Hand from the start, and Brandur sends you here so you'll know you belong to something wider than a mountain." } },
      choices = {
        { text = "I'm glad of it, my lord.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "My oath is to Ironforge first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Did you know Uther?", next = "dwarf_uther" },
      },
    },
    dwarf_uther = {
      lines = { { id = "dwarf_uther_l", text = "I knelt in the same chapel he did, once, and he looked straight through me to the door; he was waiting for someone more important. I've never minded, because I've spent the years since trying to be worth a second look." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    warrior = {
      lines = { { id = "warrior_l", text = "Nothing a good warrior can't match with steel, and one thing he can't: when you fall, the Light can lift you, and when he falls, he needs one of us. Don't let my paladins tell you they're better than you, because they're not; they're only harder to kill." } },
      choices = {
        { text = "Then I'll stay a warrior.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Perhaps I was born to the wrong path.", next = "BACK", fx = { trait = { pious = 1 } } },
      },
    },
    others = {
      lines = {
        { id = "others_l", text = "Arthur is a better man than I am and a worse teacher, the priests upstairs are kinder than either of us, and the mages in the Quarter think we're blunt instruments, which some days we are. As for the warlocks under the Slaughtered Lamb, the less I hear of them, the better." },
        { id = "others_lamb", when = { class = { "PALADIN", "PRIEST" } },
          text = "Arthur is a better man than I am, Laurena is wiser, and the mages in the Quarter think we're blunt instruments. As for whatever's taught under the Slaughtered Lamb, I've asked the Archbishop not to tell me." },
      },
      choices = {
        { text = "And the warlocks under the Lamb?", next = "others_lamb2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_lamb2 = {
      lines = { { id = "others_lamb2_l", text = "The crown tolerates them and SI:7 watches them, so I'm spared the choice. If one ever comes to me asking how to turn back, I'll answer, and I'll pray I'm the right man to ask." } },
      choices = {
        { text = "They should be driven out.", next = "BACK", fx = { align = { light = 1, order = 1 } } },
        { text = "The kingdom needs every weapon it has.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    silver_hand = {
      { id = "tp_silver_hand", text = "The Silver Hand was the finest order of knights the world has seen, and Uther made it so. It's scattered now, but I keep its oath in Stormwind, and I'll not let its standards slip while I live." },
      { id = "tp_silver_hand2", when = { class = "PALADIN" }, text = "You wear the Light as the Silver Hand wore it, so mind how you keep your armour and your word. Uther judged a knight by both, and so do I." },
    },
    holy_light = { { id = "tp_holy_light", text = "The Light is a discipline before it's a comfort, and a paladin who forgets that is only a man with a hammer. Keep your gear clean and your prayers honest, and the rest will follow." } },
    arthas = { { id = "tp_arthas", text = "Arthas Menethil was a paladin of the Silver Hand, and he turned his hammer on his own people. I've never understood how a man trained by Uther could fall so far, and I've stopped trying." } },
    stratholme = { { id = "tp_stratholme", text = "Arthas purged Stratholme and called it mercy, and Uther left him for it. The order broke that day, though it took a while for the pieces to stop falling." } },
    scourge = { { id = "tp_scourge", text = "The Scourge took Lordaeron, and with it most of the Silver Hand, and they raised some of our brothers to fight against us. I'd not wish that fate on anyone, and I'd not hesitate to end it for them." } },
    argent_dawn = { { id = "tp_argent_dawn", text = "The Argent Dawn have taken up the fight against the Scourge in the north, and they do it without the Crusade's fanaticism. I'd count them as allies, and I'd count some of them as brothers." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "The Brotherhood of Northshire trains our young paladins before they come to me, and they come well prepared. They're a sturdy lot, and they don't spoil their students, which I approve of." } },
    knows = {
      { id = "tp_knows", text = "I have served the Silver Hand long enough to have opinions on most things, and patience for very few. Ask about these, and be brief." },
    },
    background = { { id = "tp_bg", text = "A lord of the Silver Hand. People remember the title. The part that matters is the teaching.", next = "hand" } },
    advice = { { id = "tp_ad", text = "Care for your gear as if a life depends on it, because one will, and usually not yours." } },
    tome_of_divinity = { { id = "tp_tome", text = "The Tome is only the first trial, and there are many more. The last ones are not written in any book." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They kept the Hand's zeal and left its mercy in Lordaeron. I pray for them. I would not ride with them." } },
    _none = { { id = "tp_none", text = "That is not my concern. My concern is whether you're ready." } },
  },
}

-- Arthur the Faithful: the Cathedral's east wing; devout.
P:NPC {
  key = "arthur", id = TODO_NPC("Arthur the Faithful"), name = "Arthur the Faithful", title = "Paladin Trainer",
  bible = "bibles/city2.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "steady" }, values = { "pious", "kind" },
  spiritSensitive = true,
  notices = {},
  impression = {
    first = "Arthur the Faithful isn't sure he has earned his name, which is probably why he has. He invites everyone to kneel a moment before they begin, and he means it kindly.",
    third = "{name} met Arthur the Faithful, a devout paladin trainer in the Cathedral's east wing.",
  },

  greetings = {
    { id = "g_paladin", when = { class = "PALADIN" }, text = "{g:Brother|Sister}. Come and kneel a moment before we begin." },
    { id = "g_other", when = { ["not"] = { class = "PALADIN" } }, text = "The Light keep you, friend. The Cathedral has a quiet corner for anyone who needs one." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The same as anyone, I suppose: for courage and mercy and a long road home. I don't think the Light would mind your spirits standing near." } },
      choices = {
        { text = "Then bless me, Arthur. I'll gladly kneel beside you.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Keep your blessing. My spirits look after me well enough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "The Light listens to anyone, friend, though I'll admit it's easier to hear when you're not muttering formulae under your breath. I've prayed beside mages from Dalaran who lost their city's people to the plague, and they prayed as hard as any paladin I've known." },
      },
      choices = {
        { text = "Then I'll kneel a moment, Arthur, and listen.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll trust my study, Arthur. Prayer is for others.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Arthur.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I think it hears every honest prayer, though I'm only Arthur and not the Archbishop, so take that as you like. If your goddess hears them too, then nobody's being left out, and I find that a comfort." } },
      choices = {
        { text = "Every honest prayer is heard. That's comfort enough for me.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My prayers are for Elune alone, Arthur. Your Light needn't listen.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I've never known it refuse anyone who asked honestly, though I've known plenty who were afraid to ask. Faith isn't for the spotless, friend, or I'd never have been given the name." } },
      choices = {
        { text = "Then I'll ask, Arthur, and I'll mean it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll carry what I've done myself, Arthur.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Every night, in the same breath as the paladins, because I don't know which of us needs it more. The Light is wider than Lord Shadowbreaker's patience, and I've always found that a comfort." } },
      choices = {
        { text = "Pray for me, then. I'd be glad of it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Save your prayers, Arthur, because I've chosen my path.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I try to, though it's harder some days than others. The Light doesn't ask us to love the orc with a blade at our throat, but it does ask us not to become something worse than him to survive." } },
      choices = {
        { text = "I'll fight hard, but I won't fight cruel.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Out there, you do whatever it takes to come home.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It teaches that every life has worth, which is a hard thing for a hunter to hear, I know. But I've met hunters who give thanks for each kill, and I think they understand the Light better than many priests." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has the look of a creature that's been loved. That counts for a great deal, I think, with the Light and with anyone else." },
      },
      choices = {
        { text = "I give thanks for every life I take.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Thanks don't feed anyone. A clean shot does.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "We pray for strength, I think, and you pray for understanding, and the Light gives each of us what the other asked for. I've never been sure I've earned my name, but I've learned that the Light rarely waits for anyone to earn anything." } },
      choices = {
        { text = "Grace is given, Arthur, not earned. That's the whole of it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "We earn what we're given, Arthur. Nothing comes for free.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Kneel with me a moment, if you would, because a priest's prayer and a paladin's prayer are the same words said by different hands." },
        { id = "h_default", text = "Arthur. They call me the Faithful, though I've never been sure I earned it, and I keep trying to." },
        { id = "h_grayson", when = { class = "PALADIN" }, text = "Lord Shadowbreaker will test you, Katherine will correct you, and I'll pray with you. Between the three of us, you'll survive." },
        { id = "h_steadier", when = { metBefore = true, class = "PALADIN" }, text = "Each time you kneel here, you kneel a little steadier. I notice it, and the Light notices more." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The Cathedral at night is all candle and echo. I like it best now. The prayers sound less like requests." },
        { id = "h_nobility", tags = { "news" }, when = { class = "PALADIN", minLevel = 40 },
          text = "Your faith has grown with you, and Duthorian Rall has more to teach. I think you're ready, so go to him humbly, because pride has undone more paladins than any blade." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You keep to the edge of the candlelight, friend. Come in a little closer, because nobody here will ask what you've done." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "The Light keep you, friend, and I do mean you, even with what walks beside you." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. I see the scars on your shield, and I'll pray for whoever gave them to you, and for you too." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I admire your patience, friend; I've never managed to sit still long enough for anything to walk up to me." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Come in, druid, and kneel a moment if you like, though I suspect you'd rather sit on grass than stone. The Light won't mind which you choose." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. Sit a moment if you like; the Light doesn't ask what you studied, only whether you'll listen." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Kneel a moment, if you like, whatever you pray to. A shaman is still welcome here, though I confess I don't quite know how to bless you." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I'm in no hurry at all." },
        { id = "h_again2", text = "Go on. The candles will wait." },
      },
      choices = {
        { text = "You've served here a long while, by the look of you.", next = "served" },
        { text = "They call you the Faithful, I hear.", next = "name" },
        { text = "Train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "Will you pray with me?", next = "pray", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I'd welcome your advice on my practice, Arthur.", next = "practise", when = { class = "PALADIN" } },
        { text = "Can the Light forgive anything, Arthur?", next = "forgive", when = { class = "PALADIN" } },
        { text = "I took the oath in Ironforge, Arthur.", next = "dwarf", when = { race = "Dwarf", class = "PALADIN" } },
        { text = "Lord Shadowbreaker seems a hard man to please.", next = "grayson" },
        { text = "Would the Light forgive the things I've done, Arthur?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you pray for your enemies, Arthur?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does the Light teach anything about the hunt, Arthur?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you pray for warlocks, Arthur?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do paladins pray differently from priests, Arthur?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you think the Light hears a prayer said to the moon, Arthur?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would the Light listen to a mage, Arthur?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How would you bless a shaman, Arthur?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you.", next = "END" },
      },
    },
    served = {
      lines = {
        { id = "s_rubble", text = "Since before the city was rebuilt; I knelt on rubble on this very spot once. Now there's marble, and I'm not certain the prayers are any better for it." },
      },
      choices = {
        { text = "Maybe they're just as good.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Marble or rubble, prayers are only words.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Someone must have worked hard to rebuild all this.", next = "served_masons" },
      },
    },
    served_masons = {
      lines = { { id = "sm_default", text = "The Stonemasons' Guild. I prayed beside them some mornings while they worked. I pray for them still, wherever they've gone, and whatever they've become.",
        fx = { learn = { "defias" } } } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { defias = "masons_wronged" } } } },
    },
    name = {
      lines = { { id = "nm_default", text = "Someone said it once and it stuck, and I've spent the years since trying to deserve it. I think that's most of what faith is: trying to deserve a name." } },
      choices = { { text = "You do.", next = "BACK", fx = { affinity = 2 } }, { text = "Something else.", next = "BACK" } },
    },
    pray = {
      lines = { { id = "pr_default", text = "Kneel, then, and no words are needed. The Light hears silence as well as it hears speeches, and better, some days." } },
      choices = {
        { text = "Amen. Something else.", next = "BACK", fx = { align = { light = 1 }, trait = { pious = 1 } } },
        { text = "I'll kneel, but I doubt anyone's listening.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    practise = {
      lines = {
        { id = "practise_l", text = "Lord Shadowbreaker will tell you seals and judgement, and he's right. I'll tell you to practise kneeling, because the paladin who forgets how to kneel soon forgets why he stands." },
      },
      choices = {
        { text = "Kneeling won't stop an axe.", next = "practise_axe" },
        { text = "I'll kneel every morning.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
      },
    },
    practise_axe = {
      lines = { { id = "practise_axe_l", text = "No, but it decides whose axe you'll stop, and why, and whether you can live with it after. That's most of what a paladin is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forgive = {
      big = true,
      lines = { { id = "forgive_l", text = "I believe it can, and I've seen men who didn't deserve it receive it anyway. Whether a paladin should be the one to offer it is a harder question, and I've never answered it to my own satisfaction." } },
      choices = {
        { text = "We should offer mercy first, always.", next = "BACK", fx = { affinity = 1, align = { light = 2 } } },
        { text = "Some deeds put a man beyond mercy.", next = "BACK", fx = { align = { light = -1, order = 1 } } },
        { text = "Who didn't deserve it?", next = "forgive_who" },
      },
    },
    forgive_who = {
      lines = { { id = "forgive_who_l", text = "An orc in the internment camps, once, who asked me to pray with him. I did, and the guards laughed, and I've never been sure which of us the Light was listening to." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    dwarf = {
      lines = {
        { id = "dwarf_l", text = "Then you've knelt on harder stone than this marble. Ironforge kept the Hand's oath when Lordaeron couldn't, and I've always meant to go and thank Brandur for that myself." },
        { id = "dwarf_hand", when = { origin = "dwarf_silver_hand" },
          text = "And you'll have heard them say the Order's broken. Not in Ironforge, and not in this Cathedral either; kneel with me, and we'll prove it twice." },
      },
      choices = { { text = "I'd be glad to.", next = "BACK", fx = { affinity = 2 } } },
    },
    grayson = {
      lines = { { id = "grayson_l", text = "He's harder on himself than on any of you, and that's saying a great deal. He tests the young ones until they hate him, and then he prays for them by name, every night." } },
      choices = {
        { text = "How do you know?", next = "grayson_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grayson_know = {
      lines = { { id = "grayson_know_l", text = "Because I kneel two pews behind him, and he prays aloud when he thinks the hall is empty. Don't tell him I told you." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    holy_light = {
      { id = "tp_holy_light", text = "The Light asks nothing more than an honest heart and an open hand, and I've tried to give it both. I'm not sure I've earned my name, but I try to deserve it every day." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "Kneel with me a moment before we begin, if you would, because the Light listens better when we're quiet. Then rise, and we'll see what it's asked of you today." },
    },
    silver_hand = { { id = "tp_silver_hand", text = "I never knew Uther, but I've read every word he wrote, and I keep his prayer book by my bed. The Silver Hand's gone, and still it teaches me something every night." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "The Brotherhood at Northshire took me in when I was a boy with no home, and I owe them everything I am. I go back every year to help with the harvest, and they still make me work." } },
    scourge = { { id = "tp_scourge", text = "The Scourge took Lordaeron, and I pray every night for the souls they hold. I'd go north and fight them myself, if Grayson would let me, though I think he's right that I'm needed here." } },
    background = { { id = "tp_bg", text = "A paladin who prays more than he fights. Someone has to stay by the altar. It turned out to be me.", next = "served" } },
    advice = { { id = "tp_ad", text = "Kneel before you fight, not after. After, you'll be too tired to mean it." } },
    _none = { { id = "tp_none", text = "I don't know. I'll pray on it, if that helps." } },
  },
}

-- Grimand Elmore: the Dwarven District's master weaponsmith and barding-maker.
P:NPC {
  key = "elmore", id = TODO_NPC("Grimand Elmore"), name = "Grimand Elmore",
  bible = "bibles/city2.md", role = "blacksmith", tier = "quest",
  communities = { "stormwind" }, temper = { "proud" }, values = { "honest", "ambitious" },
  notices = { "craft", "kit" },
  impression = {
    first = "Grimand Elmore boasts about his work as if he were stating plain fact, and from what I saw, he may be. His praise is so rare that it nearly sounds like an insult.",
    third = "{name} met Grimand Elmore, master weaponsmith of the Dwarven District, who makes barding for paladins' chargers.",
  },

  greetings = {
    { id = "g_anvil", text = "Finest craftsmanship on the continent, right here. It isnae cheap, but it's worth every coin." },
    { id = "g_task", when = { questActive = TODO_QUEST("Elmore's Task") }, text = "Argus sent ye? Then let's see what ye've brought me." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Smith's hands! Let me see the burns. Aye, ye've been at it, so keep at it, an' in twenty years ye might be adequate." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.2 } },
      text = "Who made that armor? No, dinnae tell me, because whoever it was, it's given up on ye." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'll forge you a fine dagger with a good balance, and you can do whatever you like with it after it leaves my bench. What I won't do is hammer fel-touched iron, because I tried it once, when I was young and stupid, and the metal sang at me for a week." },
      },
      choices = {
        { text = "A plain dagger, then, Elmore. I'll keep the fel away.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fel iron sings for a reason, Elmore. You should listen.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Elmore.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I'd forge one if ye brought me the wood, an' it'd be the finest staff ever shod in iron. Yer people would likely call it a crime against the tree, but I'd call it an improvement." } },
      choices = {
        { text = "Shoe it in iron, Elmore. Good work honours the wood.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leave the wood as it grew. Iron would only spoil it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Aye, an' better ones than ye'll find anywhere in the Trade District, though I'd rather make a paladin's hammer than a knife for a back. A hammer's honest about what it's for." } },
      choices = {
        { text = "I'd rather look a man in the eye than stab him.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A knife in the back ends a fight quicker, Elmore.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Once, wi' a mage o' the Quarter standin' over the anvil chantin' at it, an' the blade came out hummin' like a hive. I sold it tae a lord who never drew it, which is the sad end o' most fine work." } },
      choices = {
        { text = "Then it should have gone to someone who'd earned it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Coin is coin, Elmore, and the lord paid the best price.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Balance first, temper second and the edge last, because a well-balanced blade with a dull edge will still save your life. Furen spent his whole first year learning that, and he's still learning it, as I remind him daily." } },
      choices = {
        { text = "I'll take good balance over a flashy edge any day.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Give me the sharpest blade and I'll worry about balance later.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A spear, an axe or a good skinning knife, certainly, and I'll put my skinning knives against any in the kingdom. The bowyers can have their yew, and the dwarves their rifles; I'll stick to things that are hammered." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Is that {pet} of yours trained to stay out of a forge? Good, because I've had one dog singe its tail on the slack tub and howl for an hour." },
      },
      choices = {
        { text = "A well-made tool deserves an honest hand.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A tool is a tool. I'll use whatever's cheapest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I leave the blessing to the Cathedral and the forging to myself, and I've noticed the Cathedral asks for my work, not the other way round. A good blade doesn't need a prayer, though I'll admit a bad wielder could use one." } },
      choices = {
        { text = "A blade in holy service is more than steel, Elmore.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You're right. Steel's honest work and needs no blessing.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Lightforge iron, worked the old way, and the patience to fit it to the horse, not the horse to it. Lord Shadowbreaker's charger wears my plate, and that's all the reputation I need." } },
      choices = {
        { text = "My charger carries me into danger. It deserves your best work.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A horse is a horse, Elmore. I'll take the cheaper plate.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll not need my blades, I expect, but if you ever find yourself in a fight, a mace of mine will do more than a prayer." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Look at your charger's barding next time you're in the stables, and if it isn't mine, come and see me about it." },
        { id = "h_default", key = true, text = "Elmore. I make weapons, and I make barding for paladins' chargers, and nobody in Azeroth makes it better. Ask Lord Shadowbreaker whose work his mount wears." },
        { id = "h_argus", when = { heardLine = "argus.s_default" },
          text = "Argus told ye never tae let the apprentice near the quench? Good lad. My apprentice Furen's still not allowed near mine." },
        { id = "h_paladin", when = { class = "PALADIN", minLevel = 50 },
          text = "Ye'll be wantin' barding someday, if Shadowbreaker thinks ye're worth a charger, so save yer coin now, an' save a lot of it." },
        { id = "h_fair", when = { metBefore = true }, text = "Argus out in Goldshire does fair work, for a human. Dinnae tell him I said so. He'll get ideas." },
        { id = "h_task", tags = { "news" }, when = { questActive = TODO_QUEST("Elmore's Task") },
          text = "I've an axe finished for Gringer Stormpike, up at the north tower in Loch Modan. I cannae leave the forge tae carry it. You can." },
        { id = "h_lightforge", tags = { "news" }, when = { questActive = TODO_QUEST("Blessed Arm") },
          text = "Lightforge iron, in my shop? It's been years since I had my hands on any, so tell me the whole tale, an' then I'll make ye something worth it." },
        { id = "h_notes", tags = { "news" }, when = { questActive = TODO_QUEST("Grimand Elmore") },
          text = "Notes, from Furen? He thinks he can teach me? I taught that boy which end o' the hammer tae hold! Give them here." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in my shop. Ye can admire the barding all ye like, but it weighs more than ye do, so dinnae get ideas." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage? Ye'll be wantin' a staff, an' I'll tell ye now I dinnae make sticks, so come back when ye want a proper weapon." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Let me see that blade. Hm, someone's sharpened it with a cobblestone, and I'll thank you not to tell me it was you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, in a blacksmith's shop. You'll be wanting arrowheads, I suppose, or an axe for the camp, because no smith alive makes a good bow." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in my shop, an' ye've no use for half o' what I make, since ye grow yer own claws. Dinnae let that stop ye admirin' it, mind." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I don't forge for demons, but I'll sell you a dagger, and that's as far as my anvil goes." },
      },
      again = {
        { id = "h_again", text = "What else? The forge doesnae wait." },
        { id = "h_again2", text = "Aye? Out with it." },
      },
      choices = {
        { text = "Let me see your work.", next = "BUSINESS" },
        { text = "Do you take apprentices, Elmore?", next = "furen" },
        { text = "Barding must be for horses, then.", next = "barding" },
        { text = "Your work looks good enough to find plenty of buyers.", next = "buyers" },
        { text = "I'd have expected to find you in Ironforge.", next = "home", when = { race = "Dwarf" } },
        { text = "Lightforge iron must be something special.", next = "lightforge", when = { questActive = TODO_QUEST("Blessed Arm") } },
        { text = "Your forge fire has a spirit in it, Elmore. It likes you.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Do you ever forge daggers, Elmore?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Have you ever forged anything enchanted, Elmore?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What makes a weapon worth trusting, Elmore?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can a good smith make a hunter's weapon, Elmore?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever bless your weapons before you sell them, Elmore?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What makes your barding better than any other, Elmore?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would a dwarven smith ever forge a druid's staff, Elmore?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you forge something for a warlock, Elmore?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Another time.", next = "END" },
      },
    },
    furen = {
      lines = { { id = "f_default", text = "Best student I've ever had, an' if ye tell him I said so I'll deny it on my anvil. He's slow, an' slow's good, for fast smiths make thin plate." } },
      choices = {
        { text = "Are you hard on him?", next = "furen_hard" },
        { text = "He sent you his notes.", next = "furen_notes", when = { questDone = TODO_QUEST("Grimand Elmore") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    furen_hard = {
      lines = { { id = "fh_default", text = "Hard? I melt his best work an' tell him tae do it again. That's no' hard. That's how I was taught, an' look how I turned out." } },
      choices = { { text = "Charming.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    furen_notes = {
      lines = { { id = "fn_default", text = "Aye, outrageous. But there was a trick in there I'd never thought of, an' I've tried it twice already, so dinnae tell him that either." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2 } } },
    },
    barding = {
      lines = { { id = "b_default", text = "For chargers. A paladin's mount is no' a horse, an' its barding cannae be plain steel; Shadowbreaker's own charger wears mine, made years back, an' it's held." } },
      choices = {
        { text = "What does it cost?", next = "barding_price" },
        { text = "Something else.", next = "BACK" },
      },
    },
    barding_price = {
      lines = { { id = "bp_default", text = "More than ye've got. An' it's no' just coin; the makings will drag ye across half of Azeroth. Come back when Shadowbreaker sends ye." } },
      choices = { { text = "I'll save.", next = "BACK", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "bu_default", text = "Paladins, lords, the odd mountaineer with taste. The Stormpikes send orders all the way down from Loch Modan. A clan with taste, an' the coin tae back it." } },
      choices = {
        { text = "I expect the humans buy from you too.", next = "buyers_humans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_humans = {
      lines = { { id = "bh_default", text = "Humans buy swords tae hang on walls. I sell them those. Then I sell the real ones tae their guards." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    home = {
      lines = { { id = "ho_default", text = "Ironforge has a hundred good smiths. Stormwind has me an' Furen. A city that rebuilt itself from rubble needs good steel more than one that never fell." } },
      choices = { { text = "Ha. Can't argue with a dwarf about steel.", next = "BACK", fx = { affinity = 1 } } },
    },
    lightforge = {
      lines = { { id = "lf_default", text = "Blessed iron from the old forges. It takes the Light the way good steel takes an edge. Whatever ye're hunting, it willnae like this." } },
      choices = {
        { text = "A necromancer in Duskwood. Morbent Fel.", next = "lightforge_fel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lightforge_fel = {
      lines = { { id = "lff_default", text = "Then take the blade tae Sven, at his camp in western Duskwood, when it's done. An' come back after an' tell me how it sang." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    shaman = {
      lines = { { id = "shaman_l", text = "Does it, now? My grandda used to say the same, an' everyone thought he'd had too much Thunderbrew. If it likes me, tell it to stop spittin' on my good boots." } },
      choices = {
        { text = "It says you should clean the grate more.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Treat it with respect, and it will burn true.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
      },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons forge weapons that would make a lesser smith weep, and I've studied the blades that come back from the Steppes. They're good, but mine are better, and I'll say that to any dwarf who asks." } },
    thandol_span = { { id = "tp_thandol_span", text = "The Thandol Span is the finest work of ironmongery in the world, and I've studied every rivet. If the Dark Irons have damaged it, they should be ashamed of themselves, and I'll tell them so." } },
    magni = { { id = "tp_magni", text = "King Magni came to my forge once and admired my work, and I admired his beard. We parted as equals, and I'll not say who admired whom more." } },
    silver_hand = { { id = "tp_silver_hand", text = "I made a hammer for a knight of the Silver Hand once, and he said it rang with the Light. I said it rang with good steel, and we agreed it was both." } },
    background = { { id = "tp_bg", text = "A dwarf smith in a human city. Folk ask why. The answer's in the steel, no' in me." } },
    advice = { { id = "tp_ad", text = "Buy the best blade ye can afford, then save for a better one. Cheap steel's a debt ye pay in blood." } },
    trade = { { id = "tp_tr", text = "Weapons an' barding. Furen does the shields an' mail. I do the parts that need a master.", next = "furen" } },
    _none = { { id = "tp_none", text = "If it doesnae ring when ye strike it, I've no interest." } },
  },
}

-- Milton Sheaf: the Royal Library.
P:NPC {
  key = "milton", id = TODO_NPC("Milton Sheaf"), name = "Milton Sheaf", title = "Librarian",
  bible = "bibles/city2.md", role = "scholar", tier = "quest",
  communities = { "stormwind" }, temper = { "cowardly" }, values = { "curious" },
  notices = { "lore" },
  impression = {
    first = "In the Royal Library one whispers, because Milton Sheaf believes the books are sleeping. He forgave a book seventy years overdue for the sake of a pressed flower, which tells you everything.",
    third = "{name} met Milton Sheaf, keeper of Stormwind's Royal Library, who collects books and the people who fetch them.",
  },

  greetings = {
    { id = "g_hush", text = "Shh, whisper, please, because the books are sleeping." },
    { id = "g_book", when = { questActive = TODO_QUEST("An Old History Book") }, text = "Have you found it, the old history? Gently, gently, because it's older than both of us." },
  },

  notice = {
    { id = "n_reader", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "You've read The Seven Kingdoms, and properly, I can tell, not just the pictures! Come back any time, and bring clean hands." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "A few, mostly accounts of the Horde from the wars, and not kindly ones. Nothing written by a dwarf shaman, which I suppose makes you a book still unwritten." } },
      choices = {
        { text = "Then I'll keep careful notes for your shelves, Milton.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Books didn't teach me this. Some things should stay unwritten.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "It did, once, in a locked case at the back, until the Archbishop's clerks came one winter and took them away for safekeeping. I miss them, I'll confess, because a library that only keeps the books it approves of is half a library, but I'd not let you near them now even if I had them." },
      },
      choices = {
        { text = "The clerks were right to take them, Milton.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Half a library is no library at all, Milton.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Milton.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "One or two, and the rest I keep for their bindings. If you ever wrote down what you know of Darnassus, I'd shelve it beside the kings' chronicles and whisper to it every evening." } },
      choices = {
        { text = "I'll write it down, Milton, so it's kept properly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some things my people never write down, Milton, and neither will I.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Only once, a man who took a book on Alterac's noble houses and nothing else, which I found far more alarming than if he'd taken the silver. Know your enemy, as I always say, and he clearly did." } },
      choices = {
        { text = "Then SI:7 should hear about it, Milton.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let him read. A book should never be locked away.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A great many, from the Arathi battle-songs to Lothar's own field notes, which are mostly complaints about supply wagons. Every soldier should read them, though in my experience very few ever do." } },
      choices = {
        { text = "A warrior should read. Knowledge wins as many battles as steel.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I learn by fighting. Books are for scholars.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Field journals, mostly, from ranger posts and old hunting lodges, because nobody records the wildlife of Azeroth like a bored ranger. I've an entire shelf on the beasts of Redridge written by one man who never saw a single gnoll." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That {pet} wouldn't happen to eat paper, would it? I ask because I've lost three manuscripts to the Cathedral's mice already." },
      },
      choices = {
        { text = "I'll bring you any journals I find, for the library's sake.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Journals cost money. I'll bring them if you pay.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A little, and most of it written by people who were never in it. What we have is mostly the sermons Archbishop Faol gave when the order was founded, which are lovely, though rather long." } },
      choices = {
        { text = "Those sermons should be read. The past teaches us how to serve.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A paladin learns from the field, not from old sermons.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin in the library! Quietly, please, the books are sleeping, though I'll gladly wake one about the Silver Hand for you." },
        { id = "h_default", key = true, text = "Milton Sheaf, keeper of the Royal Library. I collect books from all over the kingdom. Mostly I collect people to collect books for me." },
        { id = "h_foe", text = "Know your enemy, they say, but I'd go further and know everything about everyone. It saves so much trouble later." },
        { id = "h_flower", when = { metBefore = true }, text = "Someone returned a book yesterday with a pressed flower in it, seventy years overdue. I've decided to forgive them, because the flower was lovely." },
        { id = "h_kristoff", tags = { "news" }, when = { questActive = TODO_QUEST("Speaking of Fortitude") },
          text = "Brother Kristoff wants a book on metallurgy for a sermon on the spirit? How wonderful. I adore a priest with range." },
        { id = "h_paxton", when = { questActive = TODO_QUEST("Brother Paxton") },
          text = "Brother Paxton has had our Stresses of Iron for months, months! Ask him gently, and then, if you must, ask him less gently." },
        { id = "h_alterac", tags = { "news" }, when = { questActive = TODO_QUEST("Southshore") },
          text = "Loremaster Dibbs knows the way to Alterac's ruins. Whatever survived up there is ours to save, before the ogres light their fires with it." },
        { id = "h_tomes", tags = { "news" }, when = { questRecent = { TODO_QUEST("Return to Milton"), days = 3 } },
          text = "The Tomes of Alterac, on my shelves! I've had to sit down twice. The library thanks you, and the books, I think, thank you most." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Shh, and no, nothing in here is worth stealing, unless you can read, in which case everything is." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in my library. Please don't lean on the shelves, and please don't use that sword to point at anything." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You travel widely, I suppose, which means you may be useful to me. I collect people who collect books, you understand." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Shh, a druid, and welcome. The library holds a few accounts of your people, though most of them were written by humans who'd never met one." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Shh, the books are sleeping. And you'll keep yours closed, if you please, because I can smell brimstone on the bindings." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Shh. A shaman, and in the library. Do your spirits speak loudly? The books are sleeping." },
      },
      again = {
        { id = "h_again", text = "Something else? In a whisper, please." },
        { id = "h_again2", text = "Yes? The books are listening, so do mind your grammar." },
      },
      choices = {
        { text = "Need anything found?", next = "BUSINESS" },
        { text = "You're hoping to find something particular, I'd guess.", next = "wanted" },
        { text = "Some of these books must be better than others.", next = "best" },
        { text = "There's a lord sitting in the reading corner.", next = "lord" },
        { text = "A priest might find something worth reading here.", next = "priest", when = { class = "PRIEST" } },
        { text = "Does the library keep anything from Dalaran?", next = "dalaran", when = { class = "MAGE" } },
        { text = "Have thieves ever robbed the Royal Library?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does the library hold any books on warfare, Milton?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you need books brought from the wilds, Milton?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does the library hold the Silver Hand's history, Milton?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Are any of those books about my people worth reading, Milton?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does the Royal Library keep any books on my arts, Milton?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Are there any books on shamanism here, Milton?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll let you read.", next = "END" },
      },
    },
    wanted = {
      lines = { { id = "w_default", text = "Alterac's libraries. The kingdom fell after the war, and its books went with it into ruins full of ogres. Ogres, I'm told, are not great readers.",
        fx = { learn = { "seven_kingdoms" } } } },
      choices = {
        { text = "How would anyone find them?", next = "wanted_dibbs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wanted_dibbs = {
      lines = { { id = "wd_default", text = "Southshore. Loremaster Dibbs knows the ruins and he knows me, and he'll sigh about both. Go when you're strong enough to argue with an ogre." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    best = {
      lines = { { id = "be_default", text = "The Seven Kingdoms, for anyone starting out. For anyone finishing, nothing beats a book that was stolen and came home again." } },
      choices = {
        { text = "Stolen? From here?", next = "best_stolen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best_stolen = {
      lines = { { id = "bs_default", text = "After the Second War this library kept the Book of Medivh. Alterac's spies took it the very day the Horde's death knights came for it too. I still dust the shelf." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    lord = {
      lines = { { id = "lo_default", text = "Lord Lescovar. He comes to meditate, he says. In a library! In all that time he's never once borrowed so much as a pamphlet." } },
      choices = {
        { text = "That seems strange.", next = "lord_strange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lord_strange = {
      lines = { { id = "ls_default", text = "In a library? It's very nearly a crime, but he's a lord, and lords may sit where they like. I simply shelve more loudly near him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    priest = {
      lines = { { id = "p_default", text = "Shelves of doctrine, and priests hardly read them. The Light isn't in books, they tell me. Then Brother Kristoff comes asking for metallurgy." } },
      choices = {
        { text = "Metallurgy?", next = "priest_iron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest_iron = {
      lines = { { id = "pi_default", text = "The Stresses of Iron, by a dwarven miner, Margulf Blaggon. Kristoff says it's about the spirit, though I suspect it's about iron, and Brother Paxton at Northshire has our copy.",
        fx = { learn = { "northshire_abbey" } } } },
      choices = { { text = "I'll ask Paxton for it.", next = "BACK", fx = { affinity = 2 } }, { text = "Something else.", next = "BACK" } },
    },
    dalaran = {
      lines = { { id = "dalaran_l", text = "A few volumes the Kirin Tor lent us before the city fell, and which, strictly speaking, they've never asked for back. I keep them in the locked case, and I don't lend them, not even to the Sanctum." } },
      choices = {
        { text = "Not even to a mage?", next = "dalaran2" },
        { text = "Knowledge shouldn't be locked away.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Quite right. Some books need a lock.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    dalaran2 = {
      lines = { { id = "dalaran2_l", text = "Especially not to a mage, dear; mages return books singed, or not at all. Read them here, at the table, with clean hands, and I'll watch you turn every page." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    dalaran = { { id = "tp_dalaran", text = "The libraries of Dalaran held books that existed nowhere else in the world, and I pray they survived the Scourge. I've written to the Kirin Tor to ask, and they haven't answered, which is either a very good sign or a very bad one." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor were once the most generous lenders of books in the world, and they'd send them anywhere for the asking. Since the plague, they've closed their doors, and I've lost my favourite correspondents." } },
    second_war = { { id = "tp_second_war", text = "The Royal Library lost a third of its books when the orcs burned Stormwind, and I've spent my life gathering them back. I'm missing a book on the history of Azeroth, and I'll find it someday." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron's royal library was the finest in the Seven Kingdoms, and the Scourge burned it to the ground. I weep for it, softly, so as not to wake the books here." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "The statues in the Valley of Heroes are history made stone, and I'd like to put a little card beneath each one, explaining who they were. The guards say no, but I've not given up." } },
    background = { { id = "tp_bg", text = "My story is shelved under unremarkable, which is exactly where I like it. Ask me about the books instead." } },
    advice = { { id = "tp_ad", text = "Read the old books first. The new ones mostly argue with them." } },
    seven_kingdoms = { { id = "tp_kingdoms", text = "A classic. A bit generous to Alterac, I always felt.", next = "best" } },
    northshire_abbey = { { id = "tp_abbey", text = "A lovely library, for its size. Brother Paxton is a careful copyist. A very, very slow one." } },
    _none = { { id = "tp_none", text = "There'll be a book about it. There's a book about everything. I just haven't found that one yet." } },
  },
}

-- Elling Trias: Trias' Cheese, Trade District. Cheesemaker. Also not.
P:NPC {
  key = "elling", id = TODO_NPC("Elling Trias"), name = "Elling Trias", title = "Cheesemaker",
  bible = "bibles/city2.md", role = "vendor", tier = "quest",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "cunning", "witty" },
  notices = { "watch" },
  impression = {
    first = "Nobody has ever insisted on selling only cheese as firmly as Elling Trias does. He stands behind his counter looking honest with real dedication.",
    third = "{name} met Elling Trias at his Trade District cheese shop, a man very insistent that he is only a cheesemaker.",
  },

  greetings = {
    { id = "g_cheese", text = "Cheese. We sell cheese, and that's all we do here: cheese." },
    { id = "g_diplomat", when = { questActive = TODO_QUEST("The Missing Diplomat") }, text = "Keep your voice down and buy some cheddar. Look natural." },
  },

  notice = {
    { id = "n_watch", cat = "watch", when = { class = "ROGUE" },
      text = "You looked at the cellar door before you looked at the cheese. Everyone who does that ends up working for the same people. Hello, colleague." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If they look closely, they'll find cheese, and only cheese, I promise. Elaine says I protest too much, but a man ought to be thorough." } },
      choices = {
        { text = "An honest shop is the best kind. Keep it that way.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A little mystery never hurt a shopkeeper, Elling.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "All sorts buy my cheese, and I pay very close attention to what they say while they're buying it, because a cheesemaker hears all kinds of things. The folk from the Lamb buy the strongest cheddar I have, and they talk more than they think, so I'm very fond of them in my way." },
      },
      choices = {
        { text = "Then you'll hear only good things from me, Elling.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll talk where nobody's listening, then.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Elling.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Nothing! There's nothing in it but milk and salt and my wife's patience, and you can sniff it all you like, bear or no bear. I'll say that twice if it helps." } },
      choices = {
        { text = "If I smell anything strange, the guards will hear of it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Whatever you sell is your business, Elling.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "More than you'd think, because scholars forget to eat until they're starving, and cheese keeps on a desk. Some of them talk quite freely while they wait for it, too, which is entirely beside the point." } },
      choices = {
        { text = "Their talk is their own business, Elling, so leave it be.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every word a customer drops is worth picking up.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "By the wheel, friend, especially the Barracks men heading out to Redridge. Elaine's dwarven sharp lasts a month in a pack, and I've had a sergeant tell me it saved more lives than his shield did." } },
      choices = {
        { text = "Good food on the march is half of a soldier's courage.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A soldier fights hungry. Cheese is a luxury.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Now and then, when a hunter brings in something Elaine can smoke alongside the cheese. Rabbit from Elwynn goes beautifully with the Alterac Swiss, though I'd not tell my wife I said so." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has been eyeing my counter for some time now. I'll ask it to remember I'm the honest one in the family." },
      },
      choices = {
        { text = "A fair trade, game for cheese, suits me well.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll keep my game and buy my cheese with coin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It's all I'd ever confess to, even in the Cathedral, and I'd thank you to note that I said so with a straight face. Some of us serve the kingdom from behind a counter, and we sleep about as well as you'd expect." } },
      choices = {
        { text = "Confession eases the soul, Elling. The Cathedral's door is always open.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Keep your secrets. Not everything needs confessing.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because nobody believes it once they've seen my wife's stairs, I suppose, and because a man in my trade hears all kinds of things across a counter. I pass a few of them on, to the right people, and I'd rather that's where it ended." } },
      choices = {
        { text = "Then I'll ask no more. Some service must stay quiet.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Secrets rot a city. I'd sooner everything were said openly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I've a cheese my wife calls holy, though I think she means it's very hard and nobody can understand it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I'm a very honest cheesemaker, {class}, and you can tell everyone at the Cathedral I said so." },
        { id = "h_default", key = true, text = "Elling Trias. My wife Elaine makes the cheese, my boy Ben sells it, and I stand here looking honest. It's a family business." },
        { id = "h_diplomat", tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "A diplomat goes missing in the middle of Stormwind, and nobody's surprised. That should worry you more than the diplomat." },
        { id = "h_shaw", when = { heardLine = "shaw.h_default" },
          text = "You've met the Master? Then you know where I stand, but don't say it out loud. The cheese has ears, or rather, the customers do." },
        { id = "h_cheddar", when = { metBefore = true }, text = "The aged cheddar is excellent this week. That is all I have to say about anything." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "We're closing, because cheese needs its rest, and so do I. That is the only reason." },
        { id = "h_lescovar", tags = { "news" }, when = { questActive = TODO_QUEST("Look to an Old Friend") },
          text = "Shaw sent you, to me, again? The man has the nerve of a cat burglar and the manners of one. Start at the beginning and leave nothing out." },
        { id = "h_attack", tags = { "news" }, when = { questActive = TODO_QUEST("The Attack!") },
          text = "Tyrion's in the castle garden with his contraption. Do what he says, when he says it. Then come back here and buy something." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. Please don't chill the cheese, because it's aged at exactly the temperature my wife wants, and she knows." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want something that keeps on the march, and nothing keeps like a good hard cheese, I promise you that." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I suppose you live on what you catch, but even the best hunter wants something besides venison now and then, don't they?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Now, I sell cheese, only cheese, and nothing that ever lived in a forest, so you've no cause to look at me like that." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, buying cheese? Of course. Everyone has to eat, even the folk from the Lamb." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Well, I sell cheese. Only cheese. Honestly cheese. Your spirits are welcome to inspect it, if they like." },
      },
      again = {
        { id = "h_again", text = "Anything else? Cheese-related, ideally." },
        { id = "h_again2", text = "Something more? Lower your voice, though; I'm told it carries." },
      },
      choices = {
        { text = "I'll take some cheese.", next = "BUSINESS" },
        { text = "I'd like whatever you'd recommend.", next = "cheese" },
        { text = "You're not just a cheesemaker, I think.", next = "cover" },
        { text = "Jorgen sent a note.", next = "jorgen", when = { questActive = TODO_QUEST("The Missing Diplomat") } },
        { text = "I work in the dark myself.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'd wager the Mage Quarter buys a good deal of cheese.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do soldiers really buy cheese for the march, Elling?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you ever trade cheese for game, Elling?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is cheesemaking all you do, Elling?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why would a cheesemaker need to say he's honest?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What exactly are you afraid I'll sniff out, Elling?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do warlocks buy your cheese, Elling?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do the spirits make of your cheese, Elling?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just passing.", next = "END" },
      },
    },
    cheese = {
      lines = { { id = "c_default", text = "The house cheddar, aged in our own cellar, or the Darnassian bleu, if you like a cheese with opinions. Elaine makes both, and I recommend both." } },
      choices = {
        { text = "What else is in the cellar?", next = "cheese_cellar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheese_cellar = {
      lines = { { id = "cc_default", text = "Cheese, shelves of it. Why would there be anything else in a cheesemaker's cellar? What an odd question; have some gouda." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    cover = {
      lines = { { id = "co_default", text = "I sell cheese, and people buy it, and sometimes they chat while they do. I've a great many friends who like cheese, and that's all." } },
      choices = {
        { text = "Friends where?", next = "cover_friends" },
        { text = "Of course. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    cover_friends = {
      lines = { { id = "cf_default", text = "Darkshire, Menethil, Theramore, and further still. Cheese travels well if you wrap it properly, and so does friendship." } },
      choices = {
        { text = "Even in the Church?", next = "church", when = { class = "PRIEST" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    church = {
      lines = { { id = "ch_default", text = "The Church eats cheese like everyone else. One or two of its bishops eat a great deal of it. I say no more." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    jorgen = {
      lines = { { id = "j_default", text = "Jorgen. Of course it's Jorgen. Very well: my contacts, your legs, and I save on couriers. Darkshire, the north road, a Night Watchman called Backus." } },
      choices = {
        { text = "I'll need to know what to ask Backus.", next = "jorgen_backus" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jorgen_backus = {
      lines = { { id = "jb_default", text = "Ask him about Defias near Darkshire. Tell him I sent you; he'll be friendlier. He owes me cheese, and he knows it.",
        fx = { learn = { "night_watch", "defias" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "r_default", text = "Then you know the first rule. We don't say so, especially in shops with the door open. Try the cheddar." } },
      choices = { { text = "Lovely cheddar.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } } },
    },
  },

  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's goblins tried to sell me a cheese made from goat's milk and sea salt, and I sent them packing. I sell only cheese, and only good cheese, and only from Stormwind's own dairies." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire sells cheese on sticks, toasted over a fire, and it's an abomination. I've told them so, and they laughed, and I've never been back." } },
    gilneas = { { id = "tp_gilneas", text = "Gilnean cheese was the finest in the north, and it's all behind that wall now. I've a little left in my cellar, and I'll not sell it for any price, only look at it on festival days." } },
    the_stockade = { { id = "tp_the_stockade", text = "The prisoners have taken the Stockade, I'm told, and the guards just stand at the doors. I sell cheese to the guards, and they've never been so hungry, which tells you something." } },
    knows = {
      { id = "tp_knows", text = "A cheese merchant hears a remarkable amount, you know, people will say anything over a good wheel of cheddar. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I'm a cheesemaker's husband who tastes everything first. That's my story, and I'm sticking to it." } },
    advice = { { id = "tp_ad", text = "Never trust a man who doesn't like cheese. He's hiding something worse." } },
    trade = { { id = "tp_tr", text = "Cheese: cheddar, bleu and gouda. That is the whole of my trade, as anyone will tell you.", next = "cheese" } },
    defias = { { id = "tp_defias", text = "Terrible customers. Steal the samples." } },
    _none = { { id = "tp_none", text = "Couldn't say. Have you tried the gouda?" } },
  },
}
