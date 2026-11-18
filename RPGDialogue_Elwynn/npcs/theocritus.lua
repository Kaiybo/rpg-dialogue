-- Theocritus, Mage of the Tower of Azora. Voice: bibles/theocritus.md
-- Above everyday affairs, except one: Morganth.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "theocritus", id = TODO_NPC("Theocritus"), name = "Theocritus", title = "Mage of Tower Azora",
  bible = "bibles/theocritus.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "proud" }, values = { "curious", "ambitious" },
  notices = { "arcane", "fel" },
  impression = {
    first = "Theocritus looked at me as if I were an interruption to more important work, and in his own tower I probably was. His gnomes seem to do most of the stair-climbing.",
    third = "{name} climbed the Tower of Azora to meet Theocritus, a mage with little patience and a great deal to do.",
  },

  greetings = {
    { id = "g_op_kirintor", when = { opinion = { topic = "kirin_tor", stance = "too_cautious" } }, text = "Ah, the one who thinks Dalaran's vaults should be opened. Come in; I've a book I'm not supposed to have, and I'd value your opinion of it." },
    { id = "g_stairs", text = "You climbed all those stairs, which is admirable, if probably pointless." },
    { id = "g_morganth", when = { questActive = TODO_QUEST("Morganth") }, text = "Is he dead yet? If not, why are you standing in my tower?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Morganth") }, text = "Ah, the one who dealt with Morganth. You may sit, though not on that." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage, and your robes are dreadful. Never mind; Morley Eberlein, my clothier downstairs, could do something with you, as he does with everyone." },
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "You reek of the Nether, and so did the renegade Morganth, before he went wrong. I will be watching you closely, and you will not enjoy it." },
    { id = "n_taint", cat = "fel", when = { taint = { min = 25 } },
      text = "Something fel has had its fingers in you. Stand by the window, please; I'd like it to be the first thing I see if you change shape." },
  },

  start = "hello",
  nodes = {
    op_kirintor = {
      lines = {
        { id = "op_kirintor_a", text = "Ah, a question worth climbing the stairs for. The Kirin Tor lock away what frightens them, and then a Morganth steals the key and we all act surprised. Tell me, then: should dangerous knowledge be sealed, or learned?" },
      },
      choices = {
        { text = "Sealed. Some knowledge costs more than it could ever be worth.", next = "op_kirintor_1", fx = { opinion = { kirin_tor = "trust", necromancy = "forbid" }, align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Learned. You can't defend against what you refuse to understand.", next = "op_kirintor_2", fx = { opinion = { kirin_tor = "too_cautious", arcane_magic = "useful" }, align = { order = -1 }, affinity = 2 } },
        { text = "Knowledge is fine. It's ambitious students who should be locked up.", next = "op_kirintor_3", fx = { opinion = { kirin_tor = "mixed", arcane_magic = "dangerous" }, trait = { witty = 1 } } },
        { text = "Dalaran fell because it trusted its own vaults. I was there.", next = "op_kirintor_4", when = { origin = "forsaken_dalaran_apprentice" }, fx = { opinion = { kirin_tor = "distrust" }, affinity = 1 } },
        { text = "I'm no mage, Theocritus. I leave that to you.", next = "BACK" },
      },
    },
    op_kirintor_1 = {
      lines = { { id = "op_kirintor_r1", text = "Spoken like a Dalaran clerk, and the clerks have kept the world in one piece more often than the geniuses. I'm not obliged to like it, but I'll concede it." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    op_kirintor_2 = {
      lines = { { id = "op_kirintor_r2", text = "Precisely what I'd tell the Council, and very likely why I live in a tower in Elwynn and not in Dalaran. Do come back; it's rare to agree with someone." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    op_kirintor_3 = {
      lines = { { id = "op_kirintor_r3", text = "Ha! If the Kirin Tor followed that rule, there'd be no one left outside the vaults to lock the doors. Still, Morganth would agree with you, from the inside." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    op_kirintor_4 = {
      lines = { { id = "op_kirintor_r4", text = "You were, weren't you, and in a manner I'd rather not examine. Then you know better than I do what a sealed door is worth when the dead come knocking." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It's worth a footnote. The arcane is the true discipline; your spirits are a curiosity. Do mind the stairs on your way out." } },
      choices = {
        { text = "Discipline has its place, Theocritus. I respect your study.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Footnotes, is it? My spirits have answered when your arcane failed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Sometimes a problem needs only to be hit, and I am too busy to hit it myself. Morganth's gnolls in Redridge are such a problem, and you are, I suppose, such a solution." } },
      choices = {
        { text = "I'll solve your problem, and gladly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Find someone else to hit things for you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hunted, no; watched, perhaps. Morganth's Shadowhide gnolls range far beyond Redridge, and a hunter who knows the hills can see things the Eye of Azora can't. Tell me what you find, and nothing more." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Hunted, no; watched, perhaps, for Morganth's Shadowhide gnolls range far beyond Redridge. And your {pet}, I see, is sniffing my gnome, so do call it off; they are not hounds, and they are not food." },
      },
      choices = {
        { text = "I'll watch and report what I see.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take my own counsel on what I find.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I fear nothing, but I'm careful, because Morganth has sent spies into this tower before, and some of them came in as quietly as you did. The gnomes caught the last one and he's still apologizing." } },
      choices = {
        { text = "I'm no spy for Morganth. You can trust me, Theocritus.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your gnomes won't catch me. I'd be careful, mage.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Because it can't be measured, only felt. A spell should be precise, and I've never yet met a druid who could tell me how a thing works, only that it does." } },
      choices = {
        { text = "Not everything must be measured to be true.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "You're right. Magic should be understood.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Studied it, yes, and given it up, because it refuses to be measured and I refuse to work with anything I can't measure. The priests at the Cathedral find this terribly sad, and I find their certainty terribly convenient, so we're even." } },
      choices = {
        { text = "Some things aren't meant to be measured, Theocritus.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then you're wise. Faith without proof is a crutch.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not today, but Morganth was a student once, in Stormwind, with a teacher who trusted him, and look what he became. Every tower has one of him somewhere in its past, and every kingdom pays for it eventually." } },
      choices = {
        { text = "Then he must be stopped before anyone else pays.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let Redridge deal with him. Stormwind's walls will hold.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Theocritus.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. If you've come to warn me about the dangers of the arcane, I assure you I've written a book on them, and it's better than yours." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your order has always been very good at hitting the things my colleagues failed to stop, so I suppose you're welcome." },
        { id = "h_default", text = "I am Theocritus, and this is my tower. The gnomes are my servants, and you're not to tip them because it confuses them. Now, what do you want, if not to help me with Morganth?" },
        { id = "h_low", when = { maxLevel = 17 },
          text = "You are very young and I am very busy. Come back when you've survived something interesting." },
        { id = "h_before", when = { minLevel = 18, questBefore = TODO_QUEST("Morganth") },
          text = "A man named Morganth, in the Tower of Ilgalar in Redridge, once studied with Stormwind's mages until he went wrong. He is my problem." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Morganth") },
          text = "Morganth commands the Shadowhide gnolls and thinks himself a lord. Remind him otherwise. Permanently, if you'd be so kind." },
        { id = "h_eye", when = { questActive = TODO_QUEST("A Watchful Eye") },
          text = "My scrying sphere, the Eye of Azora, sees far, but not far enough. That is where you come in, regrettably." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Morganth"), days = 3 } },
          text = "Gone, really? Then Stormwind is a little safer, and I am far less bored than I expected to be, which is not a complaint." },
        { id = "h_mage", when = { class = "MAGE", minLevel = 20 },
          text = "The Mage Quarter sends me its brighter students now and then. You might do, possibly." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "The Kirin Tor have been insufferable about your people lately, I'm told: Highborne magisters' children, back from wherever they were. I'd like to see what the fuss is about, but later." },
        { id = "h_pendant", tags = { "news" }, when = { questActive = TODO_QUEST("Theocritus' Retrieval") },
          text = "You heard me through a gnoll's pendant, weeks late? Give it here; a slow spell is still a spell that worked." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid. How quaint. I've studied the arcane for decades, and I'll confess the nature magics have always seemed rather muddy to me." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in my tower. You'll touch nothing, take nothing and leave the gnomes alone, because they count everything, and I count them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in my tower. Do not touch the shelves; anything you break, you will learn the price of." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter in my tower, with an animal. Keep it away from the gnomes; they bite back, and I have no wish to hear of it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. In my tower. Hmm. My gnomes will be fascinated, I'm sure. I am not." },
      },
      again = {
        { id = "h_again", text = "Something else? Be brief, please; Redridge doesn't watch itself." },
        { id = "h_again2", text = "You're still here, I see. Very well, ask what you came to ask." },
      },
      choices = {
        { text = "Why do you find nature magic muddy?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What threat keeps you up in this tower?", next = "morganth" },
        { text = "Your desk is covered in notes on something.", next = "study" },
        { text = "Tell me about the tower.", next = "tower" },
        { text = "You don't seem to care much what happens in Elwynn.", next = "elwynn" },
        { text = "Morganth is dead. What now?", next = "after", when = { questDone = TODO_QUEST("Morganth") } },
        { text = "I'm a mage. Teach me something.", next = "mage", when = { class = "MAGE" } },
        { text = "I'm not Morganth.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "A priest knows something of shadow too.", next = "priest", when = { class = "PRIEST", minLevel = 20 } },
        { text = "Your servants are gnomes. Where are they from?", next = "gnome", when = { race = "Gnome" } },
        { text = "My family would rather I were at court.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "You must fear a rogue would steal from your tower.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What use would a mage have for a warrior?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you need anything hunted, Theocritus?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd guess you've never studied faith, Theocritus.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is anything here a threat to Stormwind itself, Theocritus?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I suspect you don't think shamanism worth studying, Theocritus.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll show myself out.", next = "END" },
      },
    },

    morganth = {
      lines = {
        { id = "mo_default", key = true,
          text = "Morganth, a Stormwind student who turned to shadow, was thrown out, and took Ur's treatise on shadow magic with him. The city's mages want the book back; I want him stopped." },
      },
      choices = {
        { text = "Why is that your duty?", next = "duty" },
        { text = "What does he want?", next = "morganth_want" },
        { text = "Sounds like the city's problem.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    duty = {
      big = true,
      lines = {
        { id = "d_default", text = "Because I care nothing for tax rolls or harvests or who the Regent is dining with, but I know what Morganth is, and if I don't stop him, no one competent will." },
      },
      choices = {
        { text = "Then I'll help.", next = "BACK", fx = { affinity = 2, learn = { "morganth" }, align = { order = 1 } } },
        { text = "Very noble of you.", next = "BACK", fx = { align = { order = -1 }, affinity = -1, trait = { witty = 1 } } },
      },
    },
    morganth_want = {
      lines = {
        { id = "mw_default", text = "Power, the dull answer. He sided with the Blackrock orcs to take Stonewatch Keep, then turned on them. A man who betrays his allies that quickly wants something specific." },
        { id = "mw_scythe", when = { questDone = TODO_QUEST("Looking Further") },
          text = "The Scythe of Elune, if I read his thoughts aright. If he has it, Redridge feels it first and Stormwind second." },
      },
      choices = {
        { text = "How do you read his thoughts?", next = "eye" },
        { text = "Something else.", next = "BACK", fx = { learn = { "morganth", "blackrock" } } },
      },
    },

    study = {
      lines = {
        { id = "s_default", text = "Gnolls, at present. Morganth's gnolls wear pendants, and if I understand the pendant I understand the leash, and then the hand that holds it." },
      },
      choices = {
        { text = "Can the pendants be turned on him?", next = "study_turn" },
        { text = "Fascinating.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    study_turn = {
      lines = {
        { id = "st_default", text = "In time. I sent a message through them weeks ago and thought it failed. Next I mean to send something that holds every gnoll wearing one where it stands." },
        { id = "st_heard", when = { questDone = TODO_QUEST("Theocritus' Retrieval") },
          text = "You heard my message through one of those pendants, weeks late, but you heard it. That is still the most satisfying thing to happen in this tower all year." },
      },
      choices = {
        { text = "Months of research for a leash.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "I'd like to see that.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
      },
    },

    tower = {
      lines = {
        { id = "tw_default", text = "It's mine. The gnomes keep it, Morley Eberlein keeps it in robes and the Eye watches Redridge, while I go up and down the stairs as little as possible." },
      },
      choices = {
        { text = "The gnomes?", next = "tower_gnomes" },
        { text = "The Eye?", next = "eye" },
      },
    },
    tower_gnomes = {
      lines = {
        { id = "tg_default", text = "The Servants of Azora: loyal, tireless and armed. They are also the only people in Elwynn who never ask me to fix their ploughs." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eye = {
      lines = {
        { id = "ey_default", text = "The Eye of Azora, a scrying sphere upstairs. Touch it and you see the walls of Morganth's tower in Redridge. My glyphs carry its sight further, wherever someone brave sets them." },
      },
      choices = {
        { text = "I could set one.", next = "BACK", when = { minLevel = 20 }, fx = { affinity = 1, learn = { "morganth" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    elwynn = {
      lines = {
        { id = "el_default", text = "The loggers are loud, the Defias are tedious, and the pumpkin farm south-east of here has thieves in it. None of that will burn the kingdom down, but Morganth might." },
      },
      choices = {
        { text = "People are suffering out there.", next = "elwynn_people" },
        { text = "Fair. One thing at a time.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    elwynn_people = {
      lines = {
        { id = "ep_default", text = "Then help them, and I'll be up here making sure there's a kingdom left for them to suffer in. We both have our work." },
      },
      choices = {
        { text = "That's fair.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "That's a convenient view from a tower.", next = "BACK", fx = { align = { order = -1 }, affinity = -1, trait = { stern = 1 } } },
      },
    },

    after = {
      lines = {
        { id = "af_default", text = "Now the treatise goes back to the mages who sealed it, and I go back to being bored. I find I'm looking forward to it." },
      },
      choices = {
        { text = "Should the Kirin Tor seal books like Ur's at all?", next = "op_kirintor" },
        { text = "You'll miss him.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Enjoy the peace while it lasts.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    mage = {
      lines = {
        { id = "ma_default", text = "I'm not a trainer, but here is one thing for free: Ur's work is sealed for a reason, so if anyone offers you a look inside, refuse, loudly." },
      },
      choices = {
        { text = "I'll refuse.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'll decide for myself what I read.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Knowledge shouldn't be locked away.", next = "mage_knowledge", fx = { trait = { curious = 1 } } },
      },
    },
    mage_knowledge = {
      lines = {
        { id = "mk_default", text = "Morganth said that, I'm told, in nearly those words. Think about it on the way down. There are a great many stairs." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "morganth" } } } },
    },
    warlock = {
      lines = {
        { id = "wl_default", text = "Nobody is Morganth until they are. He began as a student with good intentions. Keep yours where I can see them." },
      },
      choices = {
        { text = "You'll see them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My power is my business.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "A priest who knows shadow? Then you know it's a road that narrows the further you walk it. Morganth walked it to the end, so don't." },
      },
      choices = {
        { text = "I walk it carefully.", next = "BACK", fx = { align = { light = -1 }, affinity = 1, trait = { cautious = 1 } } },
        { text = "The Light walks with me.", next = "BACK", fx = { affinity = 1, align = { light = 2 } } },
      },
    },
    gnome = {
      lines = {
        { id = "gn_default", text = "Ask them yourself. They've never told me, and I've never thought to ask, which may say something about me that I shan't dwell on." },
      },
      choices = {
        { text = "It does.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    noble = {
      lines = {
        { id = "nb_default", text = "Court is where competent people go to be wasted. Stay out here, where the dangers are honest." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I have studied a great many things from this tower, most of them beyond your concern. These, however, I might explain." },
    },
    background = { { id = "tp_bg", text = "I have a tower and a rival. That is all the biography anyone needs." } },
    advice = { { id = "tp_ad", text = "If a book is sealed, the seal is the most important thing in it." } },
    morganth = {
      { id = "tp_morganth", text = "He's in Redridge, in the Tower of Ilgalar. Bring a friend, or better, several." },
      { id = "tp_morganth2", text = "Must we? Very well, sit down, but briefly.", next = "morganth" },
    },
    defias = { { id = "tp_defias", text = "Thieves, and tiresome ones, but somebody else's problem, I'm delighted to say." } },
    eastvale = { { id = "tp_eastvale", text = "There are loggers below, I'm told. I hear them occasionally, and I try not to." } },
    blackrock = { { id = "tp_blackrock", text = "The Blackrock are the orcs in Stonewatch Keep, in Redridge. Morganth used them and threw them away, and I very nearly feel sorry for them." } },
    _none = { { id = "tp_none", text = "If it were worth knowing, I would know it. Draw your own conclusions." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran was the jewel of the human kingdoms, and the Scourge broke it in an afternoon. The Kirin Tor rebuild behind their walls now and admit almost nobody, and I confess I don't blame them." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor once invited me to join them, and I declined, because I prefer a tower of my own to a chair in somebody else's. That is all the explanation they received, and all you shall." } },
    scourge = { { id = "tp_scourge", text = "The Scourge is necromancy on a scale no sane mage would attempt, and the man behind its plague sat among the Kirin Tor before he chose it. Every mage alive should remember Kel'Thuzad's name and be ashamed of it.", fx = { learn = { "kelthuzad" } } } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad sat on Dalaran's own council before he went hunting forbidden knowledge, and they say he rules the dead now from a citadel that floats above the plaguelands. If he is still a man in any sense, he is a monstrous one." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Legion is the reason magic must be studied carefully or not at all. Morganth has forgotten that, and one day the Legion will remind him." } },
    scholomance = { { id = "tp_scholomance", text = "The Scholomance teaches necromancy at Caer Darrow, and its masters serve the Scourge. If any student of mine went there, I would hunt him down myself." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's conjurers are charlatans of the most cheerful sort, and I sometimes walk down to watch them, purely for professional amusement. Do not tell my servants." } },
  },
}
