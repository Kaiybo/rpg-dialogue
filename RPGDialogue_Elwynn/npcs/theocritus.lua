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
    first = "He looks at me as an interruption to more important work.",
    third = "{name} climbed the Tower of Azora to meet Theocritus, a mage with little patience and a great deal to do.",
  },

  greetings = {
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my clever friend! Come in; I've a new book I'm not supposed to have, and I'm dying to share it." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'm very busy, and you've done little to earn my time." },
    { id = "g_op_kirintor", when = { opinion = { topic = "kirin_tor", stance = "too_cautious" } }, text = "Ah, the one who thinks Dalaran's vaults should be opened. Come in; I've a book I'm not supposed to have, and I'd value your opinion of it." },
    { id = "g_stairs", text = "You climbed all those stairs, which is admirable, if probably pointless." },
    { id = "g_morganth", when = { questActive = TODO_QUEST("Morganth") }, text = "Is he dead yet? If he isn't, I can't think why you're standing in my tower." },
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
    th_scry = {
      big = true,
      lines = { { id = "ths_default", text = "You bind a sight to a place, the way you'd tie a thread to a door handle, and then you follow the thread back without walking it. The Eye holds my threads and the glyphs in Redridge are the door handles, and the whole of it fails the moment someone clever finds a glyph and wipes it clean." } },
      choices = {
        { text = "Watching from safety is wise. Let others take the risks.", next = "BACK", reply = "Precisely, and I'm glad someone sees it. The brave ones are so expensive to replace.", fx = { align = { honor = -1 } } },
        { text = "A mage should face what he studies, not peer at it.", next = "BACK", reply = "Spoken like a student who has never been looked back at by the thing he was watching. I have, once, and I'd not recommend it.", fx = { align = { honor = 1 } } },
        { text = "Has Morganth ever found one of your glyphs?", next = "th_scry2" },
      },
    },
    th_scry2 = {
      lines = { { id = "ths2_default", text = "Twice, and the second time he wrote a rude word across it in shadow, which told me a great deal more about him than he intended. A man who can't resist answering is a man who can be read." } },
      choices = { { text = "Something else, Theocritus.", next = "BACK", fx = { learn = { "morganth" } } } },
    },
    th_turn = {
      big = true,
      lines = { { id = "tht_default", text = "Curiosity with nothing to stop it, which is the disease of our whole profession, and impatience, which is the symptom. He wanted Ur's knowledge faster than the Sanctum would give it to him, and a mage who can't wait for a book will eventually steal one." } },
      choices = {
        { text = "Then patience is the cure, and I'll learn it.", next = "BACK", reply = "It is the only cure I know of, and it tastes dreadful, so take it daily.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Sanctum drove him to it by holding back.", next = "BACK", reply = "So he said, I'm sure, and so would you, if you went the same way. Don't.", fx = { align = { order = -1 } } },
        { text = "Something else, Theocritus.", next = "BACK" },
      },
    },
    th_teach = {
      lines = {
        { id = "thte_default", text = "I don't take students, because students ask questions at inconvenient hours and break things that took me years to build. Bring me Morganth's end, though, and I'll answer anything you like for a whole afternoon, which is more than the Kirin Tor ever offered me." },
        { id = "thte_done", when = { questDone = TODO_QUEST("Morganth") }, text = "You brought me Morganth's end, so I owe you an afternoon of answers, and I keep my debts. Ask me about the scrying, or the pendants, or why I despise committees, and I shall try very hard not to be brief." },
      },
      choices = {
        { text = "Then tell me about the gnoll pendants.", next = "study", when = { questDone = TODO_QUEST("Morganth") } },
        { text = "I'll hold you to that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Theocritus.", next = "BACK" },
      },
    },
    th_gnome = {
      lines = { { id = "thg_default", text = "Your people knew a great deal about precision and very little about restraint, and between my servants and your Academy's old texts I've learned more from gnomes than from half of Dalaran. Don't repeat that downstairs, or they'll want a raise." } },
      choices = {
        { text = "My lips are sealed, Theocritus.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Theocritus.", next = "BACK" },
      },
    },
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
      lines = { { id = "xdsham_default", text = "It's worth a footnote, because the arcane is the true discipline and your spirits are a curiosity. Do mind the stairs on your way out." } },
      choices = {
        { text = "Discipline has its place, Theocritus. I respect your study.", next = "BACK", reply = "How gracious, and quite unexpected. I'll amend the footnote to a short paragraph.", fx = { align = { order = 1 } } },
        { text = "Footnotes, is it? My spirits have answered when your arcane failed.", next = "BACK", reply = "When it failed in someone else's hands, perhaps. Mine are rather more reliable. Do mind the stairs.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Sometimes a problem needs only to be hit, and I am too busy to hit it myself. Morganth's gnolls in Redridge are such a problem, and you are, I suppose, such a solution." } },
      choices = {
        { text = "I'll solve your problem, and gladly.", next = "BACK", reply = "Splendid, and do try to be quick about it. Morganth won't wait on your convenience.", fx = { align = { order = 1 } } },
        { text = "Find someone else to hit things for you.", next = "BACK", reply = "I have, and you're what turned up. Do close the door on your way out.", fx = { align = { order = -1 } } },
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
        { text = "I'll watch and report what I see.", next = "BACK", reply = "Precisely what I need, and nothing more. The Eye will be grateful.", fx = { align = { order = 1 } } },
        { text = "I'll take my own counsel on what I find.", next = "BACK", reply = "Then take it somewhere else, and do close the door. I've no use for a scout who keeps secrets.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I fear nothing, but I'm careful, because Morganth has sent spies into this tower before, and some of them came in as quietly as you did. The gnomes caught the last one and he's still apologizing." } },
      choices = {
        { text = "I'm no spy for Morganth. You can trust me, Theocritus.", next = "BACK", reply = "Trust is a luxury in this tower, but I'll consider it. The gnomes will be watching.", fx = { align = { order = 1 } } },
        { text = "Your gnomes won't catch me. I'd be careful, mage.", next = "BACK", reply = "They caught the last one who said that, and he's still apologizing. Do see yourself out.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Because it can't be measured, only felt. A spell should be precise, and I've never yet met a druid who could tell me how a thing works, only that it does." } },
      choices = {
        { text = "Not everything must be measured to be true.", next = "BACK", reply = "And yet the thing still works, which is infuriating. I'll grant you that much.", fx = { align = { order = -1 } } },
        { text = "You're right. Magic should be understood.", next = "BACK", reply = "At last, someone sensible! You may stay a moment longer.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Studied it, yes, and given it up, because it refuses to be measured and I refuse to work with anything I can't measure. The priests at the Cathedral find this terribly sad, and I find their certainty terribly convenient, so we're even." } },
      choices = {
        { text = "Some things aren't meant to be measured, Theocritus.", next = "BACK", reply = "Perhaps not, but they're terribly inconvenient for a man of my habits. I'll leave them to the Cathedral.", fx = { align = { light = 1 } } },
        { text = "Then you're wise. Faith without proof is a crutch.", next = "BACK", reply = "A sensible view, and rarely heard in this kingdom. You may tell the priests I agree.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not today, but Morganth was a student once, in Stormwind, with a teacher who trusted him, and look what he became. Every tower has one of him somewhere in its past, and every kingdom pays for it eventually." } },
      choices = {
        { text = "Then he must be stopped before anyone else pays.", next = "BACK", reply = "Precisely, and that is why I watch. Go to Redridge, and do be thorough.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let Redridge deal with him. Stormwind's walls will hold.", next = "BACK", reply = "Walls held against the orcs too, until they didn't. Do try to think beyond the gate.", fx = { align = { light = -1 } } },
        { text = "Something else, Theocritus.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_th_young", when = { class = "MAGE", maxLevel = 19 },
          text = "A mage, and a very new one, by the way you're holding your breath. I don't teach, but I'll answer one sensible question if you can find one." },
        { id = "h_th_old", when = { class = "MAGE", minLevel = 50 },
          text = "Ah, a mage who has actually become something, which is rare enough that I'll put down my pen. Sit, if you can find a chair the gnomes haven't claimed." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. If you've come to warn me about the dangers of the arcane, I assure you I've written a book on them, and it's better than yours." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your order has always been very good at hitting the things my colleagues failed to stop, so I suppose you're welcome." },
        { id = "h_default", text = "I am Theocritus, and this is my tower. The gnomes are my servants, and you're not to tip them because it confuses them. Now, what do you want, if not to help me with Morganth?" },
        { id = "h_low", when = { maxLevel = 17 },
          text = "You are very young and I am very busy, so come back when you've survived something interesting." },
        { id = "h_before", when = { minLevel = 18, questBefore = TODO_QUEST("Morganth") },
          text = "A man named Morganth, in the Tower of Ilgalar in Redridge, once studied with Stormwind's mages until he went wrong, and he is my problem, which I would very much like to make yours." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Morganth") },
          text = "Morganth commands the Shadowhide gnolls and thinks himself a lord, so go and remind him otherwise, permanently, if you'd be so kind." },
        { id = "h_eye", when = { questActive = TODO_QUEST("A Watchful Eye") },
          text = "My scrying sphere, the Eye of Azora, sees far but not far enough, and that is where you come in, regrettably." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Morganth"), days = 3 } },
          text = "Gone, really? Then Stormwind is a little safer, and I am far less bored than I expected to be, which is not a complaint." },
        { id = "h_mage", when = { class = "MAGE", minLevel = 20 },
          text = "The Mage Quarter sends me its brighter students now and then, and you might do, possibly, if you can keep up." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "The Kirin Tor have been insufferable about your people lately, I'm told: Highborne magisters' children, back from wherever they were. I'd like to see what the fuss is about, but later." },
        { id = "h_pendant", tags = { "news" }, when = { questActive = TODO_QUEST("Theocritus' Retrieval") },
          text = "You heard me through a gnoll's pendant, weeks late? Give it here; a slow spell is still a spell that worked." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, how quaint. I've studied the arcane for decades, and I'll confess the nature magics have always seemed rather muddy to me." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in my tower. You'll touch nothing, take nothing and leave the gnomes alone, because they count everything, and I count them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in my tower. Do not touch the shelves; anything you break, you will learn the price of." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter in my tower, with an animal. Keep it away from the gnomes; they bite back, and I have no wish to hear of it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, in my tower, of all places. My gnomes will be fascinated, I'm sure, and I am not." },
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
        { text = "I'm not Morganth, and I'll never be that careless.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "A priest knows something of shadow too.", next = "priest", when = { class = "PRIEST", minLevel = 20 } },
        { text = "Your servants are gnomes. Where are they from?", next = "gnome", when = { race = "Gnome" } },
        { text = "My family would rather I were at court.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "You must fear a rogue would steal from your tower.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What use would a mage have for a warrior?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you need anything hunted, Theocritus?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd guess you've never studied faith, Theocritus.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is anything here a threat to Stormwind itself, Theocritus?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I suspect you don't think shamanism worth studying, Theocritus.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "How does your Eye of Azora actually work?", next = "th_scry", when = { class = "MAGE", minLevel = 15 } },
        { text = "Morganth was a mage like me. What turned him?", next = "th_turn", when = { class = "MAGE" } },
        { text = "Would you ever take me as a student, Theocritus?", next = "th_teach", when = { class = "MAGE", minLevel = 20 } },
        { text = "Gnomes keep your tower. Do you value what they know?", next = "th_gnome", when = { race = "Gnome", class = "MAGE" } },
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
        { text = "Then I'll help.", next = "BACK", reply = "Splendid, and do try to be useful rather than merely willing. Redridge is that way.", fx = { affinity = 2, learn = { "morganth" }, align = { order = 1 } } },
        { text = "Very noble of you.", next = "BACK", reply = "Nobility has nothing to do with it. Somebody must, and I happen to be competent.", fx = { align = { order = -1 }, affinity = -1, trait = { witty = 1 } } },
      },
    },
    morganth_want = {
      lines = {
        { id = "mw_default", text = "Power, which is the dull answer. He sided with the Blackrock orcs to take Stonewatch Keep and then turned on them, and a man who betrays his allies that quickly wants something specific." },
        { id = "mw_scythe", when = { questDone = TODO_QUEST("Looking Further") },
          text = "The Scythe of Elune, if I read his thoughts aright, and if he has it, Redridge will feel it first and Stormwind second." },
      },
      choices = {
        { text = "How do you read his thoughts?", next = "eye" },
        { text = "Something else.", next = "BACK", fx = { learn = { "morganth", "blackrock" } } },
      },
    },

    study = {
      lines = {
        { id = "s_default", text = "Gnolls, at present, because Morganth's gnolls wear pendants, and if I understand the pendant I understand the leash, and then the hand that holds it." },
      },
      choices = {
        { text = "Can the pendants be turned on him?", next = "study_turn" },
        { text = "Fascinating.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    study_turn = {
      lines = {
        { id = "st_default", text = "In time, yes. I sent a message through them weeks ago and thought it had failed, and next I mean to send something that holds every gnoll wearing one exactly where it stands." },
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
        { id = "tg_default", text = "They are the Servants of Azora, loyal, tireless and armed, and they are also the only people in Elwynn who never ask me to fix their ploughs." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eye = {
      lines = {
        { id = "ey_default", text = "The Eye of Azora is a scrying sphere upstairs, and if you touch it you'll see the walls of Morganth's tower in Redridge. My glyphs carry its sight further, wherever someone brave sets them." },
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
        { text = "That's fair.", next = "BACK", reply = "Good, we understand each other. Go and help them, then.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "That's a convenient view from a tower.", next = "BACK", reply = "It is, and the view is the point. I see Morganth coming, and you don't.", fx = { align = { order = -1 }, affinity = -1, trait = { stern = 1 } } },
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
        { text = "I'll refuse.", next = "BACK", reply = "Good, and loudly, as I said. You may thank me later.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'll decide for myself what I read.", next = "BACK", reply = "Then decide carefully, because some pages read you back. I'll not warn you twice.", fx = { align = { order = -1 } } },
        { text = "Knowledge shouldn't be locked away.", next = "mage_knowledge", fx = { trait = { curious = 1 } } },
      },
    },
    mage_knowledge = {
      lines = {
        { id = "mk_default", text = "Morganth said that, I'm told, in nearly those words, so think about it on the way down, because there are a great many stairs." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "morganth" } } } },
    },
    warlock = {
      lines = {
        { id = "wl_default", text = "Nobody is Morganth until they are, and he began as a student with good intentions, so keep yours where I can see them." },
      },
      choices = {
        { text = "You'll see them.", next = "BACK", reply = "Good. I'll be watching them rather more closely than you'd like.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "What I do with my power is my own business.", next = "BACK", reply = "It's mine too, the moment it comes near this tower. Remember that.", fx = { affinity = -2, align = { order = -1 } } },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "A priest who knows shadow? Then you know it's a road that narrows the further you walk it. Morganth walked it to the end, so don't." },
      },
      choices = {
        { text = "I walk it carefully.", next = "BACK", reply = "Good, and keep it that way. The road is very easy to follow too far.", fx = { align = { light = -1 }, affinity = 1, trait = { cautious = 1 } } },
        { text = "The Light walks with me.", next = "BACK", reply = "Morganth was quite certain of his company too, once. Do mind your step.", fx = { affinity = 1, align = { light = 2 } } },
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
        { id = "nb_default", text = "Court is where competent people go to be wasted, so stay out here, where the dangers are honest." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    regard = {
      { id = "dp_rg", text = "You've a fine mind, and a curious one, and that is the rarest thing in Elwynn." },
    },
    grievance = {
      { id = "dp_gv", text = "You've been rude in my tower, and a mage does not forget rudeness." },
    },
    knows = {
      { id = "tp_knows", text = "I have studied a great many things from this tower, most of them beyond your concern. These, however, I might explain." },
    },
    background = { { id = "tp_bg", text = "I have a tower and a rival, and that is all the biography anyone needs." } },
    advice = { { id = "tp_ad", text = "If a book is sealed, the seal is the most important thing in it." } },
    morganth = {
      { id = "tp_morganth", text = "He's in Redridge, in the Tower of Ilgalar, so bring a friend, or better, several." },
      { id = "tp_morganth2", text = "Must we? Very well, sit down, but briefly.", next = "morganth" },
    },
    defias = { { id = "tp_defias", text = "The Defias are thieves, and tiresome ones, but they are somebody else's problem, I'm delighted to say." } },
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
